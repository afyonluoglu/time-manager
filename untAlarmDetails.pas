unit untAlarmDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untAlarmGlobals, StdCtrls;

type
  TfrmAlarmDetails = class(TForm)
    Label1: TLabel;
    lbName: TLabel;
    Label2: TLabel;
    lbDuration: TLabel;
    lb3: TLabel;
    lbAlarmType: TLabel;
    lb4: TLabel;
    lbAlarmStart: TLabel;
    lb5: TLabel;
    lbAlarmEnd: TLabel;
    lb6: TLabel;
    lbStatus: TLabel;
    lb7: TLabel;
    lbMode: TLabel;
    lb8: TLabel;
    lbParam1: TLabel;
    Label3: TLabel;
    lbParam2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    dataToBeShowed: alarmStructure;
  end;

var
  frmAlarmDetails        : TfrmAlarmDetails;

implementation

{$R *.dfm}

const
  _sep01                 = ': ';

procedure TfrmAlarmDetails.FormActivate(Sender: TObject);
var
  s1                     : string;
begin
  lbName.Caption := _sep01 + dataToBeShowed.name;
  lbDuration.Caption := _sep01 + inttostr(dataToBeShowed.duration) + ' dk.';
  case dataToBeShowed.alarmType of
    atDuration: s1 := 'Süreli Alarm';
    atPomodoro: s1 := co_Pomodoro;
    atConstantTime: s1 := 'Belirlenmiþ Sürede';
    atToDo: s1 := 'Tanýmlanmýþ Ýþ';
  end;
  lbAlarmType.Caption := _sep01 + s1;
  lbAlarmStart.Caption := _sep01 + FormatDateTime(co_hourMinuteFormat, dataToBeShowed.alarmStart);
  lbAlarmEnd.Caption := _sep01 + FormatDateTime(co_hourMinuteFormat, dataToBeShowed.alarmEnd);
  case dataToBeShowed.status of
    asStarted: s1 := 'Baþladý';
    asWaitingForResponse: s1 := 'Baþlatýlmayý bekliyor';
    asFired: s1 := 'Alarm verildi';
    asNotRunToday: s1 := 'Bugün kullanýlmayacak';
    asNotDoneToday : s1 :='Bu iþlem yapýlmadý';
  end;
  lbStatus.Caption := _sep01 + s1;
  if dataToBeShowed.alarmType = atPomodoro then begin
    case dataToBeShowed.mode of
      poModeRun: s1 := co_Pomodoro+': Çalýþma Modu';
      poModeBreak: s1 := co_Pomodoro+': Dinlenme Modu';
    end;
  end else s1 := '-';
  lbMode.Caption := _sep01 + s1;
  lbParam1.Caption := _sep01 + inttostr(dataToBeShowed.param1);
  lbParam2.Caption := _sep01 + inttostr(dataToBeShowed.param2);
end;

procedure TfrmAlarmDetails.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key=#27 then close;
end;

end.

