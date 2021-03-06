unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    ComboBox1: TComboBox;
    UpDown1: TUpDown;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  files:string;

implementation

uses unit2, unit1;

{$R *.dfm}

procedure clear_fields;
begin
  With Form5 do begin
    Edit1.Text := '';
    Edit2.Text := '';
    ComboBox1.Items.Clear;
    files := '';
  end;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  // ������� �����
  clear_fields;

  Form2.ADOTable4.First;

  while (not Form2.ADOTable4.Eof) do begin // ��������� ������ ���������
    ComboBox1.Items.Add(Form2.ADOTable4.fieldbyname('Nazva').AsString);
    Form2.ADOTable4.Next;
  end;
end;

procedure TForm5.Button2Click(Sender: TObject); // ���������� ������
begin
  // ���������� ��������� ��
  if (Edit1.Text = '') or (Edit2.Text = '') or (ComboBox1.ItemIndex = -1) or (files = '') then
    msg('��������� �� ��� ����!', '������������ ������� ������', 2)
    else begin
      try
        Form2.ADOTable1.Edit;
        Form2.ADOTable1.Append;
        Form2.ADOTable1.Edit;
        Form2.ADOTable1.FieldByName('Names').Value := ComboBox1.Text + '_' + Edit1.Text;
        Form2.ADOTable1.Edit;
        Form2.ADOTable1.FieldByName('Lesson').Value := ComboBox1.Text;
        Form2.ADOTable1.Edit;
        Form2.ADOTable1.FieldByName('Time_for_work(min)').Value := Edit2.Text;
        Form2.ADOTable1.Edit;
        Form2.ADOTable1.FieldByName('Path').Value := files;
        Form2.ADOTable1.Post;
        Hide;
        msg('������ ������� ���������!', '���������� ������', 1);
        is_open_f5 := false;

      except
        Hide;
        msg('������ ���������� - ���������� �������� ������! ErrorCode #' + IntToStr(GetLastError) +
                    #10#13'��������� ������� ��� ���������� � ��������������!', '������ ���������� �������', 3);
        Form2.ADOTable1.Delete;
        exit;
      end;

    with form2 do begin

    if not CopyFile(PAnsiChar(string(ADOTable1.FieldByName('Path').Value)),
                    PAnsiChar(string(curr_dir + '\resourses\' +  ADOTable1.FieldByName('Names').Value +
                    ExtractFileExt(files))), true) then begin
      msg('������ ���������� - �� ������� ����������� ���� ��������! ErrorCode #' + IntToStr(GetLastError) +
                  #10#13'��������� ������� ��� ���������� � ��������������!', '������ ����������� �����', 3);
      Form2.ADOTable1.Delete; exit;
    end; end;
  end;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then files := OpenDialog1.FileName;
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
  Hide;
end;

procedure TForm5.Edit2KeyPress(Sender: TObject; var Key: Char); // ������ ��������� �����
begin
  if ((key < '0') or (key > '9')) and (key <> #8) then key := #0;
end;

procedure TForm5.Button4Click(Sender: TObject);
begin
  clear_fields;
end;

procedure TForm5.Edit1KeyPress(Sender: TObject; var Key: Char);
begin

case key of
'A'..'z', '�'..'�', '0'..'9', #8, #32: ;
else key := #0;
end; end;

end.
