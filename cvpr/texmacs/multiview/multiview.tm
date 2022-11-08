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
      <tformat|<table|<row|<cell|\<b-t\>>|<cell|=>|<cell|\<delta\>t\<b-v\>>>|<row|<cell|\<cal-R\>>|<cell|=>|<cell|\<b-I\>+\<delta\>t<around*|[|\<b-omega\>|]><rsub|\<times\>>>>|<row|<cell|\<b-p\><rprime|'>>|<cell|=>|<cell|\<b-p\>+\<delta\>t<wide|\<b-p\>|\<dot\>>>>>>
    </eqnarray*>

    \<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\><rsup|T><around*|[|\<b-v\>|]><rsub|\<times\>><around*|(|\<b-I\>+\<delta\>t<around*|[|\<b-omega\>|]><rsub|\<times\>>|)><around*|(|\<b-p\>+\<delta\>t<wide|\<b-p\>|\<dot\>>|)>>|<cell|=>|<cell|0>>|<row|<cell|\<delta\>t\<b-p\><rsup|T><around*|[|\<b-v\>|]><rsub|\<times\>><around*|[|\<b-omega\>|]><rsub|\<times\>>\<b-p\>+\<delta\>t\<b-p\><rsup|T><around*|[|\<b-v\>|]><rsub|\<times\>><wide|\<b-p\>|\<dot\>>>|<cell|\<approx\>>|<cell|0>>|<row|<cell|\<b-p\><rsup|T><around*|[|\<b-v\>|]><rsub|\<times\>><around*|[|\<b-omega\>|]><rsub|\<times\>>\<b-p\>+\<b-p\><around*|[|\<b-v\>|]><rsub|\<times\>><wide|\<b-p\>|\<dot\>>>|<cell|=>|<cell|0>>>>
    </eqnarray*>
  </hidden>|<\shown>
    <tit|\<#53EA\>\<#6709\>\<#5E73\>\<#52A8\>\<#65F6\>>

    <image|img/focus_of_expansion.png|1par|||>
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