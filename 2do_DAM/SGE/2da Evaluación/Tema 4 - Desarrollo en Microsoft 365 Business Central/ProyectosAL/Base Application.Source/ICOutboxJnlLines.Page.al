page 612 "IC Outbox Jnl. Lines"
{
    Caption = 'IC Outbox Jnl. Lines';
    DataCaptionFields = "IC Partner Code";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "IC Outbox Jnl. Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("IC Partner Code"; "IC Partner Code")
                {
                    ApplicationArea = Intercompany;
                    ToolTip = 'Specifies the code of the intercompany partner that the transaction is related to if the entry was created from an intercompany transaction.';
                    Visible = false;
                }
                field("Account Type"; "Account Type")
                {
                    ApplicationArea = Intercompany;
                    ToolTip = 'Specifies the purpose of the account. Newly created accounts are automatically assigned the Posting account type, but you can change this.';
                }
                field("Account No."; "Account No.")
                {
                    ApplicationArea = Intercompany;
                    ToolTip = 'Specifies the account number that the entry on the journal line will be posted to.';
                }
                field(Description; Description)
                {
                    ApplicationArea = Intercompany;
                    ToolTip = 'Specifies a description for the transaction on the journal line.';
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Intercompany;
                    ToolTip = 'Specifies the total amount (including VAT) that the journal line consists of.';
                }
                field("VAT Amount"; "VAT Amount")
                {
                    ApplicationArea = Intercompany;
                    ToolTip = 'Specifies the amount of VAT that is included in the total amount.';
                    Visible = false;
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Intercompany;
                    ToolTip = 'Specifies the currency that is used on the entry.';
                    Visible = false;
                }
                field("Due Date"; "Due Date")
                {
                    ApplicationArea = Intercompany;
                    ToolTip = 'Specifies when the related invoice must be paid.';
                }
                field("Payment Discount %"; "Payment Discount %")
                {
                    ApplicationArea = Intercompany;
                    ToolTip = 'Specifies the payment discount percentage that is granted if you pay on or before the date entered in the Pmt. Discount Date field. The discount percentage is specified in the Payment Terms Code field.';
                    Visible = false;
                }
                field("Payment Discount Date"; "Payment Discount Date")
                {
                    ApplicationArea = Intercompany;
                    ToolTip = 'Specifies the last date on which the amount in the journal line must be paid for the order to qualify for a payment discount if the line is an invoice journal line.';
                    Visible = false;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Intercompany;
                    ToolTip = 'Specifies how many units of the item are specified on the line.';
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
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("&Dimensions")
                {
                    ApplicationArea = Dimensions;
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    RunObject = Page "IC Inbox/Outbox Jnl. Line Dim.";
                    RunPageLink = "Table ID" = CONST(415),
                                  "Transaction No." = FIELD("Transaction No."),
                                  "IC Partner Code" = FIELD("IC Partner Code"),
                                  "Transaction Source" = FIELD("Transaction Source"),
                                  "Line No." = FIELD("Line No.");
                    ShortCutKey = 'Alt+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to journal lines to distribute costs and analyze transaction history.';
                }
            }
        }
    }
}

