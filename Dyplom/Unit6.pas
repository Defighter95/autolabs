unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm6 = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Button2: TButton;
    Button3: TButton;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm6.FormShow(Sender: TObject);
begin
Edit1.Text := '';
  ComboBox1.Items.Clear;

  Form2.ADOTable3.First;

  while (not Form2.ADOTable3.Eof) do begin
    ComboBox1.Items.Add(Form2.ADOTable3.fieldbyname('Nazva').AsString);
    Form2.ADOTable3.Next;
  end;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
 if (((Edit1.Text = '') or (ComboBox1.ItemIndex = -1)) and (edit_table = 2)) or ((Edit1.Text = '') and (edit_table <> 2)) then
     msg('��������� �� ��� ����!', '������������ ������� ������', 2)
    else begin
    try
    case edit_table of
    2: with Form2.ADOTable2 do begin
      Append;
      Edit;
      FieldByName('FIO').Value := Edit1.Text;
      Edit;
      FieldByName('Group').Value := ComboBox1.Text;
      Post;
    end;
    3: with Form2.ADOTable3 do begin
      Append;
      Edit;
      FieldByName('Nazva').Value := Edit1.Text;
      Post;
      end;
    4: with Form2.ADOTable4 do begin
      Append;
      Edit;
      FieldByName('Nazva').Value := Edit1.Text;
      Post;
    end; end;

    except
      Hide;
      msg('������ ���������� - ���������� �������� ������! ErrorCode #' + IntToStr(GetLastError) +
                  #10#13'��������� ������� ��� ���������� � ��������������!', '������ ���������� �������', 3);
      case edit_table of
      2: Form2.ADOTable2.Delete;
      3: Form2.ADOTable3.Delete;
      4: Form2.ADOTable4.Delete;
      end;
      exit;
    end;

    Hide;
    msg('������ ������� ���������!', '���������� ������', 1);
  end;
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  Edit1.Clear;
  ComboBox1.ItemIndex := -1;
end;

procedure TForm6.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (edit_table = 2) then
    case key of
    '�'..'�', #8, #32: ;
    else key := #0;
    end;
end;

end.
