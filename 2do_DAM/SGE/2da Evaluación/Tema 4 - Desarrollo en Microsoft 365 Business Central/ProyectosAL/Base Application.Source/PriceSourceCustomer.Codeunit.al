codeunit 7032 "Price Source - Customer" implements "Price Source"
{
    var
        Customer: Record Customer;
        ParentErr: Label 'Parent Source No. must be blank for Customer source type.';

    procedure GetNo(var PriceSource: Record "Price Source")
    begin
        if Customer.GetBySystemId(PriceSource."Source ID") then begin
            PriceSource."Source No." := Customer."No.";
            FillAdditionalFields(PriceSource);
        end else
            PriceSource.InitSource();
    end;

    procedure GetId(var PriceSource: Record "Price Source")
    begin
        if Customer.Get(PriceSource."Source No.") then begin
            PriceSource."Source ID" := Customer.SystemId;
            FillAdditionalFields(PriceSource);
        end else
            PriceSource.InitSource();
    end;

    procedure IsForAmountType(AmountType: Enum "Price Amount Type"): Boolean
    begin
        exit(true);
    end;

    procedure IsSourceNoAllowed() Result: Boolean;
    begin
        Result := true;
    end;

    procedure IsLookupOK(var PriceSource: Record "Price Source"): Boolean
    begin
        if Customer.Get(PriceSource."Source No.") then;
        if Page.RunModal(Page::"Customer List", Customer) = ACTION::LookupOK then begin
            PriceSource.Validate("Source No.", Customer."No.");
            exit(true);
        end;
    end;

    procedure VerifyParent(var PriceSource: Record "Price Source") Result: Boolean
    begin
        if PriceSource."Parent Source No." <> '' then
            Error(ParentErr);
    end;

    procedure GetGroupNo(PriceSource: Record "Price Source"): Code[20];
    begin
        exit(PriceSource."Source No.");
    end;

    local procedure FillAdditionalFields(var PriceSource: Record "Price Source")
    begin
        PriceSource."Currency Code" := Customer."Currency Code";
        PriceSource."Allow Line Disc." := Customer."Allow Line Disc.";
        PriceSource."Price Includes VAT" := Customer."Prices Including VAT";
        PriceSource."VAT Bus. Posting Gr. (Price)" := Customer."VAT Bus. Posting Group";
    end;
}