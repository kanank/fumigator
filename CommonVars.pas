unit CommonVars;

interface
uses
  CommonTypes;

const
  FormAlphaBlend :byte = 100;

var
  CfgFileName :string ='Fumigator.cfg';
  TempFolder :string = 'Temp';
  PrintTempsFolder :string = 'Шаблоны';

  InitBirthYear: integer = 30;

  ServerHost: string = '81.177.48.139'; //'localhost'; //;
  ServerPort: integer = 1025;
  ServerHttpPort: integer = 45455;

implementation

end.
