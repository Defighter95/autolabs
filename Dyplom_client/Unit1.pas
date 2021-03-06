unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, ADODB, AdoConEd, FileCtrl, Mask, ShellAPI;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    Button1: TButton;
    ADOTable2: TADOTable;
    Label2: TLabel;
    DataSource2: TDataSource;
    Label3: TLabel;
    Edit1: TEdit;
    ADOQuery1: TADOQuery;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox2Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;
  server_path:string;
  curr_dir:string;
  connection_string:string;
  pc_name:string;
  pass:string;

  function get_file_data(files:string):string;
  procedure set_file_data(s:string; files:string);
  function get_pass(file_name:string):string;

implementation

uses DateUtils, Unit2, Unit5;

{$R *.dfm}

function get_pass(file_name:string):string; // �������� ������
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

function get_file_data(files:string):string;
var f:TextFile; s:string;
begin
AssignFile(f, curr_dir + '\' + files + '.data');
Reset(f);
Readln(f, s);
CloseFile(f);
result := s;
end;

procedure set_file_data(s:string; files:string);
var f:TextFile;
begin
AssignFile(f, curr_dir + '\' + files + '.data');
Rewrite(f);
Writeln(f, s);
CloseFile(f);
end;

procedure TForm1.FormShow(Sender: TObject);
begin

curr_dir := GetCurrentDir;

if get_file_data('path') = '' then begin

  msg('����� ����������!'#10#13'����� ������ �������� ���������� ���������� ������ ���� � ������� ���������� � ��������� ������ ���������� � ����� ������', '����� ����������', 1);
  while server_path = '' do SelectDirectory('�������� ���� � ����� � ����������� - ��������', '/', server_path);

    if (not FileExists(server_path + '\db.mdb'))then begin msg('� ��������� ����� ������������ ������ ����������!', '��������� ������', 3);
    form1.close;  exit;  end;

    pc_name := InputBox('��� ��', '������� ������� ��� ������ ��', '');

    ADOConnection1.Close;

    if EditConnectionString(ADOConnection1) then begin
      ADOConnection1.Connected := true;
      connection_string := ADOConnection1.ConnectionString;
    end;

    set_file_data(pc_name, 'pc');
    set_file_data(server_path, 'path');
    set_file_data(connection_string, 'connection');
end

  else begin
  ADOConnection1.Close;
  ADOConnection1.ConnectionString := get_file_data('connection');
  ADOConnection1.Connected := true;
  end;

  ADOTable1.Active := true;
  ADOTable2.Active := true;

  ADOTable2.Sort := 'Nazva';

  pc_name := get_file_data('pc');
  server_path := get_file_data('path');
  pass := get_pass(server_path + '\pass_adm.data');


  ComboBox2.Clear;
  ADOTable2.First;

  while (ADOTable2.Eof <> true) do begin
    ComboBox2.Items.Add(ADOTable2.FieldByName('Nazva').AsString);
    ADOTable2.Next;
  end;

ComboBox2.ItemIndex := -1;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('Select * From Students Where (FIO="' + ComboBox1.Text +
                      '") and ([Group]="' + ComboBox2.Text + '");');
  ADOQuery1.Active := true;

   // ShowMessage(ADOQuery1.FieldByName('Password').AsString);



    if(ComboBox1.ItemIndex <> - 1) then begin

      if (ADOQuery1.FieldByName('Password').AsString = '') then begin
    msg('����� ������ ������ ���������� ������� ������!', '��������� ����', 2);
    form5.show;
  end else
      if (ADOQuery1.FieldByName('Password').AsString = Edit1.Text) then begin
        Hide;
        Form2.Show;
      end else msg('�������� ������!', '������ �����', 2);
    end else msg('�������� ���� ��� �� ������!', '������ �����', 2);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if ((key < '0') or (key > '9')) and (key <> #8) then key := #0;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ShellExecute(Handle, 'open', 'clear_temp.bat', nil, nil, SW_Show); // ����� ������� ������� ���������� ��������
end;

procedure TForm1.ComboBox2Click(Sender: TObject);
begin
ComboBox1.Clear;
ADOTable1.First;
while (ADOTable1.Eof <> true) do begin

  if (ADOTable1.FieldByName('Group').AsString = ComboBox2.Text) then
    ComboBox1.Items.Add(ADOTable1.FieldByName('FIO').AsString);
  ADOTable1.Next;
end;
ComboBox1.Sorted := true;

ComboBox1.ItemIndex := -1;
end;

end.
