object Form1: TForm1
  Left = 42
  Top = 470
  Width = 1214
  Height = 679
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 8
    Top = 16
    Width = 401
    Height = 185
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Legend.Visible = False
    Title.Text.Strings = (
      'Input Signal')
    BottomAxis.Title.Caption = 'Time (s)'
    LeftAxis.Title.Caption = 'Amplitude'
    View3D = False
    TabOrder = 0
    PrintMargins = (
      15
      27
      15
      27)
    object Series1: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series9: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      SeriesColor = 16744448
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series12: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Chart2: TChart
    Left = 424
    Top = 216
    Width = 393
    Height = 265
    Title.Text.Strings = (
      '3D View of CWT')
    DepthAxis.Visible = True
    TabOrder = 1
    object Series2: TIsoSurfaceSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Pen.Visible = False
      SideBrush.Color = clWhite
      SideBrush.Style = bsClear
      TimesZOrder = 20
      XValues.Name = 'X'
      XValues.Order = loNone
      YValues.Name = 'Y'
      YValues.Order = loNone
      ZValues.Name = 'Z'
      ZValues.Order = loNone
      BandPen.Visible = False
      Sides.Brush.Color = clWhite
      Sides.Brush.Style = bsClear
    end
    object ChartTool1: TRotateTool
      Pen.Color = clWhite
      Pen.Mode = pmXor
    end
  end
  object ListBox1: TListBox
    Left = 872
    Top = 8
    Width = 233
    Height = 193
    ItemHeight = 13
    TabOrder = 2
  end
  object ListBox2: TListBox
    Left = 1120
    Top = 8
    Width = 233
    Height = 193
    ItemHeight = 13
    TabOrder = 3
  end
  object Chart3: TChart
    Left = 24
    Top = 216
    Width = 393
    Height = 265
    Legend.Alignment = laLeft
    Legend.Font.Height = -9
    Legend.Symbol.Continuous = True
    Title.Text.Strings = (
      'CWT Contour')
    BottomAxis.Title.Caption = 'Skala Waktu'
    DepthAxis.Title.Angle = 180
    DepthAxis.Title.Caption = 'hhh'
    DepthAxis.Visible = True
    LeftAxis.Visible = False
    RightAxis.Title.Angle = 180
    View3D = False
    View3DOptions.HorizOffset = -14
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 101
    View3DOptions.VertOffset = 14
    View3DOptions.Zoom = 102
    TabOrder = 4
    PrintMargins = (
      15
      16
      15
      16)
    object Series3: TIsoSurfaceSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Brush.Color = clWhite
      IrregularGrid = True
      Pen.Color = clWhite
      Pen.Visible = False
      SideBrush.Color = clWhite
      SideBrush.Style = bsClear
      TimesZOrder = 1
      XValues.Name = 'X'
      XValues.Order = loNone
      YValues.Name = 'Y'
      YValues.Order = loNone
      ZValues.Name = 'Z'
      ZValues.Order = loNone
      BandPen.Visible = False
      Sides.Brush.Color = clWhite
      Sides.Brush.Style = bsClear
    end
  end
  object GroupBox1: TGroupBox
    Left = 416
    Top = 8
    Width = 441
    Height = 193
    TabOrder = 5
    object Label1: TLabel
      Left = 13
      Top = 16
      Width = 68
      Height = 13
      Caption = 'Total Sample: '
    end
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 49
      Height = 13
      Caption = 'Scale (S) :'
    end
    object Label4: TLabel
      Left = 16
      Top = 104
      Width = 81
      Height = 13
      Caption = 'delta Scale (dS) :'
    end
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 32
      Height = 13
      Caption = 'Label2'
    end
    object Label5: TLabel
      Left = 16
      Top = 144
      Width = 67
      Height = 13
      Caption = 'Frek Sampling'
    end
    object lbl1: TLabel
      Left = 224
      Top = 16
      Width = 75
      Height = 13
      Caption = 'CWT Threshold'
    end
    object Threshold: TLabel
      Left = 224
      Top = 40
      Width = 47
      Height = 13
      Caption = 'Threshold'
    end
    object lbl2: TLabel
      Left = 232
      Top = 64
      Width = 29
      Height = 13
      Caption = 'Frame'
    end
    object Edit1: TEdit
      Left = 16
      Top = 72
      Width = 81
      Height = 21
      TabOrder = 0
      Text = '0,0001'
    end
    object Edit2: TEdit
      Left = 16
      Top = 120
      Width = 81
      Height = 21
      TabOrder = 1
      Text = '0,0009'
    end
    object Button1: TButton
      Left = 126
      Top = 16
      Width = 83
      Height = 25
      Caption = 'Input Data'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 126
      Top = 48
      Width = 83
      Height = 25
      Caption = 'CWT'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 126
      Top = 80
      Width = 83
      Height = 25
      Caption = 'Plot Contour'
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 126
      Top = 112
      Width = 83
      Height = 25
      Caption = 'DFT'
      TabOrder = 5
      OnClick = Button4Click
    end
    object Edit3: TEdit
      Left = 16
      Top = 160
      Width = 81
      Height = 21
      TabOrder = 6
      Text = '1000'
    end
    object Button5: TButton
      Left = 126
      Top = 160
      Width = 83
      Height = 25
      Caption = 'RESET'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 224
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Normalization'
      TabOrder = 8
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 224
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Shannon'
      TabOrder = 9
    end
    object Button8: TButton
      Left = 336
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Thresholding'
      TabOrder = 10
    end
    object Edit4: TEdit
      Left = 312
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 11
      Text = 'Edit4'
    end
    object Edit5: TEdit
      Left = 312
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 12
      Text = '0,01'
    end
    object Edit6: TEdit
      Left = 312
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 13
      Text = '20'
    end
    object Button9: TButton
      Left = 336
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Filter'
      TabOrder = 14
    end
  end
  object Chart4: TChart
    Left = 816
    Top = 216
    Width = 393
    Height = 265
    Legend.Visible = False
    Title.Text.Strings = (
      'DFT')
    BottomAxis.Title.Caption = 'Frekuensi'
    LeftAxis.Title.Caption = 'Magnitudo'
    View3D = False
    TabOrder = 6
    object Series4: TBarSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Callout.Length = 8
      Marks.Frame.Visible = False
      Marks.Visible = False
      Gradient.Direction = gdTopBottom
      Shadow.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
  end
  object Chart5: TChart
    Left = 8
    Top = 496
    Width = 400
    Height = 250
    Title.Text.Strings = (
      'CWT Thresholding')
    TabOrder = 7
    object Series5: TIsoSurfaceSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Brush.Color = clWhite
      DotFrame = True
      Pen.Visible = False
      SideBrush.Color = clWhite
      SideBrush.Style = bsClear
      SideLines.Color = -1
      XValues.Name = 'X'
      XValues.Order = loNone
      YValues.Name = 'Y'
      YValues.Order = loNone
      ZValues.Name = 'Z'
      ZValues.Order = loNone
      BandPen.Visible = False
      Sides.Brush.Color = clWhite
      Sides.Brush.Style = bsClear
    end
  end
  object Chart7: TChart
    Left = 904
    Top = 496
    Width = 440
    Height = 250
    Title.Text.Strings = (
      'Shannon Envelope')
    View3D = False
    TabOrder = 8
    object Series7: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series8: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series10: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object ListBox3: TListBox
    Left = 1224
    Top = 336
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 9
  end
  object Chart6: TChart
    Left = 424
    Top = 496
    Width = 457
    Height = 241
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Legend.Visible = False
    Title.Text.Strings = (
      'Shannon Energy')
    BottomAxis.Title.Caption = 'Time (s)'
    LeftAxis.Title.Caption = 'Amplitude'
    View3D = False
    TabOrder = 10
    PrintMargins = (
      15
      27
      15
      27)
    object Series6: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series11: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 1280
    Top = 280
  end
end
