unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, yupack, Menus, untAlarmGlobals,
  ComCtrls, CheckLst;

type
  TfrmMain = class(TForm)
    meMain: TMainMenu;
    Dosya1: TMenuItem;
    meSaveAlarms: TMenuItem;
    Yardm1: TMenuItem;
    Hakknda1: TMenuItem;
    meSaveLogs: TMenuItem;
    meLoadAlarms: TMenuItem;
    meStats: TMenuItem;
    N4: TMenuItem;
    Yenibirgnebala1: TMenuItem;
    meSettings: TMenuItem;
    Panel2: TPanel;
    pc1: TPageControl;
    ts1: TTabSheet;
    btToDoDetay: TYusoftGradientButton;
    btToDoEkle: TYusoftGradientButton;
    btToDoSil: TYusoftGradientButton;
    btToDoEditName: TYusoftGradientButton;
    ts2: TTabSheet;
    liLog: TListBox;
    btSaveLog: TButton;
    Panel4: TPanel;
    Shape6: TShape;
    spRunning: TShape;
    shAlarmState: TShape;
    lbNow: TLabel;
    lbStopwatch: TLabel;
    shStopwatchReset: TShape;
    shStopwatchStart: TShape;
    imListUp: TImage;
    imListDown: TImage;
    lbTimeLeft: TLabel;
    shAutoSave: TShape;
    Bevel1: TBevel;
    liAlarms: TListBox;
    timerAlarm: TTimer;
    popAlarms: TPopupMenu;
    meTamamla: TMenuItem;
    meReRunAlarm: TMenuItem;
    meUpdateStartTime: TMenuItem;
    N1: TMenuItem;
    mePomodoroAraBitir: TMenuItem;
    mePomodoroWorkBitir: TMenuItem;
    meContinuePomodoro: TMenuItem;
    N2: TMenuItem;
    meNoteStart: TMenuItem;
    meNoteFinish: TMenuItem;
    N3: TMenuItem;
    meRemove: TMenuItem;
    meADvancedUpdate: TMenuItem;
    lbSWinfo: TLabel;
    Panel5: TPanel;
    pnMain: TPanel;
    Shape4: TShape;
    Shape5: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    btAlarm: TYusoftGradientButton;
    btSavePomodoro: TYusoftGradientButton;
    btExactTimeAlarm: TYusoftGradientButton;
    Label10: TLabel;
    Label12: TLabel;
    btToDo: TYusoftGradientButton;
    imAddAlarmName: TImage;
    imDeleteAlarmName: TImage;
    Shape7: TShape;
    Label13: TLabel;
    Label14: TLabel;
    edPomodoroDuration: TEdit;
    edPomodoroBreak: TEdit;
    edExactTime: TEdit;
    edAlarmDuration: TMaskEdit;
    cbAlarmName: TComboBox;
    edOneTimeTimer: TEdit;
    btTimer5: TButton;
    btTimer10: TButton;
    btTimer15: TButton;
    btTimer20: TButton;
    btTimer30: TButton;
    btTimer60: TButton;
    clToDo: TCheckListBox;
    ts3: TTabSheet;
    swList: TScrollBox;
    tmCounter: TTimer;
    liSayacList: TListBox;
    Panel3: TPanel;
    btCounterSil: TButton;
    btCounterTekrar: TButton;
    btCounterDurdur: TButton;
    btCounterDetail: TButton;
    meTitle: TMenuItem;
    Image1: TImage;
    fd1: TFontDialog;
    procedure btAlarmClick(Sender: TObject);
    procedure timerAlarmTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure shAlarmStateMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btExactTimeAlarmClick(Sender: TObject);
    procedure btSavePomodoroClick(Sender: TObject);
    procedure btToDoClick(Sender: TObject);
    procedure Hakknda1Click(Sender: TObject);
    procedure meSaveAlarmsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure meSaveLogsClick(Sender: TObject);
    procedure meLoadAlarmsClick(Sender: TObject);
    procedure liAlarmsDblClick(Sender: TObject);
    procedure lbStopwatchClick(Sender: TObject);
    procedure shStopwatchResetMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure meTamamlaClick(Sender: TObject);
    procedure meRemoveClick(Sender: TObject);
    procedure meContinuePomodoroClick(Sender: TObject);
    procedure meNoteStartClick(Sender: TObject);
    procedure meNoteFinishClick(Sender: TObject);
    procedure shStopwatchStartMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure meReRunAlarmClick(Sender: TObject);
    procedure popAlarmsPopup(Sender: TObject);
    procedure liAlarmsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure meUpdateStartTimeClick(Sender: TObject);
    procedure imAddAlarmNameClick(Sender: TObject);
    procedure mePomodoroAraBitirClick(Sender: TObject);
    procedure mePomodoroWorkBitirClick(Sender: TObject);
    procedure imListUpClick(Sender: TObject);
    procedure imListDownClick(Sender: TObject);
    procedure meADvancedUpdateClick(Sender: TObject);
    procedure liAlarmsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure shAutoSaveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure clToDoDblClick(Sender: TObject);
    procedure btToDoDetayClick(Sender: TObject);
    procedure clToDoClick(Sender: TObject);
    procedure btToDoEkleClick(Sender: TObject);
    procedure btToDoSilClick(Sender: TObject);
    procedure clToDoClickCheck(Sender: TObject);
    procedure btToDoEditNameClick(Sender: TObject);
    procedure meStatsClick(Sender: TObject);
    procedure clToDoDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure Yenibirgnebala1Click(Sender: TObject);
    procedure btPersonalTimerClick(Sender: TObject);
    procedure edOneTimeTimerKeyPress(Sender: TObject; var Key: Char);
    procedure meSettingsClick(Sender: TObject);
    procedure btSaveLogClick(Sender: TObject);
    procedure lbSWinfoClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tmCounterTimer(Sender: TObject);
    procedure btCounterSilClick(Sender: TObject);
    procedure btCounterTekrarClick(Sender: TObject);
    procedure btCounterDurdurClick(Sender: TObject);
    procedure spRunningMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btCounterDetailClick(Sender: TObject);
    procedure meTitleDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure Image1Click(Sender: TObject);
  private
    previousAlarmDay: TDateTime;
    alarmTick, stopwatchEnabled, activeAlarm, alarmsUpdated: bool;
    myAlarmCount: byte;
    myAlarms: array[1..co_maxDailyAlarmType] of alarmStructure;
    myToDoCount: byte;
    myToDo: array[1..co_ToDoMaxRecord] of ToDoStructure;
    clock_counter: integer;
    stopwatchCount: integer;
    stopwatches: array[1..co_maxCounter] of counterStructure;
    repaintCounterList: boolean;
    procedure createConfigFile;
    procedure loadConfig;
    procedure saveConfig;
    procedure openNewDay;
    procedure updateAlarmTick;
    procedure updateAlarmList;
    procedure updateToDoList;
    procedure updateAlarmChangedIndicator(b1: boolean);
    procedure setAlarmState(_state: bool);
    procedure sendToMessageScreenQueue(_msg: string);
    procedure setLog(s1: string);
    procedure saveLogs(_silent: bool);
    procedure saveAlarms(_silent: bool);
    procedure saveToDoList;
    procedure saveNewStatData(yer: integer);
    procedure loadAlarms(_silent: bool);
    procedure loadAlarmNames;
    procedure loadToDoList;
    procedure toggleStopwatch;
    procedure CheckTimeLeft;
    procedure checkToDoButtons;
    procedure runPersonalTimer(min: integer);

    procedure addNewCounter(alarmTitle: string; alarmSure: integer);
    procedure createCounterList;
    procedure clearCounterList;
    procedure updateCounterScreen(counterNo: integer);
    procedure checkCounterTimer;
    procedure reCreateCounterList;
    procedure CounterTimeDoubleClick(sender: TObject);
  public
    { Public declarations }
  end;

var
  frmMain                : TfrmMain;

implementation

{$R *.dfm}

uses untAlarmMessage, DateUtils, untAlarmDetails, untUpdateAlarm,
  untToDoDetails, untStats, untMyInputBox, untAyarlar;

procedure TfrmMain.setLog(s1: string);
begin
  liLog.Items.Add(FormatDateTime(co_timeFormat, time) + ': ' + s1);
  liLog.itemindex := liLog.items.count - 1;
end;

procedure TfrmMain.setAlarmState(_state: bool);
begin
  if _state = false then begin
    shAlarmState.Brush.Color := clRed;
  end else begin
//    beep;
    shAlarmState.Brush.Color := clLime;
  end;
  timerAlarm.Enabled := _state;
  if not _state then begin
    if alarmsUpdated then saveAlarms(true);
    saveLogs(true);
  end;
end;

procedure TfrmMain.updateAlarmList;
var
  y1                     : byte;
  s1                     : string;
begin
  liAlarms.Items.Clear;
  lbTimeLeft.Visible := false;
  activeAlarm := false;
  for y1 := 1 to myAlarmCount do
    with myAlarms[y1] do begin
      s1 := '';
      if alarmType = atPomodoro then begin
        if mode = poModeRun then s1 := ': Çalýþma Zamaný' else s1 := ': Mola Zamaný';
        s1 := s1 + ' (' + inttostr(myAlarms[y1].param1) + '/' + inttostr(myAlarms[y1].param2) + ')';
      end;

      s1 := FormatDateTime(co_hourMinuteFormat, alarmStart)
        + co_draw_seperator + inttostr(alarmType)
        + co_draw_seperator + name + s1
        + co_draw_seperator + alarmEndStr
        + co_draw_seperator + inttostr(status);
      liAlarms.Items.add(s1);
      if status = asStarted then activeAlarm := true;
    end;
  setAlarmState(activeAlarm or stopwatchEnabled);
  updateAlarmChangedIndicator(true);
end;

procedure TfrmMain.updateAlarmChangedIndicator(b1: boolean);
var
  c1                     : TColor;
begin
  alarmsUpdated := b1;
  if b1 then c1 := clLime else c1 := clSilver;
  shAutoSave.Brush.Color := c1;
  shAutoSave.ShowHint := b1;
end;

procedure TfrmMain.btAlarmClick(Sender: TObject);
var
  y1                     : integer;
begin
  try
    y1 := strtoint(edAlarmDuration.text);
  except
    MessageDlg('Süre için sayýsal bir deðer girin', mtWarning, [mbOk], 0);
    edAlarmDuration.SetFocus;
    exit;
  end;
  if myAlarmCount >= co_maxDailyAlarmType then exit;
  inc(myAlarmCount);
  with myAlarms[myAlarmCount] do begin
    name := cbAlarmName.Text;
    duration := y1;
    alarmType := atDuration;
    alarmStart := time;
    alarmEnd := IncMinute(alarmStart, y1);
    alarmEndStr := FormatDateTime(co_hourMinuteFormat, alarmEnd);
    status := asStarted;
  end;
  updateAlarmList;
  setLog('Süreli alarm ' + edAlarmDuration.Text + ' dk. olarak baþlatýldý');
  cbAlarmName.Text := '';
  edAlarmDuration.Text := '';
  cbAlarmName.SetFocus;
end;

procedure TfrmMain.btExactTimeAlarmClick(Sender: TObject);
var
  s1, s2                 : string;
begin
  s1 := edExactTime.Text;
  s2 := cbAlarmName.Text;
  if trim(s2) = '' then begin
    MessageDlg('Bir alarm adý girmelisiniz', mtWarning, [mbOk], 0);
    cbAlarmName.DroppedDown := true;
    cbAlarmName.SetFocus;
    exit;
  end;
  if myAlarmCount >= co_maxDailyAlarmType then exit;
  inc(myAlarmCount);
  with myAlarms[myAlarmCount] do begin
    name := s2;
    duration := 0;
    alarmType := atConstantTime;
    alarmStart := time;
    alarmEnd := StrToTime(s1);
    alarmEndStr := FormatDateTime(co_hourMinuteFormat, alarmEnd);
    status := asStarted;
    param1 := strtoint(getMyData(s1, ':')); //orjinal alarm saati, yeni güne geçiþte alarm bitiþi tekrar buna set edilecek
    param2 := strtoint(s1);
  end;
  updateAlarmList;
  setLog('Saat ' + edExactTime.Text + ' için alarm baþlatýldý');
  cbAlarmName.Text := '';
  edExactTime.Text := '';
  cbAlarmName.SetFocus;
end;

procedure TfrmMain.btToDoClick(Sender: TObject);
begin
  if cbAlarmName.Text = '' then begin
    MessageDlg('Not kaydetmek için ALARM ADI kutusuna notunuzla ilgili bilgi girin', mtWarning, [mbOk], 0);
    exit;
  end;
  if myAlarmCount >= co_maxDailyAlarmType then exit;
  inc(myAlarmCount);
  with myAlarms[myAlarmCount] do begin
    name := cbAlarmName.Text;
    duration := 0;
    alarmType := atToDo;
    alarmStart := time;
    alarmEnd := StrToTime('00:00');
    alarmEndStr := '---';
    status := asWaitingForResponse;
  end;
  updateAlarmList;
  setLog('Yeni not kaydedildi: ' + cbAlarmName.Text);
  cbAlarmName.Text := '';
  edExactTime.Text := '';
  cbAlarmName.SetFocus;
end;

procedure TfrmMain.btSavePomodoroClick(Sender: TObject);
var
  y1                     : integer;
begin
  y1 := strtoint(edPomodoroDuration.Text);
  if myAlarmCount >= co_maxDailyAlarmType then exit;
  inc(myAlarmCount);
  with myAlarms[myAlarmCount] do begin
    name := trim(cbAlarmName.text);
    if name = '' then name := 'Pomodoro';
    duration := y1;
    alarmType := atPomodoro;
    alarmStart := time;
    alarmEnd := IncMinute(time, y1);
    alarmEndStr := FormatDateTime(co_hourMinuteFormat, alarmEnd);
    param1 := strtoint(edPomodoroDuration.Text);
    param2 := strtoint(edPomodoroBreak.Text);
    mode := poModeRun;
    status := asStarted;
  end;
  updateAlarmList;
  setLog('Pomodoro baþladý: Süre: ' + edPomodoroDuration.Text + ' dk., Ara: ' + edPomodoroBreak.Text + ' dk.');
  cbAlarmName.SetFocus;
end;

procedure TfrmMain.updateAlarmTick;
var
  c1                     : TColor;
begin
  if alarmTick then c1 := $009BCFFF else c1 := $00006BD7;
  spRunning.Brush.Color := c1;
end;

procedure TfrmMain.saveNewStatData(yer: integer);
var
  f                      : file of completedAlarmsStatsStructure;
  veri                   : completedAlarmsStatsStructure;
  x1                     : longint;
  y1                     : integer;
begin
  //prepare statistics data
  veri.alarmDate := date;

  with myAlarms[yer] do begin
    veri.name := name;
    veri.alarmType := alarmType;
    veri.alarmStart := alarmStart;
    veri.alarmEnd := alarmEnd;
    veri.parameters[1] := param1;
    veri.parameters[2] := param2;
    veri.parameters[3] := mode;
    veri.parameters[4] := 0;
    veri.parameters[5] := 0;
    for y1 := 1 to 5 do veri.paramsStr[y1] := '';
  end;

  // save data to the file...
  AssignFile(f, filenameStatistics);
{$I-}Reset(f); {$I+}
  if IOResult <> 0 then begin
    ReWrite(f);
  end;
  // go to end of file...
  x1 := filesize(f);
  seek(f, x1);
  // write the data
  write(f, veri);
  CloseFile(f);
end;


procedure TfrmMain.timerAlarmTimer(Sender: TObject);
var
  t1                     : TDateTime;
  y1                     : integer;
  zaman, msgToShow, strLogTmp: string;
  alarmCatched           : boolean;

  function strAlarmType(y: byte): string;
  var
    s1                   : string;
  begin
    case y of
      atDuration: s1 := 'Süreli Alarm';
      atPomodoro: s1 := 'Pomodoro';
      atConstantTime: s1 := 'Belirlenmiþ Sürede';
      atToDo: s1 := 'Tanýmlanmýþ Ýþ';
    end;
    result := s1;
  end;

  procedure checkAutoSave;
  var
    y1                   : integer;
  begin
  //her 10 dakikada bir alarmlar güncellendiyse kaydet
    y1 := strtoint(FormatdateTime('nn', t1));
    y1 := y1 mod 10;
    if y1 = 0 then begin
      saveAlarms(true);
      saveLogs(true);
    end;
  end;

begin
  alarmTick := not alarmTick;
  updateAlarmTick;
  if stopwatchEnabled then begin
    inc(clock_counter);
    lbStopwatch.caption := inttotime(clock_counter, true);
  end;

  alarmCatched := false;
  t1 := time;
  lbNow.Caption := FormatDateTime(co_timeFormat, t1);

  //Her dakika baþýnda zamaný gelen alarm var mý, kontrol et
  y1 := strtoint(FormatdateTime('s', t1));
  if y1 = 0 then begin
    checkTimeLeft;
    if alarmsUpdated and co_AutoSaveAlarms then checkAutoSave;
    zaman := FormatDateTime(co_hourMinuteFormat, t1);
    for y1 := 1 to myAlarmCount do begin
      with myAlarms[y1] do begin
        if (status = asStarted) and (zaman = alarmEndStr) then begin
          strLogTmp :=
            '   Biten Alarm Aralýðý: ' +
            FormatDateTime(co_hourMinuteFormat, alarmStart) + ' - ' +
            FormatDateTime(co_hourMinuteFormat, alarmEnd) +
            ' Alarm Türü : ' + strAlarmType(alarmType);
          saveNewStatData(y1);
          if alarmType = atPomodoro then begin
            if mode = poModeRun then begin
              mode := poModeBreak;
              msgToShow := co_Pomodoro + ': ' + inttostr(param2) + ' dk. ara ver ! (' + alarmEndStr;
              alarmEnd := IncMinute(time, param2);
            end else begin
              mode := poModeRun;
              alarmEnd := IncMinute(time, param1);
              msgToShow := co_Pomodoro + ': Çalýþma zamaný, ' + inttostr(param1) + ' dk.  (' + alarmEndStr;
            end;
            status := asWaitingForResponse;
            alarmEndStr := FormatDateTime(co_hourMinuteFormat, alarmEnd); // bir sonraki pomodore alarmý için
            msgToShow := msgToShow + ' - ' + alarmEndStr + ')';
            sendToMessageScreenQueue(msgToShow);
          end else begin
            status := asFired;
            sendToMessageScreenQueue(name + '  (' + alarmEndStr + ')');
          end;
          setLog(strLogTmp);
          updateAlarmList;
          alarmCatched := true;
        end;
      end;
    end;
//     if frmAlarmMessage.Visible then MessageDlg('', mtInformation, [mbOk],0);
    if alarmCatched and not frmAlarmMessage.messageScreenActive then frmAlarmMessage.ShowModal;
  end;
end;

procedure TfrmMain.sendToMessageScreenQueue(_msg: string);
begin
  frmAlarmMessage.addAlarmMessage(_msg);
  setLog('>> Biten alarm: ' + _msg);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  myAlarmCount := 0;
  clock_counter := 0;
  alarmTick := false;
  stopwatchEnabled := false;
end;

procedure TfrmMain.shAlarmStateMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if myAlarmCount = 0 then exit;
  setAlarmState(not timerAlarm.Enabled);
end;

procedure TfrmMain.Hakknda1Click(Sender: TObject);
begin
  MessageDlg('Dr. Mustafa AFYONLUOGLU' + co_Enter + 'https://afyonluoglu.org' + co_Enter + ' Mart 2023 - Ankara', mtInformation, [mbOk], 0)
end;

procedure TfrmMain.saveLogs(_silent: bool);
var
  f                      : textfile;
  y1                     : integer;
begin
  if liLog.items.Count <= 0 then begin
    if not _silent then MessageDlg('Kaydedilecek log bilgisi bulunamadý', mtWarning, [mbOk], 0);
    exit;
  end;
  assignFile(f, filenameLog);
{$I-}append(f); {$I+}
  if IOResult <> 0 then rewrite(f);
  for y1 := 0 to liLog.items.count - 1 do writeln(f, liLog.items[y1]);
  Flush(f);
  y1 := FileSize(F);
  closeFile(f);
  liLog.Items.Clear;
  if not _silent then MessageDlg('Log bilgileri "' + filenameLog + '" dosyasýna kaydedildi. Dosya boyutu: ' + IntToStr(y1), mtInformation, [mbOk], 0)
end;

procedure TfrmMain.saveAlarms(_silent: bool);
var
  f                      : file of alarmStructure;
  y1                     : integer;
begin
  AssignFile(f, filenameAlarms);
  ReWrite(f);
  for y1 := 1 to myAlarmCount do write(f, myAlarms[y1]);
  CloseFile(f);
  updateAlarmChangedIndicator(false);
  setLog('Alarmlar diske kaydedildi');
  if not _silent then begin
    if myAlarmCount = 0 then MessageDlg('Hiç alarm kaydý yok', mtInformation, [mbOk], 0)
    else begin
      MessageDlg('Alarmlar kaydedildi. (Toplam ' + inttostr(myAlarmCount) + ' alarm)', mtInformation, [mbOk], 0);
    end;
  end;
end;

procedure TfrmMain.meSaveAlarmsClick(Sender: TObject);
begin
  saveAlarms(false);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  timerAlarm.Enabled := false;
  if stopwatchCount > 0 then tmCounter.Enabled := false;
  saveLogs(true);
  if alarmsUpdated then saveAlarms(true);
end;

procedure TfrmMain.meSaveLogsClick(Sender: TObject);
begin
  saveLogs(false);
end;

procedure TfrmMain.loadAlarms(_silent: bool);
var
  f                      : file of alarmStructure;
  myData                 : alarmStructure;
begin
  myAlarmCount := 0;
  AssignFile(f, filenameAlarms);
  {$I-}Reset(f); {$I+}
  if IOResult <> 0 then begin
    ReWrite(f);
  end;

  try
    while not Eof(F) do begin
      read(f, myData);
      inc(myAlarmCount);
      with myData do begin
        if alarmType = atToDo then begin
          // status := asWaitingForResponse;
          if (status <> asFired) then begin
            alarmEnd := StrToTime('00:00');
            alarmEndStr := '---';
          end;
        end else if alarmType = atConstantTime then begin
         //  status := asStarted;
        end else begin
          if (alarmEnd < time) then begin // alarm zamaný geçmiþse yeni alarm zamaný tanýmla
            alarmStart := time;
            if status <> asFired then begin
              alarmEnd := IncMinute(alarmStart, duration);
              alarmEndStr := FormatDateTime(co_hourMinuteFormat, alarmEnd);
            end;
          end else begin
          // alarm süresi daha dolmamýþsa baþlangýç ve bitiþ deðerlerini deðiþtirme
          end;
        end;
      end;
      myAlarms[myAlarmCount] := myData;
    end;
  finally
    CloseFile(F);
  end;
  updateAlarmList;
  updateAlarmChangedIndicator(false);
  if not _silent then MessageDlg('Toplam ' + inttostr(myAlarmCount) + ' alarm yüklendi', mtInformation, [mbOk], 0)
end;

procedure TfrmMain.meLoadAlarmsClick(Sender: TObject);
begin
  loadAlarms(false);
end;

procedure TfrmMain.liAlarmsDblClick(Sender: TObject);
begin
  frmAlarmDetails.dataToBeShowed := myAlarms[liAlarms.itemindex + 1];
  frmAlarmDetails.ShowModal;
end;

procedure TfrmMain.lbStopwatchClick(Sender: TObject);
begin
  toggleStopwatch;
end;

procedure TfrmMain.shStopwatchResetMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  clock_counter := 0;
  lbStopwatch.Caption := co_stopwatchStartStr;
end;

procedure TfrmMain.meTamamlaClick(Sender: TObject);
var
  y1                     : integer;
begin
  y1 := liAlarms.ItemIndex;
  if y1 < 0 then exit;
  with myAlarms[y1 + 1] do begin
    status := asFired;
    alarmEnd := time;
    alarmEndStr := FormatDateTime(co_hourMinuteFormat, alarmEnd);
  end;
  updateAlarmList;
  saveNewStatData(y1 + 1);
  setLog('Alarm ' + myAlarms[y1 + 1].name + ' tamamlandý (' +
    FormatDateTime(co_hourMinuteFormat, myAlarms[y1 + 1].alarmStart) +
    ' - ' + FormatDateTime(co_hourMinuteFormat, time)
    + ')');
end;

procedure TfrmMain.meRemoveClick(Sender: TObject);
var
  y1, y2                 : integer;
  s1                     : string;
begin
  y1 := liAlarms.ItemIndex;
  if y1 < 0 then exit;
  inc(y1);
  s1 := myAlarms[y1].name;
  if MessageDlg(s1 + ' alarmýný kaldýrmak istediðinize emin misiniz?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  dec(myAlarmCount);
  for y2 := y1 to myAlarmCount do begin
    myAlarms[y2] := myAlarms[y2 + 1];
  end;
  updateAlarmList;
  setLog('"' + s1 + '" için alarm kaydý kaldýrýldý');
end;

procedure TfrmMain.meContinuePomodoroClick(Sender: TObject);
var
  y1                     : integer;
  s1                     : string;
begin
  y1 := liAlarms.ItemIndex;
  if y1 < 0 then exit;
  with myAlarms[y1 + 1] do begin
    status := asStarted;
    alarmStart := time;
    if mode = poModeRun then begin
      alarmEnd := IncMinute(time, param1);
      s1 := 'çalýþma';
    end else begin
      alarmEnd := IncMinute(time, param2);
      s1 := 'mola';
    end;
    status := asStarted;
    alarmEndStr := FormatDateTime(co_hourMinuteFormat, alarmEnd);
  end;
  updateAlarmList;
  setLog(co_Pomodoro + ' ' + s1 + ' zamaný baþlýyor');
end;

procedure TfrmMain.meNoteStartClick(Sender: TObject);
var
  y1                     : integer;
begin
  y1 := liAlarms.ItemIndex;
  if y1 < 0 then exit;
  with myAlarms[y1 + 1] do begin
    status := asStarted;
    alarmStart := time;
    alarmEnd := IncMinute(time, appConfig.defToDoTime); // not'larýn 15 dk içinde tamamlanacaðý varsayýldý
    alarmEndStr := FormatDateTime(co_hourMinuteFormat, alarmEnd);
    updateAlarmList;
    setLog('Not "' + name + '" baþlatýldý');
  end;
end;

procedure TfrmMain.meNoteFinishClick(Sender: TObject);
var
  y1, oldVal             : integer;
  s1                     : string;
begin
  y1 := liAlarms.ItemIndex;
  if y1 < 0 then exit;

  with myAlarms[y1 + 1] do begin
    oldVal := param1;
    s1 := '0';
    inputQuery('Ýþlem bitti', 'Bu iþi kaç kez yaptýnýz?', s1);
    param1 := strtointDef(s1, 0);
    status := asFired;
    alarmEnd := time;
    alarmEndStr := FormatDateTime(co_hourMinuteFormat, alarmEnd);
    updateAlarmList;
    saveNewStatData(y1 + 1);
    param1 := oldVal;
    setLog('Not "' + name + '" tamamlandý');
  end;
end;

procedure TfrmMain.toggleStopwatch;
var
  c1                     : TColor;
begin
  stopwatchEnabled := not stopwatchEnabled;
  if not activeAlarm then setAlarmState(stopwatchEnabled);
  case stopwatchEnabled of
    true: c1 := $0000F200;
    false: c1 := clSilver;
  end;
  shStopwatchStart.Brush.Color := c1;
  case stopwatchEnabled of
    true: c1 := $00BB0000;
    false: c1 := $007D7D7D;
  end;
  lbStopwatch.Color := c1;
  if stopwatchEnabled then begin
    lbSWinfo.Cursor := crHandPoint;
  end else begin
    lbSWinfo.Cursor := crDefault;
    lbSWinfo.Caption := co_defStopwatchInfo;
  end;
end;

procedure TfrmMain.shStopwatchStartMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  toggleStopwatch;
end;

procedure TfrmMain.meReRunAlarmClick(Sender: TObject);
var
  y1                     : integer;
begin
  y1 := liAlarms.ItemIndex;
  if y1 < 0 then exit;
  with myAlarms[y1 + 1] do begin
    status := asStarted;
    alarmStart := time;
    if alarmType = atDuration then begin
      alarmEnd := IncMinute(alarmStart, duration);
      alarmEndStr := FormatDateTime(co_hourMinuteFormat, alarmEnd);
    end;
    if alarmType = atToDo then begin
      status := asWaitingForResponse;
      alarmEnd := IncMinute(time, appConfig.defToDoTime);
    end;
  end;

  updateAlarmList;
  setLog('Alarm "' + myAlarms[y1 + 1].name + '" yeniden baþlatýldý');
end;


procedure TfrmMain.popAlarmsPopup(Sender: TObject);
var
  y1                     : integer;
  s1                     : string;
  b1                     : boolean;
begin
  y1 := liAlarms.ItemIndex;
  b1 := y1 >= 0;

  meTitle.Visible := b1;
  meTamamla.Visible := b1;
  meReRunAlarm.Visible := b1;
  meUpdateStartTime.Visible := b1;
  meRemove.Visible := b1;
  meContinuePomodoro.Visible := b1;
  meNoteStart.Visible := b1;
  meNoteFinish.Visible := b1;
  meUpdateStartTime.Visible := b1;
  mePomodoroAraBitir.Visible := b1;
  mePomodoroWorkBitir.Visible := b1;
  meADvancedUpdate.Visible := b1;
  if not b1 then exit;

  inc(y1);

  meTitle.Caption := myAlarms[y1].name;
  meTitle.Tag := y1; // onDraw'da myAlarms'ýn istenilen deðerine eriþilebilmesi için
  with myAlarms[y1] do begin
    if alarmType = atDuration then meReRunAlarm.Caption := 'Bu Alarmý Baþlat'
    else meReRunAlarm.Caption := 'Bu Alarmý Tekrar Kur';

    meTamamla.Visible := (status = asStarted) and (alarmType <> atPomodoro) and (alarmType <> atToDo);
    meReRunAlarm.Visible := (status = asFired) or ((alarmType = atDuration) and (status = asWaitingForResponse));
    meRemove.Visible := true;
    meContinuePomodoro.Visible := (alarmType = atPomodoro) and (status = asWaitingForResponse);
    meNoteStart.Visible := (alarmType = atToDo) and (status = asWaitingForResponse);
    meNoteFinish.Visible := (alarmType = atToDo) and (status = asStarted);
    meUpdateStartTime.Visible := (alarmType = atConstantTime) and (status = asFired);
    mePomodoroAraBitir.Visible := (alarmType = atPomodoro) and (mode = poModeBreak) and (status = asStarted);
    mePomodoroWorkBitir.Visible := (alarmType = atPomodoro) and (mode = poModeRun) and (status = asStarted);

    if mode = 0 then s1 := 'Pomodoro: Çalýþma Zamanýný baþlat' else s1 := 'Pomodoro: Molayý baþlat';
    meContinuePomodoro.Caption := s1;
  end;

end;

procedure TfrmMain.liAlarmsDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  y1, yukseklik          : integer;
  s1, s2                 : string;
  r1, r2                 : TRect;
  c1                     : TColor;
begin
  with (Control as TListBox), Canvas do begin
    yukseklik := rect.Bottom - rect.Top;

    s1 := items[index];
    s2 := copy(s1, 1, 5);
    // baþlangýç saatini yaz
    Brush.Color := clBlack;
    r1 := rect;
    r1.Right := r1.Left + 35;
    FillRect(r1);
    font.color := clWhite;
    TextOut(r1.Left + 2, r1.Top, s2);

    // Alarm türü rengini boya
    delete(s1, 1, 6);
    y1 := strtoint(copy(s1, 1, 1));
    c1 := clBlack; //default value
    case y1 of
      atConstantTime: c1 := co_ColorConstantTime;
      atToDo: c1 := co_ColorToDo;
      atPomodoro: c1 := co_ColorPomodoro;
      atDuration: c1 := co_ColorDuration;
    end;

    r1.Left := r1.Right;
    r1.Right := r1.Left + yukseklik;
    Brush.Color := c1;
    FillRect(r1);

    r1.Left := r1.Right;
    r1.Right := rect.right;
    if odSelected in state then Brush.Color := $006FB7FF else Brush.Color := clCream;
    FillRect(r1);

    font.color := clBlack;
    GetMyData(s1); // skip alarm type
    r2 := r1;
    s2 := GetMyData(s1);
    r2.Right := r2.Left + 210;
    TextOut(r2.Left + 2, r2.Top, s2);

    r2.Left := r2.Right;
    r2.Right := r2.Left + 75;
    s2 := GetMyData(s1);
    TextOut(r2.Left + 2, r2.Top, s2);

    r2.Left := r1.Right - yukseklik;
    r2.Right := r1.Right;
    y1 := strtoint(s1);
    case y1 of
      asStarted: c1 := co_ColorStarted;
      asWaitingForResponse: c1 := co_ColorWaitingForResponse;
      asFired: c1 := co_ColorFired;
      asNotRunToday: c1 := co_ColorNotRunToday;
      asNotDoneToday: c1 := co_ColorNotDoneToday;
    end;
    Brush.Color := c1;
    FillRect(r2);
  end;
end;

procedure TfrmMain.meUpdateStartTimeClick(Sender: TObject);
var
  y1                     : integer;
  s1                     : string;
  clickedOK              : boolean;
begin
  y1 := liAlarms.ItemIndex;
  if y1 < 0 then exit;
  with myAlarms[y1 + 1] do
    if alarmType = atConstantTime then begin
      s1 := alarmEndStr;
      clickedOK := inputQuery('Veri Güncelleme', 'Alarm Baþlama Zamaný', s1);
      if not clickedOK then exit;
      alarmEnd := strToTime(s1);
      alarmEndStr := s1;
      updateAlarmList;
      setLog(name + ' için alarm baþlama zamaný ' + s1 + ' olarak güncellendi');
    end;
end;

procedure TfrmMain.loadAlarmNames;
var
  s1                     : string;
  f                      : textfile;
begin
  cbAlarmName.items.Clear;
  AssignFile(f, filenameAlarmNames);

  {$I-}Reset(f); {$I+}
  if IOResult <> 0 then begin
    ReWrite(f);
    CloseFile(F);
    exit;
  end;

  try
    while not Eof(F) do begin
      readln(f, s1);
      cbAlarmName.Items.Add(s1);
    end;
  finally
    CloseFile(F);
  end;
end;

procedure TfrmMain.imAddAlarmNameClick(Sender: TObject);
var
  s1                     : string;
  f                      : textfile;
  clickedOK              : boolean;
begin
  s1 := '';
  clickedOK := inputQuery('Alarm Adý Ekleme', 'Yeni Alarm Adý:', s1);
  if not clickedOK then exit;
  assignFile(f, filenameAlarmNames);
{$I-}append(f); {$I+}
  if IOResult <> 0 then rewrite(f);
  writeln(f, s1);
  Flush(f);
  closeFile(f);
  loadAlarmNames;
end;

procedure TfrmMain.mePomodoroAraBitirClick(Sender: TObject);
var
  y1                     : integer;
begin
  y1 := liAlarms.ItemIndex;
  if y1 < 0 then exit;
  saveNewStatData(y1 + 1);
  with myAlarms[y1 + 1] do begin
    mode := poModeRun;
    status := asWaitingForResponse;
  end;
  updateAlarmList;
  setLog(co_Pomodoro + ' arasý bitirildi');
end;

procedure TfrmMain.mePomodoroWorkBitirClick(Sender: TObject);
var
  y1                     : integer;
begin
  y1 := liAlarms.ItemIndex;
  if y1 < 0 then exit;
  saveNewStatData(y1 + 1);
  with myAlarms[y1 + 1] do begin
    mode := poModeBreak;
    status := asWaitingForResponse;
  end;
  updateAlarmList;
  setLog(co_Pomodoro + ' çalýþma süresi bitirildi');

end;

procedure TfrmMain.imListUpClick(Sender: TObject);
var
  y1                     : integer;
  tmp                    : alarmStructure;
begin
  y1 := liAlarms.ItemIndex;
  if y1 < 1 then exit;
  inc(y1);
  tmp := myAlarms[y1 - 1];
  myAlarms[y1 - 1] := myAlarms[y1];
  myAlarms[y1] := tmp;
  updateAlarmList;
  liAlarms.ItemIndex := y1 - 2;
end;

procedure TfrmMain.imListDownClick(Sender: TObject);
var
  y1                     : integer;
  tmp                    : alarmStructure;
begin
  y1 := liAlarms.ItemIndex;
  if y1<0 then exit;
  inc(y1);
  if y1 >= myAlarmCount then exit;

  tmp := myAlarms[y1 + 1];
  myAlarms[y1 + 1] := myAlarms[y1];
  myAlarms[y1] := tmp;
  updateAlarmList;
  liAlarms.ItemIndex := y1;

end;

procedure TfrmMain.runPersonalTimer(min: integer);
var
  clickedOK              : boolean;
  alarmTitle, sure       : string;
begin
  clickedOK := MyInputBox(inttostr(min) + ' dakikalýk Sayaç', 'Açýklama:', cbAlarmName.items, alarmTitle);
  if not clickedOK then exit;

  addNewCounter(alarmTitle, min);
end;


procedure TfrmMain.meADvancedUpdateClick(Sender: TObject);
var
  y1                     : integer;
  b1                     : bool;
begin
  y1 := liAlarms.ItemIndex;
  if y1 < 0 then exit;
  frmUpdateAlarm := TfrmUpdateAlarm.Create(Application);
  frmUpdateAlarm.myData := myAlarms[y1 + 1];
  frmUpdateAlarm.ShowModal;
  b1 := frmUpdateAlarm.sonuc;
  frmUpdateAlarm.Free;
  if b1 then begin
    myAlarms[y1 + 1] := frmUpdateAlarm.myData;
    updateAlarmList;
    setLog('"' + myAlarms[y1 + 1].name + '" bilgileri deðiþtirildi');
  end;
  liAlarms.itemindex := y1;
  if b1 then CheckTimeLeft;
end;

procedure TfrmMain.CheckTimeLeft;
var
  y1, y2                 : integer;
  b1                     : bool;
  c1                     : TColor;
  d1                     : TDateTime;
  s1                     : string;
begin
  y1 := liAlarms.ItemIndex;
  if y1 < 0 then begin
    lbTimeLeft.Visible := false;
    exit;
  end;
  inc(y1);
  with myAlarms[y1] do begin
    b1 := status = asStarted;
    lbTimeLeft.Visible := b1;
    if b1 then begin
      s1 := FormatDateTime(co_hourMinuteFormat, alarmEnd);
      d1 := StrToTime(s1); // saniye kýsmýný at
      y2 := MinutesBetween(d1, time) + 1;
      if (y2 <= 5) or (d1<time) then c1 := clRed else c1 := clGreen;
      s1:= inttotime(y2 * 60, false);
      if  d1<time then s1:='!!!     - '+s1+'     !!!';
      lbTimeLeft.Font.Color := c1;
      lbTimeLeft.Caption := 'Kalan Zaman: ' + s1;
    end;
  end;
end;

procedure TfrmMain.liAlarmsClick(Sender: TObject);
begin
  CheckTimeLeft;
end;

procedure TfrmMain.openNewDay;
var
  y1                     : integer;
  s1                     : string;

  procedure savePreviousDayAlarmSummary;
  var
    y1                   : integer;
    veri                 : alarmSummaryStructure;
  begin
    AssignFile(fAlarmSummary, filenameAlarmSummary);
{$I-}reset(fAlarmSummary); {$I+}
    if IOResult <> 0 then begin
      liLog.items.add('$DMAG > Alarm özet dosyasý yaratýlýyor...');
      rewrite(fAlarmSummary);
    end;

    y1 := filesize(fAlarmSummary);
    seek(fAlarmSummary, y1);

    for y1 := 1 to myAlarmCount do begin
      with myAlarms[y1] do begin
        veri.alarmDate := previousAlarmDay;
        veri.name := name;
        veri.duration := duration;
        veri.alarmType := alarmType;
        veri.status := status;
        veri.param1 := param1;
        veri.param2 := param2;
        veri.mode := mode;
      end;
      write(fAlarmSummary, veri);
    end;
    CloseFile(fAlarmSummary);
    liLog.items.add('*** Alarm summary saved -> ' + formatdatetime(co_dateFormat, previousAlarmDay));
  end;

begin
  MessageDlg('Yeni bir gün baþlýyor !...', mtInformation, [mbOk], 0);
  savePreviousDayAlarmSummary;
  for y1 := 1 to myAlarmCount do
    with myAlarms[y1] do begin
      alarmStart := time;
      if (alarmType = atToDo) then begin
        status := asWaitingForResponse;
        alarmEnd := StrToTime('00:00');
        alarmEndStr := '---';
      end else if (alarmType = atDuration) then begin
        status := asWaitingForResponse;
      end else status := asStarted;
      if (alarmType = atPomodoro) then begin
        mode := poModeRun;
        alarmEnd := IncMinute(alarmStart, param1);
        alarmEndStr := FormatDateTime(co_hourMinuteFormat, alarmEnd);
      end;
      if (alarmType = atConstantTime) then begin
        // orjinal alarm bitiþ saatini restore et
        if (param1 <> 0) then begin
          s1 := inttostr(param1) + ':' + inttostr(param2);
          alarmEnd := strtotime(s1);
          alarmEndStr := FormatDateTime(co_hourMinuteFormat, alarmEnd);
        end;
      end;
    end;
  updateAlarmList;
  //update config file
  appConfig.lastLoginDate := date;
  saveConfig;
  setLog('########## ' + FormatdateTime(co_dateFormat, date) + ' ##########');
end;

procedure TfrmMain.createConfigFile;
begin
  rewrite(fConfig);
  appConfig.defToDoTime := 30; // 0,5 saat
  appConfig.lastLoginDate := date;
  write(fConfig, appConfig);
  CloseFile(fConfig);
end;

procedure TfrmMain.loadConfig;
begin
  AssignFile(fConfig, filenameConfig);

  {$I-}reset(fConfig); {$I+}
  if IOResult <> 0 then begin
    createConfigFile;
    reset(fConfig);
  end;
  try
    read(fConfig, appConfig);
  finally
    CloseFile(fConfig);
  end;
  previousAlarmDay := appConfig.lastLoginDate;
  if appConfig.lastLoginDate < date then openNewDay;
end;

procedure TfrmMain.saveConfig;
begin
  AssignFile(fConfig, filenameConfig);
  reset(fConfig);
  write(fConfig, appConfig);
  CloseFile(fConfig);
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  y1                     : integer;
begin
   width := pnMain.Width+25;

  pc1.ActivePage := ts1;
  cbAlarmName.SetFocus;
  loadAlarms(true);
  loadAlarmNames;
  loadToDoList;
  checkToDoButtons;
  loadConfig;
  repaintCounterList := false;

  stopwatchCount := 0;
  for y1 := 1 to co_maxCounter do
    with stopwatches[y1] do begin
      running := false;
      title := '';
      duration := 0;
    end;
end;

procedure TfrmMain.shAutoSaveMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if alarmsUpdated then saveAlarms(true);
end;

procedure TfrmMain.clToDoDblClick(Sender: TObject);
begin
  btToDoDetayClick(sender);
end;

procedure TfrmMain.checkToDoButtons;
var
  y1                     : integer;
begin
  y1 := clToDo.ItemIndex;
  btToDoSil.Enabled := y1 >= 0;
  btToDoDetay.Enabled := y1 >= 0;
  btToDoEditName.Enabled := y1 >= 0;
end;

procedure TfrmMain.clToDoClick(Sender: TObject);
begin
  checkToDoButtons;
end;

procedure TfrmMain.btToDoEkleClick(Sender: TObject);
var
  s1                     : string;
  clickedOK              : boolean;
begin
  s1 := '';
  clickedOK := inputQuery('Yapýlacak Ýþ Ekleme', 'Yapýlacak Ýþ', s1);
  if not clickedOK then exit;
  clToDo.items.Add(s1);
  inc(myToDoCount);
  myToDo[myToDoCount].name := s1;
  saveToDoList;
end;

procedure TfrmMain.btToDoSilClick(Sender: TObject);
begin
  MessageDlg('', mtInformation, [mbOk], 0);
  saveToDoList;
end;

procedure TfrmMain.btToDoDetayClick(Sender: TObject);
var
  y1                     : integer;
begin
  y1 := clToDo.ItemIndex;
  if y1 < 0 then exit;
  inc(y1);
  with frmToDoDetails do begin
    veri := myToDo[y1];
    ShowModal;
    if cevap then begin
      myToDo[y1] := veri;
      clToDo.Refresh;
      saveToDoList;
    end;
  end;
end;

procedure TfrmMain.loadToDoList;
var
  f                      : file of ToDoStructure;
  myData                 : ToDoStructure;
begin
  myToDoCount := 0;
  AssignFile(f, filenameToDoLists);

  {$I-}Reset(f); {$I+}
  if IOResult <> 0 then begin
    ReWrite(f);
  end;

  try
    while not Eof(F) do begin
      read(f, myData);
      inc(myToDoCount);
      with myData do myToDo[myToDoCount] := myData;
    end;
  finally
    CloseFile(F);
  end;
  updateToDoList;
end;

procedure TfrmMain.updateToDoList;
var
  y1                     : integer;
begin
  clToDo.Items.Clear;
  for y1 := 1 to myToDoCount do begin
    clToDo.Items.add(myToDo[y1].name);
    clToDo.Checked[y1 - 1] := myToDo[y1].checked;
  end;
end;

procedure TfrmMain.saveToDoList;
var
  f                      : file of ToDoStructure;
  y1                     : integer;
begin
  AssignFile(f, filenameToDoLists);
  ReWrite(f);
  for y1 := 1 to myToDoCount do begin
    write(f, myToDo[y1]);
  end;
  CloseFile(f);
end;

procedure TfrmMain.clToDoClickCheck(Sender: TObject);
var
  y1                     : integer;
begin
  y1 := clToDo.ItemIndex;
  myToDo[y1 + 1].checked := clToDo.Checked[y1];
  saveToDoList;
end;

procedure TfrmMain.btToDoEditNameClick(Sender: TObject);
var
  y1                     : integer;
  s1                     : string;
  clickedOK              : boolean;
begin
  y1 := clToDo.ItemIndex;
  if y1 < 0 then exit;
  s1 := myToDo[y1 + 1].name;
  clickedOK := inputQuery('Ýþ Adýný Düzenleme', 'Yeni Açýklama', s1);
  if clickedOK then begin
    myToDo[y1 + 1].name := s1;
    saveToDoList;
  end;
end;

procedure TfrmMain.meStatsClick(Sender: TObject);
var
  a                      : TfrmStats;
begin
  a := TfrmStats.Create(Application);
  a.showModal;
  a.free;
end;

procedure TfrmMain.clToDoDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  r1                     : TRect;
  s1                     : string;
  sState                 : TOwnerDrawState;

  function findItemCount(_st: ToDoStructure): integer;
  var
    adet, y1             : integer;
    s1                   : string;
  begin
    adet := 0;
    for y1 := 1 to _st.detailLineCount do begin
      s1 := _st.detail[y1];
      s1 := copy(s1, 1, 1);
      if s1 = '-' then inc(adet);
    end;
    result := adet;
  end;

begin
  sState := state;
  with (Control as TCheckListBox), Canvas do begin
    r1 := rect;
    s1 := items[index];

    if odSelected in sState then brush.color := clBlack;
    r1.Right := rect.Right - 40;
    FillRect(r1);
    TextOut(r1.Left + 2, r1.Top, s1);

  //  s1 := inttostr(myToDo[index + 1].detailLineCount);
    s1 := inttostr(findItemCount(myToDo[index + 1]));
    if (odSelected in sState) then begin
      if s1 = '0' then Brush.Color := clGray else Brush.Color := clBlue;
    end else begin
      if s1 = '0' then Brush.Color := $00DDE7E8 else Brush.Color := co_ColorLightAqua;
    end;
    r1.Left := r1.Right;
    r1.Right := rect.right;
    FillRect(r1);
    r1.Right := rect.right - 10;
    DrawText(Canvas.Handle, PChar(s1), Length(s1), r1, DT_SINGLELINE or DT_RIGHT);
  end;
end;

procedure TfrmMain.Yenibirgnebala1Click(Sender: TObject);
begin
  if MessageDlg('Bütün alarmlar yeniden baþlatýlacaktýr. Emin misiniz ?',
    mtWarning, [mbYes, mbNo], 0) <> mrYes then exit;
  openNewDay;
end;

procedure TfrmMain.btPersonalTimerClick(Sender: TObject);
var
  y1                     : integer;
begin
  y1 := (sender as TButton).tag;
  runPersonalTimer(y1);
end;

procedure TfrmMain.edOneTimeTimerKeyPress(Sender: TObject; var Key: Char);
var
  y1                     : integer;
begin
  if key = #13 then begin
    try
      y1 := strtoint(edOneTimeTimer.text);
    except
      MessageDlg('Sayacýn süresini girmelisiniz!', mtWarning, [mbOk], 0);
      exit;
    end;
    runPersonalTimer(y1);
    edOneTimeTimer.text := '';
  end;
end;

procedure TfrmMain.meSettingsClick(Sender: TObject);
begin
  frmAyarlar.ShowModal;
  saveConfig;
  MessageDlg('Last Date:' + FormatDateTime(co_dateFormat, appConfig.lastLoginDate) + co_Enter +
    'Default ToDo Time: ' + inttostr(appConfig.defToDoTime) + ' min.', mtInformation, [mbOk], 0)
end;

procedure TfrmMain.btSaveLogClick(Sender: TObject);
begin
  saveLogs(true);
end;

procedure TfrmMain.lbSWinfoClick(Sender: TObject);
var
  s1, s2                 : string;
  b1                     : boolean;
begin
  if not stopwatchEnabled then exit;
  s2 := lbSWinfo.Caption;
  if s2 = co_defStopwatchInfo then s1 := '' else s1 := s2;
  b1 := inputQuery('Sayaç Açýklamasý', 'Açýklama', s1);
  if not b1 then exit;
  lbSWinfo.Caption := s1;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  btSaveLog.Left := liLog.Width - btSaveLog.Width - 5;
end;

procedure TfrmMain.addNewCounter(alarmTitle: string; alarmSure: integer);
begin
  if stopwatchCount >= co_maxCounter then begin
    MessageDlg('En çok ' + inttostr(co_maxCounter) + ' sayaç tanýmlanabilir !', mtInformation, [mbOk], 0);
    exit;
  end;
  inc(stopwatchCount);
  with stopwatches[stopwatchCount] do begin
//    id := 1;
    title := alarmTitle;
    duration := alarmSure;
    currentValue := alarmSure * 60;
    startTime := time;
    running := true;
    setLog('Sayaç baþladý (' + inttostr(duration) + ' dk.)  - ' + title);
  end;
  if pc1.ActivePage <> ts3 then pc1.ActivePage := ts3;
  reCreateCounterList;
end;

procedure TfrmMain.clearCounterList;
var
  y1, nesneAdet          : integer;
begin
  nesneAdet := swList.ComponentCount;
  for y1 := nesneAdet - 1 downto 0 do
  try
    swList.Components[y1].free;
  except
    MessageDlg('clearCounterList:' + co_Enter +
      ' y1 = ' + inttostr(y1) + co_Enter +
      'Component Count: ' + inttostr(nesneAdet), mtInformation, [mbOk], 0)
  end;
  liSayacList.Items.Clear;
end;

procedure TfrmMain.CounterTimeDoubleClick(sender: TObject);
var
  y1, yer                : integer;
  s1                     : string;
  clickedOK              : boolean;
begin
  yer := (sender as TLabel).tag;
  y1 := stopwatches[yer].duration;
  s1 := inttostr(y1);
  clickedOK := inputQuery('Sayaç Süresi Deðiþtirme', 'Yeni Süre', s1);
  if not clickedOK then exit;
  y1 := strtointDef(s1, 0);
  if y1 = 0 then exit;
  stopwatches[yer].duration := y1;
  repaintCounterList := true;
end;

procedure TfrmMain.createCounterList;
const
  myItemHeight           = 40;
var
  y1                     : integer;
  lbTmp                  : TLabel;
  bv1                    : TBevel;
  sh1                    : TShape;
begin
  for y1 := 1 to stopwatchCount do begin
    lbTmp := TLabel.Create(swList);
    lbTmp.Name := 'swName' + inttostr(y1);
    lbTmp.Parent := swList;
    lbTmp.left := 9;
    lbTmp.Top := (y1 - 1) * myItemHeight + 5;
    lbTmp.Caption := stopwatches[y1].title;

    lbTmp := TLabel.Create(swList);
    lbTmp.Name := 'swDuration' + inttostr(y1);
    lbTmp.Parent := swList;
    lbTmp.left := 9;
    lbTmp.Top := (y1 - 1) * myItemHeight + 22;
    lbTmp.Caption := 'Süre: ' + inttotime(stopwatches[y1].duration * 60, false) + ' dk.';

    lbTmp := TLabel.Create(swList);
    lbTmp.Name := 'swValue' + inttostr(y1);
    lbTmp.Parent := swList;
    lbTmp.left := 180;
    lbTmp.Font.Size := 20;
    lbTmp.Font.Color := clBlack;
    lbTmp.Top := (y1 - 1) * myItemHeight + 2;
    lbTmp.Caption := inttotime(stopwatches[y1].currentValue, true);
    lbTmp.tag := y1;
    lbTmp.Cursor := crHandPoint;
    lbTmp.OnDblClick := CounterTimeDoubleClick;

    bv1 := TBevel.Create(swList);
    bv1.Name := 'swSeperator' + inttostr(y1);
    bv1.Parent := swList;
    bv1.left := 5;
    bv1.Shape := bsTopLine;
    bv1.width := 305;
    bv1.Height := 3;
    bv1.tag := 1;
    bv1.Top := (y1 - 1) * myItemHeight + 37;

    sh1 := TShape.Create(swList);
    sh1.Name := 'swShape' + inttostr(y1);
    sh1.Parent := swList;
    sh1.left := 295;
    sh1.width := 10;
    sh1.Height := 25;
    sh1.Brush.Color := clLime;
    sh1.Top := (y1 - 1) * myItemHeight + 5;

    liSayacList.Items.add(stopwatches[y1].title);

    updateCounterScreen(y1);
  end;
end;

procedure TfrmMain.checkCounterTimer;
var
  y1                     : integer;
  b1                     : boolean;
begin
  b1 := false;
  for y1 := 1 to stopwatchCount do
    if stopwatches[y1].running then b1 := true;
  tmCounter.Enabled := b1;
end;

procedure TfrmMain.reCreateCounterList;
begin
  clearCounterList;
  createCounterList;
  checkCounterTimer;
end;

procedure TfrmMain.updateCounterScreen(counterNo: integer);
var
  lbTmp                  : TLabel;
  shTmp                  : TShape;
  counterNumber          : string;
begin
  with stopwatches[counterNo] do begin
    counterNumber := inttostr(counterNo);
    lbTmp := swList.FindComponent('swValue' + counterNumber) as TLabel;
    lbTmp.Caption := inttotime(currentValue, true);
    if currentValue < 60 then lbTmp.font.Color := clRed;
    if currentValue = 0 then begin
      running := false;
      shTmp := swList.FindComponent('swShape' + counterNumber) as TShape;
      shTmp.Brush.Color := clSilver;
      lbTmp.font.Color := clsilver;
    end;
  end;
end;

procedure TfrmMain.tmCounterTimer(Sender: TObject);
var
  y1                     : integer;
begin
  tmCounter.Enabled := false;
  if repaintCounterList then begin
    reCreateCounterList;
    repaintCounterList := false;
  end;
  for y1 := 1 to stopwatchCount do
    with stopwatches[y1] do
      if running then begin
        currentValue := currentValue - 1;
        updateCounterScreen(y1);
        if currentValue = 0 then begin
          sendToMessageScreenQueue('Biten sayaç: ' + title + ' (' + FormatDateTime(co_timeFormat, now) + ')');
          if not frmAlarmMessage.messageScreenActive then frmAlarmMessage.Show;
        end;
      end;
  checkCounterTimer;
end;

procedure TfrmMain.btCounterSilClick(Sender: TObject);
var
  y1, y2                 : integer;
  b1                     : boolean;
  s1                     : string;
begin
  if liSayacList.items.count = 0 then begin
    MessageDlg('Tanýmlanmýþ hiç sayaç yok !', mtError, [mbOk], 0);
    exit;
  end;

  y1 := liSayacList.itemindex + 1;
  if y1 <= 0 then begin
    MessageDlg('Lütfen önce listeden tamamlanmýþ bir sayaç seçin', mtWarning, [mbOk], 0);
    exit;
  end;
  b1 := stopwatches[y1].running;
  if b1 then begin
    MessageDlg('Bir sayacý silebilmek için önce bitmesini bekleyin veya sayacý durdurun', mtInformation, [mbOk], 0);
    exit;
  end;

  if MessageDlg(liSayacList.items[y1 - 1] + co_Enter + 'Bu sayaç silinecektir. Emin misiniz ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  s1 := stopwatches[y1].title;

  for y2 := y1 to co_maxCounter - 1 do
    stopwatches[y2] := stopwatches[y2 + 1];
  dec(stopwatchCount);
  reCreateCounterList;

  setLog(s1 + ' silindi');

  with liSayacList do
    if items.Count > 0 then begin
      itemindex := 0;
      SetFocus;
    end;
end;

procedure TfrmMain.btCounterTekrarClick(Sender: TObject);
var
  y1                     : integer;
  b1                     : boolean;
begin
  y1 := liSayacList.itemindex + 1;
  if y1 <= 0 then begin
    MessageDlg('Lütfen önce listeden tamamlanmýþ bir sayaç seçin', mtWarning, [mbOk], 0);
    exit;
  end;
  b1 := stopwatches[y1].running;
  if b1 then begin
    MessageDlg('Bu sayaç zaten çalýþýyor', mtWarning, [mbOk], 0);
    exit;
  end;

  with stopwatches[y1] do begin
    currentValue := duration * 60;
    startTime := date;
    running := true;
    reCreateCounterList;
  end;

  setLog(stopwatches[y1].title + ' tekrar baþlatýldý');

  with liSayacList do begin
    itemindex := y1 - 1;
    SetFocus;
  end;
end;

procedure TfrmMain.btCounterDurdurClick(Sender: TObject);
var
  y1                     : integer;
  b1                     : boolean;
begin
  y1 := liSayacList.itemindex + 1;
  if y1 <= 0 then begin
    MessageDlg('Lütfen önce listeden bir sayaç seçin', mtWarning, [mbOk], 0);
    exit;
  end;
  b1 := stopwatches[y1].running;
  if not b1 then begin
    MessageDlg('Bu sayaç zaten bitmiþ', mtWarning, [mbOk], 0);
    exit;
  end;

  stopwatches[y1].currentValue := 0;
  stopwatches[y1].running := false;
  setLog(stopwatches[y1].title + ' iptal edildi');
  updateCounterScreen(y1);

  with liSayacList do begin
    itemindex := y1 - 1;
    SetFocus;
  end;
end;

procedure TfrmMain.spRunningMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if frmAlarmMessage.alarmMessageCount > 0 then frmAlarmMessage.ShowModal;

end;

procedure TfrmMain.btCounterDetailClick(Sender: TObject);
var
  y1                     : integer;
  s1                     : string;
begin
  y1 := liSayacList.itemindex + 1;
  if y1 <= 0 then begin
    MessageDlg('Lütfen önce listeden tamamlanmýþ bir sayaç seçin', mtWarning, [mbOk], 0);
    exit;
  end;
  s1 := '';
  with stopwatches[y1] do
    s1 := s1 + 'Adý: ' + title + co_Enter +
      'Süre: ' + inttostr(duration) + ' dk.' + co_Enter +
      'Baþlangýç: ' + FormatDateTime(co_timeFormat, startTime);
  MessageDlg(s1, mtInformation, [mbOk], 0)
end;

procedure TfrmMain.meTitleDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var
  s1                     : string;
  y1                     : integer;
begin
  s1 := (sender as TMenuItem).Caption;
  y1 := pos('&', s1);
  if y1 > 0 then Delete(s1, y1, 1);
  with ACanvas do begin
    if selected then Brush.Color := clGreen
    else Brush.Color := clRed;
    FillRect(ARect);
    font.color := clWhite;
    DrawText(ACanvas.Handle, PChar(s1), Length(s1), ARect, DT_SINGLELINE or DT_CENTER);
//    TextOut(ARect.Left + 8, ARect.Top + 2, s1);
  end;
end;

procedure TfrmMain.Image1Click(Sender: TObject);
begin
  fd1.Execute;
  liAlarms.Font.Name := fd1.Font.Name;
  liAlarms.Font.Size := fd1.Font.Size;
  liAlarms.ItemHeight := round(fd1.Font.Size*1.7);
end;

end.

