codeunit 111 "Vend. Entry-SetAppl.ID"
{
    Permissions = TableData "Vendor Ledger Entry" = imd;

    trigger OnRun()
    begin
    end;

    var
        VendEntryApplID: Code[50];
        CannotBeAppliedErr: Label '%1 cannot be applied, since it is included in a bill group.', Comment = '%1 = Description';
        CannotBeAppliedTryAgainErr: Label '%1 cannot be applied, since it is included in a bill group. Remove it from its bill group and try again.', Comment = '%1 = Description';

    procedure SetApplId(var VendLedgEntry: Record "Vendor Ledger Entry"; ApplyingVendLedgEntry: Record "Vendor Ledger Entry"; AppliesToID: Code[50])
    var
        TempVendLedgEntry: Record "Vendor Ledger Entry" temporary;
    begin
        VendLedgEntry.LockTable();
        if VendLedgEntry.FindSet then begin
            // Make Applies-to ID
            if VendLedgEntry."Applies-to ID" <> '' then
                VendEntryApplID := ''
            else begin
                VendEntryApplID := AppliesToID;
                if VendEntryApplID = '' then begin
                    VendEntryApplID := UserId;
                    if VendEntryApplID = '' then
                        VendEntryApplID := '***';
                end;
            end;
            repeat
                TempVendLedgEntry := VendLedgEntry;
                TempVendLedgEntry.Insert();
            until VendLedgEntry.Next = 0;
        end;

        if TempVendLedgEntry.FindSet then
            repeat
                UpdateVendLedgerEntry(TempVendLedgEntry, ApplyingVendLedgEntry, AppliesToID);
            until TempVendLedgEntry.Next = 0;
    end;

    local procedure UpdateVendLedgerEntry(var TempVendLedgEntry: Record "Vendor Ledger Entry" temporary; ApplyingVendLedgEntry: Record "Vendor Ledger Entry"; AppliesToID: Code[50])
    var
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        CarteraSetup: Record "Cartera Setup";
        CarteraDoc: Record "Cartera Doc.";
    begin
        OnBeforeUpdateVendLedgerEntry(TempVendLedgEntry, ApplyingVendLedgEntry, AppliesToID);

        VendorLedgerEntry.Copy(TempVendLedgEntry);
        VendorLedgerEntry.TestField(Open, true);
        if VendorLedgerEntry."Document Situation" = VendorLedgerEntry."Document Situation"::"Posted BG/PO" then
            Error(CannotBeAppliedErr, VendorLedgerEntry.Description);
        if ApplyingVendLedgEntry."Document Situation" = ApplyingVendLedgEntry."Document Situation"::"Posted BG/PO" then
            Error(CannotBeAppliedErr, ApplyingVendLedgEntry.Description);

        if CarteraSetup.ReadPermission then
            if ((VendorLedgerEntry."Document Type" = VendorLedgerEntry."Document Type"::Bill) or
                 (VendorLedgerEntry."Document Type" = VendorLedgerEntry."Document Type"::Invoice))
            then
                if CarteraDoc.Get(CarteraDoc.Type::Payable, VendorLedgerEntry."Entry No.") then
                    if CarteraDoc."Bill Gr./Pmt. Order No." <> '' then
                        Error(CannotBeAppliedTryAgainErr, VendorLedgerEntry.Description);

        VendorLedgerEntry."Applies-to ID" := VendEntryApplID;
        if VendorLedgerEntry."Applies-to ID" = '' then begin
            VendorLedgerEntry."Accepted Pmt. Disc. Tolerance" := false;
            VendorLedgerEntry."Accepted Payment Tolerance" := 0;
        end;

        if ((VendorLedgerEntry."Amount to Apply" <> 0) and (VendEntryApplID = '')) or
           (VendEntryApplID = '')
        then
            VendorLedgerEntry."Amount to Apply" := 0
        else
            if VendorLedgerEntry."Amount to Apply" = 0 then begin
                VendorLedgerEntry.CalcFields("Remaining Amount");
                if VendorLedgerEntry."Remaining Amount" <> 0 then
                    VendorLedgerEntry."Amount to Apply" := VendorLedgerEntry."Remaining Amount";
            end;

        if VendorLedgerEntry."Entry No." = ApplyingVendLedgEntry."Entry No." then
            VendorLedgerEntry."Applying Entry" := ApplyingVendLedgEntry."Applying Entry";
        VendorLedgerEntry.Modify();

        OnAfterUpdateVendLedgerEntry(VendorLedgerEntry, TempVendLedgEntry, ApplyingVendLedgEntry, AppliesToID);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateVendLedgerEntry(var TempVendLedgEntry: Record "Vendor Ledger Entry" temporary; ApplyingVendLedgEntry: Record "Vendor Ledger Entry"; AppliesToID: Code[50])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateVendLedgerEntry(var VendorLedgerEntry: Record "Vendor Ledger Entry"; var TempVendLedgEntry: Record "Vendor Ledger Entry" temporary; ApplyingVendLedgEntry: Record "Vendor Ledger Entry"; AppliesToID: Code[50])
    begin
    end;
}

