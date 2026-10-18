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
      \<minus\> \<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>)|}><rsup|2>>>|<row|<cell|<frac|1|\<beta\><rsub|ML>>>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n>-\<b-w\><rsub|ML><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>|}><rsup|2>>>>>
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

    <\equation*>
      \ E<rsub|W> (\<b-w\>) =<frac|1|2>\<b-w\><rsup|T>\<b-w\>
    </equation*>
  </hidden>|<\hidden>
    If we also consider the sum-of-squares error function given by \ 

    <\equation*>
      E<rsub|D>(\<b-w\>) =<frac|1|2><big|sum><rsub|n=1><rsup|N><around*|{|t<rsub|n>-\<b-varphi\><around*|(|\<b-x\><rsub|n>|)><rsup|T>\<b-w\>|}><rsup|2>
    </equation*>

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

    <\equation*>
      p(\<b-w\>\|\<alpha\>)=N (\<b-w\>\|\<b-0\>, \<alpha\><rsup|\<minus\>1>I)
    </equation*>

    \ \ and the corresponding posterior distribution over <math|\<b-w\>> is
    then given by Eq. <eqref|3.49> with \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-m\><rsub|N>>|<cell|=>|<cell|\<beta\>S<rsub|N>\<Phi\><rsup|T>\<b-t\><eq-number><label|3.53>>>|<row|<cell|S<rsub|N><rsup|-1>>|<cell|=>|<cell|\<alpha\>I+\<beta\>\<Phi\><rsup|T>\<Phi\>>>>>
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
  </hidden>|<\shown>
    <\padded-center>
      <small-figure|<image|image/fig_3_10_equivalent_kernel.png|.9par|||>|The
      equivalent kernel <math|k(x, x\<prime\>)> for the Gaussian basis
      functions in Figure <reference|fig3.1>, shown as \ a plot of <math|x>
      versus <math|x\<prime\>>, together with three slices through this
      matrix corresponding to three different values of <math|x>. The data
      set used to generate this kernel comprised 200 values of <math|x>
      equally spaced over the interval <math|(\<minus\>1, 1)>.>
    </padded-center>
  </shown>|<\hidden>
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
    \;
  </hidden>>
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
    <associate|3.27|<tuple|9|?>>
    <associate|3.29|<tuple|10|?>>
    <associate|3.3|<tuple|1|?>>
    <associate|3.30|<tuple|11|?>>
    <associate|3.37|<tuple|12|?>>
    <associate|3.4|<tuple|2|?>>
    <associate|3.49|<tuple|13|?>>
    <associate|3.5|<tuple|3|?>>
    <associate|3.51|<tuple|14|?>>
    <associate|3.53|<tuple|15|?>>
    <associate|3.57|<tuple|16|?>>
    <associate|3.58|<tuple|17|?>>
    <associate|3.59|<tuple|18|?>>
    <associate|3.62|<tuple|19|?>>
    <associate|3.64|<tuple|20|?>>
    <associate|3.8|<tuple|4|?>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|7|?>>
    <associate|auto-11|<tuple|8|?>>
    <associate|auto-12|<tuple|9|?>>
    <associate|auto-13|<tuple|10|?>>
    <associate|auto-14|<tuple|11|?>>
    <associate|auto-15|<tuple|4|?>>
    <associate|auto-2|<tuple|1|?>>
    <associate|auto-3|<tuple|2|?>>
    <associate|auto-4|<tuple|3|?>>
    <associate|auto-5|<tuple|4|?>>
    <associate|auto-6|<tuple|2|?>>
    <associate|auto-7|<tuple|5|1>>
    <associate|auto-8|<tuple|6|?>>
    <associate|auto-9|<tuple|3|1>>
    <associate|fig3.1|<tuple|1|?>>
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
    </associate>
  </collection>
</auxiliary>