#include "math.h"
static struct RGB{
unsigned char r;
unsigned char g;
unsigned char b;
unsigned char u;
}*RGB_Color1,*RGB_Color2;

extern int W[2],H[2];
extern unsigned char *R[2],*G[2],*B[2],**ImageR,**ImageG,**ImageB,**ShapeR,**ShapeG,**ShapeB;
extern int MethodFlag;
 