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
  </hidden>|<\hidden>
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
  </hidden>|<\hidden>
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
      <tformat|<table|<row|<cell|\<cal-L\><around*|(|q|)>>|<cell|=>|<cell|<big|int>q<around*|(|Z|)>ln<around*|{|<frac|p<around*|(|X,Z|)>|q<around*|(|Z|)>>|}>\<mathd\>Z<eq-number><label|10.3>>>|<row|<cell|KL<around*|(|q\<\|\|\>p|)>>|<cell|=>|<cell|-<big|int>q<around*|(|Z|)>ln<around*|{|<frac|p<around*|(|Z\|X|)>|q<around*|(|Z|)>>|}>\<mathd\>Z>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    This differs from our discussion of EM only in that the parameter vector
    <math|\<theta\>> no longer appears, because the parameters are now
    stochastic variables and are absorbed into <math|Z>. Since in this
    chapter we will mainly be interested in continuous variables we have used
    integrations rather than summations in formulating this decomposition.\ 

    However, the analysis goes through unchanged if some or all of the
    variables are discrete simply by replacing the integrations with
    summations as required. As before, we can maximize the lower bound
    <math|\<cal-L\>(q)> by optimization with respect to the distribution
    <math|q(Z)>, which is equivalent to minimizing the KL divergence.\ 

    If we allow any possible choice for <math|q(Z)>, then the maximum of the
    lower bound occurs when the KL divergence vanishes, which occurs when
    <math|q(Z)> equals the posterior distribution <math|p(Z\|X)>. However, we
    shall suppose the model is such that working with the true posterior
    distribution is intractable.
  </hidden>|<\hidden>
    We therefore consider instead a restricted family of distributions
    <math|q(Z)> and then seek the member of this family for which the KL
    divergence is minimized. Our goal is to restrict the family sufficiently
    that they comprise only tractable distributions, while at the same time
    allowing the family to be sufficiently rich and flexible that it can
    provide a good approximation to the true posterior distribution. It is
    important to emphasize that the restriction is imposed purely to achieve
    tractability, and that sub- ject to this requirement we should use as
    rich a family of approximating distributions as possible. In particular,
    there is no `over-fitting' associated with highly flexible dis-
    tributions. Using more flexible approximations simply allows us to
    approach the true posterior distribution more closely.\ 

    One way to restrict the family of approximating distributions is to use a
    parametric distribution <math|q(Z\|\<omega\>)> governed by a set of
    parameters <math|\<omega\>>. The lower bound <math|\<cal-L\>(q)> then
    becomes a function of <math|\<omega\>>, and we can exploit standard
    nonlinear optimization techniques to determine the optimal values for the
    parameters. An example of this approach, in which the variational
    distribution is a Gaussian and we have optimized with respect to its mean
    and variance, is shown in Figure <reference|fig10.1>.
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

    <\equation>
      q<around*|(|Z|)>=<big|prod><rsub|i=1><rsup|M>q<rsub|i><around*|(|Z<rsub|i>|)><label|10.5>
    </equation>

    It should be emphasized that we are making no further assumptions about
    the distri- bution. In particular, we place no restriction on the
    functional forms of the individual factors qi(Zi). This factorized form
    of variational inference corresponds to an ap- proximation framework
    developed in physics called <strong|mean field theory> (Parisi, 1988).
  </hidden>|<\hidden>
    <tit|lower bound>

    Amongst all distributions <math|q(Z)> having the form Eq. <eqref|10.5>,
    we now seek a distribution where the lower bound <math|\<cal-L\>(q)> is
    largest.\ 

    We therefore wish to make a free form (variational) optimization of
    <math|\<cal-L\>(q)> with respect to all of the distributions
    <math|q<rsub|i>(Z<rsub|i>)>, which we do by optimizing with respect to
    each of the factors in turn.\ 
  </hidden>|<\hidden>
    \;

    To achieve this, we first substitute Eq. <eqref|10.5> into <eqref|10.3>
    and then dissect out the dependence on one of the factors
    <math|q<rsub|j>(Z<rsub|j>)>. Denoting <math|q<rsub|j>(Z<rsub|j>)> by
    simply <math|q<rsub|j>> to keep the notation uncluttered, we then obtain

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-L\><around*|(|q|)>>|<cell|=>|<cell|<big|int><big|prod><rsub|i>q<rsub|i><around*|{|ln
      p<around*|(|X,Z|)>-<big|sum><rsub|i>ln
      q<rsub|i>|}>\<mathd\>Z>>|<row|<cell|>|<cell|=>|<cell|<big|int>q<rsub|j><around*|{|<big|int>ln
      p<around*|(|X,Z|)><big|prod><rsub|i\<neq\>j>q<rsub|i>\<mathd\>Z<rsub|i>|}>\<mathd\>Z<rsub|j>-<big|int>q<rsub|j>ln
      q<rsub|j>\<mathd\>Z<rsub|j>+const>>|<row|<cell|>|<cell|=>|<cell|<big|int>q<rsub|j>ln<wide|p|~><around*|(|X,Z<rsub|j>|)>\<mathd\>Z<rsub|j>-<big|int>q<rsub|j>ln
      q<rsub|j>\<mathd\>Z<rsub|j>+const<eq-number><label|10.6>>>>>
    </eqnarray*>

    <\folded>
      ...
    <|folded>
      where <math|<big|int>q<rsub|i><around*|(|Z<rsub|i>|)>\<mathd\>Z<rsub|i>=1>
      for any <math|i>.
    </folded>
  </hidden>|<\hidden>
    \;

    where we have defined a new distribution <math|<wide|p|~>(X,Z<rsub|j>)>
    by the relation

    <\equation*>
      ln <wide|p|~>(X, Z<rsub|j> ) = \<bbb-E\><rsub|i\<neq\>j> [ln p(X, Z)] +
      const.
    </equation*>

    Here the notation <math|\<bbb-E\><rsub|i\<neq\>j><around*|[|\<cdots\>|]>>
    denotes an expectation with respect to the <math|q> distributions over
    all variables <math|z<rsub|i>> for <math|i\<neq\>j>, so that\ 

    <\equation*>
      \<bbb-E\><rsub|i\<neq\>j>[ln p(X,Z)]=<big|int>ln p(X, Z)
      <big|prod><rsub|i\<neq\>j>q<rsub|i> \<mathd\>Z<rsub|i> .
    </equation*>
  </hidden>|<\hidden>
    <tit|optimal solution>

    Now suppose we keep the <math|{q<rsub|i\<neq\>j>}> fixed and maximize
    <math|\<cal-L\>(q)> in Eq. <eqref|10.6> with respect to all possible
    forms for the distribution <math|q<rsub|j>(Z<rsub|j>)>. This is easily
    done by recognizing that Eq. <eqref|10.6> is a negative Kullback-Leibler
    divergence between <math|q<rsub|j>(Z<rsub|j>)> and
    <math|<wide|p|~>(X,Z<rsub|j>)>.\ 

    Thus maximizing Eq. <eqref|10.6> is equivalent to minimizing the
    Kullback-Leibler divergence, and the minimum occurs when
    <math|q<rsub|j>(Z<rsub|j>)=<wide|p|~><around*|(|X,Z<rsub|j>|)>>. Thus we
    obtain a general expression for the optimal solution
    <math|q<rsub|j>(Z<rsub|j>)> given by

    <\folded>
      <\equation>
        ln q<rsub|j><rsup|\<ast\>>(Z<rsub|j>) =\<bbb-E\><rsub|i\<neq\>j>[ln
        p(X, Z)] + const.<label|10.9>
      </equation>
    <|folded>
      It is worth taking a few moments to study the form of this solution as
      it provides the basis for applications of variational methods.\ 

      It says that the log of the optimal so- lution for factor
      <math|q<rsub|j>> is obtained simply by considering the log of the joint
      distribution over all hidden and visible variables and then taking the
      expectation with respect to all of the other factors <math|{q<rsub|i>}>
      for <math|i\<neq\>j>.
    </folded>

    \;

    \;
  </hidden>|<\hidden>
    <tit|additive constant>

    \;

    The additive constant in Eq. <eqref|10.9> is set by normalizing the
    distribution <math|q<rsub|j><rsup|\<ast\>>(Z<rsub|j>)>. Thus if we take
    the exponential of both sides and normalize, we have\ 

    <\equation*>
      q<rsub|j><rsup|\<ast\>> (Z<rsub|j>) = <frac|
      exp(\<bbb-E\><rsub|i\<neq\>j>[ln p(X,Z)])|exp
      (\<bbb-E\><rsub|i\<neq\>j>[ln p(X, Z)])\<mathd\>Z<rsub|j> >.\ 
    </equation*>

    In practice, we shall find it more convenient to work with the form Eq.
    <eqref|10.9> and then reinstate the normalization constant (where
    required) by inspection. This will become clear from subsequent examples.\ 

    \;
  </hidden>|<\hidden>
    <tit|consistent solution ...>

    \;

    The set of equations given by Eq. <eqref|10.9> for <math|j=1,\<cdots\>,M>
    represent a set of consistency conditions for the maximum of the lower
    bound subject to the factorization constraint.\ 

    However, they do not represent an explicit solution because the
    expression on the right-hand side of Eq. <eqref|10.9> for the optimum
    <math|q<rsub|j>(Z<rsub|j>)> depends on expectations computed with respect
    to the other factors <math|q<rsub|i>(Z<rsub|i>)> for <math|i\<neq\>j>.\ 

    We will therefore seek a consistent solution by first initializing all of
    the factors <math|q<rsub|i>(Z<rsub|i>)> appropriately and then cycling
    through the factors and replacing each in turn with a revised estimate
    given by the right-hand side of Eq. <eqref|10.9> evaluated using the
    current estimates for all of the other factors.\ 

    Convergence is guaranteed because bound is convex with respect to each of
    the factors <math|q<rsub|i>(Z<rsub|i>)> (Boyd and Vandenberghe, 2004).
  </hidden>|<\hidden>
    <tit|Properties of factorized approximations>

    Our approach to variational inference is based on a factorized
    approximation to the true posterior distribution. Let us consider for a
    moment the problem of approx- imating a general distribution by a
    factorized distribution. To begin with, we discuss the problem of
    approximating a Gaussian distribution using a factorized Gaussian, which
    will provide useful insight into the types of inaccuracy introduced in
    using factorized approximations. Consider a Gaussian distribution
    <math|p(\<b-z\>) = N(\<b-z\>\|\<b-mu\>,\<Lambda\>\<minus\>1)> over two
    correlated variables <math|\<b-z\>=(z<rsub|1>,z<rsub|2>)> in which the
    mean and precision have elements\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-mu\>>|<cell|=>|<cell|<matrix|<tformat|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|\<mu\><rsub|1>>|<cell|\<mu\><rsub|2>>>>>><rsup|T>>>|<row|<cell|\<Lambda\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<Lambda\><rsub|11>>|<cell|\<Lambda\><rsub|12>>>|<row|<cell|\<Lambda\><rsub|21>>|<cell|\<Lambda\><rsub|22>>>>>>>>>>
    </eqnarray*>

    and <math|\<Lambda\><rsub|21>=\<Lambda\><rsub|12>> due to the symmetry of
    the precision matrix.
  </hidden>|<\hidden>
    Now suppose we wish to approximate this distribution using a factorized
    Gaussian of the form <math|q(\<b-z\>)=q<rsub|1>(z<rsub|1>)q<rsub|2>(z<rsub|2>)>.
    We first apply the general result Eq. <eqref|10.9> to find an expression
    for the optimal factor <math|q<rsub|1><rsup|\<ast\>>(z<rsub|1>)>. In
    doing so it is useful to note that on the right-hand side we only need to
    retain those terms that have some functional dependence on
    <math|z<rsub|1>> because all other terms can be absorbed into the
    normalization constant. Thus we have

    <\eqnarray*>
      <tformat|<table|<row|<cell|ln q<rsub|1><rsup|\<ast\>><around*|(|z<rsub|1>|)>>|<cell|=>|<cell|\<bbb-E\><rsub|z<rsub|2>><around*|[|ln
      p<around*|(|\<b-z\>|)>|]>+const>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><rsub|z<rsub|2>><around*|[|-<frac|1|2><around*|(|z<rsub|1>-\<mu\><rsub|1>|)><rsup|2>\<Lambda\><rsub|11>|]>-<around*|(|z<rsub|1>-\<mu\><rsub|1>|)>\<Lambda\><rsub|12><around*|(|z<rsub|2>-\<mu\><rsub|2>|)>+const>>|<row|<cell|>|<cell|=>|<cell|-<frac|1|2>z<rsub|1><rsup|2>\<Lambda\><rsub|11>+z<rsub|1>\<mu\><rsub|1>\<Lambda\><rsub|11>-z<rsub|1>\<Lambda\><rsub|12><around*|(|\<bbb-E\><around*|[|z<rsub|2>|]>-\<mu\><rsub|2>|)>+const>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    Next we observe that the right-hand side of this expression is a
    quadratic function of <math|z<rsub|1>>, and so we can identify
    <math|q(z<rsub|1>)> as a Gaussian distribution. It is worth emphasizing
    that we did not assume that <math|q(z<rsub|i>)> is Gaussian, but rather
    we derived this result by variational optimization of the KL divergence
    over all possible distributions <math|q(zi)>. Note also that we do not
    need to consider the additive constant in Eq. <eqref|10.9> explicitly
    because it represents the normalization constant that can be found at the
    end by inspection if required.<enumerate| >Using the technique of
    completing the square, we can identify the mean and precision of this
    Gaussian, giving<enumerate| >

    <\equation*>
      q<rsup|\<ast\>><rsub|1><around*|(|z<rsub|1>|)>=\<cal-N\><around*|(|z<rsub|1>\|m<rsub|1>,\<Lambda\><rsup|-1><rsub|11>|)>
    </equation*>

    where

    <\equation*>
      m<rsub|1>=\<mu\><rsub|1>-\<Lambda\><rsup|-1><rsub|11>\<Lambda\><rsub|12><around*|(|\<bbb-E\><around*|[|z<rsub|2>|]>-\<mu\><rsub|2>|)>
    </equation*>

    \;
  </hidden>|<\hidden>
    \;

    By symmetry, <math|q<rsub|2>(z<rsub|2>)> is also Gaussian and can be
    written as

    <\equation*>
      q<rsup|\<ast\>><rsub|2><around*|(|z<rsub|2>|)>=\<cal-N\><around*|(|z<rsub|2>\|m<rsub|2>,\<Lambda\><rsup|-1><rsub|22>|)>
    </equation*>

    where

    <\equation*>
      m<rsub|2>=\<mu\><rsub|2>-\<Lambda\><rsup|-1><rsub|22>\<Lambda\><rsub|21><around*|(|\<bbb-E\><around*|[|z<rsub|1>|]>-\<mu\><rsub|1>|)>
    </equation*>
  </hidden>|<\hidden>
    Note that these solutions are coupled, so that <math|q(z1)> depends on
    expectations com- puted with respect to <math|q(z2)> and vice versa. In
    general, we address this by treating the variational solutions as
    re-estimation equations and cycling through the variables in turn
    updating them until some convergence criterion is satisfied. We shall see
    an example of this shortly.\ 

    Here, however, we note that the problem is sufficiently simple that a
    closed form solution can be found. In particular, because
    <math|E[z<rsub|1>]=m<rsub|1>> and <math|E[z<rsub|2>]=m<rsub|2>>, we see
    that the two equations are satisfied if we take
    <math|E[z<rsub|1>]=\<mu\><rsub|1>> and
    <math|E[z<rsub|2>]=\<mu\><rsub|2>>, and it is easily shown that this is
    the only solution provided the dis- tribution is nonsingular. This result
    is illustrated in Figure <inactive|<reference|fig10.2>>(a).\ 

    We see that the mean is correctly captured but that the variance of
    <math|q(z)> is controlled by the direction of smallest variance of
    <math|p(z)>, and that the variance along the orthogonal direction is
    significantly under-estimated. It is a general result that a factorized
    variational approximation tends to give approximations to the posterior
    distribution that are too compact.
  </hidden>|<\hidden>
    By way of comparison, suppose instead that we had been minimizing the
    reverse Kullback-Leibler divergence <math|KL(p\<\|\|\>q)>. As we shall
    see, this form of KL divergence is used in an alternative approximate
    inference framework called expectation prop- agation. We therefore
    consider the general problem of minimizing <math|KL(p\<\|\|\>q)> when
    <math|q(Z)> is a factorized approximation of the form Eq. <eqref|10.5>.
    The KL divergence can then be written in the form

    <\equation*>
      KL<around*|(|p\<\|\|\>q|)>=-<big|int>p<around*|(|Z|)><around*|[|<big|sum><rsub|i=1><rsup|M>ln
      q<rsub|i><around*|(|Z<rsub|i>|)>|]>\<mathd\>Z+const
    </equation*>

    where the constant term is simply the entropy of <math|p(Z)> and so does
    not depend on <math|q(Z)>.\ 
  </hidden>|<\hidden>
    We can now optimize with respect to each of the factors
    <math|q<rsub|j>(Z<rsub|j>)>, which is easily done using a Lagrange
    multiplier to give

    <\equation*>
      q<rsup|\<ast\>><rsub|j><around*|(|Z<rsub|j>|)>=<big|int>p<around*|(|Z|)><big|prod><rsub|i\<neq\>j>\<mathd\>Z<rsub|i>=p<around*|(|Z<rsub|j>|)>
    </equation*>

    In this case, we find that the optimal solution for
    <math|q<rsub|j>(Z<rsub|j>)> is just given by the corresponding marginal
    distribution of <math|p(Z)>. Note that this is a closed-form solution and
    so does not require iteration.

    To apply this result to the illustrative example of a Gaussian
    distribution <math|p(\<b-z\>)> over a vector <math|\<b-z\>> we can use
    (2.98), which gives the result shown in Figure
    <inactive|<reference|fig10.2>>(b). We see that once again the mean of the
    approximation is correct, but that it places significant probability mass
    in regions of variable space that have very low probability.\ 
  </hidden>|<\hidden>
    <\padded-center>
      <\small-figure|<image|image/fig_10_2_two_KL.png|0.7par|||>>
        Comparison of the two alternative forms for the Kullback-Leibler
        divergence. The green contours corresponding to 1, 2, and 3 standard
        deviations for a correlated Gaussian distribution <math|p(\<b-z\>)>
        over two variables <math|z<rsub|1>> and <math|z<rsub|2>>, and the red
        contours represent the corresponding levels for an approximating
        distribution <math|q(\<b-z\>)> over the same variables given by the
        product of two independent univariate Gaussian distributions whose
        parameters are obtained by minimization of (a) the Kullback- Leibler
        divergence <math|KL(q\<\|\|\>p)>, and (b) the reverse
        Kullback-Leibler divergence <math|KL(p\<\|\|\>q)>.
      </small-figure>
    </padded-center>
  </hidden>|<\hidden>
    \;

    The difference between these two results can be understood by noting that
    there is a large positive contribution to the Kullback-Leibler divergence

    <\equation*>
      KL<around*|(|q\<\|\|\>p|)>=-<big|int>q<around*|(|Z|)>ln<around*|{|<frac|p<around*|(|Z|)>|q<around*|(|Z|)>>|}>\<mathd\>Z
    </equation*>

    from regions of <math|Z> space in which <math|p(Z)> is near zero unless
    <math|q(Z)> is also close to zero. Thus minimizing this form of KL
    divergence leads to distributions <math|q(Z)> that avoid regions in which
    <math|p(Z)> is small.\ 

    Conversely, the Kullback-Leibler divergence <math|KL(p\<\|\|\>q)> is
    minimized by distributions <math|q(Z)> that are nonzero in regions where
    <math|p(Z)> is nonzero.
  </hidden>|<\hidden>
    We can gain further insight into the different behaviour of the two KL
    divergences if we consider approximating a multimodal distribution by a
    unimodal one, as illustrated in Figure <inactive|<reference|fig10.3>>.\ 

    In practical applications, the true posterior distribution will often be
    multimodal, with most of the posterior mass concentrated in some number
    of relatively small regions of parameter space. These multiple modes may
    arise through nonidentifiability in the latent space or through complex
    nonlin- ear dependence on the parameters. Both types of multimodality
    were encountered in Chapter 9 in the context of Gaussian mixtures, where
    they manifested themselves as multiple maxima in the likelihood function,
    and a variational treatment based on the minimization of
    <math|KL(q\<\|\|\>p)> will tend to find one of these modes.\ 

    By contrast, if we were to minimize<math| KL(p\<\|\|\>q)>, the resulting
    approximations would average across all of the modes and, in the context
    of the mixture model, would lead to poor predictive distributions
    (because the average of two good parameter values is typically itself not
    a good parameter value). It is possible to make use of
    <math|KL(p\<\|\|\>q)> to define a useful inference procedure, but this
    requires a rather different approach to the one discussed here, and will
    be considered in detail when we discuss <strong|expectation propagation>.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_10_3_multimodal.png|0.9par|||>|Another
      comparison of the two alternative forms for the Kullback-Leibler
      divergence. (a) The blue contours show a bimodal distribution
      <math|p(Z)> given by a mixture of two Gaussians, and the red contours
      correspond to the single Gaussian distribution <math|q(Z)> that best
      approximates <math|p(Z)> in the sense of minimizing the Kullback-
      Leibler divergence <math|KL(p\<\|\|\>q)>. (b) As in (a) but now the red
      contours correspond to a Gaussian distribution <math|q(Z)> found by
      numerical minimization of the Kullback-Leibler divergence<math|
      KL(q\<\|\|\>p)>. (c) As in (b) but showing a different local minimum of
      the Kullback-Leibler divergence.>
    </padded-center>
  </hidden>|<\hidden>
    The two forms of Kullback-Leibler divergence are members of the alpha
    family of divergences (Ali and Silvey, 1966; Amari, 1985; Minka, 2005)
    defined by

    <\equation*>
      D<rsub|\<alpha\>><around*|(|p\<\|\|\>q|)>=<frac|4|1-\<alpha\><rsup|2>><around*|(|1-<big|int>p<around*|(|x|)><rsup|<around*|(|1+\<alpha\>|)>/2>q<around*|(|x|)><rsup|<around*|(|1-\<alpha\>|)>/2>\<mathd\>x|)>
    </equation*>

    where <math|\<minus\>\<infty\> \<less\> \<alpha\> \<less\> \<infty\>> is
    a continuous parameter.\ 

    The Kullback-Leibler divergence <math|KL(p\<\|\|\>q)> corresponds to the
    limit <math|\<alpha\> \<rightarrow\>1>, whereas <math|KL(q\<\|\|\>p)>
    corresponds to the limit <math|\<alpha\>\<rightarrow\>\<minus\>1>. For
    all values of <math|\<alpha\>> we have
    <math|D<rsub|\<alpha\>>(p\<\|\|\>q)\<geqslant\>0>, with equality if, and
    only if, <math|p(x)=q(x)>.\ 
  </hidden>|<\hidden>
    \;

    Suppose <math|p(x)> is a fixed distribution, and we minimize
    <math|D<rsub|\<alpha\>>(p\<\|\|\>q)> with respect to some set of
    distributions <math|q(x)>.\ 

    Then for <math|\<alpha\>\<leqslant\>\<minus\>1> the divergence is
    <strong|zero forcing>, so that any values of <math|x> for which
    <math|p(x)=0> will have <math|q(x)=0>, and typically <math|q(x)> will
    under-estimate the support of <math|p(x)> and will tend to seek the mode
    with the largest mass.\ 

    Conversely for <math|\<alpha\>\<gtr\>=1> the divergence is
    <strong|zero-avoiding>, so that values of <math|x> for which <math|p(x)
    \<gtr\> 0> will have <math|q(x) \<gtr\> 0>, and typically <math|q(x)>
    will stretch to cover all of <math|p(x)>, and will over-estimate the
    support of <math|p(x)>.\ 

    When <math|\<alpha\> = 0> we obtain a symmetric divergence that is
    linearly related to the Hellinger distance given by

    <\equation*>
      D<rsub|H><around*|(|p\<\|\|\>q|)>=<big|int><around*|(|p<around*|(|x|)><rsup|1/2>-q<around*|(|x|)><rsup|1/2>|)>\<mathd\>x
    </equation*>
  </hidden>|<\hidden>
    <tit|Example: The univariate Gaussian>

    We now illustrate the factorized variational approximation using a
    Gaussian distribution over a single variable <math|x> (MacKay, 2003). Our
    goal is to infer the posterior distribution for the mean <math|\<mu\>>
    and precision <math|\<tau\>>, given a data set <math|D =
    {x<rsub|1>,\<cdots\>,x<rsub|N>}> of observed values of <math|x> which are
    assumed to be drawn independently from the Gaussian. The likelihood
    function is given by

    <\equation*>
      p<around*|(|\<cal-D\>\|\<mu\>,\<tau\>|)>=<around*|(|<frac|\<tau\>|2\<pi\>>|)><rsup|N/2>exp<around*|{|-<frac|\<tau\>|2><big|sum><rsub|n=1><rsup|N><around*|(|x<rsub|n>-\<mu\>|)><rsup|2>|}>
    </equation*>

    \;
  </hidden>|<\hidden>
    <tit|posterior distribution>

    \;

    We now introduce conjugate prior distributions for <math|\<mu\>> and
    <math|\<tau\>> given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|p(\<mu\>\|\<tau\> )
      >|<cell|=>|<cell|\<cal-N\><around*|(|\<mu\>\|\<mu\><rsub|0>,<around*|(|\<lambda\><rsub|0>\<tau\>|)><rsup|-1>|)>>>|<row|<cell|p<around*|(|\<tau\>|)>>|<cell|=>|<cell|Gam<around*|(|\<tau\>\|a<rsub|0>,b<rsub|0>|)>>>>>
    </eqnarray*>

    where <math|Gam(\<tau\>\|a<rsub|0>,b<rsub|0>)> is the gamma distribution
    defined by (2.146). Together these distributions constitute a
    Gaussian-Gamma conjugate prior distribution.

    For this simple problem the posterior distribution can be found exactly,
    and again takes the form of a Gaussian-gamma distribution. However, for
    tutorial purposes we will consider a factorized variational approximation
    to the posterior distribution given by\ 

    <\equation*>
      q(\<mu\>,\<tau\>) = q<rsub|\<mu\>>(\<mu\>)q<rsub|\<tau\>>(\<tau\>).
    </equation*>

    Note that the true posterior distribution does not factorize in this way.
    </hidden>|<\hidden>
    <tit|<math|q<rsub|\<mu\>><around*|(|\<mu\>|)>>>

    \;

    The optimum factors <math|q<rsub|\<mu\>>(\<mu\>)> and
    <math|q<rsub|\<tau\>>(\<tau\>)> can be obtained from the general result
    Eq. <eqref|10.9> as follows. For <math|q<rsub|\<mu\>>(\<mu\>)> we have

    <\eqnarray*>
      <tformat|<table|<row|<cell|ln q<rsub|\<mu\>><rsup|\<ast\>><around*|(|\<mu\>|)>>|<cell|=>|<cell|\<bbb-E\><rsub|\<tau\>><around*|[|ln
      p<around*|(|\<cal-D\>\|\<mu\>,\<tau\>|)>+ln
      p<around*|(|\<mu\>\|\<tau\>|)>|]>+const>>|<row|<cell|>|<cell|=>|<cell|-<frac|\<bbb-E\><around*|[|\<tau\>|]>|2><around*|{|\<lambda\><rsub|0><around*|(|\<mu\>-\<mu\><rsub|0>|)><rsup|2>+<big|sum><rsub|n=1><rsup|N><around*|(|x<rsub|n>-\<mu\>|)><rsup|2>|}>+const>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|Gaussian <math|\<cal-N\><around*|(|\<mu\>\|\<mu\><rsub|N>,\<lambda\><rsub|N><rsup|-1>|)>>>

    Completing the square over <math|\<mu\>> we see that
    <math|q<rsub|\<mu\>>(\<mu\>)> is a Gaussian
    <math|\<cal-N\><around*|(|\<mu\>\|\<mu\><rsub|N>,\<lambda\><rsub|N><rsup|-1>|)>>
    with mean and precision given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<mu\><rsub|N>>|<cell|=>|<cell|<frac|\<lambda\><rsub|0>\<mu\><rsub|0>+N<wide|x|\<bar\>>|\<lambda\><rsub|0>+N><eq-number><label|10.26>>>|<row|<cell|\<lambda\><rsub|N>>|<cell|=>|<cell|<around*|(|\<lambda\><rsub|0>+N|)>\<bbb-E\><around*|[|\<tau\>|]><eq-number><label|10.27>>>>>
    </eqnarray*>

    Note that for <math|N \<rightarrow\> \<infty\>> this gives the maximum
    likelihood result in which <math|\<mu\><rsub|N> = x> and the precision is
    infinite.
  </hidden>|<\hidden>
    <tit|<math|q<rsub|\<tau\>><around*|(|\<tau\>|)>>>

    Similarly, the optimal solution for the factor
    <math|q<rsub|\<tau\>>(\<tau\>)> is given by\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|ln q<rsub|\<tau\>><rsup|\<ast\>><around*|(|\<tau\>|)>>|<cell|=>|<cell|\<bbb-E\><rsub|\<mu\>><around*|[|ln
      p<around*|(|\<cal-D\>\|\<mu\>,\<tau\>|)>+ln
      p<around*|(|\<mu\>\|\<tau\>|)>|]>+ln
      p<around*|(|\<tau\>|)>+const>>|<row|<cell|>|<cell|=>|<cell|<around*|(|a<rsub|0>-1|)>ln
      \<tau\>-b<rsub|0>\<tau\>+<frac|N|2>ln
      \<tau\>-<frac|\<tau\>|2>\<bbb-E\><rsub|\<mu\>><around*|[|<big|sum><rsub|n=1><rsup|N><around*|(|x<rsub|n>-\<mu\>|)><rsup|2>+\<lambda\><rsub|0><around*|(|\<mu\>-\<mu\><rsub|0>|)><rsup|2>|]>+const>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|<math|Gam<around*|(|\<tau\>,a<rsub|N>,b<rsub|N>|)>>>

    and hence <math|q<rsub|\<tau\>>(\<tau\>)> is a gamma distribution
    <math|Gam(\<tau\>\|a<rsub|N>,b<rsub|N>)> with parameters

    <\eqnarray*>
      <tformat|<table|<row|<cell|a<rsub|N>>|<cell|=>|<cell|a<rsub|0>+<frac|N|2><eq-number><label|10.29>>>|<row|<cell|b<rsub|N>>|<cell|=>|<cell|b<rsub|0>+<frac|1|2>\<bbb-E\><rsub|\<mu\>><around*|[|<big|sum><rsub|n=1><rsup|N><around*|(|x<rsub|n>-\<mu\>|)><rsup|2>+\<lambda\><rsub|0><around*|(|\<mu\>-\<mu\><rsub|0>|)><rsup|2>|]><eq-number><label|10.30>>>>>
    </eqnarray*>

    Again this exhibits the expected behaviour when <math|N \<rightarrow\>
    \<infty\>>.

    <\folded>
      ...
    <|folded>
      It should be emphasized that we did not assume these specific
      functional forms for the optimal distributions
      <math|q<rsub|\<mu\>>(\<mu\>)> and <math|q<rsub|\<tau\>>(\<tau\>)>. They
      arose naturally from the structure of the likelihood function and the
      corresponding conjugate priors.
    </folded>
  </hidden>|<\hidden>
    <tit|solution ...>

    Thus we have expressions for the optimal distributions
    <math|q<rsub|\<mu\>>(\<mu\>)> and <math|q<rsub|\<tau\>>(\<tau\>)> each of
    which depends on moments evaluated with respect to the other
    distribution.\ 

    One approach to finding a solution is therefore to make an initial guess
    for, say, the moment <math|\<bbb-E\>[\<tau\>]> and use this to re-compute
    the distribution <math|q<rsub|\<mu\>>(\<mu\>)>. Given this revised
    distribution we can then extract the required moments
    <math|\<bbb-E\>[\<mu\>]> and <math|\<bbb-E\>[\<mu\><rsup|2>]>, and use
    these to recompute the distribution <math|q<rsub|\<tau\>>(\<tau\>)>, and
    so on.\ 

    Since the space of hidden variables for this example is only two
    dimensional, we can illustrate the variational approxima- tion to the
    posterior distribution by plotting contours of both the true posterior
    and the factorized approximation, as illustrated in Figure
    <inactive|<reference|fig10.4>>.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_10_4_univariable_gaussian.png|0.5par|||>|Illustration
      of variational inference for the mean \<mu\> and precision
      <math|\<tau\>> of a univariate Gaussian distribution. Contours of the
      true posterior distribution <math|p(\<mu\>,\<tau\>\|D)> are shown in
      green. (a) Contours of the initial factorized approximation
      <math|q<rsub|\<mu\>>(\<mu\>)q<rsub|\<tau\>>(\<tau\>)> are shown in
      blue. (b) After re-estimating the factor <math|q<rsub|\<mu\>>(\<mu\>)>.
      (c) After re-estimating the factor <math|q<rsub|\<tau\>>(\<tau\>)>. (d)
      Contours of the optimal factorized approximation, to which the
      iterative scheme converges, are shown in red.>
    </padded-center>
  </hidden>|<\hidden>
    In general, we will need to use an iterative approach such as this in
    order to solve for the optimal factorized posterior distribution. For the
    very simple example we are considering here, however, we can find an
    explicit solution by solving the simultaneous equations for the optimal
    factors <math|q<rsub|\<mu\>>(\<mu\>)> and
    <math|q<rsub|\<tau\>>(\<tau\>)>.\ 

    Before doing this, we can simplify these expressions by considering
    broad, noninformative priors in which
    <math|\<mu\><rsub|0>=a<rsub|0>=b<rsub|0>=\<lambda\><rsub|0>=0>. Although
    these parameter settings correspond to improper priors, we see that the
    posterior distribution is still well defined. Using the standard result
    <math|\<bbb-E\>[\<tau\>]=a<rsub|N>/b<rsub|N>> for the mean of a gamma
    distribution, together with Eq. <eqref|10.29> and <eqref|10.30>, we have

    <\equation>
      <frac|1|\<bbb-E\><around*|[|\<tau\>|]>>=\<bbb-E\><around*|[|<frac|1|N+1><big|sum><rsub|n=1><rsup|N><around*|(|x<rsub|n>-\<mu\>|)><rsup|2>|]>=<frac|N|N+1><around*|(|<wide|x<rsup|2
      >|\<bar\>>-2<wide|x|\<bar\>>\<bbb-E\><around*|[|\<mu\>|]>+\<bbb-E\><around*|[|\<mu\><rsup|2>|]>|)><label|10.31>
    </equation>

    Then, using Eq. <eqref|10.26> and <eqref|10.27>, we obtain the first and
    second order moments of <math|q<rsub|\<mu\>>(\<mu\>)> in the form

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<mu\>|]>>|<cell|=>|<cell|<wide|x|\<bar\>>>>|<row|<cell|\<bbb-E\><around*|[|\<mu\><rsup|2>|]>>|<cell|=>|<cell|<wide|x|\<bar\>><rsup|2>+<frac|1|N\<bbb-E\><around*|[|\<tau\>|]>>>>>>
    </eqnarray*>
  </hidden>|<\shown>
    We can now substitute these moments into <eqref|10.31> and then solve for
    <math|\<bbb-E\>[\<tau\>]> to give

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|1|\<bbb-E\><around*|[|\<tau\>|]>>>|<cell|=>|<cell|<around*|(|<wide|x<rsup|2
      >|\<bar\>>-<wide|x|\<bar\>><rsup|2>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N><around*|(|x<rsub|n>-<wide|x|\<bar\>>|)><rsup|2>>>>>
    </eqnarray*>

    \;
  </shown>|<\hidden>
    <tit|Model comparison>

    \;
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
    <associate|10.26|<tuple|5|?>>
    <associate|10.27|<tuple|6|?>>
    <associate|10.29|<tuple|7|?>>
    <associate|10.3|<tuple|1|?>>
    <associate|10.30|<tuple|8|?>>
    <associate|10.31|<tuple|9|?>>
    <associate|10.5|<tuple|2|?>>
    <associate|10.6|<tuple|3|?>>
    <associate|10.9|<tuple|4|?>>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|1|?>>
    <associate|auto-3|<tuple|1.1|?>>
    <associate|auto-4|<tuple|2|1>>
    <associate|auto-5|<tuple|3|?>>
    <associate|auto-6|<tuple|4|?>>
    <associate|fig10.1|<tuple|1|?>>
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

      <tuple|normal|<\surround|<hidden-binding|<tuple>|2>|>
        Comparison of the two alternative forms for the Kullback-Leibler
        divergence. The green contours corresponding to 1, 2, and 3 standard
        deviations for a correlated Gaussian distribution
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|p(\<b-z\>)>>
        over two variables <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|z<rsub|1>>>
        and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|z<rsub|2>>>,
        and the red contours represent the corresponding levels for an
        approximating distribution <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|q(\<b-z\>)>>
        over the same variables given by the product of two independent
        univariate Gaussian distributions whose parameters are obtained by
        minimization of (a) the Kullback- Leibler divergence
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|KL(q\<\|\|\>p)>>,
        and (b) the reverse Kullback-Leibler divergence
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|KL(p\<\|\|\>q)>>.
      </surround>|<pageref|auto-4>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3>||Another comparison
      of the two alternative forms for the Kullback-Leibler divergence. (a)
      The blue contours show a bimodal distribution
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|p(Z)>>
      given by a mixture of two Gaussians, and the red contours correspond to
      the single Gaussian distribution <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|q(Z)>>
      that best approximates <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|p(Z)>>
      in the sense of minimizing the Kullback- Leibler divergence
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|KL(p\<\|\|\>q)>>.
      (b) As in (a) but now the red contours correspond to a Gaussian
      distribution <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|q(Z)>>
      found by numerical minimization of the Kullback-Leibler
      divergence<with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|
      KL(q\<\|\|\>p)>>. (c) As in (b) but showing a different local minimum
      of the Kullback-Leibler divergence.>|<pageref|auto-5>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4>||Illustration of
      variational inference for the mean \<mu\> and precision
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<tau\>>>
      of a univariate Gaussian distribution. Contours of the true posterior
      distribution <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|p(\<mu\>,\<tau\>\|D)>>
      are shown in green. (a) Contours of the initial factorized
      approximation <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|q<rsub|\<mu\>>(\<mu\>)q<rsub|\<tau\>>(\<tau\>)>>
      are shown in blue. (b) After re-estimating the factor
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|q<rsub|\<mu\>>(\<mu\>)>>.
      (c) After re-estimating the factor <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|q<rsub|\<tau\>>(\<tau\>)>>.
      (d) Contours of the optimal factorized approximation, to which the
      iterative scheme converges, are shown in red.>|<pageref|auto-6>>
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