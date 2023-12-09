unit untAyarlar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmAyarlar = class(TForm)
    Label1: TLabel;
    edToDoTime: TEdit;
    btSave: TButton;
    btCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAyarlar: TfrmAyarlar;

implementation

{$R *.dfm}

uses untAlarmGlobals;

procedure TfrmAyarlar.FormShow(Sender: TObject);
begin
  edToDoTime.Text := inttostr(appconfig.defToDoTime);
end;

procedure TfrmAyarlar.btCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAyarlar.btSaveClick(Sender: TObject);
begin
  appConfig.defToDoTime := strtoint(edToDoTime.Text);
  close;
end;

end.
