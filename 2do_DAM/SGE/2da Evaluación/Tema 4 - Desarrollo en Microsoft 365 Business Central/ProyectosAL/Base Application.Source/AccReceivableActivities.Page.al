page 9034 "Acc. Receivable Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Finance Cue";

    layout
    {
        area(content)
        {
            cuegroup(Payments)
            {
                Caption = 'Payments';
                field("Overdue Sales Documents"; "Overdue Sales Documents")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Customer Ledger Entries";
                    ToolTip = 'Specifies the number of sales invoices where the customer is late with payment.';
                }
                field("Sales Return Orders - All"; "Sales Return Orders - All")
                {
                    ApplicationArea = SalesReturnOrder;
                    DrillDownPageID = "Sales Return Order List";
                    ToolTip = 'Specifies the number of sales return orders that are displayed in the Finance Cue on the Role Center. The documents are filtered by today''s date.';
                }
                field("Customers - Blocked"; "Customers - Blocked")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Customer List";
                    ToolTip = 'Specifies the number of customer that are blocked from further sales.';
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
            cuegroup("Document Approvals")
            {
                Caption = 'Document Approvals';
                field("SOs Pending Approval"; "SOs Pending Approval")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of sales orders that are pending approval.';
                }
                field("Approved Sales Orders"; "Approved Sales Orders")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of approved sales orders.';
                }
            }
            cuegroup(Cartera)
            {
                Caption = 'Cartera';
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

