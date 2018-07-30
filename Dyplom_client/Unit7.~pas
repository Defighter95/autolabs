unit Unit7;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ShellApi;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    ProgramIcon: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

uses Unit2;

{$R *.dfm}

procedure TAboutBox.Button1Click(Sender: TObject);
begin
Close;
end;

procedure TAboutBox.Label6Click(Sender: TObject);
Begin
ShellExecute(0,'Open','mailto:iliakobus@yandex.ru',Nil,Nil,SW_SHOWDEFAULT);
end;

end.
 
