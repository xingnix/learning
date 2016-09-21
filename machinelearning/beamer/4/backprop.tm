<TeXmacs|1.0.7.21>

<style|article>

<\body>
  <doc-data|<doc-title|Back Propogation Explanation>|<doc-author|<author-data|<author-name|Xing
  Chao>|<\author-affiliation>
    xingnix@live.com
  </author-affiliation>>>>

  <section|Scalar <math|f> , <math|w> and <math|x>>

  <subsection|Single layer>

  <\eqnarray*>
    <tformat|<table|<row|<cell|o>|<cell|=>|<cell|f<around*|(|w
    x-b|)>>>|<row|<cell|<frac|d o|d w>>|<cell|=>|<cell|f<rprime|'><frac|d |d
    w><around*|(|w x|)>>>|<row|<cell| >|<cell|=>|<cell|f<rprime|'>x>>|<row|<cell|e>|<cell|=>|<cell|<frac|1|2><around*|(|t-o|)><rsup|2>>>|<row|<cell|<frac|d
    e|d w>>|<cell|=>|<cell|<around*|(|o-t|)><frac|do|d
    w>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|o-t|)>f<rprime|'>x>>|<row|<cell|\<Delta\>w>|<cell|=>|<cell|-\<eta\><frac|d
    e|d w>>>|<row|<cell|>|<cell|=>|<cell|-\<eta\><around*|(|o-t|)>f<rprime|'>x>>>>
  </eqnarray*>

  <subsection|Double layers>

  <\eqnarray*>
    <tformat|<table|<row|<cell|o<rsup|<around*|(|2|)>>>|<cell|=>|<cell|f<rsub|2><around*|(|w<rsup|<around*|(|2|)>>o<rsup|<around*|(|1|)>>-b<rsub|><rsup|<around*|(|2|)>>|)>>>|<row|<cell|o<rsup|<around*|(|1|)>>>|<cell|=>|<cell|f<rsub|1><around*|(|w<rsup|<around*|(|1|)>>x-b<rsup|<around*|(|1|)>>|)>>>|<row|<cell|e>|<cell|=>|<cell|<frac|1|2><around*|(|t-o<rsup|<around*|(|2|)>>|)><rsup|2>>>|<row|<cell|<frac|\<partial\>e|\<partial\>w<rsup|<around*|(|1|)>>>>|<cell|=>|<cell|<frac|\<partial\>e|\<partial\>o<rsup|<around*|(|2|)>>>\<cdummy\><frac|\<partial\>o<rsup|<around*|(|2|)>>|\<partial\>o<rsup|<around*|(|1|)>>>\<cdummy\><frac|\<partial\>o<rsup|<around*|(|1|)>>|\<partial\>w<rsup|<around*|(|1|)>>>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|o<rsup|<around*|(|2|)>>-t|)>f<rsub|2><rprime|'>w<rsup|<around*|(|2|)>>f<rsub|1><rprime|'>x>>|<row|<cell|\<Delta\>w<rsup|<around*|(|1|)>>>|<cell|=>|<cell|-\<eta\><frac|\<partial\>e|\<partial\>w<rsup|<around*|(|1|)>>>>>|<row|<cell|>|<cell|=>|<cell|-\<eta\><around*|(|o<rsup|<around*|(|2|)>>-t|)>f<rsub|2><rprime|'>w<rsup|<around*|(|2|)>>f<rsub|1><rprime|'>x>>>>
  </eqnarray*>

  let\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<delta\><rsup|<around*|(|2|)>>>|<cell|=>|<cell|<around*|(|o<rsup|<around*|(|2|)>>-t|)>f<rprime|'><rsub|2>>>|<row|<cell|\<delta\><rsup|<around*|(|1|)>>>|<cell|=>|<cell|\<delta\><rsup|<around*|(|2|)>>w<rsup|<around*|(|2|)>>f<rprime|'><rsub|1>>>>>
  </eqnarray*>

  then

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<Delta\>w<rsup|<around*|(|1|)>>>|<cell|=>|<cell|-\<eta\>\<delta\><rsup|<around*|(|1|)>>x>>>>
  </eqnarray*>

  <subsection|Multi layers>

  <\eqnarray*>
    <tformat|<table|<row|<cell|o<rsup|<around*|(|i|)>>>|<cell|=>|<cell|f<rsub|i><around*|(|w<rsup|<around*|(|i|)>>o<rsup|<around*|(|i-1|)>>-b<rsub|><rsup|<around*|(|i|)>>|)>>>|<row|<cell|e>|<cell|=>|<cell|<frac|1|2><around*|(|t-o<rsup|<around*|(|n|)>>|)><rsup|2>>>|<row|<cell|<frac|\<partial\>e|\<partial\>w<rsup|<around*|(|i|)>>>>|<cell|=>|<cell|<dfrac|\<partial\>e|\<partial\>o<rsup|<around*|(|n|)>>>\<cdummy\><frac|\<partial\>o<rsup|<around*|(|n|)>>|\<partial\>o<rsup|<around*|(|n-1|)>>>\<cdots\><frac|\<partial\>o<rsup|<around*|(|i|)>>|\<partial\>w<rsup|<around*|(|i|)>>>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|o<rsup|<around*|(|n|)>>-t|)>f<rprime|'><rsub|n><around*|[|<big|prod><rsub|k=i+1><rsup|n>w<rsup|<around*|(|k|)>>f<rprime|'><rsub|k-1>|]>o<rsup|<around*|(|i-1|)>>>>|<row|<cell|\<Delta\>w<rsup|<around*|(|i|)>>>|<cell|=>|<cell|-\<eta\><frac|\<partial\>e|\<partial\>w<rsup|<around*|(|i|)>>>>>|<row|<cell|>|<cell|=>|<cell|-\<eta\><around*|(|o<rsup|<around*|(|n|)>>-t|)>f<rsub|n><rprime|'><around*|[|<big|prod><rsub|k=i+1><rsup|n>w<rsup|<around*|(|k|)>>\<cdummy\>f<rsub|k-1><rprime|'>|]>\<cdummy\>o<rsup|<around*|(|i-1|)>>>>>>
  </eqnarray*>

  let\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<delta\><rsup|<around*|(|n|)>>>|<cell|=>|<cell|2<around*|(|o<rsup|<around*|(|n|)>>-t|)>f<rprime|'><rsub|n>>>|<row|<cell|\<delta\><rsup|<around*|(|k|)>>>|<cell|=>|<cell|\<delta\><rsup|<around*|(|k+1|)>>w<rsup|<around*|(|k+1|)>>f<rprime|'><rsub|k>>>>>
  </eqnarray*>

  then

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<Delta\>w<rsup|<around*|(|i|)>>>|<cell|=>|<cell|-\<eta\>\<delta\><rsup|<around*|(|k|)>>o<rsup|<around*|(|i-1|)>>>>>>
  </eqnarray*>

  <section|Multi nodes>

  <subsection|Matrix <math|W> , vector <math|X,O> and <math|F>>

  <\eqnarray*>
    <tformat|<table|<row|<cell|O<rsup|<around*|(|i|)>>>|<cell|=>|<cell|F<rsub|i><around*|(|W<rsup|<around*|(|i|)>>O<rsup|<around*|(|i-1|)>>|)>>>|<row|<cell|e>|<cell|=>|<cell|<frac|1|2><around*|(|T-O<rsup|<around*|(|n|)>>|)><rsup|T><around*|(|T-O<rsup|<around*|(|n|)>>|)>>>|<row|<cell|\<Delta\>e>|<cell|=>|<cell|<dfrac|\<partial\>e|\<partial\>O<rsup|<around*|(|n|)>>>\<cdummy\><frac|\<partial\>O<rsup|<around*|(|n|)>>|\<partial\>O<rsup|<around*|(|n-1|)>>>\<cdots\><frac|\<partial\>O<rsup|<around*|(|i+1|)>>|\<partial\>O<rsup|<around*|(|i|)>>>\<Delta\>O<rsup|<around*|(|i|)>>>>|<row|<cell|\<Delta\>O<rsup|<around*|(|i|)>>>|<cell|=>|<cell|diag<around*|(|F<rprime|'><rsub|i>|)>\<Delta\>W<rsup|<around*|(|i|)>>O<rsup|<around*|(|i-1|)>>>>|<row|<cell|\<Delta\>e>|<cell|=>|<cell|<around*|(|O<rsup|<around*|(|n|)>>-T|)><rsup|T>diag<around*|(|F<rprime|'><rsub|n>|)><around*|[|<big|prod><rsup|n><rsub|k=i+1>W<rsup|<around*|(|k|)>>\<cdummy\>diag<around*|(|F<rprime|'><rsub|k-1>|)>|]>\<Delta\>W<rsup|<around*|(|i|)>>O<rsup|<around*|(|i-1|)>>>>|<row|<cell|<frac|\<partial\>e|\<partial\>W<rsup|<around*|(|i|)>>>>|<cell|=>|<cell|<around*|[|<big|prod><rsup|n><rsub|k=i+1>diag<around*|(|F<rprime|'><rsub|k-1>|)><around*|[|W<rsup|<around*|(|k|)>>|]><rsup|T>|]>diag<around*|(|F<rprime|'><rsub|n>|)><around*|(|O<rsup|<around*|(|n|)>>-T|)><around*|[|O<rsup|<around*|(|i-1|)>>|]><rsup|T>>>>>
  </eqnarray*>

  where

  <\eqnarray*>
    <tformat|<table|<row|<cell|F<rsub|i><around*|(|X|)>>|<cell|=>|<cell|F<rsub|i><around*|(|<matrix|<tformat|<table|<row|<cell|x<rsub|1>>|<cell|x<rsub|2>>|<cell|\<cdots\>>|<cell|x<rsub|<rsub|n>>>>>>><rsup|T>|)>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|f<rsub|i><around*|(|x<rsub|1>|)>>|<cell|f<rsub|i><around*|(|x<rsub|2>|)>>|<cell|\<cdots\>>|<cell|f<rsub|i><around*|(|x<rsub|<rsub|n>>|)>>>>>><rsup|T>>>|<row|<cell|<frac|\<partial\>|\<partial\>X>F<rsub|i><around*|(|X|)>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|f<rprime|'><rsub|i><around*|(|x<rsub|1>|)>>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|f<rprime|'><rsub|i><around*|(|x<rsub|2>|)>>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|\<ddots\>>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|f<rprime|'><rsub|i><around*|(|x<rsub|2>|)>>>>>>>>|<row|<cell|>|<cell|=>|<cell|diag<around*|(|F<rprime|'><rsub|i>|)>>>>>
  </eqnarray*>

  let\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<delta\><rsup|<around*|(|n|)>>>|<cell|=>|<cell|diag<around*|(|F<rprime|'><rsub|n>|)>\<cdummy\>2<around*|(|O<rsup|<around*|(|n|)>>-T|)>>>|<row|<cell|\<delta\><rsup|<around*|(|k|)>>>|<cell|=>|<cell|diag<around*|(|F<rprime|'><rsub|k>|)><around*|[|W<rsup|<around*|(|k+1|)>>|]><rsup|T>\<cdummy\>\<delta\><rsup|<around*|(|k+1|)>>>>>>
  </eqnarray*>

  then

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<Delta\>W<rsup|<around*|(|i|)>>>|<cell|=>|<cell|-\<eta\>\<delta\><rsup|<around*|(|i|)>><around*|[|O<rsup|<around*|(|i-1|)>>|]><rsup|T>>>>>
  </eqnarray*>

  <subsection|Summation notation>

  Output of the j'th unit in the i'th layer:

  <\eqnarray*>
    <tformat|<table|<row|<cell|o<rsub|j><rsup|<around*|(|i|)>>>|<cell|=>|<cell|f<rsub|i,j><around*|(|y<rsup|<around*|(|i|)>><rsub|j>|)>>>|<row|<cell|y<rsup|<around*|(|i|)>><rsub|j>>|<cell|=>|<cell|<big|sum><rsup|K><rsub|k=1>w<rsub|j,k><rsup|<around*|(|i|)>>o<rsub|k><rsup|<around*|(|i-1|)>>-b<rsub|><rsub|j><rsup|<around*|(|i|)>>>>|<row|<cell|<dfrac|\<partial\>y<rsub|p><rsup|<around*|(|i+1|)>>|\<partial\>y<rsub|<rsub|j>><rsup|<around*|(|i|)>>>>|<cell|=>|<cell|<frac|\<partial\>y<rsub|p><rsup|<around*|(|i+1|)>>|\<partial\>o<rsub|j><rsup|<around*|(|i|)>>>\<cdummy\><frac|\<partial\>o<rsub|j><rsup|<around*|(|i|)>>|\<partial\>y<rsub|j><rsup|<around*|(|i|)>>>>>|<row|<cell|>|<cell|=>|<cell|w<rsup|<around*|(|i+1|)>><rsub|p,j>\<cdummy\>f<rsub|i,j><rprime|'>>>|<row|<cell|<frac|\<partial\>y<rsub|j><rsup|<around*|(|i|)>>|\<partial\>w<rsub|j,k><rsup|<around*|(|i|)>>>>|<cell|=>|<cell|o<rsup|<around*|(|i-1|)>><rsub|k>>>>>
  </eqnarray*>

  \;

  <\eqnarray*>
    <tformat|<table|<row|<cell|e>|<cell|=>|<cell|<frac|1|2><big|sum><rsup|J><rsub|j=1><around*|(|t<rsub|j>-o<rsub|j><rsup|<around*|(|n|)>>|)><rsup|2>>>|<row|<cell|<dfrac|\<partial\>e|\<partial\>y<rsub|<rsub|j>><rsup|<around*|(|n|)>>>>|<cell|=>|<cell|<frac|\<partial\>e|\<partial\>o<rsub|j><rsup|<around*|(|n|)>>>\<cdummy\><frac|\<partial\>o<rsub|j><rsup|<around*|(|n|)>>|\<partial\>y<rsub|j><rsup|<around*|(|n|)>>>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|o<rsup|<around*|(|n|)>><rsub|j>-t<rsub|j>|)>\<cdummy\>f<rsub|n,j><rprime|'>>>|<row|<cell|<dfrac|\<partial\>e|\<partial\>y<rsub|<rsub|j>><rsup|<around*|(|i|)>>>>|<cell|=>|<cell|<dfrac|\<partial\>e|\<partial\>o<rsub|<rsub|j>><rsup|<around*|(|i|)>>>\<cdummy\><frac|\<partial\>o<rsub|j><rsup|<around*|(|i|)>>|\<partial\>y<rsub|j><rsup|<around*|(|i|)>>>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsup|P><rsub|P=1><dfrac|\<partial\>e|\<partial\>o<rsub|<rsub|p>><rsup|<around*|(|i+1|)>>>\<cdummy\><dfrac|\<partial\>o<rsub|p><rsup|<around*|(|i+1|)>>|\<partial\>o<rsub|<rsub|j>><rsup|<around*|(|i|)>>>\<cdummy\><frac|\<partial\>o<rsub|j><rsup|<around*|(|i|)>>|\<partial\>y<rsub|j><rsup|<around*|(|i|)>>>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsup|P><rsub|P=1><dfrac|\<partial\>e|\<partial\>o<rsub|<rsub|p>><rsup|<around*|(|i+1|)>>>\<cdummy\><frac|\<partial\>o<rsup|<around*|(|i+1|)>><rsub|p>|\<partial\>y<rsup|<around*|(|i+1|)>><rsub|p>>\<cdummy\><dfrac|\<partial\>y<rsub|p><rsup|<around*|(|i+1|)>>|\<partial\>o<rsub|<rsub|j>><rsup|<around*|(|i|)>>>\<cdummy\><frac|\<partial\>o<rsub|j><rsup|<around*|(|i|)>>|\<partial\>y<rsub|j><rsup|<around*|(|i|)>>>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsup|P><rsub|P=1><dfrac|\<partial\>e|\<partial\>y<rsup|<around*|(|i+1|)>><rsub|p>>\<cdummy\><dfrac|\<partial\>y<rsub|p><rsup|<around*|(|i+1|)>>|\<partial\>y<rsub|j><rsup|<around*|(|i|)>>>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsup|P><rsub|p=1><dfrac|\<partial\>e|\<partial\>y<rsub|<rsub|p>><rsup|<around*|(|i+1|)>>>\<cdummy\>w<rsup|<around*|(|i+1|)>><rsub|p,j>f<rsub|i,j><rprime|'>>>|<row|<cell|<frac|\<partial\>e|\<partial\>w<rsup|<around*|(|i|)>><rsub|j,k>>>|<cell|=>|<cell|<dfrac|\<partial\>e|\<partial\>y<rsub|<rsub|j>><rsup|<around*|(|i|)>>>\<cdummy\><frac|\<partial\>y<rsub|j><rsup|<around*|(|i|)>>|\<partial\>w<rsub|j,k><rsup|<around*|(|i|)>>>>>|<row|<cell|>|<cell|=>|<cell|<dfrac|\<partial\>e|\<partial\>y<rsub|<rsub|j>><rsup|<around*|(|i|)>>>\<cdummy\>o<rsub|k><rsup|<around*|(|i-1|)>>>>>>
  </eqnarray*>

  let

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<delta\><rsub|j><rsup|<around*|(|n|)>>>|<cell|=>|<cell|<dfrac|\<partial\>e|\<partial\>y<rsub|<rsub|j>><rsup|<around*|(|n|)>>>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|o<rsup|<around*|(|n|)>><rsub|j>-t<rsub|j>|)>\<cdummy\>f<rsub|n,j><rprime|'>>>|<row|<cell|\<delta\><rsub|j><rsup|<around*|(|i|)>>>|<cell|=>|<cell|<dfrac|\<partial\>e|\<partial\>y<rsub|<rsub|j>><rsup|<around*|(|i|)>>>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsup|P><rsub|p=1>\<delta\><rsup|<around*|(|i+1|)>><rsub|p>\<cdummy\>w<rsup|<around*|(|i+1|)>><rsub|p,j>f<rsub|i,j><rprime|'>>>>>
  </eqnarray*>

  then

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<Delta\>w<rsub|j,k><rsup|<around*|(|i|)>>>|<cell|=>|<cell|-\<eta\><frac|\<partial\>e|\<partial\>w<rsup|<around*|(|i|)>><rsub|j,k>>>>|<row|<cell|>|<cell|=>|<cell|-\<eta\>\<delta\><rsup|<around*|(|i|)>><rsub|j>o<rsup|<around*|(|i-1|)>><rsub|k>>>>>
  </eqnarray*>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|12>
    <associate|info-flag|minimal>
    <associate|preamble|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|1>>
    <associate|auto-4|<tuple|1.3|1>>
    <associate|auto-5|<tuple|2|2>>
    <associate|auto-6|<tuple|2.1|2>>
    <associate|auto-7|<tuple|2.2|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Scalar
      <with|mode|<quote|math>|f> , <with|mode|<quote|math>|w> and
      <with|mode|<quote|math>|x>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Single layer
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Double layers
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Multi layers
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Multi
      nodes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Matrix
      <with|mode|<quote|math>|W> , vector <with|mode|<quote|math>|X,O> and
      <with|mode|<quote|math>|F> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Summation notation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>
    </associate>
  </collection>
</auxiliary>