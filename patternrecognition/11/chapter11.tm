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

  <\equation*>
    p<around*|(|y|)>=<frac|1|\<pi\>><frac|1|1+y<rsup|2>>
  </equation*>

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
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|11.1|<tuple|1.1|1>>
    <associate|11.2|<tuple|1.2|?>>
    <associate|11.5|<tuple|1.2|?>>
    <associate|11.6|<tuple|1.3|?>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.1|2>>
    <associate|auto-4|<tuple|1.1.1|?>>
    <associate|auto-5|<tuple|1.2|?>>
    <associate|auto-6|<tuple|1.3|?>>
    <associate|fig11.1|<tuple|1.1|1>>
    <associate|fig11.2|<tuple|1.2|?>>
    <associate|fig11.3|<tuple|1.3|?>>
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
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Sampling
      Methods> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      1.1<space|2spc>Basic Sampling Algorithms
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>
    </associate>
  </collection>
</auxiliary>