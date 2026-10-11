<TeXmacs|2.1>

<style|<tuple|beamer|manila-paper>>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <doc-data|<doc-title|Linear Models for Regression>>
  </hidden>|<\hidden>
    <unroll-greyed|<\shown>
      <with|gr-mode|<tuple|group-edit|animate>|gr-frame|<tuple|scale|1cm|<tuple|0.5gw|0.5gh>>|gr-geometry|<tuple|geometry|1par|3em|center>|gr-grid|<tuple|cartesian|<point|0|0>|0.2>|gr-grid-old|<tuple|cartesian|<point|0|0>|0.2>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|2|none>>|gr-edit-grid|<tuple|cartesian|<point|0|0>|0.2>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|0.2>|gr-grid-aspect|<tuple|<tuple|axes|#e0e0ff>|<tuple|1|#e0e0ff>|<tuple|2|#e0e0ff>>|gr-grid-aspect-props|<tuple|<tuple|axes|#e0e0ff>|<tuple|1|#e0e0ff>|<tuple|2|#e0e0ff>>|gr-color|blue|gr-arrow-end|\<gtr\>|<graphics||<point|-4.2|-0.1>|<point|-3.4|0.2>|<point|-2.5|0.4>|<point|-1|0>|<point|-0.2|-0.2>|<point|1.4|0.2>|<point|0.6|0>|<point|-4.2|-0.1>|<anim-static|<morph|<tuple|0|<with|line-portion|0|<spline|<point|-4.4|-0.2>|<point|-4.2|-0.1>|<point|-3.4|0.2>|<point|-2.5|0.4>|<point|-1.0|0.0>|<point|-0.2|-0.2>|<point|0.6|0.0>|<point|1.4|0.2>|<point|1.8|0.3>>>>|<tuple|1|<with|line-portion|1|<spline|<point|-4.4|-0.2>|<point|-4.2|-0.1>|<point|-3.4|0.2>|<point|-2.5|0.4>|<point|-1.0|0.0>|<point|-0.2|-0.2>|<point|0.6|0.0>|<point|1.4|0.2>|<point|1.8|0.3>>>>>|1s|0.1s|0s>|<with|color|magenta|<point|-3.9|0.145964>>|<with|color|magenta|<point|-3|0.3>>|<with|color|magenta|<point|-2|0.4>>|<with|color|magenta|<point|-1.4|0.2>>|<with|color|magenta|<point|-0.6|-0.1>>|<with|color|magenta|<point|0.3|-0.2>>|<with|color|magenta|<point|1|0.2>>|<anim-static|<morph|<tuple|0|<with|color|blue|arrow-end|\<gtr\>|line-portion|0|<line|<point|-4.6|-0.5>|<point|-4.6|0.5>>>>|<tuple|1|<with|color|blue|arrow-end|\<gtr\>|line-portion|1|<line|<point|-4.6|-0.5>|<point|-4.6|0.5>>>>>|1s|0.1s|0s>|<anim-static|<morph|<tuple|0|<with|color|brown|line-portion|0|<line|<point|-4.2|-0.2>|<point|2.0|0.4>>>>|<tuple|1|<with|color|brown|line-portion|1|<line|<point|-4.2|-0.2>|<point|2.0|0.4>>>>>|1s|0.1s|0s>|<anim-static|<morph|<tuple|0|<with|color|blue|arrow-end|\<gtr\>|line-portion|0|<line|<point|-4.7|-0.4>|<point|2.2|-0.4>>>>|<tuple|1|<with|color|blue|arrow-end|\<gtr\>|line-portion|1|<line|<point|-4.7|-0.4>|<point|2.2|-0.4>>>>>|1s|0.1s|0s>>>
    </shown>|<\shown>
      The goal of regression is to predict the value of one or more
      continuous target variables <math|t> given the value of a D-dimensional
      vector <math|\<b-x\>> of input variables.
    </shown>|<\shown>
      We have already encountered an example of a regression problem about
      polynomial curve fitting.
    </shown>|<\shown>
      The polynomial is a specific example of a broad class of functions
      called <em|linear models>, which share the property of being linear
      functions of the adjustable parameters.
    </shown>|<\shown>
      The simplest form of linear models are also linear functions of the
      input variables.
    </shown>|<\shown>
      However, we can obtain a much more useful class of functions by taking
      linear combinations of a fixed set of nonlinear functions of the input
      variables, known as basis functions.
    </shown>|<\shown>
      Such models are linear functions of the parameters, which gives them
      simple analytical properties, and yet can be nonlinear with respect to
      the input variables.
    </shown>>
  </hidden>|<\hidden>
    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      Given a training data set comprising <math|N> observations
      <math|{x<rsub|n>}>, where <math|n = 1, . . . , N> , together with
      corresponding target values <math|{t<rsub|n>}>, the goal is to predict
      the value of <math|t> for a new value of <math|x>.
    </shown>|<\shown>
      In the simplest approach, this can be done by directly constructing an
      appropriate function <math|y(x)> whose values for new inputs <math|x>
      constitute the predictions for the corresponding values of <math|t>.
    </shown>|<\shown>
      More generally, from a probabilistic perspective, we aim to model the
      predictive distribution <math|p(t\|x)> because this expresses our
      uncertainty about the value of <math|t> for each value of <math|x>.
    </shown>|<\shown>
      From this conditional distribution we can make predictions of <math|t>,
      for any new value of <math|x>, in such a way as to minimize the
      expected value of a suitably chosen loss function.
    </shown>|<\shown>
      As discussed in Section 1.5.5, a common choice of loss function for
      real-valued variables is the squared loss, for which the optimal
      solution is given by the conditional expectation of <math|t>.
    </shown>|<\shown>
      Although linear models have significant limitations as practical
      techniques for pattern recognition, particularly for problems involving
      input spaces of high dimensionality, they have nice analytical
      properties and form the foundation for more sophisticated models to be
      discussed in later chapters.
    </shown>>
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|Linear Basis Function Models>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Linear Regression>

    The simplest linear model for regression is one that involves a linear
    combination of the input variables\ 

    <\equation*>
      \ y(\<b-x\>,\<b-w\>) = w<rsub|0> + w<rsub|1>x<rsub|1> + . . . +
      w<rsub|D>x<rsub|D>
    </equation*>

    \ \ where\ 

    <\equation*>
      \<b-x\>= (x<rsub|1>, . . . , x<rsub|D>)<rsup|T>
    </equation*>

    This is often simply known as <em|linear regression>.

    The key property of this model is that it is a linear function of the
    parameters <math|w<rsub|0>, . . . , w<rsub|D>>.

    It is also, however, a linear function of the input variables
    <math|x<rsub|i>>, and this imposes significant limitations on the model.
  </hidden>|<\hidden>
    <tit|Linear model>

    Extend the class of models by considering linear combinations of fixed
    nonlinear functions of the input variables, of the form \ 

    <\equation*>
      y(\<b-x\>,\<b-w\>) = w<rsub|0> + <big|sum><rsub|j=1><rsup|M-1>w<rsub|j>\<varphi\><rsub|j>(x)
    </equation*>

    \ \ where <math|\<varphi\><rsub|j>(x)> are known as <em|basis functions>.

    By denoting the maximum value of the index j by <math|M \<minus\> 1>, the
    total number of parameters in this model will be <math|M>.

    The parameter <math|w<rsub|0>> allows for any fixed offset in the data
    and is sometimes called a <em|bias parameter> (not to be confused with
    `bias' in a statistical sense).
  </hidden>|<\hidden>
    It is often convenient to define an additional dummy `basis function'

    <\equation*>
      \<varphi\><rsub|0>(x) = 1
    </equation*>

    so that

    <\equation*>
      y(x, w) = \ <big|sum><rsub|j=0><rsup|M-1>w<rsub|j>\<varphi\><rsub|j>(x)
      =\<b-w\><rsup|T>\<b-varphi\>(\<b-x\>)\ 
    </equation*>

    where

    <\equation*>
      \<b-w\>=(w<rsub|0>, . . . , w<rsub|M\<minus\>1>)<rsup|T>
    </equation*>

    and

    <\equation*>
      \<b-varphi\>= (\<varphi\><rsub|0>, . . . ,
      \<varphi\><rsub|M\<minus\>1>)<rsup|T>.
    </equation*>
  </hidden>|<\hidden>
    <tit|Example>

    The example of polynomial regression considered in Chapter 1 is a
    particular example of this model in which there is a single input
    variable <math|x>, and the basis functions take the form of powers of
    <math|x> so that\ 

    <\equation*>
      \<varphi\><rsub|j>(x) = x<rsub|j>.
    </equation*>

    One limitation of polynomial basis functions is that they are global
    functions of the input variable, so that changes in one region of input
    space affect all other regions.

    This can be resolved by dividing the input space up into regions and fit
    a different polynomial in each region, leading to <em|spline functions>
    (Hastie et al., 2001).
  </hidden>|<\hidden>
    <tit|Basis functions>

    There are many other possible choices for the basis functions, for
    example\ 

    <\equation>
      \ \<varphi\><rsub|j>(x) = exp<around*|{|-<frac| (x \<minus\>
      \<mu\><rsub|j>)<rsup|2> \ |2s<rsup|2>>|}><label|3.4>
    </equation>

    where the <math|\<mu\><rsub|j>> govern the locations of the basis
    functions in input space, and the parameter <math|s> governs their
    spatial scale.

    These are usually referred to as <em|`Gaussian' basis functions>,
    although it should be noted that they are not required to have a
    probabilistic interpretation, and in particular the normalization
    coefficient is unimportant because these basis functions will be
    multiplied by adaptive parameters <math|w<rsub|j>>.
  </hidden>|<\hidden>
    Another possibility is the sigmoidal basis function of the form \ 

    <\equation>
      \<varphi\><rsub|j>(x) = \<sigma\><around*|(|<frac|x-\<mu\><rsub|j>|s>|)><label|3.5>
    </equation>

    where <math|\<sigma\>(a)> is the logistic sigmoid function defined by \ 

    <\equation*>
      \<sigma\>(a) = <frac|1|1+e<rsup|-a>>
    </equation*>

    Equivalently, we can use the `tanh' function because this is related to
    the logistic sigmoid by\ 

    <\equation*>
      tanh(a) = 2\<sigma\>(a) \<minus\> 1
    </equation*>

    and so a general linear combination of logistic sigmoid functions is
    equivalent to a general linear combination of `tanh' functions.

    These various choices of basis function are illustrated in Figure
    <reference|fig3.1>.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_3_1_basis_functions.png|.9par|||>|<label|fig3.1>Examples
      of basis functions, showing polynomials on the left, Gaussians of the
      form <eqref|3.4> in the centre, and sigmoidal of the form <eqref|3.5>
      on the right.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Fourier basis>

    Yet another possible choice of basis function is the Fourier basis, which
    leads to an expansion in sinusoidal functions.

    Each basis function represents a specific frequency and has infinite
    spatial extent.

    By contrast, basis functions that are localized to finite regions of
    input space necessarily comprise a spectrum of different spatial
    frequencies.

    <\padded-center>
      <image|image/sin_x.svg|.3par|||>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Wavelet>

    In many signal processing applications, it is of interest to consider
    basis functions that are localized in both space and frequency, leading
    to a class of functions known as wavelets.

    These are also defined to be mutually orthogonal, to simplify their
    application.

    Wavelets are most applicable when the input values live on a regular
    lattice, such as the successive time points in a temporal sequence, or
    the pixels in an image.

    Useful texts on wavelets include Ogden (1997), Mallat (1999), and
    Vidakovic (1999).

    <\padded-center>
      <image|image/wavelet.svg|.28par|||>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Notes>

    Most of the discussion in this chapter, however, is independent of the
    particular choice of basis function set, and so for most of our
    discussion we shall not specify the particular form of the basis
    functions, except for the purposes of numerical illustration.

    Indeed, much of our discussion will be equally applicable to the
    situation in which the vector <math|\<b-varphi\>(\<b-x\>)> of basis
    functions is simply the identity <math|\<b-varphi\>(\<b-x\>) =\<b-x\>>.

    Furthermore, in order to keep the notation simple, we shall focus on the
    case of a single target variable <math|t>.

    However, in Section 3.1.5, we consider briefly the modifications needed
    to deal with multiple target variables.
  </hidden>|<\hidden>
    <tit|Target distribution>

    Assume that the target variable <math|t> is given by a deterministic
    function<math| y(x, w)> with additive Gaussian noise so that \ 

    <\equation*>
      t = y(x, w) +\<varepsilon\>
    </equation*>

    where <math|\<varepsilon\>> is a zero mean Gaussian random variable with
    precision (inverse variance) <math|\<beta\>>.\ 

    hus we can write \ 

    <\equation>
      p(t\|x, w, \<beta\>) = \<cal-N\> (t\|y(x, w),
      \<beta\><rsup|\<minus\>1>).<label|3.8>
    </equation>
  </hidden>|<\hidden>
    <tit|Conditional mean>

    If we assume a squared loss function, then the optimal prediction, for a
    new value of <math|x>, will be given by the conditional mean of the
    target variable.

    In the \ case of a Gaussian conditional distribution of the form
    <eqref|3.8>, the conditional mean will be simply\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell| \<bbb-E\>[t\|x] >|<cell|=>|<cell| <big|int>
      t p(t\|x)\<mathd\>t >>|<row|<cell|>|<cell|=>|<cell| y(x, w)>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Likelihood function>

    Consider a data set of inputs<math| X = {x<rsub|1>, . . . , x<rsub|N> }>
    with corresponding target values <math|t<rsub|1>,\<cdots\>,t<rsub|N>>.

    Group the target variables <math|{t<rsub|n>}> into a column vector
    denoted by <math|\<b-t\>>.

    Making the assumption that these data points are drawn independently from
    the distribution <eqref|3.8>, we obtain the following expression for the
    likelihood function, which is a function of the adjustable parameters
    <math|\<b-w\>> and <math|\<beta\>>, in the form \ 

    <\equation*>
      p(\<b-t\>\|X, \<b-w\>, \<beta\>) = \ <big|prod><rsub|n=1><rsup|N>\<cal-N\>(t<rsub|n>\|\<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>),
      \<beta\><rsup|\<minus\>1>)\ 
    </equation*>
  </hidden>|<\shown>
    <tit|Log likelihood>

    Taking the logarithm of the likelihood function, and making use of the
    standard form (1.46) for the univariate Gaussian, we have\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell| ln p(t\|X,\<b-w\>,
      \<beta\>)>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>ln\<cal-N\>
      (t<rsub|n>\|\<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>),
      \<beta\><rsup|\<minus\>1>) >>|<row|<cell|>|<cell|=>|<cell|<frac|N|2> ln
      \<beta\> \<minus\> <frac|N|2> ln(2\<pi\>) \<minus\>
      \<beta\>E<rsub|D>(\<b-w\>) \ >>>>
    </eqnarray*>

    where the <em|sum-of-squares error> function is defined by \ 

    <\equation*>
      E<rsub|D>(w) =<frac|1|2><big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n>
      \<minus\> \<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>)|}><rsup|2>
    </equation*>
  </shown>>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|16:9>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|3.4|<tuple|1|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|3.5|<tuple|2|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|3.8|<tuple|3|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-1|<tuple|1|1|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-2|<tuple|1|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|fig3.1|<tuple|1|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||Examples of basis
      functions, showing polynomials on the left, Gaussians of the form
      (<reference|3.4>) in the centre, and sigmoidal of the form
      (<reference|3.5>) on the right.>|<pageref|auto-2>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Linear
      Basis Function Models> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>