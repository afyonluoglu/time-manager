program prjAlarmManager;

uses
  Forms,
  untMain in 'untMain.pas' {frmMain},
  untAlarmMessage in 'untAlarmMessage.pas' {frmAlarmMessage},
  untAlarmDetails in 'untAlarmDetails.pas' {frmAlarmDetails},
  untAlarmGlobals in 'untAlarmGlobals.pas',
  untToDoDetails in 'untToDoDetails.pas' {frmToDoDetails},
  untStats in 'untStats.pas' {frmStats},
  untStatGridDetail in 'untStatGridDetail.pas' {frmStatGridDetail},
  untMyInputBox in 'untMyInputBox.pas' {frmMyInputBox},
  untUpdateAlarm in 'untUpdateAlarm.pas' {frmUpdateAlarm},
  untUpdateStatDetail in 'untUpdateStatDetail.pas' {frmUpdateStatDetail},
  untAyarlar in 'untAyarlar.pas' {frmAyarlar};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'DMAG Time Manager';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmAlarmMessage, frmAlarmMessage);
  Application.CreateForm(TfrmAlarmDetails, frmAlarmDetails);
  Application.CreateForm(TfrmToDoDetails, frmToDoDetails);
  Application.CreateForm(TfrmAyarlar, frmAyarlar);
  //   Application.CreateForm(TfrmStatGridDetail, frmStatGridDetail);
  //  Application.CreateForm(TfrmStats, frmStats);
  Application.Run;
end.
