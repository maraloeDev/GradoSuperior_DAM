table 50100 Vehicle
{
    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }

        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }

        field(3; Manufacturer; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Manufacturer';
        }

        field(4; Year; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Year';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}