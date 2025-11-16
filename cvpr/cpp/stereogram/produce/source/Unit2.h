//---------------------------------------------------------------------------

#ifndef Unit2H
#define Unit2H
//---------------------------------------------------------------------------
#include <Classes.hpp>
//---------------------------------------------------------------------------

class Generate : public TThread
{
private:
protected:
        void __fastcall Execute();
public:
        __fastcall Generate(bool CreateSuspended);
};
extern Generate *Generate1;
//---------------------------------------------------------------------------
#endif
 