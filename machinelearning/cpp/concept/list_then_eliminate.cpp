	/**************************************************
filename       :list_then_eliminate.cpp
author         :maksyuki
created time   :2016年09月21日 星期三 19时00分33秒
last modified  :2016年09月21日 星期三 20时10分57秒
file location  :/home/maksyuki/Documents/github/learning/machinelearning/cpp/concept
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

string tab[16][16] = {
{"4", "?", "Sunny", "Rainy"},
{"4", "?", "Warm", "Cold"},
{"4", "?", "Normal", "High"},
{"3", "?", "Strong"},
{"4", "?", "Warm", "Cool"},
{"4", "?", "Same", "Change"},
};

string ans[4096+66][16];
string tmp[16];
int cnt;

void dfs(int n)
{
    if(n == 7)
    {
        for(int i = 1; i <= 6; i++)
            ans[cnt][i] = tmp[i];
        cnt++;
        return;
    }
    
    int len = tab[n-1][0][0] - '0';
    for(int i = 1; i < len; i++)
    {
        tmp[n] = tab[n-1][i];
        dfs(n + 1);
    }
}

int main()
{
    cnt = 0;
    dfs(1); 

    for(int i = 0; i < cnt; i++)
    {
        bool is_satisfy = true;
        for(int j = 1; j < 5; j++)
        {
            bool is_valid = true;
            for(int k = 1; k < 7; k++)
            {
                if(ans[i][k] != "?" && ans[i][k] != data[j][k])
                {
                    is_valid = false;
                    break;
                }
            }

            if(is_valid && data[j][7] == "No")
            {
                is_satisfy = false;
                break;
            }

            if(!is_valid && data[j][7] == "Yes")
            {
                is_satisfy = false;
                break;
            }
        }
        
        if(is_satisfy)
        {
            for(int j = 1; j < 7; j++)
            {
                cout << data[0][j];
                if(j == 1)      cout << ":      ";
                else if(j == 2) cout << ":  ";
                else if(j == 4) cout << ":     ";
                else if(j == 5) cout << ":    ";
                else            cout << ": ";
                cout  << "\"" << ans[i][j] << "\"" << endl;
            }
            cout << endl;
        }
    }
    return 0;
}
