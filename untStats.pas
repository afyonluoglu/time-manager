unit untStats;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, untAlarmGlobals, TeEngine, TeeFunci, Series, ExtCtrls,
  TeeProcs, Chart, ComCtrls, Grids;

type
  TfrmStats = class(TForm)
    li1: TListBox;
    Panel1: TPanel;
    pc1: TPageControl;
    TabSheet1: TTabSheet;
    sgAy: TStringGrid;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    series1: TBarSeries;
    TeeFunction1: TAverageTeeFunction;
    Label1: TLabel;
    cbMonth: TComboBox;
    cbYear: TComboBox;
    imHelp: TImage;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    sgGunsonu: TStringGrid;
    liGunSonu: TListBox;
    Panel3: TPanel;
    procedure cbMonthChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure li1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sgAySelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgAyDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgAyDblClick(Sender: TObject);
    procedure sgAyKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imHelpClick(Sender: TObject);
    procedure sgGunsonuDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure liGunSonuClick(Sender: TObject);
  private
    buGun: TDateTime;
    thisMonthDayCount: byte;
    procedure showDayDetails;
  public
    dataCount, selectedGridCol, selectedGridRow: integer;
    procedure readStats(ay: integer);
    procedure readGunSonuDayList(ay: integer);
    procedure readGunSonuDetay;
  end;

  summary2Structure = record
    dataExist: bool;
    date: TDateTime;
    dayDataCount: byte;
    dayData: array[1..co_maxDailyAlarmType] of alarmSummaryStructure; // Bir günde en fazla 50 ÇEÞÝT alarm olabilir
  end;

implementation

uses untStatGridDetail;

{$R *.dfm}

var
  summary2               : array[1..31] of summary2Structure;

type
  statDataStructure = record
    name: string[40];
    alarmCountperDay: array[1..31] of integer;
  end;


procedure TfrmStats.readStats(ay: integer);
var
  veri                   : completedAlarmsStatsStructure;
  statDataCount          : integer;
  statData               : array of statDataStructure;

  function statIndex(alarmName: string): integer;
  var
    y1                   : integer;
  begin
    for y1 := 0 to statDataCount do begin
      try
        if statData[y1].name = alarmName then begin
          result := y1;
          exit;
        end;
      except
        MessageDlg('y1=' + inttostr(y1) + ', statData[y1].name = ' + statData[y1].name, mtInformation, [mbOk], 0)
      end;
    end;
    result := -1;

  end;

  procedure insertNewAlarmDataStat(yer: integer; alarmName: string);
  var
    y1                   : integer;
  begin
    statData[yer].name := alarmName;
    for y1 := 1 to 31 do statData[yer].alarmCountperDay[y1] := 0;
  end;

  procedure createMonthGridRowNames;
  var
    y1                   : integer;
  begin
    sgAy.RowCount := statDataCount + 2;
    for y1 := 1 to statDataCount do
      sgAy.Cells[0, y1] := statData[y1 - 1].name;
    sgAy.Cells[0, statDataCount + 1] := 'TOPLAM:';
    for y1 := 1 to thisMonthDayCount do sgAy.cells[y1, 0] := inttostr(y1);
  end;

  function monthGridRow(s1: string): integer;
  var
    y1                   : integer;
  begin
    for y1 := 0 to statDataCount do
      if statData[y1].name = s1 then begin
        result := y1;
        exit;
      end;
  end;

  procedure calculateMonthGridTotals;
  var
    y1, y2, total        : integer;
  begin
    for y1 := 1 to thisMonthDayCount do begin
      total := 0;
      for y2 := 1 to statDataCount do
        total := total + StrToIntDef(sgAy.cells[y1, y2], 0);
      sgAy.cells[y1, statDataCount + 1] := inttostr(total);
    end;
  end;

var
  f                      : file of completedAlarmsStatsStructure;
  yer, y1, y2, gun, toplamAlarm, dailyWorkCount: integer;
  deger, veriYear        : string;
begin
  dataCount := 0;
  statDataCount := 0;
  li1.items.clear;

//  SetLength(statData, statDataCount + 1);

  SetLength(statData, 51);

  AssignFile(f, filenameStatistics);
{$I-}Reset(f); {$I+}
  if IOResult <> 0 then begin
    MessageDlg('Hiç veri bulunamadý', mtError, [mbOk], 0);
    exit;
  end;

  li1.Items.BeginUpdate;

  try
    while not Eof(f) do begin
      read(f, veri);
      y1 := strtoint(FormatDateTime('m', veri.alarmDate));
      veriYear := FormatDateTime('yyyy', veri.alarmDate);

      if (y1 = ay) and (veriYear = cbYear.Text) and (veri.name <> '') then begin
        yer := statIndex(veri.name);
        if yer = -1 then begin
          inc(statDataCount);

  //        SetLength(statData, statDataCount);

          yer := statDataCount - 1;
          insertNewAlarmDataStat(yer, veri.name);
        end;
        gun := strtoint(FormatDateTime('dd', veri.alarmDate));
        inc(statData[yer].alarmCountperDay[gun]);
      end;

      inc(dataCount);
    end;
  finally
    CloseFile(f);
  end;

  caption := 'Ýstatistikler (' + inttostr(dataCount) + ' kayýt)';
  createMonthGridRowNames;
  Series1.Clear;
  for y1 := 1 to thisMonthDayCount do begin
    toplamAlarm := 0;
    for yer := 0 to statDataCount - 1 do
      toplamAlarm := toplamAlarm + statData[yer].alarmCountperDay[y1];
    dailyWorkCount := 0;
    if toplamAlarm > 0 then begin
      li1.items.add(co_draw_seperator + inttostr(y1) + '.' + inttostr(ay) + '.' + cbYear.Text);
      for yer := 0 to statDataCount - 1 do begin
        y2 := statData[yer].alarmCountperDay[y1];
        if y2 > 0 then begin
          deger := inttostr(y2);
          li1.items.add(statData[yer].name + co_draw_seperator + deger);
          inc(dailyWorkCount);
          sgAy.Cells[y1, monthGridRow(statData[yer].name) + 1] := deger;
        end;
      end;
    end;
    series1.add(dailyWorkCount, inttostr(y1), clred);
  end;

  li1.Items.EndUpdate;

  calculateMonthGridTotals;
end;

procedure TfrmStats.cbMonthChange(Sender: TObject);
var
  y1, y2                 : integer;
begin
  thisMonthDayCount := ayUzunluk[cbMonth.ItemIndex + 1];
  sgAy.ColCount := thisMonthDayCount + 1;
  // clear month-grid
  for y1 := 1 to thisMonthDayCount do
    for y2 := 1 to sgAy.RowCount do sgAy.cells[y1, y2] := '';
  // clear detail-grid
  for y1 := 0 to sgGunsonu.ColCount do
    for y2 := 0 to sgGunsonu.RowCount do sgGunsonu.cells[y1, y2] := '';

  readStats(cbMonth.ItemIndex + 1);
  readGunSonuDayList(cbMonth.ItemIndex + 1); ;
end;

procedure TfrmStats.readGunSonuDayList(ay: integer);
var
  y1, veri_ay, veri_gun, prev_veri_gun: integer;
  veri                   : alarmSummaryStructure;
begin
  liGunSonu.items.clear;
  for y1 := 1 to 31 do begin
    summary2[y1].dataExist := false;
    summary2[y1].dayDataCount := 0;
  end;

  AssignFile(fAlarmSummary, filenameAlarmSummary);
{$I-}reset(fAlarmSummary); {$I+}
  if IOResult <> 0 then exit;

  y1 := filesize(fAlarmSummary);
  try
    while not Eof(fAlarmSummary) do begin
      read(fAlarmSummary, veri);
      veri_gun := strtoint(FormatDateTime('d', veri.alarmDate));
      veri_ay := strtoint(FormatDateTime('m', veri.alarmDate));
      if (veri_ay = ay) then begin

        with summary2[veri_gun] do begin
          date := veri.alarmDate;
          dataExist := true;
          inc(dayDataCount);
          dayData[dayDataCount] := veri;
        end;
      end;
    end;
  finally
    CloseFile(fAlarmSummary);
  end;

  for y1 := 1 to 31 do
    if summary2[y1].dataExist then
      liGunSonu.items.add(FormatDateTime(co_dateFormat, summary2[y1].date));

  if liGunSonu.Items.Count > 0 then begin
    liGunSonu.ItemIndex := liGunSonu.items.count - 1;
    sgGunsonu.Visible := true;
    readGunSonuDetay;
  end else begin
    sgGunsonu.Visible := false;
  end;
end;

procedure TfrmStats.readGunSonuDetay;
var
  y1, selected_day, satir: integer;
  s1                     : string;
  d1                     : TDateTime;
  veri                   : alarmSummaryStructure;
begin
  y1 := liGunSonu.itemindex;
  if y1 < 0 then exit;
  s1 := liGunSonu.items[y1];
  d1 := strtodate(s1);
  selected_day := strtoint(formatdatetime('d', d1));
  sgGunsonu.RowCount := summary2[selected_day].daydatacount;

  for y1 := 1 to summary2[selected_day].dayDataCount do begin
    sgGunsonu.RowHeights[y1 - 1] := 18;
    sgGunsonu.Cells[0, y1 - 1] := inttostr(summary2[selected_day].dayData[y1].alarmType);
    sgGunsonu.Cells[1, y1 - 1] := summary2[selected_day].dayData[y1].name;
    sgGunsonu.Cells[2, y1 - 1] := inttostr(summary2[selected_day].dayData[y1].status);
  end;
end;

procedure TfrmStats.FormShow(Sender: TObject);
var
  y1                     : integer;
begin
  buGun := date;
  pc1.ActivePageIndex := 0;
  sgGunsonu.ColWidths[0] := 20;
  sgGunsonu.ColWidths[1] := 210;
  sgGunsonu.ColWidths[2] := 20;

  sgAy.ColWidths[0] := 160;
  cbMonth.ItemIndex := strtoint(FormatDateTime('m', buGun)) - 1;
  cbYear.Text := FormatDateTime('yyyy', buGun);
  cbMonthChange(sender);
  if li1.items.count > 0 then begin
    li1.ItemIndex := li1.items.Count - 1;
    li1.SetFocus;
  end;
  sgAy.SetFocus;
end;

procedure TfrmStats.li1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  r1                     : TRect;
  s1, s2                 : string;
begin
  with (Control as TListBox), Canvas do begin
    r1 := rect;
    s1 := items[index];
    if s1[1] = co_draw_seperator then begin // Tarih Baþlýk Satýrý
      GetMyData(s1);
      if odSelected in state then begin
        brush.color := $006CC0FF;
        font.color := clBlack;
      end else begin
        Brush.Color := $006CFFFF;
        font.color := clRed;
      end;
      FillRect(r1);

      font.Style := [fsBold];
      TextOut(r1.Left + 10, r1.Top, s1);
    end else begin
      if odSelected in state then brush.color := clBlack;
      r1.Right := 210;
      FillRect(r1);
      s2 := GetMyData(s1);
      TextOut(r1.Left + 2, r1.Top, s2);
      if not (odSelected in state) then Brush.Color := co_ColorLightAqua;
      r1.Left := r1.Right;
      r1.Right := rect.right;
      FillRect(r1);
      DrawText(Canvas.Handle, PChar(s1), Length(s1), r1, DT_SINGLELINE or DT_CENTER);
    end;
  end;
end;

procedure TfrmStats.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure TfrmStats.sgAySelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if (selectedGridCol = ACol) and (selectedGridRow = ARow) then exit;
  if ARow = sgAy.RowCount - 1 then begin
    CanSelect := false;
    exit;
  end;
  selectedGridRow := ARow;
  selectedGridCol := ACol;
  sgAy.Repaint;
  caption := inttostr(ACol) + ' ' + cbMonth.Text + ' ' + cbYear.text + ' : ' + sgAy.Cells[0, ARow] + ' = ' + sgAy.cells[ACol, ARow] + ' adet';
end;

procedure TfrmStats.sgAyDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);


  function findEndofDayState(_day: integer; _title: string): integer;
  var
    y1                   : integer;
  begin
    with summary2[_day] do begin
      if not dataExist then begin
        result := -1;
        exit;
      end;
      for y1 := 1 to dayDataCount do
        if dayData[y1].name = _title then begin
          result := dayData[y1].status;
          exit;
        end;
    end;
    result := -1;
  end;

var
  c1                     : TColor;
  s1                     : string;
  d1                     : TDate;
  alarmState             : integer;
begin
  if (ARow = 0) then exit;
  with (sender as TStringGrid), Canvas do begin
    if ACol = 0 then begin
      if ARow = selectedGridRow then begin
        Brush.Color := clNavy;
        FillRect(rect);
        font.color := clWhite;
        TextOut(rect.Left + 2, rect.Top + 2, sgAy.cells[0, ARow]);
      end;
      exit;
    end;

    font.Style := [fsBold];

    s1 := sgAy.Cells[ACol, ARow];
    d1 := StrToDateDef(Cells[ACol, 0] + '.' + inttostr(cbMonth.itemindex + 1) + '.' + cbYear.Text, buGun);
    if (ACol > 0) and (ARow < sgAy.RowCount - 1) then begin
      if d1 = buGun then
        if strtointDef(s1, 0) > 0 then c1 := clLime else c1 := $00A4A4FF;
    end;

    if d1 = buGun then begin
      c1 := $00D5FFD5;
    end else if d1 > buGun then begin
      if ACol mod 2 = 0 then c1 := co_ColorGridBrownDark else c1 := clGray;
    end else if (sgAy.cells[0, ARow] = co_Pomodoro) and (s1 <> '') then begin
      c1 := $00FFE4B9;
    end else begin
    // Statü renkleri
      if ARow = sgAy.RowCount then alarmState := -1 else
        alarmState := findEndofDayState(strtoint(sgAy.cells[ACol, 0]), sgAy.cells[0, ARow]);
      if alarmState >= 0 then begin
        case alarmState of
          asStarted: c1 := co_ColorStarted;
          asWaitingForResponse: c1 := co_ColorWaitingForResponse;
          asFired: c1 := co_ColorFired;
          asNotRunToday: c1 := co_ColorNotRunToday;
          asNotDoneToday: begin font.color:= clWhite; c1 := co_ColorNotDoneToday; end;
        end;
      end else begin
        if ACol mod 2 = 0 then c1 := co_ColorGridBrownLight else c1 := clWhite;
      end;
    end;

    // Toplam Satýrý
    if ARow = (sgAy.RowCount - 1) then begin
      c1 := clNavy;
      font.color := clWhite;
    end;

    //Seçilen kutular
    if (gdSelected in state) and (ARow <> sgAy.RowCount - 1) then begin
      if d1 = buGun then begin
      //Bu gün Sütununda seçilen yer
        c1 := clNavy;
        font.color := clWhite;
      end else begin
      // selected cell
        c1 := clred;
        font.Color := clWhite;
      end;
    end;
    Brush.Color := c1;
    FillRect(rect);

    if (s1 = '') and ((alarmState = asWaitingForResponse) or (alarmState = co_ColorNotDoneToday)) then begin
      Canvas.Pen.Style := psSolid;
      Canvas.Pen.Color := clSilver; // co_ColorStarted;
      Canvas.Pen.Width := 3;
      Canvas.MoveTo(rect.Left, rect.Bottom - 2);
      Canvas.LineTo(rect.right, rect.top + 2);
    end;

    rect.Top := rect.top + 3;
    DrawText(Canvas.Handle, PChar(s1), Length(s1), rect, DT_SINGLELINE or DT_CENTER);
  end;
end;

procedure TfrmStats.showDayDetails;
var
  d1                     : TDateTime;
  frmDetay               : TfrmStatGridDetail;
begin
  if (selectedGridCol <= 0) or (selectedGridRow = sgAy.RowCount - 1) then exit;
  // Birden fazla hücre seçilmiþ ise çýk
  if (sgAy.Selection.TopLeft.X <> sgAy.Selection.BottomRight.X)
    and
    (sgAy.Selection.TopLeft.Y <> sgAy.Selection.BottomRight.Y)
    then exit;
  // Eðer deðer yoksa çýk
  if sgAy.cells[selectedGridCol, selectedGridRow] = '' then exit;

  d1 := strtodate(sgAy.Cells[selectedGridCol, 0] + '.' + inttostr(cbMonth.itemindex + 1) + '.' + cbYear.text);
  frmDetay := TfrmStatGridDetail.Create(Application);
  with frmDetay do begin
    detailDate := d1;
    detailAlarmName := sgAy.Cells[0, selectedGridRow];
    ShowModal;
    if logDeleted then readStats(cbMonth.ItemIndex + 1);
    free;
  end;
end;

procedure TfrmStats.sgAyDblClick(Sender: TObject);
begin
  showDayDetails;
end;

procedure TfrmStats.sgAyKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then showDayDetails;
end;

procedure TfrmStats.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F2 then
    if cbMonth.ItemIndex > 0 then begin
      cbMonth.ItemIndex := cbMonth.ItemIndex - 1;
      cbMonthChange(sender);
      exit;
    end;

  if key = VK_F3 then
    if cbMonth.ItemIndex < cbMonth.items.count then begin
      cbMonth.ItemIndex := cbMonth.ItemIndex + 1;
      cbMonthChange(sender);
      exit;
    end;
end;

procedure TfrmStats.imHelpClick(Sender: TObject);
begin
  MessageDlg(
    'F2: Önceki Ay' + co_Enter +
    'F3: Sonraki Ay' + co_Enter +
    'ENTER: Detaylar',
    mtInformation, [mbOk], 0)
end;

procedure TfrmStats.sgGunsonuDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s1                     : string;
  y1                     : integer;
  c1                     : TColor;
begin
  with (sender as TStringGrid), Canvas do begin
    s1 := sgGunsonu.Cells[ACol, ARow];
    y1 := StrToIntDef(s1, -1);

    c1 := clwhite;
    if ACol = 0 then
      case y1 of
        atConstantTime: c1 := co_ColorConstantTime;
        atToDo: c1 := co_ColorToDo;
        atPomodoro: c1 := co_ColorPomodoro;
        atDuration: c1 := co_ColorDuration;
      end;

    if ACol = 2 then
      case y1 of
        asStarted: c1 := co_ColorStarted;
        asWaitingForResponse: c1 := co_ColorWaitingForResponse;
        asFired: c1 := co_ColorFired;
        asNotRunToday: c1 := co_ColorNotRunToday;
        asNotDoneToday: c1 := clGray;
      end;

    if (ACol = 1) and (gdSelected in state) then c1 := clNavy;

    Brush.Color := c1;
    FillRect(rect);

    if ACol = 1 then begin
      if (gdSelected in state) then font.color := clWhite else font.color := clBlack;
      TextOut(rect.Left + 2, rect.Top + 2, s1);
    end;
  end;
end;

procedure TfrmStats.liGunSonuClick(Sender: TObject);
begin
  readGunSonuDetay;
end;

end.

