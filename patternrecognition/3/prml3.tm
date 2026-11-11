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

    <\equation>
      y(x, w) = \ <big|sum><rsub|j=0><rsup|M-1>w<rsub|j>\<varphi\><rsub|j>(x)
      =\<b-varphi\>(\<b-x\>)<rsup|T>\<b-w\><label|3.3>
    </equation>

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

    This can be resolved by dividing the input space up into regions and
    fitting a different polynomial in each region, leading to <em|spline
    functions> (Hastie et al., 2001).
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
      tanh(a) = 2\<sigma\>(2a) \<minus\> 1
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

    <\equation>
      p(\<b-t\>\|X, \<b-w\>, \<beta\>) = \ <big|prod><rsub|n=1><rsup|N>\<cal-N\>(t<rsub|n>\|\<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>),
      \<beta\><rsup|\<minus\>1>) <label|3.10>
    </equation>
  </hidden>|<\hidden>
    <tit|Log likelihood>

    Taking the logarithm of the likelihood function, and making use of the
    standard form (1.46) for the univariate Gaussian, we have\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell| ln p(t\|X,\<b-w\>,
      \<beta\>)>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>ln\<cal-N\>
      (t<rsub|n>\|\<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>),
      \<beta\><rsup|\<minus\>1>) >>|<row|<cell|>|<cell|=>|<cell|<frac|N|2> ln
      \<beta\> \<minus\> <frac|N|2> ln(2\<pi\>) \<minus\>
      \<beta\>E<rsub|D>(\<b-w\>) \ <eq-number><label|3.11>>>>>
    </eqnarray*>

    where the <em|sum-of-squares error> function is defined by \ 

    <\equation>
      E<rsub|D>(w) =<frac|1|2><big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n>
      \<minus\> \<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>)|}><rsup|2><label|3.12>
    </equation>
  </hidden>|<\hidden>
    <\eqnarray*>
      <tformat|<table|<row|<cell|E<rsub|D>(w)>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n>
      \<minus\> \<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>)|}><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|\<b-t\>-\<Phi\>\<b-w\>|)><rsup|T><around*|(|\<b-t\>-\<Phi\>\<b-w\>|)>>>|<row|<cell|\<Phi\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-varphi\><around*|(|\<b-x\><rsub|1>|)><rsup|T>>>|<row|<cell|\<b-varphi\><around*|(|\<b-x\><rsub|2>|)><rsup|T>>>|<row|<cell|\<vdots\>>>|<row|<cell|\<b-varphi\><around*|(|\<b-x\><rsub|n>|)><rsup|T>>>>>>>>|<row|<cell|\<b-t\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|t<rsub|1>>>|<row|<cell|t<rsub|2>>>|<row|<cell|\<vdots\>>>|<row|<cell|t<rsub|N>>>>>>>>>>
    </eqnarray*>

    <math|\<Phi\>> is an <math|N\<times\>M> matrix, called the design matrix,
    whose elements are given by <math|\<Phi\><rsub|n j> =
    \<varphi\><rsub|j>(\<b-x\><rsub|n>)>.

    \;
  </hidden>|<\hidden>
    <tit|<math|\<b-w\><rsub|ML>>>

    The gradient of the log likelihood

    <\equation*>
      \;
    </equation*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<nabla\>ln
      p<around*|(|\<b-t\>\|\<b-w\>,\<beta\>|)>>|<cell|=>|<cell|\<beta\><around*|(|\<b-t\>-\<Phi\>\<b-w\>|)><rsup|T><around*|(|-\<Phi\>|)>>>|<row|<cell|0>|<cell|=>|<cell|\<Phi\><rsup|T>\<b-t\>-\<Phi\><rsup|T>\<Phi\>\<b-w\>>>|<row|<cell|\<b-w\><rsub|ML>>|<cell|=>|<cell|<around*|(|\<Phi\><rsup|T>\<Phi\>|)><rsup|-1>\<Phi\><rsup|T>\<b-t\><eq-number><label|3.15>>>>>
    </eqnarray*>

    which are known as the normal equations for the least squares problem.

    The quantity \ 

    <\equation*>
      \<Phi\><rsup|\<dagger\>>\<equiv\>(\<Phi\><rsup|T>\<Phi\>)<rsup|\<minus\>1>\<Phi\><rsup|T>
    </equation*>

    \ \ is known as the <em|Moore-Penrose pseudo-inverse> of the matrix
    <math|\<Phi\>>.
  </hidden>|<\hidden>
    <tit|<math|w<rsub|0>>>

    If we make the bias parameter explicit, then the error function becomes
    \ 

    <\equation*>
      E<rsub|D>(w)=<frac|1|2><big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n>-w<rsub|0>-<big|sum><rsub|j=1><rsup|M-1>w<rsub|j>\<varphi\><rsub|j><around*|(|\<b-x\><rsub|n>|)>|}><rsup|2>
    </equation*>

    \ \ Setting the derivative with respect to <math|w<rsub|0>> equal to
    zero, and solving for <math|w<rsub|0>>, we obtain \ 

    <\equation*>
      w<rsub|0>=<frac|1|N><big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n>-<big|sum><rsub|j=1><rsup|M-1>w<rsub|j>\<varphi\><rsub|j><around*|(|\<b-x\><rsub|n>|)>|}>
    </equation*>

    \ \ Thus the bias <math|w<rsub|0>> compensates for the difference between
    the averages (over the training set) of the target values and the
    weighted sum of the averages of the basis function values.
  </hidden>|<\hidden>
    <tit|<math|\<beta\><rsub|ML>>>

    maximize the log likelihood function <eqref|3.11> with respect to the
    noise precision parameter <math|\<beta\>>, giving

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<nabla\>ln
      p<around*|(|\<b-t\>\|\<b-w\>,\<beta\>|)>>|<cell|=>|<cell|<frac|N|2\<beta\>>
      \ \<minus\> <frac|1|2><big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n>
      \<minus\> \<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>)|}><rsup|2>>>|<row|<cell|<frac|1|\<beta\><rsub|ML>>>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n>-\<b-w\><rsub|ML><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>|}><rsup|2><label|3.21><eq-number>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Geometry of least squares>

    <\padded-center>
      <small-figure|<image|image/fig_3_2_Geometry_of_least_squares.png|.42par|||>|Geometrical
      interpretation of the least-squares \ solution, in an N-dimensional
      space whose axes are the values of <math|t<rsub|1>, . . . , t<rsub|N>>
      . The least-squares regression function is obtained by finding the
      orthogonal projection of the data vector <math|t> onto the subspace
      spanned by the basis functions <math|\<varphi\><rsub|j>(\<b-x\>)> in
      which each basis function is viewed as a vector
      <math|\<varphi\><rsub|j>> of length N with elements
      <math|\<varphi\><rsub|j>(\<b-x\><rsub|n>)>.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Sequential learning>

    <em|Stochastic gradient descent>, also known as <em|sequential gradient
    descent>.

    If the error function comprises a sum over data points
    <math|E=<big|sum><rsub|n>E<rsub|n>>, then after presentation of pattern
    <math|n>, the stochastic gradient descent algorithm updates the parameter
    vector <math|\<b-w\>> using \ 

    <\equation*>
      \<b-w\><rsup|(\<tau\>+1) >= \<b-w\><rsup|(\<tau\>)> \<minus\>
      \<eta\>\<nabla\>E<rsub|n>
    </equation*>

    \ \ where <math|\<tau\>> denotes the iteration number, and <math|\<eta\>>
    is a learning rate parameter.

    The value of <math|\<b-w\>> is initialized to some starting vector
    <math|\<b-w\>(0)>.

    For the case of the sum-of-squares error function <eqref|3.12>, this
    gives\ 

    <\equation*>
      \ \<b-w\><rsup|(\<tau\>+1)>=\<b-w\><rsup|(\<tau\>)> + \<eta\>(t<rsub|n>
      \<minus\> \<b-varphi\><rsub|n><rsup|T>\<b-w\><rsup|(\<tau\>)>)\<b-varphi\><rsub|n>
    </equation*>

    where <math|\<b-varphi\><rsub|n>=\<b-varphi\>(\<b-x\><rsub|n>)>.

    This is known as <em|least-mean-squares> (LMS) algorithm.
  </hidden>|<\hidden>
    <tit|Regularized least squares>

    Add a regularization term to an error function in order to control
    over-fitting, so that the total error function to be minimized takes the
    form \ 

    <\equation*>
      E<around*|(|\<b-w\>|)>=E<rsub|D>(\<b-w\>) +
      \<lambda\>E<rsub|W><around*|(|\<b-w\>|)>
    </equation*>

    \ \ where <math|\<lambda\>> is the regularization coefficient that
    controls the relative importance of the data-dependent error
    <math|E<rsub|D>(\<b-w\>)> and the regularization term
    <math|E<rsub|w><around*|(|\<b-w\>|)>>.

    One of the simplest forms of regularizer is given by the sum-of-squares
    of the weight vector elements\ 

    <\equation>
      \ E<rsub|W> (\<b-w\>) =<frac|1|2>\<b-w\><rsup|T>\<b-w\><label|3.25>
    </equation>
  </hidden>|<\hidden>
    If we also consider the sum-of-squares error function given by \ 

    <\equation>
      E<rsub|D>(\<b-w\>) =<frac|1|2><big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n>-\<b-varphi\><around*|(|\<b-x\><rsub|n>|)><rsup|T>\<b-w\>|}><rsup|2><label|3.26>
    </equation>

    then the total error function becomes

    <\eqnarray*>
      <tformat|<table|<row|<cell|E<around*|(|\<b-w\>|)>>|<cell|=>|<cell|<frac|1|2><big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n>-\<b-varphi\><around*|(|\<b-x\><rsub|n>|)><rsup|T>\<b-w\>|}><rsup|2>+<frac|\<lambda\>|2>\<b-w\><rsup|T>\<b-w\><eq-number><label|3.27>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2><around*|(|\<b-t\>-\<Phi\>\<b-w\>|)><rsup|T><around*|(|\<b-t\>-\<Phi\>\<b-w\>|)>+<frac|\<lambda\>|2>\<b-w\><rsup|T>\<b-w\>>>>>
    </eqnarray*>

    This particular choice of regularizer is known in the machine learning
    literature as <em|weight decay> because in sequential learning
    algorithms, it encourages weight values to decay towards zero, unless
    supported by the data.

    In statistics, it provides an example of a <em|parameter shrinkage>
    method because it shrinks parameter values towards zero.
  </hidden>|<\hidden>
    \;

    It has the advantage that the error function remains a quadratic function
    of w, and so its exact minimizer can be found in closed form.

    Specifically, setting the gradient of Eq.<eqref|3.27> with respect to w
    to zero,\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<nabla\>E<around*|(|\<b-w\>|)>>|<cell|=>|<cell|<around*|(|\<b-t\>-\<Phi\>\<b-w\>|)><rsup|T><around*|(|-\<Phi\>|)>+\<lambda\>\<b-w\><rsup|T>>>|<row|<cell|0>|<cell|=>|<cell|\<Phi\><rsup|T>\<Phi\>\<b-w\>-\<Phi\><rsup|T>\<b-t\>+\<lambda\>\<b-w\>>>>>
    </eqnarray*>

    and solving for <math|\<b-w\>> as before, we obtain \ 

    <\equation*>
      \<b-w\> = (\<lambda\>I + \<Phi\><rsup|T>\<Phi\>)<rsup|\<minus\>1>
      \<Phi\><rsup|T>\<b-t\>
    </equation*>

    \ \ This represents a simple extension of the least-squares solution
    <eqref|3.15>.
  </hidden>|<\hidden>
    <tit|general regularizers>

    A more general regularizer is sometimes used, for which the regularized
    error takes the form

    <\equation>
      <frac|1|2><big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n> \<minus\>
      \<b-varphi\>(\<b-x\><rsub|n>)<rsup|T>\<b-w\><rsup|T>|}><rsup|2> +
      <frac|\<lambda\>|2><big|sum><rsub|j=1><rsup|M>\|w<rsub|j>\|<rsup|q
      ><label|3.29>
    </equation>

    where <math|q = 2> corresponds to the quadratic regularizer.

    Figure 3.3 shows contours of the regularization function for different
    values of <math|q>.
  </hidden>|<\hidden>
    \;

    \;

    <\padded-center>
      <small-figure|<image|image/fig_3_3_contours_regularizers.png|.9par|||>|Contours
      of the regularization term in Eq. <eqref|3.29> for various values of
      the parameter q.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|lasso>

    The case of <math|q = 1> is know as the <em|lasso> in the statistics
    literature (Tibshirani, 1996).

    It has the property that if <math|\<lambda\>> is sufficiently large, some
    of the coefficients <math|w<rsub|j>> are driven to zero, leading to a
    sparse model in which the corresponding basis functions play no role.

    To see this, we first note that minimizing <eqref|3.29> is equivalent
    \ to minimizing the unregularized sum-of-squares error <eqref|3.12>
    subject to the constraint \ 

    <\equation>
      <big|sum><rsub|j=1><rsup|M><around*|\||w<rsub|j>|\|><rsup|q>\<leqslant\>\<eta\><label|3.30>
    </equation>

    \ \ for an appropriate value of the parameter <math|\<eta\>>, where the
    two approaches can be related \ using Lagrange multipliers.

    The origin of the sparsity can be seen from Figure 3.4, \ which shows
    that the minimum of the error function, subject to the constraint
    <eqref|3.30>.
  </hidden>|<\hidden>
    <\padded-center>
      <\small-figure|<image|image/fig_3_4_contours_regularizers_q_1_q_2.png|.5par|||>>
        Plot of the contours of the unregularized error function (blue) along
        with the constraint region <eqref|3.30> for the quadratic regularizer
        <math|q = 2> on the left and the lasso regularizer <math|q = 1> on
        the right, in which the optimum value for the parameter vector
        <math|\<b-w\>> is denoted by <math|\<b-w\><rsup|\<ast\>>> . The lasso
        gives a sparse solution in which <math|w<rsub|1><rsup|\<ast\>>= 0>.
      </small-figure>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Multiple outputs>

    Predict <math|K \<gtr\> 1> target variables, denoted collectively by the
    target vector <math|\<b-t\>>.

    Introducing a different set of basis functions for each component of
    <math|\<b-t\>>, leading to multiple, independent regression problems.

    <\eqnarray*>
      <tformat|<table|<row|<cell|y<rsub|1>>|<cell|=>|<cell|\<b-varphi\><rsup|<around*|(|1|)>><around*|(|\<b-x\>|)><rsup|T>\<b-w\><rsub|1>>>|<row|<cell|>|<cell|\<vdots\>>|<cell|>>|<row|<cell|y<rsub|K>>|<cell|=>|<cell|\<b-varphi\><rsup|<around*|(|K|)>><around*|(|\<b-x\>|)><rsup|T>\<b-w\><rsub|K>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    Or use the same set of basis functions to model all of the components of
    the target vector so that \ 

    <\equation*>
      \<b-y\>(\<b-x\>, W)<rsup|T> = \<b-varphi\>(\<b-x\>) <rsup|T>W
    </equation*>

    \ \ where\ 

    <math|\<b-y\>(\<b-x\>, W)> is a K-dimensional column vector,\ 

    <math|W> is an <math|M \<times\> K> matrix of parameters, and\ 

    <math|\<b-varphi\>(\<b-x\>)> is an M-dimensional column vector with
    elements <math|\<varphi\><rsub|j>(\<b-x\>)>, with
    <math|\<varphi\><rsub|0>(\<b-x\>) = 1> as before.

    \;
  </hidden>|<\hidden>
    <tit|conditional distribution>

    Suppose we take the conditional distribution of the target vector to be
    an isotropic Gaussian of the form \ 

    <\equation*>
      p(\<b-t\>\|\<b-x\>,W,\<beta\>)=\<cal-N\>
      (\<b-t\>\|W<rsup|T>\<b-varphi\>(\<b-x\>), \<beta\><rsup|\<minus\>1>I)
    </equation*>

    \;
  </hidden>|<\hidden>
    <tit|likelihood>

    If we have a set of observations <math|\<b-t\><rsub|1>,\<cdots\>,\<b-t\><rsub|N>>,
    we can combine these into a matrix <math|T> of size <math|N\<times\>K>
    such that the n'th row is given by <math|\<b-t\><rsub|n><rsup|T>>.

    Similarly, we can combine the input vectors
    <math|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>> into a matrix <math|X>.
    The log likelihood function is then given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|ln p<around*|(|T\|X,W,\<beta\>|)>>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>ln\<cal-N\><around*|(|\<b-t\><rsub|n>\|W<rsup|T>\<b-varphi\><around*|(|*\<b-x\>|)>,\<beta\><rsup|-1>I|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|N
      K|2>ln<around*|(|<frac|\<beta\>|2\<pi\>>|)>-<frac|\<beta\>|2><big|sum><rsub|n=1><rsup|N><around*|\<\|\|\>|\<b-t\><rsub|n>-W<rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>|\<\|\|\>><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<frac|N
      K|2>ln<around*|(|<frac|\<beta\>|2\<pi\>>|)>-<frac|\<beta\>|2><around*|(|T-\<Phi\>W|)><rsup|T><around*|(|T-\<Phi\>W|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|<math|W<rsub|ML>>>

    As before, we can maximize this function with respect to <math|W>, giving\ 

    <\equation*>
      \ W<rsub|ML> = (\<Phi\><rsup|T>\<Phi\>)<rsup|\<minus\>1
      >\<Phi\><rsup|T>T.\ 
    </equation*>

    \ \ If we examine this result for each target variable
    <math|\<b-t\><rsub|k>>, we have \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-w\><rsub|k>>|<cell|=>|<cell|(\<Phi\><rsup|T>\<Phi\>)<rsup|\<minus\>1>
      \<Phi\><rsup|T>\<b-t\><rsub|k>>>|<row|<cell|>|<cell|=>|<cell|\<Phi\><rsup|\<dagger\>>\<b-t\><rsub|k>>>>>
    </eqnarray*>

    where <math|\<b-t\><rsub|k>> is an N-dimensional column vector with
    components <math|t<rsub|n k>> for <math|n = 1,\<cdots\>,N>.

    Thus the solution to the regression problem decouples between the
    different target \ variables, and we need only compute a single
    pseudo-inverse matrix <math|\<Phi\><rsup|\<dagger\>>>, which is shared by
    all of the vectors <math|\<b-w\><rsub|k>>.
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|The Bias-Variance Decomposition>
    </padded-center>
  </hidden>|<\hidden>
    <tit|expected squared loss>

    for the squared loss function, the optimal prediction is given by the
    conditional expectation, which we denote by <math|h(x)> and which is
    given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|h<around*|(|\<b-x\>|)>>|<cell|=>|<cell|\<bbb-E\><around*|[|t\|\<b-x\>|]>>>|<row|<cell|>|<cell|=>|<cell|<big|int>t
      p<around*|(|t\|\<b-x\>|)>\<mathd\>t>>>>
    </eqnarray*>

    the expected squared loss can be written in the form

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|L|]>>|<cell|=>|<cell|<big|int><around*|{|y<around*|(|\<b-x\>,\<b-w\>|)>-t|}><rsup|2>p<around*|(|\<b-x\>,t|)>\<mathd\>\<b-x\>\<mathd\>t>>|<row|<cell|>|<cell|=>|<cell|<big|int><around*|{|y<around*|(|\<b-x\>,\<b-w\>|)>-h<around*|(|\<b-x\>|)>|}><rsup|2>p<around*|(|\<b-x\>|)>\<mathd\>\<b-x\>+<wide*|<big|iint><around*|{|h<around*|(|\<b-x\>|)>-t|}><rsup|2>p<around*|(|\<b-x\>,t|)>\<mathd\>\<b-x\>\<mathd\>t|\<wide-underbrace\>><rsub|arises
      from the intrinsic noise><eq-number><label|3.37>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Frequentist treatment>

    <\itemize-dot>
      <item>From a Bayesian perspective the uncertainty in our model is
      expressed through a posterior distribution over <math|w>.

      <item>A frequentist treatment, however, involves making a point
      estimate of w based on the data set <math|\<cal-D\>>.

      <\itemize-minus>
        <item>Suppose we had a large number of data sets each of size
        <math|N> and each drawn independently from the distribution
        <math|p(t, x)>.

        <item>For any given data set <math|\<cal-D\>>, we can run our
        learning algorithm and obtain a prediction function <math|y(x; D)>.

        <item>Different data sets from the ensemble will give different
        functions and consequently different values of the squared loss.

        <item>The performance of a particular learning algorithm is then
        assessed by taking the average over this ensemble of data sets.
      </itemize-minus>
    </itemize-dot>
  </hidden>|<\hidden>
    <tit|Bias and variance>

    considered a single input value <math|\<b-x\>>.

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><rsub|\<cal-D\>><around*|[|<around*|{|y<around*|(|\<b-x\>;\<cal-D\>|)>-h<around*|(|\<b-x\>|)>|}><rsup|2>|]>>|<cell|=>|<cell|\<bbb-E\><rsub|\<cal-D\>><around*|[|<around*|{|y<around*|(|\<b-x\>;\<cal-D\>|)>-\<bbb-E\><rsub|\<cal-D\>><around*|[|y<around*|(|\<b-x\>;\<cal-D\>|)>|]>+\<bbb-E\><rsub|\<cal-D\>><around*|[|y<around*|(|\<b-x\>;\<cal-D\>|)>|]>-h<around*|(|\<b-x\>|)>|}><rsup|2>|]>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><rsub|\<cal-D\>><around*|[|<around*|{|y<around*|(|\<b-x\>;\<cal-D\>|)>-\<bbb-E\><rsub|\<cal-D\>><around*|[|y<around*|(|\<b-x\>;\<cal-D\>|)>|]>|}><rsup|2>|]>>>|<row|<cell|>|<cell|>|<cell|+2<with|color|magenta|\<bbb-E\><rsub|\<cal-D\>>><around*|{|<with|color|magenta|y<around*|(|\<b-x\>;\<cal-D\>|)>>-<with|color|blue|\<bbb-E\><rsub|\<cal-D\>><around*|[|y<around*|(|\<b-x\>;\<cal-D\>|)>|]>>|}><around*|{|\<bbb-E\><rsub|\<cal-D\>><around*|[|y<around*|(|\<b-x\>;\<cal-D\>|)>|]>-h<around*|(|\<b-x\>|)>|}>>>|<row|<cell|>|<cell|>|<cell|+\<bbb-E\><rsub|\<cal-D\>><around*|[|<around*|{|\<bbb-E\><rsub|\<cal-D\>><around*|[|y<around*|(|\<b-x\>;\<cal-D\>|)>|]>-h<around*|(|\<b-x\>|)>|}><rsup|2>|]>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><rsub|\<cal-D\>><around*|[|<around*|{|y<around*|(|\<b-x\>;\<cal-D\>|)>-\<bbb-E\><rsub|\<cal-D\>><around*|[|y<around*|(|\<b-x\>;\<cal-D\>|)>|]>|}><rsup|2>|]>+\<bbb-E\><rsub|\<cal-D\>><around*|[|<around*|{|\<bbb-E\><rsub|\<cal-D\>><around*|[|y<around*|(|\<b-x\>;\<cal-D\>|)>|]>-h<around*|(|\<b-x\>|)>|}><rsup|2>|]>>>|<row|<cell|>|<cell|=>|<cell|<wide*|<around*|{|\<bbb-E\><rsub|\<cal-D\>><around*|[|y<around*|(|\<b-x\>;\<cal-D\>|)>|]>-h<around*|(|\<b-x\>|)>|}><rsup|2>|\<wide-underbrace\>><rsub|<around*|(|bias|)><rsup|2>>+<wide*|\<bbb-E\><rsub|\<cal-D\>><around*|[|<around*|{|y<around*|(|\<b-x\>;\<cal-D\>|)>-\<bbb-E\><rsub|\<cal-D\>><around*|[|y<around*|(|\<b-x\>;\<cal-D\>|)>|]>|}><rsup|2>|]>|\<wide-underbrace\>><rsub|variance>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|expected loss = (bias)<math|<rsup|2>> + variance + noise>

    substitute this expansion back into Eq. <eqref|3.37>, we obtain the
    following decomposition of the expected squared loss \ 

    <\equation*>
      expected loss = (bias)<rsup|2>+ variance + noise
    </equation*>

    \ where

    <\eqnarray*>
      <tformat|<table|<row|<cell|<around*|(|bias|)><rsup|2>>|<cell|=>|<cell|<big|int><around*|{|\<bbb-E\><rsub|\<cal-D\>><around*|[|y<around*|(|\<b-x\>;\<cal-D\>|)>|]>-h<around*|(|\<b-x\>|)>|}><rsup|2>p<around*|(|\<b-x\>|)>\<mathd\>\<b-x\>>>|<row|<cell|variance>|<cell|=>|<cell|<big|int>\<bbb-E\><rsub|\<cal-D\>><around*|[|<around*|{|y<around*|(|\<b-x\>;\<cal-D\>|)>-\<bbb-E\><rsub|\<cal-D\>><around*|[|y<around*|(|\<b-x\>;\<cal-D\>|)>|]>|}><rsup|2>|]>p<around*|(|\<b-x\>|)>\<mathd\>\<b-x\>>>|<row|<cell|noise>|<cell|=>|<cell|<big|iint><around*|{|h<around*|(|\<b-x\>|)>-t|}><rsup|2>p<around*|(|\<b-x\>,t|)>\<mathd\>\<b-x\>\<mathd\>t>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <\padded-center>
      <\small-figure|<image|image/fig_3_5_bias_variance_sine.png|.3par|||>>
        Illustration of the dependence of bias and variance on model
        complexity, governed by a regularization parameter <math|\<lambda\>>,
        using the sinusoidal data set from Chapter 1. There are L=100 data
        sets, each having N=25 data points, and there are 24 Gaussian basis
        functions in the model so that the total number of parameters is M =
        25 including the bias parameter. The left column shows the result of
        fitting the model to the data sets for various values of ln
        \<lambda\> (for clarity, only 20 of the 100 fits are shown). The
        right column shows the corresponding average of the 100 fits (red)
        along with the sinusoidal function from which the data sets were
        generated (green).
      </small-figure>
    </padded-center>
  </hidden>|<\hidden>
    examine the bias-variance trade-off quantitatively for this example.

    The average prediction is estimated from \ 

    <\equation*>
      <wide|y|\<wide-bar\>>(x) =<frac|1|L><big|sum><rsub|l=1><rsup|L>y<rsup|<around*|(|l|)>><around*|(|x|)>
    </equation*>

    \ \ and the integrated squared bias and integrated variance are then
    given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|<around*|(|bias|)><rsup|2>>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N><around*|{|<wide|y|\<wide-bar\>><around*|(|x<rsub|n>|)>-h<around*|(|x<rsub|n>|)>|}><rsup|2>>>|<row|<cell|variance>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N><frac|1|L><big|sum><rsup|L><rsub|l=1><around*|{|y<rsup|<around*|(|l|)>><around*|(|x<rsub|n>|)>-<wide|y|\<wide-bar\>><around*|(|x<rsub|n>|)>|}><rsup|2>>>>>
    </eqnarray*>

    where the integral over <math|x> weighted by the distribution <math|p(x)>
    is approximated by a finite sum over data points drawn from that
    distribution.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_3_6_bias_variance_test.png|.5par|||>|Plot
      of squared bias and variance, \ together with their sum, corresponding
      to the results shown in Figure 3.5. Also shown is the average test set
      error for a test data set size of 1000 points. The minimum value of
      (bias)<math|<rsup|2>> + variance occurs around <math|ln \<lambda\> =
      \<minus\>0.31>, which is close to the value that gives the minimum
      error on the test data.>
    </padded-center>
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|Bayesian Linear Regression>
    </padded-center>
  </hidden>|<\hidden>
    The effective model complexity, governed by the <strong|number> of basis
    functions, needs to be controlled according to the size of the data set.

    Adding a <strong|regularization> term to the log likelihood function
    means the effective model complexity can then be controlled by the value
    of the regularization coefficient, although the choice of the number and
    form of the basis functions is of course still important in determining
    the overall behaviour of the model.

    This leaves the issue of deciding the appropriate model complexity for
    the particular problem, which cannot be decided simply by maximizing the
    likelihood function, because this always leads to excessively complex
    models and over-fitting.

    Independent hold-out data can be used to determine model complexity, as
    discussed in Section 1.3, but this can be both computationally expensive
    and wasteful of valuable data.

    A Bayesian treatment of linear regression will avoid the over-fitting
    problem of maximum likelihood, and which will also lead to automatic
    methods of determining model complexity using the training data alone.

    Again, for simplicity we will focus on the case of a single target
    variable <math|t>.
  </hidden>|<\hidden>
    <tit|prior probability distribution>

    Introduce a prior probability distribution over the model parameters
    <math|\<b-w\>>.

    Treat the noise precision parameter <math|\<beta\>> as a known constant.

    The likelihood function <math|p(t\|\<b-w\>)> defined by Eq. <eqref|3.10>
    is the exponential of a quadratic function of <math|\<b-w\>>.

    The corresponding conjugate prior is therefore given by a Gaussian
    distribution of the form \ 

    <\equation*>
      p(\<b-w\>)=\<cal-N\>(\<b-w\>\|\<b-m\><rsub|0>, S<rsub|0>)
    </equation*>

    \ \ having mean <math|\<b-m\><rsub|0>> and covariance <math|S<rsub|0>>.
  </hidden>|<\hidden>
    <tit|posterior distribution>

    Next compute the posterior distribution, which is proportional to the
    product of the likelihood function and the prior.

    Due to the choice of a conjugate Gaussian prior distribution, the
    posterior will also be Gaussian.\ 

    Evaluate this distribution by the usual procedure of completing the
    square in the exponential, and then finding the normalization coefficient
    using the standard result for a normalized Gaussian.

    The posterior distribution is in the form \ 

    <\equation>
      p(\<b-w\>\|\<b-t\>,X)=\<cal-N\>(\<b-w\>\|\<b-m\><rsub|N>,
      S<rsub|N>)<label|3.49>
    </equation>

    \ \ where

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-m\><rsub|N>>|<cell|=>|<cell|S<rsub|N><around*|(|S<rsub|0><rsup|-1>\<b-m\><rsub|0>+\<beta\>\<Phi\><rsup|T>\<b-t\>|)>>>|<row|<cell|S<rsub|N><rsup|-1>>|<cell|=>|<cell|S<rsub|0><rsup|-1>+\<beta\>\<Phi\><rsup|T>\<Phi\><eq-number><label|3.51>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    Note that because the posterior distribution is Gaussian, its mode
    coincides with its mean.

    Thus the maximum posterior weight vector is simply given by\ 

    <\equation*>
      \<b-w\><rsub|MAP> = \<b-m\><rsub|N> .
    </equation*>

    If we consider an infinitely broad prior\ 

    <\equation*>
      S<rsub|0> = \<alpha\><rsup|\<minus\>1>I
    </equation*>

    with <math|\<alpha\> \<rightarrow\> 0>, the mean <math|\<b-m\><rsub|N>>
    of the posterior distribution reduces to the maximum likelihood value
    <math|\<b-w\><rsub|ML>> given by Eq. <eqref|3.15>.

    Similarly, if <math|N = 0>, then the posterior distribution reverts to
    the prior.

    Furthermore, if data points arrive sequentially, then the posterior
    distribution at any stage acts as the prior distribution for the
    subsequent data point, such that the new posterior distribution is again
    given by Eq. <eqref|3.49>.

    \;
  </hidden>|<\hidden>
    Consider a zero-mean isotropic Gaussian governed by a single precision
    parameter <math|\<alpha\>> so that \ 

    <\equation>
      p(\<b-w\>\|\<alpha\>)=N (\<b-w\>\|\<b-0\>,
      \<alpha\><rsup|\<minus\>1>I)<label|3.52>
    </equation>

    \ \ and the corresponding posterior distribution over <math|\<b-w\>> is
    then given by Eq. <eqref|3.49> with \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-m\><rsub|N>>|<cell|=>|<cell|\<beta\>S<rsub|N>\<Phi\><rsup|T>\<b-t\><eq-number><label|3.53>>>|<row|<cell|S<rsub|N><rsup|-1>>|<cell|=>|<cell|\<alpha\>I+\<beta\>\<Phi\><rsup|T>\<Phi\><eq-number><label|3.54>>>>>
    </eqnarray*>

    \ \ The log of the posterior distribution is given by the sum of the log
    likelihood and the log of the prior and, as a function of w, takes the
    form \ 

    <\equation*>
      ln p(\<b-w\>\|t) =-<frac|\<beta\>|2><big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n>-\<b-varphi\><around*|(|\<b-x\><rsub|n>|)><rsup|T>\<b-w\>|}><rsup|2>-<frac|\<alpha\>|2>\<b-w\><rsup|T>\<b-w\>+const
    </equation*>

    Maximization of this posterior distribution with respect to
    <math|\<b-w\>> is therefore equivalent to the minimization of the
    sum-of-squares error function with the addition of a quadratic
    regularization term, corresponding to Eq. <eqref|3.27> with
    <math|\<lambda\> = \<alpha\>/\<beta\>>.
  </hidden>|<\hidden>
    <\padded-center>
      \;

      \;

      <small-figure|<tabular|<tformat|<table|<row|<cell|<image|image/fig_3_7_sequential_bayesian_1.png|.42par|||>>|<cell|<image|image/fig_3_7_sequential_bayesian_2.png|.42par|||>>>>>>|Illustration
      of sequential Bayesian learning for a simple linear model of the
      form<math| y(x, w) = \ w<rsub|0>+w<rsub|1>x>. A detailed description of
      this figure is given in the text.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Other forms of prior>

    Other forms of prior over the parameters can be considered.

    For instance, we can generalize the Gaussian prior to give \ 

    <\equation*>
      p(\<b-w\>\|\<alpha\>) = \ <around*|[|<frac|q|2><around*|(|<frac|\<alpha\>|2>|)><rsup|1/q><frac|1|\<Gamma\><around*|(|1/q|)>>|]><rsup|M>exp<around*|(|-<frac|\<alpha\>|2><big|sum><rsub|j=0><rsup|M-1><around*|\||w<rsub|j>|\|><rsup|q>|)>
    </equation*>

    in which <math|q = 2> corresponds to the Gaussian distribution, and only
    in this case is the prior conjugate to the likelihood function
    <eqref|3.10>.

    Finding the maximum of the posterior distribution over <math|w>
    corresponds to minimization of the regularized error function
    <eqref|3.29>.

    In the case of the Gaussian prior, the mode of the posterior distribution
    was equal to the mean, although this will no longer hold if
    <math|q\<neq\>2>.
  </hidden>|<\hidden>
    <tit|Predictive distribution>

    Make predictions of <math|t> for new values of <math|x>.

    Requires that we evaluate the predictive distribution defined by \ 

    <\equation>
      p(t\|\<b-t\>,<with|color|purple|X,\<b-x\>>, \<alpha\>, \<beta\>) =
      \ <big|int> p(t\|x,\<b-w\>,\<beta\>)p(\<b-w\>\|\<b-t\>,<with|color|magenta|X>,
      \<alpha\>, \<beta\>)\<mathd\>\<b-w\><label|3.57>
    </equation>

    in which <math|\<b-t\>> is the vector of target values from the training
    set, and omitted the corresponding input vectors from the right-hand side
    of the conditioning statements to simplify the notation.

    The conditional distribution <math|p(t\|\<b-x\>,\<b-w\>, \<beta\>)> of
    the target variable is given by Eq. <eqref|3.8>, and the posterior weight
    distribution is given by Eq. <eqref|3.49>.
  </hidden>|<\hidden>
    the predictive distribution takes the form \ 

    <\equation>
      p(t\|\<b-x\>,\<b-t\>,<with|color|magenta|X>, \<alpha\>, \<beta\>) =
      \<cal-N\> (t\|\<b-m\><rsup|T><rsub|N> \<b-varphi\>(\<b-x\>),
      \<sigma\><rsup|2><rsub|N> (\<b-x\>))<label|3.58>
    </equation>

    where the variance <math|\<sigma\><rsup|2><rsub|N>(x)> of the predictive
    distribution is given by \ 

    <\equation>
      \<sigma\><rsub|N><rsup|2>(\<b-x\>) = 1/\<beta\>
      +\<b-varphi\>(\<b-x\>)<rsup|T>S<rsub|N>\<b-varphi\>(\<b-x\>)
      <label|3.59>
    </equation>

    The first term in Eq. <eqref|3.59> represents the noise on the data
    whereas the second term reflects the uncertainty associated with the
    parameters <math|w>.

    Because the noise process and the distribution of <math|w> are
    independent Gaussians, their variances are additive.

    Note that, as additional data points are observed, the posterior
    distribution becomes narrower. As a consequence it can be shown (Qazaz et
    al., 1997) that <math|\<sigma\><rsup|2><rsub|N+1>(x)\<leqslant\>\<sigma\><rsup|2><rsub|N>
    (x)>.

    In the limit <math|N \<rightarrow\> \<infty\>>, the second term in Eq.
    <eqref|3.59> goes to zero, and the variance \ of the predictive
    distribution arises solely from the additive noise governed by the
    parameter <math|\<beta\>>.

    \;
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_3_8_predictive_distribution_sine.png|.6par|||>|<label|fig3.8>Examples
      of the predictive distribution <eqref|3.58> for a model consisting of 9
      Gaussian basis functions of the form <eqref|3.4> using the synthetic
      sinusoidal data set of <math|sin<around*|(|2\<pi\>x|)>>.>
    </padded-center>
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_3_9_sample_posterior_sine.png|.6par|||>|Plots
      of the function <math|y(x, w)> using samples from the posterior
      distributions over <math|w> corresponding to the plots in Figure
      <reference|fig3.8>.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Equivalent kernel>

    Substitute Eq. <eqref|3.53> into the expression <eqref|3.3>, we see that
    the predictive mean can be written in the form\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|y<around*|(|\<b-x\>,\<b-m\><rsub|N>|)>>|<cell|=>|<cell|\<b-varphi\><around*|(|\<b-x\>|)><rsup|T>\<b-m\><rsub|N>>>|<row|<cell|>|<cell|=>|<cell|\<beta\>\<b-varphi\><around*|(|\<b-x\>|)><rsup|T>S<rsub|N>\<Phi\><rsup|T>\<b-t\>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>\<beta\>\<b-varphi\><around*|(|\<b-x\>|)><rsup|T>S<rsub|N>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>t<rsub|n>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|n1><rsup|N>k<around*|(|\<b-x\>,\<b-x\><rsub|n>|)>t<rsub|n>>>|<row|<cell|k<around*|(|\<b-x\>,\<b-x\><rprime|'>|)>>|<cell|=>|<cell|\<beta\>\<b-varphi\><around*|(|\<b-x\>|)><rsup|T>S<rsub|N>\<b-varphi\><around*|(|\<b-x\><rprime|'>|)><eq-number><label|3.62>>>>>
    </eqnarray*>

    where <math|S<rsub|N>> is defined by Eq. <eqref|3.51>.
    \ <math|k<around*|(|\<b-x\>,\<b-x\><rprime|'>|)>> is the <em|smoother
    matrix> or the <em|equivalent kernel>.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_3_10_equivalent_kernel.png|.9par|||>|The
      equivalent kernel <math|k(x, x\<prime\>)> for the Gaussian basis
      functions in Figure <reference|fig3.1>, shown as \ a plot of <math|x>
      versus <math|x\<prime\>>, together with three slices through this
      matrix corresponding to three different values of <math|x>. The data
      set used to generate this kernel comprised 200 values of <math|x>
      equally spaced over the interval <math|(\<minus\>1, 1)>.>
    </padded-center>
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_3_11_kernel_polynomial_sigmoidal.png|.5par|||>|Examples
      of equivalent kernels <math|k(x, x\<prime\>)> for <math|x = 0>
      \ plotted as a function of <math|x\<prime\>>, corresponding (left) to
      the polynomial basis functions and (right) to the sigmoidal basis
      functions shown in Figure <reference|fig3.1>. Note that these are
      localized functions of <math|x\<prime\>> even though the corresponding
      basis functions are nonlocal.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|kernel/covariance>

    Further insight into the role of the equivalent kernel can be obtained by
    considering the covariance between <math|y(x)> and <math|y(x\<prime\>)>,
    which is given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|cov<around*|[|y<around*|(|\<b-x\>|)>,y<around*|(|\<b-x\><rprime|'>|)>|]>>|<cell|=>|<cell|cov<around*|[|\<b-varphi\><around*|(|\<b-x\>|)><rsup|T>\<b-w\>,\<b-w\><rsup|T>\<b-varphi\><around*|(|\<b-x\><rprime|'>|)>|]>>>|<row|<cell|>|<cell|=>|<cell|\<b-varphi\><around*|(|\<b-x\>|)><rsup|T>S<rsub|N>\<b-varphi\><around*|(|\<b-x\><rprime|'>|)>>>|<row|<cell|>|<cell|=>|<cell|\<beta\><rsup|-1>k<around*|(|\<b-x\>,\<b-x\><rprime|'>|)>>>>>
    </eqnarray*>

    where we have made use of Eq. <eqref|3.49>) and <eqref|3.62>.

    From the form of the equivalent kernel, we see that the predictive mean
    at nearby points will be highly correlated, whereas for more distant
    pairs of points the correlation will be smaller.
  </hidden>|<\hidden>
    It can be shown that these weights sum to one, in other words \ 

    <\equation>
      <big|sum><rsub|n=1><rsup|N>k<around*|(|\<b-x\>,\<b-x\><rsub|n>|)>=1<label|3.64>
    </equation>

    for all values of <math|x>.\ 

    Note that the kernel function can be negative as well as positive, so
    although it satisfies a summation constraint, the corresponding
    predictions are not necessarily convex combinations of the training set
    target variables.

    The equivalent kernel \ satisfies an important property shared by kernel
    functions in general, namely that it can be expressed in the form an
    \ inner product with respect to a vector
    <math|\<b-psi\><around*|(|\<b-x\>|)>> of nonlinear functions, so that \ 

    <\equation*>
      k(\<b-x\>,\<b-x\><rprime|'>) = \<b-psi\>(x)<rsup|T>\<b-psi\>(x<rprime|'>)
    </equation*>

    \ \ where\ 

    <\equation*>
      \<b-psi\>(\<b-x\>) = \<beta\><rsup|1/2>S<rsup|1/2><rsub|N>\<b-varphi\>(\<b-x\>)
    </equation*>
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|Bayesian Model Comparison>
    </padded-center>
  </hidden>|<\hidden>
    <tit|model selection>

    In Chapter 1, we highlighted the problem of over-fitting as well as the
    use of <em|crossvalidation> as a technique for setting the values of
    regularization parameters or for choosing between alternative models.

    Here we consider the problem of <em|model selection> from a Bayesian
    perspective.

    \;
  </hidden>|<\hidden>
    \;

    <\itemize-dot>
      <item>As we shall see, the over-fitting associated with maximum
      likelihood can be avoided by <strong|marginalizing> (summing or
      integrating) over the model parameters instead of making point
      estimates of their values.

      <item>Models can then be compared directly on the training data,
      without the need for a validation set.

      <\itemize-minus>
        <item>This allows all available data to be used for training and
        avoids the multiple training runs for each model associated with
        cross-validation.

        <item>It also allows multiple complexity parameters to be determined
        simultaneously as part of the training process.\ 
      </itemize-minus>
    </itemize-dot>

    \;

    \;

    \;
  </hidden>|<\hidden>
    <tit|Bayesian view>

    The Bayesian view of model comparison simply involves the use of
    probabilities to represent uncertainty in the choice of model, along with
    a consistent application of the sum and product rules of probability.

    Suppose we wish to compare a set of <math|L> models
    <math|{\<cal-M\><rsub|i>}> where <math|i = 1, . . . , L>. Here a model
    refers to a probability distribution over the observed data
    <math|\<cal-D\>>.

    In the case of the polynomial curve-fitting problem, the distribution is
    defined over the set of target values <math|<math-tt|<strong|t>>>, while
    the set of input values <math|X> is assumed to be known.

    Other types of model define a joint distributions over <math|X> and
    <math|<math-bf|<verbatim|t>>>. We shall suppose that the data is
    generated from one of these models but we are uncertain which one.

    \;
  </hidden>|<\hidden>
    <tit|Model evidence>

    Uncertainty is expressed through a prior probability distribution
    <math|p(\<cal-M\><rsub|i>)>. Given a training set <math|\<cal-D\>>,
    evaluate the posterior distribution

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<cal-M\><rsub|i>\|\<cal-D\>|)>>|<cell|\<propto\>>|<cell|p<around*|(|\<cal-M\><rsub|i>|)>p<around*|(|\<cal-D\>\|\<cal-M\><rsub|i>|)>>>>>
    </eqnarray*>

    The prior allows us to express a preference for different models. Let us
    simply assume that all models are given equal prior probability.

    The interesting term is the <em|model evidence>
    <math|p(\<cal-D\>\|\<cal-M\><rsub|i>)> which expresses the preference
    shown by the data for different models, and we shall examine this term in
    more detail shortly.

    The model evidence is sometimes also called the <em|marginal likelihood>
    because it can be viewed as a likelihood function over the space of
    models, in which the parameters have been marginalized out.

    The ratio of model evidences <math|p(\<cal-D\>\|\<cal-M\><rsub|i>)/p(\<cal-D\>\|\<cal-M\><rsub|j>)>
    for two models is known as a <em|Bayes factor> (Kass and Raftery, 1995).
  </hidden>|<\hidden>
    <tit|Predictive distribution>

    Once we know the posterior distribution over models, the predictive
    distribution is given, from the sum and product rules, by \ 

    <\equation*>
      p(t\|\<b-x\>,\<cal-D\>)=<big|sum><rsub|i=1><rsup|L>p(t\|\<b-x\>,\<cal-M\><rsub|i>,\<cal-D\>)p(\<cal-M\><rsub|i>\|\<cal-D\>)
    </equation*>

    <space|1em>This is an example of a <em|mixture distribution> in which the
    overall predictive distribution is obtained by averaging the predictive
    distributions <math|p(t\|\<b-x\>,\<cal-M\><rsub|i>,\<cal-D\>)> of
    individual models, weighted by the posterior probabilities
    <math|p(\<cal-M\><rsub|i>\|\<cal-D\>)> of those models.

    <space|1em>For instance, if we have two models that are a-posteriori
    equally likely and one predicts a narrow distribution around <math|t = a>
    while the other predicts a narrow distribution around <math|t = b>, the
    overall predictive distribution will be a bimodal distribution with modes
    at <math|t = a> and <math|t = b>, not a single model at <math|t = (a +
    b)/2>.
  </hidden>|<\hidden>
    <tit|<math|\<b-w\>>>

    \;

    For a model governed by a set of parameters <math|\<b-w\>>, the model
    evidence is given, from the sum and product rules of probability, by \ 

    <\equation*>
      p(\<cal-D\>\|\<cal-M\><rsub|i>)=<big|int>
      \ p(\<cal-D\>\|\<b-w\>,\<cal-M\><rsub|i>)p(\<b-w\>\|\<cal-M\><rsub|i>)\<mathd\>\<b-w\>.
    </equation*>

    From a sampling perspective, the marginal likelihood can be viewed as the
    probability of generating the data set <math|\<cal-D\>> from a model
    whose parameters are sampled at random from the prior.

    \;
  </hidden>|<\hidden>
    <tit|Normalizing term>

    \;

    \;

    It is also interesting to note that the evidence is precisely the
    normalizing term that appears in the denominator in Bayes' theorem when
    evaluating the posterior distribution over parameters because \ 

    <\equation*>
      p(\<b-w\>\|\<cal-D\>,\<cal-M\><rsub|i>)=<frac|p(\<cal-D\>\|\<b-w\>,\<cal-M\><rsub|i>)p(\<b-w\>\|\<cal-M\><rsub|i>)|<with|color|magenta|p(\<cal-D\>\|\<cal-M\><rsub|i>)>>.
    </equation*>
  </hidden>|<\hidden>
    <tit|A simple approximation>

    We can obtain some insight into the model evidence by making a simple
    approximation to the integral over parameters.

    Consider first the case of a model having a single parameter <math|w>.
    The posterior distribution over parameters is proportional to
    <math|p(\<cal-D\>\|w)p(w)>, where we <strong|omit> the dependence on the
    model <math|M<rsub|i>> to keep the notation uncluttered.

    If we assume that the posterior distribution is sharply peaked around the
    most probable value <math|w<rsub|MAP>>, with width
    <math|\<#2206\>w<rsub|posterior>>, then we can approximate the integral
    by the value of the integrand at its maximum times the width of the peak.
  </hidden>|<\hidden>
    If we further assume that the prior is flat with width
    <math|\<#2206\>w<rsub|prior>> so that <math|p(w) =
    1/\<#2206\>w<rsub|prior>>, then we have \ 

    <\equation>
      p(\<cal-D\>) = \ <big|int>p(\<cal-D\>\|w)p(w) \<mathd\>w\<simeq\>
      p(\<cal-D\>\|w<rsub|MAP>)<frac| \<#2206\>w<rsub|posterior>|\<#2206\>w<rsub|prior>><label|3.70>
    </equation>

    and so taking logs we obtain

    <\equation*>
      ln p(\<cal-D\>) ln p(\<cal-D\>\|w<rsub|MAP>) +
      ln<around*|(|<frac|\<#2206\><rsub|wposterior>|\<#2206\>w<rsub|prior>>|)>
    </equation*>

    This approximation is illustrated in Figure <reference|fig3.12>.

    The first term represents the fit to the data given by the most probable
    parameter values, and for a flat prior this would correspond to the log
    likelihood.

    The second term penalizes the model according to its complexity. Because
    <math|\<#2206\>w<rsub|posterior>\<less\>\<#2206\>w<rsub|prior>> this term
    is negative, and it increases in magnitude as the ratio gets smaller.

    Thus, if parameters are finely tuned to the data in the posterior
    distribution, then the penalty term is large.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_3_12_model_evidence_approximation.png|.5par|||>|<label|fig3.12>We
      can obtain a rough approximation to \ the model evidence if we assume
      that the posterior distribution over parameters is sharply peaked
      around its mode \ <math|w<rsub|MAP>>.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|M parameters>

    For a model having a set of M parameters, we can make a similar
    approximation for each parameter in turn.

    Assuming that all parameters have the same ratio of
    <math|\<#2206\>w<rsub|posterior>/\<#2206\>w<rsub|prior>>, we obtain

    <\equation*>
      ln p<around*|(|\<cal-D\>|)>\<simeq\>ln
      p<around*|(|\<cal-D\>\|\<b-w\><rsub|MAP>|)>+M
      ln<around*|(|<frac|\<mathLaplace\>w<rsub|posterior><rsub|>|\<Delta\>w<rsub|prior>>|)>
    </equation*>

    In this very simple approximation, the size of the complexity penalty
    increases linearly with the number M of adaptive parameters in the model.

    As we increase the complexity of the model, the first term will typically
    decrease, because a more complex model is better able to fit the data,
    whereas the second term will increase due to the dependence on M. The
    optimal model complexity, as determined by the maximum evidence, will be
    given by a trade-off between these two competing terms.
  </hidden>|<\hidden>
    <tit|Another example>

    We can gain further insight into Bayesian model comparison and understand
    how the marginal likelihood can favour models of intermediate complexity
    by considering Figure <reference|fig3.13>.

    Here the horizontal axis is a one-dimensional representation of the space
    of possible data sets, so that each point on this axis corresponds to a
    specific data set.

    Consider three models <math|\<cal-M\><rsub|1>>, <math|\<cal-M\><rsub|2>>
    and <math|\<cal-M\><rsub|3>> of successively increasing complexity.
    Imagine running these models generatively to produce example data sets,
    and then looking at the distribution of data sets that result.

    Any given model can generate a variety of different data sets since the
    parameters are governed by a prior probability distribution, and for any
    choice of the parameters there may be random noise on the target
    variables.

    To generate a particular data set from a specific model, we first choose
    the values of the parameters from their prior distribution
    <math|p(\<b-w\>)>, and then for these parameter values we sample the data
    from <math|p(D\|\<b-w\>)>.
  </hidden>|<\hidden>
    <small-figure|<image|image/fig_3_13_model_evidence_3.png|.5par|||>|<label|fig3.13>Schematic
    illustration of the \ distribution of data sets for three models of
    different complexity, in which <math|\<cal-M\><rsub|1>> is the simplest
    and <math|\<cal-M\><rsub|3>> is the most complex. Note that the
    distributions are normalized. In this example, for the particular
    observed data set <math|\<cal-D\><rsub|0>>, the model
    <math|\<cal-M\><rsub|2>> with intermediate complexity has the largest
    evidence.>
  </hidden>|<\hidden>
    note:

    A simple model (for example, based on a first order polynomial) has
    little variability and so will generate data sets that are fairly similar
    to each other. Its distribution <math|p(\<cal-D\>)> is therefore confined
    to a relatively small region of the horizontal axis.

    By contrast, a complex model (such as a ninth order polynomial) can
    generate a great variety of different data sets, and so its distribution
    <math|p(\<cal-D\>)> is spread over a large region of the space of data
    sets.

    Because the distributions <math|p(\<cal-D\>\|\<cal-M\><rsub|i>)> are
    normalized, we see that the particular data set <math|\<cal-D\><rsub|0>>
    can have the highest value of the evidence for the model of intermediate
    complexity.

    Essentially, the simpler model cannot fit the data well, whereas the more
    complex model spreads its predictive probability over too broad a range
    of data sets and so assigns relatively small probability to any one of
    them.
  </hidden>|<\hidden>
    <tit|Assumption>

    Implicit in the Bayesian model comparison framework is the assumption
    that\ 

    <with|color|blue|the true distribution from which the data are generated
    is contained within the set of models under consideration.>

    Provided this is so, we can show that Bayesian model comparison will on
    average favour the correct model.

    \;
  </hidden>|<\hidden>
    <tit|Expected Bayes factor>

    To see this, consider two models <math|\<cal-M\><rsub|1>> and
    <math|\<cal-M\><rsub|2>> in which the truth corresponds to
    <math|\<cal-M\><rsub|1>>.

    For a given finite data set, it is possible for the Bayes factor to be
    larger for the incorrect model.

    However, if we average the Bayes factor over the distribution of data
    sets, we obtain the expected Bayes factor in the form

    <\equation*>
      <big|int>p<around*|(|\<cal-D\>\|\<cal-M\><rsub|1>|)>ln<frac|p<around*|(|\<cal-D\>\|\<cal-M\><rsub|1>|)>|p<around*|(|\<cal-D\>\|\<cal-M\><rsub|2>|)>>\<mathd\>\<cal-D\>
    </equation*>

    where the average has been taken with respect to the true distribution of
    the data.\ 

    This quantity is an example of the Kullback-Leibler divergence and
    satisfies the property of always being positive unless the two
    distributions are equal in which case it is zero.

    Thus on average the Bayes factor will always favour the correct model.
  </hidden>|<\hidden>
    <tit|Note>

    The Bayesian framework avoids the problem of over-fitting and allows
    models to be compared on the basis of the training data alone.

    However,a Bayesian approach, like any approach to pattern recognition,
    needs to make assumptions about the form of the model, and if these are
    invalid then the results can be misleading.

    In particular, we see from Figure <reference|fig3.12> that the model
    evidence can be sensitive to many aspects of the prior, such as the
    behaviour in the tails.

    Indeed, the evidence is not defined if the prior is improper, as can be
    seen by noting that an improper prior has an arbitrary scaling factor (in
    other words, the normalization coefficient is not defined because the
    distribution cannot be normalized).

    \;
  </hidden>|<\hidden>
    If we consider a proper prior and then take a suitable limit in order to
    obtain an improper prior (for example, a Gaussian prior in which we take
    the limit of infinite variance) then the evidence will go to zero, as can
    be seen from Eq. <eqref|3.70> and Figure <reference|fig3.12>.

    <\equation*>
      p(\<cal-D\>) \<simeq\> lim<rsub|\<Delta\>w<rsub|prior>\<rightarrow\>\<infty\>>p(\<cal-D\>\|w<rsub|MAP>)<frac|
      \<#2206\>w<rsub|posterior>|\<#2206\>w<rsub|prior>>=0
    </equation*>

    It may, however, be possible to consider the evidence ratio between two
    models first and then take a limit to obtain a meaningful answer. \ 

    In a practical application, therefore, it will be wise to keep aside an
    independent test set of data on which to evaluate the overall performance
    of the final system.
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|The Evidence Approximation>
    </padded-center>
  </hidden>|<\hidden>
    In a fully Bayesian treatment of the linear basis function model, we
    would introduce prior distributions over the hyperparameters
    <math|\<alpha\>> and <math|\<beta\>> and make predictions by
    marginalizing with respect to these hyperparameters as well as with
    respect to the parameters <math|\<b-w\>>.

    <\equation>
      p(t\|\<b-t\>) =<big|iiint>p(t\|\<b-w\>, \<beta\>)p(\<b-w\>\|t,
      \<alpha\>, \<beta\>)p(\<alpha\>, \<beta\>\|t)
      \<mathd\>\<b-w\>\<mathd\>\<alpha\>\<mathd\>\<beta\> <label|3.74>
    </equation>

    where <math|p(t\|w, \<beta\>)> is given by Eq. <eqref|3.8> and
    <math|p(w\|t, \<alpha\>, \<beta\>)> is given by Eq. <eqref|3.49> with
    <math|m<rsub|N>> and <math|S<rsub|N>> defined by Eq. <eqref|3.53> and
    <eqref|3.54> respectively. Here we have omitted the dependence on the
    input variable x to keep the notation uncluttered.

    \;
  </hidden>|<\hidden>
    \;

    However, although we can integrate analytically either over
    <math|\<b-w\>> or over the hyperparameters, the complete marginalization
    over all of these variables is analytically intractable.

    Here we discuss an approximation in which we set the hyperparameters to
    specific values determined by maximizing the marginal likelihood function
    obtained by first integrating over the parameters <math|w>.

    This framework is known in the statistics literature as <em|empirical
    Bayes> (Bernardo and Smith, 1994; Gelman et al., 2004), or <em|type 2
    maximum likelihood> (Berger, 1985), or <em|generalized maximum
    likelihood> (Wahba, 1975), and in the machine learning literature is also
    called the <em|evidence approximation> (Gull, 1989; MacKay, 1992a).
  </hidden>|<\hidden>
    <tit|Fixed <math|\<alpha\>,\<beta\>>>

    \;

    \;

    \;

    If the posterior distribution<math| p(\<alpha\>, \<beta\>\|t)> is sharply
    peaked around values <math|<wide|\<alpha\>|^>> and
    <math|<wide|\<beta\>|^>>, then the predictive distribution is obtained
    simply by marginalizing over <math|w> in which <math|\<alpha\>> and
    <math|\<beta\>> are fixed to the values <math|<wide|\<alpha\>|^>> and
    <math|<wide|\<beta\>|^>>, so that \ 

    <\equation*>
      p(t\|\<b-t\>)\<simeq\> p(t\|\<b-t\>, <wide|\<alpha\>|^>,
      <wide|\<beta\>|^>) = \ \<big-int\> \ p(t\|\<b-w\>,
      <wide|\<beta\>|^>)p(\<b-w\>\|t, <wide|\<alpha\>|^>, <wide|\<beta\>|^>)
      \<mathd\>\<b-w\>.
    </equation*>
  </hidden>|<\hidden>
    <tit|Maximizing the marginal likelihood>

    From Bayes' theorem, the posterior distribution for <math|\<alpha\>> and
    <math|\<beta\>> is given by \ 

    <\equation*>
      p(\<alpha\>, \<beta\>\|t) \<propto\> p(t\|\<alpha\>,
      \<beta\>)p(\<alpha\>, \<beta\>).
    </equation*>

    If the prior is relatively flat, then in the evidence framework the
    values of <math|<wide|\<alpha\>|^>> and <math|<wide|\<beta\>|^>> are
    obtained by maximizing the marginal likelihood function
    <math|p(t\|\<alpha\>,\<beta\>)>.

    We shall proceed by evaluating the marginal likelihood for the linear
    basis function model and then finding its maxima.

    This will allow us to determine values for these hyperparameters from the
    training data alone, without recourse to cross-validation. Recall that
    the ratio <math|\<alpha\>/\<beta\>> is analogous to a regularization
    parameter.
  </hidden>|<\hidden>
    <tit|Evaluation of the evidence function>

    Marginal likelihood function<math| p(\<b-t\>\|\<alpha\>, \<beta\>)> is
    obtained by integrating over the weight parameters <math|w>,

    <\equation*>
      \ p(\<b-t\>\|\<alpha\>, \<beta\>) = \ <big|int>p(t\|w,
      \<beta\>)p(w\|\<alpha\>) \<mathd\>w.
    </equation*>

    Complete the square in the exponent and make use of the standard form for
    the normalization coefficient of a Gaussian. From Eq. <eqref|3.11>,
    <eqref|3.12>, and <eqref|3.52>, write the evidence function in the form\ 

    <\equation>
      \ p(\<b-t\>\|\<alpha\>, \<beta\>) =
      \ <around*|(|<frac|\<beta\>|2\<pi\>>|)><rsup|N/2><around*|(|<frac|\<alpha\>|2\<pi\>>|)><rsup|M/2><big|int>exp
      <around*|{|-E<around*|(|\<b-w\>|)>|}>\<mathd\>\<b-w\><label|3.78>
    </equation>

    where <math|M> is the dimensionality of <math|\<b-w\>>, and we have
    defined

    <\eqnarray*>
      <tformat|<table|<row|<cell|E<around*|(|\<b-w\>|)>>|<cell|=>|\<beta\>E<rsub|D><around*|(|\<b-w\>|)>+\<alpha\>E<rsub|W><around*|(|\<b-w\>|)>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2>\<beta\><around*|\<\|\|\>|\<b-t\>-\<Phi\>\<b-w\>|\<\|\|\>><rsup|2>+<frac|1|2>\<alpha\>\<b-w\><rsup|T>\<b-w\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    We now complete the square over <math|\<b-w\>> \ giving \ 

    <\equation*>
      E(\<b-w\>) = E(\<b-m\><rsub|N> ) +<frac|1|2><around*|(|\<b-w\>\<minus\>
      \<b-m\><rsub|N>|)><rsup|T>A(\<b-w\>\<minus\> \<b-m\><rsub|N>)
    </equation*>

    where we have introduced \ 

    <\equation>
      A = \<alpha\>I + \<beta\>\<Phi\><rsup|T>\<Phi\><label|3.81>
    </equation>

    together with \ 

    <\equation*>
      E(\<b-m\><rsub|N> ) =<frac|\<beta\>|2>\<\|\|\>\<b-t\> \<minus\>
      \<Phi\>\<b-m\><rsub|N>\<\|\|\><rsup|2>
      +<frac|\<alpha\>|2>\<b-m\><rsup|T><rsub|N>\<b-m\><rsub|N>.\ 
    </equation*>

    \;
  </hidden>|<\hidden>
    Note that A corresponds to the matrix of second derivatives of the error
    function\ 

    <\equation*>
      A = \<nabla\>\<nabla\>E(\<b-w\>)
    </equation*>

    and is known as the <em|Hessian matrix>.

    <\equation>
      \<b-m\><rsub|N> =\<beta\>A<rsup|\<minus\>1>\<Phi\><rsup|T>\<b-t\>.<label|3.84>
    </equation>

    Using Eq. <eqref|3.54>, we see that\ 

    <\equation*>
      A = S<rsub|N><rsup|-1>
    </equation*>

    and hence Eq. <eqref|3.84> is equivalent to the previous definition
    <eqref|3.53>, and therefore represents the mean of the posterior
    distribution.

    \;
  </hidden>|<\hidden>
    The integral over <math|\<b-w\>> can now be evaluated simply by appealing
    to the standard result for the normalization coefficient of a
    multivariate Gaussian, giving

    <\eqnarray*>
      <tformat|<table|<row|<cell|<big|int>exp<around*|{|-E<around*|(|\<b-w\>|)>|}>\<mathd\>\<b-w\>>|<cell|=>|<cell|exp<around*|{|-E<around*|(|\<b-m\><rsub|N>|)>|}><big|int>exp<around*|{|-<frac|1|2><around*|(|\<b-w\>-\<b-m\><rsub|N>|)><rsup|T>A<around*|(|\<b-w\>-\<b-m\><rsub|N>|)>|}>\<mathd\>\<b-w\>>>|<row|<cell|>|<cell|=>|<cell|exp<around*|{|-E<around*|(|\<b-m\><rsub|N>|)>|}><around*|(|2\<pi\>|)><rsup|M/2><around*|\||A|\|><rsup|-1/2>>>>>
    </eqnarray*>

    Using Eq. <eqref|3.78> we can then write the log of the marginal
    likelihood in the form

    <\equation>
      ln p<around*|(|\<b-t\>\|\<alpha\>,\<beta\>|)>=<frac|M|2>ln\<alpha\>+<frac|N|2>ln\<beta\>-E<around*|(|\<b-m\><rsub|N>|)>-<frac|1|2>ln<around*|\||A|\|>-<frac|N|2>ln<around*|(|2\<pi\>|)><label|3.86>
    </equation>

    which is the required expression for the evidence function.
  </hidden>|<\hidden>
    <tit|Polynomial regression problem>

    Returning to the polynomial regression problem, we can plot the model
    evidence against the order of the polynomial, as shown in Figure 3.14.

    Here we have assumed a prior of the form\ 

    <\equation*>
      p(\<b-w\>\|\<alpha\>) = N (\<b-w\>\|0, \<alpha\><rsup|\<minus\>1>I)
    </equation*>

    with the parameter <math|\<alpha\>> fixed at <math|\<alpha\> = 5
    \<times\> 10<rsup|\<minus\>3>>.\ 
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_3_14_model_evidence_regression.png|.5par|||>|Plot
      of the model evidence versus \ the order <math|M>, for the polynomial
      regression model, showing that the evidence favours the model with
      <math|M = 3>.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Maximizing the evidence function>

    Let us first consider the maximization of <math|p(\<b-t\>\|\<alpha\>,
    \<beta\>)> with respect to <math|\<alpha\>>. This can be done by first
    defining the following eigenvector equation\ 

    <\equation>
      \ (\<beta\>\<Phi\><rsup|T>\<Phi\>) \<b-u\><rsub|i>=
      \<lambda\><rsub|i>\<b-u\><rsub|i>.<label|3.87>
    </equation>

    From Eq. <eqref|3.81>, it then follows that <math|A> has eigenvalues
    <math|\<alpha\> + \<lambda\><rsub|i>>.

    <\eqnarray*>
      <tformat|<table|<row|<cell|ln p<around*|(|\<b-t\>\|\<alpha\>,\<beta\>|)>>|<cell|=>|<cell|<with|color|blue|<frac|M|2>ln\<alpha\>>+<frac|N|2>ln\<beta\><with|color|blue|-E<around*|(|\<b-m\><rsub|N>|)>><with|color|blue|-<frac|1|2>ln<around*|\||A|\|>>-<frac|N|2>ln<around*|(|2\<pi\>|)>>>|<row|<cell|<frac|\<mathd\>|\<mathd\>\<alpha\>>ln
      p<around*|(|\<b-t\>\|\<alpha\>,\<beta\>|)>>|<cell|=>|<cell|<frac|M|2\<alpha\>>-<frac|\<mathd\>|\<mathd\>\<alpha\>><around*|(|<frac|\<beta\>|2>\<\|\|\>\<b-t\>
      \<minus\> \<Phi\>\<b-m\><rsub|N>\<\|\|\><rsup|2>
      +<frac|\<alpha\>|2>\<b-m\><rsup|T><rsub|N>\<b-m\><rsub|N>|)>-<frac|1|2><frac|\<mathd\>|\<mathd\>\<alpha\>><around*|[|ln<big|prod><rsub|i><around*|(|\<lambda\><rsub|i>+\<alpha\>|)>|]>>>|<row|<cell|0>|<cell|=>|<cell|<frac|M|2\<alpha\>>-<frac|1|2>\<b-m\><rsup|T><rsub|N>\<b-m\><rsub|N>-<frac|1|2><big|sum><rsub|i><frac|1|\<lambda\><rsub|i>+\<alpha\>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    Multiplying through by <math|2\<alpha\>> and rearranging, we obtain \ 

    <\equation>
      \<alpha\>\<b-m\><rsub|N><rsup|T>\<b-m\><rsub|N>=M\<minus\>\<alpha\><big|sum><rsub|i=1><rsup|M><frac|1|\<lambda\><rsub|i>+\<alpha\>>=\<gamma\><label|3.90>
    </equation>

    Since there are <math|M> terms in the sum over <math|i>, the quantity
    <math|\<gamma\>> can be written \ 

    <\equation>
      \<gamma\>= <big|sum><rsub|i><frac|\<lambda\><rsub|i>|\<alpha\> +
      \<lambda\><rsub|i>> <label|3.91>
    </equation>

    The interpretation of the quantity <math|\<gamma\>> will be discussed
    shortly. From Eq. <eqref|3.90> we see that the value of <math|\<alpha\>>
    that maximizes the marginal likelihood satisfies \ 

    <\equation>
      \<alpha\>= <frac|\<gamma\>|\<b-m\><rsub|N><rsup|T>\<b-m\><rsub|N>><label|3.92>
    </equation>

    <\folded>
      Note...
    <|folded>
      \;

      This is an implicit solution for <math|\<alpha\>> not only because
      <math|\<gamma\>> depends on <math|\<alpha\>>, but also because the mode
      <math|\<b-m\><rsub|N>> of the posterior distribution itself depends on
      the choice of <math|\<alpha\>>. We therefore adopt an iterative
      procedure in which we make an initial choice for <math|\<alpha\>> and
      use this to find <math|\<b-m\><rsub|N>> , which is given by Eq.
      <eqref|3.53>, and also to evaluate <math|\<gamma\>>, which is given by
      Eq. <eqref|3.91>. These values are then used to re-estimate
      <math|\<alpha\>> using Eq. <eqref|3.92>, and the process repeated until
      convergence. Note that because the matrix <math|\<Phi\><rsup|T>\<Phi\>>
      is fixed, we can compute its eigenvalues once at the start and then
      simply multiply these by <math|\<beta\>> to obtain the
      <math|\<lambda\><rsub|i>>.

      It should be emphasized that the value of \<alpha\> has been determined
      purely by looking at the training data. In contrast to maximum
      likelihood methods, no independent data set is required in order to
      optimize the model complexity.
    </folded>
  </hidden>|<\hidden>
    We can similarly maximize the log marginal likelihood <eqref|3.86> with
    respect to <math|\<beta\>>. To do this, we note that the eigenvalues
    <math|\<lambda\><rsub|i>> defined by Eq. <eqref|3.87> are proportional to
    <math|\<beta\>>, and hence <math|d\<lambda\><rsub|i>/d\<beta\> =
    \<lambda\><rsub|i>/\<beta\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|ln p<around*|(|\<b-t\>\|\<alpha\>,\<beta\>|)>>|<cell|=>|<cell|<with|color|blue|<frac|M|2>ln\<alpha\>>+<frac|N|2>ln\<beta\><with|color|blue|-E<around*|(|\<b-m\><rsub|N>|)>><with|color|blue|-<frac|1|2>ln<around*|\||A|\|>>-<frac|N|2>ln<around*|(|2\<pi\>|)>>>|<row|<cell|<frac|\<mathd\>|\<mathd\>\<beta\>>ln
      p<around*|(|\<b-t\>\|\<alpha\>,\<beta\>|)>>|<cell|=>|<cell|<frac|N|2\<beta\>>-<frac|\<mathd\>|\<mathd\>\<beta\>><around*|(|<frac|\<beta\>|2>\<\|\|\>\<b-t\>
      \<minus\> \<Phi\>\<b-m\><rsub|N>\<\|\|\><rsup|2>
      +<frac|\<alpha\>|2>\<b-m\><rsup|T><rsub|N>\<b-m\><rsub|N>|)>-<frac|1|2><dfrac|\<mathd\>|\<mathd\>\<beta\>><big|sum><rsub|i>ln<around*|(|\<lambda\><rsub|i>+\<alpha\>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|N|2\<beta\>>-<frac|1|2><with|color|blue|\<\|\|\>\<b-t\>
      \<minus\> \<Phi\>\<b-m\><rsub|N>\<\|\|\><rsup|2>>
      -<frac|1|2\<beta\>><with|color|red|<big|sum><rsub|i><around*|(|<frac|\<lambda\><rsub|i>|\<lambda\><rsub|i>+\<alpha\>>
      |)>>>>|<row|<cell|0>|<cell|=>|<cell|<frac|N|2\<beta\>>-<frac|1|2><with|color|blue|<big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n>-\<b-m\><rsub|N><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>|}><rsup|2>>
      -<frac|<with|color|red|\<gamma\>>|2\<beta\>>>>|<row|<cell|\<beta\><rsup|-1>>|<cell|=>|<cell|<frac|1|N-\<gamma\>><big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n>-\<b-m\><rsub|N><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>|}><rsup|2><eq-number><label|3.95>>>>>
    </eqnarray*>

    <\folded>
      ...
    <|folded>
      \ \ Again, this is an implicit solution for <math|\<beta\>> and can be
      solved by choosing an initial value for <math|\<beta\>> and then using
      this to calculate <math|\<b-m\><rsub|N>> and <math|\<gamma\>> and then
      re-estimate <math|\<beta\>> using Eq. <eqref|3.95>, repeating until
      convergence.

      If both <math|\<alpha\>> and <math|\<beta\>> are to be determined from
      the data, then their values can be re-estimated together after each
      update of <math|\<gamma\>>.
    </folded>
  </hidden>|<\hidden>
    <tit|Effective number of parameters>

    The result

    <\equation*>
      \<alpha\>= <frac|\<gamma\>|\<b-m\><rsub|N><rsup|T>\<b-m\><rsub|N>>
    </equation*>

    has an elegant interpretation (MacKay, 1992a), which provides insight
    into the Bayesian solution for <math|\<alpha\>>.

    Consider the contours of the likelihood function and the prior as
    illustrated in Figure <reference|fig3.15>. Here we have implicitly
    transformed to a rotated set of axes in parameter space aligned with the
    eigenvectors <math|\<b-u\><rsub|i>> defined in <eqref|3.87>.

    Contours of the likelihood function are then axis-aligned ellipses. The
    eigenvalues <math|\<lambda\><rsub|i>> measure the curvature of the
    likelihood function, and so in Figure <reference|fig3.15> the eigenvalue
    <math|\<lambda\><rsub|1>> is small compared with
    <math|\<lambda\><rsub|2>> (because a smaller curvature corresponds to a
    greater elongation of the contours of the likelihood function).
  </hidden>|<\hidden>
    Because <math|\<beta\>\<Phi\><rsup|T>\<Phi\>> is a positive definite
    matrix, it will have positive eigenvalues, and so the ratio
    <math|\<lambda\><rsub|i>/(\<lambda\><rsub|i> + \<alpha\>)> will lie
    between 0 and 1.\ 

    Consequently, the quantity

    <\equation*>
      \<gamma\>= <big|sum><rsub|i><frac|\<lambda\><rsub|i>|\<alpha\> +
      \<lambda\><rsub|i>>\ 
    </equation*>

    will lie in the range <math|0\<leqslant\>-\<gamma\>\<leqslant\>M> .\ 

    For directions in which <math|\<lambda\><rsub|i>\<gg\>\<alpha\>>, the
    corresponding parameter <math|w<rsub|i>> will be close to its maximum
    likelihood value, and the ratio <math|\<lambda\><rsub|i>/(\<lambda\><rsub|i>+
    \<alpha\>)> will be close to 1. Such parameters are called well
    determined because their values are tightly constrained by the data.

    Conversely, for directions in which <math|\<lambda\><rsub|i>\<ll\>\<alpha\>>,
    the corresponding parameters wi will be close to zero, as will the ratios
    <math|\<lambda\><rsub|i>/(\<lambda\><rsub|i>+ \<alpha\>)>. These are
    directions in which the likelihood function is relatively insensitive to
    the parameter value and so the parameter has been set to a small value by
    the prior. The quantity <math|\<gamma\>> \ therefore measures the
    effective total number of well determined parameters.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_3_15_contour_liklihood_prior.png|.42par|||>|<label|fig3.15>Contours
      of the likelihood function (red) and the prior (green) in which the
      axes in parameter space have been rotated to align with the
      eigenvectors ui of the Hessian. For <math|\<alpha\> = 0>, the mode of
      the posterior is given by the maximum likelihood solution
      <math|w<rsub|ML>>, whereas for nonzero <math|\<alpha\>> the mode is at
      <math|\<b-w\><rsub|MAP >= \<b-m\><rsub|N>> . In the direction
      <math|w<rsub|1>> the eigenvalue <math|\<lambda\><rsub|1>>, defined by
      Eq. <eqref|3.87>, is small compared with <math|\<alpha\>> and so the
      quantity <math|\<lambda\><rsub|1>/(\<lambda\><rsub|1> + \<alpha\>)> is
      close to zero, and the corresponding MAP value of <math|w<rsub|1>> is
      also close to zero. By contrast, in the direction <math|w<rsub|2>> the
      eigenvalue <math|\<lambda\><rsub|2>> is large compared with
      <math|\<alpha\>> and so the quantity
      <math|\<lambda\><rsub|2>/(\<lambda\><rsub|2> +\<alpha\>)> is close to
      unity, and the MAP value of <math|w<rsub|2>> is close to its maximum
      likelihood value.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|<math|N-\<gamma\>>>

    \;

    We can obtain some insight into the result

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<beta\><rsup|-1>>|<cell|=>|<cell|<frac|1|<with|color|blue|N-\<gamma\>>><big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n>-\<b-m\><rsub|N><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>|}><rsup|2>>>>>
    </eqnarray*>

    for re-estimating <math|\<beta\>> by comparing it with the corresponding
    maximum likelihood result given by <eqref|3.21>. Both of these formulae
    express the variance (the inverse precision) as an average of the squared
    differences between the targets and the model predictions.

    However, they differ in that the number of data points <math|N> in the
    denominator of the maximum likelihood result is replaced by
    <math|N\<minus\>\<gamma\>> in the Bayesian result.

    \;
  </hidden>|<\hidden>
    <tit|Biased estimation>

    \;

    \;

    We recall from (1.56) that the maximum likelihood estimate of the
    variance for a Gaussian distribution over a single variable x is given by
    \ 

    <\equation*>
      \<sigma\><rsub|ML><rsup|2>=<frac|1|N><big|sum><rsub|n=1><rsup|N><around*|(|x<rsub|n>-\<mu\><rsub|ML>|)><rsup|2>
    </equation*>

    and that this estimate is <with|color|blue|biased> because the maximum
    likelihood solution <math|\<mu\><rsub|ML>> for the mean has fitted some
    of the noise on the data.

    \;
  </hidden>|<\hidden>
    \;

    \;

    In effect, this has used up one degree of freedom in the model. The
    corresponding unbiased estimate is given by (1.59) and takes the form \ 

    <\equation*>
      \<sigma\><rsub|MAP><rsup|2>=<frac|1|N-1><big|sum><rsub|n=1><rsup|N><around*|(|x<rsub|n>-\<mu\><rsub|ML>|)><rsup|2>
    </equation*>

    The factor of <math|N \<minus\> 1> in the denominator of the Bayesian
    result takes account of the fact that one degree of freedom has been used
    in fitting the mean and removes the bias of maximum likelihood.
  </hidden>|<\hidden>
    <tit|Corresponding results>

    \;

    Corresponding results for the linear regression model.

    \;

    The mean of the target distribution is now given by the function
    <math|\<b-w\><rsup|T>\<varphi\>(x)>, which contains M parameters.
    However, not all of these parameters are tuned to the data.

    The effective number of parameters that are determined by the data is
    <math|\<gamma\>>, with the remaining <math|M \<minus\>\<gamma\>>
    parameters set to small values by the prior.

    This is reflected in the Bayesian result for the variance that has a
    factor <math|N \<minus\> \<gamma\>> in the denominator, thereby
    correcting for the bias of the maximum likelihood result.
  </hidden>|<\hidden>
    <tit|Example>

    \;

    \;

    \;

    Illustrate the evidence framework for setting hyperparameters using the
    sinusoidal synthetic data set from Section 1.1, together with the
    Gaussian basis function model comprising 9 basis functions, so that the
    total number of parameters in the model is given by <math|M = 10>
    including the bias.

    Here, for simplicity of illustration, we have set <math|\<beta\>> to its
    true value of <math|11.1> and then used the evidence framework to
    determine <math|\<alpha\>>, as shown in Figure <reference|fig3.16>.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_3_16_evidence_maximum.png|.9par|||>|<label|fig3.16>The
      left plot shows <math|\<gamma\>> (red curve) and
      <math|2\<alpha\>E<rsub|W>(\<b-m\><rsub|N>)=\<alpha\>\<b-m\><rsub|N><rsup|T>\<b-m\><rsub|N>>
      (blue curve) versus <math|ln\<alpha\>> for the sinusoidal synthetic
      data set. It is the intersection of these two curves that defines the
      optimum value for <math|\<alpha\>> given by the evidence procedure. The
      right plot shows the corresponding graph of log evidence <math|ln
      p(t\|\<alpha\>, \<beta\>)> versus <math|ln \<alpha\>> (red curve)
      showing that the peak coincides with the crossing point of the curves
      in the left plot. Also shown is the test set error (blue curve) showing
      that the evidence maximum occurs close to the point of best
      generalization.>
    </padded-center>
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    We can also see how the parameter \<alpha\> controls the magnitude of the
    parameters <math|{w<rsub|i>}>, by plotting the individual parameters
    versus the effective number <math|\<gamma\>> of parameters, as shown in
    Figure <inactive|<reference|fig3.17>>.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_3_17_gamma_w_i.png|.5par|||>|Plot of the
      10 parameters <math|w<rsub|i>> \ from the Gaussian basis function model
      versus the effective number of parameters <math|\<gamma\>>, in which
      the hyperparameter <math|\<alpha\>> is varied in the range
      <math|0\<leqslant\>\<alpha\>\<leqslant\>\<infty\>> causing
      <math|\<gamma\>> to vary in the range
      <math|0\<leqslant\>\<gamma\>\<leqslant\>M>.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|<math|N\<gg\>M>>

    If we consider the limit <math|N\<gg\>M> in which the number of data
    points is large in relation to the number of parameters, then from Eq.
    <eqref|3.87> all of the parameters will be well determined by the data
    because <math|\<Phi\><rsup|T>\<Phi\>> involves an implicit sum over data
    points, and so the eigenvalues <math|\<lambda\><rsub|i>> increase with
    the size of the data set.

    In this case, <math|\<gamma\> = M> , and the re-estimation equations for
    <math|\<alpha\>> and <math|\<beta\>> become

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<alpha\>>|<cell|=>|<cell|<frac|M|2E<rsub|W><around*|(|\<b-m\><rsub|N>|)>>>>|<row|<cell|\<beta\>>|<cell|=>|<cell|<frac|N|2E<rsub|D><around*|(|\<b-m\><rsub|N>|)>>>>>>
    </eqnarray*>

    where <math|E<rsub|W>> and <math|E<rsub|D>> are defined by Eq.
    <eqref|3.25>) and <eqref|3.26>, respectively. These results can be used
    as an easy-to-compute approximation to the full evidence re-estimation
    formulae, because they do not require evaluation of the eigenvalue
    spectrum of the Hessian.
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|Limitations of Fixed Basis Functions>
    </padded-center>
  </hidden>|<\hidden>
    There are some significant shortcomings with linear models, which will
    cause us to turn in later chapters to more complex models such as support
    vector machines and neural networks.

    The difficulty stems from the assumption that the basis functions
    <math|\<varphi\><rsub|j>(x)> are fixed before the training data set is
    observed and is a manifestation of the curse of dimensionality discussed
    in Section 1.4.

    As a consequence, the number of basis functions needs to grow rapidly,
    often exponentially, with the dimensionality <math|D> of the input space.

    Fortunately, there are two properties of real data sets that we can
    exploit to help alleviate this problem.

    \;
  </hidden>|<\hidden>
    First of all, the data vectors <math|{x<rsub|n>}> typically lie close to
    a nonlinear manifold whose intrinsic dimensionality is smaller than that
    of the input space as a result of strong correlations between the input
    variables

    If we are using localized basis functions, we can arrange that they are
    scattered in input space only in regions containing data. This approach
    is used in radial basis function networks and also in support vector and
    relevance vector machines.

    Neural network models, which use adaptive basis functions having
    sigmoidal nonlinearities, can adapt the parameters so that the regions of
    input space over which the basis functions vary corresponds to the data
    manifold.

    \;
  </hidden>|<\shown>
    The second property is that target variables may have significant
    dependence on only a small number of possible directions within the data
    manifold.

    Neural networks can exploit this property by choosing the directions in
    input space to which the basis functions respond.
  </shown>>
</body>

<\initial>
  <\collection>
    <associate|info-flag|minimal>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|16:9>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|3.10|<tuple|5|?>>
    <associate|3.11|<tuple|6|?>>
    <associate|3.12|<tuple|7|?>>
    <associate|3.15|<tuple|8|?>>
    <associate|3.21|<tuple|8|?>>
    <associate|3.25|<tuple|10|?>>
    <associate|3.26|<tuple|11|?>>
    <associate|3.27|<tuple|12|?>>
    <associate|3.29|<tuple|13|?>>
    <associate|3.3|<tuple|1|?>>
    <associate|3.30|<tuple|14|?>>
    <associate|3.37|<tuple|15|?>>
    <associate|3.4|<tuple|2|?>>
    <associate|3.49|<tuple|16|?>>
    <associate|3.5|<tuple|3|?>>
    <associate|3.51|<tuple|17|?>>
    <associate|3.52|<tuple|18|?>>
    <associate|3.53|<tuple|19|?>>
    <associate|3.54|<tuple|20|?>>
    <associate|3.57|<tuple|21|?>>
    <associate|3.58|<tuple|22|?>>
    <associate|3.59|<tuple|23|?>>
    <associate|3.62|<tuple|24|?>>
    <associate|3.64|<tuple|25|?>>
    <associate|3.70|<tuple|26|?>>
    <associate|3.74|<tuple|27|?>>
    <associate|3.78|<tuple|28|?>>
    <associate|3.8|<tuple|4|?>>
    <associate|3.81|<tuple|29|?>>
    <associate|3.84|<tuple|30|?>>
    <associate|3.86|<tuple|31|?>>
    <associate|3.87|<tuple|32|?>>
    <associate|3.90|<tuple|33|?>>
    <associate|3.91|<tuple|34|1>>
    <associate|3.92|<tuple|35|1>>
    <associate|3.95|<tuple|36|?>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|7|?>>
    <associate|auto-11|<tuple|8|?>>
    <associate|auto-12|<tuple|9|?>>
    <associate|auto-13|<tuple|10|1>>
    <associate|auto-14|<tuple|11|?>>
    <associate|auto-15|<tuple|4|?>>
    <associate|auto-16|<tuple|12|1>>
    <associate|auto-17|<tuple|13|?>>
    <associate|auto-18|<tuple|5|?>>
    <associate|auto-19|<tuple|14|1>>
    <associate|auto-2|<tuple|1|?>>
    <associate|auto-20|<tuple|15|?>>
    <associate|auto-21|<tuple|16|?>>
    <associate|auto-22|<tuple|17|?>>
    <associate|auto-23|<tuple|6|?>>
    <associate|auto-3|<tuple|2|?>>
    <associate|auto-4|<tuple|3|?>>
    <associate|auto-5|<tuple|4|?>>
    <associate|auto-6|<tuple|2|?>>
    <associate|auto-7|<tuple|5|1>>
    <associate|auto-8|<tuple|6|?>>
    <associate|auto-9|<tuple|3|1>>
    <associate|fig3.1|<tuple|1|?>>
    <associate|fig3.12|<tuple|12|1>>
    <associate|fig3.13|<tuple|13|?>>
    <associate|fig3.15|<tuple|15|?>>
    <associate|fig3.16|<tuple|16|?>>
    <associate|fig3.8|<tuple|8|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||Examples of basis
      functions, showing polynomials on the left, Gaussians of the form
      (<reference|3.4>) in the centre, and sigmoidal of the form
      (<reference|3.5>) on the right.>|<pageref|auto-2>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|2>||Geometrical
      interpretation of the least-squares \ solution, in an N-dimensional
      space whose axes are the values of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|t<rsub|1>,
      . . . , t<rsub|N>>> . The least-squares regression function is obtained
      by finding the orthogonal projection of the data vector
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|t>>
      onto the subspace spanned by the basis functions
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<varphi\><rsub|j>(\<b-x\>)>>
      in which each basis function is viewed as a vector
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<varphi\><rsub|j>>>
      of length N with elements <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<varphi\><rsub|j>(\<b-x\><rsub|n>)>>.>|<pageref|auto-3>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3>||Contours of the
      regularization term in Eq. (<reference|3.29>) for various values of the
      parameter q.>|<pageref|auto-4>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4>|>
        Plot of the contours of the unregularized error function (blue) along
        with the constraint region (<reference|3.30>) for the quadratic
        regularizer <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|q
        = 2>> on the left and the lasso regularizer
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|q
        = 1>> on the right, in which the optimum value for the parameter
        vector <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<b-w\>>>
        is denoted by <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<b-w\><rsup|\<ast\>>>>
        . The lasso gives a sparse solution in which
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|w<rsub|1><rsup|\<ast\>>=
        0>>.
      </surround>|<pageref|auto-5>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5>|>
        Illustration of the dependence of bias and variance on model
        complexity, governed by a regularization parameter
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<lambda\>>>,
        using the sinusoidal data set from Chapter 1. There are L=100 data
        sets, each having N=25 data points, and there are 24 Gaussian basis
        functions in the model so that the total number of parameters is M =
        25 including the bias parameter. The left column shows the result of
        fitting the model to the data sets for various values of ln
        \<lambda\> (for clarity, only 20 of the 100 fits are shown). The
        right column shows the corresponding average of the 100 fits (red)
        along with the sinusoidal function from which the data sets were
        generated (green).
      </surround>|<pageref|auto-7>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|6>||Plot of squared
      bias and variance, \ together with their sum, corresponding to the
      results shown in Figure 3.5. Also shown is the average test set error
      for a test data set size of 1000 points. The minimum value of
      (bias)<with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<rsup|2>>>
      + variance occurs around <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|ln
      \<lambda\> = \<minus\>0.31>>, which is close to the value that gives
      the minimum error on the test data.>|<pageref|auto-8>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|7>||Illustration of
      sequential Bayesian learning for a simple linear model of the
      form<with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|
      y(x, w) = \ w<rsub|0>+w<rsub|1>x>>. A detailed description of this
      figure is given in the text.>|<pageref|auto-10>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|8>||Examples of the
      predictive distribution (<reference|3.58>) for a model consisting of 9
      Gaussian basis functions of the form (<reference|3.4>) using the
      synthetic sinusoidal data set of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|sin<around*|(|2\<pi\>x|)>>>.>|<pageref|auto-11>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|9>||Plots of the
      function <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|y(x,
      w)>> using samples from the posterior distributions over
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|w>>
      corresponding to the plots in Figure
      <reference|fig3.8>.>|<pageref|auto-12>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|10>||The equivalent
      kernel <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|k(x,
      x\<prime\>)>> for the Gaussian basis functions in Figure
      <reference|fig3.1>, shown as \ a plot of
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|x>>
      versus <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|x\<prime\>>>,
      together with three slices through this matrix corresponding to three
      different values of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|x>>.
      The data set used to generate this kernel comprised 200 values of
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|x>>
      equally spaced over the interval <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|(\<minus\>1,
      1)>>.>|<pageref|auto-13>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|11>||Examples of
      equivalent kernels <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|k(x,
      x\<prime\>)>> for <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|x
      = 0>> \ plotted as a function of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|x\<prime\>>>,
      corresponding (left) to the polynomial basis functions and (right) to
      the sigmoidal basis functions shown in Figure <reference|fig3.1>. Note
      that these are localized functions of
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|x\<prime\>>>
      even though the corresponding basis functions are
      nonlocal.>|<pageref|auto-14>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|12>||We can obtain a
      rough approximation to \ the model evidence if we assume that the
      posterior distribution over parameters is sharply peaked around its
      mode \ <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|w<rsub|MAP>>>.>|<pageref|auto-16>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|13>||Schematic
      illustration of the \ distribution of data sets for three models of
      different complexity, in which <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<cal-M\><rsub|1>>>
      is the simplest and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<cal-M\><rsub|3>>>
      is the most complex. Note that the distributions are normalized. In
      this example, for the particular observed data set
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<cal-D\><rsub|0>>>,
      the model <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<cal-M\><rsub|2>>>
      with intermediate complexity has the largest
      evidence.>|<pageref|auto-17>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|14>||Plot of the model
      evidence versus \ the order <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|M>>,
      for the polynomial regression model, showing that the evidence favours
      the model with <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|M
      = 3>>.>|<pageref|auto-19>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|15>||Contours of the
      likelihood function (red) and the prior (green) in which the axes in
      parameter space have been rotated to align with the eigenvectors ui of
      the Hessian. For <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<alpha\>
      = 0>>, the mode of the posterior is given by the maximum likelihood
      solution <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|w<rsub|ML>>>,
      whereas for nonzero <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<alpha\>>>
      the mode is at <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<b-w\><rsub|MAP
      >= \<b-m\><rsub|N>>> . In the direction
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|w<rsub|1>>>
      the eigenvalue <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<lambda\><rsub|1>>>,
      defined by Eq. (<reference|3.87>), is small compared with
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<alpha\>>>
      and so the quantity <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<lambda\><rsub|1>/(\<lambda\><rsub|1>
      + \<alpha\>)>> is close to zero, and the corresponding MAP value of
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|w<rsub|1>>>
      is also close to zero. By contrast, in the direction
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|w<rsub|2>>>
      the eigenvalue <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<lambda\><rsub|2>>>
      is large compared with <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<alpha\>>>
      and so the quantity <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<lambda\><rsub|2>/(\<lambda\><rsub|2>
      +\<alpha\>)>> is close to unity, and the MAP value of
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|w<rsub|2>>>
      is close to its maximum likelihood value.>|<pageref|auto-20>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|16>||The left plot
      shows <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<gamma\>>>
      (red curve) and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|2\<alpha\>E<rsub|W>(\<b-m\><rsub|N>)=\<alpha\>\<b-m\><rsub|N><rsup|T>\<b-m\><rsub|N>>>
      (blue curve) versus <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|ln\<alpha\>>>
      for the sinusoidal synthetic data set. It is the intersection of these
      two curves that defines the optimum value for
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<alpha\>>>
      given by the evidence procedure. The right plot shows the corresponding
      graph of log evidence <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|ln
      p(t\|\<alpha\>, \<beta\>)>> versus <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|ln
      \<alpha\>>> (red curve) showing that the peak coincides with the
      crossing point of the curves in the left plot. Also shown is the test
      set error (blue curve) showing that the evidence maximum occurs close
      to the point of best generalization.>|<pageref|auto-21>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|17>||Plot of the 10
      parameters <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|w<rsub|i>>>
      \ from the Gaussian basis function model versus the effective number of
      parameters <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<gamma\>>>,
      in which the hyperparameter <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<alpha\>>>
      is varied in the range <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|0\<leqslant\>\<alpha\>\<leqslant\>\<infty\>>>
      causing <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<gamma\>>>
      to vary in the range <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|0\<leqslant\>\<gamma\>\<leqslant\>M>>.>|<pageref|auto-22>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Linear
      Basis Function Models> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Bias-Variance Decomposition> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Bayesian
      Linear Regression> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Bayesian
      Model Comparison> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>The
      Evidence Approximation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Limitations
      of Fixed Basis Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>