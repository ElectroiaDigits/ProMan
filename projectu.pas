unit ProjectU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dateutils, TaskU;
type
  TTaskList = TList;  

  { TProject }

  TProject = class(TObject)
  private
    fDone: Boolean;
    fEndDate: TDateTime;
    fProgress: Integer;
    fStartDate: TDateTime;
    fTaskList: TTaskList;
    fTitle: String;
    fPriority: ShortInt;
    procedure setTaskList(AValue: TTaskList);
    procedure setTitle(AValue: String);
    procedure SetPriority(AValue: ShortInt);
    public
      property Title: String read fTitle write setTitle;
      property StartDate: TDateTime read fStartDate;
      property EndDate: TDateTime read fEndDate;
      property Tasks: TTaskList read fTaskList write setTaskList;
      property Progress: Integer read fProgress ;
      property IsDone: Boolean read fDone;
      property Priority : ShortInt read fPriority write SetPriority;
      function ElapsedTime : integer;
      procedure Done;
      procedure Update;
      constructor Create(sTitle : string; sStartDate, sEndDate : TDateTime; SPriority : ShortInt);

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
  for i:= 0 to fTaskList.count-1 do
  begin
    if TTask(fTaskList[i]).IsDone then inc(fProgress);
  end;
  if fProgress >= 9 then Done;  
end;

constructor TProject.Create(sTitle: string; sStartDate, sEndDate: TDateTime;
				SPriority: ShortInt);
begin
  fTitle:= sTitle;
  fStartDate:= sStartDate;
  fEndDate:= sEndDate;
  fPriority:= SPriority;
end;


procedure TProject.SetPriority(AValue: ShortInt);
begin
  fPriority:=AValue;
end;


function TProject.ElapsedTime: integer;
begin
     Result := Round(Now - fStartDate);
end;

end.
