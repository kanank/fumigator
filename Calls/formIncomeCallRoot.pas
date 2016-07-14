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
    Timer2: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
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

    procedure CallFinish;
    procedure CheckSession;
    procedure CheckAccept;
    procedure DoCallCancel;

    class function ShowIncomeCall(ACallId: string = ''; ACallApiId: string = ''): Boolean;
  end;

var
  frmIncomeCallRoot: TfrmIncomeCallRoot;

implementation

{$R *.dfm}
uses
  DM_Main, IBX.IBQuery, formClientFiz, formClientUr,
  formIncomeCalls, formIncomeCallsUr, formCallUnknown,
  formCallEvent, frmMain;

{ TfrmIncomeCallRoot }

procedure TfrmIncomeCallRoot.DoCallCancel;
begin
  fCallCancel := True;

    
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

procedure TfrmIncomeCallRoot.CallFinish;
begin
  if fCallCancel or (fSessionClose and not fCallAccepted) then
  begin
    if Assigned(frmCallEvent) then
      frmCallEvent.ModalResult := mrCancel;

    ModalResult := mrCancel;
    Exit;
  end;

  if fSessionClose and fClientClose  then
  begin
    fCallResult := DM.FinishSession(CallId, ClientId);
    ModalResult := mrOk;
  end;
end;

procedure TfrmIncomeCallRoot.CheckAccept;
begin
  (*if fCallCancel then
    ModalResult := mrCancel
  else
  if Assigned(frmCallEvent) and (frmCallEvent.ModalResult <> mrCancel) then
  begin
    if not DM.CheckAcceptCall(CallId) then
    begin
      fCallCancel := True;
      frmCallEvent.ModalResult := mrCancel;
      Exit;
    end
    else
      fCallAccepted := True;
  end;  *)
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
  if callid = ''  then
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
    formMain.CallId    := '';
    formMain.CallApiId := '';
    DM.incomeCalling := False;
    FreeAndNil(frmCallEvent);
    FreeAndNil(frmIncomeCallRoot);
  end;
end;

procedure TfrmIncomeCallRoot.Timer1Timer(Sender: TObject);
var
  extPrm: TClientParam;
  formRes: FormResult;
  newCli: Boolean;
begin
  extPrm.Setup;

 Timer1.Enabled := False;
 DM.GetDataset(DM.Clients);
 try
  Timer2.Enabled := True;
  if fClientCallPrm.Client_Type = '' then
  try  // Вызываем неизвестный звонок.
   ExtPrm.CallParam := @fClientCallPrm;
   case DM.ShowUnknownCallForm(fClientCallPrm.TelNum, false).ModalRes of
     mrOk:  formRes := DM.ShowClientFiz(asCreate, ExtPrm);
     mrYes: formRes := DM.ShowClientUr(asCreate, ExtPrm);
     mrAll:
       begin
        extPrm.ClientType := frmCallUnknown.ContactType;
        formRes := DM.ShowContact(asCreate, ExtPrm);
       end;
   end;
  finally
    frmCallUnknown.Free;
  end
  else
  begin
    if fClientCallPrm.Client_Type = 'F' then
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

  frmCallEvent := TfrmCallEvent.Create(nil);

  if not fCallAccepted then
    frmCallEvent.ShowModal
  else
    frmCallEvent.ModalResult := mrOk;

  if frmCallEvent.ModalResult = mrCancel then
    DoCallCancel
  //else
  //if frmCallEvent.ModalResult = mrOk then
  //   formMain.ClientSocket.Socket.SendText('#callaccept:' + CallApiId +',' +DM.CurrentUserSets.ATS_Phone_Num);
  
end;

end.
