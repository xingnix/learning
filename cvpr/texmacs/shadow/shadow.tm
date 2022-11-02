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
    <tit|\<#5149\>\<#6E90\>>

    \;

    \;

    \<#51FA\>\<#5C04\>\<#5EA6\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|E<around*|(|\<b-x\>|)>>|<cell|=>|<cell|<big|int><rsub|\<Omega\>>L<rsub|e><around*|(|\<b-x\>,\<theta\><rsub|o>,\<varphi\><rsub|o>|)>cos\<theta\><around*|(|o|)>\<mathd\>\<omega\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5B9A\>\<#6027\>\<#8F90\>\<#5C04\>\<#5B66\>>

    <space|4em><image|img/infinitely_high_wall_shaddow.png|0.7par|||>

    \;
  </hidden>|<\hidden>
    <tit|>

    <space|4em><image|img/half_infinite_wall.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|\<#5149\>\<#6E90\>\<#6548\>\<#679C\>>

    <space|5em><image|img/point_sphere_on_surface.png|0.6par|||>
  </hidden>|<\hidden>
    <tit|>

    \<#53D1\>\<#5C04\>\<#5EA6\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|E<around*|(|x|)>>|<cell|=>|<cell|<big|int><rsub|\<Omega\>>L<rsub|e><around*|(|x,\<theta\><rsub|o>,\<varphi\><rsub|o>|)>cos\<theta\><rsub|o>\<mathd\>\<omega\>>>>>
    </eqnarray*>

    \<#8F90\>\<#5C04\>\<#5EA6\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|>|<cell|>|<cell|r<around*|(|<frac|\<varepsilon\>|r>|)><rsup|2>E\<nospace\>cos\<theta\>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|\<#70B9\>\<#5149\>\<#6E90\>>

    \<#8FD1\>\<#70B9\>\<#5149\>\<#6E90\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|>|<cell|>|<cell|\<rho\><rsub|d><around*|(|\<b-x\>|)><frac|\<b-N\><around*|(|x|)>\<cdummy\>\<b-S\><around*|(|\<b-x\>|)>|r<around*|(|\<b-x\>|)><rsup|2>>>>>>
    </eqnarray*>

    \<#65E0\>\<#7A77\>\<#8FDC\>\<#70B9\>\<#5149\>\<#6E90\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<b-N\>\<cdummy\>\<b-S\><around*|(|\<b-x\>|)>|r<around*|(|\<b-x\>|)><rsup|2>>>|<cell|=>|<cell|<frac|\<b-N\>\<cdummy\><around*|(|\<b-S\><rsub|0>+\<Delta\>\<b-S\><around*|(|\<b-x\>|)>|)>|<around*|(|r<rsub|0>+r<around*|(|\<b-x\>|)>|)><rsup|2>>>>|<row|<cell|>|<cell|\<approx\>>|<cell|<frac|\<b-N\>\<cdummy\>\<b-S\><rsub|0>|r<rsub|0><rsup|2>>>>|<row|<cell|B<around*|(|\<b-x\>|)>>|<cell|=>|<cell|\<rho\><rsub|d><around*|(|\<b-x\>|)><around*|(|\<b-N\>\<cdummy\>\<b-S\>|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#7EBF\>\<#5149\>\<#6E90\>>

    <image|img/line_source.png|0.9par|||>
  </hidden>|<\hidden>
    <tit|\<#9762\>\<#5149\>\<#6E90\>>

    <space|7em><image|img/area_source.png|0.5par|||>
  </hidden>|<\hidden>
    <tit|\<#9762\>\<#5149\>\<#6E90\>\<#8F90\>\<#5C04\>\<#5EA6\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|B<around*|(|\<b-x\>|)>>|<cell|=>|<cell|\<rho\><rsub|d><around*|(|\<b-x\>|)><big|int><rsub|\<Omega\>>L<rsub|i><around*|(|\<b-x\>,\<b-u\>\<rightarrow\>\<b-x\>|)>cos\<theta\><rsub|i>\<mathd\>\<omega\>>>|<row|<cell|>|<cell|=>|<cell|\<rho\><rsub|d><around*|(|\<b-x\>|)><big|int><rsub|\<Omega\>>L<rsub|e><around*|(|\<b-u\>,\<b-u\>\<rightarrow\>\<b-x\>|)>cos\<theta\><rsub|i>\<mathd\>\<omega\>>>|<row|<cell|>|<cell|=>|<cell|\<rho\><rsub|d><around*|(|\<b-x\>|)><big|int><rsub|\<Omega\>><around*|(|<frac|E<around*|(|\<b-u\>|)>|\<pi\>>|)>cos\<theta\><rsub|i>\<mathd\>\<omega\>>>|<row|<cell|>|<cell|=>|<cell|\<rho\><rsub|d><around*|(|\<b-x\>|)><big|int><rsub|Source><around*|(|<frac|E<around*|(|\<b-u\>|)>|\<pi\>>|)>cos\<theta\><rsub|i><around*|(|cos\<theta\><rsub|s><frac|\<mathd\>A<rsub|\<b-u\>>|r<rsup|2>>|)>>>|<row|<cell|>|<cell|=>|<cell|\<rho\><rsub|d><around*|(|\<b-x\>|)><big|int><rsub|Source><frac|E<around*|(|\<b-u\>|)>cos\<theta\><rsub|i>cos\<theta\><rsub|s>|\<pi\>r<rsup|2>>\<mathd\>A<rsub|\<b-u\>>>>>>
    </eqnarray*>

    <\folded>
      <math|E<around*|(|\<b-u\>|)>=\<pi\>L<rsub|e><around*|(|\<b-u\>,\<b-u\>\<rightarrow\>\<b-x\>|)>>
    <|folded>
      <\eqnarray*>
        <tformat|<table|<row|<cell|E>|<cell|=>|<cell|<big|int><rsub|0><rsup|<frac|\<pi\>|2>><big|int><rsub|0><rsup|2\<pi\>>L\<cdummy\>cos\<theta\>\<cdummy\>sin\<theta\>\<mathd\>\<phi\>\<mathd\>\<theta\>>>|<row|<cell|>|<cell|=>|<cell|2\<pi\>L<big|int><rsub|0><rsup|<frac|\<pi\>|2>>cos\<theta\>sin\<theta\>\<mathd\>\<theta\>>>|<row|<cell|>|<cell|=>|<cell|\<pi\>L<big|int><rsub|0><rsup|<frac|\<pi\>|2>>sin2\<theta\>\<mathd\>\<theta\>>>|<row|<cell|>|<cell|=>|<cell|\<pi\>L>>>>
      </eqnarray*>
    </folded>
  </hidden>|<\hidden>
    <tit|\<#5C40\>\<#90E8\>\<#5149\>\<#7167\>\<#6A21\>\<#578B\>\V\V\<#70B9\>\<#5149\>\<#6E90\>>

    \<#70B9\>\<#5149\>\<#6E90\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|B<around*|(|\<b-x\>|)>>|<cell|=>|<cell|<big|sum><rsub|s\<in\><around*|{|t\|t\<rightarrow\>x|}>>B<rsub|s><around*|(|\<b-x\>|)>>>>>
    </eqnarray*>

    \<#65E0\>\<#7A77\>\<#8FDC\>\<#70B9\>\<#5149\>\<#6E90\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|B<around*|(|\<b-x\>|)>>|<cell|=>|<cell|<big|sum><rsub|s\<in\><around*|{|t\|t\<rightarrow\>x|}>>\<rho\><rsub|d><around*|(|\<b-x\>|)>\<b-N\><around*|(|\<b-x\>|)>\<cdummy\>\<b-S\><rsub|s>>>>>
    </eqnarray*>

    \<#8FD1\>\<#70B9\>\<#5149\>\<#6E90\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|B<around*|(|\<b-x\>|)>>|<cell|=>|<cell|<big|sum><rsub|s\<in\><around*|{|t\|t\<rightarrow\>x|}>>\<rho\><rsub|d><around*|(|\<b-x\>|)><frac|\<b-N\><around*|(|\<b-x\>|)>\<cdummy\>\<b-S\><around*|(|\<b-x\>|)>|r<rsub|s><around*|(|\<b-x\>|)><rsup|2>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#70B9\>\<#5149\>\<#6E90\>\<#4E0E\>\<#9634\>\<#5F71\>>

    <space|2em><image|img/point_source_shadow.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#9762\>\<#5149\>\<#6E90\>>

    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|B<around*|(|\<b-x\>|)>>|<cell|=>|<cell|<big|sum><rsub|s\<in\><text|all
      sources>><around*|{|<big|int><rsub|<text|visible component of sources
      s>><text|Radiosity due to source>|}>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|s\<in\><text|all
      sources>><big|int><rsub|<text|visible component of sources
      s>><text|><around*|{|E<around*|(|\<b-u\>|)><frac|cos\<theta\><rsub|u>cos\<theta\><rsub|s>|\<pi\>r<rsup|2>>\<mathd\>A<rsub|\<b-u\>>|}>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#9762\>\<#5149\>\<#6E90\>\<#4E0E\>\<#9634\>\<#5F71\>>

    <space|4em><image|img/area_source_shadow.png|.6par|||>
  </hidden>|<\shown>
    <tit|\<#73AF\>\<#5883\>\<#5149\>>

    <space|4em><image|img/ambient_illumination.png|0.6par|||>
  </shown>|<\hidden>
    <tit|\<#8868\>\<#9762\>\<#53CD\>\<#5C04\>>

    <image|img/surface_reflection.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6717\>\<#4F2F\>\<#4E0E\>\<#955C\>\<#9762\>\<#53CD\>\<#5C04\>\<#6A21\>\<#578B\>>

    \;

    \;

    <\equation*>
      <tabular|<tformat|<table|<row|<cell|I<around*|(|\<b-x\>|)>>|<cell|=>|<cell|\<rho\><around*|(|\<b-x\>|)><around*|(|\<b-N\>\<cdummy\>\<b-S\>|)>Vis<around*|(|\<b-S\>,\<b-x\>|)>>|<cell|+>|<cell|\<rho\><around*|(|\<b-x\>|)>A>|<cell|+>|<cell|M>>|<row|<cell|Image>|<cell|>|<cell|Diffuse>|<cell|+>|<cell|Ambient>|<cell|+>|<cell|Specular<around*|(|mirror-like|)>>>|<row|<cell|intensity>|<cell|>|<cell|term>|<cell|>|<cell|term>|<cell|>|<cell|term>>>>>
    </equation*>
  </hidden>|<\hidden>
    <tit|\<#8F90\>\<#5C04\>\<#6807\>\<#5B9A\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|I<rsup|<around*|(|k|)>><rsub|i\<nospace\>j>>|<cell|=>|<cell|f<around*|(|E<rsub|i\<nospace\>j>\<Delta\>t<rsub|k>|)>>>|<row|<cell|log\<nospace\>g<around*|(|I<rsub|i\<nospace\>j><rsup|<around*|(|k|)>>|)>>|<cell|=>|<cell|log\<nospace\>E<rsub|i\<nospace\>j>+log\<Delta\>t<rsub|k>>>>>
    </eqnarray*>

    \<#4F30\>\<#8BA1\><math|g=f<rsup|-1>>,\<#635F\>\<#5931\>\<#51FD\>\<#6570\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<big|sum><rsub|i,j,k><around*|(|log\<nospace\>g<around*|(|I<rsub|i\<nospace\>j><rsup|<around*|(|k|)>>|)>-<around*|(|log\<nospace\>E<rsub|i\<nospace\>j>+log\<Delta\>t<rsub|k>|)>|)><rsup|2>+<text|smoothness
      penalty on <math|g>>>|<cell|>|<cell|>>>>
    </eqnarray*>

    \<#4F30\>\<#8BA1\><math|E<rsub|i\<nospace\>j>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<big|sum><rsub|k>w<around*|(|I<rsub|i\<nospace\>j>|)><around*|(|I<rsup|<around*|(|k|)>><rsub|i\<nospace\>j>-f<around*|(|E<rsub|i\<nospace\>j>\<Delta\>t<rsub|k>|)>|)><rsup|2>>|<cell|>|<cell|>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#8F90\>\<#5C04\>\<#6807\>\<#5B9A\>\<#793A\>\<#4F8B\>>

    <image|img/calibrate_radiometric .png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#955C\>\<#9762\>\<#53CD\>\<#5C04\>\<#5F62\>\<#72B6\>>

    <image|img/specular_surface_coordinate.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#955C\>\<#9762\>\<#53CD\>\<#5C04\>\<#7684\>\<#8FB9\>\<#754C\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-V\>\<cdummy\>\<b-P\>>|<cell|\<geqslant\>>|<cell|1-\<varepsilon\>>>|<row|<cell|1-\<varepsilon\>>|<cell|=>|<cell|\<b-V\>\<cdummy\>\<b-P\>>>|<row|<cell|>|<cell|=>|<cell|2<frac|<around*|(|\<b-H\>\<point\>\<b-N\>|)><rsup|2>|<around*|(|\<b-H\>\<cdummy\>\<b-H\>|)>>-1>>>>
    </eqnarray*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|z>|<cell|=>|<cell|-<frac|1|2><around*|(|\<kappa\><rsub|1>x<rsup|2>+\<kappa\><rsub|2>y<rsup|2>|)>>>|<row|<cell|\<b-N\>>|<cell|=>|<cell|<around*|(|1+\<kappa\><rsup|2><rsub|1>x<rsup|2>+\<kappa\><rsup|2><rsub|2>y<rsup|2>|)><rsup|-<frac|1|2>><matrix|<tformat|<table|<row|<cell|\<kappa\><rsub|1>x>|<cell|\<kappa\><rsub|2>y>|<cell|1>>>>><rsup|T>>>>>
    </eqnarray*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<kappa\><rsup|2><rsub|1>x<rsup|2>+\<kappa\><rsub|2><rsup|2>y<rsup|2>>|<cell|=>|<cell|\<zeta\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#955C\>\<#9762\>\<#53CD\>\<#5C04\>\<#7684\>\<#79FB\>\<#52A8\>>

    <image|img/specularities_convex_concave.png|1par|||>
  </hidden>|<\hidden>
    <tit|>

    <math|\<b-S\>>\<#4E0D\>\<#53D8\> \<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-V\>>|<cell|=>|<cell|2<around*|(|\<b-S\>\<cdummy\>\<b-N\>|)>\<b-N\>-\<b-S\>>>|<row|<cell|\<delta\>\<b-V\>>|<cell|=>|<cell|2<around*|(|\<b-S\>\<cdummy\><around*|(|\<b-N\>+\<delta\>\<b-N\>|)>|)><around*|(|\<b-N\>+\<delta\>\<b-N\>|)>-\<b-S\>-\<b-V\>>>|<row|<cell|>|<cell|=>|<cell|2<around*|(|\<b-S\>\<cdummy\>\<delta\>\<b-N\>|)>\<b-N\>+2<around*|(|\<b-S\>\<cdummy\>\<b-N\>|)>\<delta\>\<b-N\>+2<around*|(|\<b-S\>\<cdummy\>\<mathd\>\<b-N\>|)>\<mathd\>\<b-N\>>>|<row|<cell|\<mathd\>\<b-V\>>|<cell|=>|<cell|2<around*|(|\<b-S\>\<cdummy\>\<mathd\>\<b-N\>|)>\<b-N\>+2<around*|(|\<b-S\>\<cdummy\>\<b-N\>|)>\<mathd\>\<b-N\>+2<around*|(|\<b-S\>\<cdummy\>\<mathd\>\<b-N\>|)>\<mathd\>\<b-N\>>>>>
    </eqnarray*>

    \<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<mathd\>\<b-V\>\<cdummy\>\<mathd\>\<b-r\>>|<cell|=>|<cell|2<around*|(|\<b-S\>\<cdummy\>\<b-N\>|)>\<mathd\>\<b-N\>\<cdummy\>\<mathd\>\<b-r\><space|5em>\<mathd\>\<b-r\>=\<b-r\><rsub|s>\<mathd\>s>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#4EAE\>\<#5EA6\>\<#4E0E\>\<#7167\>\<#5EA6\>\<#63A8\>\<#7406\>>

    \<#76F8\>\<#673A\>\<#54CD\>\<#5E94\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|C<around*|(|\<b-x\>|)>>|<cell|=>|<cell|k<rsub|c>I<around*|(|\<b-x\>|)>\<rho\><around*|(|\<b-x\>|)>>>|<row|<cell|log\<nospace\>C<around*|(|\<b-x\>|)>>|<cell|=>|<cell|log\<nospace\>k<rsub|c>+log\<nospace\>I<around*|(|\<b-x\>|)>+log\<nospace\>\<rho\><around*|(|\<b-x\>|)>>>>>
    </eqnarray*>

    <\unfolded>
      <math|\<rho\><around*|(|\<b-x\>|)>>\<#FF1A\>\<#53CD\>\<#5C04\>\<#7387\>
    <|unfolded>
      \<#540C\>\<#4E00\>\<#7269\>\<#4F53\>\<#57FA\>\<#672C\>\<#4E0D\>\<#53D8\>\<#FF0C\>\<#4E0D\>\<#540C\>\<#7269\>\<#4F53\>\<#8FB9\>\<#754C\>\<#5904\>\<#6709\>\<#7A81\>\<#53D8\>
    </unfolded>

    <\unfolded>
      <math|I<around*|(|\<b-x\>|)>>\<#FF1A\>\<#5149\>\<#7167\>
    <|unfolded>
      \<#53D8\>\<#5316\>\<#7F13\>\<#6162\>
    </unfolded>

    \;

    \;

    \;
  </hidden>|<\hidden>
    <tit|\<#4EAE\>\<#5EA6\>\<#7B97\>\<#6CD5\>\<#793A\>\<#4F8B\>>

    <space|7em><image|img/inferring_lightness_and_illumination.png|0.5par|||>
  </hidden>|<\hidden>
    <tit|\<#4F30\>\<#8BA1\>\<#53CD\>\<#5C04\>\<#7387\>>

    \;

    <\itemize-dot>
      <item>\<#8BA1\>\<#7B97\>\<#9608\>\<#503C\>\<#5316\>\<#68AF\>\<#5EA6\>

      <item>\<#79EF\>\<#5206\>
    </itemize-dot>

    \;

    \<#6216\>

    \;

    <\itemize-dot>
      <item>\<#8BA1\>\<#7B97\>\<#9608\>\<#503C\>\<#5316\>\<#68AF\>\<#5EA6\><math|\<b-p\>,\<b-q\>>

      <item>\<#6700\>\<#5C0F\>\<#5316\>

      <\eqnarray*>
        <tformat|<table|<row|<cell|<around*|\||\<cal-M\><rsub|x>\<b-l\>-\<b-p\>|\|><rsup|2>+<around*|\||\<cal-M\><rsub|y>\<b-l\>-\<b-q\>|\|><rsup|2>>|<cell|>|<cell|>>>>
      </eqnarray*>
    </itemize-dot>

    \;
  </hidden>|<\hidden>
    <tit|\<#5149\>\<#5EA6\>\<#7ACB\>\<#4F53\>\<#6CD5\>>

    <image|img/monge_patch.png|1par|||>
  </hidden>|<\hidden>
    <tit|>

    <space|3em><image|img/shading_sphere.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#56FE\>\<#50CF\>\<#4E0E\>\<#6CD5\>\<#5411\>\<#91CF\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|B<around|(|x|)>>|<cell|=>|<cell|\<rho\><around|(|x|)>*\<b-N\><around|(|x|)>*\<cdummy\>*\<b-S\>*<rsub|1>>>|<row|<cell|I<around*|(|x,y|)>>|<cell|=>|<cell|k\<nospace\>B<around*|(|\<b-x\>|)>>>|<row|<cell|>|<cell|=>|<cell|k\<nospace\>B<around*|(|x,y|)>>>|<row|<cell|>|<cell|=>|<cell|k\<rho\><around*|(|x,y|)>\<b-N\><around*|(|x,y|)>\<cdummy\>\<b-S\><rsub|1>>>|<row|<cell|>|<cell|=>|<cell|\<b-g\><around*|(|x,y|)>\<cdummy\>\<b-V\><rsub|1>>>|<row|<cell|g<around*|(|x,y|)>>|<cell|=>|<cell|\<rho\><around*|(|x,y|)>\<b-N\><around*|(|x,y|)>>>|<row|<cell|\<b-V\><rsub|1>>|<cell|=>|<cell|k\<b-S\><rsub|1>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|\<#6CD5\>\<#5411\>\<#91CF\>\<#8BA1\>\<#7B97\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-i\><around*|(|x,y|)>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|I<rsub|1><around*|(|x,y|)>>|<cell|I<rsub|2><around*|(|x,y|)>>|<cell|\<cdots\>>|<cell|I<rsub|n><around*|(|x,y|)>>>>>><rsup|T>>>|<row|<cell|>|<cell|=>|<cell|\<cal-V\>\<b-g\><around*|(|x,y|)>>>|<row|<cell|\<cal-V\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-V\><rsup|T><rsub|1>>>|<row|<cell|\<b-V\><rsup|T><rsub|2>>>|<row|<cell|\<vdots\>>>|<row|<cell|\<b-V\><rsup|T><rsub|n>>>>>>>>>>
    </eqnarray*>

    \<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-N\><around*|(|x,y|)>>|<cell|=>|<cell|<frac|\<b-g\><around*|(|x,y|)>|<around*|\||\<b-g\><around*|(|x,y|)>|\|>>>>|<row|<cell|<around*|\||\<b-g\><around*|(|x,y|)>|\|>>|<cell|=>|<cell|\<rho\><around*|(|x,y|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#6CD5\>\<#5411\>\<#91CF\>\<#573A\>>

    <image|img/normal_field_sphere.png|0.9par|||>
  </hidden>|<\hidden>
    <tit|\<#4ECE\>\<#6CD5\>\<#5411\>\<#91CF\>\<#83B7\>\<#53D6\>\<#5F62\>\<#72B6\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-N\><around*|(|x,y|)>>|<cell|=>|<cell|<around*|(|1+<frac|\<partial\>f<rsup|2>|\<partial\>x>+<frac|\<partial\>f<rsup|2>|\<partial\>y>|)><rsup|-<frac|1|2>><matrix|<tformat|<table|<row|<cell|<frac|\<partial\>f|\<partial\>x>>|<cell|<frac|\<partial\>f|\<partial\>y>>|<cell|1>>>>><rsup|T>>>|<row|<cell|f<around*|(|x,y|)>>|<cell|=>|<cell|<big|oint><rsub|C><matrix|<tformat|<table|<row|<cell|<frac|\<partial\>f|\<partial\>x>>|<cell|<frac|\<partial\>f|\<partial\>y>>>>>><rsup|T>\<cdummy\>\<mathd\>\<b-l\>+c>>>>
    </eqnarray*>

    <math|l:<around*|(|0,0|)>\<rightarrow\><around*|(|0,v|)>\<rightarrow\><around*|(|u,v|)>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|f<around*|(|u,v|)>>|<cell|=>|<cell|<big|int><rsub|o><rsup|v><frac|\<partial\>f|\<partial\>y><matrix|<tformat|<table|<row|<cell|0>|<cell|y>>>>>\<mathd\>y+<big|int><rsub|o><rsup|u><frac|\<partial\>f|\<partial\>x><matrix|<tformat|<table|<row|<cell|x>|<cell|v>>>>>\<mathd\>x+c>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#6CD5\>\<#5411\>\<#91CF\>\<#573A\>\<#5230\>\<#9AD8\>\<#5EA6\>\<#573A\>>

    <image|img/height_field.png|0.9par|||>
  </hidden>|<\hidden>
    <tit|\<#4E92\>\<#53CD\>\<#5C04\>>

    <space|2em><image|img/interreflection.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#4E92\>\<#53CD\>\<#5C04\>\<#6A21\>\<#578B\>>

    <space|1em><image|img/interreflection_kernel_terminology.png|0.9par|||>
  </hidden>|<\hidden>
    <tit|\<#8BA1\>\<#7B97\>\<#51FA\>\<#5C04\>\<#5EA6\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|B<around*|(|\<b-u\>|)>>|<cell|=>|<cell|E<around*|(|\<b-u\>|)>+B<rsub|incoming><around*|(|\<b-u\>|)>>>|<row|<cell|B<rsub|incoming><around*|(|\<b-u\>|)>>|<cell|=>|<cell|\<rho\><rsub|d><around*|(|\<b-u\>|)><big|int><rsub|world>visible<around*|(|\<b-u\>,\<b-v\>|)>B<around*|(|\<b-v\>|)><frac|cos\<theta\><rsub|u>cos\<theta\><rsub|v>|\<pi\>d<rsup|2><rsub|u\<nospace\>v>>\<mathd\>A<rsub|\<b-v\>>>>|<row|<cell|>|<cell|=>|<cell|\<rho\><rsub|d><around*|(|\<b-u\>|)><big|int><rsub|world>visible<around*|(|\<b-u\>,\<b-v\>|)>B<around*|(|\<b-v\>|)>K<around*|(|\<b-u\>,\<b-v\>|)>\<mathd\>A<rsub|\<b-v\>>>>|<row|<cell|B<rsub|j\<rightarrow\>i><around*|(|\<b-x\>|)>>|<cell|=>|<cell|\<rho\><rsub|d><around*|(|x|)><big|int><rsub|patch
      j>visible<around*|(|\<b-x\>,\<b-v\>|)>K<around*|(|\<b-x\>,\<b-v\>|)>\<mathd\>A<rsub|\<b-v\>>B<rsub|j>>>|<row|<cell|<wide|B|\<bar\>><rsub|j\<rightarrow\>i>>|<cell|=>|<cell|<frac|1|A<rsub|i>><big|int><rsub|path
      i>\<rho\><rsub|d><around*|(|x|)><big|int><rsub|patch
      j>visible<around*|(|\<b-x\>,\<b-v\>|)>K<around*|(|\<b-x\>,\<b-v\>|)>\<mathd\>A<rsub|\<b-v\>>\<mathd\>A<rsub|\<b-x\>>B<rsub|j>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|>

    <\eqnarray*>
      <tformat|<table|<row|<cell|B<rsub|i>>|<cell|=>|<cell|E<rsub|i>+<big|sum><rsub|all
      j>B<rsub|<text|average incoming at <math|i> from
      <math|j>>>>>|<row|<cell|>|<cell|=>|<cell|E<rsub|i>+<big|sum><rsub|all
      j>K<rsub|i\<nospace\>j>B<rsub|j>>>>>
    </eqnarray*>

    where

    <\eqnarray*>
      <tformat|<table|<row|<cell|K<rsub|i\<nospace\>j>>|<cell|=>|<cell|<frac|1|A<rsub|i>><big|int><rsub|path
      i>\<rho\><rsub|d><around*|(|x|)><big|int><rsub|patch
      j>visible<around*|(|\<b-x\>,\<b-v\>|)>K<around*|(|\<b-x\>,\<b-v\>|)>\<mathd\>A<rsub|\<b-v\>>\<mathd\>A<rsub|\<b-x\>>>>>>
    </eqnarray*>
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