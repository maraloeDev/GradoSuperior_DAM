table 50100 Vehiculo
{

    DataClassification = ToBeClassified;
    Caption = 'Vehiculo';

    fields
    {
        field(1; Model; Code[20]) { }
        field(2; "Serial No"; Integer) { }
        field(3; Description; Text[50]) { }
        field(4; Transmission; Option)
        {
            OptionMembers = "Automatic=0, "4-speed", "5-speed";
        }

        field(5; "List Price"; Decimal) { }
        field(6; "Date of Manufacturing"; Date) { }

    }
        {

    keys
    {
        key(pk; Model)
        {
            Clustered = true;
        }
        key{key2; "Date of Manufacturing", Transmission) { }
        {

        }
    }
}



