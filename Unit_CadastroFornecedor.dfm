object Frm_CadastroFornecedor: TFrm_CadastroFornecedor
  Left = 0
  Top = 0
  Caption = 'Cadastro de Fornecedor'
  ClientHeight = 489
  ClientWidth = 697
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
    Width = 681
    Height = 409
    TabOrder = 0
    object Label_Cadastro: TLabel
      Left = 220
      Top = 30
      Width = 233
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Caption = 'Cadastro de Fornecedor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 88
      Width = 625
      Height = 185
      Caption = 'Dados Empresariais'
      TabOrder = 0
      object Label1: TLabel
        Left = 140
        Top = 32
        Width = 38
        Height = 13
        Caption = 'Nome: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 40
        Top = 72
        Width = 77
        Height = 13
        Caption = 'Raz'#227'o Social: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 40
        Top = 110
        Width = 106
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 264
        Top = 110
        Width = 30
        Height = 13
        Caption = 'CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 440
        Top = 110
        Width = 52
        Height = 13
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 40
        Top = 148
        Width = 38
        Height = 13
        Caption = 'E-mail:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 40
        Top = 32
        Width = 41
        Height = 13
        Caption = 'Codigo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object C_Nome: TEdit
        Left = 184
        Top = 29
        Width = 409
        Height = 21
        TabOrder = 0
      end
      object C_RazaoSocial: TEdit
        Left = 123
        Top = 69
        Width = 470
        Height = 21
        TabOrder = 1
      end
      object C_CNPJ: TMaskEdit
        Left = 300
        Top = 107
        Width = 113
        Height = 21
        EditMask = '99.999.999/9999-99'
        MaxLength = 18
        TabOrder = 3
        Text = '  .   .   /    -  '
      end
      object C_TelEmpresa: TMaskEdit
        Left = 498
        Top = 107
        Width = 95
        Height = 21
        EditMask = '(99)99999-9999'
        MaxLength = 14
        TabOrder = 4
        Text = '(  )     -    '
      end
      object C_EmailEmpresa: TEdit
        Left = 84
        Top = 145
        Width = 509
        Height = 21
        TabOrder = 5
      end
      object C_InscricaoEstadual: TMaskEdit
        Left = 152
        Top = 107
        Width = 82
        Height = 21
        EditMask = '999.99.99-9'
        MaxLength = 11
        TabOrder = 2
        Text = '   .  .  - '
      end
      object C_Codigo: TEdit
        Left = 87
        Top = 29
        Width = 46
        Height = 21
        TabStop = False
        Enabled = False
        TabOrder = 6
      end
    end
    object GroupBox3: TGroupBox
      Left = 24
      Top = 295
      Width = 625
      Height = 98
      Caption = 'Endere'#231'o '
      TabOrder = 1
      object Label8: TLabel
        Left = 40
        Top = 24
        Width = 41
        Height = 13
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 245
        Top = 24
        Width = 37
        Height = 13
        Caption = 'Bairro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 530
        Top = 64
        Width = 13
        Height = 13
        Caption = 'N'#176
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 40
        Top = 64
        Width = 68
        Height = 13
        Caption = 'Lagradouro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object C_Cidade: TEdit
        Left = 84
        Top = 20
        Width = 137
        Height = 21
        TabOrder = 0
      end
      object C_Bairro: TEdit
        Left = 285
        Top = 20
        Width = 196
        Height = 21
        TabOrder = 1
      end
      object C_Num: TEdit
        Left = 549
        Top = 61
        Width = 44
        Height = 21
        TabOrder = 3
      end
      object C_Lagradouro: TEdit
        Left = 114
        Top = 61
        Width = 402
        Height = 21
        TabOrder = 2
      end
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 423
    Width = 681
    Height = 58
    TabOrder = 1
    object Bt_Ok: TBitBtn
      Left = 227
      Top = 16
      Width = 75
      Height = 25
      Caption = 'OK'
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
      TabOrder = 0
      OnClick = Bt_OkClick
    end
    object Bt_Cancelar: TBitBtn
      Left = 374
      Top = 16
      Width = 75
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
      TabOrder = 1
      OnClick = Bt_CancelarClick
    end
  end
end
