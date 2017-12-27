object Frm_CadastroCliente: TFrm_CadastroCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 504
  ClientWidth = 633
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
    Width = 617
    Height = 440
    TabOrder = 0
    object Label_Cadastro: TLabel
      Left = 191
      Top = 30
      Width = 233
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Caption = 'Cadastro de Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object GroupBox1: TGroupBox
      Left = 14
      Top = 80
      Width = 595
      Height = 137
      Caption = 'Dados Pessoais'
      TabOrder = 0
      object Label1: TLabel
        Left = 112
        Top = 22
        Width = 35
        Height = 13
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 14
        Top = 62
        Width = 23
        Height = 13
        Caption = 'CPF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 14
        Top = 22
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
      object Label13: TLabel
        Left = 150
        Top = 62
        Width = 31
        Height = 13
        Caption = 'Sexo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 343
        Top = 62
        Width = 67
        Height = 13
        Caption = 'Estado Civil:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 14
        Top = 102
        Width = 116
        Height = 13
        Caption = 'Data de Nascimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object C_Nome: TEdit
        Left = 153
        Top = 19
        Width = 424
        Height = 21
        TabOrder = 1
      end
      object C_CPF: TMaskEdit
        Left = 43
        Top = 59
        Width = 89
        Height = 21
        EditMask = '999.999.999-99'
        MaxLength = 14
        TabOrder = 2
        Text = '   .   .   -  '
      end
      object C_Codigo: TEdit
        Left = 61
        Top = 19
        Width = 46
        Height = 21
        TabStop = False
        Enabled = False
        TabOrder = 0
      end
      object C_Sexo: TComboBox
        Left = 187
        Top = 59
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        Items.Strings = (
          'Masculino'
          'Feminino')
      end
      object C_EstadoCivil: TEdit
        Left = 416
        Top = 59
        Width = 161
        Height = 21
        TabOrder = 4
      end
      object C_DataNascimento: TMaskEdit
        Left = 136
        Top = 99
        Width = 73
        Height = 21
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 5
        Text = '  /  /    '
      end
    end
    object GroupBox2: TGroupBox
      Left = 14
      Top = 241
      Width = 595
      Height = 97
      Caption = 'Endere'#231'o'
      TabOrder = 1
      object Label11: TLabel
        Left = 14
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
        Left = 219
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
      object Label7: TLabel
        Left = 14
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
      object Label10: TLabel
        Left = 514
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
      object C_Cidade: TEdit
        Left = 61
        Top = 20
        Width = 137
        Height = 21
        TabOrder = 0
      end
      object C_Bairro: TEdit
        Left = 262
        Top = 20
        Width = 148
        Height = 21
        TabOrder = 1
      end
      object C_Lagradouro: TEdit
        Left = 88
        Top = 61
        Width = 401
        Height = 21
        TabOrder = 2
      end
      object C_Num: TEdit
        Left = 533
        Top = 61
        Width = 44
        Height = 21
        TabOrder = 3
      end
    end
    object GroupBox3: TGroupBox
      Left = 14
      Top = 360
      Width = 595
      Height = 65
      Caption = 'Contato'
      TabOrder = 2
      object Label6: TLabel
        Left = 14
        Top = 30
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
      object Label18: TLabel
        Left = 190
        Top = 32
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
      object C_Tel: TMaskEdit
        Left = 72
        Top = 27
        Width = 89
        Height = 21
        EditMask = '(99)99999-9999;1;_'
        MaxLength = 14
        TabOrder = 0
        Text = '(  )     -    '
      end
      object C_Email: TEdit
        Left = 234
        Top = 27
        Width = 343
        Height = 21
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 454
    Width = 617
    Height = 42
    TabOrder = 1
    object Bt_Ok: TBitBtn
      Left = 204
      Top = 8
      Width = 87
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
      TabOrder = 0
      OnClick = Bt_OkClick
    end
    object Bt_Cancelar: TBitBtn
      Left = 325
      Top = 7
      Width = 84
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
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
