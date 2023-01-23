{******************************************************************************}
{*                Модуль рихтовки параметров программы GeoEdit                *}
{*                      (p)2004-2021 Siborg Software                          *}
{******************************************************************************}
unit CuttingUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RzCmboBx, RzLabel, Mask, RzEdit, RzButton, RzRadChk,
  RzPanel, RzRadGrp, RzBorder, RzSpnEdt, IniFiles;

type
  TCuttingDlg = class(TForm)
    CancelBtn: TRzBitBtn;
    OkBtn: TRzBitBtn;
    ParamCombo: TRzComboBox;
    RzLabel1: TRzLabel;
    Bevel1: TBevel;
    DefectRadio: TRzRadioGroup;
    NormalChangeEdit: TRzEdit;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzBorder1: TRzBorder;
    RzLabel4: TRzLabel;
    SavePresetBtn: TRzBitBtn;
    GlideCheck: TRzCheckBox;
    procedure FormShow(Sender: TObject);
    procedure DefectRadioClick(Sender: TObject);
    procedure NormalChangeEditChange(Sender: TObject);
    procedure SavePresetBtnClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ParamComboSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CuttingDlg: TCuttingDlg;
  PresetsDir: String;

implementation

uses MainUnit;

{$R *.dfm}

{ Действия при создании формы }
procedure TCuttingDlg.FormCreate(Sender: TObject);
begin
  GetDir(0,PresetsDir);
  PresetsDir := PresetsDir + '\bin';
end;

{ Действия при визуализации формы }
procedure TCuttingDlg.FormShow(Sender: TObject);
var
  Indx: Integer;
begin
  ParamCombo.Items.Clear;
  for Indx := 0 to MainForm.geGrid.Columns.Count - 1 do
    ParamCombo.Items.Append(MainForm.geGrid.Columns.Items[Indx].Title.Caption);
  ParamCombo.ItemIndex := MainForm.geGrid.SelectedIndex;
  OkBtn.Enabled := True;
  DefectRadio.ItemIndex := 0;
  RzLabel2.Enabled := False;
  RzLabel3.Enabled := False;
  RzLabel4.Enabled := False;
  NormalChangeEdit.Enabled := False;
  GlideCheck.Enabled := False;
  SavePresetBtn.Enabled := False;
end;

{ Действия при скрытии формы }
procedure TCuttingDlg.FormHide(Sender: TObject);
begin
  //
end;

{ Проверка корректности значения в NormalChangeEdit }
procedure TCuttingDlg.NormalChangeEditChange(Sender: TObject);
begin
  try
    if s_StrToFloat(NormalChangeEdit.Text) > 0 then OkBtn.Enabled := True
                                               else OkBtn.Enabled := False;
  except
   OkBtn.Enabled := False;
  end;
end;

{ Выбор параметра для редактирования }
procedure TCuttingDlg.ParamComboSelect(Sender: TObject);
begin
  DefectRadioClick(Self);
end;

{ Сохранить пресет для параметра }
procedure TCuttingDlg.SavePresetBtnClick(Sender: TObject);
var
  CutField: String;
  PresetsFile: TIniFile;
begin
  PresetsFile := TIniFile.Create(PresetsDir+'/EditPresets.ge');
  CutField := MainForm.geGrid.Columns.Items[ParamCombo.ItemIndex].FieldName;
  case DefectRadio.ItemIndex of
  1:begin
     PresetsFile.WriteFloat('CuttingPicksChange', CutField, s_strToFloat(NormalChangeEdit.Text));
     PresetsFile.WriteBool('CuttingPicksGlide', CutField, GlideCheck.Checked);
    end;
  2:begin
     PresetsFile.WriteFloat('CuttingStairsChange', CutField, s_strToFloat(NormalChangeEdit.Text));
     PresetsFile.WriteBool('CuttingStairsGlide', CutField, GlideCheck.Checked);
    end;
  end;
  PresetsFile.Free;
  Application.MessageBox('Пресет сохранен', 'GeoEdit',mb_Ok + mb_IconInformation);
end;

{ Выбор варианта рихтовки }
procedure TCuttingDlg.DefectRadioClick(Sender: TObject);
var
  CutField: String;
  PresetsFile: TIniFile;
begin
 PresetsFile := TIniFile.Create(PresetsDir+'/EditPresets.ge');
 CutField := MainForm.geGrid.Columns.Items[ParamCombo.ItemIndex].FieldName;
 case DefectRadio.ItemIndex of
 0: begin
     OkBtn.Enabled := True;
     RzLabel2.Enabled := False;
     RzLabel3.Enabled := False;
     RzLabel4.Enabled := False;
     NormalChangeEdit.Enabled := False;
     GlideCheck.Enabled := False;
     SavePresetBtn.Enabled := False;
    end;
 1: begin
     NormalChangeEdit.Enabled := True;
     GlideCheck.Enabled := True;
     RzLabel2.Enabled := True;
     RzLabel3.Enabled := True;
     RzLabel4.Enabled := True;
     SavePresetBtn.Enabled := True;
     NormalChangeEdit.Text := FloatToStr(PresetsFile.ReadFloat('CuttingPicksChange', CutField,0.002));
     GlideCheck.Checked := PresetsFile.ReadBool('CuttingPicksGlide', CutField, False);
     NormalChangeEditChange(Self);
    end;
 else
    begin
     NormalChangeEdit.Enabled := True;
     GlideCheck.Enabled := True;
     RzLabel2.Enabled := True;
     RzLabel3.Enabled := True;
     RzLabel4.Enabled := True;
     SavePresetBtn.Enabled := True;
     NormalChangeEdit.Text := FloatToStr(PresetsFile.ReadFloat('CuttingStairsChange', CutField,0.002));
     GlideCheck.Checked := PresetsFile.ReadBool('CuttingStairsGlide', CutField, False);
     NormalChangeEditChange(Self);
    end;
 end;
 PresetsFile.Free;
end;


end.
