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

int W[3],H[3];
unsigned char *R[3],*G[3],*B[3];
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
   Image[0]=new Graphics::TBitmap();
   Image[1]=new Graphics::TBitmap();
   Image[2]=new Graphics::TBitmap();   
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  if(OpenPictureDialog1->Execute()){
     if(ExtractFileExt(OpenPictureDialog1->FileName)==".jpg"){
        TJPEGImage  *JpegImage1=new  TJPEGImage();
        JpegImage1->LoadFromFile(OpenPictureDialog1->FileName);
        Image[0]->Width   =   JpegImage1->Width   ;
        //使位图与JPEG图像尺寸相等
        Image[0]->Height = JpegImage1->Height   ;
        Image[0]->Canvas->StretchDraw(Rect(0,0,Image[0]->Width,Image[0]->Height),JpegImage1);
        Image1->Picture->Graphic=Image[0];
        delete   JpegImage1;
     }
     else{
        Image1->Picture->LoadFromFile(OpenPictureDialog1->FileName);
        Image[0]->Assign(Image1->Picture->Bitmap);
     }
  }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
  if(OpenPictureDialog1->Execute()){
     if(ExtractFileExt(OpenPictureDialog1->FileName)==".jpg"){  
        TJPEGImage  *JpegImage1=new  TJPEGImage();
        JpegImage1->LoadFromFile(OpenPictureDialog1->FileName);  
        Image[1]->Width   =   JpegImage1->Width   ;  
        //使位图与JPEG图像尺寸相等
        Image[1]->Height = JpegImage1->Height   ;  
        Image[1]->Canvas->StretchDraw(Rect(0,0,Image[1]->Width,Image[1]->Height),JpegImage1);
        Image2->Picture->Graphic=Image[1];  
        delete   JpegImage1;
     }  
     else{
        Image2->Picture->LoadFromFile(OpenPictureDialog1->FileName);
        Image[1]->Assign(Image2->Picture->Bitmap);
     }
  }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn3Click(TObject *Sender)
{      
  W[0]=Image1->Picture->Width;
  H[0]=Image1->Picture->Height;
  W[1]=Image2->Picture->Width;
  H[1]=Image2->Picture->Height;
  W[2]=W[0]*8;
  H[2]=H[0];

  Image[2]->Width=W[2];
  Image[2]->Height=H[2];

  Prep();
  Generate1=new Generate(false);
/*
  unsigned char *r[3],*g[3],*b[3];
  int s=20;
  int I;
  //randomize();
  for(int line=0 ; line<H[2] ; line++){
    //make r[i], g[i] and b[i] point to the correct position in the image arrays
    for(int l=0;l<3;l++){
      r[l]=R[l]+line*H[l]/H[2]*W[l];
      g[l]=G[l]+line*H[l]/H[2]*W[l];
      b[l]=B[l]+line*H[l]/H[2]*W[l];
    }
    //make the result image appear to be similar every where and difficult to
    //guess the shape hidden under it.
    //int rand=random(W3);
    int rand=sin(2*3.14*line/H[2])*W[2]/3+W[2]/2;
    for(int x=rand; x<W[2]-(W[0]+1)/2; x++ ){
      I=(r[1][(x-W[0]/2)*W[1]/(W[2]-W[0])]+
         g[1][(x-W[0]/2)*W[1]/(W[2]-W[0])]+
         b[1][(x-W[0]/2)*W[1]/(W[2]-W[0])])/3/s;
      if(x+(W[0]+1)/2+I/2<W[2]){
        r[2][x+(W[0]+1)/2+I/2]=r[2][x-W[0]/2+I/2];
        g[2][x+(W[0]+1)/2+I/2]=g[2][x-W[0]/2+I/2];
        b[2][x+(W[0]+1)/2+I/2]=b[2][x-W[0]/2+I/2];
      }
      if(I){
        r[2][x+(W[0]+1)/2-(I+1)/2]=r[2][x-W[0]/2+I/2];
        g[2][x+(W[0]+1)/2-(I+1)/2]=g[2][x-W[0]/2+I/2];
        b[2][x+(W[0]+1)/2-(I+1)/2]=b[2][x-W[0]/2+I/2];
      }
    }
    for(int y=rand; y>=W[0]/2; y--){
      I=(r[1][(y-W[0]/2)*W[1]/(W[2]-W[0])]+
         g[1][(y-W[0]/2)*W[1]/(W[2]-W[0])]+
         b[1][(y-W[0]/2)*W[1]/(W[2]-W[0])])/3/s;
      if(y-W[0]/2-(I+1)/2>=0){
        r[2][y-W[0]/2-(I+1)/2]=r[2][y+(W[0]+1)/2-(I+1)/2];
        g[2][y-W[0]/2-(I+1)/2]=g[2][y+(W[0]+1)/2-(I+1)/2];
        b[2][y-W[0]/2-(I+1)/2]=b[2][y+(W[0]+1)/2-(I+1)/2];
      }
      if(I){
        r[2][y-W[0]/2+I/2]=r[2][y+(W[0]+1)/2-(I+1)/2];
        g[2][y-W[0]/2+I/2]=g[2][y+(W[0]+1)/2-(I+1)/2];
        b[2][y-W[0]/2+I/2]=b[2][y+(W[0]+1)/2-(I+1)/2];
      }
    }
  }
  Disp();
//*/
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn4Click(TObject *Sender)
{
  if(SavePictureDialog1->Execute()){
     if(ExtractFileExt(SavePictureDialog1->FileName)==".jpg"){
        TJPEGImage  *JpegImage1=new  TJPEGImage();
        try{
          JpegImage1->Assign(Image[2]);//3->Picture->Bitmap);
          JpegImage1->SaveToFile(SavePictureDialog1->FileName);
        }
        __finally{
          delete   JpegImage1;
        }
     }
     else{
      Image[2]->SaveToFile(SavePictureDialog1->FileName);
     }
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Prep()
{
  for(int i=0;i<3;i++){
    R[i]=new unsigned char [W[i]*H[i]];
    G[i]=new unsigned char [W[i]*H[i]];
    B[i]=new unsigned char [W[i]*H[i]];
  }

  TColor Color1;
  for(int l=0;l<2;l++){
    for(int i=0;i<H[l];i++){
      for(int j=0;j<W[l];j++){
        Color1=Image[l]->Canvas->Pixels[j][i];
        RGB_Color1=(RGB*)&Color1;
        R[l][i*W[l]+j]=RGB_Color1->r;
        G[l][i*W[l]+j]=RGB_Color1->g;
        B[l][i*W[l]+j]=RGB_Color1->b;
      }
    }
  }
  //initialize background pixels
  int L=W[0];
  for(int i=0 ; i<H[2] ; i++){
    for(int j=0 ; j<W[2] ; j++){
      R[2][i*W[2]+j]=R[0][i*W[0]+j%L];
      G[2][i*W[2]+j]=G[0][i*W[0]+j%L];
      B[2][i*W[2]+j]=B[0][i*W[0]+j%L];
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Disp()
{
  long c;
  int l=2;
    for(int i=0;i<H[l];i++){
      for(int j=0;j<W[l];j++){
         c=0;
         c+=B[l][i*W[l]+j];
         c*=256;
         c+=G[l][i*W[l]+j];
         c*=256;
         c+=R[l][i*W[l]+j];
         Image[2]->Canvas->Pixels[j][i]=TColor(c);
      }
    }

  for(int i=0;i<3;i++){
    delete R[i],G[i],B[i];
  }
  Image3->Picture->Bitmap->Assign(Image[2]);
}
//---------------------------------------------------------------------------

