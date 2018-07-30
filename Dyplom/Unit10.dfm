object Form10: TForm10
  Left = 777
  Top = 489
  BorderStyle = bsToolWindow
  ClientHeight = 149
  ClientWidth = 313
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
    Left = 8
    Top = 16
    Width = 74
    Height = 17
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088' 1'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 74
    Height = 17
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088' 2'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 74
    Height = 17
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088' 3'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 32
    Top = 112
    Width = 97
    Height = 25
    Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100
    Default = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 168
    Top = 112
    Width = 97
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Button2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 128
    Top = 13
    Width = 176
    Height = 25
    Date = 0.756608564806811000
    Time = 0.756608564806811000
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
  end
  object ComboBox1: TComboBox
    Left = 129
    Top = 13
    Width = 175
    Height = 25
    Style = csDropDownList
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ItemHeight = 17
    ParentFont = False
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object ComboBox2: TComboBox
    Left = 130
    Top = 46
    Width = 175
    Height = 25
    Style = csDropDownList
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ItemHeight = 17
    ParentFont = False
    TabOrder = 2
    OnChange = ComboBox2Change
  end
  object ComboBox3: TComboBox
    Left = 130
    Top = 78
    Width = 175
    Height = 25
    Style = csDropDownList
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ItemHeight = 17
    ParentFont = False
    TabOrder = 3
  end
end
