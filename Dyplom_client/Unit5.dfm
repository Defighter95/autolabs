object Form5: TForm5
  Left = 551
  Top = 417
  BorderStyle = bsToolWindow
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1072#1088#1086#1083#1103
  ClientHeight = 102
  ClientWidth = 170
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
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 41
    Height = 15
    Caption = #1055#1072#1088#1086#1083#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 70
    Height = 15
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Top = 50
    Width = 146
    Height = 13
    Caption = '(4-'#1077' '#1089#1080#1084#1074#1086#1083#1072', '#1090#1086#1083#1100#1082#1086' '#1094#1080#1092#1088#1099')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 89
    Top = 6
    Width = 72
    Height = 21
    MaxLength = 4
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 89
    Top = 30
    Width = 72
    Height = 21
    MaxLength = 4
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = Edit2KeyPress
  end
  object Button1: TButton
    Left = 8
    Top = 70
    Width = 65
    Height = 25
    Caption = #1054#1050
    Default = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 94
    Top = 70
    Width = 65
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
end
