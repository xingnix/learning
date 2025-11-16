object Form1: TForm1
  Left = 136
  Top = 118
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = '3D Image'
  ClientHeight = 430
  ClientWidth = 433
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
    Left = 8
    Top = 8
    Width = 113
    Height = 169
    TabOrder = 0
    object Image1: TImage
      Left = 8
      Top = 8
      Width = 97
      Height = 153
      Stretch = True
    end
  end
  object Panel2: TPanel
    Left = 128
    Top = 8
    Width = 297
    Height = 169
    TabOrder = 1
    object Image2: TImage
      Left = 8
      Top = 8
      Width = 281
      Height = 153
      Stretch = True
    end
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Background'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Shapeimage'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 216
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Generate'
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object Panel3: TPanel
    Left = 8
    Top = 184
    Width = 417
    Height = 209
    TabOrder = 5
    object Image3: TImage
      Left = 8
      Top = 8
      Width = 401
      Height = 193
      Stretch = True
    end
  end
  object BitBtn4: TBitBtn
    Left = 320
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Saveresult'
    TabOrder = 6
    OnClick = BitBtn4Click
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 8
    Top = 397
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 296
    Top = 397
  end
end
