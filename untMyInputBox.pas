unit untMyInputBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfrmMyInputBox = class(TForm)
    cbBilgi: TComboBox;
    lbBilgi: TLabel;
    Panel1: TPanel;
    btTamam: TButton;
    btVazgec: TButton;
    Bevel1: TBevel;
    procedure btTamamClick(Sender: TObject);
    procedure btVazgecClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    onay: bool;
  end;

function MyInputBox(title: string; info: string; defItems: TStrings; var sonuc: string): boolean;

implementation

{$R *.dfm}


function MyInputBox(title: string; info: string; defItems: TStrings; var sonuc: string): boolean;
var
  frmMyInputBox          : TfrmMyInputBox;
begin
  frmMyInputBox := TfrmMyInputBox.Create(Application);
  with frmMyInputBox do begin
    caption := title;
    lbBilgi.caption := info;
    if defItems.Count > 0 then cbBilgi.Items := defItems;
    showmodal;
    if onay then sonuc := cbBilgi.Text;
    result := onay;
    release;
  end;
end;

procedure TfrmMyInputBox.btTamamClick(Sender: TObject);
begin
  onay := true;
  close;
end;

procedure TfrmMyInputBox.btVazgecClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMyInputBox.FormShow(Sender: TObject);
begin
  onay := false;
end;

procedure TfrmMyInputBox.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    if trim(cbBilgi.Text) <> '' then btTamamClick(sender);
end;

end.

