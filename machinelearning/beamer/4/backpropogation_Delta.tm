<TeXmacs|2.1>

<style|<tuple|article|old-spacing|old-dots|old-lengths>>

<\body>
  <doc-data|<doc-title|Back propogation(Recursive
  Representation)>|<doc-author|<author-data|<author-name|>>>|<doc-author|<author-data|<author-name|Xing
  Chao>>>>

  Error of a network can be represented by the formula of each node in the
  output layer.\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|e>|<cell|=>|<cell|\<Sigma\><rsub|\<tau\>>l<rsub|\<tau\>><around*|(|x<rsub|\<tau\>>|)>>>>>
  </eqnarray*>

  The relationship between derectly connected nodes can be represented as

  <\eqnarray*>
    <tformat|<table|<row|<cell|x<rsub|r>>|<cell|=>|<cell|f<rsub|r><around*|(|\<Sigma\><rsub|\<rho\>>w<rsub|r
    \<rho\>>x<rsub|\<rho\>>|)>>>>>
  </eqnarray*>

  For the contribution of an increment <math|\<Delta\>x<rsub|r>> which is the
  output of a specific node

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<Delta\>e>|<cell|=>|<cell|l<rsub|r><rprime|'>\<Delta\>x<rsub|r>>>|<row|<cell|\<Delta\>x<rsub|p>>|<cell|=>|<cell|f<rsub|p><rprime|'>w<rsub|p
    q>\<Delta\>x<rsub|q><eq-number><label|pq>>>>>
  </eqnarray*>

  \;

  A new symbol <math|\<beta\>> can be introduced to describe the
  relationship. As a consequence, for specific increment
  <math|\<Delta\>x<rsub|q>> of node q\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<Delta\>e>|<cell|=>|<cell|\<beta\><rsub|q>\<Delta\>x<rsub|q>>>>>
  </eqnarray*>

  According to the relationship between each <math|\<Delta\>x<rsub|\<rho\>>>
  and <math|\<Delta\>x<rsub|q>> as in eq. (<reference|pq>) as well as the
  chains from node <math|q> to <math|e>

  <\equation*>
    <with|color|red|e\<longleftarrow\><around*|{|x<rsub|\<rho\>>\|x<rsub|\<rho\>>\<leftarrow\>x<rsub|q>|}>\<longleftarrow\>x<rsub|q>>
  </equation*>

  which means there is a different chain from <math|q> to <math|e> through
  different node <math|\<rho\>>, there is

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<Delta\>e>|<cell|=>|<cell|\<beta\><rsub|q>\<Delta\>x<rsub|q>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|\<rho\>\<in\><around*|{|\<rho\>\|\<rho\>\<leftarrow\>q|}>>\<beta\><rsub|\<rho\>>f<rsub|\<rho\>><rprime|'>w<rsub|\<rho\>q>\<Delta\>x<rsub|q>>>|<row|<cell|\<beta\><rsub|q>>|<cell|=>|<cell|<big|sum><rsub|\<rho\>\<in\><around*|{|\<rho\>\|\<rho\>\<leftarrow\>q|}>>\<beta\><rsub|\<rho\>>f<rsub|\<rho\>><rprime|'>w<rsub|\<rho\>
    q><eq-number><label|beta>>>>>
  </eqnarray*>

  Further simplification can be deduced by multiplying
  <math|f<rprime|'><rsub|q>> to eqn (<reference|beta>)

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<beta\><rsub|q>f<rprime|'><rsub|q>>|<cell|=>|<cell|<big|sum><rsub|\<rho\>\<in\><around*|{|\<rho\>\|\<rho\>\<leftarrow\>q|}>>\<beta\><rsub|\<rho\>>f<rsub|\<rho\>><rprime|'>w<rsub|\<rho\>
    q>f<rprime|'><rsub|q>>>|<row|<cell|\<delta\><rsub|q>>|<cell|=>|<cell|<big|sum><rsub|\<rho\>\<in\><around*|{|\<rho\>\|\<rho\>\<leftarrow\>q|}>>\<delta\><rsub|\<rho\>>w<rsub|\<rho\>
    q>f<rprime|'><rsub|q><eq-number><label|delta>>>>>
  </eqnarray*>

  Eqn (<reference|delta>) is the back propogation rule.

  For the increment of <math|\<Delta\>w<rsub|pq>>, there is relationship
  between two node as

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<Delta\>x<rsub|p>>|<cell|=>|<cell|f<rsub|p><rprime|'>\<Delta\>w<rsub|p
    q>x<rsub|q>>>>>
  </eqnarray*>

  then

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<Delta\>e>|<cell|=>|<cell|\<beta\><rsub|p>\<Delta\>x<rsub|p>>>|<row|<cell|>|<cell|=>|<cell|\<beta\><rsub|p>f<rsub|p><rprime|'>\<Delta\>w<rsub|p
    q>x<rsub|q>>>|<row|<cell|>|<cell|=>|<cell|\<delta\><rsub|p>\<Delta\>w<rsub|p
    q>x<rsub|q>>>>>
  </eqnarray*>

  the update of <math|w<rsub|p q>> is

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<Delta\>w<rsub|p
    q>>|<cell|=>|<cell|-\<eta\>\<delta\><rsub|p>x<rsub|q>>>>>
  </eqnarray*>

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|info-flag|minimal>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|beta|<tuple|2|1>>
    <associate|delta|<tuple|3|1>>
    <associate|pq|<tuple|1|1>>
  </collection>
</references>