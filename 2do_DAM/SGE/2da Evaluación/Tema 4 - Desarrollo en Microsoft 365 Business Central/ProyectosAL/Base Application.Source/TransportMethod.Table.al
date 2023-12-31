table 259 "Transport Method"
{
    Caption = 'Transport Method';
    LookupPageID = "Transport Methods";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(10700; "Port/Airport"; Boolean)
        {
            Caption = 'Port/Airport';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Description, "Port/Airport")
        {
        }
    }
}

