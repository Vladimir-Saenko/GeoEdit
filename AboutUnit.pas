{******************************************************************************}
{*                     Модуль About программы GeoEdit                         *}
{*                      (p)2004-2019 Siborg Software                          *}
{******************************************************************************}

unit AboutUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RzLabel, RzButton, RzBckgnd, jpeg, RzPanel, RzEdit;

type
  TAboutBox = class(TForm)
    RzPanel1: TRzPanel;
    Image1: TImage;
    RzLabel1: TRzLabel;
    RzSeparator2: TRzSeparator;
    RzSeparator1: TRzSeparator;
    CloseBtn: TRzBitBtn;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzSeparator3: TRzSeparator;
    RzLabel6: TRzLabel;
    LicTypeLabel: TRzLabel;
    RzLabel7: TRzLabel;
    LicDateLabel: TRzLabel;
    RzURLLabel1: TRzURLLabel;
    HistoryBtn: TRzBitBtn;
    RzLabel5: TRzLabel;
    RzLabel8: TRzLabel;
    InfoPanel: TRzPanel;
    HistoryMemo: TRzMemo;
    InfoMemo: TRzMemo;
    procedure CloseBtnClick(Sender: TObject);
    procedure HistoryBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MainDir: String;
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

procedure TAboutBox.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TAboutBox.FormShow(Sender: TObject);
begin
  InfoPanel.Visible := False;
  AboutBox.Height := 335;
  HistoryMemo.Lines.LoadFromFile(MainDir + '\History.txt');
end;

procedure TAboutBox.HistoryBtnClick(Sender: TObject);
begin
  InfoPanel.Visible := not InfoPanel.Visible;
  if InfoPanel.Visible then AboutBox.Height := 680
                       else AboutBox.Height := 335;
end;

end.
 
