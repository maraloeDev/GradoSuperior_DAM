page 9036 "Bookkeeper Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Finance Cue";

    layout
    {
        area(content)
        {
            cuegroup(Payables)
            {
                Caption = 'Payables';
                field("Purchase Documents Due Today"; "Purchase Documents Due Today")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Vendor Ledger Entries";
                    ToolTip = 'Specifies the number of purchase invoices where you are late with payment.';
                }
                field("Vendors - Payment on Hold"; "Vendors - Payment on Hold")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Vendor List";
                    ToolTip = 'Specifies the number of vendor to whom your payment is on hold.';
                }
                field("Approved Purchase Orders"; "Approved Purchase Orders")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Purchase Order List";
                    ToolTip = 'Specifies the number of approved purchase orders.';
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
                    action("New Purchase Credit Memo")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Purchase Credit Memo';
                        RunObject = Page "Purchase Credit Memo";
                        RunPageMode = Create;
                        ToolTip = 'Create a new purchase credit memo so you can manage returned items to a vendor.';
                    }
                }
            }
            cuegroup(Receivables)
            {
                Caption = 'Receivables';
                field("SOs Pending Approval"; "SOs Pending Approval")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of sales orders that are pending approval.';
                }
                field("Overdue Sales Documents"; "Overdue Sales Documents")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Customer Ledger Entries";
                    ToolTip = 'Specifies the number of sales invoices where the customer is late with payment.';
                }
                field("Approved Sales Orders"; "Approved Sales Orders")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of approved sales orders.';
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
                    action("New Sales Credit Memo")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Sales Credit Memo';
                        RunObject = Page "Sales Credit Memo";
                        RunPageMode = Create;
                        ToolTip = 'Process a return or refund by creating a new sales credit memo.';
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
                    ToolTip = 'Specifies the receivables document that is associated with the bill group.';
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
            cuegroup("Cartera Payables")
            {
                Caption = 'Cartera Payables';
                field("Payable Documents"; "Payable Documents")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Payables Cartera Docs";
                    ToolTip = 'Specifies the payables document that is associated with the bill group.';
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
            cuegroup(Approvals)
            {
                Caption = 'Approvals';
                field("Requests Sent for Approval"; "Requests Sent for Approval")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Approval Entries";
                    ToolTip = 'Specifies requests for certain documents, cards, or journal lines that your approver must approve before you can proceed.';
                }
                field("Requests to Approve"; "Requests to Approve")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Requests to Approve";
                    ToolTip = 'Specifies requests for certain documents, cards, or journal lines that you must approve for other users before they can proceed.';
                }
            }
            cuegroup("Cash Management")
            {
                Caption = 'Cash Management';
                field("Non-Applied Payments"; "Non-Applied Payments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Reconciliation Journals';
                    DrillDownPageID = "Pmt. Reconciliation Journals";
                    Image = Cash;
                    ToolTip = 'Specifies a window to reconcile unpaid documents automatically with their related bank transactions by importing a bank statement feed or file. In the payment reconciliation journal, incoming or outgoing payments on your bank are automatically, or semi-automatically, applied to their related open customer or vendor ledger entries. Any open bank account ledger entries related to the applied customer or vendor ledger entries will be closed when you choose the Post Payments and Reconcile Bank Account action. This means that the bank account is automatically reconciled for payments that you post with the journal.';
                }

                actions
                {
                    action("New Payment Reconciliation Journal")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Payment Reconciliation Journal';
                        ToolTip = 'Reconcile unpaid documents automatically with their related bank transactions by importing bank a bank statement feed or file.';

                        trigger OnAction()
                        var
                            BankAccReconciliation: Record "Bank Acc. Reconciliation";
                        begin
                            BankAccReconciliation.OpenNewWorksheet
                        end;
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
            cuegroup(MissingSIIEntries)
            {
                Caption = 'Missing SII Entries';
                field("Missing SII Entries"; "Missing SII Entries")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Missing SII Entries';
                    DrillDownPageID = "Recreate Missing SII Entries";
                    ToolTip = 'Specifies that some posted documents were not transferred to SII.';

                    trigger OnDrillDown()
                    var
                        SIIRecreateMissingEntries: Codeunit "SII Recreate Missing Entries";
                    begin
                        SIIRecreateMissingEntries.ShowRecreateMissingEntriesPage;
                    end;
                }
                field("Days Since Last SII Check"; "Days Since Last SII Check")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Recreate Missing SII Entries";
                    Image = Calendar;
                    ToolTip = 'Specifies the number of days since the last check for missing SII entries.';
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
    end;

    var
        UserTaskManagement: Codeunit "User Task Management";

    local procedure CalculateCueFieldValues()
    var
        SIIRecreateMissingEntries: Codeunit "SII Recreate Missing Entries";
    begin
        if FieldActive("Missing SII Entries") then
            "Missing SII Entries" := SIIRecreateMissingEntries.GetMissingEntriesCount;
        if FieldActive("Days Since Last SII Check") then
            "Days Since Last SII Check" := SIIRecreateMissingEntries.GetDaysSinceLastCheck;
    end;
}

