report 6631 "Return Order Confirmation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './ReturnOrderConfirmation.rdlc';
    Caption = 'Return Order Confirmation';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST("Return Order"));
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Sales Return Order';
            column(No_SalesHdr; "No.")
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(ReturnOrderConfirmCopyText; StrSubstNo(Text004, CopyText))
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CustAddr6; CustAddr[6])
                    {
                    }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfoEmail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoVATRegistrationNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(BilltoCustomerNo_SalesHdr; "Sales Header"."Bill-to Customer No.")
                    {
                    }
                    column(DocDate_SalesHdr; Format("Sales Header"."Document Date", 0, 4))
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegNo_SalesHdr; "Sales Header"."VAT Registration No.")
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(No1_SalesHdr; "Sales Header"."No.")
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YourRef_SalesHdr; "Sales Header"."Your Reference")
                    {
                    }
                    column(CustAddr7; CustAddr[7])
                    {
                    }
                    column(CustAddr8; CustAddr[8])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(PricesInclVAT_SalesHdr; "Sales Header"."Prices Including VAT")
                    {
                    }
                    column(PricesInclVAT_SalesHdrCaption; "Sales Header".FieldCaption("Prices Including VAT"))
                    {
                    }
                    column(PageCaption; StrSubstNo(Text005, ''))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PricesInclVATYesNo; Format("Sales Header"."Prices Including VAT"))
                    {
                    }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankNameCaption; BankNameCaptionLbl)
                    {
                    }
                    column(BankAccNoCaption; BankAccNoCaptionLbl)
                    {
                    }
                    column(ReturnOrderNoCaption; ReturnOrderNoCaptionLbl)
                    {
                    }
                    column(DocumentDateCaption; DocumentDateCaptionLbl)
                    {
                    }
                    column(HomePageCaption; HomePageCaptionLbl)
                    {
                    }
                    column(UnitPriceCaption; UnitPriceCaptionLbl)
                    {
                    }
                    column(DiscPercentCaption; DiscPercentCaptionLbl)
                    {
                    }
                    column(AmountCaption; AmountCaptionLbl)
                    {
                    }
                    column(EmailCaption; EmailCaptionLbl)
                    {
                    }
                    column(AllowInvoiceDiscCaption; AllowInvoiceDiscCaptionLbl)
                    {
                    }
                    column(TotalAmount; TotalAmount)
                    {
                        AutoFormatExpression = "Sales Header"."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(InvDiscAmtCaption; InvDiscAmtCaptionLbl)
                    {
                    }
                    column(SubtotalCaption; SubtotalCaptionLbl)
                    {
                    }
                    column(PaymentDiscReceivedAmtCaption; PaymentDiscReceivedAmtCaptionLbl)
                    {
                    }
                    column(PaymentDisconVATCaption; PaymentDisconVATCaptionLbl)
                    {
                    }
                    column(TotalExclVATText; TotalExclVATText)
                    {
                    }
                    column(VATAmtLineVATAmtText; VATAmountLine.VATAmountText)
                    {
                    }
                    column(VATAmount; VATAmount)
                    {
                        AutoFormatExpression = "Sales Header"."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(TotalInclVATText; TotalInclVATText)
                    {
                    }
                    column(TotalAmountInclVAT; TotalAmountInclVAT)
                    {
                        AutoFormatExpression = "Sales Header"."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(BilltoCustomerNo_SalesHdrCaption; "Sales Header".FieldCaption("Bill-to Customer No."))
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(Number_DimensionLoop1; DimensionLoop1.Number)
                        {
                        }
                        column(HeaderDimensionsCaption; HeaderDimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not DimSetEntry1.FindSet then
                                    CurrReport.Break();
                            end else
                                if not Continue then
                                    CurrReport.Break();

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1, %2 %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimSetEntry1.Next = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break();
                        end;
                    }
                    dataitem("Sales Line"; "Sales Line")
                    {
                        DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");

                        trigger OnPreDataItem()
                        begin
                            CurrReport.Break();
                        end;
                    }
                    dataitem(RoundLoop; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(TypeInt; TypeInt)
                        {
                        }
                        column(SalesLineNo; SalesLineNo)
                        {
                        }
                        column(SalesLineLineNo; SalesLineLineNo)
                        {
                        }
                        column(LineAmt_SalesLine; SalesLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Desc_SalesLine; "Sales Line".Description)
                        {
                        }
                        column(Desc_SalesLineCaption; "Sales Line".FieldCaption(Description))
                        {
                        }
                        column(No2_SalesLine; "Sales Line"."No.")
                        {
                        }
                        column(No2_SalesLineCaption; "Sales Line".FieldCaption("No."))
                        {
                        }
                        column(Qty_SalesLine; "Sales Line".Quantity)
                        {
                        }
                        column(Qty_SalesLineCaption; "Sales Line".FieldCaption(Quantity))
                        {
                        }
                        column(UnitofMeasure_SalesLine; "Sales Line"."Unit of Measure")
                        {
                        }
                        column(UnitofMeasure_SalesLineCaption; "Sales Line".FieldCaption("Unit of Measure"))
                        {
                        }
                        column(UnitPrice_SalesLine; "Sales Line"."Unit Price")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 2;
                        }
                        column(LineDisc_SalesLine; "Sales Line"."Line Discount %")
                        {
                        }
                        column(AllowInvDisc_SalesLine; "Sales Line"."Allow Invoice Disc.")
                        {
                        }
                        column(VATIdentifier_SalesLine; "Sales Line"."VAT Identifier")
                        {
                        }
                        column(VATIdentifier_SalesLineCaption; "Sales Line".FieldCaption("VAT Identifier"))
                        {
                        }
                        column(AllowInvDisc1_SalesLine; Format("Sales Line"."Allow Invoice Disc."))
                        {
                        }
                        column(InvDiscAmt_SalesLine; -SalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PmtDiscGivenAmt_SalesLine; -SalesLine."Pmt. Discount Amount")
                        {
                            AutoFormatType = 1;
                        }
                        column(SalesLineLineAmtSalesLineInvDiscAmtSalesLinePmtDiscGnAmt; SalesLine."Line Amount" - SalesLine."Inv. Discount Amount" - SalesLine."Pmt. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATDiscountAmount; -VATDiscountAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATBaseDisc; "Sales Header"."VAT Base Discount %")
                        {
                        }
                        column(VATBaseAmount; VATBaseAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalSubTotal; TotalSubTotal)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInvoiceDiscountAmount; TotalInvoiceDiscountAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                            column(DimText1; DimText)
                            {
                            }
                            column(Number_DimensionLoop2; DimensionLoop2.Number)
                            {
                            }
                            column(LineDimensionsCaption; LineDimensionsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    if not DimSetEntry2.FindSet then
                                        CurrReport.Break();
                                end else
                                    if not Continue then
                                        CurrReport.Break();

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := StrSubstNo('%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                            '%1, %2 %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until DimSetEntry2.Next = 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not ShowInternalInfo then
                                    CurrReport.Break();

                                DimSetEntry2.SetRange("Dimension Set ID", "Sales Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then
                                SalesLine.Find('-')
                            else
                                SalesLine.Next;
                            "Sales Line" := SalesLine;

                            if (SalesLine.Type = SalesLine.Type::"G/L Account") and (not ShowInternalInfo) then begin
                                SalesLineNo := "Sales Line"."No.";
                                "Sales Line"."No." := '';
                            end;

                            TypeInt := "Sales Line".Type;
                            SalesLineLineNo := "Sales Line"."Line No.";
                            TotalSubTotal += "Sales Line"."Line Amount";
                            TotalInvoiceDiscountAmount -= "Sales Line"."Inv. Discount Amount";
                            TotalAmount += "Sales Line".Amount;
                        end;

                        trigger OnPostDataItem()
                        begin
                            SalesLine.DeleteAll();
                        end;

                        trigger OnPreDataItem()
                        begin
                            MoreLines := SalesLine.Find('+');
                            while MoreLines and (SalesLine.Description = '') and (SalesLine."Description 2" = '') and
                                  (SalesLine."No." = '') and (SalesLine.Quantity = 0) and
                                  (SalesLine.Amount = 0)
                            do
                                MoreLines := SalesLine.Next(-1) <> 0;
                            if not MoreLines then
                                CurrReport.Break();
                            SalesLine.SetRange("Line No.", 0, SalesLine."Line No.");
                            SetRange(Number, 1, SalesLine.Count);
                        end;
                    }
                    dataitem(VATCounter; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATAmtLineVATECBase; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmount; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineLineAmount; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscBaseAmount; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscAmtVATAmtLinePmtDiscGivenAmt; VATAmountLine."Invoice Discount Amount" + VATAmountLine."Pmt. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineECAmount; VATAmountLine."EC Amount")
                        {
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVAT; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATAmtLineEC; VATAmountLine."EC %")
                        {
                            AutoFormatType = 1;
                        }
                        column(VATPercentCaption; VATPercentCaptionLbl)
                        {
                        }
                        column(VATBaseCaption; VATBaseCaptionLbl)
                        {
                        }
                        column(VATAmountCaption; VATAmountCaptionLbl)
                        {
                        }
                        column(VATAmountSpecificationCaption; VATAmountSpecificationCaptionLbl)
                        {
                        }
                        column(InvDiscBaseAmtCaption; InvDiscBaseAmtCaptionLbl)
                        {
                        }
                        column(LineAmtCaption; LineAmtCaptionLbl)
                        {
                        }
                        column(InvandPmtDiscountsCaption; InvandPmtDiscountsCaptionLbl)
                        {
                        }
                        column(VATIdentifierCaption; VATIdentifierCaptionLbl)
                        {
                        }
                        column(ECCaption; ECCaptionLbl)
                        {
                        }
                        column(ECAmountCaption; ECAmountCaptionLbl)
                        {
                        }
                        column(TotalCaption; TotalCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            if (VATAmount = 0) and (VATAmountLine."VAT %" + VATAmountLine."EC %" = 0) then
                                CurrReport.Break();
                            SetRange(Number, 1, VATAmountLine.Count);
                        end;
                    }
                    dataitem(VATCounterLCY; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VALExchRate; VALExchRate)
                        {
                        }
                        column(VALSpecLCYHeader; VALSpecLCYHeader)
                        {
                        }
                        column(VALVATBaseLCY; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATAmountLCY; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVAT1; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier1; VATAmountLine."VAT Identifier")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);

                            VALVATBaseLCY := Round(CurrExchRate.ExchangeAmtFCYToLCY(
                                  "Sales Header"."Posting Date", "Sales Header"."Currency Code",
                                  VATAmountLine."VAT Base", "Sales Header"."Currency Factor"));
                            VALVATAmountLCY := Round(CurrExchRate.ExchangeAmtFCYToLCY(
                                  "Sales Header"."Posting Date", "Sales Header"."Currency Code",
                                  VATAmountLine."VAT Amount", "Sales Header"."Currency Factor"));
                        end;

                        trigger OnPreDataItem()
                        begin
                            if (not GLSetup."Print VAT specification in LCY") or
                               ("Sales Header"."Currency Code" = '') or
                               (VATAmountLine.GetTotalVATAmount = 0)
                            then
                                CurrReport.Break();

                            SetRange(Number, 1, VATAmountLine.Count);
                            Clear(VALVATBaseLCY);
                            Clear(VALVATAmountLCY);

                            if GLSetup."LCY Code" = '' then
                                VALSpecLCYHeader := Text007 + Text008
                            else
                                VALSpecLCYHeader := Text007 + Format(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency("Sales Header"."Posting Date", "Sales Header"."Currency Code", 1);
                            VALExchRate := StrSubstNo(Text009, CurrExchRate."Relational Exch. Rate Amount", CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(SelltoCustNo_SalesHeader; "Sales Header"."Sell-to Customer No.")
                        {
                        }
                        column(ShipToAddr8; ShipToAddr[8])
                        {
                        }
                        column(ShipToAddr7; ShipToAddr[7])
                        {
                        }
                        column(ShipToAddr6; ShipToAddr[6])
                        {
                        }
                        column(ShipToAddr5; ShipToAddr[5])
                        {
                        }
                        column(ShipToAddr4; ShipToAddr[4])
                        {
                        }
                        column(ShipToAddr3; ShipToAddr[3])
                        {
                        }
                        column(ShipToAddr2; ShipToAddr[2])
                        {
                        }
                        column(ShipToAddr1; ShipToAddr[1])
                        {
                        }
                        column(ShowShippingAddr; ShowShippingAddr)
                        {
                        }
                        column(ShiptoAddressCaption; ShiptoAddressCaptionLbl)
                        {
                        }
                        column(SelltoCustNo_SalesHeaderCaption; "Sales Header".FieldCaption("Sell-to Customer No."))
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if not ShowShippingAddr then
                                CurrReport.Break();
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                var
                    SalesPost: Codeunit "Sales-Post";
                begin
                    Clear(SalesLine);
                    Clear(SalesPost);
                    SalesLine.DeleteAll();
                    VATAmountLine.DeleteAll();
                    SalesPost.GetSalesLines("Sales Header", SalesLine, 0);
                    SalesLine.CalcVATAmountLines(0, "Sales Header", SalesLine, VATAmountLine);
                    SalesLine.UpdateVATOnLines(0, "Sales Header", SalesLine, VATAmountLine);
                    VATAmount := VATAmountLine.GetTotalVATAmount;
                    VATBaseAmount := VATAmountLine.GetTotalVATBase;
                    VATDiscountAmount :=
                      VATAmountLine.GetTotalVATDiscount("Sales Header"."Currency Code", "Sales Header"."Prices Including VAT");
                    TotalAmountInclVAT := VATAmountLine.GetTotalAmountInclVAT;
                    if (VATAmountLine."VAT Calculation Type" = VATAmountLine."VAT Calculation Type"::"Reverse Charge VAT") and
                        "Sales Header"."Prices Including VAT" then begin
                        VATBaseAmount := VATAmountLine.GetTotalLineAmount(false, "Sales Header"."Currency Code");
                        TotalAmountInclVAT := VATAmountLine.GetTotalLineAmount(false, "Sales Header"."Currency Code");
                    end;

                    if Number > 1 then begin
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    end;

                    TotalSubTotal := 0;
                    TotalInvoiceDiscountAmount := 0;
                    TotalAmount := 0;
                end;

                trigger OnPostDataItem()
                begin
                    if not IsReportInPreviewMode then
                        CODEUNIT.Run(CODEUNIT::"Sales-Printed", "Sales Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopies) + 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.Language := Language.GetLanguageIdOrDefault("Language Code");

                FormatAddressFields("Sales Header");
                FormatDocumentFields("Sales Header");

                DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");
            end;

            trigger OnPostDataItem()
            begin
                OnAfterPostDataItem("Sales Header");
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = SalesReturnOrder;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = SalesReturnOrder;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = SalesReturnOrder;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want to record the reports that you print as interactions.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            InitLogInteraction;
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        GLSetup.Get();
        SalesSetup.Get();
        case SalesSetup."Logo Position on Documents" of
            SalesSetup."Logo Position on Documents"::"No Logo":
                ;
            SalesSetup."Logo Position on Documents"::Left:
                begin
                    CompanyInfo1.Get();
                    CompanyInfo1.CalcFields(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Center:
                begin
                    CompanyInfo2.Get();
                    CompanyInfo2.CalcFields(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Right:
                begin
                    CompanyInfo3.Get();
                    CompanyInfo3.CalcFields(Picture);
                end;
        end;

        OnAfterInitReport;
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode then
            if "Sales Header".FindSet then
                repeat
                    if "Sales Header"."Bill-to Contact No." <> '' then
                        SegManagement.LogDocument(18, "Sales Header"."No.", 0, 0, DATABASE::Contact,
                          "Sales Header"."Bill-to Contact No.", "Sales Header"."Salesperson Code",
                          "Sales Header"."Campaign No.", "Sales Header"."Posting Description", "Sales Header"."Opportunity No.")
                    else
                        SegManagement.LogDocument(18, "Sales Header"."No.", 0, 0, DATABASE::Customer,
                          "Sales Header"."Bill-to Customer No.", "Sales Header"."Salesperson Code",
                          "Sales Header"."Campaign No.", "Sales Header"."Posting Description", "Sales Header"."Opportunity No.");
                until "Sales Header".Next = 0;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction;
    end;

    var
        Text004: Label 'Return Order Confirmation %1', Comment = '%1 = Document No.';
        Text005: Label 'Page %1';
        GLSetup: Record "General Ledger Setup";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo3: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo: Record "Company Information";
        VATAmountLine: Record "VAT Amount Line" temporary;
        SalesLine: Record "Sales Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        CurrExchRate: Record "Currency Exchange Rate";
        Language: Codeunit Language;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        SalesPersonText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        Text007: Label 'VAT Amount Specification in ';
        Text008: Label 'Local Currency';
        Text009: Label 'Exchange rate: %1/%2';
        OutputNo: Integer;
        TypeInt: Integer;
        SalesLineNo: Code[20];
        SalesLineLineNo: Integer;
        [InDataSet]
        LogInteractionEnable: Boolean;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalInvoiceDiscountAmount: Decimal;
        SalesSetup: Record "Sales & Receivables Setup";
        PhoneNoCaptionLbl: Label 'Phone No.';
        VATRegNoCaptionLbl: Label 'VAT Registration No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankNameCaptionLbl: Label 'Bank';
        BankAccNoCaptionLbl: Label 'Account No.';
        ReturnOrderNoCaptionLbl: Label 'Return Order No.';
        DocumentDateCaptionLbl: Label 'Document Date';
        HomePageCaptionLbl: Label 'Home Page';
        UnitPriceCaptionLbl: Label 'Unit Price';
        DiscPercentCaptionLbl: Label 'Discount %';
        AmountCaptionLbl: Label 'Amount';
        EmailCaptionLbl: Label 'Email';
        AllowInvoiceDiscCaptionLbl: Label 'Allow Invoice Discount';
        InvDiscAmtCaptionLbl: Label 'Invoice Discount Amount';
        SubtotalCaptionLbl: Label 'Subtotal';
        PaymentDiscReceivedAmtCaptionLbl: Label 'Payment Discount Received Amount';
        PaymentDisconVATCaptionLbl: Label 'Payment Discount on VAT';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        VATPercentCaptionLbl: Label 'VAT %';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmountCaptionLbl: Label 'VAT Amount';
        VATAmountSpecificationCaptionLbl: Label 'VAT Amount Specification';
        InvDiscBaseAmtCaptionLbl: Label 'Invoice Discount Base Amount';
        LineAmtCaptionLbl: Label 'Line Amount';
        InvandPmtDiscountsCaptionLbl: Label 'Invoice and Payment Discounts';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        ECCaptionLbl: Label 'EC %';
        ECAmountCaptionLbl: Label 'EC Amount';
        TotalCaptionLbl: Label 'Total';
        ShiptoAddressCaptionLbl: Label 'Ship-to Address';

    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(18) <> '';
    end;

    procedure InitializeRequest(ShowInternalInfoFrom: Boolean; LogInteractionFrom: Boolean)
    begin
        InitLogInteraction;
        ShowInternalInfo := ShowInternalInfoFrom;
        LogInteraction := LogInteractionFrom;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure FormatAddressFields(var SalesHeader: Record "Sales Header")
    begin
        FormatAddr.GetCompanyAddr(SalesHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.SalesHeaderBillTo(CustAddr, SalesHeader);
        ShowShippingAddr := FormatAddr.SalesHeaderShipTo(ShipToAddr, CustAddr, SalesHeader);
    end;

    local procedure FormatDocumentFields(SalesHeader: Record "Sales Header")
    begin
        with SalesHeader do begin
            FormatDocument.SetTotalLabels("Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
            FormatDocument.SetSalesPerson(SalesPurchPerson, "Salesperson Code", SalesPersonText);

            ReferenceText := FormatDocument.SetText("Your Reference" <> '', FieldCaption("Your Reference"));
            VATNoText := FormatDocument.SetText("VAT Registration No." <> '', FieldCaption("VAT Registration No."));
        end;
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnAfterInitReport()
    begin
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnAfterPostDataItem(var SalesHeader: Record "Sales Header")
    begin
    end;
}

