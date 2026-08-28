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
  in Figure <reference|fig12.1>. Each of the resulting images is represented
  by a point in the 100\<times\>100=10,000-dimensional data space. However,
  across a data set of such images, there are only three <em|degrees of
  freedom> of variability, corresponding to the vertical and horizontal
  translations and the rotations. The data points will therefore live on a
  subspace of the data space whose <em|intrinsic dimensionality> is three.
  Note that the manifold will be nonlinear because, for instance, if we
  translate the digit past a particular pixel, that pixel value will go from
  zero (white) to one (black) and back to zero again, which is clearly a
  nonlinear function of the digit position. In this example, the translation
  and rotation parameters are latent variables because we observe only the
  image vectors and are not told which values of the translation or rotation
  variables were used to create them.

  <\padded-center>
    <small-figure|<image|image/fig_12_1_digit.png|.9par|||>|<label|fig12.1>A
    synthetic data set obtained by taking one of the off-line digit images
    and creating multiple copies in each of which the digit has undergone a
    random displacement and rotation within some larger image field. The
    resulting images each have 100\<times\>100=10,000 pixels.>
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

  <\equation>
    <wide|\<b-x\>|\<wide-bar\>>=<frac|1|N><big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n><label|12.1>
  </equation>

  and the variance of the projected data is given by

  <\equation*>
    <frac|1|N><big|sum><rsub|n=1><rsup|N><around*|{|\<b-u\><rsub|1><rsup|T>\<b-x\><rsub|n>-\<b-u\><rsub|1><rsup|T><wide|\<b-x\>|\<wide-bar\>>|}><rsup|2>=\<b-u\><rsub|1><rsup|T>S\<b-u\><rsub|1>
  </equation*>

  where <math|S> is the data covariance matrix defined by

  <\equation>
    S=<frac|1|N><big|sum><rsub|n=1><rsup|N><around*|(|\<b-x\><rsub|n>-<wide|\<b-x\>|\<wide-bar\>>|)><around*|(|\<b-x\><rsub|n>-<wide|\<b-x\>|\<wide-bar\>>|)><rsup|T><label|12.3>
  </equation>

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

  <\equation>
    <wide|\<b-x\>|~><rsub|n>=<big|sum><rsub|i=1><rsup|M>z<rsub|n
    i>\<b-u\><rsub|i>+<big|sum><rsub|i=M+1><rsup|D>b<rsub|i>\<b-u\><rsub|i><label|12.10>
  </equation>

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

  <\equation>
    z<rsub|n j>=\<b-x\><rsup|T><rsub|n>\<b-u\><rsub|j><label|12.12>
  </equation>

  where <math|j=1,\<cdots\>,M>. Similarly, setting the derivative of <math|J>
  with respect to <math|b<rsub|i>> to zero, and again making use of the
  orthonormality relations, gives

  <\equation>
    b<rsub|j>=<wide|\<b-x\>|\<wide-bar\>><rsup|T>\<b-u\><rsub|j><label|12.13>
  </equation>

  where <math|j=M+1,\<cdots\>,D>. If we substitute for <math|z<rsub|n i>> and
  <math|b<rsub|i>> in Eq. <eqref|12.10>, and make use of the general
  expansion Eq. <eqref|12.9>, we obtain

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

  <\equation>
    S\<b-u\><rsub|i>=\<lambda\><rsub|i>\<b-u\><rsub|i><label|12.17>
  </equation>

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
  offline digits data set, \ restricting our attention to images of the digit
  three. Because each eigenvector of the covariance matrix is a vector in the
  original D-dimensional space, we can represent the eigenvectors as images
  of the same size as the data points. The first four eigenvectors, along
  with the corresponding eigenvalues, are shown in Figure
  <reference|fig12.3>. A plot of the complete spectrum of eigenvalues, sorted
  into decreasing order, is shown in Figure <reference|fig12.4>(a). The
  distortion measure <math|J> associated with choosing a particular value of
  <math|M> is given by the sum of the eigenvalues from <math|M+1> up to
  <math|D> and is plotted for different values of <math|M> in Figure
  <reference|fig12.4>(b).

  <\padded-center>
    <small-figure|<image|image/fig_12_3_pca_eigenvector.png|.9par|||>|<label|fig12.3>The
    mean vector <math|<wide|\<b-x\>|\<wide-bar\>>> along with the first four
    PCA eigenvectors <math|\<b-u\><rsub|1>,\<cdots\>,\<b-u\><rsub|4>> for the
    digit three from \ the off-line digits data set, together with the
    corresponding eigenvalues. Blue corresponds to positive values, white is
    zero and yellow corresponds to negative values.>
  </padded-center>

  <\padded-center>
    <small-figure|<image|image/fig_12_4_pca_eigenvalue.png|.5par|||>|<label|fig12.4>(a)
    Plot of the eigenvalue spectrum for the digit three from the off-line
    digits data set. (b) Plot of the sum of the discarded eigenvalues, which
    represents the sum-of-squares distortion <math|J> introduced by
    projecting the data onto a principal component subspace of dimensionality
    <math|M> .>
  </padded-center>

  If we substitute Eq. <reference|12.12> and Eq. <eqref|12.13> into Eq.
  <eqref|12.10>, we can write the PCA approximation to a data vector
  <math|\<b-x\><rsub|n>> in the form

  <\eqnarray*>
    <tformat|<table|<row|<cell|<wide|\<b-x\>|~><rsub|n>>|<cell|=>|<cell|<big|sum><rsub|i=1><rsup|M><around*|(|\<b-x\><rsub|n><rsup|T>\<b-u\><rsub|i>|)>\<b-u\><rsub|i>+<big|sum><rsub|i=M+1><rsup|D><around*|(|<wide|\<b-x\>|\<wide-bar\>><rsup|T>\<b-u\><rsub|i>|)>\<b-u\><rsub|i>>>|<row|<cell|>|<cell|=>|<cell|<wide|\<b-x\>|\<wide-bar\>>+<big|sum><rsub|i=1><rsup|M><around*|(|\<b-x\><rsub|n><rsup|T>\<b-u\><rsub|i>-<wide|\<b-x\>|\<wide-bar\>><rsup|T>\<b-u\><rsub|i>|)>\<b-u\><rsub|i>>>>>
  </eqnarray*>

  where we have made use of the relation

  <\equation*>
    <wide|\<b-x\>|\<wide-bar\>>=<big|sum><rsub|i=1><rsup|D><around*|(|<wide|\<b-x\>|\<wide-bar\>><rsup|T>\<b-u\><rsub|i>|)>\<b-u\><rsub|i>
  </equation*>

  which follows from the completeness of the <math|{\<b-u\><rsub|i>}>. This
  represents a compression of the data set, because for each data point we
  have replaced the D-dimensional vector <math|\<b-x\><rsub|n>> with an
  M-dimensional vector having components <math|\<b-x\><rsub|n><rsup|T>\<b-u\><rsub|i>-<wide|\<b-x\>|\<wide-bar\>><rsup|T>\<b-u\><rsub|i>>.
  The smaller the value of <math|M> , the greater the degree of compression.
  Examples of reconstructions of a sample from the digit three data set are
  shown in Figure <reference|fig12.5>.

  <\padded-center>
    <small-figure|<image|image/fig_12_5_pca_reconstruction.png|.9par|||>|<label|fig12.5>An
    original example from the off-line digits data set together with its PCA
    reconstructions \ obtained by retaining M principal components for
    various values of M . As <math|M> increases the reconstruction becomes
    more accurate and would become perfect when <math|M = D = 28 \<times\> 28
    = 784.>>
  </padded-center>

  Another application of principal component analysis is to data
  pre-processing. In this case, the goal is not dimensionality reduction but
  rather the transformation of a data set in order to standardize certain of
  its properties. This can be important in allowing subsequent pattern
  recognition algorithms to be applied successfully to the data set.
  Typically, it is done when the original variables are measured in various
  different units or have significantly different variability. For instance
  in the Old Faithful data set, the time between eruptions is typically an
  order of magnitude greater than \ the duration of an eruption. When we
  applied the K-means algorithm to this data set, we first made a separate
  linear re-scaling of the individual variables such that \ each variable had
  zero mean and unit variance. This is known as <em|standardizing> the data,
  and the covariance matrix for the standardized data has components

  <\equation*>
    \<rho\><rsub|i j>=<frac|1|N><big|sum><rsub|n=1><rsup|N><frac|*<around*|(|x<rsub|n
    i>-<wide|x|\<wide-bar\>><rsub|i>|)>|\<sigma\><rsub|i>><frac|<around*|(|x<rsub|n
    j>-<wide|x|\<wide-bar\>><rsub|j>|)>|\<sigma\><rsub|j>>
  </equation*>

  where <math|\<sigma\><rsub|i>> is the standard deviation of
  <math|x<rsub|i>>. This is known as the <em|correlation matrix> of the
  original data and has the property that if two components <math|x<rsub|i>>
  and <math|x<rsub|j>> of the data are perfectly correlated, then
  <math|\<rho\><rsub|i j>=1>, and if they are uncorrelated, then
  <math|\<rho\><rsub|i j>=0>.

  However, using PCA we can make a more substantial normalization of the data
  to give it zero mean and unit covariance, so that different variables
  become decorrelated. To do this, we first write the eigenvector equation
  Eq. <eqref|12.17> in the form

  <\equation*>
    S U=U L
  </equation*>

  where <math|L> is a <math|D\<times\>D> diagonal matrix with elements
  <math|\<lambda\><rsub|i>>, and <math|U> is a <math|D\<times\>D> orthogonal
  matrix with columns given by <math|\<b-u\><rsub|i>>. Then we define, for
  each data point <math|\<b-x\><rsub|n>>, a transformed value given by

  <\equation*>
    \<b-y\><rsub|n>=L<rsup|-1/2>U<rsup|T><around*|(|\<b-x\><rsub|n>-<wide|\<b-x\>|\<wide-bar\>>|)>
  </equation*>

  where <math|<wide|\<b-x\>|\<wide-bar\>>> is the sample mean defined by Eq.
  <eqref|12.1>. Clearly, the set <math|{\<b-y\><rsub|n>}> has zero mean, and
  its covariance is given by the identity matrix because

  <\eqnarray*>
    <tformat|<table|<row|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N>\<b-y\><rsub|n>\<b-y\><rsub|n><rsup|T>>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N>L<rsup|-1/2>U<rsup|T><around*|(|\<b-x\><rsub|n>-<wide|\<b-x\>|\<wide-bar\>>|)><around*|(|\<b-x\><rsub|n>-<wide|\<b-x\>|\<wide-bar\>>|)><rsup|T>U
    L<rsup|-1/2>>>|<row|<cell|>|<cell|=>|<cell|L<rsup|-1/2>U<rsup|T>S U
    L<rsup|-1/2>>>|<row|<cell|>|<cell|=>|<cell|L<rsup|-1/2>U<rsup|T>U L
    L<rsup|-1/2>>>|<row|<cell|>|<cell|=>|<cell|L<rsup|-1/2>L
    L<rsup|-1/2>>>|<row|<cell|>|<cell|=>|<cell|I>>>>
  </eqnarray*>

  This operation is known as <em|whitening> or <em|sphereing> the data and is
  illustrated for the Old Faithful data set in Figure <reference|fig12.6>.

  <\padded-center>
    <small-figure|<image|image/fig_12_6_pca_preprocessing.png|.9par|||>|<label|fig12.6>Illustration
    of the effects of linear pre-processing applied to the Old Faithful data
    set. The plot on the left shows the original data. The centre plot shows
    the result of standardizing the individual variables to zero mean and
    unit variance. Also shown are the principal axes of this normalized data
    set, plotted over the range \ <math|\<pm\>\<lambda\><rsub|i><rsup|1/2 >>
    . The plot on the right shows the result of whitening of the data to give
    it zero mean and unit covariance.>
  </padded-center>

  It is interesting to compare PCA with the Fisher linear discriminant which
  was discussed in Section 4.1.4. Both methods can be viewed as techniques
  for linear dimensionality reduction. However, PCA is unsupervised and
  depends only on the values <math|\<b-x\><rsub|n>> whereas Fisher linear
  discriminant also uses class-label information. This difference is
  highlighted by the example in Figure <reference|fig12.7>.

  <\padded-center>
    <small-figure|<image|image/fig_12_7_pca_fisher.png|.3par|||>|<label|fig12.7>A
    comparison of principal component analysis with Fisher's linear
    discriminant for linear dimensionality reduction. Here the data in two
    dimensions, belonging to two classes shown in red and blue, is to be
    projected onto a single dimension. PCA chooses the direction of maximum
    variance, shown by the magenta curve, which leads to strong class
    overlap, whereas the Fisher linear discriminant takes account of the
    class labels and leads to a projection onto the green curve giving much
    better class separation.>
  </padded-center>

  Another common application of principal component analysis is to data
  visualization. Here each data point is projected onto a two-dimensional
  (<math|M=2>) principal subspace, so that a data point
  <math|\<b-x\><rsub|n>> is plotted at Cartesian coordinates given by
  <math|\<b-x\><rsub|n><rsup|T>\<b-u\><rsub|1>> and
  <math|\<b-x\><rsub|n><rsup|T>\<b-u\><rsub|2>>, where <math|\<b-u\><rsub|1>>
  and <math|\<b-u\><rsub|2>> are the eigenvectors corresponding to the
  largest and second largest eigenvalues. An example of such a plot, for the
  oil flow data set, is \ shown in Figure <inactive|<reference|fig12.8>>.

  <\padded-center>
    <small-figure|<image|image/fig_12_8_pca_visulization.png|.3par|||>|Visualization
    of the oil flow data set obtained \ by projecting the data onto the first
    two principal components. The red, blue, and green points correspond to
    the `laminar', `homogeneous', and `annular' flow configurations
    respectively.>
  </padded-center>

  <subsection|PCA for high-dimensional data>

  \;

  In some applications of principal component analysis, the number of data
  points is smaller than the dimensionality of the data space. For example,
  we might want to apply PCA to a data set of a few hundred images, each of
  which corresponds to a vector in a space of potentially several million
  dimensions (corresponding to three colour values for each of the pixels in
  the image). Note that in a D-dimensional space a set of <math|N> points,
  where <math|N\<less\>D>, defines a linear subspace whose dimensionality is
  at most <math|N\<minus\>1>, and so there is little point in applying PCA
  for values of <math|M> that are greater than <math|N\<minus\>1>. Indeed, if
  we perform PCA we will find that at least <math|D\<minus\>N+1> of the
  eigenvalues are zero, corresponding to eigenvectors along whose directions
  the data set has zero variance. Furthermore, typical algorithms for finding
  the eigenvectors of a <math|D\<times\>D> matrix have a computational cost
  that scales like <math|O(D<rsup|3>)>, and so for applications such as the
  image example, a direct application of PCA will be computationally
  infeasible.

  We can resolve this problem as follows. First, let us define <math|X> to be
  the (<math|N \<times\> D>)-dimensional centred data matrix, whose n'th row
  is given by <math|<around*|(|\<b-x\><rsub|<rsub|n>>-<wide|\<b-x\>|\<wide-bar\>>|)>>.
  The covariance matrix Eq. <eqref|12.3> can then be written as
  <math|S=N<rsup|-1>X<rsup|T>X>, and the corresponding eigenvector equation
  becomes

  <\equation*>
    <frac|1|N>X<rsup|T>X\<b-u\><rsub|i>=\<lambda\><rsub|i>\<b-u\><rsub|i>
  </equation*>

  Now pre-multiply both sides by <math|X> to give

  <\equation*>
    <frac|1|N>X X<rsup|T>X\<b-u\><rsub|i>=\<lambda\><rsub|i><around*|(|X\<b-u\><rsub|i>|)>
  </equation*>

  If we now define <math|\<b-v\><rsub|i> = X\<b-u\><rsub|i>>, we obtain

  <\equation>
    <frac|1|N>X X<rsup|T>\<b-v\><rsub|i>=\<lambda\>\<b-v\><rsub|i><label|12.28>
  </equation>

  which is an eigenvector equation for the <math|N\<times\>N> matrix
  <math|N<rsup|\<minus\>1>X X<rsup|T>>. We see that this has the same
  <math|N\<minus\>1> eigenvalues as the original covariance matrix (which
  itself has an additional <math|D\<minus\>N+1> eigenvalues of value zero).
  Thus we can solve the eigenvector problem in spaces of lower dimensionality
  with computational cost <math|O(N<rsup|3>)> instead of <math|O(D<rsup|3>)>.
  In order to determine the eigenvectors, we multiply both sides of Eq.
  <eqref|12.28> by <math|X<rsup|T>> to give

  <\equation*>
    <around*|(|<frac|1|N>X<rsup|T>X|)><around*|(|X<rsup|T>\<b-v\><rsub|i>|)>=\<lambda\><rsub|i><around*|(|X<rsup|T>\<b-v\><rsub|i>|)>
  </equation*>

  from which we see that <math|(X<rsup|T>\<b-v\><rsub|i>)> is an eigenvector
  of <math|S> with eigenvalue <math|\<lambda\><rsub|i>>. Note, however, that
  these eigenvectors need not be normalized. To determine the appropriate
  normalization, we re-scale <math|\<b-u\><rsub|i>\<propto\>X<rsup|T>\<b-v\><rsub|i>>
  by a constant such that <math|\<\|\|\>\<b-u\><rsub|i>\<\|\|\>=1>, which,
  assuming <math|\<b-v\><rsub|i>> has been normalized to unit length, gives

  <\equation>
    \<b-u\><rsub|i>=<frac|1|<around*|(|N\<lambda\><rsub|i>|)><rsup|1/2>>X<rsup|T>\<b-v\><rsub|i><label|12.30>
  </equation>

  In summary, to apply this approach we first evaluate <math|X X<rsup|T>> and
  then find its eigenvectors and eigenvalues and then compute the
  eigenvectors in the original data space using Eq. <eqref|12.30>.

  <section|Probabilistic PCA>

  The formulation of PCA discussed in the previous section was based on a
  linear projection of the data onto a subspace of lower dimensionality than
  the original data space. We now show that PCA can also be expressed as the
  maximum likelihood solution of a probabilistic latent variable model. This
  reformulation of PCA, known as probabilistic PCA, brings several advantages
  compared with conventional PCA:

  <\itemize-dot>
    <item>Probabilistic PCA represents a constrained form of the Gaussian
    distribution \ in which the number of free parameters can be restricted
    while still allowing the model to capture the dominant correlations in a
    data set.

    <item>We can derive an EM algorithm for PCA that is computationally
    efficient in situations where only a few leading eigenvectors are
    required and that avoids having to evaluate the data covariance matrix as
    an intermediate step.

    <item>The combination of a probabilistic model and EM allows us to deal
    with missing values in the data set.\ 

    <item>Mixtures of probabilistic PCA models can be formulated in a
    principled way and trained using the EM algorithm.

    <item>Probabilistic PCA forms the basis for a Bayesian treatment of PCA
    in which the dimensionality of the principal subspace can be found
    automatically from the data.

    <item>The existence of a likelihood function allows direct comparison
    with other probabilistic density models. By contrast, conventional PCA
    will assign a low reconstruction cost to data points that are close to
    the principal subspace even if they lie arbitrarily far from the training
    data.

    <item>Probabilistic PCA can be used to model class-conditional densities
    and hence be applied to classification problems.

    <item>The probabilistic PCA model can be run generatively to provide
    samples from the distribution.
  </itemize-dot>

  This formulation of PCA as a probabilistic model was proposed independently
  by Tipping and Bishop (1997, 1999b) and by Roweis (1998). As we shall see
  later, it is closely related to <em|factor analysis> (Basilevsky, 1994).

  Probabilistic PCA is a simple example of the linear-Gaussian framework, in
  \ which all of the marginal and conditional distributions are Gaussian. We
  can formulate probabilistic PCA by first introducing an explicit latent
  variable <math|\<b-z\>> corresponding to the principal-component subspace.
  Next we define a Gaussian prior distribution <math|p(\<b-z\>)> over the
  latent variable, together with a Gaussian conditional distribution
  <math|p<around*|(|\<b-x\>\|\<b-z\>|)>> for the observed variable
  <math|\<b-x\>> conditioned on the value of the latent variable.
  Specifically, the prior distribution over <math|\<b-z\>> is given by a
  zero-mean unit-covariance Gaussian

  <\equation>
    p<around*|(|\<b-z\>|)>=\<cal-N\><around*|(|\<b-z\>\|\<b-0\>,I|)><label|12.31>
  </equation>

  Similarly, the conditional distribution of the observed variable
  <math|\<b-x\>>, conditioned on the value of the latent variable
  <math|\<b-z\>>, is again Gaussian, of the form

  <\equation>
    p<around*|(|\<b-x\>\|\<b-z\>|)>=\<cal-N\><around*|(|\<b-x\>\|W\<b-z\>+\<b-mu\>,\<sigma\><rsup|2>I|)><label|12.32>
  </equation>

  in which the mean of <math|\<b-x\>> is a general linear function of
  <math|\<b-z\>> governed by the <math|D\<times\>M> matrix <math|W> and the
  D-dimensional vector <math|\<b-mu\>>. Note that this factorizes with
  respect to the elements of <math|\<b-x\>>, in other words this is an
  example of the naive Bayes model. As \ we shall see shortly, the columns of
  <math|W> span a linear subspace within the data space that corresponds to
  the principal subspace. The other parameter in this model is the scalar
  <math|\<sigma\><rsup|2>> governing the variance of the conditional
  distribution. Note that there is no loss of generality in assuming a zero
  mean, unit covariance Gaussian for the latent distribution p(z) because a
  more general Gaussian distribution would give rise to an equivalent
  probabilistic model.

  We can view the probabilistic PCA model from a generative viewpoint in
  which a sampled value of the observed variable is obtained by first
  choosing a value for the latent variable and then sampling the observed
  variable conditioned on this latent value. Specifically, the D-dimensional
  observed variable <math|\<b-x\>> is defined by a linear transformation of
  the M-dimensional latent variable <math|\<b-z\>> plus additive Gaussian
  `noise', so that

  <\equation>
    \<b-x\>=W\<b-z\>+\<b-mu\>+\<b-varepsilon\><label|12.33>
  </equation>

  where <math|\<b-z\>> is an M-dimensional Gaussian latent variable, and
  <math|\<b-varepsilon\>> is a D-dimensional zero-mean Gaussian-distributed
  noise variable with covariance <math|\<sigma\><rsup|2>I>. This generative
  process is illustrated in Figure <reference|fig12.9>. Note that this
  framework is based on a mapping from latent space to data space, in
  contrast to the more conventional view of PCA discussed above. The reverse
  mapping, from data space to the latent space, will be obtained shortly
  using Bayes' theorem.

  <\padded-center>
    <small-figure|<image|image/fig_12_9_illustration_probabilistic_pca.png|0.9par|||>|<label|fig12.9>An
    illustration of the generative view of the probabilistic PCA model for a
    two-dimensional data space and a one-dimensional latent space. An
    observed data point <math|\<b-x\>> is generated by first drawing a value
    <math|<wide|z|^>> for the latent variable from its prior distribution
    <math|p(z)> and then drawing a value for <math|\<b-x\>> from an isotropic
    Gaussian \ distribution (illustrated by the red circles) having mean
    <math|\<b-w\><wide|z|^>+\<b-mu\>> and covariance
    <math|\<sigma\><rsup|2>I>. The green ellipses show the density contours
    for the marginal distribution <math|p(\<b-x\>)>.>
  </padded-center>

  Suppose we wish to determine the values of the parameters <math|W>,
  <math|\<b-mu\>> and <math|\<sigma\><rsup|2>> using maximum likelihood. To
  write down the likelihood function, we need an expression for the marginal
  distribution <math|p(\<b-x\>)> of the observed variable. This is expressed,
  from the sum and product rules of probability, in the form

  <\equation*>
    p<around*|(|\<b-x\>|)>=<big|int>p<around*|(|\<b-x\>\|\<b-z\>|)>p<around*|(|\<b-z\>|)>\<mathd\>\<b-z\>
  </equation*>

  Because this corresponds to a linear-Gaussian model, this marginal
  distribution is again Gaussian, and is given by

  <\equation>
    p<around*|(|\<b-x\>|)>=\<cal-N\><around*|(|\<b-x\>\|\<b-mu\>,C|)><label|12.35>
  </equation>

  where the <math|D\<times\>D> covariance matrix <math|C> is defined by

  <\equation>
    C=W W<rsup|T>+\<sigma\><rsup|2>I<label|12.36>
  </equation>

  This result can also be derived more directly by noting that the predictive
  distribution will be Gaussian and then evaluating its mean and covariance
  using Eq. <eqref|12.33>. This gives

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<b-x\>|]>>|<cell|=>|<cell|\<bbb-E\><around*|[|W\<b-z\>+\<b-mu\>+\<b-varepsilon\>|]>>>|<row|<cell|>|<cell|=>|<cell|\<b-mu\>>>|<row|<cell|cov<around*|[|\<b-x\>|]>>|<cell|=>|<cell|\<bbb-E\><around*|[|<around*|(|W\<b-z\>+\<b-varepsilon\>|)><around*|(|W\<b-z\>+\<b-varepsilon\>|)><rsup|T>|]>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><around*|[|W\<b-z\>\<b-z\><rsup|T>W<rsup|T>|]>+\<bbb-E\><around*|[|\<b-varepsilon\>\<b-varepsilon\><rsup|T>|]>>>|<row|<cell|>|<cell|=>|<cell|W
    W<rsup|T>+\<sigma\><rsup|2>I>>>>
  </eqnarray*>

  where we have used the fact that <math|\<b-z\>> and <math|\<b-varepsilon\>>
  are independent random variables and hence are uncorrelated.

  Intuitively, we can think of the distribution <math|p(\<b-x\>)> as being
  defined by taking an isotropic Gaussian `spray can' and moving it across
  the principal subspace spraying Gaussian ink with density determined by
  <math|\<sigma\><rsup|2>> and weighted by the prior distribution. The
  accumulated ink density gives rise to a `pancake' shaped distribution
  representing the marginal density <math|p(\<b-x\>)>.

  The predictive distribution <math|p(\<b-x\>)> is governed by the parameters
  <math|\<b-mu\>>, <math|W>, and <math|\<sigma\><rsup|2>>. However, there is
  redundancy in this parameterization corresponding to rotations of the
  latent space coordinates. To see this, consider a matrix <math|<wide|W|~>=W
  R> where <math|R> is an orthogonal matrix. Using the orthogonality property
  <math|R R<rsup|T>=I>, we see that the quantity
  <math|<wide|W|~><wide|W|~><rsup|T>> that appears in the covariance matrix
  <math|C> takes the form

  <\equation*>
    <wide|W|~><wide|W|~><rsup|T>=W R R<rsup|T>W<rsup|T>=W W<rsup|T>
  </equation*>

  and hence is independent of <math|R>. Thus there is a whole family of
  matrices <math|<wide|W|~>> all of which give rise to the same predictive
  distribution. This invariance can be understood in terms of rotations
  within the latent space. We shall return to a discussion of the number of
  independent parameters in this model later.

  When we evaluate the predictive distribution, we require
  <math|C<rsup|\<minus\>1>>, which involves the inversion of a
  <math|D\<times\>D> matrix. The computation required to do this can be
  reduced by making use of the matrix inversion identity (C.7) to give

  <\equation*>
    C<rsup|-1>=\<sigma\><rsup|-2>I-\<sigma\><rsup|-2>W M<rsup|-1>W<rsup|T>
  </equation*>

  where the <math|M\<times\>M> matrix <math|M> is defined by

  <\equation>
    M=W<rsup|T>W+\<sigma\><rsup|2>I.<label|12.41>
  </equation>

  Because we invert <math|M> rather than inverting <math|C> directly, the
  cost of evaluating <math|C<rsup|\<minus\>1>> is reduced from
  <math|O(D<rsup|3>)> to <math|O(M<rsup|3>)>.

  As well as the predictive distribution <math|p(\<b-x\>)>, we will also
  require the posterior distribution <math|p(\<b-z\>\|\<b-x\>)>, which can
  again be written down directly using the result (2.116) for linear-Gaussian
  models to give

  <\equation>
    p<around*|(|\<b-z\>\|\<b-x\>|)>=\<cal-N\><around*|(|\<b-z\>\|M<rsup|-1>W<rsup|T><around*|(|\<b-x\>-\<b-mu\>|)>,\<sigma\><rsup|-2>M<rsup|-1>|)><label|12.42>
  </equation>

  Note that the posterior mean depends on <math|\<b-x\>>, whereas the
  posterior covariance is independent of <math|\<b-x\>>.

  <subsection|Maximum likelihood PCA>

  <\padded-center>
    <small-figure|<image|image/fig_12_10_probabilistic_pca_model.png|0.2par|||>|<label|fig12.10>The
    probabilistic PCA model for a data set of <math|N> observations of
    <math|\<b-x\>> can be expressed as a directed graph in which each
    observation <math|\<b-x\><rsub|n>> is associated with a value
    <math|\<b-z\><rsub|n>> of the latent variable.>
  </padded-center>

  We next consider the determination of the model parameters using maximum
  likelihood. Given a data set <math|X={\<b-x\><rsub|n>}> of observed data
  points, the probabilistic PCA model can be expressed as a directed graph,
  as shown in Figure <reference|fig12.10>. The corresponding log likelihood
  function is given, from Eq. <eqref|12.35>, by

  <\eqnarray*>
    <tformat|<table|<row|<cell|ln p<around*|(|X\|\<b-mu\>,W,\<sigma\><rsup|2>|)>>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>ln
    p<around*|(|\<b-x\><rsub|n>\|W,\<b-mu\>,\<sigma\><rsup|2>|)>>>|<row|<cell|>|<cell|=>|<cell|-<frac|N
    D|2>ln<around*|(|2\<pi\>|)>-<frac|N|2>ln<around*|\||C|\|>-<frac|1|2><big|sum><rsub|n=1><rsup|N><around*|(|\<b-x\><rsub|n>-\<b-mu\>|)><rsup|T>C<rsup|-1><around*|(|\<b-x\><rsub|n>-\<b-mu\>|)><eq-number><label|12.43>>>>>
  </eqnarray*>

  Setting the derivative of the log likelihood with respect to
  <math|\<b-mu\>> equal to zero gives the expected result
  <math|\<b-mu\>=<wide|\<b-x\>|\<wide-bar\>>> where
  <wide|<math|\<b-x\>>|\<wide-bar\>> is the data mean defined by Eq.
  <eqref|12.1>. Back-substituting we can then write the log likelihood
  function in the form

  <\equation*>
    ln p<around*|(|X\|\<b-mu\>,W,\<sigma\><rsup|2>|)>=-<frac|N|2><around*|{|D
    ln<around*|(|2\<pi\>|)>+ln<around*|\||C|\|>+Tr<around*|(|C<rsup|-1>S|)>|}>
  </equation*>

  where <math|S> is the data covariance matrix defined by Eq. <eqref|12.3>.
  Because the log likelihood is a quadratic function of <math|\<b-mu\>>, this
  solution represents the unique maximum, as can be confirmed by computing
  second derivatives.

  Maximization with respect to <math|W> and <math|\<sigma\><rsup|2>> is more
  complex but nonetheless has an exact closed-form solution. It was shown by
  Tipping and Bishop (1999b) that all of the stationary points of the log
  likelihood function can be written as

  <\equation*>
    W<rsub|ML>=U<rsub|M><around*|(|L<rsub|M>-\<sigma\><rsup|2>I|)><rsup|1/2>R
  </equation*>

  where <math|U<rsub|M>> is a <math|D\<times\>M> matrix whose columns are
  given by any subset (of size <math|M> ) of the eigenvectors of the data
  covariance matrix <math|S>, the <math|M\<times\>M> diagonal matrix
  <math|L<rsub|M>> has elements given by the corresponding eigenvalues
  <math|\<lambda\><rsub|i>>, and <math|R> is an arbitrary <math|M\<times\>M>
  orthogonal matrix.

  Furthermore, Tipping and Bishop (1999b) showed that the <em|maximum> of the
  likelihood function is obtained when the <math|M> eigenvectors are chosen
  to be those whose eigenvalues are the <math|M> largest (all other solutions
  being saddle points). A similar result was conjectured independently by
  Roweis (1998), although no proof was given. Again, we shall assume that the
  eigenvectors have been arranged in order of decreasing values of the
  corresponding eigenvalues, so that the <math|M> principal eigenvectors are
  <math|\<b-u\><rsub|1>,\<cdots\>,\<b-u\><rsub|M>> . In this case, the
  columns of <math|W> define the principal subspace of standard PCA. The
  corresponding maximum likelihood solution for <math|\<sigma\><rsup|2>> is
  then given by

  <\equation>
    \<sigma\><rsup|2><rsub|ML>=<frac|1|D-M><big|sum><rsub|i=M+1><rsup|D>\<lambda\><rsub|i><label|12.46>
  </equation>

  so that <math|\<sigma\><rsup|2><rsub|ML>> is the average variance
  associated with the discarded dimensions.

  Because <math|R> is orthogonal, it can be interpreted as a rotation matrix
  in the M-dimensional latent space. If we substitute the solution for
  <math|W> into the expression for <math|C>, and make use of the
  orthogonality property <math|R R<rsup|T>=I>, we see that <math|C> is
  independent of <math|R>. This simply says that the predictive density is
  unchanged by rotations in the latent space as discussed earlier. For the
  particular case of <math|R=I>, we see that the columns of <math|W> are the
  principal component eigenvectors scaled by the square root of \ the
  variance parameter <math|<sqrt|\<lambda\><rsub|i>\<minus\>\<sigma\><rsup|2>>>.
  The interpretation of these scaling factors is clear once we recognize that
  for a convolution of independent Gaussian distributions (in this case the
  latent space distribution and the noise model) the variances are additive.
  Thus the variance <math|\<lambda\><rsub|i>> in the direction of an
  eigenvector <math|\<b-u\><rsub|i>> is composed of the sum of a contribution
  <math|\<lambda\><rsub|i>-\<sigma\><rsup|2>> from the projection of the
  unit-variance latent space distribution into data space through the
  corresponding column of <math|W>, plus an isotropic contribution of
  variance <math|\<sigma\><rsup|2>> which is added in all directions by the
  noise model.

  It is worth taking a moment to study the form of the covariance matrix
  given by Eq. <eqref|12.36>. Consider the variance of the predictive
  distribution along some direction specified by the unit vector
  <math|\<b-v\>>, where <math|\<b-v\><rsup|T>\<b-v\>=1>, which is given by
  <math|\<b-v\><rsup|T>C\<b-v\>>. First suppose that <math|\<b-v\>> is
  orthogonal to the principal subspace, in other words it is given by some
  linear combination of the discarded eigenvectors. Then <math|v<rsup|T>U=0>
  and hence <math|\<b-v\><rsup|T>C\<b-v\>=\<sigma\><rsup|2>>. Thus the model
  predicts a noise variance orthogonal to the principal subspace, which, from
  Eq. <eqref|12.46>, is just the average of the discarded eigenvalues. Now
  suppose that <math|\<b-v\>=\<b-u\><rsub|i>> where <math|\<b-u\><rsub|i>> is
  one of the retained eigenvectors defining the principal subspace. Then
  <math|\<b-v\><rsup|T>C\<b-v\>=(\<lambda\><rsub|i>\<minus\>\<sigma\><rsup|2>)+\<sigma\><rsup|2>=\<lambda\><rsub|i>>.
  In other words, this model correctly captures the variance of the data
  along the principal axes, and approximates the variance in all remaining
  directions with a single average value <math|\<sigma\><rsup|2>>.

  One way to construct the maximum likelihood density model would simply be
  to find the eigenvectors and eigenvalues of the data covariance matrix and
  then to evaluate <math|W> and <math|\<sigma\><rsup|2>> using the results
  given above. In this case, we would choose <math|R=I> for convenience.
  However, if the maximum likelihood solution is found by numerical
  optimization of the likelihood function, for instance using an algorithm
  such as conjugate gradients (Fletcher, 1987; Nocedal and Wright, 1999;
  Bishop and Section 12.2.2 Nabney, 2008) or through the EM algorithm, then
  the resulting value of <math|R> is essentially arbitrary. This implies that
  the columns of <math|W> need not be orthogonal. If an orthogonal basis is
  required, the matrix <math|W> can be post-processed appropriately (Golub
  and Van Loan, 1996). Alternatively, the EM algorithm can be modified in
  such a way as to yield orthonormal principal directions, sorted in
  descending order of the corresponding eigenvalues, directly (Ahn and Oh,
  2003).

  The rotational invariance in latent space represents a form of statistical
  nonidentifiability, analogous to that encountered for mixture models in the
  case of discrete latent variables. Here there is a continuum of parameters
  all of which lead to the same predictive density, in contrast to the
  discrete nonidentifiability associated with component re-labelling in the
  mixture setting.

  If we consider the case of <math|M=D>, so that there is no reduction of
  dimensionality, then <math|U<rsub|M>=U> and <math|L<rsub|M>=L>. Making use
  of the orthogonality properties \ <math|U U<rsup|T>=I> and <math|R
  R<rsup|T>=I>, we see that the covariance <math|C> of the marginal
  distribution for <math|\<b-x\>> becomes

  <\equation*>
    C = U(L \<minus\> \<sigma\><rsup|2>I)<rsup|1/2>R R<rsup|T>(L \<minus\>
    \<sigma\><rsup|2>I)<rsup|1/2>U<rsup|T> + \<sigma\><rsup|2>I = U L
    U<rsup|T> = S
  </equation*>

  and so we obtain the standard maximum likelihood solution for an
  unconstrained Gaussian distribution in which the covariance matrix is given
  by the sample covariance.

  Conventional PCA is generally formulated as a projection of points from the
  Ddimensional data space onto an M-dimensional linear subspace.
  Probabilistic PCA, however, is most naturally expressed as a mapping from
  the latent space into the data space via Eq. <eqref|12.33>. For
  applications such as visualization and data compression, we can reverse
  this mapping using Bayes' theorem. Any point <math|\<b-x\>> in data space
  can then be summarized by its posterior mean and covariance in latent
  space. From Eq. <eqref|12.42> the mean is given by

  <\equation*>
    \<bbb-E\>[\<b-z\>\|\<b-x\>] = M<rsup|\<minus\>1>W<rsup|T><rsub|ML>(\<b-x\>\<minus\><wide|\<b-x\>|\<wide-bar\>>)
  </equation*>

  \ \ where <math|M> is given by Eq. <eqref|12.41>. This projects to a point
  in data space given by

  <\equation*>
    W\<bbb-E\>[\<b-z\>\|\<b-x\>]+\<b-mu\>.
  </equation*>

  Note that this takes the same form as the equations for regularized linear
  regression and is a consequence of maximizing the likelihood function for a
  linear Gaussian model. Similarly, the posterior covariance is given from
  Eq. <eqref|12.42> by <math|\<sigma\><rsup|2>M<rsup|\<minus\>1>> and is
  independent of <math|\<b-x\>>.

  If we take the limit <math|\<sigma\><rsup|2>\<rightarrow\>0>, then the
  posterior mean reduces to

  <\equation*>
    \ (W<rsup|T><rsub|ML>W<rsub|ML>)<rsup|\<minus\>1>W<rsup|T><rsub|ML>(\<b-x\>
    \<minus\><wide|\<b-x\>|\<wide-bar\>>)
  </equation*>

  which represents an orthogonal projection of the data point onto the latent
  space, and so we recover the standard PCA model. The posterior covariance
  in this limit is zero, however, and the density becomes singular. For
  <math|\<sigma\><rsup|2>\<gtr\>0>, the latent projection is shifted towards
  the origin, relative to the orthogonal projection.

  Finally, we note that an important role for the probabilistic PCA model is
  in defining a multivariate Gaussian distribution in which the number of
  degrees of freedom, in other words the number of independent parameters,
  can be controlled whilst still allowing the model to capture the dominant
  correlations in the data. Recall that a general Gaussian distribution has
  <math|D(D+1)/2> independent parameters in its covariance matrix (plus
  another <math|D> parameters in its mean). Thus the number of \ parameters
  scales quadratically with <math|D> and can become excessive in spaces of
  high dimensionality. If we restrict the covariance matrix to be diagonal,
  then it has only <math|D> independent parameters, and so the number of
  parameters now grows linearly with dimensionality. However, it now treats
  the variables as if they were independent and hence can no longer express
  any correlations between them. Probabilistic PCA provides an elegant
  compromise in which the <math|M> most significant correlations can be
  captured while still ensuring that the total number of parameters grows
  only linearly with <math|D>. We can see this by evaluating the number of
  degrees of freedom in the PPCA model as follows. The covariance matrix
  <math|C> depends on the parameters <math|W>, which has size
  <math|D\<times\>M> , and <math|\<sigma\><rsup|2>>, giving a total parameter
  count of <math|DM+1>. However, we have seen that there is some redundancy
  in this parameterization associated with rotations of the coordinate system
  in the latent space. The orthogonal matrix <math|R> that expresses these
  rotations has size <math|M\<times\>M>. In the first column of this matrix
  there are <math|M\<minus\>1> independent parameters, because the column
  vector must be normalized to unit length. In the second column there are
  <math|M\<minus\>2> independent parameters, because the column must be
  normalized and also must be orthogonal to the previous column, and so on.
  Summing this arithmetic series, we see that <math|R> has a total of
  <math|M(M\<minus\>1)/2> independent parameters. Thus the number of degrees
  of freedom in the covariance matrix <math|C> is given by

  <\equation*>
    D M + 1 \<minus\> M (M \<minus\> 1)/2.
  </equation*>

  The number of independent parameters in this model therefore only grows
  linearly with <math|D>, for fixed <math|M>. If we take <math|M = D
  \<minus\> 1>, then we recover the standard result for a full covariance
  Gaussian. In this case, the variance along <math|D \<minus\> 1> linearly
  independent directions is controlled by the columns of <math|W>, and the
  variance along the remaining direction is given by
  <math|\<sigma\><rsup|2>>. If <math|M = 0>, the model is equivalent to the
  isotropic covariance case.

  <subsection|EM algorithm for PCA>

  \;

  As we have seen, the probabilistic PCA model can be expressed in terms of a
  marginalization over a continuous latent space <math|\<b-z\>> in which for
  each data point <math|\<b-x\><rsub|n>>, there is a corresponding latent
  variable <math|\<b-z\><rsub|n>>. We can therefore make use of the EM
  algorithm to find maximum likelihood estimates of the model parameters.
  This may seem rather pointless because we have already obtained an exact
  closed-form solution for the maximum likelihood parameter values. However,
  in spaces of high dimensionality, there may be computational advantages in
  using an iterative EM procedure rather than working directly with the
  sample covariance matrix. This EM procedure can also be extended to the
  factor analysis model, for which there is no \ closed-form solution.
  Finally, it allows missing data to be handled in a principled way.

  We can derive the EM algorithm for probabilistic PCA by following the
  general framework for EM. Thus we write down the complete-data log
  likelihood and take \ its expectation with respect to the posterior
  distribution of the latent variable evaluated using `old' parameter values.
  Maximization of this expected completedata log likelihood then yields the
  `new' parameter values. Because the data points are assumed independent,
  the complete-data log likelihood function takes the form

  <\equation*>
    ln p<around*|(|X,Z\|\<b-mu\>,W,\<sigma\><rsup|2>|)>=<big|sum><rsub|n=1><rsup|N><around*|{|lnp<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)>+ln
    p<around*|(|\<b-z\><rsub|n>|)>|}>
  </equation*>

  where the n'th row of the matrix <math|Z> is given by
  <math|\<b-z\><rsub|n>>. We already know that the exact maximum likelihood
  solution for <math|\<b-mu\>> is given by the sample mean
  <math|<wide|\<b-x\>|\<bar\>>> defined by Eq. <eqref|12.1>, and it is
  convenient to substitute for <math|\<b-mu\>> at this stage. Making use of
  the expressions Eq. <eqref|12.31> and <eqref|12.32> for the latent and
  conditional distributions, respectively, and taking the expectation with
  respect to the posterior distribution over the latent variables, we obtain

  <\eqnarray*>
    <tformat|<table|<row|<cell|>|<cell|>|<cell|\<bbb-E\><around*|[|ln
    p<around*|(|X,Z\|\<b-mu\>,W,\<sigma\><rsup|2>|)>|]>>>|<row|<cell|>|<cell|=>|<cell|-<frac|N
    M ln(2\<pi\>)|2>>>|<row|<cell|>|<cell|>|<cell|-<big|sum><rsub|n=1><rsup|N><around*|{|<frac|
    D ln<around*|(|2\<pi\>\<sigma\><rsup|2>|)>|2>+<frac|Tr<around*|(|\<bbb-E\><around*|[|\<b-z\><rsub|n>\<b-z\><rsub|n><rsup|T>|]>|)>|2>+<frac|<around*|\<\|\|\>|\<b-x\><rsub|n>-\<b-mu\>|\<\|\|\>><rsup|2>|2\<sigma\><rsup|2>>-<frac|\<bbb-E\><around*|[|\<b-z\><rsub|n>|]><rsup|T>W<rsup|T><around*|(|\<b-x\><rsub|n>-\<b-mu\>|)>|\<sigma\><rsup|2>>+<frac|Tr<around*|(|\<bbb-E\><around*|[|\<b-z\><rsub|n>\<b-z\><rsub|n><rsup|T>|]>W<rsup|T>W|)>|2\<sigma\><rsup|2>>|}>>>>>
  </eqnarray*>

  Note that this depends on the posterior distribution only through the
  sufficient statistics of the Gaussian. Thus in the E step, we use the old
  parameter values to evaluate

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<b-z\><rsub|n>|]>>|<cell|=>|<cell|M<rsup|-1>W<rsup|T><around*|(|\<b-x\><rsub|n>-<wide|\<b-x\>|\<bar\>>|)><eq-number><label|12.54>>>|<row|<cell|\<bbb-E\><around*|[|\<b-z\><rsub|n>\<b-z\><rsub|n><rsup|T>|]>>|<cell|=>|<cell|\<sigma\><rsup|2>M<rsup|-1>+\<bbb-E\><around*|[|\<b-z\><rsub|n>|]>\<bbb-E\><around*|[|\<b-z\><rsub|n>|]><rsup|T><eq-number><label|12.55>>>>>
  </eqnarray*>

  which follow directly from the posterior distribution Eq. <eqref|12.42>
  together with the standard result <math|\<bbb-E\>[\<b-z\><rsub|n>\<b-z\><rsub|n><rsup|T>]
  = cov[\<b-z\><rsub|n>]+\<bbb-E\>[\<b-z\><rsub|N>]\<bbb-E\>[\<b-z\><rsub|n>]<rsup|T>>.
  Here M is defined by Eq. <eqref|12.41>.

  In the M step, we maximize with respect to <math|W> and
  <math|\<sigma\><rsup|2>>, keeping the posterior statistics fixed.
  Maximization with respect to <math|\<sigma\><rsup|2>> is straightforward.
  For the maximization with respect to <math|W> we make use of (C.24), and
  obtain the M-step equations

  <\eqnarray*>
    <tformat|<table|<row|<cell|W<rsub|new>>|<cell|=>|<cell|<around*|[|<big|sum><rsub|n=1><rsup|N><around*|(|\<b-x\><rsub|n>-<wide|\<b-x\>|\<bar\>>|)>\<bbb-E\><around*|[|\<b-z\><rsub|n>|]><rsup|T>|]><around*|[|<big|sum><rsub|n=1><rsup|N>\<bbb-E\><around*|[|\<b-z\><rsub|n>\<b-z\><rsub|n><rsup|T>|]>|]><rsup|-1><eq-number><label|12.56>>>|<row|<cell|\<sigma\><rsup|2><rsub|new>>|<cell|=>|<cell|<frac|1|N
    D><big|sum><rsub|n=1><rsup|N><around*|{|<around*|\<\|\|\>|\<b-x\><rsub|n>-<wide|\<b-x\>|\<bar\>>|\<\|\|\>><rsup|2>-2\<bbb-E\><around*|[|\<b-z\><rsub|n>|]><rsup|T>W<rsup|T><rsub|new><around*|(|\<b-x\><rsub|n>-<wide|\<b-x\>|\<bar\>>|)>+Tr<around*|(|\<bbb-E\><around*|[|\<b-z\><rsub|n>\<b-z\><rsub|n><rsup|T>W<rsup|T><rsub|new>W<rsub|new>|]>|)>|}><eq-number><label|12.57>>>>>
  </eqnarray*>

  The EM algorithm for probabilistic PCA proceeds by initializing the
  parameters and then alternately computing the sufficient statistics of the
  latent space posterior distribution using Eq. <eqref|12.54> and Eq.
  <eqref|12.55> in the E step and revising the parameter values using Eq.
  <eqref|12.56> and <eqref|12.57> in the M step.

  One of the benefits of the EM algorithm for PCA is computational efficiency
  for large-scale applications (Roweis, 1998). Unlike conventional PCA based
  on an eigenvector decomposition of the sample covariance matrix, the EM
  approach is iterative and so might appear to be less attractive. However,
  each cycle of the EM algorithm can be computationally much more efficient
  than conventional PCA in spaces of high dimensionality.

  To see this, we note that the eigendecomposition of the covariance matrix
  requires <math|O(D<rsup|3>)> computation. Often we are interested only in
  the first <math|M> eigenvectors and their corresponding eigenvalues, in
  which case we can use algorithms that are <math|O(M D<rsup|2>)>. However,
  the evaluation of the covariance matrix itself takes <math|O(N D<rsup|2>)>
  computations, where <math|N> is the number of data points. Algorithms such
  as the snapshot method (Sirovich, 1987), which assume that the eigenvectors
  are linear combinations of the data vectors, avoid direct evaluation of the
  covariance matrix but are <math|O(N<rsup|3>)> and hence unsuited to large
  data sets.

  The EM algorithm described here also does not construct the covariance
  matrix explicitly. Instead, the most computationally demanding steps are
  those involving sums over the data set that are <math|O(N D M)>. For large
  <math|D>, and <math|M\<ll\>D>, this can be a significant saving compared to
  <math|O(N D<rsup|2>)> and can offset the iterative nature of the EM
  algorithm.

  Note that this EM algorithm can be implemented in an on-line form in which
  each D-dimensional data point is read in and processed and then discarded
  before the next data point is considered. To see this, note that the
  quantities evaluated in the E step (an M-dimensional vector and an
  <math|M\<times\>M> matrix) can be computed for each data point separately,
  and in the M step we need to accumulate sums over data points, which we can
  do incrementally. This approach can be advantageous if both <math|N> and
  <math|D> are large.

  Because we now have a fully probabilistic model for PCA, we can deal with
  missing data, provided that it is missing at random, by marginalizing over
  the distribution of the unobserved variables. Again these missing values
  can be treated using the EM algorithm. We give an example of the use of
  this approach for data visualization in Figure <reference|fig12.11>.

  <\padded-center>
    <small-figure|<image|image/fig_12_11_probabilistic_pca_em.png|0.5par|||>|<label|fig12.11>Probabilistic
    PCA visualization of a portion of the oil flow data set for the first 100
    data points. The left-hand plot shows the posterior mean projections of
    the data points on the principal subspace. The right-hand plot is
    obtained by first randomly omitting <math|30%> of the variable values and
    then using EM to handle the missing values. Note that each data point
    then has at least one missing measurement but that the plot is very
    similar to the one obtained without missing values.>
  </padded-center>

  Another elegant feature of the EM approach is that we can take the limit
  <math|\<sigma\><rsup|2>\<rightarrow\>0>, corresponding to standard PCA, and
  still obtain a valid EM-like algorithm (Roweis, 1998). From Eq.
  <eqref|12.55>, we see that the only quantity we need to compute in the E
  step is <math|\<bbb-E\>[\<b-z\><rsub|n>]>. Furthermore, the M step is
  simplified because <math|M=W<rsup|T>W>. To emphasize \ the simplicity of
  the algorithm, let us define <math|<wide|X|~>> to be a matrix of size
  <math|N\<times\>D> whose n'th row is given by the vector
  <math|\<b-x\><rsub|n>-<wide|\<b-x\>|\<wide-bar\>>> and similarly define
  <math|\<Omega\>> to be a matrix of size <math|M\<times\>N> whose n'th
  column is given by the vector <math|\<bbb-E\><around*|[|\<b-z\><rsub|n>|]>>.
  The E step Eq. <eqref|12.54> of the EM algorithm for PCA then becomes

  <\equation>
    \<Omega\>=<around*|(|W<rsup|T><rsub|old>W<rsub|old>|)><rsup|-1>W<rsub|old><rsup|T><wide|X|~><rsup|T><label|12.58>
  </equation>

  and the M step Eq. <eqref|12.56> takes the form

  <\equation>
    W<rsub|new>=<wide|X|~><rsup|T>\<Omega\><rsup|T>(\<Omega\>\<Omega\><rsup|T>)<rsup|\<minus\>1>.<label|12.59>
  </equation>

  Again these can be implemented in an on-line form. These equations have a
  simple interpretation as follows. From our earlier discussion, we see that
  the E step involves an orthogonal projection of the data points onto the
  current estimate for the principal subspace. Correspondingly, the M step
  represents a re-estimation of the principal subspace to minimize the
  squared reconstruction error in which the projections are fixed.

  We can give a simple physical analogy for this EM algorithm, which is
  easily visualized for <math|D=2> and <math|M=1>. Consider a collection of
  data points in two dimensions, and let the one-dimensional principal
  subspace be represented by a solid rod. Now attach each data point to the
  rod via a spring obeying Hooke's law (stored energy is proportional to the
  square of the spring's length). In the E step, we keep the rod fixed and
  allow the attachment points to slide up and down the rod so as to minimize
  the energy. This causes each attachment point (independently) to position
  itself at the orthogonal projection of the corresponding data point onto
  the rod. In the M step, we keep the attachment points fixed and then
  release the rod and allow it to move to the minimum energy position. The E
  and M steps are then repeated until a suitable convergence criterion is
  satisfied, as is illustrated in Figure <reference|fig12.12>.

  <\padded-center>
    <small-figure|<image|image/fig_12_12_probabilistic_pca_limit.png|.5par|||>|<label|fig12.12>Synthetic
    data illustrating the EM algorithm for PCA defined by Eq. <eqref|12.58>
    and Eq. <eqref|12.59>. (a) A data set <math|X> with the data points shown
    in green, together with the true principal components (shown as
    eigenvectors scaled by the square roots of the eigenvalues). (b) Initial
    configuration of the principal subspace defined by <math|W>, \ shown in
    red, together with the projections of the latent points <math|Z> into the
    data space, given by <math|Z W<rsup|T>>, shown in cyan. (c) After one M
    step, the latent space has been updated with <math|Z> held fixed. (d)
    After the successive E step, the values of <math|Z> have been updated,
    giving orthogonal projections, with <math|W> held fixed. (e) After the
    second M step. (f)The converged solution.>
  </padded-center>

  <subsection|Bayesian PCA>

  \;

  So far in our discussion of PCA, we have assumed that the value <math|M>
  for the dimensionality of the principal subspace is given. In practice, we
  must choose a suitable value according to the application. For
  visualization, we generally choose <math|M=2>, whereas for other
  applications the appropriate choice for <math|M> may be less clear. One
  approach is to plot the eigenvalue spectrum for the data set, analogous to
  the example in Figure <reference|fig12.4> for the off-line digits data set,
  and look to see if the eigenvalues naturally form two groups comprising a
  set of small values separated by a significant gap from a set of relatively
  large values, indicating a natural choice for <math|M> . In practice, such
  a gap is often not seen.

  Because the probabilistic PCA model has a well-defined likelihood function,
  we could employ cross-validation to determine the value of dimensionality
  by selecting \ the largest log likelihood on a validation data set. Such an
  approach, however, can become computationally costly, particularly if we
  consider a probabilistic mixture of PCA models (Tipping and Bishop, 1999a)
  in which we seek to determine the appropriate dimensionality separately for
  each component in the mixture.

  Given that we have a probabilistic formulation of PCA, it seems natural to
  seek a Bayesian approach to model selection. To do this, we need to
  marginalize out the model parameters <math|\<b-mu\>, W>, and
  <math|\<sigma\><rsup|2>> with respect to appropriate prior distributions.
  This can be done by using a variational framework to approximate the
  analytically intractable marginalizations (Bishop, 1999b). The marginal
  likelihood values, given by the variational lower bound, can then be
  compared for a range of different values of <math|M> and the value giving
  the largest marginal likelihood selected.

  Here we consider a simpler approach based on the <em|evidence
  approximation>, which is appropriate when the number of data points is
  relatively large and the corresponding posterior distribution is tightly
  peaked (Bishop, 1999a). It involves a specific choice of prior over
  <math|W> that allows surplus dimensions in the principal subspace to be
  pruned out of the model. This corresponds to an example of <em|automatic
  relevance determination>, or ARD, discussed in Section 7.2.2. Specifically,
  we define an independent Gaussian prior over each column of <math|W>, which
  represent the vectors defining the principal subspace. Each such Gaussian
  has an independent variance governed by a precision hyperparameter
  <math|\<alpha\><rsub|i>> so that

  <\equation*>
    p<around*|(|W\|\<b-alpha\>|)>=<big|prod><rsub|i=1><rsup|M><around*|(|<frac|\<alpha\><rsub|i>|2\<pi\>>|)><rsup|D/2>exp<around*|{|-<frac|1|2>\<alpha\><rsub|i>\<b-w\><rsub|i><rsup|T>\<b-w\><rsub|i>|}>
  </equation*>

  where <math|\<b-w\><rsub|i>> is the <math|i>'th column of <math|W>. The
  resulting model can be represented using the directed graph shown in Figure
  <reference|fig12.13>.

  <\padded-center>
    <small-figure|<image|image/fig_12_13_bayesian_pca_model.png|.2par|||>|<label|fig12.13>Probabilistic
    graphical model for Bayesian PCA in \ which the distribution over the
    parameter matrix <math|W> is governed by a vector <math|\<b-alpha\>> of
    hyperparameters.>
  </padded-center>

  The values for <math|\<alpha\><rsub|i>> will be found iteratively by
  maximizing the marginal likelihood function in which <math|W> has been
  integrated out. As a result of this optimization, some of the
  <math|\<alpha\><rsub|i>> may be driven to infinity, with the corresponding
  parameters vector <math|\<b-w\><rsub|i>> being driven to zero (the
  posterior distribution becomes a delta function at the origin) giving a
  sparse solution. The effective dimensionality of the principal subspace is
  then determined by the number of finite <math|\<alpha\><rsub|i>> values,
  and the corresponding vectors <math|\<b-w\><rsub|i>> can be thought of as
  `relevant' for modelling the data distribution. In this way, the Bayesian
  approach is automatically making the trade-off between improving the fit to
  the data, by using a larger number of vectors <math|\<b-w\><rsub|i>> with
  their corresponding eigenvalues <math|\<lambda\><rsub|i>> each tuned to the
  data, and reducing the complexity of the model by suppressing some of the
  <math|\<b-w\><rsub|i>> vectors. The origins of this sparsity were discussed
  earlier in the context of relevance vector machines.

  The values of <math|\<alpha\><rsub|i>> are re-estimated during training by
  maximizing the marginal likelihood given by

  <\equation*>
    p<around*|(|X\|\<b-alpha\>,\<b-mu\>,\<sigma\><rsup|2>|)>=<big|int>p<around*|(|X\|W,\<b-mu\>,\<sigma\><rsup|2>|)>p<around*|(|W\|\<b-alpha\>|)>\<mathd\>W
  </equation*>

  where the log of <math|p(X\|W,\<b-mu\>,\<sigma\><rsup|2>)> is given by Eq.
  <eqref|12.43>. Note that for simplicity we also treat <math|\<b-mu\>> and
  <math|\<sigma\><rsup|2>> as parameters to be estimated, rather than
  defining priors over these parameters.

  Because this integration is intractable, we make use of the Laplace
  approximation. If we assume that the posterior distribution is sharply
  peaked, as will occur for \ sufficiently large data sets, then the
  re-estimation equations obtained by maximizing the marginal likelihood with
  respect to <math|\<alpha\><rsub|i>> take the simple form

  <\equation*>
    \<alpha\><rsub|i><rsup|new>=<frac|D|\<b-w\><rsub|i><rsup|T>\<b-w\><rsub|i>>
  </equation*>

  which follows from (3.98), noting that the dimensionality of
  <math|\<b-w\><rsub|i>> is <math|D>. These reestimations are interleaved
  with the EM algorithm updates for determining <math|W> and
  <math|\<sigma\><rsup|2>>. The E-step equations are again given by Eq.
  <eqref|12.54> and <eqref|12.55>. Similarly, the M step equation for
  <math|\<sigma\><rsup|2>> is again given by Eq. <eqref|12.57>. The only
  change is to the M-step equation for <math|W>, which is modified to give

  <\equation*>
    W<rsub|new>=<around*|[|<big|sum><rsub|n=1><rsup|N><around*|(|\<b-x\><rsub|n>-<wide|\<b-x\>|\<wide-bar\>>|)>\<bbb-E\><around*|[|\<b-z\><rsub|n>|]><rsup|T>|]><around*|[|<big|sum><rsub|n=1><rsup|N>\<bbb-E\><around*|[|\<b-z\><rsub|n>\<b-z\><rsub|n><rsup|T>|]>+\<sigma\><rsup|2>A|]><rsup|-1>
  </equation*>

  where <math|A=diag(\<alpha\><rsub|i>)>. The value of <math|\<b-mu\>> is
  given by the sample mean, as before.

  If we choose <math|M = D \<minus\> 1> then, if all <math|\<alpha\><rsub|i>>
  values are finite, the model represents a full-covariance Gaussian, while
  if all the <math|\<alpha\><rsub|i>> go to infinity the model is equivalent
  to an isotropic Gaussian, and so the model can encompass all permissible
  values for the effective dimensionality of the principal subspace. It is
  also possible to consider smaller values of M , which will save on
  computational cost but which will limit the maximum dimensionality of the
  subspace. A comparison of the results of this algorithm with standard
  probabilistic PCA is shown in Figure <reference|fig12.14>.

  <\padded-center>
    <small-figure|<image|image/fig_12_14_bayesian_pca_w.png|.5par|||>|<label|fig12.14>`Hinton'
    diagrams of the matrix <math|W> in which each element of the matrix is
    depicted as a square (white for positive and black for negative values)
    whose area is proportional to the magnitude of that element. The
    synthetic data set comprises 300 data points in <math|D = 10> dimensions
    sampled from a Gaussian distribution having standard deviation 1.0 in 3
    directions and standard deviation 0.5 in the remaining 7 directions for a
    data set in <math|D=10> dimensions having <math|M=3> directions with
    larger variance than the remaining 7 directions. The left-hand plot shows
    the result from maximum likelihood probabilistic PCA, and the right-hand
    plot shows the corresponding result from Bayesian PCA. We see how the
    Bayesian model is able to discover the appropriate dimensionality by
    suppressing the 6 surplus degrees of freedom.>
  </padded-center>

  Bayesian PCA provides an opportunity to illustrate the Gibbs sampling
  algorithm discussed in Section 11.3. Figure <reference|fig12.15> shows an
  example of the samples from the hyperparameters <math|ln \<alpha\><rsub|i>>
  for a data set in <math|D=4> dimensions in which the dimensionality of the
  latent space is <math|M=3> but in which the data set is generated from a
  probabilistic PCA model having one direction of high variance, with the
  remaining directions comprising low variance noise. This result shows
  clearly the presence of three distinct modes in the posterior distribution.
  At each step of the iteration, one of the hyperparameters has a small value
  and the remaining two have large values, so that two of the three latent
  variables are suppressed. During the course of the Gibbs sampling, the
  solution makes sharp transitions between the three modes.

  <\padded-center>
    <small-figure|<image|image/fig_12_15_bayesian_pca_gibs.png|.3par|||>|<label|fig12.15>Gibbs
    sampling for Bayesian \ PCA showing plots of ln <math|\<alpha\><rsub|i>>
    versus iteration number for three <math|\<alpha\>> values, showing
    transitions between the three modes of the posterior distribution.>
  </padded-center>

  The model described here involves a prior only over the matrix <math|W>. A
  fully Bayesian treatment of PCA, including priors over <math|\<b-mu\>,
  \<sigma\><rsup|2>>, and <math|\<b-alpha\>>, and solved using variational
  methods, is described in Bishop (1999b). For a discussion of various
  Bayesian approaches to determining the appropriate dimensionality for a PCA
  model, see Minka (2001c).

  <subsection|Factor analysis>

  Factor analysis is a linear-Gaussian latent variable model that is closely
  related to probabilistic PCA. Its definition differs from that of
  probabilistic PCA only in that the conditional distribution of the observed
  variable <math|\<b-x\>> given the latent variable <math|\<b-x\>> is taken
  to have a diagonal rather than an isotropic covariance so that

  <\equation*>
    p(\<b-x\>\|\<b-z\>)=\<cal-N\>(\<b-x\>\|W\<b-z\>+\<b-mu\>,\<Psi\>)
  </equation*>

  where <math|\<Psi\>> is a <math|D\<times\>D> diagonal matrix. Note that the
  factor analysis model, in common with probabilistic PCA, assumes that the
  observed variables <math|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|D>> are
  independent, given the latent variable <math|\<b-z\>>. In essence, the
  factor analysis model is explaining the observed covariance structure of
  the data by representing the independent variance associated with each
  coordinate in the matrix <math|\<Psi\>> and capturing the covariance
  between variables in the matrix <math|W>. In the factor analysis
  literature, the columns of <math|W>, which capture the correlations between
  observed variables, are called <em|factor loadings>, and the diagonal
  elements of \<Psi\>, which represent the independent noise variances for
  each of the variables, are called <em|uniquenesses>.

  The origins of factor analysis are as old as those of PCA, and discussions
  of factor analysis can be found in the books by Everitt (1984), Bartholomew
  (1987), and Basilevsky (1994). Links between factor analysis and PCA were
  investigated by Lawley (1953) and Anderson (1963) who showed that at
  stationary points of the likelihood function, for a factor analysis model
  with <math|\<Psi\>=\<sigma\><rsup|2>I>, the columns of <math|W> are scaled
  eigenvectors of the sample covariance matrix, and <math|\<sigma\><rsup|2>>
  is the average of the discarded eigenvalues. Later, Tipping and Bishop
  (1999b) showed that the maximum of the log likelihood function occurs when
  the eigenvectors comprising <math|W> are chosen to be the principal
  eigenvectors.

  Making use of (2.115), we see that the marginal distribution for the
  observed variable is given by\ 

  <\equation*>
    p(\<b-x\>) = \<cal-N\> (\<b-x\>\|\<b-mu\>, C)\ 
  </equation*>

  where now

  <\equation*>
    C = W W<rsup|T>+\<Psi\>.
  </equation*>

  As with probabilistic PCA, this model is invariant to rotations in the
  latent space.

  Historically, factor analysis has been the subject of controversy when
  attempts have been made to place an interpretation on the individual
  factors (the coordinates in z-space), which has proven problematic due to
  the nonidentifiability of factor analysis associated with rotations in this
  space. From our perspective, however, we shall view factor analysis as a
  form of latent variable density model, in which the form of the latent
  space is of interest but not the particular choice of coordinates used to
  describe it. If we wish to remove the degeneracy associated with latent
  space rotations, we must consider non-Gaussian latent variable
  distributions, giving rise to Section 12.4 independent component analysis
  (ICA) models.

  We can determine the parameters <math|\<b-mu\>>, <math|W>, and
  <math|\<Psi\>> in the factor analysis model by maximum likelihood. The
  solution for <math|\<b-mu\>> is again given by the sample mean. However,
  unlike probabilistic PCA, there is no longer a closed-form maximum
  likelihood solution for <math|W>, which must therefore be found
  iteratively. Because factor analysis is a latent variable model, this can
  be done using an EM algorithm (Rubin and Thayer, \ 1982) that is analogous
  to the one used for probabilistic PCA. Specifically, the E-step equations
  are given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<b-z\><rsub|n>|]>>|<cell|=>|<cell|G
    W<rsup|T>\<Psi\><rsup|-1><around*|(|\<b-x\><rsub|n>-<wide|\<b-x\>|\<wide-bar\>>|)>>>|<row|<cell|\<bbb-E\><around*|[|\<b-z\><rsub|n>\<b-z\><rsub|n><rsup|T>|]>>|<cell|=>|<cell|G+\<bbb-E\><around*|[|\<b-z\><rsub|n>|]>\<bbb-E\><around*|[|\<b-z\><rsub|n>|]><rsup|T>>>>>
  </eqnarray*>

  where we have defined \ 

  <\equation*>
    G = (I + W<rsup|T>\<Psi\><rsup|\<minus\>1>W)<rsup|\<minus\>1>.
  </equation*>

  Note that this is expressed in a form that involves inversion of matrices
  of size <math|M\<times\>M> rather than <math|D\<times\>D> (except for the
  <math|D\<times\>D> diagonal matrix <math|\<Psi\>> whose inverse is trivial
  to compute in <math|O(D)> steps), which is convenient because often
  <math|M\<ll\>D>. Similarly, the M-step equations take the form

  <\eqnarray*>
    <tformat|<table|<row|<cell|W<rsub|new>>|<cell|=>|<cell|<around*|[|<big|sum><rsub|n=1><rsup|N><around*|(|\<b-x\><rsub|n>-<wide|\<b-x\>|\<wide-bar\>>|)>\<bbb-E\><around*|[|\<b-z\><rsub|n>|]><rsup|T>|]><around*|[|<big|sum><rsub|n=1><rsup|N>\<bbb-E\><around*|[|\<b-z\><rsub|n>\<b-z\><rsub|n><rsup|T>|]>|]><rsup|-1>>>|<row|<cell|\<Psi\><rsub|new>>|<cell|=>|<cell|diag<around*|{|S-W<rsub|new><frac|1|N><big|sum><rsub|n=1><rsup|N>\<bbb-E\><around*|[|\<b-z\><rsub|n>|]><around*|(|\<b-x\><rsub|n>-<wide|\<b-x\>|\<wide-bar\>>|)><rsup|T>|}>>>>>
  </eqnarray*>

  where the `diag' operator sets all of the nondiagonal elements of a matrix
  to zero. A Bayesian treatment of the factor analysis model can be obtained
  by a straightforward application of the techniques discussed in this book.

  Another difference between probabilistic PCA and factor analysis concerns
  their different behaviour under transformations of the data set. For PCA
  and probabilistic PCA, if we rotate the coordinate system in data space,
  then we obtain exactly the same fit to the data but with the <math|W>
  matrix transformed by the corresponding rotation matrix. However, for
  factor analysis, the analogous property is that if we make a component-wise
  re-scaling of the data vectors, then this is absorbed into a corresponding
  re-scaling of the elements of \<Psi\>.

  <section|Kernel PCA>

  \;

  In Chapter 6, we saw how the technique of kernel substitution allows us to
  take an algorithm expressed in terms of scalar products of the form
  <math|\<b-x\><rsup|T>\<b-x\><rprime|'>> and generalize that algorithm by
  replacing the scalar products with a nonlinear kernel. Here we apply this
  technique of kernel substitution to principal component analysis, thereby
  obtaining a nonlinear generalization called <em|kernel PCA>
  (Sch<wide|o|\<ddot\>>lkopf et al., 1998).

  Consider a data set <math|<around*|{|\<b-x\><rsub|n>|}>> of observations,
  where <math|n=1,\<cdots\>,N> , in a space of dimensionality <math|D>. In
  order to keep the notation uncluttered, we shall assume that we have
  already subtracted the sample mean from each of the vectors
  <math|\<b-x\><rsub|n>>, so that \ <math|<big|sum><rsub|n>\<b-x\><rsub|n>=\<b-0\>>.
  The first step is to express conventional PCA in such a form that the data
  vectors <math|<around*|{|\<b-x\><rsub|n>|}>> appear only in the form of the
  scalar products <math|\<b-x\><rsub|n><rsup|T>\<b-x\><rsub|m>>. Recall that
  the principal components are defined by the eigenvectors
  <math|\<b-u\><rsub|i>> of the covariance matrix

  <\equation*>
    S \<b-u\><rsub|i>=\<lambda\><rsub|i>\<b-u\><rsub|i>
  </equation*>

  where <math|i=1,\<cdots\>,D>. Here the <math|D\<times\>D> sample covariance
  matrix <math|S> is defined by

  <\equation*>
    S=<frac|1|N><big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n>\<b-x\><rsub|n><rsup|T>
  </equation*>

  and the eigenvectors are normalized such that
  <math|\<b-u\><rsub|i><rsup|T>\<b-u\><rsub|i>=1>.

  Now consider a nonlinear transformation <math|\<b-varphi\>(\<b-x\>)> into
  an M-dimensional feature space, so that each data point
  <math|\<b-x\><rsub|n>> is thereby projected onto a point
  <math|\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>>. We can now perform
  standard PCA in the feature space, which implicitly defines a nonlinear
  principal component model in the original data space, as illustrated in
  Figure <reference|fig12.16>.

  <\padded-center>
    <small-figure|<image|image/fig_12_16_kernel_pca.png|.5par|||>|<label|fig12.16>Schematic
    illustration of kernel PCA. A data set in the original data space
    (left-hand plot) is projected by a nonlinear transformation
    <math|\<b-varphi\><around*|(|\<b-x\>|)>> into a feature space (right-hand
    plot). By performing PCA in the feature space, we obtain the principal
    components, of which the first is shown in blue and is denoted by the
    vector v1. The green lines in feature space indicate the linear
    projections onto the first principal component, which correspond to
    nonlinear projections in the original data space. Note that in general it
    is not possible to represent the nonlinear principal component by a
    vector in <math|\<b-x\>> space.>
  </padded-center>

  For the moment, let us assume that the projected data set also has zero
  mean, so that <math|<big|sum><rsub|n>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>=\<b-0\>>.
  We shall return to this point shortly. The <math|M\<times\>M> sample
  covariance matrix in feature space is given by

  <\equation*>
    C=<frac|1|N><big|sum><rsub|n=1><rsup|N>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)><rsup|T>
  </equation*>

  and its eigenvector expansion is defined by

  <\equation*>
    C\<b-v\><rsub|i>=\<lambda\><rsub|i>\<b-v\><rsub|i>
  </equation*>

  <math|i=1,\<cdots\>,M>. Our goal is to solve this eigenvalue problem
  without having to work explicitly in the feature space. From the definition
  of <math|C>, the eigenvector equations tells us that <math|\<b-v\><rsub|i>>
  satisfies

  <\equation*>
    <frac|1|N><big|sum><rsub|n=1><rsup|N>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)><around*|{|\<b-varphi\><around*|(|\<b-x\><rsub|n>|)><rsup|T>\<b-v\><rsub|i>|}>=\<lambda\><rsub|i>\<b-v\><rsub|i>
  </equation*>

  and so we see that (provided <math|\<lambda\><rsub|i>\<gtr\>0>) the vector
  <math|\<b-v\><rsub|i>> is given by a linear combination of the
  <math|\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>> and so can be written in
  the form

  <\equation>
    \<b-v\><rsub|i>=<big|sum><rsub|n=1><rsup|N>a<rsub|i
    n>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)><label|12.76>
  </equation>

  Substituting this expansion back into the eigenvector equation, we obtain

  <\equation*>
    <frac|1|N><big|sum><rsub|n=1><rsup|N>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)><rsup|T><big|sum><rsub|m=1><rsup|N>a<rsub|i
    m>\<b-varphi\><around*|(|\<b-x\><rsub|m>|)>=\<lambda\><rsub|i><big|sum><rsub|n=1><rsup|N>a<rsub|i
    n>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>
  </equation*>

  \;

  The key step is now to express this in terms of the kernel function
  <math|k(\<b-x\><rsub|n>,\<b-x\><rsub|m>)=\<b-varphi\>(\<b-x\><rsub|n>)<rsup|T>\<b-varphi\>(\<b-x\><rsub|m>)>,
  which we do by multiplying both sides by
  <math|\<b-varphi\><around*|(|\<b-x\><rsub|l>|)><rsup|T>> to give

  <\equation*>
    <frac|1|N><big|sum><rsub|n=1><rsup|N>k<around*|(|\<b-x\><rsub|l>,\<b-x\><rsub|n>|)><big|sum><rsub|m=1><rsup|N>a<rsub|i
    m>k<around*|(|\<b-x\><rsub|n>,\<b-x\><rsub|m>|)>=\<lambda\><rsub|i><big|sum><rsub|n=1><rsup|N>a<rsub|i
    n>k<around*|(|\<b-x\><rsub|l>,\<b-x\><rsub|n>|)>
  </equation*>

  This can be written in matrix notation as

  <\equation>
    K<rsup|2>\<b-a\><rsub|i>=\<lambda\><rsub|i>N
    K\<b-a\><rsub|i><label|12.79>
  </equation>

  where <math|\<b-a\><rsub|i>> is an N-dimensional column vector with
  elements <math|a<rsub|i n>> for <math|n=1,\<cdots\>,N>. We can find
  solutions for <math|\<b-a\><rsub|i>> by solving the following eigenvalue
  problem

  <\equation>
    K\<b-a\><rsub|i>=\<lambda\><rsub|i>N\<b-a\><rsub|i><label|12.80>
  </equation>

  in which we have removed a factor of <math|K> from both sides of Eq.
  <eqref|12.79>. Note that the solutions of Eq. <eqref|12.79> and Eq.
  <eqref|12.80> differ only by eigenvectors of <math|K> having zero
  eigenvalues that do not affect the principal components projection.

  The normalization condition for the coefficients <math|\<b-a\><rsub|i>> is
  obtained by requiring that the eigenvectors in feature space be normalized.
  Using Eq. <eqref|12.76> and <eqref|12.80>, we have

  <\eqnarray*>
    <tformat|<table|<row|<cell|1>|<cell|=>|<cell|\<b-v\><rsub|i><rsup|T>\<b-v\><rsub|i>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N><big|sum><rsub|m=1><rsup|N>a<rsub|i
    n>a<rsub|i m>\<b-varphi\>*<around*|(|\<b-x\><rsub|n>|)><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|m>|)>>>|<row|<cell|>|<cell|=>|<cell|\<b-a\><rsub|i><rsup|T>K\<b-a\><rsub|i>>>|<row|<cell|>|<cell|=>|<cell|\<lambda\><rsub|i>N\<b-a\><rsub|i><rsup|T>\<b-a\><rsub|i>>>>>
  </eqnarray*>

  Having solved the eigenvector problem, the resulting principal component
  projections can then also be cast in terms of the kernel function so that,
  using Eq. <eqref|12.76>, the projection of a point <math|\<b-x\>> onto
  eigenvector <math|i> is given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|y<rsub|i><around*|(|\<b-x\>|)>>|<cell|=>|<cell|\<b-varphi\><around*|(|\<b-x\>|)><rsup|T>\<b-v\><rsub|i>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>a<rsub|i
    n>\<b-varphi\><around*|(|\<b-x\>|)><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>a<rsub|i
    n>k<around*|(|\<b-x\>,\<b-x\><rsub|n>|)>>>>>
  </eqnarray*>

  and so again is expressed in terms of the kernel function.

  In the original D-dimensional <math|\<b-x\>> space there are <math|D>
  orthogonal eigenvectors and hence we can find at most <math|D> linear
  principal components. The dimensionality <math|M> of the feature space,
  however, can be much larger than <math|D> (even infinite), and thus we can
  find a number of nonlinear principal components that can exceed <math|D>.
  Note, however, that the number of nonzero eigenvalues cannot exceed the
  number <math|N> of data points, because (even if <math|M\<gtr\>N> ) the
  covariance matrix in feature space has rank at most equal to <math|N>. This
  is reflected in the fact that kernel PCA involves the eigenvector expansion
  of the <math|N\<times\>N> matrix <math|K>.

  So far we have assumed that the projected data set given by
  <math|\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>> has zero mean, which in
  general will not be the case. We cannot simply compute and then subtract
  off the mean, since we wish to avoid working directly in feature space, and
  so again, we formulate the algorithm purely in terms of the kernel
  function. The projected data points after centralizing, denoted
  <math|<wide|\<b-varphi\>|~><around*|(|\<b-x\><rsub|n>|)>>, are given by

  <\equation*>
    <wide|\<b-varphi\>|~><around*|(|\<b-x\><rsub|n>|)>=\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>-<frac|1|N><big|sum><rsub|l=1><rsup|N>\<b-varphi\><around*|(|\<b-x\><rsub|l>|)>
  </equation*>

  and the corresponding elements of the Gram matrix are given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|<wide|K|~><rsub|n
    m>>|<cell|=>|<cell|<wide|\<b-varphi\>|~><around*|(|\<b-x\><rsub|n>|)><wide|\<b-varphi\>|~><around*|(|\<b-x\><rsub|m>|)>>>|<row|<cell|>|<cell|=>|<cell|\<b-varphi\><around*|(|\<b-x\><rsub|n>|)><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|m>|)>-<frac|1|N><big|sum><rsub|l=1><rsup|N>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|l>|)>-<frac|1|N><big|sum><rsub|l=1><rsup|N>\<b-varphi\><around*|(|\<b-x\><rsub|L>|)><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|m>|)>+<frac|1|N<rsup|2>><big|sum><rsub|j=1><rsup|N><big|sum><rsub|l=1><rsup|N>\<b-varphi\><around*|(|\<b-x\><rsub|j>|)><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|l>|)>>>|<row|<cell|>|<cell|=>|<cell|k<around*|(|\<b-x\><rsub|n>,\<b-x\><rsub|m>|)>-<frac|1|N><big|sum><rsub|l=1><rsup|N>k<around*|(|\<b-x\><rsub|l>,\<b-x\><rsub|m>|)>-<frac|1|N><big|sum><rsub|l=1><rsup|N>k<around*|(|\<b-x\><rsub|n>,\<b-x\><rsub|l>|)>+<frac|1|N<rsup|2>><big|sum><rsub|j=1><rsup|N><big|sum><rsub|l=1><rsup|N>k<around*|(|\<b-x\><rsub|j>,\<b-x\><rsub|l>|)>>>>>
  </eqnarray*>

  This can be expressed in matrix notation as

  <\equation*>
    <wide|K|~>=K-\<b-1\><rsub|N>K-K\<b-1\><rsub|N>+\<b-1\><rsub|N>K\<b-1\><rsub|N>
  </equation*>

  where <math|\<b-1\><rsub|N>> denotes the <math|N\<times\>N> matrix in which
  every element takes the value <math|1/N> . \ Thus we can evaluate
  <math|<wide|K|~>> using only the kernel function and then use
  <math|<wide|K|~>> to determine the eigenvalues and eigenvectors. Note that
  the standard PCA algorithm is recovered as a special case if we use a
  linear kernel <math|k(\<b-x\>,\<b-x\><rprime|'>)=\<b-x\><rsup|T>\<b-x\><rprime|'>>.
  Figure <reference|fig12.17> shows an \ example of kernel PCA applied to a
  synthetic data set (Sch<wide|o|\<ddot\>>lkopf et al., 1998). Here a
  `Gaussian' kernel of the form

  <\equation*>
    k(\<b-x\>,\<b-x\><rprime|'>)=exp(\<minus\>\<\|\|\>\<b-x\>
    \<minus\>\<up-x\><rprime|'>\<\|\|\><rsup|2>/0.1)
  </equation*>

  is applied to a synthetic data set. The lines correspond to contours along
  which the projection onto the corresponding principal component, defined by
  \ 

  <\equation*>
    \<b-varphi\>(\<b-x\>)<rsup|T>\<b-v\><rsub|i>=<big|sum><rsub|n=1><rsup|N>a<rsub|i
    n>k(\<b-x\>,\<b-x\><rsub|n>)
  </equation*>

  is constant.

  <\padded-center>
    <small-figure|<image|image/fig_12_17_kernel_pca_example.png|.7par|||>|<label|fig12.17>Example
    of kernel PCA, with a Gaussian kernel applied to a synthetic data set in
    two dimensions, showing the first eight eigenfunctions along with their
    eigenvalues. The contours are lines along which the projection onto the
    corresponding principal component is constant. Note how the first two
    eigenvectors separate the three clusters, the next three eigenvectors
    split each of the cluster into halves, and the following three
    eigenvectors again split the clusters into halves along directions
    orthogonal to the previous splits.>
  </padded-center>

  One obvious disadvantage of kernel PCA is that it involves finding the
  eigenvectors of the <math|N\<times\>N> matrix <math|<wide|K|~>> rather than
  the <math|D\<times\>D> matrix <math|S> of conventional linear PCA, and so
  in practice for large data sets approximations are often used.

  Finally, we note that in standard linear PCA, we often retain some reduced
  number <math|L\<less\>D> of eigenvectors and then approximate a data vector
  <math|\<b-x\><rsub|n>> by its projection <math|<wide|\<b-x\>|^><rsub|n>>
  onto the L-dimensional principal subspace, defined by

  <\equation*>
    <wide|\<b-x\>|^><rsub|n>=<big|sum><rsub|i=1><rsup|L><around*|(|\<b-x\><rsub|n><rsup|T>\<b-u\><rsub|i>|)>\<b-u\><rsub|i>
  </equation*>

  In kernel PCA, this will in general not be possible. To see this, note that
  the mapping <math|\<b-varphi\><around*|(|\<b-x\>|)>> maps the D-dimensional
  <math|\<b-x\>> space into a D-dimensional <em|manifold> in the
  M-dimensional feature space <math|\<b-varphi\>>. The vector <math|\<b-x\>>
  is known as the pre-image of the corresponding point
  <math|\<b-varphi\><around*|(|\<b-x\>|)>>. However, the projection of points
  in feature space onto the linear PCA subspace in that space will typically
  not lie on the nonlinear D-dimensional manifold and so will not have a
  corresponding pre-image in data space. Techniques have therefore been
  proposed for finding approximate pre-images (Bakir et al., 2004)

  <section|Nonlinear Latent Variable Models>

  \;

  In this chapter, we have focussed on the simplest class of models having
  continuous latent variables, namely those based on linear-Gaussian
  distributions. As well as having great practical importance, these models
  are relatively easy to analyse and to fit to data and can also be used as
  components in more complex models. Here we consider briefly some
  generalizations of this framework to models that are either nonlinear or
  non-Gaussian, or both.

  In fact, the issues of nonlinearity and non-Gaussianity are related because
  a general probability density can be obtained from a simple fixed reference
  density, such as a Gaussian, by making a nonlinear change of variables.
  This idea forms the \ basis of several practical latent variable models as
  we shall see shortly.

  <subsection|Independent component analysis>

  \;

  We begin by considering models in which the observed variables are related
  linearly to the latent variables, but for which the latent distribution is
  non-Gaussian. An important class of such models, known as<em| independent
  component analysis>, or ICA, arises when we consider a distribution over
  the latent variables that factorizes, so that \ 

  <\equation*>
    p(z) = \ <big|sum><rsub|j=1><rsup|M>p(z<rsub|j>)
  </equation*>

  \ \ To understand the role of such models, consider a situation in which
  two people are talking at the same time, and we record their voices using
  two microphones. If we ignore effects such as time delay and echoes, then
  the signals received by the microphones at any point in time will be given
  by linear combinations of the amplitudes of the two voices. The
  coefficients of this linear combination will be constant, and if we can
  infer their values from sample data, then we can invert the mixing process
  (assuming it is nonsingular) and thereby obtain two clean signals each of
  which contains the voice of just one person. This is an example of a
  problem called <em|blind source separation> in which `blind' refers to the
  fact that we are given only the mixed data, and neither the original
  sources nor the mixing coefficients are observed (Cardoso, 1998).

  This type of problem is sometimes addressed using the following approach
  (MacKay, 2003) in which we ignore the temporal nature of the signals and
  treat the successive samples as i.i.d. We consider a generative model in
  which there are two latent variables corresponding to the unobserved speech
  signal amplitudes, and there are two observed variables given by the signal
  values at the microphones. The latent variables have a joint distribution
  that factorizes as above, and the observed variables are given by a linear
  combination of the latent variables. There is no need to include a noise
  distribution because the number of latent variables equals the number of
  observed variables, and therefore the marginal distribution of the observed
  variables will not in general be singular, so the observed variables are
  simply deterministic linear combinations of the latent variables. Given a
  data set of observations, the likelihood function for this model is a
  function of the coefficients in the linear combination. The log likelihood
  can be maximized using gradient-based optimization giving rise to a
  particular version of independent component analysis.

  The success of this approach requires that the latent variables have
  non-Gaussian distributions. To see this, recall that in probabilistic PCA
  (and in factor analysis) the latent-space distribution is given by a
  zero-mean isotropic Gaussian. The model therefore cannot distinguish
  between two different choices for the latent variables where these differ
  simply by a rotation in latent space. This can be verified directly by
  noting that the marginal density Eq. <eqref|12.35>, and hence the
  likelihood function, is unchanged if we make the transformation
  <math|W\<rightarrow\>WR> where <math|R> is an orthogonal matrix satisfying
  <math|R R<rsup|T>=I>, because the matrix <math|C> given by Eq.
  <eqref|12.36> is itself invariant. Extending the model to allow more
  general Gaussian latent distributions does not change this conclusion
  because, as we have seen, such a model is equivalent to the zero-mean
  isotropic Gaussian latent variable model.

  Another way to see why a Gaussian latent variable distribution in a linear
  model is insufficient to find independent components is to note that the
  principal components represent a rotation of the coordinate system in data
  space such as to diagonalize the covariance matrix, so that the data
  distribution in the new coordinates is then uncorrelated. Although zero
  correlation is a necessary condition for independence it is not, however,
  sufficient. In practice, a common choice for the latent-variable
  \ distribution is given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|z<rsub|j>|)>>|<cell|=>|<cell|<frac|1|\<pi\>cosh<around*|(|z<rsub|j>|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|2|\<pi\><around*|(|e<rsup|z<rsub|j>>+e<rsup|-z<rsub|j>>|)>>>>>>
  </eqnarray*>

  which has heavy tails compared to a Gaussian, reflecting the observation
  that many real-world distributions also exhibit this property.

  The original ICA model (Bell and Sejnowski, 1995) was based on the
  optimization of an objective function defined by information maximization.
  One advantage of a probabilistic latent variable formulation is that it
  helps to motivate and formulate generalizations of basic ICA. For instance,
  independent factor analysis (Attias, 1999a) considers a model in which the
  number of latent and observed variables can differ, the observed variables
  are noisy, and the individual latent variables have flexible distributions
  modelled by mixtures of Gaussians. The log likelihood for this model is
  maximized using EM, and the reconstruction of the latent variables is
  approximated using a variational approach. Many other types of model have
  been considered, and there is now a huge literature on ICA and its
  applications (Jutten and Herault, 1991; Comon et al., 1991; Amari et al.,
  1996; Pearlmutter and Parra, 1997; Hyv<wide|a|\<ddot\>>rinen and Oja, 1997;
  Hinton et al., 2001; Miskin and MacKay, 2001; Hojen-Sorensen et al., 2002;
  Choudrey and Roberts, 2003; Chan et al., 2003; Stone, 2004).

  <subsection|Autoassociative neural networks>

  \;

  In Chapter 5 we considered neural networks in the context of supervised
  learning, where the role of the network is to predict the output variables
  given values for the input variables. However, neural networks have also
  been applied to unsupervised learning where they have been used for
  dimensionality reduction. This is achieved by using a network having the
  same number of outputs as inputs, and optimizing the weights so as to
  minimize some measure of the reconstruction error between inputs and
  outputs with respect to a set of training data.

  <\padded-center>
    <small-figure|<image|image/fig_12_18_autoassociativel_2_layer_ann.png|.3par|||>|<label|fig12.18>An
    autoassociative multilayer perceptron having \ two layers of weights.
    Such a network is trained to map input vectors onto themselves by
    minimization of a sum-of-squares error. Even with nonlinear units in the
    hidden layer, such a network is equivalent to linear principal component
    analysis. Links representing bias parameters have been omitted for
    clarity.>
  </padded-center>

  Consider first a multilayer perceptron of the form shown in Figure
  <reference|fig12.18>, having <math|D> inputs, <math|D> output units and
  <math|M> hidden units, with <math|M\<less\>D>. The targets used to train
  the network are simply the input vectors themselves, so that the network is
  attempting to map each input vector onto itself. Such a network is said to
  form an <em|autoassociative> mapping. Since the number of hidden units is
  smaller than the number of inputs, a perfect reconstruction of all input
  vectors is not in general possible. We therefore determine the network
  parameters <math|\<b-w\>> by minimizing an error function which captures
  the degree of mismatch between the input vectors and their reconstructions.
  In particular, we shall choose a sum-of-squares error of the form

  <\equation>
    E<around*|(|\<b-w\>|)>=<frac|1|2><big|sum><rsub|n=1><rsup|N><around*|\<\|\|\>|y<around*|(|\<b-x\><rsub|n>,\<b-w\>|)>-\<b-x\><rsub|n>|\<\|\|\>><rsup|2><label|12.91>
  </equation>

  If the hidden units have linear activation functions, then it can be shown
  that the error function has a unique global minimum, and that at this
  minimum the network performs a projection onto the M-dimensional subspace
  which is spanned by the first M principal components of the data (Bourlard
  and Kamp, 1988; Baldi and Hornik, 1989). Thus, the vectors of weights which
  lead into the hidden units in Figure <reference|fig12.18> form a basis set
  which spans the principal subspace. Note, however, that these vectors need
  not be orthogonal or normalized. This result is unsurprising, since both
  principal component analysis and the neural network are using linear
  dimensionality reduction and are minimizing the same sum-of-squares error
  function.

  It might be thought that the limitations of a linear dimensionality
  reduction could be overcome by using nonlinear (sigmoidal) activation
  functions for the hidden units in the network in Figure
  <reference|fig12.18>. However, even with nonlinear hidden units, the
  minimum error solution is again given by the projection onto the principal
  component subspace (Bourlard and Kamp, 1988). There is therefore no
  advantage in using twolayer neural networks to perform dimensionality
  reduction. Standard techniques for principal component analysis (based on
  singular value decomposition) are guaranteed to give the correct solution
  in finite time, and they also generate an ordered set of eigenvalues with
  corresponding orthonormal eigenvectors.

  <\padded-center>
    <small-figure|<image|image/fig_12_19_autoassociativel_4_layer_ann.png|.3par|||>|<label|fig12.19>Addition
    of extra hidden layers of nonlinear units gives an autoassociative
    network which can perform a nonlinear dimensionality reduction.>
  </padded-center>

  The situation is different, however, if additional hidden layers are
  permitted in the network. Consider the four-layer autoassociative network
  shown in Figure <reference|fig12.19>. Again the output units are linear,
  and the M units in the second hidden layer can also be linear, however, the
  first and third hidden layers have sigmoidal nonlinear activation
  functions. The network is again trained by minimization of the error
  function Eq. <eqref|12.91>. We can view this network as two successive
  functional mappings <math|F<rsub|1>> and <math|F<rsub|2>>, as indicated in
  Figure <reference|fig12.19>. The first mapping <math|F<rsub|1>> projects
  the original Ddimensional data onto an M-dimensional subspace
  <math|\<cal-S\>> defined by the activations of the units in the second
  hidden layer. Because of the presence of the first hidden layer of
  nonlinear units, this mapping is very general, and in particular is not
  restricted to being linear. Similarly, the second half of the network
  defines an arbitrary functional mapping from the M -dimensional space back
  into the original D-dimensional input space. This has a simple geometrical
  interpretation, as indicated for the case <math|D=3> and <math|M=2> in
  Figure <reference|fig12.20>.

  <\padded-center>
    <small-figure|<image|image/fig_12_20_autoassociativel_4_layer_ann_mapping.png|.6par|||>|<label|fig12.20>Geometrical
    interpretation of the mappings performed by the network in Figure
    <reference|fig12.19> for the case of <math|D=3> inputs and <math|M=2>
    units in the middle hidden layer. The function <math|F<rsub|2>> maps from
    an M-dimensional space <math|\<cal-S\>> into a D-dimensional space and
    therefore defines the way in which the space <math|\<cal-S\>> is embedded
    within the original <math|\<b-x\>>-space. Since the mapping
    <math|F<rsub|2>> can be nonlinear, the embedding of <math|\<cal-S\>> can
    be nonplanar, as indicated in the figure. The mapping <math|F<rsub|1>>
    then defines a projection of points in the original D-dimensional space
    into the M-dimensional subspace <math|\<cal-S\>>.>
  </padded-center>

  Such a network effectively performs a nonlinear principal component
  analysis. It has the advantage of not being limited to linear
  transformations, although it contains standard principal component analysis
  as a special case. However, training the network now involves a nonlinear
  optimization problem, since the error function Eq. <eqref|12.91> is no
  longer a quadratic function of the network parameters. Computationally
  intensive nonlinear optimization techniques must be used, and there is the
  risk of finding a suboptimal local minimum of the error function. Also, the
  dimensionality of the subspace must be specified before training the
  network.

  <subsection|Modelling nonlinear manifolds>

  \;

  As we have already noted, many natural sources of data correspond to
  lowdimensional, possibly noisy, nonlinear manifolds embedded within the
  higher dimensional observed data space. Capturing this property explicitly
  can lead to improved density modelling compared with more general methods.
  Here we consider briefly a range of techniques that attempt to do this.

  One way to model the nonlinear structure is through a combination of linear
  models, so that we make a piece-wise linear approximation to the manifold.
  This can be obtained, for instance, by using a clustering technique such as
  K-means based on Euclidean distance to partition the data set into local
  groups with standard PCA applied to each group. A better approach is to use
  the reconstruction error for cluster assignment (Kambhatla and Leen, 1997;
  Hinton et al., 1997) as then a common cost function is being optimized in
  each stage. However, these approaches still suffer from limitations due to
  the absence of an overall density model. By using probabilistic PCA it is
  straightforward to define a fully probabilistic model simply by considering
  a mixture distribution in which the components are probabilistic PCA models
  (Tipping and Bishop, 1999a). Such a model has both discrete latent
  variables, corresponding to the discrete mixture, as well as continuous
  latent variables, and the likelihood function can be maximized using the EM
  algorithm. A fully Bayesian treatment, based on variational inference
  (Bishop and Winn, 2000), allows the number of components in the mixture, as
  well as the effective dimensionalities of the individual models, to be
  inferred from the data. There are many variants of this model in which
  parameters such as the <math|W> matrix or the noise variances are tied
  across components in the mixture, or in which the isotropic noise
  distributions are replaced by diagonal ones, giving rise to a mixture of
  factor analysers (Ghahramani and Hinton, 1996a; Ghahramani and Beal, 2000).
  The mixture of probabilistic PCA models can also be extended hierarchically
  to produce an interactive data visualization algorithm (Bishop and Tipping,
  1998).

  An alternative to considering a mixture of linear models is to consider a
  single nonlinear model. Recall that conventional PCA finds a linear
  subspace that passes close to the data in a least-squares sense. This
  concept can be extended to onedimensional nonlinear surfaces in the form of
  <em|principal curves> (Hastie and Stuetzle, 1989). We can describe a curve
  in a D-dimensional data space using a vector-valued function
  <math|\<b-f\>(\<lambda\>)>, which is a vector each of whose elements is a
  function of the scalar <math|\<lambda\>>. There are many possible ways to
  parameterize the curve, of which a natural choice is the arc length along
  the curve. For any given point <math|<wide|\<b-x\>|^>> in data space, we
  can find the point on the curve that is closest in Euclidean distance. We
  denote this point by <math|\<lambda\>=g<rsub|f>(\<b-x\>)> because it
  depends on the particular curve <math|\<b-f\>(\<lambda\>)>. For a
  continuous data density <math|p(\<b-x\>)>, a principal curve is defined as
  one for which every point on the curve is the mean of all those points in
  data space that project to it, so that

  <\equation*>
    \<bbb-E\><around*|[|\<b-x\>\|g<rsub|\<b-f\>><around*|(|\<b-x\>|)>=\<lambda\>|]>=\<b-f\><around*|(|\<lambda\>|)>
  </equation*>

  For a given continuous density, there can be many principal curves. In
  practice, we are interested in finite data sets, and we also wish to
  restrict attention to smooth curves. Hastie and Stuetzle (1989) propose a
  two-stage iterative procedure for finding such principal curves, somewhat
  reminiscent of the EM algorithm for PCA. The curve is initialized using the
  first principal component, and then the algorithm alternates between a data
  projection step and curve re-estimation step. In the projection step, each
  data point is assigned to a value of \<lambda\> corresponding to the
  closest point on the curve. Then in the re-estimation step, each point on
  the curve is given by a weighted average of those points that project to
  nearby points on the curve, with points closest on the curve given the
  greatest weight. In the case where the subspace is constrained to be
  linear, the procedure converges to the first principal component and is
  equivalent to the power method for finding the largest eigenvector of the
  covariance matrix. Principal curves can be generalized to multidimensional
  manifolds called <em|principal surfaces> although these have found limited
  use due to the difficulty of data smoothing in higher dimensions even for
  two-dimensional manifolds.

  PCA is often used to project a data set onto a lower-dimensional space, for
  example two dimensional, for the purposes of visualization. Another linear
  technique with a similar aim is <em|multidimensional scaling>, or MDS (Cox
  and Cox, 2000). It finds a low-dimensional projection of the data such as
  to preserve, as closely as possible, the pairwise distances between data
  points, and involves finding the eigenvectors of the distance matrix. In
  the case where the distances are Euclidean, it gives equivalent results to
  PCA. The MDS concept can be extended to a wide variety of data types
  specified in terms of a similarity matrix, <em|giving nonmetric> MDS.

  Two other nonprobabilistic methods for dimensionality reduction and data
  visualization are worthy of mention. <em|Locally linear embedding>, or LLE
  (Roweis and Saul, 2000) first computes the set of coefficients that best
  reconstructs each data point from its neighbours. These coefficients are
  arranged to be invariant to rotations, translations, and scalings of that
  data point and its neighbours, and hence they characterize the local
  geometrical properties of the neighbourhood. LLE then maps the
  high-dimensional data points down to a lower dimensional space while
  preserving these neighbourhood coefficients. If the local neighbourhood for
  a particular data point can be considered linear, then the transformation
  can be achieved using a combination of translation, rotation, and scaling,
  such as to preserve the angles formed between the data points and their
  neighbours. Because the weights are invariant to these transformations, we
  expect the same weight values to reconstruct the data points in the
  low-dimensional space as in the high-dimensional data space. In spite of
  the nonlinearity, the optimization for LLE does not exhibit local minima.

  In <em|isometric feature mapping>, or isomap (Tenenbaum et al., 2000), the
  goal is to project the data to a lower-dimensional space using MDS, but
  where the dissimilarities are defined in terms of the <em|geodesic>
  distances measured along the manifold. For instance, if two points lie on a
  circle, then the geodesic is the arc-length distance measured around the
  circumference of the circle not the straight line distance measured along
  the chord connecting them. The algorithm first defines the neighbourhood
  for each data point, either by finding the <math|K> nearest neighbours or
  by finding all points within a sphere of radius <math|\<varepsilon\>>. A
  graph is then constructed by linking all neighbouring points and labelling
  them with their Euclidean distance. The geodesic distance between any pair
  of points is then approximated by the sum of the arc lengths along the
  shortest path connecting them (which itself is found using standard
  algorithms). Finally, metric MDS is applied to the geodesic distance matrix
  to find the low-dimensional projection.

  Our focus in this chapter has been on models for which the observed
  variables are continuous. We can also consider models having continuous
  latent variables together with discrete observed variables, giving rise to
  <em|latent trait> models (Bartholomew, 1987). In this case, the
  marginalization over the continuous latent variables, even for a linear
  relationship between latent and observed variables, cannot be performed
  analytically, and so more sophisticated techniques are required. Tipping
  (1999) uses variational inference in a model with a two-dimensional latent
  space, allowing a binary data set to be visualized analogously to the use
  of PCA to visualize continuous data. Note that this model is the dual of
  the Bayesian logistic regression problem discussed in Section 4.5. In the
  case of logistic regression we have <math|N> observations of the feature
  vector <math|\<b-varphi\><rsub|n>> which are parameterized by a single
  parameter vector <math|\<b-w\>>, whereas in the latent space visualization
  model there is a single latent space variable <math|\<b-x\>> (analogous to
  <math|\<b-varphi\>>) and <math|N> copies of the latent variable
  <math|\<b-w\><rsub|n>>. A generalization of probabilistic latent variable
  models to general exponential family distributions is described in Collins
  et al. (2002).

  We have already noted that an arbitrary distribution can be formed by
  taking a Gaussian random variable and transforming it through a suitable
  nonlinearity. This is exploited in a general latent variable model called a
  <em|density network> (MacKay, 1995; MacKay and Gibbs, 1999) in which the
  nonlinear function is governed by a multilayered neural network. If the
  network has enough hidden units, it can approximate a given nonlinear
  function to any desired accuracy. The downside of having \ such a flexible
  model is that the marginalization over the latent variables, required in
  order to obtain the likelihood function, is no longer analytically
  tractable. Instead, the likelihood is approximated using Monte Carlo
  techniques by drawing samples \ from the Gaussian prior. The
  marginalization over the latent variables then becomes a simple sum with
  one term for each sample. However, because a large number of sample points
  may be required in order to give an accurate representation of the
  marginal, this procedure can be computationally costly.

  If we consider more restricted forms for the nonlinear function, and make
  an appropriate choice of the latent variable distribution, then we can
  construct a latent variable model that is both nonlinear and efficient to
  train. The<em| generative topographic mapping>, or GTM (Bishop et al.,
  1996; Bishop et al., 1997a; Bishop et al., 1998b) uses a latent
  distribution that is defined by a finite regular grid of delta functions
  over the (typically two-dimensional) latent space. Marginalization over the
  latent space then simply involves summing over the contributions from each
  of the grid locations. The nonlinear mapping is given by a linear
  regression model that allows for general \ nonlinearity while being a
  linear function of the adaptive parameters. Note that the usual limitation
  of linear regression models arising from the curse of dimensionality does
  not arise in the context of the GTM since the manifold generally has two
  dimensions irrespective of the dimensionality of the data space. A
  consequence of these two choices is that the likelihood function can be
  expressed analytically in closed form and can be optimized efficiently
  using the EM algorithm. The resulting GTM model fits a two-dimensional
  nonlinear manifold to the data set, and by evaluating the posterior
  distribution over latent space for the data points, they can be projected
  back to the latent space for visualization purposes. Figure
  <reference|fig12.21> shows a comparison of the oil data set visualized with
  linear PCA and with the nonlinear GTM.

  <\padded-center>
    <small-figure|<image|image/fig_12_21_gtm.png|.7par|||>|<label|fig12.21>Plot
    of the oil flow data set visualized using PCA on the left and GTM on the
    right. For the GTM model, each data point is plotted at the mean of its
    posterior distribution in latent space. The nonlinearity of the GTM model
    allows the separation between the groups of data points to be seen more
    clearly.>
  </padded-center>

  The GTM can be seen as a probabilistic version of an earlier model called
  the self organizing map, or SOM (Kohonen, 1982; Kohonen, 1995), which also
  represents a two-dimensional nonlinear manifold as a regular array of
  discrete points. The SOM is somewhat reminiscent of the K-means algorithm
  in that data points are assigned to nearby prototype vectors that are then
  subsequently updated. Initially, the prototypes are distributed at random,
  and during the training process they `self organize' so as to approximate a
  smooth manifold. Unlike K-means, however, the SOM is not optimizing any
  well-defined cost function (Erwin et al., 1992) making it difficult to set
  the parameters of the model and to assess convergence. There is also no
  guarantee that the `self-organization' will take place as this is dependent
  on the choice of appropriate parameter values for any particular data set.

  By contrast, GTM optimizes the log likelihood function, and the resulting
  model defines a probability density in data space. In fact, it corresponds
  to a constrained mixture of Gaussians in which the components share a
  common variance, and the means are constrained to lie on a smooth
  two-dimensional manifold. This probabilistic foundation also makes it very
  straightforward to define generalizations of GTM (Bishop et al., 1998a)
  such as a Bayesian treatment, dealing with missing values, a principled
  extension to discrete variables, the use of Gaussian processes to \ define
  the manifold, or a hierarchical GTM model (Tino and Nabney, 2002).

  Because the manifold in GTM is defined as a continuous surface, not just at
  the prototype vectors as in the SOM, it is possible to compute the
  <em|magnification factors> corresponding to the local expansions and
  compressions of the manifold needed to fit the data set (Bishop et al.,
  1997b) as well as the <em|directional curvatures> of the manifold (Tino et
  al., 2001). These can be visualized along with the projected data and
  provide additional insight into the model.
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|12.1|<tuple|1.1|3>>
    <associate|12.10|<tuple|1.4|4>>
    <associate|12.12|<tuple|1.5|4>>
    <associate|12.13|<tuple|1.6|4>>
    <associate|12.17|<tuple|1.7|5>>
    <associate|12.28|<tuple|1.8|9>>
    <associate|12.3|<tuple|1.2|3>>
    <associate|12.30|<tuple|1.9|9>>
    <associate|12.31|<tuple|1.10|10>>
    <associate|12.32|<tuple|1.11|10>>
    <associate|12.33|<tuple|1.12|10>>
    <associate|12.35|<tuple|1.13|11>>
    <associate|12.36|<tuple|1.14|11>>
    <associate|12.41|<tuple|1.15|12>>
    <associate|12.42|<tuple|1.16|12>>
    <associate|12.43|<tuple|1.17|12>>
    <associate|12.46|<tuple|1.18|13>>
    <associate|12.54|<tuple|1.19|15>>
    <associate|12.55|<tuple|1.20|15>>
    <associate|12.56|<tuple|1.21|15>>
    <associate|12.57|<tuple|1.22|15>>
    <associate|12.58|<tuple|1.23|16>>
    <associate|12.59|<tuple|1.24|16>>
    <associate|12.76|<tuple|1.25|22>>
    <associate|12.79|<tuple|1.26|22>>
    <associate|12.80|<tuple|1.27|22>>
    <associate|12.9|<tuple|1.3|4>>
    <associate|12.91|<tuple|1.28|26>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1.5|6>>
    <associate|auto-11|<tuple|1.6|7>>
    <associate|auto-12|<tuple|1.7|8>>
    <associate|auto-13|<tuple|1.8|8>>
    <associate|auto-14|<tuple|1.1.4|8>>
    <associate|auto-15|<tuple|1.2|9>>
    <associate|auto-16|<tuple|1.9|11>>
    <associate|auto-17|<tuple|1.2.1|12>>
    <associate|auto-18|<tuple|1.10|12>>
    <associate|auto-19|<tuple|1.2.2|15>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-20|<tuple|1.11|16>>
    <associate|auto-21|<tuple|1.12|17>>
    <associate|auto-22|<tuple|1.2.3|17>>
    <associate|auto-23|<tuple|1.13|18>>
    <associate|auto-24|<tuple|1.14|19>>
    <associate|auto-25|<tuple|1.15|19>>
    <associate|auto-26|<tuple|1.2.4|19>>
    <associate|auto-27|<tuple|1.3|21>>
    <associate|auto-28|<tuple|1.16|21>>
    <associate|auto-29|<tuple|1.17|24>>
    <associate|auto-3|<tuple|1.1|2>>
    <associate|auto-30|<tuple|1.4|24>>
    <associate|auto-31|<tuple|1.4.1|24>>
    <associate|auto-32|<tuple|1.4.2|26>>
    <associate|auto-33|<tuple|1.18|26>>
    <associate|auto-34|<tuple|1.19|27>>
    <associate|auto-35|<tuple|1.20|27>>
    <associate|auto-36|<tuple|1.4.3|27>>
    <associate|auto-37|<tuple|1.21|30>>
    <associate|auto-4|<tuple|1.2|2>>
    <associate|auto-5|<tuple|1.1.1|2>>
    <associate|auto-6|<tuple|1.1.2|3>>
    <associate|auto-7|<tuple|1.1.3|5>>
    <associate|auto-8|<tuple|1.3|6>>
    <associate|auto-9|<tuple|1.4|6>>
    <associate|fig12.1|<tuple|1.1|1>>
    <associate|fig12.10|<tuple|1.10|12>>
    <associate|fig12.11|<tuple|1.11|16>>
    <associate|fig12.12|<tuple|1.12|17>>
    <associate|fig12.13|<tuple|1.13|18>>
    <associate|fig12.14|<tuple|1.14|19>>
    <associate|fig12.15|<tuple|1.15|19>>
    <associate|fig12.16|<tuple|1.16|21>>
    <associate|fig12.17|<tuple|1.17|24>>
    <associate|fig12.18|<tuple|1.18|26>>
    <associate|fig12.19|<tuple|1.19|27>>
    <associate|fig12.2|<tuple|1.2|2>>
    <associate|fig12.20|<tuple|1.20|27>>
    <associate|fig12.21|<tuple|1.21|30>>
    <associate|fig12.3|<tuple|1.3|6>>
    <associate|fig12.4|<tuple|1.4|6>>
    <associate|fig12.5|<tuple|1.5|6>>
    <associate|fig12.6|<tuple|1.6|7>>
    <associate|fig12.7|<tuple|1.7|8>>
    <associate|fig12.9|<tuple|1.9|11>>
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

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.2>||Principal
      component analysis seeks a space \ of lower dimensionality, known as
      the principal subspace and denoted by the magenta line, such that the
      orthogonal projection of the data points (red dots) onto this subspace
      maximizes the variance of the projected points (green dots). An
      alternative definition of PCA is based on minimizing the sum-of-squares
      of the projection errors, indicated by the blue
      lines.>|<pageref|auto-4>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.3>||The mean vector
      <with|mode|<quote|math>|<wide|\<b-x\>|\<wide-bar\>>> along with the
      first four PCA eigenvectors <with|mode|<quote|math>|\<b-u\><rsub|1>,\<cdots\>,\<b-u\><rsub|4>>
      for the off-line digits data set, together with the corresponding
      eigenvalues.>|<pageref|auto-8>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.4>||(a) Plot of the
      eigenvalue spectrum for the off-line digits data set. (b) Plot of the
      sum of the discarded eigenvalues, which represents the sum-of-squares
      distortion <with|mode|<quote|math>|J> introduced by projecting the data
      onto a principal component subspace of dimensionality
      <with|mode|<quote|math>|M> .>|<pageref|auto-9>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.5>||An original
      example from the off-line digits data set together with its PCA
      reconstructions \ obtained by retaining M principal components for
      various values of M . As <with|mode|<quote|math>|M> increases the
      reconstruction becomes more accurate and would become perfect when
      <with|mode|<quote|math>|M = D = 28 \<times\> 28 =
      784.>>|<pageref|auto-10>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.6>||Illustration of
      the effects of linear pre-processing applied to the Old Faithful data
      set. The plot on the left shows the original data. The centre plot
      shows the result of standardizing the individual variables to zero mean
      and unit variance. Also shown are the principal axes of this normalized
      data set, plotted over the range \ <with|mode|<quote|math>|\<pm\>\<lambda\><rsub|i><rsup|1/2
      >> . The plot on the right shows the result of whitening of the data to
      give it zero mean and unit covariance.>|<pageref|auto-11>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.7>||A comparison of
      principal component analysis with Fisher's linear discriminant for
      linear dimensionality reduction. Here the data in two dimensions,
      belonging to two classes shown in red and blue, is to be projected onto
      a single dimension. PCA chooses the direction of maximum variance,
      shown by the magenta curve, which leads to strong class overlap,
      whereas the Fisher linear discriminant takes account of the class
      labels and leads to a projection onto the green curve giving much
      better class separation.>|<pageref|auto-12>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.8>||Visualization of
      the oil flow data set obtained \ by projecting the data onto the first
      two principal components. The red, blue, and green points correspond to
      the `laminar', `homogeneous', and `annular' flow configurations
      respectively.>|<pageref|auto-13>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.9>||An illustration
      of the generative view of the probabilistic PCA model for a
      two-dimensional data space and a one-dimensional latent space. An
      observed data point <with|mode|<quote|math>|\<b-x\>> is generated by
      first drawing a value <with|mode|<quote|math>|<wide|z|^>> for the
      latent variable from its prior distribution
      <with|mode|<quote|math>|p(z)> and then drawing a value for
      <with|mode|<quote|math>|\<b-x\>> from an isotropic Gaussian
      \ distribution (illustrated by the red circles) having mean
      <with|mode|<quote|math>|\<b-w\><wide|z|^>+\<b-mu\>> and covariance
      <with|mode|<quote|math>|\<sigma\><rsup|2>I>. The green ellipses show
      the density contours for the marginal distribution
      <with|mode|<quote|math>|p(\<b-x\>)>.>|<pageref|auto-16>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.10>||The
      probabilistic PCA model for a data set of <with|mode|<quote|math>|N>
      observations of <with|mode|<quote|math>|\<b-x\>> can be expressed as a
      directed graph in which each observation
      <with|mode|<quote|math>|\<b-x\><rsub|n>> is associated with a value
      <with|mode|<quote|math>|\<b-z\><rsub|n>> of the latent
      variable.>|<pageref|auto-18>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.11>||Probabilistic
      PCA visualization of a portion of the oil flow data set for the first
      100 data points. The left-hand plot shows the posterior mean
      projections of the data points on the principal subspace. The
      right-hand plot is obtained by first randomly omitting
      <with|mode|<quote|math>|30%> of the variable values and then using EM
      to handle the missing values. Note that each data point then has at
      least one missing measurement but that the plot is very similar to the
      one obtained without missing values.>|<pageref|auto-20>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.12>||Synthetic data
      illustrating the EM algorithm for PCA defined by Eq.
      (<reference|12.58>) and Eq. (<reference|12.59>). (a) A data set
      <with|mode|<quote|math>|X> with the data points shown in green,
      together with the true principal components (shown as eigenvectors
      scaled by the square roots of the eigenvalues). (b) Initial
      configuration of the principal subspace defined by
      <with|mode|<quote|math>|W>, \ shown in red, together with the
      projections of the latent points <with|mode|<quote|math>|Z> into the
      data space, given by <with|mode|<quote|math>|Z W<rsup|T>>, shown in
      cyan. (c) After one M step, the latent space has been updated with
      <with|mode|<quote|math>|Z> held fixed. (d) After the successive E step,
      the values of <with|mode|<quote|math>|Z> have been updated, giving
      orthogonal projections, with <with|mode|<quote|math>|W> held fixed. (e)
      After the second M step. (f) After the second E
      step.>|<pageref|auto-21>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.13>||Probabilistic
      graphical model for Bayesian PCA in \ which the distribution over the
      parameter matrix <with|mode|<quote|math>|W> is governed by a vector
      <with|mode|<quote|math>|\<b-alpha\>> of
      hyperparameters.>|<pageref|auto-23>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.14>||`Hinton'
      diagrams of the matrix <with|mode|<quote|math>|W> in which each element
      of the matrix is depicted as a square (white for positive and black for
      negative values) whose area is proportional to the magnitude of that
      element. The synthetic data set comprises 300 data points in
      <with|mode|<quote|math>|D = 10> dimensions sampled from a Gaussian
      distribution having standard deviation 1.0 in 3 directions and standard
      deviation 0.5 in the remaining 7 directions for a data set in
      <with|mode|<quote|math>|D=10> dimensions having
      <with|mode|<quote|math>|M=3> directions with larger variance than the
      remaining 7 directions. The left-hand plot shows the result from
      maximum likelihood probabilistic PCA, and the left-hand plot shows the
      corresponding result from Bayesian PCA. We see how the Bayesian model
      is able to discover the appropriate dimensionality by suppressing the 6
      surplus degrees of freedom.>|<pageref|auto-24>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.15>||Gibbs sampling
      for Bayesian \ PCA showing plots of ln
      <with|mode|<quote|math>|\<alpha\><rsub|i>> versus iteration number for
      three <with|mode|<quote|math>|\<alpha\>> values, showing transitions
      between the three modes of the posterior
      distribution.>|<pageref|auto-25>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.16>||Schematic
      illustration of kernel PCA. A data set in the original data space
      (left-hand plot) is projected by a nonlinear transformation
      <with|mode|<quote|math>|\<b-varphi\><around*|(|\<b-x\>|)>> into a
      feature space (right-hand plot). By performing PCA in the feature
      space, we obtain the principal components, of which the first is shown
      in blue and is denoted by the vector v1. The green lines in feature
      space indicate the linear projections onto the first principal
      component, which correspond to nonlinear projections in the original
      data space. Note that in general it is not possible to represent the
      nonlinear principal component by a vector in
      <with|mode|<quote|math>|\<b-x\>> space.>|<pageref|auto-28>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.17>||Example of
      kernel PCA, with a Gaussian kernel applied to a synthetic data set in
      two dimensions, showing the first eight eigenfunctions along with their
      eigenvalues. The contours are lines along which the projection onto the
      corresponding principal component is constant. Note how the first two
      eigenvectors separate the three clusters, the next three eigenvectors
      split each of the cluster into halves, and the following three
      eigenvectors again split the clusters into halves along directions
      orthogonal to the previous splits.>|<pageref|auto-29>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.18>||An
      autoassociative multilayer perceptron having \ two layers of weights.
      Such a network is trained to map input vectors onto themselves by
      minimization of a sum-of-squares error. Even with nonlinear units in
      the hidden layer, such a network is equivalent to linear principal
      component analysis. Links representing bias parameters have been
      omitted for clarity.>|<pageref|auto-33>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.19>||Addition of
      extra hidden layers of nonlinear units gives an autoassociative network
      which can perform a nonlinear dimensionality
      reduction.>|<pageref|auto-34>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.20>||Geometrical
      interpretation of the mappings performed by the network in Figure
      <reference|fig12.19> for the case of <with|mode|<quote|math>|D=3>
      inputs and <with|mode|<quote|math>|M=2> units in the middle hidden
      layer. The function <with|mode|<quote|math>|F<rsub|2>> maps from an
      M-dimensional space <with|mode|<quote|math>|\<cal-S\>> into a
      D-dimensional space and therefore defines the way in which the space
      <with|mode|<quote|math>|\<cal-S\>> is embedded within the original
      <with|mode|<quote|math>|\<b-x\>>-space. Since the mapping
      <with|mode|<quote|math>|F<rsub|2>> can be nonlinear, the embedding of
      <with|mode|<quote|math>|\<cal-S\>> can be nonplanar, as indicated in
      the figure. The mapping <with|mode|<quote|math>|F<rsub|1>> then defines
      a projection of points in the original D-dimensional space into the
      M-dimensional subspace <with|mode|<quote|math>|\<cal-S\>>.>|<pageref|auto-35>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.21>||Plot of the oil
      flow data set visualized using PCA on the left and GTM on the right.
      For the GTM model, each data point is plotted at the mean of its
      posterior distribution in latent space. The nonlinearity of the GTM
      model allows the separation between the groups of data points to be
      seen more clearly.>|<pageref|auto-37>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Continuous
      Latent Variables> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      1.1<space|2spc>Principal Component Analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      <with|par-left|<quote|1tab>|1.1.1<space|2spc>Maximum variance
      formulation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.1.2<space|2spc>Minimum-error formulation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|1.1.3<space|2spc>Applications of PCA
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|1.1.4<space|2spc>PCA for high-dimensional
      data <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      1.2<space|2spc>Probabilistic PCA <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>

      <with|par-left|<quote|1tab>|1.2.1<space|2spc>Maximum likelihood PCA
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|1tab>|1.2.2<space|2spc>EM algorithm for PCA
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|1tab>|1.2.3<space|2spc>Bayesian PCA
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <with|par-left|<quote|1tab>|1.2.4<space|2spc>Factor analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>>

      1.3<space|2spc>Kernel PCA <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>

      1.4<space|2spc>Nonlinear Latent Variable Models
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>

      <with|par-left|<quote|1tab>|1.4.1<space|2spc>Independent component
      analysis <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31>>

      <with|par-left|<quote|1tab>|1.4.2<space|2spc>Autoassociative neural
      networks <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>>

      <with|par-left|<quote|1tab>|1.4.3<space|2spc>Modelling nonlinear
      manifolds <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>>
    </associate>
  </collection>
</auxiliary>