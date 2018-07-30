unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm5 = class(TForm)
    Label3: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit1, Unit2;

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
  if (Edit1.Text = Edit2.Text) and (Length(Edit1.Text) = 4) then begin

    with form1 do begin
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('UPDATE [Students] SET [Password] = "' + Edit2.Text +
                      '" WHERE (([FIO]="' + ComboBox1.Text + '")' +
                      ' AND ([Group]="' + ComboBox2.Text + '"));');
      ADOQuery1.ExecSQL;
    end;

    Close;
    msg('Пароль успешно создан!', 'Создание пароля', 1);
    ShowMessage('Пароль успешно создан!');
    Form1.Hide;
    form2.show;
  end
  else if (Edit1.Text <> Edit2.Text) then begin msg('Пароли не совпадают!', 'Создание пароля', 2); 
    Edit1.Clear; Edit2.Clear;
    Edit1.SetFocus;
    end else msg('Пароль должен состоять из 4-х символов!', 'Создание пароля', 2);
end;

procedure TForm5.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if ((key < '0') or (key > '9')) and (key <> #8) then key := #0;
end;

procedure TForm5.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if ((key < '0') or (key > '9')) and (key <> #8) then key := #0;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
Close;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
Edit1.Clear; Edit2.Clear;
Edit1.SetFocus;
end;

end.
