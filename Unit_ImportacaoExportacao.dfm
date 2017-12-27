object Frm_ImportacaoExportacao: TFrm_ImportacaoExportacao
  Left = 0
  Top = 0
  Caption = 'Importa'#231#227'o e Exporta'#231#227'o de Dados'
  ClientHeight = 449
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 625
    Height = 433
    TabOrder = 0
    object Label1: TLabel
      Left = 144
      Top = 24
      Width = 353
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Caption = 'Importa'#231#227'o/Exporta'#231#227'o de Dados'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label2: TLabel
      Left = 16
      Top = 328
      Width = 48
      Height = 13
      Caption = 'Progresso'
    end
    object RadioGroup1: TRadioGroup
      Left = 32
      Top = 72
      Width = 553
      Height = 73
      Caption = 'Importa'#231#227'o/Exporta'#231#227'o'
      Items.Strings = (
        'Importa'#231#227'o'
        'Exporta'#231#227'o')
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 32
      Top = 160
      Width = 553
      Height = 153
      Caption = 'Dados para Importa'#231#227'o/Exporta'#231#227'o'
      TabOrder = 1
      object CB_Empresa: TCheckBox
        Left = 24
        Top = 56
        Width = 97
        Height = 17
        Caption = 'Empresa'
        TabOrder = 0
        OnClick = CB_EmpresaClick
      end
      object CB_Clientes: TCheckBox
        Left = 24
        Top = 79
        Width = 97
        Height = 17
        Caption = 'Clientes'
        TabOrder = 1
        OnClick = CB_EmpresaClick
      end
      object CB_Funcionarios: TCheckBox
        Left = 24
        Top = 102
        Width = 97
        Height = 17
        Caption = 'Funcionarios'
        TabOrder = 2
        OnClick = CB_EmpresaClick
      end
      object CB_Categorias: TCheckBox
        Left = 24
        Top = 125
        Width = 97
        Height = 17
        Caption = 'Categorias'
        TabOrder = 3
        OnClick = CB_EmpresaClick
      end
      object CB_Fornecedores: TCheckBox
        Left = 200
        Top = 56
        Width = 97
        Height = 17
        Caption = 'Fornecedores'
        TabOrder = 4
        OnClick = CB_EmpresaClick
      end
      object CB_Filmes: TCheckBox
        Left = 200
        Top = 79
        Width = 97
        Height = 17
        Caption = 'Filmes'
        TabOrder = 5
        OnClick = CB_EmpresaClick
      end
      object CB_NotasEntrada: TCheckBox
        Left = 200
        Top = 102
        Width = 145
        Height = 17
        Caption = 'Notas Fiscais de Entrada'
        TabOrder = 6
        OnClick = CB_EmpresaClick
      end
      object CB_Locacoes: TCheckBox
        Left = 200
        Top = 125
        Width = 97
        Height = 17
        Caption = 'Loca'#231#245'es'
        TabOrder = 7
        OnClick = CB_EmpresaClick
      end
      object CB_NotasAPagar: TCheckBox
        Left = 384
        Top = 56
        Width = 97
        Height = 17
        Caption = 'Notas A Pagar'
        TabOrder = 8
        OnClick = CB_EmpresaClick
      end
      object CB_NotasAReceber: TCheckBox
        Left = 384
        Top = 79
        Width = 113
        Height = 17
        Caption = 'Notas A Receber'
        TabOrder = 9
        OnClick = CB_EmpresaClick
      end
      object CB_MovimentacoesCaixa: TCheckBox
        Left = 384
        Top = 102
        Width = 145
        Height = 17
        Caption = 'Movimenta'#231#245'es do Caixa'
        TabOrder = 10
        OnClick = CB_EmpresaClick
      end
      object CB_Caixa: TCheckBox
        Left = 384
        Top = 125
        Width = 97
        Height = 17
        Caption = 'Dinheiro Caixa'
        TabOrder = 11
        OnClick = CB_EmpresaClick
      end
      object CB_Selecionar: TCheckBox
        Left = 24
        Top = 25
        Width = 170
        Height = 17
        Caption = 'Selecionar Todos/Nenhum'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        OnClick = CB_SelecionarClick
      end
    end
    object Bt_Ok: TBitBtn
      Left = 181
      Top = 384
      Width = 92
      Height = 25
      Caption = 'Confirmar'
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = Bt_OkClick
    end
    object Bt_Cancelar: TBitBtn
      Left = 344
      Top = 384
      Width = 89
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 3
      OnClick = Bt_CancelarClick
    end
    object ProgressBar1: TProgressBar
      Left = 16
      Top = 347
      Width = 593
      Height = 17
      TabOrder = 4
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xml'
    Title = 'Salvar Arquivo para Exporta'#231#227'o'
    Left = 512
    Top = 32
  end
  object OpenDialog1: TOpenDialog
    Title = 'Abrir Arquivo para Importa'#231#227'o'
    Left = 568
    Top = 32
  end
end
