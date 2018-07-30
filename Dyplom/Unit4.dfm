object Form4: TForm4
  Left = 449
  Top = 296
  BorderStyle = bsToolWindow
  Caption = #1057#1077#1088#1074#1077#1088'. '#1054#1087#1077#1088#1072#1090#1086#1088
  ClientHeight = 382
  ClientWidth = 709
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 709
    Height = 382
    ActivePage = TabSheet5
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet5: TTabSheet
      Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1099#1077' '#1088#1072#1073#1086#1090#1099
      ImageIndex = 2
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 701
        Height = 309
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
        OnKeyPress = DBGrid1KeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'Names'
            ReadOnly = False
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 277
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Time_for_work(min)'
            ReadOnly = False
            Title.Caption = #1042#1088#1077#1084#1103' ('#1084#1080#1085'.)'
            Width = 101
            Visible = True
          end
          item
            Color = clMenu
            Expanded = False
            FieldName = 'Path'
            PopupMenu = Form2.PopupMenu1
            ReadOnly = False
            Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082
            Width = 282
            Visible = True
          end>
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 309
        Width = 701
        Height = 41
        Align = alBottom
        ButtonHeight = 39
        ButtonWidth = 41
        Caption = 'ToolBar1'
        Images = Form2.ImageList1
        TabOrder = 1
        object ToolButton23: TToolButton
          Left = 0
          Top = 2
          Caption = 'ToolButton23'
          ImageIndex = 0
          OnClick = ToolButton23Click
        end
        object ToolButton26: TToolButton
          Left = 41
          Top = 2
          Caption = 'ToolButton26'
          ImageIndex = 3
          OnClick = ToolButton26Click
        end
        object ToolButton27: TToolButton
          Left = 82
          Top = 2
          Caption = 'ToolButton27'
          ImageIndex = 4
          OnClick = ToolButton27Click
        end
        object ToolButton28: TToolButton
          Left = 123
          Top = 2
          Width = 8
          Caption = 'ToolButton28'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object ToolButton24: TToolButton
          Left = 131
          Top = 2
          Hint = #1042' '#1085#1072#1095#1072#1083#1086
          Caption = 'ToolButton5'
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton24Click
        end
        object ToolButton25: TToolButton
          Left = 172
          Top = 2
          Hint = #1042' '#1082#1086#1085#1077#1094
          Caption = 'ToolButton6'
          ImageIndex = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton25Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1057#1090#1091#1076#1077#1085#1090#1099
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 701
        Height = 309
        Align = alClient
        DataSource = DataSource2
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
        Columns = <
          item
            Expanded = False
            FieldName = 'FIO'
            Title.Caption = #1060#1048#1054' '#1089#1090#1091#1076#1077#1085#1090#1072
            Width = 515
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Group'
            ImeMode = imDisable
            PickList.Strings = (
              #39';l'#39';l'#39';'#39';'
              'ljlkjlkjlkjlkj'
              'k;lk;lk')
            Title.Caption = #1043#1088#1091#1087#1087#1072
            Width = 146
            Visible = True
          end>
      end
      object ToolBar2: TToolBar
        Left = 0
        Top = 309
        Width = 701
        Height = 41
        Align = alBottom
        ButtonHeight = 39
        ButtonWidth = 41
        Caption = 'ToolBar2'
        Images = Form2.ImageList1
        TabOrder = 1
        object ToolButton2: TToolButton
          Left = 0
          Top = 2
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          Caption = 'ToolButton2'
          ImageIndex = 0
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton16Click
        end
        object ToolButton3: TToolButton
          Left = 41
          Top = 2
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          Caption = 'ToolButton3'
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton3Click
        end
        object ToolButton21: TToolButton
          Left = 82
          Top = 2
          Caption = 'ToolButton21'
          ImageIndex = 4
          OnClick = ToolButton21Click
        end
        object ToolButton4: TToolButton
          Left = 123
          Top = 2
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton5: TToolButton
          Left = 131
          Top = 2
          Hint = #1042' '#1085#1072#1095#1072#1083#1086
          Caption = 'ToolButton5'
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton19Click
        end
        object ToolButton6: TToolButton
          Left = 172
          Top = 2
          Hint = #1050' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1079#1072#1087#1080#1089#1080
          Caption = 'ToolButton6'
          ImageIndex = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton20Click
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1043#1088#1091#1087#1087#1099
      ImageIndex = 1
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 701
        Height = 309
        Align = alClient
        BiDiMode = bdLeftToRight
        DataSource = DataSource3
        ParentBiDiMode = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Times New Roman'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Nazva'
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099
            Width = 663
            Visible = True
          end>
      end
      object ToolBar3: TToolBar
        Left = 0
        Top = 309
        Width = 701
        Height = 41
        Align = alBottom
        ButtonHeight = 39
        ButtonWidth = 41
        Caption = 'ToolBar1'
        Images = Form2.ImageList1
        TabOrder = 1
        object ToolButton11: TToolButton
          Left = 0
          Top = 2
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          Caption = 'ToolButton2'
          ImageIndex = 0
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton1Click
        end
        object ToolButton12: TToolButton
          Left = 41
          Top = 2
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          Caption = 'ToolButton3'
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton7Click
        end
        object ToolButton22: TToolButton
          Left = 82
          Top = 2
          Caption = 'ToolButton22'
          ImageIndex = 4
          OnClick = ToolButton22Click
        end
        object ToolButton13: TToolButton
          Left = 123
          Top = 2
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton14: TToolButton
          Left = 131
          Top = 2
          Hint = #1042' '#1085#1072#1095#1072#1083#1086
          Caption = 'ToolButton5'
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton9Click
        end
        object ToolButton15: TToolButton
          Left = 172
          Top = 2
          Hint = #1042' '#1082#1086#1085#1077#1094
          Caption = 'ToolButton6'
          ImageIndex = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton10Click
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 644
    Top = 336
    object N1: TMenuItem
      Caption = #1054#1087#1094#1080#1080
      object N2: TMenuItem
        Caption = #1057#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N4Click
      end
    end
  end
  object ADOTable3: TADOTable
    Connection = Form2.ADOConnection1
    CursorType = ctStatic
    TableName = 'Groups'
    Left = 60
    Top = 236
  end
  object DataSource3: TDataSource
    DataSet = ADOTable3
    Left = 100
    Top = 236
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    Left = 100
    Top = 192
  end
  object ADOTable2: TADOTable
    Connection = Form2.ADOConnection1
    CursorType = ctStatic
    TableName = 'Students'
    Left = 60
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 100
    Top = 280
  end
  object ADOTable1: TADOTable
    Connection = Form2.ADOConnection1
    CursorType = ctStatic
    TableName = 'Labs'
    Left = 60
    Top = 280
  end
end
