unit CommonVars;

interface
uses
  CommonTypes;

const
  FormAlphaBlend :byte = 100;

var
  CfgFileName :string ='Fumigator.cfg';
  TempFolder :string = 'Temp';
  PrintTempsFolder :string = '�������';

  InitBirthYear: integer = 30;

  ServerHost: string  = '81.177.48.139'; //localhost';  //'localhost';  //''81.177.48.139'; //;
  ServerPort: integer = 1025;
  ServerHttpPort: integer = 45455;

  CallObj:  TCallProto;
  CallInfo: TCallInfo;

implementation

end.
