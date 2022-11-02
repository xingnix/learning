<TeXmacs|2.1.1>

<style|<tuple|beamer|blackboard>>

<\body>
  <\slideshow>
    <\slide>
      \;

      \;

      \;

      \;

      \;

      <doc-data|<doc-title|\<#8BA1\>\<#7B97\>\<#89C6\>\<#89C9\>\<#4E0E\>\<#6A21\>\<#5F0F\>\<#8BC6\>\<#522B\>>>
    </slide>

    <\slide>
      <tit|\<#900F\>\<#89C6\>\<#7F29\>\<#51CF\>>

      <space|4em><image|img/point_on_a_surface_hemisphere.png|0.7par|||>
    </slide>

    <\slide>
      <tit|\<#7ACB\>\<#4F53\>\<#89D2\>>

      \;

      <space|4em><image|img/solid_angle.png|0.7par|||>
    </slide>

    <\slide>
      <tit|>

      <\eqnarray*>
        <tformat|<table|<row|<cell|\<mathd\>\<varphi\>>|<cell|=>|<cell|<frac|\<mathd\>l\<nospace\>cos\<theta\>|r>>>|<row|<cell|\<mathd\>\<omega\>>|<cell|=>|<cell|<frac|\<mathd\>A\<nospace\>cos\<theta\>|r<rsup|2>>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|\<mathd\>\<omega\>>|<cell|=>|<cell|<frac|r\<nospace\>sin\<theta\>\<mathd\>\<varphi\>\<cdummy\>r\<mathd\>\<theta\>|r<rsup|2>>>>|<row|<cell|>|<cell|=>|<cell|\<nospace\>sin\<theta\>\<mathd\>\<theta\>\<mathd\>\<varphi\>>>>>
      </eqnarray*>
    </slide>

    <\slide>
      <tit|\<#8F90\>\<#5C04\>\<#7387\>>

      <space|5em><image|img/radiance_A1_to_A2.png||0.8pag||>
    </slide>

    <\slide>
      <tit|>

      <\equation*>
        L<around*|(|x<rsub|1>,\<theta\>,\<varphi\>|)><around*|(|cos\<theta\><rsub|1>\<mathd\>A<rsub|1>|)><around*|(|d\<omega\>|)><around*|(|d\<nospace\>t|)>
      </equation*>

      <\eqnarray*>
        <tformat|<table|<row|<cell|\<mathd\><rsup|3>E<rsub|1\<rightarrow\>2>>|<cell|=>|<cell|L<around*|(|x<rsub|1>,x<rsub|1>\<rightarrow\>x<rsub|2>|)>cos\<theta\><rsub|1>\<mathd\>\<omega\><rsub|2<around*|(|1|)>>\<mathd\>A<rsub|1>\<mathd\>t>>|<row|<cell|>|<cell|=>|<cell|L<around*|(|x<rsub|1>,x<rsub|1>\<rightarrow\>x<rsub|2>|)><frac|cos\<theta\><rsub|1>cos\<theta\><rsub|2>\<mathd\>A<rsub|2>\<mathd\>A<rsub|1>\<mathd\>t|r<rsup|2>>>>|<row|<cell|\<mathd\>\<omega\><rsub|2<around*|(|1|)>>>|<cell|=>|<cell|<frac|cos\<theta\><rsub|2>\<mathd\>A<rsub|2>|r<rsup|2>>>>|<row|<cell|\<mathd\><rsup|3>E<rsub|1\<rightarrow\>2>>|<cell|=>|<cell|L<around*|(|x<rsub|1>,x<rsub|1>\<rightarrow\>x<rsub|2>|)>cos\<theta\><rsub|2>\<mathd\>\<omega\><rsub|1<around*|(|2|)>>\<mathd\>A<rsub|2>\<mathd\>t>>|<row|<cell|>|<cell|=>|<cell|L<around*|(|x<rsub|1>,x<rsub|1>\<rightarrow\>x<rsub|2>|)><frac|cos\<theta\><rsub|2>cos\<theta\><rsub|1>\<mathd\>A<rsub|1>\<mathd\>A<rsub|2>\<mathd\>t|r<rsup|2>>>>|<row|<cell|\<mathd\>\<omega\><rsub|1<around*|(|2|)>>>|<cell|=>|<cell|<frac|cos\<theta\><rsub|1>\<mathd\>A<rsub|1>|r<rsup|2>>>>>>
      </eqnarray*>
    </slide>

    <\slide>
      <tit|>

      \<#8F90\>\<#7167\>\<#5EA6\>

      <\eqnarray*>
        <tformat|<table|<row|<cell|L<rsub|i><around*|(|x,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>cos\<theta\><rsub|i>\<mathd\>\<omega\>>|<cell|>|<cell|>>>>
      </eqnarray*>

      \<#53CC\>\<#5411\>\<#53CD\>\<#5C04\>\<#5206\>\<#5E03\>\<#51FD\>\<#6570\>

      <\eqnarray*>
        <tformat|<table|<row|<cell|\<rho\><rsub|bd><around*|(|\<theta\><rsub|o>,\<varphi\><rsub|o>,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>>|<cell|=>|<cell|<frac|\<mathd\>L<rsub|0><around*|(|x,\<theta\><rsub|o>,\<varphi\><rsub|o>|)>|L<rsub|i><around*|(|x,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>cos\<theta\><rsub|i>\<mathd\>\<omega\>>>>>>
      </eqnarray*>

      \;

      \;
    </slide>

    <\slide>
      <tit|BRDF\<#6027\>\<#8D28\>>

      \<#8BBE\>

      <\eqnarray*>
        <tformat|<table|<row|<cell|L<rsub|i><around*|(|\<b-x\>,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>>|<cell|=>|<cell|<big|int><rsub|\<Omega\>><frac|1|cos\<theta\>>cos\<theta\>\<mathd\>\<omega\>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|0><rsup|2\<pi\>><big|int><rsub|0><rsup|<frac|\<pi\>|2>>sin\<theta\>\<mathd\>\<theta\>\<mathd\>\<varphi\>>>|<row|<cell|>|<cell|=>|<cell|2\<pi\>>>>>
      </eqnarray*>

      \<#5F97\>

      <\eqnarray*>
        <tformat|<table|<row|<cell|L<around*|(|\<b-x\>,\<theta\><rsub|o>,\<varphi\><rsub|o>|)>>|<cell|=>|<cell|<big|int><rsub|\<Omega\>>\<rho\><rsub|bd><around*|(|\<theta\><rsub|o>,\<varphi\><rsub|o>,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>L<rsub|i><around*|(|\<b-x\>,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>cos\<theta\><rsub|i>\<mathd\>\<omega\>>>>>
      </eqnarray*>
    </slide>

    <\slide>
      <tit|>

      <\eqnarray*>
        <tformat|<table|<row|<cell|2\<pi\>>|<cell|\<geqslant\>>|<cell|<big|int><rsub|\<Omega\><rsub|o>>L<rsub|o><around*|(|\<b-x\>,\<theta\><rsub|o>,\<varphi\><rsub|o>|)>cos\<theta\><rsub|o>\<mathd\>\<omega\><rsub|o>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|\<Omega\><rsub|o>><big|int><rsub|\<Omega\><rsub|i>>\<rho\><rsub|bd><around*|(|\<theta\><rsub|o>,\<varphi\><rsub|o>,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>L<rsub|i><around*|(|\<b-x\>,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>cos\<theta\><rsub|i>\<mathd\>\<omega\><rsub|i>cos\<theta\><rsub|o>\<mathd\>\<omega\><rsub|o>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|\<Omega\><rsub|o>><big|int><rsub|\<Omega\><rsub|i>>\<rho\><rsub|bd><around*|(|\<theta\><rsub|o>,\<varphi\><rsub|o>,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>\<mathd\>\<omega\><rsub|i>cos\<theta\><rsub|o>\<mathd\>\<omega\><rsub|o>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|\<Omega\><rsub|o>><big|int><rsub|\<Omega\><rsub|i>>\<rho\><rsub|bd><around*|(|\<theta\><rsub|o>,\<varphi\><rsub|o>,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>sin\<theta\><rsub|i>\<mathd\>\<theta\><rsub|i>\<mathd\>\<varphi\><rsub|i>cos\<theta\><rsub|o>sin\<theta\><rsub|o>\<mathd\>\<theta\><rsub|o>\<mathd\>\<varphi\><rsub|o>>>>>
      </eqnarray*>

      \;
    </slide>

    <\slide>
      <tit|\<#8F90\>\<#5C04\>\<#5EA6\>>

      <\eqnarray*>
        <tformat|<table|<row|<cell|B<around*|(|\<b-x\>|)>>|<cell|=>|<cell|<big|int><rsub|\<Omega\>>L<around*|(|\<b-x\>,\<theta\>,\<varphi\>|)>cos\<theta\>\<mathd\>\<omega\>>>>>
      </eqnarray*>

      \<#8BBE\>

      <\eqnarray*>
        <tformat|<table|<row|<cell|L<rsub|o><around*|(|\<b-x\>,\<theta\><rsub|o>,\<varphi\><rsub|o>|)>>|<cell|=>|<cell|L<rsub|o><around*|(|\<b-x\>|)>>>>>
      </eqnarray*>

      <\eqnarray*>
        <tformat|<table|<row|<cell|B<around*|(|\<b-x\>|)>>|<cell|=>|<cell|<big|int><rsub|\<Omega\>>L<rsub|o><around*|(|\<b-x\>|)>cos\<theta\>\<mathd\>\<omega\>>>|<row|<cell|>|<cell|=>|<cell|L<rsub|o><around*|(|\<b-x\>|)><big|int><rsub|o><rsup|<frac|\<pi\>|2>><big|int><rsub|o><rsup|2\<pi\>>cos\<theta\>sin\<theta\>\<mathd\>\<varphi\>\<mathd\>\<theta\>>>|<row|<cell|>|<cell|=>|<cell|\<pi\>L<rsub|o><around*|(|\<b-x\>|)>>>>>
      </eqnarray*>
    </slide>

    <\slide>
      <tit|\<#65B9\>\<#5411\>\<#6027\>\<#534A\>\<#7403\>\<#53CD\>\<#5C04\>>

      <\eqnarray*>
        <tformat|<table|<row|<cell|\<rho\><rsub|dh><around*|(|\<theta\><rsub|i>,\<varphi\><rsub|i>|)>>|<cell|=>|<cell|<frac|<big|int><rsub|\<Omega\>>L<rsub|o><around*|(|\<b-x\>,\<theta\><rsub|o>,\<varphi\><rsub|o>|)>cos\<theta\><rsub|o>\<mathd\>\<omega\><rsub|o>|L<rsub|i><around*|(|\<b-x\>,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>cos\<theta\><rsub|i>\<mathd\>\<omega\><rsub|i>>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|\<Omega\>><frac|L<rsub|o><around*|(|\<b-x\>,\<theta\><rsub|o>,\<varphi\><rsub|o>|)>|L<rsub|i><around*|(|\<b-x\>,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>cos\<theta\><rsub|i>>cos\<theta\><rsub|o>\<mathd\>\<omega\><rsub|o>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|\<Omega\>>\<rho\><rsub|bd><around*|(|\<theta\><rsub|o>,\<varphi\><rsub|o>,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>cos\<theta\><rsub|o>\<mathd\>\<omega\><rsub|o>>>>>
      </eqnarray*>

      \;
    </slide>

    <\slide>
      <tit|\<#6F2B\>\<#53CD\>\<#5C04\>>

      \;

      <\eqnarray*>
        <tformat|<table|<row|<cell|\<rho\><rsub|bd><around*|(|\<theta\><rsub|o>,\<varphi\><rsub|o>,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>>|<cell|=>|<cell|\<rho\>>>|<row|<cell|\<rho\><rsub|d>>|<cell|=>|<cell|<big|int><rsub|\<Omega\>>\<rho\><rsub|bd><around*|(|\<theta\><rsub|o>,\<varphi\><rsub|O>,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>cos\<theta\><rsub|o>\<mathd\>\<omega\><rsub|o>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|\<Omega\>>\<rho\>cos\<theta\><rsub|o>\<mathd\>\<omega\><rsub|o>>>|<row|<cell|>|<cell|=>|<cell|\<rho\><big|int><rsub|o><rsup|<frac|\<pi\>|2>><big|int><rsub|o><rsup|2\<pi\>>cos\<theta\><rsub|o>sin\<theta\><rsub|o>\<mathd\>\<theta\><rsub|o>\<mathd\>\<varphi\><rsub|o>>>|<row|<cell|>|<cell|=>|<cell|\<pi\>\<rho\>>>|<row|<cell|\<rho\><rsub|brdf>>|<cell|=>|<cell|<frac|\<rho\><rsub|d>|\<pi\>>>>>>
      </eqnarray*>
    </slide>

    <\slide>
      <tit|\<#955C\>\<#9762\>\<#53CD\>\<#5C04\>>

      <image|img/specular_reflect.png|1par|||>
    </slide>

    <\slide>
      <tit|\<#6F2B\>\<#53CD\>\<#5C04\>\<#4E0E\>\<#955C\>\<#9762\>\<#53CD\>\<#5C04\>>

      \;

      <\eqnarray*>
        <tformat|<table|<row|<cell|k<around*|(|\<delta\>\<theta\>|)>>|<cell|=>|<cell|cos<rsup|n><around*|(|\<delta\>\<theta\>|)>>>|<row|<cell|>|<cell|=>|<cell|cos<rsup|n><around*|(|\<theta\><rsub|s>-\<theta\><rsub|o>|)>>>>>
      </eqnarray*>

      \;

      <\eqnarray*>
        <tformat|<table|<row|<cell|L<around*|(|\<b-x\>,\<theta\><rsub|o>,\<varphi\><rsub|o>|)>>|<cell|=>|<cell|\<rho\><rsub|d><around*|(|\<b-x\>|)><big|int><rsub|\<Omega\>>L<around*|(|\<b-x\>,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>cos\<theta\><rsub|i>\<mathd\>\<omega\>+\<rho\><rsub|s><around*|(|\<b-x\>|)>L<around*|(|\<b-x\>,\<theta\><rsub|s>,\<varphi\><rsub|s>|)>k<around*|(|\<delta\>\<theta\>|)>>>|<row|<cell|>|<cell|=>|<cell|\<rho\><rsub|d><around*|(|\<b-x\>|)><big|int><rsub|\<Omega\>>L<around*|(|\<b-x\>,\<theta\><rsub|i>,\<varphi\><rsub|i>|)>cos\<theta\><rsub|i>\<mathd\>\<omega\>+\<rho\><rsub|s><around*|(|\<b-x\>|)>L<around*|(|\<b-x\>,\<theta\><rsub|s>,\<varphi\><rsub|s>|)>cos<rsup|n><around*|(|\<theta\><rsub|s>-\<theta\><rsub|o>|)>>>>>
      </eqnarray*>
    </slide>
  </slideshow>
</body>

<\initial>
  <\collection>
    <associate|font|roman>
    <associate|font-base-size|12>
    <associate|font-family|rm>
    <associate|info-flag|minimal>
    <associate|math-font|roman>
    <associate|page-medium|paper>
    <associate|page-packet|5>
  </collection>
</initial>