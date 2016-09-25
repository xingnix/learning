#!/bin/bash
gnuplot -e "set xrange [0:1] ;set samples 100 ; plot x**($1)*(1-x)**($2) w lp; pause -1"
#usage:
#. flipcoin.gnuplot  3 3
