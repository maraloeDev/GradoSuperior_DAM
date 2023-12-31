codeunit 10756 "SII Management"
{

    trigger OnRun()
    begin
    end;

    var
        DontAskAgainTxt: Label 'Don''t ask again';
        SiiNotificationNameTxt: Label 'Sii Setup Notification';
        SIIServiceNameTxt: Label 'SII Service';
        SIIBusinessSetupDescriptionTxt: Label 'Set up and enable the SII service.';
        SIIBusinessSetupKeywordsTxt: Label 'Finance,SII';
        SetupNotificationTxt: Label 'Do you want to setup SII Document Transmission?';
        YesTxt: Label 'Yes';
        NoSIIStateErr: Label 'The document has not been transmitted and hence has no status.';

    [EventSubscriber(ObjectType::Page, 43, 'OnOpenPageEvent', '', false, false)]
    local procedure OnSalesInvoicePageOpen(var Rec: Record "Sales Header")
    begin
        CreateSetupNotification;
    end;

    [EventSubscriber(ObjectType::Page, 51, 'OnOpenPageEvent', '', false, false)]
    local procedure OnPurchInvoicePageOpen(var Rec: Record "Purchase Header")
    begin
        CreateSetupNotification;
    end;

    [EventSubscriber(ObjectType::Page, 44, 'OnOpenPageEvent', '', false, false)]
    local procedure OnSalesCreditMemoPageOpen(var Rec: Record "Sales Header")
    begin
        CreateSetupNotification;
    end;

    [EventSubscriber(ObjectType::Page, 52, 'OnOpenPageEvent', '', false, false)]
    local procedure OnPurchCreditMemoPageOpen(var Rec: Record "Purchase Header")
    begin
        CreateSetupNotification;
    end;

    procedure IsSIISetupEnabled(): Boolean
    var
        SIISetup: Record "SII Setup";
    begin
        if not SIISetup.Get then
            exit(false);
        exit(SIISetup.Enabled);
    end;

    local procedure CreateSetupNotification()
    var
        SetupNotification: Notification;
    begin
        if not ShowNotification then
            exit;

        SetupNotification.Message := SetupNotificationTxt;
        SetupNotification.Scope := NOTIFICATIONSCOPE::LocalScope;
        SetupNotification.AddAction(YesTxt, CODEUNIT::"SII Management", 'OpenSIIVATSetup');
        SetupNotification.AddAction(DontAskAgainTxt, CODEUNIT::"SII Management", 'DeactivateSIISetupNotification');
        SetupNotification.Send;
    end;

    procedure OpenSIIVATSetup(SetupNotification: Notification)
    begin
        PAGE.Run(PAGE::"SII Setup");
    end;

    procedure DeactivateSIISetupNotification(var SetupNotification: Notification)
    var
        MyNotifications: Record "My Notifications";
        NotificationGuid: Guid;
    begin
        NotificationGuid := SetupNotification.Id;
        if MyNotifications.Get(UserId, NotificationGuid) then begin
            MyNotifications.Validate(Enabled, false);
            MyNotifications.Modify();
        end else
            MyNotifications.InsertDefault(GetNotificationId, SiiNotificationNameTxt, 'SII', false);
    end;

    local procedure ShowNotification(): Boolean
    var
        MyNotifications: Record "My Notifications";
        SIISetup: Record "SII Setup";
        CompanyInformationMgt: Codeunit "Company Information Mgt.";
    begin
        if CompanyInformationMgt.IsDemoCompany then
            exit(false);
        if SIISetup.IsEnabled then
            exit(false);
        exit(MyNotifications.IsEnabled(GetNotificationId));
    end;

    local procedure GetNotificationId(): Text
    begin
        exit('C36C1441-6711-4878-9EB4-B8C8EAECD925');
    end;

    [EventSubscriber(ObjectType::Codeunit, 1875, 'OnRegisterManualSetup', '', false, false)]
    local procedure HandleRegisterBusinessSetup(var Sender: Codeunit "Manual Setup")
    var
        SIISetup: Record "SII Setup";
        Info: ModuleInfo;
        ManualSetupCategory: Enum "Manual Setup Category";
    begin
        NavApp.GetCurrentModuleInfo(Info);
        if not SIISetup.Get then begin
            SIISetup.Init();
            SIISetup.Insert(true);
        end;

        Sender.Insert(
          SIIServiceNameTxt, SIIBusinessSetupDescriptionTxt, SIIBusinessSetupKeywordsTxt,
          PAGE::"SII Setup", Info.Id(), ManualSetupCategory::Service);
    end;

    [Scope('OnPrem')]
    procedure GetSIIStyle(SIIState: Option Pending,Incorrect,Accepted,"Accepted With Errors","Communication Error",Failed,"Not Supported") StyleText: Text
    begin
        case SIIState of
            SIIState::Accepted:
                StyleText := 'Favorable';
            SIIState::"Accepted With Errors":
                StyleText := 'Ambiguous';
            SIIState::Failed,
          SIIState::Incorrect,
          SIIState::"Communication Error":
                StyleText := 'Unfavorable';
            else
                StyleText := 'Standard';
        end;
    end;

    procedure GetSalesIDType(CustNo: Code[20]; CorrectionType: Option; CorrDocNo: Code[20]): Integer
    var
        Cust: Record Customer;
        SalesHeader: Record "Sales Header";
        CompanyInformation: Record "Company Information";
        SIIManagement: Codeunit "SII Management";
        CountryCode: Code[20];
        VATRegNo: Code[20];
    begin
        if CustNo = '' then
            exit(0);

        Cust.Get(CustNo);
        if (CorrectionType = SalesHeader."Correction Type"::Removal) and (CorrDocNo <> '') then begin
            CompanyInformation.Get();
            CountryCode := CompanyInformation."Country/Region Code";
            VATRegNo := CompanyInformation."VAT Registration No.";
        end else begin
            CountryCode := Cust."Country/Region Code";
            VATRegNo := Cust."VAT Registration No.";
        end;
        exit(
          SIIManagement.GetIDType(CountryCode, VATRegNo, Cust."Not in AEAT", SIIManagement.CustomerIsIntraCommunity(Cust."No.")));
    end;

    procedure GetPurchIDType(VendNo: Code[20]; CorrectionType: Option; CorrDocNo: Code[20]): Integer
    var
        Vend: Record Vendor;
        PurchaseHeader: Record "Purchase Header";
        SIIManagement: Codeunit "SII Management";
    begin
        if VendNo = '' then
            exit(0);

        Vend.Get(VendNo);
        if (CorrectionType = PurchaseHeader."Correction Type"::Removal) and (CorrDocNo <> '') then; // keep condition and parameters to avoid breaking changes of external function
        exit(
          SIIManagement.GetIDType(
            Vend."Country/Region Code", Vend."VAT Registration No.", false,
            SIIManagement.VendorIsIntraCommunity(Vend."No.")));
    end;

    procedure GetIDType(CountryCode: Code[20]; VATRegNo: Code[20]; IsNotInAEAT: Boolean; IsIntraCommunity: Boolean): Integer
    var
        SIIDocUploadState: Record "SII Doc. Upload State";
        SIIManagement: Codeunit "SII Management";
    begin
        if SIIManagement.CountryAndVATRegNoAreLocal(CountryCode, VATRegNo) then begin
            if IsNotInAEAT then
                exit(SIIDocUploadState.IDType::"07-Not On The Census");
            exit(0);
        end;
        if IsIntraCommunity then
            exit(SIIDocUploadState.IDType::"02-VAT Registration No.");
        if IsNotInAEAT then
            exit(SIIDocUploadState.IDType::"07-Not On The Census");
        exit(SIIDocUploadState.IDType::"06-Other Probative Document");
    end;

    procedure GetVendFromLedgEntryByGLSetup(VendorLedgerEntry: Record "Vendor Ledger Entry"): Code[20]
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        GeneralLedgerSetup.Get();
        case GeneralLedgerSetup."Bill-to/Sell-to VAT Calc." of
            GeneralLedgerSetup."Bill-to/Sell-to VAT Calc."::"Bill-to/Pay-to No.":
                exit(VendorLedgerEntry."Vendor No.");
            GeneralLedgerSetup."Bill-to/Sell-to VAT Calc."::"Sell-to/Buy-from No.":
                exit(VendorLedgerEntry."Buy-from Vendor No.");
        end;
    end;

    procedure GetCustFromLedgEntryByGLSetup(CustLedgerEntry: Record "Cust. Ledger Entry"): Code[20]
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        GeneralLedgerSetup.Get();
        case GeneralLedgerSetup."Bill-to/Sell-to VAT Calc." of
            GeneralLedgerSetup."Bill-to/Sell-to VAT Calc."::"Bill-to/Pay-to No.":
                exit(CustLedgerEntry."Customer No.");
            GeneralLedgerSetup."Bill-to/Sell-to VAT Calc."::"Sell-to/Buy-from No.":
                exit(CustLedgerEntry."Sell-to Customer No.");
        end;
    end;

    [Scope('OnPrem')]
    procedure GetNoTaxablePurchAmount(var NoTaxableAmount: Decimal; SourceNo: Code[20]; DocumentType: Option; DocumentNo: Code[20]; PostingDate: Date): Boolean
    var
        NoTaxableEntry: Record "No Taxable Entry";
    begin
        if NoTaxableEntriesExistPurchase(NoTaxableEntry, SourceNo, DocumentType, DocumentNo, PostingDate) then begin
            NoTaxableEntry.CalcSums("Amount (LCY)");
            NoTaxableAmount := -NoTaxableEntry."Amount (LCY)";
            exit(true);
        end;
        exit(false);
    end;

    [Scope('OnPrem')]
    procedure GetNoTaxableSalesAmount(var NoTaxableAmount: Decimal; SourceNo: Code[20]; DocumentType: Option; DocumentNo: Code[20]; PostingDate: Date; IsService: Boolean; UseNoTaxableType: Boolean; IsLocalRule: Boolean): Boolean
    var
        NoTaxableEntry: Record "No Taxable Entry";
    begin
        if NoTaxableEntriesExistSales(NoTaxableEntry, SourceNo, DocumentType, DocumentNo, PostingDate, IsService, UseNoTaxableType, IsLocalRule) then begin
            NoTaxableEntry.CalcSums("Amount (LCY)");
            NoTaxableAmount := -NoTaxableEntry."Amount (LCY)";
            exit(true);
        end;
        exit(false);
    end;

    procedure GetBaseImponibleACosteRegimeCode(): Text
    begin
        exit('06');
    end;

    [Scope('OnPrem')]
    procedure SIIStateDrilldown(var SIIDocUploadState: Record "SII Doc. Upload State")
    var
        SIIHistory: Record "SII History";
    begin
        if not SIIDocUploadState.FindFirst then
            Error(NoSIIStateErr);
        SIIHistory.SetRange("Document State Id", SIIDocUploadState.Id);
        SIIHistory.FindFirst;
        PAGE.Run(PAGE::"SII History", SIIHistory);
    end;

    [Scope('OnPrem')]
    procedure IsVATEntryCashFlowBased(VATEntry: Record "VAT Entry"): Boolean
    begin
        // to know if a payment VAT entry is cash based, we look at "Unrealized VAT Entry No."
        // to know if an invoice VAT entry is cash based, we look at "Unrealized Base"
        exit((VATEntry."Unrealized VAT Entry No." <> 0) or (VATEntry."Unrealized Base" <> 0));
    end;

    [Scope('OnPrem')]
    procedure IsDetailedLedgerCashFlowBased(DtldLedgerEntryRecRef: RecordRef): Boolean
    var
        LedgerEntryRecRef: RecordRef;
    begin
        GetLedgerFromDetailed(LedgerEntryRecRef, DtldLedgerEntryRecRef);
        exit(IsLedgerCashFlowBased(LedgerEntryRecRef));
    end;

    [Scope('OnPrem')]
    procedure IsLedgerCashFlowBased(LedgerEntryRecRef: RecordRef): Boolean
    var
        VATEntry: Record "VAT Entry";
        SourceLedgerEntryRecRef: RecordRef;
    begin
        // TRUE only in case of all VAT Entries are Cash Flow based
        SourceLedgerEntryRecRef.Get(LedgerEntryRecRef.RecordId);
        if IsBillLedgerEntryRecRef(SourceLedgerEntryRecRef) then
            if not FindInvoiceDocLedgerFromBillLedger(SourceLedgerEntryRecRef, SourceLedgerEntryRecRef) then
                exit(false);

        if not FindVatEntriesFromLedger(SourceLedgerEntryRecRef, VATEntry) then
            exit(false);

        repeat
            if not IsVATEntryCashFlowBased(VATEntry) then
                exit(false);
        until VATEntry.Next = 0;

        exit(true);
    end;

    local procedure IsBillLedgerEntryRecRef(LedgerEntryRecRef: RecordRef): Boolean
    var
        DummyCustLedgerEntry: Record "Cust. Ledger Entry";
        DocumentTypeFieldRef: FieldRef;
    begin
        DocumentTypeFieldRef := LedgerEntryRecRef.Field(DummyCustLedgerEntry.FieldNo("Document Type"));
        DummyCustLedgerEntry."Document Type" := DocumentTypeFieldRef.Value;
        exit(DummyCustLedgerEntry."Document Type" = DummyCustLedgerEntry."Document Type"::Bill);
    end;

    [Scope('OnPrem')]
    procedure IsIntracommunity(CountryRegionCode: Code[10]): Boolean
    var
        DummyCountryRegion: Record "Country/Region";
    begin
        if CountryIsLocal(CountryRegionCode) then
            exit(false);
        // If EU Country/Region is not blank it means that the country IS in EU and it is NOT Spain (that means, Intracommunity).
        exit(DummyCountryRegion.EUCountryFound(CountryRegionCode));
    end;

    local procedure FindVatEntryFromDetailedLedger(DetailedLedgerEntryRecRef: RecordRef; var VATEntry: Record "VAT Entry"; DocumentType: Option " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund,,,,,,,,,,,,,,,Bill): Boolean
    var
        DummyDetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        TransNoFieldRef: FieldRef;
        DocNumberFieldRef: FieldRef;
        PostingDateFieldRef: FieldRef;
        TransactionNumber: Integer;
        DocNumber: Code[20];
        PostingDate: Date;
    begin
        // get transaction number from ledger rec ref
        TransNoFieldRef := DetailedLedgerEntryRecRef.Field(DummyDetailedCustLedgEntry.FieldNo("Transaction No."));
        TransactionNumber := TransNoFieldRef.Value;

        PostingDateFieldRef := DetailedLedgerEntryRecRef.Field(DummyDetailedCustLedgEntry.FieldNo("Posting Date"));
        PostingDate := PostingDateFieldRef.Value;

        DocNumberFieldRef := DetailedLedgerEntryRecRef.Field(DummyDetailedCustLedgEntry.FieldNo("Document No."));
        DocNumber := DocNumberFieldRef.Value;

        // search for the vat entry
        VATEntry.Reset();
        VATEntry.SetRange("Transaction No.", TransactionNumber);
        VATEntry.SetRange("Posting Date", PostingDate);
        VATEntry.SetRange("Document No.", DocNumber);

        if DocumentType <> DocumentType::" " then
            VATEntry.SetRange("Document Type", DocumentType);

        exit(VATEntry.FindFirst);
    end;

    [Scope('OnPrem')]
    procedure FindVatEntriesFromLedger(LedgerEntryRecRef: RecordRef; var VATEntry: Record "VAT Entry"): Boolean
    var
        DummyCustLedgerEntry: Record "Cust. Ledger Entry";
        TransNoFieldRef: FieldRef;
        DocNumberFieldRef: FieldRef;
        PostingDateFieldRef: FieldRef;
        TransactionNumber: Integer;
        DocNumber: Code[20];
        PostingDate: Date;
    begin
        // get transaction number from ledger rec ref
        TransNoFieldRef := LedgerEntryRecRef.Field(DummyCustLedgerEntry.FieldNo("Transaction No."));
        TransactionNumber := TransNoFieldRef.Value;

        PostingDateFieldRef := LedgerEntryRecRef.Field(DummyCustLedgerEntry.FieldNo("Posting Date"));
        PostingDate := PostingDateFieldRef.Value;

        DocNumberFieldRef := LedgerEntryRecRef.Field(DummyCustLedgerEntry.FieldNo("Document No."));
        DocNumber := DocNumberFieldRef.Value;

        // search for the vat entry
        VATEntry.Reset();
        VATEntry.SetRange("Transaction No.", TransactionNumber);
        VATEntry.SetRange("Posting Date", PostingDate);
        VATEntry.SetRange("Document No.", DocNumber);
        VATEntry.SetRange("No Taxable Type", VATEntry."No Taxable Type"::" ");
        exit(VATEntry.FindSet);
    end;

    [Scope('OnPrem')]
    procedure FindOriginalLedgerFromDetailedPaymentLedger(PaymentDetailedLedgerEntryRecRef: RecordRef; var SalesDocLedgerEntryRecRefOut: RecordRef)
    var
        DummyDetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        PaymentVATEntry: Record "VAT Entry";
        SalesDocVATEntry: Record "VAT Entry";
        DocTypeFieldRef: FieldRef;
        DocumentType: Option;
    begin
        DocTypeFieldRef := PaymentDetailedLedgerEntryRecRef.Field(DummyDetailedCustLedgEntry.FieldNo("Document Type"));
        DocumentType := DocTypeFieldRef.Value;
        if DocumentType <> DummyDetailedCustLedgEntry."Document Type"::Payment then
            exit;

        FindVatEntryFromDetailedLedger(PaymentDetailedLedgerEntryRecRef, PaymentVATEntry, PaymentVATEntry."Document Type"::Payment);

        SalesDocVATEntry.Get(PaymentVATEntry."Unrealized VAT Entry No.");

        FindLedgerFromVatEntry(SalesDocLedgerEntryRecRefOut, SalesDocVATEntry);
    end;

    [Scope('OnPrem')]
    procedure FindOriginalLedgerFromPaymentLedger(PaymentLedgerEntryRecRef: RecordRef; var SalesDocLedgerEntryRecRefOut: RecordRef)
    var
        DummyCustLedgerEntry: Record "Cust. Ledger Entry";
        PaymentVATEntry: Record "VAT Entry";
        SalesDocVATEntry: Record "VAT Entry";
        DocTypeFieldRef: FieldRef;
        DocumentType: Option;
    begin
        DocTypeFieldRef := PaymentLedgerEntryRecRef.Field(DummyCustLedgerEntry.FieldNo("Document Type"));
        DocumentType := DocTypeFieldRef.Value;
        if DocumentType <> DummyCustLedgerEntry."Document Type"::Payment then
            exit;

        FindVatEntriesFromLedger(PaymentLedgerEntryRecRef, PaymentVATEntry);

        SalesDocVATEntry.Get(PaymentVATEntry."Unrealized VAT Entry No.");

        FindLedgerFromVatEntry(SalesDocLedgerEntryRecRefOut, SalesDocVATEntry);
    end;

    [Scope('OnPrem')]
    procedure FindVatEntriesReferringToDocLedger(InvoiceDocLedgerEntryRecRef: RecordRef; var PaymentVATEntry: Record "VAT Entry"): Boolean
    var
        SalesDocVATEntry: Record "VAT Entry";
    begin
        FindVatEntriesFromLedger(InvoiceDocLedgerEntryRecRef, SalesDocVATEntry);

        PaymentVATEntry.Reset();
        PaymentVATEntry.SetRange("Unrealized VAT Entry No.", SalesDocVATEntry."Entry No.");
        exit(PaymentVATEntry.FindSet);
    end;

    [Scope('OnPrem')]
    procedure FindDetailedPaymentApplicationLedgerFromLedger(PaymentDocLedgerEntryRecRef: RecordRef; var PaymentDetailedDocLedgerEntryRecRefOut: RecordRef; ApplicationDate: Date; DocNumber: Code[20]): Boolean
    var
        DummyCustLedgerEntry: Record "Cust. Ledger Entry";
        DummyDetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        EntryTypeFieldRef: FieldRef;
        DocNumberFieldRef: FieldRef;
        InitialDocTypeFieldRef: FieldRef;
        UnappliedFieldRef: FieldRef;
        PostingDateFieldRef: FieldRef;
        AppliedLedgerEntryNoFieldRef: FieldRef;
        AppliedLedgerEntry: Integer;
    begin
        // the detailed ledger entry should:

        // 1) have the application date
        PostingDateFieldRef := PaymentDetailedDocLedgerEntryRecRefOut.Field(DummyDetailedCustLedgEntry.FieldNo("Posting Date"));
        PostingDateFieldRef.SetRange(ApplicationDate);

        // 2) have the doc number
        DocNumberFieldRef := PaymentDetailedDocLedgerEntryRecRefOut.Field(DummyDetailedCustLedgEntry.FieldNo("Document No."));
        DocNumberFieldRef.SetRange(DocNumber);

        // 3) have the "Application" type
        EntryTypeFieldRef := PaymentDetailedDocLedgerEntryRecRefOut.Field(DummyDetailedCustLedgEntry.FieldNo("Entry Type"));
        EntryTypeFieldRef.SetRange(DummyDetailedCustLedgEntry."Entry Type"::Application);

        // 4) refer to a payment entry "Payment" (we could also look for the "Invoice" one but Payment is probably better here - could apply to credit memos)
        InitialDocTypeFieldRef :=
          PaymentDetailedDocLedgerEntryRecRefOut.Field(DummyDetailedCustLedgEntry.FieldNo("Initial Document Type"));
        InitialDocTypeFieldRef.SetRange(DummyDetailedCustLedgEntry."Initial Document Type"::Payment); // we want the application to the payment

        // 5) not be unapplied
        UnappliedFieldRef := PaymentDetailedDocLedgerEntryRecRefOut.Field(DummyDetailedCustLedgEntry.FieldNo(Unapplied));
        UnappliedFieldRef.SetRange(false); // ignore unapplied entries

        // 6) refer to the given payment ledger entry
        AppliedLedgerEntryNoFieldRef := PaymentDocLedgerEntryRecRef.Field(DummyCustLedgerEntry.FieldNo("Entry No."));
        AppliedLedgerEntry := AppliedLedgerEntryNoFieldRef.Value;
        AppliedLedgerEntryNoFieldRef :=
          PaymentDetailedDocLedgerEntryRecRefOut.Field(DummyDetailedCustLedgEntry.FieldNo("Applied Cust. Ledger Entry No."));
        AppliedLedgerEntryNoFieldRef.SetFilter(Format(AppliedLedgerEntry));

        exit(PaymentDetailedDocLedgerEntryRecRefOut.FindFirst);
    end;

    [Scope('OnPrem')]
    procedure FindDetailedLedgerFromVatEntry(var InvoiceDetailedDocLedgerEntryRecRefOut: RecordRef; InvoiceDocVATEntry: Record "VAT Entry"): Boolean
    var
        DummyDetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        EntryTypeFieldRef: FieldRef;
        DocNumberFieldRef: FieldRef;
        InitialDocTypeFieldRef: FieldRef;
        UnappliedFieldRef: FieldRef;
        TransactionNbFieldRef: FieldRef;
        PostingDateFieldRef: FieldRef;
    begin
        PostingDateFieldRef := InvoiceDetailedDocLedgerEntryRecRefOut.Field(DummyDetailedCustLedgEntry.FieldNo("Posting Date"));
        PostingDateFieldRef.SetRange(InvoiceDocVATEntry."Posting Date");

        DocNumberFieldRef := InvoiceDetailedDocLedgerEntryRecRefOut.Field(DummyDetailedCustLedgEntry.FieldNo("Document No."));
        DocNumberFieldRef.SetRange(InvoiceDocVATEntry."Document No.");

        EntryTypeFieldRef := InvoiceDetailedDocLedgerEntryRecRefOut.Field(DummyDetailedCustLedgEntry.FieldNo("Entry Type"));
        EntryTypeFieldRef.SetRange(DummyDetailedCustLedgEntry."Entry Type"::Application);

        InitialDocTypeFieldRef :=
          InvoiceDetailedDocLedgerEntryRecRefOut.Field(DummyDetailedCustLedgEntry.FieldNo("Initial Document Type"));
        InitialDocTypeFieldRef.SetFilter('<>' + Format(DummyDetailedCustLedgEntry."Initial Document Type"::Payment)); // we want the application to the invoice, not the payment

        UnappliedFieldRef := InvoiceDetailedDocLedgerEntryRecRefOut.Field(DummyDetailedCustLedgEntry.FieldNo(Unapplied));
        UnappliedFieldRef.SetRange(false); // ignore unapplied entries

        TransactionNbFieldRef := InvoiceDetailedDocLedgerEntryRecRefOut.Field(DummyDetailedCustLedgEntry.FieldNo("Transaction No."));
        TransactionNbFieldRef.SetRange(InvoiceDocVATEntry."Transaction No.");

        exit(InvoiceDetailedDocLedgerEntryRecRefOut.FindFirst);
    end;

    [Scope('OnPrem')]
    procedure FindLedgerFromVatEntry(var InvoiceDocLedgerEntryRecRefOut: RecordRef; InvoiceDocVATEntry: Record "VAT Entry")
    var
        DummyCustLedgerEntry: Record "Cust. Ledger Entry";
        TransNoFieldRef: FieldRef;
        DocNumberFieldRef: FieldRef;
        PostingDateFieldRef: FieldRef;
    begin
        // search for a ledger that has the transaction number of the vat entry
        PostingDateFieldRef := InvoiceDocLedgerEntryRecRefOut.Field(DummyCustLedgerEntry.FieldNo("Posting Date"));
        PostingDateFieldRef.SetRange(InvoiceDocVATEntry."Posting Date");

        DocNumberFieldRef := InvoiceDocLedgerEntryRecRefOut.Field(DummyCustLedgerEntry.FieldNo("Document No."));
        DocNumberFieldRef.SetRange(InvoiceDocVATEntry."Document No.");

        TransNoFieldRef := InvoiceDocLedgerEntryRecRefOut.Field(DummyCustLedgerEntry.FieldNo("Transaction No."));
        TransNoFieldRef.SetRange(InvoiceDocVATEntry."Transaction No.");
        InvoiceDocLedgerEntryRecRefOut.FindFirst;
    end;

    local procedure FindInvoiceDocLedgerFromBillLedger(var InvoiceDocLedgerEntryRecRef: RecordRef; BillLedgerEntryRecRef: RecordRef): Boolean
    var
        DummyCustLedgerEntry: Record "Cust. Ledger Entry";
        DocNumberFieldRef: FieldRef;
        DocTypeFieldRef: FieldRef;
        SourceDocNumberFieldRef: FieldRef;
    begin
        SourceDocNumberFieldRef := BillLedgerEntryRecRef.Field(DummyCustLedgerEntry.FieldNo("Document No."));
        DocNumberFieldRef := InvoiceDocLedgerEntryRecRef.Field(DummyCustLedgerEntry.FieldNo("Document No."));
        DocNumberFieldRef.SetRange(SourceDocNumberFieldRef.Value);

        DocTypeFieldRef := InvoiceDocLedgerEntryRecRef.Field(DummyCustLedgerEntry.FieldNo("Document Type"));
        DocTypeFieldRef.SetFilter(Format(DummyCustLedgerEntry."Document Type"::Invoice));

        exit(InvoiceDocLedgerEntryRecRef.FindFirst);
    end;

    [Scope('OnPrem')]
    procedure FindPaymentDetailedCustomerLedgerEntries(var PaymentDetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry"; CustLedgerEntry: Record "Cust. Ledger Entry"): Boolean
    begin
        PaymentDetailedCustLedgEntry.SetRange("Cust. Ledger Entry No.", CustLedgerEntry."Entry No.");
        PaymentDetailedCustLedgEntry.SetRange("Document Type", PaymentDetailedCustLedgEntry."Document Type"::Payment);
        PaymentDetailedCustLedgEntry.SetRange(Unapplied, false);
        exit(PaymentDetailedCustLedgEntry.FindSet);
    end;

    [Scope('OnPrem')]
    procedure FindPaymentDetailedVendorLedgerEntries(var PaymentDetailedVendorLedgEntry: Record "Detailed Vendor Ledg. Entry"; VendorLedgerEntry: Record "Vendor Ledger Entry"): Boolean
    begin
        PaymentDetailedVendorLedgEntry.SetRange("Vendor Ledger Entry No.", VendorLedgerEntry."Entry No.");
        PaymentDetailedVendorLedgEntry.SetRange("Document Type", PaymentDetailedVendorLedgEntry."Document Type"::Payment);
        PaymentDetailedVendorLedgEntry.SetRange(Unapplied, false);
        exit(PaymentDetailedVendorLedgEntry.FindSet);
    end;

    [Scope('OnPrem')]
    procedure NoTaxableEntriesExistPurchase(var NoTaxableEntry: Record "No Taxable Entry"; SourceNo: Code[20]; DocumentType: Option; DocumentNo: Code[20]; PostingDate: Date): Boolean
    begin
        NoTaxableEntry.FilterNoTaxableEntry(NoTaxableEntry.Type::Purchase, SourceNo, DocumentType, DocumentNo, PostingDate, false);
        NoTaxableEntry.SetRange("Not In 347", false);
        exit(not NoTaxableEntry.IsEmpty);
    end;

    [Scope('OnPrem')]
    procedure NoTaxableEntriesExistSales(var NoTaxableEntry: Record "No Taxable Entry"; SourceNo: Code[20]; DocumentType: Option; DocumentNo: Code[20]; PostingDate: Date; IsService: Boolean; UseNoTaxableType: Boolean; IsLocalRule: Boolean): Boolean
    begin
        NoTaxableEntry.FilterNoTaxableEntry(NoTaxableEntry.Type::Sale, SourceNo, DocumentType, DocumentNo, PostingDate, false);
        NoTaxableEntry.SetRange("EU Service", IsService);
        NoTaxableEntry.SetRange("Not In 347", false);
        if UseNoTaxableType then
            if IsLocalRule then
                NoTaxableEntry.SetRange(
                  "No Taxable Type", NoTaxableEntry."No Taxable Type"::"Non Taxable Due To Localization Rules")
            else
                NoTaxableEntry.SetFilter(
                  "No Taxable Type", '<>%1', NoTaxableEntry."No Taxable Type"::"Non Taxable Due To Localization Rules");
        exit(not NoTaxableEntry.IsEmpty);
    end;

    local procedure GetLedgerFromDetailed(var LedgerEntryRecRef: RecordRef; DtldLedgerEntryRecRef: RecordRef)
    var
        DummyCustLedgerEntry: Record "Cust. Ledger Entry";
        DummyDetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        EntryNoFieldRef: FieldRef;
        SourceEntryNoFieldRef: FieldRef;
    begin
        SourceEntryNoFieldRef := DtldLedgerEntryRecRef.Field(DummyDetailedCustLedgEntry.FieldNo("Cust. Ledger Entry No."));
        if DtldLedgerEntryRecRef.Number = DATABASE::"Detailed Cust. Ledg. Entry" then
            LedgerEntryRecRef.Open(DATABASE::"Cust. Ledger Entry", false)
        else
            LedgerEntryRecRef.Open(DATABASE::"Vendor Ledger Entry", false);
        EntryNoFieldRef := LedgerEntryRecRef.Field(DummyCustLedgerEntry.FieldNo("Entry No."));
        EntryNoFieldRef.SetRange(SourceEntryNoFieldRef.Value);
        LedgerEntryRecRef.FindFirst;
    end;

    [Scope('OnPrem')]
    procedure DoesPaymentDetailedLedgerCloseInvoice(PaymentDetailedLedgerEntryRecRef: RecordRef; IsCustomerPayment: Boolean): Boolean
    var
        DummyCustLedgerEntry: Record "Cust. Ledger Entry";
        InvoiceDocLedgerEntryRecRef: RecordRef;
        OpenFieldRef: FieldRef;
        IsLedgerEntryOpen: Boolean;
    begin
        if IsCustomerPayment then
            InvoiceDocLedgerEntryRecRef.Open(DATABASE::"Cust. Ledger Entry", false)
        else
            InvoiceDocLedgerEntryRecRef.Open(DATABASE::"Vendor Ledger Entry", false);

        FindOriginalLedgerFromDetailedPaymentLedger(PaymentDetailedLedgerEntryRecRef, InvoiceDocLedgerEntryRecRef);
        OpenFieldRef := InvoiceDocLedgerEntryRecRef.Field(DummyCustLedgerEntry.FieldNo(Open));
        IsLedgerEntryOpen := OpenFieldRef.Value;
        exit(not IsLedgerEntryOpen);
    end;

    [Scope('OnPrem')]
    procedure DoesPaymentLedgerCloseInvoice(PaymentLedgerEntryRecRef: RecordRef; IsCustomerPayment: Boolean): Boolean
    var
        DummyCustLedgerEntry: Record "Cust. Ledger Entry";
        InvoiceDocLedgerEntryRecRef: RecordRef;
        OpenFieldRef: FieldRef;
        IsLedgerEntryOpen: Boolean;
    begin
        if IsCustomerPayment then
            InvoiceDocLedgerEntryRecRef.Open(DATABASE::"Cust. Ledger Entry", false)
        else
            InvoiceDocLedgerEntryRecRef.Open(DATABASE::"Vendor Ledger Entry", false);

        FindOriginalLedgerFromPaymentLedger(PaymentLedgerEntryRecRef, InvoiceDocLedgerEntryRecRef);
        OpenFieldRef := InvoiceDocLedgerEntryRecRef.Field(DummyCustLedgerEntry.FieldNo(Open));
        IsLedgerEntryOpen := OpenFieldRef.Value;
        exit(not IsLedgerEntryOpen);
    end;

    [Scope('OnPrem')]
    procedure CountryIsLocal(CountryCode: Code[20]): Boolean
    begin
        exit((CountryCode = 'ES') or (CountryCode = ''));
    end;

    [Scope('OnPrem')]
    procedure CountryAndVATRegNoAreLocal(CountryCode: Code[20]; VATRegNo: Code[20]): Boolean
    begin
        exit(CountryIsLocal(CountryCode) or ((StrPos(VATRegNo, 'N') = 1) and not CharIsCapitalLetter(VATRegNo[2]))); // VAT Nos starting with 'N' are local, those with 'NL', 'NO', etc. are not.
    end;

    [Scope('OnPrem')]
    procedure IsDomesticCustomer(Customer: Record Customer): Boolean
    begin
        exit(CountryIsLocal(Customer."Country/Region Code") and (StrPos(Customer."VAT Registration No.", 'N') <> 1));
    end;

    [Scope('OnPrem')]
    procedure CustomerIsIntraCommunity(CustomerNo: Code[20]): Boolean
    var
        Customer: Record Customer;
    begin
        Customer.Get(CustomerNo);
        exit(IsIntracommunity(Customer."Country/Region Code"));
    end;

    [Scope('OnPrem')]
    procedure VendorIsIntraCommunity(VendorNo: Code[20]): Boolean
    var
        Vendor: Record Vendor;
    begin
        Vendor.Get(VendorNo);
        exit(IsIntracommunity(Vendor."Country/Region Code"));
    end;

    [Scope('OnPrem')]
    procedure CombineOperationDescription(OperationDescription1: Text[250]; OperationDescription2: Text[250]; var Result: Text[500])
    begin
        Result := OperationDescription1 + OperationDescription2;
    end;

    [Scope('OnPrem')]
    procedure SplitOperationDescription(OperationDescription: Text[500]; var Part1: Text[250]; var Part2: Text[250])
    begin
        Part1 := '';
        Part2 := '';

        if OperationDescription = '' then
            exit;

        if StrLen(OperationDescription) > MaxStrLen(Part1) then begin
            Part1 := CopyStr(OperationDescription, 1, MaxStrLen(Part1));
            Part2 := CopyStr(OperationDescription, MaxStrLen(Part1) + 1, StrLen(OperationDescription) - MaxStrLen(Part1));
        end else
            Part1 := CopyStr(OperationDescription, 1, StrLen(OperationDescription));
    end;

    [Scope('OnPrem')]
    procedure CharIsCapitalLetter(Char: Char): Boolean
    begin
        exit(Char in ['A' .. 'Z']);
    end;

    [Scope('OnPrem')]
    procedure IsAllowedSalesInvType(InvType: Option): Boolean
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
    begin
        exit(InvType in [SalesInvoiceHeader."Invoice Type"::"F1 Invoice",
                         SalesInvoiceHeader."Invoice Type"::"F2 Simplified Invoice",
                         SalesInvoiceHeader."Invoice Type"::"F3 Invoice issued to replace simplified invoices",
                         SalesInvoiceHeader."Invoice Type"::"F4 Invoice summary entry"]);
    end;

    [Scope('OnPrem')]
    procedure IsAllowedServInvType(InvType: Option): Boolean
    var
        ServiceInvoiceHeader: Record "Service Invoice Header";
    begin
        exit(InvType in [ServiceInvoiceHeader."Invoice Type"::"F1 Invoice",
                         ServiceInvoiceHeader."Invoice Type"::"F2 Simplified Invoice",
                         ServiceInvoiceHeader."Invoice Type"::"F3 Invoice issued to replace simplified invoices",
                         ServiceInvoiceHeader."Invoice Type"::"F4 Invoice summary entry"]);
    end;

    [Scope('OnPrem')]
    procedure Run347DeclarationToGenerateCollectionsInCash()
    var
        Make347Declaration: Report "Make 347 Declaration";
    begin
        Make347Declaration.SetCollectionInCashMode(true);
        Make347Declaration.RunModal;
    end;

    procedure UpdateSIIInfoInSalesDoc(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader."Special Scheme Code" :=
          GetSalesSpecialSchemeCode(SalesHeader."Bill-to Customer No.", SalesHeader."VAT Country/Region Code");
    end;

    procedure UpdateSIIInfoInServiceDoc(var ServiceHeader: Record "Service Header")
    begin
        ServiceHeader."Special Scheme Code" :=
          GetSalesSpecialSchemeCode(ServiceHeader."Bill-to Customer No.", ServiceHeader."VAT Country/Region Code");
    end;

    local procedure GetSalesSpecialSchemeCode(BillToCustomerNo: Code[20]; VATCountryRegionCode: Code[10]): Integer
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        Customer: Record Customer;
        SalesHeader: Record "Sales Header";
    begin
        GeneralLedgerSetup.Get();
        if GeneralLedgerSetup."VAT Cash Regime" then
            exit(SalesHeader."Special Scheme Code"::"07 Special Cash");
        if BillToCustomerNo <> '' then
            if Customer.Get(BillToCustomerNo) then begin
                if CountryIsLocal(VATCountryRegionCode) or
                   CustomerIsIntraCommunity(Customer."No.")
                then
                    exit(SalesHeader."Special Scheme Code"::"01 General");
                exit(SalesHeader."Special Scheme Code"::"02 Export");
            end;
    end;

    procedure UpdateSIIInfoInPurchDoc(var PurchaseHeader: Record "Purchase Header")
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        Vendor: Record Vendor;
    begin
        with PurchaseHeader do begin
            GeneralLedgerSetup.Get();
            if GeneralLedgerSetup."VAT Cash Regime" then
                "Special Scheme Code" := "Special Scheme Code"::"07 Special Cash"
            else
                if "Pay-to Vendor No." <> '' then
                    if Vendor.Get("Pay-to Vendor No.") then
                        if VendorIsIntraCommunity(Vendor."No.") then
                            "Special Scheme Code" := "Special Scheme Code"::"09 Intra-Community Acquisition"
                        else
                            "Special Scheme Code" := "Special Scheme Code"::"01 General";
        end;
    end;
}

