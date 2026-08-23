<TeXmacs|2.1>

<style|<tuple|book|granite>>

<\body>
  <chapter|Continuous Latent Variables>

  In Chapter 9, we discussed probabilistic models having discrete latent
  variables, such as the mixture of Gaussians. We now explore models in which
  some, or all, of the latent variables are continuous. An important
  motivation for such models is that many data sets have the property that
  the data points all lie close to a manifold of much lower dimensionality
  than that of the original data space. To see why this might arise, consider
  an artificial data set constructed by taking one of the off-line Appendix A
  digits, represented by a 64\<times\>64 pixel grey-level image, and
  embedding it in a larger \ image of size 100\<times\>100 by padding with
  pixels having the value zero (corresponding to white pixels) in which the
  location and orientation of the digit is varied at random, as illustrated
  in Figure <inactive|<hybrid|eqref|12.1>>. Each of the resulting images is
  represented by a point in the 100\<times\>100=10,000-dimensional data
  space. However, across a data set of such images, there are only three
  <em|degrees of freedom> of variability, corresponding to the vertical and
  horizontal translations and the rotations. The data points will therefore
  live on a subspace of the data space whose <em|intrinsic dimensionality> is
  three. Note that the manifold will be nonlinear because, for instance, if
  we translate the digit past a particular pixel, that pixel value will go
  from zero (white) to one (black) and back to zero again, which is clearly a
  nonlinear function of the digit position. In this example, the translation
  and rotation parameters are latent variables because we observe only the
  image vectors and are not told which values of the translation or rotation
  variables were used to create them.

  <\padded-center>
    <small-figure|<image|image/fig_12_1_digit.png|.9par|||>|A synthetic data
    set obtained by taking one of the off-line digit images and creating
    multiple copies in each of which the digit has undergone a random
    displacement and rotation within some larger image field. The resulting
    images each have 100\<times\>100=10,000 pixels.>
  </padded-center>

  For real digit image data, there will be a further degree of freedom
  arising from scaling. Moreover there will be multiple additional degrees of
  freedom associated with more complex deformations due to the variability in
  an individual's writing as well as the differences in writing styles
  between individuals. Nevertheless, the number of such degrees of freedom
  will be small compared to the dimensionality of the data set.

  Another example is provided by the oil flow data set, in which (for a given
  geometrical configuration of the gas, water, and oil phases) there are only
  two degrees of freedom of variability corresponding to the fraction of oil
  in the pipe and the fraction of water (the fraction of gas then being
  determined). Although the data space comprises 12 measurements, a data set
  of points will lie close to a two-dimensional manifold embedded within this
  space. In this case, the manifold comprises several distinct segments
  corresponding to different flow regimes, each such segment being a (noisy)
  continuous two-dimensional manifold. If our goal is data compression, or
  density modelling, then there can be benefits in exploiting this manifold
  structure.

  In practice, the data points will not be confined precisely to a smooth
  lowdimensional manifold, and we can interpret the departures of data points
  from the manifold as `noise'. This leads naturally to a generative view of
  such models in which we first select a point within the manifold according
  to some latent variable distribution and then generate an observed data
  point by adding noise, drawn from some conditional distribution of the data
  variables given the latent variables.

  The simplest continuous latent variable model assumes Gaussian
  distributions for both the latent and observed variables and makes use of a
  linear-Gaussian dependence of the observed variables on the state of the
  latent variables. This leads \ to a probabilistic formulation of the
  well-known technique of principal component analysis (PCA), as well as to a
  related model called factor analysis.

  In this chapter we will begin with a standard, nonprobabilistic treatment
  of PCA, \ and then we show how PCA arises naturally as the maximum
  likelihood solution to a particular form of linear-Gaussian latent variable
  model. This probabilistic reformulation brings many advantages, such as the
  use of EM for parameter estimation, principled extensions to mixtures of
  PCA models, and Bayesian formulations that allow the number of principal
  components to be determined automatically from the data. Finally, we
  discuss briefly several generalizations of the latent variable concept that
  go beyond the linear-Gaussian assumption including non-Gaussian latent
  variables, which leads to the framework of independent component analysis,
  as well as Section 12.4 models having a nonlinear relationship between
  latent and observed variables.

  <section|Principal Component Analysis>

  Principal component analysis, or PCA, is a technique that is widely used
  for applications such as dimensionality reduction, lossy data compression,
  feature extraction, and data visualization (Jolliffe, 2002). It is also
  known as the <em|Karhunen-Lo<math|<wide|e|\<grave\>>>ve> transform.

  There are two commonly used definitions of PCA that give rise to the same
  algorithm. PCA can be defined as the orthogonal projection of the data onto
  a lower dimensional linear space, known as the principal subspace, such
  that the variance of the projected data is maximized (Hotelling, 1933).
  Equivalently, it can be defined as the linear projection that minimizes the
  average projection cost, defined as the mean squared distance between the
  data points and their projections (Pearson, 1901). The process of
  orthogonal projection is illustrated in Figure <reference|fig12.2>. We
  consider each of these definitions in turn.

  <\padded-center>
    <small-figure|<image|image/fig_12_2_pca.png|.3par|||>|<label|fig12.2>Principal
    component analysis seeks a space \ of lower dimensionality, known as the
    principal subspace and denoted by the magenta line, such that the
    orthogonal projection of the data points (red dots) onto this subspace
    maximizes the variance of the projected points (green dots). An
    alternative definition of PCA is based on minimizing the sum-of-squares
    of the projection errors, indicated by the blue lines.>
  </padded-center>

  <subsection|Maximum variance formulation>

  Consider a data set of observations <math|{\<b-x\><rsub|n>}> where
  <math|n=1,\<cdots\>,N> and <math|\<b-x\><rsub|n>> is a Euclidean variable
  with dimensionality <math|D>. Our goal is to project the data onto a space
  having dimensionality <math|M\<less\>D> while maximizing the variance of
  the projected data. For the moment, we shall assume that the value of
  <math|M> is given. Later in this chapter, we shall consider techniques to
  determine an appropriate value of <math|M> from the data.

  To begin with, consider the projection onto a one-dimensional space
  <math|(M=1)>. We can define the direction of this space using a
  D-dimensional vector <math|\<b-u\><rsub|1>>, which for convenience (and
  without loss of generality) we shall choose to be a unit vector so that
  <math|\<b-u\><rsub|1><rsup|T>\<b-u\><rsub|1>=1> (note that we are only
  interested in the direction defined by <math|\<b-u\><rsub|1>>, not in the
  magnitude of <math|\<b-u\><rsub|1>> itself). Each data point
  <math|\<b-x\><rsub|n>> is then projected onto a scalar value
  <math|\<b-u\><rsub|1><rsup|T>\<b-x\><rsub|n>>. The mean of the projected
  data is <math|\<b-u\><rsub|1><rsup|T><wide|\<b-x\>|\<wide-bar\>>> where
  <wide|<math|\<b-x\>>|\<wide-bar\>> is the sample set mean given by

  <\equation*>
    <wide|\<b-x\>|\<wide-bar\>>=<frac|1|N><big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n>
  </equation*>

  and the variance of the projected data is given by

  <\equation*>
    <frac|1|N><big|sum><rsub|n=1><rsup|N><around*|{|\<b-u\><rsub|1><rsup|T>\<b-x\><rsub|n>-\<b-u\><rsub|1><rsup|T><wide|\<b-x\>|\<wide-bar\>>|}><rsup|2>=\<b-u\><rsub|1><rsup|T>S\<b-u\><rsub|1>
  </equation*>

  where <math|S> is the data covariance matrix defined by

  <\equation*>
    S=<frac|1|N><big|sum><rsub|n=1><rsup|N><around*|(|\<b-x\><rsub|n>-<wide|\<b-x\>|\<wide-bar\>>|)><around*|(|\<b-x\><rsub|n>-<wide|\<b-x\>|\<wide-bar\>>|)><rsup|T>
  </equation*>

  We now maximize the projected variance <math|\<b-u\><rsub|1><rsup|T>S\<b-u\><rsub|1>>
  with respect to <math|\<b-u\><rsub|1>>. Clearly, this has to be a
  constrained maximization to prevent <math|\<\|\|\>\<b-u\><rsub|1>\<\|\|\>\<rightarrow\>\<infty\>>.
  The appropriate constraint comes from the normalization condition
  <math|\<b-u\><rsub|1><rsup|T>\<b-u\><rsub|1>=1>. To enforce this
  constraint, Appendix E we introduce a Lagrange multiplier that we shall
  denote by <math|\<lambda\><rsub|1>>, and then make an unconstrained
  maximization of

  <\equation*>
    \<b-u\><rsub|1><rsup|T>S\<b-u\><rsub|1>+\<lambda\><rsub|1><around*|(|1-\<b-u\><rsub|1><rsup|T>\<b-u\><rsub|1>|)>
  </equation*>

  By setting the derivative with respect to <math|\<b-u\><rsub|1>> equal to
  zero, we see that this quantity will have a stationary point when

  <\equation*>
    S\<b-u\><rsub|1>=\<lambda\><rsub|1>\<b-u\><rsub|1>
  </equation*>

  which says that <math|\<b-u\><rsub|1>> must be an eigenvector of <math|S>.
  If we left-multiply by <math|\<b-u\><rsub|1><rsup|T>> and make use of
  <math|\<b-u\><rsub|1><rsup|T>\<b-u\><rsub|1>=1>, we see that the variance
  is given by

  <\equation*>
    \<b-u\><rsub|1><rsup|T>S\<b-u\><rsub|1>=\<lambda\><rsub|1>
  </equation*>

  and so the variance will be a maximum when we set <math|\<b-u\><rsub|1>>
  equal to the eigenvector having the largest eigenvalue
  <math|\<lambda\><rsub|1>>. This eigenvector is known as the first principal
  component.

  We can define additional principal components in an incremental fashion by
  choosing each new direction to be that which maximizes the projected
  variance amongst all possible directions orthogonal to those already
  considered. If we consider the general case of an M-dimensional projection
  space, the optimal linear projection for which the variance of the
  projected data is maximized is now defined by the <math|M> eigenvectors
  <math|\<b-u\><rsub|1>,\<cdots\>,\<b-u\><rsub|M>> of the data covariance
  matrix <math|S> corresponding to the <math|M> largest eigenvalues
  <math|\<lambda\><rsub|1>,\<cdots\>,\<lambda\><rsub|M>> . This is easily
  shown using proof by induction.

  To summarize, principal component analysis involves evaluating the mean
  <math|<wide|\<b-x\>|\<wide-bar\>>> and the covariance matrix <math|S> of
  the data set and then finding the <math|M> eigenvectors of <math|S>
  corresponding to the <math|M> largest eigenvalues. Algorithms for finding
  eigenvectors and eigenvalues, as well as additional theorems related to
  eigenvector decomposition, can be found in Golub and Van Loan (1996). Note
  that the computational cost of computing the full eigenvector decomposition
  for a matrix of size <math|D\<times\>D> is <math|O(D<rsup|3>)>. If we plan
  to project our data onto the first <math|M> principal components, then we
  only need to find the first <math|M> eigenvalues and eigenvectors. This can
  be done with more efficient techniques, such as the power method (Golub and
  Van Loan, 1996), that scale like <math|O(M D<rsup|2>)>, or alternatively we
  can make use of the EM algorithm.

  <subsection|Minimum-error formulation>

  \;

  We now discuss an alternative formulation of PCA based on projection error
  minimization. To do this, we introduce a complete orthonormal set of
  D-dimensional \ basis vectors <math|<around*|{|\<b-u\><rsub|i>|}>> where
  <math|i=1,\<cdots\>,D> that satisfy

  <\equation*>
    \<b-u\><rsub|i><rsup|T>\<b-u\>=\<delta\><rsub|i j>
  </equation*>

  Because this basis is complete, each data point can be represented exactly
  by a linear combination of the basis vectors

  <\equation*>
    \<b-x\><rsub|n>=<big|sum><rsub|i=1><rsup|D>\<alpha\><rsub|n
    i>\<b-u\><rsub|i>
  </equation*>

  where the coefficients <math|\<alpha\><rsub|n i>> will be different for
  different data points. This simply corresponds to a rotation of the
  coordinate system to a new system defined by the <math|{\<b-u\><rsub|i>}>,
  and the original <math|D> components <math|<around*|{|x<rsub|n1>,\<cdots\>,x<rsub|n
  D>|}>> are replaced by an equivalent set
  <math|{\<alpha\><rsub|n1>,\<cdots\>,\<alpha\><rsub|n D>}>. Taking the inner
  product with <math|\<b-u\><rsub|j>>, and making use of the orthonormality
  property, we obtain <math|\<alpha\><rsub|n
  j>=\<b-x\><rsub|n><rsup|T>\<b-u\><rsub|j>>, and so without loss of
  generality we can write

  <\equation>
    \<b-x\><rsub|n>=<big|sum><rsub|i=1><rsup|D><around*|(|\<b-x\><rsub|n><rsup|T>\<b-u\><rsub|i>|)>\<b-u\><rsub|i><label|12.9>
  </equation>

  Our goal, however, is to approximate this data point using a representation
  involving a restricted number <math|M\<less\>D> of variables corresponding
  to a projection onto a lower-dimensional subspace. The <math|M>-dimensional
  linear subspace can be represented, without loss of generality, by the
  first <math|M> of the basis vectors, and so we approximate each data point
  <math|\<b-x\><rsub|n>> by

  <\equation*>
    <wide|\<b-x\>|~><rsub|n>=<big|sum><rsub|i=1><rsup|M>z<rsub|n
    i>\<b-u\><rsub|i>+<big|sum><rsub|i=M+1><rsup|D>b<rsub|i>\<b-u\><rsub|i>
  </equation*>

  where the <math|{z<rsub|n i>}> depend on the particular data point, whereas
  the <math|{b<rsub|i>}> are constants that are the same for all data points.
  We are free to choose the <math|{\<b-u\><rsub|i>}>, the <math|{z<rsub|n
  i>}>, and the {<math|b<rsub|i>}> so as to minimize the distortion
  introduced by the reduction in dimensionality. As our distortion measure,
  we shall use the squared distance between the original data point
  <math|\<b-x\><rsub|n>> and its approximation
  <math|<wide|\<b-x\>|~><rsub|n>>, averaged over the data set, so that our
  goal is to minimize

  <\equation*>
    J=<frac|1|N><big|sum><rsub|n=1><rsup|N><around*|\<\|\|\>|\<b-x\><rsub|n>-<wide|\<b-x\>|~><rsub|n>|\<\|\|\>><rsup|2>
  </equation*>

  Consider first of all the minimization with respect to the quantities
  <math|{z<rsub|n i>}>. Substituting for <math|<wide|\<b-x\>|~><rsub|n>>,
  setting the derivative with respect to <math|z<rsub|n j>> to zero, and
  making use of the orthonormality conditions, we obtain

  <\equation*>
    z<rsub|n j>=\<b-x\><rsup|T><rsub|n>\<b-u\><rsub|j>
  </equation*>

  where <math|j=1,\<cdots\>,M>. Similarly, setting the derivative of <math|J>
  with respect to <math|b<rsub|i>> to zero, and again making use of the
  orthonormality relations, gives

  <\equation*>
    b<rsub|j>=<wide|\<b-x\>|\<wide-bar\>><rsup|T>\<b-u\><rsub|j>
  </equation*>

  where <math|j=M+1,\<cdots\>,D>. If we substitute for <math|z<rsub|n i>> and
  <math|b<rsub|i>>, and make use of the general expansion Eq. <eqref|12.9>,
  we obtain

  <\equation*>
    \<b-x\>-<wide|\<b-x\>|~><rsub|n>=<big|sum><rsub|i=M+1><rsup|D><around*|{|<around*|(|\<b-x\><rsub|n>-<wide|\<b-x\>|~>|)><rsup|T>\<b-u\><rsub|i>|}>\<b-u\><rsub|i>
  </equation*>

  from which we see that the displacement vector from <math|\<b-x\><rsub|n>>
  to <math|<wide|\<b-x\>|~><rsub|n>> lies in the space orthogonal to the
  principal subspace, because it is a linear combination of
  <math|<around*|{|\<b-u\><rsub|i>|}>> for <math|i=M+1,\<cdots\>,D>, as
  illustrated in Figure <reference|fig12.2>. This is to be expected because
  the projected points <math|<wide|\<b-x\>|~><rsub|n>> must lie within the
  principal subspace, but we can move them freely within that subspace, and
  so the minimum error is given by the orthogonal projection.

  We therefore obtain an expression for the distortion measure <math|J> as a
  function purely of the <math|<around*|{|\<b-u\><rsub|i>|}>> in the form

  <\equation*>
    J=<frac|1|N><big|sum><rsub|n=1><rsup|N><big|sum><rsub|i=M+1><rsup|D><around*|(|\<b-x\><rsup|T><rsub|n>\<b-u\><rsub|i>-<wide|\<b-x\>|\<wide-bar\>><rsup|T>\<b-u\><rsub|i>|)><rsup|2>=<big|sum><rsub|i=M+1><rsup|D>\<b-u\><rsub|i><rsup|T>S\<b-u\><rsub|i>
  </equation*>

  There remains the task of minimizing <math|J> with respect to the
  <math|<around*|{|\<b-u\><rsub|i>|}>>, which must be a constrained
  minimization otherwise we will obtain the vacuous result
  <math|\<b-u\><rsub|i>=\<b-0\>>. The constraints arise from the
  orthonormality conditions and, as we shall see, the solution will be
  expressed in terms of the eigenvector expansion of the covariance matrix.
  Before considering a formal solution, let us try to obtain some intuition
  about the result by considering the case of a two-dimensional data space
  <math|D=2> and a one-dimensional principal subspace <math|M=1>. We have to
  choose a direction <math|\<b-u\><rsub|2>> so as to minimize
  <math|J=\<b-u\><rsub|2><rsup|T>\<b-u\><rsub|2>>, subject to the
  normalization constraint <math|\<b-u\><rsub|2><rsup|T>\<b-u\><rsub|2>=1>.
  Using a Lagrange multiplier <math|\<lambda\><rsub|2>> to enforce the
  constraint, we consider the minimization of

  <\equation*>
    <wide|J|~>=\<b-u\><rsub|2><rsup|T>S\<b-u\><rsub|2>+\<lambda\><rsub|2><around*|(|1-\<b-u\><rsub|2><rsup|T>\<b-u\><rsub|2>|)>
  </equation*>

  Setting the derivative with respect to <math|\<b-u\><rsub|2>> to zero, we
  obtain <math|S\<b-u\><rsub|2>=\<lambda\><rsub|2>\<b-u\><rsub|2>> so that
  <math|\<b-u\><rsub|2>> is an eigenvector of <math|S> with eigenvalue
  <math|\<lambda\><rsub|2>>. Thus any eigenvector will define a stationary
  point of the distortion measure.

  To find the value of <math|J> at the minimum, we back-substitute the
  solution for <math|\<b-u\><rsub|2>> into the distortion measure to give
  <math|J=\<lambda\><rsub|2>>. We therefore obtain the minimum value of
  <math|J> by choosing <math|\<b-u\><rsub|2>> to be the eigenvector
  corresponding to the smaller of the two eigenvalues. Thus we should choose
  the principal subspace to be aligned with the eigenvector having the larger
  eigenvalue. This result accords with our intuition that, in order to
  minimize the average squared projection distance, we should choose the
  principal component subspace to pass through the mean of the data points
  and to be aligned with the directions of maximum variance. For the case
  when the eigenvalues are equal, any choice of principal direction will give
  rise to the same value of <math|J>.

  The general solution to the minimization of <math|J> for arbitrary <math|D>
  and arbitrary <math|M\<less\>D> is obtained by choosing the
  <math|\<b-u\><rsub|i>> to be eigenvectors of the covariance matrix given by

  <\equation*>
    S\<b-u\><rsub|i>=\<lambda\><rsub|i>\<b-u\><rsub|i>
  </equation*>

  where <math|i=1,\<cdots\>,D>, and as usual the eigenvectors
  <math|<around*|{|\<b-u\><rsub|i>|}>> are chosen to be orthonormal. The
  corresponding value of the distortion measure is then given by

  <\equation*>
    J=<big|sum><rsub|i=M+1><rsup|D>\<lambda\><rsub|i>
  </equation*>

  which is simply the sum of the eigenvalues of those eigenvectors that are
  orthogonal to the principal subspace. We therefore obtain the minimum value
  of <math|J> by selecting these eigenvectors to be those having the
  <math|D\<minus\>M> smallest eigenvalues, and hence the eigenvectors
  defining the principal subspace are those corresponding to the <math|M>
  largest eigenvalues.

  Although we have considered <math|M\<less\>D>, the PCA analysis still holds
  if <math|M=D>, in which case there is no dimensionality reduction but
  simply a rotation of the coordinate axes to align with principal
  components.

  Finally, it is worth noting that there exists a closely related linear
  dimensionality reduction technique called <em|canonical correlation
  analysis>, or CCA (Hotelling, 1936; Bach and Jordan, 2002). Whereas PCA
  works with a single random variable, CCA considers two (or more) variables
  and tries to find a corresponding pair of linear subspaces that have high
  cross-correlation, so that each component within one of the subspaces is
  correlated with a single component from the other subspace. Its solution
  can be expressed in terms of a generalized eigenvector problem.

  <subsection|Applications of PCA>

  \;

  We can illustrate the use of PCA for data compression by considering the
  offline digits data set. Because each eigenvector of the covariance matrix
  is a vector
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|12.9|<tuple|1.1|?>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.1|?>>
    <associate|auto-4|<tuple|1.2|?>>
    <associate|auto-5|<tuple|1.1.1|?>>
    <associate|auto-6|<tuple|1.1.2|?>>
    <associate|auto-7|<tuple|1.1.3|?>>
    <associate|fig12.2|<tuple|1.2|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1.1>||A synthetic data
      set obtained by taking one of the off-line digit images and creating
      multiple copies in each of which the digit has undergone a random
      displacement and rotation within some larger image field. The resulting
      images each have 100\<times\>100=10,000 pixels.>|<pageref|auto-2>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Continuous
      Latent Variables> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>