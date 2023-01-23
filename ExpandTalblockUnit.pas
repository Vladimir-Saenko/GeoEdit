unit ExpandTalblockUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzLabel, RzButton, ExtCtrls;

type
  TExpandTalblockDlg = class(TForm)
    Bevel1: TBevel;
    OkBtn: TRzBitBtn;
    CancelBtn: TRzBitBtn;
    RzLabel5: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    BeginValueEdit: TRzEdit;
    RealDeltaEdit: TRzEdit;
    EtalonDeltaEdit: TRzEdit;
    procedure FormShow(Sender: TObject);
    procedure BeginValueEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExpandTalblockDlg: TExpandTalblockDlg;

implementation

uses MainUnit;

{$R *.dfm}

{ Действия при визуализации формы }
procedure TExpandTalblockDlg.FormShow(Sender: TObject);
begin
  //
end;

{ Проверка правильности значений }
procedure TExpandTalblockDlg.BeginValueEditChange(Sender: TObject);
var
  ErrorFlag : Boolean;
  Value : Double;
begin
 Value := 0;
 try
  ErrorFlag := False;
  Value := s_StrToFloat(BeginValueEdit.Text);
  Value := Value + s_StrToFloat(RealDeltaEdit.Text);
  Value := Value + s_StrToFloat(EtalonDeltaEdit.Text);
 except
  ErrorFlag := True;
 end;
 if (Value < 0) or ErrorFlag then OkBtn.Enabled := False
                             else OkBtn.Enabled := True;
end;

end.
