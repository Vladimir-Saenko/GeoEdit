{******************************************************************************}
{*              Модуль коррекции даты/времени программы GeoEdit               *}
{*                      (p)2004-2013 Siborg Software                          *}
{******************************************************************************}
unit ChangeDateTimeUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RzButton, RzLabel, Mask, RzEdit, RzSpnEdt, RzRadChk;

type
  TChangeDateTimeDlg = class(TForm)
    Bevel1: TBevel;
    NewDateMaskEdit: TRzMaskEdit;
    RzLabel2: TRzLabel;
    OldDateMaskEdit: TRzMaskEdit;
    RzLabel1: TRzLabel;
    OkBtn: TRzBitBtn;
    CancelBtn: TRzBitBtn;
    IntervalCheck: TRzCheckBox;
    IntervalSpinEdit: TRzSpinEdit;
    RzLabel3: TRzLabel;
    procedure IntervalCheckClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangeDateTimeDlg: TChangeDateTimeDlg;

implementation

{$R *.dfm}

{ Изменение интервала }
procedure TChangeDateTimeDlg.IntervalCheckClick(Sender: TObject);
begin
  IntervalSpinEdit.Enabled := IntervalCheck.Checked;
end;

end.
