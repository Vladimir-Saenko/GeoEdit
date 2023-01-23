{******************************************************************************}
{*                 Модуль задания блока программы GeoEdit                     *}
{*                      (p)2004-2013 Siborg Software                          *}
{******************************************************************************}
unit BlockSetUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RzButton, RzLabel, Mask, RzEdit;

type
  TBlockSetDlg = class(TForm)
    CancelBtn: TRzBitBtn;
    OkBtn: TRzBitBtn;
    Bevel1: TBevel;
    BeginMaskEdit: TRzMaskEdit;
    RzLabel1: TRzLabel;
    EndMaskEdit: TRzMaskEdit;
    RzLabel2: TRzLabel;
    procedure FormShow(Sender: TObject);
    procedure EndMaskEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BlockSetDlg: TBlockSetDlg;

implementation

{$R *.dfm}

{ Проверка корректности ввода }
procedure TBlockSetDlg.EndMaskEditChange(Sender: TObject);
var
  BeginDateTime, EndDateTime: TDateTime;
begin
  try
   BeginDateTime := StrToDateTime(BeginMaskEdit.Text);
   EndDateTime := StrToDateTime(EndMaskEdit.Text);
   if EndDateTime > BeginDateTime
    then OkBtn.Enabled := True
    else OkBtn.Enabled := False;
  except
   OkBtn.Enabled := False;
  end;
end;

{ Действия при визуализации формы }
procedure TBlockSetDlg.FormShow(Sender: TObject);
begin
 OkBtn.Enabled := False;
end;

end.
