unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, Menus, FileCtrl, ShellAPI, ExtCtrls,
  StdCtrls, AppEvnts, FWTrayIcon, OleCtnrs, ZipForge;

type
  TForm2 = class(TForm)
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    Jgwbb1: TMenuItem;
    N1: TMenuItem;
    Timer1: TTimer;
    FWTrayIcon1: TFWTrayIcon;
    ADOTable2: TADOTable;
    StringGrid1: TStringGrid;
    ZipForge1: TZipForge;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ADOTable3: TADOTable;
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FWTrayIcon1DblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  working:bool;
  time_down:byte;
  sec:byte;
  s:string;
  file_to_save:string;
  file_to_open:string;
  filename:string;
  pw: HWND;
  procedure time_out;
  function FindFunc(h: hwnd; l:LPARAM): boolean;  stdcall;
  function is_had_pre_jobs():boolean;
  procedure archiv_file;
  procedure dearchiv_file;
  procedure msg(text:String; head:String = ''; m_type:UINT = 1; hWnd:HWND = 0);

implementation

uses Unit1, Unit3, Unit4, DateUtils, Unit6, Unit7;

{$R *.dfm}

// msg(Сообщение; Заголовок окна; тип окна(иконка, см. ниже))
procedure msg(text:String; head:String; m_type:UINT; hWnd:HWND); // вызываем вместо прямой работы с MessageBox
begin
  case m_type of                     // иконка окна (1 - символ I, 2 - знак !, 3 - ошибка (крест в красном круге))
    1: m_type := MB_ICONASTERISK;
    2: m_type := MB_ICONWARNING;
    3: m_type := MB_ICONERROR;
  end;
  MessageBox(hWnd, PAnsiChar(text), PAnsiChar(head), MB_OK + m_type);
end;

function is_had_pre_jobs():boolean; // выполняли ли данную работу ранее
var i:integer; c:boolean;
begin
  c := false;
  with form2 do
    for i := 0 to StringGrid1.RowCount - 2 do
      if (ADOTable1.fieldbyname('Names').AsString = StringGrid1.Cells[0, i]) and (StringGrid1.Cells[2, i] <> '') then c := true;

  result := c;
end;

procedure archiv_file; // архивация работы
begin
  with form2 do begin
    // ZipForge1.BaseDir := server_path + 'results\';
    ZipForge1.FileName := ADOTable1.fieldbyname('Names').AsString + '_' + IntToStr(YearOf(Date)) + '.zip';
    SetCurrentDir(server_path + '\results\');
    ZipForge1.Password := pass;
    ZipForge1.OpenArchive;
    ZipForge1.AddFiles(ADOTable1.fieldbyname('Names').AsString +  '_' + Form1.ComboBox1.Text +
                            ExtractFileExt(ADOTable1.fieldbyname('Path').AsString));
    ZipForge1.CloseArchive;
  end;
end;

procedure dearchiv_file; // распаковка работы
var password:string;
begin
  with form2 do begin
    ZipForge1.BaseDir := curr_dir + '\temp\';
    ZipForge1.FileName:= server_path + '\results\' + ADOTable1.fieldbyname('Names').AsString + '_' + IntToStr(YearOf(Date)) + '.zip';

   ADOTable3.First;
   while (not ADOTable3.Eof) do begin
   pass := ADOTable3.fieldbyname('Password').AsString;
    ZipForge1.Password := pass;
    //ShowMessage(pass);
    ZipForge1.OpenArchive;
    keybd_event(27,0,0,0);
    keybd_event(27,0,KEYEVENTF_KEYUP,0);
    ZipForge1.ExtractFiles(ADOTable1.fieldbyname('Names').AsString +  '_' + Form1.ComboBox1.Text +
                                ExtractFileExt(ADOTable1.fieldbyname('Path').AsString));

    if FileExists(ADOTable1.fieldbyname('Names').AsString +  '_' + Form1.ComboBox1.Text +
                                ExtractFileExt(ADOTable1.fieldbyname('Path').AsString)) then break;

    if(ADOTable3.Eof) then begin
    msg('Не удалось распаковать ранее созданный документ - возможно, это случилось в результате' +
                    ' сбоя программы или стороннего вмешательства. Обратитесь к администратору сети.', 'Фатальная ошибка', 3);
      halt;
    end;
   ADOTable3.Next;
  end;
    ZipForge1.CloseArchive;
  end;
end;

procedure time_out; // по окончанию времени (или принудительном выходе)
var mins:string;
begin
  working := false; // работа окончена
  PostMessage(pw, WM_QUIT, 1, 0); // закрываем рабочее окно с работой

  Form3.Visible := false; // закрываем мини - окно
  // Form2.Show;  открываем форму с БД

  With form2 do begin // заполнение структуры "Выполненные работы"
    ADOTable2.Append;
    ADOTable2.Edit;
    ADOTable2.FieldByName('Lab').Value := ADOTable1.fieldbyname('Names').Value;
    ADOTable2.Edit;
    ADOTable2.FieldByName('Student').Value := Form1.ComboBox1.Text;
    ADOTable2.Edit;
    ADOTable2.FieldByName('_Date').Value := Date;
    ADOTable2.Edit;
    mins := IntToStr(MinuteOf(Time));
    if(Length(mins) = 1) then mins := '0' + IntToStr(MinuteOf(Time));
    ADOTable2.FieldByName('_Time').Value := IntToStr(HourOf(Time)) + ':' + mins;
    ADOTable2.Edit;
    ADOTable2.FieldByName('PC').Value := get_file_data('pc');
    ADOTable2.Edit;
    ADOTable2.FieldByName('Result').Value := file_to_save;
    ADOTable2.Edit;
    ADOTable2.FieldByName('_Work_time').Value := ADOTable1.fieldbyname('Times_less').AsInteger - time_down - 1;
    ADOTable2.Post;
  end;

  msg('Время вышло! Файл отправлен на сервер! Нажмите ОК для выхода.', 'Завершение работы', 1);

  CopyFile(PAnsiChar(s), PAnsiChar(file_to_save), true); // заливаем файл на сервер
  archiv_file; // архивируем файл на сервере
  DeleteFile(s); // удаляем файл из временного каталога
  DeleteFile(file_to_save); // удаляем файл с сервера
  Form1.Close;
end;

function FindFunc(h: HWND; L: LPARAM):boolean; stdcall; // поиск дескриптора окна по части имени заголовка
var WindowName:PAnsiChar;
begin
  result := true;
  pw := 0;
  GetMem(WindowName, 255);

  if (GetWindowText(h, WindowName, 255) > 0) then
  // Form2.ListBox1.Items.Add(WindowName + ' - ' + IntToStr(h));
    if (pos(filename, WindowName) > 0) then begin
    // ShowMessage('!!!');
      pw := h;
      result := false;
    end;

  FreeMem(WindowName, 255);
end;

procedure TForm2.FormShow(Sender: TObject);
var i, job_try_count:integer;
begin

  Caption := Caption + ': ' + Form1.ComboBox1.Text;

  // исходные данные для подключения к БД берём с 1-й формы
  // Form1.Hide;
  ADOConnection1.Close;
  ADOConnection1.ConnectionString := Form1.ADOConnection1.ConnectionString;
  ADOConnection1.Connected := true;
  ADOTable1.Active := true;
  ADOTable2.Active := true;
  ADOTable3.Active := true;
  ADOTable1.Sort := dbgrid1.Columns[0].FieldName;

 // ShowMessage(Form1.ADOTable1.FieldByName('FIO').AsString);

 // заполнение временной структуры результатами выполненных работ
  ADOTable1.First;

  while (not ADOTable1.Eof) do begin
    StringGrid1.Cells[0, StringGrid1.RowCount - 1] := ADOTable1.fieldbyname('Names').AsString;
    StringGrid1.Cells[1, StringGrid1.RowCount - 1] := ADOTable1.fieldbyname('Time_for_work(min)').AsString;
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
    ADOTable1.Next;
  end;

  // вычисляем оставшееся время для работы и заполняем соответствующие поля таблицы
  for i := 0 to StringGrid1.RowCount - 2 do begin
    // ShowMessage(i);
    ADOTable2.First;
    job_try_count := 0; // кол-во выполнений данной работы студентом
    while (not ADOTable2.Eof) do begin

      if (StringGrid1.Cells[0, i] = ADOTable2.FieldByName('Lab').AsString) and
      (ADOTable2.FieldByName('Student').Value = Form1.ComboBox1.Text) then begin

        inc(job_try_count);

        StringGrid1.Cells[1, i] :=
          IntToStr(StrToInt(StringGrid1.Cells[1, i]) - StrToInt(ADOTable2.FieldByName('_Work_time').asString));

        if (StrToInt(StringGrid1.Cells[1, i]) <= 3) then
        StringGrid1.Cells[1, i] := '0'

        else if (job_try_count = 1) and (ADOTable2.FieldByName('_Work_time').AsInteger > 5) then
          StringGrid1.Cells[1, i] := IntToStr(StrToInt(StringGrid1.Cells[1, i]) + 5)

          else if (job_try_count = 1)  then
            StringGrid1.Cells[1, i] :=
          IntToStr(StrToInt(StringGrid1.Cells[1, i]) + StrToInt(ADOTable2.FieldByName('_Work_time').asString));

        StringGrid1.Cells[2, i] := ADOTable2.FieldByName('Result').AsString;

      end;

      ADOTable2.Next;
  end; end;

  ADOTable1.First;
  i := 0;

  while (not ADOTable1.Eof) do begin
    ADOTable1.Edit;
    ADOTable1.fieldbyname('Times_less').Value := StringGrid1.Cells[1, i];

     if(ADOTable1.fieldbyname('Times_less').Value <= 3) then begin
         ADOTable1.Edit;
         ADOTable1.fieldbyname('Times_less').Value := 0;
        // ADOTable1.Post;
     end;

    ADOTable1.Post;
    ADOTable1.Next;
    Inc(i);
  end;

end;

procedure TForm2.N1Click(Sender: TObject);
begin
  CloseQuery;
end;

procedure TForm2.DBGrid1DblClick(Sender: TObject);
var i:integer;
begin

  file_to_save := server_path + '\results\' + ADOTable1.fieldbyname('Names').AsString +  '_' +
                  Form1.ComboBox1.Text + ExtractFileExt(ADOTable1.fieldbyname('Path').AsString);
                  // полное имя для сохранения файла после работы

  s := curr_dir + '\temp\' + ADOTable1.fieldbyname('Names').AsString +
        ExtractFileExt(ADOTable1.fieldbyname('Path').AsString); // полное имя временного файла

  // if FileExists (file_to_save) then begin ShowMessage('Вы уже выполнянли данную работу!'); exit; end;

  if (ADOTable1.fieldbyname('Times_less').AsInteger <> 0) then begin

    if MessageBox(Handle, PAnsiChar('Будет запущена на выполнение ' + ADOTable1.fieldbyname('Names').AsString + ' Продолжить?'),
                  'Выполнение ЛР', MB_OKCANCEL + MB_ICONQUESTION) = mrOk then begin

      msg('У вас есть ' + ADOTable1.fieldbyname('Times_less').AsString +
                      ' мин. на выполнение.'#10#13'По истечении времени работа '#10#13 +
                      'будет закрыта и отправлена на сервер.', 'Запуск работы', 1);

      if (not is_had_pre_jobs) then
        file_to_open := server_path + '\resourses\' + ADOTable1.fieldbyname('Names').AsString +
                        ExtractFileExt(ADOTable1.fieldbyname('Path').AsString) // полное имя файла для открытия
       else begin
       // ShowMessage('открыта раннее сделанная ЛР!');
        dearchiv_file; // файл с ранее выпоненной работой извлекается во временной каталог
        s := curr_dir + '\temp\' + ADOTable1.fieldbyname('Names').AsString +  '_' +
                    Form1.ComboBox1.Text + ExtractFileExt(ADOTable1.fieldbyname('Path').AsString); // полное имя временного файла
      end;

      if(ExtractFileExt(ADOTable1.fieldbyname('Path').AsString) <> '.mdb') or
             (ExtractFileExt(ADOTable1.fieldbyname('Path').AsString) <> '.accdb') then

        filename := ADOTable1.fieldbyname('Names').AsString
      else filename := 'Access'; // имя открытого файла для поиска дескриптора его окна

      if (ADOTable1.fieldbyname('Time_for_work(min)').Value = ADOTable1.fieldbyname('Times_less').Value) then
          CopyFile(PAnsiChar(file_to_open), PAnsiChar(s), true); // копируем файл - исходников с сервера во временной каталог

      ShellExecute(0, 'open', PChar(s), '', '', SW_SHOW);    // открываем файл для работы

  // sleep(5000);
  // вызоф функции для поиска дескриптора окна с открытым документом
      if(EnumWindows(@FindFunc,0)) then begin
        FormStyle := fsStayOnTop;
        msg('Возникла ошибка при работе со сторонним приложением!'#10#13'Возможно, файл был удалён, либо формат не поддерживается.' +
                      #10#13'Повторите попытку или обратитесь к администратору!', 'Фатальная ошибка', 3);
        halt; end;

      working := true; // начало работы - тикает таймер
      time_down := ADOTable1.fieldbyname('Times_less').AsInteger; // ставим время (мин.) для таймера
      sec := 0;

  // задаём стиль мини - окна с иформацией о выполняемой работе
      Form4.FormStyle := fsStayOnTop;
      Form3.FormStyle := fsStayOnTop;

      Form3.Show; // открываем мини - форму

  end; end else

  if MessageBox(Handle, 'Время на выполнение данной ЛР исчерпано!'#10#13'Желаете просмотреть результат работы?',
                  'Просмотр результатов', MB_OKCANCEL + MB_ICONQUESTION) = mrOk then begin

    for i := 0 to StringGrid1.RowCount - 2 do

      if (ADOTable1.fieldbyname('Names').AsString = StringGrid1.Cells[0, i]) then begin

        dearchiv_file; // извлекаем из архива результат и кидаем во временной каталог
        s := curr_dir + '\temp\' + ADOTable1.fieldbyname('Names').AsString +  '_' +
                    Form1.ComboBox1.Text + ExtractFileExt(ADOTable1.fieldbyname('Path').AsString);
                    // полное имя временного файла

      ShellExecute(0, 'open', PChar(s), '', '', SW_SHOW);   // открываем файл для просмотра
  end; end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin

  if working = true then begin

    // SetWindowPos(Form3.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_SHOWWINDOW);
    // Form3.FormStyle := fsStayOnTop;

    if(sec = 0) then begin Dec(time_down); sec := 59; end; // -1 мин по истечении 60 сек.

    Dec(sec);

    Form3.Label2.Caption := 'Время: ' + IntToStr(time_down) + ' : ' + IntToStr(sec); // обновляем время в мини - окне

    if (time_down mod 5 = 0) and (sec = 0) and (time_down <> 0) then

    // каждые 5 минут выдаём известие в панель задач

      FWTrayIcon1.ShowBalloonHint('Осталось ' + IntToStr(time_down) + ' минут! ', 'Оставшееся время', bhsWarning, 10);


    if (time_down = 3) and (sec = 0) then Form4.Show; // отсалась 3 мин. - предупреждаем пользователя

    if (time_down = 0) and (sec = 0) then time_out; // время вышло!

    if (time_down = 2) then Form3.Label3.Caption := 'Не забудьте сохранить изменения!';


  end;
end;

procedure TForm2.FWTrayIcon1DblClick(Sender: TObject);
begin
// form2.Show;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageBox(Handle, 'Выйти из программы?','Выход', MB_OKCANCEL + MB_ICONQUESTION) = 1 then begin
    CanClose := true;
    Form1.Close; end
  else CanClose := false;
end;

procedure TForm2.N2Click(Sender: TObject);
begin
form6.show;
end;

procedure TForm2.N6Click(Sender: TObject);
begin
aboutbox.show;
end;

procedure TForm2.N5Click(Sender: TObject);
begin
ShellExecute(0, 'open', 'help.chm', '', '', SW_SHOW); 
end;

end.
