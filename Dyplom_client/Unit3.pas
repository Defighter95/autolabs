unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Timer1: TTimer;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  CloseQuery;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  Label1.Caption := '������: ' + filename;
  Label2.Caption := '�����: ' + IntToStr(time_down) + ' : ' + IntToStr(sec); // ��������� ����� � ���� - ����
  Label3.Caption := '';
  Form3.Left := Screen.DesktopWidth - 235;
  Form3.Top := Screen.DesktopHeight - 155;
  Form2.hide;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  if MessageBox(Handle, '�� ����� ������ ����� � ��������� ������ ��������?'#10#13'���� ����� ���������� ��������� �� ������',
    '��������� � �����', MB_OKCANCEL + MB_ICONQUESTION) = 1 then
    time_out
  else CanClose := false;
end;

end.
