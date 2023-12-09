object frmAyarlar: TfrmAyarlar
  Left = 1827
  Top = 1076
  Width = 326
  Height = 178
  Caption = 'Ayarlar'
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 24
    Top = 30
    Width = 149
    Height = 14
    Caption = #304#351'lerin S'#252'resi ('#246'nde'#287'er) dakika:'
  end
  object edToDoTime: TEdit
    Left = 191
    Top = 27
    Width = 88
    Height = 22
    TabOrder = 0
  end
  object btSave: TButton
    Left = 184
    Top = 102
    Width = 75
    Height = 25
    Caption = 'Kaydet'
    TabOrder = 1
    OnClick = btSaveClick
  end
  object btCancel: TButton
    Left = 45
    Top = 102
    Width = 75
    Height = 25
    Caption = 'Vazge'#231
    TabOrder = 2
    OnClick = btCancelClick
  end
end
