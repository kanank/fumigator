unit formIncomeCallRoot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, dxGDIPlusClasses,
  Vcl.ExtCtrls,
  CommonTypes;

type
  TfrmIncomeCallRoot = class(TBaseForm)
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    fCallId: string;
    fClientClose: boolean;
    fSessionClose: Boolean;
    fCallResult: string;
    fClientId: Integer;
    fClientCallPrm: ClientCallParams;
    function GetCallFinished: boolean;
    procedure SetClientClose(AValue: boolean);
    procedure SetCallResult(AValue: string);
    procedure SetClientCallPrm(AValue: ClientCallParams);
  public
    property CallResult: string read fCallResult write SetCallResult;
    property CallId: string read fCallId write fCallId;
    property CallFinished: boolean read GetCallFinished;
    property ClientClose: boolean read fClientClose write SetClientClose;
    property ClientId: Integer read fClientId write fClientId;
    property SessionClose: Boolean read fSessionClose write fSessionClose;
    property ClientCallPrm: ClientCallParams read fClientCallPrm write SetClientCallPrm;

    procedure CallFinish;
    procedure CheckSession;

    class function ShowIncomeCall: Boolean;
  end;

var
  frmIncomeCallRoot: TfrmIncomeCallRoot;

implementation

{$R *.dfm}
uses
  DM_Main, IBX.IBQuery, formClientFiz, formClientUr;

{ TfrmIncomeCallRoot }

procedure TfrmIncomeCallRoot.CallFinish;
begin
  if fSessionClose and fClientClose then
  begin
    fCallResult := DM.FinishSession(CallId, ClientId);
    ModalResult := mrOk;
  end;
end;

procedure TfrmIncomeCallRoot.CheckSession;
begin
  fSessionClose := DM.CheckCloseSession(CallId);
  CallFinish;
end;

procedure TfrmIncomeCallRoot.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

function TfrmIncomeCallRoot.GetCallFinished: boolean;
begin
   result := (CallResult <> '');
end;

procedure TfrmIncomeCallRoot.SetCallResult(AValue: string);
begin
  if AValue <> fCallResult then
    fCallResult := AValue;
  //CallFinish;
end;

procedure TfrmIncomeCallRoot.SetClientCallPrm(AValue: ClientCallParams);
begin
  fClientCallPrm.Assign(AValue);
end;

procedure TfrmIncomeCallRoot.SetClientClose(AValue: boolean);
begin
  if AValue <> fClientClose then
    fClientClose := AValue;
  CallFinish;
end;

class function TfrmIncomeCallRoot.ShowIncomeCall: Boolean;
var Q : TIBQuery;
    tel :string;
    id: integer;
    CLP: ClientCallParams;
    //extPrm: TClientParam;
begin
  if DM.Db.Connected = false then
    Exit;

  try
    with DM.CallS_Q do
    begin
         Close;
         if Transaction.InTransaction then
           Transaction.CommitRetaining;
         ParamByName('ATS_Num').AsString := DM.CurrentUserSets.ATS_Phone_Num;
         Open;

         if FieldByName('ID').IsNull = false then
         begin //если звонок есть.
           tel := FieldByName('CALL_NUM').AsString;
           id  := FieldByName('ID').AsInteger;
           //Delete;
           if Transaction.InTransaction then
              Transaction.CommitRetaining;

           //получаем параметры звонка
           CLP := DM.getClientCallParams(tel);
           CLP.id_call := id;
           ClP.TelNum  := tel;

           //ExtPrm.CallParam := CLP;

           //берем звонок в обработку
           if not DM.SetReadedCall(id) then
           begin
             // ошибка
             exit;
           end;

           DM.incomeCalling := True;

           frmIncomeCallRoot := TfrmIncomeCallRoot.Create(nil);
           frmIncomeCallRoot.CallId         := FieldByName('CALLAPIID').AsString;
           frmIncomeCallRoot.ClientCallPrm  := ClP;
           frmIncomeCallRoot.ClientId       := ClP.Client_id;
           frmIncomeCallRoot.ClientClose    := false;
           frmIncomeCallRoot.ShowModal;

          (* if clp.Client_Type = '' then
           begin  // Вызываем неизвестный звонок.
             case DM.ShowUnknownCallForm(tel).ModalRes of
               mrOk: DM.ShowClientFiz(asCreate, ExtPrm);
               mrYes: DM.ShowClientUr(asCreate, ExtPrm);
             end;
           end
           else
           begin
             frmIncomeCallRoot.ClientId  := ClP.Client_id;
             if ClP.Client_Type = 'F' then
             begin
               DM.ShowFizCallForm(clp);
             end;

             if ClP.Client_Type = 'U' then
             begin
               DM.ShowUrCallForm(clp);
             end;*)
           end;

          if Transaction.Active then
           Transaction.CommitRetaining;
         end;

  finally
    DM.incomeCalling := False;
    FreeAndNil(frmIncomeCallRoot);
  end;
end;

procedure TfrmIncomeCallRoot.Timer1Timer(Sender: TObject);
var
  extPrm: TClientParam;
begin
  Timer1.Enabled := False;

 try
  if fClientCallPrm.Client_Type = '' then
  begin  // Вызываем неизвестный звонок.
   ExtPrm.CallParam := fClientCallPrm;
   case DM.ShowUnknownCallForm(fClientCallPrm.TelNum).ModalRes of
     mrOk: DM.ShowClientFiz(asCreate, ExtPrm);
     mrYes: DM.ShowClientUr(asCreate, ExtPrm);
   end;
  end
  else
  begin
    if fClientCallPrm.Client_Type = 'F' then
    begin
      DM.ShowFizCallForm(fClientCallPrm);
    end;

    if fClientCallPrm.Client_Type = 'U' then
    begin
      DM.ShowUrCallForm(fClientCallPrm);
    end;
  end;
 finally
   ClientClose := True;
 end;
end;

end.
