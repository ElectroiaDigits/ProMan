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
    procedure setTitle(AValue: String);
    public
      property Title: String read fTitle write setTitle;
      property StartDate: TDateTime read fStartDate ;
      property EndDate: TDateTime read fEndDate;
      property IsDone: Boolean read fDone;
      procedure Done;

  end;

implementation

{ TTask }

procedure TTask.setTitle(AValue: String);
begin
  fTitle:= AValue;
end;


procedure TTask.Done;
begin
     fDone:= True;
     fEndDate:= Now;
end;

end.

