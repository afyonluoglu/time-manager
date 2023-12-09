unit untStatGridDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus;

type
  TfrmStatGridDetail = class(TForm)
    Panel1: TPanel;
    liDetay: TListBox;
    pnBilgi: TPanel;
    lbTotalTime: TLabel;
    popDetay: TPopupMenu;
    Bukaydsil1: TMenuItem;
    DebugDataContent1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure liDetayClick(Sender: TObject);
    procedure Bukaydsil1Click(Sender: TObject);
    procedure liDetayDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure DebugDataContent1Click(Sender: TObject);
  private
    pomodoroColors: boolean;
    procedure readDetailRecords;
  public
    logDeleted: boolean;
    detailDate: TDateTime;
    detailAlarmName: string;
  end;

// var
//   frmStatGridDetail      : TfrmStatGridDetail;

implementation

{$R *.dfm}

uses untAlarmGlobals, untUpdateStatDetail, dateUtils;

var
  fStats                 : file of completedAlarmsStatsStructure;
  dataStat               : completedAlarmsStatsStructure;
  dataComplete           : array of completedAlarmsStatsStructure;

procedure TfrmStatGridDetail.readDetailRecords;
var
  s1, s2                 : string;
  toplam, say, recordNo, y1: integer;
begin
  AssignFile(fStats, filenameStatistics);
  Reset(fStats);

  liDetay.items.clear;
  toplam := 0;
  say := 0;
  recordNo := 0;
  try
    while not Eof(fStats) do begin
      read(fStats, dataStat);
      if (dataStat.alarmDate = detailDate) and (dataStat.name = detailAlarmName) then begin
        inc(say);
        SetLength(dataComplete, say + 1);
        dataComplete[say] := dataStat;

        toplam := toplam + MinutesBetween(dataStat.alarmStart, dataStat.alarmEnd);
        s1 := formatdatetime(co_hourMinuteFormat, dataStat.alarmStart) + ' - ' +
          formatdatetime(co_hourMinuteFormat, dataStat.alarmEnd) + co_draw_seperator;
        if dataStat.alarmType = atPomodoro then begin
          s2 := '';
          if dataStat.parameters[3] = poModeRun then s2 := 'Çalýþma'
          else if dataStat.parameters[3] = poModeBreak then s2 := 'Ara';
          s1 := s1 + ' ' + s2 + ' ( Ç: ' + inttostr(dataStat.parameters[1]) +
            ' / A: ' + inttostr(dataStat.parameters[2]) + ' dk.)';
        end else if dataStat.alarmType = atToDo then begin
          y1 := dataStat.parameters[1];
          if y1 > 0 then begin
            s2 := dataStat.paramsStr[1];
            if s2 = '' then s2 := 'defa';
            s1 := s1 + ' (' + inttostr(y1) + ' ' + s2 + ')';
          end;
        end;
        liDetay.items.add(inttostr(recordNo) + co_draw_seperator + s1 + ' -> ' + inttostr(dataStat.alarmType));
      end;
      inc(recordNo);
    end;
  finally
    CloseFile(fStats);
  end;
  s1 := inttostr(toplam) + ' dk.';
  if toplam > 59 then s1 := s1 + ' ( ' + intToTime(toplam * 60, false) + ' )';
  lbTotalTime.Caption := 'Toplam Süre: ' + s1;
  liDetay.SetFocus;
end;

procedure TfrmStatGridDetail.FormShow(Sender: TObject);
begin
  caption := Formatdatetime(co_dateFormat, detailDate) + ' - ' + detailAlarmName;
  pomodoroColors := detailAlarmName = co_Pomodoro;
  logDeleted := false;
  readDetailRecords;
end;

procedure TfrmStatGridDetail.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure TfrmStatGridDetail.liDetayClick(Sender: TObject);
var
  y1, y2                 : integer;
  s1, s2                     : string;
begin
  y1 := liDetay.ItemIndex + 1;

  s1 := 'Adý:' + dataComplete[y1].name + co_Enter +
    'Alarm Türü: ' + atNameArray[dataComplete[y1].alarmType + 1] + co_Enter +
    'Alarm Baþlangýç: ' + formatdatetime(co_hourMinuteFormat, dataComplete[y1].alarmStart) + co_Enter +
    'Alarm Bitiþ: ' + formatdatetime(co_hourMinuteFormat, dataComplete[y1].alarmEnd) + co_Enter;
  for y2 := 1 to 5 do
    s1 := s1 + 'Param ' + inttostr(y2) + ': ' + inttostr(dataComplete[y1].parameters[y2]) + co_Enter;
  for y2 := 1 to 5 do begin
    if y2=1 then s2:='Birim' else s2:= 'ParamStr ' + inttostr(y2);
    s1 := s1 + s2 + ': ' + dataComplete[y1].paramsStr[y2] + co_Enter;
  end;

  MessageDlg(s1, mtInformation, [mbOk], 0)
end;

procedure TfrmStatGridDetail.Bukaydsil1Click(Sender: TObject);
var
  y1                     : integer;
  s1                     : string;
  tmpData                : completedAlarmsStatsStructure;
begin
  y1 := liDetay.ItemIndex;
  if y1 < 0 then exit;
  s1 := liDetay.items[y1];
  s1 := GetMyData(s1);
  y1 := strtointDef(s1, -1);
  if y1 < 0 then exit;

  AssignFile(fStats, filenameStatistics);
  Reset(fStats);
  seek(fStats, y1);

  read(fStats, tmpData);
  s1 := formatdatetime(co_hourMinuteFormat, tmpData.alarmStart) + ' - ' +
    formatdatetime(co_hourMinuteFormat, tmpData.alarmEnd);

  if MessageDlg(s1 + ' aralýðýndaki kayýt silinsin mi ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

  while not Eof(fStats) do begin
    read(fStats, tmpData);
    seek(fStats, y1);
    write(fStats, tmpData);
    read(fStats, tmpData); // bir sonraki kayda atlamak için
    inc(y1);
  end;
  seek(fStats, y1);
  Truncate(fStats);
  logDeleted := true;
  readDetailRecords;
end;

procedure TfrmStatGridDetail.liDetayDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  s1, zaman              : string;
  r1                     : TRect;
begin
  s1 := liDetay.items[index];
  GetMyData(s1);
  zaman := GetMyData(s1);

  with (Control as TListbox), Canvas do begin
    brush.color := clBlack;
    font.color := clWhite;
    r1 := rect;
    r1.right := r1.left + 80;
    FillRect(r1);
    TextOut(r1.Left + 2, r1.Top, zaman);

    if (odSelected in state) then begin
      Brush.Color := clBlue;
      font.color := clwhite;
    end else begin
      if pomodoroColors then begin
        if pos('Çalýþma', s1) > 0 then brush.Color := $00D5FFD5
        else if pos('Ara', s1) > 0 then brush.color := $00DFDFFF
        else brush.color := co_ColorPomodoro;
        font.color := clBlack;
      end else begin
        Brush.Color := clWhite;
        font.color := clBlack;
      end;
    end;

    r1.left := r1.right;
    r1.right := rect.right;
    FillRect(r1);
    TextOut(r1.Left + 2, r1.Top, s1);
  end;
end;

procedure TfrmStatGridDetail.DebugDataContent1Click(Sender: TObject);
var
  y1, y2                 : integer;
  s1                     : string;
  frm1                   : TfrmUpdateStatDetail;
  b1                     : boolean;


begin
  y1 := liDetay.ItemIndex;
  if y1 < 0 then exit;

  dataStat := dataComplete[y1 + 1];
  s1 := liDetay.items[y1];

//  if MessageDlg(s1, mtInformation, [mbyes, mbNo], 0) <> mrYes then exit;

  y2 := strtointDef(GetMyData(s1), -1);
  if y2 < 0 then exit;

  frm1 := TfrmUpdateStatDetail.Create(Application);
  with frm1 do begin
    myData := dataStat;
    showmodal;
    b1 := sonuc;
    dataStat := myData;
  end;
  frm1.free;
  if not b1 then exit;

  AssignFile(fStats, filenameStatistics);
  Reset(fStats);
  seek(fStats, y2);

  write(fstats, dataStat);

  CloseFile(fstats);
  readDetailRecords;
end;

end.

