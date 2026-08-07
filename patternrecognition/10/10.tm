<TeXmacs|2.1.1>

<style|<tuple|beamer|manila-paper>>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <doc-data|<doc-title|Approximate Inference>>
  </hidden>|<\hidden>
    <tit|evaluation of the posterior distribution>

    \;

    A central task in the application of probabilistic models is the
    evaluation of the posterior distribution <math|p(Z\|X)> of the latent
    variables <math|Z> given the observed (visible) data variables <math|X>,
    and the evaluation of expectations computed with respect to this
    distribution.\ 

    The model might also contain some deterministic parameters, which we will
    leave implicit for the moment, or it may be a fully Bayesian model in
    which any unknown parameters are given prior distributions and are
    absorbed into the set of latent variables denoted by the vector <math|Z>.

    For instance, in the EM algorithm we need to evaluate the expectation of
    the complete-data log likelihood with respect to the posterior
    distribution of the latent variables.\ 

    \;
  </hidden>|<\hidden>
    <tit|infeasible to evaluate in practice>

    \;

    For many models of practical interest, it will be infeasible to evaluate
    the posterior distribution or indeed to compute expectations with respect
    to this distribution. This could be because the dimensionality of the
    latent space is too high to work with directly or because the posterior
    distribution has a highly complex form for which expectations are not
    analytically tractable.

    In the case of continuous variables, the required integrations may not
    have closed-form analytical solutions, while the dimensionality of the
    space and the complexity of the integrand may prohibit numerical
    integration.\ 

    For discrete variables, the marginalizations involve summing over all
    possible configurations of the hidden variables, and though this is
    always possible in principle, we often find in practice that there may be
    exponentially many hidden states so that exact calculation is
    prohibitively expensive.
  </hidden>|<\hidden>
    <tit|stochastic or deterministic approximations>

    In such situations, we need to resort to approximation schemes, and these
    fall broadly into two classes, according to whether they rely on
    stochastic or deterministic approximations.\ 

    Stochastic techniques such as Markov chain Monte Carlo, de- scribed in
    Chapter 11, have enabled the widespread use of Bayesian methods across
    many domains.\ 

    They generally have the property that given infinite computational
    resource, they can generate exact results, and the approximation arises
    from the use of a finite amount of processor time.

    In practice, sampling methods can be computationally demanding, often
    limiting their use to small-scale problems. Also, it can be difficult to
    know whether a sampling scheme is generating independent samples from the
    required distribution.\ 

    \;
  </hidden>|<\hidden>
    <tit|variational inference>

    In this chapter, we introduce a range of deterministic approximation
    schemes, some of which scale well to large applications. These are based
    on analytical approximations to the posterior distribution, for example
    by assuming that it factorizes in a particular way or that it has a
    specific parametric form such as a Gaussian. As such, they can never
    generate exact results, and so their strengths and weaknesses are
    complementary to those of sampling methods.\ 

    In Section 4.4, we discussed the Laplace approximation, which is based on
    a local Gaussian approximation to a mode (i.e., a maximum) of the
    distribution. Here we turn to a family of approximation techniques called
    <strong|variational inference> or <strong|variational Bayes>, which use
    more global criteria and which have been widely applied. We conclude with
    a brief introduction to an alternative variational framework known as
    expectation propagation.
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|Variational Inference>
    </padded-center>

    \;

    \;

    \;

    \;
  </hidden>|<\hidden>
    <tit|Variational methods>

    Variational methods have their origins in the 18'th century with the work
    of Euler, Lagrange, and others on the calculus of variations. Standard
    calculus is concerned with finding derivatives of functions. We can think
    of a function as a mapping that takes the value of a variable as the
    input and returns the value of the function as the output. The derivative
    of the function then describes how the output value varies as we make
    infinitesimal changes to the input value.

    Similarly, we can define a functional as a mapping that takes a function
    as the input and that returns the value of the functional as the output.
    An example would be the entropy <math|H[p]>, which takes a probability
    distribution <math|p(x)> as the input and returns the quantity\ 

    <\equation*>
      H[p] = <big|int>p(x) ln p(x) \<mathd\>x
    </equation*>

    as the output.
  </hidden>|<\hidden>
    \;

    \;

    We can the introduce the concept of a functional derivative, which
    expresses how the value of the functional changes in response to
    infinitesimal changes to the input function (Feynman et al., 1964).\ 

    The rules for the calculus of variations mirror those of standard
    calculus and are discussed in Appendix D. Many problems can be expressed
    in terms of an optimization problem in which the quantity being optimized
    is a functional. The solution is obtained by exploring all possible input
    functions to find the one that maximizes, or minimizes, the functional.\ 

    Variational methods have broad applicability and include such areas as
    finite element methods (Kapur, 1989) and maximum entropy (Schwarz, 1988).
  </hidden>|<\hidden>
    <tit|factorization assumption>

    \;

    \;

    Although there is nothing intrinsically approximate about variational
    methods, they do naturally lend themselves to finding approximate
    solutions.\ 

    This is done by restricting the range of functions over which the
    optimization is performed, for instance by considering only quadratic
    functions or by considering functions composed of a linear combination of
    fixed basis functions in which only the coefficients of the linear
    combination can vary.\ 

    In the case of applications to probabilistic inference, the restriction
    may for example take the form of factorization assumptions (Jordan et
    al., 1999; Jaakkola, 2001).
  </hidden>|<\shown>
    <tit|more detail <text-dots>>

    Now let us consider in more detail how the concept of variational
    optimization can be applied to the inference problem.\ 

    Suppose we have a fully Bayesian model in which all parameters are given
    prior distributions.\ 

    The model may also have latent variables as well as parameters, and we
    shall denote the set of all latent variables and parameters by <math|Z>.\ 

    Similarly, we denote the set of all observed variables by <math|X>.\ 

    For example, we might have a set of <math|N> independent, identically
    distributed data, for which <math|X =
    {\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>}> and <math|Z =
    {\<b-z\><rsub|1>,\<cdots\>,\<b-z\><rsub|N>}>.
  </shown>|<\hidden>
    \;

    \;

    Our probabilistic model specifies the joint distribution <math|p(X,Z)>,
    and our goal is to find an approximation for the posterior distribution
    <math|p(Z\|X)> as well as for the model evidence <math|p(X)>. As in our
    discussion of EM, we can decompose the log marginal probability using\ 

    <\equation*>
      ln p<around*|(|X|)>=\<cal-L\><around*|(|q|)>+KL<around*|(|q\<\|\|\>p|)>
    </equation*>

    where we have defined

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-L\><around*|(|q|)>>|<cell|=>|<cell|<big|int>q<around*|(|Z|)>ln<around*|{|<frac|p<around*|(|X,Z|)>|q<around*|(|Z|)>>|}>\<mathd\>Z>>|<row|<cell|KL<around*|(|q\<\|\|\>p|)>>|<cell|=>|<cell|-<big|int>q<around*|(|Z|)>ln<around*|{|<frac|p<around*|(|Z\|X|)>|q<around*|(|Z|)>>|}>\<mathd\>Z>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    This differs from our discussion of EM only in that the parameter vector
    \<theta\> no longer appears, because the parameters are now stochastic
    variables and are absorbed into Z. Since in this chapter we will mainly
    be interested in continuous variables we have used integrations rather
    than summations in formulating this decomposition. How- ever, the
    analysis goes through unchanged if some or all of the variables are
    discrete simply by replacing the integrations with summations as
    required. As before, we can maximize the lower bound L(q) by optimization
    with respect to the distribution q(Z), which is equivalent to minimizing
    the KL divergence. If we allow any possible choice for q(Z), then the
    maximum of the lower bound occurs when the KL diver- gence vanishes,
    which occurs when q(Z) equals the posterior distribution p(Z\|X).
    However, we shall suppose the model is such that working with the true
    posterior distribution is intractable.
  </hidden>|<\hidden>
    We therefore consider instead a restricted family of distributions q(Z)
    and then seek the member of this family for which the KL divergence is
    minimized. Our goal is to restrict the family sufficiently that they
    comprise only tractable distributions, while at the same time allowing
    the family to be sufficiently rich and flexible that it can provide a
    good approximation to the true posterior distribution. It is important to
    emphasize that the restriction is imposed purely to achieve tractability,
    and that sub- ject to this requirement we should use as rich a family of
    approximating distributions as possible. In particular, there is no
    `over-fitting' associated with highly flexible dis- tributions. Using
    more flexible approximations simply allows us to approach the true
    posterior distribution more closely.\ 

    One way to restrict the family of approximating distributions is to use a
    paramet- ric distribution q(Z\|\<omega\>) governed by a set of parameters
    \<omega\>. The lower bound L(q) then becomes a function of \<omega\>, and
    we can exploit standard nonlinear optimization techniques to determine
    the optimal values for the parameters. An example of this approach, in
    which the variational distribution is a Gaussian and we have optimized
    with respect to its mean and variance, is shown in Figure
    <reference|fig10.1>.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_10_1_variational_approximation_example.png|0.93par|||>|<label|fig10.1>Illustration
      of the variational approximation for the example considered earlier in
      Figure 4.14. The left-hand plot shows the original distribution
      (yellow) along with the Laplace (red) and variational (green)
      approximations, and the right-hand plot shows the negative logarithms
      of the corresponding curves.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|<subsection|Factorized distributions>>

    Here we consider an alternative way in which to restrict the family of
    distri- butions q(Z). Suppose we partition the elements of Z into
    disjoint groups that we denote by Zi where i = 1, . . . , M . We then
    assume that the q distribution factorizes with respect to these groups,
    so that

    <\equation*>
      q<around*|(|Z|)>=<big|prod><rsub|i=1><rsup|M>q<rsub|i><around*|(|Z<rsub|i>|)>
    </equation*>

    It should be emphasized that we are making no further assumptions about
    the distri- bution. In particular, we place no restriction on the
    functional forms of the individual factors qi(Zi). This factorized form
    of variational inference corresponds to an ap- proximation framework
    developed in physics called mean field theory (Parisi, 1988).
  </hidden>|<\hidden>
    Amongst all distributions q(Z) having the form (10.5), we now seek that
    distri- bution for which the lower bound L(q) is largest. We therefore
    wish to make a free form (variational) optimization of L(q) with respect
    to all of the distributions qi(Zi), which we do by optimizing with
    respect to each of the factors in turn. To achieve this, we first
    substitute (10.5) into (10.3) and then dissect out the dependence on one
    of the factors qj (Zj ). Denoting qj (Zj ) by simply qj to keep the
    notation uncluttered, we then obtain
  </hidden>>
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
    <associate|auto-1|<tuple|1|?|../../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-2|<tuple|1|?|../../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-3|<tuple|1.1|?|../../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|fig10.1|<tuple|1|?|../../../../.TeXmacs/texts/scratch/no_name_18.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||Illustration of the
      variational approximation for the example considered earlier in Figure
      4.14. The left-hand plot shows the original distribution (yellow) along
      with the Laplace (red) and variational (green) approximations, and the
      right-hand plot shows the negative logarithms of the corresponding
      curves.>|<pageref|auto-2>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Variational
      Inference> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Factorized distributions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>
    </associate>
  </collection>
</auxiliary>