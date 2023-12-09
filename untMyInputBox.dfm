object frmMyInputBox: TfrmMyInputBox
  Left = 1289
  Top = 386
  Width = 410
  Height = 137
  Caption = 'Bilgi Giri'#351'i'
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
  object lbBilgi: TLabel
    Left = 75
    Top = 25
    Width = 49
    Height = 14
    Alignment = taRightJustify
    Caption = 'Bilgi Giri'#351'i:'
  end
  object cbBilgi: TComboBox
    Left = 150
    Top = 21
    Width = 193
    Height = 22
    DropDownCount = 12
    ItemHeight = 14
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 58
    Width = 402
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 402
      Height = 7
      Align = alTop
      Shape = bsTopLine
    end
    object btTamam: TButton
      Left = 210
      Top = 13
      Width = 100
      Height = 27
      Caption = 'Tamam'
      TabOrder = 0
      OnClick = btTamamClick
    end
    object btVazgec: TButton
      Left = 69
      Top = 13
      Width = 100
      Height = 27
      Cancel = True
      Caption = 'Vazge'#231
      TabOrder = 1
      OnClick = btVazgecClick
    end
  end
end
