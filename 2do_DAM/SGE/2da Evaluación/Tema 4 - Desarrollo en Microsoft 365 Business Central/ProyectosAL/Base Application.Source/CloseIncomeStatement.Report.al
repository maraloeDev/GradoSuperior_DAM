report 94 "Close Income Statement"
{
    // Missing code from W1 due to ES modifications in this object

    AdditionalSearchTerms = 'year closing statement,close accounting period statement,close fiscal year statement';
    ApplicationArea = Basic, Suite;
    Caption = 'Close Income Statement';
    Permissions = TableData "G/L Entry" = m;
    ProcessingOnly = true;
    UsageCategory = Tasks;

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = SORTING("No.") WHERE("Account Type" = CONST(Posting), "Income/Balance" = FILTER("Income Statement" | Capital));
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLink = "G/L Account No." = FIELD("No.");
                DataItemTableView = SORTING("G/L Account No.", "Posting Date");

                trigger OnAfterGetRecord()
                var
                    TempDimBuf: Record "Dimension Buffer" temporary;
                    TempDimBuf2: Record "Dimension Buffer" temporary;
                    DimensionBufferID: Integer;
                    RowOffset: Integer;
                begin
                    EntryCount := EntryCount + 1;
                    if CurrentDateTime - LastWindowUpdateDateTime > 1000 then begin
                        LastWindowUpdateDateTime := CurrentDateTime;
                        Window.Update(3, Round(EntryCount / MaxEntry * 10000, 1));
                    end;

                    if GroupSum then begin
                        CalcSumsInFilter("G/L Entry", RowOffset);
                        GetGLEntryDimensions("Entry No.", TempDimBuf, "Dimension Set ID");
                    end;

                    if (Amount <> 0) or ("Additional-Currency Amount" <> 0) then begin
                        if not GroupSum then begin
                            TotalAmount += Amount;
                            if GLSetup."Additional Reporting Currency" <> '' then
                                TotalAmountAddCurr += "Additional-Currency Amount";

                            GetGLEntryDimensions("Entry No.", TempDimBuf, "Dimension Set ID");
                        end;

                        if TempSelectedDim.Find('-') then
                            repeat
                                if TempDimBuf.Get(DATABASE::"G/L Entry", "Entry No.", TempSelectedDim."Dimension Code")
                                then begin
                                    TempDimBuf2."Table ID" := TempDimBuf."Table ID";
                                    TempDimBuf2."Dimension Code" := TempDimBuf."Dimension Code";
                                    TempDimBuf2."Dimension Value Code" := TempDimBuf."Dimension Value Code";
                                    TempDimBuf2.Insert();
                                end;
                            until TempSelectedDim.Next = 0;

                        DimensionBufferID := DimBufMgt.GetDimensionId(TempDimBuf2);

                        EntryNoAmountBuf.Reset();
                        if ClosePerBusUnit and FieldActive("Business Unit Code") then
                            EntryNoAmountBuf."Business Unit Code" := "Business Unit Code"
                        else
                            EntryNoAmountBuf."Business Unit Code" := '';
                        EntryNoAmountBuf."Entry No." := DimensionBufferID;
                        if EntryNoAmountBuf.Find then begin
                            EntryNoAmountBuf.Amount := EntryNoAmountBuf.Amount + Amount;
                            EntryNoAmountBuf.Amount2 := EntryNoAmountBuf.Amount2 + "Additional-Currency Amount";
                            EntryNoAmountBuf.Modify();
                        end else begin
                            EntryNoAmountBuf.Amount := Amount;
                            EntryNoAmountBuf.Amount2 := "Additional-Currency Amount";
                            EntryNoAmountBuf.Insert();
                        end;
                    end;

                    if GroupSum then
                        Next(RowOffset);
                end;

                trigger OnPostDataItem()
                var
                    TempDimBuf2: Record "Dimension Buffer" temporary;
                    GlobalDimVal1: Code[20];
                    GlobalDimVal2: Code[20];
                    NewDimensionID: Integer;
                begin
                    GenJnlLine.Init();
                    GenJnlLine."Posting Date" := FiscYearClosingDate;
                    GenJnlLine."Document No." := DocNo;
                    GenJnlLine.Description := PostingDescription;

                    EntryNoAmountBuf.Reset();
                    MaxEntry := EntryNoAmountBuf.Count();
                    EntryCount := 0;
                    Window.Update(2, Text012);
                    Window.Update(3, 0);

                    if EntryNoAmountBuf.Find('-') then
                        repeat
                            EntryCount := EntryCount + 1;
                            if CurrentDateTime - LastWindowUpdateDateTime > 1000 then begin
                                LastWindowUpdateDateTime := CurrentDateTime;
                                Window.Update(3, Round(EntryCount / MaxEntry * 10000, 1));
                            end;

                            if (EntryNoAmountBuf.Amount <> 0) or (EntryNoAmountBuf.Amount2 <> 0) then begin
                                GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
                                GenJnlLine."Account No." := "G/L Account No.";
                                GenJnlLine."Source Code" := SourceCodeSetup."Close Income Statement";
                                GenJnlLine."Reason Code" := GenJnlBatch."Reason Code";
                                GenJnlLine.Validate(Amount, -EntryNoAmountBuf.Amount);
                                GenJnlLine."System-Created Entry" := true;
                                GenJnlLine."Source Currency Amount" := -EntryNoAmountBuf.Amount2;
                                GenJnlLine."Business Unit Code" := EntryNoAmountBuf."Business Unit Code";

                                TempDimBuf2.DeleteAll();
                                DimBufMgt.RetrieveDimensions(EntryNoAmountBuf."Entry No.", TempDimBuf2);
                                NewDimensionID := DimMgt.CreateDimSetIDFromDimBuf(TempDimBuf2);
                                GenJnlLine."Dimension Set ID" := NewDimensionID;
                                DimMgt.UpdateGlobalDimFromDimSetID(NewDimensionID, GlobalDimVal1, GlobalDimVal2);
                                if ClosePerGlobalDim1 then
                                    GenJnlLine."Shortcut Dimension 1 Code" := GlobalDimVal1;
                                if ClosePerGlobalDim2 then
                                    GenJnlLine."Shortcut Dimension 2 Code" := GlobalDimVal2;

                                HandleGenJnlLine;
                                UpdateBalAcc;
                            end;
                        until EntryNoAmountBuf.Next = 0;

                    EntryNoAmountBuf.DeleteAll();
                end;

                trigger OnPreDataItem()
                begin
                    Window.Update(2, Text013);
                    Window.Update(3, 0);

                    if ClosePerGlobalDimOnly or ClosePerBusUnit then
                        case true of
                            ClosePerBusUnit and (ClosePerGlobalDim1 or ClosePerGlobalDim2):
                                SetCurrentKey(
                                  "G/L Account No.", "Business Unit Code",
                                  "Global Dimension 1 Code", "Global Dimension 2 Code", "Posting Date");
                            ClosePerBusUnit and not (ClosePerGlobalDim1 or ClosePerGlobalDim2):
                                SetCurrentKey(
                                  "G/L Account No.", "Business Unit Code", "Posting Date");
                            not ClosePerBusUnit and (ClosePerGlobalDim1 or ClosePerGlobalDim2):
                                SetCurrentKey(
                                  "G/L Account No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Posting Date");
                        end;

                    SetRange("Posting Date", FiscalYearStartDate, FiscYearClosingDate);

                    MaxEntry := Count;

                    EntryNoAmountBuf.DeleteAll();
                    EntryCount := 0;

                    LastWindowUpdateDateTime := CurrentDateTime;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                ThisAccountNo := ThisAccountNo + 1;
                Window.Update(1, "No.");
                Window.Update(4, Round(ThisAccountNo / NoOfAccounts * 10000, 1));
                Window.Update(2, '');
                Window.Update(3, 0);
            end;

            trigger OnPreDataItem()
            begin
                NoOfAccounts := "G/L Account".Count();
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(FiscalYearEndingDate; EndDateReq)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Fiscal Year Ending Date';
                        ToolTip = 'Specifies the last date in the closed fiscal year. This date is used to determine the closing date.';

                        trigger OnValidate()
                        begin
                            ValidateEndDate(true);
                        end;
                    }
                    field(GenJournalTemplate; GenJnlLine."Journal Template Name")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Gen. Journal Template';
                        TableRelation = "Gen. Journal Template";
                        ToolTip = 'Specifies the general journal template that is used by the batch job.';

                        trigger OnValidate()
                        begin
                            GenJnlLine."Journal Batch Name" := '';
                            DocNo := '';
                        end;
                    }
                    field(GenJournalBatch; GenJnlLine."Journal Batch Name")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Gen. Journal Batch';
                        Lookup = true;
                        ToolTip = 'Specifies the general journal batch that is used by the batch job.';

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            GenJnlLine.TestField("Journal Template Name");
                            GenJnlTemplate.Get(GenJnlLine."Journal Template Name");
                            GenJnlBatch.FilterGroup(2);
                            GenJnlBatch.SetRange("Journal Template Name", GenJnlLine."Journal Template Name");
                            GenJnlBatch.FilterGroup(0);
                            GenJnlBatch."Journal Template Name" := GenJnlLine."Journal Template Name";
                            GenJnlBatch.Name := GenJnlLine."Journal Batch Name";
                            if PAGE.RunModal(0, GenJnlBatch) = ACTION::LookupOK then begin
                                Text := GenJnlBatch.Name;
                                exit(true);
                            end;
                        end;

                        trigger OnValidate()
                        begin
                            if GenJnlLine."Journal Batch Name" <> '' then begin
                                GenJnlLine.TestField("Journal Template Name");
                                GenJnlBatch.Get(GenJnlLine."Journal Template Name", GenJnlLine."Journal Batch Name");
                            end;
                            ValidateJnl;
                        end;
                    }
                    field(DocumentNo; DocNo)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Document No.';
                        ToolTip = 'Specifies the number of the document that is processed by the report or batch job.';
                    }
                    field(RetainedEarningsAcc; RetainedEarningsGLAcc."No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Retained Earnings Acc.';
                        TableRelation = "G/L Account" WHERE("Account Type" = CONST(Posting),
                                                             "Account Category" = FILTER(" " | Equity),
                                                             "Income/Balance" = CONST("Balance Sheet"));
                        ToolTip = 'Specifies the retained earnings account that the batch job posts to. This account should be the same as the account that is used by the Close Income Statement batch job.';

                        trigger OnValidate()
                        begin
                            if RetainedEarningsGLAcc."No." <> '' then begin
                                RetainedEarningsGLAcc.Find;
                                RetainedEarningsGLAcc.CheckGLAcc;
                            end;
                        end;
                    }
                    field(PostingDescription; PostingDescription)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posting Description';
                        ToolTip = 'Specifies the description that accompanies the posting.';
                    }
                    group("Close by")
                    {
                        Caption = 'Close by';
                        field(ClosePerBusUnit; ClosePerBusUnit)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Business Unit Code';
                            ToolTip = 'Specifies the code for the business unit, in a company group structure.';
                        }
                        field(Dimensions; ColumnDim)
                        {
                            ApplicationArea = Dimensions;
                            Caption = 'Dimensions';
                            Editable = false;
                            ToolTip = 'Specifies dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                            trigger OnAssistEdit()
                            var
                                TempSelectedDim2: Record "Selected Dimension" temporary;
                                s: Text[1024];
                            begin
                                DimSelectionBuf.SetDimSelectionMultiple(3, REPORT::"Close Income Statement", ColumnDim);

                                SelectedDim.GetSelectedDim(UserId, 3, REPORT::"Close Income Statement", '', TempSelectedDim2);
                                s := CheckDimPostingRules(TempSelectedDim2);
                                if s <> '' then
                                    Message(s);
                            end;
                        }
                    }
                    field(InventoryPeriodClosed; IsInvtPeriodClosed)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Inventory Period Closed';
                        ToolTip = 'Specifies that the inventory period has been closed.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        var
            GLAccount: Record "G/L Account";
            GLAccountCategory: Record "G/L Account Category";
        begin
            if PostingDescription = '' then
                PostingDescription :=
                  CopyStr(ObjTransl.TranslateObject(ObjTransl."Object Type"::Report, REPORT::"Close Income Statement"), 1, 30);
            EndDateReq := 0D;
            AccountingPeriod.SetRange("New Fiscal Year", true);
            AccountingPeriod.SetRange("Date Locked", true);
            if AccountingPeriod.FindLast then begin
                EndDateReq := AccountingPeriod."Starting Date" - 1;
                if not ValidateEndDate(false) then
                    EndDateReq := 0D;
            end else
                if EndDateReq = 0D then
                    Error(NoFiscalYearsErr);
            ValidateJnl;
            ColumnDim := DimSelectionBuf.GetDimSelectionText(3, REPORT::"Close Income Statement", '');
            if RetainedEarningsGLAcc."No." = '' then begin
                GLAccountCategory.SetRange("Account Category", GLAccountCategory."Account Category"::Equity);
                GLAccountCategory.SetRange(
                  "Additional Report Definition", GLAccountCategory."Additional Report Definition"::"Retained Earnings");
                if GLAccountCategory.FindFirst then begin
                    GLAccount.SetRange("Account Subcategory Entry No.", GLAccountCategory."Entry No.");
                    if GLAccount.FindFirst then
                        RetainedEarningsGLAcc."No." := GLAccount."No.";
                end;
            end;
        end;
    }

    labels
    {
    }

    trigger OnPostReport()
    var
        UpdateAnalysisView: Codeunit "Update Analysis View";
    begin
        InsBalLines;

        if not GenJnlLine.Find('-') then
            exit;

        Window.Close;
        Window.Open(
          Text1100100);

        NoOfRecords := GenJnlLine.Count();
        Window.Update(1, LineCount);
        repeat
            GenJnlLine2 := GenJnlLine;
            LineCount := LineCount + 1;
            Window.Update(2, Round(LineCount / NoOfRecords * 10000, 1));
            GenJnlPostLine.Run(GenJnlLine2);
        until GenJnlLine.Next = 0;
        UpdateAnalysisView.UpdateAll(0, true);
    end;

    trigger OnPreReport()
    var
        s: Text[1024];
        IsHandled: Boolean;
    begin
        if EndDateReq = 0D then
            Error(Text000);
        ValidateEndDate(true);
        if DocNo = '' then
            Error(Text001);

        SelectedDim.GetSelectedDim(UserId, 3, REPORT::"Close Income Statement", '', TempSelectedDim);
        IsHandled := false;
        OnPreReportOnBeforeCheckDimPostingRules(IsHandled);
        if not IsHandled then begin
            s := CheckDimPostingRules(TempSelectedDim);
            if s <> '' then
                if not Confirm(s + Text007, false) then
                    Error('');
        end;

        GenJnlBatch.Get(GenJnlLine."Journal Template Name", GenJnlLine."Journal Batch Name");
        SourceCodeSetup.Get();
        GLSetup.Get();
        if GLSetup."Additional Reporting Currency" <> '' then begin
            if RetainedEarningsGLAcc."No." = '' then
                Error(Text002);
            if not Confirm(
                 Text003 +
                 Text005 +
                 Text007, false)
            then
                Error('');
        end;

        Window.Open(Text008 + Text009 + Text019 + Text010 + Text011);

        ClosePerGlobalDim1 := false;
        ClosePerGlobalDim2 := false;
        ClosePerGlobalDimOnly := true;

        if TempSelectedDim.Find('-') then
            repeat
                if TempSelectedDim."Dimension Code" = GLSetup."Global Dimension 1 Code" then
                    ClosePerGlobalDim1 := true;
                if TempSelectedDim."Dimension Code" = GLSetup."Global Dimension 2 Code" then
                    ClosePerGlobalDim2 := true;
                if (TempSelectedDim."Dimension Code" <> GLSetup."Global Dimension 1 Code") and
                   (TempSelectedDim."Dimension Code" <> GLSetup."Global Dimension 2 Code")
                then
                    ClosePerGlobalDimOnly := false;
            until TempSelectedDim.Next = 0;
        Clear(GenJnlPostLine);
    end;

    var
        AccountingPeriod: Record "Accounting Period";
        SourceCodeSetup: Record "Source Code Setup";
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlBatch: Record "Gen. Journal Batch";
        GenJnlLine: Record "Gen. Journal Line" temporary;
        RetainedEarningsGLAcc: Record "G/L Account";
        GLSetup: Record "General Ledger Setup";
        DimSelectionBuf: Record "Dimension Selection Buffer";
        ObjTransl: Record "Object Translation";
        SelectedDim: Record "Selected Dimension";
        TempSelectedDim: Record "Selected Dimension" temporary;
        EntryNoAmountBuf: Record "Entry No. Amount Buffer" temporary;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        DimMgt: Codeunit DimensionManagement;
        DimBufMgt: Codeunit "Dimension Buffer Management";
        Window: Dialog;
        FiscalYearStartDate: Date;
        FiscYearClosingDate: Date;
        EndDateReq: Date;
        DocNo: Code[20];
        PostingDescription: Text[100];
        ClosePerBusUnit: Boolean;
        ClosePerGlobalDim1: Boolean;
        ClosePerGlobalDim2: Boolean;
        ClosePerGlobalDimOnly: Boolean;
        TotalAmount: Decimal;
        TotalAmountAddCurr: Decimal;
        ColumnDim: Text[250];
        NoOfAccounts: Integer;
        ThisAccountNo: Integer;
        Text000: Label 'Enter the ending date for the fiscal year.';
        Text001: Label 'Enter a Document No.';
        Text002: Label 'Enter Retained Earnings Account No.';
        Text003: Label 'By using an additional reporting currency, this batch job will post closing entries directly to the general ledger.  ';
        Text005: Label 'These closing entries will not be transferred to a general journal before the program posts them to the general ledger.\\ ';
        Text007: Label '\Do you want to continue?';
        Text008: Label 'Creating general journal lines...\\';
        Text009: Label 'Account No.         #1##################\';
        Text010: Label 'Now performing      #2##################\';
        Text011: Label '                    @3@@@@@@@@@@@@@@@@@@\';
        Text019: Label '                    @4@@@@@@@@@@@@@@@@@@\';
        Text012: Label 'Creating Gen. Journal lines';
        Text013: Label 'Calculating Amounts';
        Text014: Label 'The fiscal year must be closed before the income statement can be closed.';
        Text015: Label 'The fiscal year does not exist.';
        Text020: Label 'The following G/L Accounts have mandatory dimension codes that have not been selected:';
        Text021: Label '\\In order to post to these accounts you must also select these dimensions:';
        MaxEntry: Integer;
        EntryCount: Integer;
        LastWindowUpdateDateTime: DateTime;
        GenJnlLine2: Record "Gen. Journal Line";
        BalLineBuffer: Record "Inc. Stmt. Clos. Buffer" temporary;
        LineCount: Integer;
        NoOfRecords: Integer;
        Text1100100: Label 'Posting lines         #1###### @2@@@@@@@@@@@@@';
        NoFiscalYearsErr: Label 'No closed fiscal year exists.';

    local procedure ValidateEndDate(RealMode: Boolean): Boolean
    var
        OK: Boolean;
    begin
        if EndDateReq = 0D then
            exit;

        OK := AccountingPeriod.Get(EndDateReq + 1);
        if OK then
            OK := AccountingPeriod."New Fiscal Year";
        if OK then begin
            if not AccountingPeriod."Date Locked" then begin
                if not RealMode then
                    exit;
                Error(Text014);
            end;
            FiscYearClosingDate := ClosingDate(EndDateReq);
            AccountingPeriod.SetRange("New Fiscal Year", true);
            OK := AccountingPeriod.Find('<');
            FiscalYearStartDate := AccountingPeriod."Starting Date";
        end;
        if not OK then begin
            if not RealMode then
                exit;
            Error(Text015);
        end;
        exit(true);
    end;

    local procedure ValidateJnl()
    begin
        DocNo := '';
        if GenJnlBatch.Get(GenJnlLine."Journal Template Name", GenJnlLine."Journal Batch Name") then
            if GenJnlBatch."No. Series" <> '' then
                DocNo := NoSeriesMgt.TryGetNextNo(GenJnlBatch."No. Series", EndDateReq);
    end;

    local procedure HandleGenJnlLine()
    begin
        OnBeforeHandleGenJnlLine(GenJnlLine);

        GenJnlLine."Additional-Currency Posting" :=
          GenJnlLine."Additional-Currency Posting"::None;
        if GLSetup."Additional Reporting Currency" <> '' then begin
            GenJnlLine."Source Currency Code" := GLSetup."Additional Reporting Currency";
            if ZeroGenJnlAmount then begin
                GenJnlLine."Additional-Currency Posting" :=
                  GenJnlLine."Additional-Currency Posting"::"Additional-Currency Amount Only";
                GenJnlLine.Validate(Amount, GenJnlLine."Source Currency Amount");
                GenJnlLine."Source Currency Amount" := 0;
            end;
            if GenJnlLine.Amount <> 0 then
                if not ((GenJnlLine.Amount = 0) and (GenJnlLine."Source Currency Amount" <> 0)) then
                    GenJnlLine.Insert();
        end else
            if not ZeroGenJnlAmount then
                GenJnlLine.Insert();
    end;

    local procedure CalcSumsInFilter(var GLEntrySource: Record "G/L Entry"; var Offset: Integer)
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.CopyFilters(GLEntrySource);
        if ClosePerBusUnit then begin
            GLEntry.SetRange("Business Unit Code", GLEntrySource."Business Unit Code");
            GenJnlLine."Business Unit Code" := GLEntrySource."Business Unit Code";
        end;
        if ClosePerGlobalDim1 then begin
            GLEntry.SetRange("Global Dimension 1 Code", GLEntrySource."Global Dimension 1 Code");
            if ClosePerGlobalDim2 then
                GLEntry.SetRange("Global Dimension 2 Code", GLEntrySource."Global Dimension 2 Code");
        end;

        GLEntry.CalcSums(Amount);
        GLEntrySource.Amount := GLEntry.Amount;
        TotalAmount += GLEntrySource.Amount;
        if GLSetup."Additional Reporting Currency" <> '' then begin
            GLEntry.CalcSums("Additional-Currency Amount");
            GLEntrySource."Additional-Currency Amount" := GLEntry."Additional-Currency Amount";
            TotalAmountAddCurr += GLEntrySource."Additional-Currency Amount";
        end;
        Offset := GLEntry.Count - 1;
    end;

    local procedure GetGLEntryDimensions(EntryNo: Integer; var DimBuf: Record "Dimension Buffer"; DimensionSetID: Integer)
    var
        DimSetEntry: Record "Dimension Set Entry";
    begin
        DimSetEntry.SetRange("Dimension Set ID", DimensionSetID);
        if DimSetEntry.FindSet then
            repeat
                DimBuf."Table ID" := DATABASE::"G/L Entry";
                DimBuf."Entry No." := EntryNo;
                DimBuf."Dimension Code" := DimSetEntry."Dimension Code";
                DimBuf."Dimension Value Code" := DimSetEntry."Dimension Value Code";
                DimBuf.Insert();
            until DimSetEntry.Next = 0;
    end;

    local procedure CheckDimPostingRules(var SelectedDim: Record "Selected Dimension"): Text[1024]
    var
        DefaultDim: Record "Default Dimension";
        ErrorText: Text[1024];
        DimText: Text[1024];
        PrevAcc: Code[20];
        Handled: Boolean;
    begin
        OnBeforeCheckDimPostingRules(SelectedDim, ErrorText, Handled, GenJnlLine);
        if Handled then
            exit(ErrorText);

        DefaultDim.SetRange("Table ID", DATABASE::"G/L Account");
        DefaultDim.SetFilter(
          "Value Posting", '%1|%2',
          DefaultDim."Value Posting"::"Same Code", DefaultDim."Value Posting"::"Code Mandatory");

        if DefaultDim.Find('-') then
            repeat
                SelectedDim.SetRange("Dimension Code", DefaultDim."Dimension Code");
                if not SelectedDim.Find('-') then begin
                    if StrPos(DimText, DefaultDim."Dimension Code") < 1 then
                        DimText := DimText + ' ' + Format(DefaultDim."Dimension Code");
                    if PrevAcc <> DefaultDim."No." then begin
                        PrevAcc := DefaultDim."No.";
                        if ErrorText = '' then
                            ErrorText := Text020;
                        ErrorText := ErrorText + ' ' + Format(DefaultDim."No.");
                    end;
                end;
                SelectedDim.SetRange("Dimension Code");
            until (DefaultDim.Next = 0) or (StrLen(ErrorText) > MaxStrLen(ErrorText) - MaxStrLen(DefaultDim."No.") - StrLen(Text021) - 1);
        if ErrorText <> '' then
            ErrorText := CopyStr(ErrorText + Text021 + DimText, 1, MaxStrLen(ErrorText));
        exit(ErrorText);
    end;

    local procedure IsInvtPeriodClosed(): Boolean
    var
        AccPeriod: Record "Accounting Period";
        InvtPeriod: Record "Inventory Period";
    begin
        if EndDateReq = 0D then
            exit;
        AccPeriod.Get(EndDateReq + 1);
        AccPeriod.Next(-1);
        exit(InvtPeriod.IsInvtPeriodClosed(AccPeriod."Starting Date"));
    end;

    procedure InitializeRequestTest(EndDate: Date; GenJournalLine: Record "Gen. Journal Line"; GLAccount: Record "G/L Account"; CloseByBU: Boolean)
    begin
        EndDateReq := EndDate;
        GenJnlLine := GenJournalLine;
        ValidateJnl;
        RetainedEarningsGLAcc := GLAccount;
        ClosePerBusUnit := CloseByBU;
    end;

    [Scope('OnPrem')]
    procedure UpdateBalAcc()
    var
        GLAcc: Record "G/L Account";
    begin
        GLAcc.Get(GenJnlLine."Account No.");
        if not BalLineBuffer.Get(GLAcc."Income Stmt. Bal. Acc.") then begin
            GLAcc.TestField("Income Stmt. Bal. Acc.");
            BalLineBuffer."Account No." := GLAcc."Income Stmt. Bal. Acc.";
            if GenJnlLine."Additional-Currency Posting" =
               GenJnlLine."Additional-Currency Posting"::"Additional-Currency Amount Only"
            then begin
                BalLineBuffer."Additional-Currency Amount" := GenJnlLine.Amount;
                BalLineBuffer.Amount := 0;
            end else begin
                BalLineBuffer.Amount := GenJnlLine.Amount;
                BalLineBuffer."Additional-Currency Amount" := GenJnlLine."Source Currency Amount";
            end;
            BalLineBuffer.Insert();
        end else begin
            if GenJnlLine."Additional-Currency Posting" =
               GenJnlLine."Additional-Currency Posting"::"Additional-Currency Amount Only"
            then
                BalLineBuffer."Additional-Currency Amount" := GenJnlLine.Amount + BalLineBuffer."Additional-Currency Amount"
            else begin
                BalLineBuffer.Amount := BalLineBuffer.Amount + GenJnlLine.Amount;
                BalLineBuffer."Additional-Currency Amount" :=
                  GenJnlLine."Source Currency Amount" + BalLineBuffer."Additional-Currency Amount";
            end;
            BalLineBuffer.Modify();
        end;
    end;

    [Scope('OnPrem')]
    procedure InsBalLines()
    begin
        if BalLineBuffer.Find('-') then
            repeat
                GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
                GenJnlLine."Account No." := BalLineBuffer."Account No.";
                GenJnlLine."Source Code" := SourceCodeSetup."Close Income Statement";
                GenJnlLine."Reason Code" := GenJnlBatch."Reason Code";
                GenJnlLine."Additional-Currency Posting" :=
                  GenJnlLine."Additional-Currency Posting"::None;
                if GLSetup."Additional Reporting Currency" <> '' then begin
                    GenJnlLine."Source Currency Code" := GLSetup."Additional Reporting Currency";
                    if (GenJnlLine.Amount = 0) and
                       (GenJnlLine."Source Currency Amount" <> 0)
                    then begin
                        GenJnlLine.Validate(Amount, -BalLineBuffer."Additional-Currency Amount");
                        GenJnlLine.Validate("Source Currency Amount", 0);
                        GenJnlLine."Additional-Currency Posting" :=
                          GenJnlLine."Additional-Currency Posting"::"Additional-Currency Amount Only";
                    end else begin
                        GenJnlLine.Validate(Amount, -BalLineBuffer.Amount);
                        GenJnlLine.Validate("Source Currency Amount", -BalLineBuffer."Additional-Currency Amount");
                    end;
                end else
                    GenJnlLine.Validate(Amount, -BalLineBuffer.Amount);
                GenJnlLine."System-Created Entry" := true;
                GenJnlLine.Insert();
            until BalLineBuffer.Next = 0;
    end;

    [Scope('OnPrem')]
    procedure InitializeRequest(EndDateReq2: Date; GenJnlTemplate2: Code[10]; GenJnlBatchName2: Code[10]; DocNo2: Code[10]; PostingDescription2: Text[50]; ClosePerBusUnit2: Boolean; ClosePerDept2: Boolean; ClosePerProj2: Boolean; RetainedAccNo: Code[20])
    begin
        EndDateReq := EndDateReq2;
        GenJnlLine."Journal Template Name" := GenJnlTemplate2;
        GenJnlLine."Journal Batch Name" := GenJnlBatchName2;
        DocNo := DocNo2;
        PostingDescription := PostingDescription2;
        ClosePerBusUnit := ClosePerBusUnit2;
        ClosePerGlobalDim1 := ClosePerDept2;
        ClosePerGlobalDim2 := ClosePerProj2;
        RetainedEarningsGLAcc."No." := RetainedAccNo;
    end;

    local procedure ZeroGenJnlAmount(): Boolean
    begin
        exit((GenJnlLine.Amount = 0) and (GenJnlLine."Source Currency Amount" <> 0))
    end;

    local procedure GroupSum(): Boolean
    begin
        exit(ClosePerGlobalDimOnly and (ClosePerBusUnit or ClosePerGlobalDim1));
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckDimPostingRules(var SelectedDimension: Record "Selected Dimension"; var ErrorText: Text[1024]; var Handled: Boolean; GenJnlLine: Record "Gen. Journal Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeHandleGenJnlLine(var GenJournalLine: Record "Gen. Journal Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnPreReportOnBeforeCheckDimPostingRules(var IsHandled: Boolean)
    begin
    end;
}

