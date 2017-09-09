unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ProjectU;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  ListProjects: TList;
  //procedure DisplayProjectInfo;
  //procedure Sort;
  //procedure SaveToFile;
  //procedure LoadToFile;
  //procedure NewReminder;
  //procedure ShowAllReminders ;
  //procedure NewNote;
  //procedure ShowAllNotes;
  procedure FreeAll;

implementation



procedure FreeAll;
var
  i:Integer;
begin
     for i:= 0 to ListProjects.Count - 1 do
         TProject(ListProjects[i]).Free;
     ListProjects.Free;
end;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
     ListProjects:= TList.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAll;
end;

end.

