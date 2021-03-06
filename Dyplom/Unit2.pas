unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, DBCtrls, Grids, DBGrids, ComCtrls, Menus, ShellAPI,
  ToolWin, ImgList, StdCtrls, DateUtils, ComObj, WordXP, jpeg, OleServer;

type
  TForm2 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    Options1: TMenuItem;
    Changepassword1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    Change1: TMenuItem;
    ADOTable2: TADOTable;
    DataSource2: TDataSource;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    ADOTable3: TADOTable;
    ADOTable4: TADOTable;
    ImageList1: TImageList;
    DataSource5: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    TabSheet4: TTabSheet;
    DBGrid4: TDBGrid;
    ToolBar2: TToolBar;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolBar3: TToolBar;
    ToolButton1: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolBar4: TToolBar;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ADOQuery1: TADOQuery;
    TabSheet5: TTabSheet;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolBar5: TToolBar;
    ToolButton28: TToolButton;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    Button1: TButton;
    DBGrid5: TDBGrid;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Label1: TLabel;
    ToolButton27: TToolButton;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    ADOQuery2: TADOQuery;
    procedure Exit1Click(Sender: TObject);
    procedure Change1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Changepassword1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton19Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);
    procedure ToolButton22Click(Sender: TObject);
    procedure ToolButton23Click(Sender: TObject);
    procedure ToolButton24Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure DBGrid2Enter(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  s, s2:string;
  report, edit_table:byte;
  is_open_f5:boolean;
  procedure msg(text:String; head:String = ''; m_type:UINT = 1);
  procedure build_report(N:Byte);
  procedure delete_rec(A:TADOTable);
  procedure edit_mode(Grid:TDBGrid; But:TToolButton);

implementation

uses Unit1, Math, VarUtils, Unit3, Unit5, Unit6, Unit7, Unit8, Unit9,
  Unit10;

{$R *.dfm}
// msg(���������; ��������� ����; ��� ����(������, ��. ����))
procedure msg(text:String; head:String; m_type:UINT); // �������� ������ ������ ������ � MessageBox
begin
  case m_type of                     // ������ ���� (1 - ������ I, 2 - ���� !, 3 - ������ (����� � ������� �����))
    1: m_type := MB_ICONASTERISK;
    2: m_type := MB_ICONWARNING;
    3: m_type := MB_ICONERROR;
  end;
  MessageBox(0, PAnsiChar(text), PAnsiChar(head), MB_OK + m_type);
end;
// edit_mode(�������, ��� ������� ���. �����; ������, ���������� �� ������������ ������ ���/����)
procedure edit_mode(Grid:TDBGrid; But:TToolButton); // ����� �������������� ������� �������
begin
  Grid.ReadOnly := not Grid.ReadOnly;

  if (Grid.ReadOnly) then Grid.Options := Grid.Options - [dgEditing]  // ������ ���� � ����� "������������� ���/����"
    else Grid.Options := Grid.Options + [dgEditing];

  But.Marked := not But.Marked;      // ����� ���-�� ��� - ��������� �������� "��������������"
  if(But.Name = 'ToolButton21') then Form2.Change1.Enabled := not Form2.Change1.Enabled;
end;
// delete_rec(�������, �� ������� ������� ������)
procedure delete_rec(A:TADOTable);  // �������� ������ �� �������
begin
  with form2 do
  try
    if MessageBox(Handle, '������� ������?','��������', MB_OKCANCEL + MB_ICONQUESTION) = 1 then
      A.Delete;
  except
    msg('������ ���������� - ���������� ������� ������! ErrorCode #' + IntToStr(GetLastError) +
                 #10#13'��������� ������� ��� ���������� � ��������������!', '������ ��������', 3)
  end;
end;
// build_report(ID ������)
// ID's: 1. �� ���, 2. �� ����, 3. �� �� � ������, 4. �������� � ������, 5. �� �� ��������
procedure build_report(N:Byte); // ���������� ������� � Word - ��������
var W:variant; i:integer;
begin

  with form2 do begin
    W := CreateOleObject('Word.Application'); // �������� COM ������� MS Word

    // �������� ���������
    W.Documents.Add;
    W.Selection.Move(WdParagraph, 1);
    W.ActiveDocument.Range.InsertBefore(' ');
    W.Selection.Move(WdParagraph, 1);

    case N of // ����� ������ ������� �����������
      1: W.ActiveDocument.Tables.Add(Range := W.Selection.Range, NumRows := 2, NumColumns := 6);
      2: W.ActiveDocument.Tables.Add(Range := W.Selection.Range, NumRows := 2, NumColumns := 7);
      3: W.ActiveDocument.Tables.Add(Range := W.Selection.Range, NumRows := 2, NumColumns := 5);
      4: W.ActiveDocument.Tables.Add(Range := W.Selection.Range, NumRows := 2, NumColumns := 2);
      5: W.ActiveDocument.Tables.Add(Range := W.Selection.Range, NumRows := 2, NumColumns := 2);
    end;

    case N of // ������� �������
      1: begin
        W.ActiveDocument.Tables.item(1).Cell(1, 1).Range.Text := '� �/�';
        W.ActiveDocument.Tables.item(1).Cell(1, 2).Range.Text := '�������� ��';
        W.ActiveDocument.Tables.item(1).Cell(1, 3).Range.Text := '���� ����������';
        W.ActiveDocument.Tables.item(1).Cell(1, 4).Range.Text := '����� ������';
        W.ActiveDocument.Tables.item(1).Cell(1, 5).Range.Text := '� ��';
        W.ActiveDocument.Tables.item(1).Cell(1, 6).Range.Text := '���������� ���.';
      end;
      2: begin
        W.ActiveDocument.Tables.item(1).Cell(1, 1).Range.Text := '� �/�';
        W.ActiveDocument.Tables.item(1).Cell(1, 2).Range.Text := '�������� ��';
        W.ActiveDocument.Tables.item(1).Cell(1, 3).Range.Text := '��� ��������';
        W.ActiveDocument.Tables.item(1).Cell(1, 4).Range.Text := '������';
        W.ActiveDocument.Tables.item(1).Cell(1, 5).Range.Text := '����� ����������';
        W.ActiveDocument.Tables.item(1).Cell(1, 6).Range.Text := '� ��';
        W.ActiveDocument.Tables.item(1).Cell(1, 7).Range.Text := '���������� ���.';
      end;
      3: begin
        W.ActiveDocument.Tables.item(1).Cell(1, 1).Range.Text := '� �/�';
        W.ActiveDocument.Tables.item(1).Cell(1, 2).Range.Text := '��� ��������';
        W.ActiveDocument.Tables.item(1).Cell(1, 3).Range.Text := '����� ����������';
        W.ActiveDocument.Tables.item(1).Cell(1, 4).Range.Text := '� ��';
        W.ActiveDocument.Tables.item(1).Cell(1, 5).Range.Text := '���������� ���.';
      end;
      4: begin
        W.ActiveDocument.Tables.item(1).Cell(1, 1).Range.Text := '� �/�';
        W.ActiveDocument.Tables.item(1).Cell(1, 2).Range.Text := '�������� ��';
      end;
      5: begin
        W.ActiveDocument.Tables.item(1).Cell(1, 1).Range.Text := '� �/�';
        W.ActiveDocument.Tables.item(1).Cell(1, 2).Range.Text := '��� ��������';
      end;
    end;

   W.ActiveDocument.Tables.item(1).AutoFormat(17); // ����� �������

    ADOQuery2.SQL.Clear;

    case N of // �������������� ����� - ��������� SQL ������
      1:
        ADOQuery2.SQL.Add('SELECT * FROM Students INNER JOIN Works ON Students.FIO = Works.Student ' +
                        'WHERE (((Students.FIO)="' + S + '") AND ((Students.Group)="' + S2 + '")) Order by Lab;');
      2:
        ADOQuery2.SQL.Add('SELECT * FROM Students INNER JOIN Works ON Students.FIO = Works.Student ' +
                          'Where ([_Date]=#' + S + '#) Order by Group, FIO, Lab;');
      3:
        ADOQuery2.SQL.Add('SELECT * FROM Students INNER JOIN Works ON Students.FIO = Works.Student ' +
                        'WHERE (((Students.Group)="' + S + '") AND ((Works.Lab)="' + S2 + '")) Order by FIO;');
      4:
        ADOQuery2.SQL.Add('SELECT [Names] FROM Labs WHERE (((Labs.Lesson)="'
                          + S + '")) Order by [Labs.Names];');
      5:
        ADOQuery2.SQL.Add('SELECT [FIO] FROM Students WHERE (((Students.Group)="'
                          + S + '")) Order by [Students.FIO];');
    end;

    ADOQuery2.Active := true;
    ADOQuery2.First;

    i := 2;

    while(not ADOQuery2.Eof) do begin

      // ��������� ������� ������������ �� �������
      case N of
        1: begin
        W.ActiveDocument.Tables.item(1).Cell(i, 1).Range.Text := IntToStr(i - 1);
        W.ActiveDocument.Tables.item(1).Cell(i, 2).Range.Text := ADOQuery2.FieldByName('Lab').AsString;
        W.ActiveDocument.Tables.item(1).Cell(i, 3).Range.Text := ADOQuery2.FieldByName('_Date').AsString;
        W.ActiveDocument.Tables.item(1).Cell(i, 4).Range.Text := ADOQuery2.FieldByName('_Time').AsString;
        W.ActiveDocument.Tables.item(1).Cell(i, 5).Range.Text := ADOQuery2.FieldByName('PC').AsString;
        W.ActiveDocument.Tables.item(1).Cell(i, 6).Range.Text := ADOQuery2.FieldByName('_Work_time').AsString;
        end;
        2: begin
        W.ActiveDocument.Tables.item(1).Cell(i, 1).Range.Text := IntToStr(i - 1);
        W.ActiveDocument.Tables.item(1).Cell(i, 2).Range.Text := ADOQuery2.FieldByName('Lab').AsString;
        W.ActiveDocument.Tables.item(1).Cell(i, 3).Range.Text := ADOQuery2.FieldByName('Student').AsString;
        W.ActiveDocument.Tables.item(1).Cell(i, 4).Range.Text := ADOQuery2.FieldByName('Group').AsString;
        W.ActiveDocument.Tables.item(1).Cell(i, 5).Range.Text := ADOQuery2.FieldByName('_Time').AsString;
        W.ActiveDocument.Tables.item(1).Cell(i, 6).Range.Text := ADOQuery2.FieldByName('PC').AsString;
        W.ActiveDocument.Tables.item(1).Cell(i, 7).Range.Text := ADOQuery2.FieldByName('_Work_time').AsString;
        end;
        3: begin
        W.ActiveDocument.Tables.item(1).Cell(i, 1).Range.Text := IntToStr(i - 1);
        W.ActiveDocument.Tables.item(1).Cell(i, 2).Range.Text := ADOQuery2.FieldByName('Student').AsString;
        W.ActiveDocument.Tables.item(1).Cell(i, 3).Range.Text := ADOQuery2.FieldByName('_Time').AsString;
        W.ActiveDocument.Tables.item(1).Cell(i, 4).Range.Text := ADOQuery2.FieldByName('PC').AsString;
        W.ActiveDocument.Tables.item(1).Cell(i, 5).Range.Text := ADOQuery2.FieldByName('_Work_time').AsString;
        end;
        4: begin
        W.ActiveDocument.Tables.item(1).Cell(i, 1).Range.Text := IntToStr(i - 1);
        W.ActiveDocument.Tables.item(1).Cell(i, 2).Range.Text := ADOQuery2.FieldByName('Names').AsString;
        end;
        5: begin
        W.ActiveDocument.Tables.item(1).Cell(i, 1).Range.Text := IntToStr(i - 1);
        W.ActiveDocument.Tables.item(1).Cell(i, 2).Range.Text := ADOQuery2.FieldByName('FIO').AsString;
        end;
      end;

      Inc(i);
      W.ActiveDocument.Tables.item(1).Rows.Add;
      ADOQuery2.Next;
    end;
    // ��������������
    W.Selection.WholeStory;
    W.Selection.Font.Name := 'Times New Roman';
    W.Selection.Font.Size := 14;
    W.Selection.ParagraphFormat.Alignment := wdAlignParagraphCenter;

    W.Selection.Move(WdParagraph, 1);
    W.Selection.ParagraphFormat.Alignment := wdAlignParagraphRight;
    W.ActiveDocument.Range.InsertAfter(DateTimeToStr(Date));

    W.Selection.HomeKey(Unit := wdStory);
    W.Selection.Font.Size := 16;
    // ����� � ���������
    case N of
      1:
        W.ActiveDocument.Range.InsertBefore('������ ����������� ����� �� ��������: ' + S +
                                              ', ' + S2);
      2:
        W.ActiveDocument.Range.InsertBefore('������ ����������� ����� �� ����: ' + S2);
      3:
        W.ActiveDocument.Range.InsertBefore('������ ����������� ����� �� �� � ������. ��: ' + S2 + ' ������: ' + S);
      4:
        W.ActiveDocument.Range.InsertBefore('������ �� �� ��������: ' + S);
      5:
        W.ActiveDocument.Range.InsertBefore('������ ��������� � ������: ' + S);
    end;

    W.Visible := true;
  end;
end;

procedure TForm2.Exit1Click(Sender: TObject);
begin
  CloseQuery;
end;

procedure TForm2.Change1Click(Sender: TObject); // ����� � ����������� ����� ������� ����� OpenDialog
begin
  try
  DeleteFile(curr_dir + '\resourses\' + ADOTable1.FieldByName('Names').Value + ExtractFileExt(ADOTable1.FieldByName('Path').Value));

  If OpenDialog1.Execute then begin
   ADOTable1.Edit;
    ADOTable1.FieldByName('Path').Value := OpenDialog1.FileName;
  end;
  except
    msg('�� ������� ����� ���� �������� ��� ��������� ������!'#10#13'��������� ������������ ����� �����: '#10#13 +
          ADOTable1.FieldByName('Path').Value, '���� �� ������', 3)
    end;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  if MessageBox(Handle, '����� �� ���������?',' �����', MB_OKCANCEL + MB_ICONQUESTION) = 1 then begin
    CanClose := true;
    Form1.Close; end
    else
      CanClose := false;
end;

procedure TForm2.Changepassword1Click(Sender: TObject); // ����� ����� ������
begin
  Form3.Show;
end;

procedure TForm2.FormShow(Sender: TObject); // ���������� ������ �-�
begin
  Form1.Hide;
  ADOTable1.Sort := dbgrid1.Columns[0].FieldName;
  ADOTable2.Sort := dbgrid2.Columns[0].FieldName;
  ADOTable3.Sort := dbgrid3.Columns[0].FieldName;
  ADOTable4.Sort := dbgrid4.Columns[0].FieldName;
end;

procedure TForm2.ToolButton2Click(Sender: TObject); // ����� ���������� ��
begin
  is_open_f5 := true;
  Form5.Show;
end;

procedure TForm2.ToolButton16Click(Sender: TObject); // ����� ���������� ���������
begin
  edit_table := 2;
  with form6 do begin
  Caption := '���������� ��������';
  Label1.Caption := '��� ��������';
  Label2.Caption := '������';
  ComboBox1.Enabled := true;
  Label2.Enabled := true;
  Show;
  end;
end;

procedure TForm2.ToolButton11Click(Sender: TObject); // ����� ���������� ���������
begin
  edit_table := 4;
  with form6 do begin
  Caption := '���������� ��������';
  Label1.Caption := '�������� ��������';
  Label2.Caption := '���� 2';
  ComboBox1.Enabled := false;
  Label2.Enabled := false;
  Show;
  end;
end;

procedure TForm2.ToolButton1Click(Sender: TObject); // ����� ���������� �����
begin
  edit_table := 3;
  with form6 do begin
  Caption := '���������� ������';
  Label1.Caption := '�������� ������';
  Label2.Caption := '���� 2';
  ComboBox1.Enabled := false;
  Label2.Enabled := false;
  Show;
  end;
end;

procedure TForm2.ToolButton3Click(Sender: TObject); // �������� ��
begin
  delete_rec(ADOTable1);
end;

procedure TForm2.ToolButton17Click(Sender: TObject); // �������� ���������
begin
  delete_rec(ADOTable2);
end;

procedure TForm2.ToolButton7Click(Sender: TObject); // �������� �����
begin
  delete_rec(ADOTable3);
end;

procedure TForm2.ToolButton12Click(Sender: TObject); // �������� ���������
begin
  delete_rec(ADOTable4);
end;

procedure TForm2.ToolButton5Click(Sender: TObject); // � ������ ������� ��
begin
  ADOTable1.First;
end;

procedure TForm2.ToolButton19Click(Sender: TObject); // � ������ ������� ��������
begin
  ADOTable2.First;
end;

procedure TForm2.ToolButton9Click(Sender: TObject); // � ������ ������� ������
begin
  ADOTable3.First;
end;

procedure TForm2.ToolButton14Click(Sender: TObject); // � ������ ������� ��������
begin
  ADOTable4.First;
end;

procedure TForm2.ToolButton6Click(Sender: TObject); // � ����� ������� ��
begin
  ADOTable1.Last;
end;

procedure TForm2.ToolButton20Click(Sender: TObject); // � ����� ������� ��������
begin
  ADOTable2.Last;
end;

procedure TForm2.ToolButton10Click(Sender: TObject); // � ����� ������� ������
begin
  ADOTable3.Last;
end;

procedure TForm2.ToolButton15Click(Sender: TObject); // � ����� ������� ��������
begin
  ADOTable4.Last;
end;

procedure TForm2.N2Click(Sender: TObject); // ��������� �����������
var names:string;
begin

  if MessageBox(Handle, '������� ��������� ����� ������?','��������� �����������', MB_OKCANCEL + MB_ICONQUESTION) = 1 then begin

    names := curr_dir + '\backups\' + IntToStr(DayOfTheMonth(Date)) + '.' +
                            IntToStr( MonthOfTheYear(Date)) + '.' + IntToStr(YearOf(Date)) + '.mdb';

    if CopyFile(PAnsiChar('db.mdb'), PAnsiChar(names), true) then
      msg('��������� ����� �� ������� ������� ��� ������ ' + IntToStr(DayOfTheMonth(Date)) +
          '.' + IntToStr(MonthOfTheYear(Date)) + '.' + IntToStr(YearOf(Date)) + '.mdb', '��������� �����������', 1)
    else
      msg('������ ���������� - �� ������� ������� ��������� �����! ErrorCode# ' +
                  IntToStr(GetLastError), '������ �������� ��������� �����', 3)
  end;
end;

procedure TForm2.ComboBox1Change(Sender: TObject); // ���������� ������ ��������
begin
  ComboBox2.Items.Clear;

  case ComboBox1.ItemIndex of
  0: begin
    ADOTable4.First;
    while(not ADOTable4.eof) do begin
      ComboBox2.Items.Add(ADOTable4.FieldByName('Nazva').AsString);
      ADOTable4.Next;
    end;
  end;
  1:begin
    ADOTable3.First;
    while(not ADOTable3.eof) do begin
      ComboBox2.Items.Add(ADOTable3.FieldByName('Nazva').AsString);
      ADOTable3.Next;
    end;
  end; end;
end;

procedure TForm2.Button1Click(Sender: TObject); // ���������� �������
begin
  if(ComboBox1.ItemIndex = -1) or (ComboBox2.ItemIndex = -1) then
    msg('�������� ������ �� ������', '������������ ������� ������', 2)
  else
    case ComboBox1.ItemIndex of
    0: begin
      ADOQuery1.Active := false;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('SELECT [Labs.Names] as [�������� ��] FROM Labs WHERE (((Labs.Lesson)="'
                          + combobox2.text + '")) Order by [Labs.Names];');
      ADOQuery1.Active := true;
      DBGrid5.Visible := true;
    end;
    1: begin
      ADOQuery1.Active := false;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('SELECT [Students.FIO] as [��� ��������] FROM Students WHERE (((Students.Group)="'
                          + combobox2.text + '")) Order by [Students.FIO];');
      ADOQuery1.Active := true;
      DBGrid5.Visible := true;
    end; end;
end;

procedure TForm2.ToolButton21Click(Sender: TObject); // �� - ��������������
begin
  edit_mode(DBGrid1, ToolButton21);
end;

procedure TForm2.ToolButton22Click(Sender: TObject); // �������� - ��������������
begin
  edit_mode(DBGrid2, ToolButton22);
end;

procedure TForm2.ToolButton23Click(Sender: TObject); // ������ - ��������������
begin
  edit_mode(DBGrid3, ToolButton23);
end;

procedure TForm2.ToolButton24Click(Sender: TObject); // �������� - ��������������
begin
  edit_mode(DBGrid4, ToolButton24);
end;

procedure TForm2.N5Click(Sender: TObject); // ���� "� ���������"
begin
  AboutBox.Show;
end;

procedure TForm2.N7Click(Sender: TObject); // ����� �� ���
begin
  report := 1;

  with form10 do begin
    Label1.Caption := '������';
    Label2.Caption := '��� ��������';
    Label3.Caption := '�������� 3';
    Label2.Enabled := true;
    Label3.Enabled := false;
    ComboBox1.Visible := true;
    ComboBox2.Enabled := true;
    ComboBox3.Enabled := false;
    DateTimePicker1.Visible := false;
    Caption := '����� �� ���';
    show;
  end;
  // build_report(1, InputBox('������� ��� ��������, �� �������� ������� ��������� �����', '����� �� ���', '������� ���'));
  end;

procedure TForm2.N8Click(Sender: TObject);  // ����� �� ����
begin
  report := 2;

  with form10 do begin
    Label1.Caption := '����';
    Label2.Caption := '�������� 2';
    Label3.Caption := '�������� 3';
    Label2.Enabled := false;
    Label3.Enabled := false;
    ComboBox1.Visible := false;
    ComboBox2.Enabled := false;
    ComboBox3.Enabled := false;
    DateTimePicker1.Visible := true;
    Caption := '����� �� ����';
    Show;
  end;
  // build_report(2, InputBox('������� ����, �� ������� ������� ��������� �����', '����� �� ����', '##.##.####'));
  end;

procedure TForm2.N9Click(Sender: TObject); // ����� �� ������ � ��
begin
  report := 3;

  with form10 do begin
    Label1.Caption := '������';
    Label2.Caption := '�������';
    Label3.Caption := '��';
    Label2.Enabled := true;
    Label3.Enabled := true;
    ComboBox1.Visible := true;
    DateTimePicker1.Visible := false;
    ComboBox2.Enabled := true;
    ComboBox3.Enabled := true;
    Caption := '����� �� �� � ������';
    Show;
  end;
// build_report(3, InputBox('������� �������� ��, �� ������� ������� ��������� �����', '����� �� �� � ������', '������'),
// InputBox('������� ������, �� ������� ������� ��������� �����', '����� �� �� � ������', '�������� ��'),);
end;

procedure TForm2.N12Click(Sender: TObject); // ������ �� �� ��������
begin
report := 4;

  with form10 do begin
    Label1.Caption := '�������';
    Label2.Caption := '�������� 2';
    Label3.Caption := '�������� 3';
    Label2.Enabled := false;
    Label3.Enabled := false;
    ComboBox1.Visible := true;
    DateTimePicker1.Visible := false;
    ComboBox2.Enabled := false;
    ComboBox3.Enabled := false;
    Caption := '������ �� �� ��������';
    Show;
  end;
end;

procedure TForm2.N11Click(Sender: TObject); // ������ ��������� � ������
begin
  report := 5;

  with form10 do begin
    Label1.Caption := '������';
    Label2.Caption := '�������� 2';
    Label3.Caption := '�������� 3';
    Label2.Enabled := false;
    Label3.Enabled := false;
    ComboBox1.Visible := true;
    DateTimePicker1.Visible := false;
    ComboBox2.Enabled := false;
    ComboBox3.Enabled := false;
    Caption := '������ ��������� � ������';
    Show;
  end;
end;

procedure TForm2.DBGrid2Enter(Sender: TObject); // �������� ������ ����� ��� ���� ������� "��������"
var s:TStrings;
begin
  s := TStringList.Create;
  ADOTable3.First;

  while (not ADOTable3.Eof) do begin
    s.Add(ADOTable3.fieldbyname('Nazva').AsString);
    ADOTable3.Next;
  end;

  DBGrid2.Columns[1].PickList := s;
end;

procedure TForm2.DataSource1DataChange(Sender: TObject; Field: TField); // ���������� ������ - �������� ��� �������������� ������ � ������� "��"  
begin

// if not FileExists(curr_dir + '\resourses\' + ADOTable1.FieldByName('Names').Value +
//                  ExtractFileExt(ADOTable1.FieldByName('Path').Value)) then begin
    if (not is_open_f5 and not DBGrid1.ReadOnly) then begin  // ���� �����5 ������� - ������ ��������� ����� ������ � ������ ��������� ������ ���������!
    if FileExists(curr_dir + '\resourses\' + ADOTable1.FieldByName('Names').Value +
                  ExtractFileExt(ADOTable1.FieldByName('Path').Value)) then

            DeleteFile(curr_dir + '\resourses\' + ADOTable1.FieldByName('Names').Value +
                                ExtractFileExt(ADOTable1.FieldByName('Path').Value));

    if not FileExists(ADOTable1.FieldByName('Path').Value) then
      msg('�� ������� ����� ���� �������� ��� ��������� ������!'#10#13'��������� ������������ ����� �����: '#10#13 +
          ADOTable1.FieldByName('Path').Value, '���� �� ������', 3)
    else begin

CopyFile( PAnsiChar(string(ADOTable1.FieldByName('Path').Value)),
          PAnsiChar(string(curr_dir + '\resourses\' +  ADOTable1.FieldByName('Names').Value +
          ExtractFileExt(ADOTable1.FieldByName('Path').Value))), true);
end; end; end;
procedure TForm2.N4Click(Sender: TObject);
begin
ShellExecute(0, 'open', 'help.chm', '', '', SW_SHOW); 
end;

end.
