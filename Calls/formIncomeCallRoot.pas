unit formIncomeCallRoot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, dxGDIPlusClasses,
  Vcl.ExtCtrls,
  CommonTypes, CommonVars ;

type
  TfrmIncomeCallRoot = class(TBaseForm)
    Timer1: TTimer;
    Timer2: TTimer;
    CheckTimer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure CheckTimerTimer(Sender: TObject);
  private
    fCallId: string;
    fCallApiId: string;
    fClientClose: boolean;
    fSessionClose: Boolean;
    fCallResult: string;
    fClientId: Integer;
    fClientCallPrm: ClientCallParams;
    fClientForm: TForm;
    fCallCancel: Boolean;
    fCallAccepted: Boolean;
    function  GetCallFinished: boolean;
    procedure SetClientClose(AValue: boolean);
    procedure SetCallResult(AValue: string);
    procedure SetClientCallPrm(AValue: ClientCallParams);
    procedure doFinishCall; override;
    procedure doAcceptCall; override;

  public
    property CallResult: string read fCallResult write SetCallResult;
    property CallId: string read fCallId write fCallId;
    property CallApiId: string read fCallApiId write fCallApiId;
    property CallFinished: boolean read GetCallFinished;
    property ClientClose: boolean read fClientClose write SetClientClose;
    property ClientId: Integer read fClientId write fClientId;
    property SessionClose: Boolean read fSessionClose write fSessionClose;
    property ClientCallPrm: ClientCallParams read fClientCallPrm write SetClientCallPrm;
    property ClientForm: TForm read fClientForm write fClientForm;
    property CallCancel: Boolean read fCallCancel write fCallCancel;
    property CallAccept: Boolean read fCallAccepted write  fCallAccepted;

    procedure CallFinish;
    procedure CheckSession;
    procedure DoCallCancel;

    class function ShowIncomeCall(ACallId: string = ''; ACallApiId: string = ''): Boolean;
    class function ShowCall: Boolean;
    class procedure CheckAccept(Sender: TObject);
  end;

var
  frmIncomeCallRoot: TfrmIncomeCallRoot;

implementation

{$R *.dfm}
uses
  DM_Main, IBX.IBQuery, formClientFiz, formClientUr,
  formIncomeCalls, formIncomeCallsUr, formCallUnknown,
  formCallEvent, frmMain, formContact;

{ TfrmIncomeCallRoot }

procedure TfrmIncomeCallRoot.DoCallCancel;
begin
  fCallCancel := True;
  CallObj.CallInfo.CallResult := 'CANCEL';
    
  if Assigned(frmIncomeCall) then
  begin
     frmIncomeCall.ModalResult := mrCancel;
    //FreeAndNil(frmIncomeCall);
  end;
  if Assigned(frmIncomeCallUr) then
  begin
    frmIncomeCallUr.ModalResult := mrCancel;
    //frmIncomeCallUr.Close;
    //FreeAndNil(frmIncomeCallUr);
  end;
  if Assigned(frmCallUnknown) then
    frmCallUnknown.ModalResult := mrCancel;

  //Self.ModalResult := mrCancel;
  (*if Assigned(frmCallEvent) then
    FreeAndNil(frmCallEvent); 
       
    fClientClose  := True;
    fSessionClose := True;
    Self.ModalResult := mrCancel;
    Self.CloseModal;*)
end;

procedure TfrmIncomeCallRoot.doFinishCall;
begin
  inherited;
  //frmCallEvent.ModalResult := mrCancel;
  //if fClose then
  CallFinish;

end;

procedure TfrmIncomeCallRoot.CallFinish;
var
  mr: TModalResult;
begin
  if CallObj.Accepted then
    mr := mrOk
  else
    mr := mrCancel;
  if Assigned(frmCallEvent) then
    frmCallEvent.ModalResult := mr;


  if not CallObj.Active and not CallObj.Accepted then //Callobj.Cancelled or fSessionClose then
  begin
    if Assigned(frmCallUnknown) then
    begin
      //frmCallUnknown.CloseAbsolute;
      frmCallUnknown.HideAbsolute;
    end;
    if Assigned(frmIncomeCall) then
    begin
      frmIncomeCall.CloseAbsolute;
      //frmIncomeCall.Free;
    end;
    if Assigned(frmIncomeCallUr) then
    begin
      frmIncomeCallUr.CloseAbsolute;
      //frmIncomeCallUr.Free;
    end;
    if Assigned(frmContact) then
      frmContact.CloseAbsolute;

    ModalResult := mrCancel;
    Exit;
 end;

  if Callobj.Cancelled and not CallObj.Accepted then
  begin
   // if Assigned(frmCallEvent) then
   //   frmCallEvent.ModalResult := mrCancel;

    ModalResult := mrCancel;
    Exit;
  end;

  if not CallObj.Active and CallObj.Accepted and fClientClose  then
  begin
    fCallResult := DM.FinishSession(CallObj.CallInfo.CallId, ClientId);
    ModalResult := mrOk;
  end;
end;

procedure TfrmIncomeCallRoot.CheckSession;
var
  accept: boolean;
begin
  (*if fCallCancel then
    ModalResult := mrCancel
  else
  if Assigned(frmCallEvent) and (frmCallEvent.ModalResult = mrNone) then
  begin
    if not fCallAccepted and DM.CheckCloseCall(CallId) then
    begin
      frmCallEvent.ModalResult := mrCancel;
      Exit;
    end;
  end;

  if Assigned(frmCallEvent) and
     ((frmCallEvent.ModalResult = mrNone) or
     (frmCallEvent.ModalResult = mrCancel)) then
    Exit;*)
  //fSessionClose := DM.CheckCloseSession(CallId);
(*  if callid = ''  then
    exit;

  DM.CheckSession(CallId, fSessionClose, accept);
  if accept then //приняли звонок
  begin
    fCallAccepted := true;
    if Assigned(frmCallEvent) then
      frmCallEvent.ModalResult := mrOk
    else
      DoCallCancel;
  end;
  CallFinish;*)
end;

procedure TfrmIncomeCallRoot.CheckTimerTimer(Sender: TObject);
begin
  CheckAccept(CallObj);
  if CallObj.Accepted then
    CheckTimer.Enabled := false;
end;

procedure TfrmIncomeCallRoot.doAcceptCall;
begin
  inherited;
  if Assigned(frmCallEvent) then
    frmCallEvent.ModalResult := mrOk;
end;

procedure TfrmIncomeCallRoot.FormShow(Sender: TObject);
begin
  if not CallObj.Active then
    ModalResult := mrCancel;

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
  CallFinish;
end;

procedure TfrmIncomeCallRoot.SetClientCallPrm(AValue: ClientCallParams);
begin
  fClientCallPrm.Assign(AValue);
end;

procedure TfrmIncomeCallRoot.SetClientClose(AValue: boolean);
begin
  if AValue <> fClientClose then
    fClientClose := AValue;
  if AValue then
    CallFinish;
end;

class function TfrmIncomeCallRoot.ShowCall: Boolean;
begin
 if DM.Db.Connected = false then
    Exit;

  try
    DM.incomeCalling := True;
    frmIncomeCallRoot := TfrmIncomeCallRoot.Create(nil);

    frmIncomeCallRoot.ClientId := CallObj.CallInfo.ClientId;
    frmIncomeCallRoot.ClientClose       := false;
    frmIncomeCallRoot.CloseOnCancelCall := true;
    frmIncomeCallRoot.ModalResult := mrNone;
    if CallObj.Active then
      frmIncomeCallRoot.ShowModal;

  finally
    FreeAndNil(frmCallEvent);
    FreeAndNil(frmIncomeCallRoot);
    CallObj.Ready := True;
  end;
end;

class function TfrmIncomeCallRoot.ShowIncomeCall(ACallId: string = ''; ACallApiId: string = ''): Boolean;
var Q : TIBQuery;
    tel :string;
    id: integer;
    CLP: ClientCallParams;
    //extPrm: TClientParam;
begin
  if DM.Db.Connected = false then
    Exit;

  CLP.Setup; //установка

  DM.incomeCalling := True;
  frmIncomeCallRoot := TfrmIncomeCallRoot.Create(nil);
  if ACallId <> '' then
    frmIncomeCallRoot.CallId := ACallId;
  if ACallApiId <> '' then
    frmIncomeCallRoot.CallApiId:= ACallApiId;
  
  try
    with DM.CallS_Q do
    begin
         Close;
         if Transaction.InTransaction then
           Transaction.CommitRetaining;
         ParamByName('ATS_Num').AsString := DM.CurrentUserSets.ATS_Phone_Num;
         ParamByName('date_start').AsDateTime := DM.DateStart;

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
//           if not DM.SetReadedCall(id) then
//           begin
//             // ошибка
//             exit;
//           end;

           if ACallId = '' then
             frmIncomeCallRoot.CallId         := FieldByName('CALLID').AsString;
           if ACallApiId = '' then
             frmIncomeCallRoot.CallApiId      := FieldByName('CALLAPIID').AsString;
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
    //formMain.CallId    := '';
    //formMain.CallApiId := '';
    DM.incomeCalling := False;
    FreeAndNil(frmCallEvent);
    FreeAndNil(frmIncomeCallRoot);
  end;
end;

class procedure TfrmIncomeCallRoot.CheckAccept(Sender: TObject);
begin
  if not TCallProto(Sender).Active then
    exit;

  with DM.QSessionCheckAct do
  begin
    Close;
    //ParamByName('callid').AsString := TCallProto(Sender).CallInfo.CallId;
    ParamByName('callapiid').AsString := TCallProto(Sender).CallInfo.CallApiId;
    Open;

    if (RecordCount = 1) and
       (FieldByName('callid').AsString =
         TCallProto(Sender).CallInfo.CallId) then
    begin
      TCallProto(Sender).Accepted := True;
      if Assigned(frmCallEvent) then
        frmCallEvent.ModalResult := mrCancel;
    end
  end;
end;

procedure TfrmIncomeCallRoot.Timer1Timer(Sender: TObject);
var
  extPrm: TClientParam;
  callPrm: ClientCallParams;
  formRes: FormResult;
  newCli: Boolean;
begin
  extPrm.Setup;

 Timer1.Enabled := False;
 DM.GetDataset(DM.Clients);
 try
  Timer2.Enabled := True;
  if CallObj.CallInfo.ClientType = '' then
  try  // Вызываем неизвестный звонок.
   CallPrm.Setup;
   CallPrm.TelNum := CallObj.CallInfo.Phone;
   ExtPrm.CallParam := @CallPrm;
   case DM.ShowUnknownCallForm(CallObj.CallInfo.Phone, false).ModalRes of
     mrOk:  formRes := DM.ShowClientFiz(asCreate, ExtPrm);
     mrYes: formRes := DM.ShowClientUr(asCreate, ExtPrm);
     mrAll:
       begin
        extPrm.ClientType := frmCallUnknown.ContactType;
        formRes := DM.ShowContact(asCreate, ExtPrm);
       end;
   end;
  finally
    //frmCallUnknown.Free;
    frmCallUnknown.Hide;
  end
  else
  begin

    if CallObj.CallInfo.ClientType = 'F' then
    begin
      DM.ShowFizCallForm(fClientCallPrm);
    end
    else
    if fClientCallPrm.Client_Type = 'U' then
    begin
      DM.ShowUrCallForm(fClientCallPrm);
    end
    else
    if fClientCallPrm.Client_Type = 'C' then
    begin
      DM.ShowContactCallForm(fClientCallPrm);
    end
  end;
 finally
   ClientClose := True;
 end;
end;

procedure TfrmIncomeCallRoot.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  //CheckTimer.Enabled := true;

  frmCallEvent := TfrmCallEvent.Create(nil);

  if not CallObj.Accepted then
    frmCallEvent.ShowModal
  else

    frmCallEvent.ModalResult := mrOk;

  //if frmCallEvent.ModalResult = mrCancel then
  //  DoCallCancel
  //else
  //if frmCallEvent.ModalResult = mrOk then
  //   formMain.ClientSocket.Socket.SendText('#callaccept:' + CallApiId +',' +DM.CurrentUserSets.ATS_Phone_Num);
  
end;

end.
