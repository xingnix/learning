<TeXmacs|2.1>

<style|<tuple|beamer|manila-paper>>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <doc-data|<doc-title|Automatic Differentiation>>
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|Dual number>
    </padded-center>
  </hidden>|<\hidden>
    <tit|<math|a+b\<varepsilon\>>>

    \;

    In algebra, the dual numbers are a quadratic algebra first introduced in
    the 19th century. They are expressions of the form <math|a +
    b\<varepsilon\>>, where <math|a> and <math|b> are real numbers, and
    <math|\<varepsilon\>> is a symbol taken to satisfy
    <math|\<varepsilon\><rsup|2>=0> with <math|\<varepsilon\>\<neq\>0>.

    \;

    Dual numbers can be added component-wise, and multiplied by the formula

    \ \ 

    <\equation*>
      (a+b\<varepsilon\>)(c+d\<varepsilon\>)=ac+(ad+bc)\<varepsilon\>
    </equation*>

    \;

    which follows from the property <math|\<varepsilon\><rsup|2>= 0> and the
    fact that multiplication is a bilinear operation.
  </hidden>|<\hidden>
    One application of dual numbers is automatic differentiation. Any
    polynomial \ \ \ 

    <\equation*>
      P(x)=p<rsub|0>+p<rsub|1>x+p<rsub|2>x<rsup|2>+\<cdots\>+p<rsub|n>x<rsup|n>
    </equation*>

    with real coefficients can be extended to a function of a
    dual-number-valued argument,

    <\eqnarray*>
      <tformat|<table|<row|<cell|P<around*|(|a+b\<varepsilon\>|)>>|<cell|=>|<cell|p<rsub|0>+p<rsub|1><around*|(|a+b\<varepsilon\>|)>+\<cdots\>+p<rsub|n><around*|(|a+b\<varepsilon\>|)><rsup|n>>>|<row|<cell|>|<cell|=>|<cell|<around*|[|p<rsub|0>+p<rsub|1>a+\<cdots\>+p<rsub|n>a<rsup|n>|]>+<around*|[|p<rsub|1>b\<varepsilon\>+\<cdots\>+n
      p<rsub|n>a<rsup|n-1>b\<varepsilon\>|]>>>|<row|<cell|>|<cell|=>|<cell|P<around*|(|a|)>+P<rprime|'><around*|(|a|)>b\<varepsilon\>>>>>
    </eqnarray*>

    where <math|P<rprime|'>> is the derivative of <math|P>.

    \;

    \;
  </hidden>|<\hidden>
    More generally, any (analytic) real function can be extended to the dual
    numbers via its Taylor series: \ \ \ 

    <\equation*>
      f(a+b\<varepsilon\>)=<big|sum><rsub|n=1><rsup|\<infty\>><frac|1|n!>f<rsup|(n)>(a)b<rsup|n>\<varepsilon\><rsup|n>=f(a)+b
      f<rprime|'>(a)\<varepsilon\>
    </equation*>

    \;

    since all terms involving <math|\<varepsilon\><rsup|2>> or greater powers
    are trivially 0 by the definition of <math|\<varepsilon\>>.

    \;

    By computing compositions of these functions over the dual numbers and
    examining the coefficient of <math|\<varepsilon\>> in the result we find
    we have automatically computed the derivative of the composition.
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    <\padded-center>
      <section|Model>
    </padded-center>
  </hidden>|<\hidden>
    \;

    A neural network can be represented by a computational graph.

    Each node represents a variable which can be regarded as a output of a
    function.

    The output node represents lost.
  </hidden>|<\hidden>
    For every node <math|i>, the variable is designated as <math|f<rsub|i>>
    which depends on output variables of node <math|j>. The dependant can be
    represented as

    <\equation*>
      f<rsub|i><around*|(|<around*|{|f<rsub|j><around*|\||i\<leftarrow\>j|\<nobracket\>>|}>|)>.
    </equation*>

    where <math|<around*|{|f<rsub|j><around*|\|||\<nobracket\>>i\<leftarrow\>j|}>>
    means the set of variables which is the input of node <math|i>.
  </hidden>|<\hidden>
    Some examples of such variables:

    <\eqnarray*>
      <tformat|<table|<row|<cell|f<rsub|i>>|<cell|=>|<cell|<big|sum><rsub|<around*|{|j<around*|\|||\<nobracket\>>i\<leftarrow\>j|}>>f<rsub|j>>>|<row|<cell|f<rsub|i>>|<cell|=>|<cell|<around*|\<nobracket\>|w<rsub|i
      j>*f<rsub|j>*|\|><rsub|i\<leftarrow\>j><eq-number><label|linear>>>|<row|<cell|f<rsub|i>>|<cell|=>|<cell|\<sigma\><around*|(|f<rsub|j>|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    As for input node <math|i>, \ <math|f<rsub|i>> is an independent
    variable.

    <\eqnarray*>
      <tformat|<table|<row|<cell|f<rsub|i>>|<cell|=>|<cell|f<rsub|i><around*|(|<around*|{||}>|)>>>>>
    </eqnarray*>

    If node <math|e> is the error node,\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|E>|<cell|=>|<cell|f<rsub|e><rsub|>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|Grad>
    </padded-center>
  </hidden>|<\hidden>
    \;

    There are two ways to compute the gradient.

    One is forwad, like the computing process of the functions, but functions
    are substuted by their gradients.

    The other is reverse where the gradients are computed in the inverted
    order. The recursive representation is listed later.
  </hidden>|<\hidden>
    <tit|Forward>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<partial\>E|\<partial\>w<rsub|i
      j>>>|<cell|=>|<cell|<big|sum><rsub|<around*|{|q<around*|\||e\<leftarrow\>q|\<nobracket\>>|}>><frac|\<partial\>f<rsub|e>|\<partial\>f<rsub|q>><frac|\<partial\>f<rsub|q>|\<partial\>w<rsub|i
      j>>>>|<row|<cell|\<mathd\>f<rsub|e>>|<cell|=>|<cell|<big|sum><rsub|<around*|{|q<around*|\||e\<leftarrow\>q|\<nobracket\>>|}>><frac|\<partial\>f<rsub|e>|\<partial\>f<rsub|q>>\<mathd\>f<rsub|q>>>>>
    </eqnarray*>

    where

    <\eqnarray*>
      <tformat|<table|<row|<cell|E>|<cell|=>|<cell|f<rsub|e>>>|<row|<cell|\<mathd\>f<rsub|e>>|<cell|=>|<cell|<frac|\<partial\>f<rsub|e>|\<partial\>w<rsub|i
      j>>\<mathd\>w<rsub|i j>>>|<row|<cell|\<mathd\>f<rsub|q>>|<cell|=>|<cell|<frac|\<partial\>f<rsub|q>|\<partial\>w<rsub|i
      j>>\<mathd\>w<rsub|i j>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Reverse>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<partial\>E|\<partial\>w<rsub|i
      j>>>|<cell|=>|<cell|<frac|\<partial\>E|\<partial\>f<rsub|i>><frac|\<partial\>f<rsub|i>|\<partial\>w<rsub|i
      j>>>>|<row|<cell|\<partial\><rsub|i>E>|<cell|=>|<cell|<big|sum><rsub|<around*|{|k<around*|\||k\<leftarrow\>i|\<nobracket\>>|}>>\<partial\><rsub|k>E\<cdummy\><frac|\<partial\>f<rsub|k>|\<partial\>f<rsub|i>>>>>>
    </eqnarray*>

    where

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<partial\><rsub|i>E>|<cell|=>|<cell|<frac|\<partial\>E|\<partial\>f<rsub|i>>>>|<row|<cell|<frac|\<partial\>f<rsub|i>|\<partial\>w<rsub|i
      j>>>|<cell|=>|<cell|f<rsub|j><eq-number><label|grad-wij>>>>>
    </eqnarray*>

    <eqref|grad-wij> is deduced by <eqref|linear>.

    \;
  </hidden>|<\hidden>
    <tit|The illustration with whole derivative chain>

    The gradient can be obtained through chain rule of derivative:

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<partial\>E|\<partial\>w<rsub|i
      j>>>|<cell|=>|<cell|<big|sum><rsub|<around*|{|p<around*|\||e\<leftarrow\>p|\<nobracket\>>|}>><big|sum><rsub|<around*|{|q<around*|\||p\<leftarrow\>q|\<nobracket\>>|}>>\<cdots\><around*|[|<frac|\<partial\>f<rsub|e>|\<partial\>f<rsub|p>><frac|\<partial\>f<rsub|p>|\<partial\>f<rsub|q>>\<cdots\><frac|\<partial\>f<rsub|k>|\<partial\>f<rsub|i>><frac|\<partial\>f<rsub|i>|\<partial\>w<rsub|i
      j>>|]>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|<around*|{|p<around*|\||e\<leftarrow\>p|\<nobracket\>>|}>><around*|[|<frac|\<partial\>E|\<partial\>f<rsub|p>><big|sum><rsub|<around*|{|q<around*|\||p\<leftarrow\>q|\<nobracket\>>|}>><around*|[|<frac|\<partial\>f<rsub|p>|\<partial\>f<rsub|q>>\<cdots\><frac|\<partial\>f<rsub|k>|\<partial\>f<rsub|i>><frac|\<partial\>f<rsub|i>|\<partial\>w<rsub|i
      j>>|]>|]>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|<around*|{|p<around*|\||e\<leftarrow\>p|\<nobracket\>>|}>><around*|(|<frac|\<partial\>f<rsub|e>|\<partial\>f<rsub|p>><big|sum><rsub|<around*|{|q<around*|\||p\<leftarrow\>q|\<nobracket\>>|}>><around*|(|<frac|\<partial\>f<rsub|p>|\<partial\>f<rsub|q>>\<cdots\><frac|\<partial\>f<rsub|k>|\<partial\>f<rsub|i>><frac|\<partial\><around*|(|w<rsub|i
      j>*f<rsub|j>|)>|\<partial\>f<rsub|j>>|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|<around*|{|p<around*|\||e\<leftarrow\>p|\<nobracket\>>|}>><around*|(|<frac|\<partial\>f<rsub|e>|\<partial\>f<rsub|p>><big|sum><rsub|<around*|{|q<around*|\||p\<leftarrow\>q|\<nobracket\>>|}>><around*|(|<frac|\<partial\>f<rsub|p>|\<partial\>f<rsub|q>>\<cdots\><frac|\<partial\>f<rsub|k>|\<partial\>f<rsub|i>>f<rsub|j>|)>|)>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    The backward computation is obtained by changing the order of sumations:

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<partial\>E|\<partial\>w<rsub|i
      j>>>|<cell|=>|<cell|<big|sum><rsub|<around*|{|p<around*|\||e\<leftarrow\>p|\<nobracket\>>|}>><big|sum><rsub|<around*|{|q<around*|\||p\<leftarrow\>q|\<nobracket\>>|}>>\<cdots\><around*|[|<frac|\<partial\>f<rsub|e>|\<partial\>f<rsub|p>><frac|\<partial\>f<rsub|p>|\<partial\>f<rsub|q>>\<cdots\><frac|\<partial\>f<rsub|k>|\<partial\>f<rsub|i>><frac|\<partial\>f<rsub|i>|\<partial\>w<rsub|i
      j>>|]>>>|<row|<cell|>|<cell|=>|<cell|\<cdots\><around*|[|<big|sum><rsub|<around*|{|q<around*|\||p\<leftarrow\>q|\<nobracket\>>|}>><around*|[|<big|sum><rsub|<around*|{|p<around*|\||e\<leftarrow\>p|\<nobracket\>>|}>><frac|\<partial\>f<rsub|e>|\<partial\>f<rsub|p>><frac|\<partial\>f<rsub|p>|\<partial\>f<rsub|q>>|]>|]>\<cdots\><frac|\<partial\>f<rsub|k>|\<partial\>f<rsub|i>>f<rsub|j>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Matrix representation>

    <\eqnarray*>
      <tformat|<table|<row|<cell|M<rsub|g
      f>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|<frac|\<partial\>g<rsub|1>|\<partial\>f<rsub|1>>>|<cell|\<cdots\>>|<cell|<frac|\<partial\>g<rsub|1>|\<partial\>f<rsub|m>>>>|<row|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|<frac|\<partial\>g<rsub|n>|\<partial\>f<rsub|1>>>|<cell|\<nosymbol\>\<cdots\>>|<cell|<frac|\<partial\>g<rsub|n>|\<partial\>f<rsub|m>>>>>>><rsub|><space|2em>where<space|1em>g<rsub|i>\<leftarrow\>f<rsub|j><space|1em>,1\<leqslant\>i\<leqslant\>n,1\<leqslant\>j\<leqslant\>m>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    \;

    Dirivative can be represented by chain rule:

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<partial\>e|\<partial\>w>>|<cell|=>|<cell|M<rsub|e
      q>M<rsub|q p>\<cdots\>M<rsub|g f>M<rsub|f w>>>>>
    </eqnarray*>

    where

    <\equation*>
      e\<leftarrow\>q\<leftarrow\>q\<leftarrow\>p\<leftarrow\>\<cdots\>\<leftarrow\>g\<leftarrow\>f\<leftarrow\>w
    </equation*>
  </hidden>|<\hidden>
    Example

    <\eqnarray*>
      <tformat|<table|<row|<cell|M<rsub|e
      q>=<matrix|<tformat|<table|<row|<cell|<frac|\<partial\>e|\<partial\>q<rsub|1>>>|<cell|<frac|\<partial\>e|\<partial\>q<rsub|2>>>>>>>>|<cell|>|<cell|>>|<row|<cell|M<rsub|q
      p>=<matrix|<tformat|<table|<row|<cell|<frac|\<partial\>q<rsub|1>|\<partial\>p<rsub|1>>>|<cell|<frac|\<partial\>q<rsub|1>|\<partial\>p<rsub|2>>>>|<row|<cell|<frac|\<partial\>q<rsub|2>|\<partial\>p<rsub|1>>>|<cell|<frac|\<partial\>q<rsub|2>|\<partial\>p<rsub|2>>>>>>>>|<cell|>|<cell|M<rsub|
      p g>=<matrix|<tformat|<table|<row|<cell|<frac|\<partial\>p<rsub|1>|\<partial\>g<rsub|1>>>|<cell|<frac|\<partial\>p<rsub|1>|\<partial\>g<rsub|2>>>>|<row|<cell|<frac|\<partial\>p<rsub|2>|\<partial\>g<rsub|1>>>|<cell|<frac|\<partial\>p<rsub|2>|\<partial\>g<rsub|2>>>>>>>>>|<row|<cell|M<rsub|
      g f>=<matrix|<tformat|<table|<row|<cell|<frac|\<partial\>g<rsub|1>|\<partial\>f<rsub|1>>>|<cell|<frac|\<partial\>g<rsub|1>|\<partial\>f<rsub|2>>>>|<row|<cell|<frac|\<partial\>g<rsub|2>|\<partial\>f<rsub|1>>>|<cell|<frac|\<partial\>g<rsub|2>|\<partial\>f<rsub|2>>>>>>>>|<cell|>|<cell|M<rsub|f
      w><matrix|<tformat|<table|<row|<cell|<frac|\<partial\>f<rsub|1>|\<partial\>w<rsub|1>>>|<cell|0>>|<row|<cell|0>|<cell|<frac|\<partial\>f<rsub|2>|\<partial\>w<rsub|2>>>>>>>>>>>
    </eqnarray*>
  </hidden>|<\shown>
    \;

    \;

    \;

    \;

    <\padded-center>
      <section|Examples>
    </padded-center>
  </shown>|<\hidden>
    <tit|Consider a network>

    \;

    \;

    <\padded-center>
      <with|gr-mode|<tuple|edit|math-at>|gr-frame|<tuple|scale|1cm|<tuple|0.5gw|0.5gh>>|gr-geometry|<tuple|geometry|1par|35em|center>|gr-arrow-end|\<gtr\>|gr-grid|<tuple|cartesian|<point|0|0>|1>|gr-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|logarithmic|<point|0|0>|1|10>|gr-edit-grid-old|<tuple|logarithmic|<point|0|0>|1|10>|gr-auto-crop|true|gr-grid-aspect|<tuple|<tuple|axes|#e0e0ff>|<tuple|1|#e0e0ff>|<tuple|10|#e0e0ff>>|gr-grid-aspect-props|<tuple|<tuple|axes|#e0e0ff>|<tuple|1|#e0e0ff>|<tuple|2|#e0e0ff>>|<graphics||<point|-3.26927|2.97139>|<point|-3.26927|2.23055>|<with|magnify|0.424955665245609|<carc|<point|1.01041904683899|3.63297429882146>|<point|1.22629978152163|3.57001003685703>|<point|1.13635017649545|3.66895460238585>>>|<gr-group|<with|magnify|0.424955665245609|<carc|<point|-1.11867984891285|3.5841636542371>|<point|-0.902799114230211|3.52119939227267>|<point|-0.99274871925639|3.62014395780149>>>>|<with|arrow-end|\<gtr\>|<line|<point|-3.07876|3.44765>|<point|-1.16316642413018|3.47939542267496>>>|<with|arrow-end|\<gtr\>|<line|<point|-0.856248|3.46881>|<point|0.979640342481652|3.52411061528075>>>|<point|-3.2481|2.63272>|<point|-3.29043|4.13557>|<point|-3.26927|3.77573>|<point|-3.27985|4.41074>|<point|-1.05733|4.42132>|<point|-1.06791|4.14615>|<point|-1.06791|3.86039>|<point|1.03818|3.81806>|<point|1.05935|4.10382>|<point|1.0276|4.42132>|<point|1.13343|2.34697>|<point|1.13343|2.67506>|<point|1.12285|3.03489>|<point|-1.05733|2.35755>|<point|-1.05733|2.68564>|<point|-1.04675|2.96081>|<math-at|x<rsub|k>|<point|-3.533850377034|3.41589495965075>>|<math-at|<with|color|magenta|w<rsup|<around*|(|1|)>><rsub|i
      k>>|<point|-2.40142545310226|3.70164704325969>>|<math-at|<with|color|magenta|w<rsup|<around*|(|2|)>><rsub|j
      i>>|<point|-0.27416|3.77574653657891>>|<math-at|l|<point|2.6468613573224|3.41589495965075>>|<with|arrow-end|\<gtr\>|<line|<point|1.27214852876846|3.52657428231248>|<point|2.52930281783305|3.53838139965604>>>|<math-at|n<rsub|i><rsup|<around*|(|1|)>>|<point|-1.9569222119328|2.98197512898532>>|<math-at|o<rsub|i><rsup|<around*|(|1|)>>|<point|-0.835080698505093|2.97139171848128>>|<math-at|n<rsub|j><rsup|<around*|(|2|)>>|<point|0.382011509458923|3.05605900251356>>|<math-at|o<rsub|j><rsup|<around*|(|2|)>>|<point|1.30276822330996|3.14072628654584>>>>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Functions>

    \;

    <\equation*>
      x<rsub|k><long-arrow|\<rubber-rightarrow\>|<with|color|magenta|w<rsub|i
      k><rsup|<around*|(|1|)>>>><with|color|<pattern|/usr/share/TeXmacs/misc/patterns/vintage/granite-dark.png||>|<block|<tformat|<cwith|1|1|1|1|cell-background|yellow>|<table|<row|<cell|n<rsub|i><rsup|<around*|(|1|)>><long-arrow|\<rubber-rightarrow\>|\<sigma\>>o<rsub|i><rsup|<around*|(|1|)>>>>>>><rotate|45|>><long-arrow|\<rubber-rightarrow\>|<with|color|magenta|w<rsub|j
      i><rsup|<around*|(|2|)>>>><tabular|<tformat|<cwith|1|1|1|1|cell-background|yellow>|<table|<row|<cell|n<rsub|j><rsup|<around*|(|2|)>><long-arrow|\<rubber-rightarrow\>|\<sigma\>>o<rsub|j><rsup|<around*|(|2|)>>>>>>>\<rightarrow\>l
    </equation*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|n<rsub|i><rsup|<around*|(|1|)>>>|<cell|=>|<cell|<big|sum><rsub|k>w<rsub|i
      k><rsup|<around*|(|1|)>>x<rsub|k>>>|<row|<cell|o<rsub|i><rsup|<around*|(|1|)>>>|<cell|=>|<cell|\<sigma\><around*|(|n<rsub|i><rsup|<around*|(|1|)>>|)>>>|<row|<cell|n<rsub|j><rsup|<around*|(|2|)>>>|<cell|=>|<cell|<big|sum><rsub|i>w<rsub|j
      i><rsup|<around*|(|2|)>>o<rsub|i>>>|<row|<cell|o<rsub|j><rsup|<around*|(|2|)>>>|<cell|=>|<cell|\<sigma\><around*|(|n<rsub|j><rsup|<around*|(|2|)>>|)>>>|<row|<cell|l>|<cell|=>|<cell|<big|sum><rsub|j><frac|1|2><around*|(|o<rsup|<around*|(|2|)>><rsub|j>-t<rsub|j>|)><rsup|2>>>|<row|<cell|>|<cell|>|<cell|>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Computing>

    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|l>|<cell|=>|<cell|<big|sum><rsub|j><frac|1|2><stack|<tformat|<cwith|1|1|1|1|cell-background|pastel
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
      brown>|<table|<row|<cell|<wide|<with|color|black|x<rsub|k>>|\<wide-sqoverbrace\>><rsup|<around*|(|1|)>>>>>>>>|\<wide-sqoverbrace\>><rsup|<around*|(|2|)>>>>>>>|\<wide-sqoverbrace\>><rsup|<around*|(|3|)>>>>>>>><around*|\<nobracket\>||)>|\<wide-squnderbrace\>><rsub|<around*|(|4|)>>>>>>>>>|\<wide-squnderbrace\>><rsub|<around*|(|5|)>>>>>>>|\<wide-sqoverbrace\>><rsup|*<around*|(|6|)>>>>>>><around*|\<nobracket\>||)>|\<wide-squnderbrace\>><rsub|<around*|(|7|)>>>>>>>>-t<rsub|j><around*|\<nobracket\>||)><rsup|2>|\<wide-squnderbrace\>><rsub|<around*|(|8|)>>>>>>>>>|<row|<cell|>|<cell|>|<cell|>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|l>|<cell|=>|<cell|<big|sum><rsub|j><frac|1|2><wide*|<around*|(||\<nobracket\>><with|color|blue|<wide*|<with|color|black|\<sigma\>><around*|(||\<nobracket\>><wide|<with|color|black|<big|sum><rsub|i>><wide*|<with|color|dark
      yellow|<with|color|black|w<rsub|j i><rsup|<around*|(|2|)>>><with|color|dark
      orange|<wide*|<with|color|black|\<sigma\>><around*|(||\<nobracket\>><with|color|orange|<wide|<with|color|black|<big|sum><rsub|k>><wide|<with|color|black|w<rsub|i
      k><rsup|<around*|(|1|)>>><with|color|magenta|<wide|<with|color|black|x<rsub|k>>|\<wide-sqoverbrace\>><rsup|<around*|(|1|)>>>|\<wide-sqoverbrace\>><rsup|<around*|(|2|)>>|\<wide-sqoverbrace\>><rsup|<around*|(|3|)>>><around*|\<nobracket\>||)>|\<wide-squnderbrace\>><rsub|<around*|(|4|)>>>>|\<wide-squnderbrace\>><rsub|<around*|(|5|)>>|\<wide-sqoverbrace\>><rsup|*<around*|(|6|)>><around*|\<nobracket\>||)>|\<wide-squnderbrace\>><rsub|<around*|(|7|)>>>-t<rsub|j><around*|\<nobracket\>||)><rsup|2>|\<wide-squnderbrace\>><rsub|<around*|(|8|)>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Grad>

    \;

    \;

    \;

    <\equation*>
      x<rsub|k><long-arrow|\<rubber-rightarrow\>|<with|color|magenta|\<mathd\>w<rsub|i
      k><rsup|<around*|(|1|)>>>><with|color|<pattern|/usr/share/TeXmacs/misc/patterns/vintage/granite-dark.png||>|<block|<tformat|<cwith|1|1|1|1|cell-background|yellow>|<table|<row|<cell|\<mathd\>n<rsub|i><rsup|<around*|(|1|)>><long-arrow|\<rubber-rightarrow\>|<wide|\<sigma\>|\<dot\>>>\<mathd\>o<rsub|i><rsup|<around*|(|1|)>>>>>>><rotate|45|>><long-arrow|\<rubber-rightarrow\>|<with|color|magenta|w<rsub|j
      i><rsup|<around*|(|2|)>>>><tabular|<tformat|<cwith|1|1|1|1|cell-background|yellow>|<table|<row|<cell|\<mathd\>n<rsub|j><rsup|<around*|(|2|)>><long-arrow|\<rubber-rightarrow\>|<wide|\<sigma\>|\<dot\>>>\<mathd\>o<rsub|j><rsup|<around*|(|2|)>>>>>>>\<rightarrow\>\<mathd\>l
    </equation*>

    \;
  </hidden>|<\hidden>
    <\eqnarray*>
      <tformat|<table|<row|<cell|\<mathd\>n<rsub|i><rsup|<around*|(|1|)>>>|<cell|=>|<cell|<big|sum><rsub|k><frac|\<partial\>n<rsub|i><rsup|<around*|(|1|)>>|\<partial\>w<rsub|i
      k><rsup|<around*|(|1|)>>>\<mathd\>w<rsub|i
      k><rsup|<around*|(|1|)>>=<with|color|dark
      cyan|<big|sum><rsub|k>x<rsub|k>>\<mathd\>w<rsub|i
      k><rsup|<around*|(|1|)>>>>|<row|<cell|\<mathd\>o<rsub|i><rsup|<around*|(|1|)>>>|<cell|=>|<cell|<with|color|dark
      blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|i><rsup|<around*|(|1|)>>>>\<mathd\>n<rsub|i><rsup|<around*|(|1|)>>>>|<row|<cell|\<mathd\>n<rsub|j><rsup|<around*|(|2|)>>>|<cell|=>|<cell|<big|sum><rsub|i><frac|\<partial\>n<rsub|j><rsup|<around*|(|2|)>>|\<partial\>o<rsub|i><rsup|<around*|(|1|)>>>\<mathd\>o<rsub|i><rsup|<around*|(|1|)>>=<with|color|brown|<big|sum><rsub|i>w<rsub|j
      i><rsup|<around*|(|2|)>>>\<mathd\>o<rsub|i><rsup|<around*|(|1|)>>>>|<row|<cell|\<mathd\>o<rsub|j><rsup|<around*|(|2|)>>>|<cell|=>|<cell|<with|color|blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|j><rsup|<around*|(|2|)>>>>\<mathd\>n<rsub|j><rsup|<around*|(|2|)>>>>|<row|<cell|\<mathd\>l>|<cell|=>|<cell|<big|sum><rsub|j><frac|\<partial\>l|\<partial\>o<rsub|j><rsup|<around*|(|2|)>>>\<mathd\>o<rsub|j><rsup|<around*|(|2|)>>=<with|color|red|<big|sum><rsub|j><with|color|dark
      yellow|<around*|(|o<rsub|j><rsup|<around*|(|2|)>>-t<rsub|j>|)>>>\<mathd\>o<rsub|j><rsup|<around*|(|2|)>>>>|<row|<cell|>|<cell|=>|<cell|<with|color|red|<big|sum><rsub|j><with|color|dark
      yellow|<around*|(|o<rsub|j><rsup|<around*|(|2|)>>-t<rsub|j>|)>>><with|color|blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|j><rsup|<around*|(|2|)>>>><with|color|brown|<big|sum><rsub|i>w<rsub|j
      i><rsup|<around*|(|2|)>>><with|color|dark
      blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|i><rsup|<around*|(|1|)>>>><with|color|dark
      cyan|<big|sum><rsub|k>x<rsub|k>>\<mathd\>w<rsub|i
      k><rsup|<around*|(|1|)>>>>>>
    </eqnarray*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|>|<cell|>|<cell|>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Forward>

    \;

    \;

    <\equation*>
      <frac|\<partial\>l|\<partial\>w<rsub|i<rprime|'>k<rprime|'>><rsup|<around*|(|1|)>>>=<with|color|red|<big|sum><rsub|j><around*|{|<with|color|dark
      yellow|<around*|(|o<rsub|j><rsup|<around*|(|2|)>>-t<rsub|j>|)>><around*|{|<with|color|blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|j><rsup|<around*|(|2|)>>>><around*|{|<with|color|brown|w<rsub|j
      i<rprime|'>><rsup|<around*|(|2|)>>><around*|{|<with|color|dark
      blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|i<rprime|'>><rsup|<around*|(|1|)>>>><with|color|dark
      cyan|<with|color|red|<around*|{|<with|color|dark
      cyan|x<rsub|k<rprime|'>>>|}>>><rsub|<around*|\<langle\>|1|\<rangle\>>>|}><rsub|<around*|\<langle\>|2|\<rangle\>>>|}><rsub|<around*|\<langle\>|3|\<rangle\>>>|}><rsub|<around*|\<langle\>|4|\<rangle\>>>|}><rsub|<around*|\<langle\>|5|\<rangle\>>>>
    </equation*>

    \;
  </hidden>|<\hidden>
    \;

    \;

    \;

    <\equation*>
      <frac|\<partial\>l|\<partial\>w<rsub|i<rprime|'>k<rprime|'>><rsup|<around*|(|1|)>>>=<with|color|red|<big|sum><rsub|j><wide|<with|color|dark
      yellow|<around*|(|o<rsub|j><rsup|<around*|(|2|)>>-t<rsub|j>|)>><wide*|<with|color|blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|j><rsup|<around*|(|2|)>>><wide|w<rsub|j
      i<rprime|'>><rsup|<around*|(|2|)>><wide*|<with|color|dark
      blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|i<rprime|'>><rsup|<around*|(|1|)>>>><wide|<with|color|dark
      cyan|x<rsub|k<rprime|'>>>|\<wide-sqoverbrace\>><rsup|<around*|(|1|)>>|\<wide-squnderbrace\>><rsub|<around*|(|2|)>>|\<wide-sqoverbrace\>><rsup|<around*|(|3|)>>>|\<wide-squnderbrace\>><rsub|<around*|(|4|)>>|\<wide-sqoverbrace\>><rsup|<around*|(|5|)>>>
    </equation*>

    \;

    \;
  </hidden>|<\hidden>
    \;

    \;

    \;

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
  </hidden>|<\hidden>
    <tit|Reverse>

    <\equation*>
      <frac|\<partial\>l|\<partial\>w<rsub|i<rprime|'>k<rprime|'>><rsup|<around*|(|1|)>>>=<wide|<wide*|<with|color|red|<big|sum><rsub|j><wide|<wide*|<wide|<with|color|dark
      yellow|<around*|(|o<rsub|j><rsup|<around*|(|2|)>>-t<rsub|j>|)>>|\<wide-sqoverbrace\>><rsup|<around*|(|1|)>><with|color|blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|j><rsup|<around*|(|2|)>>>>|\<wide-squnderbrace\>><rsub|<around*|(|2|)>><with|color|brown|w<rsub|j
      i<rprime|'>><rsup|<around*|(|2|)>>>|\<wide-sqoverbrace\>><rsup|<around*|(|3|)>>>|\<wide-squnderbrace\>><rsub|<around*|(|4|)>><with|color|dark
      blue|<around*|\<nobracket\>|<frac|\<mathd\>\<sigma\><around*|(|x|)>|\<mathd\>x>|\|><rsub|x=n<rsub|i<rprime|'>><rsup|<around*|(|1|)>>>>|\<wide-sqoverbrace\>><rsup|<around*|(|5|)>><with|color|dark
      cyan|x<rsub|k<rprime|'>>>
    </equation*>

    \;

    \;
  </hidden>|<\hidden>
    \;

    \;

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
  </hidden>|<\hidden>
    <tit|Another example graph>

    \;

    <\session|dot|default>
      <\unfolded-io>
        dot]\ 
      <|unfolded-io>
        digraph finite_state_machine {

        \ \ \ \ \ \ \ \ rankdir=LR;node[shape=none] ; \ \ output

        \ \ \ \ \ \ \ \ node [shape = circle];

        \ \ \ 1-\<gtr\>2;2-\<gtr\>3;3-\<gtr\>4;3-\<gtr\>5;4-\<gtr\>6;5-\<gtr\>6;6-\<gtr\>7;

        }
      <|unfolded-io>
        <image|<tuple|<#252150532D41646F62652D332E3020455053462D332E300A252543726561746F723A20677261706876697A2076657273696F6E2031322E312E31202830290A25255469746C653A2066696E6974655F73746174655F6D616368696E650A252550616765733A20310A2525426F756E64696E67426F783A20333620333620343637203136310A2525456E64436F6D6D656E74730A736176650A2525426567696E50726F6C6F670A2F446F7444696374203230302064696374206465660A446F744469637420626567696E0A0A2F73657475704C6174696E31207B0A6D61726B0A2F456E636F64696E67566563746F7220323536206172726179206465660A20456E636F64696E67566563746F7220300A0A49534F4C6174696E31456E636F64696E6720302032353520676574696E74657276616C20707574696E74657276616C0A456E636F64696E67566563746F72203435202F68797068656E207075740A0A25205365742075702049534F204C6174696E20312063686172616374657220656E636F64696E670A2F737461726E657449534F207B0A2020202020202020647570206475702066696E64666F6E7420647570206C656E677468206469637420626567696E0A20202020202020207B203120696E646578202F464944206E65207B20646566207D7B20706F7020706F70207D206966656C73650A20202020202020207D20666F72616C6C0A20202020202020202F456E636F64696E6720456E636F64696E67566563746F72206465660A202020202020202063757272656E746469637420656E6420646566696E65666F6E740A7D206465660A2F54696D65732D526F6D616E20737461726E657449534F206465660A2F54696D65732D4974616C696320737461726E657449534F206465660A2F54696D65732D426F6C6420737461726E657449534F206465660A2F54696D65732D426F6C644974616C696320737461726E657449534F206465660A2F48656C76657469636120737461726E657449534F206465660A2F48656C7665746963612D4F626C6971756520737461726E657449534F206465660A2F48656C7665746963612D426F6C6420737461726E657449534F206465660A2F48656C7665746963612D426F6C644F626C6971756520737461726E657449534F206465660A2F436F757269657220737461726E657449534F206465660A2F436F75726965722D4F626C6971756520737461726E657449534F206465660A2F436F75726965722D426F6C6420737461726E657449534F206465660A2F436F75726965722D426F6C644F626C6971756520737461726E657449534F206465660A636C656172746F6D61726B0A7D2062696E64206465660A0A2525426567696E5265736F757263653A2070726F6373657420677261706876697A203020300A2F636F6F72642D666F6E742D66616D696C79202F54696D65732D526F6D616E206465660A2F64656661756C742D666F6E742D66616D696C79202F54696D65732D526F6D616E206465660A2F636F6F7264666F6E7420636F6F72642D666F6E742D66616D696C792066696E64666F6E742038207363616C65666F6E74206465660A0A2F496E765363616C65466163746F7220312E30206465660A2F7365745F7363616C65207B0A202020202020206475702031206578636820646976202F496E765363616C65466163746F722065786368206465660A202020202020207363616C650A7D2062696E64206465660A0A25207374796C65730A2F736F6C6964207B205B5D20302073657464617368207D2062696E64206465660A2F646173686564207B205B3920496E765363616C65466163746F72206D756C20647570205D20302073657464617368207D2062696E64206465660A2F646F74746564207B205B3120496E765363616C65466163746F72206D756C203620496E765363616C65466163746F72206D756C5D20302073657464617368207D2062696E64206465660A2F696E766973207B2F66696C6C207B6E6577706174687D20646566202F7374726F6B65207B6E6577706174687D20646566202F73686F77207B706F70206E6577706174687D206465667D2062696E64206465660A2F626F6C64207B2032207365746C696E657769647468207D2062696E64206465660A2F66696C6C6564207B207D2062696E64206465660A2F756E66696C6C6564207B207D2062696E64206465660A2F726F756E646564207B207D2062696E64206465660A2F646961676F6E616C73207B207D2062696E64206465660A2F74617065726564207B207D2062696E64206465660A0A2520686F6F6B7320666F722073657474696E6720636F6C6F72200A2F6E6F6465636F6C6F72207B20736574687362636F6C6F72207D2062696E64206465660A2F65646765636F6C6F72207B20736574687362636F6C6F72207D2062696E64206465660A2F6772617068636F6C6F72207B20736574687362636F6C6F72207D2062696E64206465660A2F6E6F70636F6C6F72207B706F7020706F7020706F707D2062696E64206465660A0A2F626567696E70616765207B09252069206A206E70616765730A092F6E70616765732065786368206465660A092F6A2065786368206465660A092F692065786368206465660A092F73747220313020737472696E67206465660A096E70616765732031206774207B0A090967736176650A090909636F6F7264666F6E7420736574666F6E740A090909302030206D6F7665746F0A090909285C28292073686F77206920737472206376732073686F7720282C292073686F77206A20737472206376732073686F7720285C29292073686F770A090967726573746F72650A097D2069660A7D2062696E64206465660A0A2F7365745F666F6E74207B0A0966696E64666F6E7420657863680A097363616C65666F6E7420736574666F6E740A7D206465660A0A25206472617720746578742066697474656420746F206974732065787065637465642077696474680A2F616C69676E656474657874207B0909092520776964746820746578740A092F746578742065786368206465660A092F77696474682065786368206465660A0967736176650A090977696474682030206774207B0A0909095B5D203020736574646173680A0909097465787420737472696E67776964746820706F702077696474682065786368207375622074657874206C656E6774682064697620302074657874206173686F770A09097D2069660A0967726573746F72650A7D206465660A0A2F626F787072696D207B09090909252078636F726E65722079636F726E6572207873697A65207973697A650A090934203220726F6C6C0A09096D6F7665746F0A09093220636F70790A090965786368203020726C696E65746F0A090930206578636820726C696E65746F0A0909706F70206E6567203020726C696E65746F0A0909636C6F7365706174680A7D2062696E64206465660A0A2F656C6C697073655F70617468207B0A092F72792065786368206465660A092F72782065786368206465660A092F792065786368206465660A092F782065786368206465660A096D61747269782063757272656E746D61747269780A096E6577706174680A09782079207472616E736C6174650A097278207279207363616C650A093020302031203020333630206172630A097365746D61747269780A7D2062696E64206465660A0A2F656E6470616765207B2073686F7770616765207D2062696E64206465660A2F73686F7770616765207B207D206465660A0A2F6C61796572636F6C6F727365710A095B0925206C6179657220636F6C6F722073657175656E6365202D206461726B65737420746F206C696768746573740A09095B30203020305D0A09095B2E32202E38202E385D0A09095B2E34202E38202E385D0A09095B2E36202E38202E385D0A09095B2E38202E38202E385D0A095D0A6465660A0A2F6C617965726C656E206C61796572636F6C6F72736571206C656E677468206465660A0A2F7365746C61796572207B2F6D61786C61796572206578636820646566202F6375726C617965722065786368206465660A096C61796572636F6C6F72736571206375726C61796572203120737562206C617965726C656E206D6F64206765740A09616C6F616420706F7020736574687362636F6C6F720A092F6E6F6465636F6C6F72207B6E6F70636F6C6F727D206465660A092F65646765636F6C6F72207B6E6F70636F6C6F727D206465660A092F6772617068636F6C6F72207B6E6F70636F6C6F727D206465660A7D2062696E64206465660A0A2F6F6E6C61796572207B206375726C61796572206E65207B696E7669737D206966207D206465660A0A2F6F6E6C6179657273207B0A092F6D7975707065722065786368206465660A092F6D796C6F7765722065786368206465660A096375726C61796572206D796C6F776572206C740A096375726C61796572206D7975707065722067740A096F720A097B696E7669737D2069660A7D206465660A0A2F6375726C617965722030206465660A0A2525456E645265736F757263650A2525456E6450726F6C6F670A2525426567696E53657475700A31342064656661756C742D666F6E742D66616D696C79207365745F666F6E740A25202F6172726F776C656E677468203130206465660A25202F6172726F7777696474682035206465660A0A25206D616B652073757265207064666D61726B206973206861726D6C65737320666F722050532D696E74657270726574657273206F74686572207468616E2044697374696C6C65720A2F7064666D61726B207768657265207B706F707D207B7573657264696374202F7064666D61726B202F636C656172746F6D61726B206C6F6164207075747D206966656C73650A25206D616B6520273C3C2720616E6420273E3E272073616665206F6E205053204C6576656C203120646576696365730A2F6C616E67756167656C6576656C207768657265207B706F70206C616E67756167656C6576656C7D7B317D206966656C73650A32206C74207B0A20202020757365726469637420283C3C292063766E20285B292063766E206C6F6164207075740A20202020757365726469637420283E3E292063766E20285B292063766E206C6F6164207075740A7D2069660A0A2525456E6453657475700A73657475704C6174696E310A2525506167653A203120310A252550616765426F756E64696E67426F783A20333620333620343637203136310A2525506167654F7269656E746174696F6E3A20506F7274726169740A302030203120626567696E706167650A67736176650A3336203336203433312031323520626F787072696D20636C6970206E6577706174680A312031207365745F7363616C65203020726F74617465203430203430207472616E736C6174650A25206F75747075740A67736176650A3020302030206E6F6465636F6C6F720A3134202F54696D65732D526F6D616E207365745F666F6E740A382031332E333235206D6F7665746F2034372E323520286F75747075742920616C69676E6564746578740A67726573746F72650A2520310A67736176650A31207365746C696E6577696474680A3020302030206E6F6465636F6C6F720A33312E36323520373220313820313820656C6C697073655F70617468207374726F6B650A3020302030206E6F6465636F6C6F720A3134202F54696D65732D526F6D616E207365745F666F6E740A32372E3132352036372E333235206D6F7665746F20392028312920616C69676E6564746578740A67726573746F72650A2520320A67736176650A31207365746C696E6577696474680A3020302030206E6F6465636F6C6F720A3131372E323520373220313820313820656C6C697073655F70617468207374726F6B650A3020302030206E6F6465636F6C6F720A3134202F54696D65732D526F6D616E207365745F666F6E740A3131322E37352036372E333235206D6F7665746F20392028322920616C69676E6564746578740A67726573746F72650A2520312D3E320A67736176650A31207365746C696E6577696474680A30203020302065646765636F6C6F720A6E6577706174682034392E393532203732206D6F7665746F0A36302E3832382037322037352E3131372037322038372E363434203732206375727665746F0A7374726F6B650A30203020302065646765636F6C6F720A6E6577706174682038372E3433322037352E35206D6F7665746F0A39372E343331203732206C696E65746F0A38372E3433312036382E35206C696E65746F0A636C6F7365706174682066696C6C0A31207365746C696E6577696474680A736F6C69640A30203020302065646765636F6C6F720A6E6577706174682038372E3433322037352E35206D6F7665746F0A39372E343331203732206C696E65746F0A38372E3433312036382E35206C696E65746F0A636C6F736570617468207374726F6B650A67726573746F72650A2520330A67736176650A31207365746C696E6577696474680A3020302030206E6F6465636F6C6F720A3138392E323520373220313820313820656C6C697073655F70617468207374726F6B650A3020302030206E6F6465636F6C6F720A3134202F54696D65732D526F6D616E207365745F666F6E740A3138342E37352036372E333235206D6F7665746F20392028332920616C69676E6564746578740A67726573746F72650A2520322D3E330A67736176650A31207365746C696E6577696474680A30203020302065646765636F6C6F720A6E657770617468203133352E353533203732206D6F7665746F0A3134322E383433203732203135312E353234203732203135392E373134203732206375727665746F0A7374726F6B650A30203020302065646765636F6C6F720A6E657770617468203135392E3633322037352E35206D6F7665746F0A3136392E363332203732206C696E65746F0A3135392E3633322036382E35206C696E65746F0A636C6F7365706174682066696C6C0A31207365746C696E6577696474680A736F6C69640A30203020302065646765636F6C6F720A6E657770617468203135392E3633322037352E35206D6F7665746F0A3136392E363332203732206C696E65746F0A3135392E3633322036382E35206C696E65746F0A636C6F736570617468207374726F6B650A67726573746F72650A2520340A67736176650A31207365746C696E6577696474680A3020302030206E6F6465636F6C6F720A3236312E323520393920313820313820656C6C697073655F70617468207374726F6B650A3020302030206E6F6465636F6C6F720A3134202F54696D65732D526F6D616E207365745F666F6E740A3235362E37352039342E333235206D6F7665746F20392028342920616C69676E6564746578740A67726573746F72650A2520332D3E340A67736176650A31207365746C696E6577696474680A30203020302065646765636F6C6F720A6E657770617468203230362E3438352037382E323632206D6F7665746F0A3231342E3532352038312E333633203232342E34342038352E313838203233332E3535372038382E373034206375727665746F0A7374726F6B650A30203020302065646765636F6C6F720A6E657770617468203233322E3130312039312E383934206D6F7665746F0A3234322E3639312039322E323237206C696E65746F0A3233342E36322038352E333633206C696E65746F0A636C6F7365706174682066696C6C0A31207365746C696E6577696474680A736F6C69640A30203020302065646765636F6C6F720A6E657770617468203233322E3130312039312E383934206D6F7665746F0A3234322E3639312039322E323237206C696E65746F0A3233342E36322038352E333633206C696E65746F0A636C6F736570617468207374726F6B650A67726573746F72650A2520350A67736176650A31207365746C696E6577696474680A3020302030206E6F6465636F6C6F720A3236312E323520343520313820313820656C6C697073655F70617468207374726F6B650A3020302030206E6F6465636F6C6F720A3134202F54696D65732D526F6D616E207365745F666F6E740A3235362E37352034302E333235206D6F7665746F20392028352920616C69676E6564746578740A67726573746F72650A2520332D3E350A67736176650A31207365746C696E6577696474680A30203020302065646765636F6C6F720A6E657770617468203230362E3438352036352E373338206D6F7665746F0A3231342E3532352036322E363337203232342E34342035382E383132203233332E3535372035352E323936206375727665746F0A7374726F6B650A30203020302065646765636F6C6F720A6E657770617468203233342E36322035382E363337206D6F7665746F0A3234322E3639312035312E373733206C696E65746F0A3233322E3130312035322E313036206C696E65746F0A636C6F7365706174682066696C6C0A31207365746C696E6577696474680A736F6C69640A30203020302065646765636F6C6F720A6E657770617468203233342E36322035382E363337206D6F7665746F0A3234322E3639312035312E373733206C696E65746F0A3233322E3130312035322E313036206C696E65746F0A636C6F736570617468207374726F6B650A67726573746F72650A2520360A67736176650A31207365746C696E6577696474680A3020302030206E6F6465636F6C6F720A3333332E323520373220313820313820656C6C697073655F70617468207374726F6B650A3020302030206E6F6465636F6C6F720A3134202F54696D65732D526F6D616E207365745F666F6E740A3332382E37352036372E333235206D6F7665746F20392028362920616C69676E6564746578740A67726573746F72650A2520342D3E360A67736176650A31207365746C696E6577696474680A30203020302065646765636F6C6F720A6E657770617468203237382E3438352039322E373338206D6F7665746F0A3238362E3532352038392E363337203239362E34342038352E383132203330352E3535372038322E323936206375727665746F0A7374726F6B650A30203020302065646765636F6C6F720A6E657770617468203330362E36322038352E363337206D6F7665746F0A3331342E3639312037382E373733206C696E65746F0A3330342E3130312037392E313036206C696E65746F0A636C6F7365706174682066696C6C0A31207365746C696E6577696474680A736F6C69640A30203020302065646765636F6C6F720A6E657770617468203330362E36322038352E363337206D6F7665746F0A3331342E3639312037382E373733206C696E65746F0A3330342E3130312037392E313036206C696E65746F0A636C6F736570617468207374726F6B650A67726573746F72650A2520352D3E360A67736176650A31207365746C696E6577696474680A30203020302065646765636F6C6F720A6E657770617468203237382E3438352035312E323632206D6F7665746F0A3238362E3532352035342E333633203239362E34342035382E313838203330352E3535372036312E373034206375727665746F0A7374726F6B650A30203020302065646765636F6C6F720A6E657770617468203330342E3130312036342E383934206D6F7665746F0A3331342E3639312036352E323237206C696E65746F0A3330362E36322035382E333633206C696E65746F0A636C6F7365706174682066696C6C0A31207365746C696E6577696474680A736F6C69640A30203020302065646765636F6C6F720A6E657770617468203330342E3130312036342E383934206D6F7665746F0A3331342E3639312036352E323237206C696E65746F0A3330362E36322035382E333633206C696E65746F0A636C6F736570617468207374726F6B650A67726573746F72650A2520370A67736176650A31207365746C696E6577696474680A3020302030206E6F6465636F6C6F720A3430352E323520373220313820313820656C6C697073655F70617468207374726F6B650A3020302030206E6F6465636F6C6F720A3134202F54696D65732D526F6D616E207365745F666F6E740A3430302E37352036372E333235206D6F7665746F20392028372920616C69676E6564746578740A67726573746F72650A2520362D3E370A67736176650A31207365746C696E6577696474680A30203020302065646765636F6C6F720A6E657770617468203335312E353533203732206D6F7665746F0A3335382E383433203732203336372E353234203732203337352E373134203732206375727665746F0A7374726F6B650A30203020302065646765636F6C6F720A6E657770617468203337352E3633322037352E35206D6F7665746F0A3338352E363332203732206C696E65746F0A3337352E3633322036382E35206C696E65746F0A636C6F7365706174682066696C6C0A31207365746C696E6577696474680A736F6C69640A30203020302065646765636F6C6F720A6E657770617468203337352E3633322037352E35206D6F7665746F0A3338352E363332203732206C696E65746F0A3337352E3633322036382E35206C696E65746F0A636C6F736570617468207374726F6B650A67726573746F72650A656E64706167650A73686F77706167650A67726573746F72650A252550616765547261696C65720A2525456E64506167653A20310A2525547261696C65720A656E640A726573746F72650A2525454F460A>|ps>|0.618par|||>
      </unfolded-io>

      <\input>
        dot]\ 
      <|input>
        \;
      </input>
    </session>
  </hidden>|<\hidden>
    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|f<rsub|2>>|<cell|\<leftarrow\>>|<cell|w<rsub|21>f<rsub|1>>>|<row|<cell|f<rsub|3>>|<cell|\<leftarrow\>>|<cell|\<sigma\><around*|(|f<rsub|2>|)>>>|<row|<cell|f<rsub|4>>|<cell|\<leftarrow\>>|<cell|w<rsub|43>f<rsub|3>>>|<row|<cell|f<rsub|5>>|<cell|\<leftarrow\>>|<cell|w<rsub|53>f<rsub|3>>>|<row|<cell|f<rsub|6>>|<cell|\<leftarrow\>>|<cell|f<rsub|4>+f<rsub|5>>>|<row|<cell|f<rsub|7>>|<cell|\<leftarrow\>>|<cell|\<sigma\><around*|(|f<rsub|6>|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Grad>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|f<rsub|7><around*|(|f<rsub|1>|)>>|<cell|=>|<cell|f<rsub|7><around*|(|f<rsub|6><around*|(|f<rsub|4><around*|(|<tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      magenta>|<table|<row|<cell|f<rsub|3><around*|(|f<rsub|2><around*|(|f<rsub|1>|)>|)>>>>>>|)>,f<rsub|5><around*|(|<tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      magenta>|<table|<row|<cell|f<rsub|3><around*|(|f<rsub|2><around*|(|f<rsub|1>|)>|)>>>>>>|)>|)>|)>>>|<row|<cell|<frac|\<partial\>f<rsub|7>|\<partial\>w<rsub|21>>>|<cell|=>|<cell|<frac|\<partial\>f<rsub|7>|\<partial\>f<rsub|6>>\<cdummy\><around*|(|<frac|\<partial\>f<rsub|6>|\<partial\>f<rsub|4>>\<cdummy\><frac|\<partial\>f<rsub|4>|\<partial\>f<rsub|3>>\<cdummy\><frac|\<partial\>f<rsub|3>|\<partial\>f<rsub|2>>\<cdummy\><frac|\<partial\>f<rsub|2>|\<partial\>w<rsub|21>>+<frac|\<partial\>f<rsub|6>|\<partial\>f<rsub|5>>\<cdummy\><frac|\<partial\>f<rsub|5>|\<partial\>f<rsub|3>>\<cdummy\><frac|\<partial\>f<rsub|3>|\<partial\>f<rsub|2>>\<cdummy\><frac|\<partial\>f<rsub|2>|\<partial\>w<rsub|21>>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<partial\>f<rsub|7>|\<partial\>f<rsub|6>><around*|(|<frac|\<partial\>f<rsub|6>|\<partial\>f<rsub|4>>\<cdummy\><frac|\<partial\>f<rsub|4>|\<partial\>f<rsub|3>>+<frac|\<partial\>f<rsub|6>|\<partial\>f<rsub|5>>\<cdummy\><frac|\<partial\>f<rsub|5>|\<partial\>f<rsub|3>>|)><frac|\<partial\>f<rsub|3>|\<partial\>f<rsub|2>>\<cdummy\><frac|\<partial\>f<rsub|2>|\<partial\>w<rsub|21>>>>>>
    </eqnarray*>

    \;

    \;
  </hidden>|<\hidden>
    <tit|Forward>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<partial\>f<rsub|7>|\<partial\>w<rsub|21>>>|<cell|=>|<cell|<frac|\<partial\>f<rsub|7>|\<partial\>f<rsub|6>><around*|(|<frac|\<partial\>f<rsub|6>|\<partial\>f<rsub|4>>\<cdummy\><frac|\<partial\>f<rsub|4>|\<partial\>f<rsub|3>>+<frac|\<partial\>f<rsub|6>|\<partial\>f<rsub|5>>\<cdummy\><frac|\<partial\>f<rsub|5>|\<partial\>f<rsub|3>>|)><frac|\<partial\>f<rsub|3>|\<partial\>f<rsub|2>>\<cdummy\><frac|\<partial\>f<rsub|2>|\<partial\>w<rsub|21>>>>|<row|<cell|>|<cell|=>|<cell|<around*|[|<frac|\<partial\>f<rsub|7>|\<partial\>f<rsub|6>><around*|[|<around*|[|<frac|\<partial\>f<rsub|6>|\<partial\>f<rsub|4>>\<cdummy\><around*|[|<frac|\<partial\>f<rsub|4>|\<partial\>f<rsub|3>><around*|[|<tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      magenta>|<table|<row|<cell|<frac|\<partial\>f<rsub|3>|\<partial\>f<rsub|2>>\<cdummy\><frac|\<partial\>f<rsub|2>|\<partial\>w<rsub|21>>>>>>>|]>|]>|]>+<around*|[|<frac|\<partial\>f<rsub|6>|\<partial\>f<rsub|5>><around*|[|<frac|\<partial\>f<rsub|5>|\<partial\>f<rsub|3>><around*|[|<tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      magenta>|<table|<row|<cell|<frac|\<partial\>f<rsub|3>|\<partial\>f<rsub|2>>\<cdummy\><frac|\<partial\>f<rsub|2>|\<partial\>w<rsub|21>>>>>>>|]>|]>|]>|]>|]>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Reverse>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<partial\>f<rsub|7>|\<partial\>w<rsub|21>>>|<cell|=>|<cell|<around*|[|<around*|[|<around*|[|<around*|[|<around*|[|<tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      magenta>|<table|<row|<cell|<frac|\<partial\>f<rsub|7>|\<partial\>f<rsub|6>>>>>>>\<cdummy\><frac|\<partial\>f<rsub|6>|\<partial\>f<rsub|4>>|]>\<cdummy\><frac|\<partial\>f<rsub|4>|\<partial\>f<rsub|3>>|]>+<around*|[|<around*|[|<tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      magenta>|<table|<row|<cell|<frac|\<partial\>f<rsub|7>|\<partial\>f<rsub|6>>>>>>>\<cdummy\><frac|\<partial\>f<rsub|6>|\<partial\>f<rsub|5>>|]>\<cdummy\><frac|\<partial\>f<rsub|5>|\<partial\>f<rsub|3>>|]>|]><frac|\<partial\>f<rsub|3>|\<partial\>f<rsub|2>>|]><frac|\<partial\>f<rsub|2>|\<partial\>w<rsub|21>>|]>>>|<row|<cell|>|<cell|=>|<cell|<around*|[|<tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      magenta>|<table|<row|<cell|\<sigma\><rprime|'>>>>>>\<cdummy\>1\<cdummy\><tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      red>|<table|<row|<cell|<frac|\<partial\>f<rsub|4>|\<partial\>f<rsub|3>>>>>>>+<tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      magenta>|<table|<row|<cell|\<sigma\><rprime|'>>>>>>\<cdummy\>1\<cdummy\><tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      cyan>|<table|<row|<cell|<frac|\<partial\>f<rsub|5>|\<partial\>f<rsub|3>>>>>>>|]><frac|\<partial\>f<rsub|3>|\<partial\>f<rsub|2>><frac|\<partial\>f<rsub|2>|\<partial\>w<rsub|21>>>>|<row|<cell|>|<cell|=>|<cell|<around*|[|<tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      magenta>|<table|<row|<cell|\<sigma\><rprime|'>>>>>>\<cdummy\>1\<cdummy\><tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      red>|<table|<row|<cell|w<rsub|43>>>>>>+<tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      magenta>|<table|<row|<cell|\<sigma\><rprime|'>>>>>>\<cdummy\>1\<cdummy\><tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      cyan>|<table|<row|<cell|w<rsub|53>>>>>>|]><tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      green>|<table|<row|<cell|<frac|\<partial\>f<rsub|3>|\<partial\>f<rsub|2>>>>>>><frac|\<partial\>f<rsub|2>|\<partial\>w<rsub|21>>>>|<row|<cell|>|<cell|=>|<cell|<around*|[|<tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      magenta>|<table|<row|<cell|\<sigma\><rprime|'>>>>>>\<cdummy\>1\<cdummy\><tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      red>|<table|<row|<cell|w<rsub|43>>>>>>+<tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      magenta>|<table|<row|<cell|\<sigma\><rprime|'>>>>>>\<cdummy\>1\<cdummy\><tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      cyan>|<table|<row|<cell|w<rsub|53>>>>>>|]><tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      green>|<table|<row|<cell|\<sigma\><rprime|'>>>>>><tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      yellow>|<table|<row|<cell|<frac|\<partial\>f<rsub|2>|\<partial\>w<rsub|21>>>>>>>>>|<row|<cell|>|<cell|=>|<cell|<around*|[|<tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      magenta>|<table|<row|<cell|\<sigma\><rprime|'>>>>>>\<cdummy\>1\<cdummy\><tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      red>|<table|<row|<cell|w<rsub|43>>>>>>+<tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      magenta>|<table|<row|<cell|\<sigma\><rprime|'>>>>>>\<cdummy\>1\<cdummy\><tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      cyan>|<table|<row|<cell|w<rsub|53>>>>>>|]><tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      green>|<table|<row|<cell|\<sigma\><rprime|'>>>>>><tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      yellow>|<table|<row|<cell|f<rsub|1>>>>>>>>>>
    </eqnarray*>
  </hidden>>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|16:9>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-3|<tuple|3|?>>
    <associate|auto-4|<tuple|4|?>>
    <associate|grad-wij|<tuple|2|?>>
    <associate|linear|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Dual
      number> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Model>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Grad>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Examples>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>