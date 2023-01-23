{******************************************************************************}
{*       Модуль выбора параметров заполнения блока программы GeoEdit          *}
{*                      (p)2004-2018 Siborg Software                          *}
{******************************************************************************}

unit FillUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RzButton, RzCmboBx, RzLabel, RzPanel, RzRadGrp, Mask,
  RzEdit, DB, RzLstBox, RzChkLst, RzSpnEdt, RzRadChk;

type
  TFillDlg = class(TForm)
    Bevel1: TBevel;
    OkBtn: TRzBitBtn;
    CancelBtn: TRzBitBtn;
    RzLabel1: TRzLabel;
    ParamCombo: TRzComboBox;
    DirectPanel: TRzPanel;
    FillTypeRadioGroup: TRzRadioGroup;
    SimulationPanel: TRzPanel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    SimulationBeginValueEdit: TRzEdit;
    SimulationEndValueEdit: TRzEdit;
    TemplatePanel: TRzPanel;
    RzLabel6: TRzLabel;
    TemplateParamCombo: TRzComboBox;
    TemplateValueEdit: TRzEdit;
    TemplateKEdit: TRzEdit;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    SimAmpEdit: TRzEdit;
    RzLabel9: TRzLabel;
    DirectEndValueEdit: TRzEdit;
    RzLabel2: TRzLabel;
    DirectBeginValueEdit: TRzEdit;
    RzLabel3: TRzLabel;
    AgregatePanel: TRzPanel;
    RzLabel11: TRzLabel;
    TypeAgrCombo: TRzComboBox;
    AgregateParamsList: TRzCheckList;
    RzLabel10: TRzLabel;
    SimPerEdit: TRzSpinEdit;
    FlagsGroup: TRzGroupBox;
    UseFlagsCheck: TRzCheckBox;
    FlagsParamCombo: TRzComboBox;
    RzLabel12: TRzLabel;
    FlagsOperandCombo: TRzComboBox;
    RzLabel13: TRzLabel;
    FlagsValueEdit: TRzEdit;
    RzLabel14: TRzLabel;
    procedure FormShow(Sender: TObject);
    procedure FillTypeRadioGroupClick(Sender: TObject);
    procedure ParamComboChange(Sender: TObject);
    procedure SimAmpEditChange(Sender: TObject);
    procedure AgregateParamsListChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure TemplateKEditChange(Sender: TObject);
    procedure UseFlagsCheckClick(Sender: TObject);
    procedure FlagsParamComboChange(Sender: TObject);
    procedure DirectEndValueEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    InputValue: Double;
  end;

var
  FillDlg: TFillDlg;

implementation

uses MainUnit, DataUnit;

{$R *.dfm}

{ Действия при визуализации формы }
procedure TFillDlg.FormShow(Sender: TObject);
var
  Indx: Integer;
begin
  ParamCombo.Items.Clear;
  for Indx := 0 to MainForm.geGrid.Columns.Count - 1 do
    ParamCombo.Items.Append(MainForm.geGrid.Columns.Items[Indx].Title.Caption);
  ParamCombo.ItemIndex := MainForm.geGrid.SelectedIndex;
  FillTypeRadioGroup.ItemIndex := 0;
  DirectBeginValueEdit.Text := FloatToStr(InputValue);
  SimulationBeginValueEdit.Text := FloatToStr(InputValue);
  TemplateParamCombo.Items.Clear;
  TemplateParamCombo.Items := ParamCombo.Items;
  FlagsParamCombo.Items := ParamCombo.Items;
  TemplateParamCombo.ItemIndex := ParamCombo.ItemIndex;
  TemplateValueEdit.Text := '0';
  TemplateKEdit.Text := '1';
  AgregateParamsList.Items := ParamCombo.Items;
  AgregateParamsList.ItemChecked[ParamCombo.ItemIndex] := True;
  UseFlagsCheck.Checked := False;
end;

{ Выбор редактируемого параметра }
procedure TFillDlg.ParamComboChange(Sender: TObject);
begin
  geData.SensorsTable.Locate('Name',ParamCombo.Text,[loCaseInsensitive]);
  if geData.SensorsTable.FieldByName('MathType').AsInteger > 0 then
  begin
   FillTypeRadioGroup.ItemIndex := 0;
   FillTypeRadioGroup.Enabled := False;
   DirectEndValueEdit.Text := '';
  end
  else FillTypeRadioGroup.Enabled := True;
  TemplateParamCombo.ItemIndex := ParamCombo.ItemIndex;
end;

{ Проверка правильности значения Прямого заполнения }
procedure TFillDlg.DirectEndValueEditChange(Sender: TObject);
var
  BeginValue, EndValue : Double;
  Flag: Boolean;
begin
  try
    BeginValue := s_StrToFloat(DirectBeginValueEdit.Text);
    if DirectEndValueEdit.Text <> ''
                          then EndValue := s_StrToFloat(DirectEndValueEdit.Text)
                          else EndValue := BeginValue;
    Flag := True;
  except
    Flag := False;
  end;
  if Flag then OkBtn.Enabled := True else OkBtn.Enabled := False;
  if UseFlagsCheck.Checked then FlagsParamComboChange(Self); // Проверка правильности уставки
end;

{ Проверка правильности значения Амплитуды }
procedure TFillDlg.SimAmpEditChange(Sender: TObject);
var
  SimBegin, SimEnd, SimAmp: Double;
begin
  try
    SimAmp := s_StrToFloat(SimAmpEdit.Text);
    SimBegin := s_StrToFloat(SimulationBeginValueEdit.Text);
    if SimulationEndValueEdit.Text <> ''
      then SimEnd := s_StrToFloat(SimulationEndValueEdit.Text)
      else SimEnd := SimBegin;
  except
   SimAmp := 0;
  end;
  if SimAmp > 0 then OkBtn.Enabled := True
                else OkBtn.Enabled := False;
  if UseFlagsCheck.Checked then FlagsParamComboChange(Self); // Проверка правильности уставки
end;

{ Проверка правильности заполнения параметров Шаблона }
procedure TFillDlg.TemplateKEditChange(Sender: TObject);
var
  TemplateValue, TemplateK: Double;
begin
  try
   TemplateK := s_StrToFloat(TemplateKEdit.Text);
   TemplateValue := s_StrToFloat(TemplateValueEdit.Text);
  except
   TemplateK := -2;
  end;
  if TemplateK < -1 then OkBtn.Enabled := False
                    else OkBtn.Enabled := True;
  if UseFlagsCheck.Checked then FlagsParamComboChange(Self); // Проверка правильности уставки
end;

{ Проверка правильности заполнения параметров Компоновки }
procedure TFillDlg.AgregateParamsListChange(Sender: TObject; Index: Integer;
  NewState: TCheckBoxState);
begin
  if AgregateParamsList.ItemsChecked < 2 then OkBtn.Enabled := False
                                         else OkBtn.Enabled := True;
  if UseFlagsCheck.Checked then FlagsParamComboChange(Self); // Проверка правильности уставки
end;

{ Выбор типа заполнения }
procedure TFillDlg.FillTypeRadioGroupClick(Sender: TObject);
begin
  case FillTypeRadioGroup.ItemIndex of
   0: begin { Прямое заполнение }
       DirectPanel.Visible := True;
       SimulationPanel.Visible := False;
       TemplatePanel.Visible := False;
       AgregatePanel.Visible := False;
       DirectEndValueEditChange(Self);
      end;
   1: begin { Заполнение с симуляцией }
       DirectPanel.Visible := False;
       SimulationPanel.Visible := True;
       TemplatePanel.Visible := False;
       AgregatePanel.Visible := False;
       SimAmpEditChange(Self);
      end;
   2: begin { Заполнение по шаблону }
       DirectPanel.Visible := False;
       SimulationPanel.Visible := False;
       TemplatePanel.Visible := True;
       AgregatePanel.Visible := False;
       TemplateKEditChange(Self);
      end;
   3: begin { Заполнение Мультипликация }
       DirectPanel.Visible := False;
       SimulationPanel.Visible := False;
       TemplatePanel.Visible := False;
       AgregatePanel.Visible := True;
       if AgregateParamsList.ItemsChecked < 2 then OkBtn.Enabled := False
                                              else OkBtn.Enabled := True;
       if UseFlagsCheck.Checked then FlagsParamComboChange(Self);
      end;
  end;
  if UseFlagsCheck.Checked then FlagsParamComboChange(Self); // Проверка правильности уставки
end;

// Вкл/выкл уставки
procedure TFillDlg.UseFlagsCheckClick(Sender: TObject);
begin
  if UseFlagsCheck.Checked then
  begin
    FlagsParamCombo.Enabled := True;
    FlagsOperandCombo.Enabled := True;
    FlagsValueEdit.Enabled := True;
  end
  else
  begin
    FlagsParamCombo.Enabled := False;
    FlagsOperandCombo.Enabled := False;
    FlagsValueEdit.Enabled := False;
  end;
  FillTypeRadioGroupClick(Self);
end;

// Проверка правильности заполнения значений по уставке
procedure TFillDlg.FlagsParamComboChange(Sender: TObject);
var
  FloatValue : Double;
  Flag: Boolean;
begin
  try
    FloatValue := s_StrToFloat(FlagsValueEdit.Text);
    Flag := True
  except
    Flag:= False;
  end;
  if (FlagsParamCombo.ItemIndex > -1) and (FlagsOperandCombo.ItemIndex > -1) and
     Flag then OkBtn.Enabled := True
          else OkBtn.Enabled := False;
  
end;

end.
