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
    <tit|\<#672C\>\<#8D28\>\<#77E9\>\<#9635\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|Op|\<vect\>>\<cdummy\><around*|[|<wide|OO<rprime|'>|\<vect\>>\<times\><wide|O<rprime|'>p<rprime|'>|\<vect\>>|]>>|<cell|=>|<cell|0>>|<row|<cell|\<b-p\>\<cdummy\><around*|[|\<b-t\>\<times\><around*|(|\<cal-R\>\<b-p\><rprime|'>|)>|]>>|<cell|=>|<cell|0>>|<row|<cell|\<cal-M\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|I>|<cell|\<b-0\>>>>>>>>|<row|<cell|\<cal-M\><rprime|'>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<cal-R\><rsup|T>>|<cell|-\<cal-R\>\<b-t\>>>>>>>>|<row|<cell|\<b-p\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|u>|<cell|v>|<cell|1>>>>><rsup|T>>>|<row|<cell|\<b-p\><rprime|'>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|u<rprime|'>>|<cell|v<rprime|'>>|<cell|1>>>>><rsup|T>>>>>
    </eqnarray*>

    \<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\><rsup|T>\<cal-E\>\<b-p\><rprime|'>>|<cell|=>|<cell|0>>>>
    </eqnarray*>

    \<#5176\>\<#4E2D\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-E\>>|<cell|=>|<cell|<around*|[|\<b-t\>|]><rsub|\<times\>>\<cal-R\>>>>>
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
  </hidden>|<\hidden>
    <tit|\<#57FA\>\<#7840\>\<#77E9\>\<#9635\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\>\<cal-F\>\<b-p\><rprime|'>>|<cell|=>|<cell|0>>>>
    </eqnarray*>

    where

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\>>|<cell|=>|<cell|\<cal-K\><wide|\<b-p\>|^>>>|<row|<cell|\<b-p\><rprime|'>>|<cell|=>|<cell|\<cal-K\><rprime|'><wide|\<b-p\>|^><rprime|'>>>|<row|<cell|\<cal-F\>>|<cell|=>|<cell|\<cal-K\><rsup|-T>\<cal-E\>\<cal-K\><rprime|'><rsup|-1>>>>>
    </eqnarray*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-F\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|b>|<cell|a>|<cell|-a\<beta\>-b\<alpha\>>>|<row|<cell|-d>|<cell|-c>|<cell|c\<beta\>+d\<alpha\>>>|<row|<cell|d\<beta\><rprime|'>-b\<alpha\><rprime|'>>|<cell|c\<beta\><rprime|'>-a\<alpha\><rprime|'>>|<cell|-c\<beta\>\<beta\><rprime|'>-d\<beta\><rprime|'>\<alpha\>+a\<beta\>\<alpha\><rprime|'>+b\<alpha\>\<alpha\><rprime|'>>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5F31\>\<#6807\>\<#5B9A\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|u>|<cell|v>|<cell|1>>>>>\<cal-F\><matrix|<tformat|<table|<row|<cell|u<rprime|'>>>|<row|<cell|v<rprime|'>>>|<row|<cell|1>>>>>>|<cell|=>|<cell|0>>|<row|<cell|tr<around*|[|\<cal-F\><matrix|<tformat|<table|<row|<cell|u<rprime|'>>>|<row|<cell|v<rprime|'>>>|<row|<cell|1>>>>><matrix|<tformat|<table|<row|<cell|u>|<cell|v>|<cell|1>>>>>|]>>|<cell|=>|<cell|0>>|<row|<cell|tr<around*|[|\<cal-F\><matrix|<tformat|<table|<row|<cell|u\<nospace\>\<nospace\>u<rprime|'>>|<cell|v\<nospace\>\<nospace\>u<rprime|'>>|<cell|\<nospace\>u<rprime|'>>>|<row|<cell|u\<nospace\>v<rprime|'>>|<cell|v\<nospace\>v<rprime|'>>|<cell|v<rprime|'>>>|<row|<cell|u>|<cell|v>|<cell|1>>>>>|]>>|<cell|=>|<cell|0>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|tr<around*|[|<matrix|<tformat|<table|<row|<cell|F<rsub|11>>|<cell|F<rsub|12>>|<cell|F<rsub|13>>>|<row|<cell|F<rsub|21>>|<cell|F<rsub|22>>|<cell|F<rsub|23>>>|<row|<cell|F<rsub|31>>|<cell|F<rsub|32>>|<cell|F<rsub|33>>>>>><matrix|<tformat|<table|<row|<cell|u\<nospace\>\<nospace\>u<rprime|'>>|<cell|v\<nospace\>\<nospace\>u<rprime|'>>|<cell|\<nospace\>u<rprime|'>>>|<row|<cell|u\<nospace\>v<rprime|'>>|<cell|v\<nospace\>v<rprime|'>>|<cell|v<rprime|'>>>|<row|<cell|u>|<cell|v>|<cell|1>>>>>|]>>|<cell|=>|<cell|0>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|u*u<rprime|'>>|<cell|u*v<rprime|'>>|<cell|u>|<cell|v*u<rprime|'>>|<cell|v*v<rprime|'>>|<cell|v>|<cell|u<rprime|'>>|<cell|v<rprime|'>>|<cell|1>>>>><matrix|<tformat|<table|<row|<cell|<tabular*|<tformat|<table|<row|<cell|F<rsub|11>>>|<row|<cell|F<rsub|12>>>|<row|<cell|F<rsub|13>>>|<row|<cell|F<rsub|21>>>|<row|<cell|F<rsub|22>>>|<row|<cell|F<rsub|23>>>|<row|<cell|F<rsub|31>>>|<row|<cell|F<rsub|32>>>|<row|<cell|F<rsub|33>>>>>>>>>>>>|<cell|=>|<cell|0>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <\tit>
      eight-point algorithm
    </tit>

    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|u<rsub|1>*u<rprime|'><rsub|1>>|<cell|u<rsub|1>*v<rprime|'><rsub|1>>|<cell|u<rsub|1>>|<cell|v<rsub|1>*u<rprime|'><rsub|1>>|<cell|v<rsub|1>*v<rprime|'><rsub|1>>|<cell|v<rsub|1>>|<cell|u<rprime|'><rsub|1>>|<cell|v<rprime|'><rsub|1>>>|<row|<cell|u<rsub|2>*u<rprime|'><rsub|2>>|<cell|u<rsub|2>*v<rprime|'><rsub|2>>|<cell|u<rsub|2>>|<cell|v<rsub|2>*u<rprime|'><rsub|2>>|<cell|v<rsub|2>*v<rprime|'><rsub|2>>|<cell|v<rsub|2>>|<cell|u<rprime|'><rsub|2>>|<cell|v<rprime|'><rsub|2>>>|<row|<cell|u<rsub|3>*u<rprime|'><rsub|3>>|<cell|u<rsub|3>*v<rprime|'><rsub|3>>|<cell|u<rsub|3>>|<cell|v<rsub|3>*u<rprime|'><rsub|3>>|<cell|v<rsub|3>*v<rprime|'><rsub|3>>|<cell|v<rsub|3>>|<cell|u<rprime|'><rsub|3>>|<cell|v<rprime|'><rsub|3>>>|<row|<cell|u<rsub|4>*u<rprime|'><rsub|4>>|<cell|u<rsub|4>*v<rprime|'><rsub|4>>|<cell|u<rsub|4>>|<cell|v<rsub|4>*u<rprime|'><rsub|4>>|<cell|v<rsub|4>*v<rprime|'><rsub|4>>|<cell|v<rsub|4>>|<cell|u<rprime|'><rsub|4>>|<cell|v<rprime|'><rsub|4>>>|<row|<cell|u<rsub|5>*u<rprime|'><rsub|5>>|<cell|u<rsub|5>*v<rprime|'><rsub|5>>|<cell|u<rsub|5>>|<cell|v<rsub|5>*u<rprime|'><rsub|5>>|<cell|v<rsub|5>*v<rprime|'><rsub|5>>|<cell|v<rsub|5>>|<cell|u<rprime|'><rsub|5>>|<cell|v<rprime|'><rsub|5>>>|<row|<cell|u<rsub|6>*u<rprime|'><rsub|6>>|<cell|u<rsub|6>*v<rprime|'><rsub|6>>|<cell|u<rsub|6>>|<cell|v<rsub|6>*u<rprime|'><rsub|6>>|<cell|v<rsub|6>*v<rprime|'><rsub|6>>|<cell|v<rsub|6>>|<cell|u<rprime|'><rsub|6>>|<cell|v<rprime|'><rsub|6>>>|<row|<cell|u<rsub|7>*u<rprime|'><rsub|7>>|<cell|u<rsub|7>*v<rprime|'><rsub|7>>|<cell|u<rsub|7>>|<cell|v<rsub|7>*u<rprime|'><rsub|7>>|<cell|v<rsub|7>*v<rprime|'><rsub|7>>|<cell|v<rsub|7>>|<cell|u<rprime|'><rsub|7>>|<cell|v<rprime|'><rsub|7>>>|<row|<cell|u<rsub|8>*u<rprime|'><rsub|8>>|<cell|u<rsub|8>*v<rprime|'><rsub|8>>|<cell|u<rsub|8>>|<cell|v<rsub|8>*u<rprime|'><rsub|8>>|<cell|v<rsub|8>*v<rprime|'><rsub|8>>|<cell|v<rsub|8>>|<cell|u<rprime|'><rsub|8>>|<cell|v<rprime|'><rsub|8>>>>>><matrix|<tformat|<table|<row|<cell|<tabular*|<tformat|<table|<row|<cell|F<rsub|11>>>|<row|<cell|F<rsub|12>>>|<row|<cell|F<rsub|13>>>|<row|<cell|F<rsub|21>>>|<row|<cell|F<rsub|22>>>|<row|<cell|F<rsub|23>>>|<row|<cell|F<rsub|31>>>|<row|<cell|F<rsub|32>>>>>>>>>>>>|<cell|=>|<cell|-\<b-1\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#4E09\>\<#89C6\>\<#56FE\>>

    <space|4em><image|img/trinocular_epipolar.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|\<#4E09\>\<#76EE\>\<#5BF9\>\<#6781\>\<#51E0\>\<#4F55\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\><rsup|T><rsub|1>\<cal-E\><rsub|12>\<b-p\><rsub|2>>|<cell|=>|<cell|0>>|<row|<cell|\<b-p\><rsup|T><rsub|2>\<cal-E\><rsub|23>\<b-p\><rsub|3>>|<cell|=>|<cell|0>>|<row|<cell|\<b-p\><rsup|T><rsub|3>\<cal-E\><rsub|31>\<b-p\><rsub|1>>|<cell|=>|<cell|0>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|>

    <space|4em><image|img/three_image_lines_intersection.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|\<#4E09\>\<#7126\>\<#51E0\>\<#4F55\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-l\><rsup|T>\<cal-M\>\<b-P\>>|<cell|=>|<cell|\<b-0\>>>>>
    </eqnarray*>

    \<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-L\>\<b-P\>>|<cell|=>|<cell|\<b-0\>>>|<row|<cell|\<cal-L\>>|<cell|\<equiv\>>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-l\><rsub|1><rsup|T>\<cal-M\><rsub|1>>>|<row|<cell|\<b-l\><rsub|2><rsup|T>\<cal-M\><rsub|2>>>|<row|<cell|\<b-l\><rsub|3><rsup|T>\<cal-M\><rsub|3>>>>>>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-L\><rsub|1><rsup|T>>>|<row|<cell|\<b-L\><rsub|2><rsup|T>>>|<row|<cell|\<b-L\><rsub|3><rsup|T>>>>>>>>|<row|<cell|\<b-L\><rsub|i>>|<cell|=>|<cell|\<cal-M\><rsup|T>\<b-l\><rsub|i>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5DF2\>\<#6807\>\<#5B9A\>\<#60C5\>\<#51B5\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-M\><rsub|1>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-I\>>|<cell|\<b-0\>>>>>>>>|<row|<cell|\<cal-M\><rsub|2>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<cal-R\><rsub|2>>|<cell|\<b-t\><rsub|2>>>>>>>>|<row|<cell|\<cal-M\><rsub|1>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<cal-R\><rsub|3>>|<cell|\<b-t\><rsub|3>>>>>>>>>>
    </eqnarray*>

    \<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-L\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-l\><rsub|1><rsup|T>>|<cell|0>>|<row|<cell|\<b-l\><rsub|2><rsup|T>\<cal-R\><rsub|2>>|<cell|\<b-l\><rsub|2><rsup|T>\<b-t\><rsub|2>>>|<row|<cell|\<b-l\><rsub|3><rsup|T>\<cal-R\><rsub|3>>|<cell|\<b-l\><rsub|3><rsup|T>\<b-t\><rsub|3>>>>>>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-l\><rsub|1><rsup|1>>|<cell|\<b-l\><rsub|1><rsup|2>>|<cell|\<b-l\><rsub|1><rsup|3>>|<cell|0>>|<row|<cell|\<b-l\><rsub|2><rsup|T>\<cal-R\><rsub|2><rsup|1>>|<cell|\<b-l\><rsub|2><rsup|T>\<cal-R\><rsub|2><rsup|2>>|<cell|\<b-l\><rsub|2><rsup|T>\<cal-R\><rsub|2><rsup|3>>|<cell|\<b-l\><rsub|2><rsup|T>\<b-t\><rsub|2>>>|<row|<cell|\<b-l\><rsub|3><rsup|T>\<cal-R\><rsub|3><rsup|1>>|<cell|\<b-l\><rsub|3><rsup|T>\<cal-R\><rsub|3><rsup|2>>|<cell|\<b-l\><rsub|3><rsup|T>\<cal-R\><rsub|3><rsup|3>>|<cell|\<b-l\><rsub|3><rsup|T>\<b-t\><rsub|3>>>>>>>>>>
    </eqnarray*>
  </hidden>|<\shown>
    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-l\><rsub|1>\<times\><matrix|<tformat|<table|<row|<cell|\<b-l\><rsub|2><rsup|T>\<cal-G\><rsub|1><rsup|1>\<b-l\><rsub|3>>>|<row|<cell|\<b-l\><rsub|2><rsup|T>\<cal-G\><rsub|1><rsup|2>\<b-l\><rsub|3>>>|<row|<cell|\<b-l\><rsub|2><rsup|T>\<cal-G\><rsub|1><rsup|3>\<b-l\><rsub|3>>>>>>>|<cell|=>|<cell|\<b-0\>>>|<row|<cell|\<cal-G\><rsub|1><rsup|i>>|<cell|=>|<cell|\<b-t\><rsub|2>\<b-R\><rsub|3><rsup|i\<nospace\>T>-\<b-R\><rsub|2><rsup|i>\<b-t\><rsub|3><rsup|T><space|2em>i=1,2,3>>>>
    </eqnarray*>

    \;
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