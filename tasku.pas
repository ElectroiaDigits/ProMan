unit TaskU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;


type

  { TTask }

  TTask = class(TObject)
  private
    fEndDate: TDateTime;
    fDone: Boolean;
    fStartDate: TDateTime;
    fTitle: String;
    fTags: String;
				function getTags: String;
				procedure setTags(AValue: String);
    procedure setTitle(AValue: String);
    public
      property Title: String read fTitle write setTitle;
      property StartDate: TDateTime read fStartDate ;
      property EndDate: TDateTime read fEndDate;
      property IsDone: Boolean read fDone;
      property Tags: String read getTags write setTags;
      procedure Done;

  end;

implementation

{ TTask }

procedure TTask.setTitle(AValue: String);
begin
  fTitle:= AValue;
end;

function TTask.getTags: String;
begin
    Result:= fTags;
end;

procedure TTask.setTags(AValue: String);
begin
    fTags:= AValue;
end;


procedure TTask.Done;
begin
     fDone:= True;
     fEndDate:= Now;
end;

end.

