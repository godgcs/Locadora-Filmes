object Frm_PagamentoMulta: TFrm_PagamentoMulta
  Left = 0
  Top = 0
  Caption = 'Pagamento Multa'
  ClientHeight = 457
  ClientWidth = 593
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
    Width = 577
    Height = 441
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 14
      Top = 9
      Width = 553
      Height = 112
      Caption = 'Dados da Loca'#231#227'o'
      TabOrder = 0
      object Label17: TLabel
        Left = 378
        Top = 32
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
        Left = 212
        Top = 33
        Width = 83
        Height = 13
        Caption = 'Codigo Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 45
        Top = 32
        Width = 90
        Height = 13
        Caption = 'Codigo Loca'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 44
        Top = 72
        Width = 42
        Height = 13
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object C_CPF: TMaskEdit
        Left = 407
        Top = 29
        Width = 93
        Height = 21
        Enabled = False
        EditMask = '999.999.999-99'
        MaxLength = 14
        TabOrder = 0
        Text = '   .   .   -  '
      end
      object C_CodigoCliente: TEdit
        Left = 301
        Top = 29
        Width = 46
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 1
      end
      object C_CodigoLocacao: TEdit
        Left = 141
        Top = 29
        Width = 46
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 2
      end
      object C_Cliente: TEdit
        Left = 92
        Top = 68
        Width = 408
        Height = 21
        Enabled = False
        TabOrder = 3
      end
    end
    object PageControl1: TPageControl
      Left = 14
      Top = 143
      Width = 555
      Height = 243
      ActivePage = TabSheet1
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = #192' Vista'
        object Label1: TLabel
          Left = 35
          Top = 26
          Width = 79
          Height = 16
          Caption = 'Valor Multa:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 35
          Top = 62
          Width = 58
          Height = 16
          Caption = 'Dinheiro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 35
          Top = 107
          Width = 41
          Height = 16
          Caption = 'Troco:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object C_TotalAVista: TEdit
          Left = 377
          Top = 18
          Width = 142
          Height = 33
          TabStop = False
          Alignment = taRightJustify
          CharCase = ecUpperCase
          Color = clGradientInactiveCaption
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Text = '0,00'
        end
        object Bt_FinalizarAVista: TBitBtn
          Left = 367
          Top = 163
          Width = 152
          Height = 30
          Caption = 'Finalizar Pagamento'
          Default = True
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
          TabOrder = 1
          OnClick = Bt_FinalizarAVistaClick
        end
        object C_DinheiroAVista: TEdit
          Left = 377
          Top = 57
          Width = 142
          Height = 27
          Alignment = taRightJustify
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Text = '0,00'
          OnExit = C_DinheiroAVistaExit
          OnKeyPress = C_DinheiroAVistaKeyPress
          OnKeyUp = C_DinheiroAVistaKeyUp
        end
        object C_TrocoAVista: TEdit
          Left = 320
          Top = 90
          Width = 199
          Height = 50
          Alignment = taRightJustify
          CharCase = ecUpperCase
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -35
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          Text = '0,00'
        end
      end
    end
    object BitBtn1: TBitBtn
      Left = 432
      Top = 400
      Width = 105
      Height = 30
      Caption = 'Cancelar'
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
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = JvMemoryData1
    Left = 240
    Top = 104
  end
  object JvMemoryData1: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'CodigoLocacao'
        DataType = ftInteger
      end
      item
        Name = 'CodigoCliente'
        DataType = ftInteger
      end
      item
        Name = 'CPFCliente'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Total'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NomeEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CNPJEmpresa'
        DataType = ftString
        Size = 30
      end>
    Left = 312
    Top = 104
    object JvMemoryData1CodigoLocacao: TIntegerField
      FieldName = 'CodigoLocacao'
    end
    object JvMemoryData1CodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object JvMemoryData1CPFCliente: TStringField
      FieldName = 'CPFCliente'
    end
    object JvMemoryData1Cliente: TStringField
      FieldName = 'Cliente'
      Size = 100
    end
    object JvMemoryData1Total: TStringField
      FieldName = 'Total'
    end
    object JvMemoryData1NomeEmpresa: TStringField
      FieldName = 'NomeEmpresa'
      Size = 100
    end
    object JvMemoryData1CNPJEmpresa: TStringField
      FieldName = 'CNPJEmpresa'
      Size = 30
    end
  end
  object frxReport1: TfrxReport
    Version = '4.12.13'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42324.448173680600000000
    ReportOptions.LastChange = 42324.814986122700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 384
    Top = 104
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 105.826840000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Top = 3.779530000000001000
          Width = 638.740569999999900000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Sistema Empresarial - Locadora')
        end
        object Memo2: TfrxMemoView
          Align = baCenter
          Left = -0.000000000000024203
          Top = 41.574830000000000000
          Width = 718.110700000000000000
          Height = 64.252010000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nota Fiscal Loca'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Date: TfrxMemoView
          Align = baRight
          Left = 638.740569999999900000
          Top = 3.779530000000001000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Time: TfrxMemoView
          Align = baRight
          Left = 638.740569999999900000
          Top = 22.677180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            '[Time]')
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 71.811070000000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Locadora: ')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 521.575140000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'CNPJ:')
          ParentFont = False
        end
        object frxDBDataset1NomeEmpresa: TfrxMemoView
          Align = baWidth
          Left = 98.267780000000000000
          Width = 423.307360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NomeEmpresa'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."NomeEmpresa"]')
          ParentFont = False
        end
        object frxDBDataset1CNPJEmpresa: TfrxMemoView
          Left = 574.488560000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CNPJEmpresa'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."CNPJEmpresa"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Top = 18.897650000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Codigo Loca'#231#227'o:')
          ParentFont = False
        end
        object frxDBDataset1CodigoLocacao: TfrxMemoView
          Left = 136.063080000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CodigoLocacao'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."CodigoLocacao"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 222.992270000000000000
          Top = 18.897650000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Codigo Cliente:')
          ParentFont = False
        end
        object frxDBDataset1CodigoCliente: TfrxMemoView
          Left = 351.496290000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CodigoCliente'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."CodigoCliente"]')
          ParentFont = False
        end
        object frxDBDataset1CPFCliente: TfrxMemoView
          Left = 540.472790000000000000
          Top = 18.897650000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CPFCliente'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."CPFCliente"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 430.866420000000000000
          Top = 18.897650000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'CPF Cliente:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Top = 37.795300000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Nome Cliente:')
          ParentFont = False
        end
        object frxDBDataset1Cliente: TfrxMemoView
          Left = 117.165430000000000000
          Top = 37.795300000000000000
          Width = 600.945270000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Cliente'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."Cliente"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo6: TfrxMemoView
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Valor multa pago:')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1Total: TfrxMemoView
          Left = 143.622140000000000000
          Width = 574.488560000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'Total'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haBlock
          Memo.UTF8W = (
            '[frxDBDataset1."Total"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = DataSource1
    BCDToCurrency = False
    Left = 448
    Top = 104
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 520
    Top = 104
  end
end
