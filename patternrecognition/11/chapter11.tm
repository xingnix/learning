<TeXmacs|2.1>

<style|<tuple|book|granite>>

<\body>
  <\chapter>
    Sampling Methods
  </chapter>

  \;

  For most probabilistic models of practical interest, exact inference is
  intractable, and so we have to resort to some form of approximation. In
  Chapter 10, we discussed inference algorithms based on deterministic
  approximations, which include methods such as variational Bayes and
  expectation propagation. Here we consider approximate inference methods
  based on numerical sampling, also known as Monte Carlo techniques.

  Although for some applications the posterior distribution over unobserved
  variables will be of direct interest in itself, for most situations the
  posterior distribution is required primarily for the purpose of evaluating
  expectations, for example in order to make predictions. The fundamental
  problem that we therefore wish to address in this chapter involves nding
  the expectation of some function <math|f(\<b-z\>)> with respect to a
  probability distribution <math|p(\<b-z\>)>. Here, the components of
  <math|\<b-z\>> might comprise discrete or continuous variables or some
  combination of the two. Thus in the case of continuous variables, we wish
  to evaluate the expectation

  <\equation>
    \<bbb-E\><around*|[|f|]>=<big|int>f<around*|(|\<b-z\>|)>p<around*|(|\<b-z\>|)>\<mathd\>\<b-z\><label|11.1>
  </equation>

  where the integral is replaced by summation in the case of discrete
  variables. This is illustrated schematically for a single continuous
  variable in Figure 11.1. We shall suppose that such expectations are too
  complex to be evaluated exactly using analytical techniques.

  <\padded-center>
    <\small-figure|<image|image/fig_11_1_expectation_f_p.png|0.3par|||>>
      <label|fig11.1>Schematic illustration of a function <math|f(z)> whose
      expectation is to be evaluated with respect to a distribution
      <math|p(z)>.
    </small-figure>
  </padded-center>

  The general idea behind sampling methods is to obtain a set of samples
  <math|\<b-z\><rsup|(l)>> (where <math|l=1,\<cdots\>,L>) drawn independently
  from the distribution <math|p(\<b-z\>)>. This allows the expectation Eq.
  <eqref|11.1> to be approximated by a nite sum

  <\equation>
    <wide|f|^>=<frac|1|L><big|sum><rsub|l=1><rsup|L>f<around*|(|\<b-z\><rsup|<around*|(|l|)>>|)><label|11.2>
  </equation>

  As long as the samples <math|\<b-z\><rsup|<around*|(|l|)>>> are drawn from
  the distribution <math|p(\<b-z\>)>, then
  <math|\<bbb-E\>[<wide|f|^>]=\<bbb-E\>[f]> and so the estimator
  <math|<wide|f|^>> has the correct mean. The variance of the estimator is
  given by

  <\equation*>
    var<around*|[|<wide|f|^>|]>=<frac|1|L>\<bbb-E\><around*|[|<around*|(|f-\<bbb-E\><around*|[|f|]>|)><rsup|2>|]>
  </equation*>

  is the variance of the function <math|f(\<b-z\>)> under the distribution
  <math|p(\<b-z\>)>. It is worth emphasizing that the accuracy of the
  estimator therefore does not depend on the dimensionality of
  <math|\<b-z\>>, and that, in principle, high accuracy may be achievable
  with a relatively small number of samples
  <math|\<b-z\><rsup|<around*|(|l|)>>> . In practice, ten or twenty
  independent samples may sufce to estimate an expectation to sufcient
  accuracy.

  The problem, however, is that the samples <math|{\<b-z\><rsup|(l)>}> might
  not be independent, and so the effective sample size might be much smaller
  than the apparent sample size. Also, referring back to Figure
  <reference|fig11.1>, we note that if <math|f(\<b-z\>)> is small in regions
  where <math|p(\<b-z\>)> is large, and vice versa, then the expectation may
  be dominated by regions of small probability, implying that relatively
  large sample sizes will be required to achieve sufcient accuracy.

  For many models, the joint distribution <math|p(\<b-z\>)> is conveniently
  specied in terms of a graphical model. In the case of a directed graph
  with no observed variables, it is straightforward to sample from the joint
  distribution (assuming that it is possible to sample from the conditional
  distributions at each node) using the following ancestral sampling
  approach, discussed brie\]y in Section 8.1.2. The joint distribution is
  specied by

  <\equation>
    p<around*|(|\<b-z\>|)>=<big|prod><rsub|i=1><rsup|M>p<around*|(|\<b-z\><rsub|i>\|pa<rsub|i>|)><label|11.4>
  </equation>

  where <math|\<b-z\><rsub|i>> are the set of variables associated with node
  <math|i>, and <math|pa<rsub|i>> denotes the set of variables associated
  with the parents of node <math|i>. To obtain a sample from the joint
  distribution, we make one pass through the set of variables in the order
  <math|\<b-z\><rsub|1>,\<cdots\>,\<b-z\><rsub|M>> sampling from the
  conditional distributions <math|p(\<b-z\><rsub|i>\|pa<rsub|i>)>. This is
  always possible because at each step all of the parent values will have
  been instantiated. After one pass through the graph, we will have obtained
  a sample from the joint distribution. Now consider the case of a directed
  graph in which some of the nodes are instantiated with observed values. We
  can in principle extend the above procedure, at least in the case of nodes
  representing discrete variables, to give the following <em|logic sampling
  approach> (Henrion, 1988), which can be seen as a special case of
  <em|importance sampling> discussed in Section 11.1.4. At each step, when a
  sampled value is obtained for a variable <math|\<b-z\><rsub|i>> whose value
  is observed, the sampled value is compared to the observed value, and if
  they agree then the sample value is retained and the algorithm proceeds to
  the next variable in turn. However, if the sampled value and the observed
  value disagree, then the whole sample so far is discarded and the algorithm
  starts again with the rst node in the graph. This algorithm samples
  correctly from the posterior distribution because it corresponds simply to
  drawing samples from the joint distribution of hidden variables and data
  variables and then discarding those samples that disagree with the observed
  data (with the slight saving of not continuing with the sampling from the
  joint distribution as soon as one contradictory value is observed).
  However, the overall probability of accepting a sample from the posterior
  decreases rapidly as the number of observed variables increases and as the
  number of states that those variables can take increases, and so this
  approach is rarely used in practice.

  In the case of probability distributions dened by an undirected graph,
  there is no one-pass sampling strategy that will sample even from the prior
  distribution with no observed variables. Instead, computationally more
  expensive techniques must be employed, such as Gibbs sampling, which is
  discussed in Section 11.3.

  As well as sampling from conditional distributions, we may also require
  samples from a marginal distribution. If we already have a strategy for
  sampling from a joint distribution <math|p(\<b-u\>,\<b-v\>)>, then it is
  straightforward to obtain samples from the marginal distribution
  <math|p(\<b-u\>)> simply by ignoring the values for v in each sample.

  There are numerous texts dealing with Monte Carlo methods. Those of
  particular interest from the statistical inference perspective include Chen
  et al. (2001), Gamerman (1997), Gilks et al. (1996), Liu (2001), Neal
  (1996), and Robert and Casella (1999). Also there are review articles by
  Besag et al. (1995), Brooks (1998), Diaconis and Saloff-Coste (1998),
  Jerrum and Sinclair (1996), Neal (1993), Tierney (1994), and Andrieu et al.
  (2003) that provide additional information on sampling methods for
  statistical inference.

  Diagnostic tests for convergence of Markov chain Monte Carlo algorithms are
  summarized in Robert and Casella (1999).

  <section|Basic Sampling Algorithms>

  In this section, we consider some simple strategies for generating random
  samples from a given distribution. Because the samples will be generated by
  a computer algorithm they will in fact be pseudo-random numbers, that is,
  they will be deterministically calculated, but must nevertheless pass
  appropriate tests for randomness. Generating such numbers raises several
  subtleties (Press et al., 1992) that lie outside the scope of this book.
  Here we shall assume that an algorithm has been provided that generates
  pseudo-random numbers distributed uniformly over <math|(0,1)>, and indeed
  most software environments have such a facility built in.

  <subsection|Standard distributions>

  We rst consider how to generate random numbers from simple nonuniform
  distributions, assuming that we already have available a source of
  uniformly distributed random numbers. Suppose that <math|z> is uniformly
  distributed over the interval <math|(0,1)>, and that we transform the
  values of <math|z> using some function <math|f(\<cdummy\>)> so that
  <math|y=f(z)>. The distribution of y will be governed by

  <\equation>
    p<around*|(|y|)>=p<around*|(|z|)><around*|\||<frac|\<mathd\>z|\<mathd\>y>|\|><label|11.5>
  </equation>

  where, in this case, <math|p(z)=1>. Our goal is to choose the function
  <math|f(z)> such that the resulting values of <math|y> have some specic
  desired distribution <math|p(y)>. Integrating Eq. <eqref|11.5> we obtain

  <\eqnarray*>
    <tformat|<table|<row|<cell|z>|<cell|=>|<cell|h<around*|(|y|)>>>|<row|<cell|>|<cell|\<equiv\>>|<cell|<big|int><rsub|\<infty\>><rsup|y>p<around*|(|<wide|y|^>|)>\<mathd\><wide|y|^><eq-number><label|11.6>>>>>
  </eqnarray*>

  which is the indenite integral of <math|p(y)>. Thus,
  <math|y=h<rsup|\<minus\>1>(z)>, and so we have to transform the uniformly
  distributed random numbers using a function which is the inverse of the
  indenite integral of the desired distribution. This is illustrated in
  Figure <reference|fig11.2>.

  <\padded-center>
    <\small-figure|<image|image/fig_11_2_probability_transformation.png|.3par|||>>
      <label|fig11.2>Geometrical interpretation of the transformation method
      for generating nonuniformly distributed random numbers. <math|h(y)> is
      the indenite integral of the desired distribution <math|p(y)>. If a
      uniformly distributed random variable <math|z> is transformed using
      <math|y=h<rsup|\<minus\>1>(z)>, then <math|y> will be distributed
      according to <math|p(y)>.
    </small-figure>
  </padded-center>

  Consider for example the <em|exponential distribution>

  <\equation*>
    p<around*|(|y|)>=\<lambda\>e<rsup|-\<lambda\>y>
  </equation*>

  \ where <math|0\<leqslant\>y\<less\>\<infty\>>. In this case the lower
  limit of the integral in Eq. <eqref|11.6> is <math|0>, and so
  <math|h(y)=1\<minus\>exp(\<minus\>\<lambda\>y)>. Thus, if we transform our
  uniformly distributed variable <math|z> using
  <math|y=\<minus\>\<lambda\><rsup|\<minus\>1>ln(1\<minus\>z)>, then <math|y>
  will have an exponential distribution.

  Another example of a distribution to which the transformation method can be
  applied is given by the Cauchy distribution

  <\equation>
    p<around*|(|y|)>=<frac|1|\<pi\>><frac|1|1+y<rsup|2>><label|11.8>
  </equation>

  In this case, the inverse of the indenite integral can be expressed in
  terms of the `tan' function.

  The generalization to multiple variables is straightforward and involves
  the Jacobian of the change of variables, so that

  <\equation*>
    p<around*|(|y<rsub|1>,\<cdots\>,y<rsub|M>|)>=p<around*|(|z<rsub|1>,\<cdots\>,z<rsub|M>|)><around*|\||<frac|\<partial\><around*|(|z<rsub|1>,\<cdots\>,z<rsub|M>|)>|\<partial\><around*|(|y<rsub|1>,\<cdots\>,y<rsub|M>|)>>|\|>
  </equation*>

  As a nal example of the transformation method we consider the Box-Muller
  method for generating samples from a Gaussian distribution. First, suppose
  we generate pairs of uniformly distributed random numbers <math|z<rsub|1>,
  z<rsub|2> \<in\>(\<minus\>1,1)>, which we can do by transforming a variable
  distributed uniformly over <math|(0,1)> using
  <math|z\<rightarrow\>2z\<minus\>1>. Next we discard each pair unless it
  satises <math|z<rsub|1><rsup|2>+z<rsub|2><rsup|2>\<leqslant\>1>. This
  leads to a uniform distribution of points inside the unit circle with
  <math|p(z<rsub|1>,z<rsub|2>)=1/\<pi\>>, as illustrated in Figure
  <reference|fig11.3>. Then, for each pair <math|z<rsub|1>,z<rsub|2>> we
  evaluate the quantities

  <\eqnarray*>
    <tformat|<table|<row|<cell|y<rsub|1>>|<cell|=>|<cell|z<rsub|1><around*|(|<frac|-2ln
    r<rsup|2> <rsub|>|r<rsup|2>>|)><rsup|1/2>>>|<row|<cell|y<rsub|2>>|<cell|=>|<cell|z<rsub|2><around*|(|<frac|-2ln
    r<rsup|2>|r<rsup|2>>|)><rsup|1/2>>>>>
  </eqnarray*>

  where <math|r<rsup|2>=z<rsub|1><rsup|2>+z<rsub|2><rsup|2>>, Then the joint
  distribution of <math|y<rsub|1>> and <math|y<rsub|2>> is given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|y<rsub|1>,y<rsub|2>|)>>|<cell|=>|<cell|p<around*|(|z<rsub|1>,z<rsub|2>|)><around*|\||<frac|\<partial\><around*|(|z<rsub|1>,z<rsub|2>|)>|\<partial\><around*|(|y<rsub|1>,y<rsub|2>|)>>|\|>>>|<row|<cell|>|<cell|=>|<cell|<around*|[|<frac|1|<sqrt|2\<pi\>>>e<rsup|-y<rsub|1><rsup|2>/2>|]><around*|[|<frac|1|<sqrt|2\<pi\>>>e<rsup|-y<rsub|2><rsup|2>/2>|]>>>>>
  </eqnarray*>

  and so <math|y<rsub|1>> and <math|y<rsub|2>> are independent and each has a
  Gaussian distribution with zero mean and unit variance.

  <\padded-center>
    <\small-figure|<image|image/fig_11_3_box_muller.png|0.2par|||>>
      <label|fig11.3>The Box-Muller method for generating Gaussian
      distributed random numbers starts by generating samples from a uniform
      distribution inside the unit circle.
    </small-figure>
  </padded-center>

  If y has a Gaussian distribution with zero mean and unit variance, then
  <math|\<sigma\>y+\<mu\>> will have a Gaussian distribution with mean
  <math|\<mu\>> and variance <math|\<sigma\><rsup|2>> . To generate
  vector-valued variables having a multivariate Gaussian distribution with
  mean <math|\<b-mu\>> and co-variance <math|\<Sigma\>>, we can make use of
  the <em|Cholesky decomposition>, which takes the form <math|\<Sigma\>=L
  L<rsup|T>> (Press et al., 1992). Then, if <math|\<b-z\>> is a vector valued
  random variable whose components are independent and Gaussian distributed
  with zero mean and unit variance, then <math|y=\<b-mu\>+L\<b-z\>> will have
  mean <math|\<b-mu\>> and covariance <math|\<Sigma\>>.

  Obviously, the transformation technique depends for its success on the
  ability to calculate and then invert the indenite integral of the required
  distribution. Such operations will only be feasible for a limited number of
  simple distributions, and soe must turn to alternative approaches in search
  of a more general strategy. Here we consider two techniques called
  <em|rejection sampling> and <em|importance sampling>. Although mainly
  limited to univariate distributions and thus not directly applicable to
  complex problems in many dimensions, they do form important components in
  more general strategies.

  <subsection|Rejection sampling><label|sec11.1.2>

  \;

  The rejection sampling framework allows us to sample from relatively
  complex distributions, subject to certain constraints. We begin by
  considering univariate distributions and discuss the extension to multiple
  dimensions subsequently. Suppose we wish to sample from a distribution
  <math|p(\<b-z\>)> that is not one of the simple, standard distributions
  considered so far, and that sampling directly from <math|p(\<b-z\>)> is
  difcult. Furthermore suppose, as is often the case, that we are easily
  able to evaluate <math|p(\<b-z\>)> for any given value of <math|\<b-z\>>,
  up to some normalizing constant <math|Z>, so that

  <\equation*>
    p<around*|(|z|)>=<frac|1|Z<rsub|p>><wide|p|~><around*|(|z|)>
  </equation*>

  where <math|<wide|p|~><around*|(|z|)>> can readily be evaluated, but
  <math|Z<rsub|p>> is unknown.

  In order to apply rejection sampling, we need some simpler distribution
  <math|q(z)>, sometimes called a <em|proposal distribution>, from which we
  can readily draw samples.\ 

  We next introduce a constant <math|k> whose value is chosen such that
  <math|k q<around*|(|z|)>\<geqslant\><wide|p|~><around*|(|z|)>> for all
  values of <math|z>. The function <math|k q(z)> is called the comparison
  function and is illustrated for a univariate distribution in Figure
  <reference|fig11.4>. Each step of the rejection sampler involves generating
  two random numbers. First, we generate a number <math|z<rsub|0>> from the
  distribution <math|q(z)>. Next, we generate a number <math|u<rsub|0>> from
  the uniform distribution over <math|[0, k q(z<rsub|0>)]>. This pair of
  random numbers has uniform distribution under the curve of the function
  <math|k q(z)>. Finally, if <math|u<rsub|0>\<geqslant\><wide|p|~><around*|(|z<rsub|0>|)>>
  then the sample is rejected, otherwise <math|u<rsub|0>> is retained. Thus
  the pair is rejected if it lies in the grey shaded region in Figure
  <reference|fig11.4>. The remaining pairs then have uniform distribution
  under the curve of <math|<wide|p|~><around*|(|z|)>>, and hence the
  corresponding <math|z> values are distributed according to <math|p(z)>, as
  desired.

  <\padded-center>
    <\small-figure|<image|image/fig_11_4_rejection_sampling.png|0.3ar|||>>
      <label|fig11.4>In the rejection sampling method, samples are drawn from
      a simple distribution <math|q(z)> and rejected if they fall in the grey
      area between the unnormalized distribution <math|<wide|p|~>(z)> and the
      scaled distribution <math|k q(z)>. The resulting samples are
      distributed according to <math|p(z)>, which is the normalized version
      of <math|<wide|p|~><around*|(|z|)>>.
    </small-figure>
  </padded-center>

  The original values of <math|z> are generated from the distribution
  <math|q(z)>, and these samples are then accepted with probability
  <math|<wide|p|~>(z)/k q(z)>, and so the probability that a sample will be
  accepted is given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|accept|)>>|<cell|=>|<cell|<big|int><around*|{|<wide|p|~><around*|(|z|)>/k
    q<around*|(|z|)>|}>q<around*|(|z|)>\<mathd\>z>>|<row|<cell|>|<cell|=>|<cell|<frac|1|k><big|int><wide|p|~><around*|(|z|)>\<mathd\>z>>>>
  </eqnarray*>

  Thus the fraction of points that are rejected by this method depends on the
  ratio of the area under the unnormalized distribution <math|<wide|p|~>(z)>
  to the area under the curve <math|k q(z)>. We therefore see that the
  constant <math|k> should be as small as possible subject to the limitation
  that <math|k q(z)> must be nowhere less than <math|<wide|p|~>(z)>.

  As an illustration of the use of rejection sampling, consider the task of
  sampling from the gamma distribution

  Gam<around*|(|z\|a,b|)>=<frac|1|\<Gamma\><around*|(|a|)>>b<rsup|a>z<rsup|a-1>e<rsup|-b
  z><label|11.15>

  which, for <math|a\<gtr\>1>, has a bell-shaped form, as shown in Figure
  <reference|fig11.5>. A suitable proposal distribution is therefore the
  Cauchy Eq. <eqref|11.8> because this too is bell-shaped and because we can
  use the transformation method, discussed earlier, to sample from it. We
  need to generalize the Cauchy slightly to ensure that it nowhere has a
  smaller value than the gamma distribution. This can be achieved by
  transforming a uniform random variable <math|y> using <math|z=b tan y+c>,
  which gives random numbers distributed according to

  <\equation*>
    q<around*|(|z|)>=<frac|k|1+<around*|(|z-c|)><rsup|2>/b<rsup|2>>
  </equation*>

  The minimum reject rate is obtained by setting <math|c=a-1>,
  <math|b<rsup|2>=2a-1> and choosing the constant <math|k> to be as small as
  possible while still satisfying the requirement <math|k
  q(z)\<geqslant\><wide|p|~>(z)>. The resulting comparison function is also
  illustrated in Figure <reference|fig11.5>.

  <\padded-center>
    <\small-figure|<image|image/fig_11_5_cauchy_gamma.png|.3par|||>>
      <label|fig11.5> Plot showing the gamma distribution given by Eq.
      <eqref|11.15> as the green curve, with a scaled Cauchy proposal
      distribution shown by the red curve. Samples from the gamma
      distribution can be obtained by sampling from the Cauchy and then
      applying the rejection sampling criterion.
    </small-figure>
  </padded-center>

  <subsection|Adaptive rejection sampling><label|sec11.1.3>

  In many instances where we might wish to apply rejection sampling, it
  proves difcult to determine a suitable analytic form for the envelope
  distribution <math|q(z)>. An alternative approach is to construct the
  envelope function on the \]y based on measured values of the distribution
  <math|p(z)> (Gilks and Wild, 1992). Construction of an envelope function is
  particularly straightforward for cases in which <math|p(z)> is log concave,
  in other words when <math|ln p(z)> has derivatives that are nonincreasing
  functions of <math|z>. The construction of a suitable envelope function is
  illustrated graphically in Figure <reference|fig11.6>.

  <\padded-center>
    <\small-figure|<image|image/fig_11_6_adaptive_rejection_sampling.png|.3par|||>>
      <label|fig11.6>In the case of distributions that are log concave, an
      envelope functionfor use in rejection sampling can be constructed using
      the tangent lines computed at a set of grid points. If a sample point
      is rejected, it is added to the set of grid points and used to rene
      the envelope distribution.
    </small-figure>
  </padded-center>

  The function <math|ln p(z)> and its gradient are evaluated at some initial
  set of grid points, and the intersections of the resulting tangent lines
  are used to construct the envelope function. Next a sample value is drawn
  from the envelope distribution. This is straightforward because the log of
  the envelope distribution is a succession of linear functions, and hence
  the envelope distribution itself comprises a piecewise exponential
  distribution of the form

  <\equation*>
    q<around*|(|z|)>=k<rsub|i>\<lambda\><rsub|i>exp<around*|{|-\<lambda\><rsub|i><around*|(|z-z<rsub|i>|)>|}><space|5em><wide|z|^><rsub|i-1,i>\<less\>z\<leqslant\><wide|z|^><rsub|i,i+1>
  </equation*>

  where <math|<wide|z|^><rsub|i-1,i>> is the point of intersection of the
  tangent lines at <math|z<rsub|i\<minus\>1>> and <math|z<rsub|i>>,
  <math|\<lambda\><rsub|i>> is the slope of the tangent at <math|z<rsub|i>>
  and <math|k<rsub|i>> accounts for the corresponding offset.

  Once a sample has been drawn, the usual rejection criterion can be applied.
  If the sample is accepted, then it will be a draw from the desired
  distribution. If, however, the sample is rejected, then it is incorporated
  into the set of grid points, a new tangent line is computed, and the
  envelope function is thereby rened. As the number of grid points
  increases, so the envelope function becomes a better approximation of the
  desired distribution <math|p(z)> and the probability of rejection
  decreases.

  A variant of the algorithm exists that avoids the evaluation of derivatives
  (Gilks, 1992). The adaptive rejection sampling framework can also be
  extended to distributions that are not log concave, simply by following
  each rejection sampling step with a Metropolis-Hastings step (to be
  discussed in Section 11.2.2), giving rise to <em|adaptive rejection
  Metropolis sampling> (Gilks et al., 1995).

  Clearly for rejection sampling to be of practical value, we require that
  the comparison function be close to the required distribution so that the
  rate of rejection is kept to a minimum. Now let us examine what happens
  when we try to use rejection sampling in spaces of high dimensionality.
  Consider, for the sake of illustration, a somewhat articial problem in
  which we wish to sample from a zero-mean multivariate Gaussian distribution
  with covariance <math|\<sigma\><rsub|p><rsup|2>I>, where <math|I> is the
  unit matrix, by

  rejection sampling from a proposal distribution that is itself a zero-mean
  Gaussian distribution having covariance <math|\<sigma\><rsub|q><rsup|2>I>.
  Obviously, we must have <math|\<sigma\><rsub|q><rsup|2>\<geqslant\>\<sigma\><rsub|p><rsup|2>>
  in order that there exists a <math|k> such that <math|k
  q(z)\<geqslant\>p(z)>. In D-dimensions the optimum value of <math|k> is
  given by <math|k=(\<sigma\><rsub|q>/\<sigma\><rsub|p>)<rsup|D>> , as
  illustrated for <math|D=1> in Figure <reference|fig11.7>. The acceptance
  rate will be the ratio of volumes under <math|p(z)> and <math|k q(z)>,
  which, because both distributions are normalized, is just <math|1/k>. Thus
  the acceptance rate diminishes exponentially with dimensionality. Even if
  <math|\<sigma\><rsub|q>> exceeds <math|\<sigma\><rsub|p>> by just one
  percent, for <math|D=1,000> the acceptance ratio will be approximately
  <math|1/20,000>. In this illustrative example the comparison function is
  close to the required distribution. For more practical examples, where the
  desired distribution may be multimodal and sharply peaked, it will be
  extremely difcult to nd a good proposal distribution and comparison
  function.

  <\padded-center>
    <\small-figure|<image|image/fig_11_7_rejection_sampling_gauss.png|.3par|||>>
      <label|fig11.7>Illustrative example of rejection sampling involving
      sampling from a Gaussian distribution <math|p(z)> shown by the green
      curve, by using rejection sampling from a proposal distribution
      <math|q(z)> that is also Gaussian and whose scaled version <math|k
      q(z)> is shown by the red curve.
    </small-figure>
  </padded-center>

  Furthermore, the exponential decrease of acceptance rate with
  dimensionality is a generic feature of rejection sampling. Although
  rejection can be a useful technique in one or two dimensions it is unsuited
  to problems of high dimensionality. It can, however, play a role as a
  subroutine in more sophisticated algorithms for sampling in high
  dimensional spaces.

  <subsection|Importance sampling>

  \;

  One of the principal reasons for wishing to sample from complicated
  probability distributions is to be able to evaluate expectations of the
  form Eq. <eqref|11.1>. The technique of importance sampling provides a
  framework for approximating expectations directly but does not itself
  provide a mechanism for drawing samples from distribution
  <math|p(\<b-z\>)>.

  The nite sum approximation to the expectation, given by Eq. <eqref|11.2>,
  depends on being able to draw samples from the distribution
  <math|p(\<b-z\>)>. Suppose, however, that it is impractical to sample
  directly from <math|p(\<b-z\>)> but that we can evaluate <math|p(\<b-z\>)>
  easily for any given value of <math|\<b-z\>>. One simplistic strategy for
  evaluating expectations would be to discretize <math|\<b-z\>>-space into a
  uniform grid and to evaluate the integrand as a sum of the form

  <\equation*>
    \<bbb-E\><around*|[|f|]>\<simeq\><big|sum><rsub|l=1><rsup|L>p<around*|(|\<b-z\><rsup|<around*|(|l|)>>|)>f<around*|(|\<b-z\><rsup|<around*|(|l|)>>|)>
  </equation*>

  An obvious problem with this approach is that the number of terms in the
  summation grows exponentially with the dimensionality of <math|\<b-z\>>.
  Furthermore, as we have already noted, the kinds of probability
  distributions of interest will often have much of their mass conned to
  relatively small regions of <math|\<b-z\>> space and so uniform sampling
  will be very inefcient because in high-dimensional problems, only a very
  small proportion of the samples will make a signicant contribution to the
  sum. We would really like to choose the sample points to fall in regions
  where <math|p(\<b-z\>)> is large, or ideally where the product
  <math|p(\<b-z\>)f (\<b-z\>)> is large.

  As in the case of rejection sampling, importance sampling is based on the
  use of a proposal distribution <math|q(\<b-z\>)> from which it is easy to
  draw samples, as illustrated in Figure <reference|fig11.8>. We can then
  express the expectation in the form of a nite sum over samples
  <math|{z<rsup|(l)>}> drawn from <math|q(\<b-z\>)>

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|[|f|]>>|<cell|=>|<cell|<big|int>f<around*|(|\<b-z\>|)>p<around*|(|\<b-z\>|)>\<mathd\>\<b-z\>>>|<row|<cell|>|<cell|=>|<cell|<big|int>f<around*|(|\<b-z\>|)><frac|p<around*|(|\<b-z\>|)>|q<around*|(|\<b-z\>|)>>q<around*|(|\<b-z\>|)>\<mathd\>\<b-z\>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|L><big|sum><rsub|l=1><rsup|L><frac|p<around*|(|\<b-z\><rsup|<around*|(|l|)>>|)>|q<around*|(|\<b-z\><rsup|<around*|(|l|)>>|)>>f<around*|(|\<b-z\><rsup|<around*|(|l|)>>|)>>>>>
  </eqnarray*>

  The quantities <math|r<rsub|l>=p(\<b-z\><rsup|(l)>)/q(\<b-z\><rsup|(l)>)>
  are known as <em|importance weights>, and they correct the bias introduced
  by sampling from the wrong distribution. Note that, unlike rejection
  sampling, all of the samples generated are retained.

  <\padded-center>
    <\small-figure|<image|image/fig_11_8_importance_sampling.png|.3par|||>>
      <label|fig11.8>Importance sampling addresses the problem of evaluating
      the expectation of a function <math|f(z)> with respect to a
      distribution <math|p(z)> from which it is difcult to draw samples
      directly. Instead, samples <math|{z<rsup|(l)>}> are drawn from a
      simpler distribution <math|q(z)>, and the corresponding terms in the
      summation are weighted by the ratios
      <math|p(z<rsup|(l)>)/q(z<rsup|(l)>)>.
    </small-figure>
  </padded-center>

  It will often be the case that the distribution <math|p(\<b-z\>)> can only
  be evaluated up to a normalization constant, so that
  <math|p<around*|(|\<b-z\>|)>=<wide|p|~><around*|(|\<b-z\>|)>/Z<rsub|p>>
  where <math|<wide|p|~><around*|(|\<b-z\>|)>> can be evaluated easily,
  whereas <math|Z<rsub|p>> is unknown. Similarly, we may wish to use an
  importance sampling distribution <math|q<around*|(|\<b-z\>|)>=<wide|q|~><around*|(|\<b-z\>|)>/Z<rsub|q>>
  , which has the same property. We then have

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|[|f|]>>|<cell|=>|<cell|<big|int>f<around*|(|\<b-z\>|)>p<around*|(|\<b-z\>|)>\<mathd\>\<b-z\>>>|<row|<cell|>|<cell|=>|<cell|<frac|Z<rsub|q>|Z<rsub|p>><big|int>f<around*|(|\<b-z\>|)><frac|<wide|p|~>*<around*|(|\<b-z\>|)>|<wide|q|~><around*|(|\<b-z\>|)>>q<around*|(|\<b-z\>|)>\<mathd\>\<b-z\>>>|<row|<cell|>|<cell|\<simeq\>>|<cell|<frac|Z<rsub|q>|Z<rsub|p>><frac|1|L><big|sum><rsub|l=1><rsup|N><wide|r|~><rsub|l>f<around*|(|\<b-z\><rsup|<around*|(|l|)>>|)>>>>>
  </eqnarray*>

  where <math|<wide|r|~><rsub|l>=<wide|p|~><around*|(|\<b-z\><rsup|<around*|(|l|)>>|)>/<wide|q|~><around*|(|\<b-z\><rsup|<around*|(|l|)>>|)>>.
  We can use the same sample set to evaluate the ratio
  <math|Z<rsub|p>/Z<rsub|q>> with the result

  <\eqnarray*>
    <tformat|<table|<row|<cell|<frac|Z<rsub|p>|Z<rsub|q>>>|<cell|=>|<cell|<frac|1|Z<rsub|q>><big|int><wide|p|~><around*|(|\<b-z\>|)>\<mathd\>\<b-z\>>>|<row|<cell|>|<cell|=>|<cell|<big|int><frac|<wide|p|~><around*|(|\<b-z\>|)>|<wide|q|~><around*|(|\<b-z\>|)>>q<around*|(|\<b-z\>|)>\<mathd\>\<b-z\>>>|<row|<cell|>|<cell|\<simeq\>>|<cell|<frac|1|L><big|sum><rsub|l=1><rsup|L><wide|r|~><rsub|l>>>>>
  </eqnarray*>

  and hence

  <\equation*>
    \<bbb-E\><around*|[|f|]>\<simeq\><big|sum><rsub|l=1><rsup|L>w<rsub|l>f<around*|(|\<b-z\><rsup|<around*|(|l|)>>|)>
  </equation*>

  where we have defined

  <\eqnarray*>
    <tformat|<table|<row|<cell|w<rsub|l>>|<cell|=>|<cell|<frac|<wide|r|~><rsub|l>|<big|sum><rsub|m><wide|r|~><rsub|l>>>>|<row|<cell|>|<cell|=>|<cell|<frac|<wide|p|~><around*|(|\<b-z\><rsup|<around*|(|l|)>>|)>/q<around*|(|\<b-z\><rsup|<around*|(|l|)>>|)>|<big|sum><rsub|m><wide|p|~><around*|(|\<b-z\><rsup|<around*|(|m|)>>|)>/q<around*|(|\<b-z\><rsup|<around*|(|m|)>>|)>><eq-number><label|11.23>>>>>
  </eqnarray*>

  As with rejection sampling, the success of the importance sampling approach
  depends crucially on how well the sampling distribution <math|q(\<b-z\>)>
  matches the desired distribution <math|p(\<b-z\>)>. If, as is often the
  case, <math|p(\<b-z\>)> is strongly varying and has a significant
  proportion of its mass concentrated over relatively small regions of
  <math|\<b-z\>> space, then the set of importance weights <math|{r<rsub|l>}>
  may be dominated by a few weights having large values, with the remaining
  weights being relatively insignificant. Thus the effective sample size can
  be much smaller than the apparent sample size <math|L>. The problem is even
  more severe if none of the samples falls in the regions where
  <math|p(\<b-z\>)f(\<b-z\>)> is large. In that case, the apparent variances
  of <math|r<rsub|l>> and <math|r<rsub|l>f(\<b-z\><rsup|(l)>)> may be small
  even though the estimate of the expectation may be severely wrong. Hence a
  major drawback of the importance sampling method is the potential to
  produce results that are arbitrarily in error and with no diagnostic
  indication. This also highlights a key requirement for the sampling
  distribution <math|q(\<b-z\>)>, namely that it should not be small or zero
  in regions where <math|p(\<b-z\>)> may be significant.

  For distributions defined in terms of a graphical model, we can apply the
  importance sampling technique in various ways. For discrete variables, a
  simple approach is called <em|uniform sampling>. The joint distribution for
  a directed graph is defined by Eq. <eqref|11.4>. Each sample from the joint
  distribution is obtained by first setting those variables
  <math|\<b-z\><rsub|i>> that are in the evidence set equal to their observed
  values. Each of the remaining variables is then sampled independently from
  a uniform distribution over the space of possible instantiations. To
  determine the corresponding weight associated with a sample
  <math|\<b-z\><rsup|(l)>> , we note that the sampling distribution
  <math|<wide|q|~><around*|(|\<b-z\>|)>> is uniform over the possible choices
  for <math|\<b-z\>>, and that <math|<wide|p|~><around*|(|\<b-z\>\|\<b-x\>|)>=<wide|p|~><around*|(|\<b-z\>|)>>
  where <math|\<b-x\>> denotes the subset of variables that are observed, and
  the equality follows from the fact that every sample <math|\<b-z\>> that is
  generated is necessarily consistent with the evidence. Thus the weights
  <math|r<rsub|l>> are simply proportional to <math|p(\<b-z\>)>. Note that
  the variables can be sampled in any order. This approach can yield poor
  results if the posterior distribution is far from uniform, as is often the
  case in practice.

  An improvement on this approach is called <em|likelihood weighted sampling>
  (Fung and Chang, 1990; Shachter and Peot, 1990) and is based on ancestral
  sampling of the variables. For each variable in turn, if that variable is
  in the evidence set, then it is just set to its instantiated value. If it
  is not in the evidence set, then it is sampled from the conditional
  distribution <math|p(\<b-z\><rsub|i>\|pa<rsub|i>)> in which the
  conditioning variables are set to their currently sampled values. The
  weighting associated with the resulting sample <math|\<b-z\>> is then given
  by

  <\eqnarray*>
    <tformat|<table|<row|<cell|r<around*|(|\<b-z\>|)>>|<cell|=>|<cell|<big|prod><rsub|\<b-z\><rsub|i>\<nin\>\<b-e\>><frac|p<around*|(|\<b-z\><rsub|i>\|pa<rsub|i>|)>|p<around*|(|\<b-z\><rsub|i>\|pa<rsub|i>|)>><big|prod><rsub|\<b-z\><rsub|i>\<in\>\<b-e\>><frac|p<around*|(|\<b-z\><rsub|i>\|pa<rsub|i>|)>|1>>>|<row|<cell|>|<cell|=>|<cell|<big|prod><rsub|\<b-z\><rsub|i>\<in\>\<b-e\>>p<around*|(|\<b-z\><rsub|i>\|pa<rsub|i>|)>>>>>
  </eqnarray*>

  This method can be further extended using <em|self-importance sampling>
  (Shachter and Peot, 1990) in which the importance sampling distribution is
  continually updated to re\]ect the current estimated posterior
  distribution.

  <subsection|Sampling-importance-resampling>

  The rejection sampling method discussed in Section <reference|sec11.1.2>
  depends in part for its success on the determination of a suitable value
  for the constant <math|k>. For many pairs of distributions
  <math|p(\<b-z\>)> and <math|q(\<b-z\>)>, it will be impractical to
  determine a suitable value for <math|k> in that any value that is
  sufciently large to guarantee a bound on the desired distribution will
  lead to impractically small acceptance rates.

  As in the case of rejection sampling, the
  <em|sampling-importance-resampling> (SIR) approach also makes use of a
  sampling distribution <math|q(\<b-z\>)> but avoids having to determine the
  constant <math|k>. There are two stages to the scheme. In the rst stage,
  <math|L> samples <math|\<b-z\><rsup|<around*|(|1|)>>,\<cdots\>,\<b-z\><rsup|<around*|(|L|)>>>
  are drawn from <math|q(\<b-z\>)>. Then in the second stage, weights
  <math|w<rsub|1>,\<cdots\>,w<rsub|L> >are constructed using Eq.
  <eqref|11.23>. Finally, a second set of <math|L> samples is drawn from the
  discrete distribution <math|(\<b-z\><rsup|(1)
  >,\<cdots\>,\<b-z\><rsup|(L)>)> with probabilities given by the weights
  <around*|(|<math|w<rsub|1>,\<cdots\>,w<rsub|L>>|)>. The resulting <math|L>
  samples are only approximately distributed according to <math|p(z)>, but
  the distribution becomes correct in the limit <math|L \<rightarrow\>
  \<infty\>>. To see this, consider the univariate case, and note that the
  cumulative distribution of the resampled values is given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|z\<leqslant\>a|)>>|<cell|=>|<cell|<big|sum><rsub|l:z<rsup|<around*|(|l|)>>\<leqslant\>a>w<rsub|l>>>|<row|<cell|>|<cell|=>|<cell|<frac|<big|sum><rsub|l>I<around*|(|z<rsup|<around*|(|l|)>>\<leqslant\>a|)><wide|p|~><around*|(|z<rsup|<around*|(|l|)>>|)>/q<around*|(|z<rsup|<around*|(|l|)>>|)>|<big|sum><rsub|l><wide|p|~><around*|(|z<rsup|<around*|(|l|)>>|)>/q<around*|(|z<rsup|<around*|(|l|)>>|)>>>>>>
  </eqnarray*>

  where <math|I(\<cdummy\>)> is the indicator function (which equals 1 if its
  argument is true and 0 otherwise). Taking the limit
  <math|L\<rightarrow\>\<infty\>>, and assuming suitable regularity of the
  distributions, we can replace the sums by integrals weighted according to
  the original sampling distribution <math|q(z)>

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|z\<leqslant\>a|)>>|<cell|=>|<cell|<frac|<big|int>I<around*|(|z\<leqslant\>a|)><around*|{|<wide|p|~><around*|(|z|)>/q<around*|(|z|)>|}>q<around*|(|z|)>\<mathd\>z|<big|int><around*|{|<wide|p|~><around*|(|z|)>/q<around*|(|z|)>|}>q<around*|(|z|)>\<mathd\>z>>>|<row|<cell|>|<cell|=>|<cell|<frac|<big|int>I<around*|(|z\<leqslant\>a|)><wide|p|~><around*|(|z|)>\<mathd\>z|<big|int><wide|p|~><around*|(|z|)>\<mathd\>z>>>|<row|<cell|>|<cell|=>|<cell|<big|int>I<around*|(|z\<leqslant\>a|)>p<around*|(|z|)>\<mathd\>z>>>>
  </eqnarray*>

  which is the cumulative distribution function of <math|p(z)>. Again, we see
  that the normalization of <math|p(z)> is not required.

  For a nite value of <math|L>, and a given initial sample set, the
  resampled values will only approximately be drawn from the desired
  distribution. As with rejection sampling, the approximation improves as the
  sampling distribution <math|q(\<b-z\>)> gets closer to the desired
  distribution <math|p(\<b-z\>)>. When <math|q(\<b-z\>) = p(\<b-z\>)>, the
  initial samples <math|(\<b-z\><rsup|(1)>,\<cdots\>,\<b-z\><rsup|(L)>)> have
  the desired distribution, and the weights <math|w<rsub|n>=1/L> so that the
  resampled values also have the desired distribution.

  If moments with respect to the distribution <math|p(\<b-z\>)> are required,
  then they can be evaluated directly using the original samples together
  with the weights, because

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|[|f<around*|(|\<b-z\>|)>|]>>|<cell|=>|<cell|<big|int>f<around*|(|\<b-z\>|)>p<around*|(|\<b-z\>|)>\<mathd\>\<b-z\>>>|<row|<cell|>|<cell|=>|<cell|<frac|<big|int>f<around*|(|\<b-z\>|)><around*|[|<wide|p|~><around*|(|\<b-z\>|)>/q<around*|(|\<b-z\>|)>|]>q<around*|(|\<b-z\>|)>\<mathd\>\<b-z\>|<big|int><around*|[|<wide|p|~><around*|(|\<b-z\>|)>/q<around*|(|\<b-z\>|)>|]>q<around*|(|\<b-z\>|)>\<mathd\>\<b-z\>>>>|<row|<cell|>|<cell|\<simeq\>>|<cell|<big|sum><rsub|l=1><rsup|L>w<rsub|l>f<around*|(|\<b-z\><rsub|l>|)>>>>>
  </eqnarray*>

  <subsection|Sampling and the EM algorithm>

  In addition to providing a mechanism for direct implementation of the
  Bayesian framework, Monte Carlo methods can also play a role in the
  frequentist paradigm, for example to nd maximum likelihood solutions. In
  particular, sampling methods can be used to approximate the E step of the
  EM algorithm for models in which the E step cannot be performed
  analytically. Consider a model with hidden variables <math|Z>, visible
  (observed) variables <math|X>, and parameters <math|\<b-theta\>>. The
  function that is optimized with respect to <math|\<b-theta\>> in the M step
  is the expected complete-data log likelihood, given by

  <\equation*>
    Q<around*|(|\<b-theta\>,\<b-theta\><rsup|old>|)>=<big|int>p<around*|(|Z\|X,\<b-theta\><rsup|old>|)>ln
    p<around*|(|Z,X\|\<b-theta\>|)>\<mathd\>Z
  </equation*>

  We can use sampling methods to approximate this integral by a nite sum
  over samples <math|{Z<rsup|(l)>}>, which are drawn from the current
  estimate for the posterior distribution
  <math|p(Z\|X,\<b-theta\><rsup|old>)>, so that

  <\equation*>
    Q<around*|(|\<b-theta\>,\<b-theta\><rsup|old>|)>\<simeq\><frac|1|L><big|sum><rsub|l=1><rsup|L>ln
    p<around*|(|Z<rsup|<around*|(|l|)>>,X\|\<b-theta\>|)>
  </equation*>

  The Q function is then optimized in the usual way in the M step. This
  procedure is called the <em|Monte Carlo EM algorithm>.

  It is straightforward to extend this to the problem of nding the mode of
  the posterior distribution over <math|\<b-theta\>> (the MAP estimate) when
  a prior distribution <math|p(\<b-theta\>)> has been dened, simply by
  adding <math|ln p(\<b-theta\>)> to the function <math|Q(\<b-theta\>,
  \<b-theta\><rsup|old>)> before performing the M step.

  A particular instance of the Monte Carlo EM algorithm, called
  <em|stochastic EM>, arises if we consider a nite mixture model, and draw
  just one sample at each E step. Here the latent variable <math|Z>
  characterizes which of the <math|K> components of the mixture is
  responsible for generating each data point. In the E step, a sample of
  <math|Z> is taken from the posterior distribution <math|p(Z\|X,
  \<b-theta\><rsup|old>)> where <math|X> is the data set. This effectively
  makes a hard assignment of each data point to one of the components in the
  mixture. In the M step, this sampled approximation to the posterior
  distribution is used to update the model parameters in the usual way.

  \ Now suppose we move from a maximum likelihood approach to a full Bayesian
  treatment in which we wish to sample from the posterior distribution over
  the parameter vector <math|\<b-theta\>>. In principle, we would like to
  draw samples from the joint posterior <math|p(\<b-theta\>,Z\|X)>, but we
  shall suppose that this is computationally difcult. Suppose further that
  it is relatively straightforward to sample from the complete-data parameter
  posterior <math|p(\<b-theta\>\|Z, X)>. This inspires the data augmentation
  algorithm, which alternates between two steps known as the I-step
  (imputation step, analogous to an E step) and the P-step (posterior step,
  analogous to an M step).

  IP Algorithm

  <\description>
    <item*|I-step>We wish to sample from p(Z\|X) but we cannot do this
    directly. We

    therefore note the relation

    <\equation*>
      p<around*|(|Z\|X|)>=<big|int>p<around*|(|Z\|\<b-theta\>,X|)>p<around*|(|\<b-theta\>\|X|)>\<mathd\>\<b-theta\>
    </equation*>

    and hence for <math|l=1,\<cdots\>,L> we rst draw a sample
    <math|\<b-theta\><rsup|<around*|(|l|)>>> from the current estimate for
    <math|p(\<b-theta\>\|X)>, and then use this to draw a sample
    <math|Z<rsup|(l)>> from <math|p(Z\|\<b-theta\><rsup|(l)>,X)>.

    <item*|P-step>Given the relation

    <\equation*>
      p<around*|(|\<b-theta\>\|X|)>=<big|int>p<around*|(|\<b-theta\>\|Z,X|)>p<around*|(|Z\|X|)>\<mathd\>Z
    </equation*>

    we use the samples <math|{Z<rsup|(l)>}> obtained from the I-step to
    compute a revised estimate of the posterior distribution over
    <math|\<b-theta\>> given by

    <\equation*>
      p<around*|(|\<b-theta\>\|X|)>\<simeq\><frac|1|L><big|sum><rsub|l=1><rsup|L>p<around*|(|\<b-theta\>\|Z<rsup|<around*|(|l|)>>,X|)>
    </equation*>

    By assumption, it will be feasible to sample from this approximation in
    the I-step.
  </description>

  Note that we are making a (somewhat articial) distinction between
  parameters <math|\<b-theta\>> and hidden variables <math|Z>. From now on,
  we blur this distinction and focus simply on the problem of drawing samples
  from a given posterior distribution.

  <section|Markov Chain Monte Carlo>

  In the previous section, we discussed the rejection sampling and importance
  sampling strategies for evaluating expectations of functions, and we saw
  that they suffer from severe limitations particularly in spaces of high
  dimensionality. We therefore turn in this section to a very general and
  powerful framework called Markov chain Monte Carlo (MCMC), which allows
  sampling from a large class of distributions, and which scales well with
  the dimensionality of the sample space. Markov chain Monte Carlo methods
  have their origins in physics (Metropolis and Ulam, 1949), and it was only
  towards the end of the 1980s that they started to have a signicant impact
  in the eld of statistics.

  As with rejection and importance sampling, we again sample from a proposal
  distribution. This time, however, we maintain a record of the current state
  <math|\<b-z\><rsup|<around*|(|\<tau\>|)>>> , and the proposal distribution
  <math|q<around*|(|\<b-z\>\|\<b-z\><rsup|<around*|(|\<tau\>|)>>|)>> depends
  on this current state, and so the sequence \ of samples
  <math|\<b-z\><rsup|<around*|(|1|)>>,\<b-z\><rsup|<around*|(|2|)>>,\<cdots\>>
  forms a Markov chain. Again, if we write
  <math|p<around*|(|\<b-z\>|)>=<wide|p|~><around*|(|\<b-z\>|)>/Z<rsub|p>>, we
  will assume that <math|<wide|p|~><around*|(|\<b-z\>|)>> can readily be
  evaluated for any given value of <math|\<b-z\>>, although the value of
  <math|Z<rsub|p>> may be unknown. The proposal distribution itself is chosen
  to be sufficiently simple that it is straightforward to draw samples from
  it directly. At each cycle of the algorithm, we generate a candidate sample
  <math|\<b-z\><rsup|\<ast\>>> from the proposal distribution and then accept
  the sample according to an appropriate criterion.

  In the basic <em|Metropolis algorithm> (Metropolis et al., 1953), we assume
  that the proposal distribution is symmetric, that is
  <math|q<around*|(|\<b-z\><rsub|A>\|\<b-z\><rsub|B>|)>=q<around*|(|\<b-z\><rsub|b>\|\<b-z\><rsub|A>|)>>
  for all values of <math|\<b-z\><rsub|A>> and <math|\<b-z\><rsub|B>> . The
  candidate sample is then accepted with probability

  <\equation>
    A<around*|(|\<b-z\><rsup|\<ast\>>,\<b-z\><rsup|<around*|(|\<tau\>|)>>|)>=min<around*|(|1,<frac|<wide|p|~><around*|(|\<b-z\><rsup|\<ast\>>|)>|<wide|p|~><around*|(|\<b-z\><rsup|<around*|(|\<tau\>|)>>|)>>|)><label|11.33>
  </equation>

  This can be achieved by choosing a random number <math|u> with uniform
  distribution over the unit interval <math|(0,1)> and then accepting the
  sample if <math|A<around*|(|\<b-z\><rsup|\<ast\>>,\<b-z\><rsup|<around*|(|\<tau\>|)>>|)>\<gtr\>u>.
  Note that if the step from <math|\<b-z\><rsup|<around*|(|\<tau\>|)>>> to
  <math|\<b-z\><rsup|\<ast\>>> causes an increase in the value of
  <math|p<around*|(|\<b-z\>|)>>, then the candidate point is certain to be
  kept.

  If the candidate sample is accepted, then
  <math|\<b-z\><rsup|<around*|(|\<tau\>+1|)>>=\<b-z\><rsup|\<ast\>>>,
  otherwise the candidate point <math|\<b-z\><rsup|\<ast\>>> is discarded,
  <math|\<b-z\><rsup|<around*|(|\<tau\>+1|)>>> is set to
  <math|\<b-z\><rsup|<around*|(|\<tau\>|)>>> and another candidate sample is
  drawn from the distribution <math|q<around*|(|\<b-z\>\|\<b-z\><rsup|<around*|(|\<tau\>+1|)>>|)>>.
  This is in contrast to rejection sampling, where rejected samples are
  simply discarded. In the Metropolis algorithm when a candidate point is
  rejected, the previous sample is included instead in the final list of
  samples, leading to multiple copies of samples. Of course, in a practical
  implementation, only a single copy of each retained sample would be kept,
  along with an integer weighting factor recording how many times that state
  appears. As we shall see, as long as <math|q<around*|(|\<b-z\><rsub|A>\|\<b-z\><rsub|B>|)>>
  is positive for any values of <math|\<b-z\><rsub|A>> and
  <math|\<b-z\><rsub|B>> (this is a sufficient but not necessary condition),
  the distribution of <math|\<b-z\><rsup|<around*|(|\<tau\>|)>>> tends to
  <math|p<around*|(|\<b-z\>|)>> as <math|\<tau\>\<rightarrow\>\<infty\>>. It
  should be emphasized, however, that the sequence
  <math|\<b-z\><rsup|<around*|(|1|)>>,\<b-z\><rsup|<around*|(|2|)>>,\<cdots\>>
  is not a set of independent samples from <math|p<around*|(|\<b-z\>|)>>
  because successive samples are highly correlated. If we wish to obtain
  independent samples, then we can discard most of the sequence and just
  retain every M'th sample. For M sufficiently large, the retained samples
  will for all practical purposes be independent. Figure <reference|fig11.9>
  shows a simple illustrative example of sampling from a two-dimensional
  Gaussian distribution using the Metropolis algorithm in which the proposal
  distribution is an isotropic Gaussian.

  <\padded-center>
    <\small-figure|<image|image/fig_11_9_metropolis.png|.3par|||>>
      <label|fig11.9>A simple illustration using Metropolis algorithm to
      sample from a Gaussian distribution whose one standard-deviation
      contour is shown by the ellipse. The proposal distribution is an
      isotropic Gaussian distribution whose standard deviation is <math|0.2>.
      Steps that are accepted are shown as green lines, and rejected steps
      are shown in red. A total of 150 candidate samples are generated, of
      which 43 are rejected.
    </small-figure>
  </padded-center>

  Further insight into the nature of Markov chain Monte Carlo algorithms can
  be gleaned by looking at the properties of a specic example, namely a
  simple random walk. Consider a state space <math|z> consisting of the
  integers, with probabilities

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|z<rsup|<around*|(|\<tau\>+1|)>>=z<rsup|<around*|(|\<tau\>|)>>|)>>|<cell|=>|<cell|0.5>>|<row|<cell|p<around*|(|z<rsup|<around*|(|\<tau\>+1|)>>=z<rsup|<around*|(|\<tau\>|)>>+1|)>>|<cell|=>|<cell|0.25>>|<row|<cell|p<around*|(|z<rsup|<around*|(|\<tau\>+1|)>>=z<rsup|<around*|(|\<tau\>|)>>-1|)>>|<cell|=>|<cell|0.25>>>>
  </eqnarray*>

  where <math|z<rsup|<around*|(|\<tau\>|)>>> denotes the state at step
  <math|\<tau\>> . If the initial state is <math|z=0>, then by symmetry the
  expected state at time <math|\<tau\>> will also be zero
  <math|\<bbb-E\>[z<rsup|(\<tau\>)>]=0>, and similarly it is easily seen that
  <math|\<bbb-E\>[(z<rsup|(\<tau\>)>)<rsup|2>]=\<tau\>/2>. Thus after
  <math|\<tau\>> steps, the random walk has only travelled a distance that on
  average is proportional to the square root of <math|\<tau\>> . This square
  root dependence is typical of random walk behaviour and shows that random
  walks are very inefcient in exploring the state space. As we shall see, a
  central goal in designing Markov chain Monte Carlo methods is to avoid
  random walk behaviour.

  <subsection|Markov chains>

  Before discussing Markov chain Monte Carlo methods in more detail, it is
  useful to study some general properties of Markov chains in more detail. In
  particular, we ask under what circumstances will a Markov chain converge to
  the desired distribution. A rst-order Markov chain is dened to be a
  series of random variables <math|\<b-z\><rsup|<around*|(|1|)>>,\<b-z\><rsup|<around*|(|2|)>>,\<cdots\>\<b-z\><rsup|<around*|(|M|)>>>
  such that the following conditional independence property holds for <math|m
  \<in\> {1,\<cdots\>,M\<minus\>1}>

  <\equation*>
    p<around*|(|\<b-z\><rsup|<around*|(|m+1|)>>\|\<b-z\><rsup|<around*|(|1|)>>,\<b-z\><rsup|<around*|(|2|)>>,\<cdots\>,\<b-z\><rsup|<around*|(|m|)>>|)>=p<around*|(|\<b-z\><rsup|<around*|(|m+1|)>>\|\<b-z\><rsup|<around*|(|m|)>>|)>
  </equation*>

  This of course can be represented as a directed graph in the form of a
  chain, an example of which is shown in Figure 8.38. We can then specify the
  Markov chain by giving the probability distribution for the initial
  variable <math|p(\<b-z\><rsup|(0)>)> together with the conditional
  probabilities for subsequent variables in the form of <em|transition
  probabilities> <math|T<rsub|m><around*|(|\<b-z\><rsup|<around*|(|m|)>>,\<b-z\><rsup|<around*|(|m+1|)>>|)>\<equiv\>p<around*|(|\<b-z\><rsup|<around*|(|m+1|)>>\|\<b-z\><rsup|<around*|(|m|)>>|)>>
  . A Markov chain is called <em|homogeneous> if the transition probabilities
  are the same for all m.

  The marginal probability for a particular variable can be expressed in
  terms of the marginal probability for the previous variable in the chain in
  the form

  <\equation*>
    p<around*|(|\<b-z\><rsup|<around*|(|m+1|)>>|)>=<big|sum><rsub|\<b-z\><rsup|<around*|(|m|)>>>p<around*|(|\<b-z\><rsup|<around*|(|m+1|)>>\|\<b-z\><rsup|<around*|(|m|)>>|)>p<around*|(|\<b-z\><rsup|<around*|(|m|)>>|)>.
  </equation*>

  A distribution is said to be invariant, or stationary, with respect to a
  Markov chain if each step in the chain leaves that distribution invariant.
  Thus, for a homogeneous Markov chain with transition probabilities
  <math|T<around*|(|\<b-z\><rprime|'>,\<b-z\>|)>>, the distribution
  <math|p<rsup|\<ast\>><around*|(|\<b-z\>|)>> is invariant if

  <\equation*>
    p<rsup|*\<ast\>><around*|(|\<b-z\>|)>=<big|sum><rsub|\<b-z\><rprime|'>>T<around*|(|\<b-z\><rprime|'>,\<b-z\>|)>p<rsup|*\<ast\>><around*|(|\<b-z\><rprime|'>|)>.
  </equation*>

  Note that a given Markov chain may have more than one invariant
  distribution. For instance, if the transition probabilities are given by
  the identity transformation, then any distribution will be invariant.

  A sufcient (but not necessary) condition for ensuring that the required
  distribution <math|p(\<b-z\>)> is invariant is to choose the transition
  probabilities to satisfy the property of <em|detailed balance>, dened by

  <\equation>
    p<rsup|\<ast\>><around*|(|\<b-z\>|)>T<around*|(|\<b-z\>,\<b-z\><rprime|'>|)>=p<rsup|*\<ast\>><around*|(|\<b-z\><rprime|'>|)>T<around*|(|\<b-z\><rprime|'>,\<b-z\>|)><label|11.40>
  </equation>

  for the particular distribution <math|p<rsup|\<ast\>><around*|(|\<b-z\>|)>>.
  It is easily seen that a transition probability that satifies detailed
  balance with respect to a particular distribution will leave that
  distribution invariant, because

  <\eqnarray*>
    <tformat|<table|<row|<cell|<big|sum><rsub|\<b-z\><rprime|'>>p<rsup|*\<ast\>><around*|(|\<b-z\><rprime|'>|)>T<around*|(|\<b-z\><rprime|'>,\<b-z\>|)>>|<cell|=>|<cell|<big|sum><rsub|\<b-z\><rprime|'>>p<rsup|*\<ast\>><around*|(|\<b-z\>|)>T<around*|(|\<b-z\>,\<b-z\><rprime|'>|)>>>|<row|<cell|>|<cell|=>|<cell|p<rsup|*\<ast\>><around*|(|\<b-z\>|)><big|sum><rsub|\<b-z\><rprime|'>>p<around*|(|\<b-z\><rprime|'>\|\<b-z\>|)>>>|<row|<cell|>|<cell|=>|<cell|p<rsup|*\<ast\>><around*|(|\<b-z\>|)>>>>>
  </eqnarray*>

  A Markov chain that respects detailed balance is said to be
  <em|reversible>.

  Our goal is to use Markov chains to sample from a given distribution. We
  can achieve this if we set up a Markov chain such that the desired
  distribution is invariant. However, we must also require that for
  <math|m\<rightarrow\>\<infty\>>, the distribution
  <math|p(\<b-z\><rsup|<around*|(|m|)>>)> converges to the required invariant
  distribution <math|p<rsup|\<ast\>><around*|(|\<b-z\>|)>>, irrespective of
  the choice of initial distribution <math|p(\<b-z\><rsup|(0)>)>. This
  property is called <em|ergodicity>, and the invariant distribution is then
  called the <em|equilibrium distribution>. Clearly, an ergodic Markov chain
  can have only one equilibrium distribution. It can be shown that a
  homogeneous Markov chain will be ergodic, subject only to weak restrictions
  on the invariant distribution and the transition probabilities (Neal,
  1993). In practice we often construct the transition probabilities from a
  set of \<#2018\>base' transitions <math|B<rsub|1>,B<rsub|2>,\<cdots\>,B<rsub|K>>
  . This can be achieved through a mixture distribution of the form

  <\equation>
    T<around*|(|\<b-z\><rprime|'>,\<b-z\>|)>=<big|sum><rsub|k=1><rsup|K>\<alpha\><rsub|k>B<rsub|k><around*|(|\<b-z\><rprime|'>,\<b-z\>|)><label|11.42>
  </equation>

  for some set of mixing coefcients <math|\<alpha\><rsub|1>,\<cdots\>,\<alpha\><rsub|K>>
  satisfying <math|\<alpha\><rsub|k>\<geqslant\>0> and
  <math|<big|sum><rsub|k>\<alpha\><rsub|k>=1>. Alternatively, the base
  transitions may be combined through successive application, so that

  <\equation>
    T<around*|(|\<b-z\><rprime|'>,\<b-z\>|)>=<big|sum><rsub|\<b-z\><rsub|1>>\<cdots\><big|sum><rsub|z<rsub|n-1>>B<rsub|1><around*|(|\<b-z\><rprime|'>,\<b-z\><rsub|1>|)>\<cdots\>B<rsub|K-1><around*|(|\<b-z\><rsub|k-2>,\<b-z\><rsub|k-1>|)>B<rsub|K><around*|(|\<b-z\><rsub|K-1>,\<b-z\>|)><label|11.43>
  </equation>

  If a distribution is invariant with respect to each of the base
  transitions, then obviously it will also be invariant with respect to
  either of the <math|T<around*|(|\<b-z\><rprime|'>,\<b-z\>|)>> given by Eq.
  <eqref|11.42> or <eqref|11.43>. For the case of the mixture Eq.
  <eqref|11.42>, if each of the base transitions satisfies detailed balance,
  then the mixturetransition <math|T> will also satisfy detailed balance.
  This does not hold for the transition probability constructed using Eq.
  <eqref|11.43>, although by symmetrizing the order of application of the
  base transitions, in the form <math|B<rsub|1>,B<rsub|2>,\<cdots\>,B<rsub|K>>,
  <math|B<rsub|K>,\<cdots\>,B<rsub|2>B<rsub|1>> detailed balance can be
  restored. A common example of the use of composite transition probabilities
  is where each base transition changes only a subset of the variables.

  <subsection|The Metropolis-Hastings algorithm>

  Earlier we introduced the basic Metropolis algorithm, without actually
  demonstrating that it samples from the required distribution. Before giving
  a proof, we first discuss a generalization, known as the
  <em|Metropolis-Hastings> algorithm (Hastings, 1970), to the case where the
  proposal distribution is no longer a symmetric function of its arguments.
  In particular at step <math|\<tau\>> of the algorithm, in which the current
  state is <math|\<b-z\><rsup|<around*|(|\<tau\>|)>>> , we draw a sample
  <math|\<b-z\><rsup|\<ast\>>> from the distribution
  <math|q<rsub|k><around*|(|\<b-z\>\|\<b-z\><rsup|*<around*|(|\<tau\>|)>>|)>>
  and then accept it with probability <math|A<rsub|k><around*|(|\<b-z\><rsup|\<ast\>>,\<b-z\><rsub|\<tau\>>|)>>
  where

  <\equation>
    A<rsub|k><around*|(|\<b-z\><rsup|\<ast\>>,\<b-z\><rsup|*<around*|(|\<tau\>|)>>|)>=min<around*|(|1,<frac|<wide|p|~><around*|(|\<b-z\><rsup|\<ast\>>|)>q<rsub|k><around*|(|\<b-z\><rsup|*<around*|(|\<tau\>|)>>\|\<b-z\><rsup|\<ast\>>|)>|<wide|p|~><around*|(|\<b-z\><rsup|*<around*|(|\<tau\>|)>>|)>q<rsub|k><around*|(|\<b-z\><rsup|\<ast\>>\|\<b-z\><rsup|*<around*|(|\<tau\>|)>>|)>>|)>.<label|11.44>
  </equation>

  Here <math|k> labels the members of the set of possible transitions being
  considered. Again, the evaluation of the acceptance criterion does not
  require knowledge of the normalizing constant <math|Z<rsub|p>> in the
  probability distribution <math|p(\<b-z\>)=<wide|p|~>(\<b-z\>)/Z<rsub|p>>.
  For a symmetric proposal distribution the Metropolis-Hastings criterion Eq.
  <eqref|11.44> reduces to the standard Metropolis criterion given by Eq.
  <eqref|11.33>.

  We can show that <math|p(\<b-z\>)> is an invariant distribution of the
  Markov chain defined by the Metropolis-Hastings algorithm by showing that
  detailed balance, defined by <eqref|11.40>, is satisfied. Using Eq.
  <eqref|11.44> we have

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|\<b-z\>|)>q<rsub|k><around*|(|\<b-z\>\|\<b-z\><rprime|'>|)>A<rsub|k><around*|(|\<b-z\><rprime|'>,\<b-z\>|)>>|<cell|=>|<cell|min<around*|(|p<around*|(|\<b-z\>|)>q<rsub|k><around*|(|\<b-z\>\|\<b-z\><rprime|'>|)>,p<around*|(|\<b-z\><rprime|'>|)>q<rsub|k><around*|(|\<b-z\><rprime|'>\|\<b-z\>|)>|)>>>|<row|<cell|>|<cell|=>|<cell|min<around*|(|p<around*|(|\<b-z\><rprime|'>|)>q<rsub|k><around*|(|\<b-z\><rprime|'>\|\<b-z\>|)>,p<around*|(|\<b-z\>|)>q<rsub|k><around*|(|\<b-z\>\|\<b-z\><rprime|'>|)>|)>>>|<row|<cell|>|<cell|=>|<cell|p<around*|(|\<b-z\><rprime|'>|)>q<rsub|k><around*|(|\<b-z\><rprime|'>\|\<b-z\>|)>A<rsub|k><around*|(|\<b-z\>,\<b-z\><rprime|'>|)>>>>>
  </eqnarray*>

  as required.

  The specic choice of proposal distribution can have a marked effect on the
  performance of the algorithm. For continuous state spaces, a common choice
  is a Gaussian centred on the current state, leading to an important
  trade-off in determining the variance parameter of this distribution. If
  the variance is small, then the proportion of accepted transitions will be
  high, but progress through the state space takes the form of a slow random
  walk leading to long correlation times. However, if the variance parameter
  is large, then the rejection rate will be high because, in the kind of
  complex problems we are considering, many of the proposed steps will be to
  states for which the probability <math|p(\<b-z\>)> is low.\ 

  Consider a multivariate distribution <math|p<around*|(|\<b-z\>|)>> having
  strong correlations between the components of <math|\<b-z\>>, as
  illustrated in Figure 11.10. The scale <math|\<rho\>> of the proposal
  distribution should be as large as possible without incurring high
  rejection rates. This suggests that <math|\<rho\>> should be of the same
  order as the smallest length scale <math|\<sigma\><rsub|min>> . The system
  then explores the distribution along the more extended direction by means
  of a random walk, and so the number of steps to arrive at a state that is
  more or less independent of the original state is of order
  <math|(\<sigma\><rsub|max>/\<sigma\><rsub|min>)<rsup|2>> . In fact in two
  dimensions, the increase in rejection rate as <math|\<rho\>> increases is
  offset by the larger steps sizes of those transitions that are accepted,
  and more generally for a multivariate Gaussian the number of steps required
  to obtain independent samples scales like
  <math|(\<sigma\><rsub|max>/\<sigma\><rsub|2>)<rsup|2>> where
  <math|\<sigma\><rsub|2>> is the second-smallest standard deviation (Neal,
  1993). These details aside, it remains the case that if the length scales
  over which the distributions vary are very different in different
  directions, then the Metropolis Hastings algorithm can have very slow
  convergence.

  <\padded-center>
    <\small-figure|<image|image/fig_11_10_metropolis_hastings.png|.3par|||>>
      Schematic illustration of the use of an isotropic Gaussian proposal
      distribution (blue circle) to sample from a correlated multivariate
      Gaussian distribution (red ellipse) having very different standard
      deviations in different directions, using the Metropolis-Hastings
      algorithm. In order to keep the rejection rate low, the scale
      <math|\<rho\>> of the proposal distribution should be on the order of
      the smallest standard deviation <math|\<sigma\><rsub|min>> , which
      leads to random walk behaviour in which the number of steps separating
      states that are approximately independent is of order
      <math|(\<sigma\><rsub|max>/\<sigma\><rsub|min>)<rsup|2>> where
      <math|\<sigma\><rsub|max>> is the largest standard deviation.
    </small-figure>
  </padded-center>

  <section|Gibbs Sampling><label|sec11.3>

  Gibbs sampling (Geman and Geman, 1984) is a simple and widely applicable
  Markov chain Monte Carlo algorithm and can be seen as a special case of the
  Metropolis-Hastings algorithm. Consider the distribution
  <math|p(\<b-z\>)=p(z<rsub|1>,\<cdots\>,z<rsub|M>)> from which we wish to
  sample, and suppose that we have chosen some initial state for the Markov
  chain. Each step of the Gibbs sampling procedure involves replacing the
  value of one of the variables by a value drawn from the distribution of
  that variable conditioned on the values of the remaining variables. Thus we
  replace <math|z<rsub|i>> by a value drawn from the distribution
  <math|p(z<rsub|i>\|\<b-z\><rsub|\\i>)>, where <math|z<rsub|i>> denotes the
  i'th component of <math|\<b-z\>>, and <math|\<b-z\><rsub|\\i>> denotes
  <math|z<rsub|1>,\<cdots\>,z<rsub|M>> but with <math|z<rsub|i>> omitted.
  This procedure is repeated either by cycling through the variables in some
  particular order or by choosing the variable to be updated at each step at
  random from some distribution.

  For example, suppose we have a distribution
  <math|p(z<rsub|1>,z<rsub|2>,z<rsub|3>)> over three variables, and at step
  <math|\<tau\>> of the algorithm we have selected values
  <math|z<rsub|1><rsup|<around*|(|\<tau\>|)>>>,
  <math|z<rsub|2><rsup|<around*|(|\<tau\>|)>>> and
  <math|z<rsub|3><rsup|<around*|(|\<tau\>|)>>>. We rst replace
  <math|z<rsub|1><rsup|<around*|(|\<tau\>|)>>> by a new value
  <math|z<rsub|1><rsup|<around*|(|\<tau\>+1|)>>> obtained by sampling from
  the conditional distribution

  <\equation*>
    p<around*|(|z<rsub|1>\|z<rsub|2><rsup|<around*|(|\<tau\>|)>>,z<rsub|3><rsup|<around*|(|\<tau\>|)>>|)>.
  </equation*>

  Next we replace <math|z<rsub|2><rsup|<around*|(|\<tau\>|)>>> by a value
  <math|z<rsub|2><rsup|<around*|(|\<tau\>+1|)>>> obtained by sampling from
  the conditional distribution

  <\equation*>
    p<around*|(|z<rsub|2>\|z<rsub|1><rsup|<around*|(|\<tau\>+1|)>>,z<rsub|3><rsup|<around*|(|\<tau\>|)>>|)>
  </equation*>

  so that the new value for <math|z<rsub|1>> is used straight away in
  subsequent sampling steps. Then we update <math|z<rsub|3>> with a sample
  <math|z<rsub|3><rsup|<around*|(|\<tau\>+1|)>>> drawn from

  <\equation*>
    p<around*|(|z<rsub|3>\|z<rsub|1><rsup|<around*|(|\<tau\>+1|)>>,z<rsub|2><rsup|<around*|(|\<tau\>+1|)>>|)>
  </equation*>

  and so on, cycling through the three variables in turn.

  Gibbs Sampling

  <\enumerate-numeric>
    <item>Initialize {zi : i = 1, . . . , M }

    <item>For <math|\<tau\>=1,\<cdots\>,T> :

    <\itemize-minus>
      <item>Sample <math|z<rsub|1><rsup|<around*|(|\<tau\>+1|)>>\<sim\>p<around*|(|z<rsub|1>\|z<rsub|2><rsup|<around*|(|\<tau\>|)>>,z<rsub|3><rsup|<around*|(|\<tau\>|)>>,\<cdots\>,z<rsub|M><rsup|<around*|(|\<tau\>|)>>|)>.>

      <item>Sample <math|z<rsub|2><rsup|<around*|(|\<tau\>+1|)>>\<sim\>p<around*|(|z<rsub|1>\|z<rsub|1><rsup|<around*|(|\<tau\>|)>>,z<rsub|3><rsup|<around*|(|\<tau\>|)>>,\<cdots\>,z<rsub|M><rsup|<around*|(|\<tau\>|)>>|)>.>

      \<vdots\>

      <item>Sample <math|z<rsub|j><rsup|<around*|(|\<tau\>+1|)>>\<sim\>p<around*|(|z<rsub|1>\|z<rsub|1><rsup|<around*|(|\<tau\>|)>>,z<rsub|2><rsup|<around*|(|\<tau\>|)>>,\<cdots\>,z<rsub|j-1><rsup|<around*|(|\<tau\>|)>>,z<rsub|j+1><rsup|<around*|(|\<tau\>|)>>,\<cdots\>,z<rsub|M><rsup|<around*|(|\<tau\>|)>>|)>.>

      \<vdots\>

      <item>Sample <math|z<rsub|M><rsup|<around*|(|\<tau\>+1|)>>\<sim\>p<around*|(|z<rsub|1>\|z<rsub|1><rsup|<around*|(|\<tau\>|)>>,z<rsub|3><rsup|<around*|(|\<tau\>|)>>,\<cdots\>,z<rsub|M-1><rsup|<around*|(|\<tau\>|)>>|)>.>
    </itemize-minus>
  </enumerate-numeric>

  \;

  To show that this procedure samples from the required distribution, we rst
  of all note that the distribution <math|p(\<b-z\>)> is an invariant of each
  of the Gibbs sampling steps individually and hence of the whole Markov
  chain. This follows from the fact that when we sample from
  <math|p(z<rsub|i>\|<around*|{|z<rsub|\\i>|}>)>, the marginal distribution
  <math|p(\<b-z\><rsub|\\i>)> is clearly invariant because the value of
  <math|\<b-z\><rsub|\\i>> is unchanged. Also, each step by denition samples
  from the correct conditional distribution
  <math|p(z<rsub|i>\|\<b-z\><rsub|\\i>)>. Because these conditional and
  marginal distributions together specify the joint distribution, we see that
  the joint distribution is itself invariant.

  The second requirement to be satised in order that the Gibbs sampling
  procedure samples from the correct distribution is that it be ergodic. A
  sufcient condition for ergodicity is that none of the conditional
  distributions be anywhere zero. If this is the case, then any point in
  <math|\<b-z\>> space can be reached from any other point in a nite number
  of steps involving one update of each of the component variables. If this
  requirement is not satised, so that some of the conditional distributions
  have zeros, then ergodicity, if it applies, must be proven explicitly.

  The distribution of initial states must also be specified in order to
  complete the algorithm, although samples drawn after many iterations will
  effectively become independent of this distribution. Of course, successive
  samples from the Markov chain will be highly correlated, and so to obtain
  samples that are nearly independent it will be necessary to subsample the
  sequence. We can obtain the Gibbs sampling procedure as a particular
  instance of the Metropolis-Hastings algorithm as follows. Consider a
  Metropolis-Hastings sampling step involving the variable <math|z<rsub|k>>
  in which the remaining variables <math|\<b-z\><rsub|\\k>> remain fixed, and
  for which the transition probability from <math|\<b-z\>> to
  <math|\<b-z\><rsup|\<ast\>>> is given by
  <math|q<rsub|k><around*|(|\<b-z\><rsup|\<ast\>>\|\<b-z\>|)>=p<around*|(|z<rsub|k><rsup|\<ast\>>\|\<b-z\><rsub|\\k>|)>>.
  We note that <math|\<b-z\><rsup|\<ast\>><rsub|\\k>=\<b-z\><rsub|\\k>>
  because these components are unchanged by the sampling step. Also,
  <math|p(\<b-z\>) = p(z<rsub|k>\|\<b-z\><rsub|\\k>)p(\<b-z\><rsub|\\k>)>.
  Thus the factor that determines the acceptance probability in the
  Metropolis-Hastings Eq. <eqref|11.44> is given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|A<around*|(|\<b-z\><rsup|\<ast\>>,\<b-z\>|)>>|<cell|=>|<cell|<frac|p<around*|(|\<b-z\><rsup|\<ast\>>|)>q<rsub|k><around*|(|\<b-z\>\|\<b-z\><rsup|\<ast\>>|)>|p<around*|(|\<b-z\>|)>q<rsub|k><around*|(|\<b-z\><rsup|\<ast\>>\|\<b-z\>|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|
    p(z<rsub|k><rsup|\<ast\>>\|\<b-z\><rsup|\<ast\>><rsub|\\k>)p(\<b-z\><rsup|\<ast\>><rsub|\\k>)p<around*|(|z<rsub|k>\|\<b-z\><rsub|\\k><rsup|\<ast\>>|)>|
    p(z<rsub|k>\|\<b-z\><rsub|\\k>)p(\<b-z\><rsub|\\k>)p<around*|(|z<rsub|k><rsup|\<ast\>>\|\<b-z\><rsub|\\k>|)>>>>|<row|<cell|>|<cell|=>|<cell|1>>>>
  </eqnarray*>

  where we have used <math|\<b-z\><rsup|\<ast\>><rsub|\\k
  >=\<b-z\><rsub|\\k>> . Thus the Metropolis-Hastings steps are always
  accepted. As with the Metropolis algorithm, we can gain some insight into
  the behaviour of Gibbs sampling by investigating its application to a
  Gaussian distribution. Consider a correlated Gaussian in two variables, as
  illustrated in Figure <reference|fig11.11>, having conditional
  distributions of width <math|l> and marginal distributions of width
  <math|L>. The typical step size is governed by the conditional
  distributions and will be of order <math|l>. Because the state evolves
  according to a random walk, the number of steps needed to obtain
  independent samples from the distribution will be of order
  <math|(L/l)<rsup|2>> . Of course if the Gaussian distribution were
  uncorrelated, then the Gibbs sampling procedure would be optimally
  efficient. For this simple problem, we could rotate the coordinate system
  in order to decorrelate the variables. However, in practical applications
  it will generally be infeasible to find such transformations.

  <\padded-center>
    <\small-figure|<image|image/fig_11_11_gibbs_gaussian.png|0.3par|||>>
      <label|fig11.11>Illustration of Gibbs sampling by alternate updates of
      two variables whose distribution is a correlated Gaussian. The step
      size is governed by the standard deviation of the conditional
      distribution (green curve), and is <math|O(l)>, leading to slow
      progress in the direction of elongation of the joint distribution (red
      ellipse). The number of steps needed to obtain an independent sample
      from the distribution is <math|O((L/l)<rsup|2>)>.
    </small-figure>
  </padded-center>

  One approach to reducing random walk behaviour in Gibbs sampling is called
  <em|over-relaxation> (Adler, 1981). In its original form, this applies to
  problems for which the conditional distributions are Gaussian, which
  represents a more general class of distributions than the multivariate
  Gaussian because, for example, the non-Gaussian distribution <math|p(z, y)
  \<propto\> exp(\<minus\>z<rsup|2>y<rsup|2>)> has Gaussian conditional
  distributions. At each step of the Gibbs sampling algorithm, the
  conditional distribution for a particular component <math|z<rsub|i>> has
  some mean <math|\<mu\><rsub|i>> and some variance
  <math|\<sigma\><rsub|i><rsup|2>>. In the over-relaxation framework, the
  value of <math|z<rsub|i>> is replaced with \ 

  <\equation*>
    z<rsub|i><rprime|'> = \<mu\><rsub|i>+\<alpha\>(z<rsub|i>\<minus\>\<mu\><rsub|i>)+\<sigma\><rsub|i>(1\<minus\>\<alpha\><rsub|i><rsup|2>)<rsup|1/2>\<nu\>
  </equation*>

  \ \ where <math|\<nu\> >is a Gaussian random variable with zero mean and
  unit variance, and <math|\<alpha\>> is a parameter such that
  <math|\<minus\>1\<less\>\<alpha\>\<less\>1>. For <math|\<alpha\>=0>, the
  method is equivalent to standard Gibbs sampling, and for
  <math|\<alpha\>\<less\>0> the step is biased to the opposite side of the
  mean. This step leaves the desired distribution invariant because if
  <math|z<rsub|i>> has mean <math|\<mu\><rsub|i>> \ and variance
  <math|\<sigma\><rsub|i><rsup|2>>, then so too does
  <math|z<rsub|i><rprime|'>>. The effect of over-relaxation is to encourage
  directed motion through state space when the variables are highly
  correlated. The framework of <em|ordered over-relaxation> (Neal, 1999)
  generalizes this approach to non-Gaussian distributions.

  The practical applicability of Gibbs sampling depends on the ease with
  which samples can be drawn from the conditional distributions
  <math|p(z<rsub|k>\|\<b-z\><rsub|\\k>)>. In the case of probability
  distributions specified using graphical models, the conditional
  distributions for individual nodes depend only on the variables in the
  corresponding Markov blankets, as illustrated in Figure
  <inactive|<reference|fig11.12>>.\ 

  <\padded-center>
    <\small-figure|<image|image/fig_11_12_gibbs_blanket.png|.3par|||>>
      \ The Gibbs sampling method requires samples to be drawn from the
      conditional distribution of a variable conditioned on the remaining
      variables. For graphical models, this conditional distribution is a
      function only of the states of the nodes in the Markov blanket. For an
      undirected graph this comprises the set of neighbours, as shown on the
      left, while for a directed graph the Markov blanket comprises the
      parents, the children, and the co-parents, as shown on the right.
    </small-figure>
  </padded-center>

  For directed graphs, a wide choice of conditional distributions for the
  individual nodes conditioned on their parents will lead to conditional
  distributions for Gibbs sampling that are log concave. The adaptive
  rejection sampling methods discussed in Section <reference|sec11.1.3>
  therefore provide a framework for Monte Carlo sampling from directed graphs
  with broad applicability.\ 

  If the graph is constructed using distributions from the exponential
  family, and if the parent-child relationships preserve conjugacy, then the
  full conditional distributions arising in Gibbs sampling will have the same
  functional form as the original conditional distributions (conditioned on
  the parents) defining each node, and so standard sampling techniques can be
  employed. In general, the full conditional distributions will be of a
  complex form that does not permit the use of standard sampling algorithms.
  However, if these conditionals are log concave, then sampling can be done
  efficiently using adaptive rejection sampling (assuming the corresponding
  variable is a scalar). \ If, at each stage of the Gibbs sampling algorithm,
  instead of drawing a sample from the corresponding conditional
  distribution, we make a point estimate of the variable given by the maximum
  of the conditional distribution, then we obtain the iterated conditional
  modes (ICM) algorithm discussed in Section 8.3.3. Thus ICM can be seen as a
  greedy approximation to Gibbs sampling. \ Because the basic Gibbs sampling
  technique considers one variable at a time, there are strong dependencies
  between successive samples. At the opposite extreme, if we could draw
  samples directly from the joint distribution (an operation that we are
  supposing is intractable), then successive samples would be independent. We
  can hope to improve on the simple Gibbs sampler by adopting an intermediate
  strategy in which we sample successively from groups of variables rather
  than individual variables. This is achieved in the blocking Gibbs sampling
  algorithm by choosing blocks of variables, not necessarily disjoint, and
  then sampling jointly from the variables in each block in turn, conditioned
  on the remaining variables (Jensen et al., 1995).

  <section|Slice Sampling>

  \;

  We have seen that one of the difficulties with the Metropolis algorithm is
  the sensitivity to step size. If this is too small, the result is slow
  decorrelation due to random walk behaviour, whereas if it is too large the
  result is inefficiency due to a high rejection rate. The technique of
  <em|slice sampling> (Neal, 2003) provides an adaptive step size that is
  automatically adjusted to match the characteristics of the distribution.
  Again it requires that we are able to evaluate the unnormalized
  distribution <math|<wide|p|~>(\<b-z\>)>.

  Consider first the univariate case. Slice sampling involves augmenting
  <math|z> with an additional variable <math|u> and then drawing samples from
  the joint <math|(z,u)> space. We shall see another example of this approach
  when we discuss hybrid Monte Carlo in Section 11.5. The goal is to sample
  uniformly from the area under the distribution given by

  <\equation*>
    <wide|p|^><around*|(|z,u|)>=<choice|<tformat|<table|<row|<cell|1/Z<rsub|p>>|<cell|if
    0\<leqslant\>u\<leqslant\><wide|p|~><around*|(|z|)>>>|<row|<cell|0>|<cell|otherwise>>>>>
  </equation*>

  where <math|Z<rsub|p>=\<big-int\> <wide|p|~>(z) \<mathd\>z>. The marginal
  distribution over <math|z> is given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|<big|int><wide|p|^><around*|(|z,u|)>>|<cell|=>|<cell|<big|int><rsub|0><rsup|<wide|p|~><around*|(|z|)>><frac|1|Z<rsub|p>>\<mathd\>u>>|<row|<cell|>|<cell|=>|<cell|<frac|<wide|p|~><around*|(|z|)>|Z<rsub|p>>>>|<row|<cell|>|<cell|=>|<cell|p<around*|(|z|)>>>>>
  </eqnarray*>

  and so we can sample from <math|p(z)> by sampling from
  <math|<wide|p|^>(z,u)> and then ignoring the <math|u> values. This can be
  achieved by alternately sampling <math|z> and <math|u>. Given the value of
  <math|z> we evaluate <math|<wide|p|^>(z)> and then sample <math|u>
  uniformly in the range <math|0\<leqslant\>u\<leqslant\>p(z)>, which is
  straightforward. Then we fix <math|u> and sample <math|z> uniformly from
  the `slice' through the distribution defined by <math|{z : p(z) \<gtr\>
  u}>. This is illustrated in Figure <reference|fig11.13>(a).

  <\padded-center>
    <small-figure|<image|image/fig_11_13_slice_sampling.png|.7par|||>|<label|fig11.13>Illustration
    of slice sampling. (a) For a given value <math|z<rsup|(\<tau\>)>>, a
    value of <math|u> is chosen uniformly in the region
    <math|0\<leqslant\>u\<leqslant\><wide|p|~>(z<rsup|(\<tau\>)>)>, which
    then defines a `slice' through the distribution, shown by the solid
    horizontal lines. (b) Because it is infeasible to sample directly from a
    slice, a new sample of <math|z> is drawn from a region
    <math|z<rsub|min>\<leqslant\>z\<leqslant\>z<rsub|max>>, which contains
    the previous value <math|z<rsup|(\<tau\>)>>.>
  </padded-center>

  In practice, it can be difficult to sample directly from a slice through
  the distribution and so instead we define a sampling scheme that leaves the
  uniform distribution under <math|<wide|p|^>(z,u)> invariant, which can be
  achieved by ensuring that detailed balance is \ satisfied. Suppose the
  current value of <math|z> is denoted <math|z<rsup|(\<tau\>)>> and that we
  have obtained a corresponding sample <math|u>. The next value of <math|z>
  is obtained by considering a region <math|z<rsub|min>\<leqslant\>z\<leqslant\>z<rsub|max>>
  that contains <math|z(\<tau\>)>. It is in the choice of this region that
  the adaptation to the characteristic length scales of the distribution
  takes place. We want the region to encompass as much of the slice as
  possible so as to allow large moves in <math|z> space while having as
  little as possible of this region lying outside the slice, because this
  makes the sampling less efficient. \ One approach to the choice of region
  involves starting with a region containing <math|z<rsup|(\<tau\>)>> having
  some width <math|w> and then testing each of the end points to see if they
  lie within the slice. If either end point does not, then the region is
  extended in that direction by increments of value <math|w> until the end
  point lies outside the region. A candidate value <math|z<rprime|'>> is then
  chosen uniformly from this region, and if it lies within the slice, then it
  forms <math|z<rsup|(\<tau\>+1)>>. If it lies outside the slice, then the
  region is shrunk such that <math|z<rprime|'>> forms an end point and such
  that the region still contains <math|z<rsup|(\<tau\>)>>. Then another
  candidate point is drawn uniformly from this reduced region and so on,
  until a value of <math|z> is found that lies within the slice.

  Slice sampling can be applied to multivariate distributions by repeatedly
  sampling each variable in turn, in the manner of Gibbs sampling. This
  requires that we are able to compute, for each component <math|z<rsub|i>>,
  a function that is proportional to <math|p(z<rsub|i>\|\<b-z\><rsub|\\i>)>.

  <section|The Hybrid Monte Carlo Algorithm>

  \;

  As we have already noted, one of the major limitations of the Metropolis
  algorithm is that it can exhibit random walk behaviour whereby the distance
  traversed through the state space grows only as the square root of the
  number of steps. The problem cannot be resolved simply by taking bigger
  steps as this leads to a high rejection rate. \ In this section, we
  introduce a more sophisticated class of transitions based on an analogy
  with physical systems and that has the property of being able to make large
  changes to the system state while keeping the rejection probability small.
  It is applicable to distributions over continuous variables for which we
  can readily evaluate the gradient of the log probability with respect to
  the state variables. We will discuss the dynamical systems framework in
  Section 11.5.1, and then in Section 11.5.2 we explain how this may be
  combined with the Metropolis algorithm to yield the powerful hybrid Monte
  Carlo algorithm. A background in physics is not required as this section is
  self-contained and the key results are all derived from first principles.

  <subsection|Dynamical systems>

  The dynamical approach to stochastic sampling has its origins in algorithms
  for simulating the behaviour of physical systems evolving under
  <em|Hamiltonian dynamics>. In a Markov chain Monte Carlo simulation, the
  goal is to sample from a given probability distribution <math|p(\<b-z\>)>.
  The framework of Hamiltonian dynamics is exploited by casting the
  probabilistic simulation in the form of a Hamiltonian system. In order to
  remain in keeping with the literature in this area, we make use of the
  relevant dynamical systems terminology where appropriate, which will be
  defined as we go along.

  The dynamics that we consider corresponds to the evolution of the state
  variable <math|\<b-z\>={z<rsub|i>}> under continuous time, which we denote
  by <math|\<tau\>> . Classical dynamics is described by Newton's second law
  of motion in which the acceleration of an object is proportional to the
  applied force, corresponding to a second-order differential equation over
  time. We can decompose a second-order equation into two coupled firstorder
  equations by introducing intermediate momentum variables <math|\<b-r\>>,
  corresponding to the rate of change of the state variables <math|\<b-z\>>,
  having components

  <\equation>
    r<rsub|i>=<frac|\<mathd\>z<rsub|i>|\<mathd\>\<tau\>><label|11.53>
  </equation>

  where the <math|z<rsub|i>> can be regarded as position variables in this
  dynamics perspective. Thus for each position variable there is a
  corresponding momentum variable, and the joint space of position and
  momentum variables is called <em|phase space>.

  Without loss of generality, we can write the probability distribution
  <math|p(\<b-z\>)> in the form

  <\equation*>
    p<around*|(|\<b-z\>|)>=<frac|1|Z<rsub|p>>exp<around*|(|-E<around*|(|\<b-z\>|)>|)>
  </equation*>

  where <math|E(\<b-z\>)> is interpreted as the potential energy of the
  system when in state <math|\<b-z\>>. The system acceleration is the rate of
  change of momentum and is given by the applied force, which itself is the
  negative gradient of the potential energy

  <\equation>
    <frac|\<mathd\>r<rsub|i>|\<mathd\>\<tau\>>=-<frac|\<partial\>E*<around*|(|\<b-z\>|)>|\<partial\>z<rsub|i>><label|11.55>
  </equation>

  It is convenient to reformulate this dynamical system using the Hamiltonian
  framework. To do this, we first define the <em|kinetic energy> by

  <\eqnarray*>
    <tformat|<table|<row|<cell|K<around*|(|\<b-r\>|)>>|<cell|=>|<cell|<frac|1|2><around*|\<\|\|\>|\<b-r\>|\<\|\|\>><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2><big|sum><rsub|i>r<rsub|i><rsup|2><eq-number><label|11.56>>>>>
  </eqnarray*>

  The total energy of the system is then the sum of its potential and kinetic
  energies

  <\equation>
    H<around*|(|\<b-z\>,\<b-r\>|)>=E<around*|(|\<b-z\>|)>+K<around*|(|\<b-r\>|)><label|11.57>
  </equation>

  where <math|H> is the <em|Hamiltonian function>. Using Eq. <eqref|11.53>,
  <eqref|11.55>, <eqref|11.56>, and <eqref|11.57>, we can now express the
  dynamics of the system in terms of the Hamiltonian equations given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|<frac|\<mathd\>z<rsub|i>|\<mathd\>\<tau\>>>|<cell|=>|<cell|<frac|\<partial\>H|\<partial\>r<rsub|i>>>>|<row|<cell|<frac|\<mathd\>r<rsub|i>|\<mathd\>\<tau\>>>|<cell|=>|<cell|-<frac|\<partial\>H|\<partial\>z<rsub|i>>>>>>
  </eqnarray*>

  During the evolution of this dynamical system, the value of the Hamiltonian
  <math|H> is constant, as is easily seen by differentiation

  <\eqnarray*>
    <tformat|<table|<row|<cell|<frac|\<mathd\>H|\<mathd\>\<tau\>>>|<cell|=>|<cell|<big|sum><rsub|i><around*|{|<frac|\<partial\>H|\<partial\>z<rsub|i>><frac|\<mathd\>z<rsub|i>|\<mathd\>\<tau\>>+<frac|\<partial\>H|\<partial\>r<rsub|i>><frac|\<mathd\>r<rsub|i>|\<mathd\>\<tau\>>|}>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i><around*|{|<frac|\<partial\>H|\<partial\>z<rsub|i>><frac|\<mathd\>H|\<mathd\>r<rsub|i>>-<frac|\<partial\>H|\<partial\>r<rsub|i>><frac|\<mathd\>H|\<mathd\>z<rsub|i>>|}>>>|<row|<cell|>|<cell|=>|<cell|0>>>>
  </eqnarray*>

  \;

  A second important property of Hamiltonian dynamical systems, known as
  <em|Liouville's Theorem>, is that they preserve volume in phase space. In
  other words, if we consider a region within the space of variables
  <math|(\<b-z\>,\<b-r\>)>, then as this region evolves under the equations
  of Hamiltonian dynamics, its shape may change but its volume will not. This
  can be seen by noting that the flow field (rate of change of location in
  phase space) is given by

  <\equation*>
    \<b-V\>=<around*|(|<frac|\<mathd\>\<b-z\>|\<mathd\>\<tau\>>,<frac|\<mathd\>\<b-r\>|\<mathd\>\<tau\>>|)>
  </equation*>

  and that the divergence of this field vanishes

  <\eqnarray*>
    <tformat|<table|<row|<cell|div \<b-V\>>|<cell|=>|<cell|<big|sum><rsub|i><around*|{|<frac|\<partial\>|\<partial\>z<rsub|i>><frac|\<mathd\>z<rsub|i>|\<mathd\>\<tau\>>+<frac|\<partial\>|\<partial\>r<rsub|i>><frac|\<mathd\>r<rsub|i>|\<mathd\>\<tau\>>|}>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i><around*|{|-<frac|\<partial\>|\<partial\>z<rsub|i>><frac|\<partial\>H|\<partial\>r<rsub|i>>+<frac|\<partial\>|\<partial\>r<rsub|i>><frac|\<partial\>H|\<partial\>z<rsub|i>>|}>>>|<row|<cell|>|<cell|=>|<cell|0>>>>
  </eqnarray*>

  Now consider the joint distribution over phase space whose total energy is
  the Hamiltonian, i.e., the distribution given by

  <\equation>
    p<around*|(|\<b-z\>,\<b-r\>|)>=<frac|1|Z<rsub|H>>exp<around*|(|-H<around*|(|\<b-z\>,\<b-r\>|)>|)><label|11.63>
  </equation>

  Using the two results of conservation of volume and conservation of
  <math|H>, it follows that the Hamiltonian dynamics will leave
  <math|p(\<b-z\>,\<b-r\>)> invariant. This can be seen by considering a
  small region of phase space over which <math|H> is approximately constant.
  If we follow the evolution of the Hamiltonian equations for a finite time,
  then the volume of this region will remain unchanged as will the value of H
  in this region, and hence the probability density, which is a function only
  of H, will also be unchanged.

  Although H is invariant, the values of <math|\<b-z\>> and <math|\<b-r\>>
  will vary, and so by integrating the Hamiltonian dynamics over a finite
  time duration it becomes possible to make large changes to <math|\<b-z\>>
  in a systematic way that avoids random walk behaviour.

  Evolution under the Hamiltonian dynamics will not, however, sample
  ergodically from <math|p(\<b-z\>,\<b-r\>)> because the value of <math|H> is
  constant. In order to arrive at an ergodic sampling scheme, we can
  introduce additional moves in phase space that change the value of <math|H>
  while also leaving the distribution <math|p(\<b-z\>,\<b-r\>)> invariant.
  The simplest way to achieve this is to replace the value of <math|\<b-r\>>
  with one drawn from its distribution conditioned on <math|\<b-z\>>. This
  can be regarded as a Gibbs sampling step, and hence from Section
  <reference|sec11.3> we see that this also leaves the desired distribution
  invariant. Noting that <math|\<b-z\>> and <math|\<b-r\>> are independent in
  the distribution <math|p(\<b-z\>,\<b-r\>)>, we see that the conditional
  distribution <math|p(\<b-r\>\|\<b-z\>)> is a Gaussian from which it is
  straightforward to sample.

  In a practical application of this approach, we have to address the problem
  of performing a numerical integration of the Hamiltonian equations. This
  will necessarily introduce numerical errors and so we should devise a
  scheme that minimizes the impact of such errors. In fact, it turns out that
  integration schemes can be devised for which Liouville's theorem still
  holds exactly. This property will be important in the hybrid Monte Carlo
  algorithm, which is discussed in Section <reference|sec11.5.2>. One scheme
  for achieving this is called the leapfrog discretization and involves
  alternately updating discrete-time approximations <math|<wide|\<b-z\>|^>>
  and <math|<wide|\<b-r\>|^>> to the position and momentum variables using

  <\eqnarray*>
    <tformat|<table|<row|<cell|<wide|r<rsub|i>|^><around*|(|\<tau\>+\<varepsilon\>/2|)>>|<cell|=>|<cell|<wide|r|^><rsub|i><around*|(|\<tau\>|)>-<frac|\<varepsilon\>|2><frac|\<partial\>E|\<partial\>z<rsub|i>><around*|(|<wide|\<b-z\>|^><around*|(|\<tau\>|)>|)><eq-number><label|11.64>>>|<row|<cell|<wide|z|^><rsub|i><around*|(|\<tau\>+\<varepsilon\>|)>>|<cell|=>|<cell|<wide|z|^><rsub|i><around*|(|\<tau\>|)>+\<varepsilon\><wide|r|^><rsub|i><around*|(|\<tau\>+\<varepsilon\>/2|)><eq-number><label|11.65>>>|<row|<cell|<wide|r|^><rsub|i><around*|(|\<tau\>+\<varepsilon\>|)>>|<cell|=>|<cell|<wide|r|^><rsub|i><around*|(|\<tau\>+\<varepsilon\>/2|)>-<frac|\<varepsilon\>|2><frac|\<partial\>E|\<partial\>z<rsub|i>><around*|(|<wide|\<b-z\>|^><around*|(|\<tau\>+\<varepsilon\>|)>|)><eq-number><label|11.66>>>>>
  </eqnarray*>

  We see that this takes the form of a half-step update of the momentum
  variables with step size <math|\<varepsilon\>/2>, followed by a full-step
  update of the position variables with step size <math|\<varepsilon\>>,
  followed by a second half-step update of the momentum variables. If several
  leapfrog steps are applied in succession, it can be seen that half-step
  updates to the momentum variables can be combined into full-step updates
  with step size <math|\<varepsilon\>>. The successive updates to position
  and momentum variables then leapfrog over each other. In order to advance
  the dynamics by a time interval <math|\<tau\>> , we need to take
  <math|\<tau\>/\<varepsilon\>> steps. The error involved in the discretized
  approximation to the continuous time dynamics will go to zero, assuming a
  smooth function <math|E(\<b-z\>)>, in the limit
  <math|\<varepsilon\>\<rightarrow\>0>. However, for a nonzero
  <math|\<varepsilon\>> as used in practice, some residual error will remain.
  We shall see in Section <reference|sec11.5.2> how the effects of such
  errors can be eliminated in the hybrid Monte Carlo algorithm.

  In summary then, the Hamiltonian dynamical approach involves alternating
  between a series of leapfrog updates and a resampling of the momentum
  variables from their marginal distribution.

  Note that the Hamiltonian dynamics method, unlike the basic Metropolis
  algorithm, is able to make use of information about the gradient of the log
  probability distribution as well as about the distribution itself. An
  analogous situation is familiar from the domain of function optimization.
  In most cases where gradient information is available, it is highly
  advantageous to make use of it. Informally, this follows from the fact that
  in a space of dimension <math|D>, the additional computational cost of
  evaluating a gradient compared with evaluating the function itself will
  typically be a fixed factor independent of <math|D>, whereas the
  <math|D>-dimensional gradient vector conveys <math|D> pieces of information
  compared with the one piece of information given by the function itself.

  <subsection|Hybrid Monte Carlo><label|sec11.5.2>

  As we discussed in the previous section, for a nonzero step size , the
  discretization of the leapfrog algorithm will introduce errors into the
  integration of the Hamiltonian dynamical equations. <em|Hybrid Monte Carlo>
  (Duane et al., 1987; Neal, 1996) combines Hamiltonian dynamics with the
  Metropolis algorithm and thereby removes any bias associated with the
  discretization.

  Specifically, the algorithm uses a Markov chain consisting of alternate
  stochastic updates of the momentum variable <math|\<b-r\>> and Hamiltonian
  dynamical updates using the leapfrog algorithm. After each application of
  the leapfrog algorithm, the resulting candidate state is accepted or
  rejected according to the Metropolis criterion based on the value of the
  Hamiltonian <math|H>. Thus if <math|<around*|(|\<b-z\>,\<b-r\>|)>> is the
  initial state and <math|<around*|(|*\<b-z\><rsup|\<ast\>>,\<b-r\><rsup|\<ast\>>|)>>
  is the state after the leapfrog integration, then this candidate state is
  accepted with probability

  <\equation*>
    min<around*|(|1,exp<around*|{|H<around*|(|\<b-z\>,\<b-r\>|)>-H<around*|(|*\<b-z\><rsup|\<ast\>>,\<b-r\><rsup|\<ast\>>|)>|}>|)>
  </equation*>

  If the leapfrog integration were to simulate the Hamiltonian dynamics
  perfectly, then every such candidate step would automatically be accepted
  because the value of <math|H> would be unchanged. Due to numerical errors,
  the value of <math|H> may sometimes decrease, and we would like the
  Metropolis criterion to remove any bias due to this effect and ensure that
  the resulting samples are indeed drawn from the required distribution. In
  order for this to be the case, we need to ensure that the update equations
  corresponding to the leapfrog integration satisfy detailed balance Eq.
  <eqref|11.40>. This is easily achieved by modifying the leapfrog scheme as
  follows.

  Before the start of each leapfrog integration sequence, we choose at
  random, with equal probability, whether to integrate forwards in time
  (using step size <math|\<varepsilon\>>) or backwards in time (using step
  size <math|-\<varepsilon\>>). We first note that the leapfrog integration
  scheme Eq. <eqref|11.64>, <eqref|11.65>, and <eqref|11.66> is
  time-reversible, so that integration for <math|L> steps using step size
  <math|-\<varepsilon\>> will exactly undo the effect of integration for
  <math|L> steps using step size <math|\<varepsilon\>>. Next we show that the
  leapfrog integration preserves phase-space volume exactly. This follows
  from the fact that each step in the leapfrog scheme updates either a
  <math|z<rsub|i>> variable or an <math|r<rsub|i>> variable by an amount that
  is a function only of the other variable. As shown in Figure
  <reference|fig11.14>, this has the effect of shearing a region of phase
  space while not altering its volume.

  <\padded-center>
    <small-figure|<image|image/fig_11_14_leap_frog.png|.5par|||>|<label|fig11.14>Each
    step of the leapfrog algorithm Eq. <eqref|11.64>\U<eqref|11.66> modifies
    either a position variable <math|z<rsub|i>> or a momentum variable
    <math|r<rsub|i>>. Because the change to one variable is a function only
    of the other, any region in phase space will be sheared without change of
    volume.>
  </padded-center>

  Finally, we use these results to show that detailed balance holds. Consider
  a small region <math|\<cal-R\>> of phase space that, under a sequence of
  <math|L> leapfrog iterations of step size <math|\<varepsilon\>>, maps to a
  region <math|\<cal-R\><rprime|'>>. Using conservation of volume under the
  leapfrog iteration, we see that if <math|\<cal-R\>> has volume
  <math|\<delta\>V> then so too will <math|\<cal-R\><rprime|'>>. If we choose
  an initial point from the distribution Eq. <eqref|11.63> and then update it
  using <math|L> leapfrog interactions, the probability of the transition
  going from <math|\<cal-R\>> to <math|\<cal-R\><rprime|'>> is given by

  <\equation*>
    <frac|1|Z<rsub|H>>exp<around*|(|-H<around*|(|\<cal-R\>|)>|)>\<delta\>V<frac|1|2>min<around*|{|1,exp<around*|(|-H<around*|(|\<cal-R\>|)>+H<around*|(|\<cal-R\><rprime|'>|)>|)>|}>
  </equation*>

  where the factor of <math|1/2> arises from the probability of choosing to
  integrate with a positive step size rather than a negative one. Similarly,
  the probability of starting in region <math|\<cal-R\><rprime|'>> and
  integrating backwards in time to end up in region
  <math|\<cal-R\><rprime|'>> is given by

  <\equation*>
    <frac|1|Z<rsub|H>>exp<around*|(|-H<around*|(|\<cal-R\><rprime|'>|)>|)>\<delta\>V<frac|1|2>min<around*|{|1,exp<around*|(|-H<around*|(|\<cal-R\><rprime|'>|)>+H<around*|(|\<cal-R\>|)>|)>|}>
  </equation*>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|11.1|<tuple|1.1|1>>
    <associate|11.15|<tuple|1.4|5>>
    <associate|11.2|<tuple|1.2|1>>
    <associate|11.23|<tuple|1.7|8>>
    <associate|11.33|<tuple|1.8|11>>
    <associate|11.4|<tuple|1.3|2>>
    <associate|11.40|<tuple|1.9|13>>
    <associate|11.42|<tuple|1.10|13>>
    <associate|11.43|<tuple|1.11|13>>
    <associate|11.44|<tuple|1.12|14>>
    <associate|11.5|<tuple|1.4|3>>
    <associate|11.53|<tuple|1.13|19>>
    <associate|11.55|<tuple|1.14|19>>
    <associate|11.56|<tuple|1.15|19>>
    <associate|11.57|<tuple|1.16|20>>
    <associate|11.6|<tuple|1.5|3>>
    <associate|11.63|<tuple|1.17|20>>
    <associate|11.64|<tuple|1.18|21>>
    <associate|11.65|<tuple|1.19|21>>
    <associate|11.66|<tuple|1.20|21>>
    <associate|11.8|<tuple|1.6|3>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1.1.3|6>>
    <associate|auto-11|<tuple|1.6|6>>
    <associate|auto-12|<tuple|1.7|7>>
    <associate|auto-13|<tuple|1.1.4|7>>
    <associate|auto-14|<tuple|1.8|8>>
    <associate|auto-15|<tuple|1.1.5|9>>
    <associate|auto-16|<tuple|1.1.6|10>>
    <associate|auto-17|<tuple|1.2|11>>
    <associate|auto-18|<tuple|1.9|12>>
    <associate|auto-19|<tuple|1.2.1|12>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-20|<tuple|1.2.2|14>>
    <associate|auto-21|<tuple|1.10|15>>
    <associate|auto-22|<tuple|1.3|15>>
    <associate|auto-23|<tuple|1.11|16>>
    <associate|auto-24|<tuple|1.12|17>>
    <associate|auto-25|<tuple|1.4|18>>
    <associate|auto-26|<tuple|1.13|18>>
    <associate|auto-27|<tuple|1.5|19>>
    <associate|auto-28|<tuple|1.5.1|19>>
    <associate|auto-29|<tuple|1.5.2|21>>
    <associate|auto-3|<tuple|1.1|2>>
    <associate|auto-30|<tuple|1.14|22>>
    <associate|auto-4|<tuple|1.1.1|3>>
    <associate|auto-5|<tuple|1.2|3>>
    <associate|auto-6|<tuple|1.3|4>>
    <associate|auto-7|<tuple|1.1.2|4>>
    <associate|auto-8|<tuple|1.4|5>>
    <associate|auto-9|<tuple|1.5|5>>
    <associate|fig11.1|<tuple|1.1|1>>
    <associate|fig11.11|<tuple|1.11|16>>
    <associate|fig11.13|<tuple|1.13|18>>
    <associate|fig11.14|<tuple|1.14|22>>
    <associate|fig11.2|<tuple|1.2|3>>
    <associate|fig11.3|<tuple|1.3|4>>
    <associate|fig11.4|<tuple|1.4|5>>
    <associate|fig11.5|<tuple|1.5|5>>
    <associate|fig11.6|<tuple|1.6|6>>
    <associate|fig11.7|<tuple|1.7|7>>
    <associate|fig11.8|<tuple|1.8|8>>
    <associate|fig11.9|<tuple|1.9|12>>
    <associate|sec11.1.2|<tuple|1.1.2|4>>
    <associate|sec11.1.3|<tuple|1.1.3|6>>
    <associate|sec11.3|<tuple|1.3|15>>
    <associate|sec11.5.2|<tuple|1.5.2|21>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|1.1>|>
        Schematic illustration of a function <with|mode|<quote|math>|f(z)>
        whose expectation is to be evaluated with respect to a distribution
        <with|mode|<quote|math>|p(z)>.
      </surround>|<pageref|auto-2>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|1.2>|>
        Geometrical interpretation of the transformation method for
        generating nonuniformly distributed random numbers.
        <with|mode|<quote|math>|h(y)> is the indenite integral of the
        desired distribution <with|mode|<quote|math>|p(y)>. If a uniformly
        distributed random variable <with|mode|<quote|math>|z> is transformed
        using <with|mode|<quote|math>|y=h<rsup|\<minus\>1>(z)>, then
        <with|mode|<quote|math>|y> will be distributed according to
        <with|mode|<quote|math>|p(y)>.
      </surround>|<pageref|auto-5>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|1.3>|>
        The Box-Muller method for generating Gaussian distributed random
        numbers starts by generating samples from a uniform distribution
        inside the unit circle.
      </surround>|<pageref|auto-6>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|1.4>|>
        In the rejection sampling method, samples are drawn from a simple
        distribution <with|mode|<quote|math>|q(z)> and rejected if they fall
        in the grey area between the unnormalized distribution
        <with|mode|<quote|math>|<wide|p|~>(z)> and the scaled distribution
        <with|mode|<quote|math>|k q(z)>. The resulting samples are
        distributed according to <with|mode|<quote|math>|p(z)>, which is the
        normalized version of <with|mode|<quote|math>|<wide|p|~><around*|(|z|)>>.
      </surround>|<pageref|auto-8>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|1.5>|>
        \ Plot showing the gamma distribution given by Eq.
        (<reference|11.15>) as the green curve, with a scaled Cauchy proposal
        distribution shown by the red curve. Samples from the gamma
        distribution can be obtained by sampling from the Cauchy and then
        applying the rejection sampling criterion.
      </surround>|<pageref|auto-9>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|1.6>|>
        In the case of distributions that are log concave, an envelope
        functionfor use in rejection sampling can be constructed using the
        tangent lines computed at a set of grid points. If a sample point is
        rejected, it is added to the set of grid points and used to rene the
        envelope distribution.
      </surround>|<pageref|auto-11>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|1.7>|>
        Illustrative example of rejection sampling involving sampling from a
        Gaussian distribution <with|mode|<quote|math>|p(z)> shown by the
        green curve, by using rejection sampling from a proposal distribution
        <with|mode|<quote|math>|q(z)> that is also Gaussian and whose scaled
        version <with|mode|<quote|math>|k q(z)> is shown by the red curve.
      </surround>|<pageref|auto-12>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|1.8>|>
        Importance sampling addresses the problem of evaluating the
        expectation of a function <with|mode|<quote|math>|f(z)> with respect
        to a distribution <with|mode|<quote|math>|p(z)> from which it is
        difcult to draw samples directly. Instead, samples
        <with|mode|<quote|math>|{z<rsup|(l)>}> are drawn from a simpler
        distribution <with|mode|<quote|math>|q(z)>, and the corresponding
        terms in the summation are weighted by the ratios
        <with|mode|<quote|math>|p(z<rsup|(l)>)/q(z<rsup|(l)>)>.
      </surround>|<pageref|auto-14>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|1.9>|>
        A simple illustration using Metropolis algorithm to sample from a
        Gaussian distribution whose one standard-deviation contour is shown
        by the ellipse. The proposal distribution is an isotropic Gaussian
        distribution whose standard deviation is
        <with|mode|<quote|math>|0.2>. Steps that are accepted are shown as
        green lines, and rejected steps are shown in red. A total of 150
        candidate samples are generated, of which 43 are rejected.
      </surround>|<pageref|auto-18>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|1.10>|>
        Schematic illustration of the use of an isotropic Gaussian proposal
        distribution (blue circle) to sample from a correlated multivariate
        Gaussian distribution (red ellipse) having very different standard
        deviations in different directions, using the Metropolis-Hastings
        algorithm. In order to keep the rejection rate low, the scale
        <with|mode|<quote|math>|\<rho\>> of the proposal distribution should
        be on the order of the smallest standard deviation
        <with|mode|<quote|math>|\<sigma\><rsub|min>> , which leads to random
        walk behaviour in which the number of steps separating states that
        are approximately independent is of order
        <with|mode|<quote|math>|(\<sigma\><rsub|max>/\<sigma\><rsub|min>)<rsup|2>>
        where <with|mode|<quote|math>|\<sigma\><rsub|max>> is the largest
        standard deviation.
      </surround>|<pageref|auto-21>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|1.11>|>
        Illustration of Gibbs sampling by alternate updates of two variables
        whose distribution is a correlated Gaussian. The step size is
        governed by the standard deviation of the conditional distribution
        (green curve), and is <with|mode|<quote|math>|O(l)>, leading to slow
        progress in the direction of elongation of the joint distribution
        (red ellipse). The number of steps needed to obtain an independent
        sample from the distribution is <with|mode|<quote|math>|O((L/l)<rsup|2>)>.
      </surround>|<pageref|auto-23>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|1.12>|>
        \ The Gibbs sampling method requires samples to be drawn from the
        conditional distribution of a variable conditioned on the remaining
        variables. For graphical models, this conditional distribution is a
        function only of the states of the nodes in the Markov blanket. For
        an undirected graph this comprises the set of neighbours, as shown on
        the left, while for a directed graph the Markov blanket comprises the
        parents, the children, and the co-parents, as shown on the right.
      </surround>|<pageref|auto-24>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.13>||Illustration of
      slice sampling. (a) For a given value
      <with|mode|<quote|math>|z<rsup|(\<tau\>)>>, a value of
      <with|mode|<quote|math>|u> is chosen uniformly in the region
      <with|mode|<quote|math>|0\<leqslant\>u\<leqslant\><wide|p|~>(z<rsup|(\<tau\>)>)>,
      which then defines a `slice' through the distribution, shown by the
      solid horizontal lines. (b) Because it is infeasible to sample directly
      from a slice, a new sample of <with|mode|<quote|math>|z> is drawn from
      a region <with|mode|<quote|math>|z<rsub|min>\<leqslant\>z\<leqslant\>z<rsub|max>>,
      which contains the previous value <with|mode|<quote|math>|z<rsup|(\<tau\>)>>.>|<pageref|auto-26>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.14>||Each step of the
      leapfrog algorithm Eq. (<reference|11.64>)\U(<reference|11.66>)
      modifies either a position variable <with|mode|<quote|math>|z<rsub|i>>
      or a momentum variable <with|mode|<quote|math>|r<rsub|i>>. Because the
      change to one variable is a function only of the other, any region in
      phase space will be sheared without change of
      volume.>|<pageref|auto-30>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Sampling
      Methods> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      1.1<space|2spc>Basic Sampling Algorithms
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      <with|par-left|<quote|1tab>|1.1.1<space|2spc>Standard distributions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.1.2<space|2spc>Rejection sampling
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|1.1.3<space|2spc>Adaptive rejection
      sampling <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|1.1.4<space|2spc>Importance sampling
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|1.1.5<space|2spc>Sampling-importance-resampling
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|1tab>|1.1.6<space|2spc>Sampling and the EM
      algorithm <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      1.2<space|2spc>Markov Chain Monte Carlo
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>

      <with|par-left|<quote|1tab>|1.2.1<space|2spc>Markov chains
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|1tab>|1.2.2<space|2spc>The Metropolis-Hastings
      algorithm <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      1.3<space|2spc>Gibbs Sampling <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>

      1.4<space|2spc>Slice Sampling <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>

      1.5<space|2spc>The Hybrid Monte Carlo Algorithm
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>

      <with|par-left|<quote|1tab>|1.5.1<space|2spc>Dynamical systems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>>

      <with|par-left|<quote|1tab>|1.5.2<space|2spc>Hybrid Monte Carlo
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>>
    </associate>
  </collection>
</auxiliary>