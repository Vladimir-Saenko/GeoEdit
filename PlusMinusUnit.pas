unit PlusMinusUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RzButton, Mask, RzEdit, RzLabel, RzCmboBx, RzRadChk;

type
  TPlusMinusDlg = class(TForm)
    CancelBtn: TRzBitBtn;
    OkBtn: TRzBitBtn;
    Bevel1: TBevel;
    ParamCombo: TRzComboBox;
    RzLabel1: TRzLabel;
    PlusMinusEdit: TRzEdit;
    RzLabel7: TRzLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PlusMinusDlg: TPlusMinusDlg;

implementation

uses MainUnit;

{$R *.dfm}

{ Действия при визуализации формы }
procedure TPlusMinusDlg.FormShow(Sender: TObject);
var
  Indx: Integer;
begin
  ParamCombo.Items.Clear;
  for Indx := 0 to MainForm.geGrid.Columns.Count - 1 do
    ParamCombo.Items.Append(MainForm.geGrid.Columns.Items[Indx].Title.Caption);
  ParamCombo.ItemIndex := MainForm.geGrid.SelectedIndex;
end;

end.
