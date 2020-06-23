unit uclsAPI;

interface

uses REST.Types, REST.Client, System.StrUtils, uclsClasses, Rest.JSON;

type
   IRestAPI = interface
     ['{EC7DAFE5-9724-401B-9CA1-A8912BA4F491}']
     procedure GetDados(pCEP : string);
     function GetCEP: TCEP;
     property  CEP: TCEP read GetCEP;
   end;

   TRESTAPI = class(TInterfacedObject, IRestAPI)
     private
      RESTRequest  : TRESTRequest;
      RESTClient   : TRESTClient;
      RESTResponse : TRESTResponse;
      FEnderecoAPI : String;
      FSufixoAPI: String;
      FCEP: TCEP;
     protected
     function GetCEP: TCEP;
     public
      constructor Create(AEnderecoAPI: string; ASufixoAPI: String); reintroduce;
      property  CEP: TCEP read GetCEP;
      procedure GetDados(pCEP : String);
      destructor Destroy;override;
   end;


implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TRESTAPI }

constructor TRESTAPI.Create(AEnderecoAPI, ASufixoAPI: String);
begin
  inherited Create;
  FEnderecoAPI := AEnderecoAPI;
  FSufixoAPI   := ASufixoAPI;

  RESTClient   := TRESTClient.Create(nil);
  RESTRequest  := TRESTRequest.Create(nil);
  RESTResponse := TRESTResponse.Create(nil);

  RESTRequest.Client   := RESTClient;
  RESTRequest.Response := RESTResponse;
  RESTRequest.Method   := rmGET;

end;

destructor TRESTAPI.Destroy;
begin

  if Assigned(RESTResponse) then
    RESTResponse.Free;

  if Assigned(RESTClient) then
    RESTClient.Free;

  if Assigned(RESTRequest) then
    RESTRequest.Free;

  inherited;
end;

function TRESTAPI.GetCEP: TCEP;
begin
  Result := FCEP;
end;

procedure TRESTAPI.GetDados(pCEP: String);
begin
  RESTClient.BaseURL := Format(FEnderecoAPI+'%s/'+FSufixoAPI, [pCEP]);

  try
    RESTRequest.Execute;

    if RESTResponse.Content <> EmptyStr then
    begin
      FCEP := TJson.JsonToObject<TCEP>(RESTResponse.Content);
    end;

  finally

  end;

end;

end.
