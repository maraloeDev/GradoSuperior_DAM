page 5186 "Interaction Template Setup"
{
    ApplicationArea = RelationshipMgmt;
    Caption = 'Interaction Template Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Interaction Template Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("E-Mails"; "E-Mails")
                {
                    ApplicationArea = Basic, Suite, RelationshipMgmt;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the code of the interaction template to use when recording e-mails as interactions.';
                }
                field("E-Mail Draft"; "E-Mail Draft")
                {
                    ApplicationArea = Basic, Suite, RelationshipMgmt;
                    ToolTip = 'Specifies the code of the interaction template to use when recording e-mail draft as interactions.';
                }
                field("Cover Sheets"; "Cover Sheets")
                {
                    ApplicationArea = Basic, Suite, RelationshipMgmt;
                    ToolTip = 'Specifies the code of the interaction template to use when recording cover sheets as interactions.';
                }
                field("Outg. Calls"; "Outg. Calls")
                {
                    ApplicationArea = Basic, Suite, RelationshipMgmt;
                    Caption = 'Outgoing Calls';
                    ToolTip = 'Specifies the code of the interaction template to use when recording outgoing phone calls as interactions.';
                }
                field("Meeting Invitation"; "Meeting Invitation")
                {
                    ApplicationArea = Basic, Suite, RelationshipMgmt;
                    ToolTip = 'Specifies the code of the interaction template to use when recording meeting invitations as interactions.';
                }
            }
            group(Sales)
            {
                Caption = 'Sales';
                field("Sales Invoices"; "Sales Invoices")
                {
                    ApplicationArea = Basic, Suite, RelationshipMgmt;
                    Caption = 'Invoices';
                    ToolTip = 'Specifies the code of the interaction template to use when recording sales invoices as interactions.';
                }
                field("Sales Cr. Memo"; "Sales Cr. Memo")
                {
                    ApplicationArea = Basic, Suite, RelationshipMgmt;
                    Caption = 'Credit Memos';
                    ToolTip = 'Specifies the code of the interaction template to use when recording sales credit memos as interactions.';
                }
                field("Sales Ord. Cnfrmn."; "Sales Ord. Cnfrmn.")
                {
                    ApplicationArea = Basic, Suite, RelationshipMgmt;
                    Caption = 'Order Confirmations';
                    ToolTip = 'Specifies the code of the interaction template to use when recording sales order confirmations as interactions.';
                }
                field("Sales Quotes"; "Sales Quotes")
                {
                    ApplicationArea = Basic, Suite, RelationshipMgmt;
                    Caption = 'Quotes';
                    ToolTip = 'Specifies the code of the interaction template to use when recording sales quotes as interactions.';
                }
                field("Sales Blnkt. Ord"; "Sales Blnkt. Ord")
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    Caption = 'Blanket Orders';
                    ToolTip = 'Specifies the code of the interaction template to use when recording sales blanket orders as interactions.';
                }
                field("Sales Shpt. Note"; "Sales Shpt. Note")
                {
                    ApplicationArea = Suite;
                    Caption = 'Shipment Notes';
                    ToolTip = 'Specifies the code of the interaction template to use when recording sales shipment notes as interactions.';
                }
                field("Sales Statement"; "Sales Statement")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Statements';
                    ToolTip = 'Specifies the code of the interaction template to use when recording sales statements as interactions.';
                }
                field("Sales Rmdr."; "Sales Rmdr.")
                {
                    ApplicationArea = Suite;
                    Caption = 'Reminders';
                    ToolTip = 'Specifies the code of the interaction template to use when recording sales reminders as interactions.';
                }
                field("Sales Return Order"; "Sales Return Order")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Return Orders';
                    ToolTip = 'Specifies the code of the interaction template to use when recording sales return orders as interactions.';
                }
                field("Sales Return Receipt"; "Sales Return Receipt")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Return Receipts';
                    ToolTip = 'Specifies the code of the interaction template to use when recording sales return receipts as interactions.';
                }
                field("Sales Finance Charge Memo"; "Sales Finance Charge Memo")
                {
                    ApplicationArea = Suite;
                    Caption = 'Finance Charge Memos';
                    ToolTip = 'Specifies the code of the interaction template to use when recording sales finance charge memos as interactions.';
                }
            }
            group(Purchases)
            {
                Caption = 'Purchases';
                field("Purch Invoices"; "Purch Invoices")
                {
                    ApplicationArea = Basic, Suite, RelationshipMgmt;
                    Caption = 'Invoices';
                    ToolTip = 'Specifies the code of the interaction template to use when recording purchase invoices as interactions.';
                }
                field("Purch Cr Memos"; "Purch Cr Memos")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Credit Memos';
                    ToolTip = 'Specifies the code of the interaction template to use when recording purchase credit memos as interactions.';
                }
                field("Purch. Orders"; "Purch. Orders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Orders';
                    ToolTip = 'Specifies the code of the interaction template to use when recording purchase orders as interactions.';
                }
                field("Purch. Quotes"; "Purch. Quotes")
                {
                    ApplicationArea = Suite;
                    Caption = 'Quotes';
                    ToolTip = 'Specifies the code of the interaction template to use when recording purchase quotes as interactions.';
                }
                field("Purch Blnkt Ord"; "Purch Blnkt Ord")
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    Caption = 'Blanket Orders';
                    ToolTip = 'Specifies the code of the interaction template to use when recording purchase blanket orders as interactions.';
                }
                field("Purch. Rcpt."; "Purch. Rcpt.")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Receipts';
                    ToolTip = 'Specifies the code of the interaction template to use when recording purchase receipts as interactions.';
                }
                field("Purch. Return Shipment"; "Purch. Return Shipment")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Return Shipments';
                    ToolTip = 'Specifies the code of the interaction template to use when recording purchase return shipments as interactions.';
                }
                field("Purch. Return Ord. Cnfrmn."; "Purch. Return Ord. Cnfrmn.")
                {
                    ApplicationArea = PurchReturnOrder;
                    Caption = 'Return Order Confirmations';
                    ToolTip = 'Specifies the code of the interaction template to use when recording purchase return order confirmations as interactions.';
                }
            }
            group(Service)
            {
                Caption = 'Service';
                field("Serv Ord Create"; "Serv Ord Create")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Service Order Create';
                    ToolTip = 'Specifies the code of the interaction template to use when recording the creation of service orders as interactions.';
                }
                field("Service Contract"; "Service Contract")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Contracts';
                    ToolTip = 'Specifies the code of the interaction template to use when recording service contracts as interactions.';
                }
                field("Service Contract Quote"; "Service Contract Quote")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Contract Quotes';
                    ToolTip = 'Specifies the code of the interaction template to use when recording service contract quotes as interactions.';
                }
                field("Service Quote"; "Service Quote")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Quotes';
                    ToolTip = 'Specifies the code of the interaction template to use when recording service quotes as interactions.';
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

    trigger OnOpenPage()
    begin
        Reset;
        if not Get then begin
            Init;
            Insert;
        end;
    end;
}

