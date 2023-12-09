unit untAlarmMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls;

type
  TfrmAlarmMessage = class(TForm)
    popList: TPopupMenu;
    popCompleted: TMenuItem;
    Timer1: TTimer;
    Panel1: TPanel;
    liMessages: TListBox;
    Panel2: TPanel;
    sh1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure popCompletedClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure liMessagesDblClick(Sender: TObject);
  private
    timerRunCount: byte;
    alarmMessages: array[1..10] of string;
    procedure startAlarmTimer;
    procedure playAlarm;
  public
    alarmMessageCount: byte;
    messageScreenActive: bool;
    procedure addAlarmMessage(s1: string);
  end;

var
  frmAlarmMessage        : TfrmAlarmMessage;

implementation

{$R *.dfm}

// uses SysUtils;

var
  timerColors            : array[0..4] of TColor;

procedure TfrmAlarmMessage.addAlarmMessage(s1: string);
begin
  inc(alarmMessageCount);
  alarmMessages[alarmMessageCount] := s1;
  if messageScreenActive then liMessages.Items.add(s1);
  startAlarmTimer;
end;

procedure TfrmAlarmMessage.FormCreate(Sender: TObject);
begin
  alarmMessageCount := 0;
end;

procedure TfrmAlarmMessage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Timer1.Enabled := false;
  messageScreenActive := false;
 // alarmMessageCount := 0;
end;

procedure TfrmAlarmMessage.Timer1Timer(Sender: TObject);
begin
  playAlarm;
  if timerRunCount >= 4 then begin
    Timer1.Enabled := false;
    timerRunCount := 0;
  end;
end;

procedure TfrmAlarmMessage.playAlarm;
begin
  if timerRunCount > 2 then begin
    sh1.pen.style := psClear;
  end else begin
    MessageBeep(MB_ICONERROR);
  end;
  sh1.Brush.Color := timerColors[timerRunCount];
  inc(timerRunCount);
end;

procedure TfrmAlarmMessage.popCompletedClick(Sender: TObject);
var
  y1, y2                 : integer;
begin
  y1 := liMessages.ItemIndex;
  if y1 < 0 then exit;
  liMessages.Items.Delete(y1);
  inc(y1);
  for y2 := y1 to alarmMessageCount - 1 do alarmMessages[y2] := alarmMessages[y2 + 1];
  dec(alarmMessageCount);
  if liMessages.items.Count <= 0 then close;
end;

procedure TfrmAlarmMessage.startAlarmTimer;
begin
  sh1.pen.style := psSolid;
  timerRunCount := 0;
  Timer1.Enabled := true;
  playAlarm;
end;

procedure TfrmAlarmMessage.FormShow(Sender: TObject);
var
  y1                     : integer;
begin
  timerColors[0] := clRed;
  timerColors[1] := clYellow;
  timerColors[2] := clLime;
  timerColors[3] := clBtnFace;
  sh1.Brush.Color := panel2.Color;

  messageScreenActive := true;
  limessages.items.clear;
  for y1 := 1 to alarmMessageCount do liMessages.Items.add(alarmMessages[y1]);
  startAlarmTimer;
end;

procedure TfrmAlarmMessage.liMessagesDblClick(Sender: TObject);
begin
  popCompletedClick(sender);
end;

end.

