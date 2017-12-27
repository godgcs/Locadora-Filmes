object Frm_Filmes: TFrm_Filmes
  Left = 0
  Top = 0
  Caption = 'Filmes'
  ClientHeight = 439
  ClientWidth = 761
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 761
    Height = 439
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Todos'
      object StringGrid1: TStringGrid
        Left = 3
        Top = 3
        Width = 750
        Height = 407
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        OnSelectCell = StringGrid1SelectCell
        ColWidths = (
          65
          368
          89
          87
          99)
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'A'#231#227'o'
      ImageIndex = 1
      object StringGrid2: TStringGrid
        Left = 3
        Top = 7
        Width = 750
        Height = 406
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        OnSelectCell = StringGrid2SelectCell
        ColWidths = (
          65
          368
          89
          87
          99)
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Aventura'
      ImageIndex = 2
      object StringGrid3: TStringGrid
        Left = 3
        Top = 7
        Width = 750
        Height = 406
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        OnSelectCell = StringGrid3SelectCell
        ColWidths = (
          65
          368
          89
          87
          99)
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Anima'#231#227'o'
      ImageIndex = 3
      object StringGrid4: TStringGrid
        Left = 3
        Top = 7
        Width = 750
        Height = 406
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        OnSelectCell = StringGrid4SelectCell
        ColWidths = (
          65
          368
          89
          87
          99)
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Com'#233'dia'
      ImageIndex = 4
      object StringGrid5: TStringGrid
        Left = 3
        Top = 7
        Width = 750
        Height = 406
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        OnSelectCell = StringGrid5SelectCell
        ColWidths = (
          65
          368
          89
          87
          99)
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Cl'#225'ssico'
      ImageIndex = 5
      object StringGrid6: TStringGrid
        Left = 3
        Top = 7
        Width = 750
        Height = 406
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        OnSelectCell = StringGrid6SelectCell
        ColWidths = (
          65
          368
          89
          87
          99)
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Document'#225'rio'
      ImageIndex = 6
      object StringGrid7: TStringGrid
        Left = 3
        Top = 7
        Width = 750
        Height = 406
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        OnSelectCell = StringGrid7SelectCell
        ColWidths = (
          65
          368
          89
          87
          99)
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Drama'
      ImageIndex = 7
      object StringGrid8: TStringGrid
        Left = 3
        Top = 7
        Width = 750
        Height = 406
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        OnSelectCell = StringGrid8SelectCell
        ColWidths = (
          65
          368
          89
          87
          99)
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Fic'#231#227'o Cient'#237'fica'
      ImageIndex = 8
      object StringGrid9: TStringGrid
        Left = 3
        Top = 7
        Width = 750
        Height = 406
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        OnSelectCell = StringGrid9SelectCell
        ColWidths = (
          65
          368
          89
          87
          99)
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'Musical'
      ImageIndex = 9
      object StringGrid10: TStringGrid
        Left = 3
        Top = 7
        Width = 750
        Height = 406
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        OnSelectCell = StringGrid10SelectCell
        ColWidths = (
          65
          368
          89
          87
          99)
      end
    end
    object TabSheet11: TTabSheet
      Caption = 'Romance'
      ImageIndex = 10
      object StringGrid11: TStringGrid
        Left = 3
        Top = 7
        Width = 750
        Height = 406
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        OnSelectCell = StringGrid11SelectCell
        ColWidths = (
          65
          368
          89
          87
          99)
      end
    end
    object TabSheet12: TTabSheet
      Caption = 'Terror'
      ImageIndex = 11
      object StringGrid12: TStringGrid
        Left = 3
        Top = 7
        Width = 750
        Height = 406
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        OnSelectCell = StringGrid12SelectCell
        ColWidths = (
          65
          368
          89
          87
          99)
      end
    end
    object TabSheet13: TTabSheet
      Caption = 'Suspense'
      ImageIndex = 12
      object StringGrid13: TStringGrid
        Left = 3
        Top = 7
        Width = 750
        Height = 406
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        OnSelectCell = StringGrid13SelectCell
        ColWidths = (
          65
          368
          89
          87
          99)
      end
    end
  end
end
