unit untToDoDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, untAlarmGlobals, yupack, ExtCtrls;

type
  TfrmToDoDetails = class(TForm)
    me1: TMemo;
    btSave: TYusoftGradientButton;
    btCancel: TYusoftGradientButton;
    lbLineCount: TLabel;
    imHelp: TImage;
    procedure me1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure me1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure imHelpClick(Sender: TObject);
  private
procedure calcLineCount;
  public
    veri: ToDoStructure;
    cevap: boolean;
    totalLineCount : integer;
    procedure saveToDoDetails;

  end;

var
  frmToDoDetails         : TfrmToDoDetails;

implementation

{$R *.dfm}

procedure TfrmToDoDetails.me1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  y1                     : integer;
  s1                     : string;
  charPressed            : boolean;
begin
  y1 := SendMessage(me1.Handle, EM_LINEFROMCHAR, me1.Selstart, 0);
  s1 := me1.Lines[y1];
  charPressed := (key in [48..127]);
  if (length(s1) >= co_ToDoMaxCharPerLine) and charPressed then
    me1.lines[y1] := me1.lines[y1] + co_Enter;
end;

procedure TfrmToDoDetails.FormShow(Sender: TObject);
var
  y1                     : integer;
  s1                     : string;
begin
  cevap := false;
  me1.Lines.Clear;
  for y1 := 1 to veri.detailLineCount do begin
    s1 := trim(veri.detail[y1]);
    me1.lines.add(s1);
  end;
  me1.SelStart := 0;
  me1.Modified := False;
  calcLineCount;
end;

procedure TfrmToDoDetails.saveToDoDetails;
var
  y1                     : integer;
  s1                     : string;
begin
  for y1 := 0 to me1.Lines.Count do begin
    s1 := me1.lines[y1];
    veri.detail[y1 + 1] := s1;
  end;
  veri.detailLineCount := me1.Lines.Count;
  me1.Modified := False;
  cevap := true;
end;

procedure TfrmToDoDetails.btSaveClick(Sender: TObject);
begin
  saveToDoDetails;
  close;
end;

procedure TfrmToDoDetails.btCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmToDoDetails.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if me1.Modified then begin
      if MessageDlg('Ýçerik deðiþtirildi. Kaydedeyim mi?',
        mtWarning, [mbYes, mbNo], 0) = mrYes then saveToDoDetails;
    end;

    close;
  end;
end;

procedure TfrmToDoDetails.calcLineCount;
begin
 totalLineCount := me1.lines.Count;
end;

procedure TfrmToDoDetails.me1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
calcLineCount;
  lbLineCount.Caption := IntToStr(totalLineCount);
end;

procedure TfrmToDoDetails.imHelpClick(Sender: TObject);
begin
MessageDlg('Maddeler halinde yazýlarak program tarafýndan takip edilmesi istenilen satýrlarýn baþýna tire iþareti konulmalýdýr.', mtInformation, [mbOk],0)
end;

end.

