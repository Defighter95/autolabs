object Form2: TForm2
  Left = 492
  Top = 413
  BorderStyle = bsToolWindow
  Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1077' '#1051#1056'. '#1057#1090#1091#1076#1077#1085#1090
  ClientHeight = 455
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 583
    Height = 335
    Align = alClient
    DataSource = DataSource1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Times New Roman'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Names'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1051#1056
        Width = 321
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Time_for_work(min)'
        Title.Caption = #1042#1088#1077#1084#1103' ('#1084#1080#1085'.)'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Times_less'
        Title.Caption = #1054#1089#1090#1072#1083#1086#1089#1100' ('#1084#1080#1085'.)'
        Width = 121
        Visible = True
      end>
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 335
    Width = 583
    Height = 120
    Align = alBottom
    ColCount = 3
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 1
    Visible = False
    ColWidths = (
      259
      73
      202)
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Labs'
    Left = 48
    Top = 408
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 88
    Top = 408
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Us' +
      'ers\'#1048#1083#1100#1103'\Documents\Dyplom\db.mdb;Mode=Share Deny None;Persist Se' +
      'curity Info=False;Jet OLEDB:System database="";Jet OLEDB:Registr' +
      'y Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5' +
      ';Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk' +
      ' Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Databa' +
      'se Password="";Jet OLEDB:Create System Database=False;Jet OLEDB:' +
      'Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compact=Fa' +
      'lse;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP' +
      '=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 8
    Top = 408
  end
  object MainMenu1: TMainMenu
    Left = 128
    Top = 408
    object Jgwbb1: TMenuItem
      Caption = #1054#1087#1094#1080#1080
      object N2: TMenuItem
        Caption = #1057#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N1: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N1Click
      end
    end
    object N4: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object N5: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1082#1072
        Hint = #1084
        ShortCut = 112
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N6Click
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 168
    Top = 408
  end
  object FWTrayIcon1: TFWTrayIcon
    OnDblClick = FWTrayIcon1DblClick
    Left = 208
    Top = 408
  end
  object ADOTable2: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Works'
    Left = 48
    Top = 368
  end
  object ZipForge1: TZipForge
    ExtractCorruptedFiles = False
    CompressionLevel = clFastest
    CompressionMode = 1
    CurrentVersion = '5.01 '
    SpanningMode = smNone
    SpanningOptions.AdvancedNaming = False
    SpanningOptions.VolumeSize = vsAutoDetect
    Options.FlushBuffers = True
    Options.OEMFileNames = True
    InMemory = False
    Zip64Mode = zmDisabled
    UnicodeFilenames = True
    EncryptionMethod = caPkzipClassic
    Left = 248
    Top = 408
  end
  object ADOTable3: TADOTable
    Connection = ADOConnection1
    TableName = 'Passwords'
    Left = 88
    Top = 368
  end
end
