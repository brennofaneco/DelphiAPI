unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, uclsAPI, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, uclsClasses, JvAppXMLStorage, System.MaskUtils;

type
  TForm1 = class(TForm)
    pnlPrinc: TPanel;
    pnlBotoes: TPanel;
    Button1: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    edtNome: TEdit;
    Label2: TLabel;
    edtId: TEdit;
    Label3: TLabel;
    edtCPF: TEdit;
    Label4: TLabel;
    edtTel: TEdit;
    Label5: TLabel;
    edtBairro: TEdit;
    Label6: TLabel;
    edtLogadouro: TEdit;
    CEP: TLabel;
    edtCEP: TEdit;
    Cidade: TLabel;
    edtLocal: TEdit;
    Label7: TLabel;
    edtUF: TEdit;
    Label8: TLabel;
    edtEmail: TEdit;
    procedure edtCEPExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtCPFExit(Sender: TObject);
    procedure edtTelExit(Sender: TObject);
  private
    { Private declarations }
    GetDadosAPI: IRestAPI;
    EnviarEmail : IEnviarEmail;
    function FormataCPF(numtexto: String): String;
    function FormaTelefone(numtexto: String): String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation



{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  lList : TStrings;
  Cliente : TClient;
  Storage: TJvAppXMLFileStorage;
begin
  lList   := TStringList.Create;
  Cliente := TClient.Create;
  Storage := TJvAppXMLFileStorage.Create(nil);

  try
    Cliente.Nome       := edtNome.Text;
    Cliente.Identidade := edtId.Text;
    Cliente.CPF        := edtCPF.Text;
    Cliente.Telefone   := edtTel.Text;
    Cliente.Email      := edtEmail.Text;

    if Assigned(GetDadosApi.CEP) then
      Cliente.CEP := GetDadosApi.CEP;

    Storage.WritePersistent('', Cliente);
    Storage.Xml.SaveToFile('Cliente.xml');

    lList.Add('Ola!');
    lList.Add('Segue o arquivo em anexo!');
    lList.Add('');
    lList.Add('Att,');
    lList.Add('');
    lList.Add('Brenno');

    EnviarEmail.Enviar('Envio Cliente XML', 'brenno.faneco@gmail.com', 'Cliente.xml', lList);
  finally
    Storage.Free;
    lList.Free;
    Cliente.Free;
  end;
end;

procedure TForm1.edtCEPExit(Sender: TObject);
begin
  if edtCEP.Text <> EmptyStr then
  begin
    GetDadosAPI.GetDados(edtCEP.Text);
    if GetDadosApi.CEP.CEP <> EmptyStr then
    begin
      edtLogadouro.text := GetDadosApi.CEP.Logradouro;
      edtLocal.Text     := GetDadosApi.CEP.Localidade;
      edtUF.Text        := GetDadosApi.CEP.UF;
      edtBairro.Text    := GetDadosApi.CEP.Bairro;
    end;
  end;
end;

procedure TForm1.edtCPFExit(Sender: TObject);
begin
  edtCPF.Text := FormataCPF(edtCPF.Text);
end;

procedure TForm1.edtTelExit(Sender: TObject);
begin
  edtTel.Text := FormaTelefone(edtTel.Text);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  GetDadosAPI := TRESTAPI.Create('https://viacep.com.br/ws/', 'json/');
  EnviarEmail := TEnviarEmail.Create;

  if edtNome.CanFocus then
    edtNome.SetFocus;
end;

function TForm1.FormataCPF(numtexto:String):String;
begin
  Delete(numtexto, AnsiPos('.',numtexto),1);
  Delete(numtexto, AnsiPos('.',numtexto),1);
  Delete(numtexto, AnsiPos('-',numtexto),1);
  Delete(numtexto, AnsiPos('/',numtexto),1);
  Result:=FormatmaskText('000\.000\.000\-00;0;',numtexto); // Formata os numero

end;

function TForm1.FormaTelefone(numtexto:String):String;
begin
    Delete(numtexto, AnsiPos('-',numtexto),1);
    Delete(numtexto, AnsiPos('-',numtexto),1);
    Delete(numtexto, AnsiPos('(',numtexto),1);
    Delete(numtexto, AnsiPos(')',numtexto),1);
    Result:=FormatmaskText('\(00\)0000\-0000;0;',numtexto);
end;

end.

