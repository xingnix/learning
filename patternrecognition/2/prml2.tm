<TeXmacs|2.1>

<style|<tuple|beamer|manila-paper>>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <doc-data|<doc-title|Probability Distributions>>
  </hidden>|<\hidden>
    <tit|probability distributions and their properties>

    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      Turn to an exploration of some particular examples of probability
      distributions and their properties. These distributions can form
      building blocks for more complex models
    </shown>|<\shown>
      The distributions will provide the opportunity to discuss some key
      statistical concepts, such as Bayesian inference, in the context of
      simple models before we encounter them in more complex situations
      later.
    </shown>|<\shown>
      One role for the distributions \ is to model the probability
      distribution <math|p(x)> of a random variable <math|x>, given a finite
      set <math|x<rsub|1>, . . . , x<rsub|N>> of observations. This problem
      is known as <em|density estimation>.
    </shown>>
  </hidden>|<\hidden>
    <tit|<em|parametric> distributions>

    Considering the binomial and multinomial distributions for discrete
    random variables and the Gaussian distribution for continuous random
    variables.

    These are specific examples of <em|parametric> distributions, so-called
    because they are governed by a small number of adaptive parameters, such
    as the mean and variance in the case of a Gaussian for example.

    \;
  </hidden>|<\hidden>
    <tit|parameter estimation>

    To apply such models to the problem of density estimation, we need a
    procedure for determining suitable values for the parameters, given an
    observed data set.

    In a frequentist treatment, we choose specific values for the parameters
    by optimizing some criterion, such as the likelihood function.

    By contrast, in a Bayesian treatment we introduce prior distributions
    over the parameters and then use Bayes' theorem to compute the
    corresponding posterior distribution given the observed data.\ 
  </hidden>|<\hidden>
    <tit|exponential family>

    An important role is played by <em|conjugate priors>, that lead to
    posterior distributions having the same functional form as the prior, and
    that therefore lead to a greatly simplified Bayesian analysis.

    For example, the conjugate prior for the parameters of the multinomial
    distribution is called the Dirichlet distribution, while the conjugate
    prior for the mean of a Gaussian is another Gaussian.

    All of these distributions are examples of the <em|exponential family> of
    distributions, which possess a number of important properties, and which
    will be discussed in some detail.\ 

    \;
  </hidden>|<\hidden>
    <tit|nonparametric>

    One limitation of the parametric approach is that it assumes a specific
    functional form for the distribution, which may turn out to be
    inappropriate for a particular application.

    An alternative approach is given by <em|nonparametric> density estimation
    methods in which the form of the distribution typically depends on the
    size of the data set.

    Such models still contain parameters, but these control the model
    complexity rather than the form of the distribution.

    Consider three nonparametric methods based respectively on\ 

    histograms, nearest-neighbours, and kernels.
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|Binary Variables>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Flip a coin>

    considering a single binary random variable <math|x \<in\> {0, 1}>.\ 

    For example, <math|x> might describe the outcome of flipping a coin, with
    <math|x = 1> representing `heads', and <math|x = 0> representing `tails'.

    Imagine that this is a damaged coin so that the probability of landing
    heads is not necessarily the same as that of landing tails.

    The probability of <math|x = 1> will be denoted by the parameter
    <math|\<mu\>> so that

    <\equation*>
      p(x = 1\|\<mu\>) = \<mu\>
    </equation*>

    where <math|0\<leqslant\>\<mu\>\<leqslant\>1>, from which it follows that

    <\equation*>
      p(x = 0\|\<mu\>) = 1 \<minus\> \<mu\>.
    </equation*>
  </hidden>|<\hidden>
    <tit|Bernoulli distribution>

    The probability distribution over x can therefore be written in the form
    \ 

    <\equation*>
      Bern(x\|\<mu\>) = \<mu\><rsup|x>(1 \<minus\> \<mu\><rsup|)1\<minus\>x >
    </equation*>

    which is known as the Bernoulli distribution.

    It is easily verified that this distribution is normalized and that it
    has mean and variance given by \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|x|]>>|<cell|=>|<cell|\<mu\><eq-number><label|2.3>>>|<row|<cell|var<around*|[|x|]>>|<cell|=>|<cell|\<mu\><around*|(|1-\<mu\>|)><eq-number><label|2.4>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Likelihood>

    Now suppose we have a data set<math| \<cal-D\>= {x<rsub|1>, . . . ,
    x<rsub|N>}> of observed values of <math|x>. We can construct the
    likelihood function, which is a function of <math|\<mu\>>, on the
    assumption that the observations are drawn independently from<math|
    p(x\|\<mu\>)>, so that

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<cal-D\>\|\<mu\>|)>>|<cell|=>|<cell|<big|prod><rsub|n=1><rsup|N>p<around*|(|x<rsub|n>\|\<mu\>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|prod><rsub|n=1><rsup|N>\<mu\><rsup|x<rsub|n>><around*|(|1-\<mu\>|)><rsup|1-x<rsub|n>><eq-number><label|2.5>>>>>
    </eqnarray*>

    In a frequentist setting, we can estimate a value for <math|\<mu\>> by
    maximizing the likelihood function, or equivalently by maximizing the
    logarithm of the likelihood.
  </hidden>|<\hidden>
    <tit|Log likelihood>

    \ In the case of the Bernoulli distribution, the log likelihood function
    is given by \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|ln p<around*|(|\<cal-D\>\|\<mu\>|)>>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>ln
      p<around*|(|x<rsub|n>\|\<mu\>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N><around*|{|x<rsub|n>ln\<mu\>+<around*|(|1-x<rsub|n>|)>ln<around*|(|1-\<mu\>|)>|}>>>>>
    </eqnarray*>

    At this point, it is worth noting that the log likelihood function
    depends on the <math|N> observations <math|x<rsub|n>> only through their
    sum <math|<big|sum><rsub|n>x<rsub|n>>. This sum provides an example of a
    <em| sufficient statistic> for the data under this distribution, and we
    shall study the important role of <em|sufficient statistics> in some
    detail.
  </hidden>|<\hidden>
    <tit|Solution>

    If we set the derivative of <math|ln p(\<cal-D\>\|\<mu\>)> \ with respect
    to <math|\<mu\>> equal to zero,

    <\equation*>
      <frac|\<mathd\>|\<mathd\>\<mu\>>ln p<around*|(|\<cal-D\>\|\<mu\>|)>=0
    </equation*>

    Obtain the maximum likelihood estimator

    <\equation>
      \<mu\><rsub|ML>=<frac|1|N><big|sum><rsub|n=1><rsup|N>x<rsub|n><label|2.7>
    </equation>

    which is also known as the sample mean.\ 
  </hidden>|<\hidden>
    \;

    \;

    Denote the number of observations of <math|x = 1> (heads) within this
    data set by <math|m>,

    <\equation*>
      m=<big|sum><rsub|n-1><rsup|N>x<rsub|n>
    </equation*>

    then we can write Eq. <eqref|2.7> in the form

    <\equation>
      \<mu\><rsub|ML> =<frac|m|N><label|2.8>
    </equation>

    so that the probability of landing heads is given, in this maximum
    likelihood framework, by the fraction of observations of heads in the
    data set.
  </hidden>|<\hidden>
    <tit|Binomial distribution>

    Work out the distribution of the number <math|m> of observations of
    <math|x = 1>, given that the data set has size <math|N>.\ 

    This is called the binomial distribution, and from Eq. <eqref|2.5> we see
    that it is proportional to

    <\equation*>
      \<mu\><rsup|m>(1 \<minus\> \<mu\>)<rsup|N\<minus\>m>.
    </equation*>

    \;
  </hidden>|<\hidden>
    \;

    In order to obtain the normalization coefficient we note that out of
    <math|N> coin flips, we have to add up all of the possible ways of
    obtaining m heads, so that the binomial distribution can be written

    <\equation>
      Bin(m\|N, \<mu\>) = \ <choose|N|m>\<mu\><rsup|m>(1 \<minus\>
      \<mu\>)<rsup|N\<minus\>m><label|2.9>
    </equation>

    where

    <\equation*>
      <choose|N|m>\<equiv\><frac|N!|(N\<minus\>m)!m!>
    </equation*>

    is the number of ways of choosing <math|m> objects out of a total of
    <math|N> identical objects.

    Figure <reference|fig2.1> shows a plot of the binomial distribution for
    <math|N = 10> and <math|\<mu\> = 0.25>.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_1_binomial_histogram.png|.5par|||>|<label|fig2.1>Histogram
      plot of the binomial distribution <eqref|2.9> as a function of m for
      <math|N = 10> and <math|\<mu\> = 0.25>.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|<math|\<bbb-E\><around*|[|m|]>,var<around*|[|m|]>>>

    For independent events the mean of the sum is the sum of the means, and
    the variance of the sum is the sum of the variances.

    Because <math|m = x<rsub|1> + . . . + x<rsub|N>>, and for each
    observation the mean and variance are given by Eq. <eqref|2.3> and
    <eqref|2.4>, respectively, we have

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|m|]>>|<cell|=>|<cell|<big|sum><rsub|m=1><rsup|N>m
      Bin<around*|(|m\|N,\<mu\>|)>>>|<row|<cell|>|<cell|=>|<cell|N\<mu\>>>|<row|<cell|var<around*|[|m|]>>|<cell|=>|<cell|<big|sum><rsub|m=0><rsup|N><around*|(|m-\<bbb-E\><around*|[|m|]>|)><rsup|2>Bin<around*|(|m\|N,\<mu\>|)>>>|<row|<cell|>|<cell|=>|<cell|N\<mu\><around*|(|1-\<mu\>|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Prior distribution <math|p(\<mu\>)>>

    We have seen in Eq. <eqref|2.8> that the maximum likelihood setting for
    the parameter <math|\<mu\>> in the Bernoulli distribution, and hence in
    the binomial distribution, is given by the fraction of the observations
    in the data set having <math|x = 1>. As we have already noted, this can
    give severely over-fitted results for small data sets.

    In order to develop a Bayesian treatment for this problem, we need to
    introduce a prior distribution <math|p(\<mu\>)> over the parameter
    <math|\<mu\>>. Here we consider a form of prior distribution that has a
    simple interpretation as well as some useful analytical properties.

    \;
  </hidden>|<\hidden>
    <tit|Conjugate prior>

    To motivate this prior, we note that the likelihood function takes the
    form of the product of factors of the form

    <\equation*>
      \<mu\><rsup|x>(1 \<minus\> \<mu\>)<rsup|1\<minus\>x>.
    </equation*>

    If we choose a prior to be proportional to powers of <math|\<mu\>> and
    <math|(1 \<minus\> \<mu\>)>, then the posterior distribution, which is
    proportional to the product of the prior and the likelihood function,
    will have the same functional form as the prior.

    This property is called conjugacy.
  </hidden>|<\hidden>
    <tit|beta distribution>

    Choose a prior, called the beta distribution, given by

    <\equation>
      Beta<around*|(|\<mu\>\|a,b|)>=<frac|\<Gamma\><around*|(|a+b|)>|\<Gamma\><around*|(|a|)>\<Gamma\><around*|(|b|)>>\<mu\><rsup|a-1><around*|(|1-\<mu\>|)><rsup|b-1><label|2.13>
    </equation>

    where <math|\<Gamma\>(x)> is the gamma function defined by (1.141), and
    the coefficient ensures that the beta distribution is normalized, so that

    <\equation*>
      <big|int><rsub|0><rsup|1>Beta(\<mu\>\|a, b) \<mathd\>\<mu\> = 1
    </equation*>

    \;
  </hidden>|<\hidden>
    <tit|<math|\<bbb-E\><around*|[|\<mu\>|]>,var<around*|[|\<mu\>|]>>>

    The mean and variance of the beta distribution are given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<mu\>|]>>|<cell|=>|<cell|<frac|a|a+b><eq-number><label|2.15>>>|<row|<cell|var<around*|[|\<mu\>|]>>|<cell|=>|<cell|<frac|a*b|<around*|(|a+b|)><rsup|2><around*|(|a+b+1|)>>>>>>
    </eqnarray*>

    The parameters <math|a> and <math|b> are often called
    <math|hyperparameters> because they control the distribution of the
    parameter <math|\<mu\>>.

    Figure <reference|fig2.2> shows plots of the beta distribution for
    various values of the hyperparameters.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_2_beta_distribution.png|.6par|||>|<label|fig2.2>Plots
      of the beta distribution <math|Beta(\<mu\>\|a, b)> given by
      Eq.<eqref|2.13> as a function of <math|\<mu\>> for various values of
      the hyperparameters <math|a> and <math|b>.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Posterior distribution>

    The posterior distribution of <math|\<mu\>> is now obtained by
    multiplying the beta prior <eqref|2.13> by the binomial likelihood
    function <eqref|2.9> and normalizing.

    Keeping only the factors that depend on <math|\<mu\>>, we see that this
    posterior distribution has the form

    <\equation*>
      \ p(\<mu\>\|m, l, a, b) \<propto\> \<mu\><rsup|m+a\<minus\>1>(1
      \<minus\> \<mu\>)<rsup|l+b\<minus\>1>
    </equation*>

    where <math|l = N \<minus\> m>, and therefore corresponds to the number
    of `tails' in the coin example.

    \;
  </hidden>|<\hidden>
    \;

    It has the same functional dependence on <math|\<mu\>> as the prior
    distribution, reflecting the conjugacy properties of the prior with
    respect to the likelihood function.

    Indeed, it is simply another beta distribution, and its normalization
    coefficient can therefore be obtained by comparison with Eq. <eqref|2.13>
    to give

    <\equation>
      p<around*|(|\<mu\>\|m,l,a,b|)>=<frac|\<Gamma\><around*|(|m+a+l+b|)>|\<Gamma\><around*|(|m+a|)>\<Gamma\><around*|(|l+b|)>>\<mu\><rsup|m+a-1><around*|(|1-\<mu\>|)><rsup|l+b-1><label|2.18>
    </equation>
  </hidden>|<\hidden>
    We see that the effect of observing a data set of m observations of
    <math|x = 1> and <math|l> observations of <math|x = 0> has been to
    increase the value of <math|a> by <math|m>,\ 

    <\equation*>
      a\<rightarrow\>a+m
    </equation*>

    and the value of <math|b> by <math|l>,\ 

    <\equation*>
      b\<rightarrow\>b+l
    </equation*>

    in going from the prior distribution to the posterior distribution.

    This allows us to provide a simple interpretation of the hyperparameters
    <math|a> and <math|b> in the prior as an <em|effective number> of
    observations of <math|x = 1> and <math|x = 0>, respectively.

    Note that <math|a> and <math|b> need not be integers.

    \;
  </hidden>|<\hidden>
    Furthermore, the posterior distribution can act as the prior if we
    subsequently observe additional data.

    To see this, we can imagine taking observations one at a time and after
    each observation updating the current posterior distribution by
    multiplying by the likelihood function for the new observation and then
    normalizing to obtain the new, revised posterior distribution.

    At each stage, the posterior is a beta distribution with some total
    number of (prior and actual) observed values for <math|x = 1> and <math|x
    = 0> given by the parameters <math|a> and <math|b>.

    Incorporation of an additional observation of <math|x = 1> simply
    corresponds to incrementing the value of <math|a> by <math|1>, whereas
    for an observation of <math|x = 0> we increment <math|b> by <math|1>.

    Figure <inactive|<hybrid|ref|fig2.3>> illustrates one step in this
    process.

    \;
  </hidden>|<\hidden>
    <\padded-center>
      \;

      \;

      <small-figure|<image|image/fig_2_3_beta_posterior.png|.9par|||>|Illustration
      of one step of sequential Bayesian inference. The prior is given by a
      beta distribution with parameters <math|a = 2, b = 2>, and the
      likelihood function, given by Eq. <eqref|2.9> with <math|N = m = 1>,
      corresponds to a single observation of <math|x = 1>, so that the
      posterior is given by a beta distribution with parameters <math|a = 3,
      b = 2>.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Sequential approach>

    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      This <math|sequential> approach to learning arises naturally when we
      adopt a Bayesian viewpoint.
    </shown>|<\shown>
      It is independent of the choice of prior and of the likelihood function
      and depends only on the assumption of i.i.d. data.
    </shown>|<\shown>
      Sequential methods make use of observations one at a time, or in small
      batches, and then discard them before the next observations are used.
    </shown>|<\shown>
      They can be used, for example, in real-time learning scenarios where a
      steady stream of data is arriving, and predictions must be made before
      all of the data is seen.
    </shown>|<\shown>
      Because they do not require the whole data set to be stored or loaded
      into memory, sequential methods are also useful for large data sets.
    </shown>|<\shown>
      Maximum likelihood methods can also be cast into a sequential
      framework.
    </shown>>
  </hidden>|<\hidden>
    <tit|Prediction>

    If our goal is to predict, as best we can, the outcome of the next trial,
    then we must evaluate the predictive distribution of <math|x>, given the
    observed data set <math|\<cal-D\>>. From the sum and product rules of
    probability, this takes the form

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|x=1\|\<cal-D\>|)>>|<cell|=>|<cell|<big|int><rsub|0><rsup|1>p<around*|(|x=1\|\<mu\>|)>p<around*|(|\<mu\>\|\<cal-D\>|)>\<mathd\>\<mu\>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|0><rsup|1>\<mu\>p<around*|(|\<mu\>\|\<cal-D\>|)>\<mathd\>\<mu\>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><around*|[|\<mu\>\|\<cal-D\>|]>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    Using the result <eqref|2.18> for the posterior distribution
    <math|p(\<mu\>\|\<cal-D\>)>, together with the result <eqref|2.15> for
    the mean of the beta distribution, we obtain

    <\equation>
      \ p(x = 1\|\<cal-D\>) = <frac|m + a| m + a + l + b><label|2.20>
    </equation>

    which has a simple interpretation as the total fraction of observations
    (both real observations and fictitious prior observations) that
    correspond to <math|x = 1>.

    Note that in the limit of an infinitely large data set <math|m, l
    \<rightarrow\> \<infty\>> the result <eqref|2.20> reduces to the maximum
    likelihood result <eqref|2.8>.

    As we shall see, it is a very general property that the Bayesian and
    maximum likelihood results will agree in the limit of an infinitely large
    data set.

    For a finite data set, the posterior mean for <math|\<mu\>> always lies
    between the prior mean and the maximum likelihood estimate for
    <math|\<mu\>> corresponding to the relative frequencies of events given
    by Eq. <eqref|2.7>.
  </hidden>|<\hidden>
    <tit|Effect of <math|\<cal-D\>>>

    Consider a general Bayesian inference problem for a parameter
    <math|\<theta\>> for which we have observed a data set <math|\<cal-D\>>,
    described by the joint distribution <math|p(\<theta\>,\<cal-D\>)>.

    The following result

    <\equation*>
      \<bbb-E\><rsub|\<theta\>>[\<theta\>] =
      \<bbb-E\><rsub|\<cal-D\>>[\<bbb-E\><rsub|\<theta\>>[\<theta\>\|\<cal-D\>]]
    </equation*>

    where \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><rsub|\<theta\>><around*|[|\<theta\>|]>>|<cell|\<equiv\>>|<cell|<big|int>\<theta\>p<around*|(|\<theta\>|)>\<mathd\>\<theta\>>>|<row|<cell|\<bbb-E\><rsub|\<cal-D\>><around*|[|\<bbb-E\><rsub|\<theta\>><around*|[|\<theta\>\|\<cal-D\>|]>|]>>|<cell|=>|<cell|<big|int><around*|{|<big|int>\<theta\>p<around*|(|\<theta\>\|\<cal-D\>|)>\<mathd\>\<theta\>|}>p<around*|(|\<cal-D\>|)>\<mathd\>\<cal-D\>>>>>
    </eqnarray*>

    says that the posterior mean of <math|\<theta\>>, averaged over the
    distribution generating the data, is equal to the prior mean of
    <math|\<theta\>>.
  </hidden>|<\hidden>
    \ Similarly, we can show that

    <\equation*>
      \ var<rsub|\<theta\>>[\<theta\>] = \<bbb-E\><rsub|\<cal-D\>>
      [var<rsub|\<theta\>>[\<theta\>\|\<cal-D\>]] + var<rsub|\<cal-D\>>
      [\<bbb-E\><rsub|\<theta\>>[\<theta\>\|\<cal-D\>]]
    </equation*>

    The term on the left-hand side is the prior variance of <math|\<theta\>>.

    On the righthand side, the first term is the average posterior variance
    of <math|\<theta\>>, and\ 

    the second term measures the variance in the posterior mean of
    <math|\<theta\>>.

    Because this variance is a positive quantity, this result shows that, on
    average, the posterior variance of <math|\<theta\>> is smaller than the
    prior variance.

    The reduction in variance is greater if <math|var<rsub|\<cal-D\>>
    [\<bbb-E\><rsub|\<theta\>>[\<theta\>\|\<cal-D\>]]> is greater.

    Note, however, that this result only holds on average, and that for a
    particular observed data set it is possible for the posterior variance to
    be larger than the prior variance.
  </hidden>|<\shown>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|Multinomial Variables>
    </padded-center>
  </shown>>
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
    <associate|2.13|<tuple|7|?>>
    <associate|2.15|<tuple|8|?>>
    <associate|2.18|<tuple|9|?>>
    <associate|2.20|<tuple|10|?>>
    <associate|2.3|<tuple|1|?>>
    <associate|2.4|<tuple|2|?>>
    <associate|2.5|<tuple|3|?>>
    <associate|2.7|<tuple|4|?>>
    <associate|2.8|<tuple|5|?>>
    <associate|2.9|<tuple|6|?>>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|1|?>>
    <associate|auto-3|<tuple|2|?>>
    <associate|auto-4|<tuple|3|?>>
    <associate|auto-5|<tuple|2|?>>
    <associate|fig2.1|<tuple|1|?>>
    <associate|fig2.2|<tuple|2|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||Histogram plot of
      the binomial distribution (<reference|2.9>) as a function of m for
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N
      = 10>> and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<mu\>
      = 0.25>>.>|<pageref|auto-2>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|2>||Plots of the beta
      distribution <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|Beta(\<mu\>\|a,
      b)>> given by Eq.(<reference|2.13>) as a function of
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<mu\>>>
      for various values of the hyperparameters
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|a>>
      and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|b>>.>|<pageref|auto-3>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3>||Illustration of one
      step of sequential Bayesian inference. The prior is given by a beta
      distribution with parameters <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|a
      = 2, b = 2>>, and the likelihood function, given by Eq.
      (<reference|2.9>) with <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N
      = m = 1>>, corresponds to a single observation of
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|x
      = 1>>, so that the posterior is given by a beta distribution with
      parameters <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|a
      = 3, b = 2>>.>|<pageref|auto-4>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Binary
      Variables> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Multinomial
      Variables> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>