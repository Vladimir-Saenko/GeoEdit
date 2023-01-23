unit SaveSetParamUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RzLabel, Mask, RzEdit, RzButton, RzCmboBx, FileCtrl,
  RzFilSys;

type
  TSaveSetParamDlg = class(TForm)
    OkBtn: TRzBitBtn;
    CancelBtn: TRzBitBtn;
    Bevel1: TBevel;
    RzLabel1: TRzLabel;
    SetParamsNameCombo: TRzComboBox;
    SetParamsListBox: TRzFileListBox;
    procedure FormShow(Sender: TObject);
    procedure SetParamsNameComboChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SaveSetParamDlg: TSaveSetParamDlg;

implementation

uses MainUnit;

{$R *.dfm}

{ Действия при визуализации формы }
procedure TSaveSetParamDlg.FormShow(Sender: TObject);
var
  Indx: Integer;
  aStr: String;
begin
  SetParamsNameCombo.Items.Clear;
  SetParamsNameCombo.Items := SetParamsListBox.Items;
  for Indx := 0 to SetParamsNameCombo.Items.Count - 1 do
  begin
   aStr := SetParamsNameCombo.Items.Strings[Indx];
   Delete(aStr,Length(aStr)-3,4);
   SetParamsNameCombo.Items.Strings[Indx] := aStr;
  end;
  SetParamsNameCombo.ItemIndex := 0;
end;

{ Контроль ввода имени набора }
procedure TSaveSetParamDlg.SetParamsNameComboChange(Sender: TObject);
begin
  if SetParamsNameCombo.Text <> '' then OkBtn.Enabled := True else OkBtn.Enabled := False;
end;

end.
