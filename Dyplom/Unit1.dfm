object Form1: TForm1
  Left = 695
  Top = 409
  BorderStyle = bsToolWindow
  Caption = #1042#1093#1086#1076'. '#1057#1077#1088#1074#1077#1088
  ClientHeight = 150
  ClientWidth = 193
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
    Left = 16
    Top = 8
    Width = 75
    Height = 15
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object LabeledEdit2: TLabeledEdit
    Left = 16
    Top = 72
    Width = 161
    Height = 21
    EditLabel.Width = 41
    EditLabel.Height = 15
    EditLabel.Caption = #1055#1072#1088#1086#1083#1100
    EditLabel.Font.Charset = RUSSIAN_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Times New Roman'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    PasswordChar = '*'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 16
    Top = 112
    Width = 75
    Height = 25
    Caption = #1042#1093#1086#1076
    Default = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 112
    Width = 75
    Height = 25
    Caption = #1042#1099#1081#1090#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 24
    Width = 161
    Height = 21
    ReadOnly = True
    TabOrder = 3
    Text = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
  end
end
