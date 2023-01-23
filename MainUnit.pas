{******************************************************************************}
{*                  Основной модуль программы GeoEdit                         *}
{*                           версия 2.5                                       *}
{*    Автор: Владимир'siborg'Саенко            (p)2004-2022 Siborg Software   *}
{******************************************************************************}

unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzStatus, RzPanel, XPStyleActnCtrls, ActnList, ActnMan, ToolWin,
  ActnCtrls, ActnMenus, ExtCtrls, RzSplit, RzButton, ImgList, DB, Grids,
  DBGrids, DBTables, TeeProcs, TeEngine, Chart, Series, IniFiles, StdCtrls,
  RzCmboBx, RzDBGrid, RzLabel, RzBorder, ClipBrd, Registry;

type
  TMainForm = class(TForm)
    ChartPanel: TRzSizePanel;
    MainActionsMenu: TActionMainMenuBar;
    MainActions: TActionManager;
    MainStatusBar: TRzStatusBar;
    OperationPane: TRzStatusPane;
    GridPanel: TRzPanel;
    FileOpen: TAction;
    MainImages: TImageList;
    FileOpenDlg: TOpenDialog;
    MainActionsTools: TRzToolbar;
    FileOpenBtn: TRzToolButton;
    FileExit: TAction;
    geChart: TChart;
    Series3: THorizLineSeries;
    FileOpened: TAction;
    FileClosed: TAction;
    OperationProgressPane: TRzProgressStatus;
    ChartVerticalAxis: TAction;
    ChartTools: TRzToolbar;
    DrawBtn: TRzToolButton;
    ChartHeaderBtn: TRzToolButton;
    RzSpacer1: TRzSpacer;
    DrawLineCombo: TRzComboBox;
    ChartCancelBtn: TRzToolButton;
    RzSpacer2: TRzSpacer;
    FileParams: TAction;
    geGrid: TRzDBGrid;
    Series4: THorizLineSeries;
    Series5: THorizLineSeries;
    Series6: THorizLineSeries;
    Series7: THorizLineSeries;
    ChartHeader: TAction;
    FileAddParam: TAction;
    FileRemoveParam: TAction;
    FileDefaultParams: TAction;
    Series1: THorizLineSeries;
    Series2: THorizLineSeries;
    LineSelected: TAction;
    LineUnselected: TAction;
    ChartValuesPane: TRzStatusPane;
    EditBlockBegin: TAction;
    EditBlockEnd: TAction;
    RzSpacer3: TRzSpacer;
    AddParamBtn: TRzToolButton;
    RemoveParamBtn: TRzToolButton;
    RzSpacer4: TRzSpacer;
    EditBlockSet: TAction;
    EditBlockUnset: TAction;
    BlockEnable: TAction;
    BlockDisabled: TAction;
    HelpManual: TAction;
    HelpAbout: TAction;
    GridTools: TRzToolbar;
    RzLabel1: TRzLabel;
    BlockUnsetBtn: TRzToolButton;
    BlockSetBtn: TRzToolButton;
    BlockEndBtn: TRzToolButton;
    BlockBeginBtn: TRzToolButton;
    RzSpacer6: TRzSpacer;
    CursorPosPane: TRzStatusPane;
    BeginBlockLabel: TRzLabel;
    BeginBlockDateLabel: TRzLabel;
    EndBlockLabel: TRzLabel;
    EndBlockDateLabel: TRzLabel;
    RzBorder1: TRzBorder;
    EditFill: TAction;
    EditCorrection: TAction;
    EditPlusMinus: TAction;
    FillBtn: TRzToolButton;
    CorrectionBtn: TRzToolButton;
    PlusMinusBtn: TRzToolButton;
    ServiceFindZUp: TAction;
    ServiceFindZDown: TAction;
    ServiceCopy: TAction;
    ServicePaste: TAction;
    RzSpacer5: TRzSpacer;
    CopyBtn: TRzToolButton;
    PasteBtn: TRzToolButton;
    ChartPgDn: TAction;
    RzSpacer7: TRzSpacer;
    ChartPgDnBtn: TRzToolButton;
    ChartPgUpBtn: TRzToolButton;
    ChartPgUp: TAction;
    FileCalcParams: TAction;
    ServiceSaveData: TAction;
    ServiceLoadData: TAction;
    FileSaveDlg: TSaveDialog;
    FileSaveSetParams: TAction;
    FileLoadSetParams: TAction;
    LoadSetParamsBtn: TRzToolButton;
    DefaultParamsBtn: TRzToolButton;
    ServiceChangeDateTime: TAction;
    ServiceExportData: TAction;
    ServiceMergeData: TAction;
    EditCutting: TAction;
    CuttingBtn: TRzToolButton;
    ChartReload: TAction;
    ServiceResqueData: TAction;
    EditGlide: TAction;
    GlideBtn: TRzToolButton;
    ServiceScanDepth: TAction;
    EditExpandTalblock: TAction;
    ExpandTalblockBtn: TRzToolButton;
    EditUndo: TAction;
    RzSpacer8: TRzSpacer;
    EditUndoBtn: TRzToolButton;
    ServiceImportChrom: TAction;
    procedure FileOpenExecute(Sender: TObject);
    procedure FileExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FileOpenedExecute(Sender: TObject);
    procedure FileClosedExecute(Sender: TObject);
    procedure LoadDataIntoChart(Pos: Integer);
    procedure ChartVerticalAxisExecute(Sender: TObject);
    procedure geChartMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure geChartMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DrawBtnClick(Sender: TObject);
    procedure ChartCancelBtnClick(Sender: TObject);
    procedure DrawLineComboChange(Sender: TObject);
    procedure FileParamsExecute(Sender: TObject);
    procedure SaveChanges;
    procedure AddDefaultParam;
    procedure AddDefaultLines;
    procedure ReCalcParams(EditField: String; Value: Double);
    procedure ReCalcTableParams(EditField: String; Value: Double);
    procedure geChartAfterDraw(Sender: TObject);
    procedure ChartHeaderBtnClick(Sender: TObject);
    procedure geChartDblClick(Sender: TObject);
    procedure ChartHeaderExecute(Sender: TObject);
    procedure FileAddParamExecute(Sender: TObject);
    procedure FileDefaultParamsExecute(Sender: TObject);
    procedure FileRemoveParamExecute(Sender: TObject);
    procedure LineSelectedExecute(Sender: TObject);
    procedure LineUnselectedExecute(Sender: TObject);
    procedure EditBlockBeginExecute(Sender: TObject);
    procedure EditBlockEndExecute(Sender: TObject);
    procedure EditBlockSetExecute(Sender: TObject);
    procedure EditBlockUnsetExecute(Sender: TObject);
    procedure BlockEnableExecute(Sender: TObject);
    procedure BlockDisabledExecute(Sender: TObject);
    procedure HelpManualExecute(Sender: TObject);
    procedure HelpAboutExecute(Sender: TObject);
    procedure BeginBlockLabelDblClick(Sender: TObject);
    procedure EndBlockLabelDblClick(Sender: TObject);
    procedure EditFillExecute(Sender: TObject);
    procedure EditCorrectionExecute(Sender: TObject);
    procedure EditPlusMinusExecute(Sender: TObject);
    procedure ServiceFindZUpExecute(Sender: TObject);
    procedure ServiceFindZDownExecute(Sender: TObject);
    procedure ServicePasteExecute(Sender: TObject);
    procedure ServiceCopyExecute(Sender: TObject);
    procedure ChartPgDnExecute(Sender: TObject);
    procedure ChartPgUpExecute(Sender: TObject);
    procedure FileCalcParamsExecute(Sender: TObject);
    procedure ServiceSaveDataExecute(Sender: TObject);
    procedure ServiceLoadDataExecute(Sender: TObject);
    procedure FileSaveSetParamsExecute(Sender: TObject);
    procedure FileLoadSetParamsExecute(Sender: TObject);
    procedure geChartZoom(Sender: TObject);
    procedure geGridScroll;
    procedure DrawChartPosition;
    procedure ServiceChangeDateTimeExecute(Sender: TObject);
    procedure ServiceExportDataExecute(Sender: TObject);
    procedure ServiceMergeDataExecute(Sender: TObject);
    procedure EditCuttingExecute(Sender: TObject);
    procedure EditCorrectionS101(StartValue, PumpCheckValue: Double; Direction, PumpCheck: Boolean);
    procedure EditCorrectionS102(StartValue: Double; Direction: Boolean);
    procedure ChartReloadExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ServiceResqueDataExecute(Sender: TObject);
    procedure EditGlideExecute(Sender: TObject);
    procedure ServiceScanDepthExecute(Sender: TObject);
    procedure EditExpandTalblockExecute(Sender: TObject);
    procedure EditUndoExecute(Sender: TObject);
    procedure ServiceImportChromExecute(Sender: TObject);
    procedure geChartClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure geChartClick(Sender: TObject);
  private
    { Private declarations }
    function CalcDateTime(DbTime : Integer; DbDate : TDateTime) : TDateTime;
    procedure VerifyBlock;
    procedure Gliding(RewriteUndo: Boolean);
    function CheckFlags(Value, CheckValue: Double; Operand: integer): Boolean;
  public
    { Public declarations }
  end;

  TGeSeries = record
    GID, MathType: Integer;
    Name: String;
    GridMin, GridMax, GridK: Double;
  end;

  TsKey = Record
    AppName, LicDate, LastDate: ShortString;
  end;

  TGsParam = Record
    FieldName : String;
    BeginValue, DefValue : Double;
  end;

  TUndoInfo = Record
    Flag: Boolean;
    FieldName: String;
    BlockBegin, BlockEnd: Longint;
  end;

  TValuesArray = Array of Double;

const
  PenStyles: array [0..4] of TPenStyle = (psSolid, psDash, psDot, psDashDot, psDashDotDot);
  WinStates: array [0..2] of TWindowState = (wsMaximized, wsMinimized, wsNormal);

var
  MainForm: TMainForm;
  MainDir, WorkDir, geFile, geDatabase : String;
  ChartPoints: Integer;
  OldX: Double;
  OldY, MouseX, MouseY: Integer;
  ChartModify, DataSetModify: Boolean;
  geChartSeriesArray: array of TGeSeries;
  SetBlockFlag: Boolean;
  BlockBeginRec, BlockEndRec: Longint;
  StartChartRec, OldRecNo: Longint;
  LicensionDate, LicensionType: String;
  UndoInfo: TUndoInfo;

{Объявление внешних процедур и функций}
  function s_StrToFloat(FloatStr: String): Double; external 'SSR.Dll';
 // function s_Encrypt(S: ShortString; Key: Word): ShortString	; external 'SSR.Dll';
 // function s_Decrypt(S: ShortString; Key: Word): ShortString	; external 'SSR.Dll';

implementation

{$R *.dfm}

uses DataUnit, ParamsUnit, AddParam, DiagramZoomUnit, DiagramLinesUnit, AboutUnit,
     FillUnit, PlusMinusUnit, CuttingUnit, CalcParamsUnit, SelectParamUnit, SaveSetParamUnit,
     BlockSetUnit, ChangeDateTimeUnit, CorrectionUnit, GlideUnit, ExpandTalblockUnit;

{------------------------------------------------------------------------------}
{------------------- Блок управляющих процедур и фукций -----------------------}
{------------------------------------------------------------------------------}

{ Действия при запуске программы }
procedure TMainForm.FormCreate(Sender: TObject);
var
  MainIni: TIniFile;
  wState: Integer;
begin
  GetDir(0,MainDir);
  MainIni := TIniFile.Create(MainDir+'/GeoEdit.ini');
  WorkDir := MainIni.ReadString('General','WorkDir', MainDir+'/Data');
  MainForm.Top := MainIni.ReadInteger('Layout', 'Top', 100);
  MainForm.Left := MainIni.ReadInteger('Layout', 'Left', 100);
  MainForm.Height := MainIni.ReadInteger('Layout', 'Height', 450);
  MainForm.Width := MainIni.ReadInteger('Layout', 'Width', 600);
  wState := MainIni.ReadInteger('Layout', 'State', 2);
  if wState = 1 then wState := 2;
  MainForm.WindowState := WinStates[wState];
  ChartPanel.Width := MainIni.ReadInteger('Layout', 'ChartWidth', 300);
  if (ChartPanel.Width < (MainForm.Width div 4)) and (wState = 2) then
                          ChartPanel.Width := (MainForm.Width div 4);
  ChartPoints := MainIni.ReadInteger('Chart', 'PointsPerPage', 600);
  OperationProgressPane.Visible := False;
  MainIni.Free;
  geFile := '';
  UndoInfo.Flag := False;
  UndoInfo.FieldName := '';
  UndoInfo.BlockBegin := -1;
  UndoInfo.BlockEnd := -1;
  OldX := 0; OldY := 0;
  FileClosedExecute(Self);
  SetLength(geChartSeriesArray,0);
end;

{ Инициализация формы }
procedure TMainForm.FormShow(Sender: TObject);
{var
  AppName: ShortString;
  LicDate, LastDate: TDateTime;
  KeyFile: File of TsKey;
  sKey, osKey: TsKey;
  StopExec: Boolean;
  R: TRegistry;
  No, CutNo: String; }
begin
{ Поиск лицензионного ключа -------------------------------------------------- }
{  try
   R := TRegistry.Create(KEY_READ or KEY_WOW64_64KEY);  // Windows 7 64bit
 except
   R := TRegistry.Create;                               // Windows XP
 end;
 R.RootKey := HKEY_LOCAL_MACHINE;
 R.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion', False);
 No := R.ReadString('ProductId');
 if No = '' then
 begin
  R.OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion', False);
  No := R.ReadString('ProductId');
 end;
 R.Free;
 StopExec := False;
 if (not FileExists(MainDir + '\bin\key.sed')) then StopExec := True
 else try
  AssignFile(KeyFile, MainDir + '\bin\key.sed');
  Reset(KeyFile);
  Read(KeyFile,sKey);
  Read(KeyFile,osKey);
  CloseFile(KeyFile);
  AppName := s_Decrypt(sKey.AppName,29573);
  LicDate := StrToDate(s_Decrypt(sKey.LicDate,02475));
  LicensionDate := DateToStr(LicDate);
  LastDate := StrToDate(s_Decrypt(sKey.LastDate,11696));
  LicensionType := 'Корпоративный';
  if (AppName <> 'GeoEdit') then StopExec := True;
  if (LicDate <= LastDate) then StopExec := True;
  if (Date >= LicDate) then StopExec := True;
{ Проверка ID операционной системы }
{  if (s_Decrypt(osKey.LastDate,11696) <> 'Sofia') then
  begin
   LicensionType := 'Персональный';
   CutNo := Copy(No,1,5);
   if (CutNo <> s_Decrypt(osKey.AppName,29573)) then StopExec := True;
   CutNo := Copy(No,11,7);
   if (CutNo <> s_Decrypt(osKey.LicDate,02475)) then StopExec := True;
   CutNo := Copy(No,19,5);
   if (CutNo <> s_Decrypt(osKey.LastDate,11696)) then StopExec := True;
  end;
{ Проверка ID операционной системы - конец }
//  ShowMessage('AppName: ' + AppName + #10 +
//              'LicDate: ' + DateToStr(LicDate) + #10 +
//              'LastDate: ' + DateToStr(LastDate));
{ except
  StopExec := True;
 end;
 if StopExec then begin
  Application.MessageBox(
   'Лицензионный ключ не обнаружен, некорректен или срок его действия истек.'
   + #13 +  'Приложение будет закрыто.', 'GeoEdit',mb_Ok + mb_IconExclamation);
  Close;
 end;     }
end;

{ Выход из программы }
procedure TMainForm.FileExitExecute(Sender: TObject);
begin
  Close;
end;

{ Действия при выходе из программы }
procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  MainIni : TIniFile;
  Indx, wState: Integer;
begin
  MainIni := TIniFile.Create(MainDir+'/GeoEdit.ini');
  MainIni.WriteString('General','WorkDir',WorkDir);
  MainIni.WriteInteger('Layout', 'Top', MainForm.Top);
  MainIni.WriteInteger('Layout', 'Left', MainForm.Left);
  MainIni.WriteInteger('Layout', 'Height', MainForm.Height);
  MainIni.WriteInteger('Layout', 'Width', MainForm.Width);
  MainIni.WriteInteger('Layout', 'ChartWidth', ChartPanel.Width);
  MainIni.WriteInteger('Chart', 'PointsPerPage', ChartPoints);
  wState := 2;
  for Indx := 0 to 2 do
    if WinStates[Indx] = MainForm.WindowState then wState := Indx;
  MainIni.WriteInteger('Layout','State',wState);
  MainIni.Free;
  FileClosedExecute(Self);
end;

{ Открытие файла }
procedure TMainForm.FileOpenExecute(Sender: TObject);
var
  strSQL: String;
begin
 FileOpenDlg.Filter := 'Файлы GeoScape|*.db';
 FileOpenDlg.InitialDir := WorkDir;
 if FileOpenDlg.Execute then
 begin
  if FileExists(FileOpenDlg.FileName) then
  begin
   geFile := ExtractFileName(FileOpenDlg.FileName);
   geDatabase := ExtractFilePath(FileOpenDlg.FileName);
   if geData.geQuery.Active then geData.geQuery.Close;
   if geData.geTable.Active then geData.geTable.Close;
   try
    { Открываем файл для редактирования -------------------------------------- }
    geData.geTable.DatabaseName := geDatabase;
    geData.geTable.TableName := geFile;
    geData.geTable.Open;
    geData.geQuery.DatabaseName := geDatabase;
    geData.geQuery.SQL.Clear;
    strSQL := 'SELECT * FROM "' + geFile + '"';
    geData.geQuery.SQL.Append(strSQL);
    geData.geQuery.Open;
    if geData.geTable.RecordCount < ChartPoints then ChartPoints := geData.geTable.RecordCount-2;
    FileOpenedExecute(Self);
    geData.geTable.First;
    MainForm.Caption := 'GeoEdit v2.5.1 - ' + geFile;
    EditBlockUnsetExecute(Self);
    WorkDir := ExtractFileDir(FileOpenDlg.FileName);
   except
    FileClosedExecute(Self);
    Application.MessageBox('Ошибка при открытии файла', 'GeoEdit',mb_Ok + mb_IconExclamation);
   end;
  end;
 end;
end;

{ Редактирование параметров }
procedure TMainForm.FileParamsExecute(Sender: TObject);
begin
  ParamsForm.Left := MainForm.Left + MainForm.Width div 2 - ParamsForm.Width div 2;
  ParamsForm.Top := MainForm.Top + MainForm.Height div 2 - ParamsForm.Height div 2;
  ParamsForm.ShowModal;
end;

{ Действия при открытии файла }
procedure TMainForm.FileOpenedExecute(Sender: TObject);
begin
  DrawBtn.Enabled := False;
  DrawBtn.Down := False;
  ChartHeaderBtn.Enabled := True;
  DrawLineCombo.Enabled := True;
  DrawLineCombo.ItemIndex := 0;
  ChartModify := False;
  DataSetModify := False;
  ChartCancelBtn.Enabled := False;
  FileAddParam.Enabled := True;
  FileRemoveParam.Enabled := True;
  FileDefaultParams.Enabled := True;
  ChartHeader.Enabled := True;
  ChartVerticalAxis.Enabled := True;
  AddDefaultParam;
  AddDefaultLines;
  EditBlockBegin.Enabled := True;
  EditBlockEnd.Enabled := True;
  EditBlockSet.Enabled := True;
  EditBlockUnset.Enabled := True;
  ServiceFindZDown.Enabled := True;
  ServiceFindZUp.Enabled := True;
  ServiceScanDepth.Enabled := True;
  ServiceCopy.Enabled := True;
  ServicePaste.Enabled := True;
  ServiceChangeDateTime.Enabled := True;
  ServiceMergeData.Enabled := True;
  ServiceResqueData.Enabled := True;
  ServiceImportChrom.Enabled := True;
  ChartPgUp.Enabled := True;
  ChartPgDn.Enabled := True;
  FileLoadSetParams.Enabled := True;
  FileSaveSetParams.Enabled := True;
  OldRecNo := geData.geTable.RecNo;
end;

{ Действия при закрытии файла }
procedure TMainForm.FileClosedExecute(Sender: TObject);
begin
  DrawBtn.Enabled := False;
  ChartHeaderBtn.Enabled := False;
  DrawLineCombo.Enabled := False;
  DrawLineCombo.ItemIndex := 0;
  ChartModify := False;
  DataSetModify := False;
  ChartCancelBtn.Enabled := False;
  FileAddParam.Enabled := False;
  FileRemoveParam.Enabled := False;
  FileDefaultParams.Enabled := False;
  ChartHeader.Enabled := False;
  ChartVerticalAxis.Enabled := False;
  SetLength(geChartSeriesArray,0);
  EditBlockBegin.Enabled := False;
  EditBlockEnd.Enabled := False;
  EditBlockSet.Enabled := False;
  EditBlockUnset.Enabled := False;
  EditBlockUnsetExecute(Self);
  EditUndo.Enabled := False;
  ServiceFindZDown.Enabled := False;
  ServiceFindZUp.Enabled := False;
  ServiceScanDepth.Enabled := False;
  ServiceCopy.Enabled := False;
  ServicePaste.Enabled := False;
  ServiceChangeDateTime.Enabled := False;
  ServiceMergeData.Enabled := False;
  ServiceResqueData.Enabled := False;
  ServiceImportChrom.Enabled := False;
  ChartPgUp.Enabled := False;
  ChartPgDn.Enabled := False;
  FileLoadSetParams.Enabled := False;
  FileSaveSetParams.Enabled := False;
  MainForm.Caption := 'GeoEdit v2.5.1';
end;

{ Добавление в таблицу дефолтного набора }
procedure TMainForm.AddDefaultParam;
var
  Indx: Integer;
begin
  with geGrid.Columns do
  begin
   Clear;
   Add;
   Items[0].FieldName := 'S101';
   Items[0].Title.Caption := 'Глубина забоя';
   Add;
   Items[1].FieldName := 'S102';
   Items[1].Title.Caption := 'Над забоем';
   Add;
   Items[2].FieldName := 'S103';
   Items[2].Title.Caption := 'Тальблок';
   Add;
   Items[3].FieldName := 'S200';
   Items[3].Title.Caption := 'Вес на крюке';
   Add;
   Items[4].FieldName := 'S300';
   Items[4].Title.Caption := 'Давление нагн.';
   for Indx := 0 to 4 do
   begin
    Items[Indx].Width := 100;
    Items[Indx].Alignment := taLeftJustify;
    Items[Indx].Title.Alignment := taCenter;
   end;
  end;
  FileRemoveParam.Enabled := False;
end;

{ Добавление параметра для редактирования }
procedure TMainForm.FileAddParamExecute(Sender: TObject);
var
  ParamName: String;
  ParamGID, Indx: Integer;
begin
  AddParamDlg.Left := MainForm.Left + MainForm.Width div 2 - AddParamDlg.Width div 2;
  AddParamDlg.Top := MainForm.Top + MainForm.Height div 2 - AddParamDlg.Height div 2;
  if AddParamDlg.ShowModal = mrOk then
  begin
   ParamName := AddParamDlg.ParamCombo.Text;
   geData.SensorsTable.Locate('Name', ParamName,[loCaseInsensitive]);
   ParamGID := geData.SensorsTable.FieldByName('GID').AsInteger;
   geGrid.Columns.Add;
   with geGrid.Columns.Items[geGrid.Columns.Count-1] do { Добавление поля в таблицу }
   begin
    Title.Caption := ParamName;
    Title.Alignment := taCenter;
    FieldName := 'S'+IntToStr(ParamGID);
    Width := 100;
    Alignment := taLeftJustify;
   end;
   if AddParamDlg.ToChartCheck.Checked then { Добавление графика в диаграмму }
   begin
    Indx := Length(geChartSeriesArray);
    SetLength(geChartSeriesArray,Indx+1);
    geChartSeriesArray[Indx].GID := ParamGID;
    geChartSeriesArray[Indx].MathType := geData.SensorsTable.FieldByName('MathType').AsInteger;
    geChartSeriesArray[Indx].Name := ParamName;
    geChart.Series[Indx].SeriesColor := geData.SensorsTable.FieldByName('Color').AsInteger;
    geChart.Series[Indx].Pen.Width := geData.SensorsTable.FieldByName('LineWidth').AsInteger;
    geChart.Series[Indx].Pen.Style := PenStyles[geData.SensorsTable.FieldByName('LineStyle').AsInteger];
    geChartSeriesArray[Indx].GridMin := geData.SensorsTable.FieldByName('GrMin').AsFloat;
    geChartSeriesArray[Indx].GridMax := geData.SensorsTable.FieldByName('GrMax').AsFloat;
    geChartSeriesArray[Indx].GridK := 100/(geChartSeriesArray[Indx].GridMax-geChartSeriesArray[Indx].GridMin);
    DrawLineCombo.Items.Append(ParamName);
    if ChartHeaderBtn.Down then geChart.MarginTop := (Indx+1)*3*Font.Size-geChart.Canvas.Font.Size*2;
    LoadDataIntoChart(StartChartRec);
   end;
   FileRemoveParam.Enabled := True;
  end;
end;

{ Удаление параметра редактирования }
procedure TMainForm.FileRemoveParamExecute(Sender: TObject);
var
  LineIndx: Integer;
begin
  LineIndx := Length(geChartSeriesArray)-1;
  if geGrid.Columns.Items[geGrid.Columns.Count-1].Title.Caption = geChartSeriesArray[LineIndx].Name then
  begin { Удаление графика из диаграммы }
   geChart.Series[LineIndx].Clear;
   SetLength(geChartSeriesArray,LineIndx);
   DrawLineCombo.Items.Delete(DrawLineCombo.Items.Count-1);
   if ChartHeaderBtn.Down then geChart.MarginTop := (LineIndx)*3*Font.Size-geChart.Canvas.Font.Size*2;
   LoadDataIntoChart(StartChartRec);
   DrawLineCombo.ItemIndex := 0;
   DrawLineCombo.Enabled := True;
   LineUnselectedExecute(Self);
  end;
  geGrid.Columns.Delete(geGrid.Columns.Count-1);
  if geGrid.Columns.Count < 6 then FileRemoveParam.Enabled := False;
end;

{Данные для вычисляемых параметров}
procedure TMainForm.FileCalcParamsExecute(Sender: TObject);
begin
  CalcParamsDlg.ShowModal;
end;

{ Параметры по умолчанию }
procedure TMainForm.FileDefaultParamsExecute(Sender: TObject);
begin
  AddDefaultParam;
  AddDefaultLines;
  DrawLineCombo.ItemIndex := 0;
  DrawLineCombo.Enabled := True;
end;

{ Сохранение набор параметров }
procedure TMainForm.FileSaveSetParamsExecute(Sender: TObject);
var
  Indx: Integer;
  FormFile: TIniFile;
  FormFileName: String;
begin
  SaveSetParamDlg.Left := MainForm.Left + MainForm.Width div 2 - SaveSetParamDlg.Width div 2;
  SaveSetParamDlg.Top := MainForm.Top + MainForm.Height div 2 - SaveSetParamDlg.Height div 2;
  SaveSetParamDlg.SetParamsNameCombo.Visible := True;
  SaveSetParamDlg.SetParamsNameCombo.Style := csDropDown;
  SaveSetParamDlg.SetParamsListBox.Directory := MainDir+'/forms';
  if SaveSetParamDlg.ShowModal = mrOk then
  begin
   FormFileName := SaveSetParamDlg.SetParamsNameCombo.Text;
   FormFile := TIniFile.Create(MainDir+'/forms/'+FormFileName+'.gef');
   try
    FormFile.WriteInteger('General','GridParams',geGrid.Columns.Count);
    FormFile.WriteInteger('General','ChartParams',Length(geChartSeriesArray));
    for Indx := 0 to geGrid.Columns.Count - 1 do
    begin
     FormFile.WriteString('Grid','GID_'+IntToStr(Indx),geGrid.Columns.Items[Indx].FieldName);
     FormFile.WriteInteger('Grid','ColWidth_'+IntToStr(Indx),geGrid.Columns.Items[Indx].Width);
    end;
    for Indx := 0 to Length(geChartSeriesArray) - 1 do
    begin
     FormFile.WriteInteger('Chart','GID_'+IntToStr(Indx),geChartSeriesArray[Indx].GID);
     FormFile.WriteFloat('Chart','GridMin_'+IntToStr(Indx),geChartSeriesArray[Indx].GridMin);
     FormFile.WriteFloat('Chart','GridMax_'+IntToStr(Indx),geChartSeriesArray[Indx].GridMax);
    end;
   finally
    FormFile.Free;
   end;
  end;
end;

{ Загрузить набор параметров }
procedure TMainForm.FileLoadSetParamsExecute(Sender: TObject);
var
  Indx, ParamCount, ParamIntValue: Integer;
  FormFile: TIniFile;
  FormFileName, ParamStr: String;
begin
  SaveSetParamDlg.Left := MainForm.Left + MainForm.Width div 2 - SaveSetParamDlg.Width div 2;
  SaveSetParamDlg.Top := MainForm.Top + MainForm.Height div 2 - SaveSetParamDlg.Height div 2;
  SaveSetParamDlg.SetParamsNameCombo.Visible := True;
  SaveSetParamDlg.SetParamsNameCombo.Style := csDropDownList;
  SaveSetParamDlg.SetParamsListBox.Directory := MainDir+'/forms';
  if SaveSetParamDlg.ShowModal = mrOk then
  begin
   FormFileName := SaveSetParamDlg.SetParamsNameCombo.Text;
   FormFile := TIniFile.Create(MainDir+'/forms/'+FormFileName+'.gef');
   try
{ Загрузка параметров в таблицу ---------------------------------------------- }
    with geGrid do
    begin
     Columns.Clear;
     ParamCount := FormFile.ReadInteger('General','GridParams',0);
     if ParamCount < 1 then raise Exception.Create('');
     for Indx := 0 to ParamCount - 1 do
     begin
      Columns.Add;
      ParamStr := FormFile.ReadString('Grid','GID_'+IntToStr(Indx),'');
      Columns.Items[Indx].FieldName := ParamStr;
      Delete(ParamStr,1,1);
      geData.SensorsTable.Locate('GID', ParamStr,[loCaseInsensitive]);
      Columns.Items[Indx].Title.Caption := geData.SensorsTable.FieldByName('Name').AsString;
      ParamIntValue := FormFile.ReadInteger('Grid','ColWidth_'+IntToStr(Indx),0);
      Columns.Items[Indx].Width := ParamIntValue;
      Columns.Items[Indx].Alignment := taLeftJustify;
      Columns.Items[Indx].Title.Alignment := taCenter;
     end;
    if Columns.Count > 5 then FileRemoveParam.Enabled := True;
    end;
{ Загрузка параметров в диаграмму -------------------------------------------- }
    for Indx := 0 to 6 do geChart.Series[Indx].Clear;       { Очистка массивов }
    ParamCount := FormFile.ReadInteger('General','ChartParams',0);
    if ParamCount < 1 then raise Exception.Create('');
    SetLength(geChartSeriesArray,ParamCount);
    DrawLineCombo.Items.Clear;
    DrawLineCombo.Items.Append('Не задано');
    for Indx := 0 to ParamCount - 1 do
    begin
     ParamStr := FormFile.ReadString('Chart','GID_'+IntToStr(Indx),'');
     ParamIntValue := StrToInt(ParamStr);
     geChartSeriesArray[Indx].GID := ParamIntValue;
     geData.SensorsTable.Locate('GID',ParamIntValue,[loCaseInsensitive]);
     geChartSeriesArray[Indx].MathType := geData.SensorsTable.FieldByName('MathType').AsInteger;
     geChartSeriesArray[Indx].Name := geData.SensorsTable.FieldByName('Name').AsString;
     geChart.Series[Indx].SeriesColor := geData.SensorsTable.FieldByName('Color').AsInteger;
     geChart.Series[Indx].Pen.Width := geData.SensorsTable.FieldByName('LineWidth').AsInteger;
     geChart.Series[Indx].Pen.Style := PenStyles[geData.SensorsTable.FieldByName('LineStyle').AsInteger];
     geChartSeriesArray[Indx].GridMin := FormFile.ReadFloat('Chart','GridMin_'+IntToStr(Indx),0);
     geChartSeriesArray[Indx].GridMax := FormFile.ReadFloat('Chart','GridMax_'+IntToStr(Indx),100);
     geData.SensorsTable.Edit;
     geData.SensorsTable.FieldByName('GrMin').AsFloat := geChartSeriesArray[Indx].GridMin;
     geData.SensorsTable.FieldByName('GrMax').AsFloat := geChartSeriesArray[Indx].GridMax;
     geData.SensorsTable.Post;
     geChartSeriesArray[Indx].GridK := 100/(geChartSeriesArray[Indx].GridMax-geChartSeriesArray[Indx].GridMin);
     DrawLineCombo.Items.Append(geChartSeriesArray[Indx].Name);
    end;
    DrawLineCombo.ItemIndex := 0;
    DrawLineCombo.Enabled := True;
    LineUnselectedExecute(Self);
    for Indx := ParamCount to 6 do geChart.Series[Indx].Clear;
    LoadDataIntoChart(StartChartRec);
    ChartHeaderBtnClick(Self);
{ ---------------------------------------------------------------------------- }
   except
    Application.MessageBox('Ошибка загрузки набора параметров', 'GeoEdit',mb_Ok + mb_IconExclamation);
    AddDefaultParam;
    AddDefaultLines;
   end;
   FormFile.Free;
  end;

end;

{ Сведения о программе }
procedure TMainForm.HelpAboutExecute(Sender: TObject);
begin
  AboutBox.Left := MainForm.Left + MainForm.Width div 2 - AboutBox.Width div 2;
  AboutBox.Top := MainForm.Top + MainForm.Height div 2 - AboutBox.Height div 2;
  AboutBox.LicTypeLabel.Caption := 'Свободная';{LicensionType;}
  AboutBox.LicDateLabel.Caption := 'Неограничено';{LicensionDate;}
  AboutBox.MainDir := MainDir;
  AboutBox.ShowModal;
end;

{ Руководство пользователя }
procedure TMainForm.HelpManualExecute(Sender: TObject);
begin
  //
end;

{------------------------------------------------------------------------------}
{---------------------- Блок процедур и функций диаграммы -------------------- }
{------------------------------------------------------------------------------}

{ Событие - график выбран }
procedure TMainForm.LineSelectedExecute(Sender: TObject);
begin
  DrawBtn.Enabled := True;
  ChartCancelBtn.Enabled := True;
end;

{ Событие - график не выбран }
procedure TMainForm.LineUnselectedExecute(Sender: TObject);
begin
  DrawBtn.Enabled := False;
  DrawBtn.Down := False;
  ChartCancelBtn.Enabled := False;
end;

{ Прокрутка таблицы }
procedure TMainForm.geGridScroll;
begin
  if (geData.geTable.RecNo >= StartChartRec) and (geData.geTable.RecNo <= StartChartRec+ChartPoints) then
  begin { Если курсор таблицы в пределах графика, то рисуем указатель на диаграмме }
   DrawChartPosition;
  end
  else
  begin { Если курсор вышел за пределы, то перегружаем диаграмму }
   if geData.geTable.RecNo < OldRecNo
    then LoadDataIntoChart(geData.geTable.RecNo) { Скроллинг вверх }
    else LoadDataIntoChart(geData.geTable.RecNo-ChartPoints); { Скроллинг вниз }
  end;
  OldRecNo := geData.geTable.RecNo;
end;

{ Рисование позиции курсора на диаграмме }
procedure TMainForm.DrawChartPosition;
var
  k: Double;
  x, x1, y: Integer;
begin
  if (geData.geTable.Active) and (not geChart.Zoomed) then
  begin
   k := (geChart.ChartRect.Bottom - geChart.ChartRect.Top)/ChartPoints;
   x := geChart.ChartRect.Right+geChart.BevelWidth;
   x1 := geChart.ChartRect.Right+geChart.MarginRight-geChart.BevelWidth;
   y := Round((geData.geTable.RecNo-StartChartRec)*k)+geChart.ChartRect.Top;
   with geChart.Canvas do
   begin
    Brush.Color := geChart.Color;
    geChart.Repaint;
    Pen.Color := clRed;
    Pen.Style := psSolid;
    MoveTo(x,y);
    LineTo(x1,y-4);
    LineTo(x1,y+4);
    LineTo(x,y);
    Pen.Color := clGray;
    Pen.Style := psDash;
    LineTo(geChart.ChartRect.Left,y);
   end;
  end;
end;

{ Загрузка данных в диаграмму }
procedure TMainForm.LoadDataIntoChart(Pos: Integer);
var
 Indx,sIndx, gsTime: Integer;
 geDate, gsDate: TDateTime;
 strTime, sGID: String;
 geValue: Double;
begin
  StartChartRec := Pos;
  if geData.geQuery.Active then
  begin
   for sIndx := 0 to  Length(geChartSeriesArray) - 1 do
   begin
    geChart.Series[sIndx].Clear;
    sGID := 'S'+IntToStr(geChartSeriesArray[sIndx].GID);
    geData.geQuery.First;
    geData.geQuery.MoveBy(Pos);
    for Indx := 0 to ChartPoints do
    begin
     gsDate := geData.geQuery.FieldByName('Date').AsDateTime;
     gsTime := geData.geQuery.FieldByName('Time').AsInteger;
     geDate := CalcDateTime(gsTime,gsDate);
     geValue := geData.geQuery.FieldByName(sGID).AsFloat*geChartSeriesArray[sIndx].GridK -
                geChartSeriesArray[sIndx].GridMin*geChartSeriesArray[sIndx].GridK;
     strTime := FormatDateTime('hh:mm',geDate);
     if sIndx = 0
      then geChart.Series[sIndx].AddXY(geValue,Indx,strTime)
      else geChart.Series[sIndx].AddXY(geValue,Indx);
     geData.geQuery.Next;
    end;
   end;
  end;
end;

{ Добавление в диаграмму дефолтного набора: тальблок,вес_на_крюке,давление }
procedure TMainForm.AddDefaultLines;
var
  Indx: Integer;
begin
  for Indx := 0 to 6 do geChart.Series[Indx].Clear;         { Очистка массивов }
  SetLength(geChartSeriesArray,3);
  DrawLineCombo.Items.Clear;
  DrawLineCombo.Items.Append('Не задано');
{ Тальблок }
  geChartSeriesArray[0].GID := 103;
  geData.SensorsTable.Locate('GID',103,[loCaseInsensitive]);
  geChartSeriesArray[0].MathType := geData.SensorsTable.FieldByName('MathType').AsInteger;
  geChartSeriesArray[0].Name := geData.SensorsTable.FieldByName('Name').AsString;
  geChart.Series[0].SeriesColor := geData.SensorsTable.FieldByName('Color').AsInteger;
  geChart.Series[0].Pen.Width := geData.SensorsTable.FieldByName('LineWidth').AsInteger;
  geChart.Series[0].Pen.Style := PenStyles[geData.SensorsTable.FieldByName('LineStyle').AsInteger];
  geChartSeriesArray[0].GridMin := geData.SensorsTable.FieldByName('GrMin').AsFloat;
  geChartSeriesArray[0].GridMax := geData.SensorsTable.FieldByName('GrMax').AsFloat;
  geChartSeriesArray[0].GridK := 100/(geChartSeriesArray[0].GridMax-geChartSeriesArray[0].GridMin);
  DrawLineCombo.Items.Append(geChartSeriesArray[0].Name);
{ Вес на крюке }
  geChartSeriesArray[1].GID := 200;
  geData.SensorsTable.Locate('GID',200,[loCaseInsensitive]);
  geChartSeriesArray[1].MathType := geData.SensorsTable.FieldByName('MathType').AsInteger;
  geChartSeriesArray[1].Name := geData.SensorsTable.FieldByName('Name').AsString;
  geChart.Series[1].SeriesColor := geData.SensorsTable.FieldByName('Color').AsInteger;
  geChart.Series[1].Pen.Width := geData.SensorsTable.FieldByName('LineWidth').AsInteger;
  geChart.Series[1].Pen.Style := PenStyles[geData.SensorsTable.FieldByName('LineStyle').AsInteger];
  geChartSeriesArray[1].GridMin := geData.SensorsTable.FieldByName('GrMin').AsFloat;
  geChartSeriesArray[1].GridMax := geData.SensorsTable.FieldByName('GrMax').AsFloat;
  geChartSeriesArray[1].GridK := 100/(geChartSeriesArray[1].GridMax-geChartSeriesArray[1].GridMin);
  DrawLineCombo.Items.Append(geChartSeriesArray[1].Name);
{ Давление }
  geChartSeriesArray[2].GID := 300;
  geData.SensorsTable.Locate('GID',300,[loCaseInsensitive]);
  geChartSeriesArray[2].MathType := geData.SensorsTable.FieldByName('MathType').AsInteger;
  geChartSeriesArray[2].Name := geData.SensorsTable.FieldByName('Name').AsString;
  geChart.Series[2].SeriesColor := geData.SensorsTable.FieldByName('Color').AsInteger;
  geChart.Series[2].Pen.Width := geData.SensorsTable.FieldByName('LineWidth').AsInteger;
  geChart.Series[2].Pen.Style := PenStyles[geData.SensorsTable.FieldByName('LineStyle').AsInteger];
  geChartSeriesArray[2].GridMin := geData.SensorsTable.FieldByName('GrMin').AsFloat;
  geChartSeriesArray[2].GridMax := geData.SensorsTable.FieldByName('GrMax').AsFloat;
  geChartSeriesArray[2].GridK := 100/(geChartSeriesArray[2].GridMax-geChartSeriesArray[2].GridMin);
  DrawLineCombo.Items.Append(geChartSeriesArray[2].Name);
  DrawLineCombo.ItemIndex := 0;
  DrawLineCombo.Enabled := True;
  LineUnselectedExecute(Self);
  for Indx := 3 to 6 do geChart.Series[Indx].Clear;
  LoadDataIntoChart(geData.geTable.RecNo);
  ChartHeaderBtnClick(Self);
end;

{ Сохранение изменений }
procedure TMainForm.SaveChanges;
var
  Indx : Integer;
  sGID, dGID, strValue: String;
  geValue: Double;
begin
  if ChartModify then
  begin
  { Сохранение изменений в диаграмме }
   geData.geQuery.DisableControls;
   geData.geQuery.First;
  { Проверка вхождения графика в интервал }
   geData.geQuery.MoveBy(StartChartRec);
   sGID := 'S' + IntToStr(geChartSeriesArray[DrawLineCombo.ItemIndex-1].GID);
   dGID := 'D' + IntToStr(geChartSeriesArray[DrawLineCombo.ItemIndex-1].GID);
   for Indx := 0 to ChartPoints-1 do
   begin
    geData.geQuery.Edit;
    geValue := geChart.Series[DrawLineCombo.ItemIndex-1].XValue[Indx]/geChartSeriesArray[DrawLineCombo.ItemIndex-1].GridK+geChartSeriesArray[DrawLineCombo.ItemIndex-1].GridMin;
   { Добавление цифирок до 16 знаков --- }
    strValue := FloatToStr(geValue);
    if (Length(strValue) < 9) and (Abs(geValue) > 0.0001)  then
    begin
     geValue := geValue+0.0000001;
     strValue := FloatToStr(geValue);
     if (Pos('.',strValue) = 0) and (Pos(',',strValue) = 0) then strValue := strValue + '.';
     while Length(strValue)<17 do strValue := strValue+IntToStr(Round(Random(9)));
     geValue := s_StrToFloat(strValue);
    end;
   { ----------------------------------- }
    geData.geQuery.FieldByName(sGID).AsFloat := geValue;
    if geData.geQuery.FieldByName(dGID).AsString = 'E' then geData.geQuery.FieldByName(dGID).AsString := 'O';
    ReCalcParams(sGID,geValue);
    geData.geQuery.Next;
   end;
   geData.geQuery.EnableControls;
   ChartModify := False;
   geData.geQuery.Refresh;
   geData.geTable.Refresh;
  end;
end;

{ Вкл/Выкл показа шапки диаграммы }
procedure TMainForm.ChartHeaderBtnClick(Sender: TObject);
begin
  if ChartHeaderBtn.Down then geChart.MarginTop := Length(geChartSeriesArray)*3*Font.Size-geChart.Canvas.Font.Size*2
  else geChart.MarginTop := 0;
  geChart.Repaint;
end;

{ Действия после прорисовки диаграммы }
procedure TMainForm.geChartAfterDraw(Sender: TObject);
var
  x0,x1,y0,y1, Indx: Integer;
  Min,Max, Name: String;
begin
  { Затирание области шапки }
  geChart.Canvas.Brush.Color := geChart.Color;
  x0 := 0;
  x1 := geChart.Width;
  y0 := 0;
  y1 := geChart.ChartRect.Top - geChart.BevelWidth - geChart.TopAxis.TickLength;
  geChart.Canvas.FillRect(Rect(x0,y0,x1,y1));
  if ChartHeaderBtn.Down then
  begin { прорисовка шапки }
   for Indx := 0 to DrawLineCombo.Items.Count - 2 do
   with geChart.Canvas do
   begin
    Pen.Color := geChart.Series[Indx].SeriesColor;
    MoveTo(geChart.ChartRect.Left,Indx*3*Font.Size+5);
    LineTo(geChart.ChartRect.Left,Indx*3*Font.Size+24);
    MoveTo(geChart.ChartRect.Right,Indx*3*Font.Size+5);
    LineTo(geChart.ChartRect.Right,Indx*3*Font.Size+24);
    MoveTo(geChart.ChartRect.Left,Indx*3*Font.Size+20);
    LineTo(geChart.ChartRect.Right,Indx*3*Font.Size+20);
    Font.Color := geChart.Series[Indx].SeriesColor;
    if geChart.Zoomed then
    begin
     Min := FloatToStr(geChartSeriesArray[Indx].GridMin+(geChart.TopAxis.Minimum/geChartSeriesArray[Indx].GridK));
     if Length(Min)>5 then Min := Copy(Min,1,5);
     Max := FloatToStr(geChartSeriesArray[Indx].GridMin+(geChart.TopAxis.Maximum/geChartSeriesArray[Indx].GridK));
     if Length(Max)>5 then Max := Copy(Max,1,5);
    end
    else
    begin
     Min := FloatToStr(geChartSeriesArray[Indx].GridMin);
     Max := FloatToStr(geChartSeriesArray[Indx].GridMax);
    end;
    Name := geChartSeriesArray[Indx].Name;
    x0 := geChart.ChartRect.Left+3;
    x1 := geChart.ChartRect.Right-Length(Max)*Font.Size+3;
    TextOut(x0,Indx*3*Font.Size+6, Min);
    TextOut(x1,Indx*3*Font.Size+6, Max);
    x0 := geChart.ChartRect.Left+((geChart.ChartRect.Right-geChart.ChartRect.Left) div 2)-(Length(Name) div 2)*Font.Size;
    TextOut(x0,Indx*3*Font.Size+6, Name);
   end;
  end;
  DrawChartPosition;
end;

procedure TMainForm.geChartClick(Sender: TObject);
begin
  
end;


{ Выбор параметра для рисования средней кнопкой мыши }
procedure TMainForm.geChartClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Num: Integer;
begin
  if (Button = mbMiddle) then
  begin
   Num := StrToInt(Copy(Series.Name, Length(Series.Name),1));
   SaveChanges;
   DrawLineCombo.ItemIndex := Num;
   DrawLineComboChange(Self);
//   ShowMessage('Выбран параметр => ' + DrawLineCombo.Text);
  end;

end;

{ Включение/выключение рисования }
procedure TMainForm.DrawBtnClick(Sender: TObject);
begin
  if DrawBtn.Down then
  begin
   ChartCancelBtn.Enabled := True;
   DrawLineCombo.Enabled := False;
  end
  else
  begin
   ChartCancelBtn.Enabled := False;
   DrawLineCombo.Enabled := True;
   SaveChanges;
  end;
end;

{ Выбор параметра для рисования }
procedure TMainForm.DrawLineComboChange(Sender: TObject);
begin
 if geChartSeriesArray[DrawLineCombo.ItemIndex-1].MathType = 0
  then  LineSelectedExecute(Self)
  else LineUnselectedExecute(Self);
end;

{ Отмена изменений в диаграмме }
procedure TMainForm.ChartCancelBtnClick(Sender: TObject);
begin
  LoadDataIntoChart(StartChartRec);
  ChartModify := False;
end;

{ Движение указателя мыши по диаграмме/рисование }
procedure TMainForm.geChartMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  tmpX, tmpY, newX, deltaX: Double;
  Indx, tmp, deltaY, LineIndx : Integer;
  strX, strY: String;
begin
  LineIndx := 0;
  if geData.geQuery.Active and PtInRect(geChart.ChartRect, Point(X,Y)) then
  begin
   if DrawLineCombo.ItemIndex > 0 then LineIndx := DrawLineCombo.ItemIndex - 1;
   geChart.Series[LineIndx].GetCursorValues(tmpX, tmpY);
   tmp := Trunc(tmpY);
{ Рисование -------------------------------------------------------------------}
   if DrawBtn.Down and (Shift=[ssLeft]) then
   begin
    deltaY := tmp - oldY;
    if deltaY <> 0 then
    begin
     newX := StrToFloat(geChart.Series[LineIndx].GetHorizAxis.LabelValue(tmpX));
     deltaX := (newX - oldX)/Abs(deltaY);
     if deltaY > 0 then
      for Indx := oldY+1 to tmp do
        geChart.Series[LineIndx].XValue[Indx] := oldX + deltaX
     else
       for Indx := oldY-1 downto tmp do
        geChart.Series[LineIndx].XValue[Indx] := oldX + deltaX;
      geChart.Series[LineIndx].RefreshSeries;
      oldY := tmp;
      oldX := newX;
     end;
   end
   else
   begin
    oldY := tmp;
    oldX := geChart.Series[LineIndx].XValue[tmp];
   end;
{ Конец рисования -------------------------------------------------------------}
   if DrawLineCombo.ItemIndex > 0 then  { переменные диаграммы в StatusBar }
   begin
    strX := FloatToStr(OldX/geChartSeriesArray[LineIndx].GridK+geChartSeriesArray[LineIndx].GridMin);
    strY := geChart.Series[0].XLabel[tmp];
    ChartValuesPane.Caption := 'Время='+strY+'  '+DrawLineCombo.Text+'='+StrX;
   end;
  end
  else ChartValuesPane.Caption := '';
  MouseX := X;
  MouseY := Y;
end;

{ Отжатие кнопки мыши }
procedure TMainForm.geChartMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button=mbLeft) and (DrawBtn.Down) then ChartModify := True;
end;

{ Действия при двойном клике в области диаграммы }
procedure TMainForm.geChartDblClick(Sender: TObject);
begin
  if PtInRect(Rect(geChart.Left-geChart.MarginLeft,geChart.ChartRect.Top,geChart.ChartRect.Left,geChart.ChartRect.Bottom),
   Point(MouseX,MouseY)) then ChartVerticalAxisExecute(Self); { Двойной клик в области левой оси }
  if PtInRect(Rect(geChart.ChartRect.Left,geChart.Top-geChart.MarginTop,geChart.ChartRect.Right,geChart.ChartRect.Top),
   Point(MouseX,MouseY)) then ChartHeaderExecute(Self); { Двойной клик в области шапки }
end;

{ Масштаб диаграммы по вертикали }
procedure TMainForm.ChartVerticalAxisExecute(Sender: TObject);
var
  OldChartPoints: Integer;
begin
  DiagramZoomDlg.Left := MainForm.Left + MainForm.Width div 2 - DiagramZoomDlg.Width div 2;
  DiagramZoomDlg.Top := MainForm.Top + MainForm.Height div 2 - DiagramZoomDlg.Height div 2;
  with DiagramZoomDlg do
  begin
   PointsEdit.IntValue := ChartPoints;
   MinutesEdit.IntValue := ChartPoints div 60;    { Пока так, потом переделать }
   if ShowModal = mrOk then
   begin
    OldChartPoints := ChartPoints;
    if PointsRadio.Checked
     then ChartPoints := PointsEdit.IntValue                { Масштаб в точках }
     else ChartPoints := MinutesEdit.IntValue*60;          { Масштаб в минутах } { Пока так, потом переделать }
    if OldChartPoints < ChartPoints then
    begin
     if (StartChartRec+ChartPoints > geData.geTable.RecordCount) then StartChartRec := geData.geTable.RecordCount - ChartPoints;
     LoadDataIntoChart(StartChartRec);
     geGridScroll;
    end;
    if OldChartPoints > ChartPoints then
    begin
     if geData.geTable.RecNo <= StartChartRec+ChartPoints then LoadDataIntoChart(StartChartRec);
     geGridScroll;
    end;
   end;
  end;
end;

{ Настройка атрибутов графиков }
procedure TMainForm.ChartHeaderExecute(Sender: TObject);
var
  Indx: Integer;
begin
  DiagramLinesDlg.Left := MainForm.Left + MainForm.Width div 2 - DiagramLinesDlg.Width div 2;
  DiagramLinesDlg.Top := MainForm.Top + MainForm.Height div 2 - DiagramLinesDlg.Height div 2;
  if DiagramLinesDlg.ShowModal = mrOk then
  begin
   with geData.SensorsTable, DiagramLinesDlg do
   begin
    for Indx := 0 to DrawLineCombo.Items.Count - 2 do
    begin
     Locate('Name',DrawLineCombo.Items.Strings[Indx+1],[loCaseInsensitive]);
     Edit;
     FieldByName('GrMin').AsFloat := LinesAttrArray[Indx].Min;
     geChartSeriesArray[Indx].GridMin := LinesAttrArray[Indx].Min;
     FieldByName('GrMax').AsFloat := LinesAttrArray[Indx].Max;
     geChartSeriesArray[Indx].GridMax := LinesAttrArray[Indx].Max;
     geChartSeriesArray[Indx].GridK := 100/(geChartSeriesArray[Indx].GridMax-geChartSeriesArray[Indx].GridMin);
     FieldByName('Color').AsInteger := LinesAttrArray[Indx].Color;
     geChart.Series[Indx].SeriesColor := LinesAttrArray[Indx].Color;
     FieldByName('LineWidth').AsInteger := LinesAttrArray[Indx].PenWidth;
     geChart.Series[Indx].Pen.Width := LinesAttrArray[Indx].PenWidth;
     FieldByName('LineStyle').AsInteger := LinesAttrArray[Indx].PenStyle;
     geChart.Series[Indx].Pen.Style := PenStyles[LinesAttrArray[Indx].PenStyle];
     Post;
    end;
   end;
   LoadDataIntoChart(StartChartRec);
  end;
end;

{ Переход на страницу вперед }
procedure TMainForm.ChartPgDnExecute(Sender: TObject);
var
  Dist, Overlay: Integer;
begin
  Dist := ChartPoints-(geData.geTable.RecNo-StartChartRec);
  Overlay := Round(ChartPoints*0.05);
  geData.geTable.DisableControls;
  geData.geTable.MoveBy(ChartPoints-Overlay+Dist);
  geData.geTable.EnableControls;
  geData.geTable.MoveBy(-Dist);
end;

{ Переход на страницу назад }
procedure TMainForm.ChartPgUpExecute(Sender: TObject);
var
  Dist, Overlay: Integer;
begin
  Dist := geData.geTable.RecNo-StartChartRec;
  Overlay := Round(ChartPoints*0.05);
  geData.geTable.DisableControls;
  geData.geTable.MoveBy(-(ChartPoints-Overlay+Dist));
  geData.geTable.EnableControls;
  geData.geTable.MoveBy(Dist);
end;

{ Перезагрузка диаграммы }
procedure TMainForm.ChartReloadExecute(Sender: TObject);
begin
  LoadDataIntoChart(StartChartRec);
end;

{ Проверка выхода из диапазона при увеличении участка диаграммы }
procedure TMainForm.geChartZoom(Sender: TObject);
begin
  if geChart.LeftAxis.Minimum < 0 then geChart.LeftAxis.Minimum := 0;
  if geChart.LeftAxis.Maximum > ChartPoints then geChart.LeftAxis.Maximum := ChartPoints;
end;

{------------------------------------------------------------------------------}
{----------------- Блок процедур и функций редактирования ---------------------}
{------------------------------------------------------------------------------}

{ Пометка начала блока редактирования }
procedure TMainForm.EditBlockBeginExecute(Sender: TObject);
var
  gsTime: Integer;
  gsDate, geDateTime: TDateTime;
begin
  BlockBeginRec := geData.geTable.RecNo;
  gsTime := geData.geTable.FieldByName('Time').AsInteger;
  gsDate := geData.geTable.FieldByName('Date').AsDateTime;
  geDateTime := CalcDateTime(gsTime,gsDate);
  BeginBlockDateLabel.Caption := DateTimeToStr(geDateTime);
  VerifyBlock;
end;

{ Прыжок к началу блока }
procedure TMainForm.BeginBlockLabelDblClick(Sender: TObject);
begin
  if BlockBeginRec > -1 then geData.geTable.MoveBy(BlockBeginRec-geData.geTable.RecNo);
end;


{ Пометка конца блока редактирования }
procedure TMainForm.EditBlockEndExecute(Sender: TObject);
var
  gsTime: Integer;
  gsDate, geDateTime: TDateTime;
begin
  BlockEndRec := geData.geTable.RecNo;
  gsTime := geData.geTable.FieldByName('Time').AsInteger;
  gsDate := geData.geTable.FieldByName('Date').AsDateTime;
  geDateTime := CalcDateTime(gsTime,gsDate);
  EndBlockDateLabel.Caption := DateTimeToStr(geDateTime);
  VerifyBlock;
end;

{ Прыжок к концу блока }
procedure TMainForm.EndBlockLabelDblClick(Sender: TObject);
begin
  if BlockEndRec > -1 then geData.geTable.MoveBy(BlockEndRec-geData.geTable.RecNo);
end;

{ Задание блока редактирования из диалога }
procedure TMainForm.EditBlockSetExecute(Sender: TObject);
var
  gsTime: Integer;
  gsDate, gsDateTime, BeginDateTime, EndDateTime: TDateTime;
  StopFlag: Boolean;
begin
  BlockSetDlg.Left := MainForm.Left + MainForm.Width div 2 - BlockSetDlg.Width div 2;
  BlockSetDlg.Top := MainForm.Top + MainForm.Height div 2 - BlockSetDlg.Height div 2;
  with geData do
  begin
   gsTime := geTable.FieldByName('Time').AsInteger;
   gsDate := geTable.FieldByName('Date').AsDateTime;
   gsDateTime := CalcDateTime(gsTime,gsDate);
  end;
  BlockSetDlg.BeginMaskEdit.Text := FormatDateTime('dd.mm.yyyy hh:nn:ss',gsDateTime);
  if BlockSetDlg.ShowModal = mrOk then
  begin
   BeginDateTime := StrToDateTime(BlockSetDlg.BeginMaskEdit.Text);
   EndDateTime := StrToDateTime(BlockSetDlg.EndMaskEdit.Text);
   with geData.geQuery do
   begin
    EditBlockUnsetExecute(Self);
    DisableControls;
    First;
    StopFlag := False;
    OperationPane.Caption := 'Поиск блока';
    OperationProgressPane.PartsComplete := 0;
    OperationProgressPane.TotalParts := RecordCount;
    OperationProgressPane.Visible := True;
    while (not EoF) and (not StopFlag) do                 { Поиск начала блока }
    begin
     Next;
     OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
     gsTime := FieldByName('Time').AsInteger;
     gsDate := FieldByName('Date').AsDateTime;
     gsDateTime := CalcDateTime(gsTime,gsDate);
     if gsDateTime >= BeginDateTime then StopFlag := True;
    end;
    if StopFlag then
    begin
     Prior;
     BlockBeginRec := RecNo;
     BeginBlockDateLabel.Caption := DateToStr(gsDateTime)+ ' ' + TimeToStr(gsDateTime);
    end
    else
    begin
     OperationPane.Caption := '';
     OperationProgressPane.Visible := False;
     EnableControls;
     Exit;
    end;
    StopFlag := False;
    while (not EoF) and (not StopFlag) do                 { Поиск конца блока }
    begin
     Next;
     OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
     gsTime := FieldByName('Time').AsInteger;
     gsDate := FieldByName('Date').AsDateTime;
     gsDateTime := CalcDateTime(gsTime,gsDate);
     if gsDateTime >= EndDateTime then StopFlag := True;
    end;
    BlockEndRec := RecNo;
    EndBlockDateLabel.Caption := DateToStr(gsDateTime)+ ' ' + TimeToStr(gsDateTime);
    VerifyBlock;
    OperationPane.Caption := '';
    OperationProgressPane.Visible := False;
    geData.geTable.First;
    geData.geTable.MoveBy(BlockBeginRec-1);
    EnableControls;
   end;
  end;
end;

{ Снятие блока редактирования }
procedure TMainForm.EditBlockUnsetExecute(Sender: TObject);
begin
  BlockBeginRec := -1;
  BlockEndRec := -1;
  BeginBlockDateLabel.Caption := '';
  EndBlockDateLabel.Caption := '';
  BlockDisabledExecute(Self);
end;

{ Проверка корректности блока }
procedure TMainForm.VerifyBlock;
var
  aFlag: Boolean;
begin
  aFlag := True;
  if BlockBeginRec < 0 then aFlag := False;
  if BlockEndRec < 0 then aFlag := False;
  if BlockBeginRec = BlockEndRec then aFlag := False;
  if aFlag then BlockEnableExecute(Self)
           else BlockDisabledExecute(Self);
end;

{ Cобытие - Блок не задан }
procedure TMainForm.BlockDisabledExecute(Sender: TObject);
begin
  SetBlockFlag := False;
  EditFill.Enabled := False;
  EditCorrection.Enabled := False;
  EditPlusMinus.Enabled := False;
  EditCutting.Enabled := False;
  EditGlide.Enabled := False;
  ServiceSaveData.Enabled := False;
  ServiceLoadData.Enabled := False;
  ServiceExportData.Enabled := False;
  EditExpandTalblock.Enabled := False;
end;

{ Событие - Блок задан }
procedure TMainForm.BlockEnableExecute(Sender: TObject);
begin
  SetBlockFlag := True;
  EditFill.Enabled := True;
  EditCorrection.Enabled := True;
  EditPlusMinus.Enabled := True;
  EditCutting.Enabled := True;
  EditGlide.Enabled := True;
  ServiceSaveData.Enabled := True;
  ServiceLoadData.Enabled := True;
  ServiceExportData.Enabled := True;
  EditExpandTalblock.Enabled := True;
end;

{ Коррекция блока }
procedure TMainForm.EditCorrectionExecute(Sender: TObject);
var
  StartValue, PumpCheckValue: Double;
  Direction, PumpCheck: Boolean;
begin
  CorrectionDlg.Left := MainForm.Left + MainForm.Width div 2 - CorrectionDlg.Width div 2;
  CorrectionDlg.Top := MainForm.Top + MainForm.Height div 2 - CorrectionDlg.Height div 2;
  geData.geQuery.First;
  geData.geQuery.MoveBy(BlockBeginRec-1);
  if CorrectionDlg.ShowModal = mrOk then
  try
   StartValue := s_StrToFloat(CorrectionDlg.StartValueEdit.Text);
   PumpCheck := CorrectionDlg.PumpCheck.Checked;
   if PumpCheck then PumpCheckValue := s_StrToFloat(CorrectionDlg.PumpCheckValueEdit.Text)
                else PumpCheckValue := 0;
   if BlockEndRec > BlockBeginRec then Direction := True else Direction := False;
   if CorrectionDlg.ParamCombo.ItemIndex = 0
     then EditCorrectionS101(StartValue,PumpCheckValue,Direction,PumpCheck)
     else EditCorrectionS102(StartValue,Direction);
  except
   Application.MessageBox('Ошибка выполнения операции', 'GeoEdit',mb_Ok + mb_IconExclamation);
   EditUndo.Enabled := False;
   UndoInfo.Flag := False;
  end;
end;

{ Коррекция параметра 'Глубина забоя' }
procedure TMainForm.EditCorrectionS101(StartValue, PumpCheckValue: Double; Direction, PumpCheck: Boolean);
var
  Depth, OldTalblock, UndoValue : Double;
  ZeroFlag : Boolean;
  UndoFile: File of Double;
begin
  Depth := StartValue;
  OldTalblock := geData.geQuery.FieldByName('S103').AsFloat;
  ZeroFlag := False;
  OperationPane.Caption := 'Коррекция';
  OperationProgressPane.PartsComplete := 0;
  OperationProgressPane.TotalParts := Abs(BlockEndRec-BlockBeginRec);
  OperationProgressPane.Visible := True;
  AssignFile(UndoFile, MainDir+'\bin\Undo.ged');
  Rewrite(UndoFile);
  with geData do
  begin
   while geQuery.RecNo <> BlockEndRec do
   begin
    UndoValue := geQuery.FieldByName('S101').AsFloat;
    Write(UndoFile,UndoValue);
    if geQuery.FieldByName('S102').AsFloat =0 then
    begin
     if (ZeroFlag = False) then
     if (PumpCheck and (geQuery.FieldByName('S300').AsFloat > PumpCheckValue)) or
        (not PumpCheck) then Depth := Depth+(OldTalblock-geQuery.FieldByName('S103').AsFloat);
     geQuery.Edit;
     geQuery.FieldByName('S101').AsFloat := Depth;
     OldTalblock := geQuery.FieldByName('S103').AsFloat;
     ZeroFlag := False;
    end
    else
    begin
     geQuery.Edit;
     geQuery.FieldByName('S101').AsFloat := Depth;
     OldTalblock := geQuery.FieldByName('S103').AsFloat;
     ZeroFlag := True;
    end;
    if geQuery.FieldByName('D101').AsString ='E' then geQuery.FieldByName('D101').AsString := 'O';
    if Direction = True then geQuery.Next else geQuery.Prior;
    OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
   end;
   UndoValue := geQuery.FieldByName('S101').AsFloat;
   Write(UndoFile,UndoValue);
   if geQuery.FieldByName('S102').AsFloat =0 then
   begin
    if (ZeroFlag = False) then
    if (PumpCheck and (geQuery.FieldByName('S300').AsFloat > PumpCheckValue)) or
       (not PumpCheck) then Depth := Depth+(OldTalblock-geQuery.FieldByName('S103').AsFloat);
    geQuery.Edit;
    geQuery.FieldByName('S101').AsFloat := Depth;
   end
   else
   begin
    geQuery.Edit;
    geQuery.FieldByName('S101').AsFloat := Depth;
   end;
   if geQuery.FieldByName('D101').AsString ='E' then geQuery.FieldByName('D101').AsString := 'O';
   geQuery.Post;
   geQuery.Refresh;
   geTable.First;
   geTable.MoveBy(BlockEndRec-1);
  end;
  OperationPane.Caption := '';
  OperationProgressPane.Visible := False;
  CloseFile(UndoFile);
  UndoInfo.Flag := True;
  UndoInfo.FieldName := 'S101';
  UndoInfo.BlockBegin := BlockBeginRec;
  UndoInfo.BlockEnd := BlockEndRec;
  EditUndo.Enabled := True;
end;

{ Коррекция параметра 'Над забоем' }
procedure TMainForm.EditCorrectionS102(StartValue: Double; Direction: Boolean);
var
  AboveADepth, OldTalblock, StepTalblock, UndoValue : Double;
  UndoFile: File of Double;
begin
  AboveADepth := StartValue;
  OldTalblock := geData.geQuery.FieldByName('S103').AsFloat;
  OperationPane.Caption := 'Коррекция';
  OperationProgressPane.PartsComplete := 0;
  OperationProgressPane.TotalParts := Abs(BlockEndRec-BlockBeginRec);
  OperationProgressPane.Visible := True;
  AssignFile(UndoFile, MainDir+'\bin\Undo.ged');
  Rewrite(UndoFile);
  with geData do
  begin
   while geQuery.RecNo <> BlockEndRec do
   begin
     UndoValue := geQuery.FieldByName('S102').AsFloat;
     Write(UndoFile,UndoValue);
     StepTalblock := geQuery.FieldByName('S103').AsFloat-OldTalblock;
     AboveADepth := AboveADepth+StepTalblock;
     if AboveADepth < 0 then AboveADepth := 0;
     geQuery.Edit;
     geQuery.FieldByName('S102').AsFloat := AboveADepth;
     if geQuery.FieldByName('D102').AsString = 'E' then geQuery.FieldByName('D102').AsString := 'O';
     OldTalBlock := geQuery.FieldByName('S103').AsFloat;
     if Direction = True then geQuery.Next else geQuery.Prior;
     OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
   end;
   UndoValue := geQuery.FieldByName('S102').AsFloat;
   Write(UndoFile,UndoValue);
   StepTalblock := geQuery.FieldByName('S103').AsFloat-OldTalblock;
   AboveADepth := AboveADepth+StepTalblock;
   if AboveADepth < 0 then AboveADepth := 0;
   geQuery.Edit;
   geQuery.FieldByName('S102').AsFloat := AboveADepth;
   if geQuery.FieldByName('D102').AsString = 'E' then geQuery.FieldByName('D102').AsString := 'O';
   geQuery.Post;
   geQuery.Refresh;
   geTable.First;
   geTable.MoveBy(BlockEndRec-1);
  end;
  OperationPane.Caption := '';
  OperationProgressPane.Visible := False;
  CloseFile(UndoFile);
  UndoInfo.Flag := True;
  UndoInfo.FieldName := 'S102';
  UndoInfo.BlockBegin := BlockBeginRec;
  UndoInfo.BlockEnd := BlockEndRec;
  EditUndo.Enabled := True;
end;

{ Заполнение блока }
procedure TMainForm.EditFillExecute(Sender: TObject);
var
  BeginValue, EndValue, Value, Delta, Quant, SimAmp, SimValue, SimDeltaPlus,
  SimDeltaMinus, SimDelta, UndoValue, CheckFieldValue: Double;
  EditField, StatusField, TemplateField, StrValue, CheckField: String;
  Direction, CheckValidFlag: Boolean;
  Indx, SimPer, Indx1, MultiCount : Integer;
  MultiValues : array of TGsParam;
  CheckedValues : array of Integer;
  UndoFile: File of Double;
begin
  FillDlg.Left := MainForm.Left + MainForm.Width div 2 - FillDlg.Width div 2;
  FillDlg.Top := MainForm.Top + MainForm.Height div 2 - FillDlg.Height div 2;
  FillDlg.InputValue := geGrid.SelectedField.AsFloat;
  if FillDlg.ShowModal = mrOk then
  try
   EditField := geGrid.Columns.Items[FillDlg.ParamCombo.ItemIndex].FieldName;
   if EditField = 'S101' then
    if Application.MessageBox('Изменение поля "Забой". Подтверждаете операцию?', 'GeoEdit',mb_YesNo + mb_IconExclamation) = IDNo then raise Exception.Create('');
   StatusField := EditField;
   Delete(StatusField,1,1);
   StatusField := 'D'+StatusField;
   if BlockEndRec > BlockBeginRec then Direction := True else Direction := False;
   OperationPane.Caption := 'Заполнение';
   OperationProgressPane.PartsComplete := 0;
   OperationProgressPane.TotalParts := Abs(BlockEndRec-BlockBeginRec);
   OperationProgressPane.Visible := True;
   AssignFile(UndoFile, MainDir+'\bin\Undo.ged');
   Rewrite(UndoFile);
   {-- Параметры уставки ------------------------------------------------------}
   if FillDlg.UseFlagsCheck.Checked then
   begin
     CheckField := geGrid.Columns.Items[FillDlg.FlagsParamCombo.ItemIndex].FieldName;
     CheckFieldValue := s_StrToFloat(FillDlg.FlagsValueEdit.Text);
   end
   else
   begin
     CheckField := '';
     CheckFieldValue := 0;
   end;
   {---------------------------------------------------------------------------}
   case FillDlg.FillTypeRadioGroup.ItemIndex of
    0: begin { Прямое заполнение ----------------------------------------------}
        BeginValue := s_StrToFloat(FillDlg.DirectBeginValueEdit.Text);
        if FillDlg.DirectEndValueEdit.Text <> ''
         then EndValue := s_StrToFloat(FillDlg.DirectEndValueEdit.Text)
         else EndValue := BeginValue;
        Delta := (EndValue - BeginValue)/Abs(BlockEndRec-BlockBeginRec);
        with geData do
        begin
         geQuery.First;
         geQuery.MoveBy(BlockBeginRec-1);
         Indx := 0;
         while geQuery.RecNo <> BlockEndRec do
         begin
          UndoValue := geQuery.FieldByName(EditField).AsFloat;
          Write(UndoFile,UndoValue);
          Value := BeginValue + Indx*Delta;

          if (not FillDlg.UseFlagsCheck.Checked)
           then CheckValidFlag := True           // Если без уставки
           else CheckValidFlag := CheckFlags(geQuery.FieldByName(CheckField).AsFloat,
                         CheckFieldValue, FillDlg.FlagsOperandCombo.ItemIndex);
                         //или уставка есть и она валидна, то заполняем
         if CheckValidFlag then
          begin
            geQuery.Edit;
            geQuery.FieldByName(EditField).AsFloat := Value;
            if geQuery.FieldByName(StatusField).AsString = 'E'
              then geQuery.FieldByName(StatusField).AsString := 'O';
            ReCalcParams(EditField, Value);
          end;

          if Direction = True then geQuery.Next else geQuery.Prior;
          OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
          Inc(Indx);
         end;
         UndoValue := geQuery.FieldByName(EditField).AsFloat;
         Write(UndoFile,UndoValue);
         Value := BeginValue + Indx*Delta;
         if (not FillDlg.UseFlagsCheck.Checked)
           then CheckValidFlag := True           // Если без уставки
           else CheckValidFlag := CheckFlags(geQuery.FieldByName(CheckField).AsFloat,
                         CheckFieldValue, FillDlg.FlagsOperandCombo.ItemIndex);
                         //или уставка есть и она валидна, то заполняем
         if CheckValidFlag then
         begin
           geQuery.Edit;
           geQuery.FieldByName(EditField).AsFloat := Value;
           if geQuery.FieldByName(StatusField).AsString = 'E'
              then geQuery.FieldByName(StatusField).AsString := 'O';
           ReCalcParams(EditField, Value);
           geQuery.Post;
         end;

         geQuery.Refresh;
         geTable.First;
         geTable.MoveBy(BlockEndRec-1);
        end;
        OperationPane.Caption := '';
        OperationProgressPane.Visible := False;
       end;
    1: begin { Заполнение с симуляцией ----------------------------------------}
        BeginValue := s_StrToFloat(FillDlg.SimulationBeginValueEdit.Text);
        if FillDlg.SimulationEndValueEdit.Text <> ''
         then EndValue := s_StrToFloat(FillDlg.SimulationEndValueEdit.Text)
         else EndValue := BeginValue;
        Delta := (EndValue - BeginValue)/Abs(BlockEndRec-BlockBeginRec);
        SimAmp := s_StrToFloat(FillDlg.SimAmpEdit.Text);
        SimPer := FillDlg.SimPerEdit.IntValue;
        with geData do
        begin
         geQuery.First;
         geQuery.MoveBy(BlockBeginRec-1);
         Indx := 0;
         Indx1 := 0;
         Quant := 0;
         Value := BeginValue;
         while geQuery.RecNo <> BlockEndRec do
         begin
          UndoValue := geQuery.FieldByName(EditField).AsFloat;
          Write(UndoFile,UndoValue);
          if (Indx1 = 0) then
          begin
           Randomize;
           SimDeltaPlus := (Random);
           SimDeltaminus := (Random);
           SimDelta := 1.5*SimAmp*SimDeltaPlus-1.5*SimAmp*SimDeltaMinus;
           SimValue := BeginValue + Delta*(Indx) + SimDelta;
           Quant := (SimValue - Value)/SimPer;
          end;
          Value := Value + Quant;
          StrValue := FloatToStr(Value);
          while (Length(StrValue) < 16) do StrValue := StrValue + IntToStr(Random(10));
          Value := s_StrToFloat(StrValue);

          if (not FillDlg.UseFlagsCheck.Checked)
           then CheckValidFlag := True           // Если без уставки
           else CheckValidFlag := CheckFlags(geQuery.FieldByName(CheckField).AsFloat,
                         CheckFieldValue, FillDlg.FlagsOperandCombo.ItemIndex);
                         //или уставка есть и она валидна, то заполняем
         if CheckValidFlag then
          begin
            geQuery.Edit;
            geQuery.FieldByName(EditField).AsFloat := Value;
            if geQuery.FieldByName(StatusField).AsString = 'E'
              then geQuery.FieldByName(StatusField).AsString := 'O';
            ReCalcParams(EditField, Value);
          end;

          if Direction = True then geQuery.Next else geQuery.Prior;
          OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
          if (Indx1 < SimPer) then Inc(Indx1) else Indx1 := 0;
          Inc(Indx);
         end;
         UndoValue := geQuery.FieldByName(EditField).AsFloat;
         Write(UndoFile,UndoValue);
         Value := EndValue;

         if (not FillDlg.UseFlagsCheck.Checked)
           then CheckValidFlag := True           // Если без уставки
           else CheckValidFlag := CheckFlags(geQuery.FieldByName(CheckField).AsFloat,
                         CheckFieldValue, FillDlg.FlagsOperandCombo.ItemIndex);
                         //или уставка есть и она валидна, то заполняем
         if CheckValidFlag then
         begin
           geQuery.Edit;
           geQuery.FieldByName(EditField).AsFloat := Value;
           if geQuery.FieldByName(StatusField).AsString = 'E' then geQuery.FieldByName(StatusField).AsString := 'O';
           ReCalcParams(EditField, Value);
           geQuery.Post;
         end;
         
         geQuery.Refresh;
         geTable.First;
         geTable.MoveBy(BlockEndRec-1);
        end;
        OperationPane.Caption := '';
        OperationProgressPane.Visible := False;
       end;
    2: begin { Заполнение по шаблону ------------------------------------------}
        TemplateField := geGrid.Columns.Items[FillDlg.TemplateParamCombo.ItemIndex].FieldName;
        if FillDlg.TemplateValueEdit.Text <> ''
         then BeginValue := s_StrToFloat(FillDlg.TemplateValueEdit.Text)
         else BeginValue := 0;
        if FillDlg.TemplateKEdit.Text <> ''
         then Delta := s_StrToFloat(FillDlg.TemplateKEdit.Text)
         else Delta := 1;
        with geData do
        begin
         geQuery.First;
         geQuery.MoveBy(BlockBeginRec-1);
         while geQuery.RecNo <> BlockEndRec do
         begin
          UndoValue := geQuery.FieldByName(EditField).AsFloat;
          Write(UndoFile,UndoValue);
          Value := BeginValue + geQuery.FieldByName(TemplateField).AsFloat*Delta;

          if (not FillDlg.UseFlagsCheck.Checked)
           then CheckValidFlag := True           // Если без уставки
           else CheckValidFlag := CheckFlags(geQuery.FieldByName(CheckField).AsFloat,
                         CheckFieldValue, FillDlg.FlagsOperandCombo.ItemIndex);
                         //или уставка есть и она валидна, то заполняем
          if CheckValidFlag then
          begin
           geQuery.Edit;
           geQuery.FieldByName(EditField).AsFloat := Value;
           if geQuery.FieldByName(StatusField).AsString = 'E' then geQuery.FieldByName(StatusField).AsString := 'O';
           ReCalcParams(EditField, Value);
          end;
          if Direction = True then geQuery.Next else geQuery.Prior;
          OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
         end;
         UndoValue := geQuery.FieldByName(EditField).AsFloat;
         Write(UndoFile,UndoValue);
         Value := BeginValue + geQuery.FieldByName(TemplateField).AsFloat*Delta;
         if (not FillDlg.UseFlagsCheck.Checked)
           then CheckValidFlag := True           // Если без уставки
           else CheckValidFlag := CheckFlags(geQuery.FieldByName(CheckField).AsFloat,
                         CheckFieldValue, FillDlg.FlagsOperandCombo.ItemIndex);
                         //или уставка есть и она валидна, то заполняем
         if CheckValidFlag then
         begin
          geQuery.Edit;
          geQuery.FieldByName(EditField).AsFloat := Value;
          if geQuery.FieldByName(StatusField).AsString = 'E' then geQuery.FieldByName(StatusField).AsString := 'O';
          ReCalcParams(EditField, Value);
          geQuery.Post;
         end;

         geQuery.Refresh;
         geTable.First;
         geTable.MoveBy(BlockEndRec-1);
        end;
        OperationPane.Caption := '';
        OperationProgressPane.Visible := False;
       end;
    3: try { Заполнение мультипликацией -------------------------------------}
        SetLength(MultiValues,FillDlg.AgregateParamsList.ItemsChecked);
        SetLength(CheckedValues,FillDlg.AgregateParamsList.ItemsChecked);
        MultiCount := FillDlg.TypeAgrCombo.ItemIndex;
        Indx1 := 0;
        for Indx := 0 to FillDlg.AgregateParamsList.Items.Count-1 do
        begin
         if FillDlg.AgregateParamsList.ItemChecked[Indx] then
         begin
          CheckedValues[Indx1] := Indx;
          Inc(Indx1);
         end;
        end;
        for Indx := 0 to Length(CheckedValues) - 1 do
         MultiValues[Indx].FieldName := geGrid.Columns.Items[CheckedValues[Indx]].FieldName;
        with geData do
        begin
         geQuery.First;
         geQuery.MoveBy(BlockBeginRec-1);
         for Indx := 0 to Length(CheckedValues) - 1 do
           MultiValues[Indx].BeginValue := geQuery.FieldByName(MultiValues[Indx].FieldName).AsFloat;
         BeginValue := geQuery.FieldByName(EditField).AsFloat;
         while geQuery.RecNo <> BlockEndRec do
         begin
          UndoValue := geQuery.FieldByName(EditField).AsFloat;
          Write(UndoFile,UndoValue);
          Value := 0;
          case MultiCount of
           0:begin { Среднее арифметическое - Начало}
              Value := 0;
              for Indx := 0 to Length(CheckedValues) - 1 do
                Value := Value + geQuery.FieldByName(MultiValues[Indx].FieldName).AsFloat;
              Value := Value/Length(CheckedValues);
           end;    { Среднее арифметическое - Конец }
           1:begin { Дельта Плюс - Начало }
              Delta := 0;
              for Indx := 0 to Length(CheckedValues) - 1 do
              begin
               MultiValues[Indx].DefValue := geQuery.FieldByName(MultiValues[Indx].FieldName).AsFloat;
               Delta := Delta + (MultiValues[Indx].DefValue - MultiValues[Indx].BeginValue);
              end;
              Value := BeginValue + Delta;
           end;    { Дельта Плюс - Конец }
          end;

          if (not FillDlg.UseFlagsCheck.Checked)
            then CheckValidFlag := True           // Если без уставки
            else CheckValidFlag := CheckFlags(geQuery.FieldByName(CheckField).AsFloat,
                          CheckFieldValue, FillDlg.FlagsOperandCombo.ItemIndex);
                          //или уставка есть и она валидна, то заполняем
          if CheckValidFlag then
          begin
           geQuery.Edit;
           geQuery.FieldByName(EditField).AsFloat := Value;
           if geQuery.FieldByName(StatusField).AsString = 'E' then geQuery.FieldByName(StatusField).AsString := 'O';
           ReCalcParams(EditField, Value);
          end;

          if Direction = True then geQuery.Next else geQuery.Prior;
          OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
         end;
         Value := 0;
         UndoValue := geQuery.FieldByName(EditField).AsFloat;
         Write(UndoFile,UndoValue);
         case MultiCount of
           0:begin { Среднее арифметическое - Начало}
              Value := 0;
              for Indx := 0 to Length(CheckedValues) - 1 do
                Value := Value + geQuery.FieldByName(MultiValues[Indx].FieldName).AsFloat;
              Value := Value/Length(CheckedValues);
           end;    { Среднее арифметическое - Конец }
           1:begin { Дельта Плюс - Начало }
              Delta := 0;
              for Indx := 0 to Length(CheckedValues) - 1 do
              begin
               MultiValues[Indx].DefValue := geQuery.FieldByName(MultiValues[Indx].FieldName).AsFloat;
               Delta := Delta + (MultiValues[Indx].DefValue - MultiValues[Indx].BeginValue);
              end;
              Value := geQuery.FieldByName(EditField).AsFloat + Delta;
           end;    { Дельта Плюс - Конец }
         end;

         if (not FillDlg.UseFlagsCheck.Checked)
           then CheckValidFlag := True           // Если без уставки
           else CheckValidFlag := CheckFlags(geQuery.FieldByName(CheckField).AsFloat,
                         CheckFieldValue, FillDlg.FlagsOperandCombo.ItemIndex);
                         //или уставка есть и она валидна, то заполняем
         if CheckValidFlag then
         begin
          geQuery.Edit;
          geQuery.FieldByName(EditField).AsFloat := Value;
          if geQuery.FieldByName(StatusField).AsString = 'E' then geQuery.FieldByName(StatusField).AsString := 'O';
          ReCalcParams(EditField, Value);
          geQuery.Post;
         end;
         geQuery.Refresh;
         geTable.First;
         geTable.MoveBy(BlockEndRec-1);
        end;
        OperationPane.Caption := '';
        OperationProgressPane.Visible := False;
       finally
        MultiValues := nil;
        CheckedValues := nil;
       end;
   end;
   LoadDataIntoChart(StartChartRec);
   CloseFile(UndoFile);
   UndoInfo.Flag := True;
   UndoInfo.FieldName := EditField;
   UndoInfo.BlockBegin := BlockBeginRec;
   UndoInfo.BlockEnd := BlockEndRec;
   EditUndo.Enabled := True;
  except
   geData.geQuery.Cancel;
   Application.MessageBox('Ошибка выполнения операции', 'GeoEdit',mb_Ok + mb_IconExclamation);
   EditUndo.Enabled := False;
   UndoInfo.Flag := False;
   CloseFile(UndoFile);
  end;
end;

{ Увеличение или уменьшение параметра в блоке }
procedure TMainForm.EditPlusMinusExecute(Sender: TObject);
var
  PlusMinusValue, Value: Double;
  EditField, StatusField: String;
  Direction: Boolean;
  UndoFile: File of Double;
begin
  PlusMinusDlg.Left := MainForm.Left + MainForm.Width div 2 - PlusMinusDlg.Width div 2;
  PlusMinusDlg.Top := MainForm.Top + MainForm.Height div 2 - PlusMinusDlg.Height div 2;
  if PlusMinusDlg.ShowModal = mrOk then
  try
   MainForm.Refresh;
   PlusMinusValue := s_StrToFloat(PlusMinusDlg.PlusMinusEdit.Text);
   EditField := geGrid.Columns.Items[PlusMinusDlg.ParamCombo.ItemIndex].FieldName;
   if EditField = 'S101' then
    if Application.MessageBox('Изменение поля "Забой". Подтверждаете операцию?', 'GeoEdit',mb_YesNo + mb_IconExclamation) = IDNo then raise Exception.Create('');
   StatusField := EditField;
   Delete(StatusField,1,1);
   StatusField := 'D'+StatusField;
   if BlockEndRec > BlockBeginRec then Direction := True else Direction := False;
   OperationPane.Caption := 'Увеличение/уменьшение';
   OperationProgressPane.PartsComplete := 0;
   OperationProgressPane.TotalParts := Abs(BlockEndRec-BlockBeginRec);
   OperationProgressPane.Visible := True;
   AssignFile(UndoFile, MainDir+'\bin\Undo.ged');
   Rewrite(UndoFile);
   with geData do
   begin
    geQuery.First;
    geQuery.MoveBy(BlockBeginRec-1);
    while geQuery.RecNo <> BlockEndRec do
    begin
     Value := geQuery.FieldByName(EditField).AsFloat;
     Write(UndoFile,Value);
     Value := Value + PlusMinusValue;
     geQuery.Edit;
     geQuery.FieldByName(EditField).AsFloat := Value;
     if geQuery.FieldByName(StatusField).AsString = 'E' then geQuery.FieldByName(StatusField).AsString := 'O';
     ReCalcParams(EditField, Value);
     if Direction = True then geQuery.Next else geQuery.Prior;
     OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
    end;
    Value := geQuery.FieldByName(EditField).AsFloat;
    Write(UndoFile,Value);
    Value := Value + PlusMinusValue;
    geQuery.Edit;
    geQuery.FieldByName(EditField).AsFloat := Value;
    if geQuery.FieldByName(StatusField).AsString = 'E' then geQuery.FieldByName(StatusField).AsString := 'O';
    ReCalcParams(EditField, Value);
    geQuery.Post;
    geQuery.Refresh;
    geTable.First;
    geTable.MoveBy(BlockEndRec-1);
   end;
   OperationPane.Caption := '';
   OperationProgressPane.Visible := False;
   LoadDataIntoChart(StartChartRec);
   CloseFile(UndoFile);
   UndoInfo.Flag := True;
   UndoInfo.FieldName := EditField;
   UndoInfo.BlockBegin := BlockBeginRec;
   UndoInfo.BlockEnd := BlockEndRec;
   EditUndo.Enabled := True;
  except
   geData.geQuery.Cancel;
   Application.MessageBox('Ошибка выполнения операции', 'GeoEdit',mb_Ok + mb_IconExclamation);
   EditUndo.Enabled := False;
   UndoInfo.Flag := False;
   CloseFile(UndoFile);
  end;
end;

{ Рихтовка }
procedure TMainForm.EditCuttingExecute(Sender: TObject);
var
  FillValue, Value, PrevValue, MaxChangeValue, DefValue1, DefValue2 : Double;
  StairDelta, NormValue, Delta, NormDelta, StepDelta: Double;
  EditField, StatusField: String;
  Direction, StairFlag, VErrorFlag, GlideCheck, StopFlag: Boolean;
  CutCount : Integer;
  UndoFile: File of Double;
begin
  CuttingDlg.Left := MainForm.Left + MainForm.Width div 2 - CuttingDlg.Width div 2;
  CuttingDlg.Top := MainForm.Top + MainForm.Height div 2 - CuttingDlg.Height div 2;
  if CuttingDlg.ShowModal = mrOk then
  try
   MainForm.Refresh;
   EditField := geGrid.Columns.Items[CuttingDlg.ParamCombo.ItemIndex].FieldName;
   if EditField = 'S101' then
   begin
    Application.MessageBox('Нельзя рихтовать поле "Забой".', 'GeoEdit', mb_Ok + mb_IconStop);
    raise Exception.Create('');
   end;
   StatusField := EditField;
   Delete(StatusField,1,1);
   StatusField := 'D'+StatusField;
   if BlockEndRec > BlockBeginRec then Direction := True else Direction := False;
   OperationPane.Caption := 'Рихтовка';
   OperationProgressPane.PartsComplete := 0;
   OperationProgressPane.TotalParts := Abs(BlockEndRec-BlockBeginRec);
   OperationProgressPane.Visible := True;
   with geData do
   begin
    geQuery.First;
    geQuery.MoveBy(BlockBeginRec-1);
    PrevValue := geQuery.FieldByName(EditField).AsFloat;
    MaxChangeValue := Abs(s_StrToFloat(CuttingDlg.NormalChangeEdit.Text));
    GlideCheck := CuttingDlg.GlideCheck.Checked;
    AssignFile(UndoFile, MainDir+'\bin\Undo.ged');
    Rewrite(UndoFile);
    case CuttingDlg.DefectRadio.ItemIndex of
    0: while geQuery.RecNo <> BlockEndRec do {----------Отрицательные значения-}
       begin
        Value := geQuery.FieldByName(EditField).AsFloat;
        Write(UndoFile,Value);
        if Value < 0 then Value := 0;
        geQuery.Edit;
        geQuery.FieldByName(EditField).AsFloat := Value;
        ReCalcParams(EditField, Value);
        if Direction = True then geQuery.Next else geQuery.Prior;
        OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
       end; {-------------------------------------Отрицательные значения-конец-}
    1: begin {--------------------------------------------------------Просечки-}
        OperationPane.Caption := 'Нормализация';
        OperationProgressPane.PartsComplete := 0;
        while geQuery.RecNo <> BlockEndRec do {-------------------Убираем сбои-}
        begin
         Value := geQuery.FieldByName(EditField).AsFloat;
         Write(UndoFile,Value);
         if geQuery.FieldByName(StatusField).AsString = 'E' then
         begin
          Value := PrevValue;
          geQuery.Edit;
          geQuery.FieldByName(EditField).AsFloat := Value;
          geQuery.FieldByName(StatusField).AsString := 'O';
          ReCalcParams(EditField, Value);
         end;
         if Direction = True then geQuery.Next else geQuery.Prior;
         OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
         PrevValue := Value;
        end;
        geQuery.First;            { -------------------------------- Рихтуем - }
        geQuery.MoveBy(BlockBeginRec-1);
        PrevValue := geQuery.FieldByName(EditField).AsFloat;
        NormDelta := MaxChangeValue;
        if Direction = True then geQuery.Next else geQuery.Prior;
        OperationPane.Caption := 'Рихтовка';
        OperationProgressPane.PartsComplete := 0;
//
// Блок кода в работе ----------------------------------------------------------
//
        StopFlag := False;
        while not StopFlag do
        begin
         Value := geQuery.FieldByName(EditField).AsFloat;
         if (Abs(PrevValue - Value) > NormDelta) then
         begin      // если превышение NormDelta
          VErrorFlag := True;    // Поднимаем флаг ошибки
          CutCount := 0;         // обнуляем счетчик сбойных записей
          DefValue1 := PrevValue; // Для страховки присваиваем начальное
          DefValue2 := PrevValue; // нормальное значение

    {      ShowMessage('RecNo = ' + IntToStr(geQuery.RecNo));  }

          while VErrorFlag do
          begin
           Inc(CutCount);
           if Direction = True then geQuery.Next else geQuery.Prior;
           DefValue1 := Value;
           Value := geQuery.FieldByName(EditField).AsFloat;
           if (Abs(DefValue1 - Value) <= NormDelta) then   // если следующее
           begin                                           // в норме
            Inc(CutCount);
            if Direction = True then geQuery.Next else geQuery.Prior;
            DefValue2 := Value;
            Value := geQuery.FieldByName(EditField).AsFloat;  // проверяем еще одно
            if (Abs(DefValue2 - Value) <= NormDelta) then   // если второе изменение
            begin                                           // тоже в норме
             if Direction = True then geQuery.Next else geQuery.Prior;
             DefValue1 := Value;                          // проверяем третье
             Value := geQuery.FieldByName(EditField).AsFloat;
             if Direction = True then geQuery.Prior else geQuery.Next;
             if (Abs(DefValue1 - Value) <= NormDelta) then VErrorFlag := False;
             // если третье тоже в пределах допустимого, тосбрасываем флаг ошибки
            end;
           end;
          end;
          StepDelta := (DefValue2 - PrevValue)/(CutCount);  // шаг изменения
          if Direction = True then geQuery.MoveBy(-CutCount) // осткок на начало
                              else geQuery.MoveBy(CutCount);  // сбоя
          Value := PrevValue;

       {   ShowMessage('RecNo = ' + IntToStr(geQuery.RecNo) + #13 +
                      'Begin = ' + FloatToStr(PrevValue) + #13 +
                      'End = ' + FloatToStr(DefValue1) + #13 +
                      'Step = ' + FloatToStr(StepDelta));   }
                                           // стартуем с
          while CutCount > 0 do                               // последнего нормального
          begin
           Value := Value + StepDelta;
           geQuery.Edit;
           geQuery.FieldByName(EditField).AsFloat := Value;
           ReCalcParams(EditField, Value);
           if Direction = True then geQuery.Next else geQuery.Prior;
           OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
           Dec(CutCount);
          end;
          PrevValue := Value;                 // После устранения сбоя
         end                                  // нормальное предыдущее значение
         else PrevValue := Value;
         if Direction = True then geQuery.Next else geQuery.Prior;
         OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
         { Проверка достижения конца блока ----------------------------------- }
         if Direction and ((geQuery.RecNo >= BlockEndRec) or geQuery.Eof) then StopFlag := True;
         if (not Direction) and ((geQuery.RecNo <= BlockEndRec) or geQuery.Bof) then StopFlag := True;
        end; {---------------------------------------------------Просечки-конец-}
//
// ----------------------------------------------------------------------------
//
       end;
    2: begin {--------------------------------------------------------Лестницы-}
        OperationPane.Caption := 'Нормализация';
        OperationProgressPane.PartsComplete := 0;
        while geQuery.RecNo <> BlockEndRec do {-------------------Убираем сбои-}
        begin
         Value := geQuery.FieldByName(EditField).AsFloat;
         Write(UndoFile,Value);
         if geQuery.FieldByName(StatusField).AsString = 'E' then
         begin
          Value := PrevValue;
          geQuery.Edit;
          geQuery.FieldByName(EditField).AsFloat := Value;
          geQuery.FieldByName(StatusField).AsString := 'O';
          ReCalcParams(EditField, Value);
         end;
         if Direction = True then geQuery.Next else geQuery.Prior;
         OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
         PrevValue := Value;
        end;
        geQuery.First;
        geQuery.MoveBy(BlockBeginRec-1);
        PrevValue := geQuery.FieldByName(EditField).AsFloat;
        NormValue := PrevValue;
        FillValue := PrevValue;
        if Direction = True then geQuery.Next else geQuery.Prior;
        OperationPane.Caption := 'Рихтовка';
        OperationProgressPane.PartsComplete := 0;
        StairFlag := False;
        VErrorFlag := False;
        StairDelta := 0;
        while geQuery.RecNo <> BlockEndRec do {----------------Убираем ступени-}
        begin
         Value := geQuery.FieldByName(EditField).AsFloat;
         Delta := Abs(Value - PrevValue);
         if VErrorFlag and (Delta <= (MaxChangeValue)) then
         begin
          StairFlag := True;
          StairDelta := Value - NormValue;
         end;
         if Abs(StairDelta) <= (MaxChangeValue)  then
         begin
          StairFlag := False;
          StairDelta := 0;
         end;
         if (Delta > (MaxChangeValue)) then VErrorFlag := True
                                       else VErrorFlag := False;
/////
         if VErrorFlag and (not StairFlag) then  FillValue := NormValue;        { если скачок не на ступени }
         if (not VErrorFlag) and StairFlag then FillValue := Value - StairDelta;{ если нет скачка на ступени }
         if VErrorFlag and StairFlag then FillValue := NormValue;               { если скачок на ступени }
         if (not VErrorFlag) and (not StairFlag) then FillValue := Value;       { если нет ступени и нет скачка - возврат на нормаль}
/////
         geQuery.Edit;
         geQuery.FieldByName(EditField).AsFloat := FillValue;
         ReCalcParams(EditField, FillValue);
         if Direction = True then geQuery.Next else geQuery.Prior;
         OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
         NormValue := FillValue;
         PrevValue := Value;
        end;
       end; {----------------------------------------------------Лестницы-конец}
    end;
    geQuery.Refresh;
    geTable.First;
    geTable.MoveBy(BlockEndRec-1);
   end;
   OperationPane.Caption := '';
   OperationProgressPane.Visible := False;
   LoadDataIntoChart(StartChartRec);
   CloseFile(UndoFile);
   UndoInfo.Flag := True;
   UndoInfo.FieldName := EditField;
   UndoInfo.BlockBegin := BlockBeginRec;
   UndoInfo.BlockEnd := BlockEndRec;
   EditUndo.Enabled := True;
   if GlideCheck then Gliding(False);
  except
   geData.geQuery.Cancel;
   Application.MessageBox('Ошибка выполнения операции', 'GeoEdit',mb_Ok + mb_IconExclamation);
   EditUndo.Enabled := False;
   UndoInfo.Flag := False;
   CloseFile(UndoFile);
  end;
end;

{ Процедура сглаживания кривой }
procedure TMainForm.Gliding(RewriteUndo: Boolean);
var
  EditField, StatusField: String;
  Direction: Boolean;
  geValue, iSum: Double;
  Indx, DefRecNo, iRecNo, kGlide: Integer;
  UndoFile : File of Double;
begin
  GlideDlg.Left := MainForm.Left + MainForm.Width div 2 - GlideDlg.Width div 2;
  GlideDlg.Top := MainForm.Top + MainForm.Height div 2 - GlideDlg.Height div 2;
  if GlideDlg.ShowModal = mrOk then
  try
   MainForm.Refresh;
   if EditField = 'S101' then
   begin
    Application.MessageBox('Нельзя сглаживать поле "Забой".', 'GeoEdit', mb_Ok + mb_IconStop);
    raise Exception.Create('');
   end;
   kGlide := GlideDlg.KoefGlideEdit.IntValue;
   EditField := geGrid.Columns.Items[GlideDlg.ParamCombo.ItemIndex].FieldName;
   StatusField := EditField;
   Delete(StatusField,1,1);
   StatusField := 'D'+StatusField;
   if BlockEndRec > BlockBeginRec then Direction := True else Direction := False;
   OperationPane.Caption := 'Сглаживание';
   OperationProgressPane.PartsComplete := 0;
   OperationProgressPane.TotalParts := Abs(BlockEndRec-BlockBeginRec);
   OperationProgressPane.Visible := True;
   if RewriteUndo then
   begin
     AssignFile(UndoFile, MainDir+'\bin\Undo.ged');
     Rewrite(UndoFile);
   end;
//----------------------------------------------------------------------------//
//                             Сглаживание                                    //
   with geData do
   begin
    geQuery.First;
    geQuery.MoveBy(BlockBeginRec-1);
    iSum := 0;
    while geQuery.RecNo <> BlockEndRec do
    begin
     DefRecNo := geQuery.RecNo;
     geValue := geQuery.FieldByName(EditField).AsFloat;
     if RewriteUndo then Write(UndoFile, geValue);    // <- Запись в файл отката
     iSum := iSum + geValue;
     for Indx := 1 to kGlide do
     begin
      if Direction then
       begin
        iRecNo := geQuery.RecNo;
        if BlockBeginRec < iRecNo then geQuery.Prior;
       end
       else
       begin
        iRecNo := geQuery.RecNo;
        if BlockBeginRec > iRecNo then geQuery.Next;
       end;
      geValue := geQuery.FieldByName(EditField).AsFloat;
      iSum := iSum + geValue;
     end;
     if Direction then geQuery.MoveBy(DefRecNo-geQuery.RecNo)
                  else geQuery.MoveBy(geQuery.RecNo-DefRecNo);
     for Indx := 1 to kGlide do
     begin
      if Direction then
      begin
       iRecNo := geQuery.RecNo;
       if BlockEndRec > iRecNo then geQuery.Next;
      end
      else
      begin
       iRecNo := geQuery.RecNo;
       if BlockEndRec < iRecNo then geQuery.Prior;
      end;
      geValue := geQuery.FieldByName(EditField).AsFloat;
      iSum := iSum + geValue;
     end;
     iRecNo := geQuery.RecNo;
     geQuery.MoveBy(DefRecNo-iRecNo);
     geValue := iSum/(2*kGlide+1);
     geQuery.Edit;
     geQuery.FieldByName(EditField).AsFloat := geValue;
     if geQuery.FieldByName(StatusField).AsString = 'E' then geQuery.FieldByName(StatusField).AsString := 'O';
     ReCalcParams(EditField, geValue);
     iSum := 0;
     if Direction = True then geQuery.Next else geQuery.Prior;
     OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
    end;
   end;
//----------------------------------------------------------------------------//
   LoadDataIntoChart(StartChartRec);
   if RewriteUndo then
   begin
    CloseFile(UndoFile);
    UndoInfo.Flag := True;
    UndoInfo.FieldName := EditField;
    UndoInfo.BlockBegin := BlockBeginRec;
    UndoInfo.BlockEnd := BlockEndRec;
    EditUndo.Enabled := True;
   end;
  except
   geData.geQuery.Cancel;
   Application.MessageBox('Ошибка выполнения операции', 'GeoEdit',mb_Ok + mb_IconExclamation);
   if RewriteUndo then
   begin
    EditUndo.Enabled := False;
    UndoInfo.Flag := False;
    CloseFile(UndoFile);
   end;
  end;
  OperationPane.Caption := '';
  OperationProgressPane.Visible := False;
end;

{ Сглаживание  }
procedure TMainForm.EditGlideExecute(Sender: TObject);
begin
   Gliding(True);
end;

{ Растяжка/сжатие Тальблока }
procedure TMainForm.EditExpandTalblockExecute(Sender: TObject);
var
  BeginValue, Value, ExpandK, PrevValue, NewValue, Delta : Double;
  Direction : Boolean;
  UndoFile : File of Double;
begin
  ExpandTalblockDlg.Left := MainForm.Left + MainForm.Width div 2 - ExpandTalblockDlg.Width div 2;
  ExpandTalblockDlg.Top := MainForm.Top + MainForm.Height div 2 - ExpandTalblockDlg.Height div 2;
  geData.geQuery.First;
  geData.geQuery.MoveBy(BlockEndRec-1);
  Value := geData.geQuery.FieldByName('S103').AsFloat;
  geData.geQuery.First;
  geData.geQuery.MoveBy(BlockBeginRec-1);
  BeginValue := geData.geQuery.FieldByName('S103').AsFloat;
  ExpandTalblockDlg.BeginValueEdit.Text := FloatToStr(BeginValue);
  ExpandTalblockDlg.RealDeltaEdit.Text := FloatToStr(Abs(Value-BeginValue));
  ExpandTalblockDlg.EtalonDeltaEdit.Text := FloatToStr(Abs(Value-BeginValue));
  if ExpandTalblockDlg.ShowModal = mrOk then
  try
   MainForm.Refresh;
   NewValue := s_StrToFloat(ExpandTalblockDlg.BeginValueEdit.Text);
   ExpandK := s_StrToFloat(ExpandTalblockDlg.EtalonDeltaEdit.Text)/
              s_StrToFloat(ExpandTalblockDlg.RealDeltaEdit.Text);
   if BlockEndRec > BlockBeginRec then Direction := True else Direction := False;
   OperationPane.Caption := 'Растяжка/сжатие Тальблока';
   OperationProgressPane.PartsComplete := 0;
   OperationProgressPane.TotalParts := Abs(BlockEndRec-BlockBeginRec);
   OperationProgressPane.Visible := True;
   AssignFile(UndoFile, MainDir+'\bin\Undo.ged');
   Rewrite(UndoFile);
   with geData do
   begin
    geQuery.First;
    geQuery.MoveBy(BlockBeginRec-1);
    PrevValue := geQuery.FieldByName('S103').AsFloat;
    while geQuery.RecNo <> BlockEndRec do
    begin
     Value := geQuery.FieldByName('S103').AsFloat;
     Write(UndoFile,Value);
     Delta := ExpandK*(Value - PrevValue);
     NewValue := NewValue + Delta;
     geQuery.Edit;
     geQuery.FieldByName('S103').AsFloat := NewValue;
     PrevValue := Value;
     if Direction = True then geQuery.Next else geQuery.Prior;
     OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
    end;
    Value := geQuery.FieldByName('S103').AsFloat;
    Write(UndoFile,Value);
    Delta := ExpandK*(Value - PrevValue);
    NewValue := NewValue + Delta;
    geQuery.Edit;
    geQuery.FieldByName('S103').AsFloat := NewValue;
   end;
   geData.geTable.First;
   geData.geTable.MoveBy(BlockBeginRec-1);
   LoadDataIntoChart(StartChartRec);
   CloseFile(UndoFile);
   UndoInfo.Flag := True;
   UndoInfo.FieldName := 'S103';
   UndoInfo.BlockBegin := BlockBeginRec;
   UndoInfo.BlockEnd := BlockEndRec;
   EditUndo.Enabled := True;
  except
   geData.geQuery.Cancel;
   Application.MessageBox('Ошибка выполнения операции', 'GeoEdit',mb_Ok + mb_IconExclamation);
   EditUndo.Enabled := False;
   UndoInfo.Flag := False;
   CloseFile(UndoFile);
  end;
  OperationPane.Caption := '';
  OperationProgressPane.Visible := False;
end;

{ Откат }
procedure TMainForm.EditUndoExecute(Sender: TObject);
var
  UndoFile: File of Double;
  StartRec, FinishRec: Longint;
  EditField: String;
  Value: Double;
begin
  if UndoInfo.Flag then
   try
    AssignFile(UndoFile, MainDir+'\bin\Undo.ged');
    Reset(UndoFile);
    EditField := UndoInfo.FieldName;
///
    if UndoInfo.BlockEnd > UndoInfo.BlockBegin then
    begin
     StartRec := UndoInfo.BlockBegin;
     FinishRec := UndoInfo.BlockEnd;
    end
    else
    begin
     StartRec := UndoInfo.BlockEnd;
     FinishRec := UndoInfo.BlockBegin;
    end;
    OperationPane.Caption := 'Откат';
    OperationProgressPane.PartsComplete := 0;
    OperationProgressPane.TotalParts := Abs(UndoInfo.BlockEnd-UndoInfo.BlockBegin);
    OperationProgressPane.Visible := True;
    with geData do
    begin
     geQuery.First;
     geQuery.MoveBy(StartRec-1);
     while ((geQuery.RecNo <> FinishRec) and (not EoF(UndoFile))) do
     begin
      Read(UndoFile, Value);
      geQuery.Edit;
      geQuery.FieldByName(EditField).AsFloat := Value;
      ReCalcParams(EditField, Value);
      geQuery.Next;
      OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
     end;
     if (not EoF(UndoFile)) then
     begin
      Read(UndoFile, Value);
      geQuery.Edit;
      geQuery.FieldByName(EditField).AsFloat := Value;
      ReCalcParams(EditField, Value);
      geQuery.Post;
     end;
     geQuery.Refresh;
    end;
    LoadDataIntoChart(StartChartRec);
 ///
   except
    geData.geQuery.Cancel;
    Application.MessageBox('Ошибка выполнения операции. Откат прерван, проверьте данные.',
                                          'GeoEdit',mb_Ok + mb_IconExclamation);
   end;
   OperationPane.Caption := '';
   OperationProgressPane.Visible := False;
   EditUndo.Enabled := False;
   UndoInfo.Flag := False;
   CloseFile(UndoFile);
   geGrid.Refresh;
end;

{------------------------------------------------------------------------------}
{------------------------- Блок сервисных процедур ----------------------------}
{------------------------------------------------------------------------------}

{ Поиск забоя вниз }
procedure TMainForm.ServiceFindZDownExecute(Sender: TObject);
var
  tRecNo: Integer;
  StopFlag: Boolean;
begin
  with geData do
  begin
   tRecNo := geTable.RecNo;
   geQuery.First;
   geQuery.MoveBy(tRecNo);
   OperationProgressPane.TotalParts := geTable.RecordCount;
   OperationProgressPane.PartsComplete := tRecNo;
   OperationProgressPane.Visible := True;
   OperationPane.Caption := 'Поиск забоя';
   StopFlag := False;
   while (not geQuery.Eof) and (not StopFlag) do
   begin
    geQuery.Next;
    Inc(tRecNo);
    if geQuery.FieldByName('S102').AsFloat = 0 then StopFlag := True;
    OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
   end;
   OperationPane.Caption := '';
   OperationProgressPane.Visible := False;
   if not StopFlag then ShowMessage('Достигнут конец файла.');
   geTable.First;
   geTable.MoveBy(tRecNo);
  end;
end;

{ Поиск забоя вверх }
procedure TMainForm.ServiceFindZUpExecute(Sender: TObject);
var
  tRecNo: Integer;
  StopFlag: Boolean;
begin
  with geData do
  begin
   tRecNo := geTable.RecNo;
   geQuery.First;
   geQuery.MoveBy(tRecNo);
   OperationProgressPane.TotalParts := tRecNo;
   OperationProgressPane.PartsComplete := 0;
   OperationProgressPane.Visible := True;
   OperationPane.Caption := 'Поиск забоя';
   StopFlag := False;
   while (not geQuery.Bof) and (not StopFlag) do
   begin
    geQuery.Prior;
    Dec(tRecNo);
    if geQuery.FieldByName('S102').AsFloat = 0 then StopFlag := True;
    OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
   end;
   OperationPane.Caption := '';
   OperationProgressPane.Visible := False;
   if not StopFlag then ShowMessage('Достигнуто начало файла.');
   geTable.First;
   geTable.MoveBy(tRecNo);
  end;
end;

{ Копировать в буфер обмена }
procedure TMainForm.ServiceCopyExecute(Sender: TObject);
var geFieldName : String;
begin
  geFieldName := geGrid.SelectedField.FieldName;
  if geFieldName <> '' then Clipboard.AsText := geData.geTable.FieldByName(geFieldName).AsString;
end;

{ Вставить из буфера обмена }
procedure TMainForm.ServicePasteExecute(Sender: TObject);
var
  geFieldName, strValue, StatusField : String;
  geValue: Double;
begin
  geFieldName := geGrid.SelectedField.FieldName;
  StatusField := geFieldName;
  Delete(StatusField,1,1);
  StatusField := 'D'+StatusField;
  if geFieldName <> '' then
  try
   strValue := Clipboard.AsText;
   geValue := s_StrToFloat(strValue);
   geData.geTable.Edit;
   geData.geTable.FieldByName(geFieldName).AsFloat := geValue;
   geData.geTable.FieldByName(StatusField).AsString := 'O';
   ReCalcTableParams(geFieldName, geValue);
   geData.geTable.Post;
   LoadDataIntoChart(StartChartRec);
  except
   ShowMessage('В буфере обмена не число!');
  end;
end;

{ Выгрузить блок данных }
procedure TMainForm.ServiceSaveDataExecute(Sender: TObject);
var
  StartRec, FinishRec: Integer;
  EditField, FileExt: String;
  Value: Double;
  DataBlock : File of Double;
begin
  SelectParamDlg.Left := MainForm.Left + MainForm.Width div 2 - SelectParamDlg.Width div 2;
  SelectParamDlg.Top := MainForm.Top + MainForm.Height div 2 - SelectParamDlg.Height div 2;
  if SelectParamDlg.ShowModal = mrOk then
  begin
   FileSaveDlg.Title := 'Задайте имя файла';
   FileSaveDlg.Filter := 'Блок данных GeoScape|*.ged|Все файлы|*.*';
   FileSaveDlg.FileName := SelectParamDlg.ParamCombo.Text;
   if FileSaveDlg.Execute then
   try
    MainForm.Refresh;
    FileExt := ExtractFileExt(FileSaveDlg.FileName);
    Delete(FileExt,1,1);
    LowerCase(FileExt);
    if FileExt <> 'ged' then FileSaveDlg.FileName := FileSaveDlg.FileName + '.ged';
    AssignFile(DataBlock, FileSaveDlg.FileName);
    Rewrite(DataBlock);
    EditField := geGrid.Columns.Items[SelectParamDlg.ParamCombo.ItemIndex].FieldName;
    if BlockEndRec > BlockBeginRec then
    begin
     StartRec := BlockBeginRec;
     FinishRec := BlockEndRec;
    end
    else
    begin
     StartRec := BlockEndRec;
     FinishRec := BlockBeginRec;
    end;
    OperationPane.Caption := 'Выгрузка данных';
    OperationProgressPane.PartsComplete := 0;
    OperationProgressPane.TotalParts := Abs(BlockEndRec-BlockBeginRec);
    OperationProgressPane.Visible := True;
    with geData do
    begin
     geQuery.First;
     geQuery.MoveBy(StartRec-1);
     while geQuery.RecNo <> FinishRec do
     begin
      Value := geQuery.FieldByName(EditField).AsFloat;
      Write(DataBlock, Value);
      geQuery.Next;
      OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
     end;
     Value := geQuery.FieldByName(EditField).AsFloat;
     Write(DataBlock, Value);
    end;
   except
    Application.MessageBox('Ошибка выполнения операции', 'GeoEdit',mb_Ok + mb_IconExclamation);
   end;
   CloseFile(DataBlock);
   OperationPane.Caption := '';
   OperationProgressPane.Visible := False;
  end;
  geData.geTable.First;
  geData.geTable.MoveBy(BlockBeginRec-1);
end;

{Загрузить блок данных}
procedure TMainForm.ServiceLoadDataExecute(Sender: TObject);
var
  StartRec, FinishRec: Integer;
  EditField, StatusField: String;
  Value: Double;
  DataBlock : File of Double;
begin
  SelectParamDlg.Left := MainForm.Left + MainForm.Width div 2 - SelectParamDlg.Width div 2;
  SelectParamDlg.Top := MainForm.Top + MainForm.Height div 2 - SelectParamDlg.Height div 2;
  if SelectParamDlg.ShowModal = mrOk then
  begin
   FileOpenDlg.Filter := 'Блок данных GeoScape|*.ged|Все файлы|*.*';
   FileOpenDlg.FileName := '';
   if FileOpenDlg.Execute then
   try
    MainForm.Refresh;
    AssignFile(DataBlock, FileOpenDlg.FileName);
    Reset(DataBlock);
    EditField := geGrid.Columns.Items[SelectParamDlg.ParamCombo.ItemIndex].FieldName;
    if BlockEndRec > BlockBeginRec then
    begin
     StartRec := BlockBeginRec;
     FinishRec := BlockEndRec;
    end
    else
    begin
     StartRec := BlockEndRec;
     FinishRec := BlockBeginRec;
    end;
    OperationPane.Caption := 'Загрузка данных';
    OperationProgressPane.PartsComplete := 0;
    OperationProgressPane.TotalParts := Abs(BlockEndRec-BlockBeginRec);
    OperationProgressPane.Visible := True;
    StatusField := EditField;
    Delete(StatusField,1,1);
    StatusField := 'D'+StatusField;
    with geData do
    begin
     geQuery.First;
     geQuery.MoveBy(StartRec-1);
     while ((geQuery.RecNo <> FinishRec) and (not EoF(DataBlock))) do
     begin
      Read(DataBlock, Value);
      geQuery.Edit;
      geQuery.FieldByName(EditField).AsFloat := Value;
      ReCalcParams(EditField, Value);
      geQuery.Next;
      OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
     end;
     if (not EoF(DataBlock)) then
     begin
      Read(DataBlock, Value);
      geQuery.Edit;
      geQuery.FieldByName(EditField).AsFloat := Value;
      geQuery.FieldByName(StatusField).AsString := 'O';
      ReCalcParams(EditField, Value);
      geQuery.Post;
     end;
     geQuery.Refresh;
    end;
    LoadDataIntoChart(StartChartRec);
   except
    geData.geQuery.Cancel;
    Application.MessageBox('Ошибка выполнения операции', 'GeoEdit',mb_Ok + mb_IconExclamation);
   end;
   CloseFile(DataBlock);
   OperationPane.Caption := '';
   OperationProgressPane.Visible := False;
  end;
  geData.geTable.First;
  geData.geTable.MoveBy(BlockBeginRec-1);
  LoadDataIntoChart(StartChartRec);
end;

{ Изменение даты/времени }
procedure TMainForm.ServiceChangeDateTimeExecute(Sender: TObject);
var
  OldDate, NewDate, NewTime : TDateTime;
  OldTime, NewTimeInt, PrevTimeInt, NowTimeInt, TimeInterval, TimeSpinInterval, Hour, Min, Sec : Integer;
  Str1, Str2 : String;
begin
  ChangeDateTimeDlg.Left := MainForm.Left + MainForm.Width div 2 - ChangeDateTimeDlg.Width div 2;
  ChangeDateTimeDlg.Top := MainForm.Top + MainForm.Height div 2 - ChangeDateTimeDlg.Height div 2;
  geData.geQuery.First;
  OldDate := geData.geQuery.FieldByName('Date').AsDateTime;
  OldTime := geData.geQuery.FieldByName('Time').AsInteger;
  OldDate := CalcDateTime(OldTime,OldDate);
  DateTimeToString(Str1,'dd.mm.yyyy hh:nn:ss', OldDate);
  ChangeDateTimeDlg.OldDateMaskEdit.Text := Str1;
  ChangeDateTimeDlg.NewDateMaskEdit.Text := Str1;
  geData.geQuery.MoveBy(100);
  NowTimeInt := geData.geQuery.FieldByName('Time').AsInteger;
  TimeInterval := NowTimeInt - OldTime;
  if TimeInterval < 0 then TimeInterval := TimeInterval + 86400000;
  TimeInterval := TimeInterval div 100;
  ChangeDateTimeDlg.IntervalSpinEdit.IntValue := TimeInterval;
  ChangeDateTimeDlg.IntervalSpinEdit.Enabled := ChangeDateTimeDlg.IntervalCheck.Checked;
  geData.geQuery.First;
  if (ChangeDateTimeDlg.ShowModal = mrOk) then
  begin
   try
    NewDate := StrToDate(Copy(ChangeDateTimeDlg.NewDateMaskEdit.Text, 1, 10));
    NewTime :=  StrToTime(Copy(ChangeDateTimeDlg.NewDateMaskEdit.Text, 12, 8));
    TimeSpinInterval := ChangeDateTimeDlg.IntervalSpinEdit.IntValue;
   except
    Application.MessageBox('Некорректно указана Дата/Время.', 'GeoEdit',mb_Ok + mb_IconExclamation);
    Exit;
   end;
   with geData do
   try
    MainForm.Refresh;
    OperationPane.Caption := 'Коррекция даты';
    OperationProgressPane.PartsComplete := 0;
    OperationProgressPane.TotalParts := geQuery.RecordCount;
    OperationProgressPane.Visible := True;
    Str1 := TimeToStr(NewTime);
    if Length(Str1) < 8 then Str1 := '0'+ Str1;
    Hour := StrToInt(Copy(Str1, 1, 2));
    Min := StrToInt(Copy(Str1, 4, 2));
    Sec := StrToInt(Copy(Str1, 7, 2));
    Str1 := IntToStr(geQuery.FieldByName('Time').AsInteger);
    Str2 := Copy(Str1, Length(Str1)-2, 3);
    NewTimeInt := 1000*(Sec+60*Min+3600*Hour) + StrToInt(Str2);
    PrevTimeInt := geQuery.FieldByName('Time').AsInteger;;
    while not geQuery.Eof do
    begin
     NowTimeInt := geQuery.FieldByName('Time').AsInteger;
     TimeInterval := NowTimeInt - PrevTimeInt;
     if TimeInterval < 0 then TimeInterval := TimeInterval + 86400000;
     if ChangeDateTimeDlg.IntervalCheck.Checked then NewTimeInt := NewTimeInt + TimeSpinInterval
                                                else NewTimeInt := NewTimeInt + TimeInterval;
     if NewTimeInt >= 86400000 then
     begin
      NewTimeInt := NewTimeInt - 86400000;
      NewDate := NewDate + 1;
     end;
     geQuery.Edit;
     geQuery.FieldByName('Date').AsDateTime := NewDate;
     geQuery.FieldByName('Time').AsInteger := NewTimeInt;
     PrevTimeInt := NowTimeInt;
     geQuery.Next;
     OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
    end;
    geQuery.Refresh;
   except
    Application.MessageBox('Ошибка выполнения операции. Проверьте целостность временной шкалы.', 'GeoEdit',mb_Ok + mb_IconExclamation);
   end;
   OperationPane.Caption := '';
   OperationProgressPane.Visible := False;
   geData.geQuery.First;
   LoadDataIntoChart(StartChartRec);
  end;
end;

{ Экспорт блока регистрации }
procedure TMainForm.ServiceExportDataExecute(Sender: TObject);
var
  Indx, StartRec, FinishRec: Integer;
  FileExt: String;
begin
  FileSaveDlg.Title := 'Задайте имя файла';
  FileSaveDlg.Filter := 'Файлы GeoScape|*.db|Все файлы|*.*';
  FileSaveDlg.FileName := '00000000';
  if FileSaveDlg.Execute then
  try
    MainForm.Refresh;
    FileExt := ExtractFileExt(FileSaveDlg.FileName);
    Delete(FileExt,1,1);
    LowerCase(FileExt);
    if FileExt <> 'db' then FileSaveDlg.FileName := FileSaveDlg.FileName + '.db';
    if FileExists(FileSaveDlg.FileName) then
    begin
     Application.MessageBox('Файл с таким именем уже существует. Задайте другое имя файла', 'GeoEdit',mb_Ok + mb_IconExclamation);
     raise Exception.Create('');
    end;
{ Создание новой таблицы ------------------------------------------------------}
   geData.ToolsTable.TableType := geData.geTable.TableType;
   geData.ToolsTable.TableName := FileSaveDlg.FileName;
   geData.ToolsTable.FieldDefs.Clear;
   for Indx := 0 to geData.geTable.FieldCount - 1 do
    with geData.ToolsTable.FieldDefs.AddFieldDef do
    begin
      DataType := geData.geTable.FieldDefs.Items[Indx].DataType;
      Name := geData.geTable.FieldDefs.Items[Indx].Name;
      if (DataType = ftString) then Size := 1;
    end;
    geData.ToolsTable.CreateTable;
{ Создание новой таблицы - конец ----------------------------------------------}
   geData.ToolsTable.Open;
   geData.geTable.DisableControls;
   geData.ToolsTable.Open;
   geData.geQuery.DisableControls;
   if BlockEndRec > BlockBeginRec then
    begin
     StartRec := BlockBeginRec;
     FinishRec := BlockEndRec;
    end
    else
    begin
     StartRec := BlockEndRec;
     FinishRec := BlockBeginRec;
    end;
   OperationPane.Caption := 'Выгрузка блока';
   OperationProgressPane.PartsComplete := 0;
   OperationProgressPane.TotalParts := Abs(BlockEndRec-BlockBeginRec);
   OperationProgressPane.Visible := True;
   geData.geTable.First;
   geData.geTable.MoveBy(StartRec-1);
   while geData.geTable.RecNo <> FinishRec do
   begin
    geData.ToolsTable.Edit;
    geData.ToolsTable.Append;
    geData.ToolsTable.FieldByName('Date').AsDateTime :=
                                  geData.geTable.FieldByName('Date').AsDateTime;
    for Indx := 2 to ((geData.geTable.FieldCount) div 2)+1 do
     begin
      geData.ToolsTable.Fields.FieldByNumber(Indx*2-2).AsFloat :=
                          geData.geTable.Fields.FieldByNumber(Indx*2-2).AsFloat;
      geData.ToolsTable.Fields.FieldByNumber(Indx*2-1).AsString :=
                         geData.geTable.Fields.FieldByNumber(Indx*2-1).AsString;
     end;
    geData.ToolsTable.Post;
    geData.geTable.Next;
    OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
   end;
   geData.ToolsTable.Edit;
   geData.ToolsTable.Append;
   geData.ToolsTable.FieldByName('Date').AsDateTime :=
                                  geData.geTable.FieldByName('Date').AsDateTime;
   for Indx := 2 to ((geData.geTable.FieldCount) div 2)+1 do
    begin
     geData.ToolsTable.Fields.FieldByNumber(Indx*2-2).AsFloat :=
                          geData.geTable.Fields.FieldByNumber(Indx*2-2).AsFloat;
     geData.ToolsTable.Fields.FieldByNumber(Indx*2-1).AsString :=
                         geData.geTable.Fields.FieldByNumber(Indx*2-1).AsString;
    end;
   geData.ToolsTable.Post;
  except
   Application.MessageBox('Ошибка выполнения операции.', 'GeoEdit',mb_Ok + mb_IconExclamation);
  end;
  if geData.ToolsTable.Active then geData.ToolsTable.Close;
  OperationPane.Caption := '';
  OperationProgressPane.Visible := False;
  geData.geQuery.EnableControls;
  geData.geTable.EnableControls;
  geData.geTable.First;
  geData.geTable.MoveBy(BlockBeginRec-1);
end;

{ Сканирование поля 'Забой' на ошибки }
procedure TMainForm.ServiceScanDepthExecute(Sender: TObject);
var
  ErrorFlag : Boolean;
  Depth, DefDepth : Double;
  DefStatus : String;
  DefPos, DefRecPos: Integer;
begin
  MainForm.Refresh;
  OperationPane.Caption := 'Сканирование Забоя';
  OperationProgressPane.PartsComplete := 0;
  OperationProgressPane.TotalParts := geData.geTable.RecordCount;
  OperationProgressPane.Visible := True;
  geData.geQuery.First;
  ErrorFlag := False;
  Depth := 0;
  DefPos := 1;
  DefRecPos := geData.geTable.RecNo;
  with geData do
  begin
   while (not geQuery.Eof) and (not ErrorFlag) do
   begin
    DefDepth := geQuery.FieldByName('S101').AsFloat;
    DefStatus := geQuery.FieldByName('D101').AsString;
    if (Depth <= DefDepth) and (DefStatus = 'O') then Depth := DefDepth
                                                 else ErrorFlag := True;
    geQuery.Next;
    DefPos := geQuery.RecNo;
    OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
   end;
   OperationPane.Caption := '';
   OperationProgressPane.Visible := False;
   if ErrorFlag then
   begin
    if not geQuery.Eof then
    begin
     geTable.First;
     geTable.MoveBy(DefPos-2);
    end
    else geTable.Last;
    Application.MessageBox('Возможна ошибка в позиции указателя', 'GeoEdit',mb_Ok + mb_IconExclamation);
   end
   else
   begin
    geTable.First;
    geTable.MoveBy(DefRecPos-1);
    Application.MessageBox('Ошибок не найдено', 'GeoEdit',mb_Ok + mb_IconInformation);
   end;
  end;
end;

{ Склейка блоков регистрации }
procedure TMainForm.ServiceMergeDataExecute(Sender: TObject);
begin
  //

end;

{ Служба спасения }
procedure TMainForm.ServiceResqueDataExecute(Sender: TObject);
var
  Indx, DefRec: Integer;
  FileExt: String;
  ErrorFlag: Boolean;
begin
  FileSaveDlg.Title := 'Задайте имя файла';
  FileSaveDlg.Filter := 'Файлы GeoScape|*.db|Все файлы|*.*';
  FileSaveDlg.FileName := '00000000';
  if FileSaveDlg.Execute then
  try
    MainForm.Refresh;
    FileExt := ExtractFileExt(FileSaveDlg.FileName);
    Delete(FileExt,1,1);
    LowerCase(FileExt);
    if FileExt <> 'db' then FileSaveDlg.FileName := FileSaveDlg.FileName + '.db';
    if FileExists(FileSaveDlg.FileName) then
    begin
     Application.MessageBox('Файл с таким именем уже существует. Задайте другое имя файла', 'GeoEdit',mb_Ok + mb_IconExclamation);
     raise Exception.Create('');
    end;
{ Создание новой таблицы ------------------------------------------------------}
   geData.ToolsTable.TableType := geData.geTable.TableType;
   geData.ToolsTable.TableName := FileSaveDlg.FileName;
   geData.ToolsTable.FieldDefs.Clear;
   for Indx := 0 to geData.geTable.FieldCount - 1 do
    with geData.ToolsTable.FieldDefs.AddFieldDef do
    begin
      DataType := geData.geTable.FieldDefs.Items[Indx].DataType;
      Name := geData.geTable.FieldDefs.Items[Indx].Name;
      if (DataType = ftString) then Size := 1;
    end;
    geData.ToolsTable.CreateTable;
{ Создание новой таблицы - конец ----------------------------------------------}
   geData.ToolsTable.Open;
   geData.geTable.DisableControls;
   geData.ToolsTable.Open;
   geData.geQuery.DisableControls;
   OperationPane.Caption := 'Служба спасения';
   OperationProgressPane.PartsComplete := 0;
   OperationProgressPane.TotalParts := geData.geTable.RecordCount;
   OperationProgressPane.Visible := True;
   geData.geTable.First;
   ErrorFlag := False;
   for DefRec := 0 to geData.geTable.RecordCount - 1 do
   try
    geData.ToolsTable.Edit;
    geData.ToolsTable.Append;
    geData.ToolsTable.FieldByName('Date').AsDateTime :=
                                  geData.geTable.FieldByName('Date').AsDateTime;
    for Indx := 2 to ((geData.geTable.FieldCount) div 2)+1 do
     begin
      geData.ToolsTable.Fields.FieldByNumber(Indx*2-2).AsFloat :=
                          geData.geTable.Fields.FieldByNumber(Indx*2-2).AsFloat;
      geData.ToolsTable.Fields.FieldByNumber(Indx*2-1).AsString :=
                         geData.geTable.Fields.FieldByNumber(Indx*2-1).AsString;
     end;
    geData.ToolsTable.Post;
    geData.geTable.Next;
    OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
   except
    ErrorFlag := True;
    ShowMessage('Ошибка в строке №'+ IntToStr(DefRec)+'.');
   end;
   if not ErrorFlag then ShowMessage('Ошибок в файле не обнаружено.');
  except
   Application.MessageBox('Ошибка выполнения операции.', 'GeoEdit',mb_Ok + mb_IconExclamation);
  end;
  if geData.ToolsTable.Active then geData.ToolsTable.Close;
  OperationPane.Caption := '';
  OperationProgressPane.Visible := False;
  geData.geQuery.EnableControls;
  geData.geTable.EnableControls;
  geData.geTable.First;
end;

{ Импорт данных Хроматографа }
procedure TMainForm.ServiceImportChromExecute(Sender: TObject);
const
  c_Gaz : array [0..6] of String = ('FV00','FV01','FV02','FV03','FV04','FV05','FV06');
  gs_Gaz : array [0..7] of String = ('S1600','S1601','S1602','S1603','S1626','S1604','S1627','S1605');
var
  Indx, gsTime: Integer;
  gsDate, gsDateTime, cDateTime: TDateTime;
  StopFlag: Boolean;
  GazValues : array [0..7] of Double;
begin
  FileOpenDlg.Title := 'Выберите файл';
  FileOpenDlg.Filter := 'Файлы Хроматографа|*.db|Все файлы|*.*';
  if FileOpenDlg.Execute then
  try
    MainForm.Refresh;
    geData.geQuery.DisableControls;
    OperationPane.Caption := 'Импорт данных хроматографа';
    OperationProgressPane.PartsComplete := 0;
    OperationProgressPane.TotalParts := 100;
    OperationProgressPane.Visible := True;
    geData.ToolsTable.TableName := FileOpenDlg.FileName;
    geData.ToolsTable.Open;
    geData.geQuery.First;
    geData.ToolsTable.First;
    {---------------------------------------------------------------------------}
    { Сделать проверку вхождения файла Хрома в диапазон текущего файла GeoScape }
    { и считывание названий полей для газов из ini-файла                        }
    {---------------------------------------------------------------------------}
    { Вычисляем дату/время начала регистрации в файлах }
    gsDate := geData.geQuery.FieldByName('Date').AsDateTime;
    gsTime := geData.geQuery.FieldByName('Time').AsInteger;
    gsDateTime := CalcDateTime(gsTime,gsDate);
    cDateTime := geData.ToolsTable.FieldByName('FStartTime').AsDateTime;

    if gsDateTime < cDateTime then { Если файл GeoScape начался раньше, то }
    begin                          { проматываем его к времени первой записи Хрома }
      StopFlag := False;
      while (geData.geQuery.RecNo < geData.geQuery.RecordCount-1) and not StopFlag do
      begin
        gsDate := geData.geQuery.FieldByName('Date').AsDateTime;
        gsTime := geData.geQuery.FieldByName('Time').AsInteger;
        gsDateTime := CalcDateTime(gsTime,gsDate);
        if gsDateTime >= cDateTime then StopFlag := True
                                   else geData.geQuery.Next;
      end;
    end
    else  { Если файл GeoScape начинается позже,}
    begin { то проматываем файл хроматографа }
      StopFlag := False;
      while (geData.ToolsTable.RecNo < geData.ToolsTable.RecordCount-1) and not StopFlag do
      begin
        cDateTime := geData.ToolsTable.FieldByName('FStartTime').AsDateTime;
        if cDateTime >= gsDateTime then StopFlag := True
                                   else geData.ToolsTable.Next;
      end;
    end;

    { Запись данных хроматографа в текущий файл до конца одного из файлов }
    { читаем первую строку в файле Хрома в массив. GazValues[0] - сумма }
    GazValues[0] := 0;
    for Indx := 1 to 7 do
    begin
      GazValues[Indx] := geData.ToolsTable.FieldByName(c_Gaz[Indx-1]).AsFloat;
      GazValues[0] := GazValues[0] + GazValues[Indx];
    end;

    geData.ToolsTable.Next; { переходим на следующую строку в файле Хрома }
    OperationProgressPane.TotalParts := geData.ToolsTable.RecordCount -
                                        geData.ToolsTable.RecNo;

    while (geData.geQuery.RecNo < geData.geQuery.RecordCount-1) and
          (geData.ToolsTable.RecNo < geData.ToolsTable.RecordCount-1) do
    begin
      cDateTime := geData.ToolsTable.FieldByName('FStartTime').AsDateTime;
      StopFlag := False;
      { пока текущее дата/время файла GeoScape меньше даты/времени хроматографа }
      { и не достигнут конец файла GeoScape, пишем данные хрома в файл }
      while (gsDateTime < cDateTime) and not StopFlag do
      begin
        geData.geQuery.Edit;
        for Indx := 0 to 7 do
          geData.geQuery.FieldByName(gs_Gaz[Indx]).AsFloat := GazValues[Indx];
        geData.geQuery.Next;
        if geData.geQuery.RecNo >= geData.geQuery.RecordCount-1 then
        begin
          StopFlag := True;
          Application.MessageBox('Достигнут конец файла GeoScape.' + #13 +
              'Данные хроматографа импортированы не полностью.', 'GeoEdit',mb_Ok + mb_IconExclamation);
        end;

        gsDate := geData.geQuery.FieldByName('Date').AsDateTime;
        gsTime := geData.geQuery.FieldByName('Time').AsInteger;
        gsDateTime := CalcDateTime(gsTime,gsDate);
      end;
     { считываем в массив следующую строку данных хроматографа }
      GazValues[0] := 0;
      for Indx := 1 to 7 do
      begin
        GazValues[Indx] := geData.ToolsTable.FieldByName(c_Gaz[Indx-1]).AsFloat;
        GazValues[0] := GazValues[0] + GazValues[Indx];
      end;
      { Переходим на следующую строку }
      geData.ToolsTable.Next;
      OperationProgressPane.PartsComplete := OperationProgressPane.PartsComplete + 1;
    end;

  except
    Application.MessageBox('Ошибка выполнения операции.', 'GeoEdit',mb_Ok + mb_IconExclamation);
  end;
  if geData.ToolsTable.Active then geData.ToolsTable.Close;
  OperationPane.Caption := '';
  OperationProgressPane.Visible := False;
  geData.geQuery.EnableControls;
  geData.geQuery.Refresh;
  geData.geTable.First;
  LoadDataIntoChart(StartChartRec);

end;


{------------------------------------------------------------------------------}
{----------------- Блок вычислительных процедур и функций ---------------------}
{------------------------------------------------------------------------------}

{ Функция конвертации даты/времени }
function TMainForm.CalcDateTime(DbTime : Integer; DbDate : TDateTime) : TDateTime;
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

{ Перерасчет вычисляемых параметров }
procedure TMainForm.ReCalcParams(EditField: String; Value: Double);
var
  Str: String;
  ID_Param, vCounter: Integer;
  CalcParam, CalcParam1: Double;
begin
  with CalcParamsDlg, geData do
  begin
   Str := EditField;
   Delete(Str,1,1);
   ID_Param := StrToInt(Str);
   if (ID_Param > 700) and (ID_Param < 709) then { Пересчет объёмов }
   begin
    CalcParam := 0;
    CalcParam1 := 0;
    if (ID_Param = 701) then CalcParam := Value * s_StrToFloat(SEdit_1.Text);
    if (ID_Param = 702) then CalcParam := Value * s_StrToFloat(SEdit_2.Text);
    if (ID_Param = 703) then CalcParam := Value * s_StrToFloat(SEdit_3.Text);
    if (ID_Param = 704) then CalcParam := Value * s_StrToFloat(SEdit_Vibr.Text);
    if (ID_Param = 705) then CalcParam := Value * s_StrToFloat(SEdit_Dol.Text);
    if (ID_Param = 706) then CalcParam := Value * s_StrToFloat(SEdit_4.Text);
    if (ID_Param = 707) then CalcParam := Value * s_StrToFloat(SEdit_5.Text);
    if (ID_Param = 708) then CalcParam := Value * s_StrToFloat(SEdit_6.Text);
    if CalcParam > 0 then
    begin
     geQuery.FieldByName('S'+ IntToStr(ID_Param+10)).AsFloat := CalcParam;
     geQuery.FieldByName('D'+ IntToStr(ID_Param+10)).AsString := 'O';
     if V_1.Checked and (geQuery.FieldByName('S711').AsFloat > 0) then
                             CalcParam1 := geQuery.FieldByName('S711').AsFloat;
     if V_2.Checked  and (geQuery.FieldByName('S712').AsFloat > 0) then
                CalcParam1 := CalcParam1 + geQuery.FieldByName('S712').AsFloat;
     if V_3.Checked and (geQuery.FieldByName('S713').AsFloat > 0) then
                CalcParam1 := CalcParam1 + geQuery.FieldByName('S713').AsFloat;
     if V_Vibr.Checked and (geQuery.FieldByName('S714').AsFloat > 0) then
                CalcParam1 := CalcParam1 + geQuery.FieldByName('S714').AsFloat;
     if V_Dol.Checked and (geQuery.FieldByName('S715').AsFloat > 0) then
                CalcParam1 := CalcParam1 + geQuery.FieldByName('S715').AsFloat;
     if V_4.Checked and (geQuery.FieldByName('S716').AsFloat > 0) then
                CalcParam1 := CalcParam1 + geQuery.FieldByName('S716').AsFloat;
     if V_5.Checked and (geQuery.FieldByName('S717').AsFloat > 0) then
                CalcParam1 := CalcParam1 + geQuery.FieldByName('S717').AsFloat;
     if V_6.Checked and (geQuery.FieldByName('S718').AsFloat > 0) then
                CalcParam1 := CalcParam1 + geQuery.FieldByName('S718').AsFloat;
     if (CalcParam1 > 0) then
     begin
      geQuery.FieldByName('S720').AsFloat := CalcParam1;
      geQuery.FieldByName('D720').AsString := 'O';
     end;
    end;
   end;
   if (ID_Param > 800) and (ID_Param < 809) then { Пересчёт температур на входе }
   begin
    { На входе ------------------------------ }
    CalcParam := 0;
    vCounter := 0;
    if Enter_1.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S801').AsFloat;
     Inc(vCounter);
    end;
    if Enter_2.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S802').AsFloat;
     Inc(vCounter);
    end;
    if Enter_3.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S803').AsFloat;
     Inc(vCounter);
    end;
    if Enter_Dol.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S805').AsFloat;
     Inc(vCounter);
    end;
    if Enter_4.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S806').AsFloat;
     Inc(vCounter);
    end;
    if Enter_5.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S807').AsFloat;
     Inc(vCounter);
    end;
    if Enter_6.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S808').AsFloat;
     Inc(vCounter);
    end;
    if (vCounter > 0) then
    begin
     geQuery.FieldByName('S800').AsFloat := CalcParam/vCounter;
     geQuery.FieldByName('D800').AsString := 'O';
    end;
   end;
   if (ID_Param > 600) and (ID_Param < 610) and (ID_Param <> 605) then { Пересчёт плотностей }
   begin
    { На входе ------------------------------ }
    CalcParam := 0;
    vCounter := 0;
    if Enter_1.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S601').AsFloat;
     Inc(vCounter);
    end;
    if Enter_2.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S602').AsFloat;
     Inc(vCounter);
    end;
    if Enter_3.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S603').AsFloat;
     Inc(vCounter);
    end;
    if Enter_Dol.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S609').AsFloat;
     Inc(vCounter);
    end;
    if Enter_4.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S606').AsFloat;
     Inc(vCounter);
    end;
    if Enter_5.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S607').AsFloat;
     Inc(vCounter);
    end;
    if Enter_6.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S608').AsFloat;
     Inc(vCounter);
    end;
    if (vCounter > 0) then
    begin
     geQuery.FieldByName('S600').AsFloat := CalcParam/vCounter;
     geQuery.FieldByName('D600').AsString := 'O';
    end;
    { На выходе ----------------------------- }
    CalcParam := 0;
    vCounter := 0;
    if Exit_1.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S601').AsFloat;
     Inc(vCounter);
    end;
    if Exit_2.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S602').AsFloat;
     Inc(vCounter);
    end;
    if Exit_3.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S603').AsFloat;
     Inc(vCounter);
    end;
    if Exit_Vibr.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S604').AsFloat;
     Inc(vCounter);
    end;
    if Exit_4.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S606').AsFloat;
     Inc(vCounter);
    end;
    if Exit_5.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S607').AsFloat;
     Inc(vCounter);
    end;
    if Exit_6.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S608').AsFloat;
     Inc(vCounter);
    end;
    if (vCounter > 0) then
    begin
     geQuery.FieldByName('S605').AsFloat := CalcParam/vCounter;
     geQuery.FieldByName('D605').AsString := 'O';
    end;
   end;
   if (ID_Param > 1600) and (ID_Param < 1628) then { Пересчёт Хрома }
   begin
    CalcParam := 0;
    CalcParam := CalcParam + geQuery.FieldByName('S1601').AsFloat +
                             geQuery.FieldByName('S1602').AsFloat +
                             geQuery.FieldByName('S1603').AsFloat +
                             geQuery.FieldByName('S1604').AsFloat +
                             geQuery.FieldByName('S1605').AsFloat +
                             geQuery.FieldByName('S1626').AsFloat +
                             geQuery.FieldByName('S1627').AsFloat;
    geQuery.FieldByName('S1600').AsFloat := CalcParam;
    geQuery.FieldByName('D1600').AsString := 'O';
   end;
  end;
end;

procedure TMainForm.ReCalcTableParams(EditField: String; Value: Double);
var
  Str: String;
  ID_Param, vCounter: Integer;
  CalcParam, CalcParam1: Double;
begin
  with CalcParamsDlg, geData do
  begin
   Str := EditField;
   Delete(Str,1,1);
   ID_Param := StrToInt(Str);
   if (ID_Param > 700) and (ID_Param < 709) then { Пересчет объёмов }
   begin
    CalcParam := 0;
    CalcParam1 := 0;
    if (ID_Param = 701) then CalcParam := Value * s_StrToFloat(SEdit_1.Text);
    if (ID_Param = 702) then CalcParam := Value * s_StrToFloat(SEdit_2.Text);
    if (ID_Param = 703) then CalcParam := Value * s_StrToFloat(SEdit_3.Text);
    if (ID_Param = 704) then CalcParam := Value * s_StrToFloat(SEdit_Vibr.Text);
    if (ID_Param = 705) then CalcParam := Value * s_StrToFloat(SEdit_Dol.Text);
    if (ID_Param = 706) then CalcParam := Value * s_StrToFloat(SEdit_4.Text);
    if (ID_Param = 707) then CalcParam := Value * s_StrToFloat(SEdit_5.Text);
    if (ID_Param = 708) then CalcParam := Value * s_StrToFloat(SEdit_6.Text);
    if CalcParam > 0 then
    begin
     geTable.FieldByName('S'+ IntToStr(ID_Param+10)).AsFloat := CalcParam;
     geTable.FieldByName('D'+ IntToStr(ID_Param+10)).AsString := 'O';
     if V_1.Checked and (geTable.FieldByName('S711').AsFloat > 0) then
                             CalcParam1 := geTable.FieldByName('S711').AsFloat;
     if V_2.Checked  and (geTable.FieldByName('S712').AsFloat > 0) then
                CalcParam1 := CalcParam1 + geTable.FieldByName('S712').AsFloat;
     if V_3.Checked and (geTable.FieldByName('S713').AsFloat > 0) then
                CalcParam1 := CalcParam1 + geTable.FieldByName('S713').AsFloat;
     if V_Vibr.Checked and (geTable.FieldByName('S714').AsFloat > 0) then
                CalcParam1 := CalcParam1 + geTable.FieldByName('S714').AsFloat;
     if V_Dol.Checked and (geTable.FieldByName('S715').AsFloat > 0) then
                CalcParam1 := CalcParam1 + geTable.FieldByName('S715').AsFloat;
     if V_4.Checked and (geTable.FieldByName('S716').AsFloat > 0) then
                CalcParam1 := CalcParam1 + geTable.FieldByName('S716').AsFloat;
     if V_5.Checked and (geTable.FieldByName('S717').AsFloat > 0) then
                CalcParam1 := CalcParam1 + geTable.FieldByName('S717').AsFloat;
     if V_6.Checked and (geTable.FieldByName('S718').AsFloat > 0) then
                CalcParam1 := CalcParam1 + geTable.FieldByName('S718').AsFloat;
     if (CalcParam1 > 0) then
     begin
      geTable.FieldByName('S720').AsFloat := CalcParam1;
      geTable.FieldByName('D720').AsString := 'O';
     end;
    end;
   end;
   if (ID_Param > 800) and (ID_Param < 809) then { Пересчёт температур }
   begin
    { На входе ------------------------------ }
    CalcParam := 0;
    vCounter := 0;
    if Enter_1.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S801').AsFloat;
     Inc(vCounter);
    end;
    if Enter_2.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S802').AsFloat;
     Inc(vCounter);
    end;
    if Enter_3.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S803').AsFloat;
     Inc(vCounter);
    end;
    if Enter_Dol.Checked then
    begin
     CalcParam := CalcParam + geQuery.FieldByName('S805').AsFloat;
     Inc(vCounter);
    end;
    if Enter_4.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S806').AsFloat;
     Inc(vCounter);
    end;
    if Enter_5.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S807').AsFloat;
     Inc(vCounter);
    end;
    if Enter_6.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S808').AsFloat;
     Inc(vCounter);
    end;
    if (vCounter > 0) then
    begin
     geTable.FieldByName('S800').AsFloat := CalcParam/vCounter;
     geTable.FieldByName('D800').AsString := 'O';
    end;
   end;
   if (ID_Param > 600) and (ID_Param < 610) and (ID_Param <> 605) then { Пересчёт плотностей }
   begin
    { На входе ------------------------------ }
    CalcParam := 0;
    vCounter := 0;
    if Enter_1.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S601').AsFloat;
     Inc(vCounter);
    end;
    if Enter_2.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S602').AsFloat;
     Inc(vCounter);
    end;
    if Enter_3.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S603').AsFloat;
     Inc(vCounter);
    end;
    if Enter_Dol.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S609').AsFloat;
     Inc(vCounter);
    end;
    if Enter_4.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S606').AsFloat;
     Inc(vCounter);
    end;
    if Enter_5.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S607').AsFloat;
     Inc(vCounter);
    end;
    if Enter_6.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S608').AsFloat;
     Inc(vCounter);
    end;
    if (vCounter > 0) then
    begin
     geTable.FieldByName('S600').AsFloat := CalcParam/vCounter;
     geTable.FieldByName('D600').AsString := 'O';
    end;
    { На выходе ----------------------------- }
    CalcParam := 0;
    vCounter := 0;
    if Exit_1.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S601').AsFloat;
     Inc(vCounter);
    end;
    if Exit_2.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S602').AsFloat;
     Inc(vCounter);
    end;
    if Exit_3.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S603').AsFloat;
     Inc(vCounter);
    end;
    if Exit_Vibr.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S604').AsFloat;
     Inc(vCounter);
    end;
    if Exit_4.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S606').AsFloat;
     Inc(vCounter);
    end;
    if Exit_5.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S607').AsFloat;
     Inc(vCounter);
    end;
    if Exit_6.Checked then
    begin
     CalcParam := CalcParam + geTable.FieldByName('S608').AsFloat;
     Inc(vCounter);
    end;
    if (vCounter > 0) then
    begin
     geTable.FieldByName('S605').AsFloat := CalcParam/vCounter;
     geTable.FieldByName('D605').AsString := 'O';
    end;
   end;
  end;
end;

// Функция проверки уставки
function TMainForm.CheckFlags(Value, CheckValue: Double; Operand: integer): Boolean;
begin
  Result := False; // Изначально сбрасываем валидную уставку
  case FillDlg.FlagsOperandCombo.ItemIndex of
  0: begin    // Значение больше уставки
      if Value > CheckValue
                  then Result := True;
           end;
  1: begin    // Значение меньше уставки
       if Value < CheckValue
                  then Result := True;
     end;     // Значение равно уставке
  2: begin
       if Value = CheckValue
               then Result := True;
     end;
  end;
end;

end.
