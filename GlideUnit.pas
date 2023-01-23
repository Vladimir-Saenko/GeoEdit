{******************************************************************************}
{*               Модуль сглаживания параметров программы GeoEdit              *}
{*                      (p)2004-2015 Siborg Software                          *}
{******************************************************************************}

unit GlideUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Mask, RzEdit, RzLabel, RzCmboBx, RzButton;

type
  TGlideDlg = class(TForm)
    CancelBtn: TRzBitBtn;
    OkBtn: TRzBitBtn;
    Bevel1: TBevel;
    ParamCombo: TRzComboBox;
    RzLabel1: TRzLabel;
    KoefGlideEdit: TRzNumericEdit;
    RzLabel2: TRzLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GlideDlg: TGlideDlg;

implementation

uses MainUnit;

{$R *.dfm}

{ Действия при визуализации формы }
procedure TGlideDlg.FormShow(Sender: TObject);
var
  Indx: Integer;
begin
  ParamCombo.Items.Clear;
  for Indx := 0 to MainForm.geGrid.Columns.Count - 1 do
    ParamCombo.Items.Append(MainForm.geGrid.Columns.Items[Indx].Title.Caption);
  ParamCombo.ItemIndex := MainForm.geGrid.SelectedIndex;
end;

end.
