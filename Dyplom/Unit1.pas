unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  curr_dir:string;
  pass_file:string;
  function get_pass(file_name:string):string;
  procedure set_pass(s:string; file_name:string);

implementation

uses Unit2, Unit4;

{$R *.dfm}

function get_file_data(files:string):string;
var f:TextFile; s:string;
begin
  AssignFile(f, curr_dir + '\' + files + '.data');
  Reset(f);
  Readln(f, s);
  CloseFile(f);
  result := s;
end;

function get_pass(file_name:string):string; // полуение пароля
var f:TextFile; s:string; i:byte;
begin

  AssignFile(f, file_name);
  Reset(f);
    Readln(f, s);

    for i := 1 to Length(s) do
      s[i] := char(ord(s[i]) + i);

  Close(f);
  result := s;
end;

procedure set_pass(s:string; file_name:string); // установка пароля
var f:TextFile; i:byte;
begin

  AssignFile(f, file_name);
  Rewrite(f);

    for i := 1 to Length(s) do
      s[i] := char(ord(s[i]) - i);

    Writeln(f, s);
  Close(f);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close; 
end;

procedure TForm1.Button1Click(Sender: TObject);
begin

 // if ComboBox1.ItemIndex = 0 then    // выбор пароля: админ или оператор
    pass_file := 'pass_adm.data';
 // else
 //   pass_file := 'pass_oper.data';

  if (get_pass(pass_file) = '') then begin
    msg('Пароль отсутствует! Это может быть следствием сбоя программы, либо стороннего вмешательства. Обратитесь к администратору, автору ПО либо выполните переустановку прораммы для исправления ситуации', 'Фатальная ошибка!', 3);
    halt;
  end;

  if (LabeledEdit2.Text = get_pass(pass_file)) then // проверка логина и пароля
    Form2.Show

      else msg('Неправильный пароль!', 'Ощибка входа!', 2)
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  curr_dir := GetCurrentDir; // исходная директрия - папка с .exe
  // Form2.ADOConnection1.ConnectionString := get_file_data('db');
end;

end.
