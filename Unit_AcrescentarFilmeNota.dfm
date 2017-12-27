object Frm_AcrescentarFilmeNota: TFrm_AcrescentarFilmeNota
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Acrescentar Filme Nota'
  ClientHeight = 265
  ClientWidth = 461
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
    Width = 445
    Height = 185
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 86
      Width = 58
      Height = 13
      Caption = 'Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 119
      Width = 98
      Height = 13
      Caption = 'Pre'#231'o Custo (R$):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 12
      Top = 153
      Width = 99
      Height = 13
      Caption = 'Quantidade (Uni):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label_Cadastro: TLabel
      Left = 88
      Top = 24
      Width = 261
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Caption = 'Acrescentar Filme a Nota'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object C_Descricao: TEdit
      Left = 76
      Top = 83
      Width = 357
      Height = 21
      TabOrder = 0
    end
    object C_Preco: TEdit
      Left = 117
      Top = 115
      Width = 129
      Height = 21
      TabOrder = 1
      Text = '0,00'
      OnKeyPress = C_PrecoKeyPress
      OnKeyUp = C_PrecoKeyUp
    end
    object C_Quantidade: TEdit
      Left = 117
      Top = 150
      Width = 129
      Height = 21
      TabOrder = 2
      Text = '0'
      OnKeyPress = C_QuantidadeKeyPress
      OnKeyUp = C_QuantidadeKeyUp
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 199
    Width = 445
    Height = 58
    TabOrder = 1
    object Bt_Ok: TBitBtn
      Left = 122
      Top = 15
      Width = 79
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
      Left = 248
      Top = 15
      Width = 81
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
