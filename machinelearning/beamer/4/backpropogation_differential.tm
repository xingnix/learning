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

  For the contribution of the differential <math|\<mathd\>x<rsub|r>> which is
  the output of a specific node

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<mathd\> e>|<cell|=>|<cell|l<rsub|r><rprime|'>\<mathd\>x<rsub|r>>>|<row|<cell|\<mathd\>
    x<rsub|p>>|<cell|=>|<cell|f<rsub|p><rprime|'>w<rsub|p
    q>\<mathd\>x<rsub|q><eq-number><label|pq>>>>>
  </eqnarray*>

  \;

  A new symbol <math|\<beta\>> can be introduced to describe the
  relationship. As a consequence, for the differential
  <math|\<mathd\>x<rsub|q>> of a specific node q\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<mathd\>e>|<cell|=>|<cell|\<beta\><rsub|q>\<mathd\>x<rsub|q>>>>>
  </eqnarray*>

  According to the relationship between each <math|\<mathd\>x<rsub|\<rho\>>>
  and <math|\<mathd\>x<rsub|q>> as in eq. (<reference|pq>) as well as the
  chains from node <math|q> to <math|e>

  <\equation*>
    <with|color|red|e\<longleftarrow\><around*|{|x<rsub|\<rho\>>\|x<rsub|\<rho\>>\<leftarrow\>x<rsub|q>|}>\<longleftarrow\>x<rsub|q>>
  </equation*>

  which means <with|color|red|there is a different chain from <math|q> to
  <math|e> through different node <math|\<rho\>>>, there is

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<mathd\>e>|<cell|=>|<cell|\<beta\><rsub|q>\<mathd\>x<rsub|q>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|\<rho\>\<in\><around*|{|\<rho\>\|\<rho\>\<leftarrow\>q|}>>\<beta\><rsub|\<rho\>>f<rsub|\<rho\>><rprime|'>w<rsub|\<rho\>q>\<mathd\>x<rsub|q>>>|<row|<cell|\<beta\><rsub|q>>|<cell|=>|<cell|<big|sum><rsub|\<rho\>\<in\><around*|{|\<rho\>\|\<rho\>\<leftarrow\>q|}>>\<beta\><rsub|\<rho\>>f<rsub|\<rho\>><rprime|'>w<rsub|\<rho\>
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

  For the differential of <math|\<mathd\>w<rsub|pq>>, there is relationship
  between two node as

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<mathd\>x<rsub|p>>|<cell|=>|<cell|f<rsub|p><rprime|'>\<cdot\>\<mathd\>w<rsub|p
    q>\<cdot\>x<rsub|q>>>>>
  </eqnarray*>

  then

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<mathd\>e>|<cell|=>|<cell|\<beta\><rsub|p>\<mathd\>x<rsub|p>>>|<row|<cell|>|<cell|=>|<cell|\<beta\><rsub|p>f<rsub|p><rprime|'>\<cdot\>\<mathd\>w<rsub|p
    q>\<cdot\>x<rsub|q>>>|<row|<cell|>|<cell|=>|<cell|\<delta\><rsub|p>\<cdot\>\<mathd\>w<rsub|p
    q>\<cdot\>x<rsub|q>>>>>
  </eqnarray*>

  the update of <math|w<rsub|p q>> is

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<Delta\>w<rsub|p
    q>>|<cell|=>|<cell|-\<eta\>\<delta\><rsub|p>x<rsub|q>>>|<row|<cell|w<rsub|p
    q>>|<cell|\<leftarrow\>>|<cell|w<rsub|p q>+\<Delta\>w<rsub|p q>>>>>
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
    <associate|beta|<tuple|2|1|backpropogation_Delta.tm>>
    <associate|delta|<tuple|3|1|backpropogation_Delta.tm>>
    <associate|pq|<tuple|1|1|backpropogation_Delta.tm>>
  </collection>
</references>