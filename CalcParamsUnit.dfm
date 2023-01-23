object CalcParamsDlg: TCalcParamsDlg
  Left = 346
  Top = 165
  BorderStyle = bsDialog
  Caption = #1042#1099#1095#1080#1089#1083#1103#1077#1084#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 416
  ClientWidth = 301
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OKBtn: TBitBtn
    Left = 114
    Top = 388
    Width = 73
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    ModalResult = 1
    TabOrder = 0
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF5555555555555C055555
      55555555588FF55555555555CCC05555555555558888F55555555555CCC05555
      555555558888FF555555555CCCCC05555555555888888F55555555CCCCCC0555
      5555558888888FF5555558CC05CCC05555555888858888F555558C05555CC055
      55558885555888FF55555555555CCC05555555555558888F555555555555CC05
      555555555555888FF555555555555CC05555555555555888FF5555555555558C
      05555555555555888FF5555555555558C05555555555555888FF555555555555
      5CC0555555555555588855555555555555555555555555555555}
    NumGlyphs = 2
  end
  object GroupBox2: TGroupBox
    Left = 2
    Top = 1
    Width = 297
    Height = 127
    Caption = ' '#1056#1072#1089#1095#1077#1090#1085#1099#1077' '#1105#1084#1082#1086#1089#1090#1080' '
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 6
      Top = 16
      Width = 283
      Height = 103
      ActivePage = ExitTab
      TabOrder = 0
      object VTab: TTabSheet
        Caption = #1054#1073#1098#1105#1084
        object V_1: TCheckBox
          Left = 8
          Top = 8
          Width = 41
          Height = 17
          Caption = '1'
          TabOrder = 0
        end
        object V_2: TCheckBox
          Left = 8
          Top = 27
          Width = 41
          Height = 17
          Caption = '2'
          TabOrder = 1
        end
        object V_3: TCheckBox
          Left = 8
          Top = 46
          Width = 41
          Height = 17
          Caption = '3'
          TabOrder = 2
        end
        object V_4: TCheckBox
          Left = 75
          Top = 8
          Width = 41
          Height = 17
          Caption = '4'
          TabOrder = 3
        end
        object V_5: TCheckBox
          Left = 75
          Top = 27
          Width = 41
          Height = 17
          Caption = '5'
          TabOrder = 4
        end
        object V_6: TCheckBox
          Left = 75
          Top = 46
          Width = 41
          Height = 17
          Caption = '6'
          TabOrder = 5
        end
        object V_Dol: TCheckBox
          Left = 142
          Top = 8
          Width = 113
          Height = 17
          Caption = #1044#1086#1083#1080#1074#1085#1072#1103
          TabOrder = 6
        end
        object V_Vibr: TCheckBox
          Left = 142
          Top = 27
          Width = 113
          Height = 17
          Caption = #1055#1086#1076' '#1074#1080#1073#1088#1086#1089#1080#1090#1086#1084
          TabOrder = 7
        end
      end
      object EnterTab: TTabSheet
        Caption = #1042#1093#1086#1076
        ImageIndex = 1
        object Enter_1: TCheckBox
          Left = 8
          Top = 8
          Width = 41
          Height = 17
          Caption = '1'
          TabOrder = 0
        end
        object Enter_2: TCheckBox
          Left = 8
          Top = 27
          Width = 41
          Height = 17
          Caption = '2'
          TabOrder = 1
        end
        object Enter_3: TCheckBox
          Left = 8
          Top = 46
          Width = 41
          Height = 17
          Caption = '3'
          TabOrder = 2
        end
        object Enter_4: TCheckBox
          Left = 75
          Top = 8
          Width = 41
          Height = 17
          Caption = '4'
          TabOrder = 3
        end
        object Enter_5: TCheckBox
          Left = 75
          Top = 27
          Width = 41
          Height = 17
          Caption = '5'
          TabOrder = 4
        end
        object Enter_6: TCheckBox
          Left = 75
          Top = 46
          Width = 41
          Height = 17
          Caption = '6'
          TabOrder = 5
        end
        object Enter_Dol: TCheckBox
          Left = 142
          Top = 8
          Width = 113
          Height = 17
          Caption = #1044#1086#1083#1080#1074#1085#1072#1103
          TabOrder = 6
        end
      end
      object ExitTab: TTabSheet
        Caption = #1042#1099#1093#1086#1076
        ImageIndex = 2
        object Exit_1: TCheckBox
          Left = 8
          Top = 8
          Width = 41
          Height = 17
          Caption = '1'
          TabOrder = 0
        end
        object Exit_2: TCheckBox
          Left = 8
          Top = 27
          Width = 41
          Height = 17
          Caption = '2'
          TabOrder = 1
        end
        object Exit_3: TCheckBox
          Left = 8
          Top = 46
          Width = 41
          Height = 17
          Caption = '3'
          TabOrder = 2
        end
        object Exit_4: TCheckBox
          Left = 75
          Top = 8
          Width = 41
          Height = 17
          Caption = '4'
          TabOrder = 3
        end
        object Exit_5: TCheckBox
          Left = 75
          Top = 27
          Width = 41
          Height = 17
          Caption = '5'
          TabOrder = 4
        end
        object Exit_6: TCheckBox
          Left = 75
          Top = 46
          Width = 41
          Height = 17
          Caption = '6'
          TabOrder = 5
        end
        object Exit_Vibr: TCheckBox
          Left = 142
          Top = 8
          Width = 113
          Height = 17
          Caption = #1055#1086#1076' '#1074#1080#1073#1088#1086#1089#1080#1090#1086#1084
          TabOrder = 6
        end
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 2
    Top = 129
    Width = 297
    Height = 127
    Caption = ' '#1057#1084#1077#1097#1077#1085#1080#1077' "'#1085#1091#1083#1103'" '#1091#1088#1086#1074#1085#1077#1081' '
    TabOrder = 2
    object Label1: TLabel
      Left = 9
      Top = 22
      Width = 50
      Height = 13
      Caption = #1025#1084#1082#1086#1089#1090#1100' 1'
    end
    object Label2: TLabel
      Left = 9
      Top = 48
      Width = 50
      Height = 13
      Caption = #1025#1084#1082#1086#1089#1090#1100' 2'
    end
    object Label3: TLabel
      Left = 9
      Top = 74
      Width = 50
      Height = 13
      Caption = #1025#1084#1082#1086#1089#1090#1100' 3'
    end
    object Label4: TLabel
      Left = 9
      Top = 100
      Width = 50
      Height = 13
      Caption = #1025#1084#1082#1086#1089#1090#1100' 4'
    end
    object Label5: TLabel
      Left = 177
      Top = 22
      Width = 50
      Height = 13
      Caption = #1025#1084#1082#1086#1089#1090#1100' 5'
    end
    object Label6: TLabel
      Left = 177
      Top = 48
      Width = 50
      Height = 13
      Caption = #1025#1084#1082#1086#1089#1090#1100' 6'
    end
    object Label7: TLabel
      Left = 122
      Top = 74
      Width = 106
      Height = 13
      Caption = #1044#1086#1083#1080#1074#1086#1095#1085#1072#1103' '#1105#1084#1082#1086#1089#1090#1100
    end
    object Label8: TLabel
      Left = 124
      Top = 100
      Width = 105
      Height = 13
      Caption = #1025#1084#1082#1086#1089#1090#1100' '#1087#1086#1076' '#1074#1080#1073#1088#1086#1089'.'
    end
    object ZeroEdit_1: TEdit
      Left = 67
      Top = 19
      Width = 49
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object ZeroEdit_2: TEdit
      Left = 67
      Top = 45
      Width = 49
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object ZeroEdit_3: TEdit
      Left = 67
      Top = 71
      Width = 49
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object ZeroEdit_4: TEdit
      Left = 67
      Top = 97
      Width = 49
      Height = 21
      TabOrder = 3
      Text = '0'
    end
    object ZeroEdit_5: TEdit
      Left = 235
      Top = 19
      Width = 49
      Height = 21
      TabOrder = 4
      Text = '0'
    end
    object ZeroEdit_6: TEdit
      Left = 235
      Top = 45
      Width = 49
      Height = 21
      TabOrder = 5
      Text = '0'
    end
    object ZeroEdit_Dol: TEdit
      Left = 235
      Top = 71
      Width = 49
      Height = 21
      TabOrder = 6
      Text = '0'
    end
    object ZeroEdit_Vibr: TEdit
      Left = 235
      Top = 97
      Width = 49
      Height = 21
      TabOrder = 7
      Text = '0'
    end
  end
  object GroupBox3: TGroupBox
    Left = 2
    Top = 258
    Width = 297
    Height = 127
    Caption = ' '#1055#1083#1086#1097#1072#1076#1100' '#1105#1084#1082#1086#1089#1090#1077#1081', '#1084'2 '
    TabOrder = 3
    object Label9: TLabel
      Left = 9
      Top = 22
      Width = 50
      Height = 13
      Caption = #1025#1084#1082#1086#1089#1090#1100' 1'
    end
    object Label10: TLabel
      Left = 9
      Top = 48
      Width = 50
      Height = 13
      Caption = #1025#1084#1082#1086#1089#1090#1100' 2'
    end
    object Label11: TLabel
      Left = 9
      Top = 74
      Width = 50
      Height = 13
      Caption = #1025#1084#1082#1086#1089#1090#1100' 3'
    end
    object Label12: TLabel
      Left = 9
      Top = 100
      Width = 50
      Height = 13
      Caption = #1025#1084#1082#1086#1089#1090#1100' 4'
    end
    object Label13: TLabel
      Left = 177
      Top = 22
      Width = 50
      Height = 13
      Caption = #1025#1084#1082#1086#1089#1090#1100' 5'
    end
    object Label14: TLabel
      Left = 177
      Top = 48
      Width = 50
      Height = 13
      Caption = #1025#1084#1082#1086#1089#1090#1100' 6'
    end
    object Label15: TLabel
      Left = 122
      Top = 74
      Width = 106
      Height = 13
      Caption = #1044#1086#1083#1080#1074#1086#1095#1085#1072#1103' '#1105#1084#1082#1086#1089#1090#1100
    end
    object Label16: TLabel
      Left = 124
      Top = 100
      Width = 105
      Height = 13
      Caption = #1025#1084#1082#1086#1089#1090#1100' '#1087#1086#1076' '#1074#1080#1073#1088#1086#1089'.'
    end
    object SEdit_1: TEdit
      Left = 67
      Top = 19
      Width = 49
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object SEdit_2: TEdit
      Left = 67
      Top = 45
      Width = 49
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object SEdit_3: TEdit
      Left = 67
      Top = 71
      Width = 49
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object SEdit_4: TEdit
      Left = 67
      Top = 97
      Width = 49
      Height = 21
      TabOrder = 3
      Text = '0'
    end
    object SEdit_5: TEdit
      Left = 235
      Top = 19
      Width = 49
      Height = 21
      TabOrder = 4
      Text = '0'
    end
    object SEdit_6: TEdit
      Left = 235
      Top = 45
      Width = 49
      Height = 21
      TabOrder = 5
      Text = '0'
    end
    object SEdit_Dol: TEdit
      Left = 235
      Top = 71
      Width = 49
      Height = 21
      TabOrder = 6
      Text = '0'
    end
    object SEdit_Vibr: TEdit
      Left = 235
      Top = 97
      Width = 49
      Height = 21
      TabOrder = 7
      Text = '0'
    end
  end
end
