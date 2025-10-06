<TeXmacs|2.1.1>

<style|<tuple|beamer|manila-paper>>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <doc-data|<doc-title|Kernel Methods>>
  </hidden>|<\hidden>
    <tit|Parametric model>

    In Chapters 3 and 4, we considered linear parametric models for
    regression and classification in which the form of the mapping
    <math|y(x,w)> from input <math|x> to output <math|y> is governed by a
    vector <math|w> of adaptive parameters.\ 

    During the learning phase, a set of training data is used either to
    obtain a point estimate of the parameter vector or to determine a
    posterior distribution over this vector.\ 

    The training data is then discarded, and predictions for new inputs are
    based purely on the learned parameter vector <math|w>.\ 

    This approach is also used in nonlinear parametric models such as neural
    networks.
  </hidden>|<\hidden>
    <tit|memory-based methods>

    <\itemize-dot>
      <item>There is a class of pattern recognition techniques, in which the
      training data points, or a subset of them, are kept and used also
      during the prediction phase.\ 

      <item>For instance, the Parzen probability density model comprised a
      linear combination of `kernel' functions each one centred on one of the
      training data points.

      <item>Similarly, in Section 2.5.2 we introduced a simple technique for
      classification called nearest neighbours, which involved assigning to
      each new test vector the same label as the closest example from the
      training set.\ 

      <item>These are examples of memory-based methods that involve storing
      the entire training set in order to make predictions for future data
      points. They typically require a metric to be defined that measures the
      similarity of any two vectors in input space, and are generally fast to
      `train' but slow at making predictions for test data points.\ 
    </itemize-dot>

    \;
  </hidden>|<\hidden>
    <tit|Dual representation>

    Many linear parametric models can be re-cast into an equivalent `dual
    representation' in which the predictions are also based on linear
    combinations of a kernel function evaluated at the training data points.
    As we shall see, for models which are based on a fixed nonlinear feature
    space mapping <math|\<varphi\>(x)>, the kernel function is given by the
    relation

    <\equation>
      k(x, x<rprime|'>) = \<varphi\>(x)<rsup|T>\<varphi\>(x<rprime|'>).<label|6.1>
    </equation>

    From this definition, we see that the kernel is a symmetric function of
    its arguments so that

    <\equation*>
      k(x, x<rprime|'>) = k(x<rprime|'>, x).
    </equation*>
  </hidden>|<\hidden>
    <\itemize-dot>
      <item>The simplest example of a kernel function is obtained by
      considering the identity mapping for the feature space in so that
      <math|\<varphi\>(x) = x>, in which case <math|k(x, x<rprime|'>) =
      x<rsup|T>x<rprime|'>>. We shall refer to this as the linear kernel.\ 

      <item>The concept of a kernel formulated as an inner product in a
      feature space allows us to build interesting extensions of many
      well-known algorithms by making use of the <strong|kernel trick>, also
      known as <strong|kernel substitution>. The general idea is that, if we
      have an algorithm formulated in such a way that the input vector x
      enters only in the form of scalar products, then we can replace that
      scalar product with some other choice of kernel.

      <item>There are numerous forms of kernel functions in common use, and
      we shall encounter several examples in this chapter. Many have the
      property of being a function only of the difference between the
      arguments, so that <math|k(x, x<rprime|'>) = k(x \<minus\>
      x<rprime|'>)>, which are known as <strong|stationary kernels> because
      they are invariant to translations in input space. A further
      specialization involves <strong|homogeneous kernels>, also known as
      <strong|radial basis functions>, which depend only on the magnitude of
      the distance (typically Euclidean) between the arguments so that
      <math|k(x, x<rprime|'>) = k( x \<minus\> x<rprime|'>)>.
    </itemize-dot>
  </hidden>|<\hidden>
    Here we consider a linear regression model whose parameters are
    determined by minimizing a regularized sum-of-squares error function
    given by\ 

    <\equation*>
      J<around*|(|w|)>=<frac|1|2><big|sum><rsub|n=1><rsup|N><around*|{|w<rsup|T>\<varphi\><around*|(|x<rsub|n>|)>-t<rsub|n>|}><rsup|2>+<frac|\<lambda\>|2>w<rsup|T>w
    </equation*>

    where <math|\<lambda\>\<geqslant\>0>. Set the gradient of <math|J(w)>
    with respect to w equal to zero, the solution for <math|w> takes the form
    of a linear combination of the vectors <math|\<varphi\>(x<rsub|n>)>, with
    coefficients that are functions of <math|w>,

    <\equation*>
      \<b-w\>=-<frac|1|\<lambda\>><big|sum><rsub|n=1><rsup|N><around*|{|\<b-w\><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>-t<rsub|n>|}>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>=<big|sum><rsub|n=1><rsup|N>a<rsub|n>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>=\<Phi\><rsup|T>\<b-a\>
    </equation*>

    where <math|\<Phi\>> is the design matrix, whose nth row is given by
    <math|\<b-varphi\>(x<rsub|n>)<rsup|T>>. Here the vector\ 

    <math|a = (a<rsub|1>,\<cdots\>,a<rsub|N>)<rsup|T>>, and

    <\equation*>
      a<rsub|n>=-<frac|1|\<lambda\>><around*|{|\<b-w\><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>-t<rsub|n>|}>.
    </equation*>
  </hidden>|<\hidden>
    Instead of working with the parameter vector <math|w>, we can now
    reformulate the least-squares algorithm in terms of the parameter vector
    <math|a>, giving rise to a <strong|dual representation>. If we substitute
    <math|w = \<Phi\><rsup|T>a> into <math|J(w)>, we obtain

    <\equation*>
      J<around*|(|\<b-a\>|)>=<frac|1|2>\<b-a\><rsup|T>\<Phi\>\<Phi\><rsup|T>\<Phi\>\<Phi\><rsup|T>\<b-a\>-\<b-a\><rsup|T>\<b-Phi\>\<b-Phi\><rsup|T><math-bf|t>+<frac|1|2>\<b-t\><rsup|T>\<b-t\>+<frac|\<lambda\>|2>\<b-a\><rsup|T>\<b-Phi\>\<b-Phi\><rsup|T>\<b-a\>
    </equation*>

    where <math|t = (t<rsub|1>,\<cdots\>,t<rsub|N>)<rsup|T>>. We now define
    the Gram matrix <math|K = \<Phi\>\<Phi\><rsup|T>>, which is an
    <math|N\<times\>N> symmetric matrix with elements

    <\equation*>
      K<rsub|n m>= \<b-varphi\>(\<b-x\><rsub|n>)<rsup|T>\<b-varphi\>(\<b-x\><rsub|m>)
      = k(\<b-x\><rsub|n>, \<b-x\><rsub|m>)
    </equation*>

    where we have introduced the kernel function <math|k(x, x<rprime|'>)>
    defined by Eq. <eqref|6.1>. In terms of the Gram matrix, the
    sum-of-squares error function can be written as\ 

    <\equation*>
      J (\<b-a\>) = <frac|1|2> \<b-a\><rsup|T> K K\<b-a\>
      \<minus\>\<b-a\><rsup|T>K\<b-t\> + <frac|1|2>\<b-t\><rsup|T>
      \<b-t\>+<frac|\<lambda\>|2> \<b-a\><rsup|T> K\<b-a\>.
    </equation*>
  </hidden>|<\hidden>
    Setting the gradient of <math|J(\<b-a\>)> with respect to <math|\<b-a\>>
    to zero, we obtain the following solution\ 

    <\equation*>
      \<b-a\> = (K + \<lambda\>I<rsub|N> )<rsup|\<minus\>1 >\<b-t\>.
    </equation*>

    If we substitute this back into the linear regression model, we obtain
    the following prediction for a new input <math|x>

    <\equation*>
      y(\<b-x\>) = \<b-w\><rsup|T>\<b-varphi\>(\<b-x\>)=\<b-a\><rsup|T>\<Phi\>\<b-varphi\>(\<b-x\>)=\<b-k\>(\<b-x\>)<rsup|T>(K+\<lambda\>I<rsub|N>)<rsup|\<minus\>1>\<b-t\>
    </equation*>

    where we have defined the vector <math|\<b-k\>(\<b-x\>)> with elements
    <math|k<rsub|n>(\<b-x\>) = k(\<b-x\><rsub|n>, \<b-x\>)>. Thus we see that
    the dual formulation allows the solution to the least-squares problem to
    be expressed entirely in terms of the kernel function <math|k(\<b-x\>,
    \<b-x\><rprime|'>)>. This is known as a dual formulation because, by
    noting that the solution for <math|\<b-a\>> can be expressed as a linear
    combination of the elements of <math|\<varphi\>(x)>, we recover the
    original formulation in terms of the parameter vector <math|\<b-w\>>.
    Note that the prediction at <math|\<b-x\>> is given by a linear
    combination of the target values from the training set. In fact, we have
    already obtained this result, using a slightly different notation, in
    Section 3.3.3.
  </hidden>|<\hidden>
    \;

    <\itemize-dot>
      <item>In the dual formulation, we determine the parameter vector a by
      inverting an<math| N \<times\> N> matrix, whereas in the original
      parameter space formulation we had to invert an <math|M \<times\> M>
      matrix in order to determine w.

      <item>Because <math|N> is typically much larger than M, the dual
      formulation does not seem to be particularly useful. However, the
      advantage of the dual formulation, as we shall see, is that it is
      expressed entirely in terms of the kernel function <math|k(x,x')>.\ 

      <item>We can therefore work directly in terms of kernels and avoid the
      explicit introduction of the feature vector <math|\<varphi\>(x)>, which
      allows us implicitly to use feature spaces of high, even infinite,
      dimensionality.
    </itemize-dot>
  </hidden>|<\shown>
    <tit|Constructing Kernels>

    \;
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
    <associate|6.1|<tuple|1|1|../../../../.TeXmacs/texts/scratch/no_name_12.tm>>
  </collection>
</references>