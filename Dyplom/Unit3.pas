unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Edit3: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    ADOTable1: TADOTable;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  pass:string;

implementation

uses Unit1, Unit2;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject); // смена пароля администратора / оператора
begin

  if(Edit1.Text = get_pass(pass_file)) and (Edit2.Text = Edit3.Text) and (Edit2.Text <> '') and
      (Edit1.Text <> Edit2.Text) then begin
    set_pass(Edit2.Text, pass_file);
    ADOTable1.Open;
    ADOTable1.Append;
    ADOTable1.Edit;
    ADOTable1.FieldByName('Password').Value := edit2.Text;
    ADOTable1.Edit;
    ADOTable1.FieldByName('Creation Date').Value := date;
    ADOTable1.Post;
    msg('Пароль успешно изменён!', 'Изменение пароля', 1);
    Close; exit;
  end
  else if (Edit1.Text <> get_pass(pass_file)) then msg('Неправильный текущий пароль!', 'Ошибка при смене пароля!', 2)
    else if (Edit1.Text = Edit2.Text) then msg('Старый и новый пароли совпадают!', 'Ошибка при смене пароля!', 2)
      else if (Edit2.Text = '') then msg('Пароль не может быть пустым!', 'Ошибка при смене пароля!', 2)
        else msg('Поля нового пароля не совпадают!', 'Ошибка при смене пароля!', 2);
  Edit1.Clear; Edit2.Clear; Edit3.Clear;
  Edit1.SetFocus;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  Edit1.Clear; Edit2.Clear; Edit3.Clear;
  Edit1.SetFocus;
end;

end.
