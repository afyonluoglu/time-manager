object frmUpdateStatDetail: TfrmUpdateStatDetail
  Left = 1885
  Top = 1199
  Width = 527
  Height = 235
  Caption = #304'statistik Kayd'#305' D'#252'zenleme'
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Shape2: TShape
    Left = 22
    Top = 14
    Width = 477
    Height = 32
    Brush.Color = clGray
    Pen.Color = 21414
    Pen.Style = psClear
  end
  object Shape1: TShape
    Left = 18
    Top = 10
    Width = 477
    Height = 32
    Brush.Color = 15132415
    Pen.Color = 21414
  end
  object lbAlarmName: TLabel
    Left = 27
    Top = 17
    Width = 47
    Height = 20
    Caption = 'Alan: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 27
    Top = 63
    Width = 25
    Height = 14
    Caption = 'Alan:'
  end
  object Label2: TLabel
    Left = 28
    Top = 90
    Width = 70
    Height = 14
    Caption = 'Mevcut De'#287'er:'
  end
  object Label3: TLabel
    Left = 29
    Top = 117
    Width = 57
    Height = 14
    Caption = 'Yeni De'#287'er:'
  end
  object lbCurrentValue: TLabel
    Left = 116
    Top = 90
    Width = 29
    Height = 14
    Caption = '-- - - -'
  end
  object btCancel: TYusoftGradientButton
    Left = 124
    Top = 160
    Width = 121
    Height = 25
    LightColor = clBtnHighlight
    ShadowColor = clBtnShadow
    GrayedInactive = True
    Caption = 'Vazge'#231
    Layout = blGlyphTop
    GroupIndex = 0
    Vertical = True
    WindowCaption = False
    OnClick = btCancelClick
  end
  object btUpdate: TYusoftGradientButton
    Left = 276
    Top = 160
    Width = 121
    Height = 25
    LightColor = clBtnHighlight
    ShadowColor = clBtnShadow
    GrayedInactive = True
    Caption = 'G'#252'ncelle'
    Layout = blGlyphTop
    GroupIndex = 0
    Vertical = True
    WindowCaption = False
    OnClick = btUpdateClick
  end
  object Bevel1: TBevel
    Left = 21
    Top = 149
    Width = 481
    Height = 7
    Shape = bsTopLine
  end
  object lbHelp: TLabel
    Left = 312
    Top = 63
    Width = 190
    Height = 76
    AutoSize = False
    Caption = '- - - - -'
    WordWrap = True
  end
  object cbSelectedAlarmField: TComboBox
    Left = 112
    Top = 59
    Width = 185
    Height = 22
    Style = csDropDownList
    DropDownCount = 12
    ItemHeight = 14
    TabOrder = 0
    OnChange = cbSelectedAlarmFieldChange
    Items.Strings = (
      'Alarm'#305'n Ad'#305
      'Alarm T'#252'r'#252
      'Alarm Ba'#351'lang'#305'c'#305
      'Alarm Biti'#351'i'
      'Parametre-1'
      'Parametre-2'
      'Parametre-3'
      'Parametre-4'
      'Parametre-5'
      'Param-Str-1 (Birim)'
      'Param-Str-2'
      'Param-Str-3'
      'Param-Str-4'
      'Param-Str-5')
  end
  object edFieldValue: TEdit
    Left = 112
    Top = 114
    Width = 185
    Height = 22
    TabOrder = 1
  end
end
