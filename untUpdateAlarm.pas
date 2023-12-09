unit untUpdateAlarm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untAlarmGlobals, StdCtrls, ExtCtrls, yupack;

type
  TfrmUpdateAlarm = class(TForm)
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
    procedure edFieldValueKeyPress(Sender: TObject; var Key: Char);
    procedure cbSelectedAlarmFieldKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    myData: alarmStructure;
    sonuc: bool;
  end;

var
  frmUpdateAlarm         : TfrmUpdateAlarm;

implementation

{$R *.dfm}

procedure TfrmUpdateAlarm.FormShow(Sender: TObject);
begin
  lbAlarmName.Caption := myData.name;
  sonuc := false;
end;

procedure TfrmUpdateAlarm.btCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmUpdateAlarm.btUpdateClick(Sender: TObject);
var
  y1                     : integer;
begin
  y1 := cbSelectedAlarmField.ItemIndex;
  case y1 of
    0: myData.name := edFieldValue.Text;
    1: myData.duration := StrToInt(edFieldValue.Text);
    2: myData.alarmType := StrToInt(edFieldValue.Text);
    3: myData.alarmStart := StrToTime(edFieldValue.Text);
    4: begin
        myData.alarmEnd := StrToTime(edFieldValue.Text);
        myData.alarmEndStr := FormatDateTime(co_hourMinuteFormat, myData.alarmEnd);
      end;
    5: myData.status := StrToInt(edFieldValue.Text);
    6: myData.param1 := StrToInt(edFieldValue.Text);
    7: myData.param2 := StrToInt(edFieldValue.Text);
    8: myData.mode := StrToInt(edFieldValue.Text);
  end;
  sonuc := true;
  close;
end;

procedure TfrmUpdateAlarm.cbSelectedAlarmFieldChange(Sender: TObject);
var
  y1                     : integer;
  s1                     : string;
begin
  y1 := cbSelectedAlarmField.ItemIndex;
  if y1 = -1 then exit;
  case y1 of
    0: s1 := myData.name;
    1: s1 := IntToStr(myData.duration);
    2: s1 := IntToStr(myData.alarmType);
    3: s1 := FormatDateTime(co_hourMinuteFormat, myData.alarmStart);
    4: s1 := FormatDateTime(co_hourMinuteFormat, myData.alarmEnd);
    5: s1 := IntToStr(myData.status);
    6: s1 := IntToStr(myData.param1);
    7: s1 := IntToStr(myData.param2);
    8: s1 := IntToStr(myData.mode);
  end;
  lbCurrentValue.Caption := s1;
  edFieldValue.Text := s1;

  //Yardým bilgileri
  s1 := '';
  case y1 of
    2: s1 := 'Alarm Türü:' + co_Enter + '0: Süreli Alarm' + co_Enter + '1: ' + co_Pomodoro + co_Enter + '2: Belli Sürede' + co_Enter + '3: Ýþler';
    5: s1 := 'Alarm Durumu:' + co_Enter + '0: Baþladý' + co_Enter +
      '1: Baþlatýlmayý bekliyor' + co_Enter + '2: Alarm Verildi' + co_Enter +
        '3: Bugün kullanýlmayacak' + co_Enter + '4: Bu iþlem yapýlmadý';
    8: s1 := 'Mode:' + co_Enter + '0: ' + co_Pomodoro + ' Çalýþma Modu' + co_Enter +
      '1: ' + co_Pomodoro + ' Mola Zamaný';
  end;
  lbHelp.Caption := s1;

  // edFieldValue.SetFocus;
end;

procedure TfrmUpdateAlarm.edFieldValueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then btUpdateClick(Sender);
end;

procedure TfrmUpdateAlarm.cbSelectedAlarmFieldKeyPress(Sender: TObject;
  var Key: Char);
var
  y1                     : integer;
begin
  if key in ['1'..'9'] then begin
    y1 := strtoint(key);
    cbSelectedAlarmField.ItemIndex := y1 - 1;
    cbSelectedAlarmFieldChange(Sender);
  end else if key = #13 then begin
    if cbSelectedAlarmField.ItemIndex >= 0 then begin
      edFieldValue.SetFocus;
      key := #13;
    end;
  end else key := #0;
end;

procedure TfrmUpdateAlarm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then btCancelClick(sender);
end;

end.

