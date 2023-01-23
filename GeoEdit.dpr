program GeoEdit;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  ParamsUnit in 'ParamsUnit.pas' {ParamsForm},
  DataUnit in 'DataUnit.pas' {geData: TDataModule},
  AddParam in 'AddParam.pas' {AddParamDlg},
  DiagramZoomUnit in 'DiagramZoomUnit.pas' {DiagramZoomDlg},
  DiagramLinesUnit in 'DiagramLinesUnit.pas' {DiagramLinesDlg},
  AboutUnit in 'AboutUnit.pas' {AboutBox},
  FillUnit in 'FillUnit.pas' {FillDlg},
  PlusMinusUnit in 'PlusMinusUnit.pas' {PlusMinusDlg},
  CalcParamsUnit in 'CalcParamsUnit.pas' {CalcParamsDlg},
  SelectParamUnit in 'SelectParamUnit.pas' {SelectParamDlg},
  SaveSetParamUnit in 'SaveSetParamUnit.pas' {SaveSetParamDlg},
  BlockSetUnit in 'BlockSetUnit.pas' {BlockSetDlg},
  ChangeDateTimeUnit in 'ChangeDateTimeUnit.pas' {ChangeDateTimeDlg},
  CuttingUnit in 'CuttingUnit.pas' {CuttingDlg},
  CorrectionUnit in 'CorrectionUnit.pas' {CorrectionDlg},
  GlideUnit in 'GlideUnit.pas' {GlideDlg},
  ExpandTalblockUnit in 'ExpandTalblockUnit.pas' {ExpandTalblockDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TParamsForm, ParamsForm);
  Application.CreateForm(TgeData, geData);
  Application.CreateForm(TAddParamDlg, AddParamDlg);
  Application.CreateForm(TDiagramZoomDlg, DiagramZoomDlg);
  Application.CreateForm(TDiagramLinesDlg, DiagramLinesDlg);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TFillDlg, FillDlg);
  Application.CreateForm(TPlusMinusDlg, PlusMinusDlg);
  Application.CreateForm(TCalcParamsDlg, CalcParamsDlg);
  Application.CreateForm(TSelectParamDlg, SelectParamDlg);
  Application.CreateForm(TSaveSetParamDlg, SaveSetParamDlg);
  Application.CreateForm(TBlockSetDlg, BlockSetDlg);
  Application.CreateForm(TChangeDateTimeDlg, ChangeDateTimeDlg);
  Application.CreateForm(TCuttingDlg, CuttingDlg);
  Application.CreateForm(TCorrectionDlg, CorrectionDlg);
  Application.CreateForm(TGlideDlg, GlideDlg);
  Application.CreateForm(TExpandTalblockDlg, ExpandTalblockDlg);
  Application.Run;
end.
