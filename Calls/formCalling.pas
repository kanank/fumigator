unit formCalling;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, dxGDIPlusClasses, Vcl.ExtCtrls, cxDBEdit, Vcl.StdCtrls, RzPanel,
  Data.DB, RzButton, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmCalling = class(TBaseForm)
    Image1: TImage;
    edtPhone: TcxMaskEdit;
    pnlFiz: TRzPanel;
    Label11: TLabel;
    edtFamily: TcxDBTextEdit;
    pnlUr: TRzPanel;
    Label1: TLabel;
    edtNameOrg: TcxDBTextEdit;
    Label2: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    DS: TDataSource;
    Label3: TLabel;
    Exit_bnt: TRzButton;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    RzButton3: TRzButton;
    Q: TIBQuery;
    procedure edtPhoneMouseEnter(Sender: TObject);
    procedure edtPhoneMouseLeave(Sender: TObject);
    procedure edtPhoneClick(Sender: TObject);
  private
    fCallId: string;
    procedure SetCallId(AValue: string);
  public
    AtsPhone: string;
    Phone: string;
    property CallId: string read fCallId write SetCallId;
    procedure CallFinish;
    procedure CheckSession;
  end;

var
  frmCalling: TfrmCalling;

implementation

{$R *.dfm}

uses
  DM_Main, frmMain, formSessionResult;


procedure TfrmCalling.CallFinish;
begin
  frmSessionResult := TfrmSessionResult.Create(nil);
  try
    if frmSessionResult.Q.Transaction.Active then
      frmSessionResult.Q.Transaction.CommitRetaining;

    frmSessionResult.Q.ParamByName('callid').AsString := Callid;
    frmSessionResult.Q.Open;
    frmSessionResult.Q.Edit;
    frmSessionResult.ShowModal;
    if frmSessionResult.Q.Modified then
    try
      frmSessionResult.Q.Post;
      if frmSessionResult.Q.Transaction.Active then
         frmSessionResult.Q.Transaction.CommitRetaining;
    except
       if frmSessionResult.Q.Transaction.Active then
         frmSessionResult.Q.Transaction.RollbackRetaining;
    end;

  finally
    FreeAndNil(frmSessionResult);
  end;
end;

procedure TfrmCalling.CheckSession;
begin
  Q.Close;
  Q.ParamByName('callid').AsString := CallId;
  if Q.Transaction.Active then
    Q.Transaction.CommitRetaining;
  try
    Q.Open;
    if Q.Transaction.Active then
      Q.Transaction.CommitRetaining;
    if Q.RecordCount > 0  then
      CallFinish;
  except
    if Q.Transaction.Active then
     Q.Transaction.RollbackRetaining;
  end;

end;

procedure TfrmCalling.edtPhoneClick(Sender: TObject);
begin
  try
    DM.inCalling := True;
    formMain.ClientSocket.Socket.SendText('#call:' + AtsPhone + ',' + Phone);

  finally
    DM.inCalling := False;
  end;
end;

procedure TfrmCalling.edtPhoneMouseEnter(Sender: TObject);
begin
  inherited;
  edtPhone.Style.Font.Style := [fsBold, fsUnderline];
end;

procedure TfrmCalling.edtPhoneMouseLeave(Sender: TObject);
begin
  inherited;
  edtPhone.Style.Font.Style := [];
end;

procedure TfrmCalling.SetCallId(AValue: string);
begin
  if AValue <> fCallId then
  begin
    fCallId := AValue;

  end;

end;

end.
