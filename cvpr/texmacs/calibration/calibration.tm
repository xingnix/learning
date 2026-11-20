<TeXmacs|2.1>

<style|<tuple|beamer|manila-paper|chinese>>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <doc-data|<doc-title|\<#8BA1\>\<#7B97\>\<#89C6\>\<#89C9\>\<#4E0E\>\<#6A21\>\<#5F0F\>\<#8BC6\>\<#522B\>>>
  </hidden>|<\hidden>
    <tit|\<#51E0\>\<#4F55\>\<#6444\>\<#50CF\>\<#673A\>\<#6A21\>\<#578B\>>

    \;

    <space|4em><image|img/point_line_projections.png|.7par|||>
  </hidden>|<\hidden>
    <tit|\<#5750\>\<#6807\>\<#7CFB\>>

    <space|4em><image|img/coordinate_system.png|.8par|||>
  </hidden>|<\hidden>
    \;

    <image|img/plane_equation.png|1par|||>
  </hidden>|<\hidden>
    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|OP|\<vect\>>>|<cell|=>|<cell|x\<b-i\>+y\<b-j\>+z\<b-k\>>>>>
    </eqnarray*>

    where

    <\eqnarray*>
      <tformat|<table|<row|<cell|x>|<cell|=>|<cell|<wide|OP|\<vect\>>\<cdummy\>\<b-i\>>>|<row|<cell|y>|<cell|=>|<cell|<wide|OP|\<vect\>>\<cdummy\>\<b-j\>>>|<row|<cell|z>|<cell|=>|<cell|<wide|OP|\<vect\>>\<cdummy\>\<b-k\>>>>>
    </eqnarray*>

    and

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-P\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|x>|<cell|y>|<cell|z>>>>><rsup|T>\<in\>\<bbb-R\><rsup|3>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#9F50\>\<#6B21\>\<#5750\>\<#6807\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|a>|<cell|b>|<cell|c>|<cell|-d>>>>><matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>|<row|<cell|z>>|<row|<cell|1>>>>>>|<cell|=>|<cell|0>>|<row|<cell|\<b-Pi\>\<cdummy\>\<b-P\>>|<cell|=>|<cell|0>>|<row|<cell|\<b-Pi\>>|<cell|\<equiv\>>|<cell|<matrix|<tformat|<table|<row|<cell|a>|<cell|b>|<cell|c>|<cell|-d>>>>><rsup|T>>>|<row|<cell|\<b-P\>>|<cell|\<equiv\>>|<cell|<matrix|<tformat|<table|<row|<cell|x>|<cell|y>|<cell|z>|<cell|1>>>>><rsup|T>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|\<#5750\>\<#6807\>\<#53D8\>\<#6362\>\V\V\<#5E73\>\<#79FB\>>

    <space|4em><image|img/pure_translation.png|.8par|||>
  </hidden>|<\hidden>
    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|OP|\<vect\>>>|<cell|=>|<cell|x\<b-i\>+y\<b-j\>+z\<b-k\>>>|<row|<cell|<lsup|F>P>|<cell|=>|<cell|<lsup|F><wide|OP|\<vect\>>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>|<row|<cell|z>>>>>>>|<row|<cell|<lsup|B>P>|<cell|=>|<cell|<lsup|A>P+<lsup|B>O<rsub|A>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5750\>\<#6807\>\<#53D8\>\<#6362\>\V\V\<#65CB\>\<#8F6C\>>

    <space|5em><image|img/pure_rotation.png|.6par|||>
  </hidden>|<\hidden>
    \;

    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|OP|\<vect\>>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-i\><rsub|A>>|<cell|\<b-j\><rsub|A>>|<cell|\<b-k\><rsub|A>>>>>><matrix|<tformat|<table|<row|<cell|A<rsub|x>>|<cell|A<rsub|y>>|<cell|A<rsub|z>>>>>><rsup|T>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-i\><rsub|B>>|<cell|\<b-j\><rsub|B>>|<cell|\<b-k\><rsub|B>>>>>><matrix|<tformat|<table|<row|<cell|B<rsub|x>>|<cell|B<rsub|y>>|<cell|B<rsub|z>>>>>><rsup|T>>>>>
    </eqnarray*>

    \;

    \;
  </hidden>|<\hidden>
    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<lsup|B>P>|<cell|=>|<cell|<lsup|B><lsub|A>\<cal-R\><lsup|A>P>>>>
    </eqnarray*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<lsup|B><lsub|A>\<cal-R\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-i\><rsub|B>>|<cell|\<b-j\><rsub|B>>|<cell|\<b-k\><rsub|B>>>>>><rsup|<rsup|T>><matrix|<tformat|<table|<row|<cell|\<b-i\><rsub|A>>|<cell|\<b-j\><rsub|A>>|<cell|\<b-k\><rsub|A>>>>>>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-i\><rsub|B>\<cdummy\>\<b-i\><rsub|A>>|<cell|\<b-i\><rsub|B>\<cdummy\>\<b-j\><rsub|A>>|<cell|\<b-i\><rsub|B>\<cdummy\>\<b-k\><rsub|A>>>|<row|<cell|\<b-j\><rsub|B>\<cdummy\>\<b-i\><rsub|A>>|<cell|\<b-j\><rsub|B>\<cdummy\>\<b-j\><rsub|A>>|<cell|\<b-j\><rsub|B>\<cdummy\>\<b-k\><rsub|A>>>|<row|<cell|\<b-k\><rsub|B>\<cdummy\>\<b-i\><rsub|A>>|<cell|\<b-k\><rsub|B>\<cdummy\>\<b-j\><rsub|A>>|<cell|\<b-k\><rsub|B>\<cdummy\>\<b-k\><rsub|A>>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <space|2em><image|img/rotation_of_theta.png|.9par|||>
  </hidden>|<\hidden>
    <tit|>

    \;

    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<lsup|B><lsub|A>\<cal-R\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|cos\<theta\>>|<cell|sin\<theta\>>|<cell|0>>|<row|<cell|-sin\<theta\>>|<cell|cos\<theta\>>|<cell|0>>|<row|<cell|0>|<cell|o>|<cell|1>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5750\>\<#6807\>\<#53D8\>\<#6362\>>

    <image|img/rigid_transformation.png|1par|||>
  </hidden>|<\hidden>
    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|<lsup|B>P>>|<row|<cell|1>>>>>>|<cell|=>|<cell|<lsup|B><lsub|A>\<cal-T\><matrix|<tformat|<table|<row|<cell|<lsup|A>P>>|<row|<cell|1>>>>>>>|<row|<cell|<lsup|B><lsub|A>\<cal-T\>>|<cell|\<equiv\>>|<cell|<matrix|<tformat|<table|<row|<cell|<lsup|B><lsub|A>\<cal-R\>>|<cell|<lsup|B>O<rsub|A>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5750\>\<#6807\>\<#65CB\>\<#8F6C\>\<#793A\>\<#4F8B\>>

    <space|2em><image|img/mapping_p.png|0.9par|||>
  </hidden>|<\hidden>
    <\eqnarray*>
      <tformat|<table|<row|<cell|<lsup|F>P<rprime|'>>|<cell|=>|<cell|<lsup|F>P<rprime|''>+\<b-t\>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<cal-R\>>|<cell|\<b-t\>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>><matrix|<tformat|<table|<row|<cell|<lsup|F>P>>|<row|<cell|1>>>>>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<cal-R\><rsup|F>P+\<b-t\>>>|<row|<cell|1>>>>>>>>>
    </eqnarray*>

    where

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-R\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|cos\<theta\>>|<cell|-sin\<theta\>>|<cell|0>>|<row|<cell|sin\<theta\>>|<cell|cos\<theta\>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#51E0\>\<#4F55\>\<#76F8\>\<#673A\>\<#53C2\>\<#6570\>\V\V\<#5185\>\<#53C2\>\<#6570\>>

    <space|3em><image|img/physical_normal_image_coordinate_system.png|.8par|||>
  </hidden>|<\hidden>
    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|\<b-P\>|^>>|<cell|=>|<cell|<frac|1|z><matrix|<tformat|<table|<row|<cell|\<b-I\>>|<cell|\<b-0\>>>>>><matrix|<tformat|<table|<row|<cell|\<b-P\>>>|<row|<cell|1>>>>>>>|<row|<cell|<wide|u|^>>|<cell|=>|<cell|<frac|x|z>>>|<row|<cell|<wide|v|^>>|<cell|=>|<cell|<frac|y|z>>>|<row|<cell|u>|<cell|=>|<cell|k\<nospace\>f<frac|x|z>>>|<row|<cell|v>|<cell|=>|<cell|l\<nospace\>f<frac|y|z>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#4F4D\>\<#7F6E\>\<#53C2\>\<#6570\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|u>|<cell|=>|<cell|\<alpha\><frac|x|z>+<with|color|magenta|u<rsub|0>>>>|<row|<cell|v>|<cell|=>|<cell|\<beta\><frac|y|z>+<with|color|magenta|v<rsub|0>>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|\<#503E\>\<#659C\>\<#53C2\>\<#6570\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|u>|<cell|=>|<cell|\<alpha\><frac|x|z>-\<alpha\>cot<with|color|magenta|\<theta\>><frac|y|z>+u<rsub|0>>>|<row|<cell|v>|<cell|=>|<cell|<frac|\<beta\>|sin<with|color|magenta|\<theta\>>><frac|y|z>+v<rsub|0>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|<math|\<cal-M\>>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\>>|<cell|=>|<cell|<frac|1|z>\<cal-K\><wide|\<b-p\>|^>>>|<row|<cell|\<cal-K\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<alpha\>>|<cell|-\<alpha\>cot\<theta\>>|<cell|u<rsub|0>>>|<row|<cell|0>|<cell|<frac|\<beta\>|sin\<theta\>>>|<cell|v<rsub|0>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>><eq-number><label|k>>>|<row|<cell|\<b-p\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|u>|<cell|v>|<cell|1>>>>><rsup|T>>>|<row|<cell|\<cal-M\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<cal-K\>>|<cell|\<b-0\>>>>>>>>|<row|<cell|\<b-p\>>|<cell|=>|<cell|<frac|1|z>\<cal-M\>\<b-P\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#51E0\>\<#4F55\>\<#76F8\>\<#673A\>\<#53C2\>\<#6570\>\V\V\<#5916\>\<#53C2\>\<#6570\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<lsup|C>P>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|<lsup|C><lsub|W>\<cal-R\>>|<cell|<lsup|C>O<rsub|W>>>>>><matrix|<tformat|<table|<row|<cell|<lsup|W>P>>|<row|<cell|1>>>>>>>|<row|<cell|>|<cell|>|<cell|>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\>>|<cell|=>|<cell|<frac|1|z>\<cal-M\>\<b-P\><space|5em>>>|<row|<cell|\<cal-M\>>|<cell|=>|<cell|\<cal-K\><matrix|<tformat|<table|<row|<cell|\<cal-R\>>|<cell|\<b-t\>>>>>>>>|<row|<cell|<math-tt|<verbatim|>>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-m\><rsub|1>>|<cell|\<b-m\><rsub|2>>|<cell|\<b-m\><rsub|3>>>>>><rsup|T>>>|<row|<cell|u>|<cell|=>|<cell|<frac|\<b-m\><rsub|1><rsup|T>\<b-P\>|\<b-m\><rsub|3><rsup|T>\<b-P\>><eq-number><label|u>>>|<row|<cell|v>|<cell|=>|<cell|<frac|\<b-m\><rsub|2><rsup|T>\<b-P\>|\<b-m\><rsub|3><rsup|T>\<b-P\>><eq-number><label|v>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#6295\>\<#5F71\>\<#77E9\>\<#9635\><math|\<cal-M\>>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-M\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<alpha\>\<b-r\><rsub|1><rsup|T>-\<alpha\>cot\<theta\>\<b-r\><rsub|2><rsup|T>+u<rsub|0>\<b-r\><rsub|3><rsup|T>>|<cell|\<alpha\>t<rsub|x>-\<alpha\>cot\<theta\>t<rsub|y>+u<rsub|0>t<rsub|z>>>|<row|<cell|<frac|\<beta\>|sin\<theta\>>\<b-r\><rsub|2><rsup|T>+v<rsub|0>\<b-r\><rsub|3><rsup|T>>|<cell|<frac|\<beta\>|sin\<theta\>>t<rsub|y>+v<rsub|0>t<rsub|z>>>|<row|<cell|\<b-r\><rsub|3><rsup|T>>|<cell|t<rsub|z>>>>>><space|3em><around*|(|\<#53C2\>\<#8003\>Eq.
      <eqref|k>|)>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<cal-M\>>|<cell|\<b-b\>>>>>>>>|<row|<cell|\<cal-R\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-r\><rsub|1>>|<cell|\<b-r\><rsub|2>>|<cell|\<b-r\><rsub|3><rsup|>>>>>><rsup|T>>>|<row|<cell|\<b-t\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|t<rsub|x>>|<cell|t<rsub|y>>|<cell|t<rsub|z>>>>>><rsup|T>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|<with|math-display|true|<math|\<cal-M\>=<matrix|<tformat|<table|<row|<cell|\<cal-A\>>|<cell|\<b-b\>>>>>>>>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-M\><matrix|<tformat|<table|<row|<cell|\<b-O\>>>|<row|<cell|1>>>>>>|<cell|=>|<cell|0>>|<row|<cell|\<b-O\>>|<cell|=>|<cell|-\<cal-A\><rsup|-1>\<b-b\><space|2em>where
      \ \<cal-A\>=<matrix|<tformat|<table|<row|<cell|\<b-a\><rsub|1>>|<cell|\<b-a\><rsub|2>>|<cell|\<b-a\><rsub|3>>>>>><rsup|T>>>>>
    </eqnarray*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|Det<around*|(|\<cal-A\>|)>>|<cell|\<neq\>>|<cell|0>>|<row|<cell|<around*|(|\<b-a\><rsub|1>\<times\>\<b-a\><rsub|3>|)>\<cdummy\><around*|(|\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|)>>|<cell|=>|<cell|0<space|7em>\<#FF08\>\<#65E0\>\<#503E\>\<#659C\>\<#FF09\>>>|<row|<cell|<around*|\||\<b-a\><rsub|1>\<times\>\<b-a\><rsub|3>|\|>>|<cell|=>|<cell|<around*|\||\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|\|><space|4em>\<#FF08\>\<#7B49\>\<#957F\>\<#5BBD\>\<#6BD4\>\<#FF09\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#4EFF\>\<#5C04\>\<#6295\>\<#5F71\>>

    <space|6em><image|img/affine_projection_models.png|0.6par|||>
  </hidden>|<\hidden>
    <tit|\<#5F31\>\<#900F\>\<#89C6\>\<#6295\>\<#5F71\>\<#6A21\>\<#578B\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\>>|<cell|=>|<cell|\<cal-M\>\<b-P\>>>>>
    </eqnarray*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|x>|<cell|y>|<cell|1>>>>><rsup|T>>>|<row|<cell|\<cal-M\>>|<cell|=>|<cell|<frac|1|Z<rsub|r>>\<cal-K\><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|Z<rsub|r>>>>>><matrix|<tformat|<table|<row|<cell|\<cal-R\>>|<cell|\<b-t\>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>>>>|<row|<cell|\<b-P\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|X>|<cell|Y>|<cell|Z>|<cell|1>>>>><rsup|T>>>|<row|<cell|>|<cell|>|<cell|>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-K\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<cal-K\><rsub|2>>|<cell|p<rsub|0>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>>>>|<row|<cell|\<cal-K\><rsub|2>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<alpha\>>|<cell|-\<alpha\>cot\<theta\>>>|<row|<cell|0>|<cell|<frac|\<beta\>|sin\<theta\>>>>>>>>>|<row|<cell|p<rsub|0>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|u<rsub|0>>|<cell|v<rsub|0>>>>>><rsup|T>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-M\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<cal-A\>>|<cell|\<b-b\>>>>>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|Z<rsub|r>>\<cal-K\><matrix|<tformat|<table|<row|<cell|\<cal-R\><rsub|2>>|<cell|\<b-t\><rsub|2>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|Z<rsub|r>><matrix|<tformat|<table|<row|<cell|\<cal-K\><rsub|2>>|<cell|p<rsub|0>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>><matrix|<tformat|<table|<row|<cell|\<cal-R\><rsub|2>>|<cell|\<b-t\><rsub|2>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|Z<rsub|r>><matrix|<tformat|<table|<row|<cell|\<cal-K\><rsub|2>\<cal-R\><rsub|2>>|<cell|\<cal-K\><rsub|2>\<b-t\><rsub|2>+p<rsub|0>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>>>>|<row|<cell|\<cal-M\><rsub|2>>|<cell|=>|<cell|<frac|1|Z<rsub|r>><matrix|<tformat|<table|<row|<cell|k>|<cell|s>>|<row|<cell|0>|<cell|1>>>>><matrix|<tformat|<table|<row|<cell|\<cal-R\><rsub|2>>|<cell|\<b-t\><rsub|2><rprime|'>>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#7C7B\>\<#900F\>\<#89C6\>\<#6295\>\<#5F71\>\<#6A21\>\<#578B\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|<wide|X|^>>>|<row|<cell|<wide|Y|^>>>|<row|<cell|<wide|Z|^>>>>>>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|X-<frac|X<rsub|r>|Z<rsub|r>><around*|(|Z-Z<rsub|r>|)>>>|<row|<cell|Y-<frac|Y<rsub|r>|Z<rsub|r>><around*|(|Z-Z<rsub|r>|)>>>|<row|<cell|Z<rsub|r>>>>>>>>|<row|<cell|>|<cell|>|<cell|>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-M\>>|<cell|=>|<cell|<frac|1|Z<rsub|r>><wide|<matrix|<tformat|<table|<row|<cell|\<cal-K\><rsub|2>>|<cell|p<rsub|0>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>>|\<wide-overbrace\>><rsup|\<cal-K\>><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|-<frac|X<rsub|r>|Z<rsub|r>>>|<cell|X<rsub|r>>>|<row|<cell|0>|<cell|1>|<cell|-<frac|Y<rsub|r>|Z<rsub|r>>>|<cell|Y<rsub|r>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|Z<rsub|r>>>>>><matrix|<tformat|<table|<row|<cell|\<cal-R\>>|<cell|\<b-t\>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>>>>|<row|<cell|\<cal-M\><rsub|2>>|<cell|=>|<cell|<frac|1|Z<rsub|r>><matrix|<tformat|<table|<row|<cell|\<cal-K\><rsub|2><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|-<frac|X<rsub|r>|Z<rsub|r>>>>|<row|<cell|0>|<cell|1>|<cell|-<frac|Y<rsub|r>|Z<rsub|r>>>>>>>>|<cell|\<cal-K\><rsub|2><matrix|<tformat|<table|<row|<cell|X<rsub|r>>>|<row|<cell|Y<rsub|r>>>>>>+p<rsub|0>Z<rsub|r>>>>>><matrix|<tformat|<table|<row|<cell|\<cal-R\>>|<cell|\<b-t\>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|Z<rsub|r>><matrix|<tformat|<table|<row|<cell|k>|<cell|s>>|<row|<cell|0>|<cell|1>>>>><matrix|<tformat|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|-<frac|X<rsub|r>|Z<rsub|r>>>>|<row|<cell|0>|<cell|1>|<cell|-<frac|Y<rsub|r>|Z<rsub|r>>>>>>>\<cal-R\>>|<cell|\<b-t\><rsub|2><rprime|'>>>>>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|Z<rsub|r>><matrix|<tformat|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|k>|<cell|s>|<cell|-u<rsub|r>>>|<row|<cell|0>|<cell|1>|<cell|-v<rsub|r>>>>>>>|<cell|<matrix|<tformat|<table|<row|<cell|k>|<cell|s>>|<row|<cell|0>|<cell|1>>>>>\<b-t\><rsub|2><rprime|'>>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#76F8\>\<#673A\>\<#6807\>\<#5B9A\>>

    <space|6em><image|img/camera_calibration_setup.png|.7par|||>
  </hidden>|<\hidden>
    <tit|\<#4F30\>\<#8BA1\><math|\<cal-M\>>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<around*|(|\<b-m\><rsub|1>-u<rsub|i>\<b-m\><rsub|3>|)>\<cdummy\>\<b-P\><rsub|i>>|<cell|=>|<cell|0>>|<row|<cell|<around*|(|\<b-m\><rsub|2>-v<rsub|i>\<b-m\><rsub|3>|)>\<cdummy\>\<b-P\><rsub|i>>|<cell|=>|<cell|0>>|<row|<cell|>|<cell|>|<cell|>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-P\>\<b-m\>>|<cell|=>|<cell|0>>>>
    </eqnarray*>

    where

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-P\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-P\><rsub|1><rsup|T>>|<cell|\<b-0\><rsup|T>>|<cell|-u<rsub|1>\<b-P\><rsub|1><rsup|T>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|\<b-P\><rsub|1><rsup|T>>|<cell|-v<rsub|1>\<b-P\><rsub|1><rsup|T>>>|<row|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>>|<row|<cell|\<b-P\><rsub|n><rsup|T>>|<cell|\<b-0\><rsup|T>>|<cell|-u<rsub|n>\<b-P\><rsub|n><rsup|T>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|\<b-P\><rsub|n><rsup|T>>|<cell|-v<rsub|n>\<b-P\><rsub|n><rsup|T>>>>>>>>|<row|<cell|\<b-m\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-m\><rsub|1>>>|<row|<cell|\<b-m\><rsub|2>>>|<row|<cell|\<b-m\><rsub|3>>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#4F30\>\<#8BA1\>\<#5185\>\<#53C2\>\<#6570\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<rho\><matrix|<tformat|<table|<row|<cell|\<cal-A\>>|<cell|\<b-b\>>>>>>>|<cell|=>|<cell|\<cal-K\><matrix|<tformat|<table|<row|<cell|\<cal-R\>>|<cell|\<b-t\>>>>>>>>|<row|<cell|\<rho\><matrix|<tformat|<table|<row|<cell|\<b-a\><rsup|T><rsub|1>>>|<row|<cell|\<b-a\><rsub|2><rsup|T>>>|<row|<cell|\<b-a\><rsub|3><rsup|T>>>>>>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<alpha\>\<b-r\><rsub|1><rsup|T>-\<alpha\>cot\<theta\>\<b-r\><rsup|T><rsub|2>+u<rsub|0>\<b-r\><rsub|3><rsup|T>>>|<row|<cell|<frac|\<beta\>|sin\<theta\>>\<b-r\><rsub|2><rsup|T>+v<rsub|0>\<b-r\><rsub|3><rsup|T>>>|<row|<cell|\<b-r\><rsub|3><rsup|<rsup|T>>>>>>><eq-number><label|ref1>>>>>
    </eqnarray*>

    \;

    \;
  </hidden>|<\hidden>
    \;

    <math|<matrix|<tformat|<table|<row|<cell|\<b-r\><rsub|1>>|<cell|\<b-r\><rsub|2>>|<cell|\<b-r\><rsub|3>>>>>>>\<#4E3A\>\<#5355\>\<#4F4D\>\<#6B63\>\<#4EA4\>\<#9635\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<rho\>\<b-a\><rsub|3>>|<cell|=>|<cell|\<b-r\><rsub|3>>>|<row|<cell|\<rho\>>|<cell|=>|<cell|<frac|\<varepsilon\>|<around*|\||\<b-a\><rsub|3>|\|>>>>|<row|<cell|\<rho\><rsup|2><around*|(|\<b-a\><rsub|1>\<cdummy\>\<b-a\><rsub|3>|)>>|<cell|=>|<cell|u<rsub|0>>>|<row|<cell|\<rho\><rsup|2><around*|(|\<b-a\><rsub|2>\<cdummy\>\<b-a\><rsub|3>|)>>|<cell|=>|<cell|v<rsub|0>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    \<#7531\>Eq. <eqref|ref1> \<#4F7F\>\<#7528\>\<#53C9\>\<#4E58\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<rho\><rsup|2><around*|(|\<b-a\><rsub|1>\<times\>\<b-a\><rsub|3>|)>>|<cell|=>|<cell|-\<alpha\>\<b-r\><rsub|2>-\<alpha\>cot\<theta\>\<b-r\><rsub|1>>>|<row|<cell|\<rho\><rsup|2><around*|\||\<b-a\><rsub|1>\<times\>\<b-a\><rsub|3>|\|>>|<cell|=>|<cell|<frac|a|sin\<theta\>>>>|<row|<cell|\<rho\><rsup|2><around*|(|\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|)>>|<cell|=>|<cell|<frac|\<beta\>|sin\<theta\>>\<b-r\><rsub|1>>>|<row|<cell|\<rho\><rsup|2><around*|\||\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|\|>>|<cell|=>|<cell|<frac|\<beta\>|sin\<theta\>>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    \;

    \;

    \<#5F97\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|cos\<theta\>>|<cell|=>|<cell|-<cfrac|<around*|(|\<b-a\><rsub|1>\<times\>\<b-a\><rsub|3>|)>\<cdummy\><around*|(|\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|)>|<around*|\||\<b-a\><rsub|1>\<times\>\<b-a\><rsub|3>|\|><around*|\||\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|\|>>>>|<row|<cell|\<alpha\>>|<cell|=>|<cell|\<rho\><rsup|2><around*|\||\<b-a\><rsub|1>\<times\>\<b-a\><rsub|3>|\|>sin\<theta\>>>|<row|<cell|\<beta\>>|<cell|=>|<cell|\<rho\><rsup|2><around*|\||\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|\|>sin\<theta\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#4F30\>\<#8BA1\>\<#5916\>\<#53C2\>\<#6570\>>

    \<#7531\>Eq. <eqref|ref1>\<#5F97\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-r\><rsub|1>>|<cell|=>|<cell|<frac|\<rho\><rsup|2>sin\<theta\>|\<beta\>><around*|(|\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|<around*|\||\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|\|>><around*|(|\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|)>>>|<row|<cell|\<b-r\><rsub|2>>|<cell|=>|<cell|\<b-r\><rsub|3>\<times\>\<b-r\><rsub|1>>>>>
    </eqnarray*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-K\>\<b-t\>>|<cell|=>|<cell|\<rho\>\<b-b\>>>|<row|<cell|\<b-t\>>|<cell|=>|<cell|\<rho\>\<cal-K\><rsup|-1>\<b-b\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#9000\>\<#5316\>\<#4F4D\>\<#5F62\>>

    <math|\<cal-P\>>\<#7684\>\<#96F6\>\<#7A7A\>\<#95F4\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-0\>>|<cell|=>|<cell|\<cal-P\>\<b-l\>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-P\><rsub|1><rsup|T>>|<cell|\<b-0\><rsup|T>>|<cell|-u<rsub|1>\<b-P\><rsub|1><rsup|T>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|\<b-P\><rsub|1><rsup|T>>|<cell|-v<rsub|1>\<b-P\><rsub|1><rsup|T>>>|<row|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>>|<row|<cell|\<b-P\><rsub|n><rsup|T>>|<cell|\<b-0\><rsup|T>>|<cell|-u<rsub|n>\<b-P\><rsub|n><rsup|T>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|\<b-P\><rsub|n><rsup|T>>|<cell|-v<rsub|n>\<b-P\><rsub|n><rsup|T>>>>>><matrix|<tformat|<table|<row|<cell|\<b-lambda\>>>|<row|<cell|\<b-mu\>>>|<row|<cell|\<b-nu\>>>>>>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-P\><rsub|1><rsup|T>\<b-lambda\>-u<rsub|1>\<b-P\><rsub|1><rsup|T>\<b-nu\>>>|<row|<cell|\<b-P\><rsub|1><rsup|T>\<b-mu\>-v<rsub|1>\<b-P\><rsub|1><rsup|T>\<b-nu\>>>|<row|<cell|\<cdots\>>>|<row|<cell|\<b-P\><rsub|n><rsup|T>\<b-lambda\>-u<rsub|n>\<b-P\><rsub|n><rsup|T>\<b-nu\>>>|<row|<cell|\<b-P\><rsub|n><rsup|T>\<b-mu\>-v<rsub|n>\<b-P\><rsub|n><rsup|T>\<b-nu\>>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-P\><rsup|T><rsub|i>\<b-lambda\>-<frac|\<b-m\><rsub|1><rsup|T>\<b-P\><rsub|i>|\<b-m\><rsup|T><rsub|3>\<b-P\><rsub|i>>\<b-P\><rsup|T><rsub|i>\<b-nu\>>|<cell|=>|<cell|0>>|<row|<cell|\<b-P\><rsup|T><rsub|i>\<b-mu\>-<frac|\<b-m\><rsub|2><rsup|T>\<b-P\><rsub|i>|\<b-m\><rsup|T><rsub|3>\<b-P\><rsub|i>>\<b-P\><rsup|T><rsub|i>\<b-nu\>>|<cell|=>|<cell|0>>>>
    </eqnarray*>

    \<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-P\><rsup|T><rsub|i><around*|(|\<b-m\><rsub|3>\<b-lambda\><rsup|T>-\<b-m\><rsub|1>\<b-nu\><rsup|T>|)>\<b-P\><rsub|i>>|<cell|=>|<cell|0>>|<row|<cell|\<b-P\><rsup|T><rsub|i><around*|(|\<b-m\><rsub|3>\<b-mu\><rsup|T>-\<b-m\><rsub|2>\<b-nu\><rsup|T>|)>\<b-P\><rsub|i>>|<cell|=>|<cell|0>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    \;

    \;

    \<#82E5\>\<#5B58\>\<#5728\>\<#5E73\>\<#9762\><math|\<Pi\>>\<#4F7F\><math|\<Pi\>\<cdummy\>\<b-P\><rsub|i>=0>\<#FF0C\>\<#5219\>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|\<Pi\>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|\<Pi\>>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|\<Pi\>>>>>>,\<b-m\>
    </equation*>

    \<#5F20\>\<#6210\><math|\<cal-P\>>\<#7684\>\<#96F6\>\<#7A7A\>\<#95F4\>\<#3002\>
  </hidden>|<\hidden>
    <tit|\<#8003\>\<#8651\>\<#5F84\>\<#5411\>\<#7578\>\<#53D8\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\>>|<cell|=>|<cell|<frac|1|z><matrix|<tformat|<table|<row|<cell|<frac|1|\<lambda\>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|1|\<lambda\>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>\<cal-M\>\<b-P\><eq-number><label|lambda>>>|<row|<cell|\<lambda\>>|<cell|=>|<cell|1+<big|sum><rsub|p=1><rsup|q>\<kappa\><rsub|p>d<rsup|2p><space|4em>q\<leqslant\>3>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <\eqnarray*>
      <tformat|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|<wide|u|^>>>|<row|<cell|<wide|v|^>>>|<row|<cell|1>>>>>>|<cell|=>|<cell|\<cal-K\><rsup|-1><matrix|<tformat|<table|<row|<cell|u>>|<row|<cell|v>>|<row|<cell|1>>>>>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|u\<alpha\><rsup|-1>+v\<beta\><rsup|-1>cos\<theta\>>>|<row|<cell|v\<beta\><rsup|-1>sin\<theta\>>>|<row|<cell|1>>>>><space|4em><around*|(|u<rsub|0>=v<rsub|0>=0|)>>>|<row|<cell|\<cal-K\><rsup|-1>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<alpha\><rsup|-1>>|<cell|<frac|cos\<theta\>|\<beta\>>>|<cell|-<frac|u<rsub|0>|\<alpha\>>-<frac|v<rsub|0>cos\<theta\>|\<beta\>>>>|<row|<cell|0>|<cell|<frac|sin\<theta\>|\<beta\>>>|<cell|-<frac|u<rsub|0>\<beta\>|sin\<theta\>>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|<math|d<rsup|2>=<wide|u|^><rsup|2>+<wide|v|^><rsup|2>>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|d<rsup|2>>|<cell|=>|<cell|<wide|u|^><rsup|2>+<wide|v|^><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|u<rsup|2>\<alpha\><rsup|-2>+v<rsup|2>\<beta\><rsup|-2>+2u\<nospace\>v\<alpha\><rsup|-1>\<beta\><rsup|-1>cos\<theta\><eq-number><label|d>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#4F30\>\<#8BA1\>\<#6295\>\<#5F71\>\<#77E9\>\<#9635\>>

    \<#53C2\>\<#8003\>Eq. <eqref|u>,<eqref|v>,<eqref|lambda>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<lambda\><matrix|<tformat|<table|<row|<cell|u>>|<row|<cell|v>>>>>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|<frac|\<b-m\><rsub|1>\<cdummy\>\<b-P\>|\<b-m\><rsub|3>\<cdummy\>\<b-P\>>>>|<row|<cell|<frac|\<b-m\><rsub|2>\<cdummy\>\<b-P\>|\<b-m\><rsub|3>\<cdummy\>\<b-P\>>>>>>>>>|<row|<cell|v<around*|(|\<b-m\><rsub|1>\<cdummy\>\<b-P\>|)>>|<cell|=>|<cell|u<around*|(|\<b-m\><rsub|2>\<cdummy\>\<b-P\>|)>>>>>
    </eqnarray*>

    \;

    \;
  </hidden>|<\hidden>
    \<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-Q\>\<b-n\>>|<cell|=>|<cell|0>>|<row|<cell|\<cal-Q\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|v<rsub|1>\<b-P\><rsup|T><rsub|1>>|<cell|-u<rsub|1>\<b-P\><rsub|1><rsup|T>>>|<row|<cell|\<cdots\>>|<cell|\<cdots\>>>|<row|<cell|v<rsub|n>\<b-P\><rsub|n><rsup|T>>|<cell|-u<rsub|n>\<b-P\><rsub|n><rsup|T>>>>>>>>|<row|<cell|\<b-n\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-m\><rsub|1>>>|<row|<cell|\<b-m\><rsub|2>>>>>>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|\<#5185\>\<#53C2\>\<#6570\>>

    \<#53C2\>\<#8003\>Eq. <eqref|ref1>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<rho\><matrix|<tformat|<table|<row|<cell|\<b-a\><rsub|1><rsup|T>>>|<row|<cell|\<b-a\><rsub|2><rsup|T>>>>>>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<alpha\>\<b-r\><rsub|1><rsup|T>-\<alpha\>cot\<theta\>\<b-r\><rsub|2><rsup|T>>>|<row|<cell|<frac|\<beta\>|sin\<theta\>>\<b-r\><rsub|2><rsup|T>>>>>><eq-number><label|rho>>>|<row|<cell|>|<cell|>|<cell|>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<around*|\||\<rho\>\<b-a\><rsub|1>|\|>>|<cell|=>|<cell|<frac|\<alpha\>|sin\<theta\>>>>|<row|<cell|<around*|\||\<rho\>\<b-a\><rsub|2>|\|>>|<cell|=>|<cell|<frac|\<beta\>|sin\<theta\>>>>|<row|<cell|\<rho\>\<b-a\><rsub|1>\<cdummy\>\<rho\>\<b-a\><rsub|2>>|<cell|=>|<cell|-<frac|\<alpha\>\<beta\>cos\<theta\>|sin<rsup|2>\<theta\>>>>|<row|<cell|cos\<theta\>>|<cell|=>|<cell|-<frac|\<b-a\><rsub|1>\<cdummy\>\<b-a\><rsub|2>|<around*|\||\<b-a\><rsub|1>|\|>\<cdummy\><around*|\||\<b-a\><rsub|2>|\|>>>>|<row|<cell|\<alpha\>>|<cell|=>|<cell|<around*|\||\<rho\>\<b-a\><rsub|1>|\|>sin\<theta\>>>|<row|<cell|\<beta\>>|<cell|=>|<cell|<around*|\||\<rho\>\<b-a\><rsub|2>|\|>sin\<theta\>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|\<#5916\>\<#53C2\>\<#6570\><math|R>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-r\><rsub|1>>|<cell|=>|<cell|<frac|\<varepsilon\>|sin\<theta\>><around*|(|<frac|\<b-a\><rsub|1>|<around*|\||\<b-a\><rsub|1>|\|>>+<frac|\<b-a\><rsub|2>|<around*|\||\<b-a\><rsub|2>|\|>>cos\<theta\>|)>>>|<row|<cell|\<b-r\><rsub|2>>|<cell|=>|<cell|<frac|\<varepsilon\>\<b-a\><rsub|2>|<around*|\||\<b-a\><rsub|2>|\|>>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|\<#5916\>\<#53C2\>\<#6570\><math|\<b-t\>>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|\<alpha\>t<rsub|x>-\<alpha\>t<rsub|y>cot\<theta\>>>|<row|<cell|<cfrac|\<beta\>t<rsub|y>|sin\<theta\>>>>>>>>|<cell|=>|<cell|\<rho\><matrix|<tformat|<table|<row|<cell|b<rsub|1>>>|<row|<cell|b<rsub|2>>>>>>>>|<row|<cell|\<cal-M\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<cal-A\>>|<cell|\<b-b\>>>>>>>>|<row|<cell|\<b-b\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|b<rsub|1>>|<cell|b<rsub|2>>|<cell|b<rsub|3>>>>>><rsup|T>>>|<row|<cell|t<rsub|x>>|<cell|=>|<cell|<frac|\<varepsilon\>|sin\<theta\>><around*|(|<frac|b<rsub|1>|<around*|\||\<b-a\><rsub|1>|\|>>+<frac|b<rsub|2>cos\<theta\>|<around*|\||\<b-a\><rsub|2>|\|>>|)>>>|<row|<cell|t<rsub|y>>|<cell|=>|<cell|<frac|\<varepsilon\>b<rsub|2>|<around*|\||\<b-a\><rsub|2>|\|>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5F84\>\<#5411\>\<#7578\>\<#53D8\>>

    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<around*|(|\<b-m\><rsub|1>-\<lambda\>u\<b-m\><rsub|3>|)>\<cdummy\>\<b-P\>>|<cell|=>|<cell|0>>|<row|<cell|<around*|(|\<b-m\><rsub|2>-\<lambda\>v\<b-m\><rsub|3>|)>\<cdummy\>\<b-P\>>|<cell|=>|<cell|0>>|<row|<cell|\<b-m\><rsub|3>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-r\><rsub|3>>>|<row|<cell|t<rsub|z>>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5F84\>\<#5411\>\<#7578\>\<#53D8\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|d<rsup|2>>|<cell|=>|<cell|<around*|\||<around*|(|u\<alpha\><rsup|-1>+v\<beta\><rsup|-1>cos\<theta\>|)>\<b-r\><rsub|2>-v\<beta\><rsup|-1>sin\<theta\>\<b-r\><rsub|1>|\|><rsup|2><space|5em><around*|(|\<#53C2\>\<#8003\>Eq.
      <eqref|d>|)>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|\<alpha\><rsup|-1>\<beta\><rsup|-1>sin\<theta\>|)><rsup|2><around*|\||<around*|(|<frac|u\<beta\>|sin\<theta\>>+v\<alpha\>cot\<theta\>|)>\<b-r\><rsub|2>-v\<alpha\>\<b-r\><rsub|1>|\|><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|<around*|\||\<rho\>\<b-a\><rsub|1>\<times\>\<rho\>\<b-a\><rsub|2>|\|><rsup|2>><around*|\||<with|color|red|<frac|<with|color|black|u>\<beta\>|sin\<theta\>>\<b-r\><rsub|2>>-v<around*|(|<with|color|magenta|\<alpha\>\<b-r\><rsub|1>-\<alpha\>cot\<theta\>\<b-r\><rsub|2>>|)>|\|><rsup|2><space|4em><around*|(|\<#53C2\>\<#8003\>Eq.
      <eqref|rho>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|<around*|\||u<with|color|red|\<rho\>\<b-a\><rsub|2>>-v<with|color|magenta|\<rho\>\<b-a\><rsub|1>>|\|><rsup|2>|<around*|\||\<rho\>\<b-a\><rsub|1>\<times\>\<rho\>\<b-a\><rsub|2>|\|><rsup|2>>>>|<row|<cell|>|<cell|=>|<cell|<frac|<around*|\||u\<b-a\><rsub|2>-v\<b-a\><rsub|1>|\|><rsup|2>|<around*|\||\<b-a\><rsub|1>\<times\>\<b-a\><rsub|2>|\|><rsup|2>>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|\<#5F20\>\<#6B63\>\<#53CB\>\<#6807\>\<#5B9A\>\<#6CD5\>>

    \<#901A\>\<#8FC7\>\<#7EBF\>\<#6027\>\<#6C42\>\<#89E3\>\<#5185\>\<#53C2\>\<#521D\>\<#503C\>\<#FF0C\>\<#518D\>\<#7ED3\>\<#5408\>Levenberg-Marquardt\<#7B97\>\<#6CD5\>\<#8054\>\<#5408\>\<#4F18\>\<#5316\>\<#5185\>\<#53C2\>\<#3001\>\<#5916\>\<#53C2\>\<#548C\>\<#7578\>\<#53D8\>\<#7CFB\>\<#6570\>\<#FF0C\>\<#6700\>\<#7EC8\>\<#5F97\>\<#5230\>\<#7CBE\>\<#786E\>\<#7684\>\<#6807\>\<#5B9A\>\<#7ED3\>\<#679C\>\<#3002\>

    \<#9488\>\<#5B54\>\<#76F8\>\<#673A\>\<#7684\>\<#9F50\>\<#6B21\>\<#6295\>\<#5F71\>\<#5173\>\<#7CFB\>\<#5B9A\>\<#4E49\>\<#4E3A\>\<#FF1A\>\ 

    <\equation*>
      s\<b-m\>=\<b-K\><around*|[|<tabular*|<tformat|<table|<row|<cell|\<b-R\>>|<cell|\<b-t\>>>>>>|]>\<b-M\>
    </equation*>

    \;
  </hidden>|<\hidden>
    \<#5176\>\<#4E2D\><with|font|roman|\<#FF1A\> >

    - <math|\<b-m\>=<around*|[|<tabular*|<tformat|<table|<row|<cell|u>|<cell|v>|<cell|1>>>>>|]><rsup|T>>\<#FF1A\>\<#9F50\>\<#6B21\>\<#50CF\>\<#7D20\>\<#5750\>\<#6807\><with|font|roman|\<#FF1B\>
    >

    -<math|\<b-M\>=<around*|[|<tabular*|<tformat|<table|<row|<cell|X>|<cell|Y>|<cell|Z>|<cell|1>>>>>|]><rsup|T>>\<#FF1A\>\<#9F50\>\<#6B21\>\<#4E16\>\<#754C\>\<#5750\>\<#6807\><with|font|roman|\<#FF1B\>
    >

    - <math|\<b-K\>=<around*|[|<tabular*|<tformat|<table|<row|<cell|f<rsub|x>>|<cell|\<gamma\>>|<cell|c<rsub|x>>>|<row|<cell|0>|<cell|f<rsub|y>>|<cell|c<rsub|y>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>|]>>\<#FF1A\>\<#76F8\>\<#673A\>\<#5185\>\<#53C2\>\<#77E9\>\<#9635\>\<#FF1B\>\ 

    - <math|\<b-R\>\<in\>\<bbb-R\><rsup|3\<times\>3>><with|font|roman|\<#FF1A\>>\<#65CB\>\<#8F6C\>\<#77E9\>\<#9635\><with|font|roman|\<#FF0C\>>\<#6EE1\>\<#8DB3\><math|\<b-R\><rsup|T>*\<b-R\>=\<b-I\>,det
    <around|(|\<b-R\>|)>=1>\<#FF1B\>\ 

    - <math|\<b-t\>\<in\>\<bbb-R\><rsup|3\<times\>1>>\<#FF1A\>\<#5E73\>\<#79FB\>\<#5411\>\<#91CF\>\<#FF1B\>\ 

    - <math|s>\<#FF1A\>\<#5C3A\>\<#5EA6\>\<#56E0\>\<#5B50\>\<#3002\>

    \;
  </hidden>|<\hidden>
    <tit|\<#5E73\>\<#9762\>\<#6807\>\<#5B9A\>\<#677F\>\<#7684\>\<#5355\>\<#5E94\>\<#6027\>\<#7B80\>\<#5316\>>

    \<#5047\>\<#8BBE\>\<#68CB\>\<#76D8\>\<#6807\>\<#5B9A\>\<#677F\>\<#4F4D\>\<#4E8E\>\<#4E16\>\<#754C\>\<#5750\>\<#6807\>\<#7CFB\>
    <math|Z=0> \<#5E73\>\<#9762\>\<#FF0C\>\<#56E0\>\<#6B64\><math|\<b-M\>>\<#7B80\>\<#5316\>\<#4E3A\><math|\<b-M\>=<around*|[|<tabular*|<tformat|<table|<row|<cell|X>|<cell|Y>|<cell|1>>>>>|]><rsup|T>>\<#FF0C\>\<#4EE3\>\<#5165\>\<#6295\>\<#5F71\>\<#6A21\>\<#578B\>\<#540E\>\<#6D88\>\<#53BB\>\<#65CB\>\<#8F6C\>\<#77E9\>\<#9635\>\<#7B2C\>\<#4E09\>\<#5217\>\<#FF0C\>\<#5F97\>\<#5230\><strong|\<#5355\>\<#5E94\>\<#6027\>\<#53D8\>\<#6362\>>\<#FF1A\>\ 

    <\equation*>
      s\<cdot\>\<b-m\>=\<b-H\>\<b-M\>,<space|1em>\<b-H\>=\<b-K\><around*|[|<tabular*|<tformat|<table|<row|<cell|\<b-r\><rsub|1>>|<cell|\<b-r\><rsub|2>>|<cell|\<b-t\>>>>>>|]>
    </equation*>

    \<#5176\>\<#4E2D\><math|\<b-r\><rsub|1>,\<b-r\><rsub|2>>\<#4E3A\><math|\<b-R\>>\<#7684\>\<#524D\>\<#4E24\>\<#5217\>\<#FF0C\><math|\<b-H\>>\<#4E3A\>
    <math|3\<times\>3> \<#5355\>\<#5E94\>\<#77E9\>\<#9635\>\<#FF0C\>\<#5411\>\<#91CF\>\<#5316\>\<#4E3A\>9\<#7EF4\>\<#5411\>\<#91CF\>

    <\equation*>
      \<b-h\>=<around*|[|<tabular*|<tformat|<table|<row|<cell|h<rsub|11>>|<cell|h<rsub|12>>|<cell|h<rsub|13>>|<cell|h<rsub|21>>|<cell|h<rsub|22>>|<cell|h<rsub|23>>|<cell|h<rsub|31>>|<cell|h<rsub|32>>|<cell|h<rsub|33>>>>>>|]><rsup|T>
    </equation*>
  </hidden>|<\hidden>
    <tit|\<#77E9\>\<#9635\><math|A>\<#7684\>\<#6784\>\<#5EFA\>>

    \<#6D88\>\<#53BB\>\<#5C3A\>\<#5EA6\>\<#56E0\>\<#5B50\><math|s>\<#FF0C\>\<#5C06\>\<#5355\>\<#5E94\>\<#6027\>\<#5C55\>\<#5F00\>\<#4E3A\>\<#5173\>\<#4E8E\><math|\<b-h\>>\<#7684\>\<#7EBF\>\<#6027\>\<#65B9\>\<#7A0B\><with|font|roman|\<#FF1A\>
    >

    <\equation*>
      <choice|<tformat|<table|<row|<cell|h<rsub|11>*X+h<rsub|12>*Y+h<rsub|13>-u\<cdot\><around|(|h<rsub|31>*X+h<rsub|32>*Y+h<rsub|33>|)>=0>>|<row|<cell|h<rsub|21>*X+h<rsub|22>*Y+h<rsub|23>-v\<cdot\><around|(|h<rsub|31>*X+h<rsub|32>*Y+h<rsub|33>|)>=0>>>>>
    </equation*>

    <with|font|fireflysung|\<#5BF9\>>\<#6BCF\>\<#4E00\>\<#5BF9\>\<#5BF9\>\<#5E94\>\<#70B9\><math|<around|(|X,Y|)>>\<#FF08\>\<#4E16\>\<#754C\>\<#FF09\>\<#548C\><math|<around|(|u,v|)>>\<#FF08\>\<#50CF\>\<#7D20\>\<#FF09\>\<#FF0C\>\<#8D21\>\<#732E\>2\<#4E2A\>\<#7EBF\>\<#6027\>\<#65B9\>\<#7A0B\>\<#FF0C\>\<#5BF9\>\<#5E94\>\<#77E9\>\<#9635\><math|A>\<#7684\>2\<#884C\>\<#FF0C\><math|A>\<#7684\>\<#7EF4\>\<#5EA6\>\<#4E3A\><math|2*n\<times\>9>\<#FF08\><math|n>\<#4E3A\>\<#5BF9\>\<#5E94\>\<#70B9\>\<#5BF9\>\<#6570\>\<#FF0C\>\<#53D6\><math|n\<geq\>4>\<#FF09\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|A<rsub|2*i-1>>|<cell|=>|<cell|<around*|[|<tabular*|<tformat|<table|<row|<cell|-X<rsub|i>>|<cell|-Y<rsub|i>>|<cell|-1>|<cell|0>|<cell|0>|<cell|0>|<cell|u<rsub|i>*X<rsub|i>>|<cell|u<rsub|i>*Y<rsub|i>>|<cell|u<rsub|i>>>>>>|]>>>|<row|<cell|A<rsub|2i>>|<cell|=>|<cell|<around*|[|<tabular*|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|0>|<cell|-X<rsub|i>>|<cell|-Y<rsub|i>>|<cell|-1>|<cell|v<rsub|i>*X<rsub|i>>|<cell|v<rsub|i>*Y<rsub|i>>|<cell|v<rsub|i>>>>>>|]>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#8BA1\>\<#7B97\><math|H>>

    <with|font|fireflysung|\<#6784\>\<#5EFA\>\<#5B8C\>\<#6210\>\<#540E\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#77E9\>\<#9635\>><math|A><with|font|fireflysung|\<#6EE1\>\<#8DB3\>\<#9F50\>\<#6B21\>\<#7EBF\>\<#6027\>\<#65B9\>\<#7A0B\>\<#7EC4\>><with|font|roman|\<#FF1A\>
    >

    <\equation*>
      A H=0
    </equation*>

    <with|font|fireflysung|\<#901A\>\<#8FC7\>\<#5BF9\>><math|A><with|font|fireflysung|\<#8FDB\>\<#884C\>\<#5947\>\<#5F02\>\<#503C\>\<#5206\>\<#89E3\>><with|font|roman|\<#FF08\>>SVD<with|font|roman|\<#FF09\>\<#FF0C\>><with|font|fireflysung|\<#53D6\>\<#6700\>\<#5C0F\>\<#5947\>\<#5F02\>\<#503C\>\<#5BF9\>\<#5E94\>\<#7684\>\<#53F3\>\<#5947\>\<#5F02\>\<#5411\>\<#91CF\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#5373\>\<#53EF\>\<#5F97\>\<#5230\>><math|H><with|font|fireflysung|\<#7684\>\<#89E3\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#8FDB\>\<#800C\>\<#91CD\>\<#6784\>\<#51FA\>\<#5355\>\<#5E94\>\<#6027\>\<#77E9\>\<#9635\>><math|H>.
  </hidden>|<\hidden>
    <tit|<code*|\<#5185\>\<#53C2\>\<#77E9\>\<#9635\>\<#6C42\>\<#89E3\>>>

    \<#5229\>\<#7528\>\<#65CB\>\<#8F6C\>\<#77E9\>\<#9635\>\<#5217\>\<#5411\>\<#91CF\>\<#7684\>\<#7EA6\>\<#675F\>\<#FF1A\>

    <\equation*>
      r<rsub|1><rsup|T>r<rsub|2>=0,\<parallel\>r<rsub|1>\<parallel\>=\<parallel\>r<rsub|2>\<parallel\>=1
    </equation*>

    \;

    \<#7531\><math|H=K<around*|[|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|c>|<table|<row|<cell|<with|math-display|false|r<rsub|1>>>|<cell|<with|math-display|false|r<rsub|2>>>|<cell|<with|math-display|false|t>>>>>>|]>>\<#FF0C\>\<#4E24\>\<#8FB9\>\<#5DE6\>\<#4E58\><math|K<rsup|\<minus\>1>>\<#5F97\>\<#FF1A\>

    <\equation*>
      K<rsup|\<minus\>1>H=<around*|[|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|c>|<table|<row|<cell|<with|math-display|false|r<rsub|1>>>|<cell|<with|math-display|false|r<rsub|2>>>|<cell|<with|math-display|false|t>>>>>>|]>
    </equation*>

    \;

    \;
  </hidden>|<\hidden>
    \<#8BBE\><math|H>\<#7684\>\<#5217\>\<#5411\>\<#91CF\>\<#4E3A\><math|H=<around*|[|h<rsub|1>,h<rsub|2>,h<rsub|3>|]>>\<#FF0C\>\<#5B58\>\<#5728\>\<#5C3A\>\<#5EA6\>\<#56E0\>\<#5B50\><math|\<lambda\>>\<#4F7F\>\<#5F97\>\<#FF1A\>

    <\equation*>
      r<rsub|1>=\<lambda\>K<rsup|\<minus\>1>h<rsub|1>,r<rsub|2>=\<lambda\>K<rsup|\<minus\>1>h<rsub|2>
    </equation*>

    \<#4EE3\>\<#5165\>\<#65CB\>\<#8F6C\>\<#7EA6\>\<#675F\>\<#FF0C\>\<#5F97\>\<#5230\>\<#5173\>\<#4E8E\><math|K>\<#7684\>\<#4E24\>\<#4E2A\>\<#6838\>\<#5FC3\>\<#65B9\>\<#7A0B\>\<#FF1A\>

    <\enumerate>
      <item>\<#6B63\>\<#4EA4\>\<#6027\>\<#FF1A\><math|h<rsub|1><rsup|T>K<rsup|\<minus\>T>K<rsup|\<minus\>1>h<rsub|2>=0>

      <item>\<#5355\>\<#4F4D\>\<#957F\>\<#5EA6\>\<#FF1A\><math|h<rsub|1><rsup|T>K<rsup|\<minus\>T>K<rsup|\<minus\>1>h<rsub|1>=h<rsub|2><rsup|T>K<rsup|\<minus\>T>K<rsup|\<minus\>1>h<rsub|2>>\<#3002\>
    </enumerate>

    \<#4EE4\><math|B=K<rsup|\<minus\>T>K<rsup|\<minus\>1>>\<#FF08\>\<#5BF9\>\<#79F0\>\<#6B63\>\<#5B9A\>\<#77E9\>\<#9635\>\<#FF0C\>\<#4EC5\>6\<#4E2A\>\<#72EC\>\<#7ACB\>\<#5143\>\<#7D20\>\<#FF09\>\<#FF0C\>\<#5219\>\<#6BCF\>\<#5F20\>\<#56FE\>\<#50CF\>\<#7684\><math|H>\<#8D21\>\<#732E\>2\<#4E2A\>\<#65B9\>\<#7A0B\>\<#FF0C\>\<#81F3\>\<#5C11\>3\<#5F20\>\<#4E0D\>\<#540C\>\<#59FF\>\<#6001\>\<#7684\>\<#56FE\>\<#50CF\>\<#5373\>\<#53EF\>\<#89E3\>\<#51FA\><math|B>\<#7684\>6\<#4E2A\>\<#672A\>\<#77E5\>\<#5143\>\<#7D20\>\<#3002\>\<#901A\>\<#8FC7\>SVD\<#6C42\>\<#89E3\>\<#7EBF\>\<#6027\>\<#65B9\>\<#7A0B\>\<#7EC4\>\<#5F97\>\<#5230\><math|B>\<#540E\>\<#FF0C\>\<#5229\>\<#7528\>\<#95ED\>\<#5F0F\>\<#89E3\>\<#8FD8\>\<#539F\><math|K>\<#FF1A\>

    \<#7ED3\>\<#5408\><math|B>\<#7684\>\<#5143\>\<#7D20\>\<#FF0C\>\<#4F9D\>\<#6B21\>\<#8BA1\>\<#7B97\>\<#51FA\><math|c<rsub|x>,c<rsub|y>,f<rsub|x>,f<rsub|y>,\<gamma\>>\<#3002\>
  </hidden>|<\hidden>
    <tit|\<#7578\>\<#53D8\>\<#53C2\>\<#6570\>\<#4E0E\>\<#975E\>\<#7EBF\>\<#6027\>\<#4F18\>\<#5316\>>

    \<#5B9E\>\<#9645\>\<#955C\>\<#5934\>\<#5B58\>\<#5728\>\<#FF1A\>

    <item>\<#5F84\>\<#5411\>\<#7578\>\<#53D8\>\<#FF1A\><math|k<rsub|1>,k<rsub|2>,k<rsub|3>>\<#FF08\>\<#753B\>\<#9762\>\<#8FB9\>\<#7F18\>\<#76F4\>\<#7EBF\>\<#5F2F\>\<#66F2\>\<#FF09\>\<#FF1B\>

    <item>\<#5207\>\<#5411\>\<#7578\>\<#53D8\>\<#FF1A\><math|p<rsub|1>,p<rsub|2>>\<#FF08\>\<#955C\>\<#5934\>\<#88C5\>\<#914D\>\<#503E\>\<#659C\>\<#5BFC\>\<#81F4\>\<#7684\>\<#68AF\>\<#5F62\>\<#5931\>\<#771F\>\<#FF09\>\<#3002\>

    \;
  </hidden>|<\hidden>
    <tit|\<#5F84\>\<#5411\>\<#7578\>\<#53D8\>\<#FF08\><math|k<rsub|1>,k<rsub|2>,k<rsub|3>>\<#FF09\>>

    \<#7531\>\<#955C\>\<#5934\>\<#5F62\>\<#72B6\>\<#5BFC\>\<#81F4\>\<#FF0C\>\<#8868\>\<#73B0\>\<#4E3A\>\<#753B\>\<#9762\>\<#8FB9\>\<#7F18\>\<#7684\>\<#6876\>\<#5F62\>/\<#6795\>\<#5F62\>\<#5F2F\>\<#66F2\>\<#FF0C\>\<#516C\>\<#5F0F\>\<#4E3A\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|x<rsub|<with|mode|text|distorted>>>|<cell|=>|<cell|x\<cdot\><around*|(|1+k<rsub|1>r<rsup|2>+k<rsub|2>r<rsup|4>+k<rsub|3>r<rsup|6>|)>>>|<row|<cell|y<rsub|<with|mode|text|distorted>>>|<cell|=>|<cell|y\<cdot\><around*|(|1+k<rsub|1>r<rsup|2>+k<rsub|2>r<rsup|4>+k<rsub|3>r<rsup|6>|)>>>>>
    </eqnarray*>

    \<#5176\>\<#4E2D\><math|r<rsup|2>=x<rsup|2>+y<rsup|2>>\<#4E3A\>\<#5F52\>\<#4E00\>\<#5316\>\<#5750\>\<#6807\>\<#5230\>\<#4E3B\>\<#70B9\>\<#7684\>\<#8DDD\>\<#79BB\>\<#5E73\>\<#65B9\>\<#FF0C\><math|k<rsub|1>,k<rsub|2>>\<#4E3A\>\<#4F4E\>\<#9636\>\<#5F84\>\<#5411\>\<#7578\>\<#53D8\>\<#7CFB\>\<#6570\>\<#FF0C\><math|k<rsub|3>>\<#4E3A\>\<#9AD8\>\<#9636\>\<#5F84\>\<#5411\>\<#7578\>\<#53D8\>\<#7CFB\>\<#6570\>\<#FF08\>\<#5E7F\>\<#89D2\>/\<#9C7C\>\<#773C\>\<#955C\>\<#5934\>\<#9700\>\<#8003\>\<#8651\>\<#FF09\>\<#3002\>
  </hidden>|<\hidden>
    <tit|\<#5207\>\<#5411\>\<#7578\>\<#53D8\>\<#FF08\><math|p<rsub|1>,p<rsub|2>>\<#FF09\>>

    \<#7531\>\<#955C\>\<#5934\>\<#4E0E\>\<#6210\>\<#50CF\>\<#5E73\>\<#9762\>\<#4E0D\>\<#5E73\>\<#884C\>\<#5BFC\>\<#81F4\>\<#FF0C\>\<#8868\>\<#73B0\>\<#4E3A\>\<#68AF\>\<#5F62\>\<#5931\>\<#771F\>\<#FF0C\>\<#516C\>\<#5F0F\>\<#4E3A\>\<#FF1A\>

    <math|<around*|{|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|2|2|cell-halign|l>|<table|<row|<cell|<with|math-display|false|x<rsub|<with|mode|text|distorted>>=x\<cdot\><around*|(|1+k<rsub|1>r<rsup|2>+k<rsub|2>r<rsup|4>+k<rsub|3>r<rsup|6>|)>+2p<rsub|1>xy+p<rsub|2><around*|(|r<rsup|2>+2x<rsup|2>|)>>>>|<row|<cell|<with|math-display|false|y<rsub|<with|mode|text|distorted>>=y\<cdot\><around*|(|1+k<rsub|1>r<rsup|2>+k<rsub|2>r<rsup|4>+k<rsub|3>r<rsup|6>|)>+p<rsub|1><around*|(|r<rsup|2>+2y<rsup|2>|)>+2p<rsub|2>xy>>>>>>|\<nobracket\>>>

    \<#5176\>\<#4E2D\><math|p<rsub|1>,p<rsub|2>>\<#4E3A\>\<#5207\>\<#5411\>\<#7578\>\<#53D8\>\<#7CFB\>\<#6570\>\<#FF0C\>\<#901A\>\<#5E38\>\<#6570\>\<#503C\>\<#8F83\>\<#5C0F\>\<#3002\>
  </hidden>|<\hidden>
    <tit| \<#6295\>\<#5F71\>\<#5173\>\<#7CFB\>>

    \;

    \<#6700\>\<#7EC8\>\<#50CF\>\<#7D20\>\<#5750\>\<#6807\><math|<around*|(|u,v|)>>(u,v)\<#7531\>\<#7578\>\<#53D8\>\<#540E\>\<#7684\>\<#5F52\>\<#4E00\>\<#5316\>\<#5750\>\<#6807\>\<#6295\>\<#5F71\>\<#5F97\>\<#5230\>\<#FF1A\>

    <math|<around*|{|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|2|2|cell-halign|l>|<table|<row|<cell|<with|math-display|false|u=f<rsub|x>\<cdot\>x<rsub|<with|mode|text|distorted>>+c<rsub|x>>>>|<row|<cell|<with|math-display|false|v=f<rsub|y>\<cdot\>y<rsub|<with|mode|text|distorted>>+c<rsub|y>>>>>>>|\<nobracket\>>>

    \;
  </hidden>|<\shown>
    \<#901A\>\<#8FC7\>\<#6700\>\<#5927\>\<#4F3C\>\<#7136\>\<#4F30\>\<#8BA1\>\<#FF08\>MLE\<#FF09\>\<#5BF9\>\<#6240\>\<#6709\>\<#53C2\>\<#6570\>\<#FF08\>\<#5185\>\<#53C2\>\<#3001\>\<#5916\>\<#53C2\>\<#3001\>\<#7578\>\<#53D8\>\<#7CFB\>\<#6570\>\<#FF09\>\<#8FDB\>\<#884C\>\<#975E\>\<#7EBF\>\<#6027\>\<#4F18\>\<#5316\>\<#FF0C\>\<#6700\>\<#5C0F\>\<#5316\>\<#91CD\>\<#6295\>\<#5F71\>\<#8BEF\>\<#5DEE\>\<#FF1A\>

    <\equation*>
      min\<nospace\><big|sum><rsub|i=1><rsup|N><big|sum><rsub|j=1><rsup|M>\<parallel\>m<rsub|ij>\<minus\><wide|m|^><rsub|ij>\<parallel\><rsup|2>
    </equation*>

    \<#5176\>\<#4E2D\><math|m<rsub|ij>>\<#4E3A\>\<#89C2\>\<#6D4B\>\<#50CF\>\<#7D20\>\<#5750\>\<#6807\>\<#FF0C\><math|<wide|m|^><rsub|ij>>\<#4E3A\>\<#6295\>\<#5F71\>\<#540E\>\<#7684\>\<#50CF\>\<#7D20\>\<#5750\>\<#6807\>\<#3002\>

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
    <associate|page-height|auto>
    <associate|page-medium|beamer>
    <associate|page-type|16:9>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|d|<tuple|6|?>>
    <associate|k|<tuple|1|?>>
    <associate|lambda|<tuple|5|?>>
    <associate|ref1|<tuple|4|?>>
    <associate|rho|<tuple|7|?>>
    <associate|u|<tuple|2|?>>
    <associate|v|<tuple|3|?>>
  </collection>
</references>