unit CommonTypes;

interface
uses
  System.UITypes, DB;

 type TActionStr = (asCreate,asEdit,asShow);

 type
 PFrmCreateParam = ^TFrmCreateParam;
 TFrmCreateParam = record
   action: TActionstr;
   Dataset: TDataset;
 end;

 type TClientType = (clFiz, clUr);
 type TTrayView =(trayNormal, trayMissed);

type
  FormResult = record
  New_Id: Integer;
  ModalRes: TModalResult;
  Comments: string;
end;

function NewFrmCreateParam(AAction: TActionstr; ADataSet: TDataSet=nil): TFrmCreateParam;

 implementation

function NewFrmCreateParam(AAction: TActionstr; ADataSet: TDataSet=nil): TFrmCreateParam;
begin
  Result.action := AAction;
  Result.Dataset := ADataSet;
end;

end.
