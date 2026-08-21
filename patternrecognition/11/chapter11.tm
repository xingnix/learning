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
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|11.1|<tuple|1.1|1>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.1|2>>
    <associate|fig11.1|<tuple|1.1|1>>
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