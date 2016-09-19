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
    w><around*|(|w x|)>>>|<row|<cell| >|<cell|=>|<cell|f<rprime|'>x>>|<row|<cell|e>|<cell|=>|<cell|<around*|(|t-o|)><rsup|2>>>|<row|<cell|<frac|d
    e|d w>>|<cell|=>|<cell|2<around*|(|o-t|)><frac|do|d
    w>>>|<row|<cell|>|<cell|=>|<cell|2<around*|(|o-t|)>f<rprime|'>x>>|<row|<cell|\<Delta\>w>|<cell|=>|<cell|-\<eta\><frac|d
    e|d w>>>|<row|<cell|>|<cell|=>|<cell|-2\<eta\><around*|(|o-t|)>f<rprime|'>x>>>>
  </eqnarray*>

  <subsection|Double layers>

  <\eqnarray*>
    <tformat|<table|<row|<cell|o<rsup|<around*|(|2|)>>>|<cell|=>|<cell|f<rsub|2><around*|(|w<rsup|<around*|(|2|)>>o<rsup|<around*|(|1|)>>-b<rsub|><rsup|<around*|(|2|)>>|)>>>|<row|<cell|o<rsup|<around*|(|1|)>>>|<cell|=>|<cell|f<rsub|1><around*|(|w<rsup|<around*|(|1|)>>x-b<rsup|<around*|(|1|)>>|)>>>|<row|<cell|e>|<cell|=>|<cell|<around*|(|t-o<rsup|<around*|(|2|)>>|)><rsup|2>>>|<row|<cell|<frac|\<partial\>e|\<partial\>w<rsup|<around*|(|1|)>>>>|<cell|=>|<cell|<frac|\<partial\>e|\<partial\>o<rsup|<around*|(|2|)>>>\<cdummy\><frac|\<partial\>o<rsup|<around*|(|2|)>>|\<partial\>o<rsup|<around*|(|1|)>>>\<cdummy\><frac|\<partial\>o<rsup|<around*|(|1|)>>|\<partial\>w<rsup|<around*|(|1|)>>>>>|<row|<cell|>|<cell|=>|<cell|2<around*|(|o<rsup|<around*|(|2|)>>-t|)>f<rsub|2><rprime|'>w<rsup|<around*|(|2|)>>f<rsub|1><rprime|'>x>>|<row|<cell|\<Delta\>w<rsup|<around*|(|1|)>>>|<cell|=>|<cell|-\<eta\><frac|\<partial\>e|\<partial\>w<rsup|<around*|(|1|)>>>>>|<row|<cell|>|<cell|=>|<cell|-2\<eta\><around*|(|o<rsup|<around*|(|2|)>>-t|)>f<rsub|2><rprime|'>w<rsup|<around*|(|2|)>>f<rsub|1><rprime|'>x>>>>
  </eqnarray*>

  <subsection|Multi layers>

  <\eqnarray*>
    <tformat|<table|<row|<cell|o<rsup|<around*|(|i|)>>>|<cell|=>|<cell|f<rsub|i><around*|(|w<rsup|<around*|(|i|)>>o<rsup|<around*|(|i-1|)>>-b<rsub|><rsup|<around*|(|i|)>>|)>>>|<row|<cell|e>|<cell|=>|<cell|<around*|(|t-o<rsup|<around*|(|n|)>>|)><rsup|2>>>|<row|<cell|<frac|\<partial\>e|\<partial\>w<rsup|<around*|(|i|)>>>>|<cell|=>|<cell|<dfrac|\<partial\>e|\<partial\>o<rsup|<around*|(|n|)>>>\<cdummy\><frac|\<partial\>o<rsup|<around*|(|n|)>>|\<partial\>o<rsup|<around*|(|n-1|)>>>\<cdots\><frac|\<partial\>o<rsup|<around*|(|i|)>>|\<partial\>w<rsup|<around*|(|i|)>>>>>|<row|<cell|>|<cell|=>|<cell|2<around*|(|o<rsup|<around*|(|n|)>>-t|)><big|prod><rsub|k=i+1><rsup|n><around*|[|f<rsub|k><rprime|'>w<rsup|<around*|(|k|)>>|]><rsup|>\<cdummy\>f<rsub|i><rprime|'>o<rsup|<around*|(|i-1|)>>>>|<row|<cell|\<Delta\>w<rsup|<around*|(|i|)>>>|<cell|=>|<cell|-\<eta\><frac|\<partial\>e|\<partial\>w<rsup|<around*|(|i|)>>>>>|<row|<cell|>|<cell|=>|<cell|-2\<eta\><around*|(|o<rsup|<around*|(|n|)>>-t|)><big|prod><rsub|k=i+1><rsup|n><around*|[|f<rsub|k><rprime|'>w<rsup|<around*|(|k|)>>|]><rsup|>\<cdummy\>f<rsub|i><rprime|'>o<rsup|<around*|(|i-1|)>>>>>>
  </eqnarray*>

  <section|Multi nodes>

  <subsection|Matrix <math|W> , vector <math|X,O> and <math|F>>

  <\eqnarray*>
    <tformat|<table|<row|<cell|O<rsup|<around*|(|i|)>>>|<cell|=>|<cell|F<rsub|i><around*|(|W<rsup|<around*|(|i|)>>O<rsup|<around*|(|i-1|)>>|)>>>|<row|<cell|e>|<cell|=>|<cell|<around*|(|T-O<rsup|<around*|(|n|)>>|)><rsup|T><around*|(|T-O<rsup|<around*|(|n|)>>|)>>>|<row|<cell|<frac|\<partial\>e|\<partial\>W<rsup|<around*|(|i|)>>>>|<cell|=>|<cell|<dfrac|\<partial\>e|\<partial\>O<rsup|<around*|(|n|)>>>\<cdummy\><frac|\<partial\>O<rsup|<around*|(|n|)>>|\<partial\>O<rsup|<around*|(|n-1|)>>>\<cdots\><frac|\<partial\>O<rsup|<around*|(|i|)>>|\<partial\>W<rsup|<around*|(|i|)>>>>>|<row|<cell|>|<cell|=>|<cell|2<around*|(|O<rsup|<around*|(|n|)>>-T|)><rsup|T><big|prod><rsup|n><rsub|k=i+1><around*|[|diag<around*|(|F<rsub|k>|)><rprime|'>W<rsup|<around*|(|k|)>>|]>\<cdummy\>diag<around*|(|F<rprime|'><rsub|i>|)>O<rsup|<around*|(|i-1|)>>>>>>
  </eqnarray*>

  where

  <\eqnarray*>
    <tformat|<table|<row|<cell|F<rsub|i><around*|(|X|)>>|<cell|=>|<cell|F<rsub|i><around*|(|<matrix|<tformat|<table|<row|<cell|x<rsub|1>>|<cell|x<rsub|2>>|<cell|\<cdots\>>|<cell|x<rsub|<rsub|n>>>>>>><rsup|T>|)>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|f<rsub|i><around*|(|x<rsub|1>|)>>|<cell|f<rsub|i><around*|(|x<rsub|2>|)>>|<cell|\<cdots\>>|<cell|f<rsub|i><around*|(|x<rsub|<rsub|n>>|)>>>>>><rsup|T>>>|<row|<cell|<frac|\<partial\>|\<partial\>X>F<rsub|i><around*|(|X|)>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|f<rprime|'><rsub|i><around*|(|x<rsub|1>|)>>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|f<rprime|'><rsub|i><around*|(|x<rsub|2>|)>>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|\<ddots\>>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|f<rprime|'><rsub|i><around*|(|x<rsub|2>|)>>>>>>>>|<row|<cell|>|<cell|=>|<cell|diag<around*|(|F<rprime|'><rsub|i>|)>>>>>
  </eqnarray*>

  <subsection|Summation notation>

  <\eqnarray*>
    <tformat|<table|<row|<cell|o<rsub|j><rsup|<around*|(|i|)>>>|<cell|=>|<cell|f<rsub|i,j><around*|(|<big|sum><rsup|N<rsub|i-1>><rsub|k=1>w<rsub|j,k><rsup|<around*|(|i|)>>o<rsub|k><rsup|<around*|(|i-1|)>>-b<rsub|><rsub|j><rsup|<around*|(|i|)>>|)>>>|<row|<cell|e>|<cell|=>|<cell|<big|sum><rsup|N<rsub|n>><rsub|j=1><around*|(|t<rsub|j>-o<rsub|j><rsup|<around*|(|n|)>>|)><rsup|2>>>|<row|<cell|<frac|\<partial\>e|\<partial\>w<rsup|<around*|(|i|)>><rsub|j,k>>>|<cell|=>|<cell|<big|sum><rsub|k<rsub|n>=1><rsup|N<rsub|n>><dfrac|\<partial\>e|\<partial\>o<rsub|k<rsub|n>><rsup|<around*|(|n|)>>>\<cdummy\><big|sum><rsub|k<rsub|n-1>=1><rsup|N<rsub|n-1>><frac|\<partial\>o<rsub|k<rsub|n>><rsup|<around*|(|n|)>>|\<partial\>o<rsub|k<rsub|n-1>><rsup|<around*|(|n-1|)>>>\<cdots\><frac|\<partial\>o<rsub|j><rsup|<around*|(|i|)>>|\<partial\>w<rsub|j,k><rsup|<around*|(|i|)>>>>>|<row|<cell|>|<cell|=>|<cell|2<big|sum><rsup|N<rsub|n>><rsub|k<rsub|n>=1><around*|(|o<rsub|k<rsub|n>><rsup|<around*|(|n|)>>-t<rsub|k<rsub|n>>|)><big|sum><rsub|k<rsub|n-1>=1><rsup|N<rsub|n-1>><rsup|>f<rsub|n,k<rsub|n>><rprime|'>w<rsub|k<rsub|n>,k<rsub|n-1>><rsup|<around*|(|n|)>>\<cdots\>f<rsub|i><rprime|'>o<rsub|k><rsup|<around*|(|i-1|)>>>>|<row|<cell|>|<cell|=>|<cell|2<big|sum><rsup|N<rsub|n>><rsub|k<rsub|n>=1><big|sum><rsub|k<rsub|n-1>=1><rsup|N<rsub|n-1>><rsup|><big|sum><rsub|k<rsub|n-2>=1><rsup|N<rsub|n-2>><rsup|>\<cdots\>>>|<row|<cell|>|<cell|>|<cell|<around*|(|o<rsub|k<rsub|n>><rsup|<around*|(|n|)>>-t<rsub|k<rsub|n>>|)>f<rsub|n,k<rsub|n>><rprime|'>w<rsub|k<rsub|n>,k<rsub|n-1>><rsup|<around*|(|n|)>>f<rsub|n-1,k<rsub|n-1>><rprime|'>w<rsup|<around*|(|n-1|)>><rsub|k<rsub|n-1>,k<rsub|n-2>>\<cdots\>f<rsub|i><rprime|'>o<rsub|k><rsup|<around*|(|i-1|)>>>>|<row|<cell|>|<cell|=>|<cell|2<big|sum><rsup|N<rsub|n>><rsub|k<rsub|n>=1><around*|(|o<rsub|k<rsub|n>><rsup|<around*|(|n|)>>-t<rsub|k<rsub|n>>|)><big|prod><rsup|i+1><rsub|m=n><around*|[|<big|sum><rsub|k<rsub|m-1>=1><rsup|N<rsub|m-1>><rsup|>f<rsub|m,k<rsub|m>><rprime|'>w<rsub|k<rsub|m>,k<rsub|m-1>><rsup|<around*|(|m|)>>|]>f<rsub|i><rprime|'>o<rsub|k><rsup|<around*|(|i-1|)>>>>|<row|<cell|\<Delta\>w<rsup|<around*|(|i|)>>>|<cell|=>|<cell|-\<eta\><frac|\<partial\>e|\<partial\>w<rsup|<around*|(|i|)>><rsub|j,k>>>>|<row|<cell|>|<cell|=>|<cell|-2\<eta\><big|sum><rsup|N<rsub|n>><rsub|k<rsub|n>=1><around*|(|o<rsub|k<rsub|n>><rsup|<around*|(|n|)>>-t<rsub|k<rsub|n>>|)><big|prod><rsup|i+1><rsub|m=n><around*|[|<big|sum><rsub|k<rsub|m-1>=1><rsup|N<rsub|m-1>><rsup|>f<rsub|m,k<rsub|m>><rprime|'>w<rsub|k<rsub|m>,k<rsub|m-1>><rsup|<around*|(|m|)>>|]>f<rsub|i><rprime|'>o<rsub|k><rsup|<around*|(|i-1|)>>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>>>>
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