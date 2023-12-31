table 7000002 "Cartera Doc."
{
    Caption = 'Cartera Doc.';
    DrillDownPageID = "Cartera Documents";
    LookupPageID = "Cartera Documents";
    Permissions = TableData "Cartera Doc." = rm;

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Receivable,Payable';
            OptionMembers = Receivable,Payable;
        }
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(9; "Remaining Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Remaining Amount';
        }
        field(10; "Remaining Amt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Remaining Amt. (LCY)';
        }
        field(11; "Due Date"; Date)
        {
            Caption = 'Due Date';

            trigger OnValidate()
            var
                DocEdit: Codeunit "Document-Edit";
            begin
                CheckDueDate;
                DocEdit.EditDueDate(Rec);

                Modify;
                ResetNoPrinted;
            end;
        }
        field(12; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
        }
        field(13; Accepted; Option)
        {
            Caption = 'Accepted';
            OptionCaption = 'Not Required,Yes,No';
            OptionMembers = "Not Required",Yes,No;
        }
        field(14; Place; Boolean)
        {
            Caption = 'Place';
        }
        field(15; "Collection Agent"; Option)
        {
            Caption = 'Collection Agent';
            OptionCaption = 'Direct,Bank';
            OptionMembers = Direct,Bank;
        }
        field(16; "Bill Gr./Pmt. Order No."; Code[20])
        {
            Caption = 'Bill Gr./Pmt. Order No.';
            TableRelation = IF (Type = CONST(Receivable)) "Bill Group"."No."
            ELSE
            IF (Type = CONST(Payable)) "Payment Order"."No.";
        }
        field(17; "Category Code"; Code[10])
        {
            Caption = 'Category Code';
            TableRelation = "Category Code";
        }
        field(18; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = IF (Type = CONST(Receivable)) Customer
            ELSE
            IF (Type = CONST(Payable)) Vendor;
        }
        field(19; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(20; "Cust./Vendor Bank Acc. Code"; Code[20])
        {
            Caption = 'Cust./Vendor Bank Acc. Code';
            TableRelation = IF (Type = CONST(Receivable)) "Customer Bank Account".Code WHERE("Customer No." = FIELD("Account No."))
            ELSE
            IF (Type = CONST(Payable)) "Vendor Bank Account".Code WHERE("Vendor No." = FIELD("Account No."));

            trigger OnValidate()
            begin
                ResetNoPrinted;
            end;
        }
        field(21; "Pmt. Address Code"; Code[10])
        {
            Caption = 'Pmt. Address Code';
            TableRelation = IF (Type = CONST(Receivable)) "Customer Pmt. Address".Code WHERE("Customer No." = FIELD("Account No."))
            ELSE
            IF (Type = CONST(Payable)) "Vendor Pmt. Address".Code WHERE("Vendor No." = FIELD("Account No."));

            trigger OnValidate()
            begin
                ResetNoPrinted;
            end;
        }
        field(22; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(23; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(29; "Original Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Original Amount';
        }
        field(30; "Original Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Original Amount (LCY)';
        }
        field(40; "Document Type"; Option)
        {
            Caption = 'Document Type';
            Editable = false;
            OptionCaption = 'Invoice,,Bill';
            OptionMembers = Invoice,,Bill;
        }
        field(45; "On Hold"; Boolean)
        {
            CalcFormula = Exist ("Vendor Ledger Entry" WHERE("On Hold" = FILTER(<> ''),
                                                             "Entry No." = FIELD("Entry No.")));
            Caption = 'On Hold';
            FieldClass = FlowField;
        }
        field(46; Adjusted; Boolean)
        {
            Caption = 'Adjusted';
        }
        field(48; "Adjusted Amount"; Decimal)
        {
            Caption = 'Adjusted Amount';
        }
        field(49; "From Journal"; Boolean)
        {
            Caption = 'From Journal';
        }
        field(50; "Elect. Pmts Exported"; Boolean)
        {
            Caption = 'Elect. Pmts Exported';
        }
        field(51; "Export File Name"; Text[30])
        {
            Caption = 'Export File Name';
        }
        field(52; "Transfer Type"; Option)
        {
            Caption = 'Transfer Type';
            OptionCaption = 'National,International,Special';
            OptionMembers = National,International,Special;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;

            trigger OnValidate()
            var
                DimMgt: Codeunit DimensionManagement;
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Global Dimension 2 Code");
            end;
        }
        field(1200; "Direct Debit Mandate ID"; Code[35])
        {
            Caption = 'Direct Debit Mandate ID';
            TableRelation = "SEPA Direct Debit Mandate".ID WHERE("Customer No." = FIELD("Account No."));

            trigger OnValidate()
            begin
                CODEUNIT.Run(CODEUNIT::"Document-Edit", Rec);
                Modify;
                ResetNoPrinted;
            end;
        }
        field(10700; "Original Document No."; Code[20])
        {
            Caption = 'Original Document No.';
        }
    }

    keys
    {
        key(Key1; Type, "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; Type, "Document No.")
        {
        }
        key(Key3; Type, "Collection Agent", "Bill Gr./Pmt. Order No.", "Currency Code", Accepted, "Due Date", Place)
        {
            SumIndexFields = "Remaining Amount", "Remaining Amt. (LCY)";
        }
        key(Key4; Type, "Bill Gr./Pmt. Order No.", "Category Code", "Currency Code", Accepted, "Due Date")
        {
            SumIndexFields = "Remaining Amount", "Remaining Amt. (LCY)";
        }
        key(Key5; Type, "Bill Gr./Pmt. Order No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Currency Code", Accepted, "Due Date", Place)
        {
            Enabled = false;
            SumIndexFields = "Remaining Amount", "Remaining Amt. (LCY)";
        }
        key(Key6; Type, "Bill Gr./Pmt. Order No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Category Code", "Currency Code", Accepted, "Due Date")
        {
            Enabled = false;
            SumIndexFields = "Remaining Amount", "Remaining Amt. (LCY)";
        }
        key(Key7; Type, "Bill Gr./Pmt. Order No.", "Category Code", "Currency Code", "Account No.", "Due Date", "Document Type")
        {
            SumIndexFields = "Remaining Amount", "Remaining Amt. (LCY)";
        }
        key(Key8; Type, "Bill Gr./Pmt. Order No.", "Category Code", "Currency Code", Accepted, "Account No.", "Due Date", "Document Type")
        {
            SumIndexFields = "Remaining Amount", "Remaining Amt. (LCY)";
        }
        key(Key9; Type, "Collection Agent", "Bill Gr./Pmt. Order No.", "Currency Code", Accepted, "Due Date", Place, "Document Type")
        {
            SumIndexFields = "Remaining Amount", "Remaining Amt. (LCY)";
        }
        key(Key10; Type, "Bill Gr./Pmt. Order No.", "Collection Agent", "Due Date", "Global Dimension 1 Code", "Global Dimension 2 Code", "Category Code", "Posting Date", "Document No.", Accepted, "Currency Code", "Document Type", "Payment Method Code")
        {
            SumIndexFields = "Remaining Amount", "Remaining Amt. (LCY)";
        }
        key(Key11; Type, "Bill Gr./Pmt. Order No.", "Transfer Type")
        {
        }
        key(Key12; Type, "Bill Gr./Pmt. Order No.", "Transfer Type", "Account No.")
        {
        }
        key(Key13; Type, "Original Document No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        CarteraManagement: Codeunit CarteraManagement;
    begin
        TestField("Elect. Pmts Exported", false);
        SetRange(Type, Type);
        SetRange("Entry No.", "Entry No.");
        case Type of
            Type::Payable:
                CarteraManagement.RemovePayableDocs(Rec);
            Type::Receivable:
                CarteraManagement.RemoveReceivableDocs(Rec);
        end;
    end;

    trigger OnInsert()
    begin
        if Type = Type::Payable then
            ElectPmtMgmt.GetTransferType("Account No.", "Remaining Amount", "Transfer Type", false);
    end;

    trigger OnModify()
    begin
        TestField("Elect. Pmts Exported", false);
    end;

    trigger OnRename()
    begin
        TestField("Elect. Pmts Exported", false);
    end;

    var
        BillGr: Record "Bill Group";
        PmtOrd: Record "Payment Order";
        ElectPmtMgmt: Codeunit "Elect. Pmts Management";
        Text001: Label '%1 is more than the legal limit of %2 days after the document date %3 for the original document';

    [Scope('OnPrem')]
    procedure ResetNoPrinted()
    begin
        if "Bill Gr./Pmt. Order No." <> '' then
            if Type = Type::Receivable then begin
                BillGr.Get("Bill Gr./Pmt. Order No.");
                BillGr."No. Printed" := 0;
                BillGr.Modify();
            end else begin
                PmtOrd.Get("Bill Gr./Pmt. Order No.");
                PmtOrd."No. Printed" := 0;
                PmtOrd.Modify();
            end;
    end;

    [Scope('OnPrem')]
    procedure ShowDimensions()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimMgt.ShowDimensionSet("Dimension Set ID", StrSubstNo('%1 %2 %3', Type, "Entry No.", "Document No."));
    end;

    [Scope('OnPrem')]
    procedure CheckDueDate()
    var
        InvoiceSplitPayment: Codeunit "Invoice-Split Payment";
        DocumentDate: Date;
        MaxNoOfDaysTillDueDate: Integer;
    begin
        GetDocumentDates(DocumentDate, MaxNoOfDaysTillDueDate);

        if not InvoiceSplitPayment.CheckDueDate("Due Date", DocumentDate, MaxNoOfDaysTillDueDate) then
            FieldError("Due Date", StrSubstNo(Text001, "Due Date", MaxNoOfDaysTillDueDate, DocumentDate));
    end;

    local procedure GetDocumentDates(var DocumentDate: Date; var MaxNoOfDaysTillDueDate: Integer)
    var
        PaymentTerms: Record "Payment Terms";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        ServiceInvoiceHeader: Record "Service Invoice Header";
        PurchInvHeader: Record "Purch. Inv. Header";
    begin
        case Type of
            Type::Receivable:
                begin
                    if SalesInvoiceHeader.Get("Document No.") then begin
                        PaymentTerms.Get(SalesInvoiceHeader."Payment Terms Code");
                        DocumentDate := SalesInvoiceHeader."Document Date";
                    end else
                        if ServiceInvoiceHeader.Get("Document No.") then begin
                            PaymentTerms.Get(ServiceInvoiceHeader."Payment Terms Code");
                            DocumentDate := ServiceInvoiceHeader."Document Date";
                        end;
                end;
            Type::Payable:
                if PurchInvHeader.Get("Document No.") then begin
                    PaymentTerms.Get(PurchInvHeader."Payment Terms Code");
                    DocumentDate := PurchInvHeader."Document Date";
                end;
        end;

        MaxNoOfDaysTillDueDate := PaymentTerms."Max. No. of Days till Due Date";
    end;

    [Scope('OnPrem')]
    procedure UpdatePaymentMethodCode(DocumentNo: Code[20]; AccountNo: Code[20]; BillNo: Code[20]; PaymentMethodCode: Code[10])
    var
        CarteraDoc: Record "Cartera Doc.";
    begin
        with CarteraDoc do begin
            SetRange("Document No.", DocumentNo);
            SetRange("Account No.", AccountNo);
            if BillNo <> '' then begin
                SetRange("Document Type", "Document Type"::Bill);
                SetRange("No.", BillNo);
            end else
                SetRange("Document Type", "Document Type"::Invoice);
            if FindFirst and ("Bill Gr./Pmt. Order No." = '') then begin
                Validate("Payment Method Code", PaymentMethodCode);
                Modify(true);
            end;
        end;
    end;
}

