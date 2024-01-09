page 50100 "Vehiculo List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Vehiculo";
    //Permite hacer una modificación en la lista
    SourceTableView = sorting("Date of Manufacturing", "Transmission");

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Model; Rec.Model) { ApplicationArea = All; } //Sirve para que se muestre en todas las areas
                field("Serial No."; Rec."Serial No") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field(Transmission; Rec.Transmission) { ApplicationArea = All; }
                field("List Price"; Rec."List Price") { ApplicationArea = All; }
                field("Date of Manufacturing"; Rec."Date of Manufacturing") { ApplicationArea = All; }
            }

        }
    }
}