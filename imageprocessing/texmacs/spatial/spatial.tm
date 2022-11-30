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
    <tit|\<#7070\>\<#5EA6\>\<#53D8\>\<#6362\>\<#4E0E\>\<#7A7A\>\<#95F4\>\<#57DF\>\<#6EE4\>\<#6CE2\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|g<around*|(|x,y|)>>|<cell|=>|<cell|T<around*|[|f|]>>>>>
    </eqnarray*>

    \<#5176\>\<#4E2D\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|g,f>|<cell|:>|<cell|<around*|(|R,R|)>\<mapsto\>R>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#7070\>\<#5EA6\>\<#53D8\>\<#6362\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|s>|<cell|=>|<cell|T<around*|(|r|)>>>>>
    </eqnarray*>

    \<#5176\>\<#4E2D\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|s>|<cell|=>|<cell|g<around*|(|x,y|)>>>|<row|<cell|r>|<cell|=>|<cell|f<around*|(|x,y|)>>>|<row|<cell|g<around*|(|x,y|)>>|<cell|=>|<cell|T<around*|(|f<around*|(|x,y|)>|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#793A\>\<#4F8B\>1>

    \;

    \;

    <image|img/intensity_transformation.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#793A\>\<#4F8B\>2>

    <image|img/some_basic_intensity_transformation_functions.png|1par|||>
  </hidden>|<\hidden>
    <tit|<math|s=L-1-r>>

    <image|img/digital_mammogram_negative.png|1par|||>
  </hidden>|<\hidden>
    <tit|<math|s=ln<around*|(|1+r|)>>>

    <image|img/log_fourier.png|1par|||>
  </hidden>|<\hidden>
    <\tit>
      <\math>
        s =c\<nospace\>r<rsup|\<gamma\>>
      </math>
    </tit>

    <image|img/gamma_equation.png|1par|||>
  </hidden>|<\hidden>
    <image|img/intensity_ramp_gamma_correction.png|1par|||>
  </hidden>|<\hidden>
    <space|3em><image|img/gamma_mri.png|0.8par|||>
  </hidden>|<\hidden>
    <space|2em><image|img/gamma_aerial.png|0.9par|||>
  </hidden>|<\hidden>
    <space|1em><image|img/contrast_stretching.png|0.9par|||>
  </hidden>|<\hidden>
    <tit|\<#4EAE\>\<#5EA6\>\<#5206\>\<#5C42\>>

    \;

    \;

    <image|img/highlights_range_a_b.png|1par|||>

    \;
  </hidden>|<\hidden>
    \;

    <image|img/aortic_angiogram_highlight_range.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#4F4D\>\<#5E73\>\<#9762\>\<#5206\>\<#5C42\>>

    <image|img/8_bit_planes.png|1par|||>
  </hidden>|<\hidden>
    \;

    <image|img/8_bit_gray_image_bit_planes.png|1par|||>

    \;
  </hidden>|<\hidden>
    \;

    \;

    \;

    <image|img/bit_planes_reconstruct.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#76F4\>\<#65B9\>\<#56FE\>>

    <image|img/histogram.png|1par|||><label|4_image_histograms>
  </hidden>|<\hidden>
    <tit|\<#76F4\>\<#65B9\>\<#56FE\>\<#5747\>\<#8861\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|s>|<cell|=>|<cell|g<around*|(|r|)>>>|<row|<cell|p<around*|(|s|)>\<mathd\>s>|<cell|=>|<cell|p<around*|(|r|)>\<mathd\>r>>|<row|<cell|<frac|1|L>\<mathd\>s>|<cell|=>|<cell|p<around*|(|r|)>\<mathd\>r>>|<row|<cell|<frac|\<mathd\>s|\<mathd\>r>>|<cell|=>|<cell|L\<nospace\>p<around*|(|r|)>>>|<row|<cell|s>|<cell|=>|<cell|L<big|int><rsub|0><rsup|r>p<around*|(|x|)>\<mathd\>x>>>>
    </eqnarray*>

    <\math>
      <label|histogram-equalization>
    </math>
  </hidden>|<\hidden>
    <tit|\<#5355\>\<#589E\>\<#51FD\>\<#6570\>>

    <image|img/monotonic_increasing_function.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6982\>\<#7387\>\<#5206\>\<#5E03\>\<#53D8\>\<#6362\>>

    <image|img/PDF_to_uniform.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#76F4\>\<#65B9\>\<#56FE\>\<#53D8\>\<#6362\>\<#793A\>\<#4F8B\>>

    \;

    \;

    <image|img/histogram_equalization_3_bit_image.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#76F4\>\<#65B9\>\<#56FE\>\<#53D8\>\<#6362\>\<#793A\>\<#4F8B\>\<#FF08\>\<#7EED\>\<#FF09\>>

    \;

    \;

    \;

    <image|img/histogram_equalization.png|1par|||>
  </hidden>|<\hidden>
    <space|5em><image|img/image_histogram_equalization.png|0.6par|||><hlink|^.<rsup|>^|#4_image_histograms>
  </hidden>|<\hidden>
    \;

    \;

    <image|img/image_histogram_equalization_transformation_function.png|1par|||>

    <hlink|^.<rsup|>^|#4_image_histograms>
  </hidden>|<\hidden>
    <tit|\<#76F4\>\<#65B9\>\<#56FE\>\<#5339\>\<#914D\>\<#FF08\>\<#89C4\>\<#5B9A\>\<#5316\>\<#FF09\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|z>|<cell|=>|<cell|g<around*|(|s|)>>>|<row|<cell|s>|<cell|=>|<cell|g<rsup|-1><around*|(|z|)>>>|<row|<cell|p<around*|(|z|)>\<mathd\>z>|<cell|=>|<cell|p<around*|(|s|)>\<mathd\>s>>|<row|<cell|p<around*|(|z|)>\<mathd\>z>|<cell|=>|<cell|<frac|1|L>\<mathd\>s>>|<row|<cell|<frac|\<mathd\>s|\<mathd\>z>>|<cell|=>|<cell|L\<nospace\>p<around*|(|z|)>>>|<row|<cell|s>|<cell|=>|<cell|L<big|int><rsub|0><rsup|z>p<around*|(|x|)>\<mathd\>x>>>>
    </eqnarray*>

    <hlink|^.^|#histogram-equalization>
  </hidden>|<\hidden>
    \;

    \;

    <image|img/histogram_specification_3_bit_image.png|1par|||>
  </hidden>|<\hidden>
    \;

    \;

    <\folded-std>
      <image|img/histogram_specification_result.png|1par|||>
    <|folded-std>
      <image|img/histogram_specification_rounded_transformation_function.png|1par|||>

      <image|img/histogram_specification_mapping_sk_zq.png|1par|||>
    </folded-std>

    \;
  </hidden>|<\hidden>
    <tit|\<#76F4\>\<#65B9\>\<#56FE\>\<#89C4\>\<#5B9A\>\<#5316\>\<#793A\>\<#4F8B\>>

    \;

    \;

    <image|img/histogram_specification_an_image_and_its_histogram.png|1par|||>

    \;
  </hidden>|<\hidden>
    <tit|\<#76F4\>\<#65B9\>\<#56FE\>\<#89C4\>\<#5B9A\>\<#5316\>\<#793A\>\<#4F8B\>\<#FF08\>\<#7EED\>)>

    <image|img/histogram_specification_an_image__histogram_equalization.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#76F4\>\<#65B9\>\<#56FE\>\<#89C4\>\<#5B9A\>\<#5316\>\<#FF08\>\<#7EED\>\<#FF09\>>

    <space|5em><image|img/histogram_specification_an_image__histogram_specification.png|0.6par|||>
  </hidden>|<\hidden>
    <tit|\<#5C40\>\<#90E8\>\<#76F4\>\<#65B9\>\<#56FE\>\<#5747\>\<#8861\>>

    \;

    \;

    <image|img/local_histogram_equalization.png|1par|||>
  </hidden>|<\shown>
    <tit|\<#76F4\>\<#65B9\>\<#56FE\>\<#7EDF\>\<#8BA1\>\<#56FE\>\<#50CF\>\<#589E\>\<#5F3A\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|g<around*|(|x,y|)>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|C\<nospace\>f<around*|(|x,y|)>>>|<row|<cell|f<around*|(|x,y|)>>>>>><space|2em><tabular|<tformat|<table|<row|<cell|k<rsub|0>m<rsub|G>\<leqslant\>m<rsub|S<rsub|x\<nospace\>y>>\<leqslant\>k<rsub|1>m<rsub|G>,k<rsub|2>\<sigma\><rsub|G>\<leqslant\>\<sigma\><rsub|S<rsub|x\<nospace\>y>>\<leqslant\>k<rsub|3>\<sigma\><rsub|G>>>|<row|<cell|<text|otherwise>>>>>>>>>>
    </eqnarray*>

    <image|img/local_histogram_statistics_enhancement.png|1par|||>
  </shown>|<\hidden>
    <tit|\<#90BB\>\<#57DF\>>

    <image|img/3_3_neighborhood.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#7A7A\>\<#95F4\>\<#76F8\>\<#5173\>\<#4E0E\>\<#5377\>\<#79EF\>>

    <space|4em><image|img/3_3_linear_filtering.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|\<#76F8\>\<#5173\>\<#4E0E\>\<#5377\>\<#79EF\>>

    <space|4em><image|img/1_D_correlation_convolution.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|2-D\<#76F8\>\<#5173\>\<#4E0E\>\<#5377\>\<#79EF\>>

    <space|2em><image|img/2_D_correlation_convolution.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|\<#5E73\>\<#6ED1\>\<#6838\>\<#793A\>\<#4F8B\>>

    \;

    \;

    <image|img/example_smoothing_kernel.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#7A7A\>\<#95F4\>\<#57DF\>\<#4E0E\>\<#9891\>\<#57DF\>\<#4F4E\>\<#901A\>\<#6EE4\>\<#6CE2\>>

    \;

    \;

    <image|img/ideal_1_D_low_pass_filter_frequency_domain_spatial_domain.png|1par|||>
  </hidden>|<\hidden>
    <tit|Box kernel>

    <space|1em><image|img/box_filtering.png|0.9par|||>
  </hidden>|<\hidden>
    <tit|\<#8DDD\>\<#79BB\>>

    <image|img/distance.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#9AD8\>\<#65AF\>\<#6838\>>

    \;

    \;

    <image|img/gaussian_kernel.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#9AD8\>\<#65AF\>\<#6838\>\<#6EE4\>\<#6CE2\>>

    <image|img/gaussian_kernel_filter.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#4E0D\>\<#540C\>\<#5C3A\>\<#5EA6\>\<#9AD8\>\<#65AF\>\<#6EE4\>\<#6CE2\>>

    \;

    <image|img/gaussian_kernel_filter_sigma_difference.png|1par|||>

    \;
  </hidden>|<\hidden>
    <tit|\<#5E73\>\<#6ED1\>\<#6548\>\<#679C\>\<#6BD4\>\<#8F83\>>

    <image|img/smoothing_box_gaussian_compare.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#56FE\>\<#50CF\>\<#5927\>\<#5C0F\>\<#7684\>\<#5F71\>\<#54CD\>>

    \;

    <image|img/4096_gaussian_kernel.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#4F4E\>\<#901A\>\<#9608\>\<#503C\>\<#533A\>\<#57DF\>\<#63D0\>\<#53D6\>>

    \;

    \;

    <image|img/lowpass_threshold_region_extraction.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6E10\>\<#6655\>\<#6821\>\<#6B63\>>

    \;

    <image|img/shading_correction.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6B21\>\<#5E8F\>\<#7EDF\>\<#8BA1\>\<#6EE4\>\<#6CE2\>>

    \;

    \;

    <image|img/x_ray_image_mean_median.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#4E00\>\<#9636\>\<#4E0E\>\<#4E8C\>\<#9636\>\<#5BFC\>\<#6570\>>

    <space|1em><image|img/1_2_derivative.png|0.9par|||>
  </hidden>|<\hidden>
    <tit|Laplacian kernel>

    \;

    <image|img/laplacian_kernel.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#56FE\>\<#50CF\>\<#9510\>\<#5316\>\<#793A\>\<#4F8B\>>

    <space|4em><image|img/sharpening_laplacian.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|\<#56FE\>\<#50CF\>\<#9510\>\<#5316\>\<#793A\>\<#4F8B\>\<#FF08\>\<#7EED\>\<#FF09\>>

    <image|img/sharping_laplacian_image.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#53CD\>\<#9510\>\<#5316\>\<#63A9\>\<#6A21\>>

    <space|1em><image|img/unsharp_mask.png|0.9par|||>
  </hidden>|<\hidden>
    <tit|\<#9510\>\<#5316\>\<#793A\>\<#4F8B\>>

    \;

    <image|img/unsharp_masking_highboost_filtering.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#68AF\>\<#5EA6\>>

    <space|1em><image|img/roberts_sobel.png|0.9par|||>
  </hidden>|<\hidden>
    <tit|\<#8FB9\>\<#7F18\>\<#589E\>\<#5F3A\>>

    \;

    <image|img/sobel_gradient.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#9AD8\>\<#901A\>\<#3001\>\<#5E26\>\<#901A\>\<#6EE4\>\<#6CE2\>\<#5668\>>

    \;

    <image|img/lowpass_highpass_bandreject_bandpass.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#793A\>\<#4F8B\>\<#56FE\>\<#50CF\>>

    <image|img/zone_plate_image.png|1par|||>
  </hidden>|<\hidden>
    <tit|1\<#7EF4\>\<#4E0E\>2\<#7EF4\>\<#6EE4\>\<#6CE2\>\<#5668\>>

    \;

    <image|img/1D_2D_gaussian_filter.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#4E0D\>\<#540C\>\<#6EE4\>\<#6CE2\>\<#6548\>\<#679C\>>

    \;

    <image|img/separable_isotropic_filter.png|1par|||>
  </hidden>|<\hidden>
    <space|1em><image|img/zone_plate_lowpass_highpass_band.png|0.9par|||>
  </hidden>|<\hidden>
    <tit|\<#7A7A\>\<#95F4\>\<#57DF\>\<#56FE\>\<#50CF\>\<#589E\>\<#5F3A\>>

    <space|6em><image|img/spatial_enhancement1.png|0.5par|||>
  </hidden>|<\hidden>
    <tit|\<#7A7A\>\<#95F4\>\<#57DF\>\<#56FE\>\<#50CF\>\<#589E\>\<#5F3A\>>

    <space|6em><image|img/spatial_enhancement2.png|0.5par|||>
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

<\references>
  <\collection>
    <associate|4_image_histograms|<tuple|?|?>>
    <associate|histogram-equalization|<tuple|?|?>>
  </collection>
</references>