object Frm_EditarFilme: TFrm_EditarFilme
  Left = 0
  Top = 0
  Caption = 'Editar Filme'
  ClientHeight = 436
  ClientWidth = 632
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
    Width = 616
    Height = 356
    TabOrder = 0
    object Label_Cadastro: TLabel
      Left = 192
      Top = 25
      Width = 233
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Caption = 'Edi'#231#227'o de Filme'
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
      Top = 64
      Width = 587
      Height = 113
      Caption = 'Informa'#231#245'es'
      TabOrder = 0
      object Label14: TLabel
        Left = 15
        Top = 30
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
      object Label1: TLabel
        Left = 114
        Top = 30
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
      object Label3: TLabel
        Left = 15
        Top = 57
        Width = 116
        Height = 13
        Caption = 'Codigo da Categoria:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 15
        Top = 86
        Width = 35
        Height = 13
        Caption = 'Audio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 311
        Top = 57
        Width = 77
        Height = 13
        Caption = 'Tipo de Filme:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object C_Codigo: TEdit
        Left = 62
        Top = 27
        Width = 49
        Height = 21
        TabStop = False
        Enabled = False
        TabOrder = 0
      end
      object C_Descricao: TEdit
        Left = 178
        Top = 27
        Width = 399
        Height = 21
        TabStop = False
        TabOrder = 1
      end
      object C_Audio: TComboBox
        Left = 56
        Top = 83
        Width = 181
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        Items.Strings = (
          'Dublado'
          'Legendado')
      end
      object C_CodigoCategoria: TComboBox
        Left = 137
        Top = 53
        Width = 168
        Height = 21
        Style = csDropDownList
        TabOrder = 2
      end
      object C_TipoFilme: TComboBox
        Left = 394
        Top = 53
        Width = 183
        Height = 21
        Style = csDropDownList
        TabOrder = 4
        Items.Strings = (
          'A'#231#227'o'
          'Aventura'
          'Anima'#231#227'o'
          'Com'#233'dia'
          'Cl'#225'ssico'
          'Document'#225'rio'
          'Drama'
          'Fic'#231#227'o Cient'#237'fica'
          'Musical'
          'Romance'
          'Terror'
          'Suspense')
      end
    end
    object StringGrid1: TStringGrid
      Left = 128
      Top = 183
      Width = 283
      Height = 154
      ColCount = 3
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 1
      OnSelectCell = StringGrid1SelectCell
      ColWidths = (
        82
        74
        93)
    end
    object Bt_Desativar: TBitBtn
      Left = 430
      Top = 191
      Width = 51
      Height = 57
      Caption = 'Desativar'
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FDFDFDE9E9E9ADADB48181A7C1C1C1F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFEDEDEDB7B7B97E7EA6B9B9BBEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD
        E5E5E59D9DAE2626C64A4AE33A3AB9B7B7B9EFEFEFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDE9
        E9E9A9A9B12B2BC04B4BE02D2DBBAFAFB4EDEDEDFFFFFFFFFFFFFDFDFDE3E3E3
        9595AB1616C21313D45F5FE40000D52E2EBDAFAFB4EDEDEDFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDE5E5E59B
        9BAC1E1EC20505D35E5EE10505CE2424B9ABABB3EBEBEBFFFFFFEDEDED9393AE
        1212BF0000CB1111D05858E00707D20000D32424BFA7A7B1E9E9E9FDFDFDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBDFDFDF9191AA14
        14C50000D00B0BD05454DD0505CA0000C72222B4ABABB6F3F3F3D1D1D71010BD
        0000C50000C72323E47070F95353E40808D00000D01C1CC19B9BACE5E5E5FDFD
        FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBD9D9D98383A70E0EC600
        00CE0C0CCE6161E77F7FF92424DB0000C30000C02E2EB8E7E7E7B5B5D40000BE
        0000C11C1CE63939FF4646FF7272FE5555E50B0BCE0000CD1414C29393AAE1E1
        E1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D3D3D37474A60808C80000CB0F
        0FCD6868EA8585FE6363FF5656FE1F1FD90000BD0808B9E1E1E1B1B1D30000BB
        1616E72B2BFF3434FF3E3EFF4949FF6E6EFE5656E60D0DCC0000CA0E0EC28787
        A7DBDBDBFBFBFBFFFFFFFFFFFFF7F7F7CDCDCD6666A60404C60000C81313CB6C
        6CEC8080FF6464FF5959FF4F4FFF4545FE1C1CDA0000B6E1E1E1B3B3D60F0FE8
        1E1EFF2626FF2F2FFF3737FF4141FF4A4AFF6969FF5656E80E0EC80000C60A0A
        C17A7AA4D7D7D7F9F9F9F5F5F5C7C7C75858A70202C40000C41616C96E6EEF79
        79FF6363FF5A5AFF5151FF4848FF3F3FFF3636FF1616D8E5E5E5CDCDF21212FF
        1919FF2121FF2929FF3131FF3939FF4242FF4A4AFF6262FF5454E90F0FC50000
        C20404BF6E6EA3C9C9C9BBBBBB4848A80000C20000C11A1AC86C6CF27070FF61
        61FF5959FF5151FF4949FF4141FF3838FF3030FF3131FCF5F5F5FDFDFD8E8EF8
        1515FE1B1BFF2323FF2A2AFF3232FF3A3AFF4141FF4949FF5A5AFF5151EC0F0F
        C20000BE0202BD5454963434A40000BD0000BD1B1BC76565F46666FF5C5CFF55
        55FF4E4EFF4747FF4040FF3838FF3030FF3333FDBFBFF9FFFFFFFFFFFFFDFDFD
        A1A1F91A1AFE1D1DFF2323FF2A2AFF3131FF3838FF3F3FFF4545FF5151FF4B4B
        EE0E0EBF0000B90000B90000B90101B91A1AC65C5CF65B5BFF5454FF4F4FFF4A
        4AFF4444FF3E3EFF3737FF3030FF3B3BFDCECEF9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFB2B2F91F1FFE1C1CFF2323FF2929FF2F2FFF3535FF3B3BFF4040FF4848
        FF4242F00C0CBD0000B50000B51818C65050F94F4FFF4B4BFF4848FF4444FF3F
        3FFF3A3AFF3434FF2E2EFF4545FCDCDCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC1C1F92323FD1B1BFF2121FF2626FF2C2CFF3030FF3535FF3939
        FF3E3EFF3838F30808B91414C74242FB4343FF4141FF3F3FFF3C3CFF3939FF34
        34FF3030FF2B2BFF4C4CFCE8E8FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFD0D0F92A2AFC1919FF2020FF3131FF3F3FFF4949FF5151
        FF5656FF5252FF3333F73D3DFD5151FF4949FF3D3DFF3333FF3131FF2E2EFF2A
        2AFF2626FF5959FBEFEFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDBDBFA3838FC4B4BFF5454FF5757FF5A5AFF5C5C
        FF5E5EFF6060FF5555FF5D5DFF6262FF6161FF6161FF5A5AFF4747FF2E2EFF20
        20FF6666FAF6F6FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4F84141F74E4EFF5858FF5B5BFF5C5C
        FF5E5EFF5F5FFF6060FF6161FF6161FF6161FF6060FF5F5FFF5E5EFF4646FF73
        73F4FBFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDE5E5E58B8BAA1111E54E4EFF5C5CFF5E5E
        FF5F5FFF6060FF6161FF6161FF6161FF6161FF6161FF6060FF4040FE2626C5BD
        BDBEF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFDFDFDE5E5E59595A512129300009A0C0CDD4F4FFF6060
        FF6161FF6262FF6363FF6363FF6363FF6363FF6262FF3939FD0505BD0000953E
        3E92C3C3C3F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDFDFDE3E3E39595A412128F0000920000930101D32D2DFF6464
        FF6565FF6565FF6666FF6666FF6666FF6666FF6060FF1212FA0101AE00009100
        0090444490C3C3C3F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFDFDFDE1E1E19191A212128A00008C00008D0000D12C2CFF6969FF6A6A
        FF6A6AFF6A6AFF6B6BFF6B6BFF6B6BFF6B6BFF6B6BFF5F5FFF1010FA0000AA00
        008C00008A44448DC3C3C3F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FDFDFDE1E1E18F8FA10E0E850000870000890000D42F2FFF7171FF7171FF7171
        FF7171FF7171FF7171FF7171FF7171FF7171FF7171FF7171FF6565FF1010FA00
        00A600008600008544448AC3C3C3F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFDFDFD
        E1E1E18F8FA00E0E7F0000810000840000D33232FF7878FF7979FF7979FF7979
        FF7979FF7979FF7979FF7979FF7979FF7979FF7979FF7979FF7979FF6C6CFF11
        11FA0000A200008000007F444486C3C3C3F5F5F5FFFFFFFFFFFFFFFFFFE7E7E7
        8F8FA00E0E7D00007C00007E0000D13B3BFF8080FF8080FF8080FF8080FF8080
        FF8080FF7B7BFF3232FC5858FF8080FF8080FF8080FF8080FF8080FF8080FF72
        72FF1212FA00009E00007C00007C444485C7C7C7F9F9F9FFFFFFFDFDFDB7B7C4
        10107E00007C00007D0000D04040FF8888FF8888FF8888FF8888FF8888FF8888
        FF8282FF3C3CFCD3D3F78484F85D5DFF8888FF8888FF8888FF8888FF8888FF88
        88FF7979FF1313F900009D00007C00007C565694EDEDEDFFFFFFFBFBFB8585B1
        00007C00007D0000D04444FF9090FF9090FF9090FF9090FF9090FF9090FF8A8A
        FF4444FCD7D7FAFFFFFFFDFDFD8484F86363FF9090FF9090FF9090FF9090FF90
        90FF9090FF8080FF1414F900009D00007C1A1A83E7E7E7FFFFFFFBFBFB7A7AAD
        00007F0000D64747FF9898FF9898FF9898FF9898FF9898FF9898FF9191FF4848
        FCDDDDF9FFFFFFFFFFFFFFFFFFFDFDFD8484F86969FF9898FF9898FF9898FF98
        98FF9898FF9898FF8787FF1515F900009D0C0C7EE5E5E5FFFFFFFBFBFB7C7CB1
        0000D74B4BFFA0A0FFA0A0FFA0A0FFA0A0FFA0A0FFA0A0FF9999FF4A4AFCDDDD
        F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD8484F86E6EFFA0A0FFA0A0FFA0
        A0FFA0A0FFA0A0FFA0A0FF8E8EFF1616F90A0AA0E7E7E7FFFFFFFDFDFD8787EC
        5151FFA8A8FFA8A8FFA8A8FFA8A8FFA8A8FFA8A8FF9D9DFF4747FCDDDDF9FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD8484F87474FFA8A8FFA8
        A8FFA8A8FFA8A8FFA8A8FFA8A8FF9595FF2222F4F3F3F3FFFFFFFFFFFFE1E1FA
        4646FCA5A5FFB0B0FFB0B0FFB0B0FFB0B0FFA5A5FF4646FCDDDDF9FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD8585F87979FFB0
        B0FFB0B0FFB0B0FFB0B0FFB0B0FF6A6AFE8F8FF8FDFDFDFFFFFFFFFFFFFFFFFF
        E3E3FA4E4EFCA8A8FFB8B8FFB8B8FFADADFF4F4FFCDFDFFAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD8585F87F
        7FFFB8B8FFB8B8FFB8B8FF6868FE9595F8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE5E5FA5050FBADADFFB4B4FF5252FCE5E5FAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD85
        85F88484FFC0C0FF6565FEA3A3F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFEDEDFB4D4DFC4343FDE5E5FAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
        FDFD8888FA3232FDAFAFFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      TabOrder = 2
      OnClick = Bt_DesativarClick
    end
    object Bt_Reativar: TBitBtn
      Left = 430
      Top = 270
      Width = 51
      Height = 59
      Caption = 'Reativar'
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1
        F1F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFE0DF5CB3
        847AB796EBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDD5D8D63EB27108BF
        5B08BE5A62B386E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDC9D0CC2EAF6719C063A6EE
        C9ACEECB13BD5E50AF79DFE0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBBBC9C122AC5B1EBD638CEBB879F0
        AE96F6C5BDF2D71CBB603EAC6BD5D8D6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF9F9F9ABC0B316A7501FBB6171E8A558E89370EE
        A889F4BCA2F9D0BEF4D924B9622EA75EC9CFCCFDFDFDFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF5F5F599B8A40EA34721BA6150E38E35E0764DE68A64EC
        9E7AF1B08BF5BE96F7C7ABF2CD2BB86422A353BBC8C0FBFBFBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF1F1F187B095089E3E1EB95E2BDB7111D85829DD6C3FE37E54E8
        9066EC9F74EFAB7BF1B17AF1B08DEEB92EB764169E47ABBFB2F7F7F7FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEBEBEB76A98604993618B85A19D46000D04606D54D1ADA5F2EDF7040E3
        7F50E78C5BE99560EB9A5FEA9958E9936BE9A02FB6630E993D99B5A2F5F5F5FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E5E5E5609F7300932E10B7550DCC5000C93F00CD4300D14709D6501BDA602BDE
        6D38E17841E38045E48445E4833FE37E35E07643E2822BB66108933487AD92F1
        F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDD
        4E9862008D2906B74F04C34300C13900C63D00CA4000CE4400D24707D54E14D8
        5A1FDB6327DD6A2BDE6D2ADE6C25DD691DDA6111D8571CD96224B65C048D2B76
        A582EBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDE0DE3C8F50
        00882400B34600BA3700BA3300BF3700C33A00C73D03CB430FD14F18D5581FD8
        5F27DB662CDC6A2BDC6A24DB6516D85A06D54E00D24800D0450DD1511CB65700
        8723609A6EE5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF85B99000821F
        00AE3E00B12D00B32D00B73008BE3B26C9563FD16B4ED7784FDA7A4EDB7C27D5
        6137DA6E4FDF7F4FDF804FDF804FDF7F4ADD7B36D86B1BD15602C94105C84512
        B65000821E4E915CDDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81B98D00A734
        00A82400AC270DB4353FC6615DD17C5FD47F5FD6815FD8835CDA8222CE5820CF
        5716CE5139D76D5FDF885FDF885FDF885FDE875FDD865FDB8556D87D2BCB5A02
        C03B06B448007D1A3C8849D3D6D3FDFDFDFFFFFFFFFFFFFFFFFF8BCD9A00A01D
        01A52137BB536CCF836FD2876FD4896FD68A6FD88C6AD8891EC74F30CD5EE5F8
        EBDBF6E322CE5839D3696FDF926FDF926FDE916FDD906FDC8F6FDB8E6FD98D49
        CD6D03B83400B03E0079152C7F37C7CCC7FBFBFBFFFFFFFFFFFFF5FBF64EBA60
        19AA347AD08B7FD4917FD5937FD7947FD99574D78D18BF4544CC6AF1FBF4FFFF
        FFFFFFFFE9F9EE34CD6134CE627DDF9A7FDF9B7FDE9A7FDE9A7FDD997FDB987F
        DA965FCF7B0AB23300AA34007411207627B9C2B9FBFBFBFFFFFFFFFFFFFBFDFB
        64C2741DAC3882D3928FD99F8FDAA07AD58F12B73B5ACD77F9FDFAFFFFFFFFFF
        FFFFFFFFFFFFFFF3FBF546CE6C2DC7588AE0A28FE0A58FE0A48FDFA48FDEA38F
        DDA28FDBA178D38C15AF3600A32B00710D166D19A9B6A9F9F9F9FFFFFFFFFFFF
        FFFFFF7CCB8916A9328AD5987DD28F0CAE3072D088FDFEFDFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFBFDFC5ED07C25C04D94E0A8A0E2B0A0E2B0A0E1AFA0
        E0AEA0DFADA0DEAC90D79E1DAB37009B20006D080E660EB7C7B7FFFFFFFFFFFF
        FFFFFFFFFFFF97D5A111A62C08A6278FD69DFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFD78D48F1CB8429BDFABB0E5BCB0E4BBB0
        E4BAB0E3BAB0E2B9B0E1B8A2DBAB28A93B009317006D0781AB81FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFBBE4C2B5E3BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF93DAA316B1389EDDACC1E9C8C1
        E8C8C1E8C7C1E7C7C1E6C6C1E6C6B9E2BE3AAA47008D1081B585FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABE0B616A9319DDAA8D1
        EDD5D1EDD5D1ECD5D1ECD4D1EBD4D1EBD391CE97028B0DAFD7B1FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1E6C718A42F95
        D59EE1F3E4E1F2E3E1F2E3E1F2E38ACA8F0A8E14A9D5ABFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3ECD61F
        A13087CC8FF2F9F2F2F9F27BC2800E8F17BFE0C1FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1
        F1E32A9F3575C17C68B96E1A9220D1E8D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFEDF6ED3CA2412A982FE1F0E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      TabOrder = 3
      OnClick = Bt_ReativarClick
    end
  end
  object Panel2: TPanel
    Left = 9
    Top = 370
    Width = 615
    Height = 58
    TabOrder = 1
    object Bt_Ok: TBitBtn
      Left = 210
      Top = 15
      Width = 68
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
      Left = 333
      Top = 15
      Width = 68
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
