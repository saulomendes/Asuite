/// this server will use TSQLRestServerFullMemory over HTTP
program Project14ServerHttp;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Classes,
  SynCommons,
  mORMot,
  mORMotHttpServer,
  Project14Interface;

type
  TServiceCalculator = class(TInterfacedObject, ICalculator)
  public
    function Add(n1,n2: integer): integer;
  end;

function TServiceCalculator.Add(n1, n2: integer): integer;
begin
  result := n1+n2;
end;


var
  aModel: TSQLModel;
  aServer: TSQLRestServer;
  aHTTPServer: TSQLHttpServer;
begin
  // define the log level
  with TSQLLog.Family do begin
    Level := LOG_VERBOSE;
    EchoToConsole := LOG_VERBOSE; // log all events to the console
  end;
  // create a Data Model
  aModel := TSQLModel.Create([],ROOT_NAME);
  try
    // initialize a TObjectList-based database engine
    aServer := TSQLRestServerFullMemory.Create(aModel,'test.json',false,true);
    try
      // register our ICalculator service on the server side
      aServer.ServiceRegister(TServiceCalculator,[TypeInfo(ICalculator)],sicShared);
      // launch the HTTP server
      aHTTPServer := TSQLHttpServer.Create('888',[aServer]);
      try
        aHTTPServer.AccessControlAllowOrigin := '*'; // for AJAX requests to work
        writeln(#10'Background server is running.'#10);
        writeln('Press [Enter] to close the server.'#10);
        readln;
      finally
        aHTTPServer.Free;
      end;
    finally
      aServer.Free;
    end;
  finally
    aModel.Free;
  end;
end.
