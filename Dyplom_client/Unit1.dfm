object Form1: TForm1
  Left = 685
  Top = 480
  BorderStyle = bsToolWindow
  Caption = #1042#1093#1086#1076'. '#1057#1090#1091#1076#1077#1085#1090
  ClientHeight = 136
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 29
    Top = 48
    Width = 28
    Height = 15
    Caption = #1060#1048#1054
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 7
    Top = 17
    Width = 52
    Height = 15
    Caption = #1043#1056#1059#1055#1055#1040
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 50
    Height = 15
    Caption = #1055#1040#1056#1054#1051#1068
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Button2: TButton
    Left = 8
    Top = 104
    Width = 113
    Height = 25
    Caption = 'OK'
    Default = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 160
    Top = 104
    Width = 113
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 65
    Top = 78
    Width = 208
    Height = 21
    MaxLength = 4
    PasswordChar = '*'
    TabOrder = 2
    OnKeyPress = Edit1KeyPress
  end
  object ComboBox1: TComboBox
    Left = 64
    Top = 44
    Width = 209
    Height = 23
    Style = csDropDownList
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ItemHeight = 15
    ParentFont = False
    TabOrder = 3
  end
  object ComboBox2: TComboBox
    Left = 64
    Top = 13
    Width = 209
    Height = 23
    Style = csDropDownList
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ItemHeight = 15
    ParentFont = False
    TabOrder = 4
    OnClick = ComboBox2Click
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 8
    Top = 104
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Students'
    Left = 48
    Top = 104
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 232
    Top = 104
  end
  object OpenDialog1: TOpenDialog
    Left = 136
    Top = 104
  end
  object ADOTable2: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Groups'
    Left = 88
    Top = 104
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    Left = 184
    Top = 104
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 8
    Top = 32
  end
end
