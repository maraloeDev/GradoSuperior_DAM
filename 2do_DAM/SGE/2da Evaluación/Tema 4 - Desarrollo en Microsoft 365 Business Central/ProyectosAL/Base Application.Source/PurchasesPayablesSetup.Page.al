page 460 "Purchases & Payables Setup"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Purchases & Payables Setup';
    DataCaptionExpression = '';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Purchases & Payables Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Calc. Inv. Discount"; "Calc. Inv. Discount")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Calc. Inv. and Pmt. Discount';
                    ToolTip = 'Specifies if invoice and payment discounts are automatically calculated with purchase documents.';
                }
                field("Calc. Inv. Disc. per VAT ID"; "Calc. Inv. Disc. per VAT ID")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the invoice discount is calculated according to VAT Identifier.';
                }
                field("Post Invoice Discount"; "Post Invoice Discount")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies to post the invoice discount to a separate account.';
                }
                field("Post Line Discount"; "Post Line Discount")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies to post the line discount to a separate account.';
                }
                field("Post Payment Discount"; "Post Payment Discount")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies to post the payment discount to a separate account.';
                }
                field("Invoice Rounding"; "Invoice Rounding")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that amounts are rounded for purchase invoices.';
                }
                field("Receipt on Invoice"; "Receipt on Invoice")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies that a posted receipt and a posted invoice are automatically created when you post an invoice.';
                }
                field("Return Shipment on Credit Memo"; "Return Shipment on Credit Memo")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies that a posted return shipment and a posted purchase credit memo are automatically created when you post a credit memo.';
                }
                field("Create Item from Item No."; "Create Item from Item No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if the system will suggest to create a new item when no item matches the number that you enter in the No. Field on purchase lines.';
                }
                field("Copy Vendor Name to Entries"; "Copy Vendor Name to Entries")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if you want the name on vendor cards to be copied to vendor ledger entries during posting.';
                }
                field("Ext. Doc. No. Mandatory"; "Ext. Doc. No. Mandatory")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if it is mandatory to enter an external document number in the External Document No. field on a purchase header or the External Document No. field on a general journal line.';
                }
                field("Same Ext. Doc. No. in Diff. FY"; "Same Ext. Doc. No. in Diff. FY")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if it is allowed to post documents with same value in the External Document No. field in different fiscal years.';
                }
                field("Correct. Doc. No. Mandatory"; "Correct. Doc. No. Mandatory")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if the document number needs to be corrected before the electronic payment is made.';
                }
                field("Allow VAT Difference"; "Allow VAT Difference")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies whether to allow the manual adjustment of VAT amounts in purchase documents.';
                }
                field("Price Calculation Method"; "Price Calculation Method")
                {
                    // Visibility should be turned on by an extension for Price Calculation
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the price calculation method that will be default for purchase transactions.';
                }
                field("Appln. between Currencies"; "Appln. between Currencies")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies whether it is allowed to apply vendor payments in different currencies. None: All entries involved in one application must be in the same currency. EMU: You can apply entries in euro and one of the old national currencies (for EMU countries/regions) to one another. All: You can apply entries in different currencies to one another. The entries can be in any currency.';
                }
                field("Copy Comments Blanket to Order"; "Copy Comments Blanket to Order")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies whether to copy comments from blanket purchase orders to purchase orders.';
                }
                field("Copy Comments Order to Invoice"; "Copy Comments Order to Invoice")
                {
                    ApplicationArea = Comments;
                    Importance = Additional;
                    ToolTip = 'Specifies whether to copy comments from purchase orders to purchase invoices.';
                }
                field("Copy Comments Order to Receipt"; "Copy Comments Order to Receipt")
                {
                    ApplicationArea = Comments;
                    Importance = Additional;
                    ToolTip = 'Specifies whether to copy comments from purchase orders to receipts.';
                }
                field("Copy Cmts Ret.Ord. to Cr. Memo"; "Copy Cmts Ret.Ord. to Cr. Memo")
                {
                    ApplicationArea = Comments;
                    Importance = Additional;
                    ToolTip = 'Specifies whether to copy comments from purchase return orders to purchase credit memos.';
                }
                field("Copy Cmts Ret.Ord. to Ret.Shpt"; "Copy Cmts Ret.Ord. to Ret.Shpt")
                {
                    ApplicationArea = Comments;
                    Importance = Additional;
                    ToolTip = 'Specifies that comments are copied from the purchase return order to the posted return shipment.';
                }
                field("Exact Cost Reversing Mandatory"; "Exact Cost Reversing Mandatory")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that a return transaction cannot be posted unless the Appl.-to Item Entry field on the purchase order line specifies an entry.';
                }
                field("Check Prepmt. when Posting"; "Check Prepmt. when Posting")
                {
                    ApplicationArea = Prepayments;
                    Importance = Additional;
                    ToolTip = 'Specifies that you cannot receive or invoice an order that has an unpaid prepayment amount.';
                }
                field("Prepmt. Auto Update Frequency"; "Prepmt. Auto Update Frequency")
                {
                    ApplicationArea = Prepayments;
                    ToolTip = 'Specifies how often the job must run that automatically updates the status of orders that are pending prepayment.';
                }
                field("Default Posting Date"; "Default Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies how to use the Posting Date field on purchase documents.';
                }
                field("Default Qty. to Receive"; "Default Qty. to Receive")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the default value that is inserted in the Qty. to Receive field in purchase order lines and in the Return Qty. to Ship field on purchase return order lines.';
                }
                field("Allow Document Deletion Before"; "Allow Document Deletion Before")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies if and when posted purchase documents can be deleted. If you enter a date, posted purchase documents with a posting date on or after this date cannot be deleted.';
                }
                field("Ignore Updated Addresses"; "Ignore Updated Addresses")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if changes to addresses made on purchase documents are copied to the vendor card. By default, changes are copied to the vendor card.';
                }
                field("Copy Line Descr. to G/L Entry"; "Copy Line Descr. to G/L Entry")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies that the description on document lines of type G/L Account will be carried to the resulting general ledger entries.';
                }
                field("Copy Inv. No. To Pmt. Ref."; "Copy Inv. No. To Pmt. Ref.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if the value of the Vendor Invoice No. field must be copied to the Payment Reference field during posting unless the Payment Reference field is not blank.';
                    Importance = Additional;
                }
            }
            group("Number Series")
            {
                Caption = 'Number Series';
                field("Vendor Nos."; "Vendor Nos.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to vendors.';
                }
                field("Quote Nos."; "Quote Nos.")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to purchase quotes.';
                }
                field("Blanket Order Nos."; "Blanket Order Nos.")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to blanket purchase orders.';
                }
                field("Order Nos."; "Order Nos.")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to purchase orders.';
                }
                field("Return Order Nos."; "Return Order Nos.")
                {
                    ApplicationArea = PurchReturnOrder;
                    Importance = Additional;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to new purchase return orders.';
                }
                field("Invoice Nos."; "Invoice Nos.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to purchase invoices.';
                }
                field("Posted Invoice Nos."; "Posted Invoice Nos.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to posted purchase invoices.';
                }
                field("Credit Memo Nos."; "Credit Memo Nos.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to purchase credit memos.';
                }
                field("Posted Credit Memo Nos."; "Posted Credit Memo Nos.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to posted purchase credit memos.';
                }
                field("Posted Receipt Nos."; "Posted Receipt Nos.")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to posted receipts.';
                }
                field("Posted Return Shpt. Nos."; "Posted Return Shpt. Nos.")
                {
                    ApplicationArea = PurchReturnOrder;
                    Importance = Additional;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to posted return shipments.';
                }
                field("Posted Prepmt. Inv. Nos."; "Posted Prepmt. Inv. Nos.")
                {
                    ApplicationArea = Prepayments;
                    Importance = Additional;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to posted purchase prepayment invoices.';
                }
                field("Posted Prepmt. Cr. Memo Nos."; "Posted Prepmt. Cr. Memo Nos.")
                {
                    ApplicationArea = Prepayments;
                    Importance = Additional;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to purchase prepayment credit memos.';
                }
                field("Price List Nos."; "Price List Nos.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to purchase price lists.';
                }
            }
            group("Background Posting")
            {
                Caption = 'Background Posting';
                field("Post with Job Queue"; "Post with Job Queue")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies if you use job queues to post purchase documents in the background.';
                }
                field("Post & Print with Job Queue"; "Post & Print with Job Queue")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies if you use job queues to post and print purchase documents in the background.';
                }
                field("Job Queue Category Code"; "Job Queue Category Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the code for the category of the job queue that you want to associate with background posting.';
                }
                field("Notify On Success"; "Notify On Success")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies if a notification is sent when posting and printing is successfully completed.';
                }
                field("Report Output Type"; "Report Output Type")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the output of the report that will be scheduled with a job queue entry when the Post and Print with Job Queue check box is selected.';
                }
            }
            group(Archiving)
            {
                Caption = 'Archiving';
                field("Archive Quotes"; "Archive Quotes")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if you want to archive purchase quotes when they are deleted.';
                }
                field("Archive Orders"; "Archive Orders")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if you want to archive purchase orders when they are deleted.';
                }
                field("Archive Blanket Orders"; "Archive Blanket Orders")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if you want to archive purchase blanket orders when they are deleted.';
                }
                field("Archive Return Orders"; "Archive Return Orders")
                {
                    ApplicationArea = PurchReturnOrder;
                    ToolTip = 'Specifies if you want to archive purchase return orders when they are deleted.';
                }
            }
            group("Default Accounts")
            {
                Caption = 'Default Accounts';
                field("Debit Acc. for Non-Item Lines"; "Debit Acc. for Non-Item Lines")
                {
                    ApplicationArea = Suite;
                    Caption = 'Default Debit Account for Non-Item Lines';
                    ToolTip = 'Specifies the G/L account that is automatically inserted on purchase lines of type debit that are created from electronic documents when the incoming document line does not contain an identifiable item. Any incoming document line that does not have a GTIN or the vendor''s item number will be converted to a purchase line of type G/L Account, and the No. field on the purchase line will contain the account that you select in the G/L Account for Non-Item Lines field.';
                }
                field("Credit Acc. for Non-Item Lines"; "Credit Acc. for Non-Item Lines")
                {
                    ApplicationArea = Suite;
                    Caption = 'Default Credit Account for Non-Item Lines';
                    ToolTip = 'Specifies the G/L account that is automatically inserted on purchase lines of type credit that are created from electronic documents when the incoming document line does not contain an identifiable item. Any incoming document line that does not have a GTIN or the vendor''s item number will be converted to a purchase line of type G/L Account, and the No. field on the purchase line will contain the account that you select in the G/L Account for Non-Item Lines field.';
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
            action("Vendor Posting Groups")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendor Posting Groups';
                Image = Vendor;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Vendor Posting Groups";
                ToolTip = 'Set up the posting groups to select from when you set up vendor cards to link business transactions made for the vendor with the appropriate account in the general ledger.';
            }
            action("Incoming Documents Setup")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Incoming Documents Setup';
                Image = Documents;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Incoming Documents Setup";
                ToolTip = 'Set up the journal template that will be used to create general journal lines from electronic external documents, such as invoices from your vendors on email.';
            }
        }
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

