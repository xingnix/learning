//---------------------------------------------------------------------------
#ifndef Unit2H
#define Unit2H
//---------------------------------------------------------------------------
#include <Classes.hpp>
//---------------------------------------------------------------------------
class Analysis : public TThread
{
private:
protected:
        void __fastcall Execute();
public:
        __fastcall Analysis(bool CreateSuspended);
};
//---------------------------------------------------------------------------
#endif
extern Analysis *Analysis1;
 