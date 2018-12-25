<TeXmacs|1.99.6>

<style|generic>

<\body>
  <doc-data|<doc-title|Notes on bias-variance
  tradeoff>|<doc-author|<\author-data|<author-name|Xing Chao>>
    \;
  </author-data>>>

  <section|<label|Bias–variance_decomposition_of_squared_error>Bias\Uvariance
  decomposition of squared error>

  Suppose

  <\equation*>
    y<around*|(|x|)>=f<around*|(|x|)>+\<varepsilon\>
  </equation*>

  where the noise <math|\<varepsilon\>> has zero mean and variance
  <math|\<sigma\><rsup|2>>. <math|<wide|f|^><around*|(|x|)>> is to
  approximate the true <math|f<around*|(|x|)>> by using information from
  <math|y<around*|(|x|)>>. For notational convenience, abbreviate
  <math|f=f<around*|(|x|)>,<wide|f|^>=<wide|f|^><around*|(|x|)>,y=y<around*|(|x|)>>.

  <\eqnarray*>
    <tformat|<table|<row|<cell|E<around*|(|f-<wide|f|^>|)><rsup|2>>|<cell|=>|<cell|E<around*|(|f-E<wide|f|^>+E<wide|f|^>-<wide|f|^>|)><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|E<around*|(|f-E<wide|f|^>|)><rsup|2>+E<around*|(|E<wide|f|^>-<wide|f|^>|)><rsup|2>+2E<around*|(|f-E<wide|f|^>|)>E<around*|(|E<wide|f|^>-<wide|f|^>|)>>>|<row|<cell|>|<cell|=>|<cell|E<around*|(|f-E<wide|f|^>|)><rsup|2>+E<around*|(|E<wide|f|^>-<wide|f|^>|)><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|Bias<around*|(|<wide|f|^>|)>|)><rsup|2>+Var<around*|(|<wide|f|^>|)>>>>>
  </eqnarray*>

  <section|Least square estimation>

  Linear regression problem can be represented as

  <\eqnarray*>
    <tformat|<table|<row|<cell|Y<rsub|n\<times\>1>>|<cell|=>|<cell|X<rsub|n\<times\>n>\<theta\><rsub|n\<times\>1>+\<varepsilon\><rsub|n\<times\>1>>>>>
  </eqnarray*>

  where <math|\<varepsilon\>> is noise with n row and 1 column.
  <math|E<around*|(|\<varepsilon\>\<varepsilon\><rsup|T>|)>=\<sigma\><rsup|2>I>.

  The ordinary least square estimation of <math|\<theta\>> is

  <\eqnarray*>
    <tformat|<table|<row|<cell|<wide|\<theta\>|^>>|<cell|=>|<cell|arg
    min<rsub|\<theta\>> <around*|(|Y-X\<theta\>|)><rsup|T><around*|(|Y-X\<theta\>|)>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|X<rsup|T>X|)><rsup|-1>X<rsup|T>Y>>|<row|<cell|>|<cell|=>|<cell|<around*|(|X<rsup|T>X|)><rsup|-1>X<rsup|T><around*|(|X\<theta\>+\<varepsilon\>|)>>>|<row|<cell|>|<cell|=>|<cell|\<theta\>+<around*|(|X<rsup|T>X|)><rsup|-1>X<rsup|T>\<varepsilon\>>>|<row|<cell|E<wide|\<theta\>|^>>|<cell|=>|<cell|\<theta\>>>|<row|<cell|Var<wide|\<theta\>|^>>|<cell|=>|<cell|<around*|(|X<rsup|T>X|)><rsup|-1>X<rsup|T>E<around*|(|\<varepsilon\>\<varepsilon\><rsup|T>|)>X<around*|(|X<rsup|T>X|)><rsup|-1>>>|<row|<cell|>|<cell|=>|<cell|\<sigma\><rsup|2><around*|(|X<rsup|T>X|)><rsup|-1>>>>>
  </eqnarray*>

  The regularized least square estimation of <math|\<theta\>> is

  <\eqnarray*>
    <tformat|<table|<row|<cell|<wide|\<theta\>|^><rsub|r>>|<cell|=>|<cell|arg
    min<rsub|\<theta\>><around*|(|Y-X\<theta\>|)><rsup|T><around*|(|Y-X\<theta\>|)>+\<lambda\>\<theta\><rsup|T>\<theta\>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|X<rsup|T>X+\<lambda\>I|)><rsup|-1>X<rsup|T>Y>>|<row|<cell|>|<cell|=>|<cell|<around*|(|X<rsup|T>X+\<lambda\>I|)><rsup|-1>X<rsup|T><around*|(|X\<theta\>+\<varepsilon\>|)>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|X<rsup|T>X+\<lambda\>I|)><rsup|-1>X<rsup|T>X\<theta\>+<around*|(|X<rsup|T>X+\<lambda\>I|)><rsup|-1>X<rsup|T>\<varepsilon\>>>|<row|<cell|E<wide|\<theta\>|^><rsub|r>>|<cell|=>|<cell|<around*|(|X<rsup|T>X+\<lambda\>I|)><rsup|-1>X<rsup|T>X\<theta\>>>|<row|<cell|Var<wide|\<theta\>|^><rsub|r>>|<cell|=>|<cell|<around*|(|X<rsup|T>X+\<lambda\>I|)><rsup|-1>X<rsup|T>E<around*|(|\<varepsilon\>\<varepsilon\><rsup|T>|)>X<around*|(|X<rsup|T>X+\<lambda\>I|)><rsup|-1>>>|<row|<cell|>|<cell|=>|<cell|\<sigma\><rsup|2><around*|(|X<rsup|T>X+\<lambda\>I|)><rsup|-1>X<rsup|T>X<around*|(|X<rsup|T>X+\<lambda\>I|)><rsup|-1>>>>>
  </eqnarray*>

  When <math|\<lambda\>\<gtr\>0>, there are
  <math|E<wide|\<theta\>|^><rsub|r>\<gtr\>E<wide|\<theta\>|^>,Var<wide|\<theta\>|^><rsub|r>\<less\>Var<wide|\<theta\>|^>>.
  It is a better choice to use regularized least square estimation in some
  cases to decrease squared estimating error
  <math|<around*|(|\<theta\>-<wide|\<theta\>|^>|)><rsup|2>>.\ 

  <section|Mean filtering>

  Suppose there is a signal with random noise as\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|y<around*|(|n|)>>|<cell|=>|<cell|f<around*|(|n|)>+\<varepsilon\><around*|(|n|)>>>>>
  </eqnarray*>

  <math|\<varepsilon\><around*|(|n|)>> is identical independence random
  variable with <math|E\<varepsilon\><around*|(|n|)>=0,Var<around*|(|\<varepsilon\><around*|(|n|)>|)>=\<sigma\><rsup|2>>

  The value of signal <math|f<around*|(|n|)>> can be estimated by using mean
  filtering on <math|y<around*|(|n|)>>

  <\eqnarray*>
    <tformat|<table|<row|<cell|<wide|f|^><rsub|3><around*|(|n|)>>|<cell|=>|<cell|<frac|1|3><big|sum><rsup|1><rsub|i=-1>y<around*|(|n+i|)>>>|<row|<cell|E<wide|f|^><rsub|3><around*|(|n|)>>|<cell|=>|<cell|<frac|1|3><big|sum><rsup|1><rsub|i=-1>f<around*|(|n+i|)>>>|<row|<cell|Var<wide|f|^><rsub|3><around*|(|n|)>>|<cell|=>|<cell|<frac|Var<around*|(|\<varepsilon\>|)>|3>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<sigma\><rsup|2>|3>>>>>
  </eqnarray*>

  When using <math|<wide|f|^><rsub|1><around*|(|n|)>=y<around*|(|n|)>> to
  estimate <math|f<around*|(|n|)>> directly,\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|E<wide|f|^><rsub|1><around*|(|n|)>>|<cell|=>|<cell|f<around*|(|n|)>>>|<row|<cell|Var<around*|(|<wide|f|^><rsub|1><around*|(|n|)>|)>>|<cell|=>|<cell|\<sigma\><rsup|2>>>>>
  </eqnarray*>

  Bias is increased but variance is decreased in mean filtering.
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|Bias–variance_decomposition_of_squared_error|<tuple|1|?>>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|2|?>>
    <associate|auto-3|<tuple|3|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Bias\Uvariance
      decomposition of squared error> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Least
      square estimation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Mean
      filtering> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>