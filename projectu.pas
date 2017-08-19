unit ProjectU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, TaskU;
type
  TTaskList = array[0..9] of TTask;

  { TProject }

  TProject = class(TObject)
  private
    fDone: Boolean;
    fEndDate: TDateTime;
    fProgress: Integer;
    fStartDate: TDateTime;
    fTaskList: TTaskList;
    fTitle: String;
    procedure setTaskList(AValue: TTaskList);
    procedure setTitle(AValue: String);
    public
      property Title: String read fTitle write setTitle;
      property StartDate: TDateTime read fStartDate;
      property EndDate: TDateTime read fEndDate;
      property Tasks: TTaskList read fTaskList write setTaskList;
      property Progress: Integer read fProgress ;
      property IsDone: Boolean read fDone;
      procedure Done;
      procedure Update;

  end;

implementation

{ TProject }

procedure TProject.setTaskList(AValue: TTaskList);
begin
  fTaskList:=AValue;
end;

procedure TProject.setTitle(AValue: String);
begin
  fTitle:=AValue;
end;

procedure TProject.Done;
begin
  fDone:= True;
  fEndDate:= Now;
end;

procedure TProject.Update;
var
  i: Integer;
begin
  for i:= 0 to high(fTaskList) do
  begin
    if fTaskList[i].IsDone then inc(fProgress);
  end;
  if fProgress >= 9 then Done;
end;

end.

