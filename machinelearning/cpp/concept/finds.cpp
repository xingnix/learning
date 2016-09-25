/**************************************************
filename       :finds.cpp
author         :maksyuki
created time   :2016年09月21日 星期三 08时16分16秒
last modified  :2016年09月21日 星期三 20时23分51秒
file location  :/home/maksyuki/Documents/github/learning/machinelearning/cpp
***************************************************/

#include <iostream>
#include <string>
using namespace std;

string data[16][16] = {
{"Example", "Sky",   "AirTemp", "Humidity", "Wind",   "Water", "Forecast", "EnjoySport"},
{"1",       "Sunny", "Warm",    "Normal",   "Strong", "Warm",  "Same",     "Yes"},
{"2",       "Sunny", "Warm",    "High",     "Strong", "Warm",  "Same",     "Yes"},
{"3",       "Rainy", "Cold",    "High",     "Strong", "Warm",  "Change",   "No"},
{"4",       "Sunny", "Warm",    "High",     "Strong", "Cool",  "Change",   "Yes"}
};

string ans[16];

void Init()
{
    for(int i = 0; i < 16; i++)
        ans[i] = "NULL";
}

void FindS()
{
    for(int i = 1; i < 5; i++)
    {
        if(data[i][7] == "Yes")
        {
            for(int j = 1; j < 7; j++)
            {
                if(ans[j] == "NULL") ans[j] = data[i][j];
                else if(ans[j] != data[i][j]) ans[j] = "?";
            }
        }
    }
}

int main()
{
    Init();
    FindS();
    for(int i = 1; i < 7; i++)
    {
        cout << data[0][i];
        if(i == 1)      cout << ":      ";
        else if(i == 2) cout << ":  ";
        else if(i == 4) cout << ":     ";
        else if(i == 5) cout << ":    ";
        else            cout << ": ";
        cout << "\"" << ans[i] << "\"" << endl;
    }

    return 0;
}
