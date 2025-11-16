object Form1: TForm1
  Left = 563
  Top = 506
  BorderStyle = bsDialog
  Caption = '3D Analysis'
  ClientHeight = 150
  ClientWidth = 317
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 32
    Width = 153
    Height = 113
    Caption = '3D Image'
    TabOrder = 0
    object Image1: TImage
      Left = 8
      Top = 8
      Width = 137
      Height = 97
      Stretch = True
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 317
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 1
    object BitBtn2: TBitBtn
      Left = 0
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Open3D'
      TabOrder = 0
      OnClick = BitBtn2Click
    end
    object Splitter1: TSplitter
      Left = 75
      Top = 2
      Width = 46
      Height = 22
      Cursor = crHSplit
    end
    object BitBtn3: TBitBtn
      Left = 121
      Top = 2
      Width = 72
      Height = 22
      Caption = 'Analyze'
      TabOrder = 1
      OnClick = BitBtn3Click
    end
    object Splitter2: TSplitter
      Left = 193
      Top = 2
      Width = 45
      Height = 22
      Cursor = crHSplit
    end
    object BitBtn4: TBitBtn
      Left = 238
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Saveresult'
      TabOrder = 2
      OnClick = BitBtn4Click
    end
  end
  object Panel2: TPanel
    Left = 160
    Top = 32
    Width = 153
    Height = 113
    Caption = 'Result'
    TabOrder = 2
    object Image2: TImage
      Left = 8
      Top = 8
      Width = 137
      Height = 97
      Stretch = True
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 16
    Top = 48
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 264
    Top = 32
  end
end
