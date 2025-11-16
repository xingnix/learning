//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <ExtDlgs.hpp>
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TOpenPictureDialog *OpenPictureDialog1;
        TSavePictureDialog *SavePictureDialog1;
        TPanel *Panel1;
        TPanel *Panel2;
        TImage *Image1;
        TImage *Image2;
        TBitBtn *BitBtn1;
        TBitBtn *BitBtn2;
        TBitBtn *BitBtn3;
        TPanel *Panel3;
        TImage *Image3;
        TBitBtn *BitBtn4;
        void __fastcall BitBtn1Click(TObject *Sender);
        void __fastcall BitBtn3Click(TObject *Sender);
        void __fastcall BitBtn2Click(TObject *Sender);
        void __fastcall BitBtn4Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        Graphics::TBitmap *Image[3];
        __fastcall TForm1(TComponent* Owner);
        void __fastcall Prep();
        void __fastcall Disp();
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
