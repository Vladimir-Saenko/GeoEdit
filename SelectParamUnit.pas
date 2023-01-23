unit SelectParamUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RzLabel, RzCmboBx, RzButton;

type
  TSelectParamDlg = class(TForm)
    CancelBtn: TRzBitBtn;
    OkBtn: TRzBitBtn;
    Bevel1: TBevel;
    ParamCombo: TRzComboBox;
    RzLabel1: TRzLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectParamDlg: TSelectParamDlg;

implementation

uses MainUnit;

{$R *.dfm}

{ Действия при визуализации формы }
procedure TSelectParamDlg.FormShow(Sender: TObject);
var
  Indx: Integer;
begin
  ParamCombo.Items.Clear;
  for Indx := 0 to MainForm.geGrid.Columns.Count - 1 do
    ParamCombo.Items.Append(MainForm.geGrid.Columns.Items[Indx].Title.Caption);
  ParamCombo.ItemIndex := MainForm.geGrid.SelectedIndex;
end;

end.
