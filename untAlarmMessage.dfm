object frmAlarmMessage: TfrmAlarmMessage
  Left = 1640
  Top = 1154
  BorderStyle = bsToolWindow
  Caption = 'Alarmlar'#305'n'#305'z'
  ClientHeight = 319
  ClientWidth = 843
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 144
  TextHeight = 19
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 843
    Height = 319
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    BorderWidth = 15
    TabOrder = 0
    object liMessages: TListBox
      Left = 15
      Top = 15
      Width = 813
      Height = 261
      Hint = 'Bu alarm'#305' tamamlad'#305'ysan'#305'z '#231'ift t'#305'klay'#305'n'
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ItemHeight = 33
      ParentFont = False
      ParentShowHint = False
      PopupMenu = popList
      ShowHint = True
      TabOrder = 0
      OnDblClick = liMessagesDblClick
    end
    object Panel2: TPanel
      Left = 15
      Top = 276
      Width = 813
      Height = 28
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object sh1: TShape
        Left = 1
        Top = 7
        Width = 68
        Height = 13
        Brush.Color = clLime
        Pen.Color = clGray
      end
    end
  end
  object popList: TPopupMenu
    Left = 30
    Top = 30
    object popCompleted: TMenuItem
      Caption = 'Tamamland'#305', listeden kald'#305'r'
      OnClick = popCompletedClick
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 87
    Top = 33
  end
end
