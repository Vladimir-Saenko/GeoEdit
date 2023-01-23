{******************************************************************************}
{*           Модуль редактирования параметров программы GeoEdit               *}
{*                      (p)2004-2013 Siborg Software                          *}
{******************************************************************************}

unit ParamsUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, RzButton, RzLabel, RzRadChk, RzDBChk,
  RzCmboBx, RzDBGrid, Mask, RzEdit, Dialogs;

type
  TParamsForm = class(TForm)
    ParamsGrid: TRzDBGrid;
    RzDBCheckBox1: TRzDBCheckBox;
    OKBtn: TRzBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ParamsForm: TParamsForm;

implementation

{$R *.dfm}

uses DataUnit;

{ Курсор на первуюс точку }
procedure TParamsForm.FormShow(Sender: TObject);
begin
  geData.SensorsTable.First;
end;

end.
