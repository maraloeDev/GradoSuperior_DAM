table 10751 "SII Setup"
{
    Caption = 'SII VAT Setup';
    LookupPageID = "SII Setup";

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; Enabled; Boolean)
        {
            Caption = 'Enabled';

            trigger OnValidate()
            begin
                if Enabled and ("Certificate Code" = '') then
                    Error(CannotEnableWithoutCertificateErr);
            end;
        }
        field(3; Certificate; BLOB)
        {
            ObsoleteReason = 'Replaced with the Certificate Code field.';
            ObsoleteState = Removed;
            ObsoleteTag = '15.3';
            Caption = 'Certificate';
        }
        field(4; Password; Text[250])
        {
            ObsoleteReason = 'Replaced with the Certificate Code field.';
            ObsoleteState = Removed;
            ObsoleteTag = '15.3';
            Caption = 'Password';
        }
        field(5; InvoicesIssuedEndpointUrl; Text[250])
        {
            Caption = 'InvoicesIssuedEndpointUrl';
            InitValue = 'https://www1.agenciatributaria.gob.es/wlpl/SSII-FACT/ws/fe/SiiFactFEV1SOAP';
            NotBlank = true;
        }
        field(6; InvoicesReceivedEndpointUrl; Text[250])
        {
            Caption = 'InvoicesReceivedEndpointUrl';
            InitValue = 'https://www1.agenciatributaria.gob.es/wlpl/SSII-FACT/ws/fr/SiiFactFRV1SOAP';
            NotBlank = true;
        }
        field(7; PaymentsIssuedEndpointUrl; Text[250])
        {
            Caption = 'PaymentsIssuedEndpointUrl';
            InitValue = 'https://www1.agenciatributaria.gob.es/wlpl/SSII-FACT/ws/fr/SiiFactPAGV1SOAP';
            NotBlank = true;
        }
        field(8; PaymentsReceivedEndpointUrl; Text[250])
        {
            Caption = 'PaymentsReceivedEndpointUrl';
            InitValue = 'https://www1.agenciatributaria.gob.es/wlpl/SSII-FACT/ws/fe/SiiFactCOBV1SOAP';
            NotBlank = true;
        }
        field(9; IntracommunityEndpointUrl; Text[250])
        {
            Caption = 'IntracommunityEndpointUrl';
            InitValue = 'https://www1.agenciatributaria.gob.es/wlpl/SSII-FACT/ws/oi/SiiFactOIV1SOAP';
            NotBlank = true;
            ObsoleteReason = 'Intracommunity feature was removed in scope of 222210';
            ObsoleteState = Pending;
            ObsoleteTag = '15.0';
        }
        field(10; "Enable Batch Submissions"; Boolean)
        {
            Caption = 'Enable Batch Submissions';
        }
        field(11; "Job Batch Submission Threshold"; Integer)
        {
            Caption = 'Job Batch Submission Threshold';
            MinValue = 0;
        }
        field(12; "Show Advanced Actions"; Boolean)
        {
            Caption = 'Show Advanced Actions';
        }
        field(13; CollectionInCashEndpointUrl; Text[250])
        {
            Caption = 'CollectionInCashEndpointUrl';
            InitValue = 'https://www1.agenciatributaria.gob.es/wlpl/SSII-FACT/ws/pm/SiiFactCMV1SOAP';
            NotBlank = true;
        }
        field(20; "Invoice Amount Threshold"; Decimal)
        {
            Caption = 'Invoice Amount Threshold';
            InitValue = 100;
            MinValue = 0;
        }
        field(30; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(31; "Auto Missing Entries Check"; Option)
        {
            Caption = 'Auto Missing Entries Check';
            InitValue = Daily;
            OptionCaption = 'Never,Daily,Weekly';
            OptionMembers = Never,Daily,Weekly;

            trigger OnValidate()
            var
                SIIJobManagement: Codeunit "SII Job Management";
            begin
                if "Auto Missing Entries Check" = xRec."Auto Missing Entries Check" then
                    exit;

                SIIJobManagement.RestartJobQueueEntryForMissingEntryCheck("Auto Missing Entries Check");
            end;
        }
        field(40; "SuministroInformacion Schema"; Text[2048])
        {
            InitValue = 'https://www2.agenciatributaria.gob.es/static_files/common/internet/dep/aplicaciones/es/aeat/ssii/fact/ws/SuministroInformacion.xsd';
        }
        field(41; "SuministroLR Schema"; Text[2048])
        {
            InitValue = 'https://www2.agenciatributaria.gob.es/static_files/common/internet/dep/aplicaciones/es/aeat/ssii/fact/ws/SuministroLR.xsd';
        }
        field(42; "Certificate Code"; Code[20])
        {
            TableRelation = "Isolated Certificate";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Enabled := "Certificate Code" <> '';
            end;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Starting Date" := WorkDate;
    end;

    var
        CannotEnableWithoutCertificateErr: Label 'The setup cannot be enabled without a valid certificate.';
        SiiTxt: Label 'https://www2.agenciatributaria.gob.es/static_files/common/internet/dep/aplicaciones/es/aeat/ssii/fact/ws/SuministroInformacion.xsd', Locked = true;
        SiiLRTxt: Label 'https://www2.agenciatributaria.gob.es/static_files/common/internet/dep/aplicaciones/es/aeat/ssii/fact/ws/SuministroLR.xsd', Locked = true;
    procedure IsEnabled(): Boolean
    begin
        if not Get then
            exit(false);
        exit(Enabled);
    end;

    procedure SetDefaults()
    begin
        if ("SuministroInformacion Schema" <> '') and ("SuministroLR Schema" <> '') then
            exit;
        "SuministroInformacion Schema" := SiiTxt;
        "SuministroLR Schema" := SiiLRTxt;
        Modify(true);
    end;

}
