page 558 "Analysis View Entries"
{
    ApplicationArea = Dimensions;
    Caption = 'Analysis View Entries';
    Editable = false;
    PageType = List;
    SourceTable = "Analysis View Entry";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Analysis View Code"; "Analysis View Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the analysis view.';
                }
                field("Business Unit Code"; "Business Unit Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the code for the business unit that the analysis view is based on.';
                }
                field("Account No."; "Account No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the account that the analysis entry comes from.';
                }
                field("Account Source"; "Account Source")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies an account that you can use as a filter to define what is displayed in the Analysis by Dimensions window. ';
                }
                field("Cash Flow Forecast No."; "Cash Flow Forecast No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a number for the cash flow forecast.';
                }
                field("Old G/L Account No."; "Old G/L Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code that is used to identify the old general ledger account.';
                    Visible = false;
                }
                field("Dimension 1 Value Code"; "Dimension 1 Value Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the dimension value you selected for the analysis view dimension that you defined as Dimension 1 on the analysis view card.';
                }
                field("Dimension 2 Value Code"; "Dimension 2 Value Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the dimension value you selected for the analysis view dimension that you defined as Dimension 2 on the analysis view card.';
                }
                field("Dimension 3 Value Code"; "Dimension 3 Value Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the dimension value you selected for the analysis view dimension that you defined as Dimension 3 on the analysis view card.';
                }
                field("Dimension 4 Value Code"; "Dimension 4 Value Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the dimension value you selected for the analysis view dimension that you defined as Dimension 4 on the analysis view card.';
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the entry''s posting date.';
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the amount of the analysis view budget entry.';

                    trigger OnDrillDown()
                    begin
                        DrillDown;
                    end;
                }
                field("Debit Amount"; "Debit Amount")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the total of the ledger entries that represent debits.';
                }
                field("Credit Amount"; "Credit Amount")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the total of the ledger entries that represent credits.';
                }
                field("Add.-Curr. Amount"; "Add.-Curr. Amount")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies (in the additional reporting currency) the VAT difference that arises when you make a correction to a VAT amount on a sales or purchase document.';
                    Visible = false;
                }
                field("Add.-Curr. Debit Amount"; "Add.-Curr. Debit Amount")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies, in the additional reporting currency, the amount of the debit entry.';
                    Visible = false;
                }
                field("Add.-Curr. Credit Amount"; "Add.-Curr. Credit Amount")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies, in the additional reporting currency, the amount of the credit entry.';
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        if "Analysis View Code" <> xRec."Analysis View Code" then;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if "Analysis View Code" <> xRec."Analysis View Code" then;
    end;
}

