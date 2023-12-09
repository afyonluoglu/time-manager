unit untUpdateStatDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untAlarmGlobals, StdCtrls, ExtCtrls, yupack;

type
  TfrmUpdateStatDetail = class(TForm)
    lbAlarmName: TLabel;
    cbSelectedAlarmField: TComboBox;
    Shape1: TShape;
    Shape2: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edFieldValue: TEdit;
    lbCurrentValue: TLabel;
    btCancel: TYusoftGradientButton;
    btUpdate: TYusoftGradientButton;
    Bevel1: TBevel;
    lbHelp: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btUpdateClick(Sender: TObject);
    procedure cbSelectedAlarmFieldChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    myData: completedAlarmsStatsStructure;
    sonuc: bool;
  end;

implementation

{$R *.dfm}

procedure TfrmUpdateStatDetail.FormShow(Sender: TObject);
begin
  lbAlarmName.Caption := myData.name;
  sonuc := false;
end;

procedure TfrmUpdateStatDetail.btCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmUpdateStatDetail.btUpdateClick(Sender: TObject);
var
  y1                     : integer;
begin
  y1 := cbSelectedAlarmField.ItemIndex;
  case y1 of
    0: myData.name := edFieldValue.Text;
    1: myData.alarmType := StrToInt(edFieldValue.Text);
    2: myData.alarmStart := StrToTime(edFieldValue.Text);
    3: myData.alarmEnd := StrToTime(edFieldValue.Text);
    4: myData.parameters[1] := StrToInt(edFieldValue.Text);
    5: myData.parameters[2] := StrToInt(edFieldValue.Text);
    6: myData.parameters[3] := StrToInt(edFieldValue.Text);
    7: myData.parameters[4] := StrToInt(edFieldValue.Text);
    8: myData.parameters[5] := StrToInt(edFieldValue.Text);
    9: myData.paramsStr[1] := edFieldValue.Text;
    10: myData.paramsStr[2] := edFieldValue.Text;
    11: myData.paramsStr[3] := edFieldValue.Text;
    12: myData.paramsStr[4] := edFieldValue.Text;
    13: myData.paramsStr[5] := edFieldValue.Text;
  end;
  sonuc := true;
  close;
end;

procedure TfrmUpdateStatDetail.cbSelectedAlarmFieldChange(Sender: TObject);
var
  y1                     : integer;
  s1                     : string;
begin
  y1 := cbSelectedAlarmField.ItemIndex;
  if y1 = -1 then exit;
  case y1 of
    0: s1 := myData.name;
    1: s1 := IntToStr(myData.alarmType);
    2: s1 := FormatDateTime(co_hourMinuteFormat, myData.alarmStart);
    3: s1 := FormatDateTime(co_hourMinuteFormat, myData.alarmEnd);
    4: s1 := IntToStr(myData.parameters[1]);
    5: s1 := IntToStr(myData.parameters[2]);
    6: s1 := IntToStr(myData.parameters[3]);
    7: s1 := IntToStr(myData.parameters[4]);
    8: s1 := IntToStr(myData.parameters[5]);
    9: s1 := myData.paramsStr[1];
    10: s1 := myData.paramsStr[2];
    11: s1 := myData.paramsStr[3];
    12: s1 := myData.paramsStr[4];
    13: s1 := myData.paramsStr[5];
  end;
  lbCurrentValue.Caption := s1;
  edFieldValue.Text := s1;

  //Yardým bilgileri
  s1 := '';
  case y1 of
    1: s1 := 'Alarm Türü:' + co_Enter + '0: Süreli Alarm' + co_Enter + '1: ' + co_Pomodoro + co_Enter + '2: Belli Sürede' + co_Enter + '3: Ýþler';
    4: case myData.alarmType of
        atPomodoro: s1 := 'Çalýþma Süresi (dk)';
        atToDo: s1 := 'Bu iþi kaç defa yaptýnýz?';
      end;
    5: case myData.alarmType of
        atPomodoro: s1 := 'Mola Süresi (dk)';
      end;
  end;
  lbHelp.Caption := s1;

  edFieldValue.SetFocus;
end;

procedure TfrmUpdateStatDetail.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then close;
end;

end.

