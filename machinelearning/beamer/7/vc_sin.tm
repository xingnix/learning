<TeXmacs|1.0.7.21>

<style|generic>

<\body>
  <doc-data|<doc-title|Notes on VC Dimension of Sin/Cos
  Function>|<doc-author|<author-data|<author-name|Xing
  Chao>|<\author-affiliation>
    xingnix@live.com
  </author-affiliation>>>>

  <section|Problem>

  <active|Suppose there is a series of scalar <math|x<rsub|i>> , which >can
  be assigned to arbitrary values according to VC dimension definition. The
  problem is how to choose these values to meat the all kinds of dichotomy
  with sine or cosine funtion?

  Consider three point, <math|x<rsub|1>=0,x<rsub|2>=2,x<rsub|3>=3> , and the
  corrysponding category label <math|c<around*|(|x<rsub|i>|)>\<in\><around*|{|0,1|}>>.
  It is eany to draw a sine/cosine function cure to shatter the three ponts:

  <\eqnarray*>
    <tformat|<table|<row|<cell|c<around*|(|x<rsub|1>|)>=1,c<around*|(|x<rsub|2>|)>=0,c<around*|(|x<rsub|3>|)>=0>|<cell|\<rightarrow\>>|<cell|cos<around*|(|2\<pi\>
    <frac|x|5>|)>-1+\<Delta\>>>|<row|<cell|c<around*|(|x<rsub|1>|)>=1,c<around*|(|x<rsub|2>|)>=1,c<around*|(|x<rsub|3>|)>=0>|<cell|\<rightarrow\>>|<cell|cos<around*|(|2\<pi\>
    <frac|x|2>|)>-1+\<Delta\>>>|<row|<cell|c<around*|(|x<rsub|1>|)>=1,c<around*|(|x<rsub|2>|)>=0,c<around*|(|x<rsub|3>|)>=1>|<cell|\<rightarrow\>>|<cell|cos<around*|(|2\<pi\>
    <frac|x|3>|)>-1+\<Delta\>>>>>
  </eqnarray*>

  where <math|\<Delta\>> is a small number.

  <section|Basic Idea>

  In order to extend the previous example of three points to more points,
  let's choose the value of three point again to see if there is any clue. If
  we can choose period of cosine function to be exactly divisible by some
  <math|x<rsub|i>\<in\><around*|{|x<rsub|i>\|c<around*|(|x<rsub|i>|)>=1|}>>,
  and not exactly divisible by other <math|x<rsub|i>\<in\><around*|{|x<rsub|i>\|c<around*|(|x<rsub|i>|)>=0|}>>,
  the cosine function can be used to classify the points according to
  <math|c<around*|(|x<rsub|i>|)>>. It is possible to shatter these points if
  we choose <math|x<rsub|i>> carefully to make such period exist for evry
  category label <math|c<around*|(|x<rsub|i>|)>>.\ 

  Let

  <\eqnarray*>
    <tformat|<table|<row|<cell|x<rsub|1>>|<cell|=>|<cell|2\<times\>7\<times\>13>>|<row|<cell|x<rsub|2>>|<cell|=>|<cell|3\<times\>7\<times\>11>>|<row|<cell|x<rsub|3>>|<cell|=>|<cell|5\<times\>11\<times\>13>>>>
  </eqnarray*>

  then

  <\eqnarray*>
    <tformat|<table|<row|<cell|c<around*|(|x<rsub|1>|)>=1,c<around*|(|x<rsub|2>|)>=0,c<around*|(|x<rsub|3>|)>=0>|<cell|\<rightarrow\>>|<cell|cos<around*|(|2\<pi\>
    <frac|x|2>|)>-1+\<Delta\>>>|<row|<cell|c<around*|(|x<rsub|1>|)>=1,c<around*|(|x<rsub|2>|)>=1,c<around*|(|x<rsub|3>|)>=0>|<cell|\<rightarrow\>>|<cell|cos<around*|(|2\<pi\>
    <frac|x|7>|)>-1+\<Delta\>>>|<row|<cell|c<around*|(|x<rsub|1>|)>=1,c<around*|(|x<rsub|2>|)>=0,c<around*|(|x<rsub|3>|)>=1>|<cell|\<rightarrow\>>|<cell|cos<around*|(|2\<pi\>
    <frac|x|13>|)>-1+\<Delta\>>>>>
  </eqnarray*>

  <section|Algorithm>

  Each <math|x<rsub|i>> is a production of prime numbers and for each subset
  <math|<around*|{|x<rsub|i>\|c<around*|(|x<rsub|i>|)>=1|}>> of
  <math|<around*|{|x<rsub|i>|}>>,there is a prime number in each
  <math|x<rsub|i>\<in\><around*|{|x<rsub|i>\|c<around*|(|x<rsub|i>|)>=1|}>>
  and not in <math|x<rsub|i>\<nin\><around*|{|x<rsub|i>\|c<around*|(|x<rsub|i>|)>=1|}>>.
  That prime number is the period of the cosine function.

  Now it is time to find a way to generate <math|x<rsub|i>>. First let's
  count the amount of prime numbers we need. Each subset of
  <math|<around*|{|x<rsub|i>|}>> need one prime number and there is
  <math|2<rsup|N>> subset, where <math|N=<around*|\||<around*|{|x<rsub|i>|}>|\|>>
  is the number of elements in <math|<around*|{|x<rsub|i>|}>>. The number
  ``2'' is a clue that binary number may give some help. A dichotomy can be
  represented by <math|c<around*|(|x<rsub|1>|)>c<around*|(|x<rsub|2>|)>\<cdots\>c<around*|(|x<rsub|n>|)>>,
  where each <math|c<around*|(|x<rsub|i>|)>> is 0 or 1 and it can be used to
  represent the index of \ the dichotomy. Then a corresponding prime is
  choosen to put in <math|x<rsub|i>> whose <math|c<around*|(|x<rsub|i>|)>=1>
  in the binary number.

  Example

  <\eqnarray*>
    <tformat|<table|<row|<cell|c<around*|(|x<rsub|1>|)>=1,c<around*|(|x<rsub|2>|)>=0,c<around*|(|x<rsub|3>|)>=0>|<cell|\<rightarrow\>>|<cell|001>>|<row|<cell|>|<cell|>|<cell|x<rsub|1>=prod<around*|(|<around*|[|prime<around*|(|1|)>
    |]>|)>=prod<around*|(|<around*|[|2|]>|)>>>|<row|<cell|>|<cell|>|<cell|x<rsub|2>=<around*|[||]>>>|<row|<cell|>|<cell|>|<cell|x<rsub|3>=<around*|[||]>>>|<row|<cell|c<around*|(|x<rsub|1>|)>=0,c<around*|(|x<rsub|2>|)>=1,c<around*|(|x<rsub|3>|)>=0>|<cell|\<rightarrow\>>|<cell|010>>|<row|<cell|>|<cell|>|<cell|x<rsub|1>=prod<around*|(|<around*|[|2
    |]>|)>>>|<row|<cell|>|<cell|>|<cell|x<rsub|2>=prod<around*|(|<around*|[|prime<around*|(|2|)>
    |]>|)>=prod<around*|(|<around*|[|3|]>|)>>>|<row|<cell|>|<cell|>|<cell|x<rsub|3>=<around*|[||]>>>|<row|<cell|c<around*|(|x<rsub|1>|)>=1,c<around*|(|x<rsub|2>|)>=1,c<around*|(|x<rsub|3>|)>=0>|<cell|\<rightarrow\>>|<cell|011>>|<row|<cell|>|<cell|>|<cell|x<rsub|1>=prod<around*|(|<around*|[|2,prime<around*|(|3|)>|]>|)>=prod<around*|(|<around*|[|2,5|]>|)>>>|<row|<cell|>|<cell|>|<cell|x<rsub|2>=prod<around*|(|<around*|[|3,prime<around*|(|3|)>|]>|)>=prod<around*|(|<around*|[|3,5|]>|)>>>|<row|<cell|>|<cell|>|<cell|x<rsub|3>=<around*|[||]>>>|<row|<cell|c<around*|(|x<rsub|1>|)>=0,c<around*|(|x<rsub|2>|)>=0,c<around*|(|x<rsub|3>|)>=1>|<cell|\<rightarrow\>>|<cell|100>>|<row|<cell|>|<cell|>|<cell|x<rsub|1>=prod<around*|(|<around*|[|2,5|]>|)>>>|<row|<cell|>|<cell|>|<cell|x<rsub|2>=prod<around*|(|<around*|[|3,5|]>|)>>>|<row|<cell|>|<cell|>|<cell|x<rsub|3>=prod<around*|(|<around*|[|prime<around*|(|4|)>
    |]>|)>=prod<around*|(|<around*|[|7|]>|)>>>|<row|<cell|c<around*|(|x<rsub|1>|)>=1,c<around*|(|x<rsub|2>|)>=0,c<around*|(|x<rsub|3>|)>=1>|<cell|\<rightarrow\>>|<cell|101>>|<row|<cell|>|<cell|>|<cell|x<rsub|1>=prod<around*|(|<around*|[|2,5,prime<around*|(|5|)>|]>|)>=prod<around*|(|<around*|[|2,5,11|]>|)>>>|<row|<cell|>|<cell|>|<cell|x<rsub|2>=prod<around*|(|<around*|[|3,5|]>|)>>>|<row|<cell|>|<cell|>|<cell|x<rsub|3>=prod<around*|(|<around*|[|7,prime<around*|(|5|)>
    |]>|)>=prod<around*|(|<around*|[|7,11|]>|)>>>|<row|<cell|c<around*|(|x<rsub|1>|)>=0,c<around*|(|x<rsub|2>|)>=1,c<around*|(|x<rsub|3>|)>=1>|<cell|\<rightarrow\>>|<cell|101>>|<row|<cell|>|<cell|>|<cell|x<rsub|1>=prod<around*|(|<around*|[|2,5,11|]>|)>>>|<row|<cell|>|<cell|>|<cell|x<rsub|2>=prod<around*|(|<around*|[|3,5,prime<around*|(|7|)>|]>|)>=prod<around*|(|<around*|[|3,5,13|]>|)>>>|<row|<cell|>|<cell|>|<cell|x<rsub|3>=prod<around*|(|<around*|[|7,11,prime<around*|(|7|)>
    |]>|)>=prod<around*|(|<around*|[|7,11,13|]>|)>>>>>
  </eqnarray*>

  then

  <\eqnarray*>
    <tformat|<table|<row|<cell|x<rsub|1>>|<cell|=>|<cell|2\<times\>5\<times\>11>>|<row|<cell|x<rsub|2>>|<cell|=>|<cell|3\<times\>5\<times\>13>>|<row|<cell|x<rsub|3>>|<cell|=>|<cell|7\<times\>11\<times\>13>>>>
  </eqnarray*>

  For each dichotomy a period can be choosen according to the binary number
  of <math|c<around*|(|x<rsub|1>|)>c<around*|(|x<rsub|2>|)>\<cdots\>c<around*|(|x<rsub|n>|)>>

  <\equation*>
    period=prime<around*|(|c<around*|(|x<rsub|1>|)>c<around*|(|x<rsub|2>|)>\<cdots\>c<around*|(|x<rsub|n>|)>|)>
  </equation*>

  \;
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|2|?>>
    <associate|auto-3|<tuple|3|?>>
  </collection>
</references>