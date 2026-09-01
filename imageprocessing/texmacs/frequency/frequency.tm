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
    Kai|\<#9891\>\<#57DF\>\<#6EE4\>\<#6CE2\>>>>>

    \;
  </hidden>|<\hidden>
    <tit|\<#5085\>\<#91CC\>\<#53F6\>\<#7EA7\>\<#6570\>>

    <space|4em><image|img/fourier-series.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|FFT\<#8BA1\>\<#7B97\>\<#590D\>\<#6742\>\<#5EA6\>>

    <image|img/fft-complex.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#8109\>\<#51B2\>\<#5E8F\>\<#5217\>>

    <image|img/impulse-train.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#5085\>\<#91CC\>\<#53F6\>\<#53D8\>\<#6362\>>

    <image|img/box-fourier.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#91C7\>\<#6837\>>

    <space|5em><image|img/sampling.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|\<#91C7\>\<#6837\>(\<#9891\>\<#57DF\>)>

    <space|4em><image|img/sampling-fourier.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|Nyquist rate>

    <space|1em><image|img/nyquist.png|0.9par|||>
  </hidden>|<\hidden>
    <tit|\<#590D\>\<#73B0\>(\<#9891\>\<#57DF\>)>

    <image|img/recover.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6DF7\>\<#53E0\>>

    <image|img/aliasing.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6DF7\>\<#53E0\>(\<#9891\>\<#57DF\>)>

    <space|3em><image|img/aliasing-frequency.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#79BB\>\<#6563\>\<#4FE1\>\<#53F7\>>

    \;

    \;

    \;

    <image|img/sampling-discrete.png|1par|||>
  </hidden>|<\hidden>
    <tit|2D\<#79BB\>\<#6563\>\<#8109\>\<#51B2\>>

    \;

    \;

    \;

    <space|1em><image|img/2dimpulse.png|.9par|||>
  </hidden>|<\hidden>
    <tit|2D\<#51FD\>\<#6570\>(box)>

    \;

    \;

    \;

    <image|img/2d-box-fourier.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6B20\>\<#91C7\>\<#6837\>\<#4E0E\>\<#8FC7\>\<#91C7\>\<#6837\>(2D)>

    \;

    \;

    <image|img/2d-over-under-sample.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6DF7\>\<#53E0\>\<#6548\>\<#5E94\>>

    \;

    <space|1em><image|img/aliasing-effect.png|0.9par|||>
  </hidden>|<\hidden>
    <tit|\<#6DF7\>\<#53E0\>(checkerboard)>

    \;

    \;

    <image|img/aliasing-checkerboard.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6DF7\>\<#53E0\>(\<#91CD\>\<#91C7\>\<#6837\>)>

    <image|img/aliasing-resample.png|1par|||>
  </hidden>|<\hidden>
    <tit|<strong|\<#6469\>\<#5C14\>\<#6548\>\<#5E94\>>(Moire effect)>

    \;

    <image|img/moire-effect.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6DF7\>\<#53E0\>(halftone)>

    \;

    <space|2em><image|img/newspaper-moire.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#5468\>\<#671F\>\<#6027\>>

    <space|5em><image|img/periods.png|.6par|||>
  </hidden>|<\hidden>
    <tit|\<#9891\>\<#8C31\>>

    <space|3em><image|img/spectrum.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#9891\>\<#8C31\>(\<#5E73\>\<#79FB\>\<#3001\>\<#65CB\>\<#8F6C\>)>

    \;

    <space|2em><image|img/spectrum-translate-rotate.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#76F8\>\<#89D2\>>

    \;

    \;

    \;

    <image|img/spectrum-phase-angle.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#9891\>\<#8C31\>\<#4E0E\>\<#76F8\>\<#89D2\>>

    <space|6em><image|img/spectrum-phase-angle-boy-box.png|0.6par|||>
  </hidden>|<\hidden>
    <tit|\<#5377\>\<#79EF\>>

    <space|5em><image|img/convolution.png|0.6par|||>
  </hidden>|<\hidden>
    <tit|\<#5085\>\<#91CC\>\<#53F6\>\<#53D8\>\<#6362\>>

    \;

    <space|2em><image|img/ic-fourier.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#6EE4\>\<#6CE2\>(dc=0)>

    \;

    <image|img/ic-dc0.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6EE4\>\<#6CE2\>\<#5668\>>

    <space|2em><image|img/ic-filters.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#586B\>\<#5145\>(padding)>

    \;

    <image|img/periodic-padding.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#5468\>\<#671F\>\<#6027\>>

    <image|img/periodicity.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#632F\>\<#94C3\>\<#6548\>\<#5E94\>(ringing artifacts)>

    <space|3em><image|img/ringing.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#6539\>\<#53D8\>\<#76F8\>\<#89D2\>>

    \;

    \;

    <space|3em><image|img/ic-phase-change.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#9AD8\>\<#65AF\>\<#6EE4\>\<#6CE2\>>

    <space|3em><image|img/ic-gaussian.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|Sobel>

    <space|3em><image|img/sobel.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#7406\>\<#60F3\>\<#4F4E\>\<#901A\>\<#6EE4\>\<#6CE2\>\<#5668\>>

    \;

    \;

    \;

    <image|img/ideal-lowpass.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6D4B\>\<#8BD5\>\<#56FE\>\<#50CF\>>

    \;

    <space|3em><image|img/test-pattern.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#6EE4\>\<#6CE2\>\<#7ED3\>\<#679C\>>

    <space|4em><image|img/test-pattern-result.png|.7par|||>
  </hidden>|<\hidden>
    <tit|\<#6EE4\>\<#6CE2\>\<#5668\>-\<#5377\>\<#79EF\>\<#6838\>>

    \;

    \;

    <image|img/ideal-lowpass-kernel.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#9AD8\>\<#65AF\>\<#4F4E\>\<#901A\>\<#6EE4\>\<#6CE2\>\<#5668\>(<math|\<sigma\><rsup|2>=D<rsub|0><rsup|2>>)>

    \;

    \;

    <image|img/gaussian-lowpass-variance.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6EE4\>\<#6CE2\>\<#6548\>\<#679C\>>

    \;

    <space|4em><image|img/test-pattern-gaussian-lowpass-result.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|\<#5DF4\>\<#7279\>\<#6C83\>\<#65AF\>(Butterworth)\<#6EE4\>\<#6CE2\>\<#5668\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|H<around*|(|u,v|)>>|<cell|=>|<cell|<frac|1|1+<around*|[|D<around*|(|u,v|)>/D<rsub|0>|]><rsup|2n>>>>>>
    </eqnarray*>

    <image|img/butterworth-lowpass.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6EE4\>\<#6CE2\>\<#6548\>\<#679C\>>

    <space|4em><image|img/test-pattern-butterworth.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|\<#6EE4\>\<#6CE2\>\<#5668\>-\<#5377\>\<#79EF\>\<#6838\>>

    \;

    <image|img/butterworth-spatial.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6587\>\<#672C\>\<#6EE4\>\<#6CE2\>>

    \;

    <image|img/text-gaussian-lowpass.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#4EBA\>\<#50CF\>\<#6EE4\>\<#6CE2\>>

    \;

    <image|img/face-gaussian-lowpass.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#9065\>\<#611F\>\<#56FE\>\<#50CF\>\<#6EE4\>\<#6CE2\>>

    \;

    <image|img/satellite-gaussian-lowpass.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#9AD8\>\<#901A\>\<#6EE4\>\<#6CE2\>\<#5668\>>

    <space|4em><image|img/highpass.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|\<#6EE4\>\<#6CE2\>\<#5668\>-\<#5377\>\<#79EF\>\<#6838\>>

    \;

    <space|3em><image|img/highpass-spatial.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#9AD8\>\<#901A\>\<#6EE4\>\<#6CE2\>\<#6548\>\<#679C\>>

    <space|3em><image|img/test-pattern-highpass-result.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#632F\>\<#94C3\>\<#6548\>\<#5E94\>>

    \;

    \;

    <image|img/test-pattern-highpass-ringing.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6307\>\<#7EB9\>\<#56FE\>\<#50CF\>\<#5904\>\<#7406\>>

    \;

    <image|img/fingerprint.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#8FB9\>\<#7F18\>\<#589E\>\<#5F3A\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|g<around*|(|x,y|)>>|<cell|=>|<cell|f<around*|(|x,y|)>+c\<nabla\><rsup|2>f<around*|(|x,y|)>>>|<row|<cell|>|<cell|=>|<cell|\<frak-F\><rsup|-1><around*|(|<around*|(|1+4\<pi\><rsup|2>D<rsup|2><around*|(|u,v|)>|)>F<around*|(|u,v|)>|)>>>>>
    </eqnarray*>

    <image|img/moon-enhance-laplacian.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#9AD8\>\<#9891\>\<#589E\>\<#5F3A\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|g<around*|(|x,y|)>>|<cell|=>|<cell|\<frak-F\><rsup|-1><around*|(|<around*|(|k<rsub|1>+k<rsub|2>H<rsub|HP><around*|(|u,v|)>|)>F<around*|(|u,v|)>|)>>>>>
    </eqnarray*>

    <space|3em><image|img/high-frequency-emphasis.png|.8par|||>
  </hidden>|<\hidden>
    <tit|\<#540C\>\<#6001\>\<#6EE4\>\<#6CE2\>>

    <image|img/homomorphic-filtering-process.png|1par|||>

    <space|4em><image|img/homomorphic-filtering-enhance.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|\<#5E26\>\<#963B\>\<#6EE4\>\<#6CE2\>\<#5668\>>

    \;

    <image|img/bandreject-filters-radial-cross-section.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#5E26\>\<#963B\>\<#6EE4\>\<#6CE2\>\<#5668\>>

    \;

    <space|3em><image|img/bandreject-filters-perspective.png|0.8par|||>

    <space|3em><image|img/bandreject-filter-image.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#9677\>\<#6CE2\>\<#6EE4\>\<#6CE2\>\<#5668\>>

    <space|7em><image|img/moire-pattern-notch-filter.png|.5par|||>
  </hidden>|<\hidden>
    <tit|\<#5468\>\<#671F\>\<#6761\>\<#7EB9\>\<#6D88\>\<#9664\>>

    <space|3em><image|img/saturn-ring-interference.png|.7par|||>
  </hidden>|<\shown>
    <tit|\<#5468\>\<#671F\>\<#6761\>\<#7EB9\>\<#6EE4\>\<#6CE2\>\<#5668\>>

    \;

    \;

    \;

    <image|img/notch-pass-filter.png|1par|||>
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