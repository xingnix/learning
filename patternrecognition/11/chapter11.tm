<TeXmacs|2.1>

<style|book>

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

  <\equation*>
    <wide|f|^>=<frac|1|L><big|sum><rsub|l=1><rsup|L>f<around*|(|\<b-z\><rsup|<around*|(|l|)>>|)>
  </equation*>

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

  <\equation*>
    p<around*|(|\<b-z\>|)>=<big|prod><rsub|i=1><rsup|M>p<around*|(|\<b-z\><rsub|i>\|pa<rsub|i>|)>
  </equation*>

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
  summarized in Robert and Casella (1999), and some practical guidance on the
  use of sampling methods in the context of machine learning is given in
  Bishop and Nabney(2008).

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
  <reference|fig11.3>. Then, for each pair <math|z1,z2> we evaluate the
  quantities

  <\eqnarray*>
    <tformat|<table|<row|<cell|y<rsub|1>>|<cell|=>|<cell|z<rsub|1><around*|(|<frac|-2ln
    z<rsub|1>|r<rsup|2>>|)><rsup|1/2>>>|<row|<cell|y<rsub|2>>|<cell|=>|<cell|z<rsub|2><around*|(|<frac|-2ln
    z<rsub|2>|r<rsup|2>>|)><rsup|1/2>>>>>
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

  <subsection|Rejection sampling>

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
    <\small-figure|<image|image/fig_11_1_cauchy_gamma.png|.3par|||>>
      <label|fig11.5> Plot showing the gamma distribution given by Eq.
      <eqref|11.15> as the green curve, with a scaled Cauchy proposal
      distribution shown by the red curve. Samples from the gamma
      distribution can be obtained by sampling from the Cauchy and then
      applying the rejection sampling criterion.
    </small-figure>
  </padded-center>

  <subsection|Adaptive rejection sampling>

  In many instances where we might wish to apply rejection sampling, it
  proves difcult to determine a suitable analytic form for the envelope
  distribution <math|q(z)>. An alternative approach is to construct the
  envelope function on the \]y based on measured values of the distribution
  <math|p(z)> (Gilks and Wild, 1992). Construction of an envelope function is
  particularly straightforward for cases in which <math|p(z)> is log concave,
  in other words when <math|ln p(z)> has derivatives that are nonincreasing
  functions of <math|z>. The construction of a suitable envelope function is
  illustrated graphically in Figure <inactive|<reference|fig11.6>>.

  <\padded-center>
    <\small-figure|<image|<tuple|<#89504E470D0A1A0A0000000D494844520000028D000001940802000000DFFE8FD4000000097048597300000EC400000EC401952B0E1B0000200049444154789CEDDD7D7C53F5D93FF04F213C4850500804072E28EA509BE28D82D0AAA00147518A8ABA168743E4A5282DFA436F157DD1B573A89B6CB7B403EF013E30DB3A4401A5E50602083432041C4D3710441B04211060800D4F3DB4BF3FCE2149D336CD4972724E723EEF3F789D9C3CF4F26BDBABD7F731A5A1A101444444A4496DD40E808888885AC43C4D4444A45DCCD3444444DAC53C4D4444A45DCCD3444444DAC53C4D4444A45DCCD3444444DAC53C4D4444A45DCCD3444444DAC53C4D4444A45DCCD3B2EDDBB76FDFBE7D6A47414444BAC03C2DCFC30F3F6CB1582C16CB881123D48E858888925F0ACFE190252525C577CDA6232222A5B19E96A1BABA3AF0A1C3E1502B122222D209E669195E7FFDF5C0877FF9CB5FD48A8488887482FDDEE1F27ABD9D3B770EBA79E4C81193C9A44A3C4444A407ACA7C3F5DE7BEF35BD396FDEBCF847424444FAC17A3A2C8220F4E9D3C7ED7607DD379BCDFBF7EF37180CAA44454444498FF57458B66CD9D234490370BBDDAB57AF8E7F3C4444A413ACA7C33262C408BBDDDEEC5356ABB5AAAA2ACEF11011914E304FB7CEE572F5EDDB37C40B6A6A6A2C164BBCC22122221D61BF77EB162D5A14E50B88888822C37ABA158220B46BD7AED597D5D6D61A8DC638C4434444BAC27ABA15070E1C08E7651E8F47E9488888488798A75B116695CC629A888894C07EEFD679BDDEE5CB978BD7E3C78FF7DD2F2929112FB2B2B298A789884809CCD3F2F0BC2C22228A27F67B1311116917F33411119176314F1311116917F3341111917625769E3E7AF468C4EFE58A672222D2BE04CED3A5A5A553A74E8DF8EDCB972F9F32654A7D7D7D0C432222228AAD16D7657DFBEDB73FFCF0C3D1A3478F1D3BD6A54B97C075C35AF0E1871FFEEE77BFDBBA75EB65975D16F1874C9D3AF5F4E9D3EFBEFB6EF86FE1BA2C22228AA716F3F4D34F3FBD6AD5AAEFBFFF1E80CD665BB3664D7C030B65EBD6AD23478E5CBF7EFD800103A2F99CF3E7CF6764646467673FF7DC7361BE85799A8888E2A9C57EEFB973E77EF7DD77F9F9F9F18C261C67CE9C79E8A1877EFFFBDF4799A401B46FDF7EF1E2C5AFBCF28AD3E98C496C444444B1D5CAF8B4D56A8D4F1CE17BEBADB71A1A1A9E7CF2C9987C9AC56279E49147A219E7262222524E2B79BA6DDBB6F189234C070F1E7CF3CD379F7EFAE91806F6FCF3CF6FDAB4E9EF7FFF7BAC3E9088882856126CBEF75FFFFAD7FAFAFA279E7822869F79E38D37DE73CF3D45454531FC4C2222A29848A43CDDD0D0F0FEFBEF8F1933A65BB76EB1FDE47BEFBDD7E170ECDCB933B61F4B444414A544CAD30E8763DFBE7DE9E9E931FFE48C8C0C001F7DF451CC3F998888281A06B96F3874E8D0D2A54B8F5E545454D4AD5BB7BD7BF77EF0C107DF7EFB6DC78E1D6FBBEDB689132776E8D021F4E7D4D7D7CF9B376FD3A64D696969B9B9B99D3B7706F0CF7FFE73D1A245478F1EBDF5D65B1F7FFC71F1A6CF175F7C0160D0A041AD06E9F1784A4A4AAAABAB1F7AE8A15FFEF297BEFBEFBDF75E666666CF9E3D835E6FB55ABB74E9B271E3C6F0DA808888285E1A425AB66C19009BCDE6BBB36BD7AE091326A4A6A68A6F3F70E0C0BC79F3264C98B07DFBF6DADADAF2F2F24B2FBDF4C61B6F3C76EC58E84FFEC31FFEF0C61B6FB8DDEEEBAEBBEEAEBBEE6A686898356B567676F6EEDDBB8F1F3FFE9BDFFCA67FFFFE2E972BF02D23478E6CD7AEDDD9B367437FF2DEBD7BFBF6ED2B86979292B270E142F17E6565E59831635A7AD73DF7DCD3B163C773E7CE85FEF0F09B8E8888287AB2EBE95FFCE2171F7CF0C1F9F3E77BF6EC79E2C48955AB561D3C78F0830F3E109FCDCCCC9C366DDA6BAFBD366BD6ACB7DE7AABA50F397DFAF48A152B366CD8207EE0679F7D3666CC98ACACACD2D252F1057FFEF39F7BF6ECF9ECB3CF2E5DBAD4F7AE7FFFFBDFFDFAF50B5DA9D7D7D76767675F75D555D3A64D3B75EAD4A64D9B727373BFFEFAEB4B2EB964D5AA55EBD6AD6BE98DBD7BF73E7BF66C4D4DCDF5D75F2FAB4188888894233B4F8BDAB76FDFA3478F13274EBCFFFEFB76BB3DF0A9C18307E3621F754B962E5DFAC0030F88D7870E1D02D0AF5FBF499326F95ED0B56BD7ABAEBA6AD9B26535353562717CEEDCB983070FFEFCE73F0F1DD8C68D1BAFBDF6DA929212DF9D9F7EFA69C3860DCF3DF7DCA79F7EDABD7BF796DE78C5155700609E2622224D897C1E599B366D000C1A34A87DFBF681F7BB74E982D64EA3FAFCF3CF478D1A05E0F4E9D33B76EC68D3A6CD2BAFBC12F49ABABA3A00FFFEF7BFC587870F1F6E6868103F3C848C8C0C5F712F6ADBB6EDBBEFBE5B5252E2EBAB6F963887FCE0C183A13F9F8888289EA29DEFDD34F989F95B108410EF7AF6D967AFBBEE3A000E87A3AEAEEEE69B6F0E5A6A25088258671F3E7C58BC73FAF469005DBB760D1D8FC1603018FC9D04274F9E7CE491475E78E18556679F89F5F499336742BF8C8888289E22ECF7F669A92739F47991B7DD769B78B17EFD7A00C3860D0B7A417575F5F9F3E70198CD66F18E585E07D5EEA11D387060E2C489B367CF0E67F7D38E1D3BFABE0A11119146A8BC7E5A1CC66E9AA7BFFCF24B00292929B7DC728B78A753A74E007EFAE9A7303FB9AAAA6AFCF8F1FFFBBFFF1BE616E5A74E9DF27D152222228D88B69E8E86D7EBDDBA756B9B366DC46D460255545400183A74A86FADB338327DF2E4C9703E79D3A64D8585851F7FFC718F1E3DC20C46FCE4684EB32622228A3935EBE9CACA4A41106EBEF9E6A051E793274FAE5BB72E2525E5CD37DFF4DDECDEBDBBD1680C274FAF5EBDFAADB7DE5AB66C5950927EEFBDF78E1C39D2D2BB4E9C3801C062B1C8FDAF202222528E9A795AECF46E5A4CBFFFFEFB67CF9EFDF5AF7F1DB445E8D5575FFDFDF7DFB7FA99C5C5C57FFFFBDF8D4663E0FD7DFBF615161686D8185C9CE9EDDB20858888480B5AC9D3E274B0662785B5F454E8196481C43C2D16B23E1E8FA7A0A0A057AF5E81C5B468F0E0C1C78F1F77B95C2D7D605555D5D8B163DBB469F3F2CB2FDBEDF673E7CE89F71D0EC7F0E1C35F7DF5D510A7616EDDBAD562B134DD529488884845A1F2B420089B376F06B067CF9EA01EE3EFBFFFFEC0810300FEF18F7F042EC1BA70E182F896E3C78FEFDEBD3BC487D7D6D66EDBB62D2525C5E5727DF7DD77E2CD9F7EFA69CC98319D3B775EB76E9D6FA6B7CFEDB7DF0E60FBF6EDCD7EE0F1E3C71F79E491D9B3672F5CB830353575D4A8515DBA74B9F5D65BFBF5EB9791913170E0C0891327B614CC891327BEFDF6DB3BEEB82344C04444442A686943D1D1A34777EEDCF9F2CB2FEFD1A347B76EDD2EBDF452A3D1B87BF7EE75EBD675EAD4E9B2CB2EEBD6AD9BC964EADAB56BE7CE9DC57DB31F7FFC71A3D1D8B56B5793C9D4BD7BF7CB2EBBCC68347EF6D967CD7EFECA952B010C1830E0871F7EB8E38E3B7EF7BBDFBDF1C61BD75C73CDA449938E1F3FDEEC5B0E1E3CD8B66DDB975E7AA9D967274C98505656E67BB874E9527111574A4ACA934F3E29084288DD53D7AC5903E0A38F3E0AF11A51384D474444142B290D8D734FDCBCF4D24B6FBEF9E6FFFB7FFF6FF6ECD967CE9C1117620D183020F4D9D2F7DD77DF37DF7CB367CF9E949494A0A7B66DDBE65BC42572BBDDDBB76FBFE1861B5A1D757EF6D967172D5A74E8D0A1568FF90AFCBA6A351D1111E9876A797AF0E0C15F7DF5D5E79F7F7EEFBDF786FFAECF3EFB2C2B2BCB6EB7DF7DF7DDB18AA4B6B6B677EFDE8F3DF6D8DB6FBFDDEA8B99A78988289ED4C9D33FFDF4D3E5975FDED0D070ECD8B156B7020D545F5F7FDB6DB7592C96C58B17C72A98B973E7BEF4D24B7BF6EC693A22DE14F3341111C5933AEBB2366DDA74E1C205ABD52A2B490368D3A64D7171F1679F7DF6C30F3FC424920B172E141717BFFAEAABE124692222A23853214FD7D7D77FF4D147887453914183064D9E3C3937373726C1CC9C39B343870ED3A64D8BC9A7111111C556BCF3F40B2FBC60341A972E5D7AF9E597AF5EBDBA63C78E999999723FE44F7FFAD3C99327172C58106530AB56AD5AB060C1B265CB5A9D3E464444A40AD5E691F9343434349DBCDDAA63C78E8D1E3DFAF7BFFF7DC413CA7EFCF1C7BBEFBE7BD1A245AD1E791988E3D34444144F2A9F9785C6992F7CDDBA755BBD7AF5C68D1B23FEBA2B57AE5CBA74A9AC244D44441467EAD7D38985F5341111C593FAF534111111B584799A888848BB98A7898888B48B799A888848BB98A7898888B48B799A888848BB98A7898888B48B799A888848BB98A7898888B48B799A888848BB98A7898888B48B799A888848BB98A7898888B48B799A888848BB98A7898888B48B799A888848BB98A7898888B48B799A888848BB98A7898888B48B799A888848BB98A7898888B48B799A888848BB0C6A074094903C1ECC9B8763C770CF3DB8F556984C6A074444492AA5A1A141ED1812494A4A8AEF9A4DA75B2E17FAF66D74C76CC6C30F33671351EC314FCBC33C4D0072725056D6E2B3CCD9441443CCD3F2304F5360316D36C3ED6EE5F5D9D9B8F75E0C1D0A8B45E1C8882819314FCBC33C4D81C5746D2D3A74C0AE5DD8B001CB97C36E6FE5BDCCD9442417F3B43CCCD33A17584C171460E6CC46CF0A0276ED42753556AC08D5312E1273766A2AFAF78781133A89A805CCD3F2304FEB5C50316D34867AB1CB852FBF0C2B67DB6CC8CAC29D773267135130E6697998A7F52C7431DDEA7B99B3892802CCD3F2304FEB99AC623A04970B3B7762D52A2C5EDCCA34349B0DB7DF8EBBEFC68001917F39224A68CCD3F2304FEB5634C574081E0FB66E0D2B675BAD78F041E66C22DD619E9687795AB762554C87E0CBD95F7C01A733D42B7D39FBBAEBB8449B28C9314FCBC33CAD4F0A15D32178BDD8B1036BD7E2934F5AC9D9DC568528B9314FCBC33CAD4F7128A64360CE26D233E6697998A77528FEC574F33C1E78BDDEAF77EF70B6F9E7CE0ECB365DB1D67D5388979B2F3FF770D6B9C1232EE3B62A44098D795A1EE6691D52A79816041C38802FBFC4962DD8B9B3D9ADCE041876A1FF06DCB91C5976D8427FDEFD771E1BF758E7A1C33B3067132516E6697998A7F526DEC5747575B87B90FA58ADB8F1C6BA86B6DF7C7D7AC39E2BC3C9D9D90F09F78E35B0CE264A08CCD3F2304FEB4D3C8A6941C0962D58BCB8C5B5596633860FC7D0A1B8E20A0C1D0A00BD7B87D80345382B1CD8E6FED2D1B0E2B30B655F5A427F716EAB42A471CCD3F2304FEB8AE2C5747535962EC5BC79CDA467DFF6DF575F1DE55F0701DFB3AD60CE26D220E6697998A77545A9625A10B07831DE7C3378F6B6B82CFAFEFB919A1AA3AF04000E073232505989F474B8769EFEF2FD3D9FFFED3F5FB8FBBB610EF12E5FCE8EFAEF04228A0AF3B43CCCD3FAA14831EDF562F66CE4E737BA69B562F2643CF288724BA9AAAB9BA47E8FC7F3D6075BFFB07E15EE598C8743E76C6E8546A422E6697998A7F523C6C5B4CB853FFF1973E634BA595010F3EA591EB1B29F3EDDE3BEB015B7AEC23D8BDB3CE2AEEF19E21DCCD94471C63C2D0FF3B44EC4B298F67A317972A373B2CC66CC9E8DAC2CAD24BA8BD95A1C26F7C0F4D580C9DB87BFF0C9DAAEAD6E5F3A6C18B755215216F3B43CCCD33A119B62BA692FB7D58AB973919E1E7D84B1D734DAA222EFAF9FDAF12F03B742235211F3B43CCCD37A109B62BAB4D457A102DACED0815C2ECC98E1FF23C56AC5F2E5E23A6B6E5F4AA40AE6697998A7F520DA62DAE54256963F9599CD58B8109999318C507115159834C9FF474651119E7A2A70A9962060D7AEB07664B1D9B06C99563AF8891211F3B43CCCD3492FAA625A10F0CE3BC8CDF5DF6992E154E170C8AFE4BD5ECC98E19FF866B5C26E6FB63A6E3567DB6C58B346E65727A28B98A7E5619E4E7A9117D32E17860CF1D7A0D9D9983F5F0B85646121F2F323EDC00F2AACCBCB43770CF872F6975F369A39575484A953E57F7522629E968B793AB945584C0795D11AEBE8F67DCF46F80DEBF562EC587FA59C9787D9B3C3E92110040C1CE8EFFE773AD55C804694B898A7E5619E4E6E9114D31E0F727222486371136D9E161517FBFF10B1D9505A1ACE0C318F073D7A48D76633F6EED542FF02518269A37600445AE172F9937449497819C5E190066E0198CD282FC7DB6F6B2A49C7CCD4A9703A61360380DD0EAB15D5D5ADBEC96442498974ED7663EC582523244A52CCD344921933A40B715951EB0A0B9191218DDDDA6CD8BB573B7DDD8A484DC5DEBDB0D900C0ED86D58AD2D256DF949383EC6CE9DA6E0FE71D44D408FBBDE561BF77B20A1C992E29414E4EC8570B02468DF2F7756B7B96546CFABD7D0401B366F9B7432928C08C19A1BB1004017DFAF8E7A2D5D4F0DC6B221998A7E5619E4E56BE9169B319FBF787CC3B1E0FAC5629ED98CD58B244E3BB97C4384F8B2A2A307AB4746DB361E5CAD0A93AF0CFA0D65B988802B0DF9BA8D1C8742B93C0C4016931495BAD703A359EA4959299D968B87AE040783C215E6EB1341AA89E3041F908899205EB6979584F27A5708B69F12467517636162D4A88AA50917A5AE4F1C06693965E99CDD8BC39748FF68811FEB182D60717880800EB69A2708B6971D698A8A000A5A50991A495653261FB76FFCCB2BE7DE1708478F9B26552050E60FCF8D01538114998A749EFC29AE62DEEE9252A2989EE9CCB781353A32F41C698C180952B5150203DCCC84045454BAF351AB17AB5FFA1CD064150262AA224C23C4DBA1656311D98A42B2B13AEBBD6E99446D295623060E64C7FAA1E3D1A85852DBD3635154545FEC0A64F572C2AA264C1F16979383E9D645A1F990E4AD2FA9C3516A6C049E021D76B050E54B7B6653891DE314FCBC33C9D4C5A5F33ED4BD2663356AFE6FED4AD0B9C6AD7F27A2DAF17FDFAF957541F39C263AA895AC47E6FD2AF5646A60393340F9108537A3A6A6AFCEBB5468D6A7608DA68C49225FE871CA8260A81799A74AA9591E9A024CD722F7C164B384BABD3D3FD23DA4E2766CD8A6384440985FDDEF2B0DF3B69841A9966928E5ED0D2EAE69A3168F7558EFE13358B795A1EE6E9E4106A643A70E218B7A28E46601E6E215507EDC1CA3F8A889A62BF37E9518B23D315158D6677274592F6789096A6C6A622E2D2EAC0F3B59A1C856932F907AADD6EE4E470A09A2818F334E94E8B23D30E877F59511275C28A8BA7AD5635BEB698AAF3F2808BA9BAC98665E9E9D2F300EC760E54130563BFB73CECF74E02CD8F4C07768527D7925E05F7F70E5FC865E882808103FD3BB170723D5120D6D3A42FCD17D31E0F860C91EE1614245392D68AC00DCB323282AA6A83C13F9B0CC0C891F07AE3181B91B6314F93BE3433322D08B0D9A4B94C797989B57777220999AA4D2694974BD76E37C68E8D6F6C441AC63C4D3AD27C313D6A94D4E56AB361F66CB562D3859933FDC7506764046D039E99D968A0BAB838BEB1116915C7A7E5E1F874426B66643A70A974A8A3A7139826C6A70305EE2D5A5010D8812108E8D3C7BF9F2807AA89C03C2D17F374E26A66CDB42F6124F5D25DCDE569844AD581FF9B92F76F272219D8EF4D7A113C32EDF1F853C59225C99AA4352A3D1D9595D2757E7E6007B8C5E2EF1A77BB316142DC6323D218E669D285E0916908FE05C5454549B3543A91B49CAA7372909D2D5D9795A1B434EEB1116909FBBDE561BF77820A1E999E70F1717676D2E7012DF67BFBB4D0011E3450CDFD5B49CF584F53F20B2EA6DF29961E5BAD58B448C5C0E243DCB853FC57735AA8AA0D066CDEEC7FD59021DC4F94F48B799A925FA391E9C1FB909B2B3DB6DBF5304969E54A141460E54AB5E368490BA9DA62415191749B03D5A467ECF79687FDDE0927B063B564D1859CFFEE2D75A726D7E6A009AF850EF01123FC5B95F1FF18E913F3B43CCCD309272DCD7F08F20FC37EDDEEA30F01202F0F6FBFAD6E6014ACB954EDF5A25F3FFF40F591239C984FBAC37E6F4A660E87FF7487B71EFC524AD2562BF71DD3A2E63AC08D46AC5EED7F89CDC6816AD21DE6694A664F3F2D5D987B5C78E42F774A0F962FD7C3B074426A2E55A7A6FA07AA9D4E4C9FAE526C442A619EA6A415584CCFEEF8AA010200949470898FA63597AAA74EF5CF579F330715152AC546A4068E4FCBC3F1E904E21B99EE79D9E903A7BA1820C066C39A356AC7A502AF1746A3DA41C8D264ACDAE381D5CA816AD223D6D3949C028BE93F9D9A6C8000B319CB96A91A943A1C0E74EE1C748CA4E60555D515152613962CF13F9F93C3816AD20BD6D3F2B09E4E14FE69DE06CF7EE14A0304DD2EEBD1F47E64A10556D59595484FF71D6F86E0F33B889216F3B43CCCD309A1D19A698CCF41A91EF6076D4902E76904A76A6170FAA851FE15D59595DC9A9D921FF3B43CCCD309C15F4CC3BD1F7D0CE6EED8BB37D146686326B1F3348253B5E7BAF41E3DA447497D1E299184E3D3946C1A4DF3C67403042C5CA8DB249D0CD2D35150205D676498F638CACBA5476E377272D40A8B284E98A729D9F8D74CC3FD3016233B5B9FC3D24965E6CCC0549D79AB272F4F7A64B7A3B858ADB088E281FDDEF2B0DF5BE38247A6CDEBF4DCE32D4AF87E6F1FDF2C32B359F8DA39F097265FC789D389D4541523235210F3B43CCCD31A173C325DBE9CC574F2E469344AD59EF5FFEAD1BF9B78DB6CE6DF6394B4D8EF4DC9237864DA368C493AD9CC9821ED4CE6769B86DF54FEC959F1B6DB8DB163D58C8B4839ACA7E5613DAD65C1C5F491839C0A8C24ABA70108027C6BB36CB69CEEABCB3E92FE0B8B8A3075AA9AA1112981F5342589E062BAE8CF4CD2C9C960C0CA9552556DB72FF28C329BA5677273E172A91718913298A72949349AE69DBA134F3DA56A381A22EEBFE9DB85331988A9DA6C066058BBEACB41D37CCF0C19C2FD4429D9304F5332082EA64B16F1E44A9FF474389D49B76F97C100A7534CD57D3F9B53F2E0A7E26DB71B1326A81A1851AC717C5A1E8E4F6B53E0C8F40FBF7AA15DD9DFD48E88E222E014AD9CD4EAB2EA9BC4DB2525DCFF849207F3B43CCCD31A14BC66BAF6AF5CA0A323D5D5B05A017861EC77C531F7F10EE2ED9A1A9E334E4982FDDE94F01A8D4C2FBA97495A5F5253C5B17723BCAB8FDFEABB9D95C5816A4A12CCD394D80247A6DFEAFA3B43F643AA86436A484F477939805454172157BCE77462FA7455A3228A11F67BCBC37E6FAD69B4667AC3F7863B86AA1D11A9E4E2566523DA6FB09FBF43BCA7D733C729A9B09EA604D6689AF7D04F98A45BE270A81D411C5C3CAB63D9F94C739BC3E2BDD1A3E1F1A81A1551D498A729813D3DA55EBC9046A6A9398585C8C84061A1DA71C4C18C19B0D98CF0AEAE1FE1BB67B371A09A121BFBBDE561BFB776349AE6FDE0A7394B1E50351CED4AB67D4343BBB8AB682166E6433A0A332F0F6FBFAD6E584491639E9687795A3BD252EB9DFF6A037164FAC4A5862E9CE6DD3C7DE569488BAA05F7D1515869874DBC575999743BBD906EB0DF9B1292C30131490378EB99EF99A4C9CF6482D36930772F458E196EF1DEB8711CA8A644C57A5A1ED6D31AE12FA6DB1CDEEFED66E8C85D425BA4BB7A5AE4702023C381F40C483B9BDB6C58B992FBC952E2613D4D89A751313DE53B26696A467A3ACACBD3E12840BE78C36EC7AC59EAC6441409D6D3F2B09ED682B4FEE79CDF7400603678F69F31B1420A4DA7F5B4A8B050C8FFDD406C77C22ADEE04035251CD6D394601C0E88491AC0EC57FEC3244DA1CC9C69C87EC8379B0CC0B871F07A550C884836D6D3F2B09E565DDAF5679C7B2E01606E7F6CBFB71BF374AB745D4F435AA955616F3F1AE5E20D9B0D6BD6A81B13910CACA72991381C10933480D97FA86792A6D6190C58B62CD3FC751EE68837EC761417AB1B13910CACA7E5613DAD2E6B3F6FF5774600D6AEFBB67B7ECE3C1D8E5EBDE076C36CC6A1436A87A2228F47E87165E040B5D389D4547563220A0BEB694A180E07C4240D60EEFCF64CD261723A61B5FA3742D72993C950F9C57264F96E8C1CC9816A4A0CACA7E5613DAD22EBD53F55D75C0AC0DAFDC72ACFCFD40E871250717169EEE6F128111F6567A3B454DD80885AC77A9A128363E30531490398FB51377583A14435756A4E5EF76C94898FCACA98A72901B09E9687F5B45AD27EFE1FE70F9703B0F67457B9CD6A8743094B10845FDEDB67EDFB6E48DF453535B058540D892824D6D394001C1B2F88491AC0DC92AEEA064389CD60302CFF64B3E93EDF8D214378F025691AF3342580A77F7D4ABCB0F674A7DFDD51DD6028E1198D967F579460BCF8C8EDC68409EA0644140AF334691D8B698A3D9329A7F2691BECE2230E549396314F93D6B1988E92C783B4349EEAD8447AFAB257B6FA0EBE1C3F9E4D441AC53C4D9AC6623A7AE2E269AB55ED38B4C7F8DACBAB46FDD9F7D066E340356911E77BCBC3F9DE71D6B747ADCBD31980F5AAFF54EDBB5CED701292DEF7F70E4D108A2D7FCCFDF165F1515E1EDE7E5BDD808882314FCBC33C1D4F8E8D1732EE6C2B5E576EB8907E475B75E34950CCD3ADF07846F4DE653F7F87F8A8BC1C9999EA0644D408F3B43CCCD3F1E45B330DE69828304FB7CA53FE95F5DEAB7C2BAA8F1C81C9A46E44447E1C9F268D0A1C9926529469F4A025CF55FA1EE6643770A09AB483799A34CA37CD9B280ED2FF34AE207589786D5F9B326B96BAE110F9B1DF5B1EF67BC747E0C8B4888D1D31F67B8749382BFCD2B46D6DED6DE2C3CA4AA4A7AB1B1111C03C2D17F3747C048E4C8BD8D811639E0E9FE79B63D6FE75E240B5F98A73CE6F3A70A09A54C77E6FD21C8E4C935A4CBFE8B6F08FC7C56BF7F10ED9E3CE73A09A54C73C4D9A13B80199BA91900E653E7F43DE6D5BC4EBB51BDBBF33B75EDD788898A7495B823620B3D90040FC9722C336946BF6A6C1A99DBF17AF73A7B5A9AE56371CD23B8E4FCBC3F169A559FB79ABBF33E2E239D3828059B33063060C06B5234B586CC30878F69DEE61E9245E9B2F3FB7777F07A351DD8848BF98A7E5619E5694C3818C0CE9BAD27E96A76E908A2ADE3B3CFAF19EE2F5DDE967EC9597A81B0FE916FBBD4943A63CE6152F783416A92E7362CFBC7BBE11AFD73A2E299EC3816A5207EB6979584F2BA75131FDF1A1F471BD540D87088280DE979E387C563AA8CDE9446AAABA11911E314FCBC33CAD1CFFC874D77D55FFF9B9DAE1100180EBBB0B7DFB495BEEF4EC7AF680A72387F929CED8EF4D9AE070404CD200E6CE6FAF6E30443E966BDA96CC93160A1E3ED171C29813EAC6433AC47A5A1ED6D30A49EB7FCEF94D0734574C7BBDE054DB28B10DA39433EC60D9862BC5EB9277CFE54CECA06E3CA42BACA7497D151510933480B9AF373A7EC3E140E7CE7038D4082B59B00DA3B7C87E65CF4ED277E6F8C73BB85CAA46433AC37A5A1ED6D3312708E8D3BBDE7DB80D006BC7DD5567AE0F7C967B53478F6D1813D53B2E586FBE38507DD9E903C73A71A09AE283F534A96CF16288491AC0DC3F9F573718A296A40E685BF47AAD787DF854A7E9BF39A66E3CA41FACA7E5613D1D5B81C574AA61A7B3EE86A017B0168C1E681AB3070000200049444154DB30866C371F5DBBA3BB785DFEC9D9CC07B8CA9F14C77A9AD414584CCF7BE5477583216AD5F2CAEEBE81EAD10F76F478D40D877481F5B43CACA7634810D0A70FDC6E402CA6CF5CD774076AD682D1631BC656E04075FF9F9D74BABA70A09A14C57A9A54B378B194A401CC7B6C0B8F89A084103850BDEBC72ED3279F0AFD7AA228B19E9687F574AC0416D35638AB6AAF6976852F6BC1E8B10D634E10D0AE9DFF61F9671732EF6BAB5E3894E4584F933A028BE9B90FADE7361C944082BA7E1E7FF8270E549372584FCBC37A3A26828BE99ACB60B134FB4AD682D1631B2A21E0370100DC3DE0E8FF6DEDCEA11B5202EB6952416031FD975BDE6D294913258AB53BBACF7AC5AB7614949C98A729DE0401D3A74BD7563833FEE7A1102FAEACF4FF4B91611B2A416CCF0D1B60BBE9907827FF0F46C7C60B6AC644498AFDDEF2B0DF3B7AA5A5183F5EBAAEBC624CFAB1CF42BFBEBA9A87FE468B6DA804B1553D1EF4E821DDE9D9B9B6FAFBCE2693AA6151D2619E9687793A4AC123D325FF424E8EDA411145A5E2D3B3A31F943626B3DD56BB66736775E3A124C37E6F8AAB46D3BCF134B2B2540D872806321FE898375EDAEEDBFE8FCEC57FE236F5144BACA7E5613D1D8DE062BA601966CE543B28A21810040CECED761E368B0F9D4E0E3450CCB09EA6F8092EA6274C50351CA298311860FF6777DFC311779CF572F637C508F334C549D034EF74DB255C8E45C9C4D4CB50324FDA43F4F0898E59F79C51371E4A1ACCD31427C1C5F46F7F1BE61B1D0E8522D211B6A1129AB66ACE5397650F7589D76B1D9794FE8DCBB4280698A7291E828B69F377484F0FE78D8585C8C84061A182B1253DB6A1125A6AD5451B2C3D3B9E10AFC74F68EB72C5392E4A429C47260FE79145A6D19A6964A417FD0A53A786F346EE79193DB6A11242B4AA6BE7E9BE377612AFCDDDEBF61F6AC7FD44291ACCD3F2304F4720789A37D2505B1BE6C11BCC31D1631B2A2174AB96BEB97FFC4B7DC4EBEC8784D2C54CD41439F67B93E28247A6F3F2783A1625B79C17FBFCEABAEDE275D9C786D25275C3A1C4C67A5A1ED6D37235534CCB595BCA5A307A6C4325B4DAAADE9342BFEEFF710BD226A235355CDF4011623D4DCA0A2EA6AD566E00417A60EC6258BDA2CEF770CC684110540C871218F3342928789A371C78F1455523228A9FD47BAE2C7A68A3785DBDD3E0FB59209285FDDEF2B0DF5B96E069DE70843F834CC43EDBE8B10D95107EABDABA7DBDF6F87F89D7E5E5C8CC54322C4A46CCD3F2304F87AF9991E98202B91B7A33C7448F6DA884F05BD5BBEF683F8BE086B4F5F79123E0C197240BFBBD4929C123D30037F4261D32FEBCFB92FC6ADF43DBDDF51CA8265998A74911CD8C4C5BAD114C78359BFDFF5264D8864A90D5AAE9BF1D5190BA44BC7656B799354BB1B02819314F93229A29A6239A41E674C26A85D319BBC8F4876DA804B9AD3A63D3285B7B694E597E3E775C2719383E2D0FC7A7C3D16864BAE3EEAAB3BF00207706195192F194D9AD39378903D566339C4E0E545358584F53EC352AA6CF4E02C03DC8884CD9B625B677C46BB71B3939E040358583F5B43CACA75BD5A898EEE9AE3ADC0B80AC3DC8889296204CEBF2DE9CD393C547F21740901E314FCBC33CDDAA66D64C5BADA8AA52352822AD1076FC6BE0CDF54E58C587FC0B965AC57E6F8AA5C069DEA9D778D3E10080C993550C8948530C036EB24FFEBBEFE1C891F07A550C871200F334C552E0C8F467E627A5AB8913D58A8748834C730B565CFEA878ED7663EC5875C321AD639EA698092CA6B31F38677194004076763433C83C1EA4A5C1E389457C7AC536544254AD6A308CDEF0621EE6888FEC761417C730344A36CCD3143381C5F4ACB48B3D7BCF3C13CD678A4B54ADD6E822D337B6A112A26DD5D4D4D953BFB7425A7F9D9B8BEAEAD06F20FDE23C3279388FAC2581D3BCB3B351BABE17DC6E98CDD8BF1F0643C41FCBBDA9A3C73654420C5A55105C570EE9EBD92A3E329BB1772F572F5233584F536C342AA61FDB2D3D9832259A244D94CC0C06CBDA774B20AD8E70BB39E1929AC73C4D31D068643A1B968AB9D2031EBC4114426A6A4E5EF76C94898FCACA505AAA6E40A445ECF79687FDDECD0A5C335DB3F782A59F01404C964DB3CF367A6C4325C4AC5505A1AE4FDFABDC5B7D075FD6D44470600D2533D6D314ADE062DAFD0FE9017BF1885A6530B45B5DB119437C37860CE17EA2D408F33445ABD1C8F42CE0B7BF951E70D934513852532D79638A902B3E72BB395E448DB0DF5B1EF67B07099EE63DDF8BCE9D01C066C39A35D17F3EFB6CA3C73654428C5B5510D0A7CF08F7DFECB08937CACB9199198B4FA6C4C77A9AA2125C4C2F5F2E3D78EE39B542224A3C060356AF5E86B166483F4EA347736B1A92B09E9687F574A0E062BA14484B83D309007575315991C55A307A6C432528D2AAD3A655CF59EFDBFCC46AC5F6ED5CD848ACA7290AC1C5B4C72325E9BCBC58FD76B1D9FCFF5264D8864A50A45567CF4E357B7C03D54EA77F8626E919F3344528789AB705F8FBC5BD421F7E38565F65E54A141460E5CA587D9E1EB10D95A048AB1A0C58BD7A2A8A6DB08B37E6CC4145454CBF042520F67BCBC37E6F9F466BA6C5159FBD2EEE157AE8909A911125B469D33C73CAAC70FA56541F39029349DD98484DACA72912CD14D3D5D5FEBD42892862B36699CC6D97609CEF464E0E5754EB1AF334452278641AC0D2A5D2E3FBEF572524A224613462E1C274380A902FDEB0DB2FFE94912EB1DF5B1EF67BA3D969DE60A737514CE5E408651F8FC24ADF8AEACA4AA4A7AB1B13A983F534C9D64C31CD4E6FA2D89A3FDF60EE5E8A1CDF8D71E3B8A25AA798A7499E6646A611D0E9AD409EF67A63FE91BAC3365482B2AD6A3462E142133CE5182DDE70BB919313FA3D949C98A7499E668A6941C0BC790060B5C67C5AAAC381CE9DE170C4F653F5856DA88478B46A66266CB64C54E4618E78C36E4771B1925F913489E3D3F2E87C7CBAF991698703191900505484A95363FB15B99756F4D8864A8853AB7A3CE8D143806120B63B6115EF399D484D55F28B92C6B09E26199A29A6C5BBA2471E897F4844C9CC6442498901826F36198091233990A12FACA7E5D1733DDD7C312D0868D70E00AC565455C5FC8BB2168C1EDB5009716DD5B434389D15C81C8D72F1468C8EA3A3C4C07A9AC2D57C31BD658B74317972FC4322D285E5CB0164A2E2571DA5099B1CA8D615E6690A4BF3D3BCC14E6F22E5592C282A02F0B7B30FF7EC744ABC979B0B974BCDA0286ED8EF2D8F6EFBBD9BD9CD1B8A777A837DB6B1C0365442BC5BF5E2B0930B96BEA811EF99CDD8BF9F075F263FD6D3D4BA168B69767A13C587C180D5AB0158E02AB9EA65F19EDB8D0913548D8AE282799A5A376B567323D300D6AE952ED8E94DA4B4D454646703C8F9E18DEC817BC47B656517677452F262BFB73C3AECF7F67AD1B9B374ED9FE62D12F7F456ACD31BECB38D05B6A112D46955AF17FDFAC1ED1660E8D3E3ACFB485BF1B67F288A9211EB696AC5ECD9FEEB46C5B46F4F6F767A13C587D188850B011820ACBEFA29DFED214378F06532639EA650BC5EE44B67EB351E9946C09EDE4A767A5756FAFFA5C8B00D95A05AAB6666C2660390FA8F05731EDB26DE73BBFD334828F9B0DF5B1EBDF57B1716FAF37470DF5ABC0EB2ACAEE62E89D1621B2A41B556F578D0A3070098CD23FAEFB7AF97267C97972333538D784861ACA7A945A18AE9381E64C904133DB6A112546B5593495C4E0DB77B59F7C966B3747BF4681E7C999C98A7A9452D8E4C23A0D3FBFEFBE3160F11499E7A0A562B00E3C7EFAFFECBB7BEDB361B07AA9310F334352F54310DE0934F00C06C66A546A40283011F7E285EA63E7347417EBD78ED7472A03A09314F53F34215D31E0F9C4E201E9DDE44D4BCD454E4E50180DB3DE38A776C17CFD39A3387678D271BCE23934727F3C842AD9906505C8CDC5C00A8AC447A7A9C632322C9C5E5D4003CBB8E5A877713278D98CD703A6132A91C1DC50AEB696A46A8621AD2E93D003078701C826171103DB6A112D46FD58BCBA90198727FB5648974DBED464E0E07AA9307F334056B6564DAEB85DD0E007979713801A0B0101919282C54FAEB2433B6A112B4D2AA179753C36E4F3F59515020DDB6DB9BFB0B9B1213FBBDE5D143BF77A835D3002A2A307A3410A7D59ADCF3327A6C432568A8550396530BDFEC1D7887519C3D020E4C250BD6D3D4482BC534E09B658A3BEF8C575044D4B280E5D4869933C4DE2ED1B871F07AD50A8B6286F5B43C495F4FB7524CFB0E9CB6D9B0664D1CE2D150D592B0D8864AD056AB5E3C9D1A006A6A2A765AC43E2FC4EF279514C47A9AFC5A2FA67D074E4F9C18AFA088A835174FA70680ACACCC9182B8620B80DD8EE262B5C2A2D8609E26BF56A67923E0C0E91123E2100F1185EBE2E9D4703AB178F1ECD9E27E6500909B8BEA6A1523A368B1DF5B9E24EEF76E65CDB448F903A78368AB773131B10D95A0C5560DFC19AEADF59C368AD3CB0098CDD8BB1746A35A915154584F93A4F562DAE59206C01E7C303E2111910C46234A4AA4EBC9934D26FF23B71B63C7AA1516458B799A807046A601AC58215DF0EC0D226DCAC991FABBCBCA505D9D9323F58503B0DB5BE82423CD63BFB73CC9DAEFDDCA346FD18811D20E27757571D8E144A4C5DEC544C3365482765BD5E542DFBE00603663FF7E0106DF4C7084F8E9260D633D4DE115D3BE6DC8B2B3E396A4018867EBFA4ED8A508B00D95A0DD56B5587CE773E09D770C066CDEEC7F72C810EE279A7898A7298C9169003B7648178F3EAA743C819C4E58ADF0EDAF4411601B2A41D3AD3A6B96F417446E2E3C1E8BA5D140F584092A46469160BFB73CC9D7EF1DD6346F00D3A661CE1C00A8ADE5B45122AD2B2DC5F8F180FFA7DA376C05A0A4043939EAC54632314FCB937C793AAC9169A8B0228B88A2E2CBCC9595484F0F380313008E1CE1C1970983FDDEBA16D6C8340256644D9E1C97B888286AF3E74B17E3C641108C46FF9665006C360E54270CE6695D0B6B641A012BB278F60651A2B058209E73E976E39D7700A4A64A077600703A317DBA7AB1911CECF7962799FABDC31D99863A2BB288285A81E7735CECE90E1CA88ECBE1B4142DD6D3FA156E31ADD28A2C228A96C180850BA5EB8B33C7962DF32F271B3D1A1E8F1A81911CCCD33A15EEC834545B9125F2789096C65F2551611B2A21615A353313361B00D8EDA8A800603462C912FFF31CA8D63EE6699D0AB79846C01959B7DEAA5C3C2D1197A8FA4EFEA108B00D959048ADEA9B503669929893D3D3A5916B004E676BBF01486D1C9F962739C6A7658C4CE3E28A2CB319870E291F5A30EDEECE9838D8864A48B056F5ADBF2C28C0CC99000401A346F907AA2B2B919EAE5E781412EB693D92514C7B3CD224942953140D89881434638634289D9F0F970B80C180D252FF40F5B87189D087AF57CCD3BA2363641AC0D6ADD2C5DD772B19141129297042D9C55D104C26FF3DB71B39391CA8D628E669DD91514C0358B54ABA183040A17888281E022794391CBE7BE2991DE2ED77DE5129360A89E3D3F224FAF874E0C8F4C581AA90C4FF5E9B0D6BD6281A58E8AF8F441905D424B6A11212B2551B1F79292EB314040C1CE83F50C4E9446AAA7A115273584FEB4B6031DDFA6E442E97749195A54C384414474D7628036030F86793011839125EAF1AB151CB98A775247064BAA0208C53AFBEFC52BAE076A144C9C137A12C37D73773CC644279B9F4BCDB8DB163558A8D5AC03CAD23F28A6900EFBD275DF4EFAF443C44146F8113CAA64DF3DD0E1AA82E2E8E7B60D4328E4FCB93B8E3D3B247A60501EDDA016A0E4E2341470135866DA884C46ED5C6475E8AF702F7020707AAB584F5B45EC82EA677ED922E264E54229E30891354C57F29326C43252476AB363EF252BC3418B079B3FF25234772999656304FEB82EC9169001B36481743872A14553856AE44410156AE54318484C736544262B7AAC5227573074C28136F979448D76E37264C5023366A82FDDEF22468BFB76FD34000B5B5E1E5695FCF58E2FC671251B8BC5EF4EB1774E4A52827076565D2754989EF9C2D520DEBE9E41749312D08FEB32C8928F9188DFEC1B080096500162DF2EF273A7EBC7F7926A985793AF9C91E9946C0E0F4BDF7C63C1E22D2849C1CE9C0AFB2325457FB6E070D540F19C2816A95314F27B9488A696865709A8894B57CB974F1E8A381D9D86241519174CD816AD5314F27B9488A6904FCF4B6724C07112532DF8432A7138B17073E3375AA7F367B59192A2AE21E1B5DC47964F224D63C32D96BA645BE95D3AD9F4D1D0F5E6FD8DD00D402B6A11292A455037F4D349E651A38D50CC1B3CD287E584F27B3088B692D0D4E3B1CE8DCD977BA0F45826DA884E46955A3D1BF186BC68CA06756AFF63FB4D93850AD0ED6D3F224503D1D61310DA0B818B9B9005053A37ABF7762EFFAA40D6C43252455AB069E99D5E4A7DEF7FB00405E1EDE7E3BDED111EBE9A41561310D0E4E13E98CC1800F3F94AE9B1C8EF7D453FE81EA39733850AD02E6E9E414E1346F11574E13E94D6AAAF423EF7406CD4A3118505AEA5F513D6992EF9C2D8A13E6E9E4147931EDDBD4400383D344143FBE1EEDE9D38306A24D262C59225DBBDDC8C9E140755C314F27A1A88A69DF99D33C2B8748574C2669D1B4DB8D59B3829E4C4F474181746DB7377D9E14C47964F224C43CB24876F3F6F1EDED5B57078321E6B1C99554B37554C236544272B66AE0D9964D26940902468D9286C5D0E8484C5216EBE9641355310D4849DA66D3429226A2B83218B070A174DD788D162E0E54FB8C1BC781EA38619E4E36918F4C03FE1FBB26733E8948173233A5E9DD65654D97879B4C282F97AEC5816A8A03E6E9A4126D31BD75AB7471F3CD318C8A8812C9FCF9D2C5B8714D278C65664A3B8D02B0DB515C1CC7C0F48A793AA944554C0358B54ABA18302026F11051E2B158A439636E77D0A6DFA2D9B3A573B600E4E6061EB5458A609E4E1ED116D300BEF80200AC56ED6C5B5C59E9FF9722C336544292B7EAF4E9D28AE9F1E3E1F5063D6930F86793011839B2E94B289698A79347B4C5B4D72B6D1C386C588C228A81F474389D9C561A15B6A11292BC558D46FF2F94C9939B3E6F32F9370577BB31766CBC02D325AECB9247B3EBB222DFCDDBC7E140460600949723333386B11151424A4B6B69D36F916F15278092124E2B530AEBE92411B8862292621AC03FFF295DDC7043F4F11051C26B79D36FD1A245FEFD44C78FF76F6648B1C53C9D0C5C2ECC99235D4738320D1EBF41448DB5BCE9B7C860C0E6CDFE874386703F5145B0DF5B1E6DF67B07F63EC9DE80CC47FC4FCBCE6EF6079288F4C8E3418F1E00603663FFFE66B73F2A2DC5F8F1D2357F7F2881F574C273B9FC493AF262DAD7633574682C8222A2A41072D36F514E8EFF74BDB232E6E9D8639E4E7831189946C0F11B77DE19653C31D7644F24928D6DA804BDB4EA534F49A3D0F9F92D0D41CF9FCF816A05314F27B6D814D300B66C912EAEBE3AFAA862A8B0101919282C543B8E44C63654828E5A35E4A6DF22A311AB57FB1F666571A03A96383E2D8FD6C6A76333328D8B0B30AC565455C528B4D848CE5389E28B6DA804DDB5EA8811D2E6262D9F93555C8CDC5CE93A2FCF7F9E354589F574028B5931ADC91D4E8848437C9B7E3FFD744BC5F2D4A9D2111E00E6CC4145455C02D301E6E904169B916900DF7F2F5D0C1E1C4D3C4494B42C16E9FC0DA7B3D94DBF45CB96F907AA478FE6C197B1C13C9DA862564C03FE7DF439D99B885AE29BEFDDDCA6DFA2A0816A9B8D03D531C03C9DA862564C0358B142BAE00E2744D412A3D1BFA9770B13CA00A4A64AA76D01703AA3FEED449C47269746E691B95CE8DB57BA8E7037EF40BD7AC1ED86CD86356BA20E2DC674375B47016C4325E8B4550501030786DEF45B7CD5A851FE33B55A9E794661613D9D9062594C7BBD70BB01E0F6DBA3FB20224A760603E6CE95AE9B3B47CBF7AAD252FF40F5B8711CA88E0AF374E289E5C834801D3BA48B5B6E89EE83884807D2D3A5EDC7ECF61053BA4D262C59225DBBDDC8C9E14075E498A7134F2C8B69F0982C2292C937A16CD2A410E9373D5D9A210EC06E6F69D7516A1DF374E259BF5EBA8841318D801D433539894CEC3AF375A05104D8864AD075AB5A2CD25431B71BEFBC13E285B367C36A95AEF3F3FD2B4B4816CE2393470BF3C80A0B919F0FAB155F7E198B3C2DFE1769721219008F07361BEC76984C6A8792B0D8864AD07BAB0A02FAF491A6B684DC0AD177E01600B3197BF7C6E2B796CEB09E4E3C53A6E0C8115455C5E2DBDD37BB43AB93C84C265455E9F557618CB00D95A0F7563518307BB674DDF28432002613CACBA56BB71B63C72A1C5832629E4E3C2653EC7E3BECD9235D70121911C9929323756A979585EED1CECC6C34505D5CAC7C6CC985795ADF38898C8822F6E187D2C5A38F867E61E040756E2E07AAE5619ED6376D4F2223224D4B4D95D668399D282D0DF1428301CB97FB1F8E1CD9D2C6A3D40CE6697D13E78EFBCEB8212292C5778ED6F4E9A197485B2CFE5D47DDEE101B8F5230E6691DE34E64441425A311454500E076B7BA443A27472ABF015C7BADC2812511E6691DF31D67A9E149641E0FD2D2B8E96054D8864A60ABFA3DF594B4903C3FBFD51659B4084545C8CEC6CD37C723B4E4C0F5D3F26861FD74CC949662FC7820D47EFAAA138F08319B71E890DAA1242CB6A112D8AA8D545460F46800C8CE0E3D504D11609E9627A9F2744E8EB451785D1D0C06B5A3699E4E4F258A29B6A112D8AAC1D2D2A473B4783C56ACB1DF5BC7FEFD6F00B05A359BA4892861F8E6733FFD34CFDC882DE669BD1204E98FDF61C3548E84889280C522ED66E27462F162B5A38913AFD7EB72B90485FF2E619ED6AB0307A48BC183558D838892856FBEF7F4E97A581F2D0842BF7EFDFAF6EDDBAE5DBBC2C24297CBA5D017629ED6AB9D3BA58BD45455E320A26461344A4BA4DD6EFFEEDFC9EBC081036E71692B909F9FDFB76FDFB4B43487C311F3F29A795AAFB66D932EAEBE5AD5388828893CFCB07F8D9662F5A566399DCE8C8C8C3E7DFA1416167A63D7A3C03CAD57DF7C235DF09039228A1583014B9648D721CFD14A626EB73B3F3FBF73E7CE3939390E8723FA0F649ED62B7145966F732022A298484F97B622B6DB118B2C95B8CACACA323232C4CEF0683E87EBA7E5095C3F4D4444148E23478E98223D9098F5B43C3D7BF6543B0422224A301B366C88F8BDCCD3F27CF7DD77C3870F573B0A22224A180F3EF8E0B871E3227E3BFBBD8988886473B95C7DFBF60DF102ABD5FAFAEBAF8F1C39D210DD9E8FDC309288882896F2F2F29E7BEE394B8CCE37629E2622228A01ABD5FAE28B2F6665651963BADE95FDDE444444B20982D0A74F1F714BB2ECECEC679E79265D9983C298A789888822E1F178BC5EAFC9648A6D011D84799A888848BBB82E8BB4C26EB73FF3CC33858585C78E1DF3DDF4783C0B172E5431AA04525757B768D1A2C71F7FFC9D77DEA9AFAFF7DDFFEAABAFD6AD5BA76260898EDF9914198FC7F33FFFF33F93264DFABFFFFBBFC0FBEFBDF7DEE1C387657C50039106CC9C39D3F73D3960C080E3C78F3734345CB87061CC98319B376F563BBA0470FAF4E95FFEF297BE36FCCD6F7E535F5FDFD0D070E4C891DB6EBBED3FFFF98FDA01262A7E675264F6EEDDEB5BB5959292B270E142F17E6565E5983163647D14FBBD497D2B56AC183F7EFC134F3CD1AF5FBFAFBFFE7AFDFAF51D3B76FCF5AF7FBD62C58AACACACE79F7F5EED0013C0F3CF3FBF6CD9B28913271A8D4687C3B17EFDFA418306A5A7A77FF8E1870B162C50687A4BD2E3772645A6BEBEFEB6DB6EEBD4A9D3FDF7DF7FEAD4A94D9B36391C8E8913275E72C925AB56AD5AB76E5DF7EEDD657C5CECFF8A209269D4A8513B76EC08BCF3AF7FFD6BD2A4494F3CF1845A2125963367CEA4A5A59D3A75CA77A7AEAE6EF3E6CD83060D5AB468918A81253A7E675264D6AF5F9F93931378E7D4A9539F7FFE79BF7EFD9C4EA7DC4F633D4DEA3B7BF66CC78E1D03EF7CFEF9E79F7CF2C9BBEFBEDBA64D3353280441282F2FCFCACA8A578009A0691BBEF2CA2BBD7BF79E32654AD02B7FFCF1C7AAAAAA53A74E5D77DD75A9A9A9EDDAB58B63980926FCEF4C4110B66CD9E272B98C46E38D37DE78EDB5D7C63752D216411000046E4376FAF4E9471F7DF4A5975E1A346890DC4FE33C32525FD0AFC28F3EFAE8D34F3F5DB06041D0AFC2F3E7CFEFDFBFBFACAC6CE8D0A163C78EBD70E1427CC3D4B4C0366C686878F6D9677FF6B39F0525E9DADADA679E79E6BFFFFBBF6B6A6AAAABABB3B3B3AFBDF6DA929292B8079B30C2FCCE2C2F2FBFEBAEBBBEFEFAEB9E3D7B9E3E7DFABEFBEEBBEBAEBBF6EFDF1FDF6049430C064360923E79F2E4238F3CF2C20B2F4490A401F67B93C6FCE94F7FCACDCD15E7400579F0C1077FF5AB5FBDFBEEBBE2F7BA2008F10F4FFBCE9E3DFBE8A38F7EF8E1874D9FCACECE5EB16285EF616D6DAD78A84C5959591C034C542D7D67BA5CAECB2FBF7CE3C68DBE3BBB76ED02F08B5FFC22BE019246EDDFBFDF66B355555545FC09CCD3A415172E5C983A756A616161ABAFB4D96CCCD3CD3A7EFCF8C8912357AE5CD9F4A95DBB765D79E5958179BAA1A161C78E1D007AF5EA15AF001352E8EFCC254B9600B0D96C8137BB74E902E09B6FBE894B80A45D3B76ECB8E38E3BBEFBEEBB683E84799A34E1FCF9F3E3C78F9F3F7F7E382F669E6ED68F3FFE387CF8F02D5BB634FBEC279F7C02E0C61B6F0CBC595F5FDFA9532700FBF6ED8B4B8C89A7D5EFCC93274FBEF8E28B5F7CF185EF8ED7EB4D494931180C5C0EA7731B376EB4D96C870F1F8EF27398A7497D67CF9E7DE08107962F5F1E74FFD8B1637FFDEB5F9BBE9E79BA2997CB357CF8F03D7BF604DDFFEAABAFD6AE5DDBD0D070E2C4892953A62C5BB62CF0D93367CEB46DDB16C0D1A347E3176BE290FB9D299A3F7F3E80679E7946E1E848D356AD5A3566CC98DADADAA0FBEFBEFBAEDCCCCD3C4D2AABABAB7BF0C1072B2A2A9A3E3565CA94E2E2E2A6F799A7831C3C7870D8B06135353541F7EBEAEAAC566B7575754B6F2C2F2F073078F06065E34B4C117C670A82B074E9D2EEDDBB3FF1C413757575CAC7481AB57EFDFAFBEEBBEFCC993341F75D2E97C56291FBBB8BF3BD496593264D723A9D1F7DF4D1DB6FBFFDC30F3F88374F9D3AF5FCF3CFAF5EBDFA89279E50373CED3B75EAD4881123EAEAEA66CD9A55565676E2C409F1FEBE7DFB468D1A65B55A6FBAE9A666DF585757979F9F6F341A8B8A8AE2186FC290F59DD9D0D03065CA949123473EF9E493C3860D7BE9A59702A7FB92AE5455558D1D3BB64D9B362FBFFCB2DD6E3F77EE9C78DFE1700C1F3EFCD5575F153BB16488D9DF0F44F2CD9E3DFBAEBBEEDAB973E7DEBD7B6FBFFD7600BD7BF716F7F1B9F4D24B1D0E47B3EF623D1D68CC9831797979870E1DDAB46953530947A10000031D49444154AF5EBD5252526EB8E186010306B469D3A67FFFFE217AD8F2F2F2BA74E9D25223EB5C64DF990D0D0DF5F5F5BFFFFDEF0D06C31FFFF8C778064C1A71ECD8B1EBAFBF7EC18205478F1E5DB870A1C160E8D0A1C32DB7DC72CD35D70018376EDC850B17E47E26F334A966E7CE9D43870EF58DDFD4D6D60E1B364CFCF3B177EFDE2DCD876A609E0EB060C182A79E7ACAF770F7EEDD3FFBD9CFC4364C4F4F3F72E4484B6FFCC31FFED0AB57AF6DDBB6C525CC0413F177A6CF902143002C59B244E1484973264C9810B8D071E9D2A5EDDBB707909292F2E4934F46F65B8BFB91916A0E1C38D0AE5DBB9E3D7BFAEE5CB870E11FFFF887200843860C11BFB99B3562C408BBDD2E0882ECEEA3A453555575E38D370676B17ABD5E87C3D1BD7BF7FFFAAFFF6AE95D6FBEF9E6F2E5CB3FF9E4935EBD7AC525CC0423EB3BF3DCB97367CE9CE9DAB56BE0CD975F7EF98D37DEB8F3CE3BBFF8E28BF8C44C1AB16DDBB65B6EB925F08EDBEDDEBE7DFB0D37DCE03B96432E8EA0906A7AF7EE1D74A76DDBB63C314296B4B4B4A03B46A371E4C89121DEF2FAEBAFEFDAB5EB8B2FBEF0E59B2953A6CC9831A34F9F3E4A459968647D67DE7CF3CD353535BB76EDB2582CBE9BE2FAE9A3478F2A1623695450920660369B478F1E1DCD67324F13E9C86BAFBD76FEFCF9458B16F9EE3434346CD9B2A56966A2700882F0E38F3FD6D5D59D397326F0FEEEDDBB01646464A814172515E6694A3C274F9E14FFBDE28A2BD48E2591141616BEF6DA6BD75C73CDC71F7F2CDEA9AFAF3F79F2649F3E7D525252D48D2D41190C86C71E7BAC5BB76EFDFBF7F7DD3C78F0E0A79F7E7AE59557161414A8181B250D8E4F53C278F6D967B76DDB76E2C489C3870FB769D3A653A74EE29CA9CACA4AB5434B002B57AECCCCCC6CF6A9C71E7BECFDF7DF8F6F38C9A3BEBE7EC68C197BF6ECB1D96C7DFBF6DDB76FDF9B6FBE79FDF5D7CF9933E7BAEBAE533B3A4A06CCD34444D13A79F2E4962D5BF6EDDBD7AD5BB79B6EBA89199A6288799A888848BBB81F1911119176314F1311116917F33411119176314F1311116917F33411119176314F1311116917F33411119176314F1311116917F33411119176FD7F5DA8178B55393F080000000049454E44AE426082>|png>|.3par|||>>
      In the case of distributions that are log concave, an envelope
      functionfor use in rejection sampling can be constructed using the
      tangent lines computed at a set of grid points. If a sample point is
      rejected, it is added to the set of grid points and used to rene the
      envelope distribution.
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
    q<around*|(|z|)>=k<rsub|i>\<lambda\><rsub|i>exp<around*|{|-\<lambda\><rsub|i><around*|(|z-z<rsub|i-1>|)>|}><space|5em>z<rsub|i-1>\<less\>z\<leqslant\>z<rsub|i>
  </equation*>

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
    <\small-figure|<image|<tuple|<#89504E470D0A1A0A0000000D4948445200000267000001BC080200000014C19537000000097048597300000EC400000EC401952B0E1B0000200049444154789CEDDD7D781355DA3FF06F21CA6A4005090D2A6B0BBE209880228B4BC1370A2A2005590B057457115710CA0FBBAE02FB00E159E5D1B52245C4A52A2B422B5CB0C00A05A1A2ACADD807154856C4475EAA08B6444081404B53F2FB63A69393B7E940934C5EBE9F6BAFCBD399497ACA36BDE7DC73CE7D523C1E0F8888884883667A77808888286E306A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A32611119156B11E356B6B6B4F9F3EAD772F88888800C010C6F72A2B2B9B376F5E75753500B3D99C9B9BDBA74F1FED2F3F70E0C0A2458BC423F5F5F5DBB76F5FB3664D183B49444474C1C21635A74D9BF6D24B2F2D58B0E089279E00F0F7BFFFFDCE3BEF9C3A75EA5FFFFA578DEF3067CE9CC2C242BF83E3C78FBFFCF2CBC3D5492222A2A64809CBFE9A8585854F3CF1C4B871E3C4C1E2D8B163DF7EFBEDB7DE7AEBB1C71E6BF41DAAAAAA3A75EA74DF7DF7356BE64D1A5F72C925369B2D3D3DBDE93D2422226ABA3044CD13274EA4A7A71F3B766CCF9E3D37DE78A3727CF7EEDD5DBB766DDBB6EDFEFDFB5BB56AA5FE26D3A64D3B70E040717171133B434444143961980DB46EDDBA63C78EA5A7A78B211340972E5DD2D2D27EFAE9A7929212F5773879F2E4DFFFFEF7E9D3A737BD33444444911386A8B976ED5A005DBB760D3CD5A54B1700EFBFFFBEFA3B2C5AB4E8F8F1E38F3DF6585E5EDE9A356B8E1F3FDEF45E111111855D53A3665D5DDDC68D1B0174EAD429F0AC74B0A4A4A4BEBE5EE51D5E7DF5558FC7B37DFBF6575E7965D8B061D75C734D5E5EDE8913279AD8372222A2F06A6AD43C74E89014DE82CED9910E1E3F7EBCAAAA2AD43BD4D4D4E4E4E40C1F3EFCA69B6E928E9C3E7DFA95575EE9DBB7EFA143879AD83D2222A2306A6AD454C2E165975D1678565934A212355BB56AF5D24B2FAD5CB972F7EEDDBB76ED7AFAE9A7A5A94376BB7DC8902167CF9E6D620F898888C2C6D334FFFAD7BFA4F779F7DD7703CF2E59B2443ABB61C306EDEFB96BD7AEABAFBE5A7AE16BAFBDD6E8F5FAFCC3111151E20A15719A5AE5C068342ADF20E877F5BB4C0BABD5BA6DDBB6DEBD7BFFF0C30F6BD6AC79EAA9A7542E4E494909F5DD8948C40F0B9146D28725A8A66668DBB56B27356A6A6A02CF9E3973C6EF328D3A74E8F0DC73CF01D8B76F5FD33A48444414364D8D9A575D7595D4703A9D81678F1C3902202525A57DFBF6E7FBCEFDFAF583107789888874D7D4A8D9A64D9B6EDDBA21C4A0503AD8A3478FA07385D449C3D3366DDA34B187444444E112862A0743860C01B077EFDEC053D2C1071E78E002DE567A6D8F1E3D9AD63B2222A2B00943D41C3A7428801D3B76D4D6D68AC76B6A6A76EEDC8986B07ABEBEFCF2CB66CD9A3DF9E4934DEF2111A1614EA0DEBD208A6F61889AB7DE7AEBA041834E9E3CE957396FCD9A352E976BC89021DDBB77570E9694940C1D3A74FDFAF5CA914F3FFD74CB962D7E9389CE9C393367CE9CE9D3A7F7EEDDBBE93D2422220A8BF0EC1476F0E0C13E7DFAB468D1A2A2A2A275EBD6008E1D3BF69BDFFCC6ED769795955D73CD35D2651E8FA77DFBF6D5D5D5EDDAB53B7CF870F3E6CD5D2E57AB56AD3C1E4F5A5ADA1B6FBC71EFBDF702F8E9A79F7EFFFBDF9B4CA6B7DE7AAB79F3E68DFC009C4C4F444461959212323886276A023870E0C0840913F6EFDF3F76EC58006FBEF966A74E9D162E5C989696265ED6A3478F2FBFFCF2D65B6FFDE28B2FA42323478E5CBE7CB9D4EED9B3E7E5975F5E5B5BFBD7BFFEF58E3BEED0F27D1935898828BCA2113525DF7EFBED575F7D05A06BD7AED75F7F7DE00567CF9EFDF2CB2F7BF4E871D145172907F7EDDB67B7DB4F9E3CD9BA756B8BC5E21768D5316A12115178452F6A461FA326111185974AD40CC36C202222A224C1A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A326111191568C9A4444445A316A12111169C5A8494444A415A3261111915606BD3B40441174BA72F7FF7DFA8F4B2AEC479D7B00B4FDAAFAA7AEA997F7BEBFFD9D23DB74BC0D46A3DE1D248A33291E8F47EF3E34494A4A0A8078FF2988C2CCEDAEDFB4E1C4D4A75ADB0FAA5C5599F3DBB4178A909616AD6E11C587949490C191519328E194949C193BEA92AA5F345EEECE79C8F0C24B8C9D440A464DA2E4E0729D1B37B659F172BFC35B72527F855F550DBEAD255A1AD66DECF251B5B92AE0B5361BA64D83814F6D88183589924179F9B9DF3DD8ACEA8872C06EC5DFE7A43D39E09F16C32DE2852EB8ECAE6DEF2F7EF08549277DDE2133131B36307012A944CD30CFA13D7DFAF41FFEF087AAAAC0FB584D76EEDC99979777EEDCB9F0F68A28F1CD9E8D3E7D94905965C690B2362777952D1878C02F640230C2F85B63E6EC89C79E39357EA64D38515A8A0E1DE07446ABD344F1279C51B3B6B6F6BEFBEE1B3870A0D96CBEB077E8DEBDFBB5D75EFBF0C30F87B15744896FF66CCC9CA97C559C83717BEF2ECEF83E03192A2F32C0F037E3EBBD66ACBFF948BB2AE5235B558576ED505E1EC9EE12C5B17066681F7DF451A3D1F8DA6BAF35F17DB2B3B3AD56EB5FFEF2172D1733434BC9CE37640E5A8FB3033337608341F3BA32279CB7B82DFFB8BF3AB354387AE4084CA6B07694286E44E3B9E6F2E5CB9F7FFEF9EDDBB7B768D1A2896F75F2E4C9EBAEBB6EFDFAF5B7DD765BA317336A5252F30D997DCA7049C6F9854C891438C7BE506D53DECC6C86DDCEC049C929E2CF35CF9C39F3E73FFFF9D9679F6D7AC804D0AA55ABF1E3C74F9C3891B190484D515158422600134C1B0C9BFF7B06BC8F39ABAA60B5F21927919FF044CD828282DADADA871E7A282CEF0660E2C48976BB7DE5CA95E17A43A244535E8ED1A395AFFA94615F86B908451710322516583E415990C0E97637B9AF4489230C51D3E3F12C5AB4E88F7FFCE3C5175FDCF47793B46DDB76F8F0E1858585E17A43A284E274E277BF53BEEA53864F33B00DDB4C685242350319B360FBEF1928CD6C38545585FBEF6FCA7B1225983044CD4F3EF964FFFEFD83060D6AFA5B89EEBAEBAED2D2D2EFBFFF3EBC6F4B14F7DC6E6466A2617DD7E865F834034BB12C0D694D7FEF6998D60F99F76F10026769299A3CC58F2861048F9A353535EBD6ADFBF7BFFFAD1C3975EAD4860D1BB66CD9E272B9FC2EDEB871E3C5175FDCAD5BB746BF595D5DDD471F7DF49FFFFC473CE87038823EBFECD3A78FC7E3292D2D0D3C4594D4F2F260B74BCD825C148F423F648EC2A8B0BCB701862214D51B30740DBCCB51264D82C31196F7278A7741A2E6B973E7C68C1973EAD4A959B3660D1D3A14C0AA55ABFEF0873F9C3E7D7ACF9E3D37DF7CF3D6AD5BC5EBFFFDEF7F77EBD6ADD179407BF6ECB9FEFAEBEFB9E71E8BC5327BF66CE9E0F7DF7F3F6BD62C691EAC9F1B6FBCB15DBB7662E426229497A3A0406A9666222F1F008A5014C6EF60826929969D36E2B7DB84A30306F001271182EE145654549495953572E4C8AAAAAA2953A68C1D3BB673E7CECAC49C03070E0C1F3E7CDFBE7D975F7EB97464F7EEDD0F3EF8A0FAB7397DFAF4A041833A77EE3C62C4885DBB76BDFCF2CB3FFEF8E32DB7DCB264C992E5CBFD6B662A3A76EC686FB8A72622B85CE2E3CC5145A83760299635F17166A05118B5188B3F4C2B1DBD0CCBA42947555578E4111485333C13C5A32063CD952B57666767033874E89074E499679E51CEDE76DB6D478F1EFDC73FFE217D59575777FCF8F12BAFBC52FDDBAC58B122373777E3C68D2FBEF8E2C68D1B7FFAE9A7ECECEC050B16BCFCF2CB575F7D75A857B569D3A6B2B2F2FC7E20A204366E9CF23873D07AFC640A676ED68F347E2D1E253CE02C2E46494924BE17511CF18F9A2E97AB59B36652BAF5F3CF3F07306DDA34F182BABA3A005F7DF595F4A5D3E904A08C3B43193366CCE4C993952F0D06C3AA55ABF2F3F36FBFFD769557B569D3E6F8F1E3B5B5B51A7F18A244565282E262A9599C830D0301A010919A676E82A900F301DF079C63C7226066035152F18F9A975E7AE9C2850B01D4D6D67EF6D967D75E7B6DA74E9DC40B0E1C3800E0975FE4ADFB8E1C39020D51D320ECA270F6ECD9279E78222B2B2B333353E52500DAB469032070FE1151D271B93076ACD4AC32635C2100CC822D2CF3664379124FA6C27CDA88B16F351CAAAA82EF6D3451B2F18F9A292929A9A9A9003EFBECB39A9A9ABBEFBEDBEF82EDDBB703F8F5AF7F2D7D290D04834EE709EA975F7E79F8E1871F7FFCF1FEFDFB377AB1F4B661A9374414DFA64D5372B363DFC2692352619E86C80630030C2BB112C0868128CE69385A50C0F9B494CC42AED7FCF8E38F01DC75D75DE2C1FAFAFAB2B23200F7DC738F74E4D24B2F8530F45477E8D0A1D1A347DB6C36F5C4ACE2975F7EB9F4D24B8D46A3968B89125665A5326F56C9CDE623FF82CB006997810C0BAC803CBA958D19C3F9B494B4CE2F6A9697971F3F7EFCBAEBAEEBD7AF9F74A47DFBF6D01635F7EDDB3761C284C2C2C2CE9D3B2B078F1E3D5A5F5F1FEA253FFFFCB334F0254A6A59594A73F23C00B0C09A8DECE87CF3B5580BE0B411A397351CB2DBB1624574BE3B51AC091E3595879AD75E7BAD78FCDD77DF05306FDE3CA5785EDBB66D5BB66C595D5DADFE6DF6EDDBF7A73FFDE99D77DE91A2ACC4E3F10C1D3A54E5B1E5B163C7DAB56BA7F127214A4C45454A4D83D1CBF09309005EC7EB5118684AD290361239008A47C16E6D383A7A34A70551720A1E35B76DDB565353E3B79EE4EBAFBF7EE79D77B2B2B2060E1C281EEFD6ADDBCE9D3B55BEC78F3FFE3864C8903E7DFA7CF5D557E7CE9D930EBADDEE2953A674EBD6EDB2CB2E0BFA2A8FC763B7DBBB74E9721E3F0D518271BB919727358F989BADC806000BACEADB4D87DD0B78416A8C592A1CE5B4204A4AC1A3A6949E3D7AF4E88E1D3BA423C78E1D1B316244AF5EBD962E5DEA77F11D77DCF19FFFFCA7A6A626E85B9D3D7B76C48811A3478FB6582CFFF55FFFD5AE5DBBACACACC71E7B2C3D3D7DE3C68DFFFDDFFF1DAA67DF7EFBEDCF3FFF7CC71D775CC04F4594205E78419904F4E0CA73F50600781DAF47B917CA70F33F16DF69415C4E4D49C813CC9D77DE09C0E170646565FDED6F7F9B3B776ED7AE5DFFF297BF9C3D7B36F0E28F3EFA08C0679F7D16F4AD66CC98B178F162A9ED72B994D526B7DF7E7B757575D09748DE7DF7DD66CD9A1D3C7850E51AA580ADFA354471E9D4290F20FDEF9F39BF4AF120C503ABC7AA4B5F0E780E481D309E82D22B4F4E8E2E9D218A3495B01264BBEA9A9A9A2BAEB8223535F5BBEFBE73BBDD1515151E8FA77BF7EE2D5BB60C1577AFBFFEFA61C386FDED6F7F0B3CBB7BF76E31CB5A5F5FBF7DFBF6162D5ADC72CB2DEAE17CE4C891C78F1FFFE0830FD42F9356A704FE1444716FF26465EA6CFA017C9706009FA02CCAE959C5288C7A0FC500FE6B366CCA66D86565C8D0A73F44919392122438CAA7024F7CFCF1C777DF7DF7EF7FFF7BA56C5EA35E7AE9A5975E7AE9D0A143E15A5B79F8F0E1B4B4B4E2E2E2E1C387AB5FC9A84989A9B212E9E9527343CE15838A7E066081751776E9D6235476443A80E66EFCDCA195B1EA240058ADD8A55B97882244256A0679AE293DD49492B41A4D9C38F1D24B2F5DB56AD505752F8837DE78E3B6DB6E6B346412252C61AECD43853F4B8DE83FD114294F37EB0D7826BFE14F87DD8EF2721D7B45146541C2E96F7FFBDBCF3EFBEC9B6FBEB9E1861BB4BFD18A152B6C36DBE79F7F7EC9259734B14F4EA7D362B1BCFFFEFB3D7BF66CF4628E3529010903CDD76DA9136754034885F9200E466DC149500E38BAC10AA0B91B273A5C7E49D52F00879B9480B48E35FFF9CF7F3EF3CC339F7DF61980458B162D58B040A504819FECECECDB6EBB4D2CD17E613C1ECF983163727373B5844CA2C4240C34FF9C272F868E4E3120751658A45241F506D8F21BD68C71B849C9C4279CFEF39FFF3C7AF4E8A5975E5A5F5F2FAD2479E28927B4BF576D6D6DBF7EFD264E9C3872E4C80BEED0F3CF3FBF7BF7EE65CB96357E29008E3529F10803CD125BAFC1332AA4F659D4E91E350194A3BC2FFA0068EE86AB439B8BAB8E011C6E52A239BFD9404DE172B9C68F1FFFD24B2F99CDE6C6AF0EB063C78E254B96E4E7E7376B16B2D49F1F464D4A34A346293B82B53C85D346009805DB0CCCD0B35782F6685F8D2A00CF17DD3C75F47FE4A39C4C4B09247A5133FA183529A10803CD8F6D77DF33E323A97D12A78C88956D0C8A503406A3013477E34C87B686AA9F000E3729A19CDF1C5A22D2CDDCB94AF3B13C79EFF791C8899D9009200B7235F97A03FE95DF30D99E4F37293970AC4914335C2E34D412F9DE36366D86BC19F42ED82DB0E8D7AD206663F62CCC04D0DC8DB31D5253AAAA010E37297170AC49140FF2F39566769E3C09C8026BAC854C008FE011A9516FC0A7F90DEBAAED7656A6A584C7A849141B5C2ECC94EBD49DCA79E07F8DF22C9B67F1AC7E7D0A290D69D212140093B23FF19EE0462894E818358962C3DAB54AF3AD173A29EDA8ED3E7DBE9442453B0D8E6ADB04F96871319C4EDDFA4414798C9A443140D847F35CCE882969AF4AED59B0C5C21ACDA07AA1572AE405662FE7094F80162ED4A7434451C1A8491403366D52F6D1AC78EA36E5B0F2F830061960188FF1523BDFB8F0AC6DBA7C62E64CB85CBA758B28C218358962C0D4A972C36A7D32E35DA96981350D697AF5480B256A02D8F088C97B42C836132518464D22BD391CB0DBA5E62F739E73406ECFC11CFDFAA48909A67E90F7999F91F6367272E413797970BB75EB165124316A12E96D4E4374349B0B06EC510EDF89F3D8AD4F2F5330456A3860FFF1A907E5A35555A8A8D0AD4F4491C4A849A42B974BA93A8BF1E35F372C929A93901B53F580421980014ABB306337ACF272144C9810FC0544718E519348574265836D79BDA5AAE8001EC7E33A75E8FC186098059BD45E8885F5CFFE493EC18A0794A0183589F4E3767BD769E4E4BC677C5F6AA6C21C83F5804219866152A31A559F65FFDA7B62C9127D3A4414498C9A44FAA9A850169C9C9E3A793E0AA4F6744C0FFD9A98A36C550D6081E1EFB0C9434F2E41A184C4A849A41FE5E19FD5FAB1E5A872780446E8D39F0B350EE3A4C67B28768D17D69872090A251C464D229D54562A0B4EF0ECB37321EF116681D50453C857C52431CC6F35ED46A6BC1C052FBEA84F8788228651934827C2633F67F6DD1FA2546AC7FE32CD40E2C2CDA9988A59B3E413763B1C0EBD7A4514098C9A447A70BB951D4E60B32D37AC52CEC4C532CD40E2C24D67AF8E30CB256AF1E69BBAF5892802183589F4B06993B7FDC8238528949A23911317CB340389C17EB96115C63714DB2B28E09C204A248C9A447A100ACF3AD38C4A15BDA7F0946E5D6A1A238C93902BB50B51E88D9AE09C204A288C9A445127CE039A336739962B677AA1973E5D0A07652B5007EC4E133827881212A32651D489CBFF070C781ECF4BCD49C88DD9DD34B51043FE422CE49C204A488C9A44D125D603B2D91C86AF952A7ACA582D4E19605092B40BB110BD7A714E10251E464DA2E812EA0161D8B0D558AD9C89EBF4AC4409FCD5A87218BEE69C204A3C8C9A44D1A5E42DAD56582C0B218F3B67C116D7E959492FF44A853CBE5C8DD53E7382B66ED5A74F4461C5A84914452E174AE56A0678F659071C4A7A56A9811ED70C308C871C291762214C26EFDE61CAB461A278C6A84914458B177BDB59594A7A36BE363951276E81E280C3BBE7B6DD0EA753B76E118509A32651143D2F4F97454E0E8C46253DAB8CCF128005169F24ED00EFB6D5DE695044718B5193285A1C0EEF3CA0A79E4ABCF4ACC227496B3020579E588B850BE176EBD62DA27060D4248A1665F585D98C8C8C844CCF4AFC93B48F3F2E9FA8AA4245856EDD220A07464DA2A870B950206F3A2DCD2C55D2B3F1BE4C33907813B01AAB61B178176E2E58A04F9F88C2845193282AC47517E3C78BE9D9C48B9A007CCA1D00983E5D3E515CCC859B14D7183589A242597791990993692BBC4134018A1B0412CB1D54A21223BCDB56B3983BC535464DA2C813CBB54F990269571000F15F7B3614F156601DD6C1646231774A0C8C9A4491E75BAEDD09A7B2355842A667E15B9356BE4598226F5B0DBB1D9595FA748BA8C918358922CCEDC6CC9972DB6683C190305B83A9F3D9380C4E9F859BE26D04515C61D4248A3071ADC5238F2009D2B312F18660399673E1262506464DA20813CBB5A7A589E9D97B71AF5E9D8A02030C239123B5E51B052EDCA4F8C7A849144962B9F671E3006CC776E5E49DB853974E45CD188C911A0ED85D7071E1262500464DA2481257593CFA2880B9982B7DD50F99461875E954D488B705F2621B2EDCA438C7A8491449CA2A8BCC4C188D2EB83E843CF49C8229215F95288C30F683BCE044BE5D78F451EF69710718A238C1A84914314EA7DF324DB1B841C2A767258F420E931FA2D405178C46E4C80F3B5158A85BB7882E14A32651C4881B630D1800E0037C207D658135E1D3B392FEE8AFB4776227003CF594FC35176E521C62D4248A18256AE6E6C26070C33D1F7201F77118A75BAFA2CB04930556A9BD022B00A097B044950B3729DE306A124586B89B667636800A78D75A8CC088A02F4A48CA2DC27C14B8E1F65FB84914571835892263B5BC7DA6B49B26949116900AB30926BDFA157D833158697F8DAF01DF859B0E871E9D22BA408C9A44112056D11B3F5EFAAF1235C763BC2E9DD24B1AD252212FD394F7E216176E2A9B7513C503464DA208100BDF0C1B0640DC50731886E9D2291D29370ACA5EDCCACD040A0A585D8FE208A3265104AC908795B05A61B140196301A9305B60D1AB5F7A516E14E4ED3621444D80D5F5288E306A12859BCB850279AEAC54450FC2182BD9D2B3929B7093D25E8775006032C12ACFAD65753D8A238C9A44E1B6D55BCA002346C0373DDB0FFD74E994BE826CB709EF2D05ABEB511C61D4240AB7B972A55958AD309920A46791D01B6AAA53367891B7DB847C4B21136F35886218A3265158899B9CCC9923FD5749CF26F6869AEAC40A82F2C62F261332E52AB5DE5B0DA2D8C6A8491456E2262777DE09C009A7929ECD46B62E9D8A05412AB9432ECF0B00A5A54CD2525C60D4240A2BDF4D4E002CC772E564D2A66725CA362F722577C83716326E8142F1805193287C0236398130F92599D3B3929EE8A9B4E54AEE46A33749CB2D50281E306A1285CF72EFB052DAE4C409A703721C4DE6F4AC2448257700B366C90DBB1D4EA70EDD223A1F8C9A44E1A38C96727361304099F60200E88EEEBA742AA6F8577287EF1628E26D07514C62D4240A93CA4A6F7A365B1E562AD35EFA21334936D454276EF6226F02236E81C2242DC53C464DA23011B78AECD50B800BAE0F21AF425126C224B9E049DA869B0CD8EDDC0285621CA3265198F8EE410D65C20B00DF893049AE9124EDEAD5C15E44142B183589C221600F6A0863290BAC49B5A1A6BA20DB6D729F6A8A1F8C9A44E110B0073580F9906BB82BA32B42D0ED36C17DAA296E306A1285C342FF6D231DF0FEE9178BC911826EB729EE53CD242DC530464DA22613D3B3C3E48D24937C434D7541B6DB84B0E32693B414C31835899AECCD37E586D92CED418DA4DF50535D90ED36E1BDE1405515CACBA3DE29224D1835899AC6EDF6EE41DD305A122BB627E7869AEA826FB729266957AC08F63A22FD316A12354D4585B7DD305A62C5F64629F505BDDB6D4248D21614C0EDD6A35F448D60D4246A1A655424A467D742DE2F6C247292BC627B28627D416FDD4125490BDFDB11A29811EB51B3B6B6F6F4E9D37AF7822804313D3B7DBAF45FB124D0188CD1A55FB12FF8769B160BAC72E52026692936A5783C1EF52BCACACAE6CD9B575D5D0DC06C36E7E6E6F6E9D347E3BBBBDDEEB7DF7E7BD5AA55DF7EFBADC964EAD9B3E773CF3D77CD35D704BDF8C081038B162D128FD4D7D76FDFBE7DCD9A35975F7E79C81F20250540A33F055144949743F9381C3902930940094A06639074EC244EB1FC6C2845281A83D152FB2CEAE441F96BAF61D224F98ABA3AA9CA125194A5A4840E8E1E5553A74E6DDEBCF91B6FBC71EEDCB973E7CE2D5CB8B059B366D3A74F577F95E4C891235DBA74F1FB7646A371D5AA5541AF1F372EC84AF0F1E3C7AB7F172D3F0551A4E4E67A000FE0B15ABDC73CB9291EA47860F558555E4A473C47A47FA8140FCA3C650D478FC8FFA480A7AC4CF50D88224525ACA88D350B0B0B9F78E28971E3C68943C0B163C7BEFDF6DB6FBDF5D6638F3DA612A8CF9E3DDBAF5F3F29EC75EEDC79F7EEDDEBD6AD5BBE7C3980CB2EBB6CC78E1D1D3B7614AFAFAAAAEAD4A9D37DF7DDD7AC9937697CC92597D86CB6F4F474956FC4B126E9C6EDC64517C9EDF9F33171220037DC17433E5880F9133151AFDEC5856EE826ED3F3A09B9F330AFE1683779F798DC5CCC9B17FAD54491722163CD5F7EF9A54D9B3600F6ECD9231EFFEAABAF00B46DDBF6C489132A817AFEFCF959595967CF9E150FFEF5AF7F95BEE933CF3CE377FDD4A953478E1CA9F286A1A8FF1444115456E61D151D39221DB37BECCAF8E980E780AEFD8B03368F4DFAB7327BCCDEA3F3E77BFF61EBEAF4EB1D252F95B012F2C4B265CB00A4A7A7079E4A4B4B03F0DE7BEFA97CCB8C8C8C1F7FFCD1EFA0DBED965E7BD75D7789C74F9C38D1A64D1B87C3A1F286A1306A926E323303D3B3C1C3008520DE64D83D76F92893B4A43795B012720EEDDAB56B0174EDDA35F094F4B4F2FDF7DF0FF5DADADADAACAC2CB3B260B941F3E6CDEFBEFB6E00274F9E148F2F5AB4E8F8F1E38F3DF6585E5EDE9A356B8E1F3F1EEA9D896285CB855279A22C8447F22C09745EC45A835BB1556E994CDE99B40B1644BD53446A8247CDBABABA8D1B3702E8D4A953E059E9604949497D7D7DD097B768D1E299679E097AEA924B2E0160553E12405D5DDDABAFBEEAF178B66FDFFECA2BAF0C1B36EC9A6BAEC9CBCB3B71E2C479FE2C4451B475ABB73D6284F45F1B2358B000002000494441549604BA00418A0441B811292E86CB15F54E1185143C6A1E3A74480A5A4167E248078F1F3F5EA554ACD66CEFDEBD00060C18A01CA9A9A9C9C9C9193E7CF84D37C9A5294F9F3EFDCA2BAFF4EDDBF7D0A143E7FBFE445132B76189A1D52A2D38014B025D90E045821A6E4400DF1B1422BD058F9A4A38BCECB2CB02CF2AAB27CF376AFEFCF3CF9F7CF2C90D37DCF0D0430F29075BB56AF5D24B2FAD5CB972F7EEDDBB76ED7AFAE9A75BB56A05C06EB70F1932E4ECD9B3E7F52D88A2414CCF3EFBAC729825812E40F02241629256B941218A01C1A3A6D329DFF15DA44CAC17280795CB345AB264494D4D4D414141F3E6CD835E60B55AF3F3F3CBCACAAEBEFA6A005F7EF965616161D02BFDA4F83AAF5E119D3771F4939525FD9725812E4CF022411092B4A5A54CD252A4690F22C1A3A6D1285733F1045BB0A21C542ED3E2A79F7EB2D96CCF3EFBECBDF7DEAB7EA5D56ADDB66D9B544268CD9A35DABF05519428A39FCC4C347C0ABC9359B80DF5797A148F4A8D0F51EA4643D17626692926058F9AEDDAB5931A3535358167CF9C39E377991693274FEED7AFDFF3CF3FAFE5E20E1D3A3CF7DC7300F6EDDBA7E5FAC049C3449122A667A74C510E7F800FA486055656D13B2FFDD15F6957A0A168BBC9844C790CCA242D459AF620123C6A5E75D5555223680EF6C8912300525252DAB76FAFB143F9F9F9478F1E5DBA74A958FA479D545A4889D044B1421CF7DCE91D53CE875CC67D1C82D486241526982C909F62AE8050B45DB9296192966246F018D6A64D9B6EDDBA21C4504F3AD8A3478FA0738502AD5DBB76FDFAF5AB57AFBEF8E28BB5F74C1AC84AF589886248B0F4AC030EE5FC600C8E7EA7E2DD700C971A3E5153B8296192966244C891DF902143D0B050C48F74F081071ED0F20D3EFCF0C3FCFCFCB56BD74A2B35B593BE4B8F1E3DCEEB55449115223DBB1AABA5462ACC69488B7AB7E2DE30C83B6B56A3CA7B0B623432494BB12664D41C3A7428801D3B76D4D6D68AC76B6A6A76EEDC8986B0AA6EDBB66D3366CC58BB76ADB49844B468D1A283070FAABCF6CB2FBF6CD6ACD9934F3ED9E877218A9E10E9D95558253594D587745E8217090293B414734246CD5B6FBD75D0A041274F9EF4AB9CB766CD1A97CB3564C890EEDDBDABAC4A4A4A860E1DBA7EFD7AF1CA5DBB763DF6D86373E7CE3D71E2C4770287C3515050B07AF5EA0E1D3A00F8F4D34FB76CD9E237EDE8CC993373E6CC993E7D7AEFDEBDC3F383128545B0F4AC134E69E30E306A3641F022414CD252AC51295FFBFDF7DFFFFAD7BFBEFEFAEB8F1D3B261D397AF468A74E9DAEBDF6DA83070F2A979D3B772E35351540BB76EDDC6EB77470CF9E3DEA336C972D5BE6F1784E9D3A25AD8C494B4BDBB871A3F45AA7D33970E0C0DFFFFEF7CABBA9D7D855FF2988C246AC2ABE7EBD72789967995282BCCEC33D3A2E5099A74CF9673CE539E53DA154C9CFCCD4AF77945C54C24A23F166FFFEFDF7DD77DF0D37DCF0E28B2FBEF8E28BD75F7FFD7DF7DD77E0C001BFCB6EBDF55600B7DE7AABF4E5B163C7A4716428AD5BB73E73E68C74F108615556CF9E3D333333FBF6EDBB75EB56ED3F1BA3264589B883D529EF9FF54C4FA6F4B73ED3C33FEB17EE94E7941235D77BBC37259EF5EB83FEB313458E4A5851DB955AF1EDB7DF4ADB6A76EDDAF5FAEBAF0FBCE0ECD9B35F7EF9658F1E3D82D6126AD4BE7DFBEC76FBC993275BB76E6DB158A4DDC434E2AED4143DCA6EC99999D8BC593AE682AB155A4AED75583F1003F5EA5D02E88FFE527DA591C82942917CD4E5424BF95F18EBD76320FF8529E25476A5D614356319A3264589D309E5A183F0B7BB1CE57DD1476A57E38809265D7A97185EC36BB99824B5CFA2CE5BCBB77F7F79EAB270BF4214392A51536BCD01A264B7DCBB9F89384545595F68819521B38946C0FBBCC65B2408BE3369CFB3FC355178316A1269A36C2420CC9E8510359575FA74C14C30A542DECDFE437CE83D21CEA4156F5F88A28E51934803A7537EA20960D62CE5B0030E651B6A659D3E35C5788C971A0BB1D07B542C77A06D1F24A20861D424D2401CDFF4F26E372DAEC717D7E9D305138B047937A98690A4B5DB99A4251D316A1269A08C6F727361F06E37ADACC75756E85313DD849B94F672047F96CC242DE9885193A831627A36DB5BFA87258122C100C348E448EDB558EB3DC1242DC506464DA2C68448CF6EC776A5DD1DDD4161320663A4C687287541A83DAB3C51669296F4C3A849D49810E9D9A5582A35FA2193DB5087D19DF026637D2AB90BB72C4CD2925E183589548548CFBAE17E0FC552FB513C1AFD7E2530238CCA26D51FE003EF098301B90DCF8F99A4259D306A12A95A28AC7F10C63AE21AFCFEE81FCD1E258371182735E6A3C00DB7F78472E3C2242DE9845193489512357DD3B3CA1AFC5498591228EC0663B0D2FE1A5F7B4F30494B7A63D4240ACDE140955CC4404CCF425883AFACCAA7304A439A52246835567B4F30494B7A63D4240A6DB5F0F75A18E554A2922581224DB91D5985553E2798A4255D316A128516223DBB0EEB94B6B82A9FC2A81FFA490D07EC3E4582C424ADF8D499282A1835894210D3B38F3F2E9E114B027977B3A2B0EA056F74DC0C6177303149CBA84951C7A8491482929E359B61F1D69875C1A59404BA17F746BF5F49C200433FC8C5801663B1CF3925495B55058723BAFDA264C7A8491482328E19EF33DF475C772FAEC7A7B09B02B962BB7F912031492B3E7B268A3C464DA260C4F4EC309FF93E2C0914353DD15369EFC44EEF098301369BDC669296A28B5193289810E959B1245016B2A2DFAFA46282492912A4ECFE2D536E6598A4A5E862D4240AE07663E64CB9ED9B9E154B028DC08868762A398945827C4E582C30CB0B3A99A4A56862D4240A50E10D8D7EE95996048A32F1C9B103BE634AE58686495A8A22464DA2002B1A9281BEE959B02450D45960095E2408BE49DAF2F2E8F68B9217A326912FB71B050DC940DFF42C4B02E942D9F1DBBF489098A45DE1FBD49328621835897C89E959DFA8C99240BA50A2A67F912008FF071514C0ED0651E4316A12F952462D562B4C3E4F2E591248176291A0E5F0DDE7E49147BC6DF17687286218358904627A76DC38F10C4B02E9C500C348E448EDB558EB732E2D0D5679690A93B4141D8C9A44824D9BBCED113E0B4B581248476330466AF81709827073C3242D4505A3269160EE5CB911909E9D0BF9144B02459F789B22DEBE00BE3737E24D0F5164306A123570B9505A2AB79F7D563CE386FB43C8A71EC5A351EE171961548A047D800F7CCE994CDE24AD72D34314318C9A440DB60A83982C9F6A796249A0FEE81FB51E91422C12E4866F265649D29696C2E59BBF250A37464DA206CA48253313469F1CAC5204D5022B4B02E942AC5F28DEC400C0A3C2E87FAB6FFE9628DC18358900004EA7373D3B658ADF49A508AA32E2A12833C1A4140952EA1ACA8C4664CA3B7132494B91C6A8490400582E2C04BCD3678AAC58FE94B36775A4543154EA1A7A29373AA5A5703AFDCF12850FA3261100A050AE60809C1CBFF4AC52FE3415660B2C209D28550CAB51E55FC95DBCD159EE5B098128AC18358900A71376B982019E7ACAEF242BB6C708F196C57FFD89D1881CB91282F7068828021835897CB79AEAD54B3CE38453A9D8DE0FFDA2D9290A3409B95243A96EE8A5DCEED8ED4CD252E4306A120951333717069F02B362E153B1202AE942AD92BB78BBC31D372962183529E9391CA8924793C8CEF63BC98AED3145AD92BBC1805C7924CAA84991C3A849496F75C35EC766333232C4334E38958AEDCA2887746480A11FE44526FE95DC21DCF45455C1E1F03F4B140E8C9A94DCDC6ECC9C29B7C7FB4FF6D98EED4ABB3BBA47AD53A4620AE44526412AB9676478F7A9566E8688C28A5193929BB829E3B0617E2759B13D06A955728770EB337326B740A14860D4A4E426EE416DF1598BE9824BA9D8AE8C6F487746189524AD725BE3C57DAA29C218352989B95CA1F6A00637D48C6159906BEB7F8852FF4AEEE23ED50B1644B75F9414183529898995BE7DF7A006B0144BA5860556A667638A5A2577083740C5C5DC0285C28E51939298B8C989EF1ED46EB8DF43B1D466C5F658638249D96E53D98EC64BBC01E21628146E8C9A94AC543739114730E2C8866284DA769B2693770B94A953A3DB2F4A7C8C9A94AC426F72026EA819F31A49D22AB741ACAE47E1C6A849C9EAF9E7E5466EAEDF26276EB8B9A1668C6B24493B6080B7CD2D5028AC18352929A956D1637A362E0CC770A91124492B56D7536E8F88C281519392925845AF977F4D76A667E382B2DD2680AFF1B5FF6956D7A3C860D4A4E4E35745CF779313313DAB8C662806596049855C3F4FD939DC4BACAEF7E69B51EC172538464D4A3E62C918B1948C745248CF8AA3198A41CA3EE1CACEE1BEA71BAAEB1514B0BA1E850BA326259F59B3E486D58AB434BF934A7A3615660B2CA018A6DCD654A3CA818034AC588E7FD3A668758A121CA326251997CBBB4C33A08A1E84A8A98C6328663592A43599BCD5F5E60654AC25BA208C9A9464162FF6B61F7DD4EFA4038E6AC8736B999E8D0B8D2469E7CC911BA5A55CB84961C1A84949A6B0506E6466FA2DD384305E617A365E3492A415EB5770E1268503A3262513870376BBDC569E6E0A94F10AD3B3F1A29124ADD1C8859B145E8C9A944C560B7F55039669323D1BA71A49D272E1268515A326250D7199A6CDE6B74C134CCFC6AD4692B45CB84961C5A84949437599A61B6EA667E35423495AF82EDCE48E9BD4348C9A943454976956A082E9D9F8A5B5DC01B8E3263515A32625077137CD679F0D3CCFE20671AD91242D77DCA4F061D4A4E420AE3AC8CAF23B29D69E657A361E359EA41577DCACAC8C52B72811316A527250561DE4E4042ED364EDD904202669FD370E83EF8E9B4B9644AB5394801835290994977B77D37CEAA9C0F34CCF260031492BDE06C90C06D86C727BE64C1673A70BC6A8494960851C1461362323C3EFA4989E9D8EE9D1EC17859198A4556E837C8813A72B02C22A91368C9A94E85C2E14C84111D3830445715C320223A2D3298A0425493B1F054192B46969DE62EEC12A431169C1A849896EED5A6F7B4490A0B8000BA4860556134CD1E914458238932B489216C2F4691673A70BC5A84989EEC517E54666264CFE41D105D77B2896DAE31064E3308A2326982C904793C193B4E2F4E985C156761235865193125A79B97AB9F6ADF0AE79677A360128B73EF351E042401920B198FBC2859C13441780519312DA0239FB0AB339B05C3B80B990372BEE874CA667138078EB23DE12793DFEB8DCA8AAE29C20BA008C9A94B85C2E14CBD9574C9F1E58AEDD05D787900B064DC11450FC1393B4CA2D910F8B857382A829183529712D5EEC6D3FFA6890F3F05E7027EE0CBC80E2D11CCC911A1FA2344892169C13444DC2A84909CAED56AF0704A0108552A31F328D087201C523F10648BC31F2E29C206A02464D4A501515EAF5802A51E9803C5168166645AB5B14714618FB41AED5AEDC18F95E61649D20BA608C9A94A0264C901B566B603D20004BE02D46DA0B41260A51FC526E831CB057A232C815629DA04D9BA2D0254A188C9A94882A2BBD0B4E82ED0B066123C649C835C07FA210C535F13648BC3DF212EB0471EF303A1F8C9A9488C44D2DB2B303CF97A35CD983FA713C1E7801C535030C9320AFCB0CBE4F358039F2A421EE1D46E7855193128ECB859933E5B6CD16B8E004DCE42409283743D5A82A4779902B060C8059AEF68EB9C1D6A81005C3A84909472C3C3B3EC816D3DC833A1934BE058AC1E0FDF52828802BD81A15A2008C9A9470F2F2E4464E4E60E159009BE09DFDC1A899C0947DDF8257D783EF4DD5E2606B548802306A5262696C036A082563B8C949626BBCBA9EC9849C1CB9FDFCF35C82425A306A5262696CC189134EA58A9E5244861292092665E1E654849828ABDC5AB12C2D69C3A84909E47C169C8055F49280525ED801BB13C18AE765647897A028B75C44A1316A5202116742065B7002DF659AACA297F0066080D20EB90445B9C1E21214D28051931285CB850279666CA80527E232CD6C040FAB9448FC166EBA11ECC96576B67709CAB469D1EA1AC52B464D4A14F9F9DEB6328DD697B84C3303419E7A52E211176E5620D8934B71094A713197A0903A464D4A086EB777F38A103B9CB8E05296692A6B1228E159605176DC5C8005C12F126FB3C4DB2FA2008C9A941056ACF02E3879E185A097AC85B7FA81B8268112DE388C931AEFA138F8C24DA3D1BB0485BBA0902A464D4A08CA58C16A455A5AD04B5EC48B52A31F32B94C33A93C0AEF9EE4C177DC84EFCDD68A60B5848800306A5222102B1BBCFE7AD04B1C707037CDA465847124E4A1E4F3783EF845E22E28219E8B13815193124163950D00BC8937A5462ACCDC4D33093D05B99A41C862EE106EB9AAAA501EE21A4A7A8C9A14E71C8E462B1B88F380C6633C77D34C4219C8508AB9879C13C48A07A401A326C539659744B339546503711E10CBB5272D65E274C83941F0AD78C0E12605C3A849F1ACB212C5C5723B3F3F686503701E1001D0382748AC78B020C49094921BA326C533B1924B5656D04B380F88249AE604190CDEF59AC5C52CB047811835296E399DDE81A6CD16B4B201380F88049AE60489B75F2CB047011835296E2D148A7187582AC079402412E704854C3C188DB0D9E436879B14805193E293CB859933E576E881663EBCD5D1F2C04578E4FD95F810A5C1F70E83EF4D98B8910E11A326C52BB158E8F8E0D362DD702B9B438D440EF705230059F0266043EE1D260E370B0A58CF9D448C9A1487C481664E0E4CC1A7C56EC226655FB0A9981A9DAE518C33C2A8EC1D360B3383EF1D06D673A7901835290E897FC542D46A8710292DB05A608974A7285E4CC114A5BD099B825F643422570EAE983993C34D52306A52BCF11B6886A8D55E8E7265C1C9EB085E9C9692531AD294BDC3D4921053BCC195C34D52306A52BCD136D054664872C10905526EA41CB03BE0087E515A9ACFF6611C6E1200464D8A33DA069A95A8FC10A5523B1FF95C70427E7AA197B204650EE684BC4EBC2DE3709300306A529CD136D09C0BEF6A0171CE2491C400835896B61295C1AFE3709302306A52FCD036D0142B1BCC828D0B4E2828B12CED122C09791D879BE48B5193E287B681262B1B9016461867415E94390B3343EE829296E63399D619A23002258D148FC7A3771F9A2425250540BCFF14D438970B2D5BCAED9C1C141505BDCA0DF7C5B8486A8F444E11825F4604C005572BC8BF54B3609B811921AED3F4BB47892425256470E45893E28458473BF44073055678AF42C8CB88E0BB0B8ADA7093956949C0A849F1A0B21205F2A34AE4E6867AA2E9865B49C98E444E1A825F46A4106FADC4DCBE3FB154103742496E8C9A140F340F3495127ACA9E50442AD290260E374316D8E370931AF0B926C5BCCA4AA4A7CB6D9B0D33423C7C02DAA3BD14352DB0EEC2AEE8F48EE25D252A3B42FE055B8A65A3302AF8752E17AEBB0E55550060B562177FC112199F6B523C1377090EB18F268072942B034D96D023EDC4E1661EF2D4869BCA2C6EBB1DE52136B5A644C7A849B1ADBC1C76B99C2C962D0BB58F2680099820352CB06620230A5DA384A13CDDAC469538A1CC5F7636CC724521FCEE77708788AF94D018352986B9DD9820C74298CDC8CE0E75216BB55353A421AD1F32A5B6DA70D360C05B6FC9EDAA2AAC081D5F2971316A520C5BB1C23BD0CCCF872164395965A0C95AED74619472FF8D0C37070E8455DE2F057979ACB1978418352956B95CDEA798562B468598A3E13BD064AD76BA3019C850B60F531B6E0258BA546E5455B1C65E1262D4A458959F2FCF5784F0772A1871A0998D90595C22754B21FF9A3532DCB4587C4ABA73154A92E1CA138A49E26A13D51A66E528EF8B3E525B6DD9009106A330EA3D144BED933815B2F4BFD38976EDE4766626366F8E4AEF287AB8F284E2CDB871DEF6BC792A1772A04961A4B55490C9E42D7A505A8A929208F78B6208A326C59E921294CA7B4AC36683C914F24294F0892685915FA9A0909569014C9BE65D8532762C57A1240F464D8A316E37C68E95DB66B34ACD4F37DC63215F698195034D0A0BADC34DBF5528A10B3D528261D4A418F3C20BDE49406FBDA5B2DA44AC3AFB3A5EE74093C2C26FB8E944E80D35070E44A6BCCA93D38292076703512C112701A94EB270C3DD011D58759622C109672AE4C93E8DECD22A4E0B6271DA04C2D9401427C492B3AA7BFFBE801758759622C404D32CC8937DDE4371252A435F6AC2FCF972DB6EE786D5C980634D8A194545183D5A6ECF9F8F8913435DE882AB155A4AED468602441744FC1D6B2499E176A34307EF6385234754E6AF51BCE05893629ED3E90D99562B9E7C52E5DA71F0AE4B11E76E10858B11C6A55826B51DB09720F4DA1283019B3679BF0C5DC48A1203A326C506F16FCDD2A52A93802A51A9AC431F899C34A445B86794A4B2919D0A796DC9588C55ABB167B12037576E73F966A263D4A4185054E45DA0999B0B8B45E5DA2C789F7D16A230A2FDA2646680E12DC86B4BAA51F506DE50BB3A3FDFBB7C73D0203843CFBCA538C7E79AA4377116A2D98C830755069A2528198C41529BF5F3280AFAA3FF87906FE9AA71C484D0CF2C1D0EEF76282CB317E7F85C936298989BDDB4492564BAE052CA1AB07E1E458798CF988CC96A97FAE569399F3641316A92AE5E7B4D7B6E761AA629AB4D566225CB1A5014A4216D12E458F81E8ACB51AE76B598A71D3D9A750F121233B4A41FB1A64163B9D94A5476847C31579B5034B9E0BA0ED749776CA9301FC441B53B36314F6BB5E28B2F547EAB296631434BB1C7EDC66F7FEBFD72DB36953F2E6EB8C54940F3A0B60B0A5178196114A705E5214FED6A8BC5A7EE419EEAC51487183549278F3CE25D183E7F3ED2D254AE7D036F287B9B2CC532B519194411301003FB412E393B1F056AD582003CF9A4B73E6D410117A224186668490F6219A0C6661B8AB9590BAC5FE00B3ED1A4E8138BD336FE7B28CE0C070B06C51F6668299654567A43A6D98C356B54AEF5CBCDAEC55A864CD2850926B15A5023CB374D26949579BFCCCCE4069C09835193A2CBE5F2799CB972258C4695CBC5DC6C01E6B31210E9281BD916C8337D7231C90187DAD51919B0C925E061B7E3914722DC3B8A12666829BAFAF7F72E35B1D9306386CAB5CCCD52AC117F271B9F4FEB76E3FEFBBDBFF0AA7B12504C61869662C3ECD9DEBF209999EA21D30DF76FE11D9532374BB1200D694A9EB6F1F9B406038A8ABC2B38274D42B9EA724F8A071C6B52B4949460905C0CAFD1D5990046619452A5BD00F3278237E9142BC4327BEBB07E2006AA5D2DAEE0046706C50795B126A32645457939FAF4F17ED9D81F8E22148D813C63A81F323783253D298638E1B4C2AA54AA6AA43E2D026E19ED7606CE18C70C2DE9CAE9C4EF7EE7FDB2AC4CFD4F46252A9590990AF31AA84DB2258A3E134C2BB152F93213996AFB88011838D03B33A8AA0AA346714A6DFC62D4A408733A61B5FA1434C8C850B9DC0597F83873133619A136C996481719C850EAD33A606FE40127801933BCA50F4A4B71FFFD0C9C718A519322C9E5F20999369BFA1C4237DC433154497CCD82CD02B57AEE443ACA47BE5830A8F1DAC81B36F8074E8A437CAE4911E337ED5EC38E83B3317B16664A6D3ECEA4D8E7F780F3139465402D9502970BD75DE7731FA93A939CF4C2D9401475812173C306F549B3AFE1B55C4C92DA8DAF84238A0D0E38BA35943E4885D90E7B233383FC9E593070C624CE06A2E83AFF90598E723164DA6167C8A4B86081455CC16985D509A7DA0B4C26D8EDDE459C336762F6EC08F791C2895193C2ED8242665F78D7A5ACC44AEE6A4271641446CD823C45B61A558D4FA965E08C67CCD05258399D1835EABC42A698E0829627434431492C7DD00F991BB0A1917C895FAA56C38785A286195A8A0AE9AFC0F9844C279C033040F972166C0C9914A736608332A5F64394DE8FFBCF6FC4C9E52871825193C2A4BCFC7C6F9C2B5129CE3F9C05DB0C705A04C52B030C1BB041D914E50203678F1E70AA3E1625BD31434BE120160CC3853CCB64C8A4C4E0B716E54252B56633B66D435A5A643B4AAA98A1A5489A3DDB2764DA6CD8BC992193929309263BECA990878F5A479C070F7A0B205455213D1D252511EE295D208E35A9095C2E0C1DEA7D90094D3B0896A06430BC51962193128FDF8853D33A4EB71B8F3C82E262EF91DC5CE4E7737E902E38D6A408703870DD753E21B3ACACD190391BB3193229E19960DA8BBDCAE420691DA7030EB5D7489B712A45DE011414F031670CE25893CE9FDB8D37DEC0A449DE231A9EC4B8E1BE1FF72B53F3A1656342A2787681BFF3E5E5F8DDEFBC8F3901AC5F8F81FCA44415C79A143E9595E8D1C32764E6E4E0E041F590E984B3033A887F3E3E4119432625366956ADB2350A80C1183419931B79CC999101BBDDFB9813C0A04118350A2E57C47A4AE78151933473BBF1DA6B484F87DDEE3DB86C198A8AD41FBD14A12815EDC4673CFB7180EB32291918609887794AE52000F351703FEE6FBCEADE860D3ED9DAE2625C771DA708C5026668499BCA4A6465F9C44BAB156BD7AA0F315D708DC3B8F7E09DE0D00F996BB0865B6652B22947F9EFF03BE5DE11C0522C1B85518DBD2C205B9B938379F3D4F775A7A66386969A402A92E737C49C3F1F5F7CA11E324B50721DAE1343E62CD8366003432625A10C64D861B708C523C760F4288C724135EF9A9181BD7B9193E33D525C8C76EDF0DA6BAC22A4178E352934970BF9F99839D3E7E0050D315361DE844DDC629A929C1BEE3CE4CD47817850D3A0B3A40463C7FA0C3ACD66E4E76354632FA40BC2FD35E93CB9DD58B10279793E9F5200CB96213B5BE529A61BEE15583106A3C58323915388420E3189240E3806608098ADB5C0BA144B1BB9AD74BB919787029F880BAB15AFBF8E0CCE12083366684933970BB367E3A28B307AB44FC8B4D970EA14468D520999E528EF800E62C84C85791DD617A1882193486181652FF68A736B1DB0778375144655A232E4CB0C06CC9B8703077CA6D7DAEDE8D307DDBAA1BC9C39DBE8E058931A389D58B8D03F1F0B2027072FBCA09E922D47F9044C70C02E1E9C84DC17F002E325512881834E002391330FF31A2924545E8E09137CA61AA02167AB9A0D228D98A1A5D0DC6E6CDA84B9737DAAFC487272F0D4532AC91F37DC15A8088C971658D7626D1AD222D05DA284223DD4C8439E5FEC9C84DC2998A2F6210AF5180580CD86471E61FDF7A660D4A4601C0EAC5E1D647089C6C7972EB8D6626DE0473D15E6B7F016CB17109D17175CF9C89F05FF0F633F64CEC22CB5C5CD6E372A2A828C3B0158AD98330777DE0923F33DE72D3EA2665959D9BC79F3AAABAB0198CDE6DCDCDC3E7DFA34FA2A46CDF32605CB850B83DCA202C8CDC594292AF1D29864822400000E154944415401C79B78D36F1220805498F3919F8DEC46364522A21042C5CE5498C763FC788C574BDB06CDD94A323331650AC3E77951899AF0C486A953A7366FDEFC8D37DE3877EEDCB973E7162E5CD8AC59B3E9D3A737FAC298FA2962D7A9539EB2328FCDE6319B3D4090FF59AD9E65CB3CA74E857A83239E23F33DF3CD1E738A077EFFB37AACCB3CCBEA3C75D1FC818812D529CF299BC716F841933E6BEB3DEB4F79427E4E3D070E786CB6E09F71C09399E959B6CC73E448147F9A78A512566222DE2C5AB408C0B871E3C4838F3DF61880B7DE7A4BFDB58C9A21D5D579EC76CFFCF91EAB35E4A708F0D86C9E030782BF81A7CEEEB1DB3C36ABC71AF4339CE9C92CF39445F7A7224A0AA73CA796799605BD4F953E7AF33DF30F780E047F715D9D67FD7AB50FBED9ECC9CDF5AC5FAF72A39CE454C28AFE19DA13274EA4A7A71F3B766CCF9E3D37DE78A3727CF7EEDD5DBB766DDBB6EDFEFDFB5BB56A15EAE5CCD0FAA8ACC4EEDDF8FC73AC5A153C5723319B317E3C860DC34D37054EB7AB44E5A7F8741DD689650A449AF24544140EE5285F811581CF4424A9306723FB5EDCDB133D837C1E9D4E6CDE8CC58B83CCF55398CDB8FB6E0C1E8CDEBD71CD359C7F2B89E9E79A454545A3478F4E4F4FDFBF7FBFDFA9F4F4F4CACACAF7DE7B6FC48811A15E9ED451D3E94455151C0E545460F76EB50F86C46AC5F0E118360C169FC5D44E38FF0FFFB7033B3EC5A7A122A5641272B391DD0BBDF8F0321E25F58725CEB9E0DA8AAD733157DC3828D048E40CC6600B2C1DD1D167D197CB85AD5B834F95F763B5E2AEBBD0AB172C1698CD495BF036A6A3E688112356AC583178F0E0F7DF7FDFEFD4A041834A4A4A468F1EBD74E9D2502F4F8A3F046E377EF801274FC2E1C0B163F8F4537CF595DA50526436233B1BF7DE2BCD0570C2E982EB100E7D87EF2A50B11BBBD53F8468B89965B04C0049F161497452F85C8AA5EA37B89291C8E98CCED7E13A0B2CADD02A0D6970BBF1F5D7D8BA1585855AFF8658ADE8DA15BD7BA34D1B582C68D52A1986A4B11B35EBEAEADAB66D7BE2C489C99327BFFAEAAB7E67737373E7CF9FDFBA756BA7D3D9BC79F3A0EF90087F089C4E79E73C292E02726804F0D147C167BAAA3A6EED7070F86F8EDDD6716FCFD65B4CF2F6F15A3E63A27EC8CC42D6600CE6B2CB8491081F166AE086FB6B7CBD155BD7626DA3F7BEA291C801D0199D6F745DD372FF91B4ADDF5DFBE9A196C5FE8396C649A95D400EA800AEBD16575F2D9F8DF3D5A2B11B352B2B2BD3D3D301BCFAEAAB93274FF63B3B77EEDCA79F7E1AC00F3FFC70B5F27F862FE90FC1C1039F44B8A7B2366873292E0D7E4E8979812A2AE07402388553009A3B8F5D525A1EC65E15E7604F677C7E1B7677C10FD7A0FE82EE022DB07645D7C118DC1BBD19291312A366A29222A8038E7558F7113EF25B45AD515B277A6E47C7FDE8FD2972CEEF1EBB1167AD9DCF76BD5E3C72CE74E565BDFAABBDE68A2BD0A54BD033A771FA188E85B17B417548EF1BEA93A2F328BBAA612075D96597059EBDFCF2CB95CB42454DC935E97DC3DEB74868D9E47728CD84D384758301E0D3DE709A70FA829660A5C27C37EEEE8DDE6DD0A6377A5F836B987D258A5306182CB0586091F64E71C1B51FFB1D7054A0C209A7C63CD34F266C1808000B266274112E75C1E44497DDB8E2670C5E07931399E731A0F571B17DCFC5F63D0187FF7161EF7629420D5CA244E73F944EA7BCA1F945175D14785639A85C164A4A78BB15CBA45FDC26DF0956A1AA18C5C54D7F238A37D28893489D0B7041AE255FA46F57628CCE7B9E181B6A55041D0B2B078DA14B5A30DD44444451A3F358B35DBB7652A3A6A626F0EC993367FC2E0B8A81938888A243E7B1E655575D253582E6608F1C3902202525A57DFBF651ED16111151303A47CD366DDA74EBD60DC0BE7DFB02CF4A077BF4E81174AE1011115194E91C35010C193204C0DEBD7B034F49071F78E08168F78988882818FDA3E6D0A14301ECD8B1A3B6B6563C5E5353B373E74E348455222222DDE91F356FBDF5D64183069D3C79D2AFA2DE9A356B5C2ED7902143BA77EFAE57DF88888844FAD7A10570F0E0C13E7DFAB468D1A2A2A2A275EBD6008E1D3BF69BDFFCC6ED769795955D73CD357A77908888088891A809E0C0810313264CD8BF7FFFD8B16301BCF9E69B9D3A755AB870615A9C17332422A244122B5153F2EDB7DF7EF5D55700BA76ED7AFDF5D7377A3D11115134C556D42422228A65FACF062222228A178C9A4444445A2560D43C762CE25BAF111151F210C34A1C6FA9585F5F3F6BD62CB7DBAD1CF1783C7BF6ECC9CDCDBDE79E7B74EC18514C3977EEDCBBEFBE5B5C5C5C5B5BEB76BB6FBEF9E6679F7D96B3D389822A2C2CDCBF7FBF78E4A79F7EEAD8B1E3D4A953A52FE37836505151D1E8D1A3FD0EDE74D34DBB77EFD6A53F4431E8CC99330F3CF0C0CE9D3BFFF5AF7FF5EEDDBBB6B6F6C9279F2C2E2E5EB56AD5A04183F4EE1D516CF9FEFBEF3B75EA240EC600180C86CACACAABAFBE5AFA328EA3E62DB7DC72C51557B46DDB5639929292F2C4134F646666EAD82BA298327AF4E8A2A2A265CB968D1A354A3AE276BBBB76EDFADD77DF7DF9E5975DBA74D1B77B4431E5FFFDBFFF575A5A7AD34D378907EFB8E38E499326295FC66BD4DCB469D3E38F3FBE6FDFBE8B2EBA48EFBE10C5A8B2B2B2BE7DFBB66FDFFED0A143292929CAF1D75F7FFDA9A79E1A3060C0071F7CA063F78862CAB163C7D2D2D22A2A2AFCA2A69F789D0DF4E28B2F4E9D3A95219348C592254B00DC7FFFFD62C80420E566376FDE5C5555A54FCF8862CF82050BEEBFFF7EF59089388D9A5F7CF1C5962D5B5E79E595C71F7FFC9D77DEF9EEBBEFF4EE1151CCF1783CD28E088169D86BAFBDD668347A3C9E75EBD6E9D13552535757F7D1471FFDE73FFF110F3A1C8E38CD0BC68B3367CECC9F3FFFA38F3E7AE8A1870A0A0A76ECD811F2524F1CCACECE167F84949494071F7CF09B6FBED1BB5F4431A4A2A242FA80AC5EBD3AF0ACC56201F0C0030F44BF63A4E2EBAFBFBEF6DA6BA5FFE36C369B74F0BBEFBE7BF0C107F5ED58C27BFDF5D7FD82638F1E3D3EF8E083C02B9BCF9A352B7CD13A4A0E1E3CD8AE5DBB4B2EB9A4AAAACAE3F100F8FAEBAF972D5BD6BB776FE5178E28C96DDEBC79EDDAB500A64E9D6A369BFDCE6EDCB8F19B6FBE3977EE5C6E6EAE1EBDA3204E9F3EDDA74F9F1B6FBC71F8F0E12D5BB65CBE7CF9F7DF7F7FF8F0E1193366BCFDF6DB975D7699DE1D4C643FFEF863CB962DAFB8E20AA7D379F6EC59E948515151EBD6AD7BF5EAE57369D4237A381D3E7CF8A5975E4A4F4F977E96CB2EBB6CEFDEBD7A778A2826CC993347FA5CECDFBF3FF0ECC30F3F0CA065CB96D1EF1885B278F1E2575F7D55F9B2B6B676CB962D56AB75DBB66D3AF62AD99C3A756AC992251919194A945CB1628578415C3ED754B46FDFFE99679EF9E28B2FFAF6ED0BE0C48913CF3DF79CDE9D228A094EA7536A049D34271D3C75EA544D4D4D54BB45A18D193366F2E4C9CA97068361D5AA55F9F9F9B7DF7EBB8EBD4A3646A3F1E1871FFEF7BFFFADA461A64C99228D3E25FA47CD73E7CED56BE309F130BC75EBD69B376F1E3060008075EBD6F92D50254A4E46A3516A04FDE048079B376FDEA2458BA8768B423318BCC5DACE9E3DFBC4134F6465657101BA2E9A356B366FDEBC993367023874E8D0F6EDDBBDA7F4EB956CF4E8D1066D0A0A0A42BD498B162DF2F3F301D4D4D41C3E7C388ADD278A51EDDAB5931A41479367CE9C01603299FC16A5502CF8E5975F1E7EF8E1C71F7FBC7FFFFE7AF725A94D9B36EDAAABAE02B06FDF3EE5A0FE7568AFBAEAAACE9D3B6BB9B275EBD62A676FBEF9E6D4D4D4EAEA6AE9CF015192933EED009C4E67E01EEF478E1C11AFA1D871E8D0A13FFEF18F2FBFFCB2C63F8C1439175F7C71DFBE7D972F5F2E8615FDA3667E7EBE344C6CBA76EDDA555757B769D3262CEF4614D7EEBCF3CEE6CD9BD7D7D7EFDBB7AF77EFDE7E67A57B67EE73106BF6EDDBF7F4D34F171616B66FDF5E3978F4E8D12BAEB8A279F3E63A762C6949391B31ACE89FA10D178FC7B37FFFFE5FFFFAD7269349EFBE10E9EFCA2BAF9482E5DEBD7BFD4ED5D6D61E3C7810C0030F3CA043CF28847DFBF6FDE94F7F7AE79D77C490E9F178860E1DEA72B974EC5832933E3E3D7AF4508E244ED4FCE69B6F5C2ED7F8F1E3F5EE0851AC183A7428806DDBB6F91DFFDFFFFDDF73E7CE5D79E595E2F47AD2D78F3FFE3864C8903E7DFA7CF5D557E7CE9D930EBADDEE2953A674EBD68D8B3575515F5F6FB7DBEFBDF7DE8E1D3B2A07E3AF7AFBBE7DFB76EFDEDDBB77EF2BAFBC523CFED0430F399DCE2D5BB6346B9638B702444D71F2E4C91B6EB8E1E8D1A3DF7DF79D387C79F2C927FFFEF7BFBFF2CA2B53A64CD1B17BA4387BF66C6666E67DF7DD77DB6DB7FDCFFFFC8FDD6ECFC8C8B8F2CA2B376FDE6C341AB76DDBA63EAB839AE8F8F1E31F7DF451F7EEDDC5E80860C18205369BCD6EB7FBD40989FE1AD226FACD6F7E03A065CB9673E7CE9596A3D4D5D54D9D3AB557AF5E3FFCF083DEBD238A2D1F7CF0C1C5175F9C9D9D2D7D583C1ECFE79F7F6E3018EEBDF7DEBABA3A7DFB468A1933662C5EBC586ABB5C2E65B5C9EDB7DF5E5D5DAD6BD792C29FFFFC6734EC35F9CB2FBF4807DF7BEFBDCE9D3B7FFCF1C77E17C7DF58F3B5D75E9B32658AB428333D3DBD4B972E870F1F9E3061C2D8B16339879E28D0962D5B264E9C78D555570D1B36EC871F7E58B468514E4ECECB2FBFFCAB5FFD4AEFAE916CF7EEDD6291FDFAFAFAEDDBB7B768D1E2965B6ED1B157C9E3D34F3F7DE081078E1D3B06A04D9B36BD7BF73E7CF8F03DF7DC3373E6CC962D5BFA5D1C7F5113C0D1A3473FFBECB3A3478FB66CD9B263C78EDDBA7563BC2452515F5FBF6BD7AE6FBFFDB675EBD6DDBA754B4D4DD5BB4744B1A5A6A666DBB66D870F1F36180C575F7D75CF9E3D43150089CBA8494444A40B4E9C212222D28A51938888482B464D222222AD1835898888B462D4242222D28A51938888482B464D222222AD1835898888B4FAFF7A486F5F06F84ED80000000049454E44AE426082>|png>|.3par|||>>
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
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|11.1|<tuple|1.1|1>>
    <associate|11.15|<tuple|1.4|?>>
    <associate|11.5|<tuple|1.2|3>>
    <associate|11.6|<tuple|1.3|3>>
    <associate|11.8|<tuple|1.4|?>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1.1.3|?>>
    <associate|auto-11|<tuple|1.6|?>>
    <associate|auto-12|<tuple|1.7|?>>
    <associate|auto-13|<tuple|1.1.4|?>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.1|3>>
    <associate|auto-4|<tuple|1.1.1|3>>
    <associate|auto-5|<tuple|1.2|3>>
    <associate|auto-6|<tuple|1.3|4>>
    <associate|auto-7|<tuple|1.1.2|?>>
    <associate|auto-8|<tuple|1.4|?>>
    <associate|auto-9|<tuple|1.5|?>>
    <associate|fig11.1|<tuple|1.1|1>>
    <associate|fig11.2|<tuple|1.2|3>>
    <associate|fig11.3|<tuple|1.3|4>>
    <associate|fig11.4|<tuple|1.4|?>>
    <associate|fig11.5|<tuple|1.5|?>>
    <associate|fig11.7|<tuple|1.7|?>>
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
    </associate>
  </collection>
</auxiliary>