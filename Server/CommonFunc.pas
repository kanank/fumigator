unit CommonFunc;

interface

function  FileVersion ( fName : string ) : string;

implementation
uses
  Windows, System.SysUtils;

function  FileVersion ( fName : string ) : string;
    const
        Prefix = '\StringFileInfo\040904E4\';
    var
        FData              : Pointer;
        FSize              : LongInt;
        FIHandle           : Cardinal;
        FFileName          : string;
        FFileVersion       : string;

    function GetVerValue(Value: string):string;
    var
      ItemName: string;
      Len   : Cardinal;
      vVers : Pointer;
    begin
      ItemName := Prefix + Value;
      Result := '';

      if VerQueryValue(FData, PChar(ItemName), vVers, Len) then
         if Len > 0 then begin
            if Len > 255 then
               Len := 255;
            Result := Copy(PChar(vVers), 1 , Len);
         end;{if}
    end;{func}

    function GetFileVersion: string;
    begin
      if FSize > 0 then begin
         GetMem(FData, FSize);
         try
           if GetFileVersionInfo(PChar(FFileName), FIHandle, FSize, FData) then begin
             FFileVersion:= GetVerValue('FileVersion');
           end;{if}
         finally
           FreeMem(FData, FSize);
         end;{try}
      end;{if}
      Result := FFileVersion;
    end;{func}

begin
    Result := '';
    if FileExists( fName ) then begin
       FFileName := fName;
       FSize := GetFileVersionInfoSize(PChar(FFileName), FIHandle);
       Result := GetFileVersion;
    end;
end; { function }

end.
