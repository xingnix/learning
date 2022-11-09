<TeXmacs|2.1.1>

<style|beamer>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <doc-data|<doc-title|<with|font-base-size|20|\<#8BA1\>\<#7B97\>\<#89C6\>\<#89C9\>\<#4E0E\>\<#6A21\>\<#5F0F\>\<#8BC6\>\<#522B\>>>>

    \;
  </hidden>|<\hidden>
    <tit|\<#5BF9\>\<#6781\>\<#51E0\>\<#4F55\>>

    <image|img/epipolar_geometry.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#5BF9\>\<#6781\>\<#7EA6\>\<#675F\>>

    <image|img/epipolar_constraint.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#5DF2\>\<#6807\>\<#5B9A\>\<#60C5\>\<#51B5\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|Op|\<vect\>>\<cdummy\><around*|[|<wide|OO<rprime|'>|\<vect\>>\<times\><wide|O<rprime|'>p<rprime|'>|\<vect\>>|]>>|<cell|=>|<cell|0>>|<row|<cell|\<b-p\>\<cdummy\><around*|[|\<b-t\>\<times\><around*|(|\<cal-R\>\<b-p\><rprime|'>|)>|]>>|<cell|=>|<cell|0>>|<row|<cell|\<cal-M\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|I>|<cell|\<b-0\>>>>>>>>|<row|<cell|\<cal-M\><rprime|'>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<cal-R\><rsup|T>>|<cell|-\<cal-R\>\<b-t\>>>>>>>>|<row|<cell|\<b-p\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|u>|<cell|v>|<cell|1>>>>><rsup|T>>>|<row|<cell|\<b-p\><rprime|'>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|u<rprime|'>>|<cell|v<rprime|'>>|<cell|1>>>>><rsup|T>>>>>
    </eqnarray*>

    \<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\><rsup|T>\<b-varepsilon\>\<b-p\><rprime|'>>|<cell|=>|<cell|0>>>>
    </eqnarray*>

    \<#5176\>\<#4E2D\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-varepsilon\>>|<cell|=>|<cell|<around*|[|\<b-t\>|]><rsub|\<times\>>\<cal-R\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5FAE\>\<#5C0F\>\<#8FD0\>\<#52A8\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|f<around*|(|s|)>>|<cell|=>|<cell|\<b-p\><rsup|T><around*|[|\<b-t\><around*|(|s|)>|]><rsub|\<times\>>\<cal-R\><around*|(|s|)>\<b-p\><rprime|'><around*|(|s|)>>>|<row|<cell|>|<cell|=>|<cell|0>>>>
    </eqnarray*>

    where

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-t\><around*|(|s|)>>|<cell|=>|<cell|s\<b-v\>>>|<row|<cell|\<cal-R\><around*|(|s|)>>|<cell|=>|<cell|\<b-I\>+s<around*|[|\<b-omega\>|]><rsub|\<times\>>>>|<row|<cell|\<b-p\><rprime|'><around*|(|s|)>>|<cell|=>|<cell|\<b-p\>+s<wide|\<b-p\>|\<dot\>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<mathd\>|\<mathd\>s>f<around*|(|s|)>>|<cell|=>|<cell|\<b-p\><rsup|T><around*|[|\<b-v\>|]><rsub|\<times\>><around*|(|\<b-I\>+s<around*|[|\<b-omega\>|]><rsub|\<times\>>|)><around*|(|\<b-p\>+s<wide|\<b-p\>|\<dot\>>|)>+\<b-p\><rsup|T><around*|[|s\<b-v\>|]><rsub|\<times\>><around*|[|\<b-omega\>|]><rsub|\<times\>><around*|(|\<b-p\>+s<wide|\<b-p\>|\<dot\>>|)>>>|<row|<cell|>|<cell|>|<cell|+\<b-p\><rsup|T><around*|[|s\<b-v\>|]><rsub|\<times\>><around*|(|\<b-I\>+s<around*|[|\<b-omega\>|]><rsub|\<times\>>|)><wide|\<b-p\>|\<dot\>>>>|<row|<cell|<around*|\<nobracket\>|<frac|\<mathd\>|\<mathd\>s>f<around*|(|s|)>|\|><rsub|s=0>>|<cell|=>|<cell|\<b-p\><rsup|T><around*|[|\<b-v\>|]><rsub|\<times\>>\<b-p\>>>|<row|<cell|>|<cell|=>|<cell|0>>|<row|<cell|<around*|\<nobracket\>|<frac|\<mathd\><rsup|2>|\<mathd\>s<rsup|2>>f<around*|(|s|)>|\|><rsub|s=0>>|<cell|=>|<cell|\<b-p\><rsup|T><around*|[|\<b-v\>|]><rsub|\<times\>><around*|[|\<b-omega\>|]><rsub|\<times\>>\<b-p\>+\<b-p\><rsup|T><around*|[|\<b-v\>|]><rsub|\<times\>><wide|\<b-p\>|\<dot\>>+\<b-p\><rsup|T><around*|[|\<b-v\>|]><rsub|\<times\>><around*|[|\<b-omega\>|]><rsub|\<times\>>\<b-p\>+\<b-p\><rsup|T><around*|[|\<b-v\>|]><rsub|\<times\>><wide|\<b-p\>|\<dot\>>>>|<row|<cell|>|<cell|=>|<cell|2<around*|(|\<b-p\><rsup|T><around*|[|\<b-v\>|]><rsub|\<times\>><around*|[|\<b-omega\>|]><rsub|\<times\>>\<b-p\>+\<b-p\><rsup|T><around*|[|\<b-v\>|]><rsub|\<times\>><wide|\<b-p\>|\<dot\>>|)>>>>>
    </eqnarray*>

    \<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\><rsup|T><around*|[|\<b-v\>|]><rsub|\<times\>><around*|[|\<b-omega\>|]><rsub|\<times\>>\<b-p\>+\<b-p\><rsup|T><around*|[|\<b-v\>|]><rsub|\<times\>><wide|\<b-p\>|\<dot\>>>|<cell|=>|<cell|0>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5E73\>\<#52A8\>>

    <image|img/focus_of_expansion.png|1par|||>
  </hidden>|<\shown>
    <tit|\<#672A\>\<#6807\>\<#5B9A\>\<#60C5\>\<#51B5\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\>\<cal-F\>\<b-p\><rprime|'>>|<cell|=>|<cell|0>>>>
    </eqnarray*>

    where

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\>>|<cell|=>|<cell|\<cal-K\><wide|\<b-p\>|^>>>|<row|<cell|\<b-p\><rprime|'>>|<cell|=>|<cell|\<cal-K\><rprime|'><wide|\<b-p\>|^><rprime|'>>>|<row|<cell|\<cal-F\>>|<cell|=>|<cell|\<cal-K\><rsup|-T>\<varepsilon\>\<cal-K\><rprime|'><rsup|-1>>>>>
    </eqnarray*>
  </shown>>
</body>

<\initial>
  <\collection>
    <associate|font|roman>
    <associate|font-base-size|12>
    <associate|font-family|rm>
    <associate|info-flag|minimal>
    <associate|math-font|roman>
    <associate|page-medium|beamer>
    <associate|preamble|false>
  </collection>
</initial>