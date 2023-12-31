table 7000003 "Posted Cartera Doc."
{
    Caption = 'Posted Cartera Doc.';
    DrillDownPageID = "Posted Cartera Documents";
    LookupPageID = "Posted Cartera Documents";

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
        field(7; "Bank Account No."; Code[20])
        {
            Caption = 'Bank Account No.';
            TableRelation = "Bank Account";
        }
        field(8; "Dealing Type"; Option)
        {
            Caption = 'Dealing Type';
            Editable = false;
            OptionCaption = 'Collection,Discount';
            OptionMembers = Collection,Discount;
        }
        field(9; "Amount for Collection"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount for Collection';
        }
        field(10; "Amt. for Collection (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amt. for Collection (LCY)';
        }
        field(11; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(12; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
        }
        field(13; Accepted; Option)
        {
            Caption = 'Accepted';
            OptionCaption = 'Not Required,Yes';
            OptionMembers = "Not Required",Yes;
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
            TableRelation = IF (Type = CONST(Receivable)) "Posted Bill Group"."No."
            ELSE
            IF (Type = CONST(Payable)) "Posted Payment Order"."No.";
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
            TableRelation = "Customer Bank Account".Code WHERE("Customer No." = FIELD("Account No."));
        }
        field(21; "Pmt. Address Code"; Code[10])
        {
            Caption = 'Pmt. Address Code';
            TableRelation = "Customer Pmt. Address".Code WHERE("Customer No." = FIELD("Account No."));
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
        field(24; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Open,Honored,Rejected';
            OptionMembers = Open,Honored,Rejected;
        }
        field(25; "Honored/Rejtd. at Date"; Date)
        {
            Caption = 'Honored/Rejtd. at Date';
        }
        field(26; "Remaining Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Remaining Amount';
        }
        field(27; "Remaining Amt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Remaining Amt. (LCY)';
        }
        field(28; Redrawn; Boolean)
        {
            Caption = 'Redrawn';
        }
        field(29; "Original Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Original Amount';
            Editable = false;
        }
        field(30; "Original Amt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Original Amt. (LCY)';
            Editable = false;
        }
        field(40; "Document Type"; Option)
        {
            Caption = 'Document Type';
            Editable = false;
            OptionCaption = 'Invoice,,Bill';
            OptionMembers = Invoice,,Bill;
        }
        field(42; Factoring; Option)
        {
            Caption = 'Factoring';
            Editable = false;
            OptionCaption = ' ,Unrisked,Risked';
            OptionMembers = " ",Unrisked,Risked;
        }
        field(46; Adjusted; Boolean)
        {
            Caption = 'Adjusted';
        }
        field(47; ReAdjusted; Boolean)
        {
            Caption = 'ReAdjusted';
        }
        field(48; "Adjusted Amount"; Decimal)
        {
            Caption = 'Adjusted Amount';
        }
        field(49; "From Journal"; Boolean)
        {
            Caption = 'From Journal';
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
        key(Key3; "Bill Gr./Pmt. Order No.", Status, "Category Code", Redrawn, "Due Date")
        {
            SumIndexFields = "Amount for Collection", "Remaining Amount", "Amt. for Collection (LCY)", "Remaining Amt. (LCY)";
        }
        key(Key4; "Bank Account No.", "Dealing Type", Status, "Category Code", Redrawn, "Honored/Rejtd. at Date", "Due Date", "Document Type")
        {
            SumIndexFields = "Amount for Collection", "Remaining Amount", "Amt. for Collection (LCY)", "Remaining Amt. (LCY)";
        }
        key(Key5; "Bank Account No.", "Dealing Type", Status, Redrawn, "Due Date")
        {
            SumIndexFields = "Amount for Collection", "Remaining Amount", "Amt. for Collection (LCY)", "Remaining Amt. (LCY)";
        }
        key(Key6; "Bank Account No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Dealing Type", Status, "Category Code", Redrawn, "Honored/Rejtd. at Date", "Due Date")
        {
            Enabled = false;
            SumIndexFields = "Amount for Collection", "Remaining Amount", "Amt. for Collection (LCY)", "Remaining Amt. (LCY)";
        }
        key(Key7; "Bank Account No.", "Bill Gr./Pmt. Order No.", Status, "Category Code", Redrawn, "Due Date", "Document Type")
        {
            SumIndexFields = "Amount for Collection", "Remaining Amount", "Amt. for Collection (LCY)", "Remaining Amt. (LCY)";
        }
        key(Key8; "Bank Account No.", "Dealing Type", Status, Redrawn, "Due Date", "Document Type")
        {
            SumIndexFields = "Amount for Collection", "Remaining Amount", "Amt. for Collection (LCY)", "Remaining Amt. (LCY)";
        }
        key(Key9; Type, "Bill Gr./Pmt. Order No.", "Global Dimension 1 Code", "Global Dimension 2 Code")
        {
            SumIndexFields = "Amount for Collection", "Remaining Amount", "Amt. for Collection (LCY)", "Remaining Amt. (LCY)";
        }
        key(Key10; Type, "Original Document No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Text1100000: Label 'untitled';

    procedure Caption(): Text
    var
        BankAcc: Record "Bank Account";
    begin
        if "Bank Account No." = '' then
            exit(Text1100000);
        BankAcc.Get("Bank Account No.");
        exit(StrSubstNo(BankAcc.Name));
    end;

    [Scope('OnPrem')]
    procedure ShowDimensions()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimMgt.ShowDimensionSet("Dimension Set ID", StrSubstNo('%1 %2 %3', Type, "Entry No.", "Document No."));
    end;
}

