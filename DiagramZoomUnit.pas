{******************************************************************************}
{*          Модуль изменения масштаба диаграммы программы GeoEdit             *}
{*                      (p)2004-2013 Siborg Software                          *}
{******************************************************************************}

unit DiagramZoomUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RzButton, Mask, RzEdit, RzRadChk;

type
  TDiagramZoomDlg = class(TForm)
    Bevel1: TBevel;
    CancelBtn: TRzBitBtn;
    OkBtn: TRzBitBtn;
    PointsRadio: TRzRadioButton;
    MinutesRadio: TRzRadioButton;
    PointsEdit: TRzNumericEdit;
    MinutesEdit: TRzNumericEdit;
    procedure PointsRadioClick(Sender: TObject);
    procedure MinutesRadioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DiagramZoomDlg: TDiagramZoomDlg;

implementation

{$R *.dfm}

{ Действия при создании формы }
procedure TDiagramZoomDlg.FormCreate(Sender: TObject);
begin
  PointsRadioClick(Self);
end;

{ Масштаб в минутах }
procedure TDiagramZoomDlg.MinutesRadioClick(Sender: TObject);
begin
  MinutesEdit.Enabled := True;
  PointsEdit.Enabled := False;
  ActiveControl := MinutesEdit;
end;

{ Масштаб в точках }
procedure TDiagramZoomDlg.PointsRadioClick(Sender: TObject);
begin
  MinutesEdit.Enabled := False;
  PointsEdit.Enabled := True;
  ActiveControl := PointsEdit;
end;

end.
