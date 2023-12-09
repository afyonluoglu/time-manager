unit untAlarmGlobals;

interface

uses Graphics;

const
  filenameLog            = 'DMAG_Alarm_Log.txt';
  filenameAlarms         = 'DMAG_Alarms.dat';
  filenameAlarmNames     = 'DMAG_Alarm_Names.dat';
  filenameToDoLists      = 'DMAG_ToDo.dat';
  filenameStatistics     = 'DMAG_Alarm_Stats.dat';
  filenameConfig         = 'DMAG_Config.dat';
  filenameAlarmSummary   = 'DMAG_Alarm_Summary.dat';

  asStarted              = 0;
  asWaitingForResponse   = 1;
  asFired                = 2;
  asNotRunToday          = 3;
  asNotDoneToday         = 4;

  atDuration             = 0;
  atPomodoro             = 1;
  atConstantTime         = 2;
  atToDo                 = 3;

  atNameArray            : array[1..4] of string = ('Süreli Alarm', 'Pomodoro', 'Belli Sürede', 'Ýþler');

  poModeRun              = 0;
  poModeBreak            = 1;

  co_Pomodoro            = 'Pomodoro';
  co_defStopwatchInfo    = 'Ýlerleyen Sayaç';

  co_hourMinuteFormat    = 'hh:nn';
  co_timeFormat          = 'hh:nn:ss';
  co_dateFormat          = 'dd/mm/yyyy';

  co_draw_seperator      = '@';
  co_stopwatchStartStr   = '00:00:00';
  co_Enter               = #$D + #$A;

  //renkler
  co_ColorConstantTime   = $006CFFFF;
  co_ColorToDo           = $00FF88C4;
  co_ColorPomodoro       = $00FFFF75;
  co_ColorDuration       = $008A8AFF;

  co_ColorStarted        = clYellow;
  co_ColorWaitingForResponse = $000080FF;
  co_ColorFired          = clLime;
  co_ColorNotRunToday    = clGray;
  co_ColorNotDoneToday   = clBlack;

  co_ColorLightAqua      = $00FFFF75;

  co_ColorGridBrownLight = $00E1F0FF;
  co_ColorGridBrownDark  = $00547EA9;

  co_maxDailyAlarmType   = 50;

  co_ToDoMaxCharPerLine  = 100;
  co_ToDoMaxLines        = 50;
  co_ToDoMaxRecord       = 50;
  co_maxCounter        = 50;

//  co_defultToDoTime      = 15;
  co_AutoSaveAlarms      = true;

  ayUzunluk              : array[1..12] of byte = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

type
  alarmStatusType = byte;
  alarmTypeStructure = byte;

  ConfigStructure = record
    lastLoginDate: TDateTime;
    defToDoTime: integer;
  end;

  alarmStructure = record
    name: string[40];
    duration: byte;
    alarmType: alarmTypeStructure;
    alarmStart: TDateTime;
    alarmEnd: TDateTime;
    alarmEndStr: string[10];
    status: alarmStatusType;
    param1, param2: byte;     // integer olmalý, adým sayýlarý yeterli girilemiyor
                              // string parametreler olabilmeli - uzunluk 75
    mode: byte;
  end;

  completedAlarmsStatsStructure = record
    alarmDate: TDateTime;
    name: string[40];
    alarmType: alarmTypeStructure;
    alarmStart: TDateTime;
    alarmEnd: TDateTime;
    parameters: array[1..5] of integer;
    paramsStr: array[1..5] of string[75];
  end;

  ToDoDetailsMemo = array[1..co_ToDoMaxLines] of string[co_ToDoMaxCharPerLine];

  ToDoStructure = record
    ID: integer;
    name: string[100];
    checked: boolean;
    detail: ToDoDetailsMemo;
    detailLineCount: byte;
  end;

  alarmSummaryStructure = record
    alarmDate: TDateTime;
    name: string[40];
    duration: byte;
    alarmType: alarmTypeStructure;
    status: alarmStatusType;
    param1, param2: byte;
    mode: byte;
  end;

  counterStructure = record
    id: byte;
    running: boolean;
    title: string[50];
    duration: integer;
    startTime: TDateTime;
    currentValue: integer;
  end;

var
  appConfig              : ConfigStructure;
  fConfig                : file of ConfigStructure;
  fAlarmSummary          : file of alarmSummaryStructure;

function _complete(q: string; uz, dir: integer; _Fill: string): string;
function GetMyData(var s1: string): string; overload;
function GetMyData(var s1: string; _sep: string): string; overload;
function intToTime(x: integer; showSeconds: boolean): string;

implementation

uses SysUtils;

function intToTime(x: integer; showSeconds: boolean): string;
var
  y1, y2, y3, y4         : integer;
  s1                     : string;
begin
  y1 := x mod 60; // mod: reminder
  y2 := trunc(x / 60);

  y3 := (y2 mod 60);
  y4 := trunc(y2 / 60);

  s1 := _complete(inttostr(y4), 2, 0, '0') + ':' +
    _complete(inttostr(y3), 2, 0, '0');
  if showSeconds then s1 := s1 + ':' + _complete(inttostr(y1), 2, 0, '0');
  result := s1;
end;

function _complete(q: string; uz, dir: integer; _Fill: string): string;
var
  y                      : integer;
  x                      : string;
begin
  x := q;
  if length(x) <= uz then begin
    case dir of
      0: for y := length(q) to uz - 1 do x := _Fill + x; { LEFT }
      1: for y := length(q) to uz - 1 do x := x + _Fill; { RIGHT  }
      2: while length(x) < uz do x := ' ' + x + _Fill; // Center
    end;
  end else begin
    if dir = 1 then begin
      x := copy(x, 1, uz - 1);
      x := x + '~';
    end else begin
      Delete(x, 1, Length(x) - uz + 1);
      x := '~' + x;
    end;
  end;
  result := copy(x, 1, uz);
end;

function GetAyracData(_Ayrac: string; var s1: string): string;
var
  y1                     : integer;
begin
  y1 := pos(_ayrac, s1);
  if y1 <= 0 then y1 := length(s1) + 1;
  result := copy(s1, 1, y1 - 1);
  Delete(s1, 1, y1);
end;

function GetMyData(var s1: string): string; overload;
begin
  Result := GetAyracData(co_draw_seperator, s1);
end;

function GetMyData(var s1: string; _sep: string): string; overload;
begin
  Result := GetAyracData(_Sep, s1);
end;

end.

