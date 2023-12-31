table 7000022 "Closed Payment Order"
{
    Caption = 'Closed Payment Order';
    DrillDownPageID = "Closed Payment Orders List";
    LookupPageID = "Closed Payment Orders List";

    fields
    {
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Bank Account No."; Code[20])
        {
            Caption = 'Bank Account No.';
            TableRelation = "Bank Account";
        }
        field(4; "Bank Account Name"; Text[100])
        {
            CalcFormula = Lookup ("Bank Account".Name WHERE("No." = FIELD("Bank Account No.")));
            Caption = 'Bank Account Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Posting Description"; Text[100])
        {
            Caption = 'Posting Description';
        }
        field(8; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(9; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
        }
        field(10; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(11; Comment; Boolean)
        {
            CalcFormula = Exist ("BG/PO Comment Line" WHERE("BG/PO No." = FIELD("No."),
                                                            Type = FILTER(Payable)));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(15; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(16; "Amount Grouped"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum ("Closed Cartera Doc."."Amount for Collection" WHERE("Bill Gr./Pmt. Order No." = FIELD("No."),
                                                                                   "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                                   "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                                   Status = FIELD("Status Filter"),
                                                                                   Type = CONST(Payable)));
            Caption = 'Amount Grouped';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Status Filter"; Option)
        {
            Caption = 'Status Filter';
            Editable = false;
            FieldClass = FlowFilter;
            OptionCaption = ',Honored,Rejected';
            OptionMembers = ,Honored,Rejected;
        }
        field(20; "Closing Date"; Date)
        {
            Caption = 'Closing Date';
        }
        field(29; "Payment Order Expenses Amt."; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Payment Order Expenses Amt.';
        }
        field(33; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = false;
            TableRelation = Currency;
        }
        field(35; "Amount Grouped (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Closed Cartera Doc."."Amt. for Collection (LCY)" WHERE("Bill Gr./Pmt. Order No." = FIELD("No."),
                                                                                       "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                                       "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                                       Status = FIELD("Status Filter"),
                                                                                       Type = CONST(Payable)));
            Caption = 'Amount Grouped (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Bank Account No.", "Posting Date")
        {
            SumIndexFields = "Payment Order Expenses Amt.";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        ClosedDoc.SetRange("Bill Gr./Pmt. Order No.", "No.");
        ClosedDoc.DeleteAll();

        BGPOCommentLine.SetRange("BG/PO No.", "No.");
        BGPOCommentLine.DeleteAll();
    end;

    var
        Text1100000: Label 'untitled';
        ClosedPmtOrd: Record "Closed Payment Order";
        ClosedDoc: Record "Closed Cartera Doc.";
        BGPOCommentLine: Record "BG/PO Comment Line";

    [Scope('OnPrem')]
    procedure PrintRecords(ShowRequestForm: Boolean)
    var
        CarteraReportSelection: Record "Cartera Report Selections";
    begin
        with ClosedPmtOrd do begin
            Copy(Rec);
            CarteraReportSelection.SetRange(Usage, CarteraReportSelection.Usage::"Closed Payment Order");
            CarteraReportSelection.SetFilter("Report ID", '<>0');
            CarteraReportSelection.Find('-');
            repeat
                REPORT.RunModal(CarteraReportSelection."Report ID", ShowRequestForm, false, ClosedPmtOrd);
            until CarteraReportSelection.Next = 0;
        end;
    end;

    procedure Caption(): Text
    begin
        if "No." = '' then
            exit(Text1100000);
        CalcFields("Bank Account Name");
        exit(StrSubstNo('%1 %2', "No.", "Bank Account Name"));
    end;
}

