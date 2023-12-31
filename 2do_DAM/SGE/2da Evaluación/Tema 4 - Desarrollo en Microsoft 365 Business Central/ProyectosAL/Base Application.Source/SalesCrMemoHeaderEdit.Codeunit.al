codeunit 10766 "Sales Cr.Memo Header - Edit"
{
    Permissions = TableData "Sales Cr.Memo Header" = rm;
    TableNo = "Sales Cr.Memo Header";

    trigger OnRun()
    var
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    begin
        SalesCrMemoHeader := Rec;
        SalesCrMemoHeader.LockTable();
        SalesCrMemoHeader.Find;
        SalesCrMemoHeader."Special Scheme Code" := "Special Scheme Code";
        SalesCrMemoHeader."Cr. Memo Type" := "Cr. Memo Type";
        SalesCrMemoHeader."Correction Type" := "Correction Type";
        SalesCrMemoHeader.TestField("No.", "No.");
        SalesCrMemoHeader.Modify();
        Rec := SalesCrMemoHeader;
        UpdateSIIDocUploadState(Rec);
    end;

    local procedure UpdateSIIDocUploadState(SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    var
        SIIDocUploadState: Record "SII Doc. Upload State";
        SIIManagement: Codeunit "SII Management";
    begin
        if not SIIManagement.IsSIISetupEnabled then
            exit;

        if not SIIDocUploadState.GetSIIDocUploadStateByDocument(
             SIIDocUploadState."Document Source"::"Customer Ledger",
             SIIDocUploadState."Document Type"::"Credit Memo",
             SalesCrMemoHeader."Posting Date",
             SalesCrMemoHeader."No.")
        then
            exit;

        SIIDocUploadState."Sales Cr. Memo Type" := SalesCrMemoHeader."Cr. Memo Type" + 1;
        SIIDocUploadState."Sales Special Scheme Code" := SalesCrMemoHeader."Special Scheme Code" + 1;
        SIIDocUploadState.IDType := SalesCrMemoHeader."ID Type";
        SIIDocUploadState."Succeeded Company Name" := SalesCrMemoHeader."Succeeded Company Name";
        SIIDocUploadState."Succeeded VAT Registration No." := SalesCrMemoHeader."Succeeded VAT Registration No.";
        SIIDocUploadState.Modify();
    end;
}

