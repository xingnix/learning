<TeXmacs|2.1>

<style|generic>

<\body>
  network

  <with|gr-mode|<tuple|edit|math-at>|gr-frame|<tuple|scale|1cm|<tuple|0.5gw|0.5gh>>|gr-geometry|<tuple|geometry|1par|0.6par>|gr-arrow-end|\<gtr\>|gr-grid|<tuple|cartesian|<point|0|0>|1>|gr-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|logarithmic|<point|0|0>|1|10>|gr-edit-grid-old|<tuple|logarithmic|<point|0|0>|1|10>|gr-auto-crop|true|gr-grid-aspect|<tuple|<tuple|axes|#e0e0ff>|<tuple|1|#e0e0ff>|<tuple|10|#e0e0ff>>|gr-grid-aspect-props|<tuple|<tuple|axes|#e0e0ff>|<tuple|1|#e0e0ff>|<tuple|2|#e0e0ff>>|<graphics||<point|-3.26927|2.97139>|<point|-3.26927|2.23055>|<with|magnify|0.424955665245609|<carc|<point|1.01041904683899|3.63297429882146>|<point|1.22629978152163|3.57001003685703>|<point|1.13635017649545|3.66895460238585>>>|<gr-group|<with|magnify|0.424955665245609|<carc|<point|-1.11867984891285|3.5841636542371>|<point|-0.902799114230211|3.52119939227267>|<point|-0.99274871925639|3.62014395780149>>>>|<with|arrow-end|\<gtr\>|<line|<point|-3.07876|3.44765>|<point|-1.16316642413018|3.47939542267496>>>|<with|arrow-end|\<gtr\>|<line|<point|-0.856248|3.46881>|<point|0.979640342481652|3.52411061528075>>>|<point|-3.2481|2.63272>|<point|-3.29043|4.13557>|<point|-3.26927|3.77573>|<point|-3.27985|4.41074>|<point|-1.05733|4.42132>|<point|-1.06791|4.14615>|<point|-1.06791|3.86039>|<point|1.03818|3.81806>|<point|1.05935|4.10382>|<point|1.0276|4.42132>|<point|1.13343|2.34697>|<point|1.13343|2.67506>|<point|1.12285|3.03489>|<point|-1.05733|2.35755>|<point|-1.05733|2.68564>|<point|-1.04675|2.96081>|<math-at|x<rsub|k>|<point|-3.533850377034|3.41589495965075>>|<math-at|<with|color|magenta|w<rsup|<around*|(|1|)>><rsub|i
  k>>|<point|-2.40142545310226|3.70164704325969>>|<math-at|<with|color|magenta|w<rsup|<around*|(|2|)>><rsub|j
  i>>|<point|-0.27416|3.77574653657891>>|<math-at|l|<point|2.6468613573224|3.41589495965075>>|<with|arrow-end|\<gtr\>|<line|<point|1.27214852876846|3.52657428231248>|<point|2.52930281783305|3.53838139965604>>>|<math-at|n<rsub|i><rsup|<around*|(|1|)>>|<point|-1.9569222119328|2.98197512898532>>|<math-at|o<rsub|i><rsup|<around*|(|1|)>>|<point|-0.835080698505093|2.97139171848128>>|<math-at|n<rsub|j><rsup|<around*|(|2|)>>|<point|0.382011509458923|3.05605900251356>>|<math-at|o<rsub|j><rsup|<around*|(|2|)>>|<point|1.30276822330996|3.14072628654584>>>>

  <\equation*>
    x<rsub|k><long-arrow|\<rubber-rightarrow\>|<with|color|magenta|w<rsub|i
    k><rsup|<around*|(|1|)>>>><with|color|<pattern|/usr/share/TeXmacs/misc/patterns/vintage/granite-dark.png||>|<block|<tformat|<cwith|1|1|1|1|cell-background|yellow>|<table|<row|<cell|n<rsub|i><rsup|<around*|(|1|)>><long-arrow|\<rubber-rightarrow\>|\<sigma\>>o<rsub|i><rsup|<around*|(|1|)>>>>>>><rotate|45|>><long-arrow|\<rubber-rightarrow\>|<with|color|magenta|w<rsub|j
    i><rsup|<around*|(|2|)>>>><tabular|<tformat|<cwith|1|1|1|1|cell-background|yellow>|<table|<row|<cell|n<rsub|j><rsup|<around*|(|2|)>><long-arrow|\<rubber-rightarrow\>|\<sigma\>>o<rsub|j><rsup|<around*|(|2|)>>>>>>>\<rightarrow\>l
  </equation*>

  <\eqnarray*>
    <tformat|<table|<row|<cell|n<rsub|i><rsup|<around*|(|1|)>>>|<cell|=>|<cell|<big|sum><rsub|k>w<rsub|i
    k><rsup|<around*|(|1|)>>x<rsub|k>>>|<row|<cell|o<rsub|i><rsup|<around*|(|1|)>>>|<cell|=>|<cell|\<sigma\><around*|(|n<rsub|i><rsup|<around*|(|1|)>>|)>>>|<row|<cell|n<rsub|j><rsup|<around*|(|2|)>>>|<cell|=>|<cell|<big|sum><rsub|i>w<rsub|j
    i><rsup|<around*|(|2|)>>o<rsub|i>>>|<row|<cell|o<rsub|j><rsup|<around*|(|2|)>>>|<cell|=>|<cell|\<sigma\><around*|(|n<rsub|j><rsup|<around*|(|2|)>>|)>>>|<row|<cell|l>|<cell|=>|<cell|<big|sum><rsub|j><frac|1|2><around*|(|o<rsup|<around*|(|2|)>><rsub|j>-t<rsub|j>|)><rsup|2>>>|<row|<cell|l>|<cell|=>|<cell|<big|sum><rsub|j><frac|1|2><stack|<tformat|<cwith|1|1|1|1|cell-background|pastel
    red>|<table|<row|<cell|<wide*|<around*|(||\<nobracket\>><with|color|blue|<stack|<tformat|<cwith|1|1|1|1|cell-background|pastel
    magenta>|<table|<row|<cell|<wide*|<with|color|black|\<sigma\>><around*|(||\<nobracket\>><stack|<tformat|<cwith|1|1|1|1|cell-background|pastel
    blue>|<table|<row|<cell|<wide|<with|color|black|<big|sum><rsub|i>><tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
    cyan>|<table|<row|<cell|<wide*|<with|color|dark
    yellow|<with|color|black|w<rsub|j i><rsup|<around*|(|2|)>>><with|color|dark
    orange|<stack|<tformat|<cwith|1|1|1|1|cell-background|pastel
    green>|<table|<row|<cell|<wide*|<with|color|black|\<sigma\>><around*|(||\<nobracket\>><with|color|orange|<stack|<tformat|<cwith|1|1|1|1|cell-background|pastel
    yellow>|<table|<row|<cell|<wide|<with|color|black|<big|sum><rsub|k>><stack|<tformat|<cwith|1|1|1|1|cell-background|pastel
    orange>|<table|<row|<cell|<wide|<with|color|black|w<rsub|i
    k><rsup|<around*|(|1|)>>><with|color|magenta|<stack|<tformat|<cwith|1|1|1|1|cell-background|pastel
    brown>|<table|<row|<cell|<wide|<with|color|black|x<rsub|k>>|\<wide-sqoverbrace\>><rsup|<around*|(|1|)>>>>>>>>|\<wide-sqoverbrace\>><rsup|<around*|(|2|)>>>>>>>|\<wide-sqoverbrace\>><rsup|<around*|(|3|)>>>>>>>><around*|\<nobracket\>||)>|\<wide-squnderbrace\>><rsub|<around*|(|4|)>>>>>>>>>|\<wide-squnderbrace\>><rsub|<around*|(|5|)>>>>>>>|\<wide-sqoverbrace\>><rsup|*<around*|(|6|)>>>>>>><around*|\<nobracket\>||)>|\<wide-squnderbrace\>><rsub|<around*|(|7|)>>>>>>>>-t<rsub|j><around*|\<nobracket\>||)><rsup|2>|\<wide-squnderbrace\>><rsub|<around*|(|8|)>>>>>>>>>|<row|<cell|l>|<cell|=>|<cell|<big|sum><rsub|j><frac|1|2><wide*|<around*|(||\<nobracket\>><with|color|blue|<wide*|<with|color|black|\<sigma\>><around*|(||\<nobracket\>><wide|<with|color|black|<big|sum><rsub|i>><wide*|<with|color|dark
    yellow|<with|color|black|w<rsub|j i><rsup|<around*|(|2|)>>><with|color|dark
    orange|<wide*|<with|color|black|\<sigma\>><around*|(||\<nobracket\>><with|color|orange|<wide|<with|color|black|<big|sum><rsub|k>><wide|<with|color|black|w<rsub|i
    k><rsup|<around*|(|1|)>>><with|color|magenta|<wide|<with|color|black|x<rsub|k>>|\<wide-sqoverbrace\>><rsup|<around*|(|1|)>>>|\<wide-sqoverbrace\>><rsup|<around*|(|2|)>>|\<wide-sqoverbrace\>><rsup|<around*|(|3|)>>><around*|\<nobracket\>||)>|\<wide-squnderbrace\>><rsub|<around*|(|4|)>>>>|\<wide-squnderbrace\>><rsub|<around*|(|5|)>>|\<wide-sqoverbrace\>><rsup|*<around*|(|6|)>><around*|\<nobracket\>||)>|\<wide-squnderbrace\>><rsub|<around*|(|7|)>>>-t<rsub|j><around*|\<nobracket\>||)><rsup|2>|\<wide-squnderbrace\>><rsub|<around*|(|8|)>>>>>>
  </eqnarray*>

  \;

  grad

  <\equation*>
    x<rsub|k><long-arrow|\<rubber-rightarrow\>|<with|color|magenta|\<mathd\>w<rsub|i
    k><rsup|<around*|(|1|)>>>><with|color|<pattern|/usr/share/TeXmacs/misc/patterns/vintage/granite-dark.png||>|<block|<tformat|<cwith|1|1|1|1|cell-background|yellow>|<table|<row|<cell|\<mathd\>n<rsub|i><rsup|<around*|(|1|)>><long-arrow|\<rubber-rightarrow\>|<wide|\<sigma\>|\<dot\>>>\<mathd\>o<rsub|i><rsup|<around*|(|1|)>>>>>>><rotate|45|>><long-arrow|\<rubber-rightarrow\>|<with|color|magenta|w<rsub|j
    i><rsup|<around*|(|2|)>>>><tabular|<tformat|<cwith|1|1|1|1|cell-background|yellow>|<table|<row|<cell|\<mathd\>n<rsub|j><rsup|<around*|(|2|)>><long-arrow|\<rubber-rightarrow\>|<wide|\<sigma\>|\<dot\>>>\<mathd\>o<rsub|j><rsup|<around*|(|2|)>>>>>>>\<rightarrow\>\<mathd\>l
  </equation*>

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<mathd\>n<rsub|i><rsup|<around*|(|1|)>>>|<cell|=>|<cell|<big|sum><rsub|k><frac|\<partial\>n<rsub|i><rsup|<around*|(|1|)>>|\<partial\>w<rsub|i
    k><rsup|<around*|(|1|)>>>\<mathd\>w<rsub|i
    k><rsup|<around*|(|1|)>>=<with|color|dark
    cyan|<big|sum><rsub|k>x<rsub|k>>\<mathd\>w<rsub|i
    k><rsup|<around*|(|1|)>>>>|<row|<cell|\<mathd\>o<rsub|i><rsup|<around*|(|1|)>>>|<cell|=>|<cell|<with|color|dark
    blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|i><rsup|<around*|(|1|)>>>>\<mathd\>n<rsub|i><rsup|<around*|(|1|)>>>>|<row|<cell|\<mathd\>n<rsub|j><rsup|<around*|(|1|)>>>|<cell|=>|<cell|<big|sum><rsub|i><frac|\<partial\>n<rsub|j><rsup|<around*|(|1|)>>|\<partial\>o<rsub|i><rsup|<around*|(|1|)>>>\<mathd\>o<rsub|i><rsup|<around*|(|1|)>>=<with|color|brown|<big|sum><rsub|i>w<rsub|j
    i><rsup|<around*|(|2|)>>>\<mathd\>o<rsub|i><rsup|<around*|(|1|)>>>>|<row|<cell|\<mathd\>o<rsub|j><rsup|<around*|(|2|)>>>|<cell|=>|<cell|<with|color|blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|j><rsup|<around*|(|2|)>>>>\<mathd\>n<rsub|j><rsup|<around*|(|2|)>>>>|<row|<cell|\<mathd\>l>|<cell|=>|<cell|<big|sum><rsub|j><frac|\<partial\>l|\<partial\>o<rsub|j><rsup|<around*|(|2|)>>>\<mathd\>o<rsub|j><rsup|<around*|(|2|)>>=<with|color|red|<big|sum><rsub|j><with|color|dark
    yellow|<around*|(|o<rsub|j><rsup|<around*|(|2|)>>-t<rsub|j>|)>>>\<mathd\>o<rsub|j><rsup|<around*|(|2|)>>>>|<row|<cell|\<mathd\>l>|<cell|=>|<cell|<with|color|red|<big|sum><rsub|j><with|color|dark
    yellow|<around*|(|o<rsub|j><rsup|<around*|(|2|)>>-t<rsub|j>|)>>><with|color|blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|j><rsup|<around*|(|2|)>>>><with|color|brown|<big|sum><rsub|i>w<rsub|j
    i><rsup|<around*|(|2|)>>><with|color|dark
    blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|i><rsup|<around*|(|1|)>>>><with|color|dark
    cyan|<big|sum><rsub|k>x<rsub|k>>\<mathd\>w<rsub|i
    k><rsup|<around*|(|1|)>>>>>>
  </eqnarray*>

  forward

  <\equation*>
    <frac|\<partial\>l|\<partial\>w<rsub|i<rprime|'>k<rprime|'>><rsup|<around*|(|1|)>>>=<with|color|red|<big|sum><rsub|j><around*|{|<with|color|dark
    yellow|<around*|(|o<rsub|j><rsup|<around*|(|2|)>>-t<rsub|j>|)>><around*|{|<with|color|blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|j><rsup|<around*|(|2|)>>>><around*|{|<with|color|brown|w<rsub|j
    i<rprime|'>><rsup|<around*|(|2|)>>><around*|{|<with|color|dark
    blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|i<rprime|'>><rsup|<around*|(|1|)>>>><with|color|dark
    cyan|<with|color|red|<around*|{|<with|color|dark
    cyan|x<rsub|k<rprime|'>>>|}>>><rsub|<around*|\<langle\>|1|\<rangle\>>>|}><rsub|<around*|\<langle\>|2|\<rangle\>>>|}><rsub|<around*|\<langle\>|3|\<rangle\>>>|}><rsub|<around*|\<langle\>|4|\<rangle\>>>|}><rsub|<around*|\<langle\>|5|\<rangle\>>>>
  </equation*>

  <\equation*>
    <frac|\<partial\>l|\<partial\>w<rsub|i<rprime|'>k<rprime|'>><rsup|<around*|(|1|)>>>=<with|color|red|<big|sum><rsub|j><wide|<with|color|dark
    yellow|<around*|(|o<rsub|j><rsup|<around*|(|2|)>>-t<rsub|j>|)>><wide*|<with|color|blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|j><rsup|<around*|(|2|)>>><wide|w<rsub|j
    i<rprime|'>><rsup|<around*|(|2|)>><wide*|<with|color|dark
    blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|i<rprime|'>><rsup|<around*|(|1|)>>>><wide|<with|color|dark
    cyan|x<rsub|k<rprime|'>>>|\<wide-sqoverbrace\>><rsup|<around*|(|1|)>>|\<wide-squnderbrace\>><rsub|<around*|(|2|)>>|\<wide-sqoverbrace\>><rsup|<around*|(|3|)>>>|\<wide-squnderbrace\>><rsub|<around*|(|4|)>>|\<wide-sqoverbrace\>><rsup|<around*|(|5|)>>>
  </equation*>

  <\equation*>
    <frac|\<partial\>l|\<partial\>w<rsub|i<rprime|'>k<rprime|'>><rsup|<around*|(|1|)>>>=<with|color|red|<big|sum><rsub|j><tabular*|<tformat|<cwith|1|1|1|1|cell-background|pastel
    red>|<table|<row|<cell|<wide|<with|color|dark
    yellow|<around*|(|o<rsub|j><rsup|<around*|(|2|)>>-t<rsub|j>|)>><tabular*|<tformat|<cwith|1|1|1|1|cell-background|pastel
    magenta>|<table|<row|<cell|<wide*|<with|color|blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|j><rsup|<around*|(|2|)>>><tabular*|<tformat|<cwith|1|1|1|1|cell-background|pastel
    blue>|<table|<row|<cell|<wide|w<rsub|j
    i<rprime|'>><rsup|<around*|(|2|)>><tabular*|<tformat|<cwith|1|1|1|1|cell-background|pastel
    cyan>|<table|<row|<cell|<wide*|<with|color|dark
    blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|i<rprime|'>><rsup|<around*|(|1|)>>>><tabular*|<tformat|<cwith|1|1|1|1|cell-background|pastel
    green>|<table|<row|<cell|<wide|<with|color|dark
    cyan|x<rsub|k<rprime|'>>>|\<wide-sqoverbrace\>><rsup|<around*|(|1|)>>>>>>>|\<wide-squnderbrace\>><rsub|<around*|(|2|)>>>>>>>|\<wide-sqoverbrace\>><rsup|<around*|(|3|)>>>>>>>>|\<wide-squnderbrace\>><rsub|<around*|(|4|)>>>>>>>|\<wide-sqoverbrace\>><rsup|<around*|(|5|)>>>>>>>>
  </equation*>

  backward

  <\equation*>
    <frac|\<partial\>l|\<partial\>w<rsub|i<rprime|'>k<rprime|'>><rsup|<around*|(|1|)>>>=<wide|<wide*|<with|color|red|<big|sum><rsub|j><wide|<wide*|<wide|<with|color|dark
    yellow|<around*|(|o<rsub|j><rsup|<around*|(|2|)>>-t<rsub|j>|)>>|\<wide-sqoverbrace\>><rsup|<around*|(|1|)>><with|color|blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|j><rsup|<around*|(|2|)>>>>|\<wide-squnderbrace\>><rsub|<around*|(|2|)>><with|color|brown|w<rsub|j
    i<rprime|'>><rsup|<around*|(|2|)>>>|\<wide-sqoverbrace\>><rsup|<around*|(|3|)>>>|\<wide-squnderbrace\>><rsub|<around*|(|4|)>><with|color|dark
    blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|i<rprime|'>><rsup|<around*|(|1|)>>>>|\<wide-sqoverbrace\>><rsup|<around*|(|5|)>><with|color|dark
    cyan|x<rsub|k<rprime|'>>>
  </equation*>

  <\equation*>
    <frac|\<partial\>l|\<partial\>w<rsub|i<rprime|'>k<rprime|'>><rsup|<around*|(|1|)>>>=<tabular*|<tformat|<cwith|1|1|1|1|cell-background|pastel
    red>|<table|<row|<cell|<wide|<tabular*|<tformat|<cwith|1|1|1|1|cell-background|pastel
    magenta>|<table|<row|<cell|<wide*|<with|color|red|<big|sum><rsub|j><tabular*|<tformat|<cwith|1|1|1|1|cell-background|pastel
    blue>|<table|<row|<cell|<wide|<tabular*|<tformat|<cwith|1|1|1|1|cell-background|pastel
    cyan>|<table|<row|<cell|<wide*|<tabular*|<tformat|<cwith|1|1|1|1|cell-background|pastel
    green>|<table|<row|<cell|<wide|<with|color|dark
    yellow|<around*|(|o<rsub|j><rsup|<around*|(|2|)>>-t<rsub|j>|)>>|\<wide-sqoverbrace\>><rsup|<around*|(|1|)>>>>>>><with|color|blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|j><rsup|<around*|(|2|)>>>>|\<wide-squnderbrace\>><rsub|<around*|(|2|)>>>>>>><with|color|brown|w<rsub|j
    i<rprime|'>><rsup|<around*|(|2|)>>>|\<wide-sqoverbrace\>><rsup|<around*|(|3|)>>>>>>>>|\<wide-squnderbrace\>><rsub|<around*|(|4|)>>>>>>><with|color|dark
    blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|i<rprime|'>><rsup|<around*|(|1|)>>>>|\<wide-sqoverbrace\>><rsup|<around*|(|5|)>>>>>>><with|color|dark
    cyan|x<rsub|k<rprime|'>>>
  </equation*>

  \;
</body>

<\initial>
  <\collection>
    <associate|bg-color|white>
    <associate|page-medium|paper>
  </collection>
</initial>