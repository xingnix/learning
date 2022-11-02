<TeXmacs|2.1.1>

<style|<tuple|beamer|blackboard>>

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

    <image|img/point_line_projections.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#5750\>\<#6807\>\<#7CFB\>>

    <image|img/coordinate_system.png|1par|||>
  </hidden>|<\hidden>
    <tit|>

    <image|img/plane_equation.png|1par|||>
  </hidden>|<\hidden>
    <tit|>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|OP|\<vect\>>>|<cell|=>|<cell|x\<b-i\>+y\<b-j\>+z\<b-k\>>>>>
    </eqnarray*>

    where

    <\eqnarray*>
      <tformat|<table|<row|<cell|x>|<cell|=>|<cell|<wide|OP|\<vect\>>\<cdummy\>\<b-i\>>>|<row|<cell|y>|<cell|=>|<cell|<wide|OP|\<vect\>>\<cdummy\>\<b-j\>>>|<row|<cell|z>|<cell|=>|<cell|<wide|OP|\<vect\>>\<cdummy\>\<b-k\>>>>>
    </eqnarray*>

    and

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-P\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>|<row|<cell|z>>>>>\<in\>\<bbb-R\><rsup|3>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#9F50\>\<#6B21\>\<#5750\>\<#6807\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|a>|<cell|b>|<cell|c>|<cell|-d>>>>><matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>|<row|<cell|z>>|<row|<cell|1>>>>>>|<cell|=>|<cell|0>>|<row|<cell|\<b-Pi\>\<cdummy\>\<b-P\>>|<cell|=>|<cell|0>>|<row|<cell|\<b-Pi\>>|<cell|\<equiv\>>|<cell|<matrix|<tformat|<table|<row|<cell|a>>|<row|<cell|b>>|<row|<cell|c>>|<row|<cell|-d>>>>>>>|<row|<cell|\<b-P\>>|<cell|\<equiv\>>|<cell|<matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>|<row|<cell|z>>|<row|<cell|1>>>>>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|\<#5750\>\<#6807\>\<#53D8\>\<#6362\>\V\V\<#5E73\>\<#79FB\>>

    <image|img/pure_translation.png|1par|||>
  </hidden>|<\hidden>
    <tit|>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|OP|\<vect\>>>|<cell|=>|<cell|x\<b-i\>+y\<b-j\>+z\<b-k\>>>|<row|<cell|<lsup|F>P>|<cell|=>|<cell|<lsup|F><wide|OP|\<vect\>>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>|<row|<cell|z>>>>>>>|<row|<cell|<lsup|B>P>|<cell|=>|<cell|<lsup|A>P+<lsup|B>O<rsub|A>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5750\>\<#6807\>\<#53D8\>\<#6362\>\V\V\<#65CB\>\<#8F6C\>>

    <image|img/pure_rotation.png|1par|||>
  </hidden>|<\hidden>
    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|OP|\<vect\>>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-i\><rsub|A>>|<cell|\<b-j\><rsub|A>>|<cell|\<b-k\><rsub|A>>>>>><matrix|<tformat|<table|<row|<cell|A<rsub|x>>>|<row|<cell|A<rsub|y>>>|<row|<cell|A<rsub|z>>>>>>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-i\><rsub|B>>|<cell|\<b-j\><rsub|B>>|<cell|\<b-k\><rsub|B>>>>>><matrix|<tformat|<table|<row|<cell|B<rsub|x>>>|<row|<cell|B<rsub|y>>>|<row|<cell|B<rsub|z>>>>>>>>>>
    </eqnarray*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<lsup|B>P>|<cell|=>|<cell|<lsup|B><lsub|A>\<cal-R\><lsup|A>P>>>>
    </eqnarray*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<lsup|B><lsub|A>\<cal-R\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-i\><rsub|B>>|<cell|\<b-j\><rsub|B>>|<cell|\<b-k\><rsub|B>>>>>><rsup|<rsup|T>><matrix|<tformat|<table|<row|<cell|\<b-i\><rsub|A>>|<cell|\<b-j\><rsub|A>>|<cell|\<b-k\><rsub|A>>>>>>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-i\><rsub|B>\<cdummy\>\<b-i\><rsub|A>>|<cell|\<b-i\><rsub|B>\<cdummy\>\<b-j\><rsub|A>>|<cell|\<b-i\><rsub|B>\<cdummy\>\<b-k\><rsub|A>>>|<row|<cell|\<b-j\><rsub|B>\<cdummy\>\<b-i\><rsub|A>>|<cell|\<b-j\><rsub|B>\<cdummy\>\<b-j\><rsub|A>>|<cell|\<b-j\><rsub|B>\<cdummy\>\<b-k\><rsub|A>>>|<row|<cell|\<b-k\><rsub|B>\<cdummy\>\<b-i\><rsub|A>>|<cell|\<b-k\><rsub|B>\<cdummy\>\<b-j\><rsub|A>>|<cell|\<b-k\><rsub|B>\<cdummy\>\<b-k\><rsub|A>>>>>>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|>

    <image|img/rotation_of_theta.png|1par|||>
  </hidden>|<\hidden>
    <tit|>

    \;

    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<lsup|B><lsub|A>\<cal-R\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|cos\<theta\>>|<cell|sin\<theta\>>|<cell|0>>|<row|<cell|-sin\<theta\>>|<cell|cos\<theta\>>|<cell|0>>|<row|<cell|0>|<cell|o>|<cell|1>>>>>>>>>
    </eqnarray*>
  </hidden>|<\shown>
    <tit|\<#5750\>\<#6807\>\<#53D8\>\<#6362\>>

    <image|img/rigid_transformation.png|1par|||>
  </shown>|<\hidden>
    <tit|>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|<lsup|B>P>>|<row|<cell|1>>>>>>|<cell|=>|<cell|<lsup|B><lsub|A>\<cal-T\><matrix|<tformat|<table|<row|<cell|<lsup|A>P>>|<row|<cell|1>>>>>>>|<row|<cell|<lsup|B><lsub|A>\<cal-T\>>|<cell|\<equiv\>>|<cell|<matrix|<tformat|<table|<row|<cell|<lsup|B><lsub|A>\<cal-R\>>|<cell|<lsup|B>O<rsub|A>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5750\>\<#6807\>\<#65CB\>\<#8F6C\>\<#793A\>\<#4F8B\>>

    <image|img/mapping_p.png|1par|||>
  </hidden>|<\hidden>
    <tit|>

    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<lsup|F>P<rprime|'>>|<cell|=>|<cell|\<cal-R\><rsup|F>P>>>>
    </eqnarray*>

    where

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-R\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|cos\<theta\>>|<cell|-sin\<theta\>>|<cell|0>>|<row|<cell|sin\<theta\>>|<cell|cos\<theta\>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#51E0\>\<#4F55\>\<#76F8\>\<#673A\>\<#53C2\>\<#6570\>\V\V\<#5185\>\<#53C2\>\<#6570\>>

    <image|img/physical_normal_image_coordinate_system.png|1par|||>
  </hidden>|<\hidden>
    <tit|>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|\<b-P\>|^>>|<cell|=>|<cell|<frac|1|z><matrix|<tformat|<table|<row|<cell|\<b-I\>>|<cell|\<b-0\>>>>>><matrix|<tformat|<table|<row|<cell|\<b-P\>>>|<row|<cell|1>>>>>>>|<row|<cell|<wide|u|^>>|<cell|=>|<cell|<frac|x|z>>>|<row|<cell|<wide|v|^>>|<cell|=>|<cell|<frac|y|z>>>|<row|<cell|u>|<cell|=>|<cell|k\<nospace\>f<frac|x|z>>>|<row|<cell|v>|<cell|=>|<cell|l\<nospace\>f<frac|y|z>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|>

    <\eqnarray*>
      <tformat|<table|<row|<cell|u>|<cell|=>|<cell|\<alpha\><frac|x|z>+u<rsub|0>>>|<row|<cell|v>|<cell|=>|<cell|\<beta\><frac|y|z>+v<rsub|0>>>>>
    </eqnarray*>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|u>|<cell|=>|<cell|\<alpha\><frac|x|z>-\<alpha\>cot\<theta\><frac|y|z>+u<rsub|0>>>|<row|<cell|v>|<cell|=>|<cell|<frac|\<beta\>|sin\<theta\>><frac|y|z>+v<rsub|0>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-P\>>|<cell|=>|<cell|<frac|1|z>\<cal-M\><wide|\<b-P\>|^>>>|<row|<cell|\<b-P\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|u>>|<row|<cell|v>>|<row|<cell|1>>>>>>>|<row|<cell|\<cal-M\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<cal-K\>>|<cell|\<b-0\>>>>>>>>|<row|<cell|\<cal-K\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<alpha\>>|<cell|-\<alpha\>cot\<theta\>>|<cell|u<rsub|0>>>|<row|<cell|0>|<cell|<frac|\<beta\>|sin\<theta\>>>|<cell|v<rsub|0>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#51E0\>\<#4F55\>\<#76F8\>\<#673A\>\<#53C2\>\<#6570\>\V\V\<#5916\>\<#53C2\>\<#6570\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<lsup|C>P>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|<lsup|C><lsub|W>\<cal-R\>>|<cell|<lsup|C>O<rsub|W>>>>>><matrix|<tformat|<table|<row|<cell|<lsup|W>P>>|<row|<cell|1>>>>>>>|<row|<cell|\<b-p\>>|<cell|=>|<cell|<frac|1|z>\<cal-M\>\<b-P\><space|5em>\<cal-M\>=\<cal-K\><matrix|<tformat|<table|<row|<cell|\<cal-R\>>|<cell|\<b-t\>>>>>><math-tt|<verbatim|>>=<matrix|<tformat|<table|<row|<cell|\<b-m\><rsub|1><rsup|T>>>|<row|<cell|\<b-m\><rsub|2><rsup|T>>>|<row|<cell|\<b-m\><rsup|T><rsub|3>>>>>>>>|<row|<cell|u>|<cell|=>|<cell|<frac|\<b-m\><rsub|1><rsup|T>\<b-P\>|\<b-m\><rsub|3><rsup|T>\<b-P\>>>>|<row|<cell|v>|<cell|=>|<cell|<frac|\<b-m\><rsub|2><rsup|T>\<b-P\>|\<b-m\><rsub|3><rsup|T>\<b-P\>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#6295\>\<#5F71\>\<#77E9\>\<#9635\><math|\<cal-M\>>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-M\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<alpha\>\<b-r\><rsub|1><rsup|T>-\<alpha\>cot\<theta\>\<b-r\><rsub|2><rsup|T>+u<rsub|0>\<b-r\><rsub|3><rsup|T>>|<cell|\<alpha\>t<rsub|x>-\<alpha\>cot\<theta\>t<rsub|y>+u<rsub|0>t<rsub|z>>>|<row|<cell|<frac|\<beta\>|sin\<theta\>>\<b-r\><rsub|2><rsup|T>+v<rsub|0>\<b-r\><rsub|3><rsup|T>>|<cell|<frac|\<beta\>|sin\<theta\>>t<rsub|y>+v<rsub|0>t<rsub|z>>>|<row|<cell|\<b-r\><rsub|3><rsup|T>>|<cell|t<rsub|z>>>>>>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<cal-M\>>|<cell|\<b-b\>>>>>>>>|<row|<cell|\<cal-R\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-r\><rsub|1><rsup|T>>>|<row|<cell|\<b-r\><rsub|2><rsup|T>>>|<row|<cell|\<b-r\><rsub|3><rsup|<rsup|T>>>>>>>>>|<row|<cell|\<b-t\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|t<rsub|x>>>|<row|<cell|t<rsub|y>>>|<row|<cell|t<rsub|z>>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|<with|math-display|true|<math|\<cal-M\>=<matrix|<tformat|<table|<row|<cell|\<cal-A\>>|<cell|\<b-b\>>>>>>>>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-M\><matrix|<tformat|<table|<row|<cell|\<b-O\>>>|<row|<cell|1>>>>>>|<cell|=>|<cell|0>>|<row|<cell|\<b-O\>>|<cell|=>|<cell|-\<cal-A\><rsup|-1>\<b-b\>>>>>
    </eqnarray*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|Det<around*|(|\<cal-A\>|)>>|<cell|\<neq\>>|<cell|0>>|<row|<cell|<around*|(|\<b-a\><rsub|1>\<times\>\<b-a\><rsub|3>|)>\<cdummy\><around*|(|\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|)>>|<cell|=>|<cell|0>>|<row|<cell|<around*|\||\<b-a\><rsub|1>\<times\>\<b-a\><rsub|3>|\|>>|<cell|=>|<cell|<around*|\||\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|\|>>>>>
    </eqnarray*>

    where

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-A\>>|<cell|=<matrix|<tformat|<table|<row|<cell|\<b-a\><rsub|1><rsup|T>>>|<row|<cell|\<b-a\><rsub|2><rsup|T>>>|<row|<cell|\<b-a\><rsub|3><rsup|T>>>>>>>|<cell|>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#4EFF\>\<#5C04\>\<#6295\>\<#5F71\>>

    <space|2em><image|img/affine_projection_models.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#5F31\>\<#900F\>\<#89C6\>\<#6295\>\<#5F71\>\<#6A21\>\<#578B\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\>>|<cell|=>|<cell|\<cal-M\>\<b-P\>>>>>
    </eqnarray*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|x>|<cell|y>>>>><rsup|T>>>|<row|<cell|\<cal-M\>>|<cell|=>|<cell|<frac|1|Z<rsub|r>>\<cal-K\><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|Z<rsub|r>>>>>><matrix|<tformat|<table|<row|<cell|\<cal-R\>>|<cell|\<b-t\>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>>>>|<row|<cell|\<b-P\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|X>|<cell|Y>|<cell|Z>|<cell|1>>>>><rsup|T>>>|<row|<cell|\<cal-K\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<cal-K\><rsub|2>>|<cell|p<rsub|0>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>>>>|<row|<cell|\<cal-K\><rsub|2>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<alpha\>>|<cell|-\<alpha\>cot\<theta\>>>|<row|<cell|0>|<cell|<frac|\<beta\>|sin\<theta\>>>>>>>>>|<row|<cell|p<rsub|0>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|x<rsub|0>>|<cell|y<rsub|0>>>>>><rsup|T>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-M\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<cal-A\>>|<cell|\<b-b\>>>>>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|Z<rsub|r>>\<cal-K\><matrix|<tformat|<table|<row|<cell|\<cal-R\><rsub|2>>|<cell|\<b-t\><rsub|2>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|Z<rsub|r>><matrix|<tformat|<table|<row|<cell|\<cal-K\><rsub|2>>|<cell|p<rsub|0>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>><matrix|<tformat|<table|<row|<cell|\<cal-R\><rsub|2>>|<cell|\<b-t\><rsub|2>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|Z<rsub|r>><matrix|<tformat|<table|<row|<cell|\<cal-K\><rsub|2>\<cal-R\><rsub|2>>|<cell|\<cal-K\><rsub|2>\<b-t\><rsub|2>+p<rsub|0>>>>>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|Z<rsub|r>><matrix|<tformat|<table|<row|<cell|k>|<cell|s>>|<row|<cell|0>|<cell|1>>>>><matrix|<tformat|<table|<row|<cell|\<cal-R\><rsub|2>>|<cell|\<b-t\><rsub|2>>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#7C7B\>\<#900F\>\<#89C6\>\<#6295\>\<#5F71\>\<#6A21\>\<#578B\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|<wide|X|^>>>|<row|<cell|<wide|Y|^>>>|<row|<cell|<wide|Z|^>>>>>>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|X-<frac|X<rsub|r>|Z<rsub|r>><around*|(|Z-Z<rsub|r>|)>>>|<row|<cell|Y-<frac|Y<rsub|r>|Z<rsub|r>><around*|(|Z-Z<rsub|r>|)>>>|<row|<cell|Z<rsub|r>>>>>>>>|<row|<cell|\<cal-M\>>|<cell|=>|<cell|<frac|1|Z<rsub|r>>\<cal-K\><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|-<frac|X<rsub|r>|Z<rsub|r>>>|<cell|Z<rsub|r>>>|<row|<cell|0>|<cell|1>|<cell|-<frac|Y<rsub|r>|Z<rsub|r>>>|<cell|Z<rsub|r>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|Z<rsub|r>>>>>><matrix|<tformat|<table|<row|<cell|\<cal-R\>>|<cell|\<b-t\>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|1>>>>>>>|<row|<cell|\<cal-M\>>|<cell|=>|<cell|<frac|1|Z<rsub|r>><matrix|<tformat|<table|<row|<cell|k>|<cell|s>>|<row|<cell|0>|<cell|1>>>>><matrix|<tformat|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|-<frac|X<rsub|r>|Z<rsub|r>>>>|<row|<cell|0>|<cell|1>|<cell|-<frac|Y<rsub|r>|Z<rsub|r>>>>>>>\<cal-R\>>|<cell|\<b-t\><rsub|2>>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#76F8\>\<#673A\>\<#6807\>\<#5B9A\>>

    <image|img/camera_calibration_setup.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#4F30\>\<#8BA1\><math|\<cal-M\>>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<around*|(|\<b-m\><rsub|1>-u<rsub|i>\<b-m\><rsub|3>|)>\<cdummy\>\<b-P\><rsub|i>>|<cell|=>|<cell|0>>|<row|<cell|<around*|(|\<b-m\><rsub|12>-u<rsub|v>\<b-m\><rsub|3>|)>\<cdummy\>\<b-P\><rsub|i>>|<cell|=>|<cell|0>>|<row|<cell|\<cal-P\>\<b-m\>>|<cell|=>|<cell|0>>>>
    </eqnarray*>

    where

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-P\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-P\><rsub|1><rsup|T>>|<cell|\<b-0\><rsup|T>>|<cell|-u<rsub|1>\<b-P\><rsub|1><rsup|T>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|\<b-P\><rsub|1><rsup|T>>|<cell|-v<rsub|1>\<b-P\><rsub|1><rsup|T>>>|<row|<cell|\<cdots\>>|<cell|\<cdots\>>|<cell|\<cdots\>>>|<row|<cell|\<b-P\><rsub|n><rsup|T>>|<cell|\<b-0\><rsup|T>>|<cell|-u<rsub|n>\<b-P\><rsub|n><rsup|T>>>|<row|<cell|\<b-0\><rsup|T>>|<cell|\<b-P\><rsub|n><rsup|T>>|<cell|-v<rsub|n>\<b-P\><rsub|n><rsup|T>>>>>>>>|<row|<cell|\<b-m\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-m\><rsub|1>>>|<row|<cell|\<b-m\><rsub|2>>>|<row|<cell|\<b-m\><rsub|3>>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#4F30\>\<#8BA1\>\<#5185\>\<#53C2\>\<#6570\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<rho\><matrix|<tformat|<table|<row|<cell|\<cal-A\>>|<cell|\<b-b\>>>>>>>|<cell|=>|<cell|\<cal-K\><matrix|<tformat|<table|<row|<cell|\<cal-R\>>|<cell|\<b-t\>>>>>>>>|<row|<cell|\<rho\><matrix|<tformat|<table|<row|<cell|\<b-a\><rsup|T><rsub|1>>>|<row|<cell|\<b-a\><rsub|2><rsup|T>>>|<row|<cell|\<b-a\><rsub|3><rsup|T>>>>>>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<alpha\>\<b-r\><rsub|1><rsup|T>-\<alpha\>cot\<theta\>\<b-r\><rsup|T><rsub|2>+u<rsub|0>\<b-r\><rsub|3><rsup|T>>>|<row|<cell|<frac|\<beta\>|sin\<theta\>>\<b-r\><rsub|2><rsup|T>+v<rsub|0>\<b-r\><rsub|3><rsup|T>>>|<row|<cell|\<b-r\><rsub|3><rsup|<rsup|T>>>>>>>>>>>
    </eqnarray*>

    <math|<matrix|<tformat|<table|<row|<cell|\<b-r\><rsub|1>>|<cell|\<b-r\><rsub|2>>|<cell|\<b-r\><rsub|3>>>>>>>\<#4E3A\>\<#5355\>\<#4F4D\>\<#6B63\>\<#4EA4\>\<#9635\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<rho\>\<b-a\><rsub|3>>|<cell|=>|<cell|\<b-r\><rsub|3>>>|<row|<cell|\<rho\>>|<cell|=>|<cell|<frac|\<varepsilon\>|<around*|\||\<b-a\><rsub|3>|\|>>>>|<row|<cell|\<rho\><rsup|2><around*|(|\<b-a\><rsub|1>\<cdummy\>\<b-a\><rsub|3>|)>>|<cell|=>|<cell|u<rsub|0>>>|<row|<cell|\<rho\><rsup|2><around*|(|\<b-a\><rsub|2>\<cdummy\>\<b-a\><rsub|3>|)>>|<cell|=>|<cell|v<rsub|0>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    \;

    \<#5229\>\<#7528\>\<#53C9\>\<#4E58\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<rho\><rsup|2><around*|(|\<b-a\><rsub|1>\<times\>\<b-a\><rsub|3>|)>>|<cell|=>|<cell|-\<alpha\>\<b-r\><rsub|2>-\<alpha\>cot\<theta\>\<b-r\><rsub|1>>>|<row|<cell|\<rho\><rsup|2><around*|\||\<b-a\><rsub|1>\<times\>\<b-a\><rsub|3>|\|>>|<cell|=>|<cell|<frac|a|sin\<theta\>>>>|<row|<cell|\<rho\><rsup|2><around*|(|\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|)>>|<cell|=>|<cell|<frac|\<beta\>|sin\<theta\>>\<b-r\><rsub|1>>>|<row|<cell|\<rho\><rsup|2><around*|\||\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|\|>>|<cell|=>|<cell|<frac|\<beta\>|sin\<theta\>>>>>>
    </eqnarray*>

    \<#5F97\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|cos\<theta\>>|<cell|=>|<cell|-<cfrac|<around*|(|\<b-a\><rsub|1>\<times\>\<b-a\><rsub|3>|)><around*|(|\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|)>|<around*|\||\<b-a\><rsub|1>\<times\>\<b-a\><rsub|3>|\|><around*|\||\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|\|>>>>|<row|<cell|\<alpha\>>|<cell|=>|<cell|\<rho\><rsup|2><around*|\||\<b-a\><rsub|1>\<times\>\<b-a\><rsub|3>|\|>sin\<theta\>>>|<row|<cell|\<beta\>>|<cell|=>|<cell|\<rho\><rsup|2><around*|\||\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|\|>sin\<theta\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#4F30\>\<#8BA1\>\<#5916\>\<#53C2\>\<#6570\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-r\><rsub|1>>|<cell|=>|<cell|<frac|\<rho\><rsup|2>sin\<theta\>|\<beta\>><around*|(|\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|<around*|\||\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|\|>><around*|(|\<b-a\><rsub|2>\<times\>\<b-a\><rsub|3>|)>>>|<row|<cell|\<b-r\><rsub|2>>|<cell|=>|<cell|\<b-r\><rsub|3>\<times\>\<b-r\><rsub|1>>>>>
    </eqnarray*>

    \;

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
    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-P\><rsup|T><rsub|i>\<b-lambda\>-<frac|\<b-m\><rsub|1><rsup|T>\<b-P\><rsub|i>|\<b-m\><rsup|T><rsub|3>\<b-P\><rsub|i>>\<b-P\><rsup|T><rsub|i>\<b-nu\>>|<cell|=>|<cell|0>>|<row|<cell|\<b-P\><rsup|T><rsub|i>\<b-mu\>-<frac|\<b-m\><rsub|2><rsup|T>\<b-P\><rsub|i>|\<b-m\><rsup|T><rsub|3>\<b-P\><rsub|i>>\<b-P\><rsup|T><rsub|i>\<b-nu\>>|<cell|=>|<cell|0>>>>
    </eqnarray*>

    \<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-P\><rsup|T><rsub|i><around*|(|\<b-m\><rsub|3>\<b-lambda\><rsup|T>-\<b-m\><rsub|1>\<b-nu\><rsup|T>|)>\<b-P\><rsub|i>>|<cell|=>|<cell|0>>|<row|<cell|\<b-P\><rsup|T><rsub|i><around*|(|\<b-m\><rsub|3>\<b-mu\><rsup|T>-\<b-m\><rsub|2>\<b-nu\><rsup|T>|)>\<b-P\><rsub|i>>|<cell|=>|<cell|0>>>>
    </eqnarray*>

    \<#82E5\>\<#5B58\>\<#5728\>\<#5E73\>\<#9762\><math|\<Pi\>>\<#4F7F\><math|\<Pi\>\<cdummy\>\<b-P\><rsub|i>=0>\<#FF0C\>\<#5219\>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|\<Pi\>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|\<Pi\>>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|\<Pi\>>>>>>,\<b-m\>
    </equation*>

    \<#5F20\>\<#6210\><math|\<cal-P\>>\<#7684\>\<#96F6\>\<#7A7A\>\<#95F4\>\<#3002\>
  </hidden>|<\hidden>
    <tit|\<#8003\>\<#8651\>\<#5F84\>\<#5411\>\<#7578\>\<#53D8\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\>>|<cell|=>|<cell|<frac|1|z><matrix|<tformat|<table|<row|<cell|<frac|1|\<lambda\>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|1|\<lambda\>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>\<cal-M\>\<b-P\>>>|<row|<cell|\<lambda\>>|<cell|=>|<cell|1+<big|sum><rsub|p=1><rsup|q>\<kappa\><rsub|p>d<rsup|2p><space|4em>q\<leqslant\>3>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|<math|d<rsup|2>=<wide|u|^><rsup|2>+<wide|v|^><rsup|2>>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|<wide|u|^>>>|<row|<cell|<wide|v|^>>>>>>>|<cell|=>|<cell|\<cal-K\><rsup|-1><matrix|<tformat|<table|<row|<cell|u>>|<row|<cell|v>>|<row|<cell|1>>>>>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|u\<alpha\><rsup|-1>+v\<beta\><rsup|-1>cos\<theta\>>>|<row|<cell|v\<beta\><rsup|-1>sin\<theta\>>>|<row|<cell|1>>>>><space|4em><around*|(|u<rsub|0>=v<rsub|0>=0|)>>>|<row|<cell|\<cal-K\><rsup|-1>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<alpha\><rsup|-1>>|<cell|<frac|cos\<theta\>|\<beta\>>>|<cell|-<frac|u<rsub|0>|\<alpha\>>-<frac|v<rsub|0>cos\<theta\>|\<beta\>>>>|<row|<cell|0>|<cell|<frac|sin\<theta\>|\<beta\>>>|<cell|-<frac|u<rsub|0>\<beta\>|sin\<theta\>>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>|<row|<cell|d<rsup|2>>|<cell|=>|<cell|<wide|u|^><rsup|2>+<wide|v|^><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|u<rsup|2>\<alpha\><rsup|-2>+v<rsup|2>\<beta\><rsup|-2>+2u\<nospace\>v\<alpha\><rsup|-1>\<beta\><rsup|-1>cos\<theta\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#4F30\>\<#8BA1\>\<#6295\>\<#5F71\>\<#77E9\>\<#9635\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<lambda\><matrix|<tformat|<table|<row|<cell|u>>|<row|<cell|v>>>>>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|<frac|\<b-m\><rsub|1>\<cdummy\>\<b-P\>|\<b-m\><rsub|3>\<cdummy\>\<b-P\>>>>|<row|<cell|<frac|\<b-m\><rsub|2>\<cdummy\>\<b-P\>|\<b-m\><rsub|3>\<cdummy\>\<b-P\>>>>>>>>>|<row|<cell|v<around*|(|\<b-m\><rsub|1>\<cdummy\>\<b-P\>|)>>|<cell|=>|<cell|u<around*|(|\<b-m\><rsub|2>\<cdummy\>\<b-P\>|)>>>>>
    </eqnarray*>

    \<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-Q\>\<b-n\>>|<cell|=>|<cell|0>>|<row|<cell|\<cal-Q\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|v<rsub|1>\<b-P\><rsup|T><rsub|1>>|<cell|-u<rsub|1>\<b-P\><rsub|1><rsup|T>>>|<row|<cell|\<cdots\>>|<cell|\<cdots\>>>|<row|<cell|v<rsub|n>\<b-P\><rsub|n><rsup|T>>|<cell|-u<rsub|n>\<b-P\><rsub|n><rsup|T>>>>>>>>|<row|<cell|\<b-n\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-m\><rsub|1>>>|<row|<cell|\<b-m\><rsub|2>>>>>>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|\<#5185\>\<#53C2\>\<#6570\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<rho\><matrix|<tformat|<table|<row|<cell|\<b-a\><rsub|1><rsup|T>>>|<row|<cell|\<b-a\><rsub|2><rsup|T>>>>>>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<alpha\>\<b-r\><rsub|1><rsup|T>-\<alpha\>cot\<theta\>\<b-r\><rsub|2><rsup|T>>>|<row|<cell|<frac|\<beta\>|sin\<theta\>>\<b-r\><rsub|2><rsup|T>>>>>>>>|<row|<cell|<around*|\||\<rho\>\<b-a\><rsub|1>|\|>>|<cell|=>|<cell|<frac|\<alpha\>|sin\<theta\>>>>|<row|<cell|<around*|\||\<rho\>\<b-a\><rsub|2>|\|>>|<cell|=>|<cell|<frac|\<beta\>|sin\<theta\>>>>|<row|<cell|\<rho\>\<b-a\><rsub|1>\<cdummy\>\<rho\>\<b-a\><rsub|2>>|<cell|=>|<cell|-<frac|\<alpha\>\<beta\>cos\<theta\>|sin<rsup|2>\<theta\>>>>|<row|<cell|cos\<theta\>>|<cell|=>|<cell|-<frac|\<b-a\><rsub|1>\<cdummy\>\<b-a\><rsub|2>|<around*|\||\<b-a\><rsub|1>|\|>\<cdummy\><around*|\||\<b-a\><rsub|2>|\|>>>>|<row|<cell|\<alpha\>>|<cell|=>|<cell|<around*|\||\<rho\>\<b-a\><rsub|1>|\|>sin\<theta\>>>|<row|<cell|\<beta\>>|<cell|=>|<cell|<around*|\||\<rho\>\<b-a\><rsub|2>|\|>sin\<theta\>>>>>
    </eqnarray*>
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

    <\eqnarray*>
      <tformat|<table|<row|<cell|<around*|(|\<b-m\><rsub|1>-\<lambda\>u\<b-m\><rsub|3>|)>\<cdummy\>\<b-P\>>|<cell|=>|<cell|0>>|<row|<cell|<around*|(|\<b-m\><rsub|2>-\<lambda\>v\<b-m\><rsub|3>|)>\<cdummy\>\<b-P\>>|<cell|=>|<cell|0>>|<row|<cell|\<b-m\><rsub|3>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-r\><rsub|3>>>|<row|<cell|t<rsub|z>>>>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5F84\>\<#5411\>\<#7578\>\<#53D8\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|d<rsup|2>>|<cell|=>|<cell|<around*|\||<around*|(|u\<alpha\><rsup|-1>+v\<beta\><rsup|-1>cos\<theta\>|)>\<b-r\><rsub|2>-v\<beta\><rsup|-1>sin\<theta\>\<b-r\><rsub|1>|\|><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|\<alpha\><rsup|-1>\<beta\><rsup|-1>sin\<theta\>|)><rsup|2><around*|\||<around*|(|<frac|u\<beta\>|sin\<theta\>>+v\<alpha\>cot\<theta\>|)>\<b-r\><rsub|2>-v\<alpha\>\<b-r\><rsub|1>|\|><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|<around*|\||\<rho\>\<b-a\><rsub|1>\<times\>\<rho\>\<b-a\><rsub|2>|\|><rsup|2>><around*|\||<frac|u\<beta\>|sin\<theta\>>\<b-r\><rsub|2>-v<around*|(|\<alpha\>\<b-r\><rsub|1>-\<alpha\>cot\<theta\>\<b-r\><rsub|2>|)>|\|><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<frac|<around*|\||u\<rho\>\<b-a\><rsub|2>-v\<rho\>\<b-a\><rsub|1>|\|><rsup|2>|<around*|\||\<rho\>\<b-a\><rsub|1>\<times\>\<rho\>\<b-a\><rsub|2>|\|><rsup|2>>>>|<row|<cell|>|<cell|=>|<cell|<frac|<around*|\||u\<b-a\><rsub|2>-v\<b-a\><rsub|1>|\|><rsup|2>|<around*|\||\<b-a\><rsub|1>\<times\>\<b-a\><rsub|2>|\|><rsup|2>>>>>>
    </eqnarray*>

    \;
  </hidden>>
</body>

<\initial>
  <\collection>
    <associate|font|roman>
    <associate|font-base-size|12>
    <associate|font-family|rm>
    <associate|info-flag|minimal>
    <associate|math-font|roman>
    <associate|page-medium|beamer>
  </collection>
</initial>