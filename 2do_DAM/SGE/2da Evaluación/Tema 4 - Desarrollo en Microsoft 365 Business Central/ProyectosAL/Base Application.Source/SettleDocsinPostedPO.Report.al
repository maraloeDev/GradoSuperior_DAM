report 7000082 "Settle Docs. in Posted PO"
{
    Caption = 'Settle Docs. in Posted PO';
    Permissions = TableData "Cust. Ledger Entry" = imd,
                  TableData "Vendor Ledger Entry" = imd,
                  TableData "G/L Register" = m,
                  TableData "Posted Cartera Doc." = imd,
                  TableData "Closed Cartera Doc." = imd,
                  TableData "Posted Payment Order" = imd,
                  TableData "Closed Payment Order" = imd;
    ProcessingOnly = true;

    dataset
    {
        dataitem(PostedDoc; "Posted Cartera Doc.")
        {
            DataItemTableView = SORTING("Bill Gr./Pmt. Order No.", Status, "Category Code", Redrawn, "Due Date") WHERE(Status = CONST(Open));

            trigger OnAfterGetRecord()
            var
                FromJnl: Boolean;
                IsHandled: Boolean;
            begin
                IsRedrawn := CarteraManagement.CheckFromRedrawnDoc("No.");
                if "Document Type" = "Document Type"::Invoice then
                    ExistInvoice := true;

                IsHandled := false;
                OnAfterGetPostedDocOnBeforePostedPmtOrdGet(PostedDoc, PostedPmtOrd, BankAcc, Delay, IsHandled);
                if not IsHandled then begin
                    PostedPmtOrd.Get("Bill Gr./Pmt. Order No.");
                    BankAcc.Get(PostedPmtOrd."Bank Account No.");
                    Delay := BankAcc."Delay for Notices";
                end;

                if DueOnly and (PostingDate < "Due Date" + Delay) then
                    CurrReport.Skip();

                DocCount := DocCount + 1;
                Window.Update(1, DocCount);

                case "Document Type" of
                    "Document Type"::Invoice, 1:
                        begin
                            with GenJnlLine do begin
                                GenJnlLineNextNo := GenJnlLineNextNo + 10000;
                                Clear(GenJnlLine);
                                Init;
                                "Line No." := GenJnlLineNextNo;
                                "Posting Date" := PostingDate;
                                "Reason Code" := PostedPmtOrd."Reason Code";
                                "Document Date" := "Document Date";
                                Validate("Account Type", "Account Type"::Vendor);
                                VendLedgEntry.Get(PostedDoc."Entry No.");
                                OnBeforeValidateInvoiceAccountNo(
                                  PostedDoc, GenJnlLine, VATPostingSetup, VendLedgEntry, FromJnl, ExistsNoRealVAT, PostedPmtOrd);
                                Validate("Account No.", VendLedgEntry."Vendor No.");
                                "Document Type" := "Document Type"::Payment;
                                Description := CopyStr(StrSubstNo(Text1100001, PostedDoc."Document No."), 1, MaxStrLen(Description));
                                "Document No." := PostedPmtOrd."No.";
                                Validate("Currency Code", PostedDoc."Currency Code");
                                if PaymentToleranceMgt.CheckCalcPmtDiscGenJnlVend(GenJnlLine, VendLedgEntry, 0, false) then
                                    Validate(Amount, PostedDoc."Remaining Amount" + VendLedgEntry."Remaining Pmt. Disc. Possible")
                                else
                                    Validate(Amount, PostedDoc."Remaining Amount");
                                "Applies-to Doc. Type" := VendLedgEntry."Document Type";
                                "Applies-to Doc. No." := VendLedgEntry."Document No.";
                                "Applies-to Bill No." := VendLedgEntry."Bill No.";
                                "Source Code" := SourceCode;
                                "Global Dimension 1 Code" := VendLedgEntry."Global Dimension 1 Code";
                                "System-Created Entry" := true;
                                "Shortcut Dimension 1 Code" := VendLedgEntry."Global Dimension 1 Code";
                                "Shortcut Dimension 2 Code" := VendLedgEntry."Global Dimension 2 Code";
                                "Dimension Set ID" := VendLedgEntry."Dimension Set ID";
                                OnBeforeGenJournalLineInsert(PostedDoc, GenJnlLine, VATPostingSetup, VendLedgEntry, PostedPmtOrd, BankAcc);
                                Insert;
                                SumLCYAmt := SumLCYAmt + "Amount (LCY)";
                            end;
                            GroupAmount := GroupAmount + "Remaining Amount";
                            if PaymentToleranceMgt.CheckCalcPmtDiscGenJnlVend(GenJnlLine, VendLedgEntry, 0, false) then
                                CalcBankAccount("No.", "Remaining Amount" + VendLedgEntry."Remaining Pmt. Disc. Possible", VendLedgEntry."Entry No.")
                            else
                                CalcBankAccount("No.", "Remaining Amount", VendLedgEntry."Entry No.");
                            VendLedgEntry."Document Status" := VendLedgEntry."Document Status"::Honored;
                            VendLedgEntry.Modify();
                            OnAfterCreateInvoiceGenJnlLine(
                              GenJnlLine, VendLedgEntry, PostedDoc, PostedPmtOrd, FromJnl, ExistsNoRealVAT, ExistVATEntry,
                              IsRedrawn, FirstVATEntryNo, LastVATEntryNo, NoRealVATBuffer, BankAccPostBuffer);
                        end;
                    "Document Type"::Bill:
                        begin
                            with GenJnlLine do begin
                                GenJnlLineNextNo := GenJnlLineNextNo + 10000;
                                Clear(GenJnlLine);
                                Init;
                                "Line No." := GenJnlLineNextNo;
                                "Posting Date" := PostingDate;
                                "Document Type" := "Document Type"::Payment;
                                "Document No." := PostedPmtOrd."No.";
                                "Reason Code" := PostedPmtOrd."Reason Code";
                                Validate("Account Type", "Account Type"::Vendor);
                                VendLedgEntry.Get(PostedDoc."Entry No.");

                                if GLSetup."Unrealized VAT" then begin
                                    FromJnl := false;
                                    if PostedDoc."From Journal" then
                                        FromJnl := true;
                                    ExistsNoRealVAT := GenJnlPostLine.VendFindVATSetup(VATPostingSetup, VendLedgEntry, FromJnl);
                                end;

                                Validate("Account No.", VendLedgEntry."Vendor No.");
                                Description := CopyStr(StrSubstNo(Text1100002, PostedDoc."Document No.", PostedDoc."No."), 1, MaxStrLen(Description));
                                Validate("Currency Code", PostedDoc."Currency Code");
                                Validate(Amount, PostedDoc."Remaining Amount");
                                "Applies-to Doc. Type" := VendLedgEntry."Document Type";
                                "Applies-to Doc. No." := VendLedgEntry."Document No.";
                                "Applies-to Bill No." := VendLedgEntry."Bill No.";
                                "Source Code" := SourceCode;
                                "System-Created Entry" := true;
                                "Shortcut Dimension 1 Code" := VendLedgEntry."Global Dimension 1 Code";
                                "Shortcut Dimension 2 Code" := VendLedgEntry."Global Dimension 2 Code";
                                "Dimension Set ID" := VendLedgEntry."Dimension Set ID";
                                OnBeforeGenJournalLineInsert(PostedDoc, GenJnlLine, VATPostingSetup, VendLedgEntry, PostedPmtOrd, BankAcc);
                                Insert;
                                SumLCYAmt := SumLCYAmt + "Amount (LCY)";
                            end;
                            if GLSetup."Unrealized VAT" and ExistsNoRealVAT and (not IsRedrawn) then begin
                                VendLedgEntry.CalcFields("Remaining Amount", "Remaining Amt. (LCY)");

                                OnBeforeVendUnrealizedVAT2(PostedDoc, GenJnlLine, VendLedgEntry, PostedPmtOrd, NoRealVATBuffer);
                                CarteraManagement.VendUnrealizedVAT2(
                                  VendLedgEntry,
                                  VendLedgEntry."Remaining Amt. (LCY)",
                                  GenJnlLine,
                                  ExistVATEntry,
                                  FirstVATEntryNo,
                                  LastVATEntryNo,
                                  NoRealVATBuffer,
                                  FromJnl,
                                  "Document No.");

                                TempCurrCode := "Currency Code";
                                "Currency Code" := '';

                                if NoRealVATBuffer.Find('-') then begin
                                    repeat
                                    begin
                                        InsertGenJournalLine(
                                          GenJnlLine."Account Type"::"G/L Account",
                                          NoRealVATBuffer.Account,
                                          NoRealVATBuffer.Amount,
                                          "Global Dimension 1 Code",
                                          "Global Dimension 2 Code",
                                          "Dimension Set ID");
                                        InsertGenJournalLine(
                                          GenJnlLine."Account Type"::"G/L Account",
                                          NoRealVATBuffer."Balance Account",
                                          -NoRealVATBuffer.Amount,
                                          "Global Dimension 1 Code",
                                          "Global Dimension 2 Code",
                                          "Dimension Set ID");
                                    end;
                                    until NoRealVATBuffer.Next = 0;
                                    NoRealVATBuffer.DeleteAll();
                                end;

                                "Currency Code" := TempCurrCode;
                            end;
                            GroupAmount := GroupAmount + "Remaining Amount";
                            CalcBankAccount("No.", "Remaining Amount", VendLedgEntry."Entry No.");
                            VendLedgEntry."Document Status" := VendLedgEntry."Document Status"::Honored;
                            VendLedgEntry.Modify();
                            OnAfterCreateBillGenJnlLine(
                              GenJnlLine, VendLedgEntry, PostedDoc, PostedPmtOrd, FromJnl, ExistsNoRealVAT, ExistVATEntry,
                              IsRedrawn, FirstVATEntryNo, LastVATEntryNo, NoRealVATBuffer, BankAccPostBuffer);
                        end;
                end;
            end;

            trigger OnPostDataItem()
            var
                VendLedgEntry2: Record "Vendor Ledger Entry";
                PostedDoc2: Record "Posted Cartera Doc.";
                IsHandled: Boolean;
            begin
                if (DocCount = 0) or (GroupAmount = 0) then begin
                    if DueOnly then
                        Error(Text1100003 + Text1100004);

                    Error(Text1100003 + Text1100005);
                end;
                OnBeforePostedDocOnPostDataItem(PostedDoc, PostedPmtOrd, BankAccPostBuffer);
                if BankAccPostBuffer.Find('-') then
                    repeat
                        VendLedgEntry2.Get(BankAccPostBuffer."Entry No.");
                        PostedDoc2.Get(1, VendLedgEntry2."Entry No.");
                        PostedPmtOrd.Get(PostedDoc2."Bill Gr./Pmt. Order No.");
                        BankAcc.Get(PostedPmtOrd."Bank Account No.");
                        GenJnlLineNextNo := GenJnlLineNextNo + 10000;
                        with GenJnlLine do begin
                            Clear(GenJnlLine);
                            Init;
                            "Line No." := GenJnlLineNextNo;
                            "Posting Date" := PostingDate;
                            "Document Type" := "Document Type"::Payment;
                            "Document No." := PostedPmtOrd."No.";
                            "Reason Code" := PostedPmtOrd."Reason Code";
                            Validate("Account Type", "Account Type"::"Bank Account");
                            Validate("Account No.", BankAcc."No.");
                            Description := CopyStr(StrSubstNo(Text1100006, PostedPmtOrd."No."), 1, MaxStrLen(Description));
                            Validate("Currency Code", PostedPmtOrd."Currency Code");
                            Validate(Amount, -BankAccPostBuffer.Amount);
                            "Source Code" := SourceCode;
                            "Dimension Set ID" :=
                              CarteraManagement.GetCombinedDimSetID(GenJnlLine, BankAccPostBuffer."Dimension Set ID");
                            "System-Created Entry" := true;
                            OnBeforeGenJournalLineInsert(PostedDoc, GenJnlLine, VATPostingSetup, VendLedgEntry, PostedPmtOrd, BankAcc);
                            Insert;

                            SumLCYAmt := SumLCYAmt + "Amount (LCY)";
                        end;
                    until BankAccPostBuffer.Next = 0;

                if PostedPmtOrd."Currency Code" <> '' then begin
                    if SumLCYAmt <> 0 then begin
                        Currency.SetFilter(Code, PostedPmtOrd."Currency Code");
                        Currency.FindFirst;
                        if SumLCYAmt > 0 then begin
                            Currency.TestField("Residual Gains Account");
                            Acct := Currency."Residual Gains Account";
                        end else begin
                            Currency.TestField("Residual Losses Account");
                            Acct := Currency."Residual Losses Account";
                        end;
                        GenJnlLineNextNo := GenJnlLineNextNo + 10000;
                        with GenJnlLine do begin
                            Clear(GenJnlLine);
                            Init;
                            "Line No." := GenJnlLineNextNo;
                            "Posting Date" := PostingDate;
                            "Document Type" := "Document Type"::Payment;
                            "Document No." := PostedPmtOrd."No.";
                            "Reason Code" := PostedPmtOrd."Reason Code";
                            Validate("Account Type", "Account Type"::"G/L Account");
                            Validate("Account No.", Acct);
                            Description := Text1100007;
                            Validate("Currency Code", '');
                            Validate(Amount, -SumLCYAmt);
                            "Source Code" := SourceCode;
                            "System-Created Entry" := true;
                            OnBeforeGenJournalLineInsert(PostedDoc, GenJnlLine, VATPostingSetup, VendLedgEntry, PostedPmtOrd, BankAcc);
                            Insert;
                        end;
                    end;
                end;
                PostedPmtOrd.Modify();
                DocPost.PostSettlementForPostedPmtOrder(GenJnlLine, PostingDate);
                OnAfterPostSettlementForPostedPmtOrder(PostedDoc, PostedPmtOrd);

                Window.Close;

                if (Counter > 1) and GLSetup."Unrealized VAT" and ExistVATEntry and ExistInvoice then begin
                    if VATEntry.FindLast then
                        ToVATEntryNo := VATEntry."Entry No.";
                    GLReg.FindLast;
                    GLReg."From VAT Entry No." := FromVATEntryNo;
                    GLReg."To VAT Entry No." := ToVATEntryNo;
                    GLReg.Modify();
                end else begin
                    if ExistVATEntry then begin
                        GLReg.FindLast;
                        GLReg."From VAT Entry No." := FirstVATEntryNo;
                        GLReg."To VAT Entry No." := LastVATEntryNo;
                        GLReg.Modify();
                    end;
                end;

                IsHandled := false;
                OnBeforeCommit(PostedDoc, PostedPmtOrd, GenJnlLine, HidePrintDialog, IsHandled);
                if IsHandled then
                    exit;

                Commit();

                if not HidePrintDialog then
                    Message(Text1100008, DocCount, GroupAmount);
            end;

            trigger OnPreDataItem()
            begin
                OnBeforePostedDocOnPreDataItem(PostedDoc, PostingDate);
                DocPost.CheckPostingDate(PostingDate);

                SourceCodeSetup.Get();
                SourceCode := SourceCodeSetup."Cartera Journal";
                DocCount := 0;
                SumLCYAmt := 0;
                GenJnlLineNextNo := 0;
                ExistInvoice := false;
                ExistVATEntry := false;
                Window.Open(
                  Text1100000);
                Counter := Count;
                if (Counter > 1) and GLSetup."Unrealized VAT" then begin
                    VATEntry.LockTable();
                    if VATEntry.FindLast then
                        FromVATEntryNo := VATEntry."Entry No." + 1;
                end;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PostingDate; PostingDate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posting Date';
                        NotBlank = true;
                        ToolTip = 'Specifies the posting date for the document.';
                    }
                    field(DueOnly; DueOnly)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Due bills only';
                        ToolTip = 'Specifies if you want to only include documents that have become overdue. If it does not matter if a document is overdue at the time of settlement, leave this field blank.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        PostingDate := WorkDate;
    end;

    trigger OnPreReport()
    begin
        GLSetup.Get();
    end;

    var
        Text1100000: Label 'Settling payable documents     #1######';
        Text1100001: Label 'Payable document settlement %1';
        Text1100002: Label 'Payable bill settlement %1/%2';
        Text1100003: Label 'No payable documents have been found that can be settled.';
        Text1100004: Label 'Please check that the selection is not empty and at least one payable document is open and due.';
        Text1100005: Label 'Please check that the selection is not empty and at least one payable document is open.';
        Text1100006: Label 'Payment Order settlement %1';
        Text1100007: Label 'Residual adjust generated by rounding Amount';
        Text1100008: Label '%1 documents totaling %2 have been settled.';
        Text1100009: Label 'Document settlement %1/%2';
        SourceCodeSetup: Record "Source Code Setup";
        PostedPmtOrd: Record "Posted Payment Order";
        GenJnlLine: Record "Gen. Journal Line" temporary;
        VendLedgEntry: Record "Vendor Ledger Entry";
        BankAcc: Record "Bank Account";
        Currency: Record Currency;
        GLReg: Record "G/L Register";
        GLSetup: Record "General Ledger Setup";
        VATPostingSetup: Record "VAT Posting Setup";
        VATEntry: Record "VAT Entry";
        BankAccPostBuffer: Record "BG/PO Post. Buffer" temporary;
        NoRealVATBuffer: Record "BG/PO Post. Buffer" temporary;
        DocPost: Codeunit "Document-Post";
        CarteraManagement: Codeunit CarteraManagement;
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        Window: Dialog;
        PostingDate: Date;
        DueOnly: Boolean;
        Delay: Decimal;
        SourceCode: Code[10];
        Acct: Code[20];
        DocCount: Integer;
        GroupAmount: Decimal;
        GenJnlLineNextNo: Integer;
        SumLCYAmt: Decimal;
        ExistVATEntry: Boolean;
        FirstVATEntryNo: Integer;
        LastVATEntryNo: Integer;
        IsRedrawn: Boolean;
        ExistInvoice: Boolean;
        FromVATEntryNo: Integer;
        ToVATEntryNo: Integer;
        Counter: Integer;
        TempCurrCode: Code[10];
        ExistsNoRealVAT: Boolean;
        HidePrintDialog: Boolean;

    local procedure InsertGenJournalLine(AccType: Integer; AccNo: Code[20]; Amount2: Decimal; Dep: Code[20]; Proj: Code[20]; DimSetID: Integer)
    begin
        GenJnlLineNextNo := GenJnlLineNextNo + 10000;

        with GenJnlLine do begin
            Clear(GenJnlLine);
            Init;
            "Line No." := GenJnlLineNextNo;
            "Posting Date" := PostingDate;
            "Document Type" := "Document Type"::Payment;
            "Document No." := PostedPmtOrd."No.";
            "Reason Code" := PostedPmtOrd."Reason Code";
            "Account Type" := AccType;
            "Account No." := AccNo;
            if PostedDoc."Document Type" = PostedDoc."Document Type"::Bill then
                Description := CopyStr(StrSubstNo(Text1100009, PostedDoc."Document No.", PostedDoc."No."), 1, MaxStrLen(Description))
            else
                Description := CopyStr(StrSubstNo(Text1100009, PostedDoc."Document No.", PostedDoc."No."), 1, MaxStrLen(Description));
            Validate("Currency Code", PostedDoc."Currency Code");
            Validate(Amount, -Amount2);
            "Applies-to Doc. Type" := VendLedgEntry."Document Type";
            "Applies-to Doc. No." := '';
            "Applies-to Bill No." := VendLedgEntry."Bill No.";
            "Source Code" := SourceCode;
            "System-Created Entry" := true;
            "Shortcut Dimension 1 Code" := Dep;
            "Shortcut Dimension 2 Code" := Proj;
            "Dimension Set ID" := DimSetID;
            SumLCYAmt := SumLCYAmt + "Amount (LCY)";
            OnBeforeGenJournalLineInsert(PostedDoc, GenJnlLine, VATPostingSetup, VendLedgEntry, PostedPmtOrd, BankAcc);
            Insert;
        end;
    end;

    [Scope('OnPrem')]
    procedure CalcBankAccount(BankAcc2: Code[20]; Amount2: Decimal; EntryNo: Integer)
    begin
        if BankAccPostBuffer.Get(BankAcc2, '', EntryNo) then begin
            BankAccPostBuffer.Amount := BankAccPostBuffer.Amount + Amount2;
            BankAccPostBuffer.Modify();
        end else begin
            BankAccPostBuffer.Init();
            BankAccPostBuffer.Account := BankAcc2;
            BankAccPostBuffer.Amount := Amount2;
            BankAccPostBuffer."Entry No." := EntryNo;
            BankAccPostBuffer."Global Dimension 1 Code" := VendLedgEntry."Global Dimension 1 Code";
            BankAccPostBuffer."Global Dimension 2 Code" := VendLedgEntry."Global Dimension 2 Code";
            BankAccPostBuffer."Dimension Set ID" := VendLedgEntry."Dimension Set ID";
            BankAccPostBuffer.Insert();
        end;
    end;

    [Scope('OnPrem')]
    procedure SetHidePrintDialog(NewHidePrintDialog: Boolean)
    begin
        HidePrintDialog := NewHidePrintDialog;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreateBillGenJnlLine(var GenJournalLine: Record "Gen. Journal Line"; var VendorLedgerEntry: Record "Vendor Ledger Entry"; var PostedCarteraDoc: Record "Posted Cartera Doc."; var PostedPaymentOrder: Record "Posted Payment Order"; var FromJnl: Boolean; var ExistsNoRealVAT: Boolean; var ExistVATEntry: Boolean; var IsRedrawn: Boolean; var FirstVATEntryNo: Integer; var LastVATEntryNo: Integer; var BgPoPostBuffer: Record "BG/PO Post. Buffer"; var BankBgPoPostBuffer: Record "BG/PO Post. Buffer")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreateInvoiceGenJnlLine(var GenJournalLine: Record "Gen. Journal Line"; var VendorLedgerEntry: Record "Vendor Ledger Entry"; var PostedCarteraDoc: Record "Posted Cartera Doc."; var PostedPaymentOrder: Record "Posted Payment Order"; var FromJnl: Boolean; var ExistsNoRealVAT: Boolean; var ExistVATEntry: Boolean; var IsRedrawn: Boolean; var FirstVATEntryNo: Integer; var LastVATEntryNo: Integer; var BgPoPostBuffer: Record "BG/PO Post. Buffer"; var BankBgPoPostBuffer: Record "BG/PO Post. Buffer")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetPostedDocOnBeforePostedPmtOrdGet(var PostedCarteraDoc: Record "Posted Cartera Doc."; var PostedPaymentOrder: Record "Posted Payment Order"; var BankAccount: Record "Bank Account"; var Delay: Decimal; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterPostSettlementForPostedPmtOrder(var PostedCarteraDoc: Record "Posted Cartera Doc."; var PostedPaymentOrder: Record "Posted Payment Order")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCommit(var PostedCarteraDoc: Record "Posted Cartera Doc."; var PostedPaymentOrder: Record "Posted Payment Order"; var GenJournalLine: Record "Gen. Journal Line"; var HidePrintDialog: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGenJournalLineInsert(var PostedCarteraDoc: Record "Posted Cartera Doc."; var GenJournalLine: Record "Gen. Journal Line"; var VATPostingSetup: Record "VAT Posting Setup"; var VendorLedgerEntry: Record "Vendor Ledger Entry"; var PostedPaymentOrder: Record "Posted Payment Order"; var BankAccount: Record "Bank Account")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePostedDocOnPostDataItem(var PostedCarteraDoc: Record "Posted Cartera Doc."; var PostedPaymentOrder: Record "Posted Payment Order"; var BgPoPostBuffer: Record "BG/PO Post. Buffer")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePostedDocOnPreDataItem(var PostedCarteraDoc: Record "Posted Cartera Doc."; var PostingDate: Date)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateInvoiceAccountNo(var PostedCarteraDoc: Record "Posted Cartera Doc."; var GenJournalLine: Record "Gen. Journal Line"; var VATPostingSetup: Record "VAT Posting Setup"; var VendorLedgerEntry: Record "Vendor Ledger Entry"; var FromJnl: Boolean; var ExistsNoRealVAT: Boolean; var PostedPaymentOrder: Record "Posted Payment Order")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeVendUnrealizedVAT2(var PostedCarteraDoc: Record "Posted Cartera Doc."; var GenJournalLine: Record "Gen. Journal Line"; var VendorLedgerEntry: Record "Vendor Ledger Entry"; var PostedPaymentOrder: Record "Posted Payment Order"; var BgPoPostBuffer: Record "BG/PO Post. Buffer")
    begin
    end;
}

