{******************************************************************************}
{*        Модуль диалога коррекции параметров программы GeoEdit               *}
{*                      (p)2004-2013 Siborg Software                          *}
{******************************************************************************}
unit CorrectionUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RzCmboBx, RzLabel, RzButton, Mask, RzEdit, RzBtnEdt, ClipBrd,
  RzRadChk, IniFiles;

type
  TCorrectionDlg = class(TForm)
    OkBtn: TRzBitBtn;
    CancelBtn: TRzBitBtn;
    Bevel1: TBevel;
    RzLabel1: TRzLabel;
    ParamCombo: TRzComboBox;
    RzLabel5: TRzLabel;
    StartValueEdit: TRzButtonEdit;
    PumpCheck: TRzCheckBox;
    PumpCheckValueEdit: TRzEdit;
    RzLabel2: TRzLabel;
    procedure FormShow(Sender: TObject);
    procedure StartValueEditButtonClick(Sender: TObject);
    procedure ParamComboChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CorrectionDlg: TCorrectionDlg;
  MainDir: String;

implementation

uses MainUnit, DataUnit;

{$R *.dfm}

{ Действия при создании формы }
procedure TCorrectionDlg.FormCreate(Sender: TObject);
var
  MainIni: TIniFile;
begin
  GetDir(0,MainDir);
  MainIni := TIniFile.Create(MainDir+'/GeoEdit.ini');
  PumpCheck.Checked := MainIni.ReadBool('CheckPump','Check',True);
  PumpCheckValueEdit.Text := MainIni.ReadString('CheckPump','Value','50');
  MainIni.Free;
end;

{ Действия при закрытии формы }
procedure TCorrectionDlg.FormClose(Sender: TObject; var Action: TCloseAction);
var
  MainIni: TIniFile;
begin
  MainIni := TIniFile.Create(MainDir+'/GeoEdit.ini');
  MainIni.WriteBool('CheckPump','Check',PumpCheck.Checked);
  MainIni.WriteString('CheckPump','Value',PumpCheckValueEdit.Text);
  MainIni.Free;
end;
{ Действия при визуализации формы }
procedure TCorrectionDlg.FormShow(Sender: TObject);
var
  Indx: Integer;
begin
  ParamCombo.Items.Clear;
  for Indx := 0 to 1 do
    ParamCombo.Items.Append(MainForm.geGrid.Columns.Items[Indx].Title.Caption);
  if MainForm.geGrid.SelectedIndex < 2 then ParamCombo.ItemIndex := MainForm.geGrid.SelectedIndex
                                       else ParamCombo.ItemIndex := 0;
  ParamComboChange(Self);
end;

{ Вставка значения из буфера обмена }
procedure TCorrectionDlg.StartValueEditButtonClick(Sender: TObject);
begin
  StartValueEdit.Text := '';
  StartValueEdit.Text := Clipboard.AsText;
end;

{ Выбор параметра коррекции }
procedure TCorrectionDlg.ParamComboChange(Sender: TObject);
begin
  if ParamCombo.ItemIndex = 0 then
  begin
   StartValueEdit.Text := FloatToStr(geData.geQuery.FieldByName('S101').AsFloat);
   PumpCheck.Visible := True;
   PumpCheckValueEdit.Visible := True;
   RzLabel2.Visible  := True;
  end
  else
  begin
   StartValueEdit.Text := FloatToStr(geData.geQuery.FieldByName('S102').AsFloat);
   PumpCheck.Visible := False;
   PumpCheckValueEdit.Visible := False;
   RzLabel2.Visible  := False;
  end;
end;


end.
