page 7000034 "Posted Bill Gr. Maturity Lines"
{
    Caption = 'Lines';
    PageType = ListPart;
    SourceTable = Date;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Editable = false;
                ShowCaption = false;
                field("Period Start"; "Period Start")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the starting date of the period that you want to view.';
                }
                field("Period Name"; "Period Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the period shown on the line.';
                }
                field(DocAmount; DocAmount)
                {
                    ApplicationArea = Basic, Suite;
                    AutoFormatExpression = PostedBillGr."Currency Code";
                    AutoFormatType = 1;
                    Caption = 'Amount';
                    DrillDown = true;
                    ToolTip = 'Specifies the amount for the posted bill group for the period.';

                    trigger OnDrillDown()
                    begin
                        ShowDocEntries;
                    end;
                }
                field(DocAmountLCY; DocAmountLCY)
                {
                    ApplicationArea = Basic, Suite;
                    AutoFormatType = 1;
                    Caption = 'Amount (LCY)';
                    DrillDown = true;
                    ToolTip = 'Specifies the amount for the posted bill group for the period.';

                    trigger OnDrillDown()
                    begin
                        ShowDocEntries;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        SetDateFilter;
        if PostedBillGr."No." <> '' then begin
            PostedBillGr.CalcFields("Amount Grouped", "Amount Grouped (LCY)");
            DocAmount := PostedBillGr."Amount Grouped";
            DocAmountLCY := PostedBillGr."Amount Grouped (LCY)";
        end else begin
            DocAmount := 0;
            DocAmountLCY := 0;
        end;
    end;

    trigger OnFindRecord(Which: Text): Boolean
    begin
        exit(PeriodFormManagement.FindDate(Which, Rec, PeriodLength));
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        exit(PeriodFormManagement.NextDate(Steps, Rec, PeriodLength));
    end;

    trigger OnOpenPage()
    begin
        Reset;
    end;

    var
        PostedBillGr: Record "Posted Bill Group";
        PostedDoc: Record "Posted Cartera Doc.";
        PeriodFormManagement: Codeunit PeriodFormManagement;
        PeriodLength: Option Day,Week,Month,Quarter,Year,Period;
        AmountType: Option "Net Change","Balance at Date";
        DocAmount: Decimal;
        DocAmountLCY: Decimal;

    [Scope('OnPrem')]
    procedure Set(var NewPostedBillGr: Record "Posted Bill Group"; NewPeriodLength: Integer; NewAmountType: Option "Net Change","Balance at Date")
    begin
        PostedBillGr.Copy(NewPostedBillGr);
        PeriodLength := NewPeriodLength;
        AmountType := NewAmountType;
        CurrPage.Update(false);
    end;

    [Scope('OnPrem')]
    procedure SetDateFilter()
    begin
        if AmountType = AmountType::"Net Change" then
            PostedBillGr.SetRange("Due Date Filter", "Period Start", "Period End")
        else
            PostedBillGr.SetRange("Due Date Filter", 0D, "Period End");
    end;

    local procedure ShowDocEntries()
    begin
        SetDateFilter;
        PostedDoc.SetRange("Bill Gr./Pmt. Order No.", PostedBillGr."No.");
        PostedDoc.SetRange("Collection Agent", PostedDoc."Collection Agent"::Bank);
        PostedDoc.SetFilter("Due Date", PostedBillGr.GetFilter("Due Date Filter"));
        PostedDoc.SetFilter("Global Dimension 1 Code", PostedBillGr.GetFilter("Global Dimension 1 Filter"));
        PostedDoc.SetFilter("Global Dimension 2 Code", PostedBillGr.GetFilter("Global Dimension 2 Filter"));
        PostedDoc.SetFilter("Category Code", PostedBillGr.GetFilter("Category Filter"));
        PAGE.RunModal(0, PostedDoc);
    end;
}

