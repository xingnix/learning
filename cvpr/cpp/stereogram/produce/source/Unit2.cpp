//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit2.h"
#include "Unit1.h"
#include "header.h"

Generate *Generate1;
#pragma package(smart_init)

//---------------------------------------------------------------------------

//   Important: Methods and properties of objects in VCL can only be
//   used in a method called using Synchronize, for example:
//
//      Synchronize(UpdateCaption);
//
//   where UpdateCaption could look like:
//
//      void __fastcall Unit2::UpdateCaption()
//      {
//        Form1->Caption = "Updated in a thread";
//      }
//---------------------------------------------------------------------------

__fastcall Generate::Generate(bool CreateSuspended)
        : TThread(CreateSuspended)
{
}
//---------------------------------------------------------------------------
void __fastcall Generate::Execute()
{
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
    //int rand=random(W[2]);
    int rand=sin(2*3.14*line/H[2])*W[2]/3+W[2]/2;
    for(int x=rand; x<W[2]-(W[0]+1)/2; x++ ){
      I=(r[1][(x-W[0]/2)*W[1]/(W[2]-W[0])]+
         g[1][(x-W[0]/2)*W[1]/(W[2]-W[0])]+
         b[1][(x-W[0]/2)*W[1]/(W[2]-W[0])])/3/s;
      if(!I&&x+(W[0]+1)/2+I/2<W[2]){
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
      if(!I&&y-W[0]/2-(I+1)/2>=0){
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
  Synchronize(Form1->Disp);
}
//---------------------------------------------------------------------------
