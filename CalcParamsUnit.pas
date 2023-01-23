{******************************************************************************}
{*             Модуль вычисляемых параметров программы GeoEdit                *}
{*                      (p)2004-2013 Siborg Software                          *}
{******************************************************************************}
unit CalcParamsUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, ComCtrls, IniFiles;

type
  TCalcParamsDlg = class(TForm)
    OKBtn: TBitBtn;
    GroupBox2: TGroupBox;
    PageControl1: TPageControl;
    VTab: TTabSheet;
    EnterTab: TTabSheet;
    ExitTab: TTabSheet;
    V_1: TCheckBox;
    V_2: TCheckBox;
    V_3: TCheckBox;
    V_4: TCheckBox;
    V_5: TCheckBox;
    V_6: TCheckBox;
    V_Dol: TCheckBox;
    V_Vibr: TCheckBox;
    Enter_1: TCheckBox;
    Enter_2: TCheckBox;
    Enter_3: TCheckBox;
    Enter_4: TCheckBox;
    Enter_5: TCheckBox;
    Enter_6: TCheckBox;
    Enter_Dol: TCheckBox;
    Exit_1: TCheckBox;
    Exit_2: TCheckBox;
    Exit_3: TCheckBox;
    Exit_4: TCheckBox;
    Exit_5: TCheckBox;
    Exit_6: TCheckBox;
    Exit_Vibr: TCheckBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ZeroEdit_1: TEdit;
    Label2: TLabel;
    ZeroEdit_2: TEdit;
    Label3: TLabel;
    ZeroEdit_3: TEdit;
    Label4: TLabel;
    ZeroEdit_4: TEdit;
    Label5: TLabel;
    ZeroEdit_5: TEdit;
    ZeroEdit_6: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    ZeroEdit_Dol: TEdit;
    ZeroEdit_Vibr: TEdit;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    SEdit_1: TEdit;
    SEdit_2: TEdit;
    SEdit_3: TEdit;
    SEdit_4: TEdit;
    SEdit_5: TEdit;
    SEdit_6: TEdit;
    SEdit_Dol: TEdit;
    SEdit_Vibr: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CalcParamsDlg: TCalcParamsDlg;
  MyDir: String;

implementation

{$R *.dfm}

{ Действия при построении формы }
procedure TCalcParamsDlg.FormCreate(Sender: TObject);
var
  MyIni: TIniFile;
begin
  GetDir(0,MyDir);
  MyIni := TIniFile.Create(MyDir + '\GeoEdit.ini');
  V_1.Checked := MyIni.ReadBool('CalcParam','V_1',False);
  V_2.Checked := MyIni.ReadBool('CalcParam','V_2',False);
  V_3.Checked := MyIni.ReadBool('CalcParam','V_3',False);
  V_4.Checked := MyIni.ReadBool('CalcParam','V_4',False);
  V_5.Checked := MyIni.ReadBool('CalcParam','V_5',False);
  V_6.Checked := MyIni.ReadBool('CalcParam','V_6',False);
  V_Dol.Checked := MyIni.ReadBool('CalcParam','V_Dol',False);
  V_Vibr.Checked := MyIni.ReadBool('CalcParam','V_Vibr',False);
  Enter_1.Checked := MyIni.ReadBool('CalcParam','Enter_1',False);
  Enter_2.Checked := MyIni.ReadBool('CalcParam','Enter_2',False);
  Enter_3.Checked := MyIni.ReadBool('CalcParam','Enter_3',False);
  Enter_4.Checked := MyIni.ReadBool('CalcParam','Enter_4',False);
  Enter_5.Checked := MyIni.ReadBool('CalcParam','Enter_5',False);
  Enter_6.Checked := MyIni.ReadBool('CalcParam','Enter_6',False);
  Enter_Dol.Checked := MyIni.ReadBool('CalcParam','Enter_Dol',False);
  Exit_1.Checked := MyIni.ReadBool('CalcParam','Exit_1',False);
  Exit_2.Checked := MyIni.ReadBool('CalcParam','Exit_2',False);
  Exit_3.Checked := MyIni.ReadBool('CalcParam','Exit_3',False);
  Exit_4.Checked := MyIni.ReadBool('CalcParam','Exit_4',False);
  Exit_5.Checked := MyIni.ReadBool('CalcParam','Exit_5',False);
  Exit_6.Checked := MyIni.ReadBool('CalcParam','Exit_6',False);
  Exit_Vibr.Checked := MyIni.ReadBool('CalcParam','Exit_Vibr',False);
  ZeroEdit_1.Text := MyIni.ReadString('CalcParam','Zero_1','0');
  ZeroEdit_2.Text := MyIni.ReadString('CalcParam','Zero_2','0');
  ZeroEdit_3.Text := MyIni.ReadString('CalcParam','Zero_3','0');
  ZeroEdit_4.Text := MyIni.ReadString('CalcParam','Zero_4','0');
  ZeroEdit_5.Text := MyIni.ReadString('CalcParam','Zero_5','0');
  ZeroEdit_6.Text := MyIni.ReadString('CalcParam','Zero_6','0');
  ZeroEdit_Dol.Text := MyIni.ReadString('CalcParam','Zero_Dol','0');
  ZeroEdit_Vibr.Text := MyIni.ReadString('CalcParam','Zero_Vibr','0');
  SEdit_1.Text := MyIni.ReadString('CalcParam','S_1','0');
  SEdit_2.Text := MyIni.ReadString('CalcParam','S_2','0');
  SEdit_3.Text := MyIni.ReadString('CalcParam','S_3','0');
  SEdit_4.Text := MyIni.ReadString('CalcParam','S_4','0');
  SEdit_5.Text := MyIni.ReadString('CalcParam','S_5','0');
  SEdit_6.Text := MyIni.ReadString('CalcParam','S_6','0');
  SEdit_Dol.Text := MyIni.ReadString('CalcParam','S_Dol','0');
  SEdit_Vibr.Text := MyIni.ReadString('CalcParam','S_Vibr','0');
  MyIni.Free;
end;



procedure TCalcParamsDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(MyDir + '\GeoEdit.ini');
  MyIni.WriteBool('CalcParam','V_1',V_1.Checked);
  MyIni.WriteBool('CalcParam','V_2',V_2.Checked);
  MyIni.WriteBool('CalcParam','V_3',V_3.Checked);
  MyIni.WriteBool('CalcParam','V_4',V_4.Checked);
  MyIni.WriteBool('CalcParam','V_5',V_5.Checked);
  MyIni.WriteBool('CalcParam','V_6',V_6.Checked);
  MyIni.WriteBool('CalcParam','V_Dol',V_Dol.Checked);
  MyIni.WriteBool('CalcParam','V_Vibr',V_Vibr.Checked);
  MyIni.WriteBool('CalcParam','Enter_1',Enter_1.Checked);
  MyIni.WriteBool('CalcParam','Enter_2',Enter_2.Checked);
  MyIni.WriteBool('CalcParam','Enter_3',Enter_3.Checked);
  MyIni.WriteBool('CalcParam','Enter_4',Enter_4.Checked);
  MyIni.WriteBool('CalcParam','Enter_5',Enter_5.Checked);
  MyIni.WriteBool('CalcParam','Enter_6',Enter_6.Checked);
  MyIni.WriteBool('CalcParam','Enter_Dol',Enter_Dol.Checked);
  MyIni.WriteBool('CalcParam','Exit_1',Exit_1.Checked);
  MyIni.WriteBool('CalcParam','Exit_2',Exit_2.Checked);
  MyIni.WriteBool('CalcParam','Exit_3',Exit_3.Checked);
  MyIni.WriteBool('CalcParam','Exit_4',Exit_4.Checked);
  MyIni.WriteBool('CalcParam','Exit_5',Exit_5.Checked);
  MyIni.WriteBool('CalcParam','Exit_6',Exit_6.Checked);
  MyIni.WriteBool('CalcParam','Exit_Vibr',Exit_Vibr.Checked);
  MyIni.WriteString('CalcParam','Zero_1',ZeroEdit_1.Text);
  MyIni.WriteString('CalcParam','Zero_2',ZeroEdit_2.Text);
  MyIni.WriteString('CalcParam','Zero_3',ZeroEdit_3.Text);
  MyIni.WriteString('CalcParam','Zero_4',ZeroEdit_4.Text);
  MyIni.WriteString('CalcParam','Zero_5',ZeroEdit_5.Text);
  MyIni.WriteString('CalcParam','Zero_6',ZeroEdit_6.Text);
  MyIni.WriteString('CalcParam','Zero_Dol',ZeroEdit_Dol.Text);
  MyIni.WriteString('CalcParam','Zero_Vibr',ZeroEdit_Vibr.Text);
  MyIni.WriteString('CalcParam','S_1',SEdit_1.Text);
  MyIni.WriteString('CalcParam','S_2',SEdit_2.Text);
  MyIni.WriteString('CalcParam','S_3',SEdit_3.Text);
  MyIni.WriteString('CalcParam','S_4',SEdit_4.Text);
  MyIni.WriteString('CalcParam','S_5',SEdit_5.Text);
  MyIni.WriteString('CalcParam','S_6',SEdit_6.Text);
  MyIni.WriteString('CalcParam','S_Dol',SEdit_Dol.Text);
  MyIni.WriteString('CalcParam','S_Vibr',SEdit_Vibr.Text);
  MyIni.Free;
end;

end.
