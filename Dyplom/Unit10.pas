unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DateUtils;

type
  TForm10 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm10.Button1Click(Sender: TObject);
var error:boolean;
begin
  error := false;

  case report of
  1: if(ComboBox2.ItemIndex = -1) then error := true;
  3: if(ComboBox1.ItemIndex = -1) or (ComboBox3.ItemIndex = -1) then error := true;
  4, 5: if(ComboBox1.ItemIndex = -1) then error := true;
  end;

  if (error) then begin
  msg('Не заполнены обязательные поля', 'Недостаточно входных данных!', 2);
  exit;
  end;

  case report of
    1: begin S := ComboBox2.Text; S2 := ComboBox1.Text; end;
    2: begin
      S := IntToStr(DayOfTheMonth(DateTimePicker1.date)) + ',' +
                    IntToStr(MonthOfTheYear(DateTimePicker1.date)) + ',' + IntToStr(YearOf(DateTimePicker1.date));
      S2 := DateToStr(DateTimePicker1.date);
       end;
    3: begin
      S := ComboBox1.Text;
      S2 := ComboBox3.Text;
    end;
    4, 5: S := ComboBox1.Text;
  end;
  build_report(report);
  close;
// ShowMessage('!');
end;

procedure TForm10.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date := date;
  ComboBox3.Items.Clear;
  ComboBox2.Items.Clear;
  ComboBox1.Items.Clear;

  case report of
  1:begin
  Form2.ADOTable3.First;

    while (not Form2.ADOTable3.Eof) do begin // получение списка групп
      ComboBox1.Items.Add(Form2.ADOTable3.fieldbyname('Nazva').AsString);
      Form2.ADOTable3.Next;
    end;
  end;
  3: begin
    Form2.ADOTable4.First;

    while (not Form2.ADOTable4.Eof) do begin // получение списка предметов
      ComboBox2.Items.Add(Form2.ADOTable4.fieldbyname('Nazva').AsString);
      Form2.ADOTable4.Next;
    end;

  Form2.ADOTable3.First;

  while (not Form2.ADOTable3.Eof) do begin // получение списка групп
    ComboBox1.Items.Add(Form2.ADOTable3.fieldbyname('Nazva').AsString);
    Form2.ADOTable3.Next;
  end; end;
  4: begin
    Form2.ADOTable4.First;

    while(not Form2.ADOTable4.eof) do begin
      ComboBox1.Items.Add(Form2.ADOTable4.FieldByName('Nazva').AsString);
      Form2.ADOTable4.Next;
  end; end;
  5:begin
    Form2.ADOTable3.First;

    while(not Form2.ADOTable3.eof) do begin
      ComboBox1.Items.Add(Form2.ADOTable3.FieldByName('Nazva').AsString);
      Form2.ADOTable3.Next;
    end;
  end; end;
end;

procedure TForm10.ComboBox2Change(Sender: TObject);
begin
  ComboBox3.Items.Clear;

  case report of
  3:begin
    Form2.ADOQuery2.SQL.Clear;
    Form2.ADOQuery2.SQL.Add('Select * From [Labs] Where([Lesson]="' + ComboBox2.Text + '") Order by [Names]');
    Form2.ADOQuery2.ExecSQL;
    Form2.ADOQuery2.Active := true;
    Form2.ADOQuery2.First;

    while (not Form2.ADOQuery2.Eof) do begin // получение списка предметов
      ComboBox3.Items.Add(Form2.ADOQuery2.fieldbyname('Names').AsString);
      Form2.ADOQuery2.Next;
    end;
  end; end;
end;

procedure TForm10.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm10.ComboBox1Change(Sender: TObject);
begin
  ComboBox2.Items.Clear;

  case report of
  1: begin
    Form2.ADOTable2.First;
    Form2.ADOQuery2.SQL.Clear;
    Form2.ADOQuery2.SQL.Add('Select * From [Students] Where([Group]="' + ComboBox1.Text + '") Order By [FIO]');
    Form2.ADOQuery2.ExecSQL;
    Form2.ADOQuery2.Active := true;
    Form2.ADOQuery2.First;

    while (not Form2.ADOQuery2.Eof) do begin // получение списка предметов
      ComboBox2.Items.Add(Form2.ADOQuery2.fieldbyname('FIO').AsString);
      Form2.ADOQuery2.Next;
    end;
  end;
 3: begin
    Form2.ADOTable4.First;

    while (not Form2.ADOTable4.Eof) do begin // получение списка предметов
      ComboBox2.Items.Add(Form2.ADOTable4.fieldbyname('Nazva').AsString);
      Form2.ADOTable4.Next;

 end; end; end;
end;

end.
