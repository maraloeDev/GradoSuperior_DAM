page 9073 "Small Business Owner Act."
{
    Caption = 'Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "SB Owner Cue";

    layout
    {
        area(content)
        {
            cuegroup(Sales)
            {
                Caption = 'Sales';
                field("Released Sales Quotes"; "Released Sales Quotes")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Sales Quotes";
                    ToolTip = 'Specifies the number of released sales quotes that are displayed in the Small Business Owner Cue on the Role Center. The documents are filtered by today''s date.';
                }
                field("Open Sales Orders"; "Open Sales Orders")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of open sales orders that are displayed in the Small Business Owner Cue on the Role Center. The documents are filtered by today''s date.';
                }
                field("Released Sales Orders"; "Released Sales Orders")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of released sales orders that are displayed in the Small Business Owner Cue on the Role Center. The documents are filtered by today''s date.';
                }

                actions
                {
                    action("New Customer")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Customer';
                        RunObject = Page "Customer Card";
                        RunPageMode = Create;
                        ToolTip = 'Register a new customer.';
                    }
                    action("New Sales Order")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Sales Order';
                        RunObject = Page "Sales Order";
                        RunPageMode = Create;
                        ToolTip = 'Sell goods or services to a customer.';
                    }
                }
            }
            cuegroup(Purchase)
            {
                Caption = 'Purchase';
                field("Released Purchase Orders"; "Released Purchase Orders")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Purchase Order List";
                    ToolTip = 'Specifies the number of released purchase orders that are displayed in the Small Business Owner Cue on the Role Center. The documents are filtered by today''s date.';
                }

                actions
                {
                    action("New Purchase Order")
                    {
                        ApplicationArea = Suite;
                        Caption = 'New Purchase Order';
                        RunObject = Page "Purchase Order";
                        RunPageMode = Create;
                        ToolTip = 'Purchase goods or services from a vendor.';
                    }
                }
            }
            cuegroup(Receivables)
            {
                Caption = 'Receivables';
                field("Overdue Sales Documents"; "Overdue Sales Documents")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Customer Ledger Entries";
                    ToolTip = 'Specifies the number of overdue sales invoices that are displayed in the Small Business Owner Cue on the Role Center. The documents are filtered by today''s date.';
                }
                field(SOShippedNotInvoiced; SOShippedNotInvoicedCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'SOs Shipped Not Invoiced';
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of shipped and not invoiced sales orders that are displayed in the Small Business Owner Cue on the Role Center. The documents are filtered by today''s date.';

                    trigger OnDrillDown()
                    begin
                        ShowSalesOrdersShippedNotInvoiced;
                    end;
                }
                field("Customers - Blocked"; "Customers - Blocked")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Customer List";
                    ToolTip = 'Specifies the number of blocked customers that are displayed in the Small Business Owner Cue on the Role Center. The documents are filtered by today''s date.';
                }

                actions
                {
                    action("Edit Cash Receipt Journal")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Edit Cash Receipt Journal';
                        RunObject = Page "Cash Receipt Journal";
                        ToolTip = 'Register received payments in a cash receipt journal that may already contain journal lines.';
                    }
                    action(Navigate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Navigate';
                        RunObject = Page Navigate;
                        ToolTip = 'Find all entries and documents that exist for the document number and posting date on the selected entry or document.';
                    }
                }
            }
            cuegroup("Cartera Receivables")
            {
                Caption = 'Cartera Receivables';
                field("Receivable Documents"; "Receivable Documents")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Receivables Cartera Docs";
                    ToolTip = 'Specifies the receivables document associated with the bill group.';
                }
                field("Posted Receivable Documents"; "Posted Receivable Documents")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Posted Cartera Documents";
                    ToolTip = 'Specifies the receivables documents that have been posted.';
                }

                actions
                {
                    action("New Bill Group")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Bill Group';
                        RunObject = Page "Bill Groups";
                        RunPageMode = Create;
                        ToolTip = 'Create a new group of receivables documents for submission to the bank for electronic collection.';
                    }
                    action("Posted Bill Groups List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted Bill Groups List';
                        RunObject = Page "Posted Bill Groups List";
                        ToolTip = 'View the list of posted bill groups. When a bill group has been posted, the related documents are available for settlement, rejection, or recirculation.';
                    }
                    action("Posted Bill Group Select.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted Bill Group Select.';
                        RunObject = Page "Posted Bill Group Select.";
                        ToolTip = 'View or edit where ledger entries are posted when you post a bill group.';
                    }
                }
            }
            cuegroup(Payables)
            {
                Caption = 'Payables';
                field("Purchase Documents Due Today"; "Purchase Documents Due Today")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Vendor Ledger Entries";
                    ToolTip = 'Specifies the number of purchase invoices that are displayed in the Order Cue in the Business Manager Role Center. The documents are filtered by today''s date.';
                }
                field("Vendors - Payment on Hold"; "Vendors - Payment on Hold")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Vendor List";
                    ToolTip = 'Specifies the number of vendors with payments on hold that are displayed in the Small Business Owner Cue on the Role Center. The documents are filtered by today''s date.';
                }

                actions
                {
                    action("Edit Payment Journal")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Edit Payment Journal';
                        RunObject = Page "Payment Journal";
                        ToolTip = 'Pay your vendors by filling the payment journal automatically according to payments due, and potentially export all payment to your bank for automatic processing.';
                    }
                    action("Edit Bank Acc. Reconciliation")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Edit Bank Acc. Reconciliation';
                        RunObject = Page "Bank Acc. Reconciliation List";
                        ToolTip = 'Reconcile bank transactions with bank account ledger entries to ensure that your bank account in Dynamics 365 reflects your actual liquidity.';
                    }
                }
            }
            cuegroup("Cartera Payables")
            {
                Caption = 'Cartera Payables';
                field("Payable Documents"; "Payable Documents")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Payables Cartera Docs";
                    ToolTip = 'Specifies the payables document associated with the bill group.';
                }
                field("Posted Payable Documents"; "Posted Payable Documents")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Posted Cartera Documents";
                    ToolTip = 'Specifies the payables documents that have been posted.';
                }

                actions
                {
                    action("New Payment Order")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Payment Order';
                        RunObject = Page "Payment Orders";
                        RunPageMode = Create;
                        ToolTip = 'Create a new order for payables documents for submission to the bank for electronic payment.';
                    }
                    action("Posted Payment Orders List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted Payment Orders List';
                        RunObject = Page "Posted Payment Orders List";
                        ToolTip = 'View posted payment orders that represent payables to submit to the bank as a file for electronic payment.';
                    }
                    action("Posted Payment Orders Select.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted Payment Orders Select.';
                        RunObject = Page "Posted Payment Orders Select.";
                        ToolTip = 'View or edit where ledger entries are posted when you post a payment order.';
                    }
                }
            }
            cuegroup("My User Tasks")
            {
                Caption = 'My User Tasks';
                field("UserTaskManagement.GetMyPendingUserTasksCount"; UserTaskManagement.GetMyPendingUserTasksCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Pending User Tasks';
                    Image = Checklist;
                    ToolTip = 'Specifies the number of pending tasks that are assigned to you or to a group that you are a member of.';

                    trigger OnDrillDown()
                    var
                        UserTaskList: Page "User Task List";
                    begin
                        UserTaskList.SetPageToShowMyPendingUserTasks;
                        UserTaskList.Run;
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
        CalculateCueFieldValues;
    end;

    trigger OnOpenPage()
    begin
        Reset;
        if not Get then begin
            Init;
            Insert;
        end;
        SetFilter("Due Date Filter", '<=%1', WorkDate);
        SetFilter("Overdue Date Filter", '<%1', WorkDate);
        SetFilter("User ID Filter", UserId);

        CalculateCueFieldValues;
    end;

    var
        UserTaskManagement: Codeunit "User Task Management";
        SOShippedNotInvoicedCount: Integer;

    local procedure CalculateCueFieldValues()
    begin
        SOShippedNotInvoicedCount := CountSalesOrdersShippedNotInvoiced;
    end;
}

