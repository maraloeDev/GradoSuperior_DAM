page 317 "VAT Statement"
{
    ApplicationArea = VAT;
    AutoSplitKey = true;
    Caption = 'VAT Statements';
    MultipleNewLines = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = "VAT Statement Line";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            field(CurrentStmtName; CurrentStmtName)
            {
                ApplicationArea = VAT;
                Caption = 'Name';
                Lookup = true;
                ToolTip = 'Specifies the name of the VAT statement.';

                trigger OnLookup(var Text: Text): Boolean
                begin
                    exit(VATStmtManagement.LookupName(GetRangeMax("Statement Template Name"), CurrentStmtName, Text));
                end;

                trigger OnValidate()
                begin
                    VATStmtManagement.CheckName(CurrentStmtName, Rec);
                    CurrentStmtNameOnAfterValidate;
                end;
            }
            repeater(Control1)
            {
                ShowCaption = false;
                field("Row No."; "Row No.")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies a number that identifies the line.';
                }
                field(Description; Description)
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies a description of the VAT statement line.';
                }
                field(Type; Type)
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies what the VAT statement line will include.';
                }
                field("Account Totaling"; "Account Totaling")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies an account interval or a series of account numbers.';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        GLAccountList: Page "G/L Account List";
                    begin
                        GLAccountList.LookupMode(true);
                        if not (GLAccountList.RunModal = ACTION::LookupOK) then
                            exit(false);
                        Text := GLAccountList.GetSelectionFilter;
                        exit(true);
                    end;
                }
                field("Gen. Posting Type"; "Gen. Posting Type")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies the type of transaction.';
                }
                field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies the VAT specification of the involved item or resource to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field("Amount Type"; "Amount Type")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies if the VAT statement line shows the VAT amounts or the base amounts on which the VAT is calculated.';
                }
                field("Row Totaling"; "Row Totaling")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies a row-number interval or a series of row numbers.';
                }
                field("Calculate with"; "Calculate with")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies whether amounts on the VAT statement will be calculated with their original sign or with the sign reversed.';
                }
                field(Control22; Print)
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies whether the VAT statement line will be printed on the report that contains the finished VAT statement.';
                }
                field("Print with"; "Print with")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies whether amounts on the VAT statement will be printed with their original sign or with the sign reversed.';
                }
                field("New Page"; "New Page")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies whether a new page should begin immediately after this line when the VAT statement is printed. To start a new page after this line, place a check mark in the field.';
                }
                field(Box; Box)
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies the number on the packaging box that the VAT statement applies to.';
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
            group("VAT &Statement")
            {
                Caption = 'VAT &Statement';
                Image = Suggest;
                action("P&review")
                {
                    ApplicationArea = VAT;
                    Caption = 'P&review';
                    Image = View;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "VAT Statement Preview";
                    RunPageLink = "Statement Template Name" = FIELD("Statement Template Name"),
                                  Name = FIELD("Statement Name");
                    ToolTip = 'Preview the VAT statement report.';
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(Print)
                {
                    ApplicationArea = VAT;
                    Caption = 'Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Print the information in the window. A print request window opens where you can specify what to include on the print-out.';

                    trigger OnAction()
                    var
                        VATStmtLine: Record "VAT Statement Line";
                        VATStmtName: Record "VAT Statement Name";
                    begin
                        VATStmtName.SetRange(Name, CurrentStmtName);
                        if not VATStmtName.Find('-') then
                            Error(Text10700);
                        if VATStmtName."Template Type" = VATStmtName."Template Type"::"One Column Report" then begin
                            VATStmtLine.SetRange("Statement Template Name", "Statement Template Name");
                            VATStmtLine.SetRange("Statement Name", "Statement Name");
                            REPORT.Run(REPORT::"VAT Statement", true, false, VATStmtLine);
                        end else begin
                            ReportPrint.PrintVATStmtLine(Rec);
                        end;
                    end;
                }
                action("Calc. and Post VAT Settlement")
                {
                    ApplicationArea = VAT;
                    Caption = 'Calculate and Post VAT Settlement';
                    Ellipsis = true;
                    Image = SettleOpenTransactions;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Report "Calc. and Post VAT Settlement";
                    ToolTip = 'Close open VAT entries and transfers purchase and sales VAT amounts to the VAT settlement account.';
                }
            }
            group("Telematic VAT")
            {
                Caption = 'Telematic VAT';
                Image = ElectronicDoc;
                action("Design txt file")
                {
                    ApplicationArea = VAT;
                    Caption = 'Design txt file';
                    Ellipsis = true;
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = false;
                    RunObject = Page "Transference Format";
                    RunPageLink = "VAT Statement Name" = FIELD("Statement Name");
                    ToolTip = 'Define the layout of an XML file from the Transference Format template for your company''s VAT statements.';
                }
                action("Generate TXT File")
                {
                    ApplicationArea = VAT;
                    Caption = 'Generate txt file';
                    Ellipsis = true;
                    Image = CreateDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Create a text file for the selected VAT declaration according to the transference format template defined for the VAT declaration. A window will show all the lines in the template where the Ask check box was selected, so that you can insert or modify the content of the values to be included in the file for these elements.';

                    trigger OnAction()
                    begin
                        TeleVATDecl.CurrentAsign(Rec);
                        TeleVATDecl.RunModal;
                        Clear(TeleVATDecl);
                    end;
                }
                action("Design XML file")
                {
                    ApplicationArea = VAT;
                    Caption = 'Design XML file';
                    Ellipsis = true;
                    Image = XMLFile;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "XML Transference Format";
                    RunPageLink = "VAT Statement Name" = FIELD("Statement Name");
                    ToolTip = 'Define the layout of a text file from the Transference Format template for your company''s VAT statements.';
                }
                action("Generate XML File")
                {
                    ApplicationArea = VAT;
                    Caption = 'Generate XML file';
                    Ellipsis = true;
                    Image = CreateXMLFile;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Create an XML file for the selected VAT declaration according to the XML Transference Format template defined for the VAT declaration. After accepting, you will be shown a new window with all the lines in the template where the Ask check box was selected, so that you can insert or modify the content of the values to be included in the file for these elements. When you finally accept this window, the text file is created in the specified path.';

                    trigger OnAction()
                    begin
                        TeleVATDeclXML.CurrentAssign(Rec);
                        TeleVATDeclXML.RunModal;
                        Clear(TeleVATDeclXML);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        StmtSelected: Boolean;
    begin
        OpenedFromBatch := ("Statement Name" <> '') and ("Statement Template Name" = '');
        if OpenedFromBatch then begin
            CurrentStmtName := "Statement Name";
            VATStmtManagement.OpenStmt(CurrentStmtName, Rec);
            exit;
        end;
        VATStmtManagement.TemplateSelection(PAGE::"VAT Statement", Rec, StmtSelected);
        if not StmtSelected then
            Error('');
        VATStmtManagement.OpenStmt(CurrentStmtName, Rec);
    end;

    var
        ReportPrint: Codeunit "Test Report-Print";
        VATStmtManagement: Codeunit VATStmtManagement;
        CurrentStmtName: Code[10];
        OpenedFromBatch: Boolean;
        TeleVATDecl: Report "Telematic VAT Declaration";
        Text10700: Label 'The Statement name does not exist';
        TeleVATDeclXML: Report "XML VAT Declaration";

    local procedure CurrentStmtNameOnAfterValidate()
    begin
        CurrPage.SaveRecord;
        VATStmtManagement.SetName(CurrentStmtName, Rec);
        CurrPage.Update(false);
    end;
}

