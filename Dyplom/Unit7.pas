unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm7 = class(TForm)
    Label2: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm7.FormShow(Sender: TObject);
begin
Edit1.Text := '';
end;

procedure TForm7.Button2Click(Sender: TObject);
begin

if (Edit1.Text = '') then
    ShowMessage('Заполнены не все поля!')
    else begin
    try
      Form2.ADOTable3.Edit;
      Form2.ADOTable3.Append;
      Form2.ADOTable3.Edit;
      Form2.ADOTable3.FieldByName('Nazva').Value := Edit1.Text;
      Form2.ADOTable3.Post;
    except
      Hide;
      ShowMessage('Ошибка выполнения! ErrorCode #' + IntToStr(GetLastError) +
                          #10#13'Повторите попытку или обратитесь к администратору!');
      Form2.ADOTable3.Delete;
      exit;
    end;

    Hide;

    ShowMessage('Запись успешно добавлена!');
  end;
end;

procedure TForm7.Button3Click(Sender: TObject);
begin
Close;
end;

end.
