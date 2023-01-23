{******************************************************************************}
{*    Модуль добавления параметров редактирования программы GeoEdit           *}
{*                      (p)2004-2013 Siborg Software                          *}
{******************************************************************************}

unit AddParam;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RzLabel, RzCmboBx, RzDBCmbo, RzButton, RzRadChk, DB;

type
  TAddParamDlg = class(TForm)
    Bevel1: TBevel;
    OkBtn: TRzBitBtn;
    CancelBtn: TRzBitBtn;
    RzLabel1: TRzLabel;
    ToChartCheck: TRzCheckBox;
    ParamCombo: TRzComboBox;
    procedure FormShow(Sender: TObject);
    procedure ParamComboChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddParamDlg: TAddParamDlg;

implementation

uses DataUnit, MainUnit;

{$R *.dfm}

{ Инициализация }
procedure TAddParamDlg.FormShow(Sender: TObject);
var
  ParamName, Field: String;
  Indx, Indx1, ParamGID: Integer;
  aFlag: Boolean;
begin
  with geData do
  begin
   ParamCombo.Items.Clear;
   for Indx := 0 to geQuery.FieldCount-1 do
   begin
    Field := geQuery.FieldDefs.Items[Indx].Name;
    aFlag := True;
    for Indx1 := 0 to MainForm.geGrid.Columns.Count - 1 do
     if Field = MainForm.geGrid.Columns.Items[Indx1].FieldName then aFlag := False;
    if aFlag and (Field[1]='S')  then
    begin
     Delete(Field,1,1);
     try
      ParamGID := StrToInt(Field);
      if SensorsTable.Locate('GID',ParamGID,[loCaseInsensitive]) then
       if (SensorsTable.FieldByName('MathType').AsInteger < 3) then
        ParamName := SensorsTable.FieldByName('Name').AsString
       else ParamName := ''
      else ParamName := '';
     except
      ParamName := '';
     end;
     if ParamName <> '' then ParamCombo.Items.Append(ParamName);
    end;
   end;
  end;
  ParamCombo.ItemIndex := 0;
  ParamComboChange(Self);
end;

{ Выбор параметра }
procedure TAddParamDlg.ParamComboChange(Sender: TObject);
begin
  ToChartCheck.Checked := False;
  if MainForm.DrawLineCombo.Items.Count < 8 then
   if geData.SensorsTable.Locate('Name',ParamCombo.Text ,[loCaseInsensitive]) then
    if geData.SensorsTable.FieldByName('MathType').AsInteger = 0 then
    begin
     ToChartCheck.Checked := True;
    end;
end;

end.
