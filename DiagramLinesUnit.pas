{******************************************************************************}
{*          Модуль настройки графиков диаграммы программы GeoEdit             *}
{*                      (p)2004-2013 Siborg Software                          *}
{******************************************************************************}

unit DiagramLinesUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RzLstBox, RzButton, RzCmboBx, RzSpnEdt, RzBckgnd, Mask,
  RzEdit, RzLabel, Dialogs, DB;

type
  TLineAttr = record
    Min,Max: Double;
    Color: TColor;
    PenWidth, PenStyle: Shortint;
  end;

  TDiagramLinesDlg = class(TForm)
    Bevel1: TBevel;
    OkBtn: TRzBitBtn;
    CancelBtn: TRzBitBtn;
    ParamList: TRzListBox;
    WidthSpinner: TRzSpinner;
    PenStyleCombo: TRzComboBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzSeparator2: TRzSeparator;
    ColorBox: TPaintBox;
    RzLabel5: TRzLabel;
    ExampleBox: TPaintBox;
    MinEdit: TRzEdit;
    MaxEdit: TRzEdit;
    LineColorDlg: TColorDialog;
    procedure FormShow(Sender: TObject);
    procedure ParamListClick(Sender: TObject);
    procedure ColorBoxPaint(Sender: TObject);
    procedure ExampleBoxPaint(Sender: TObject);
    procedure ColorBoxClick(Sender: TObject);
    procedure MinEditExit(Sender: TObject);
    procedure MaxEditExit(Sender: TObject);
    procedure WidthSpinnerChange(Sender: TObject);
    procedure PenStyleComboChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LinesAttrArray: array [0..6] of TLineAttr;
  end;

const
  PenStyles: array [0..4] of TPenStyle = (psSolid, psDash, psDot, psDashDot, psDashDotDot);

var
  DiagramLinesDlg: TDiagramLinesDlg;

{Объявление внешних процедур и функций}
  function s_StrToFloat(FloatStr: String): Double; external 'SSR.Dll';

implementation

uses MainUnit, DataUnit;

{$R *.dfm}

{ Действия при визуализации формы }
procedure TDiagramLinesDlg.FormShow(Sender: TObject);
var
  Indx: Integer;
begin
  ParamList.Items := MainForm.DrawLineCombo.Items;
  ParamList.Items.Delete(0);
  with geData.SensorsTable do
   for Indx := 0 to ParamList.Items.Count-1 do
   begin
    Locate('Name',ParamList.Items.Strings[Indx],[loCaseInsensitive]);
    LinesAttrArray[Indx].Min := FieldByName('GrMin').AsFloat;
    LinesAttrArray[Indx].Max := FieldByName('GrMax').AsFloat;
    LinesAttrArray[Indx].Color := FieldByName('Color').AsInteger;
    LinesAttrArray[Indx].PenWidth := FieldByName('LineWidth').AsInteger;
    LinesAttrArray[Indx].PenStyle := FieldByName('LineStyle').AsInteger;
   end;
  ActiveControl := ParamList;
  ParamList.ItemIndex := 0;
  ParamListClick(Self);
end;

{ Выбор параметра }
procedure TDiagramLinesDlg.ParamListClick(Sender: TObject);
begin
  with geData.SensorsTable do
  begin
   MinEdit.Text := FloatToStr(LinesAttrArray[ParamList.ItemIndex].Min);
   MaxEdit.Text := FloatToStr(LinesAttrArray[ParamList.ItemIndex].Max);
   ColorBox.Color := LinesAttrArray[ParamList.ItemIndex].Color;
   WidthSpinner.Value := LinesAttrArray[ParamList.ItemIndex].PenWidth;
   PenStyleCombo.ItemIndex := LinesAttrArray[ParamList.ItemIndex].PenStyle;
   ExampleBox.Repaint;
  end;
end;

{ Изменение максимума шкалы }
procedure TDiagramLinesDlg.MaxEditExit(Sender: TObject);
begin
  try
    LinesAttrArray[ParamList.ItemIndex].Max := s_StrToFloat(MaxEdit.Text);
  except
    LinesAttrArray[ParamList.ItemIndex].Max := 100;
  end;
end;

{ Изменение минимума шкалы }
procedure TDiagramLinesDlg.MinEditExit(Sender: TObject);
begin
  try
    LinesAttrArray[ParamList.ItemIndex].Min := s_StrToFloat(MinEdit.Text);
  except
    LinesAttrArray[ParamList.ItemIndex].Min := 0;
  end;
end;

{ Выбор цвета }
procedure TDiagramLinesDlg.ColorBoxClick(Sender: TObject);
begin
  if LineColorDlg.Execute then
  begin
    ColorBox.Color := LineColorDlg.Color;
    LinesAttrArray[ParamList.ItemIndex].Color := LineColorDlg.Color;
    ExampleBox.Repaint;
  end;
end;

{ Выбор толщины линии }
procedure TDiagramLinesDlg.WidthSpinnerChange(Sender: TObject);
begin
  LinesAttrArray[ParamList.ItemIndex].PenWidth := WidthSpinner.Value;
  if WidthSpinner.Value > 1 then
  begin
   PenStyleCombo.ItemIndex := 0;
   LinesAttrArray[ParamList.ItemIndex].PenStyle := 0;
  end;
  ExampleBox.Repaint;
end;

{ Выбор стиля линии }
procedure TDiagramLinesDlg.PenStyleComboChange(Sender: TObject);
begin
  LinesAttrArray[ParamList.ItemIndex].PenStyle := PenStyleCombo.ItemIndex;
  if PenStyleCombo.ItemIndex > 0 then
  begin
   WidthSpinner.Value := 1;
   LinesAttrArray[ParamList.ItemIndex].PenWidth := 1;
  end;
  ExampleBox.Repaint;
end;

{ Прорисовка индикатора цвета }
procedure TDiagramLinesDlg.ColorBoxPaint(Sender: TObject);
begin
  with ColorBox do
  begin
   Canvas.Brush.Color := Color;
   Canvas.FillRect(Rect(0,0,Width,Height));
   Canvas.Pen.Color := clBlack;
   Canvas.Pen.Style := psSolid;
   Canvas.Rectangle(0,0,Width,Height);
  end;
end;

{ Прорисовка примера линии }
procedure TDiagramLinesDlg.ExampleBoxPaint(Sender: TObject);
begin
  with ExampleBox do
  begin
   Canvas.Pen.Color := clMedGray;
   Canvas.Pen.Style := psSolid;
   Canvas.Rectangle(0,0,Width,Height);
   Canvas.Pen.Color := ColorBox.Color;
   Canvas.Pen.Style := PenStyles[PenStyleCombo.ItemIndex];
   Canvas.Pen.Width := WidthSpinner.Value;
   Canvas.MoveTo(1,1);
   Canvas.LineTo(35,10); Canvas.LineTo(80,20); Canvas.LineTo(70,30);
   Canvas.LineTo(140,40); Canvas.LineTo(100,66);
  end;
end;

end.
