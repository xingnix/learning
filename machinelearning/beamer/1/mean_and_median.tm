<TeXmacs|1.99.6>

<style|generic>

<\body>
  <doc-data|<doc-title|Mean & Median>|<doc-author|<author-data|<author-name|Xing
  Chao>>>>

  How to interprete the data <math|<around*|{|x<rsub|i>|}><rsub|i=1><rsup|n>>
  with only one value <math|c> ?

  <\eqnarray*>
    <tformat|<table|<row|<cell|e<rsub|1>>|<cell|=>|<cell|<big|sum><rsub|i=1><rsup|n><around*|(|x<rsub|i>-c|)><rsup|2>>>|<row|<cell|e<rsub|2>>|<cell|=>|<cell|<big|sum><rsub|i=1><rsup|n><around*|\||x<rsub|i>-c|\|>>>>>
  </eqnarray*>

  <math|e<rsub|1>,e<rsub|2>> are two kinds of error functions. Different
  <math|<wide|c|^>> (estimated value) should be assigned to <math|c> in order
  to get the minimum of <math|e<rsub|1>,e<rsub|2>>.

  In order to minimize <math|e<rsub|1>>

  <\eqnarray*>
    <tformat|<table|<row|<cell|<frac|\<mathd\>e<rsub|1>|\<mathd\>c>>|<cell|=>|<cell|<big|sum><rsub|i=1><rsup|n>2<around*|(|c-x<rsub|i>|)>=0>>|<row|<cell|c>|<cell|=>|<cell|<frac|1|n><big|sum><rsub|i=1><rsup|n>x<rsub|i>>>>>
  </eqnarray*>

  In order to minimize <math|e<rsub|2>>, let's first sort
  <math|<around*|{|x<rsub|i>|}><rsub|i=1><rsup|n>> in ascend order. When n is
  odd,

  <\eqnarray*>
    <tformat|<table|<row|<cell|e<rsub|2>>|<cell|=>|<cell|<big|sum><rsub|i=1><rsup|<frac|n+1|2>-1><around*|\||x<rsub|i>-c|\|>+<big|sum><rsub|i=<frac|n+1|2>+1><rsup|n><around*|\||x<rsub|i>-c|\|>+<around*|\||x<rsub|<frac|n+1|2>>-c|\|>>>|<row|<cell|>|<cell|\<geqslant\>>|<cell|<big|sum><rsub|i=1><rsup|<frac|n+1|2>-1><around*|\||x<rsub|i>-x<rsub|n+1-i>|\|>+<around*|\||x<rsub|<frac|n+1|2>>-c|\|>>>>>
  </eqnarray*>

  When <math|c=x<rsub|<frac|n+1|2>>> , <math|e<rsub|2>> reaches minimum.
  There is a very simple example with <math|<around*|{|1,2,10|}>> as

  <\eqnarray*>
    <tformat|<table|<row|<cell|e<rsub|2>>|<cell|=>|<cell|<around*|\||1-c|\|>+<around*|\||2-c|\|>+<around*|\||10-c|\|>>>>>
  </eqnarray*>

  When <math|c\<in\><around*|[|1,10|]>>\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|e<rsub|2>>|<cell|=>|<cell|<around*|(|c-1+10-c|)>+<around*|\||2-c|\|>>>>>
  </eqnarray*>

  which is smaller than cases when <math|c\<less\>1> or <math|c\<gtr\>10>.\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|arg min<rsub|c>
    e<rsub|2>>|<cell|=>|<cell|2>>>>
  </eqnarray*>

  Median is superior than mean when there are outliers in the data. But mean
  value as its own merits, such as with some distributions mean estimate has
  less variance than that of median estimate.

  Suppose uniform random variable <math|x\<in\><around*|[|-1,1|]>>. Three
  samples are observed as <math|<around*|{|x<rsub|1>,x<rsub|2>,x<rsub|3>|}>>.
  The distribution density function of median is\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|f<rsub|x<rsub|<around*|(|2|)>>><around*|(|x|)>>|<cell|=>|<cell|3<around*|(|<frac|x+1|2>|)><around*|(|<frac|1-x|2>|)>>>>>
  </eqnarray*>

  which is deduced from distribution function of k-th order statistics

  <\eqnarray*>
    <tformat|<table|<row|<cell|f<rsub|x<rsub|<around*|(|k|)>>><around*|(|x|)>>|<cell|=>|<cell|<frac|n!|<around*|(|k-1|)>!<around*|(|n-k|)>!><around*|(|F<around*|(|x|)>|)><rsup|k-1><around*|(|1-F<around*|(|x|)>|)><rsup|n-k>f<around*|(|x|)>>>>>
  </eqnarray*>

  Expectation of median estimate is 0 and variance is

  <\eqnarray*>
    <tformat|<table|<row|<cell|var<rsub|x<rsub|<around*|(|k|)>>><around*|(|x|)>>|<cell|=>|<cell|<big|int><rsub|-1><rsup|1>x<rsup|2>f<rsub|x<rsub|<around*|(|2|)>>><around*|(|x|)>\<mathd\>x>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|-1><rsup|1><frac|3x<rsup|2><around*|(|1-x<rsup|2>|)>|4>\<mathd\>x>>|<row|<cell|>|<cell|=>|<cell|<frac|1|5>>>>>
  </eqnarray*>

  Compare it with mean estimate variance,

  <\eqnarray*>
    <tformat|<table|<row|<cell|var<rsub|mean><around*|(|x|)>>|<cell|=>|<cell|var<around*|(|<frac|<big|sum><rsub|i=1><rsup|3>x<rsub|i>|3>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|<big|sum><rsub|i=1><rsup|3>var<around*|(|x<rsub|i>|)>|9>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|9>>>>>
  </eqnarray*>

  where\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|var<around*|(|x<rsub|i>|)>>|<cell|=>|<cell|<big|int><rsub|-1><rsup|1><frac|x<rsup|2>|2>\<mathd\>x>>|<row|<cell|>|<cell|=>|<cell|<frac|1|3>>>>>
  </eqnarray*>

  The result of comparison is

  <\eqnarray*>
    <tformat|<table|<row|<cell|var<rsub|mean><around*|(|x|)>>|<cell|\<less\>>|<cell|var<rsub|x<rsub|<around*|(|2|)>>><around*|(|x|)>>>>>
  </eqnarray*>
</body>

<initial|<\collection>
</collection>>