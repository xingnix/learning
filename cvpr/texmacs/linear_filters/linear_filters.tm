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
    <tit|\<#7EBF\>\<#6027\>\<#6EE4\>\<#6CE2\>\<#5668\>>

    \;
  </hidden>|<\hidden>
    <tit|\<#7EBF\>\<#6027\>\<#6EE4\>\<#6CE2\>\<#4E0E\>\<#5377\>\<#79EF\>>

    \<#5E73\>\<#5747\>\<#503C\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-R\><rsub|i\<nospace\>j>>|<cell|=>|<cell|<frac|1|<around*|(|2k+1|)><rsup|2>><big|sum><rsub|u=i-k><rsup|u=i+k><big|sum><rsub|v=j-k><rsup|v=j+k>\<cal-F\><rsub|u\<nospace\>v>>>>>
    </eqnarray*>

    \<#5377\>\<#79EF\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-R\><rsub|i\<nospace\>j>>|<cell|=>|<cell|<big|sum><rsub|u,v>H<rsub|i-u,j-v>F<rsub|u,v>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5747\>\<#503C\>\<#6EE4\>\<#6CE2\>\<#793A\>\<#4F8B\>>

    <space|7em><image|img/uniform_weighted_average.png|0.5par|||>

    <\folded-std>
      Figure 8.1.
    <|folded-std>
      Although a uniform local average may seem to give a good blurring
      model, it generates effects that are not usually seen in defocussing a
      lens. The images above compare the effects of a uniform local average
      with weighted average. The image at the top shows a view of grass. On
      the left in the second row, the result of blurring this image using a
      uniform local model and on the right, the result of blurring this image
      using a set of Gaussian weights. The degree of blurring in each case is
      about the same, but the uniform average produces a set of narrow
      vertical and horizontal bars \V an effect often known as ringing. The
      bottom row shows the weights used to blur the image, themselves
      rendered as an image; bright points represent large values and dark
      points represent small values (in this example the smallest values are
      zero).
    </folded-std>
  </hidden>|<\hidden>
    <tit|\<#9AD8\>\<#65AF\>\<#6838\>>

    \;

    \<#5BF9\>\<#79F0\>\<#9AD8\>\<#65AF\>\<#6838\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|G<rsub|\<sigma\>><around*|(|x,y|)>>|<cell|=>|<cell|<frac|1|2\<pi\>\<sigma\><rsup|2>>exp<around*|(|-<frac|<around*|(|x<rsup|2>+y<rsup|2>|)>|2\<sigma\><rsup|2>>|)>>>>>
    </eqnarray*>

    \<#79BB\>\<#6563\>\<#5F62\>\<#5F0F\>\<#FF0C\><math|2k+1\<times\>2k+1>\<#77E9\>\<#9635\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|H<rsub|i\<nospace\>j>>|<cell|=>|<cell|<frac|1|2\<pi\>\<sigma\><rsup|2>>exp<around*|(|-<frac|<around*|(|<around*|(|i-k-1|)><rsup|2>+<around*|(|j-k-1|)><rsup|2>|)>|2\<sigma\><rsup|2>>|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#9AD8\>\<#65AF\>\<#6838\>>

    <space|4em><image|img/gaussian_kernel.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|\<#9AD8\>\<#65AF\>\<#566A\>\<#58F0\>\<#4E0E\>\<#9AD8\>\<#65AF\>\<#6EE4\>\<#6CE2\>\<#5668\>>

    <space|4em><image|img/gaussian_noise_filter.png|0.6par|||>

    <\folded-std>
      FIGURE 4.3:
    <|folded-std>
      The top row shows images of a constant mid-gray level corrupted by
      additive Gaussian noise. In this noise model, each pixel has a
      zero-mean normal random variable added to it. The range of pixel values
      is from zero to one, so that the standard deviation of the noise in the
      first column is about 1/20 of full range. The center row shows the
      effect of smoothing the corresponding image in the top row with a
      Gaussian filter of \<sigma\> one pixel. Notice the annoying overloading
      of notation here; there is Gaussian noise and Gaussian filters, and
      both have \<sigma\>'s. One uses context to keep these two straight,
      although this is not always as helpful as it could be, because Gaussian
      filters are particularly good at suppressing Gaussian noise. This is
      because the noise values at each pixel are independent, meaning that
      the expected value of their average is going to be the noise mean. The
      bottom row shows the effect of smoothing the corresponding image in the
      top row with a Gaussian filter of \<sigma\> two pixels.

      \;
    </folded-std>
  </hidden>|<\hidden>
    <tit|\<#6912\>\<#76D0\>\<#566A\>\<#58F0\>\<#4E0E\>\<#9AD8\>\<#65AF\>\<#6EE4\>\<#6CE2\>>

    <space|7em><image|img/salt_pepper_gaussian_filter.png|0.5par|||>

    <\folded-std>
      Figure 8.3.
    <|folded-std>
      \ In salt-and-pepper noise, we choose pixels uniformly at random, and
      uni-formly at random make them either black or white. Gaussian
      smoothing is particularly effective at suppressing the effects of
      salt-and-pepper noise. The top row shows an image, and versions
      smoothed by a symmetric Gaussian with \<sigma\> two pixels and four
      pixels. The images in the second row are obtained by corrupting the
      images in the top row by this noise model and then smoothing the
      result. Notice that, as the smoothing increases, detail is lost, but
      the effects of the noise diminish, too \V the smoothed versions of the
      noisy images look very much like the smoothed version of the noise-free
      images.

      \;
    </folded-std>
  </hidden>|<\hidden>
    <tit|\<#5BFC\>\<#6570\>\<#4E0E\>\<#6709\>\<#9650\>\<#5DEE\>\<#5206\>>

    \<#504F\>\<#5BFC\>\<#6570\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<partial\>f|\<partial\>x>>|<cell|=>|<cell|lim<rsub|\<varepsilon\>\<rightarrow\>0><frac|f<around*|(|x+\<varepsilon\>,y|)>-f<around*|(|x,y|)>|\<varepsilon\>>>>>>
    </eqnarray*>

    \<#6709\>\<#9650\>\<#5DEE\>\<#5206\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<partial\>h|\<partial\>x>>|<cell|\<approx\>>|<cell|h<rsub|i+1,j>-h<rsub|i-1,j>>>>>
    </eqnarray*>

    \<#5377\>\<#79EF\>\<#6838\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-H\>>|<cell|=>|<cell|<around*|{|<tabular|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|1>|<cell|0>|<cell|-1>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>|}>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5DEE\>\<#5206\>\<#56FE\>\<#50CF\>>

    <space|3em><image|img/difference_image_zebra.png|0.8par|||>

    <\folded-std>
      FIGURE 4.4:
    <|folded-std>
      The top row shows estimates of derivatives obtained by finite
      differences. The image at the left shows a detail from a picture of a
      zebra. The center image shows the partial derivative in the
      y-direction\Vwhich responds strongly to horizontal stripes and weakly
      to vertical stripes\Vand the right image shows the partial derivative
      in the x-direction\Vwhich responds strongly to vertical stripes and
      weakly to horizontal stripes. However, finite differences respond
      strongly to noise. The image at center left shows a detail from a
      picture of a zebra; the next image in the row is obtained by adding a
      random number with zero mean and normal distribution (\<sigma\> = 0.03;
      the darkest value in the image is 0, and the lightest 1) to each pixel;
      and the third image is obtained by adding a random number with zero
      mean and normal distribution (\<sigma\> = 0.09) to each pixel. The
      bottom row shows the partial derivative in the x-direction of the image
      at the head of the row. Notice how strongly the differentiation process
      emphasizes image noise; the derivative figures look increasingly
      grainy. In the derivative figures, a mid-gray level is a zero value, a
      dark gray level is a negative value, and a light gray level is a
      positive value.

      \;
    </folded-std>
  </hidden>|<\hidden>
    <tit|\<#5E73\>\<#79FB\>\<#4E0D\>\<#53D8\>\<#7EBF\>\<#6027\>\<#7CFB\>\<#7EDF\>>

    \<#7EBF\>\<#6027\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|R<around*|(|f+g|)>>|<cell|=>|<cell|R<around*|(|f|)>+R<around*|(|g|)>>>|<row|<cell|R<around*|(|k\<nospace\>f|)>>|<cell|=>|<cell|k\<nospace\>R<around*|(|f|)>>>>>
    </eqnarray*>

    \<#5E73\>\<#79FB\>\<#4E0D\>\<#53D8\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|R<around*|(|f<around*|(|x|)>|)>>|<cell|=>|<cell|g<around*|(|x|)>>>|<row|<cell|R<around*|(|f<around*|(|x-y|)>|)>>|<cell|=>|<cell|g<around*|(|x-y|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#79BB\>\<#6563\>\<#5377\>\<#79EF\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-e\><rsub|0>>|<cell|=>|<cell|\<ldots\>.0,0,0,1,0,0,0\<ldots\>.>>|<row|<cell|\<b-f\>>|<cell|=>|<cell|<big|sum><rsub|i>f<rsub|i>Shift<around*|(|\<b-e\><rsub|0>,i|)>>>|<row|<cell|R<around*|(|Shift<around*|(|\<b-f\>,k|)>|)>>|<cell|=>|<cell|Shift<around*|(|R<around*|(|\<b-f\>|)>,k|)>>>|<row|<cell|R<around*|(|k\<b-f\>|)>>|<cell|=>|<cell|k\<nospace\>R<around*|(|\<b-f\>|)>>>>>
    </eqnarray*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|R<around*|(|\<b-f\>|)>>|<cell|=>|<cell|R<around*|(|<big|sum><rsub|i>f<rsub|i>Shift<around*|(|\<b-e\><rsub|0>,i|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i>R<around*|(|f<rsub|i>Shift<around*|(|\<b-e\><rsub|0>,i|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i>f<rsub|i>R<around*|(|Shift<around*|(|\<b-e\><rsub|0>,i|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i>f<rsub|i>Shift<around*|(|R<around*|(|\<b-e\><rsub|0>|)>,i|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#79BB\>\<#6563\>\<#5377\>\<#79EF\>\<#FF08\>\<#7EED\>\<#FF09\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-g\>>|<cell|=>|<cell|R<around*|(|\<b-e\><rsub|0>|)>>>|<row|<cell|R<around*|(|\<b-f\>|)>>|<cell|=>|<cell|<big|sum><rsub|i>f<rsub|i>Shift<around*|(|\<b-g\>,i|)>>>|<row|<cell|>|<cell|=>|<cell|\<b-g\>\<ast\>\<b-f\>>>|<row|<cell|R<rsub|j>>|<cell|=>|<cell|<big|sum><rsub|i>g<rsub|j-i>f<rsub|i>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#4E8C\>\<#7EF4\>\<#5377\>\<#79EF\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-E\><rsub|00>>|<cell|=>|<cell|<tabular|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>|<row|<cell|R<rsub|i\<nospace\>j>>|<cell|=>|<cell|<big|sum><rsub|u,v>G<rsub|i-u,j-v>F<rsub|u\<nospace\>v>>>|<row|<cell|\<cal-R\>>|<cell|=>|<cell|\<cal-G\>\<ast\>\<ast\>\<cal-H\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#8FDE\>\<#7EED\>\<#5377\>\<#79EF\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|R<around*|(|k\<nospace\>f|)>>|<cell|=>|<cell|k\<nospace\>R<around*|(|f|)>>>|<row|<cell|Shift<around*|(|f,c|)>>|<cell|=>|<cell|f<around*|(|u-c|)>>>|<row|<cell|R<around*|(|Shift<around*|(|f,c|)>|)>>|<cell|=>|<cell|Shift<around*|(|R<around*|(|f|)>,c|)>>>|<row|<cell|box<rsub|\<varepsilon\>><around*|(|x|)>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|0>|<cell|abs<around*|(|x|)>\<gtr\><frac|\<varepsilon\>|2>>>|<row|<cell|1>|<cell|abs<around*|(|x|)>\<less\><frac|\<varepsilon\>|2>>>>>>>>|<row|<cell|R<around*|(|<big|sum><rsub|i>f<rsub|i>Shift<around*|(|box<rsub|\<varepsilon\>>,x<rsub|i>|)>|)>>|<cell|=>|<cell|<big|sum><rsub|i>R<around*|(|f<rsub|i>Shift<around*|(|box<rsub|\<varepsilon\>>,x<rsub|i>|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i>f<rsub|i>R<around*|(|Shift<around*|(|box<rsub|\<varepsilon\>>,x<rsub|i>|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i>f<rsub|i>Shift<around*|(|R<around*|(|<frac|box<rsub|\<varepsilon\>>|\<varepsilon\>>\<varepsilon\>|)>,x<rsub|i>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i>f<rsub|i>Shift<around*|(|R<around*|(|<frac|box<rsub|\<varepsilon\>>|\<varepsilon\>>|)>,x<rsub|i>|)>\<varepsilon\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#8FDE\>\<#7EED\>\<#5377\>\<#79EF\>\<#FF08\>\<#7EED\>\<#FF09\>>

    <math|\<delta\>>\<#51FD\>\<#6570\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|d<rsub|\<varepsilon\>><around*|(|x|)>>|<cell|=>|<cell|<frac|box<rsub|\<varepsilon\>><around*|(|x|)>|\<varepsilon\>>>>|<row|<cell|\<delta\><around*|(|x|)>>|<cell|=>|<cell|lim<rsub|\<varepsilon\>\<rightarrow\>0>d<rsub|\<varepsilon\>><around*|(|x|)>>>>>
    </eqnarray*>

    \<#5377\>\<#79EF\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|R<around*|(|f|)>>|<cell|=>|<cell|<big|int><around*|{|R<around*|(|\<delta\><around*|(|u-x<rprime|'>|)>|)>|}>f<around*|(|x<rprime|'>|)>\<mathd\>x<rprime|'>>>|<row|<cell|>|<cell|=>|<cell|<big|int>g<around*|(|u-x<rprime|'>|)>f<around*|(|x<rprime|'>|)>\<mathd\>x<rprime|'>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|g\<ast\>f|)>>>|<row|<cell|<around*|(|g\<ast\>f|)>>|<cell|=>|<cell|<around*|(|h\<ast\>g|)>>>|<row|<cell|<around*|(|f\<ast\><around*|(|g*\<ast\>h|)>|)>>|<cell|=>|<cell|<around*|(|<around*|(|f\<ast\>g|)>\<ast\>h|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#4E8C\>\<#7EF4\>\<#5377\>\<#79EF\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|d<rsub|\<varepsilon\>><around*|(|x,y|)>>|<cell|=>|<cell|<frac|box<rsub|\<varepsilon\><rsup|2>><around*|(|x,y|)>|\<varepsilon\><rsup|2>>>>|<row|<cell|R<around*|(|h|)>>|<cell|=>|<cell|<big|int><big|int>g<around*|(|x-x<rprime|'>,y-y<rprime|'>|)>h<around*|(|x<rprime|'>,y<rprime|'>|)>\<mathd\>x\<mathd\>y>>|<row|<cell|>|<cell|=>|<cell|<around*|(|g*\<ast\>\<ast\>h|)>>>|<row|<cell|<around*|(|g\<ast\>\<ast\>h|)>>|<cell|=>|<cell|<around*|(|h\<ast\>\<ast\>g|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5085\>\<#91CC\>\<#53F6\>\<#53D8\>\<#6362\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-F\><around*|(|g<around*|(|x,y|)>|)>>|<cell|=>|<cell|<big|int><big|int>g<around*|(|x,y|)>e<rsup|-i2\<pi\><around*|(|u\<nospace\>x+v\<nospace\>y|)>>\<mathd\>x\<mathd\>y>>|<row|<cell|e<rsup|\<minus\>i2\<pi\>(u\<nospace\>x+v\<nospace\>y)>>|<cell|=>|<cell|
      cos(2\<pi\>(u\<nospace\>x + v\<nospace\>y)) +
      i\<nospace\>sin(2\<pi\>(u\<nospace\>x + v\<nospace\>y))>>>>
    </eqnarray*>

    \<#7EBF\>\<#6027\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-F\><around*|(|g+h|)>>|<cell|=>|<cell|\<cal-F\><around*|(|g|)>+\<cal-F\><around*|(|h|)>>>|<row|<cell|\<cal-F\><around*|(|k\<nospace\>g<around*|(|x,y|)>|)>>|<cell|=>|<cell|k\<cal-F\><around*|(|g<around*|(|x,y|)>|)>>>>>
    </eqnarray*>

    \<#53CD\>\<#53D8\>\<#6362\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|g<around*|(|x,y|)>>|<cell|=>|<cell|<big|int><big|int>\<cal-F\><around*|(|g|)>e<rsup|i2\<pi\><around*|(|u\<nospace\>x+v\<nospace\>y|)>>\<mathd\>u\<mathd\>v>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5085\>\<#91CC\>\<#53F6\>\<#57FA\>\<#5B9E\>\<#90E8\>\<#793A\>\<#4F8B\>>

    <image|img/fourier_base.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#5E45\>\<#503C\>\<#4E0E\>\<#76F8\>\<#4F4D\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-F\><around*|(|g<around*|(|x,y|)>|)>>|<cell|=>|<cell|<big|int><big|int>g<around*|(|x,y|)>cos<around*|(|2\<pi\>u\<nospace\>x+v\<nospace\>y|)>\<mathd\>x\<mathd\>y>>|<row|<cell|>|<cell|>|<cell|+i<big|int><big|int>g<around*|(|x,y|)>sin<around*|(|2\<pi\>u\<nospace\>x+v\<nospace\>y|)>\<mathd\>x\<mathd\>y>>|<row|<cell|>|<cell|=>|<cell|\<frak-R\><around*|(|\<cal-F\><around*|(|g|)>|)>+i\<ast\>\<frak-F\><around*|(|\<cal-F\><around*|(|g|)>|)>>>|<row|<cell|>|<cell|=>|<cell|\<cal-F\><rsub|R><around*|(|g|)>+i\<ast\>\<cal-F\><rsub|I><around*|(|g|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5085\>\<#91CC\>\<#53F6\>\<#53D8\>\<#6362\>\<#793A\>\<#4F8B\>>

    <space|3em><image|img/magnitude_phase_swap.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#91C7\>\<#6837\>\<#4E0E\>\<#5931\>\<#771F\>>

    <\folded-std>
      <space|4em><image|img/checkboard_sampling.png|0.6par|||>
    <|folded-std>
      Figure 8.8. The two checkerboards on the top illustrate a sampling
      procedure which appears to be successful (whether it is or not depends
      on some details that we will deal with later). The grey circles
      represent the samples; if there are sufficient samples, then the
      samples represent the detail in the underlying function. The sampling
      procedure shown on the bottom is unequivocally unsuccessful; the
      samples suggest that there are fewer checks than there are. This
      illustrates two important phenomena: firstly, successful sampling
      schemes sample data \Poften enough\Q; and, secondly, unsuccessful
      sampling schemes cause high frequency information to appear as lower
      frequency information.
    </folded-std>
  </hidden>|<\hidden>
    <tit|\<#4E00\>\<#7EF4\>\<#91C7\>\<#6837\>>

    <image|img/sample1D.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#4E8C\>\<#7EF4\>\<#91C7\>\<#6837\>>

    <space|5em><image|img/sample2D.png|0.6par|||>
  </hidden>|<\hidden>
    <tit|\<#91C7\>\<#6837\>\<#4FE1\>\<#53F7\>\<#6A21\>\<#578B\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>a\<delta\><around*|(|x|)>f<around*|(|x|)>\<mathd\>x>|<cell|=>|<cell|a\<nospace\>lim<rsub|\<varepsilon\>\<rightarrow\>0><big|int><rsub|-\<infty\>><rsup|+\<infty\>>d<rsub|\<varepsilon\>><around*|(|x|)>f<around*|(|x|)>\<mathd\>x>>|<row|<cell|>|<cell|=>|<cell|a\<nospace\>lim<rsub|\<varepsilon\>\<rightarrow\>0><big|int><rsub|-\<infty\>><rsup|+\<infty\>><frac|bar<rsub|\<varepsilon\>><around*|(|x|)>|\<varepsilon\>>f<around*|(|x|)>\<mathd\>x>>|<row|<cell|>|<cell|=>|<cell|a\<nospace\>lim<rsub|\<varepsilon\>\<rightarrow\>0><big|sum><rsub|i=-\<infty\>><rsup|+\<infty\>><frac|bar<rsub|\<varepsilon\>><around*|(|x|)>|\<varepsilon\>>f<around*|(|i\<varepsilon\>|)>bar<rsub|\<varepsilon\>><around*|(|x-i\<varepsilon\>|)>\<varepsilon\>>>|<row|<cell|>|<cell|=>|<cell|a\<nospace\>f<around*|(|0|)>>>|<row|<cell|sample<rsub|2D><around*|(|f|)>>|<cell|=>|<cell|<big|sum><rsub|i=-\<infty\>><rsup|\<infty\>><big|sum><rsub|j=-\<infty\>><rsup|\<infty\>>f<around*|(|i,j|)>\<delta\><around*|(|x-i,y-j|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i=-\<infty\>><rsup|\<infty\>><big|sum><rsub|j=-\<infty\>><rsup|\<infty\>>f<around*|(|x,y|)>\<delta\><around*|(|x-i,y-j|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-F\><around*|(|sample<rsub|2D><around*|(|f<around*|(|x,y|)>|)>|)>>|<cell|=>|<cell|\<cal-F\><around*|(|f<around*|(|x,y|)><big|sum><rsub|i=-\<infty\>><rsup|\<infty\>><big|sum><rsub|j=-\<infty\>><rsup|\<infty\>>\<delta\><around*|(|x-i,y-j|)>|)>>>|<row|<cell|>|<cell|=>|<cell|\<cal-F\><around*|(|f<around*|(|x,y|)>|)>\<ast\>\<ast\>\<cal-F\><around*|(|<big|sum><rsub|i=-\<infty\>><rsup|\<infty\>><big|sum><rsub|j=-\<infty\>><rsup|\<infty\>>\<delta\><around*|(|x-i,y-j|)>|)>>>|<row|<cell|>|<cell|=>|<cell|F<around*|(|u,v|)>\<ast\>\<ast\><big|sum><rsub|i=-\<infty\>><rsup|\<infty\>><big|sum><rsub|j=-\<infty\>><rsup|\<infty\>>\<delta\><around*|(|x-i,y-j|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i=-\<infty\>><rsup|\<infty\>><big|sum><rsub|j=-\<infty\>><rsup|\<infty\>>F<around*|(|u-i,v-j|)>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|\<#91C7\>\<#6837\>\<#4FE1\>\<#53F7\>\<#5085\>\<#91CC\>\<#53F6\>\<#53D8\>\<#6362\>>

    <space|5em><image|img/sample_fourier1.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|\<#9891\>\<#57DF\>\<#6DF7\>\<#53E0\>>

    <space|6em><image|img/sample_fourier_mix.png|0.6par|||>
  </hidden>|<\hidden>
    <tit|\<#5E73\>\<#91C7\>\<#4E0E\>\<#91CD\>\<#91C7\>\<#6837\>>

    <\folded-std>
      <image|img/smooth_resample_0.png|1par|||>
    <|folded-std>
      Figure 8.13. The top row shows sampled versions of an image of a grid
      obtained by multiplying two sinusoids with linearly increasing
      frequency \V one in x and one in y. The other images in the series are
      obtained by resampling by factors of two, without smoothing (i.e. the
      next is a 128x128, then a 64x64, etc., all scaled to the same size).
      Note the substantial aliasing; high spatial frequencies alias down to
      low spatial frequencies, and the smallest image is an extremely poor
      representation of the large image. The bottom row shows the magnitude
      of the Fourier transform of each image \V displayed as a log, to
      compress the intensity scale. The constant component is at the center.
      Notice that the Fourier transform of a resampled image is obtained by
      scaling the Fourier transform of the original image and then tiling the
      plane. Interference between copies of the original Fourier transform
      means that we cannot recover its value at some points \V this is the
      mechanism underlying aliasing.

      \;
    </folded-std>
  </hidden>|<\hidden>
    <tit|\<#5E73\>\<#6ED1\>\<#4E0E\>\<#91CD\>\<#91C7\>\<#6837\>(\<#9AD8\>\<#65AF\>\<#5E73\>\<#6ED1\>)>

    <space|3em><image|img/smooth_resample_1.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#5E73\>\<#6ED1\>\<#4E0E\>\<#91CD\>\<#91C7\>\<#6837\>(\<#9AD8\>\<#65AF\>\<#5E73\>\<#6ED1\>)>

    <space|2em><image|img/smooth_resample_2.png|0.8par|||>
  </hidden>|<\shown>
    <tit|\<#9AD8\>\<#65AF\>\<#91D1\>\<#5B57\>\<#5854\>>

    <space|7em><image|img/gaussian_pyramid.png|0.5par|||>
  </shown>|<\hidden>
    <tit|\<#5C3A\>\<#5EA6\>\<#7A7A\>\<#95F4\>>

    <space|5em><image|img/scale_space.png|0.6par|||>
  </hidden>|<\hidden>
    <tit|Zero-crossing>

    <space|5em><image|img/zero_crossing.png|0.6par|||>
  </hidden>|<\hidden>
    <tit|2D>

    <image|img/scale_space_2D.png|1par|||>
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
    <associate|preamble|false>
  </collection>
</initial>