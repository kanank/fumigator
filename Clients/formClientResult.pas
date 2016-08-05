unit formClientResult;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, Vcl.ExtCtrls, RzPanel,
  dxGDIPlusClasses, RzButton, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmClientResult = class(TBaseForm)
    pnlForm: TRzPanel;
    pnlResult: TRzPanel;
    RzPanel1: TRzPanel;
    Image2: TImage;
    Exit_bnt: TRzButton;
    butOK: TRzButton;
    pnlCall: TRzPanel;
    btnTransferCall: TRzButton;
    btnCallLater: TRzButton;
    btnDeleteCall: TRzButton;
    Q: TIBQuery;
    procedure btnDeleteCallClick(Sender: TObject);
    procedure butOKClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnCallLaterClick(Sender: TObject);
  private
    fCallId: string;
    fCallApiId: string;
    fClientSaved: Boolean;
    fResultSaved: Boolean;
    fCallResult: string;
    fCallFinished: Boolean;

    procedure SetCallId(AValue: string);
    function GetCallFinished: boolean;
    function SaveResult: Boolean;
    function SaveClient: Boolean;
    function CheckFinish: boolean;
    function GetCallResult: string;
  public
    AtsPhone: string;
    Phone: string;
    //CallResult: string;
    ClientId: Integer;
    frmCli: TForm;
    TypeCli: Integer;
    property CallId: string read fCallId write SetCallId;
    property CallApiId: string read fCallApiId write fCallApiId;

    property CallFinished: boolean read GetCallFinished;
    property CallResult: string read GetCallResult write fCallResult;
    procedure CallFinish;
    procedure CheckSession;
    procedure doFinishCall; override;
  end;

var
  frmClientResult: TfrmClientResult;

implementation

{$R *.dfm}
uses
  DM_Main, formClientFiz, formClientUr, frmMain,
  formSessionResult, formContact, CommonVars, formCallUnknown;


procedure TfrmClientResult.butOKClick(Sender: TObject);
begin
  if not CheckFinish then
    Exit;

  if not fClientSaved then
    SaveClient;

  if not fResultSaved then
    SaveResult;

  if fClientSaved and fResultSaved then
    ModalResult := mrOk;

end;

procedure TfrmClientResult.CallFinish;
begin
  fCallFinished := True;

  if frmCallUnknown.Visible then
  begin
    frmCallUnknown.ModalResult := mrCancel;
    Exit;
  end;

  if not Assigned(frmSessionResult) then
    frmSessionResult := TfrmSessionResult.Create(nil);

  try
    if frmSessionResult.Q.Transaction.Active then
      frmSessionResult.Q.Transaction.CommitRetaining;
  except
  end;

  frmSessionResult.Q.ParamByName('callid').AsString := CallObj.CallInfo.CallId;
  while 1=1 do
  begin
    frmSessionResult.Q.Close;
    frmSessionResult.Q.Open;
    if frmSessionResult.Q.RecordCount > 0 then
      Break;
    Sleep(200);
  end;
  frmSessionResult.Q.Edit;
  frmSessionResult.Q.FieldByName('worker_id').AsInteger := DM.CurrentUserSets.ID;
  frmSessionResult.Q.FieldByName('client_id').AsInteger := ClientId;
  if clientid = 0 then //������ �� ��� ������
      frmSessionResult.Q.FieldByName('ishod').AsString := '�������� ������� �� �������';
  Self.CallResult := CallObj.CallInfo.CallResult; //frmSessionResult.Q.FieldByName('callresult').AsString;

  frmSessionResult.BorderIcons := [];
  frmSessionResult.BorderStyle := bsNone;
  frmSessionResult.Position := poDefault;
  frmSessionResult.Height := frmSessionResult.Cancel_btn.Top - 2;
  frmSessionResult.Parent   := frmClientResult.pnlResult;
  frmSessionResult.Top := 2;
  Self.Height := Self.Height + frmSessionResult.Height - Self.pnlResult.Height;
  Self.pnlResult.Height := frmSessionResult.Height;

  frmSessionResult.Cancel_btn.Visible := False;
  frmSessionResult.Show;

  btnTransferCall.Enabled := false;
  btnDeleteCall.Enabled   := false;

  fCallFinished := True;

end;

function TfrmClientResult.CheckFinish: boolean;
begin
  Result := CallResult <> '';
  if not Result then
    Application.MessageBox('�������� �� ��������� �� ����� ������!',
     '��������� ������', MB_ICONSTOP);
end;

procedure TfrmClientResult.CheckSession;
begin
  if DM.CheckCloseSession(CallId) then
    CallFinish;

end;

procedure TfrmClientResult.doFinishCall;
begin
  CallFinish;
end;

procedure TfrmClientResult.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if not (fClientSaved and fResultSaved) then
    CanClose := False;
end;

procedure TfrmClientResult.FormShow(Sender: TObject);
begin
  if TypeCli = 0 then
    Caption := Caption + '. ' + '���������� ����'
  else
  if TypeCli = 1 then
    Caption := Caption + '. ' + '����������� ����'
  else
    Caption := Caption + '. ' + '�������';
end;

function TfrmClientResult.GetCallFinished: boolean;
begin
  Result := fCallFinished;
  //Result := (CallResult <> '');
end;

function TfrmClientResult.GetCallResult: string;
begin
  if Assigned(frmSessionResult) and frmSessionResult.Q.Active then
    Result := frmSessionResult.Q.FieldByName('callresult').AsString;
end;

procedure TfrmClientResult.btnCallLaterClick(Sender: TObject);
begin
  fClientSaved := True;
  fResultSaved := True;
  ModalResult  := mrOk;
end;

procedure TfrmClientResult.btnDeleteCallClick(Sender: TObject);
begin
  try
    formMain.TCPClient.Socket.WriteLn('#calldelete:' + Self.CallApiId);
  finally
    DM.inCalling := False;
  end;
end;

function TfrmClientResult.SaveClient: Boolean;
begin
  try
    if TypeCli = 0 then
      if Assigned(frmCli) then
        TfrmClientFiz(frmCli).butOK.Click
    else
    if TypeCli = 1 then
      if Assigned(frmCli) then
         TfrmClientUr(frmCli).butOK.Click
    else
      if Assigned(frmCli) then
        TFrmContact(frmCli).butOk.Click;

    Result := not Assigned(frmCli) or (frmCli.ModalResult = mrOk);
    fClientSaved := True;
  except
    result := False;
  end;
end;

function TfrmClientResult.SaveResult: Boolean;
begin
  Result := False;
  with frmSessionResult do
  begin
    if (Q.FieldByName('ISHOD').AsString = '') or
       (Length(Q.FieldByName('RESULT').AsString) < 5)  then
    begin
      Application.MessageBox('�� ��������� ��� ���� ���������� ������!',
       '��������� ������', MB_ICONSTOP);
      Exit;
    end;

    if Q.Modified then
    try
      Q.Post;
      if Q.Transaction.Active then
         Q.Transaction.CommitRetaining;
      Result := True;
      fResultSaved := True;
    except
       if Q.Transaction.Active then
         Q.Transaction.RollbackRetaining;
       Result := False;
    end;
  end;
end;

procedure TfrmClientResult.SetCallId(AValue: string);
begin
  if AValue <> fCallId then
  begin
    fCallId := AValue;
    btnDeleteCall.Enabled   := (fCallId <> '');
    btnTransferCall.Enabled := (fCallId <> '');
    btnCallLater.Enabled    := (fCallId = '');
  end;

end;

end.
