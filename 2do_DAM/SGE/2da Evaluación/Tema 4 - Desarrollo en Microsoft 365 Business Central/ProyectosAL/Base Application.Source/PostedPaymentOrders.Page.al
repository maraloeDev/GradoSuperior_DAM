page 7000054 "Posted Payment Orders"
{
    Caption = 'Posted Payment Orders';
    DataCaptionExpression = Caption;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Posted Payment Order";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the number of this posted payment order.';
                }
                field("Bank Account No."; "Bank Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number or code of the bank where the posted payment order was delivered.';
                }
                field("Bank Account Name"; "Bank Account Name")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the name associated with the bank code or bank number where the posted payment order was delivered.';
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the payment order posting date.';
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the currency code associated with this posted payment order.';
                }
                field("Amount Grouped"; "Amount Grouped")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the grouped amount for this posted payment order.';
                }
                field("Remaining Amount"; "Remaining Amount")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the pending amounts left to pay for documents that are part of this posted payment order.';
                }
                field("Amount Grouped (LCY)"; "Amount Grouped (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the grouped amount for this posted payment order.';
                }
                field("Remaining Amount (LCY)"; "Remaining Amount (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the pending amounts yet to be paid for the documents associated with this posted payment order.';
                }
            }
            part(Docs; "Docs. in Posted PO Subform")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Bill Gr./Pmt. Order No." = FIELD("No.");
                SubPageView = SORTING("Bill Gr./Pmt. Order No.")
                              WHERE(Type = CONST(Payable));
            }
            group(Expenses)
            {
                Caption = 'Expenses';
                field("Payment Order Expenses Amt."; "Payment Order Expenses Amt.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the amount to be paid for payable document expenses.';
                }
            }
            group(Auditing)
            {
                Caption = 'Auditing';
                field("Reason Code"; "Reason Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies why the entry is created. When reason codes are assigned to journal line or sales and purchase documents, all entries with a reason code will be marked during posting.';
                }
                field("No. Printed"; "No. Printed")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number of printed copies of this posted payment order.';
                }
            }
        }
        area(factboxes)
        {
            part(Control1901420407; "Post. PO Analysis LCY Fact Box")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No.");
                Visible = true;
            }
            part(Control1903433407; "Post. PO Analysis Non LCY FB")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No.");
                Visible = true;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Pmt. O&rd.")
            {
                Caption = 'Pmt. O&rd.';
                action("Co&mments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "BG/PO Comment Sheet";
                    RunPageLink = "BG/PO No." = FIELD("No."),
                                  Type = CONST(Payable);
                    ToolTip = 'View or create a comment.';
                }
                separator(Action20)
                {
                }
                action(Analysis)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Analysis';
                    Enabled = true;
                    Image = "Report";
                    RunObject = Page "Post. Payment Orders Analysis";
                    RunPageLink = "No." = FIELD("No."),
                                  "Due Date Filter" = FIELD("Due Date Filter"),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                  "Category Filter" = FIELD("Category Filter");
                    ToolTip = 'View details about the related documents. First you define which document category and currency you want to analyze documents for.';
                }
                separator(Action58)
                {
                }
                action(Listing)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Listing';
                    Ellipsis = true;
                    Enabled = true;
                    Image = List;
                    Promoted = true;
                    PromotedCategory = "Report";
                    ToolTip = 'View detailed information about the posted bill group or payment order.';

                    trigger OnAction()
                    begin
                        if Find then begin
                            PostedPmtOrd.Copy(Rec);
                            PostedPmtOrd.SetRecFilter;
                            REPORT.Run(REPORT::"Posted Payment Order Listing", true, false, PostedPmtOrd);
                        end;
                    end;
                }
            }
        }
        area(processing)
        {
            action("&Navigate")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Navigate';
                Enabled = true;
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Find all entries and documents that exist for the document number and posting date on the selected entry or document.';

                trigger OnAction()
                var
                    Option: Integer;
                begin
                    Navigate.SetDoc("Posting Date", "No.");
                    Navigate.Run;
                end;
            }
            action("Page Posted Payment Orders Maturity Process")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Payment Orders Maturity';
                Image = DocumentsMaturity;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Posted Payment Orders Maturity";
                RunPageLink = "No." = FIELD("No."),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                              "Category Filter" = FIELD("Category Filter");
                ToolTip = 'View the posted document lines that have matured. Maturity information can be viewed by period start date.';
            }
        }
    }

    var
        PostedPmtOrd: Record "Posted Payment Order";
        Navigate: Page Navigate;
}

