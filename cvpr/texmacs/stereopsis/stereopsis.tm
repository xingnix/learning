<TeXmacs|2.1.1>

<style|<tuple|beamer|blackboard>>

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
    <tit|\<#7ACB\>\<#4F53\>\<#89C6\>\<#89C9\>>

    <image|img/mars2020.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#53CC\>\<#76EE\>\<#878D\>\<#5408\>>

    <image|img/binocular_fusion.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#91CD\>\<#5EFA\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|z\<b-p\>>|<cell|=>|<cell|\<cal-M\>\<b-P\>>>|<row|<cell|z<rprime|'>\<b-p\><rprime|'>>|<cell|=>|<cell|\<cal-M\><rprime|'>\<b-P\>>>>>
    </eqnarray*>

    \<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-p\>\<times\>\<cal-M\>\<b-P\>>|<cell|=>|<cell|\<b-0\>>>|<row|<cell|\<b-p\><rprime|'>\<times\>\<cal-M\><rprime|'>\<b-P\>>|<cell|=>|<cell|\<b-0\>>>>>
    </eqnarray*>

    \<#5373\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<around*|(|<around*|[|\<b-p\>|]><rsub|\<times\>>\<cal-M\>|)>\<b-P\>>|<cell|=>|<cell|0>>|<row|<cell|<around*|(|<around*|[|\<b-p\><rprime|'>|]><rsub|\<times\>>\<cal-M\><rprime|'>|)>\<b-P\>>|<cell|=>|<cell|0>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    \;

    <image|img/triagulation_measurement_error.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#56FE\>\<#50CF\>\<#6821\>\<#6B63\>>

    <space|2em><image|img/image_rectification.png|0.8par|||>
  </hidden>|<\hidden>
    \;

    <space|4em><image|img/triangulation_rectified.png|0.8par|||>
  </hidden>|<\hidden>
    <space|2em><image|img/reconstruction_leaves.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#4EBA\>\<#773C\>\<#7ACB\>\<#4F53\>\<#89C6\>\<#89C9\>>

    <image|img/Vieth_Muller_Circle.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#968F\>\<#673A\>\<#70B9\>\<#4F53\>\<#89C6\>\<#56FE\>>

    <image|img/shaking_pepper.png|1par|||>
  </hidden>|<\hidden>
    <tit| Marr-Poggio algorithm>

    <image|img/Marr_Poggio_algorithm.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#968F\>\<#673A\>\<#70B9\>\<#4F53\>\<#89C6\>\<#56FE\>\<#878D\>\<#5408\>>

    <image|img/random_stereogram_fusion.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#76F8\>\<#5173\>\<#6CD5\>\<#627E\>\<#5BF9\>\<#5E94\>\<#70B9\>>

    <space|3em><image|img/correlation.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|\<#900F\>\<#89C6\>\<#7F29\>\<#5C0F\>>

    <image|img/foreshortening.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#8FB9\>\<#7F18\>\<#5339\>\<#914D\>>

    <space|2em><image|img/matching_edge.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#6B21\>\<#5E8F\>\<#7EA6\>\<#675F\>>

    <image|img/ordering_constraints.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#52A8\>\<#6001\>\<#89C4\>\<#5212\>>

    <image|img/dynamic_programming.png|1par|||>
  </hidden>|<\hidden>
    <tit|Dynamic Programming>

    <\itemize-dot>
      <item> m, n : edge points, (the endpoints of the scanlines are
      included.)

      <item>Inferior-Neighbors(k, l): neighbors (i, j) of t (k, l) i \<leq\>
      k, j \<leq\> l,\ 

      <item>Arc-Cost(i, j, k, l): \ cost of matching the intervals (i, k) and
      (j, l).

      <item>C(1, 1): \ should be initialized with a value of zero.
    </itemize-dot>

    <\folded-std>
      % Loop over all nodes (k, l) in ascending order.
    <|folded-std>
      for k = 1 to m do

      <space|3em>for l = 1 to n do

      <space|8em>% Initialize cost C(k, l) and backward pointer B(k, l).

      <space|8em>C(k, l) \<leftarrow\> +\<infty\>; B(k, l) \<leftarrow\> nil;

      <\folded-std>
        <space|7em>% Loop over all inferior neighbors (i, j) of (k, l).
      <|folded-std>
        <space|7em>for (i, j) \<in\> Inferior-Neighbors(k, l) do

        <space|7em>% Compute cost, update backward pointer\ 

        <space|11em>d \<leftarrow\> C(i, j) + Arc-Cost(i, j, k, l);

        <space|11em>if d \<less\> C(k, l)\ 

        <space|11em>then C(k,l)\<leftarrow\>d; B(k,l)\<leftarrow\>(i, j)

        <space|11em>endif;

        <space|7em>endfor;
      </folded-std>

      \;

      <space|3em>endfor;

      endfor;
    </folded-std>

    <\folded-std>
      % Construct optimal path by following backward pointers from (m, n).
    <|folded-std>
      P \<leftarrow\> {(m, n)};\ 

      (i, j) \<leftarrow\> (m, n);

      while B(i, j) != nil do\ 

      <space|3em>(i, j) \<leftarrow\> B(i, j);

      <space|3em>P \<leftarrow\> {(i, j)} \<cup\> P\ 

      endwhile.
    </folded-std>

    \;

    \;
  </hidden>|<\hidden>
    <tit|\<#4E09\>\<#76EE\>\<#7ACB\>\<#4F53\>\<#89C6\>\<#89C9\>>

    <image|img/trinocular_sterero.png|1par|||>
  </hidden>|<\shown>
    <tit|\<#66F2\>\<#7EBF\>\<#5207\>\<#7EBF\>\<#9884\>\<#6D4B\>>

    <image|img/from_p1_p2_to_p3.png|1par|||>

    <\folded-std>
      \ Note
    <|folded-std>
      <\eqnarray*>
        <tformat|<table|<row|<cell|\<b-l\><rsub|1>>|<cell|\<propto\>>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-l\><rsub|2><rsup|T>\<cal-G\><rsub|1><rsup|1>\<b-l\><rsub|3>>>|<row|<cell|\<b-l\><rsub|2><rsup|T>\<cal-G\><rsub|1><rsup|2>\<b-l\><rsub|3>>>|<row|<cell|\<b-l\><rsub|2><rsup|T>\<cal-G\><rsub|1><rsup|3>\<b-l\><rsub|3>>>>>>>>|<row|<cell|\<cal-G\><rsub|1><rsup|i>>|<cell|=>|<cell|\<b-t\><rsub|2>\<b-R\><rsub|3><rsup|i\<nospace\>T>-\<b-R\><rsub|2><rsup|i>\<b-t\><rsub|3><rsup|T><space|2em>i=1,2,3>>>>
      </eqnarray*>
    </folded-std>
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