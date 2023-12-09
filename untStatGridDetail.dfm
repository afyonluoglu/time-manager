object frmStatGridDetail: TfrmStatGridDetail
  Left = 2134
  Top = 323
  Width = 388
  Height = 580
  Caption = 'Detaylar'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 546
    Align = alClient
    BorderWidth = 10
    TabOrder = 0
    object liDetay: TListBox
      Left = 11
      Top = 11
      Width = 358
      Height = 498
      Style = lbOwnerDrawFixed
      Align = alClient
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      PopupMenu = popDetay
      TabOrder = 0
      OnDblClick = liDetayClick
      OnDrawItem = liDetayDrawItem
    end
    object pnBilgi: TPanel
      Left = 11
      Top = 509
      Width = 358
      Height = 26
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object lbTotalTime: TLabel
        Left = 15
        Top = 9
        Width = 103
        Height = 16
        Caption = 'Toplam S'#252're: -'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object popDetay: TPopupMenu
    Left = 135
    Top = 126
    object DebugDataContent1: TMenuItem
      Caption = 'Kay'#305't Bilgilerini G'#252'ncelle (Geli'#351'mi'#351' Seviye)'
      OnClick = DebugDataContent1Click
    end
    object Bukaydsil1: TMenuItem
      Caption = 'Bu Kayd'#305' Sil'
      OnClick = Bukaydsil1Click
    end
  end
end
