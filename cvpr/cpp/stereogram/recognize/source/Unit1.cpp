//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "Unit2.h"
#include "header.h"
#include "jpeg.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
int W[2],H[2];
unsigned char *R[2],*G[2],*B[2],**ImageR,**ImageG,**ImageB,**ShapeR,**ShapeG,**ShapeB;
int MethodFlag=0;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
  ImageIn=new Graphics::TBitmap();
  ImageOut=new Graphics::TBitmap();
}
//---------------------------------------------------------------------------



void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
  if(OpenPictureDialog1->Execute()){
     if(ExtractFileExt(OpenPictureDialog1->FileName)==".jpg"){
        TJPEGImage  *JpegImage1=new  TJPEGImage();
        JpegImage1->LoadFromFile(OpenPictureDialog1->FileName);
        ImageIn->Width   =   JpegImage1->Width   ;   //使位图与JPEG图像尺寸相等
        ImageIn->Height = JpegImage1->Height   ;
        ImageIn->Canvas->StretchDraw(Rect(0,0,ImageIn->Width,ImageIn->Height),JpegImage1);
        Image1->Picture->Graphic=ImageIn;
        delete   JpegImage1;
     }
     else{
        Image1->Picture->LoadFromFile(OpenPictureDialog1->FileName);
     }
  }
  ImageIn->Assign(Image1->Picture->Bitmap);
  W[0]=Image1->Picture->Width;
  H[0]=Image1->Picture->Height;
  }
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn4Click(TObject *Sender)
{
  if(SavePictureDialog1->Execute()){
     if(ExtractFileExt(SavePictureDialog1->FileName)==".jpg"){
        TJPEGImage  *JpegImage1=new  TJPEGImage();
        try{
          JpegImage1->Assign(ImageOut);
          JpegImage1->SaveToFile(SavePictureDialog1->FileName);
        }
        __finally{
          delete   JpegImage1;
        }
     }
     else{
       ImageOut->SaveToFile(SavePictureDialog1->FileName);
     }
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn3Click(TObject *Sender)
{
  BitBtn3->Enabled=false;
  Prep();
  MethodFlag=++MethodFlag%4;
  Analysis1=new Analysis(false);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Prep(){
  R[0]=new unsigned char [W[0]*H[0]];
  G[0]=new unsigned char [W[0]*H[0]];
  B[0]=new unsigned char [W[0]*H[0]];
  ImageR=new unsigned char * [H[0]];
  ImageG=new unsigned char * [H[0]];
  ImageB=new unsigned char * [H[0]];
  TColor Color1;
  int l=0;
  for(int i=0;i<H[l];i++){
    for(int j=0;j<W[l];j++){
      Color1=ImageIn->Canvas->Pixels[j][i];
      RGB_Color1=(RGB*)&Color1;
      R[l][i*W[l]+j]=RGB_Color1->r;
      G[l][i*W[l]+j]=RGB_Color1->g;
      B[l][i*W[l]+j]=RGB_Color1->b;
    }
    ImageR[i]=R[l]+i*W[l];
    ImageG[i]=G[l]+i*W[l];
    ImageB[i]=B[l]+i*W[l];
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Disp(){
   long c;
   int l=1;
   ImageOut->Height=H[l];
   ImageOut->Width=W[l];
   for(int i=0;i<H[l];i++){
     for(int j=0;j<W[l];j++){
       c=0;
       c+=B[l][i*W[l]+j];
       c*=256;
       c+=G[l][i*W[l]+j];
       c*=256;
       c+=R[l][i*W[l]+j];
       ImageOut->Canvas->Pixels[j][i]=TColor(c);
     }
  }
  Image2->Picture->Bitmap->Assign(ImageOut);
  delete R[0],G[0],B[0],ImageR,ImageG,ImageB;
  BitBtn3->Enabled=true;
}
//---------------------------------------------------------------------------
