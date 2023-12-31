codeunit 7000000 CarteraManagement
{
    Permissions = TableData "Cust. Ledger Entry" = m,
                  TableData "Vendor Ledger Entry" = m,
                  TableData "VAT Entry" = imd,
                  TableData "Cartera Doc." = m,
                  TableData "Posted Cartera Doc." = m,
                  TableData "Closed Cartera Doc." = m,
                  TableData "Bill Group" = m;

    trigger OnRun()
    begin
    end;

    var
        Text1100000: Label 'The Bill Group does not exist.';
        Text1100001: Label 'This Bill Group has already been printed. Proceed anyway?';
        Text1100002: Label 'The process has been interrupted to respect the warning.';
        Text1100003: Label 'The Payment Order does not exist.';
        Text1100004: Label 'This Payment Order has already been printed. Proceed anyway?';
        Text1100005: Label 'The update has been interrupted to respect the warning.';
        Text1100006: Label 'Document settlement %1/%2';
        Text1100007: Label 'Bill %1/%2 settl. rev.';
        Text1100008: Label 'Redrawing a settled bill is only possible for bills in posted or closed bill groups.';
        Text1100009: Label 'Redrawing a settled bill is only possible for bills in posted or closed payment orders.';
        VATPostingSetup: Record "VAT Posting Setup";
        VATEntryNo: Integer;
        VATUnrealAcc: Code[20];
        VATAcc: Code[20];
        TotalVATAmount: Decimal;
        Text1100010: Label 'The document %1/%2 is marked to apply.';
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        ElectPmtMgmt: Codeunit "Elect. Pmts Management";

    [Scope('OnPrem')]
    procedure CategorizeDocs(var Doc: Record "Cartera Doc.")
    begin
        REPORT.RunModal(REPORT::"Categorize Documents", true, false, Doc);
    end;

    [Scope('OnPrem')]
    procedure DecategorizeDocs(var Doc: Record "Cartera Doc.")
    begin
        Doc.ModifyAll("Category Code", '');
    end;

    [Scope('OnPrem')]
    procedure CategorizePostedDocs(var PostedDoc: Record "Posted Cartera Doc.")
    begin
        REPORT.RunModal(REPORT::"Categorize Posted Documents", true, false, PostedDoc);
    end;

    [Scope('OnPrem')]
    procedure DecategorizePostedDocs(var PostedDoc: Record "Posted Cartera Doc.")
    begin
        PostedDoc.ModifyAll("Category Code", '');
    end;

    [Scope('OnPrem')]
    procedure UpdateStatistics(var Doc2: Record "Cartera Doc."; var CurrTotalAmount: Decimal; var ShowCurrent: Boolean)
    var
        Doc: Record "Cartera Doc.";
    begin
        with Doc do begin
            Copy(Doc2);
            SetCurrentKey(Type, "Bill Gr./Pmt. Order No.", "Collection Agent", "Due Date", "Global Dimension 1 Code",
              "Global Dimension 2 Code", "Category Code", "Posting Date", "Document No.", Accepted, "Currency Code", "Document Type");
            ShowCurrent := CalcSums("Remaining Amt. (LCY)");
            if ShowCurrent then
                CurrTotalAmount := "Remaining Amt. (LCY)"
            else
                CurrTotalAmount := 0;
        end;
    end;

    [Scope('OnPrem')]
    procedure NavigateDoc(var CarteraDoc: Record "Cartera Doc.")
    var
        Navigate: Page Navigate;
        VendLedgEntry: Record "Vendor Ledger Entry";
        CustLedgEntry: Record "Cust. Ledger Entry";
    begin
        with CarteraDoc do begin
            case Type of
                Type::Receivable:
                    begin
                        if not CustLedgEntry.Get("Entry No.") then
                            exit;
                        Navigate.SetDoc(CustLedgEntry."Posting Date", CustLedgEntry."Document No.");
                    end;
                Type::Payable:
                    begin
                        if not VendLedgEntry.Get("Entry No.") then
                            exit;
                        Navigate.SetDoc(VendLedgEntry."Posting Date", VendLedgEntry."Document No.");
                    end;
            end;
            Navigate.Run;
        end;
    end;

    [Scope('OnPrem')]
    procedure NavigatePostedDoc(var PostedCarteraDoc: Record "Posted Cartera Doc.")
    var
        Navigate: Page Navigate;
        VendLedgEntry: Record "Vendor Ledger Entry";
        CustLedgEntry: Record "Cust. Ledger Entry";
    begin
        with PostedCarteraDoc do begin
            case Type of
                Type::Receivable:
                    begin
                        if not CustLedgEntry.Get("Entry No.") then
                            exit;
                        Navigate.SetDoc(CustLedgEntry."Posting Date", CustLedgEntry."Document No.");
                    end;
                Type::Payable:
                    begin
                        if not VendLedgEntry.Get("Entry No.") then
                            exit;
                        Navigate.SetDoc(VendLedgEntry."Posting Date", VendLedgEntry."Document No.");
                    end;
            end;
            Navigate.Run;
        end;
    end;

    [Scope('OnPrem')]
    procedure NavigateClosedDoc(var ClosedCarteraDoc: Record "Closed Cartera Doc.")
    var
        Navigate: Page Navigate;
        VendLedgEntry: Record "Vendor Ledger Entry";
        CustLedgEntry: Record "Cust. Ledger Entry";
    begin
        with ClosedCarteraDoc do begin
            case Type of
                Type::Receivable:
                    begin
                        if not CustLedgEntry.Get("Entry No.") then
                            exit;
                        Navigate.SetDoc(CustLedgEntry."Posting Date", CustLedgEntry."Document No.");
                    end;
                Type::Payable:
                    begin
                        if not VendLedgEntry.Get("Entry No.") then
                            exit;
                        Navigate.SetDoc(VendLedgEntry."Posting Date", VendLedgEntry."Document No.");
                    end;
            end;
            Navigate.Run;
        end;
    end;

    procedure InsertReceivableDocs(var CarteraDoc2: Record "Cartera Doc.")
    var
        CarteraDoc: Record "Cartera Doc.";
        BankAcc: Record "Bank Account";
        BillGr: Record "Bill Group";
        CarteraSetup: Record "Cartera Setup";
        CustLedgEntry: Record "Cust. Ledger Entry";
        CarteraDocuments: Page "Cartera Documents";
        CheckDiscCreditLimit: Page "Check Discount Credit Limit";
        SelectedAmount: Decimal;
        GroupNo: Code[20];
        Cust: Record Customer;
    begin
        CarteraDoc2.FilterGroup(2);
        CarteraDoc2.SetRange("Bill Gr./Pmt. Order No.");
        CarteraDoc2.FilterGroup(0);
        GroupNo := CarteraDoc2.GetRangeMin("Bill Gr./Pmt. Order No.");
        if not BillGr.Get(GroupNo) then
            Error(Text1100000);

        if BillGr."No. Printed" <> 0 then
            if not Confirm(Text1100001, false) then
                exit;

        with CarteraDoc do begin
            Reset;
            SetCurrentKey(Type, "Collection Agent", "Bill Gr./Pmt. Order No.", "Currency Code", Accepted);
            FilterGroup(2);
            SetRange(Type, Type::Receivable);
            FilterGroup(0);
            SetRange("Bill Gr./Pmt. Order No.", '');
            SetRange("Currency Code", BillGr."Currency Code");
            SetFilter(Accepted, '<>%1', Accepted::No);
            SetRange("Collection Agent", "Collection Agent"::Bank);
            if BillGr.Factoring <> BillGr.Factoring::" " then
                SetFilter("Document Type", '<>%1', "Document Type"::Bill)
            else
                SetRange("Document Type", "Document Type"::Bill);
            OnInsertReceivableDocsOnAfterSetFilters(CarteraDoc, BillGr);
            CarteraDocuments.SetTableView(CarteraDoc);
            CarteraDocuments.LookupMode(true);
            if CarteraDocuments.RunModal <> ACTION::LookupOK then
                exit;
            CarteraDocuments.GetSelected(CarteraDoc);
            Clear(CarteraDocuments);
            if not Find('-') then
                exit;

            if (BillGr."Dealing Type" = BillGr."Dealing Type"::Discount) and
               BankAcc.Get(BillGr."Bank Account No.") and
               (BillGr.Factoring = BillGr.Factoring::" ")
            then begin
                CarteraSetup.Get();
                if CarteraSetup."Bills Discount Limit Warnings" then begin
                    SelectedAmount := 0;
                    repeat
                        SelectedAmount := SelectedAmount + "Remaining Amt. (LCY)";
                    until Next = 0;
                    BillGr.CalcFields(Amount);
                    BankAcc.CalcFields("Posted Receiv. Bills Rmg. Amt.");
                    if BillGr.Amount + SelectedAmount + BankAcc."Posted Receiv. Bills Rmg. Amt." > BankAcc."Credit Limit for Discount"
                    then begin
                        CheckDiscCreditLimit.SetRecord(BankAcc);
                        CheckDiscCreditLimit.SetValues(BillGr.Amount, SelectedAmount);
                        if CheckDiscCreditLimit.RunModal <> ACTION::Yes then
                            Error(Text1100002);
                        Clear(CheckDiscCreditLimit);
                    end;
                end;
            end;

            // check the selected bills and insert them
            SetCurrentKey(Type, "Entry No.");
            Find('-');
            repeat
                if CustLedgEntry.Get("Entry No.") then
                    if CustLedgEntry."Applies-to ID" <> '' then
                        Error(Text1100010, "Document No.", "No.");
                TestField(Type, Type::Receivable);
                TestField("Bill Gr./Pmt. Order No.", '');
                TestField("Currency Code", BillGr."Currency Code");
                if Cust."No." <> "Account No." then
                    Cust.Get("Account No.");
                Cust.CheckBlockedCustOnJnls(Cust, GetDocType("Document Type"), false);
                if Accepted = Accepted::No then
                    FieldError(Accepted);
                TestField("Collection Agent", "Collection Agent"::Bank);
                "Bill Gr./Pmt. Order No." := GroupNo;
                Modify;
                if CustLedgEntry.Get("Entry No.") then begin
                    CustLedgEntry."Document Situation" := CustLedgEntry."Document Situation"::"BG/PO";
                    CustLedgEntry.Modify();
                    "Direct Debit Mandate ID" := CustLedgEntry."Direct Debit Mandate ID";
                end;
                OnAfterInsertReceivableDocs(CarteraDoc, BillGr);
            until Next = 0;

            BillGr."No. Printed" := 0;
            BillGr.Modify();
        end;
    end;

    procedure InsertPayableDocs(var CarteraDoc2: Record "Cartera Doc.")
    var
        CarteraDoc: Record "Cartera Doc.";
        PmtOrd: Record "Payment Order";
        CarteraSetup: Record "Cartera Setup";
        VendLedgEntry: Record "Vendor Ledger Entry";
        CarteraDocuments: Page "Cartera Documents";
        GroupNo: Code[20];
        Vend: Record Vendor;
    begin
        CarteraDoc2.FilterGroup(2);
        CarteraDoc2.SetRange("Bill Gr./Pmt. Order No.");
        CarteraDoc2.FilterGroup(0);
        GroupNo := CarteraDoc2.GetRangeMin("Bill Gr./Pmt. Order No.");
        if not PmtOrd.Get(GroupNo) then
            Error(Text1100003);

        if PmtOrd."No. Printed" <> 0 then
            if not Confirm(Text1100004, false) then
                exit;

        CarteraSetup.Get();
        with CarteraDoc do begin
            Reset;
            SetCurrentKey(Type, "Collection Agent", "Bill Gr./Pmt. Order No.", "Currency Code", Accepted);
            FilterGroup(2);
            SetRange(Type, Type::Payable);
            FilterGroup(0);
            SetRange("Bill Gr./Pmt. Order No.", '');
            SetRange("Currency Code", PmtOrd."Currency Code");
            SetFilter(Accepted, '<>%1', Accepted::No);
            SetRange("Collection Agent", "Collection Agent"::Bank);
            SetRange("On Hold", false);
            OnInsertPayableDocsOnAfterSetFilters(CarteraDoc, CarteraDoc2);
            CarteraDocuments.SetTableView(CarteraDoc);
            CarteraDocuments.LookupMode(true);
            if CarteraDocuments.RunModal <> ACTION::LookupOK then
                exit;
            CarteraDocuments.GetSelected(CarteraDoc);
            Clear(CarteraDocuments);
            if not Find('-') then
                exit;

            // check the selected bills and insert them
            SetCurrentKey(Type, "Entry No.");
            Find('-');
            repeat
                if VendLedgEntry.Get("Entry No.") then
                    if VendLedgEntry."Applies-to ID" <> '' then
                        Error(Text1100010, "Document No.", "No.");
                TestField(Type, Type::Payable);
                TestField("Bill Gr./Pmt. Order No.", '');
                TestField("Currency Code", PmtOrd."Currency Code");
                if Vend."No." <> "Account No." then
                    Vend.Get("Account No.");

                if PmtOrd."Export Electronic Payment" then
                    ElectPmtMgmt.GetTransferType("Account No.", "Remaining Amount", "Transfer Type", false);

                Vend.CheckBlockedVendOnJnls(Vend, GetDocType("Document Type"), false);
                if Accepted = Accepted::No then
                    FieldError(Accepted);
                TestField("Collection Agent", "Collection Agent"::Bank);
                "Bill Gr./Pmt. Order No." := GroupNo;
                Modify(true);
                if VendLedgEntry.Get("Entry No.") then begin
                    VendLedgEntry."Document Situation" := VendLedgEntry."Document Situation"::"BG/PO";
                    VendLedgEntry.Modify();
                end;
                OnAfterInsertPayableDocs(CarteraDoc, PmtOrd);
            until Next = 0;

            PmtOrd."No. Printed" := 0;
            PmtOrd.Modify();
        end;
    end;

    procedure RemoveReceivableDocs(var CarteraDoc2: Record "Cartera Doc.")
    var
        BillGr: Record "Bill Group";
        CustLedgEntry: Record "Cust. Ledger Entry";
    begin
        with CarteraDoc2 do
            if Find('-') then begin
                BillGr.Get("Bill Gr./Pmt. Order No.");
                if BillGr."No. Printed" <> 0 then
                    if not Confirm(Text1100001, false) then
                        exit;
                BillGr."No. Printed" := 0;
                repeat
                    RemoveReceivableError(CarteraDoc2);
                    "Bill Gr./Pmt. Order No." := '';
                    Modify;
                    if CustLedgEntry.Get("Entry No.") then begin
                        CustLedgEntry."Document Situation" := CustLedgEntry."Document Situation"::Cartera;
                        CustLedgEntry.Modify();
                    end;
                    OnAfterRemoveReceivableDocs(CarteraDoc2, BillGr);
                until Next = 0;
                BillGr.Modify();
            end;
    end;

    procedure RemovePayableDocs(var CarteraDoc2: Record "Cartera Doc.")
    var
        PaymentOrder: Record "Payment Order";
        VendLedgEntry: Record "Vendor Ledger Entry";
    begin
        with CarteraDoc2 do
            if Find('-') then begin
                PaymentOrder.Get("Bill Gr./Pmt. Order No.");
                if PaymentOrder."No. Printed" <> 0 then
                    if not Confirm(Text1100004, false) then
                        exit;
                PaymentOrder."No. Printed" := 0;
                repeat
                    RemovePayableError(CarteraDoc2);
                    "Bill Gr./Pmt. Order No." := '';
                    Modify;
                    if VendLedgEntry.Get("Entry No.") then begin
                        VendLedgEntry."Document Situation" := VendLedgEntry."Document Situation"::Cartera;
                        VendLedgEntry.Modify();
                    end;
                    OnAfterRemovePayableDocs(CarteraDoc2, PaymentOrder);
                until Next = 0;
                PaymentOrder.Modify();
            end;
    end;

    [Scope('OnPrem')]
    procedure CheckDiscCreditLimit(var BillGr: Record "Bill Group")
    var
        CarteraSetup: Record "Cartera Setup";
        BankAcc: Record "Bank Account";
        CheckDiscCreditLimit: Page "Check Discount Credit Limit";
    begin
        with BillGr do begin
            CarteraSetup.Get();
            if not CarteraSetup."Bills Discount Limit Warnings" then
                exit;
            if ("Dealing Type" = "Dealing Type"::Discount) and BankAcc.Get("Bank Account No.") then begin
                BankAcc.CalcFields("Posted Receiv. Bills Rmg. Amt.");
                CalcFields(Amount);
                if Amount + BankAcc."Posted Receiv. Bills Rmg. Amt." > BankAcc."Credit Limit for Discount" then begin
                    CheckDiscCreditLimit.SetRecord(BankAcc);
                    CheckDiscCreditLimit.SetValues(Amount, 0);
                    if CheckDiscCreditLimit.RunModal <> ACTION::Yes then
                        Error(Text1100005);
                    Clear(CheckDiscCreditLimit);
                end;
            end;
        end;
    end;

    [Scope('OnPrem')]
    procedure CreateReceivableDocPayment(var GenJnlLine2: Record "Gen. Journal Line"; var CustLedgEntry: Record "Cust. Ledger Entry")
    var
        PostedDoc: Record "Posted Cartera Doc.";
    begin
        with GenJnlLine2 do begin
            "Account Type" := "Account Type"::Customer;
            Validate("Account No.", CustLedgEntry."Customer No.");
            "Document Type" := "Document Type"::" ";
            "Document No." := CustLedgEntry."Document No.";
            "Bill No." := CustLedgEntry."Bill No.";
            Description := StrSubstNo(
                Text1100006,
                CustLedgEntry."Document No.",
                CustLedgEntry."Bill No.");
            Validate("Currency Code", CustLedgEntry."Currency Code");
            CustLedgEntry.CalcFields("Remaining Amount", "Remaining Amt. (LCY)");
            case CustLedgEntry."Document Situation" of
                CustLedgEntry."Document Situation"::"Posted BG/PO":
                    begin
                        PostedDoc.Get(PostedDoc.Type::Receivable, CustLedgEntry."Entry No.");
                        Validate(Amount, -PostedDoc."Remaining Amount");
                    end;
                CustLedgEntry."Document Situation"::"Closed BG/PO", CustLedgEntry."Document Situation"::"Closed Documents":
                    Validate(Amount, -CustLedgEntry."Remaining Amount");
            end;
            "Dimension Set ID" := GetCombinedDimSetID(GenJnlLine2, CustLedgEntry."Dimension Set ID");
            "System-Created Entry" := true;
            "Applies-to Doc. Type" := "Document Type"::Bill;
            "Applies-to Doc. No." := CustLedgEntry."Document No.";
            "Applies-to Bill No." := CustLedgEntry."Bill No.";
        end;

        OnAfterCreateReceivableDocPayment(GenJnlLine2, CustLedgEntry);
    end;

    [Scope('OnPrem')]
    procedure ReverseReceivableDocPayment(var GenJnlLine2: Record "Gen. Journal Line"; var CustLedgEntry: Record "Cust. Ledger Entry")
    var
        PostedDoc: Record "Posted Cartera Doc.";
        ClosedDoc: Record "Closed Cartera Doc.";
        PostedBillGr: Record "Posted Bill Group";
        ClosedBillGr: Record "Closed Bill Group";
    begin
        with GenJnlLine2 do begin
            "Account Type" := "Account Type"::"Bank Account";
            "Document No." := CustLedgEntry."Document No.";
            "Bill No." := CustLedgEntry."Bill No.";
            Description := StrSubstNo(
                Text1100007,
                CustLedgEntry."Document No.",
                CustLedgEntry."Bill No.");
            Validate("Currency Code", CustLedgEntry."Currency Code");
            "System-Created Entry" := true;
            if PostedDoc.Get(PostedDoc.Type::Receivable, CustLedgEntry."Entry No.") then begin
                PostedBillGr.Get(PostedDoc."Bill Gr./Pmt. Order No.");
                Validate("Account No.", PostedBillGr."Bank Account No.");
                Validate(Amount, -PostedDoc."Amount for Collection");
                PostedDoc.TestField(Redrawn, false);
                PostedDoc.Redrawn := true;
                PostedDoc.Modify();
            end else
                if ClosedDoc.Get(ClosedDoc.Type::Receivable, CustLedgEntry."Entry No.") then begin
                    if ClosedDoc."Bill Gr./Pmt. Order No." = '' then
                        Error(Text1100008);
                    ClosedBillGr.Get(ClosedDoc."Bill Gr./Pmt. Order No.");
                    Validate("Account No.", ClosedBillGr."Bank Account No.");
                    Validate(Amount, -ClosedDoc."Amount for Collection");
                    ClosedDoc.TestField(Redrawn, false);
                    ClosedDoc.Redrawn := true;
                    ClosedDoc.Modify();
                end;
            "Dimension Set ID" := GetCombinedDimSetID(GenJnlLine2, CustLedgEntry."Dimension Set ID");
        end;

        OnAfterReverseReceivableDocPayment(GenJnlLine2, CustLedgEntry);
    end;

    [Scope('OnPrem')]
    procedure CreatePayableDocPayment(var GenJnlLine2: Record "Gen. Journal Line"; var VendLedgEntry: Record "Vendor Ledger Entry")
    var
        PostedDoc: Record "Posted Cartera Doc.";
    begin
        with GenJnlLine2 do begin
            "Account Type" := "Account Type"::Vendor;
            Validate("Account No.", VendLedgEntry."Vendor No.");
            "Document Type" := "Document Type"::" ";
            "Document No." := VendLedgEntry."Document No.";
            "Bill No." := VendLedgEntry."Bill No.";
            Description := StrSubstNo(
                Text1100006,
                VendLedgEntry."Document No.",
                VendLedgEntry."Bill No.");
            Validate("Currency Code", VendLedgEntry."Currency Code");
            case VendLedgEntry."Document Situation" of
                VendLedgEntry."Document Situation"::"Posted BG/PO":
                    begin
                        PostedDoc.Get(PostedDoc.Type::Payable, VendLedgEntry."Entry No.");
                        Validate(Amount, -PostedDoc."Remaining Amount");
                    end;
                VendLedgEntry."Document Situation"::"Closed BG/PO":
                    Validate(Amount, -VendLedgEntry."Remaining Amount");
            end;
            "Dimension Set ID" := GetCombinedDimSetID(GenJnlLine2, VendLedgEntry."Dimension Set ID");
            "System-Created Entry" := true;
            "Applies-to Doc. Type" := "Document Type"::Bill;
            "Applies-to Doc. No." := VendLedgEntry."Document No.";
            "Applies-to Bill No." := VendLedgEntry."Bill No.";
        end;

        OnAfterCreatePayableDocPayment(GenJnlLine2, VendLedgEntry);
    end;

    [Scope('OnPrem')]
    procedure ReversePayableDocPayment(var GenJnlLine2: Record "Gen. Journal Line"; var VendLedgEntry: Record "Vendor Ledger Entry")
    var
        PostedDoc: Record "Posted Cartera Doc.";
        ClosedDoc: Record "Closed Cartera Doc.";
        PostedPmtOrd: Record "Posted Payment Order";
        ClosedPmtOrd: Record "Closed Payment Order";
    begin
        with GenJnlLine2 do begin
            "Account Type" := "Account Type"::"Bank Account";
            "Document No." := VendLedgEntry."Document No.";
            "Bill No." := VendLedgEntry."Bill No.";
            Description := StrSubstNo(
                Text1100007,
                VendLedgEntry."Document No.",
                VendLedgEntry."Bill No.");
            Validate("Currency Code", VendLedgEntry."Currency Code");
            "System-Created Entry" := true;
            if PostedDoc.Get(PostedDoc.Type::Payable, VendLedgEntry."Entry No.") then begin
                PostedPmtOrd.Get(PostedDoc."Bill Gr./Pmt. Order No.");
                Validate("Account No.", PostedPmtOrd."Bank Account No.");
                Validate(Amount, PostedDoc."Amount for Collection");
                PostedDoc.TestField(Redrawn, false);
                PostedDoc.Redrawn := true;
                PostedDoc.Modify();
            end else
                if ClosedDoc.Get(ClosedDoc.Type::Payable, VendLedgEntry."Entry No.") then begin
                    if ClosedDoc."Bill Gr./Pmt. Order No." = '' then
                        Error(Text1100009);
                    ClosedPmtOrd.Get(ClosedDoc."Bill Gr./Pmt. Order No.");
                    Validate("Account No.", ClosedPmtOrd."Bank Account No.");
                    Validate(Amount, ClosedDoc."Amount for Collection");
                    ClosedDoc.TestField(Redrawn, false);
                    ClosedDoc.Redrawn := true;
                    ClosedDoc.Modify();
                end;
            "Dimension Set ID" := GetCombinedDimSetID(GenJnlLine2, VendLedgEntry."Dimension Set ID");
        end;

        OnAfterReversePayableDocPayment(GenJnlLine2, VendLedgEntry);
    end;

    procedure CustUnrealizedVAT2(CustLedgEntry2: Record "Cust. Ledger Entry"; AmountLCY: Decimal; GenJnlLine: Record "Gen. Journal Line"; var ExistVATEntry: Boolean; var FirstVATEntry: Integer; var LastVATEntry: Integer; var NoRealVATBuffer: Record "BG/PO Post. Buffer"; IsFromJournal: Boolean; PostedDocumentNo: Code[20])
    var
        CustLedgEntry3: Record "Cust. Ledger Entry";
    begin
        if GenJnlPostLine.CustFindVATSetup(VATPostingSetup, CustLedgEntry2, IsFromJournal) then begin
            CustLedgEntry3.SetCurrentKey("Document No.", "Document Type", "Customer No.");
            CustLedgEntry3.SetRange("Document Type", CustLedgEntry3."Document Type"::Invoice);
            CustLedgEntry3.SetRange("Document No.", CustLedgEntry2."Document No.");

            if CustLedgEntry3.FindFirst then begin
                CustLedgEntry3.Open := true;
                CustUnrealizedVAT(
                  CustLedgEntry3, -AmountLCY, GenJnlLine, ExistVATEntry, FirstVATEntry, LastVATEntry, NoRealVATBuffer, PostedDocumentNo);
            end;
        end else
            exit;
    end;

    local procedure CustUnrealizedVAT(var CustLedgEntry2: Record "Cust. Ledger Entry"; SettledAmount: Decimal; GenJnlLine: Record "Gen. Journal Line"; var ExistVATEntry: Boolean; var FirstVATEntryNo: Integer; var LastVATEntryNo: Integer; var NoRealVATBuffer: Record "BG/PO Post. Buffer"; PostedDocumentNo: Code[20])
    var
        VATEntry: Record "VAT Entry";
        VATEntry2: Record "VAT Entry";
        VATEntry3: Record "VAT Entry";
        PaymentTerms: Record "Payment Terms";
        SalesInvHeader: Record "Sales Invoice Header";
        VATPart: Decimal;
        VATAmount: Decimal;
        VATBase: Decimal;
        VATAmountAddCurr: Decimal;
        VATBaseAddCurr: Decimal;
        CurrencyFactor: Decimal;
        SalesVATAccount: Code[20];
        SalesVATUnrealAccount: Code[20];
        LastConnectionNo: Integer;
        Test1: Boolean;
        Test2: Boolean;
        PaymentTermsCode: Code[20];
    begin
        OnBeforeCustUnrealizedVAT(
          CustLedgEntry2, SettledAmount, GenJnlLine, ExistVATEntry, FirstVATEntryNo, LastVATEntryNo,
          NoRealVATBuffer, PostedDocumentNo, PaymentTermsCode, VATPostingSetup);

        if PostedDocumentNo <> '' then begin
            SalesInvHeader.Get(PostedDocumentNo);
            PaymentTermsCode := SalesInvHeader."Payment Terms Code";
        end;

        CustLedgEntry2.CalcFields(
          Amount,
          "Amount (LCY)",
          "Remaining Amount",
          "Remaining Amt. (LCY)",
          "Original Amt. (LCY)");
        CurrencyFactor := CustLedgEntry2.Amount / CustLedgEntry2."Amount (LCY)";
        VATEntry2.Reset();
        VATEntry2.SetCurrentKey("Transaction No.");
        VATEntry2.SetRange("Transaction No.", CustLedgEntry2."Transaction No.");

        if VATEntry2.Find('-') then begin
            LastConnectionNo := 0;
            repeat
                if LastConnectionNo <> VATEntry2."Sales Tax Connection No." then
                    LastConnectionNo := VATEntry2."Sales Tax Connection No.";

                VATEntry3.Reset();
                if VATEntry3.FindLast then
                    VATEntryNo := VATEntry3."Entry No." + 1;

                if (VATEntry2.Type <> 0) and
                   (VATEntry2.Amount = 0) and
                   (VATEntry2.Base = 0)
                then begin
                    case VATEntry2."VAT Calculation Type" of
                        VATEntry2."VAT Calculation Type"::"Normal VAT",
                      VATEntry2."VAT Calculation Type"::"Reverse Charge VAT",
                      VATEntry2."VAT Calculation Type"::"Full VAT":
                            VATPostingSetup.Get(
                              VATEntry2."VAT Bus. Posting Group", VATEntry2."VAT Prod. Posting Group");
                    end;
                    if (VATPostingSetup."Unrealized VAT Type" > 0) and
                       ((VATEntry2."Remaining Unrealized Amount" <> 0) or
                        (VATEntry2."Remaining Unrealized Base" <> 0))
                    then begin
                        if not CustLedgEntry2.Open then
                            VATPart := 1
                        else
                            if CustLedgEntry2."Currency Code" = '' then
                                VATPart := -SettledAmount / CustLedgEntry2."Original Amt. (LCY)"
                            else
                                VATPart :=
                                  -SettledAmount *
                                  (CustLedgEntry2."Original Amt. (LCY)" / CustLedgEntry2.Amount) / CustLedgEntry2."Original Amt. (LCY)";
                        OnCustUnrealizedVATOnAfterVATPartCalculated(CustLedgEntry2, VATEntry2, VATPostingSetup, SettledAmount, VATPart);
                    end;
                    if VATPart <> 0 then begin
                        case VATEntry2."VAT Calculation Type" of
                            VATEntry2."VAT Calculation Type"::"Normal VAT",
                            VATEntry2."VAT Calculation Type"::"Reverse Charge VAT",
                            VATEntry2."VAT Calculation Type"::"Full VAT":
                                begin
                                    VATPostingSetup.TestField("Sales VAT Account");
                                    VATPostingSetup.TestField("Sales VAT Unreal. Account");
                                    SalesVATAccount := VATPostingSetup."Sales VAT Account";
                                    SalesVATUnrealAccount := VATPostingSetup."Sales VAT Unreal. Account";
                                end;
                        end;
                        PaymentTerms.Get(PaymentTermsCode);
                        if PaymentTerms."VAT distribution" = PaymentTerms."VAT distribution"::"First Installment" then
                            VATPart := 1;

                        if VATPart = 1 then begin
                            VATAmount := VATEntry2."Remaining Unrealized Amount";
                            VATBase := VATEntry2."Remaining Unrealized Base";
                            VATAmountAddCurr := VATEntry2."Add.-Curr. Rem. Unreal. Amount";
                            VATBaseAddCurr := VATEntry2."Add.-Curr. Rem. Unreal. Base";
                        end else begin
                            VATAmount := Round(VATEntry2."Unrealized Amount" * VATPart);
                            VATBase := Round(VATEntry2."Unrealized Base" * VATPart);
                        end;

                        VATUnrealAcc := SalesVATUnrealAccount;
                        VATAcc := SalesVATAccount;
                        if CustLedgEntry2."Currency Code" = '' then
                            TotalVATAmount := VATAmount
                        else
                            TotalVATAmount := VATAmount * CurrencyFactor;

                        if NoRealVATBuffer.Get(SalesVATUnrealAccount, SalesVATAccount, VATEntry2."Entry No.") then begin
                            NoRealVATBuffer.Amount := NoRealVATBuffer.Amount + TotalVATAmount;
                        end else begin
                            NoRealVATBuffer.Init();
                            NoRealVATBuffer.Account := SalesVATUnrealAccount;
                            NoRealVATBuffer."Balance Account" := SalesVATAccount;
                            NoRealVATBuffer.Amount := TotalVATAmount;
                            NoRealVATBuffer."Entry No." := VATEntry2."Entry No.";
                            NoRealVATBuffer.Insert();
                        end;

                        VATEntry := VATEntry2;
                        VATEntry."Entry No." := VATEntryNo;
                        VATEntry."Posting Date" := GenJnlLine."Posting Date";
                        VATEntry."Document No." := GenJnlLine."Document No.";
                        VATEntry."External Document No." := GenJnlLine."External Document No.";
                        VATEntry."Document Type" := GenJnlLine."Document Type";
                        VATEntry.Amount := VATAmount;
                        VATEntry.Base := VATBase;
                        VATEntry."Unrealized Amount" := 0;
                        VATEntry."Unrealized Base" := 0;
                        VATEntry."Remaining Unrealized Amount" := 0;
                        VATEntry."Remaining Unrealized Base" := 0;
                        VATEntry."Additional-Currency Amount" := VATAmountAddCurr;
                        VATEntry."Additional-Currency Base" := VATBaseAddCurr;
                        VATEntry."Add.-Currency Unrealized Amt." := 0;
                        VATEntry."Add.-Currency Unrealized Base" := 0;
                        VATEntry."Add.-Curr. Rem. Unreal. Amount" := 0;
                        VATEntry."Add.-Curr. Rem. Unreal. Base" := 0;
                        VATEntry."User ID" := UserId;
                        VATEntry."Source Code" := GenJnlLine."Source Code";
                        VATEntry."Reason Code" := GenJnlLine."Reason Code";
                        VATEntry."Closed by Entry No." := 0;
                        VATEntry.Closed := false;
                        VATEntry."Transaction No." := CustLedgEntry2."Transaction No.";
                        VATEntry."Unrealized VAT Entry No." := VATEntry2."Entry No.";
                        VATEntry.UpdateRates(VATPostingSetup);
                        Test1 := VATEntry.Insert();

                        VATEntry2."Remaining Unrealized Amount" :=
                          VATEntry2."Remaining Unrealized Amount" - VATEntry.Amount;
                        VATEntry2."Remaining Unrealized Base" :=
                          VATEntry2."Remaining Unrealized Base" - VATEntry.Base;
                        VATEntry2."Add.-Curr. Rem. Unreal. Amount" :=
                          VATEntry2."Add.-Curr. Rem. Unreal. Amount" - VATEntry."Additional-Currency Amount";
                        VATEntry2."Add.-Curr. Rem. Unreal. Base" :=
                          VATEntry2."Add.-Curr. Rem. Unreal. Base" - VATEntry."Additional-Currency Base";
                        OnCustUnrealizedVATOnBeforeVATEntryModify(VATEntry, CustLedgEntry2, GenJnlLine);
                        Test2 := VATEntry2.Modify();
                        LastVATEntryNo := VATEntryNo;
                    end;
                end;

                if not ExistVATEntry then
                    FirstVATEntryNo := LastVATEntryNo;
                ExistVATEntry := Test1 and Test2;

            until VATEntry2.Next = 0;
        end;
    end;

    procedure VendUnrealizedVAT2(VendLedgEntry2: Record "Vendor Ledger Entry"; AmountLCY: Decimal; GenJnlLine: Record "Gen. Journal Line"; var ExistVATEntry: Boolean; var FirstVATEntry: Integer; var LastVATEntry: Integer; var NoRealVATBuffer: Record "BG/PO Post. Buffer"; IsFromJournal: Boolean; PostedDocumentNo: Code[20])
    var
        VendLedgEntry3: Record "Vendor Ledger Entry";
    begin
        if GenJnlPostLine.VendFindVATSetup(VATPostingSetup, VendLedgEntry2, IsFromJournal) then begin
            VendLedgEntry3.SetCurrentKey("Document No.", "Document Type", "Vendor No.");
            VendLedgEntry3.SetRange("Document Type", VendLedgEntry3."Document Type"::Invoice);
            VendLedgEntry3.SetRange("Document No.", VendLedgEntry2."Document No.");

            OnVendUnrealizedVAT2OnAfterSetFilters(
              VendLedgEntry2, VendLedgEntry3, AmountLCY, GenJnlLine, ExistVATEntry, FirstVATEntry, LastVATEntry,
              NoRealVATBuffer, IsFromJournal, PostedDocumentNo);
            if VendLedgEntry3.FindFirst then begin
                VendLedgEntry3.Open := true;
                VendUnrealizedVAT(
                  VendLedgEntry3, -AmountLCY, GenJnlLine, ExistVATEntry, FirstVATEntry, LastVATEntry, NoRealVATBuffer, PostedDocumentNo);
            end;
        end else
            exit;
    end;

    local procedure VendUnrealizedVAT(var VendLedgEntry2: Record "Vendor Ledger Entry"; SettledAmount: Decimal; GenJnlLine: Record "Gen. Journal Line"; var ExistVATEntry: Boolean; var FirstVATEntryNo: Integer; var LastVATEntryNo: Integer; var NoRealVATBuffer: Record "BG/PO Post. Buffer"; PostedDocumentNo: Code[20])
    var
        VATEntry: Record "VAT Entry";
        VATEntry2: Record "VAT Entry";
        VATEntry3: Record "VAT Entry";
        PurchInvHeader: Record "Purch. Inv. Header";
        PaymentTerms: Record "Payment Terms";
        VATPart: Decimal;
        VATAmount: Decimal;
        VATBase: Decimal;
        VATAmountAddCurr: Decimal;
        VATBaseAddCurr: Decimal;
        CurrencyFactor: Decimal;
        PurchVATAccount: Code[20];
        PurchVATUnrealAccount: Code[20];
        LastConnectionNo: Integer;
        Test1: Boolean;
        Test2: Boolean;
        PaymentTermsCode: Code[20];
        ReverseChrgVATAcc: Code[20];
        ReverseChrgVATUnrealAcc: Code[20];
    begin
        OnBeforeVendUnrealizedVAT(
          VendLedgEntry2, SettledAmount, GenJnlLine, ExistVATEntry, FirstVATEntryNo, LastVATEntryNo,
          NoRealVATBuffer, PostedDocumentNo, PaymentTermsCode, VATPostingSetup);

        if PostedDocumentNo <> '' then begin
            PurchInvHeader.Get(PostedDocumentNo);
            PaymentTermsCode := PurchInvHeader."Payment Terms Code";
        end;

        VendLedgEntry2.CalcFields(
          Amount,
          "Amount (LCY)",
          "Remaining Amount",
          "Remaining Amt. (LCY)",
          "Original Amt. (LCY)");
        CurrencyFactor := VendLedgEntry2.Amount / VendLedgEntry2."Amount (LCY)";
        VATEntry2.Reset();
        VATEntry2.SetCurrentKey("Transaction No.");
        VATEntry2.SetRange("Transaction No.", VendLedgEntry2."Transaction No.");

        if VATEntry2.Find('-') then begin
            LastConnectionNo := 0;
            repeat
                if LastConnectionNo <> VATEntry2."Sales Tax Connection No." then
                    LastConnectionNo := VATEntry2."Sales Tax Connection No.";

                VATEntry3.Reset();
                if VATEntry3.FindLast then
                    VATEntryNo := VATEntry3."Entry No." + 1;

                if (VATEntry2.Type <> 0) and
                   (VATEntry2.Amount = 0) and
                   (VATEntry2.Base = 0)
                then begin
                    case VATEntry2."VAT Calculation Type" of
                        VATEntry2."VAT Calculation Type"::"Normal VAT",
                      VATEntry2."VAT Calculation Type"::"Reverse Charge VAT",
                      VATEntry2."VAT Calculation Type"::"Full VAT":
                            VATPostingSetup.Get(
                              VATEntry2."VAT Bus. Posting Group", VATEntry2."VAT Prod. Posting Group");
                    end;
                    if (VATPostingSetup."Unrealized VAT Type" > 0) and
                       ((VATEntry2."Remaining Unrealized Amount" <> 0) or
                        (VATEntry2."Remaining Unrealized Base" <> 0))
                    then begin
                        if not VendLedgEntry2.Open then
                            VATPart := 1
                        else
                            if VendLedgEntry2."Currency Code" = '' then
                                VATPart := -SettledAmount / VendLedgEntry2."Original Amt. (LCY)"
                            else
                                VATPart :=
                                  -SettledAmount *
                                  (VendLedgEntry2."Original Amt. (LCY)" / VendLedgEntry2.Amount) / VendLedgEntry2."Original Amt. (LCY)";
                        OnVendUnrealizedVATOnAfterVATPartCalculated(VendLedgEntry2, VATEntry2, VATPostingSetup, SettledAmount, VATPart);
                    end;
                    if VATPart <> 0 then begin
                        case VATEntry2."VAT Calculation Type" of
                            VATEntry2."VAT Calculation Type"::"Normal VAT",
                            VATEntry2."VAT Calculation Type"::"Reverse Charge VAT",
                            VATEntry2."VAT Calculation Type"::"Full VAT":
                                begin
                                    VATPostingSetup.TestField("Purchase VAT Account");
                                    VATPostingSetup.TestField("Purch. VAT Unreal. Account");
                                    if VATEntry2."VAT Calculation Type" = VATEntry2."VAT Calculation Type"::"Reverse Charge VAT" then begin
                                        VATPostingSetup.TestField("Reverse Chrg. VAT Acc.");
                                        VATPostingSetup.TestField("Reverse Chrg. VAT Unreal. Acc.");
                                        ReverseChrgVATAcc := VATPostingSetup."Reverse Chrg. VAT Acc.";
                                        ReverseChrgVATUnrealAcc := VATPostingSetup."Reverse Chrg. VAT Unreal. Acc.";
                                    end;
                                    PurchVATAccount := VATPostingSetup."Purchase VAT Account";
                                    PurchVATUnrealAccount := VATPostingSetup."Purch. VAT Unreal. Account";
                                end;
                        end;
                        PaymentTerms.Get(PaymentTermsCode);
                        if PaymentTerms."VAT distribution" = PaymentTerms."VAT distribution"::"First Installment" then
                            VATPart := 1;

                        if VATPart = 1 then begin
                            VATAmount := VATEntry2."Remaining Unrealized Amount";
                            VATBase := VATEntry2."Remaining Unrealized Base";
                            VATAmountAddCurr := VATEntry2."Add.-Curr. Rem. Unreal. Amount";
                            VATBaseAddCurr := VATEntry2."Add.-Curr. Rem. Unreal. Base";
                        end else begin
                            VATAmount := Round(VATEntry2."Unrealized Amount" * VATPart);
                            VATBase := Round(VATEntry2."Unrealized Base" * VATPart);
                        end;

                        VATUnrealAcc := PurchVATUnrealAccount;
                        VATAcc := PurchVATAccount;
                        if VendLedgEntry2."Currency Code" = '' then
                            TotalVATAmount := VATAmount
                        else
                            TotalVATAmount := VATAmount * CurrencyFactor;

                        if NoRealVATBuffer.Get(PurchVATUnrealAccount, PurchVATAccount, VATEntry2."Entry No.") then begin
                            NoRealVATBuffer.Amount := NoRealVATBuffer.Amount + TotalVATAmount;
                        end else begin
                            NoRealVATBuffer.Init();
                            NoRealVATBuffer.Account := PurchVATUnrealAccount;
                            NoRealVATBuffer."Balance Account" := PurchVATAccount;
                            NoRealVATBuffer.Amount := TotalVATAmount;
                            NoRealVATBuffer."Entry No." := VATEntry2."Entry No.";
                            NoRealVATBuffer.Insert();
                        end;

                        if VATEntry2."VAT Calculation Type" = VATEntry2."VAT Calculation Type"::"Reverse Charge VAT" then
                            if NoRealVATBuffer.Get(ReverseChrgVATAcc, ReverseChrgVATUnrealAcc, VATEntry2."Entry No.") then
                                NoRealVATBuffer.Amount := NoRealVATBuffer.Amount + TotalVATAmount
                            else begin
                                NoRealVATBuffer.Init();
                                NoRealVATBuffer.Account := ReverseChrgVATAcc;
                                NoRealVATBuffer."Balance Account" := ReverseChrgVATUnrealAcc;
                                NoRealVATBuffer.Amount := TotalVATAmount;
                                NoRealVATBuffer."Entry No." := VATEntry2."Entry No.";
                                NoRealVATBuffer.Insert();
                            end;

                        VATEntry := VATEntry2;
                        VATEntry."Entry No." := VATEntryNo;
                        VATEntry."Posting Date" := GenJnlLine."Posting Date";
                        VATEntry."Document No." := GenJnlLine."Document No.";
                        VATEntry."External Document No." := GenJnlLine."External Document No.";
                        VATEntry."Document Type" := GenJnlLine."Document Type";
                        VATEntry.Amount := VATAmount;
                        VATEntry.Base := VATBase;
                        VATEntry."Unrealized Amount" := 0;
                        VATEntry."Unrealized Base" := 0;
                        VATEntry."Remaining Unrealized Amount" := 0;
                        VATEntry."Remaining Unrealized Base" := 0;
                        VATEntry."Additional-Currency Amount" := VATAmountAddCurr;
                        VATEntry."Additional-Currency Base" := VATBaseAddCurr;
                        VATEntry."Add.-Currency Unrealized Amt." := 0;
                        VATEntry."Add.-Currency Unrealized Base" := 0;
                        VATEntry."Add.-Curr. Rem. Unreal. Amount" := 0;
                        VATEntry."Add.-Curr. Rem. Unreal. Base" := 0;
                        VATEntry."User ID" := UserId;
                        VATEntry."Source Code" := GenJnlLine."Source Code";
                        VATEntry."Reason Code" := GenJnlLine."Reason Code";
                        VATEntry."Closed by Entry No." := 0;
                        VATEntry.Closed := false;
                        VATEntry."Transaction No." := VendLedgEntry2."Transaction No.";
                        VATEntry."Unrealized VAT Entry No." := VATEntry2."Entry No.";
                        VATEntry.UpdateRates(VATPostingSetup);
                        Test1 := VATEntry.Insert();

                        VATEntry2."Remaining Unrealized Amount" :=
                          VATEntry2."Remaining Unrealized Amount" - VATEntry.Amount;
                        VATEntry2."Remaining Unrealized Base" :=
                          VATEntry2."Remaining Unrealized Base" - VATEntry.Base;
                        VATEntry2."Add.-Curr. Rem. Unreal. Amount" :=
                          VATEntry2."Add.-Curr. Rem. Unreal. Amount" - VATEntry."Additional-Currency Amount";
                        VATEntry2."Add.-Curr. Rem. Unreal. Base" :=
                          VATEntry2."Add.-Curr. Rem. Unreal. Base" - VATEntry."Additional-Currency Base";
                        Test2 := VATEntry2.Modify();
                        LastVATEntryNo := VATEntryNo;
                    end;
                end;

                if not ExistVATEntry then
                    FirstVATEntryNo := LastVATEntryNo;
                ExistVATEntry := Test1 and Test2;

            until VATEntry2.Next = 0;
        end;
    end;

    [Scope('OnPrem')]
    procedure GetLastDate(CurrCode: Code[10]; DocPostDate: Date; Type: Option Receivable,Payable): Date
    var
        ExchRateAdjReg: Record "Exch. Rate Adjmt. Reg.";
    begin
        ExchRateAdjReg.SetRange("Currency Code", CurrCode);
        if Type = Type::Receivable then
            ExchRateAdjReg.SetRange("Account Type", ExchRateAdjReg."Account Type"::Customer)
        else
            ExchRateAdjReg.SetRange("Account Type", ExchRateAdjReg."Account Type"::Vendor);
        if ExchRateAdjReg.FindLast then
            if ExchRateAdjReg."Creation Date" > DocPostDate then
                exit(ExchRateAdjReg."Creation Date")
            else
                exit(DocPostDate)
        else
            exit(DocPostDate);
    end;

    procedure GetGainLoss(PostingDate: Date; PostingDate2: Date; AmountFCY: Decimal; CurrencyCode: Code[10]): Decimal
    begin
        exit(
          GetAmountLCYBasedOnCurrencyDate(PostingDate2, CurrencyCode, AmountFCY) -
          GetAmountLCYBasedOnCurrencyDate(PostingDate, CurrencyCode, AmountFCY));
    end;

    procedure GetCurrFactorGainLoss(CurrFactor1: Decimal; CurrFactor2: Decimal; AmountFCY: Decimal; CurrencyCode: Code[10]): Decimal
    begin
        exit(
          GetAmountLCYBasedOnCurrencyFactor(CurrencyCode, CurrFactor2, AmountFCY) -
          GetAmountLCYBasedOnCurrencyFactor(CurrencyCode, CurrFactor1, AmountFCY));
    end;

    procedure CheckFromRedrawnDoc(DocNo: Code[20]): Boolean
    begin
        if StrPos(DocNo, '-') = 0 then
            exit(false);

        exit(true);
    end;

    local procedure GetDocType(Type: Option Invoice,,Bill): Integer
    var
        DocType: Option " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
    begin
        case Type of
            Type::Invoice, Type::Bill:
                DocType := DocType::Payment;
            else
                DocType := DocType::" ";
        end;

        exit(DocType);
    end;

    local procedure RemovePayableError(CarteraDoc: Record "Cartera Doc.")
    var
        PaymentJnlExportErrorText: Record "Payment Jnl. Export Error Text";
    begin
        PaymentJnlExportErrorText.SetRange("Document No.", CarteraDoc."Bill Gr./Pmt. Order No.");
        PaymentJnlExportErrorText.SetRange("Journal Line No.", CarteraDoc."Entry No.");
        PaymentJnlExportErrorText.DeleteAll(true);
    end;

    local procedure RemoveReceivableError(CarteraDoc: Record "Cartera Doc.")
    var
        PaymentJnlExportErrorText: Record "Payment Jnl. Export Error Text";
    begin
        PaymentJnlExportErrorText.SetRange("Journal Template Name", '');
        PaymentJnlExportErrorText.SetRange("Journal Batch Name", Format(DATABASE::"Bill Group"));
        PaymentJnlExportErrorText.SetRange("Document No.", CarteraDoc."Bill Gr./Pmt. Order No.");
        PaymentJnlExportErrorText.SetRange("Journal Line No.", CarteraDoc."Entry No.");
        PaymentJnlExportErrorText.DeleteAll(true);
    end;

    procedure GetDimSetIDFromCustLedgEntry(GenJnlLine: Record "Gen. Journal Line"; CustLedgEntry: Record "Cust. Ledger Entry"; IsPostedDoc: Boolean) DimSetID: Integer
    var
        PostedCarteraDoc: Record "Posted Cartera Doc.";
        ClosedCarteraDoc: Record "Closed Cartera Doc.";
    begin
        if IsPostedDoc then begin
            PostedCarteraDoc.SetRange(Type, PostedCarteraDoc.Type::Receivable);
            PostedCarteraDoc.SetRange("Document No.", CustLedgEntry."Document No.");
            if CustLedgEntry."Document Type" = CustLedgEntry."Document Type"::Bill then
                PostedCarteraDoc.SetRange("No.", CustLedgEntry."Bill No.");
            PostedCarteraDoc.FindLast;
            DimSetID := PostedCarteraDoc."Dimension Set ID";
        end else begin
            ClosedCarteraDoc.SetRange(Type, ClosedCarteraDoc.Type::Receivable);
            ClosedCarteraDoc.SetRange("Document No.", CustLedgEntry."Document No.");
            if CustLedgEntry."Document Type" = CustLedgEntry."Document Type"::Bill then
                ClosedCarteraDoc.SetRange("No.", CustLedgEntry."Bill No.");
            ClosedCarteraDoc.FindLast;
            DimSetID := ClosedCarteraDoc."Dimension Set ID";
        end;
        exit(GetCombinedDimSetID(GenJnlLine, DimSetID));
    end;

    procedure GetDimSetIDFromCustPostDocBuffer(GenJnlLine: Record "Gen. Journal Line"; CustLedgEntry: Record "Cust. Ledger Entry"; var PostDocBuffer: Record "Posted Cartera Doc."): Integer
    begin
        PostDocBuffer.SetRange(Type, PostDocBuffer.Type::Receivable);
        PostDocBuffer.SetRange("Document No.", CustLedgEntry."Document No.");
        if CustLedgEntry."Document Type" = CustLedgEntry."Document Type"::Bill then
            PostDocBuffer.SetRange("No.", CustLedgEntry."Bill No.");
        PostDocBuffer.FindLast;
        PostDocBuffer.Reset();
        exit(GetCombinedDimSetID(GenJnlLine, PostDocBuffer."Dimension Set ID"));
    end;

    procedure GetCombinedDimSetID(GenJnlLine: Record "Gen. Journal Line"; DimSetID: Integer): Integer
    var
        DimensioMgt: Codeunit DimensionManagement;
        DimensionSetIDArr: array[10] of Integer;
    begin
        with GenJnlLine do begin
            DimensionSetIDArr[1] := "Dimension Set ID";
            DimensionSetIDArr[2] := DimSetID;
            exit(
              DimensioMgt.GetCombinedDimensionSetID(DimensionSetIDArr, "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code"));
        end;
    end;

    local procedure GetAmountLCYBasedOnCurrencyDate(PostingDate: Date; CurrencyCode: Code[10]; AmountFCY: Decimal): Decimal
    var
        TempGenJournalLine: Record "Gen. Journal Line" temporary;
    begin
        TempGenJournalLine.Init();
        TempGenJournalLine."Posting Date" := PostingDate;
        TempGenJournalLine.Validate("Account Type", TempGenJournalLine."Account Type"::"G/L Account");
        TempGenJournalLine.Validate("Currency Code", CurrencyCode);
        TempGenJournalLine.Validate(Amount, AmountFCY);
        TempGenJournalLine.Insert();
        exit(TempGenJournalLine."Amount (LCY)");
    end;

    local procedure GetAmountLCYBasedOnCurrencyFactor(CurrencyCode: Code[10]; CurrencyFactor: Decimal; AmountFCY: Decimal): Decimal
    var
        TempGenJournalLine: Record "Gen. Journal Line" temporary;
    begin
        TempGenJournalLine.Init();
        TempGenJournalLine.Validate("Currency Code", CurrencyCode);
        TempGenJournalLine.Validate("Currency Factor", CurrencyFactor);
        TempGenJournalLine.Validate(Amount, AmountFCY);
        TempGenJournalLine.Insert();
        exit(TempGenJournalLine."Amount (LCY)");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreatePayableDocPayment(var GenJournalLine: Record "Gen. Journal Line"; var VendorLedgerEntry: Record "Vendor Ledger Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreateReceivableDocPayment(var GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInsertPayableDocs(var CarteraDoc: Record "Cartera Doc."; var PaymentOrder: Record "Payment Order")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInsertReceivableDocs(var CarteraDoc: Record "Cartera Doc."; var BillGroup: Record "Bill Group")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterRemovePayableDocs(var CarteraDoc: Record "Cartera Doc."; var PaymentOrder: Record "Payment Order")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterRemoveReceivableDocs(var CarteraDoc: Record "Cartera Doc."; var BillGroup: Record "Bill Group")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterReversePayableDocPayment(var GenJournalLine: Record "Gen. Journal Line"; var VendorLedgerEntry: Record "Vendor Ledger Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterReverseReceivableDocPayment(var GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCustUnrealizedVAT(var CustLedgerEntry: Record "Cust. Ledger Entry"; var SettledAmount: Decimal; var GenJournalLine: Record "Gen. Journal Line"; var ExistVATEntry: Boolean; var FirstVATEntryNo: Integer; var LastVATEntryNo: Integer; var BgPoPostBuffer: Record "BG/PO Post. Buffer"; var PostedDocumentNo: Code[20]; var PaymentTermsCode: Code[20]; var VATPostingSetup: Record "VAT Posting Setup")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeVendUnrealizedVAT(var VendLedgEntry: Record "Vendor Ledger Entry"; var SettledAmount: Decimal; var GenJournalLine: Record "Gen. Journal Line"; var ExistVATEntry: Boolean; var FirstVATEntryNo: Integer; var LastVATEntryNo: Integer; var BgPoPostBuffer: Record "BG/PO Post. Buffer"; var PostedDocumentNo: Code[20]; var PaymentTermsCode: Code[20]; var VATPostingSetup: Record "VAT Posting Setup")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCustUnrealizedVATOnAfterVATPartCalculated(CustLedgerEntry: Record "Cust. Ledger Entry"; VATEntry: Record "VAT Entry"; VATPostingSetup: Record "VAT Posting Setup"; var SettledAmount: Decimal; var VATPart: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCustUnrealizedVATOnBeforeVATEntryModify(var VATEntry: Record "VAT Entry"; CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInsertPayableDocsOnAfterSetFilters(var CarteraDoc: Record "Cartera Doc."; var CarteraDoc2: Record "Cartera Doc.")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInsertReceivableDocsOnAfterSetFilters(var CarteraDoc: Record "Cartera Doc."; BillGroup: Record "Bill Group")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnVendUnrealizedVAT2OnAfterSetFilters(var VendLedgEntry2: Record "Vendor Ledger Entry"; var VendLedgEntry3: Record "Vendor Ledger Entry"; var SettledAmount: Decimal; var GenJournalLine: Record "Gen. Journal Line"; var ExistVATEntry: Boolean; var FirstVATEntryNo: Integer; var LastVATEntryNo: Integer; var BgPoPostBuffer: Record "BG/PO Post. Buffer"; var IsFromJournal: Boolean; var PostedDocumentNo: Code[20])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnVendUnrealizedVATOnAfterVATPartCalculated(VendorLedgerEntry: Record "Vendor Ledger Entry"; VATEntry: Record "VAT Entry"; VATPostingSetup: Record "VAT Posting Setup"; var SettledAmount: Decimal; var VATPart: Decimal)
    begin
    end;
}

