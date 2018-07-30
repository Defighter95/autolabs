unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, Grids, DBGrids, DB, ADODB, ToolWin;

type
  TForm4 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ADOTable3: TADOTable;
    DataSource3: TDataSource;
    DataSource2: TDataSource;
    ADOTable2: TADOTable;
    N3: TMenuItem;
    N4: TMenuItem;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    PageControl1: TPageControl;
    TabSheet5: TTabSheet;
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    ToolButton23: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton21: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    TabSheet4: TTabSheet;
    DBGrid3: TDBGrid;
    ToolBar3: TToolBar;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton22: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    procedure N2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton19Click(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton24Click(Sender: TObject);
    procedure ToolButton25Click(Sender: TObject);
    procedure ToolButton23Click(Sender: TObject);
    procedure ToolButton26Click(Sender: TObject);
    procedure ToolButton27Click(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);
    procedure ToolButton22Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

Uses Unit2, Unit1, Unit6, Unit7, Unit5;

{$R *.dfm}

procedure TForm4.N2Click(Sender: TObject);
begin
  Form2.Changepassword1Click(Form4);
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Form2.CloseQuery;
end;

procedure TForm4.ToolButton16Click(Sender: TObject); // форма добавления Студентов
begin
  Form6.Show;
end;

procedure TForm4.ToolButton1Click(Sender: TObject); // форма добавления Предметов
begin
Form7.Show;
end;

procedure TForm4.ToolButton19Click(Sender: TObject);  // к началу таблицы Студенты
begin
  ADOTable2.First;
end;

procedure TForm4.ToolButton20Click(Sender: TObject); // в конец таблицы Студенты
begin
  ADOTable2.Last;
end;

procedure TForm4.ToolButton7Click(Sender: TObject);
begin
  if MessageBox(Handle, 'Удалить запись?','Удаление', MB_OKCANCEL + MB_ICONQUESTION) = 1 then
    ADOTable3.Delete;
end;

procedure TForm4.ToolButton9Click(Sender: TObject);
begin
  ADOTable3.First;
end;

procedure TForm4.ToolButton10Click(Sender: TObject);
begin
  ADOTable3.Last;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
Form1.Hide;
end;

procedure TForm4.ToolButton24Click(Sender: TObject);
begin
  ADOTable1.First;
end;

procedure TForm4.ToolButton25Click(Sender: TObject);
begin
  ADOTable1.Last;
end;

procedure TForm4.ToolButton23Click(Sender: TObject);
begin
  Form5.Show;
end;

procedure TForm4.ToolButton26Click(Sender: TObject);
begin
if MessageBox(Handle, 'Удалить запись?','Удаление', MB_OKCANCEL + MB_ICONQUESTION) = 1 then
    ADOTable1.Delete;
end;

procedure TForm4.ToolButton27Click(Sender: TObject);
begin
DBGrid1.ReadOnly := not DBGrid1.ReadOnly;
ToolButton27.Marked := not ToolButton27.Marked;
form2.Change1.Enabled := not form2.Change1.Enabled;
end;

procedure TForm4.ToolButton21Click(Sender: TObject);
begin
DBGrid2.ReadOnly := not DBGrid2.ReadOnly;
ToolButton21.Marked := not ToolButton21.Marked;
end;

procedure TForm4.ToolButton22Click(Sender: TObject);
begin
DBGrid2.ReadOnly := not DBGrid2.ReadOnly;
ToolButton22.Marked := not ToolButton22.Marked;
end;

procedure TForm4.ToolButton3Click(Sender: TObject);
begin
  if MessageBox(Handle, 'Удалить запись?','Удаление', MB_OKCANCEL + MB_ICONQUESTION) = 1 then
    ADOTable2.Delete;
end;

procedure TForm4.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var a, b:PAnsiChar;
begin

if key = #13 then
if not FileExists(curr_dir + '\resourses\' + ADOTable1.FieldByName('Names').Value +
                  ExtractFileExt(ADOTable1.FieldByName('Path').Value)) then begin

a := PAnsiChar(string(ADOTable1.FieldByName('Path').Value));
b := PAnsiChar(string(curr_dir + '\resourses\' +  ADOTable1.FieldByName('Names').Value +
        ExtractFileExt(ADOTable1.FieldByName('Path').Value)));

CopyFile(a, b, true);
end; end;

procedure TForm4.N4Click(Sender: TObject);
begin
  Form2.CloseQuery;
end;

end.
