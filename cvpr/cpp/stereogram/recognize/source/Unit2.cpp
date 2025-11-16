//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "Unit2.h"
#include "header.h"
Analysis * Analysis1;
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

long getmax(int *count, int num, char flag){
  long maxvalue=0,maxindex;
  for(int i=0;i<num ;i++){
    if(count[i]>maxvalue){
      maxvalue=count[i];
	maxindex=i;
  }
  }
  switch(flag){
  case 'v':
      return maxvalue;
  case 'i':
      return maxindex;
  }
}
//---------------------------------------------------------------------------
int range_error(unsigned char ** Image,int i,int j, int k, int r){
  int error=0;
  for(int m=-r;m<=r;m++){
    for(int n=-r;n<=r;n++){
            error+=abs(Image[i+m][j+n]-Image[i+m][j+n+k]);
    }
  }
  return error;
}
//---------------------------------------------------------------------------
__fastcall Analysis::Analysis(bool CreateSuspended)
        : TThread(CreateSuspended)
{
}
//---------------------------------------------------------------------------
void __fastcall Analysis::Execute()
{
//  int h=W[0]/4,l=W[0]/9,num=h-l;
  int h=100,l=50,num=h-l;
  int *count=new int[num];
  //set initial value for counting
  for(int i=0;i<num;i++){
     count[i]=0;
  }
  W[1]=W[0]-h;
  H[1]=H[0];
  R[1]=new unsigned char [W[1]*H[1]];
  G[1]=new unsigned char [W[1]*H[1]];
  B[1]=new unsigned char [W[1]*H[1]];
  ShapeR=new unsigned char *[H[1]];
  ShapeG=new unsigned char *[H[1]];
  ShapeB=new unsigned char *[H[1]];
  for(int line=0; line < H[1] ; line++ ){
  ShapeR[line]=R[1]+line*W[1];
  ShapeG[line]=G[1]+line*W[1];
  ShapeB[line]=B[1]+line*W[1];
  }
  int r=1;  // template size is 2*r+1
  int dimh=H[1]-r, dimw=W[1]-r;
  int min,minerror,error,min_min=h;
  for(int j=r; j<dimw; j++){
    for(int i=r; i<dimh; i++){
      minerror=255*(r+1)*(r+1)*4;
      for(int m=h; m>l; m--){
      	error=range_error(ImageR,i,j,m,r)+range_error(ImageG,i,j,m,r)+range_error(ImageB,i,j,m,r);
      	if(error<minerror){
      		minerror=error;
      		min=m;
      	}
      }
      min_min=min_min<min?min_min:min;
      ShapeR[i][j]=min;
      count[h-min]++;
    }
  }
  h=h-getmax(count,num,'i');
  double temp;
  for(int i=r; i< dimh; i++){
    for(int j=r; j< dimw; j++){
       if(ShapeR[i][j]>=h){
          ShapeR[i][j]=0;
          ShapeG[i][j]=0;
          ShapeB[i][j]=0;
       }
       else{
          temp=sqrt(((double)h-ShapeR[i][j])/(h-min_min));
          ShapeR[i][j]=255*temp;
          ShapeG[i][j]=255*temp;
          ShapeB[i][j]=255*temp;
       }
    }
  }
  Synchronize(Form1->Disp);
  delete R[1],G[1],B[1],ShapeR,ShapeG,ShapeB;
}
//---------------------------------------------------------------------------
