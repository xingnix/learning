<TeXmacs|2.1>

<style|<tuple|beamer|blackboard>>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <doc-data|<doc-title|<with|font-base-size|20|<with|font|Evermore
    Kai|\<#56FE\>\<#50CF\>\<#590D\>\<#539F\>>>>>

    \;
  </hidden>|<\hidden>
    <tit|\<#56FE\>\<#50CF\>\<#9000\>\<#5316\>\<#4E0E\>\<#6062\>\<#590D\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|g<around*|(|x,y|)>>|<cell|=>|<cell|<around*|(|h\<ast\>f|)><around*|(|x,y|)>+\<eta\><around*|(|x,y|)>>>|<row|<cell|G<around*|(|u,v|)>>|<cell|=>|<cell|H<around*|(|u,v|)>F<around*|(|u,v|)>+N<around*|(|u,v|)>>>>>
    </eqnarray*>

    \;

    <image|img/degradation_restoration.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#566A\>\<#58F0\>\<#6A21\>\<#578B\>(\<#6982\>\<#7387\>\<#5BC6\>\<#5EA6\>)>

    <space|3em><image|img/probability_density_functions.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#566A\>\<#58F0\>\<#6548\>\<#679C\>(\<#6D4B\>\<#8BD5\>\<#6A21\>\<#677F\>)>

    \;

    \;

    <space|3em><image|img/test_pattern.png|.7par|||>
  </hidden>|<\hidden>
    <tit|\<#566A\>\<#58F0\>\<#6548\>\<#679C\>>

    <space|3em><image|img/test_pattern_noise_image_hist.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#566A\>\<#58F0\>\<#6548\>\<#679C\>(\<#7EED\>)>

    <space|3em><image|img/test_pattern_noise_image_hist_continue.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#5468\>\<#671F\>\<#566A\>\<#58F0\>>

    \;

    \;

    <image|img/sinusoidal_noise.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#566A\>\<#58F0\>\<#4F30\>\<#8BA1\>>

    \;

    \;

    <image|img/strip_hist.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#53BB\>\<#566A\>(\<#9AD8\>\<#65AF\>\<#566A\>\<#58F0\>)>

    <space|3em><image|img/restore_gaussian_noise.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#53BB\>\<#566A\>(\<#6912\>\<#76D0\>\<#566A\>\<#58F0\>)>

    <space|3em><image|img/restore_pepper_salt_noise.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#53C2\>\<#6570\>\<#9519\>\<#8BEF\>\<#6548\>\<#679C\>>

    <image|img/restore_pepper_salt_noise_wrong.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#4E2D\>\<#503C\>\<#6EE4\>\<#6CE2\>>

    <space|3em><image|img/median_filter_3.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#6700\>\<#5927\>\<#503C\>/\<#6700\>\<#5C0F\>\<#503C\>\<#6EE4\>\<#6CE2\>\<#5668\>>

    \;

    \;

    <space|3em><image|img/max_min_filter.png|.8par|||>
  </hidden>|<\hidden>
    <tit|Alpha-trimmed filter>

    <space|8em><image|img/alpha_trimmed_filter.png|.55par|||>
  </hidden>|<\hidden>
    <tit|\<#81EA\>\<#9002\>\<#5E94\>\<#964D\>\<#566A\>\<#6EE4\>\<#6CE2\>>

    <space|3em><image|img/adaptive_noise_reduction_filter.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#81EA\>\<#9002\>\<#5E94\>\<#4E2D\>\<#503C\>\<#6EE4\>\<#6CE2\>>

    \;

    \;

    <image|img/adaptive_median_filter.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#5468\>\<#671F\>\<#566A\>\<#58F0\>\<#6D88\>\<#9664\>(\<#9677\>\<#6CE2\>\<#6EE4\>\<#6CE2\>\<#5668\>)>

    \;

    \;

    \;

    <image|img/notch_reject_filter.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#5468\>\<#671F\>\<#566A\>\<#58F0\>\<#6D88\>\<#9664\>>

    <space|3em><image|img/sinusoidal_interference_notch_filter.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#5468\>\<#671F\>\<#566A\>\<#58F0\>>

    \;

    \;

    <image|img/sinusoidal_pattern.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#5468\>\<#671F\>\<#566A\>\<#58F0\>\<#6D88\>\<#9664\>(\<#536B\>\<#661F\>\<#56FE\>\<#50CF\>)>

    <space|3em><image|img/satellite_image_scan_line.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#5468\>\<#671F\>\<#566A\>\<#58F0\>>

    \;

    \;

    <space|1em><image|img/satellite_image_noise_pattern.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#6700\>\<#4F18\>\<#9677\>\<#6CE2\>\<#6EE4\>\<#6CE2\>\<#5668\>(\<#5468\>\<#671F\>\<#5E72\>\<#6270\>)>

    <space|3em><image|img/martian_mariner_6_periodic_interference.png|.8par|||>

    <space|12em><image|img/martian_mariner_6_periodic_interference_fourier.png|.5par|||>
  </hidden>|<\hidden>
    <tit|\<#5468\>\<#671F\>\<#5E72\>\<#6270\>\<#4FE1\>\<#53F7\>>

    \;

    \;

    <image|img/martian_mariner_6_periodic_interference_pattern.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6700\>\<#4F18\>\<#9677\>\<#6CE2\>\<#6EE4\>\<#6CE2\>\<#5668\>(\<#56FE\>\<#50CF\>\<#6062\>\<#590D\>\<#6548\>\<#679C\>)>

    \;

    <space|3em><image|img/martian_mariner_6_periodic_interference_restore.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#7EBF\>\<#6027\>\<#4F4D\>\<#7F6E\>\<#4E0D\>\<#53D8\>\<#9000\>\<#5316\>(\<#9000\>\<#5316\>\<#51FD\>\<#6570\>\<#4F30\>\<#8BA1\>)>

    \;

    \;

    <image|img/point_spread_function.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#5927\>\<#6C14\>\<#6E4D\>\<#6D41\>\<#6A21\>\<#578B\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|H<around*|(|u,v|)>>|<cell|=>|<cell|e<rsup|-k<around*|(|u<rsup|2>+v<rsup|2>|)><rsup|5/6>>>>>>
    </eqnarray*>

    <space|6em><image|img/modeling_turbulence.png|0.6par|||>
  </hidden>|<\hidden>
    <tit|\<#8FD0\>\<#52A8\>\<#6A21\>\<#7CCA\>>

    \;

    \;

    <image|img/motion_blurring.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#56FE\>\<#50CF\>\<#6062\>\<#590D\>(\<#9006\>\<#6EE4\>\<#6CE2\>)>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|F|^><around*|(|u,v|)>>|<cell|=>|<cell|<frac|G<around*|(|u,v|)>|H<around*|(|u,v|)>>>>>>
    </eqnarray*>

    <space|6em><image|img/inverse_filter.png|0.6par|||>
  </hidden>|<\hidden>
    <tit|\<#7EF4\>\<#7EB3\>\<#6EE4\>\<#6CE2\>>

    <\folded>
      \;

      <\eqnarray*>
        <tformat|<table|<row|<cell|<wide|F|^><around*|(|u,v|)>>|<cell|=>|<cell|<around*|[|<frac|H<rsup|\<ast\>><around*|(|u,v|)>S<rsub|f><around*|(|u,v|)>|S<rsub|f><around*|(|u,v|)><around*|\||H<around*|(|u,v|)>|\|><rsup|2>+S<rsub|\<eta\>><around*|(|u,v|)>>|]>G<around*|(|u,v|)>>>>>
      </eqnarray*>
    <|folded>
      <\eqnarray*>
        <tformat|<table|<row|<cell|W>|<cell|=>|<cell|arg
        min<rsub|W><around*|\||F<around*|(|u,v|)>-W<around*|(|u,v|)>G<around*|(|u,v|)>|\|><rsup|2>>>|<row|<cell|0>|<cell|=>|<cell|<around*|(|F<around*|(|u,v|)>-W<around*|(|u,v|)>G<around*|(|u,v|)>|)>G<rsup|\<ast\>><around*|(|u,v|)>>>|<row|<cell|F<around*|(|u,v|)>G<rsup|\<ast\>><around*|(|u,v|)>>|<cell|=>|<cell|W<around*|(|u,v|)>G<around*|(|u,v|)>G<rsup|\<ast\>><around*|(|u,v|)>>>|<row|<cell|W<around*|(|u,v|)>>|<cell|=>|<cell|<frac|F<around*|(|u,v|)>G<rsup|\<ast\>><around*|(|u,v|)>|G<around*|(|u,v|)>G<rsup|\<ast\>><around*|(|u,v|)>>>>|<row|<cell|W>|<cell|=>|<cell|<frac|F<around*|(|H<rsup|\<ast\>>F<rsup|\<ast\>>+N<rsup|\<ast\>>|)>|<around*|(|H*F+N|)><around*|(|H<rsup|\<ast\>>F<rsup|\<ast\>>+N<rsup|\<ast\>>|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|F**H<rsup|\<ast\>>F<rsup|\<ast\>>|H*F*H*F<rsup|\<ast\>>+N*N<rsup|\<ast\>>>>>|<row|<cell|>|<cell|=>|<cell|<frac|H<rsup|\<ast\>>S<rsub|f>|S<rsub|f><around*|\||H|\|><rsup|2>+S<rsub|\<eta\>>>>>>>
      </eqnarray*>
    </folded>

    <space|2em><image|img/wiener_filter.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#8FD0\>\<#52A8\>\<#6A21\>\<#7CCA\>\<#6D88\>\<#9664\>>

    <space|7em><image|img/motion_deblurring.png|.55par|||>
  </hidden>|<\hidden>
    <tit|\<#7EA6\>\<#675F\>\<#6700\>\<#5C0F\>\<#4E8C\>\<#4E58\>\<#6EE4\>\<#6CE2\>>

    <\folded>
      \;

      <\eqnarray*>
        <tformat|<cwith|1|1|1|3|font-base-size|14>|<table|<row|<cell|<wide|F|^><around*|(|u,v|)>>|<cell|=>|<cell|<around*|[|<frac|H<rsup|\<ast\>><around*|(|u,v|)>|<around*|\||H<around*|(|u,v|)>|\|><rsup|2>+\<gamma\><around*|\||P<around*|(|u,v|)>|\|><rsup|2>>|]>G<around*|(|u,v|)>,<application-space|1em>P=\<frak-F\><around*|(|\<nabla\><rsup|2>|)>>>>>
      </eqnarray*>
    <|folded>
      <\eqnarray*>
        <tformat|<table|<row|<cell|<wide|F|^>>|<cell|=>|<cell|arg
        min<rsub|F><frac|1|2><around*|(|G-H*F|)><around*|(|G-H*F|)><rsup|\<ast\>>+\<gamma\>P*F*<around*|(|P*F|)><rsup|\<ast\>>>>|<row|<cell|0>|<cell|=>|<cell|-<around*|(|G-H*<wide|F|^>|)>H<rsup|\<ast\>>+\<gamma\>P*P<rsup|\<ast\>><wide|F*|^>>>|<row|<cell|H*<wide|F*|^>H<rsup|\<ast\>>+\<gamma\>P*P<rsup|\<ast\>><wide|F|^>*>|<cell|=>|<cell|G*H<rsup|\<ast\>>>>|<row|<cell|<around*|(|<around*|\||H|\|><rsup|2>+\<gamma\><around*|\||P|\|><rsup|2>|)><wide|F|^>*>|<cell|=>|<cell|G*H<rsup|\<ast\>>>>|<row|<cell|<wide|F*|^>>|<cell|=>|<cell|<around*|[|<frac|*H<rsup|\<ast\>>|<around*|\||H|\|><rsup|2>+\<gamma\><around*|\||P|\|><rsup|2>>|]>G>>>>
      </eqnarray*>
    </folded>

    <image|img/constrained_least_squares_filter.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#4E0D\>\<#540C\>\<#566A\>\<#58F0\>\<#53C2\>\<#6570\>>

    \;

    \;

    <image|img/iteratively_constrained_least_squares_filtering.png|1par|||>
  </hidden>|<\shown>
    <tit|\<#51E0\>\<#4F55\>\<#5747\>\<#503C\>\<#6EE4\>\<#6CE2\>\<#5668\>>

    \;

    \;

    \;

    <\eqnarray*>
      <tformat|<cwith|1|1|1|-1|font-base-size|14>|<table|<row|<cell|<wide|F|^><around*|(|u,v|)>>|<cell|=>|<cell|<around*|[|<frac|H<rsup|\<ast\>><around*|(|u,v|)>|H<around*|(|u,v|)>>|]><rsup|\<alpha\>><around*|[|<frac|H<rsup|\<ast\>><around*|(|u,v|)>|<around*|\||H<around*|(|u,v|)>|\|><rsup|2>+\<beta\><around*|[|<frac|S<rsub|\<eta\>><around*|(|u,v|)>|S<rsub|f><around*|(|u,v|)>>|]>>|]><rsup|1-\<alpha\>>G<around*|(|u,v|)>>>>>
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