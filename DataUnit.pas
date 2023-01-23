{******************************************************************************}
{*                     Модуль данных программы GeoEdit                        *}
{*                      (p)2004-2014 Siborg Software                          *}
{******************************************************************************}

unit DataUnit;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TgeData = class(TDataModule)
    SensorsTable: TTable;
    SensorsDataSource: TDataSource;
    geQuery: TQuery;
    geDataSource: TDataSource;
    geTable: TTable;
    ToolsTable: TTable;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure geTableAfterScroll(DataSet: TDataSet);
    procedure geTableBeforeScroll(DataSet: TDataSet);
    procedure geTableAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    function CalcDateTime(DbTime : Integer; DbDate : TDateTime) : TDateTime;
  public
    { Public declarations }
  end;

var
  geData: TgeData;
  MainDir: String;

implementation

uses MainUnit, ParamsUnit;

{$R *.dfm}

{ Действия при старте программы }
procedure TgeData.DataModuleCreate(Sender: TObject);
begin
  GetDir(0,MainDir);
  SensorsTable.DatabaseName := MainDir + '\bin\';
  SensorsTable.TableName := 'Sensors.db';
  SensorsTable.Open;
end;

{ Действия при выходе их программы }
procedure TgeData.DataModuleDestroy(Sender: TObject);
begin
  if SensorsTable.Active then SensorsTable.Close;
  if geQuery.Active then geQuery.Close;
  if geTable.Active then geTable.Close;
end;

{ Действия при скроллинге таблицы }
procedure TgeData.geTableAfterScroll(DataSet: TDataSet);
var
  gsTime: Integer;
  gsDate, geDateTime: TDateTime;
begin
  if geTable.RecNo < 0 then geTable.Last;
  with MainForm do
  begin
   if not ToolsTable.Active then geGridScroll; { Прокручиваем график, если неактивна таблица ToolsTable }
   gsTime := geTable.FieldByName('Time').AsInteger;
   gsDate := geTable.FieldByName('Date').AsDateTime;
   geDateTime := CalcDateTime(gsTime,gsDate);
   CursorPosPane.Caption := 'Дата: '+DateToStr(geDateTime)+'  Время: '+TimeToStr(geDateTime);
  end;
end;

procedure TgeData.geTableAfterPost(DataSet: TDataSet);
begin
  MainForm.ChartReloadExecute(self);
end;

{ Действия перед скроллингом таблицы }
procedure TgeData.geTableBeforeScroll(DataSet: TDataSet);
begin
  MainForm.SaveChanges;
end;

{ Функция конвертации даты/времени }
function TgeData.CalcDateTime(DbTime : Integer; DbDate : TDateTime) : TDateTime;
var
  Time, Hour, Minute, Secunde : Integer;
  S_Hour, S_Minute, S_Secunde, S_Time : String;
begin
  Time := DbTime;
  if Time <> 0 then
  begin
    Time := Time div 1000;
    Minute := Time div 60;
    Hour := Minute div 60;
    Minute := Minute-60*Hour;
    Secunde := Time -3600*Hour-60*Minute;
    if Hour = 0 then S_Hour := '00';
    if Hour <10 then S_Hour := '0'+IntToStr(Hour)
      else S_Hour := IntToStr(Hour);
    if Minute = 0 then S_Minute := '00';
    if Minute <10 then S_Minute := '0'+IntToStr(Minute)
      else S_Minute := IntToStr(Minute);
    if Secunde = 0 then S_Secunde := '00';
    if Secunde <10 then S_Secunde := '0'+IntToStr(Secunde)
      else S_Secunde := IntToStr(Secunde);
    S_Time := S_Hour+':'+S_Minute+':'+S_Secunde;
  end
  else S_Time := '00:00:00';
  Result := StrToDateTime(DateToStr(DbDate)+' '+S_Time);
end;

end.
