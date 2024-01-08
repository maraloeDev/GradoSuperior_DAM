page 50100 "Vehiculo List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Vehiculo";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Model; Rec.Model) { ApplicationArea = All; }
                field("Serial No."; Rec."Serial No") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field(Transmission; Rec.Transmission) { ApplicationArea = All; }
                field("List Price"; Rec."List Price") { ApplicationArea = All; }
                field("Date of Manufacturing"; Rec."Date of Manufacturing") { ApplicationArea = All; }
            }

        }
    }
}