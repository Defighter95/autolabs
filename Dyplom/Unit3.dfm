object Form3: TForm3
  Left = 822
  Top = 452
  BorderStyle = bsToolWindow
  Caption = #1057#1084#1077#1085#1072' '#1087#1072#1088#1086#1083#1103
  ClientHeight = 150
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 29
    Top = 21
    Width = 93
    Height = 15
    Caption = #1058#1077#1082#1091#1097#1080#1081' '#1087#1072#1088#1086#1083#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 53
    Width = 80
    Height = 15
    Caption = #1053#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 10
    Top = 83
    Width = 112
    Height = 15
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 128
    Top = 16
    Width = 153
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 128
    Top = 48
    Width = 153
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 128
    Top = 80
    Width = 153
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object Button1: TButton
    Left = 8
    Top = 112
    Width = 121
    Height = 25
    Caption = #1057#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
    Default = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 160
    Top = 112
    Width = 121
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button2Click
  end
  object ADOTable1: TADOTable
    Connection = Form2.ADOConnection1
    TableName = 'Passwords'
    Left = 264
    Top = 120
  end
end
