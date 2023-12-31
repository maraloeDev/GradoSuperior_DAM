page 7000010 "Receivable Closed Cartera Docs"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Closed Receivables Docs';
    Editable = false;
    PageType = List;
    SourceTable = "Closed Cartera Doc.";
    SourceTableView = SORTING(Type, "Collection Agent", "Bill Gr./Pmt. Order No.", "Currency Code", Status, Redrawn)
                      WHERE(Type = CONST(Receivable));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the type of document in question.';
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the date this closed document was created and posted.';
                    Visible = false;
                }
                field("Due Date"; "Due Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the due date of this closed document.';
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the status of the closed document.';
                }
                field("Honored/Rejtd. at Date"; "Honored/Rejtd. at Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the date of payment or rejection of this closed document.';
                    Visible = false;
                }
                field("Payment Method Code"; "Payment Method Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the payment method code defined for the document number.';
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the document that is the source of this closed document.';
                }
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the closed bill.';
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the description associated with this closed document.';
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the currency code in which this closed document was generated.';
                    Visible = false;
                }
                field("Original Amount"; "Original Amount")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the initial amount of this closed document.';
                }
                field("Original Amount (LCY)"; "Original Amount (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the initial amount of this document, in LCY.';
                    Visible = false;
                }
                field("Remaining Amount"; "Remaining Amount")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the amount outstanding for this closed document to be fully applied.';
                }
                field("Remaining Amt. (LCY)"; "Remaining Amt. (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the amount outstanding, in order for this closed document to be fully settled.';
                    Visible = false;
                }
                field(Redrawn; Redrawn)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if this document, which has come due and is now rejected, has been recirculated.';
                }
                field(Place; Place)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if the company bank and customer bank are in the same area.';
                    Visible = false;
                }
                field("Account No."; "Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the account number of the customer/vendor associated with this closed document.';
                    Visible = false;
                }
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the ledger entry number associated with the posting of this closed document.';
                }
            }
        }
        area(factboxes)
        {
            part(Control1901421307; "Closed Docs Analysis LCY FB")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = Type = CONST(Receivable),
                              "Entry No." = FIELD("Entry No.");
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Docs.")
            {
                Caption = '&Docs.';
                action(Analysis)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Analysis';
                    Image = "Report";
                    ToolTip = 'View details about the related documents. First you define which document category and currency you want to analyze documents for.';

                    trigger OnAction()
                    begin
                        ClosedDoc.Copy(Rec);
                        PAGE.Run(PAGE::"Closed Documents Analysis", ClosedDoc);
                    end;
                }
                action(Redraw)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Redraw';
                    Ellipsis = true;
                    Image = RefreshVoucher;
                    ToolTip = 'Create a new copy of the old bill or order, with the possibility of creating it with a new, later due date and a different payment method.';

                    trigger OnAction()
                    begin
                        RedrawDocs();
                    end;
                }
                separator(Action1100000)
                {
                }
                action("Dime&nsions")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Dime&nsions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to journal lines to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        ShowDimensions;
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
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Find all entries and documents that exist for the document number and posting date on the selected entry or document.';

                trigger OnAction()
                begin
                    CarteraManagement.NavigateClosedDoc(Rec);
                end;
            }
            action("Redraw Receivables Bills")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Redraw Receivables Bills';
                Image = RefreshVoucher;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'View bills of type receivable that have been redrawn.';

                trigger OnAction()
                begin
                    RedrawDocs();
                end;
            }
        }
    }

    var
        Text1100000: Label 'Only bills can be redrawn.';
        Text1100001: Label 'Only receivable bills can be redrawn.';
        Text1100002: Label 'No bills have been found that can be redrawn. \';
        Text1100003: Label 'Please check that at least one rejected bill was selected.';
        ClosedDoc: Record "Closed Cartera Doc.";
        CustLedgEntry: Record "Cust. Ledger Entry";
        CarteraManagement: Codeunit CarteraManagement;

    [Scope('OnPrem')]
    procedure RedrawDocs()
    begin
        CurrPage.SetSelectionFilter(ClosedDoc);
        if not ClosedDoc.Find('=><') then
            exit;

        ClosedDoc.SetRange("Document Type", ClosedDoc."Document Type"::Bill);
        if not ClosedDoc.Find('-') then
            Error(
              Text1100000);

        ClosedDoc.SetRange(Type, ClosedDoc.Type::Receivable);
        if not ClosedDoc.Find('-') then
            Error(
              Text1100001);

        ClosedDoc.SetRange(Status, ClosedDoc.Status::Rejected);
        if not ClosedDoc.Find('-') then
            Error(
              Text1100002 +
              Text1100003);

        CustLedgEntry.Reset();
        repeat
            CustLedgEntry.Get(ClosedDoc."Entry No.");
            CustLedgEntry.Mark(true);
        until ClosedDoc.Next = 0;

        CustLedgEntry.MarkedOnly(true);
        REPORT.RunModal(REPORT::"Redraw Receivable Bills", true, false, CustLedgEntry);
    end;
}

