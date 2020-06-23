object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 206
  ClientWidth = 565
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrinc: TPanel
    Left = 0
    Top = 0
    Width = 565
    Height = 175
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 556
    ExplicitHeight = 164
    object Label1: TLabel
      Left = 15
      Top = 11
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 231
      Top = 11
      Width = 52
      Height = 13
      Caption = 'Identidade'
    end
    object Label3: TLabel
      Left = 324
      Top = 11
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object Label4: TLabel
      Left = 447
      Top = 10
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label5: TLabel
      Left = 15
      Top = 107
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label6: TLabel
      Left = 339
      Top = 59
      Width = 55
      Height = 13
      Caption = 'Logradouro'
    end
    object CEP: TLabel
      Left = 231
      Top = 59
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object Cidade: TLabel
      Left = 136
      Top = 107
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label7: TLabel
      Left = 257
      Top = 107
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object Label8: TLabel
      Left = 15
      Top = 59
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object edtNome: TEdit
      Left = 15
      Top = 26
      Width = 201
      Height = 21
      TabOrder = 0
    end
    object edtId: TEdit
      Left = 231
      Top = 26
      Width = 80
      Height = 21
      Alignment = taRightJustify
      TabOrder = 1
    end
    object edtCPF: TEdit
      Left = 324
      Top = 26
      Width = 108
      Height = 21
      Alignment = taRightJustify
      TabOrder = 2
      OnExit = edtCPFExit
    end
    object edtTel: TEdit
      Left = 447
      Top = 26
      Width = 93
      Height = 21
      TabOrder = 3
      OnExit = edtTelExit
    end
    object edtBairro: TEdit
      Left = 15
      Top = 122
      Width = 115
      Height = 21
      TabOrder = 7
    end
    object edtLogadouro: TEdit
      Left = 339
      Top = 74
      Width = 201
      Height = 21
      TabOrder = 6
    end
    object edtCEP: TEdit
      Left = 231
      Top = 74
      Width = 95
      Height = 21
      TabOrder = 5
      OnExit = edtCEPExit
    end
    object edtLocal: TEdit
      Left = 136
      Top = 122
      Width = 115
      Height = 21
      TabOrder = 8
    end
    object edtUF: TEdit
      Left = 257
      Top = 122
      Width = 33
      Height = 21
      TabOrder = 9
    end
    object edtEmail: TEdit
      Left = 15
      Top = 74
      Width = 201
      Height = 21
      TabOrder = 4
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 175
    Width = 565
    Height = 31
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 556
    object Bevel1: TBevel
      Left = 554
      Top = 1
      Width = 10
      Height = 29
      Align = alRight
      Shape = bsSpacer
      ExplicitLeft = 546
      ExplicitTop = 6
    end
    object Button1: TButton
      Left = 399
      Top = 1
      Width = 155
      Height = 29
      Align = alRight
      Caption = 'Enviar Email'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 400
    end
  end
end
