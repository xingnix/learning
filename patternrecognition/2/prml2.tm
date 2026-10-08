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
      Bin<around*|(|m\|N,\<mu\>|)>>>|<row|<cell|>|<cell|=>|<cell|N\<mu\><eq-number><label|2.11>>>|<row|<cell|var<around*|[|m|]>>|<cell|=>|<cell|<big|sum><rsub|m=0><rsup|N><around*|(|m-\<bbb-E\><around*|[|m|]>|)><rsup|2>Bin<around*|(|m\|N,\<mu\>|)>>>|<row|<cell|>|<cell|=>|<cell|N\<mu\><around*|(|1-\<mu\>|)><eq-number><label|2.12>>>>>
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
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|Multinomial Variables>
    </padded-center>
  </hidden>|<\hidden>
    <tit|K-value descrete variables>

    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      Binary variables can be used to describe quantities that can take one
      of two possible values.
    </shown>|<\shown>
      How about discrete variables that can take on one of K possible
      mutually exclusive states?
    </shown>|<\shown>
      A representation is the 1-of-K scheme in which the variable is
      represented by a K-dimensional vector <math|\<b-x\>> in which one of
      the elements <math|x<rsub|k>> equals 1, and all remaining elements
      equal 0.
    </shown>>
  </hidden>|<\hidden>
    <tit|Example(K=6)>

    If a variable that can take <math|K = 6> states and a particular
    observation of the variable happens to correspond to the state where
    <math|x<rsub|3> = 1>, then <math|\<b-x\>> will be represented by

    <\equation*>
      \<b-x\> = (0, 0, 1, 0, 0, 0)<rsup|T>.
    </equation*>

    Note that such vectors satisfy <math|<big|sum><rsub|k=1><rsup|K>x<rsub|k>=1>.
  </hidden>|<\hidden>
    <tit|K-value descrete variables>

    If we denote the probability of <math|x<rsub|k>= 1> \ by the parameter
    <math|\<mu\><rsub|k>>, then the distribution of <math|\<b-x\>> is given

    <\equation*>
      p(x\|\<mu\>) =<big|sum><rsub|k=1><rsup|K>\<mu\><rsup|x<rsub|k>><rsub|k>
    </equation*>

    where

    <\equation*>
      \<b-mu\> = (\<mu\><rsub|1>, . . . , \<mu\><rsub|K>)<rsup|T>,
    </equation*>

    and the parameters <math|\<mu\><rsub|k>> are constrained to satisfy

    <\equation*>
      \<mu\><rsub|k>\<geqslant\>0<infix-and><big|sum><rsub|k=1><rsup|K>\<mu\><rsub|k>=1.
    </equation*>

    <math|>It can be \ regarded as a generalization of the Bernoulli
    distribution to more than two outcomes.
  </hidden>|<\hidden>
    <tit|<math|\<bbb-E\><around*|(|\<b-x\>\|\<b-mu\>|)>,cov<around*|[|\<b-x\>\|\<b-mu\>|]>>>

    It is easily seen that the distribution is normalized

    <\eqnarray*>
      <tformat|<table|<row|<cell|<big|sum><rsub|\<b-x\>>p<around*|(|\<b-x\>\|\<b-mu\>|)>>|<cell|=>|<cell|<big|sum><rsub|k=1><rsup|K>\<mu\><rsub|k>>>|<row|<cell|>|<cell|=>|<cell|1>>>>
    </eqnarray*>

    and that

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<b-x\>\|\<b-mu\>|]>>|<cell|=>|<cell|<big|sum><rsub|\<b-x\>>p<around*|(|\<b-x\>\|\<b-mu\>|)>\<b-x\>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|\<mu\><rsub|1>,\<cdots\>,\<mu\><rsub|K>|)><rsup|T>=\<b-mu\>>>|<row|<cell|cov<around*|[|\<b-x\>\|\<b-mu\>|]>>|<cell|=>|<cell|<big|sum><rsub|\<b-x\>>p<around*|(|\<b-x\>\|\<b-mu\>|)><around*|(|\<b-x\>-\<bbb-E\><around*|[|\<b-x\>\|\<b-mu\>|]>|)><around*|(|\<b-x\>-\<bbb-E\><around*|[|\<b-x\>\|\<b-mu\>|]>|)><rsup|T>>>|<row|<cell|>|<cell|=>|<cell|diag<around*|(|\<b-mu\>|)>-\<b-mu\>\<b-mu\><rsup|T>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Likelihood>

    A data set <math|\<cal-D\>> of <math|N> independent observations
    <math|\<b-x\><rsub|1>, . . . , \<b-x\><rsub|N>>.\ 

    Corresponding likelihood function takes the form,

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<cal-D\>\|\<b-mu\>|)>>|<cell|=>|<cell|<big|prod><rsub|n=1><rsup|N><big|prod><rsub|k=1><rsup|K>\<mu\><rsub|k><rsup|x<rsub|nk>>>>|<row|<cell|>|<cell|=>|<cell|<big|prod><rsub|k=1><rsup|K>\<mu\><rsub|k><rsup|<around*|(|<big|sum><rsub|n>x<rsub|nk>|)>>>>|<row|<cell|>|<cell|=>|<cell|<big|prod><rsub|k=1><rsup|K>\<mu\><rsub|k><rsup|m<rsub|k>><eq-number><label|2.29>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|sufficient statistics>

    The likelihood function depends on the <math|N> data points only through
    the <math|K> quantities

    <\equation*>
      m<rsub|k>=<big|sum><rsub|n=1><rsup|N>x<rsub|nk>
    </equation*>

    which represent the number of observations of xk = 1. These are called
    the <em|sufficient statistics> for this distribution.
  </hidden>|<\hidden>
    <tit|Maximum likelihood>

    In order to find the maximum likelihood solution for <math|\<b-mu\>>, we
    need to maximize <math|ln p(\<cal-D\>\|\<b-mu\>)> with respect to
    <math|\<mu\><rsub|k>> taking account of the constraint that the
    <math|\<mu\><rsub|k>> must sum \ to one.

    This can be achieved using a Lagrange multiplier <math|\<lambda\>> and
    maximizing

    <\equation*>
      <big|sum><rsub|k=1><rsup|K>m<rsub|k>ln \<mu\><rsub|k> + \<lambda\>
      \ (<big|sum><rsub|k=1><rsup|K>\<mu\><rsub|k> \<minus\> 1 \ )
    </equation*>

    Setting the derivative with respect to <math|\<mu\><rsub|k>> to zero,
    obtain

    <\equation*>
      \<mu\><rsub|k>=\<minus\>m<rsub|k>/\<lambda\>.
    </equation*>
  </hidden>|<\hidden>
    <tit|Solution>

    Solve for the Lagrange multiplier <math|\<lambda\>> by substituting into
    the constraint

    <\equation*>
      <big|sum><rsub|k=1><rsup|K>\<mu\><rsub|k> = 1
    </equation*>

    to give

    <\equation*>
      \<lambda\> = \<minus\>N .
    </equation*>

    Obtain the maximum likelihood solution in \ the form

    <\equation*>
      \<mu\><rsub|k><rsup|<around*|(|ML|)>>=<frac|m<rsub|k>|N>
    </equation*>

    which is the fraction of the <math|N> observations for which
    <math|x<rsub|k>=1>.
  </hidden>|<\hidden>
    <tit|Multinomial distribution>

    Consider the joint distribution of the quantities <math|m<rsub|1>, . . .
    , m<rsub|K>>, conditioned on the parameters <math|\<b-mu\>> and on the
    total number <math|N> of observations.

    From Eq. <eqref|2.29> this takes the form

    <\equation>
      Mult(m<rsub|1>, m<rsub|2>, . . . , m<rsub|K>\|\<b-mu\>,N )
      =<choose|N|m<rsub|1>m<rsub|2>\<cdots\>m<rsub|K>><big|prod><rsub|k=1><rsup|K>\<mu\><rsub|k><rsup|m<rsub|k>><label|2.34>
    </equation>

    which is known as the <em|multinomial distribution>.\ 
  </hidden>|<\hidden>
    <tit|Normalization coefficient>

    The normalization coefficient is the number of ways of partitioning
    <math|N> objects into K groups of size <math|m<rsub|1>, . . . ,
    m<rsub|K>> and is given by

    <\equation*>
      <choose|N|m<rsub|1>m<rsub|2>\<cdots\>m<rsub|K>>=
      <frac|N!|m<rsub|1>!m<rsub|2>!\<cdots\>m<rsub|K>!>
    </equation*>

    Note that the variables <math|m<rsub|k>> are subject to the constraint

    <\equation*>
      <big|sum><rsub|k=1><rsup|K>m<rsub|k>=N
    </equation*>
  </hidden>|<\hidden>
    <tit|Conjugate prior>

    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      We now introduce a family of prior distributions for the parameters
      <math|{\<mu\><rsub|k>}> of the multinomial distribution <eqref|2.34>.
    </shown>|<\shown>
      By inspection of the form of the multinomial distribution, we see that
      the conjugate prior is given by

      <\equation*>
        p<around*|(|\<b-mu\>\|\<b-alpha\>|)>\<propto\><big|prod><rsub|k=1><rsup|K>\<mu\><rsub|k><rsup|\<alpha\><rsub|k>-1>
      </equation*>
    </shown>|<\shown>
      where <math|0\<leqslant\>\<mu\><rsub|k>\<leqslant\>1> and
      <math|<big|sum><rsub|k>\<mu\><rsub|k>=1>. Here <math|\<alpha\><rsub|1>,
      . . . , \<alpha\><rsub|K>> are the parameters of the \ distribution,
      and <math|\<b-alpha\>> denotes <math|(\<alpha\><rsub|1>, . . . ,
      \<alpha\><rsub|K>)<rsup|T>>.\ 
    </shown>|<\shown>
      Note that, because of the summation constraint, the distribution over
      the space of the <math|{\<mu\><rsub|k>}> is confined to a simplex of
      dimensionality <math|K \<minus\> 1>, as illustrated for <math|K = 3> in
      Figure <reference|fig2.4>.
    </shown>>

    \;
  </hidden>|<\hidden>
    <small-figure|<image|image/fig_2_4_dirichlet_3.png|.3par|||>|<label|fig2.4>The
    Dirichlet distribution over three variables <math|\<mu\><rsub|1>,
    \<mu\><rsub|2>, \<mu\><rsub|3>> \ is confined to a simplex (a bounded
    linear manifold) of the form shown, as a consequence of the constraints
    <math|0\<leqslant\>\<mu\><rsub|k>\<leqslant\>1> and
    <math|<big|sum><rsub|k>\<mu\><rsub|k>=1>.>
  </hidden>|<\hidden>
    <tit|Dirichlet distribution>

    The normalized form for the distribution is by

    <\equation>
      Dir(\<b-mu\>\|\<b-alpha\>) = <frac|\<Gamma\>(\<alpha\><rsub|0>)|\<Gamma\><around*|(|\<alpha\><rsub|1>|)>\<cdots\>\<Gamma\><around*|(|\<alpha\><rsub|K>|)>><big|prod><rsub|k=1><rsup|K>\<mu\><rsub|k><rsup|\<alpha\><rsub|k>-1><label|2.38>
    </equation>

    which is called the Dirichlet distribution. Here <math|\<Gamma\>(x)> is
    the gamma function defined by (1.141) while

    <\equation*>
      \<alpha\><rsub|0> =<big|sum><rsub|k=1><rsup|K>\<alpha\><rsub|k>
    </equation*>
  </hidden>|<\hidden>
    <small-figure|<image|image/fig_2_5_dirichlet_alpha_k.png|.9par|||>|Plots
    of the Dirichlet distribution over three variables, where the two
    horizontal axes are coordinates in the plane of the simplex and the
    vertical axis corresponds to the value of the density. Here<math|
    {\<alpha\><rsub|k>} = 0.1> on the left plot, <math|{\<alpha\><rsub|k>} =
    1> in the centre plot, and <math|{\<alpha\><rsub|k>} = 10> in the right
    plot.>
  </hidden>|<\hidden>
    <tit|posterior distribution>

    Multiplying the prior <eqref|2.38> by the likelihood function
    <eqref|2.34>, we obtain the posterior distribution for the parameters
    <math|{\<mu\><rsub|k>}> in the form

    <\eqnarray*>
      <tformat|<table|<row|<cell|p(\<b-mu\>\|\<cal-D\>,\<b-alpha\>)
      >|<cell|\<propto\>>|<cell|p(\<b-mu\>\|\<cal-D\>,\<b-alpha\>)
      >>|<row|<cell|>|<cell|\<propto\>>|<cell|<big|prod><rsub|k=1><rsup|K>\<mu\><rsub|k><rsup|\<alpha\><rsub|k>+m<rsub|k>-1>>>>>
    </eqnarray*>

    We see that the posterior distribution again takes the form of a
    Dirichlet distribution, confirming that the Dirichlet is indeed a
    conjugate prior for the multinomial.

    \;
  </hidden>|<\hidden>
    <tit|Normalization coefficient>

    This allows us to determine the normalization coefficient by comparison
    with <eqref|2.38> so that

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<b-mu\>\|\<cal-D\>,\<b-alpha\>|)>>|<cell|=>|<cell|Dir<around*|(|\<b-mu\>\|\<b-alpha\>+\<b-m\>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<Gamma\><around*|(|\<alpha\><rsub|0>+N|)>|\<Gamma\><around*|(|\<alpha\><rsub|1>+m<rsub|1>|)>\<cdots\>\<Gamma\><around*|(|\<alpha\><rsub|K>+m<rsub|K>|)>><big|prod><rsub|k=1><rsup|K>\<mu\><rsub|k><rsup|\<alpha\><rsub|k>+m<rsub|k>-1>>>>>
    </eqnarray*>

    where we have denoted <math|m = (m<rsub|1>, . . . , m<rsub|K>)<rsup|T>>.

    As for the case of the binomial distribution with its beta prior, we can
    interpret the parameters <math|\<alpha\><rsub|k>> of the Dirichlet prior
    as an effective number of observations of <math|x<rsub|k> = 1>.

    Note that two-state quantities can either be represented as binary
    variables and modelled using the binomial distribution <eqref|2.9> or as
    1-of-2 variables and modelled using the multinomial distribution
    <eqref|2.34> with <math|K = 2>.
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    <\padded-center>
      <section|The Gaussian Distribution>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Univariate Gaussian>

    The Gaussian, also known as the normal distribution, is a widely used
    model for the distribution of continuous variables.\ 

    In the case of a single variable x, the Gaussian distribution can be
    written in the form

    <\equation*>
      \<cal-N\> (x\|\<mu\>, \<sigma\><rsup|2>)
      =<frac|1|<sqrt|2\<pi\>>\<sigma\>> \ exp \ {
      \ \<minus\><frac|1|2\<sigma\><rsup|2>>(x \<minus\> \<mu\>)<rsup|2> }
    </equation*>

    where <math|\<mu\>> is the mean and <math|\<sigma\><rsup|2>> is the
    variance.
  </hidden>|<\hidden>
    <tit|Multivariate Gaussian>

    For a D-dimensional vector <math|\<b-x\>>, the multivariate Gaussian
    distribution takes the form

    <\equation>
      \<cal-N\><around*|(|\<b-x\>\|\<b-mu\>,\<Sigma\>|)>=<frac|1|<around*|(|2\<pi\>|)><rsup|D/2><around*|\||\<Sigma\>|\|><rsup|1/2>>exp<around*|{|-<frac|1|2><around*|(|\<b-x\>-\<b-mu\>|)><rsup|T>\<Sigma\><rsup|-1><around*|(|\<b-x\>-\<b-mu\>|)>|}><label|2.43>
    </equation>

    where <math|\<b-mu\>> is a D-dimensional mean vector, <math|\<Sigma\>> is
    a <math|D\<times\>D> covariance matrix, and <math|\|\<Sigma\>\|> denotes
    the determinant of <math|\<Sigma\>>.
  </hidden>|<\hidden>
    <tit|Central limit theorem>

    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      The Gaussian distribution arises in many different contexts and can be
      motivated from a variety of different perspectives.
    </shown>|<\shown>
      For example, we have already seen that for \ a single real variable,
      the distribution that maximizes the entropy is the Gaussian. This
      property applies also to the multivariate Gaussian.
    </shown>|<\shown>
      Another situation in which the Gaussian distribution arises is when we
      consider the sum of multiple random variables.\ 
    </shown>|<\shown>
      The <em|central limit theorem> (due to Laplace) tells us that, subject
      to certain mild conditions, the sum of a set of random variables, which
      is of course itself a random variable, has a distribution that becomes
      increasingly Gaussian as the number of terms in the sum increases
      (Walker, 1969).
    </shown>>
  </hidden>|<\hidden>
    <tit|Example>

    We can illustrate this by considering N variables <math|x<rsub|1>, . . .
    , x<rsub|N>> each of which has a uniform distribution over the interval
    <math|[0, 1]> and then considering the distribution of the mean
    <math|(x<rsub|1> +\<cdots\> + x<rsub|N> )/N> .

    For large <math|N> , this distribution tends to a Gaussian, as
    illustrated in Figure 2.6.

    In practice, the convergence to a Gaussian as <math|N> increases can be
    very rapid. One consequence of this result is that the binomial
    distribution <eqref|2.9>, which is a distribution over <math|m> defined
    by the sum of <math|N> observations of the random binary variable
    <math|x>, will tend to a Gaussian as <math|N \<rightarrow\> \<infty\>>
    (see Figure <reference|fig2.1> for the case of <math|N=10>).
  </hidden>|<\hidden>
    \;

    \;

    \;

    <small-figure|<image|image/fig_2_6_central_limit.png|.9par|||>|Histogram
    plots of the mean of <math|N> uniformly distributed numbers for various
    values of <math|N> . We observe that as <math|N> increases, the
    distribution tends towards a Gaussian.>
  </hidden>|<\hidden>
    <tit|Geometrical form>

    Consider the geometrical form of the Gaussian distribution. The
    functional dependence of the Gaussian on <math|x> is through the
    quadratic form

    <\equation>
      \<Delta\><rsup|2>=<around*|(|\<b-x\>-\<b-mu\>|)><rsup|T>\<Sigma\><rsup|-1><around*|(|\<b-x\>-\<b-mu\>|)><label|2.44>
    </equation>

    which appears in the exponent.

    The quantity <math|\<#2206\>> is called the <em|Mahalanobis distance>
    from <math|\<b-mu\>> to <math|\<b-x\>> and reduces to the <em|Euclidean
    distance> when <math|\<Sigma\>> is the identity matrix.

    The Gaussian distribution will be constant on surfaces in x-space for
    which this quadratic form is constant.
  </hidden>|<\hidden>
    <tit|<math|\<Sigma\><rsub|ij>=\<Sigma\><rsub|ji>>>

    First of all, we note that the matrix <math|\<Sigma\>> can be taken to be
    symmetric, without loss of generality, because any antisymmetric
    component would disappear from the exponent.

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<Sigma\>>|<cell|=>|<cell|\<Sigma\><rsup|<around*|(|s|)>>+\<Sigma\><rsup|<around*|(|a|)>>>>|<row|<cell|\<Sigma\><rsup|<around*|(|s|)>><rsub|ij>>|<cell|=>|<cell|<frac|1|2><around*|(|\<Sigma\><rsub|ij>+\<Sigma\><rsub|ji>|)>>>|<row|<cell|\<Sigma\><rsup|<around*|(|a|)>><rsub|ij>>|<cell|=>|<cell|<frac|1|2><around*|(|\<Sigma\><rsub|ij>-\<Sigma\><rsub|ji>|)>>>|<row|<cell|\<b-x\><rsup|T>\<Sigma\><rsup|<around*|(|a|)>>\<b-x\>>|<cell|=>|<cell|<big|sum><rsub|i><big|sum><rsub|j>x<rsub|i>\<Sigma\><rsup|<around*|(|a|)>><rsub|ij>x<rsub|j>>>|<row|<cell|>|<cell|=>|<cell|0>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Eigenvector>

    Consider the eigenvector equation for the covariance matrix

    <\equation>
      \<Sigma\>\<b-u\><rsub|i>=\<lambda\><rsub|i>\<b-u\><rsub|i><label|2.45>
    </equation>

    where <math|i = 1, . . . , D>. Because <math|\<Sigma\>> is a real,
    symmetric matrix its eigenvalues will be real, and its eigenvectors can
    be chosen to form an orthonormal set, so that

    <\equation>
      \<b-u\><rsub|i><rsup|T>\<b-u\><rsub|j>=I<rsub|ij><label|2.46>
    </equation>

    where <math|I<rsub|ij>> is the <math|i, j> element of the identity matrix
    and satisfies

    <\equation*>
      I<rsub|ij>=<choice|<tformat|<table|<row|<cell|1,>|<cell|if
      i=j>>|<row|<cell|0,>|<cell|otherwise>>>>> \ 
    </equation*>
  </hidden>|<\hidden>
    <tit|<math|\<Sigma\>> decomposition>

    The covariance matrix <math|\<Sigma\>> can be expressed as an expansion
    in terms of its eigenvectors in the form

    <\equation>
      \ \<Sigma\>=<big|sum><rsub|i=1><rsup|D>\<lambda\><rsub|i>\<b-u\><rsub|i>\<b-u\><rsub|i><rsup|T><label|2.48>
    </equation>

    and similarly the inverse covariance matrix
    <math|\<Sigma\><rsup|\<minus\>1>> can be expressed as

    <\equation>
      \<Sigma\><rsup|\<minus\>1> =<big|sum><rsub|i=1><rsup|D><frac|1|\<lambda\><rsub|i>>\<b-u\><rsub|i>\<b-u\><rsub|i><rsup|T><label|2.49>
    </equation>

    \;
  </hidden>|<\hidden>
    <tit|Projection>

    Substituting Eq. <eqref|2.49> into Eq. <eqref|2.44>, the quadratic form
    becomes

    <\equation>
      \<#2206\><rsup|2> =<big|sum><rsub|i=1><rsup|D><frac|y<rsub|i><rsup|2>|\<lambda\><rsub|i>><label|2.50>
    </equation>

    where we have defined

    <\equation*>
      y<rsub|i>=\<b-u\><rsub|i><rsup|T>(\<b-x\>\<minus\>\<b-mu\>).
    </equation*>

    \;
  </hidden>|<\hidden>
    <tit|Coordinate transformation>

    We can interpret <math|{y<rsub|i>}> as a new coordinate system defined by
    the orthonormal vectors <math|\<b-u\><rsub|i>> that are shifted and
    rotated with respect to the original <math|x<rsub|i>> coordinates.
    Forming the vector <math|y = (y<rsub|1>, . . . , y<rsub|D>)<rsup|T>,> we
    have

    <\equation*>
      y = U(\<b-x\>\<minus\>\<b-mu\>)
    </equation*>

    where <math|U> is a matrix whose rows are given by
    <math|\<b-u\><rsub|i><rsup|T>>. From Eq. <eqref|2.46> it follows that
    <math|U> is<space|1em>an <em|orthogonal> matrix, i.e., it satisfies

    <\equation*>
      UU<rsup|T>=I,
    </equation*>

    and hence also

    <\equation*>
      U<rsup|T>U=I,
    </equation*>

    where <math|I> \ is the identity matrix.
  </hidden>|<\hidden>
    <tit|Isosurface>

    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      The quadratic form, and hence the Gaussian density, will be constant on
      surfaces for which Eq. <eqref|2.50> is constant.
    </shown>|<\shown>
      If all of the eigenvalues <math|\<lambda\><rsub|i>> are positive, then
      these surfaces represent ellipsoids, with their centres at
      <math|\<b-mu\>> and their axes oriented along <math|\<b-u\><rsub|i>>,
      and with scaling factors in the directions of the axes given by
      <math|\<lambda\><rsup|1/2><rsub|i>> , as illustrated in Figure
      <reference|fig2.7>.
    </shown>>
  </hidden>|<\hidden>
    <small-figure|<image|image/fig_2_7_transform.png|.5par|||>|<label|fig2.7>The
    red curve shows the elliptical surface of constant probability density
    for a Gaussian in a two-dimensional space <math|x = (x<rsub|1>,
    x<rsub|2>)> on which the density is <math|exp(\<minus\>1/2)> of its value
    at <math|x = \<mu\>>. The axes of the ellipse are defined by the
    eigenvectors <math|\<b-u\><rsub|i>> of the covariance matrix, with
    corresponding eigenvalues <math|\<lambda\><rsub|i>>.>
  </hidden>|<\hidden>
    <tit|<math|\<lambda\><rsub|i>>>

    <unroll-greyed|<\shown>
      For the Gaussian distribution to be well defined, it is necessary for
      all of the eigenvalues <math|\<lambda\><rsub|i>> of the covariance
      matrix to be strictly positive, otherwise the distribution cannot be
      properly normalized.
    </shown>|<\shown>
      A matrix whose eigenvalues are strictly positive is said to be
      <em|positive definite>.
    </shown>|<\shown>
      If one or more of the eigenvalues are zero, the distribution is
      singular and is confined to a subspace of lower dimensionality.
    </shown>|<\shown>
      If all of the eigenvalues are nonnegative, then the covariance matrix
      is said to be <em|positive semidefinite.>
    </shown>>
  </hidden>|<\hidden>
    <tit|Jacobian>

    In going from the <math|x> to the <math|y> coordinate system, we have a
    Jacobian matrix <math|J> with elements given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|J<rsub|i
      j>>|<cell|=>|<cell|<frac|\<partial\>x<rsub|i>|\<partial\>y<rsub|i>>>>|<row|<cell|>|<cell|=>|<cell|U<rsub|j
      i>>>>>
    </eqnarray*>

    where <math|U<rsub|ji>> are the elements of the matrix <math|U<rsup|T>>.
  </hidden>|<\hidden>
    <tit|<math|<around*|\||J|\|>>>

    Using the orthonormality property of the matrix <math|U>, we see that the
    square of the determinant of the Jacobian matrix is

    <\eqnarray*>
      <tformat|<table|<row|<cell|<around*|\||J|\|><rsup|2>>|<cell|=>|<cell|<around*|\||U<rsup|T>|\|><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<around*|\||U<rsup|T>|\|><around*|\||U|\|>>>|<row|<cell|>|<cell|=>|<cell|<around*|\||U<rsup|T>U|\|>>>|<row|<cell|>|<cell|=>|<cell|1>>|<row|<cell|<around*|\||J|\|>>|<cell|=>|<cell|1>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|<math|<around*|\||\<Sigma\>|\|>>>

    The determinant <math|\|\<Sigma\>\|> of the covariance matrix can be
    written as the product of its eigenvalues,

    <\eqnarray*>
      <tformat|<table|<row|<cell|<around*|\||\<Sigma\>|\|><rsup|1/2>>|<cell|=>|<cell|<around*|\||<big|sum><rsub|i=1><rsup|D>\<lambda\><rsub|i>\<b-u\><rsub|i>\<b-u\><rsub|i><rsup|T>|\|><rsup|1/2>>>|<row|<cell|>|<cell|=>|<cell|<around*|\||U<rsup|T><rsup|>\<Lambda\>U|\|><rsup|1/2>>>|<row|<cell|>|<cell|=>|<cell|<around*|\||U<rsup|T>|\|><rsup|1/2><around*|\||\<Lambda\>|\|><rsup|1/2><around*|\||U|\|><rsup|1/2>>>|<row|<cell|>|<cell|=>|<cell|<big|prod><rsub|j=1><rsup|D>\<lambda\><rsub|j><rsup|1/2><eq-number><label|2.55>>>|<row|<cell|\<Lambda\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<lambda\><rsub|1>>|<cell|>|<cell|>>|<row|<cell|>|<cell|\<ddots\>>|<cell|>>|<row|<cell|>|<cell|>|<cell|\<lambda\><rsub|i>>>>>>>>>>
    </eqnarray*>

    <\equation*>
      \;
    </equation*>
  </hidden>|<\hidden>
    <tit|<math|p<around*|(|\<b-y\>|)>>>

    Thus in the <math|y<rsub|j>> coordinate system, the Gaussian distribution
    takes the form

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<b-y\>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\>|)><around*|\||J|\|>>>|<row|<cell|>|<cell|=>|<cell|<big|prod><rsub|j=1><rsup|D><frac|1|<around*|(|2\<pi\>\<lambda\><rsub|j>|)><rsup|1/2>>exp<around*|{|-<frac|y<rsub|j><rsup|2>|2\<lambda\><rsub|j>>|}>>>>>
    </eqnarray*>

    which is the product of <math|D> independent univariate Gaussian
    distributions.

    The eigenvectors therefore define a new set of shifted and rotated
    coordinates with respect to which the joint probability distribution
    factorizes into a product of independent distributions.
  </hidden>|<\hidden>
    <tit|Normalization>

    The integral of the distribution in the y coordinate system is then

    <\eqnarray*>
      <tformat|<table|<row|<cell|<big|int>p<around*|(|\<b-y\>|)>\<mathd\>\<b-y\>>|<cell|=>|<cell|<big|prod><rsub|j=1><rsup|D><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|1|<around*|(|2\<pi\>\<lambda\><rsub|j>|)><rsup|1/2>>exp<around*|{|-<frac|y<rsub|j><rsup|2>|2\<lambda\><rsub|j>>|}>\<mathd\>y<rsub|j>>>|<row|<cell|>|<cell|=>|<cell|1>>>>
    </eqnarray*>

    where we have used the result (1.48) for the normalization of the
    univariate Gaussian.

    This confirms that the multivariate Gaussian <eqref|2.43> is indeed
    normalized.
  </hidden>|<\hidden>
    <tit|<math|\<bbb-E\><around*|[|\<b-x\>|]>>>

    We now look at the moments of the Gaussian distribution and thereby
    provide an interpretation of the parameters <math|\<b-mu\>> and
    <math|\<Sigma\>>.\ 

    The expectation of <math|\<b-x\>> under the Gaussian distribution is
    given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<b-x\>|]>>|<cell|=>|<cell|<frac|1|<around*|(|2\<pi\>|)><rsup|D/2><around*|\||\<Sigma\>|\|><rsup|1/2>><big|int>exp<around*|{|-<frac|1|2><around*|(|\<b-x\>-\<b-mu\>|)><rsup|T>\<Sigma\><rsup|-1><around*|(|\<b-x\>-\<b-mu\>|)>|}>\<b-x\>\<mathd\>\<b-x\>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|<around*|(|2\<pi\>|)><rsup|D/2><around*|\||\<Sigma\>|\|><rsup|1/2>><big|int>exp<around*|{|-<frac|1|2>\<b-z\><rsup|T>\<Sigma\><rsup|-1>\<b-z\>|}><around*|(|\<b-z\>+\<b-mu\>|)>\<mathd\>\<b-z\>>>>>
    </eqnarray*>

    where we have changed variables using <math|\<b-z\>= \<b-x\>\<minus\>
    \<b-mu\>>.

    \;
  </hidden>|<\hidden>
    <tit|<math|\<bbb-E\>[\<b-x\>] = \<b-mu\>>>

    \;

    We now note that the exponent is an even function of the components of
    <math|\<b-z\>>.

    The integrals over these are taken over the range
    <math|(\<minus\>\<infty\>,\<infty\>)>.

    The term in <math|\<b-z\>> in the factor <math|(z+\<mu\>)> will vanish by
    symmetry.

    Thus

    <\equation*>
      \<bbb-E\>[\<b-x\>] = \<b-mu\>
    </equation*>

    and so we refer to <math|\<b-mu\>> as the mean of the Gaussian
    distribution.
  </hidden>|<\hidden>
    <tit|<math|\<bbb-E\><around*|[|\<b-x\>\<b-x\><rsup|T>|]>>>

    We now consider second order moments of the Gaussian. In the univariate
    case, we considered the second order moment given by
    <math|\<bbb-E\>[x<rsup|2>]>.

    For the multivariate Gaussian, there are <math|D<rsup|2>> second order
    moments given by <math|\<bbb-E\>[x<rsub|i>x<rsub|j>]>, which we can group
    together to form the matrix <math|\<bbb-E\>[\<b-x\>\<b-x\><rsup|T>]>.

    This matrix can be written as

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<b-x\>\<b-x\><rsup|T>|]>>|<cell|=>|<cell|<frac|1|<around*|(|2\<pi\>|)><rsup|D/2><around*|\||\<Sigma\>|\|><rsup|1/2>><big|int>exp<around*|{|-<frac|1|2><around*|(|\<b-x\>-\<b-mu\>|)><rsup|T>\<Sigma\><rsup|-1><around*|(|\<b-x\>-\<b-mu\>|)>|}>\<b-x\>\<b-x\><rsup|T>\<mathd\>\<b-x\>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|<around*|(|2\<pi\>|)><rsup|D/2><around*|\||\<Sigma\>|\|><rsup|1/2>><big|int>exp<around*|{|-<frac|1|2>\<b-z\><rsup|T>\<Sigma\><rsup|-1>\<b-z\>|}><around*|(|\<b-z\>+\<b-mu\>|)><around*|(|\<b-z\>+\<b-mu\>|)><rsup|T>\<mathd\>\<b-z\>>>>>
    </eqnarray*>

    where again we have changed variables using
    <math|\<b-z\>=\<b-x\>-\<b-mu\>>.
  </hidden>|<\hidden>
    <tit|<math|\<b-mu\>\<b-z\><rsup|T>,\<b-z\>\<b-mu\><rsup|T>,\<b-z\>\<b-z\><rsup|T>>>

    Note that the cross-terms involving <math|\<b-mu\>\<b-z\><rsup|T>> and
    <math|\<b-z\>\<b-mu\><rsup|T>> will again vanish by symmetry.

    The term <math|\<b-mu\>\<b-mu\><rsup|T>> is constant and can be taken
    outside the integral, which itself is unity because the Gaussian
    distribution is normalized.

    Consider the term involving <math|\<b-z\>\<b-z\><rsup|T>>.\ 

    \;
  </hidden>|<\hidden>
    Again, we can make use of the eigenvector expansion of the covariance
    matrix given by Eq. <eqref|2.45>, together with the completeness of the
    set of eigenvectors, to write

    <\equation*>
      \<b-z\>=<big|sum><rsub|j=1><rsup|D>y<rsub|j>\<b-u\><rsub|j>
    </equation*>

    where <math|y<rsub|j>=\<b-u\><rsub|j><rsup|T>\<b-z\>>, which gives

    <\eqnarray*>
      <tformat|<table|<row|<cell|>|<cell|>|<cell|<frac|1|<around*|(|2\<pi\>|)><rsup|D/2><around*|\||\<Sigma\>|\|><rsup|1/2>><big|int>exp<around*|{|-<frac|1|2>\<b-z\><rsup|T>\<Sigma\><rsup|-1>\<b-z\>|}><around*|(|\<b-z\>+\<b-mu\>|)><around*|(|\<b-z\>+\<b-mu\>|)><rsup|T>\<mathd\>\<b-z\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <\eqnarray*>
      <tformat|<table|<row|<cell|>|<cell|>|<cell|<frac|1|<around*|(|2\<pi\>|)><rsup|D/2><around*|\||\<Sigma\>|\|><rsup|1/2>><big|int>exp<around*|{|-<frac|1|2>\<b-z\><rsup|T>\<Sigma\><rsup|-1>\<b-z\>|}><around*|(|\<b-z\>+\<b-mu\>|)><around*|(|\<b-z\>+\<b-mu\>|)><rsup|T>\<mathd\>\<b-z\>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i=1><rsup|D><big|sum><rsub|j=1><rsup|D>\<b-u\><rsub|i>\<b-u\><rsub|j><rsup|T><around*|{|<frac|1|<around*|(|2\<pi\>|)><rsup|D/2><around*|\||\<Sigma\>|\|><rsup|1/2>><big|int>exp<around*|(|<big|sum><rsub|k=1><rsup|D><frac|y<rsub|k><rsup|2>|2\<lambda\><rsub|k>>|)>y<rsub|i>y<rsub|j>\<mathd\>\<b-y\>|}>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i=1><rsup|D>\<b-u\><rsub|i>\<b-u\><rsub|i><rsup|T>\<lambda\><rsub|i>>>|<row|<cell|>|<cell|=>|<cell|\<Sigma\>>>>>
    </eqnarray*>

    where we have made use of \ Eq. <eqref|2.45> and <eqref|2.49>, together
    with the fact that the integral on the right-hand side of the middle line
    vanishes by symmetry unless <math|i=j>, and in the final line we have
    made use of the results (1.50) and Eq. <eqref|2.55>, together with Eq.
    <eqref|2.48>. Thus we have

    <\equation>
      \ E[\<b-x\>\<b-x\><rsup|T>] =\<b-mu\>\<b-mu\><rsup|T> +
      \<Sigma\>.<label|2.62>
    </equation>
  </hidden>|<\hidden>
    <tit|<math|cov[\<b-x\>] >>

    For single random variables, we subtracted the mean before taking second
    moments in order to define a variance.

    Similarly, in the multivariate case it is again convenient to subtract
    off the mean, giving rise to the covariance of a random vector <math|x>
    defined by

    <\equation*>
      cov[\<b-x\>] =\<bbb-E\> [(\<b-x\> \<minus\>\<bbb-E\>[\<b-x\>])(\<b-x\>
      \<minus\> \<bbb-E\>[\<b-x\>])<rsup|T>]\ 
    </equation*>

    \;
  </hidden>|<\hidden>
    <tit|Covariance matrix>

    For the specific case of a Gaussian distribution, we can make use of

    <\equation*>
      \<bbb-E\>[\<b-x\>] =\<b-mu\>,
    </equation*>

    together with the result Eq. <eqref|2.62>, to give

    <\equation*>
      \ cov[\<b-x\>] = \<Sigma\>.
    </equation*>

    Because the parameter matrix <math|\<Sigma\>> governs the covariance of
    <math|x> under the Gaussian distribution, it is called the <em|covariance
    matrix>.
  </hidden>|<\hidden>
    <tit|Complexity>

    <unroll-greyed|<\shown>
      Consider the number of free parameters in the distribution.
    </shown>|<\shown>
      A general symmetric covariance matrix <math|\<Sigma\>> will have
      <math|D(D + 1)/2> independent parameters, and there are another D
      independent parameters in <math|\<b-mu\>>, giving <math|D(D + 3)/2>
      parameters in total.
    </shown>|<\shown>
      For large <math|D>, the total number of parameters therefore grows
      quadratically with <math|D>, and the computational task of manipulating
      and inverting large matrices can become prohibitive.
    </shown>|<\shown>
      One way to address this problem is to use restricted forms of the
      covariance matrix.
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Diagonal covariance>

    If we consider covariance matrices that are <em|diagonal>, so that

    <\eqnarray*>
      <tformat|<table|<row|<cell|>|<cell|\<Sigma\>=>|<cell|diag(\<sigma\><rsub|i><rsup|2>)>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<sigma\><rsub|1><rsup|2>>|<cell|>|<cell|>>|<row|<cell|>|<cell|\<ddots\>>|<cell|>>|<row|<cell|>|<cell|>|<cell|\<sigma\><rsub|D><rsup|2>>>>>>>>>>
    </eqnarray*>

    <\equation*>
      \;
    </equation*>

    There are <math|2D> independent parameters in the density model.

    The corresponding contours of constant density are given by axis-aligned
    ellipsoids.
  </hidden>|<\hidden>
    <tit|Isotropic covariance>

    Further restrict the covariance matrix to be proportional to the identity
    matrix,

    <\equation*>
      \<Sigma\> = \<sigma\><rsup|2>I
    </equation*>

    known as an <em|isotropic covariance>, giving <math|D+1> independent
    parameters in the model and spherical surfaces of constant density.
  </hidden>|<\hidden>
    <small-figure|<image|image/fig_2_8_contour_gaussian.png|.9par|||>|Contours
    of constant probability density for a Gaussian distribution in two
    dimensions in which the covariance matrix is (a) of general form, (b)
    diagonal, in which the elliptical contours are aligned with the
    coordinate axes, and (c) proportional to the identity matrix, in which
    the contours are concentric circles.>
  </hidden>|<\hidden>
    <tit|Extension>

    <\overlays-greyed|6|6>
      <overlay-from|2|A further limitation of the Gaussian distribution is
      that it is intrinsically <em|unimodal> (i.e., has a single maximum) and
      so is unable to provide a good approximation to multimodal
      distributions.|>

      <overlay-from|3|The Gaussian distribution can be both too flexible, in
      the sense of having too many parameters, while also being too limited
      in the range of distributions that it can adequately represent.|>

      <overlay-from|4|The introduction of <em|latent variables>, also called
      <em|hidden variables> or <em|unobserved variables>, allows both of
      these problems to be addressed. In particular, a rich family of
      multimodal distributions is obtained by introducing discrete latent
      variables leading to mixtures of Gaussians.|>

      <overlay-from|5|Similarly, the introduction of <em|continuous latent
      variables> leads to models in which the number of free parameters can
      be controlled independently of the dimensionality <math|D> of the data
      space while still allowing the model to capture the dominant
      correlations in the data set.|>
    </overlays-greyed>

    \;
  </hidden>|<\hidden>
    \;

    \;

    <unroll-greyed|<\shown>
      These two approaches can be combined and further extended to derive a
      very rich set of hierarchical models that can be adapted to a broad
      range of practical applications.
    </shown>|<\shown>
      The Gaussian version of the <em|Markov random field>, \ which is widely
      used as a probabilistic model of images, is a Gaussian distribution
      over the joint space of pixel intensities but rendered tractable
      through the imposition of considerable structure reflecting the spatial
      organization of the pixels.
    </shown>|<\shown>
      The <em|linear dynamical system>, used to model time series data for
      applications such as tracking, is also a joint Gaussian distribution
      over a potentially large number of observed and latent variables and
      again is tractable due to the structure imposed on the distribution.
    </shown>|<\shown>
      A powerful framework for expressing the form and properties of such
      complex distributions is that of <em|probabilistic graphical models>.
    </shown>>
  </hidden>|<\hidden>
    <tit|Conditional Gaussian distributions>

    An important property of the multivariate Gaussian distribution is that
    if two sets of variables are jointly Gaussian, then the conditional
    distribution of one set conditioned on the other is again Gaussian.

    Similarly, the marginal distribution of either set is also Gaussian.

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|y|)>>|<cell|=>|<cell|<big|int>p<around*|(|x,y|)>\<mathd\>x>>|<row|<cell|p<around*|(|x|)>>|<cell|=>|<cell|<big|int>p<around*|(|x,y|)>\<mathd\>y>>|<row|<cell|p<around*|(|y\|x|)>>|<cell|=>|<cell|p<around*|(|x,y|)>/p<around*|(|x|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|<math|\<b-x\>=<matrix|<tformat|<table|<row|<cell|\<b-x\><rsub|a>>>|<row|<cell|\<b-x\><rsub|b>>>>>>>>

    Consider first the case of conditional distributions. Suppose
    <math|\<b-x\>> is a D-dimensional vector with Gaussian distribution

    <\equation*>
      \<b-x\>\<sim\>\<cal-N\>(\<b-x\>\|\<b-mu\>,\<Sigma\>)
    </equation*>

    and that we partition <math|\<b-x\>> into two disjoint subsets
    <math|\<b-x\><rsub|a>> and <math|\<b-x\><rsub|b>>.

    Take <math|\<b-x\><rsub|a>> to form the first <math|M> components of
    <math|\<b-x\>>, with <math|\<b-x\><rsub|b>> comprising the remaining
    <math|D\<minus\>M> components, so that

    <\equation>
      \<b-x\>=<matrix|<tformat|<table|<row|<cell|\<b-x\><rsub|a>>>|<row|<cell|\<b-x\><rsub|b>>>>>><label|2.65>
    </equation>
  </hidden>|<\hidden>
    <tit|<math|\<b-mu\>,\<Sigma\>>>

    Define corresponding partitions of the mean vector <math|\<b-mu\>> given
    by

    <\equation*>
      \ \<b-mu\>= \ <matrix|<tformat|<table|<row|<cell|\<b-mu\><rsub|a>>>|<row|<cell|\<b-mu\><rsub|b>>>>>>
    </equation*>

    and of the covariance matrix <math|\<Sigma\>> given by

    <\equation>
      \<Sigma\>=<matrix|<tformat|<table|<row|<cell|\<Sigma\><rsub|a
      a>>|<cell|\<Sigma\><rsub|a b>>>|<row|<cell|\<Sigma\><rsub|b
      a>>|<cell|\<Sigma\><rsub|b b>>>>>> \ .<label|2.67>
    </equation>

    Note that the symmetry <math|\<Sigma\><rsup|T>= \<Sigma\>> of the
    covariance matrix implies that <math|\<Sigma\><rsub|a a>> and
    <math|\<Sigma\><rsub|b b>> are symmetric, while <math|\<Sigma\><rsub|b a>
    = \<Sigma\><rsub|a b><rsup|T>>.
  </hidden>|<\hidden>
    <tit|Precision matrix>

    In many situations, it will be convenient to work with the inverse of the
    covariance matrix

    <\equation*>
      \<Lambda\> \<equiv\> \<Sigma\><rsup|\<minus\>1>
    </equation*>

    which is known as the <em|precision matrix>.

    In fact, some properties of Gaussian distributions are most naturally
    expressed in terms of the covariance, whereas others take a simpler form
    when viewed in terms of the precision.

    The partitioned form of the precision matrix

    <\equation*>
      \<Lambda\>= \ <matrix|<tformat|<table|<row|<cell|\<Lambda\><rsub|a
      a>>|<cell|\<Lambda\><rsub|a b>>>|<row|<cell|\<Lambda\><rsub|b
      a>>|<cell|\<Lambda\><rsub|b b>>>>>>
    </equation*>

    corresponding to the partitioning <eqref|2.65> of the vector
    <math|\<b-x\>>. Because the inverse of a symmetric matrix is also
    symmetric, we see that <math|\<Lambda\><rsub|a a>> and
    <math|\<Lambda\><rsub|b b>> are symmetric, while
    \ <math|\<Lambda\><rsub|a b><rsup|T> = \<Lambda\><rsub|b a>>.
  </hidden>|<\hidden>
    <tit|<math|p(\<b-x\>) = p(\<b-x\><rsub|a>, \<b-x\><rsub|b>)>>

    considering the quadratic form in the exponent of the Gaussian
    distribution

    <\eqnarray*>
      <tformat|<table|<row|<cell|>|<cell|>|<cell|-<frac|1|2><around*|(|\<b-x\>-\<b-mu\>|)><rsup|T>\<Sigma\><rsup|-1><around*|(|\<b-x\>-\<b-mu\>|)>>>|<row|<cell|>|<cell|=>|<cell|-<frac|1|2><around*|(|\<b-x\><rsub|a>-\<b-mu\><rsub|a>|)><rsup|T>\<Lambda\><rsub|a
      a><around*|(|\<b-x\><rsub|a>-\<b-mu\><rsub|a>|)>-<frac|1|2><around*|(|\<b-x\><rsub|a>-\<b-mu\><rsub|a>|)><rsup|T>\<Lambda\><rsub|a
      b><around*|(|\<b-x\><rsub|b>-\<b-mu\><rsub|b>|)>>>|<row|<cell|>|<cell|>|<cell|-<frac|1|2><around*|(|\<b-x\><rsub|b>-\<b-mu\><rsub|b>|)><rsup|T>\<Lambda\><rsub|b
      a><around*|(|\<b-x\><rsub|a>-\<b-mu\><rsub|a>|)>-<frac|1|2><around*|(|\<b-x\><rsub|b>-\<b-mu\><rsub|b>|)><rsup|T>\<Lambda\><rsub|b
      b><around*|(|\<b-x\><rsub|b>-\<b-mu\><rsub|b>|)><eq-number><label|2.70>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Completing the square>

    Given a quadratic form defining the exponent terms in a Gaussian
    distribution, and we need to determine the corresponding mean and
    covariance.

    Such problems can be solved straightforwardly by noting that the exponent
    in a general Gaussian distribution <math|\<cal-N\>(\<b-x\>\|\<b-mu\>,\<Sigma\>)>
    can be written

    <\equation>
      -<frac|1|2><around*|(|\<b-x\>-\<b-mu\>|)><rsup|T>\<Sigma\><rsup|-1><around*|(|\<b-x\>-\<b-mu\>|)>=-<frac|1|2>\<b-x\><rsup|T>\<Sigma\><rsup|-1>\<b-x\>+\<b-x\><rsup|T>\<Sigma\><rsup|-1>\<b-mu\>+const<label|2.71>
    </equation>

    where `const' denotes terms which are independent of <math|\<b-x\>>, and
    we have made use of the symmetry of <math|\<Sigma\>>.

    Thus if we take our general quadratic form and express it in the form
    given by the right-hand side of Eq. <eqref|2.71>, then we can immediately
    equate the matrix of coefficients entering the second order term in
    <math|\<b-x\>> to the inverse covariance \ matrix
    <math|\<Sigma\><rsup|\<minus\>1>> and the coefficient of the linear term
    in <math|\<b-x\>> to <math|\<Sigma\><rsup|\<minus\>1>\<b-mu\>>, from
    which we can obtain <math|\<b-mu\>>.
  </hidden>|<\hidden>
    <tit|<math|\<Sigma\><rsub|a\|b>>>

    Consider the functional dependence of Eq. <eqref|2.70> on
    <math|\<b-x\><rsub|a>> in which <math|\<b-x\><rsub|b>> is regarded as a
    constant.

    If we pick out all terms that are second order in <math|\<b-x\><rsub|a>>,
    we have \ 

    <\equation*>
      -<frac|1|2>\<b-x\><rsub|a><rsup|T>\<Lambda\><rsub|a a>\<b-x\><rsub|a>
    </equation*>

    from which we can immediately conclude that the covariance (inverse
    precision) of <math|p<around*|(|\<b-x\><rsub|a>\|\<b-x\><rsub|b>|)>> is
    given by

    <\equation>
      \<Sigma\><rsub|a\|b> = \<Lambda\><rsub|a a><rsup|-1>.<label|2.73>
    </equation>
  </hidden>|<\hidden>
    <tit|<math|\<b-mu\><rsub|a\|b >>>

    Now consider all of the terms in Eq. <eqref|2.70> that are linear in
    <math|\<b-x\><rsub|a>>

    <\equation*>
      \<b-x\><rsub|a><rsup|T><around*|{|\<Lambda\><rsub|a
      a>\<b-mu\><rsub|a>-\<Lambda\><rsub|a
      b><around*|(|\<b-x\><rsub|b>-\<b-mu\><rsub|b>|)>|}>
    </equation*>

    where we have used <math|\<Lambda\><rsub|b
    a><rsup|T>=\<Lambda\><rsub|ab>>.

    From our discussion of the general form <eqref|2.71>, the coefficient of
    <math|\<b-x\><rsub|a>> in this expression must equal
    <math|\<Sigma\><rsub|a\|b><rsup|-1>\<b-mu\><rsub|a\|b>> and hence \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-mu\><rsub|a\|b>>|<cell|=>|<cell|\<Sigma\><rsub|a\|b><around*|{|\<Lambda\><rsub|a
      a>\<b-mu\><rsub|a>-\<Lambda\><rsub|a
      b><around*|(|\<b-x\><rsub|b>-\<b-mu\><rsub|b>|)>|}>>>|<row|<cell|>|<cell|=>|<cell|\<b-mu\><rsub|a>-\<Lambda\><rsub|a
      a><rsup|-1>\<Lambda\><rsub|a b><around*|(|\<b-x\><rsub|b>-\<b-mu\><rsub|b>|)><eq-number><label|2.75>>>>>
    </eqnarray*>

    where Eq. <eqref|2.73> is used.
  </hidden>|<\hidden>
    <tit|Inverse of a partitioned matrix>

    Express these results in terms of the corresponding partitioned
    covariance matrix.

    To do this, we make use of the following identity for the inverse of a
    partitioned matrix

    <\equation>
      <matrix|<tformat|<table|<row|<cell|A>|<cell|B>>|<row|<cell|C>|<cell|D>>>>><rsup|-1>=<matrix|<tformat|<table|<row|<cell|M>|<cell|-M
      B D<rsup|<rsup|-1>>>>|<row|<cell|-D<rsup|-1>C
      M>|<cell|D<rsup|-1>+D<rsup|-1>C M B D<rsup|-1>>>>>><label|2.76>
    </equation>

    where

    <\equation*>
      M=<around*|(|A-B D<rsup|-1>C|)><rsup|-1>
    </equation*>

    The quantity <math|M<rsup|\<minus\>1>> is known as the <em|Schur
    complement> of the matrix on the left-hand side of Eq. <eqref|2.76> with
    respect to the submatrix <math|D>.
  </hidden>|<\hidden>
    <tit|Partitioned precision>

    \;

    <\equation>
      <matrix|<tformat|<table|<row|<cell|\<Sigma\><rsub|a
      a>>|<cell|\<Sigma\><rsub|a b>>>|<row|<cell|\<Sigma\><rsub|b
      a>>|<cell|\<Sigma\><rsub|b b>>>>>><rsup|-1>=<matrix|<tformat|<table|<row|<cell|\<Lambda\><rsub|a
      a>>|<cell|\<Lambda\><rsub|a b>>>|<row|<cell|\<Lambda\><rsub|b
      a>>|<cell|\<Lambda\><rsub|b b>>>>>><label|2.78>
    </equation>

    make use of Eq. <eqref|2.76>,

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<Lambda\><rsub|a
      a>>|<cell|=>|<cell|<around*|(|\<Sigma\><rsub|a a>-\<Sigma\><rsub|a
      b>\<Sigma\><rsub|b b><rsup|-1>\<Sigma\><rsub|b
      a>|)><rsup|-1>>>|<row|<cell|\<Lambda\><rsub|a
      b>>|<cell|=>|<cell|-<around*|(|\<Sigma\><rsub|a a>-\<Sigma\><rsub|a
      b>\<Sigma\><rsub|b b><rsup|-1>\<Sigma\><rsub|b
      a>|)><rsup|-1>\<Sigma\><rsub|a b>\<Sigma\><rsub|b b><rsup|-1>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|<math|\<b-mu\><rsub|a\|b>,\<Sigma\><rsub|a\|b><around*|(|\<Sigma\>|)>>>

    Obtain the following expressions for the mean and covariance of the
    conditional distribution\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-mu\><rsub|a\|b>>|<cell|=>|<cell|\<b-mu\><rsub|a>+\<Sigma\><rsub|a
      b>\<Sigma\><rsub|b b><rsup|-1><around*|(|\<b-x\><rsub|b>-\<b-mu\><rsub|b>|)><eq-number><label|2.81>>>|<row|<cell|\<Sigma\><rsub|a\|b>>|<cell|=>|<cell|\<Sigma\><rsub|a
      a>-\<Sigma\><rsub|a b>\<Sigma\><rsub|b b><rsup|-1>\<Sigma\><rsub|b
      a><eq-number><label|2.82>>>>>
    </eqnarray*>

    Comparing Eq. <eqref|2.73> and <eqref|2.82>, we see that the conditional
    distribution <math|p<around*|(|\<b-x\><rsub|a>\|\<b-x\><rsub|b>|)>> takes
    a simpler form when expressed in terms of the partitioned precision
    matrix than when it is expressed in terms of the partitioned covariance
    matrix.

    Note that the mean of the conditional distribution
    \ <math|p<around*|(|\<b-x\><rsub|a>\|\<b-x\><rsub|b>|)>>, given by Eq.
    <eqref|2.81>, is a linear function of <math|\<b-x\><rsub|b>> and that the
    covariance, given by Eq. <eqref|2.82>, is independent of
    <math|\<b-x\><rsub|b>>. This represents an example of a
    <em|linear-Gaussian model>.
  </hidden>|<\hidden>
    <tit|Marginal Gaussian distributions>

    <\equation*>
      p<around*|(|\<b-x\><rsub|a>|)>=<big|int>p<around*|(|\<b-x\><rsub|a>,\<b-x\><rsub|b>|)>\<mathd\>\<b-x\><rsub|b>
    </equation*>

    The quadratic form for the joint distribution can be expressed, using the
    partitioned precision matrix, in the form <eqref|2.70>.

    Because our goal is to integrate out <math|\<b-x\><rsub|b>>, this is most
    easily achieved by first considering the terms involving
    <math|\<b-x\><rsub|b>> and then completing the square in order to
    facilitate integration.
  </hidden>|<\hidden>
    From Eq. <eqref|2.70>, Picking out just those terms that involve
    <math|\<b-x\><rsub|b>>,

    <\eqnarray*>
      <tformat|<cwith|1|2|3|3|color|black>|<table|<row|<cell|>|<cell|>|<cell|-<frac|1|2><around*|(|\<b-x\><rsub|b>-\<b-mu\><rsub|b>|)><rsup|T>\<Lambda\><rsub|b
      b><around*|(|\<b-x\><rsub|b>-\<b-mu\><rsub|b>|)>-<frac|1|2><around*|(|\<b-x\><rsub|a>-\<b-mu\><rsub|a>|)><rsup|T>\<Lambda\><rsub|a
      b><around*|(|\<b-x\><rsub|b>-\<b-mu\><rsub|b>|)>-<frac|1|2><around*|(|\<b-x\><rsub|b>-\<b-mu\><rsub|b>|)><rsup|T>\<Lambda\><rsub|b
      a><around*|(|\<b-x\><rsub|a>-\<b-mu\><rsub|a>|)>>>|<row|<cell|>|<cell|=>|<cell|-<frac|1|2><around*|(|\<b-x\><rsub|b>-\<b-mu\><rsub|b>+\<b-v\>|)><rsup|T>\<Lambda\><rsub|b
      b><around*|(|\<b-x\><rsub|b>-\<b-mu\><rsub|b>+\<b-v\>|)>+<frac|1|2>\<b-v\><rsup|T>\<Lambda\><rsub|b
      b>\<b-v\><eq-number><label|2.84>>>|<row|<cell|\<b-v\>>|<cell|=>|<cell|\<Lambda\><rsub|b
      b><rsup|-1>\<Lambda\><rsub|b a><around*|(|\<b-x\><rsub|a>-\<b-mu\><rsub|a>|)><eq-number><label|2.85>>>>>
    </eqnarray*>

    By completing the square with respect to <math|\<b-x\><rsub|b>>, we can
    integrate out <math|\<b-x\><rsub|b>> and the only term remaining from the
    contributions on the left-hand side of Eq. <eqref|2.84> that depends on
    <math|\<b-x\><rsub|a>> is the last term on the right-hand side of Eq.
    <eqref|2.84>.

    <\equation*>
      <frac|1|2>\<b-v\><rsup|T>\<Lambda\><rsub|b
      b>\<b-v\>=<frac|1|2><around*|{|\<Lambda\><rsub|b
      b><rsup|-1>\<Lambda\><rsub|b a><around*|(|\<b-x\><rsub|a>-\<b-mu\><rsub|a>|)>|}><rsup|T>\<Lambda\><rsub|b
      b><around*|{|\<Lambda\><rsub|b b><rsup|-1>\<Lambda\><rsub|b
      a><around*|(|\<b-x\><rsub|a>-\<b-mu\><rsub|a>|)>|}>
    </equation*>

    \;
  </hidden>|<\hidden>
    Combining this term with the remaining terms from Eq. <eqref|2.70> that
    depend on <math|\<b-x\><rsub|a>>, we obtain

    <\eqnarray*>
      <tformat|<table|<row|<cell|>|<cell|>|<cell|<frac|1|2><around*|{|\<Lambda\><rsub|b
      b><rsup|-1>\<Lambda\><rsub|b a><around*|(|\<b-x\><rsub|a>-\<b-mu\><rsub|a>|)>|}><rsup|T>\<Lambda\><rsub|b
      b><around*|{|\<Lambda\><rsub|b b><rsup|-1>\<Lambda\><rsub|b
      a><around*|(|\<b-x\><rsub|a>-\<b-mu\><rsub|a>|)>|}>-<frac|1|2><around*|(|\<b-x\><rsub|a>-\<b-mu\><rsub|a>|)><rsup|T>\<Lambda\><rsub|a
      a><around*|(|\<b-x\><rsub|a>-\<b-mu\><rsub|a>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2><around*|{|\<Lambda\><rsub|b
      a><around*|(|\<b-x\><rsub|a>-\<b-mu\><rsub|a>|)>|}><rsup|T>\<Lambda\><rsub|b
      b><rsup|-1><around*|{|\<Lambda\><rsub|b
      a><around*|(|\<b-x\><rsub|a>-\<b-mu\><rsub|a>|)>|}>-<frac|1|2>\<b-x\><rsub|a><rsup|T>\<Lambda\><rsub|a
      a>\<b-x\><rsub|a>+\<b-x\><rsub|a><rsup|T>\<Lambda\><rsub|a
      a>\<b-mu\><rsub|a>+const>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2>\<b-x\><rsub|a><rsup|T>\<Lambda\><rsub|a
      b>\<Lambda\><rsub|b b><rsup|-1>\<Lambda\><rsub|b
      a>\<b-x\><rsub|a>-\<b-x\><rsub|a><rsup|T>\<Lambda\><rsub|a
      b>\<Lambda\><rsub|b b><rsup|-1>\<Lambda\><rsub|b
      a>\<b-mu\><rsub|a>-<frac|1|2>\<b-x\><rsub|a><rsup|T>\<Lambda\><rsub|a
      a>\<b-x\><rsub|a>+\<b-x\><rsub|a><rsup|T>\<Lambda\><rsub|a
      a>\<b-mu\><rsub|a>+const>>|<row|<cell|>|<cell|=>|<cell|-<frac|1|2>\<b-x\><rsub|a><rsup|T><around*|(|\<Lambda\><rsub|a
      a>-\<Lambda\><rsub|a b>\<Lambda\><rsub|b b><rsup|-1>\<Lambda\><rsub|b
      a>|)>\<b-x\><rsub|a>+\<b-x\><rsub|a><rsup|T><around*|(|\<Lambda\><rsub|a
      a>-\<Lambda\><rsub|a b>\<Lambda\><rsub|b b><rsup|-1>\<Lambda\><rsub|b
      a>|)>\<b-mu\><rsub|a>+const>>>>
    </eqnarray*>

    where `const' denotes quantities independent of <math|\<b-x\><rsub|a>>.
  </hidden>|<\hidden>
    <tit|<math|\<bbb-E\><around*|[|\<b-x\><rsub|a>|]>,cov<around*|[|\<b-x\><rsub|a>|]><around*|(|\<Lambda\>|)>>>

    \ Again, by comparison with Eq. <eqref|2.71>, we see that the covariance
    of the marginal distribution of <math|p(\<b-x\><rsub|a>)> is given by

    <\equation>
      \<Sigma\><rsub|a> = (\<Lambda\><rsub|a a> \<minus\>
      \<Lambda\><rsub|ab>\<Lambda\><rsub|b b><rsup|-1> \<Lambda\><rsub|b
      a>)<rsup|\<minus\>1><label|2.88>
    </equation>

    Similarly, the mean is given by

    <\equation*>
      \<Sigma\><rsub|a><around*|(|\<Lambda\><rsub|a a>-\<Lambda\><rsub|a
      b>\<Lambda\><rsub|b b><rsup|-1>\<Lambda\><rsub|b
      a>|)>\<b-mu\><rsub|a>=\<b-mu\><rsub|a>
    </equation*>

    where we have used Eq. <eqref|2.88>.
  </hidden>|<\hidden>
    <tit|Use covariance matrix <math|\<Sigma\>>>

    rewrite this in terms of the corresponding partitioning of the covariance
    matrix given by Eq. <eqref|2.67>, as we did for the conditional
    distribution.

    These partitioned matrices are related by

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|\<Lambda\><rsub|a
      a>>|<cell|\<Lambda\><rsub|a b>>>|<row|<cell|\<Lambda\><rsub|b
      a>>|<cell|\<Lambda\><rsub|b b>>>>>><rsup|-1>=<matrix|<tformat|<table|<row|<cell|\<Sigma\><rsub|a
      a>>|<cell|\<Sigma\><rsub|a b>>>|<row|<cell|\<Sigma\><rsub|b
      a>>|<cell|\<Sigma\><rsub|b b>>>>>>
    </equation*>

    Making use of Eq. <eqref|2.76>, then

    <\equation*>
      (\<Lambda\><rsub|a a> \<minus\> \<Lambda\><rsub|a b>\<Lambda\><rsub|b
      b><rsup|-1>\<Lambda\><rsub|b a> \ )<rsup|\<minus\>1> = \<Sigma\><rsub|a
      a>.
    </equation*>

    \;
  </hidden>|<\hidden>
    <tit|<math|\<bbb-E\><around*|[|\<b-x\><rsub|a>|]>,cov<around*|[|\<b-x\><rsub|a>|]><around*|(|\<Sigma\>|)>>>

    Thus we obtain the intuitively satisfying result that the marginal
    distribution <math|p(\<b-x\><rsub|a><rsub|>)> has mean and covariance
    given by \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<b-x\><rsub|a>|]>>|<cell|=>|<cell|\<b-mu\><rsub|a><eq-number><label|2.92>>>|<row|<cell|cov<around*|[|\<b-x\><rsub|a>|]>>|<cell|=>|<cell|\<Sigma\><rsub|a
      a><eq-number><label|2.93>>>>>
    </eqnarray*>

    We see that for a marginal distribution, the mean and covariance are most
    simply expressed in terms of the partitioned covariance matrix, in
    contrast to the conditional distribution for which the partitioned
    precision matrix gives rise to simpler expressions.
  </hidden>|<\hidden>
    <tit|Partitioned Gaussians summarize>

    Given a joint Gaussian distribution <math|\<cal-N\><around*|(|\<b-x\>\|\<b-mu\>,\<Sigma\>|)>>
    with <math|\<Lambda\> \<equiv\> \<Sigma\><rsup|\<minus\>1>> and

    <\equation*>
      \<b-x\>=<matrix|<tformat|<table|<row|<cell|\<b-x\><rsub|a>>>|<row|<cell|\<b-x\><rsub|b>>>>>>,\<b-mu\>=<matrix|<tformat|<table|<row|<cell|\<b-mu\><rsub|a>>>|<row|<cell|\<b-mu\><rsub|b>>>>>>,\<Sigma\>=<matrix|<tformat|<table|<row|<cell|\<Sigma\><rsub|aa>>|<cell|\<Sigma\><rsub|a
      b>>>|<row|<cell|\<Sigma\><rsub|b a>>|<cell|\<Sigma\><rsub|b
      b>>>>>>,\<Lambda\>=<matrix|<tformat|<table|<row|<cell|\<Lambda\><rsub|a
      a>>|<cell|\<Lambda\><rsub|a b>>>|<row|<cell|\<Lambda\><rsub|b
      a>>|<cell|\<Lambda\><rsub|b b>>>>>>
    </equation*>

    Conditional distribution:

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<b-x\><rsub|a>\|\<b-x\><rsub|b>|)>>|<cell|=>|<cell|\<cal-N\><around*|(|\<b-x\>\|\<b-mu\><rsub|a\|b>,\<Lambda\><rsub|a
      a><rsup|-1>|)>>>|<row|<cell|\<b-mu\><rsub|a\|b>>|<cell|=>|<cell|\<b-mu\><rsub|a>-\<Lambda\><rsub|a
      a><rsup|-1>\<Lambda\><rsub|a b><around*|(|\<b-x\><rsub|b>-\<b-mu\><rsub|b>|)>>>>>
    </eqnarray*>

    Marginal distribution:

    <\equation*>
      p<around*|(|\<b-x\><rsub|a>|)>=\<cal-N\><around*|(|\<b-x\><rsub|a>\|\<b-mu\><rsub|a>,\<Sigma\><rsub|a
      a>|)>
    </equation*>
  </hidden>|<\hidden>
    <small-figure|<image|image/fig_2_9_conditional_marginal.png|.9par|||>|The
    plot on the left shows the contours of a Gaussian distribution
    <math|p(x<rsub|a>, x<rsub|b>)> over two variables, and the plot on the
    right shows the marginal distribution <math|p(x<rsub|a>)> (blue curve)
    and the conditional distribution <math|p(x<rsub|a>\|x<rsub|b>)> for
    <math|x<rsub|b> = 0.7> (red curve).>
  </hidden>|<\hidden>
    <tit|Bayes' theorem for Gaussian variables>

    In a Gaussian <math|p(\<b-x\>)> partitioned the vector <math|\<b-x\>>
    into two subvectors <math|\<b-x\>= (\<b-x\><rsub|a><rsup|T>,
    \<b-x\><rsub|b><rsup|T>)<rsup|T>> and then found expressions for the
    conditional distribution <math|p<around*|(|\<b-x\><rsub|a>\|\<b-x\><rsub|b>|)>>
    and the marginal distribution <math|p<around*|(|\<b-x\><rsub|a>|)>>.

    The mean of the conditional distribution
    <math|p<around*|(|\<b-x\><rsub|a>\|\<b-x\><rsub|b>|)>> was a linear
    function of <math|\<b-x\><rsub|b>>.

    Consider a Gaussian marginal distribution <math|p(\<b-x\>)> and a
    Gaussian conditional distribution

    <\equation*>
      p<around*|(|\<b-y\>\|\<b-x\>|)>=\<cal-N\><around*|(|\<b-mu\><around*|(|\<b-x\>|)>,\<Sigma\>|)>
    </equation*>

    which has a mean that is a linear function of <math|\<b-x\>>, and a
    covariance which is independent of <math|\<b-x\>>. This is an example of
    a <em|linear Gaussian model> (Roweis and Ghahramani, 1999).

    We wish to find the marginal distribution <math|p(\<b-y\>)> and the
    conditional distribution <math|p<around*|(|\<b-x\>\|\<b-y\>|)>>.
  </hidden>|<\hidden>
    <tit|marginal and conditional distributions>

    We shall take the marginal and conditional distributions to be

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<b-x\>|)>>|<cell|=>|<cell|\<cal-N\><around*|(|\<b-x\>\|\<b-mu\>,\<Lambda\><rsup|-1>|)>>>|<row|<cell|p<around*|(|\<b-y\>\|\<b-x\>|)>>|<cell|=>|<cell|\<cal-N\><around*|(|\<b-y\>\|\<b-A\>\<b-x\>+\<b-b\>,L<rsup|-1>|)>>>>>
    </eqnarray*>

    where <math|\<b-mu\>>, <math|A>, and <math|\<b-b\>> are parameters
    governing the means, and <math|\<Lambda\>> and <math|L> are precision
    matrices.

    If <math|\<b-x\>> has dimensionality <math|M> and <math|\<b-y\>> has
    dimensionality <math|D>, then the matrix <math|A> has size
    <math|D\<times\>M>.
  </hidden>|<\hidden>
    <tit|log of the joint distribution>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|ln p<around*|(|\<b-x\>,\<b-y\>|)>>|<cell|=>|<cell|ln
      p<around*|(|\<b-x\>|)>+ln p<around*|(|\<b-y\>\|\<b-x\>|)>>>|<row|<cell|>|<cell|=>|<cell|-<frac|1|2><around*|(|\<b-x\>-\<b-mu\>|)><rsup|T>\<Lambda\><around*|(|\<b-x\>-\<b-mu\>|)>-<frac|1|2><around*|(|\<b-y\>-A\<b-x\>-\<b-b\>|)><rsup|T>L<around*|(|\<b-y\>-A\<b-x\>-\<b-b\>|)>+const>>|<row|<cell|>|<cell|=>|<cell|-<frac|1|2><matrix|<tformat|<table|<row|<cell|\<b-x\>>>|<row|<cell|\<b-y\>>>>>><rsup|T><matrix|<tformat|<table|<row|<cell|\<Lambda\>+A<rsup|T>L
      A>|<cell|-A<rsup|T>L>>|<row|<cell|-L
      A>|<cell|L>>>>><matrix|<tformat|<table|<row|<cell|\<b-x\>>>|<row|<cell|\<b-y\>>>>>>>>|<row|<cell|>|<cell|>|<cell|+<matrix|<tformat|<table|<row|<cell|\<b-x\>>>|<row|<cell|\<b-y\>>>>>><rsup|T><matrix|<tformat|<table|<row|<cell|\<Lambda\>\<b-mu\>+A<rsup|T>L\<b-b\>>>|<row|<cell|L\<b-b\>>>>>>+const>>|<row|<cell|>|<cell|=>|<cell|-<frac|1|2><around*|[|<matrix|<tformat|<table|<row|<cell|\<b-x\>>>|<row|<cell|\<b-y\>>>>>>-\<bbb-E\><around*|[|<matrix|<tformat|<table|<row|<cell|\<b-x\>>>|<row|<cell|\<b-y\>>>>>>|]>|]><rsup|T>cov<around*|[|<matrix|<tformat|<table|<row|<cell|\<b-x\>>>|<row|<cell|\<b-y\>>>>>>|]><rsup|-1><around*|[|<matrix|<tformat|<table|<row|<cell|\<b-x\>>>|<row|<cell|\<b-y\>>>>>>-\<bbb-E\><around*|[|<matrix|<tformat|<table|<row|<cell|\<b-x\>>>|<row|<cell|\<b-y\>>>>>>|]>|]>>>|<row|<cell|>|<cell|>|<cell|+const>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|<math|cov<around*|[|\<cdummy\>|]>,\<bbb-E\><around*|[|\<cdummy\>|]>>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|cov<around*|[|<matrix|<tformat|<table|<row|<cell|\<b-x\>>>|<row|<cell|\<b-y\>>>>>>|]>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<Lambda\>+A<rsup|T>L
      A>|<cell|-A<rsup|T>L>>|<row|<cell|-L
      A>|<cell|L>>>>><rsup|-1>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<Lambda\><rsup|-1>>|<cell|\<Lambda\><rsup|-1>A<rsup|T>>>|<row|<cell|A\<Lambda\><rsup|-1>>|<cell|L<rsup|-1>+A\<Lambda\><rsup|-1>A<rsup|T>>>>>><eq-number><label|2.105>>>|<row|<cell|\<bbb-E\><around*|[|<matrix|<tformat|<table|<row|<cell|\<b-x\>>>|<row|<cell|\<b-y\>>>>>>|]>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<Lambda\>+A<rsup|T>L
      A>|<cell|-A<rsup|T>L>>|<row|<cell|-L
      A>|<cell|L>>>>><rsup|-1><matrix|<tformat|<table|<row|<cell|\<Lambda\>\<b-mu\>-A<rsup|T>L\<b-b\>>>|<row|<cell|L\<b-b\>>>>>>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-mu\>>>|<row|<cell|A\<b-mu\>+\<b-b\>>>>>><eq-number><label|2.108>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|<math|\<bbb-E\><around*|[|\<b-y\>|]>,cov<around*|[|\<b-y\>|]>>>

    Next find an expression for the marginal distribution <math|p(\<b-y\>)>
    in which we have marginalized over <math|\<b-x\>>.

    The marginal distribution over a subset of the components of a Gaussian
    random vector takes a particularly simple form when expressed in terms of
    the partitioned covariance matrix.

    Its mean and \ covariance are given by Eq. <eqref|2.92> and <eqref|2.93>,
    respectively.

    Making use of Eq. <eqref|2.105> and <eqref|2.108> we see that the mean
    and covariance of the marginal distribution p(y) are given by \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<b-y\>|]>>|<cell|=>|<cell|A\<b-mu\>+\<b-b\>>>|<row|<cell|cov<around*|[|\<b-y\>|]>>|<cell|=>|<cell|L<rsup|-1>+A\<Lambda\><rsup|-1>A<rsup|T>>>>>
    </eqnarray*>

    When <math|A=I>. It reduces to the convolution of two Gaussians.

    The mean is the sum of the mean of the two Gaussians, and the covariance
    is the sum of their covariances.
  </hidden>|<\hidden>
    <tit|<math|\<bbb-E\><around*|[|\<b-x\>\|\<b-y\>|]>,cov<around*|[|\<b-x\>\|\<b-y\>|]>>>

    Finally seek an expression for the conditional <math|p(x\|y)>.

    Recall that the results for the conditional distribution are most easily
    expressed in terms of the partitioned precision matrix, using Eq.
    <eqref|2.73> and <eqref|2.75>.

    Applying these results to Eq. <eqref|2.105> and \ <eqref|2.108> we see
    that the conditional distribution <math|p(x\|y)> has mean and covariance
    given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<b-x\>\|\<b-y\>|]>>|<cell|=>|<cell|<around*|(|\<Lambda\>+A<rsup|T>L
      A|)><rsup|-1><around*|{|A<rsup|T>L<around*|(|\<b-y\>-\<b-b\>|)>+L\<b-mu\>|}>>>|<row|<cell|cov<around*|[|\<b-x\>\|\<b-y\>|]>>|<cell|=>|<cell|<around*|(|\<Lambda\>+A<rsup|T>L
      A|)><rsup|-1>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Posterior>

    The evaluation of this conditional can be seen as an example of Bayes'
    theorem.

    We can interpret the distribution <math|p(x)> as a prior distribution
    over x.

    If the variable y is observed, then the conditional distribution
    <math|p(x\|y)> represents the corresponding posterior distribution over
    <math|x>.

    Having found the marginal and conditional distributions, we effectively
    expressed the joint distribution

    <\equation*>
      p(x,y) = p(x)p(y\|x)
    </equation*>

    in the form

    <\equation*>
      p(x\|y)p(y).
    </equation*>
  </hidden>|<\hidden>
    <tit|Marginal and conditional Gaussians sumarize>

    Given a marginal Gaussian distribution for x and a conditional Gaussian
    distribution for <math|\<b-y\>> given <math|\<b-x\>> in the form \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<b-x\>|)>>|<cell|=>|<cell|\<cal-N\><around*|(|\<b-x\>\|\<mu\>,\<Lambda\><rsup|-1>|)>>>|<row|<cell|p<around*|(|\<b-y\>\|\<b-x\>|)>>|<cell|=>|<cell|\<cal-N\><around*|(|\<b-y\>\|A\<b-x\>+b|)>>>>>
    </eqnarray*>

    \ \ the marginal distribution of <math|\<b-y\>> and the conditional
    distribution of <math|\<b-x\>> given <math|\<b-y\>> are given by \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<b-y\>|)>>|<cell|=>|<cell|\<cal-N\><around*|(|\<b-y\>\|A\<b-mu\>+\<b-b\>,L<rsup|-1>+A\<Lambda\><rsup|-1>A<rsup|T>|)>>>|<row|<cell|p<around*|(|\<b-x\>\|\<b-y\>|)>>|<cell|=>|<cell|\<cal-N\><around*|(|\<b-x\>\|\<Sigma\><around*|{|A<rsup|T>L<around*|(|\<b-y\>-\<b-b\>|)>+\<Lambda\>\<b-mu\>|}>,\<Sigma\>|)>>>>>
    </eqnarray*>

    where

    <\equation*>
      \<Sigma\>=<around*|(|\<Lambda\>+A<rsup|T>L A|)><rsup|-1>
    </equation*>
  </hidden>|<\hidden>
    <tit|Maximum likelihood for the Gaussian>

    Given a data set <math|X = (\<b-x\><rsub|1>, . . . , \<b-x\><rsub|N>
    )<rsup|T>> in which the observations <math|{\<b-x\><rsub|n>}> are assumed
    to be drawn independently from a multivariate Gaussian distribution, we
    can estimate the parameters of the distribution by maximum likelihood.
    The log likelihood function is given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|>|<cell|>|<cell|ln
      p<around*|(|X\|\<b-mu\>,\<Sigma\>|)>>>|<row|<cell|>|<cell|=>|<cell|-<frac|N
      D|2>ln<around*|(|2\<pi\>|)>-<frac|N|2>ln<around*|\||\<Sigma\>|\|>-<frac|1|2><big|sum><rsub|n=1><rsup|N><around*|(|\<b-x\><rsub|n>-\<b-mu\>|)><rsup|T>\<Sigma\><rsup|-1><around*|(|\<b-x\><rsub|n>-\<b-mu\>|)>>>|<row|<cell|>|<cell|=>|<cell|-<frac|N|2>ln<around*|\||\<Sigma\>|\|>-<frac|1|2><big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n><rsup|T>\<Sigma\><rsup|-1>\<b-x\><rsub|n>-<frac|1|2><big|sum><rsub|n=1><rsup|N>\<b-mu\><rsup|T>\<Sigma\><rsup|-1>\<b-mu\>+<big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n><rsup|T>\<Sigma\><rsup|-1>\<b-mu\>+const>>|<row|<cell|>|<cell|=>|<cell|-<frac|N|2>ln<around*|\||\<Sigma\>|\|>-<frac|1|2>tr<around*|{|<around*|[|<big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n>\<b-x\><rsub|n><rsup|T>|]>\<Sigma\><rsup|-1>|}>-<frac|1|2><big|sum><rsub|n=1><rsup|N>\<b-mu\><rsup|T>\<Sigma\><rsup|-1>\<b-mu\>+<around*|[|<big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n><rsup|T>|]>\<Sigma\><rsup|-1>\<b-mu\>+const>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Sufficient statistics>

    The likelihood function depends on the data set only through the two
    quantities\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell| <big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n>,>|<cell|>|<cell|<big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n>\<b-x\><rsub|n><rsup|T>>>>>
    </eqnarray*>

    \ \ These are known as the <em|sufficient statistics> for the Gaussian
    distribution.
  </hidden>|<\hidden>
    <tit|<math|\<b-mu\><rsub|ML>>>

    The derivative of the log likelihood with respect to <math|\<b-mu\>> is
    given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<partial\>|\<partial\>\<b-mu\>>ln
      p<around*|(|X\|\<b-mu\>,\<Sigma\>|)>>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>\<Sigma\><rsup|-1><around*|(|\<b-x\><rsub|n>-\<mu\>|)>=0>>|<row|<cell|\<b-mu\><rsub|ML>>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n><label|2.121><eq-number>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|<math|\<Sigma\><rsub|ML>>>

    The maximization with respect to \<Sigma\> is rather more involved. The
    simplest approach is to ignore the symmetry constraint and show that the
    resulting solution is symmetric as required.

    Alternative derivations of this result, which impose the symmetry and
    positive definiteness constraints explicitly, can be found in Magnus and
    Neudecker (1999).

    The result is as expected and takes the form \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<partial\>|\<partial\>\<Sigma\><rsup|-1>>ln
      p<around*|(|X\|\<b-mu\>,\<Sigma\>|)>>|<cell|=>|<cell|<frac|N|2>\<Sigma\><rsup|>-<frac|1|2><big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n>\<b-x\><rsub|n><rsup|T>-<frac|1|2><big|sum><rsub|n=1><rsup|N>\<b-mu\>\<b-mu\><rsup|T>+<frac|1|2><big|sum><rsub|n=1><rsup|N>\<b-mu\>\<b-x\><rsub|n><rsup|T>+<frac|1|2><big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n>\<b-mu\><rsup|T>=0>>|<row|<cell|\<Sigma\><rsub|ML>>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N><around*|(|\<b-x\><rsub|n>-\<b-mu\><rsub|ML>|)><around*|(|\<b-x\><rsub|n>-\<b-mu\><rsub|ML>|)><rsup|T>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    If we evaluate the expectations of the maximum likelihood solutions under
    the true distribution, we obtain the following results\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<b-mu\><rsub|ML>|]>>|<cell|=>|<cell|\<b-mu\>>>|<row|<cell|\<bbb-E\><around*|[|\<Sigma\><rsub|ML>|]>>|<cell|=>|<cell|<frac|N-1|N>\<Sigma\>>>>>
    </eqnarray*>

    We see that the expectation of the maximum likelihood estimate for the
    mean is equal to the true mean. However, the maximum likelihood estimate
    for the covariance has an expectation that is less than the true value,
    and hence it is biased. We can correct this bias by defining a different
    estimator <math|<wide|\<Sigma\>|~>> given by\ 

    <\equation*>
      <wide|\<Sigma\>|~>=<frac|1|N-1><big|sum><rsub|n=1><rsup|N><around*|(|\<b-x\><rsub|n>-\<b-mu\><rsub|ML>|)><around*|(|\<b-x\><rsub|n>-\<b-mu\><rsub|ML>|)><rsup|T>
    </equation*>

    The expectation of <math|<wide|\<Sigma\>|~>> is equal to
    <math|\<Sigma\>>.
  </hidden>|<\hidden>
    <tit|Sequential estimation>

    Our discussion of the maximum likelihood solution for the parameters of a
    Gaussian distribution provides a convenient opportunity to give a more
    general discussion of the topic of sequential estimation for maximum
    likelihood.

    Sequential methods allow data points to be processed one at a time and
    then discarded and are important for on-line applications, and also where
    large data sets are involved so that batch processing of all data points
    at once is infeasible.

    \;
  </hidden>|<\hidden>
    Consider the result <eqref|2.121> for the maximum likelihood estimator of
    the mean <math|\<b-mu\><rsub|ML>>, which we will denote by
    <math|\<b-mu\><rsup|(N) \ ><rsub|ML>> when it is based on <math|N>
    observations.

    If we dissect out the contribution from the final data point
    <math|\<b-x\><rsub|N>> , we obtain

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-mu\><rsup|<around*|(|N|)>><rsub|ML>>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N-1>\<b-x\><rsub|n>+<frac|1|N>\<b-x\><rsub|N>>>|<row|<cell|>|<cell|=>|<cell|<frac|N-1|N>\<b-mu\><rsub|ML><rsup|<around*|(|N-1|)>>+<frac|1|N>\<b-x\><rsub|N>>>|<row|<cell|>|<cell|=>|<cell|\<b-mu\><rsub|ML><rsup|<around*|(|N-1|)>>+<frac|1|N><around*|(|\<b-x\><rsub|N>-\<b-mu\><rsub|ML><rsup|<around*|(|N-1|)>>|)><eq-number><label|2.126>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Robbins-Monro algorithm>

    Consider a pair of random variables <math|\<theta\>> and <math|z>
    governed by a joint distribution <math|p(z, \<theta\>)>.

    The conditional expectation of <math|z> given <math|\<theta\>> defines a
    deterministic function <math|f(\<theta\>)> that is given by

    <\equation*>
      f (\<theta\>) \<equiv\> \<bbb-E\>[z\|\<theta\>] = \ <big|int>z
      p(z\|\<theta\>)\<mathd\>z
    </equation*>

    and is illustrated schematically in Figure <reference|fig2.10>.\ 

    Functions defined in this way are called <em|regression functions>.
  </hidden>|<\hidden>
    <small-figure|<image|image/fig_2_10_Robbins_Monro_algorithm.png|.5par|||>|<label|fig2.10>A
    schematic illustration of two correlated random variables <math|z> and
    <math|\<theta\>>, together with the regression function
    <math|f(\<theta\>)> given by the conditional expectation
    <math|\<bbb-E\>[z\|\<theta\>]>. The RobbinsMonro algorithm provides a
    general sequential procedure for finding the root <math|\<theta\>> of
    such functions.>
  </hidden>|<\hidden>
    \;

    \;

    Our goal is to find the root <math|\<theta\><rsup|\<ast\>>> at which
    f<math|(\<theta\><rsup|\<ast\>>)=0>.

    If we had a large data set of observations of <math|z> and
    <math|\<theta\>>, then we could model the regression function directly
    and then obtain an estimate of its root.

    Suppose, however, that we observe values of <math|z> one at a time and we
    wish to find a corresponding sequential estimation scheme for
    <math|\<theta\><rsup|\<ast\>>>.

    The general procedure for solving such problems was given by Robbins and
    Monro (1951).

    \;
  </hidden>|<\hidden>
    We shall assume that the conditional variance of <math|z> is finite so
    that

    <\equation*>
      \<bbb-E\><around*|[|<around*|(|z-f|)><rsup|2>\|\<theta\>|]>\<less\>\<infty\>
    </equation*>

    Consider the case where <math|f (\<theta\>) \<gtr\> 0> for<math|
    \<theta\> \<gtr\> \<theta\>> and<math| f (\<theta\>) \<less\> 0> for
    <math|\<theta\> \<less\> \<theta\>> , as is the case in Figure
    <reference|fig2.10>.

    The Robbins-Monro procedure then defines a sequence of successive
    estimates of the root <math|\<theta\><rsup|\<ast\>>> given by

    <\equation>
      \<theta\><rsup|<around*|(|N|)>>=\<theta\><rsup|*<around*|(|N-1|)>>-a<rsub|N-1>z<around*|(|\<theta\><rsup|<around*|(|N-1|)>>|)><label|2.129>
    </equation>

    where <math|z(\<theta\><rsup|(N)>)> is an observed value of <math|z> when
    <math|\<theta\>> takes the value <math|\<theta\><rsup|(N)>>.\ 
  </hidden>|<\hidden>
    The coefficients <math|{a<rsub|N> }> represent a sequence of positive
    numbers that satisfy the conditions

    <\eqnarray*>
      <tformat|<table|<row|<cell|lim<rsub|N\<rightarrow\>\<infty\>>a<rsub|N>>|<cell|=>|<cell|0<eq-number><label|2.130>>>|<row|<cell|<big|sum><rsub|N=1><rsup|\<infty\>>a<rsub|N>>|<cell|=>|<cell|\<infty\><eq-number><label|2.131>>>|<row|<cell|<big|sum><rsub|N=1><rsup|N>a<rsub|N><rsup|2>>|<cell|\<less\>>|<cell|\<infty\><eq-number><label|2.132>>>>>
    </eqnarray*>

    <\unfolded>
      It can then be shown (Robbins and Monro, 1951; Fukunaga, 1990) that the
      sequence of estimates given by Eq. <eqref|2.129> does indeed converge
      to the root with probability one.
    <|unfolded>
      Note that the first condition <eqref|2.130> ensures that the successive
      corrections decrease in magnitude so that the process can converge to a
      limiting value. The second condition <eqref|2.131> is required to
      ensure that the algorithm does not converge short of the root, and the
      third condition <eqref|2.132> is needed to ensure that the accumulated
      noise has finite variance and hence does not spoil convergence.
    </unfolded>

    \;
  </hidden>|<\hidden>
    <tit|A general maximum likelihood problem>

    consider how a general maximum likelihood problem can be solved
    sequentially using the Robbins-Monro algorithm.

    By definition, the maximum likelihood solution <math|\<theta\><rsub|ML>>
    is a stationary point of the log likelihood function and hence satisfies

    <\eqnarray*>
      <tformat|<table|<row|<cell|<around*|\<nobracket\>|<frac|\<partial\>|\<partial\>\<theta\>><around*|{|<frac|1|N><big|sum><rsub|n=1><rsup|N>ln
      p<around*|(|x<rsub|n>\|\<theta\>|)>|}>|\|><rsub|\<theta\><rsub|ML>>>|<cell|=>|<cell|0>>|<row|<cell|lim<rsub|N\<rightarrow\>\<infty\>><frac|1|N><big|sum><rsub|n=1><rsup|N><frac|\<partial\>|\<partial\>\<theta\>>ln
      p<around*|(|x<rsub|n>\|\<theta\>|)>>|<cell|=>|<cell|\<bbb-E\><rsub|x><around*|[|<frac|\<partial\>|\<partial\>\<theta\>>ln
      p<around*|(|x<rsub|n>\|\<theta\>|)>|]>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    \;

    \;

    Finding the maximum likelihood solution corresponds to finding the root
    of a regression function. Apply the Robbins-Monro procedure, which now
    takes the form

    <\equation>
      \<theta\><rsup|<around*|(|N|)>>=\<theta\><rsup|<around*|(|N-1|)>>+a<rsub|N-1><frac|\<partial\>|\<partial\>\<theta\><rsup|<around*|(|N-1|)>>>ln
      p<around*|(|x<rsub|N>\|\<theta\><rsup|<around*|(|N-1|)>>|)><label|2.135>
    </equation>

    Note:

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<partial\>|\<partial\>\<theta\><rsup|<around*|(|N-1|)>>>ln
      p<around*|(|x<rsub|N>\|\<theta\><rsup|<around*|(|N-1|)>>|)>>|<cell|\<gtr\>>|<cell|0<space|3em>,\<theta\><rsup|<around*|(|N-1|)>>\<less\>\<theta\><rsup|\<ast\>>>>|<row|<cell|<frac|\<partial\>|\<partial\>\<theta\><rsup|<around*|(|N-1|)>>>ln
      p<around*|(|x<rsub|N>\|\<theta\><rsup|<around*|(|N-1|)>>|)>>|<cell|\<less\>>|<cell|0<space|3em>,\<theta\><rsup|<around*|(|N-1|)>>\<gtr\>\<theta\><rsup|\<ast\>>>>>>
    </eqnarray*>

    <\eqnarray*>
      <tformat|<table|<row|<cell|>|<cell|>|<cell|>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    As a specific example, we consider once again the sequential estimation
    of the mean of a Gaussian distribution, in which case the parameter
    <math|\<theta\><rsup|(N)>> is the estimate
    \ <math|\<mu\><rsup|(N)><rsub|ML>> \ of the mean of the Gaussian, and the
    random variable <math|z> is given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|z>|<cell|=>|<cell|<frac|\<partial\>|\<partial\>\<mu\><rsub|ML>>ln
      p<around*|(|x\|\<mu\><rsub|ML>,\<sigma\><rsup|2>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|\<sigma\><rsup|2>><around*|(|x-\<mu\><rsub|ML>|)><label|2.136><eq-number>>>>>
    </eqnarray*>

    Thus the distribution of <math|z> is Gaussian with mean <math|\<mu\>
    \<minus\> \<mu\><rsub|ML>>, as illustrated in Figure <reference|fig2.11>.

    Substituting Eq. <eqref|2.136> into Eq. <eqref|2.135>, we obtain the
    univariate form of Eq. <eqref|2.126>, provided we choose the coefficients
    <math|a<rsub|N>> to have the form <math|a<rsub|N>=\<sigma\><rsup|2>/N>.

    Note that although we have focussed on the case of a single variable, the
    same technique, together with the same restrictions
    <eqref|2.130>\U<eqref|2.132> on the coefficients <math|a<rsub|N>>, apply
    equally to the multivariate case (Blum, 1965).
  </hidden>|<\hidden>
    <small-figure|<image|image/fig_2_11_Robbins_Monro_algorithm_example_maximum_likelihood.png|.3par|||>|<label|fig2.11>In
    the case of a Gaussian distribution, with <math|\<theta\>>
    \ corresponding to the mean <math|\<mu\><rsub|ML>>, the regression
    function illustrated in Figure <reference|fig2.10> takes the form of a
    straight line, as shown in red. In this case, the random variable
    <math|z> corresponds to the derivative of the log likelihood function and
    is given by <math|(x \<minus\> \<mu\><rsub|ML>)/\<sigma\><rsup|2>>, and
    its expectation that defines the regression function is a straight line
    given by <math|(\<mu\> \<minus\> \<mu\>ML)/\<sigma\><rsup|2>>. The root
    of the regression function corresponds to the true mean <math|\<mu\>>.>
  </hidden>|<\hidden>
    <tit|Bayesian inference for the Gaussian>

    Develop a Bayesian treatment by introducing prior distributions over
    these parameters.

    Begin with a simple example with a single Gaussian random variable
    <math|x>.

    Suppose that the variance <math|\<sigma\><rsup|2>> is known, and consider
    the task of inferring the mean <math|\<mu\>> given a set of <math|N>
    observations <math|X = {x<rsub|1>, . . . , x<rsub|N>}>.

    The likelihood function, that is the probability of the observed data
    given <math|\<mu\>>, viewed as a function of <math|\<mu\>>, is given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|p(X\|\<mu\>)
      >|<cell|=>|<cell|<big|prod><rsub|n=1><rsup|N>p(x<rsub|n>\|\<mu\>)
      >>|<row|<cell|>|<cell|=>|<cell| <frac|1|(2\<pi\>\<sigma\><rsup|2>)<rsup|N/2>>
      exp<around*|{|\<minus\><frac|1| \ 2\<sigma\><rsup|2>><big|sum><rsub|n=1><rsup|N>(x<rsub|n>\<minus\>\<mu\>)<rsup|2>|}>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    The likelihood function <math|p(X\|\<mu\>)> is not a probability
    distribution over <math|\<mu\>> and is not normalized.

    The likelihood function takes the form of the exponential of a quadratic
    form in <math|\<mu\>>.

    Thus if we choose a prior <math|p(\<mu\>)> given by a Gaussian, it will
    be a conjugate distribution for this likelihood function because the
    corresponding posterior will be a product of two exponentials of
    quadratic functions of <math|\<mu\>> and hence will also be Gaussian.

    The prior distribution is to be \ 

    <\equation*>
      p(\<mu\>) = \<cal-N\>(\<mu\>\|\<mu\><rsub|0>, \<sigma\><rsub|0><rsup|2>
      \ )
    </equation*>

    \ \ and the posterior distribution is given by \ 

    <\equation*>
      p(\<mu\>\|X) \<propto\> p(X\|\<mu\>)p(\<mu\>)
    </equation*>

    \;

    \;
  </hidden>|<\hidden>
    Simple manipulation involving completing the square in the exponent shows
    that the \ posterior distribution is given by\ 

    <\equation>
      \ p(\<mu\>\|X) = \<cal-N\>(\<mu\>\|\<mu\><rsub|N>,\<sigma\><rsup|2><rsub|N>
      )<label|2.140>
    </equation>

    \ where \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<mu\><rsub|N>
      >|<cell|=>|<cell|<frac|\<sigma\><rsup|2>|N\<sigma\><rsub|0><rsup|2>+\<sigma\><rsup|2>>\<mu\><rsub|0>+<frac|N\<sigma\><rsub|0><rsup|2>|N\<sigma\><rsub|0><rsup|2>+\<sigma\><rsup|2>>\<mu\><rsub|ML>>>|<row|<cell|<frac|1|\<sigma\><rsub|N><rsup|2>>>|<cell|=>|<cell|<frac|1|\<sigma\><rsub|0><rsup|2>>+<frac|N|\<sigma\><rsup|2>>>>>>
    </eqnarray*>

    \ \ in which <math|\<mu\><rsub|ML>> is the maximum likelihood solution
    for <math|\<mu\>> given by the sample mean \ 

    <\equation*>
      \<mu\><rsub|ML>=<frac|1|N><big|sum><rsub|n=1><rsup|N>x<rsub|n>
    </equation*>
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_12_bayesian_inference_mu.png|.5par|||>|Illustration
      of Bayesian inference for \ the mean <math|\<mu\>> of a Gaussian
      distribution, in which the variance is assumed to be known. The curves
      show the prior distribution over <math|\<mu\>> (the curve labelled
      <math|N = 0>), which in this case is itself Gaussian, along with the
      posterior distribution given by Eq. <eqref|2.140> for increasing
      numbers <math|N> of data points. The data points are generated from a
      Gaussian of mean 0.8 and variance 0.1, and the prior is chosen to have
      mean 0. In both the prior and the likelihood function, the variance is
      set to the true value.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|sequential update>

    Bayesian paradigm leads very naturally to a sequential view of the
    inference problem.

    To see this in the context of the inference of the mean of a Gaussian,
    write the posterior distribution with the contribution from the final
    data point <math|x<rsub|N>> separated out so that

    <\equation*>
      p(\<mu\>\|D) \<propto\><tabular|<tformat|<cwith|1|1|1|1|cell-background|pastel
      magenta>|<table|<row|<cell|<around*|[|
      p(\<mu\>)<big|prod><rsub|n=1><rsup|N-1>p(x<rsub|n>\|\<mu\>)|]>>>>>>p(x<rsub|N>\|\<mu\>)
    </equation*>

    The term in square brackets is (up to a normalization coefficient) just
    the posterior distribution after observing <math|N \<minus\> 1> data
    points. This can be viewed as a prior distribution, which is combined
    using Bayes' theorem with the likelihood function associated with data
    point <math|x<rsub|N>> to arrive at the posterior distribution after
    observing <math|N> data points.

    This sequential view of Bayesian inference is very general and applies to
    any problem in which the observed data are assumed to be independent and
    identically distributed.
  </hidden>|<\hidden>
    <tit|Variance estimation>

    So far, we have assumed that the variance of the Gaussian distribution
    over the data is known and our goal is to infer the mean.

    Suppose that the mean is known and we wish to infer the variance.

    Choose a conjugate form for the prior distribution. It turns out to be
    most convenient to work with the precision
    <math|\<lambda\>\<equiv\>1/\<sigma\><rsup|2>>. The likelihood function
    for <math|\<lambda\>> takes the form

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|X\|\<lambda\>|)>>|<cell|=>|<cell|<big|prod><rsub|n=1><rsup|N>\<cal-N\><around*|(|x<rsub|n>\|\<mu\>,\<lambda\><rsup|-1>|)>>>|<row|<cell|>|<cell|\<propto\>>|<cell|\<lambda\><rsup|N/2>exp<around*|{|-<frac|\<lambda\>|2><big|sum><rsub|n=1><rsup|N><around*|(|x<rsub|n>-\<mu\>|)><rsup|2>|}>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|gamma distribution>

    The corresponding conjugate prior should therefore be proportional to the
    product of a power of <math|\<lambda\>> and the exponential of a linear
    function of <math|\<lambda\>>.

    This corresponds to the gamma distribution which is defined by \ 

    <\equation>
      Gam(\<lambda\>\|a, b) = <frac|1|\<Gamma\>(a)>b<rsup|a>\<lambda\><rsup|a-1>exp(\<minus\>b\<lambda\>).
      <label|2.146>
    </equation>

    \ \ Here <math|\<Gamma\>(a)> is the gamma function that is defined by
    (1.141) and that ensures that Eq. <eqref|2.146> is correctly normalized.

    The gamma distribution has a finite integral if <math|a\<gtr\>0>, \ and
    the distribution itself is finite if <math|a\<geqslant\>1>. It is
    plotted, for various values of <math|a> and <math|b>, in Figure
    <reference|fig2.13>.
  </hidden>|<\hidden>
    \;

    \;

    \;

    <small-figure|<image|image/fig_2_13_gamma_dist.png|.9par|||>|<label|fig2.13>Plot
    of the gamma distribution <math|Gam(\<lambda\>\|a,b)> defined by Eq.
    <eqref|2.146> for various values of the parameters <math|a> and
    <math|b>.>
  </hidden>|<\hidden>
    <tit|mean and variance>

    The mean and variance of the gamma distribution are given by \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\>[\<lambda\>]
      >|<cell|=>|<cell|<frac|a|b>>>|<row|<cell|var<around*|[|\<lambda\>|]>>|<cell|=>|<cell|<frac|a|b<rsup|2>>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|posterior>

    Consider a prior distribution <math|Gam(\<lambda\>\|a<rsub|0>,
    b<rsub|0>)>. Multiply by the likelihood function (2.145), then we obtain
    a posterior distribution\ 

    <\equation*>
      \ p(\<lambda\>\|X) \<propto\> \<lambda\><rsup|a<rsub|0>-1>\<lambda\><rsup|N/2>exp<around*|{|-b<rsub|0>\<lambda\>-<frac|\<lambda\>|2><big|sum><rsub|n=1><rsup|N><around*|(|x<rsub|n>-\<mu\>|)><rsup|2>|}>
    </equation*>

    \ which we recognize as a gamma distribution of the form
    <math|Gam(\<lambda\>\|a<rsub|N>,b<rsub|N>)> where

    <\eqnarray*>
      <tformat|<table|<row|<cell|a<rsub|N>>|<cell|=>|<cell|a<rsub|0>+<frac|N|2>>>|<row|<cell|b<rsub|N>>|<cell|=>|<cell|b<rsub|0>+<frac|1|2><big|sum><rsub|n=1><rsup|N><around*|(|x<rsub|n>-\<mu\>|)><rsup|2>=b<rsub|0>+<frac|N|2>\<sigma\><rsub|ML><rsup|2>>>>>
    </eqnarray*>

    where <math|\<sigma\><rsub|ML><rsup|2>> is the maximum likelihood
    estimator of the variance.
  </hidden>|<\hidden>
    <tit|Interprestation>

    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      Tthe effect of observing N data points is to increase the value of the
      coefficient <math|a> by <math|N/2>.Thus we can interpret the parameter
      <math|a<rsub|0>> in the prior in terms of <math|2a<rsub|0>> `effective'
      prior observations.
    </shown>|<\shown>
      The <math|N> data points contribute
      <math|N\<sigma\><rsup|2><rsub|ML>/2> to the parameter <math|b>, where
      <math|\<sigma\><rsup|2><rsub|ML>> is the variance, and so we can
      interpret the parameter <math|b<rsub|0>> in the prior as arising from
      the <math|2a<rsub|0>> `effective' prior observations having variance
      <math|2b<rsub|0>/<around*|(|2a<rsub|0>|)>=b<rsub|0>/a<rsub|0>>.
    </shown>|<\shown>
      Recall Section 2.2 that we made an analogous interpretation for the
      Dirichlet prior. These distributions \ are examples of the exponential
      family, and we shall see that the interpretation of a conjugate prior
      in terms of effective fictitious data points is a general one for the
      exponential family of distributions.
    </shown>|<\shown>
      Instead of working with the precision, we can consider the variance
      itself.The conjugate prior in this case is called the <em|inverse gamma
      distribution>, although we shall not discuss this further because we
      will find it more convenient to work with the precision.
    </shown>>
  </hidden>|<\hidden>
    <tit|estimate <math|\<mu\>,\<lambda\>>>

    Now suppose that both the mean and the precision are unknown.

    To find a conjugate prior, we consider the dependence of the likelihood
    function on <math|\<mu\>> and <math|\<lambda\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|X\|\<mu\>,\<lambda\>|)>>|<cell|=>|<cell|<big|prod><rsub|n=1><rsup|N><around*|(|<frac|\<lambda\>|2\<pi\>>|)><rsup|1/2>exp<around*|{|-<frac|\<lambda\>|2><around*|(|x<rsub|n>-\<mu\>|)><rsup|2>|}>>>|<row|<cell|>|<cell|\<propto\>>|<cell|<around*|[|\<lambda\><rsup|1/2>exp<around*|(|-<frac|\<lambda\>\<mu\><rsup|2>|2>|)>|]><rsup|N>exp<around*|{|\<lambda\>\<mu\><big|sum><rsub|n=1><rsup|N>x<rsub|n>-<frac|\<lambda\>|2><big|sum><rsub|n=1><rsup|N>x<rsub|n><rsup|2>|}>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|prior <math|p<around*|(|\<mu\>,\<lambda\>|)>>>

    We now wish to identify a prior distribution <math|p(\<mu\>, \<lambda\>)>
    that has the same functional dependence on <math|\<mu\>> and
    <math|\<lambda\>> as the likelihood function and that should therefore
    take the form

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<mu\>,\<lambda\>|)>>|<cell|\<propto\>>|<cell|<around*|[|\<lambda\><rsup|1/2>exp<around*|(|-<frac|\<lambda\>\<mu\><rsup|2>|2>|)>|]><rsup|\<beta\>>exp<around*|{|c\<lambda\>\<mu\>-d\<lambda\>|}>>>|<row|<cell|>|<cell|=>|<cell|exp<around*|{|-<frac|\<beta\>\<lambda\>|2><around*|(|\<mu\>-c/\<beta\>|)><rsup|2>|}>\<lambda\><rsup|\<beta\>/2>exp<around*|{|-<around*|(|d-<frac|c<rsup|2>|2\<beta\>>|)>\<lambda\>|}>>>>>
    </eqnarray*>

    where <math|c, d>, and <math|\<beta\>> are constants.
  </hidden>|<\hidden>
    <tit|<em|Gaussian-gamma> distribution>

    Since we can always write <math|p(\<mu\>, \<lambda\>) =
    p(\<mu\>\|\<lambda\>)p(\<lambda\>)>, we can find
    <math|p(\<mu\>\|\<lambda\>)> and <math|p(\<lambda\>)> by inspection. In
    particular, we see that <math|p(\<mu\>\|\<lambda\>)> is a Gaussian whose
    precision is a linear function of <math|\<lambda\>> and that
    <math|p(\<lambda\>)> is a gamma distribution, so that the normalized
    prior takes the form \ 

    <\equation>
      p(\<mu\>, \<lambda\>) = \<cal-N\>(\<mu\>\|\<mu\><rsub|0>,<around*|(|\<beta\>\<lambda\>|)><rsup|-1>)Gam(\<lambda\>\|a,
      b) <label|2.154>
    </equation>

    \ \ where we have defined new constants given by <math|\<mu\><rsub|0> =
    c/\<beta\>, a = 1 + \<beta\>/2, b = d\<minus\>c<rsup|2>/2\<beta\>>. The
    distribution is called the <em|normal-gamma> or <em|Gaussian-gamma>
    distribution and is plotted in Figure <reference|fig2.14>.

    Note that this is not simply the product of an independent Gaussian prior
    over <math|\<mu\>> and a gamma prior over <math|\<lambda\>>, because the
    precision of <math|\<mu\>> is a linear function of <math|\<lambda\>>.
    Even if we chose a prior in which <math|\<mu\>> and <math|\<lambda\>>
    were independent, the posterior distribution would exhibit a coupling
    between the precision of \<mu\> and the value of \<lambda\>.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_14_contour_normal_gamma.png|.5par|||>|<label|fig2.14>Contour
      plot of the normal-gamma distribution Eq. <eqref|2.154> for parameter
      values <math|\<mu\><rsub|0> = 0, \<beta\> = 2, a = 5> and <math|b =
      6>.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|multivariate>

    In the case of the multivariate Gaussian distribution
    <math|\<cal-N\>(\<b-x\>\|\<b-mu\>,\<Lambda\><rsup|\<minus\>1>)> for a
    <math|D> dimensional variable <math|\<b-x\>>, the conjugate prior
    distribution for the mean <math|\<b-mu\>>, assuming the precision is
    known, is again a Gaussian.

    For known mean and unknown precision matrix <math|\<Lambda\>>, the
    conjugate prior is the <em|Wishart> distribution given by\ 

    <\equation*>
      \ \<cal-W\>(\<Lambda\>\|W, \<nu\>) =
      B\|\<Lambda\>\|<rsup|(\<nu\>\<minus\>D\<minus\>1)/2
      >exp<around*|(|-<frac|1|2>Tr(W<rsup|\<minus\>1>\<Lambda\>)|)>
    </equation*>

    where <math|\<nu\>> is called the number of <em|degrees of freedom> of
    the distribution, <math|W> is a <math|D\<times\>D> scale matrix, and
    <math|Tr(\<cdummy\>)> denotes the trace. The normalization constant
    <math|B> is given by \ 

    <\equation*>
      B(W, \<nu\>) = \|W\|<rsup|\<minus\>\<nu\>/2><around*|(|
      \ 2<rsup|\<nu\>D/2> \<pi\><rsup|D(D\<minus\>1)/4><big|prod><rsub|i=1><rsup|D>\<Gamma\><around*|(|<frac|\<nu\>+1-i|2>|)>|)><rsup|-1>
    </equation*>
  </hidden>|<\hidden>
    \;

    Again, it is also possible to define a conjugate prior over the
    covariance matrix itself, rather than over the precision matrix, which
    leads to the <em|inverse Wishart> distribution.

    If both the mean and the precision are unknown, then, following a similar
    line of reasoning to the univariate case, the conjugate prior is given by
    \ 

    <\equation*>
      p<around*|(|\<b-mu\>,\<Lambda\>\|\<b-mu\><rsub|0>,\<beta\>,W,\<nu\>|)>=\<cal-N\><around*|(|\<b-mu\>\|\<b-mu\><rsub|0>,<around*|(|\<beta\>\<Lambda\>|)><rsup|-1>|)>\<cal-W\><around*|(|\<Lambda\>\|W,\<nu\>|)>
    </equation*>

    \ \ which is known as the <em|normal-Wishart> or <em|Gaussian-Wishart>
    distribution.
  </hidden>|<\hidden>
    <tit|Student's t-distribution>

    The conjugate prior for the precision of a Gaussian is given by a gamma
    distribution.

    If we have a univariate Gaussian <math|\<cal-N\><around*|(|x\|\<mu\>,\<tau\><rsup|-1>|)>>
    together \ with a Gamma prior <math|Gam(\<tau\>\|a,b)> and we integrate
    out the precision, we obtain the marginal distribution of <math|x> in the
    form

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|x\|\<mu\>,a,b|)>>|<cell|=>|<cell|<big|int><rsub|0><rsup|\<infty\>>\<cal-N\><around*|(|x\|\<mu\>,\<tau\><rsup|-1>|)>Gam<around*|(|\<tau\>\|a,b|)>\<mathd\>\<tau\><eq-number><label|2.158>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|0><rsup|\<infty\>><frac|b<rsup|a>e<rsup|-b\<tau\>>\<tau\><rsup|a-1>|\<Gamma\><around*|(|a|)>><around*|(|<frac|\<tau\>|2\<pi\>>|)><rsup|1/2>exp<around*|{|-<frac|\<tau\>|2><around*|(|x-\<mu\>|)><rsup|2>|}>\<mathd\>\<tau\>>>|<row|<cell|>|<cell|=>|<cell|<frac|b<rsup|a>|\<Gamma\><around*|(|a|)>><around*|(|<frac|1|2\<pi\>>|)><rsup|1/2><around*|[|b+<frac|<around*|(|x-\<mu\>|)><rsup|2>|2>|]><rsup|-a-1/2>\<Gamma\><around*|(|a+1/2|)>>>>>
    </eqnarray*>

    where we have made the change of variable <math|z = \<tau\> [b + (x
    \<minus\> \<mu\>)<rsup|2>/2]>.
  </hidden>|<\hidden>
    By convention we define new parameters given by <math|\<nu\> = 2a> and
    <math|\<lambda\> = a/b>, in terms of which the distribution
    <math|p(x\|\<mu\>, a, b)> takes the form

    <\equation>
      St<around*|(|x\|\<mu\>,\<lambda\>,\<nu\>|)>=<frac|\<Gamma\><around*|(|\<nu\>/2+1/2|)>|\<Gamma\><around*|(|\<nu\>/2|)>><around*|(|<frac|\<lambda\>|\<pi\>\<nu\>>|)><rsup|1/2><around*|[|1+<frac|\<lambda\><around*|(|x-\<mu\>|)><rsup|2>|\<nu\>>|]><rsup|-\<nu\>/2-1/2><label|2.159>
    </equation>

    which is known as Student's t-distribution.

    The parameter <math|\<lambda\>> is sometimes called the precision of the
    t-distribution, even though it is not in general equal to the inverse of
    the variance.

    The parameter <math|\<nu\>> is called the degrees of freedom, and its
    effect is illustrated in Figure <reference|fig2.15>. For the particular
    case of <math|\<nu\> = 1>, the t-distribution reduces to the <em|Cauchy>
    distribution, while in the limit <math|\<nu\> \<rightarrow\> \<infty\>>
    the t-distribution <math|St(x\|\<mu\>, \<lambda\>, \<nu\>)> becomes a
    Gaussian <math|\<cal-N\>(x\|\<mu\>, \<lambda\><rsup|\<minus\>1>)> with
    mean <math|\<mu\>> and precision <math|\<lambda\>>.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_15_t_dist.png|.5par|||>|<label|fig2.15>Plot
      of Student's t-distribution <eqref|2.159> \ for <math|\<mu\> = 0> and
      <math|\<lambda\> = 1> for various values of <math|\<nu\>>. The limit
      <math|\<nu\> \<rightarrow\> \<infty\>> corresponds to a Gaussian
      distribution with mean <math|\<mu\>> and precision <math|\<lambda\>>.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Interpretation>

    From Eq. <eqref|2.158>, we see that Student's t-distribution is obtained
    by adding up an infinite number of Gaussian distributions having the same
    mean but different precisions.

    This can be interpreted as an infinite mixture of Gaussians. The result
    is a distribution that in general has longer `tails' than a Gaussian, as
    was seen in Figure <reference|fig2.15>.

    This gives the tdistribution an important property called
    <em|robustness>, which means that it is much less sensitive than the
    Gaussian to the presence of a few data points which are outliers.\ 

    The robustness of the t-distribution is illustrated in Figure
    <reference|fig2.16>, which compares the maximum likelihood solutions for
    a Gaussian and a t-distribution.

    Note that the maximum likelihood solution for the t-distribution can be
    found using the expectation maximization (EM) algorithm.

    \;
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_16_robustness_t_dist.png|.5par|||>|<label|fig2.16>Illustration
      of the robustness of Student's t-distribution compared to a Gaussian.
      (a) Histogram distribution of 30 data points drawn from a Gaussian
      distribution, together with the maximum likelihood fit obtained from a
      t-distribution (red curve) and a Gaussian (green curve, largely hidden
      by the red curve). Because the t-distribution contains the Gaussian as
      a special case it gives almost the same solution as the Gaussian. (b)
      The same data set but with three additional outlying data points
      showing how the Gaussian (green curve) is strongly distorted by the
      outliers, whereas the t-distribution (red curve) is relatively
      unaffected.>
    </padded-center>
  </hidden>|<\hidden>
    Here we see that the effect of a small number of outliers is much less
    significant for the t-distribution than for the Gaussian.

    Outliers can arise in practical applications either because the process
    that generates the data corresponds to a distribution having a heavy tail
    or simply through mislabelled data.

    Robustness is also an important property for regression problems.

    Unsurprisingly, the least squares approach to regression does not exhibit
    robustness, because it corresponds to maximum likelihood under a
    (conditional) Gaussian distribution.

    By basing a regression model on a heavy-tailed distribution such as a
    t-distribution, can obtain a more robust model.
  </hidden>|<\hidden>
    <tit|multivariate>

    If we go back to Eq. <eqref|2.158> and substitute the alternative
    parameters <math|\<nu\> = 2a, \<lambda\> = a/b,> and <math|\<eta\> =
    \<tau\> b/a>, we see that the t-distribution can be written in the form
    \ 

    <\equation*>
      St(x\|\<mu\>, \<lambda\>, \<nu\>) =
      <big|int><rsub|0><rsup|\<infty\>>\<cal-N\>(x\|\<mu\>,(\<eta\>\<lambda\>)<rsup|\<minus\>1>)
      Gam(\<eta\>\|\<nu\>/2, \<nu\>/2) \<mathd\>\<eta\>.
    </equation*>

    \ \ We can then generalize this to a multivariate Gaussian <math|N
    (x\|\<mu\>, \<Lambda\>)> to obtain the corresponding multivariate
    Student's t-distribution in the form \ 

    <\equation*>
      St(x\|\<b-mu\>, \<Lambda\>, \<nu\>) =
      \ <big|int><rsub|0><rsup|\<infty\>>\<cal-N\>(x\|\<b-mu\>,
      (\<eta\>\<Lambda\>)<rsup|\<minus\>1>)Gam(\<eta\>\|\<nu\>/2,
      \<nu\>/2)\<mathd\>\<eta\>.
    </equation*>

    Using the same technique as for the univariate case, we can evaluate this
    integral to give
  </hidden>|<\hidden>
    <\equation*>
      St(x\|\<b-mu\>, \<Lambda\>, \<nu\>) =<frac| \<Gamma\>(D/2 + \<nu\>/2)|
      \ \<Gamma\>(\<nu\>/2)> <frac| \|\<Lambda\>\|<rsup|1/2> | (\<pi\> \<nu\>
      )<rsup|D/2>> \ <around*|[|1 + <frac|\<#2206\><rsup|2>|\<nu\>>|]><rsup|\<minus\>D/2\<minus\>\<nu\>/2>
    </equation*>

    where <math|D> is the dimensionality of <math|x>, and
    <math|\<#2206\><rsup|2>> is the squared Mahalanobis distance defined by
    \ 

    <\equation*>
      \<#2206\><rsup|2> = (\<b-x\>\<minus\>
      \<b-mu\>)<rsup|T>\<Lambda\>(\<b-x\> \<minus\>\<b-mu\>).
    </equation*>

    \ \ This is the multivariate form of Student's t-distribution and
    satisfies the following properties \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<b-x\>|]>>|<cell|=>|<cell|\<b-mu\>>>|<row|<cell|cov<around*|[|\<b-x\>|]>>|<cell|=>|<cell|<frac|\<nu\>|<around*|(|n-2|)>>\<Lambda\><rsup|-1>>>|<row|<cell|mode<around*|[|\<b-x\>|]>>|<cell|=>|<cell|\<b-mu\>>>>>
    </eqnarray*>

    with corresponding results for the univariate case.
  </hidden>|<\hidden>
    <tit|Periodic variables>

    Let us consider the problem of evaluating the mean of a set of
    observations <math|D = {\<theta\><rsub|1>, . . . , \<theta\><rsub|N> }>
    of a periodic variable.

    Assume that \<theta\> is measured in radians.

    The simple average <math|(\<theta\><rsub|1>+\<cdots\>+\<theta\><rsub|N>)/N>
    will be strongly coordinate dependent.

    To find an invariant measure of the mean, we note that the observations
    can be viewed as points on the unit circle and can therefore be described
    instead by two-dimensional unit vectors

    <\equation*>
      \<b-x\><rsub|1>, . . . ,\<b-x\><rsub|N>
    </equation*>

    where

    <\equation*>
      \<\|\|\>\<b-x\><rsub|n>\<\|\|\> = 1
    </equation*>

    for <math|n = 1, . . . , N> , as illustrated in Figure
    <reference|fig2.17>.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_17_periodic_var.png|.3par|||>|<label|fig2.17>Illustration
      of the representation of values <math|\<theta\><rsub|n>> of a periodic
      variable as two dimensional vectors <math|x<rsub|n>> living on the unit
      circle. Also shown is the average <math|<wide|x|\<bar\>>> of those
      vectors.>
    </padded-center>

    \;
  </hidden>|<\hidden>
    We can average the vectors <math|{x<rsub|n>}> instead to give \ 

    <\equation>
      <wide|\<b-x\>|\<wide-bar\>>=<frac|1|N><big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n><label|2.167>
    </equation>

    \ \ and then find the corresponding angle <math|\<theta\>> of this
    average. Clearly, this definition will ensure that the location of the
    mean is independent of the origin of the angular coordinate.

    Note that <math|<wide|\<b-x\>|\<wide-bar\>>> will typically lie inside
    the unit circle.
  </hidden>|<\hidden>
    \;

    The Cartesian coordinates of the observations are given by

    <\equation*>
      \<b-x\><rsub|n> = (cos \<theta\><rsub|n>, sin \<theta\><rsub|n>) ,
    </equation*>

    and we can write the Cartesian coordinates of the sample mean in the form

    <\equation*>
      <wide|\<b-x\>|\<wide-bar\>> = (<wide|r|\<wide-bar\>> cos
      \<theta\>,<wide|r|\<wide-bar\>> sin \<theta\>).
    </equation*>

    \;
  </hidden>|<\hidden>
    Substituting into Eq. <eqref|2.167> and equating the <math|x<rsub|1>> and
    <math|x<rsub|2>> components then gives \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|r|\<wide-bar\>>cos<wide|\<theta\>|\<wide-bar\>>>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N>cos\<theta\><rsub|n>>>|<row|<cell|<wide|r|\<wide-bar\>>sin<wide|\<theta\>|\<wide-bar\>>>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N>sin\<theta\><rsub|n>>>>>
    </eqnarray*>

    Taking the ratio, and using the identity <math|tan \<theta\> = sin
    \<theta\>/ cos \<theta\>>, we can solve for <math|\<theta\>> to give \ 

    <\equation>
      <wide|\<theta\>|\<wide-bar\>> = tan<rsup|\<minus\>1><around*|{|<frac|<big|sum><rsub|n>sin
      \<theta\><rsub|n>|<big|sum><rsub|n>cos
      \<theta\><rsub|n>>|}><label|2.169>
    </equation>
  </hidden>|<\hidden>
    <tit|<em|von Mises> distribution>

    We now consider a periodic generalization of the Gaussian called the
    <em|von Mises> distribution.

    Consider distributions <math|p(\<theta\>)> that have period
    <math|2\<pi\>>.

    Any probability density <math|p(\<theta\>)> defined over <math|\<theta\>>
    must not only be nonnegative and integrate to one, but it must also be
    periodic. Thus <math|p(\<theta\>)> must satisfy the three conditions

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<theta\>|)>>|<cell|\<geqslant\>>|<cell|0>>|<row|<cell|<big|int><rsub|0><rsup|2\<pi\>>p<around*|(|\<theta\>|)>\<mathd\>\<theta\>>|<cell|=>|<cell|1>>|<row|<cell|p<around*|(|\<theta\>+2\<pi\>|)>>|<cell|=>|<cell|p<around*|(|\<theta\>|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    We can easily obtain a Gaussian-like distribution that satisfies these
    three properties as follows.

    Consider a Gaussian distribution over two variables

    <\equation*>
      \<b-x\>=(x<rsub|1>,x<rsub|2>)
    </equation*>

    having mean

    <\equation*>
      \<b-mu\> = (\<mu\><rsub|1>, \<mu\><rsub|2>)
    </equation*>

    and a covariance matrix

    <\equation*>
      \<Sigma\> = \<sigma\><rsup|2>I
    </equation*>

    where <math|I> is the <math|2\<times\>2> identity matrix, so that

    <\equation>
      p<around*|(|x<rsub|1>,x<rsub|2>|)>=<frac|1|2\<pi\>\<sigma\><rsup|2>>exp<around*|{|-<frac|<around*|(|x<rsub|1>-\<mu\><rsub|1>|)><rsup|2>+<around*|(|x<rsub|2>-\<mu\><rsub|2>|)><rsup|2>|2\<sigma\><rsup|2>>|}><label|2.173>
    </equation>

    The contours of constant <math|p(x)> are circles, as illustrated in
    Figure <reference|fig2.18>.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_18_von_mises.png|.3par|||>|<label|fig2.18>The
      von Mises distribution can be derived by considering \ a
      two-dimensional Gaussian of the form <eqref|2.173>, whose density
      contours are shown in blue and conditioning on the unit circle shown in
      red.>
    </padded-center>
  </hidden>|<\hidden>
    Consider the value of this distribution along a circle of fixed radius.

    Then by construction this distribution will be periodic, although it will
    not be normalized.

    We can determine the form of this distribution by transforming from
    Cartesian coordinates <math|(x<rsub|1>, x<rsub|2>)> to polar coordinates
    <math|(r, \<theta\>)> so that

    <\eqnarray*>
      <tformat|<table|<row|<cell|x<rsub|1>>|<cell|=>|<cell|r
      cos\<theta\>>>|<row|<cell|x<rsub|2>>|<cell|=>|<cell|r sin\<theta\>>>>>
    </eqnarray*>

    We also map the mean <math|\<mu\>> into polar coordinates by writing\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<mu\><rsub|1>>|<cell|=>|<cell|r<rsub|0>cos\<theta\><rsub|0>>>|<row|<cell|\<mu\><rsub|2>>|<cell|=>|<cell|r<rsub|0>sin\<theta\><rsub|0>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    Substitute these transformations into the two-dimensional Gaussian
    distribution <eqref|2.173>, and then condition on the unit circle

    <\equation*>
      r=1.
    </equation*>

    Focussing on the exponent in the Gaussian distribution\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|>|<cell|>|<cell|-<frac|1|2\<sigma\><rsup|2>><around*|{|<around*|(|r
      cos\<theta\>-r<rsub|0>cos\<theta\><rsub|0>|)><rsup|2>+<around*|(|r
      sin\<theta\>-r<rsub|0>sin\<theta\><rsub|0>|)><rsup|2>|}>>>|<row|<cell|>|<cell|=>|<cell|-<frac|1|2\<sigma\><rsup|2>><around*|{|1+r<rsub|0><rsup|2>-2r<rsub|0>cos\<theta\>cos\<theta\><rsub|0>-2r<rsub|0>sin\<theta\>sin\<theta\><rsub|0>|}>>>|<row|<cell|>|<cell|=>|<cell|<frac|r<rsub|0>|\<sigma\><rsup|2>>cos<around*|(|\<theta\>-\<theta\><rsub|0>|)>+const>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|<em|von Mises> distribution expression>

    Define <math|m=r<rsub|0>/\<sigma\><rsup|2>>, final expression for the
    distribution of <math|p(\<theta\>)> along the unit circle <math|r=1> is
    in the form \ 

    <\equation*>
      p(\<theta\>\|\<theta\><rsub|0>, m) =
      <frac|1|2\<pi\>I<rsub|0><around*|(|m|)>>exp{m cos(\<theta\> \<minus\>
      \<theta\><rsub|0>)}
    </equation*>

    which is called the <em|von Mises> distribution, or the <em|circular
    normal>.

    Here the parameter <math|\<theta\><rsub|0>> corresponds to the mean of
    the distribution, while <math|m>, which is known as the concentration
    parameter, is analogous to the inverse variance (precision) for the
    Gaussian.\ 

    The von Mises distribution is plotted in Figure <reference|fig2.19>
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_19_von_mises_distribution.png|.7par|||>|<label|fig2.19>The
      von Mises distribution plotted for two different parameter values,
      shown as a Cartesian plot on the left and as the corresponding polar
      plot on the right.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|normalization coefficient>

    The normalization coefficient is expressed in terms of
    <math|I<rsub|0>(m)>, which is the zeroth-order Bessel function of the
    first kind (Abramowitz and Stegun, 1965) and is defined by\ 

    <\equation*>
      \ I<rsub|0>(m) = <frac|1|2\<pi\>><big|int><rsub|0><rsup|2\<pi\>>exp{m
      cos\<theta\>}\<mathd\>\<theta\>.
    </equation*>

    For large <math|m>, the distribution becomes approximately Gaussian.

    The function <math|I<rsub|0>(m)> is plotted in Figure
    <reference|fig2.20>.
  </hidden>|<\hidden>
    <tit|log likelihood>

    Consider the maximum likelihood estimators for the parameters
    <math|\<theta\><rsub|0>> and <math|m> for the von Mises distribution.

    The log likelihood function is given by \ 

    <\equation>
      ln p(\<cal-D\>\|\<theta\><rsub|0>,m)=\<minus\>N ln(2\<pi\>) \<minus\> N
      ln I<rsub|0>(m) +<big|sum><rsub|n=1><rsup|N>cos(\<theta\><rsub|n>
      \<minus\> \<theta\><rsub|0>).<label|2.181>
    </equation>
  </hidden>|<\hidden>
    <tit|<math|\<theta\><rsub|0><rsup|ML>>>

    Setting the derivative with respect to <math|\<theta\><rsub|0>> equal to
    zero gives

    <\eqnarray*>
      <tformat|<table|<row|<cell|<big|sum><rsub|n=1><rsup|N>sin(\<theta\><rsub|n>\<minus\>\<theta\><rsub|0><rsup|ML>)>|<cell|=>|<cell|0>>|<row|<cell|<big|sum><rsub|n=1><rsup|N>sin\<theta\><rsub|n>cos\<theta\><rsub|0><rsup|ML>\<minus\><big|sum><rsub|n=1><rsup|N>cos\<theta\><rsub|n>sin\<theta\><rsub|0><rsup|ML>>|<cell|=>|<cell|0>>|<row|<cell|\<theta\><rsup|ML><rsub|0>
      >|<cell|=>|<cell| tan<rsup|\<minus\>1><around*|{|<frac|<big|sum><rsub|n>sin
      \<theta\><rsub|n>|<big|sum><rsub|n>cos\<theta\><rsub|n>>|}>>>>>
    </eqnarray*>

    \ \ which we recognize as the result <eqref|2.169> obtained earlier for
    the mean of the observations viewed in a two-dimensional Cartesian space.
  </hidden>|<\hidden>
    <tit|<math|m<rsub|ML>>>

    maximizing Eq. <eqref|2.181> with respect to <math|m>, and making use of
    <math|I<rsub|0><rprime|'>(m) = I<rsub|1>(m)> (Abramowitz and Stegun,
    1965), we have \ 

    <\equation*>
      A(m<rsub|ML>) =<frac|1|N><big|sum><rsub|n=1><rsup|N>cos<around*|(|\<theta\><rsub|n>-\<theta\><rsub|0><rsup|ML>|)>
    </equation*>

    where we have substituted for the maximum likelihood solution for
    <math|\<theta\><rsub|0><rsup|ML>> (recalling that we are performing a
    joint optimization over <math|\<theta\>> and <math|m>), and we have
    defined \ 

    <\equation*>
      A(m) = <frac|I<rsub|1>(m) \ |I<rsub|0><around*|(|m|)>>
    </equation*>

    The function <math|A(m)> is plotted in Figure <reference|fig2.20>.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_20_normalization_coefficient.png|.9par|||>|<label|fig2.20>Plot
      of the Bessel function <math|I<rsub|0>(m)> defined by (2.180), together
      with the function <math|A(m)> defined by (2.186).>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Mixtures of Gaussians>

    By using a sufficient number of Gaussians, and by adjusting their means
    and covariances as well as the coefficients in the linear combination,
    almost any continuous density can be approximated to arbitrary accuracy.

    Consider a superposition of <math|K> Gaussian densities of the form \ 

    <\equation>
      p(x) = <big|sum><rsub|k=1><rsup|K>\<pi\><rsub|k>\<cal-N\><around*|(|x\|\<mu\><rsub|k>,\<Sigma\><rsub|k>|)><label|2.188>
    </equation>

    which is called a <em|mixture of Gaussians>.

    Each Gaussian density <math|\<cal-N\>(x\|\<mu\><rsub|k>,
    \<Sigma\><rsub|k>)> is \ called a component of the mixture and has its
    own mean <math|\<mu\><rsub|k>> and covariance <math|\<Sigma\><rsub|k>>.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_21_mixture_gaussian_2D.png|.5par|||>|Plots
      of the `old faithful' data in which the blue curves show contours of
      constant probability density. On the left is a single Gaussian
      distribution which has been fitted to the data using maximum
      likelihood. Note that this distribution fails to capture the two clumps
      in the data and indeed places much of its probability mass in the
      central region between the clumps where the data are relatively sparse.
      On the right the distribution is given by a linear combination of two
      Gaussians which has been fitted to the data by maximum likelihood which
      gives a better representation of the data.>
    </padded-center>
  </hidden>|<\hidden>
    \;

    \;

    \;

    <\padded-center>
      <small-figure|<image|image/fig_2_22_mixture_gaussian_1D.png|.3par|||>|Example
      of a Gaussian mixture distribution \ in one dimension showing three
      Gaussians (each scaled by a coefficient) in blue and their sum in red.>
    </padded-center>
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_23_mixture_gaussian_2D_surface.png|.93par|||>|Illustration
      of a mixture of 3 Gaussians in a two-dimensional space. (a) Contours of
      constant density for each of the mixture components, in which the 3
      components are denoted red, blue and green, and the values of the
      mixing coefficients are shown below each component. (b) Contours of the
      marginal probability density <math|p(x)> of the mixture distribution.
      (c) A surface plot of the distribution <math|p(x)>.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|<em|mixing coefficients>>

    The parameters <math|\<pi\><rsub|k>> in Eq. <eqref|2.188> are called
    <em|mixing coefficients>.

    Integrate both sides of Eq. <eqref|2.188> with respect to <math|x>, and
    note that both <math|p(x)> and the individual Gaussian components are
    normalized,\ 

    <\equation>
      <big|sum><rsub|k=1><rsup|K>\<pi\><rsub|k>=1<label|2.189>
    </equation>

    Also, \ given that <math|N(x\|\<mu\><rsub|k>, \<Sigma\><rsub|k>) \<gtr\>
    0>, a sufficient condition for the requirement <math|p(x)\<gtr\>0> is
    that <math|\<pi\><rsub|k>\<gtr\>0> for all <math|k>.

    Combining this with the condition <eqref|2.189> we obtain

    <\equation*>
      0\<leqslant\>\<pi\><rsub|k>\<leqslant\>1.
    </equation*>
  </hidden>|<\hidden>
    <tit|prior>

    From the sum and product rules, the marginal density is given by \ 

    <\equation*>
      p(x) =<big|sum><rsub|k=1><rsup|K>p<around*|(|x\|k|)>p<around*|(|k|)>
    </equation*>

    which is equivalent to Eq. <eqref|2.188>\ 

    <\description>
      <item*|prior probability of picking the k'th component,>

      <\equation*>
        \<pi\><rsub|k> = p(k)
      </equation*>

      <item*|the probability of <math|x> conditioned on <math|k>>

      <\equation*>
        \<cal-N\>(x\|\<mu\><rsub|k>, \<Sigma\><rsub|k>)=p(x\|k)
      </equation*>
    </description>

    \;
  </hidden>|<\hidden>
    <tit|posterior>

    The posterior probabilities <math|p(k\|x)> are known as
    <em|responsibilities>.

    From Bayes' theorem these are given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<gamma\><rsub|k><around*|(|x|)>>|<cell|\<equiv\>>|<cell|p<around*|(|k\|x|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|p<around*|(|k|)>p<around*|(|x\|k|)>|<big|sum><rsub|l>p<around*|(|l|)>p<around*|(|x\|l|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<pi\><rsub|k>\<cal-N\><around*|(|x\|\<mu\><rsub|k>,\<Sigma\><rsub|k>|)>|<big|sum><rsub|l>\<pi\><rsub|l>\<cal-N\><around*|(|x\|\<mu\><rsub|l>,\<Sigma\><rsub|l>|)>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|liklihood>

    The form of the Gaussian mixture distribution is governed by the
    parameters <math|\<b-pi\>>, <math|\<b-mu\>> and <math|\<b-Sigma\>>, where
    <math|\<b-pi\> \<equiv\> {\<pi\><rsub|1>, . . . , \<pi\><rsub|K>}>,
    <math|\<b-mu\>\<equiv\> {\<b-mu\><rsub|1>, . . . ,\<b-mu\><rsub|K>}> and
    <math|\<b-Sigma\>\<equiv\>{\<Sigma\><rsub|1>, . . . \<Sigma\><rsub|K>}>.
    One way to set the values of these parameters is to use maximum
    likelihood. From Eq. <eqref|2.188> the log of the likelihood function is
    given by \ 

    <\equation*>
      ln p(X\|\<b-pi\>,\<b-mu\>,\<b-Sigma\>)
      =<big|sum><rsub|n=1><rsup|N>ln<around*|{|<big|sum><rsub|k=1><rsup|K>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|k>,
      \<Sigma\><rsub|k>|)>|}>
    </equation*>

    \ where <math|X = {x<rsub|1>, . . . , x<rsub|N>}>.

    The situation is now much more complex than with a single Gaussian, due
    to the presence of the summation over <math|k> inside the logarithm. As a
    result, the maximum likelihood solution for the parameters no longer has
    a closed-form analytical solution.

    One approach to maximizing the likelihood function is to use iterative
    numerical optimization techniques. Alternatively can employ a powerful
    framework called <em|expectation maximization>.
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|The Exponential Family>
    </padded-center>
  </hidden>|<\hidden>
    <tit|exponential family>

    The exponential family of distributions over <math|x>, given parameters
    \<eta\>, is defined to be the set of distributions of the form \ 

    <\equation>
      p(\<b-x\>\|\<b-eta\>) = h(\<b-x\>)g(\<b-eta\>)exp{\<b-eta\><rsup|T>\<b-u\>(\<b-x\>)}
      <label|2.194>
    </equation>

    where <math|\<b-x\>> may be scalar or vector, and may be discrete or
    continuous.

    Here <math|\<b-eta\>> are called the natural parameters of the
    distribution, and <math|\<b-u\>(\<b-x\>)> is some function of
    <math|\<b-x\>>.

    The function <math|g(\<b-eta\>)> can be interpreted as the coefficient
    that ensures that the distribution is normalized and therefore satisfies

    <\equation>
      g(\<b-eta\>)<big|int>h(\<b-x\>)exp{\<b-eta\><rsup|T>\<b-u\>(\<b-x\>)}\<mathd\>\<b-x\>=1<label|2.195>
    </equation>

    where the integration is replaced by summation if <math|\<b-x\>> is a
    discrete variable.
  </hidden>|<\hidden>
    <tit|Bernoulli distribution>

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|x\|\<mu\>|)>>|<cell|=>|<cell|Bern<around*|(|x\|\<mu\>|)>>>|<row|<cell|>|<cell|=>|<cell|\<mu\><rsup|x><around*|(|1-\<mu\>|)><rsup|1-x>>>>>
    </eqnarray*>

    Expressing the right-hand side as the exponential of the logarithm, we
    have

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|x\|\<mu\>|)>>|<cell|=>|<cell|exp<around*|{|x
      ln\<mu\>+<around*|(|1-x|)>ln<around*|(|1-\<mu\>|)>|}>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|1-\<mu\>|)>exp<around*|{|ln<around*|(|<frac|\<mu\>|1-\<mu\>>|)>x|}>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    Comparison with Eq. <eqref|2.194> to identify\ 

    <\equation*>
      \ \<eta\> = ln<around*|(|<frac|\<mu\>|1\<minus\>\<mu\> >|)>
    </equation*>

    which we can solve for <math|\<mu\>> to give <math|\<mu\> =
    \<sigma\>(\<eta\>)>, where \ 

    <\equation>
      \<sigma\>(\<eta\>) = <frac|1|1+exp<around*|(|-\<eta\>|)>><label|2.199>
    </equation>

    is called the <em|logistic sigmoid function>.

    \;
  </hidden>|<\hidden>
    Thus we can write the Bernoulli distribution using the standard
    representation <eqref|2.194> in the form \ 

    <\equation*>
      p(x\|\<eta\>) = \<sigma\>(\<minus\>\<eta\>) exp(\<eta\>x) (2.200)
    </equation*>

    where we have used

    <\equation*>
      1 \<minus\> \<sigma\>(\<eta\>) = \<sigma\>(\<minus\>\<eta\>),
    </equation*>

    which is easily proved from Eq. <eqref|2.199>. Comparison with Eq.
    <eqref|2.194> shows that

    <\eqnarray*>
      <tformat|<table|<row|<cell|u<around*|(|x|)>>|<cell|=>|<cell|x>>|<row|<cell|h<around*|(|x|)>>|<cell|=>|<cell|1>>|<row|<cell|g<around*|(|\<eta\>|)>>|<cell|=>|<cell|\<sigma\><around*|(|-\<eta\>|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|multinomial distribution>

    For a single observation <math|x>, takes the form \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<b-x\>\|\<b-mu\>|)>>|<cell|=>|<cell|<big|prod><rsub|k=1><rsup|M>\<mu\><rsub|k><rsup|x<rsub|k>>>>|<row|<cell|>|<cell|=>|<cell|exp<around*|{|<big|sum><rsub|k=1><rsup|M>x<rsub|k>ln\<mu\><rsub|k>|}>>>>>
    </eqnarray*>

    \ \ where <math|x = (x<rsub|1>, . . . , x<rsub|M>)<rsup|T>>.\ 
  </hidden>|<\hidden>
    Write in the standard representation <eqref|2.194>,

    <\equation*>
      p(x\|\<eta\>) = exp(\<b-eta\><rsup|T>\<b-x\>)
    </equation*>

    where <math|\<eta\><rsub|k> = ln \<mu\><rsub|k>>, and <math|\<b-eta\>=
    (\<eta\><rsub|1>, . . . , \<eta\><rsub|M>)<rsup|T>>.

    Again, comparing with Eq. <eqref|2.194> we have

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-u\><around*|(|\<b-x\>|)>>|<cell|=>|<cell|\<b-x\>>>|<row|<cell|h<around*|(|\<b-x\>|)>>|<cell|=>|<cell|1>>|<row|<cell|g<around*|(|\<b-eta\>|)>>|<cell|=>|<cell|1>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    The parameters <math|\<eta\><rsub|k>> are not independent because the
    parameters <math|\<mu\><rsub|k>> are subject to the
    <with|color|blue|constraint> \ 

    <\equation*>
      <big|sum><rsub|k=1><rsup|M>\<mu\><rsub|k>=1
    </equation*>

    so that, given any <math|<with|color|blue|M \<minus\> 1>> of the
    parameters <math|\<mu\><rsub|k>>, the value of the remaining parameter is
    fixed.

    In some circumstances, it will be convenient to remove this constraint by
    expressing the distribution in terms of only <math|M \<minus\> 1>
    parameters.

    This can be achieved by expressing <math|\<mu\><rsub|M>> in terms of the
    remaining <math|{\<mu\><rsub|k>} >where <math|k = 1, . . . , M \<minus\>
    1>, thereby leaving <math|M \<minus\> 1> parameters.

    Note that these remaining parameters are still subject to the constraints

    <\eqnarray*>
      <tformat|<table|<row|<cell|0\<leqslant\>\<mu\><rsub|k>>|<cell|\<leqslant\>>|<cell|1>>|<row|<cell|<big|sum><rsub|k=1><rsup|M-1>\<mu\><rsub|k>>|<cell|\<leqslant\>>|<cell|1>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    the multinomial distribution in this representation then becomes

    <\eqnarray*>
      <tformat|<table|<row|<cell|exp<around*|{|<big|sum><rsub|k=1><rsup|M>x<rsub|k>ln\<mu\><rsub|k>|}>>|<cell|=>|<cell|exp<around*|{|<big|sum><rsub|k=1><rsup|M-1>x<rsub|k>ln\<mu\><rsub|k>+<around*|(|1-<big|sum><rsub|k=1><rsup|M-1>x<rsub|k>|)>ln<around*|(|1-<big|sum><rsub|k=1><rsup|M>\<mu\><rsub|k>|)>|}>>>|<row|<cell|>|<cell|=>|<cell|exp<around*|{|<big|sum><rsub|k=1><rsup|M-1>x<rsub|k>ln<around*|(|<frac|\<mu\><rsub|k>|1-<big|sum><rsub|j=1><rsup|M-1>\<mu\><rsub|j>>|)>+ln<around*|(|1-<big|sum><rsub|k=1><rsup|M>\<mu\><rsub|k>|)>|}>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    We now identify \ 

    <\equation*>
      ln<around*|(|<frac|\<mu\><rsub|k>|1-<big|sum><rsub|j=1><rsup|M-1>\<mu\><rsub|j>>|)>
      = \<eta\><rsub|k>
    </equation*>

    which we can solve for <math|\<mu\><rsub|k>> by first summing both sides
    over <math|k> and then rearranging and back-substituting to give \ 

    <\equation*>
      \<mu\><rsub|k> = <frac|exp(\<eta\><rsub|k>)|1+<big|sum><rsub|j=1><rsup|M-1>exp<around*|(|\<eta\><rsub|j>|)>>.
    </equation*>

    \ \ This is called the <em|softmax function>, or the <em|normalized
    exponential>.
  </hidden>|<\hidden>
    In this representation, the multinomial distribution therefore takes the
    form \ 

    <\equation*>
      p(\<b-x\>\|\<b-eta\>) = <around*|(|1+<big|sum><rsub|k=1><rsup|M-1>exp<around*|(|\<eta\><rsub|k>|)>|)><rsup|-1>exp<around*|(|\<b-eta\><rsup|T>\<b-x\>|)>
    </equation*>

    \ \ This is the standard form of the exponential family, with parameter
    vector

    <\equation*>
      \ \<b-eta\> = (\<eta\><rsub|1>, . . . ,
      \<eta\><rsub|M\<minus\>1>,0)<rsup|T>
    </equation*>

    \ in which

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-u\><around*|(|\<b-x\>|)>>|<cell|=>|<cell|\<b-x\>>>|<row|<cell|h<around*|(|\<b-x\>|)>>|<cell|=>|<cell|1>>|<row|<cell|g<around*|(|\<b-eta\>|)>>|<cell|=>|<cell|<around*|(|1+<big|sum><rsub|k=1><rsup|M-1>exp<around*|(|\<eta\><rsub|k>|)>|)><rsup|-1>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|univariate Gaussian>

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|x\|\<mu\>,\<sigma\><rsup|2>|)>>|<cell|=>|<cell|<frac|1|<around*|(|2\<pi\>\<sigma\><rsup|2>|)><rsup|1/2>>exp<around*|{|-<frac|1|2\<sigma\><rsup|2>><around*|(|x-\<mu\>|)><rsup|2>|}>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|<around*|(|2\<pi\>\<sigma\><rsup|2>|)><rsup|1/2>>exp<around*|{|-<frac|x<rsup|2>-2\<mu\>x+\<mu\><rsup|2>|2\<sigma\><rsup|2>>|}>>>|<row|<cell|\<b-eta\>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|<frac|\<mu\>|\<sigma\><rsup|2>>>|<cell|-<frac|1|2\<sigma\><rsup|2>>>>>>><rsup|T>>>|<row|<cell|\<b-u\><around*|(|x|)>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|x>|<cell|x<rsup|2>>>>>><rsup|T>>>|<row|<cell|h<around*|(|x|)>>|<cell|=>|<cell|<around*|(|2\<pi\>|)><rsup|-1/2>>>|<row|<cell|g<around*|(|\<b-eta\>|)>>|<cell|=>|<cell|<around*|(|-2\<eta\><rsub|2>|)><rsup|1/2>exp<around*|(|<frac|\<eta\><rsub|1><rsup|2>|4\<eta\><rsub|2>>|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|Maximum likelihood>

    Consider the problem of estimating the parameter vector <math|\<b-eta\>>
    in the general exponential family distribution <eqref|2.194> using the
    technique of maximum likelihood.

    Taking the gradient of both sides of Eq. <eqref|2.195> with respect to
    <math|\<b-eta\>>, we have

    <\eqnarray*>
      <tformat|<table|<row|<cell|0>|<cell|=>|<cell|\<nabla\>g<around*|(|\<b-eta\>|)><big|int>h<around*|(|x|)>exp<around*|{|\<b-eta\><rsup|T>\<b-u\><around*|(|x|)>|}>\<mathd\>x+g<around*|(|\<b-eta\>|)><big|int>h<around*|(|x|)>exp<around*|{|\<b-eta\><rsup|T>\<b-u\><around*|(|x|)>|}>\<b-u\><around*|(|x|)>\<mathd\>x>>|<row|<cell|-<frac|\<nabla\>g<around*|(|\<b-eta\>|)>|g<around*|(|\<b-eta\>|)>>>|<cell|=>|<cell|g<around*|(|\<b-eta\>|)><big|int>h<around*|(|x|)>exp<around*|{|\<b-eta\><rsup|T>\<b-u\><around*|(|x|)>|}>\<b-u\><around*|(|x|)>\<mathd\>x>>|<row|<cell|-\<nabla\>ln
      g<around*|(|\<b-h\>|)>>|<cell|=>|<cell|\<bbb-E\><around*|[|\<b-u\><around*|(|x|)>|]><eq-number><label|2.226>>>>>
    </eqnarray*>

    Note that the covariance of <math|\<b-u\>(x)> can be expressed in terms
    of the second derivatives of <math|g(\<b-eta\>)>, and similarly for
    higher order moments.Thus, provided we can normalize a \ distribution
    from the exponential family, we can always find its moments by simple
    differentiation.
  </hidden>|<\hidden>
    Consider a set of independent identically distributed data denoted by
    <math|X = {\<b-x\><rsub|1>, . . . , \<b-x\><rsub|N>}>, for which the
    likelihood function is given by \ 

    <\equation>
      p(X\|\<b-eta\>) = \ <around*|(|<big|prod><rsub|n=1><rsup|N>h<around*|(|\<b-x\><rsub|n>|)>|)>g<around*|(|\<b-eta\>|)><rsup|N>exp<around*|{|\<b-eta\><rsup|T><big|sum><rsub|n=1><rsup|N>\<b-u\><around*|(|\<b-x\><rsub|n>|)>|}><label|2.227>
    </equation>

    Setting the gradient of <math|ln p(X\|\<b-eta\>)> with respect to
    <math|\<b-eta\>> to zero, we get the following condition to be satisfied
    by the maximum likelihood estimator <math|\<b-eta\><rsub|ML>>

    <\equation>
      \ \<minus\>\<nabla\> ln g(\<b-eta\><rsub|ML>)
      =<frac|1|N><big|sum><rsub|n=1><rsup|N>\<b-u\><around*|(|\<b-x\><rsub|n>|)><label|2.228>
    </equation>
  </hidden>|<\hidden>
    <tit|sufficient statistics>

    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      We see that the solution for the maximum likelihood estimator depends
      on the data only through <math|<big|sum><rsub|n>\<b-u\><around*|(|\<b-x\><rsub|n>|)>>,
      which \ is therefore called the <em|sufficient statistic> of the
      distribution <eqref|2.194>.
    </shown>|<\shown>
      We do not need to store the entire data set itself but only the value
      of the sufficient statistic.
    </shown>|<\shown>
      For the Bernoulli distribution, for example, the function
      <math|\<b-u\>(x)> is given just by <math|x> and so we need only keep
      the sum of the data points <math|{x<rsub|n>}>, whereas for the Gaussian
      <math|\<b-u\>(x) = (x, x<rsup|2>)<rsup|T>>, and so we should keep both
      the sum of <math|{x<rsub|n>}> and the sum of
      <math|{x<rsup|2><rsub|n>}>.
    </shown>|<\shown>
      If we consider the limit <math|N \<rightarrow\> \<infty\>>, then the
      right-hand side of Eq. <eqref|2.228> becomes
      <math|\<bbb-E\>[\<b-u\>(x)]>, and so by comparing with Eq.
      <eqref|2.226> we see that in this limit <math|\<b-eta\><rsub|ML>> will
      equal the true value <math|\<b-eta\>>.
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Conjugate priors>

    For example in the context of the <with|color|blue|Bernoulli>
    distribution (for which the conjugate prior is the <with|color|blue|beta>
    distribution) or the <with|color|blue|Gaussian> (where the conjugate
    prior for the mean is a <with|color|blue|Gaussian>, and the conjugate
    prior for the precision is the <with|color|blue|Wishart> distribution).

    In general, for a given probability distribution <math|p(x\|\<b-eta\>)>,
    we can seek a prior <math|p(\<b-eta\>)> that is conjugate to the
    likelihood function, so that the posterior distribution has the same
    functional form as the prior.
  </hidden>|<\hidden>
    For any member of the exponential family <eqref|2.194>, there exists a
    conjugate prior that can be written in the form \ 

    <\equation*>
      p(\<b-eta\>\|\<b-chi\>,\<nu\>) = f (\<b-chi\>,
      \<nu\>)g(\<b-eta\>)<rsup|\<nu\>> exp {\<nu\>\<b-eta\><rsup|T>\<b-chi\>}
    </equation*>

    where <math|f (\<b-chi\>, \<nu\>)> is a normalization coefficient,
    <math|g<around*|(|\<b-eta\>|)>> is the same function as appears in Eq.
    <eqref|2.194>.

    To see that this is indeed conjugate, let us multiply the prior by the
    likelihood function <eqref|2.227> to obtain the posterior distribution,
    up to a normalization coefficient, in the form \ 

    <\equation*>
      p(\<b-eta\>\|X, \<b-chi\>, \<nu\>) \<propto\>
      g<around*|(|\<b-eta\>|)><rsup|\<nu\>+N>
      exp<around*|{|\<b-eta\><rsup|T><around*|(|\<nu\>\<b-chi\>+<big|sum><rsub|n=1><rsup|N>\<b-u\><around*|(|\<b-x\><rsub|n>|)>|)>|}>
    </equation*>

    \ \ This again takes the same functional form as the prior, confirming
    conjugacy.

    Furthermore, we see that the parameter <math|\<nu\>> can be interpreted
    as an effective number of pseudo-observations in the prior, each of which
    has a value for the sufficient statistic <math|\<b-u\>(x)> given by
    <math|\<b-chi\>>.
  </hidden>|<\hidden>
    <tit|Noninformative priors>

    In some applications of probabilistic inference, we may have prior
    knowledge that can be conveniently expressed through the prior
    distribution.

    For example, if the prior assigns zero probability to some value of
    variable, then the posterior distribution will necessarily also assign
    zero probability to that value, irrespective of any subsequent
    observations of data.

    In many cases, however, we may have little idea of what form the
    distribution should take.

    We may then seek a form of prior distribution, called a
    <em|noninformative prior>, which is intended to have as little influence
    on the posterior distribution as possible.

    This is sometimes referred to as `<em|letting the data speak for
    themselves>'.
  </hidden>|<\hidden>
    <tit|improper prior>

    If we have a distribution <math|p(x\|\<lambda\>)> governed by a parameter
    <math|\<lambda\>>, we might be tempted to propose a prior distribution
    <math|p(\<lambda\>) = const> as a suitable prior.

    If <math|\<lambda\>> is a discrete variable with <math|K> states, this
    simply amounts to setting the prior probability of each state to
    <math|1/K>.

    In the case of continuous parameters, however, there are two potential
    difficulties with this approach.

    The first is that, if the domain of <math|\<lambda\>> is unbounded, this
    prior distribution cannot be correctly normalized because the integral
    over \<lambda\> diverges.Such priors are called <em|improper>.

    In practice, improper priors can often be used provided the corresponding
    posterior distribution is proper, i.e., that it can be correctly
    normalized.

    For instance, if we put a uniform prior distribution over the mean of a
    Gaussian, then the posterior distribution for the mean, once we have
    observed at least one data point, will be proper.
  </hidden>|<\hidden>
    <tit|transformation behaviour>

    A second difficulty arises from the transformation behaviour of a
    probability density under a nonlinear change of variables, given by
    (1.27).

    If a function <math|h(\<lambda\>)> \ is constant, and we change variables
    to <math|\<lambda\> = \<eta\><rsup|2>>, then <math|<wide|h|^>(\<eta\>) =
    h(\<eta\><rsup|2>)> will also be constant. However, if we choose the
    density <math|p<rsub|\<lambda\>>(\<lambda\>)> to be constant, then the
    density of <math|\<eta\>> will be given, from (1.27), by \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<rsub|\<eta\>>(\<eta\>) >|<cell|=>|<cell|
      p<rsub|\<lambda\>>(\<lambda\>) \ <around*|\||<frac|\<mathd\>\<lambda\>|\<mathd\>\<eta\>>|\|>>>|<row|<cell|>|<cell|=>|<cell|p<rsub|\<lambda\>>(\<eta\><rsup|2>)2\<eta\>
      >>|<row|<cell|>|<cell|\<propto\>>|<cell|\<eta\>>>>>
    </eqnarray*>

    and so the density over <math|\<eta\>> will not be constant.

    \;
  </hidden>|<\hidden>
    This issue does not arise when we use maximum likelihood, because the
    likelihood function <math|p(x\|\<lambda\>)> is a simple function of
    <math|\<lambda\>> and so we are free to use any convenient
    parameterization.

    If, however, we are to choose a prior distribution that is constant, we
    must take care to use an appropriate representation for the parameters.
  </hidden>|<\hidden>
    <tit|translation invariance>

    If a density takes the form \ 

    <\equation*>
      p(x\|\<mu\>) = f (x \<minus\> \<mu\>)
    </equation*>

    then the parameter <math|\<mu\>> is known as a location parameter.

    This family of densities exhibits translation invariance because if we
    shift <math|x> by a constant to give <math|<wide|x|^> = x + c>, then \ 

    <\equation*>
      p(<wide|x|^>\|<wide|\<mu\>|^>) = f (<wide|x|^>
      \<minus\><wide|\<mu\>|^>)
    </equation*>

    where we have defined <math|<wide|\<mu\>|^> = \<mu\> + c.>

    Thus the density takes the same form in the new variable as in the
    original one, and so the density is independent of the choice of origin.
  </hidden>|<\hidden>
    We would like to choose a prior distribution that reflects this
    translation invariance property, and so we choose a prior that assigns
    equal probability mass to an interval
    <math|A\<leqslant\>\<mu\>\<leqslant\>B> as to the shifted interval
    <math|A-c\<leqslant\>\<mu\>\<leqslant\>B-c>. This implies

    <\eqnarray*>
      <tformat|<table|<row|<cell|<big|int><rsub|A><rsup|B>p<around*|(|\<mu\>|)>\<mathd\>\<mu\>>|<cell|=>|<cell|<big|int><rsub|A-c><rsup|B-c>p<around*|(|\<mu\>|)>\<mathd\>\<mu\>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|A><rsup|B>p<around*|(|\<mu\>-c|)>\<mathd\>\<mu\>>>>>
    </eqnarray*>

    and because this must hold for all choices of <math|A> and <math|B>, we
    have \ 

    <\equation*>
      p(\<mu\> \<minus\> c) = p(\<mu\>)
    </equation*>

    which implies that <math|p(\<mu\>)> is constant.
  </hidden>|<\hidden>
    An example of a location parameter would be the mean <math|\<mu\>> of a
    Gaussian distribution.

    As we have seen, the conjugate prior distribution for <math|\<mu\>> in
    this case is a Gaussian

    <\equation*>
      p(\<mu\>\|\<mu\><rsub|0>, \<sigma\><rsub|0><rsup|2>)= N
      (\<mu\>\|\<mu\><rsub|0>, \<sigma\><rsub|0><rsup|2>) ,
    </equation*>

    and we obtain a \ noninformative prior by taking the limit
    <math|\<sigma\><rsub|0><rsup|2> \<rightarrow\> \<infty\>>.

    This gives a posterior distribution over <math|\<mu\>> in which the
    contributions from the prior vanish.
  </hidden>|<\hidden>
    <tit|scale invariance>

    consider a density of the form \ 

    <\equation*>
      p(x\|\<sigma\>) = <frac|1|\<sigma\>>f<around*|(|<frac|x|\<sigma\>>|)>\ 
    </equation*>

    \ \ where <math|\<sigma\> \<gtr\> 0>. Note that this will be a normalized
    density provided <math|f (x)> is correctly \ normalized. The parameter
    <math|\<sigma\>> is known as a scale parameter, and the density exhibits
    \ <em|scale invariance> because if we scale <math|x> by a constant to
    give <math|<wide|x|^> = c x>, then

    <\equation*>
      p<around*|(|<wide|x|^>\|<wide|\<sigma\>|^>|)>=<frac|1|<wide|\<sigma\>|^>>f<around*|(|<frac|<wide|x|^>|<wide|\<sigma\>|^>>|)>
    </equation*>

    where we have defined <math|<wide|\<sigma\>|^> = c\<sigma\>>.
  </hidden>|<\hidden>
    This transformation corresponds to a change of scale, and we would like
    to choose a prior distribution that reflects this scale invariance.

    If we consider an interval <math|A\<leqslant\>\<sigma\>\<leqslant\>B>,
    and a scaled interval <math|A/c\<leqslant\>\<sigma\>\<leqslant\>B/c>,
    then the prior should assign equal probability mass to these two
    intervals. Thus we have \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|<big|int><rsub|A><rsup|B>p<around*|(|\<sigma\>|)>\<mathd\>\<sigma\>>|<cell|=>|<cell|<big|int><rsub|A/c><rsup|B/c>p<around*|(|\<sigma\>|)>\<mathd\>\<sigma\>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|A><rsup|B>p<around*|(|<frac|\<sigma\>|c>|)><frac|1|c>\<mathd\>\<sigma\>>>>>
    </eqnarray*>

    \ \ and because this must hold for choices of <math|A> and <math|B>, we
    have \ 

    <\equation*>
      p(\<sigma\>) = p<around*|(|<frac|\<sigma\>|c>|)><frac|1|c>
    </equation*>

    and hence <math|p(\<sigma\>) \<propto\> 1/\<sigma\>>.\ 
  </hidden>|<\hidden>
    Note that again this is an improper prior because the integral of the
    distribution over <math|0\<leqslant\>\<sigma\>\<leqslant\>\<infty\>> is
    divergent.

    It is sometimes also convenient to think of the prior distribution for a
    scale parameter in terms of the density of the log of the parameter.

    Using the transformation rule (1.27) for densities we see that <math|p(ln
    \<sigma\>) = const>. Thus, for this prior there is the same probability
    mass in the range <math|1\<leqslant\>\<sigma\>\<leqslant\>10> as in the
    range <math|10\<leqslant\>\<sigma\>\<leqslant\>100> and in
    <math|100\<leqslant\>\<sigma\>\<leqslant\>1000>.
  </hidden>|<\hidden>
    An example of a scale parameter would be the standard deviation
    <math|\<sigma\>> of a Gaussian distribution, after we have taken account
    of the location parameter <math|\<mu\>>, because \ 

    <\equation*>
      N (x\|\<mu\>, \<sigma\><rsup|2>) \<propto\> \<sigma\><rsup|\<minus\>1>
      exp {\<minus\>(<wide|x|~>/\<sigma\>)<rsup|2>}
    </equation*>

    where \ <math|<wide|x|~> = x \<minus\> \<mu\>>.

    As discussed earlier, it is often more convenient to work in terms of the
    precision <math|\<lambda\> = 1/\<sigma\><rsup|2>> rather than
    <math|\<sigma\>> itself.

    Using the transformation rule for densities, we see that a distribution
    <math|p(\<sigma\>) \<propto\> 1/\<sigma\>> corresponds to a distribution
    over <math|\<lambda\>> of the form <math|p(\<lambda\>) \<propto\>
    1/\<lambda\>>.

    We have seen that the conjugate prior for <math|\<lambda\>> was the gamma
    distribution <math|Gam(\<lambda\>\|a<rsub|0>, b<rsub|0>)> given by Eq.
    <eqref|2.146>.

    The noninformative prior is obtained \ as the special case
    <math|a<rsub|0>=b<rsub|0>= 0>.

    If we examine the results for the posterior distribution of
    <math|\<lambda\>>, we see that for <math|a<rsub|0>=b<rsub|0>= 0>, the
    posterior depends only on terms arising from the data and not from the
    prior.
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|Nonparametric Methods>
    </padded-center>
  </hidden>|<\hidden>
    <tit|histogram>

    Standard histograms simply partition continuous variable <math|x> into
    distinct bins of width <math|\<#2206\><rsub|i>> and then count the number
    <math|n<rsub|i>> of observations of <math|x> falling in bin <math|i>.

    In order to turn this count into a normalized probability density, we
    simply divide by the total number <math|N> of observations and by the
    width <math|\<#2206\><rsub|i>> of the bins to obtain probability values
    for each bin given by \ 

    <\equation*>
      p<rsub|i>=<frac|n<rsub|i>|N\<Delta\><rsub|i>>
    </equation*>

    for which it is easily seen that

    <\equation*>
      <big|int>p(x)\<mathd\>x = 1.
    </equation*>

    This gives a model for the density <math|p(x)> that is constant over the
    width of each bin, and often the bins are chosen to have the same width
    <math|\<#2206\><rsub|i> = \<#2206\>>.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_24_histogram.png|.3par|||>|<label|fig2.24>An
      illustration of the histogram approach \ to density estimation, in
      which a data set of 50 data points is generated from the distribution
      shown by the green curve. Histogram density estimates with a common bin
      width \<#2206\> are shown for various values of \<#2206\>.>
    </padded-center>
  </hidden>|<\hidden>
    <tit|property>

    Once the histogram has been computed, the data set itself can be
    discarded, which can be advantageous if the data set is large. Also, the
    histogram approach is easily applied if the data points are arriving
    sequentially.

    Can be useful for obtaining a quick visualization of data in one or two
    dimensions but is unsuited to most density estimation applications.

    \;
  </hidden>|<\hidden>
    <tit|problems>

    One problem is that the estimated density has
    <with|color|blue|discontinuities> that are due to the bin edges rather
    than any property of the underlying distribution that generated the data.

    Another major limitation of the histogram approach is its scaling with
    dimensionality.

    If we divide each variable in a D-dimensional space into M bins, then the
    total number of bins will be <math|M<rsup|D>>.

    This exponential scaling with D is an example of the
    <with|color|blue|curse of dimensionality>.

    In a space of high dimensionality, the quantity of data needed to provide
    meaningful estimates of local probability density would be prohibitive.
  </hidden>|<\hidden>
    <tit|Probability density estimation>

    To estimate the probability density at a particular
    <with|color|blue|location>, we should consider the data points that lie
    within some local neighbourhood of that point.

    The value of the <with|color|blue|smoothing parameter> should be neither
    too large nor too small in order to obtain good results.
  </hidden>|<\hidden>
    <tit|density estimators>

    Suppose that observations are being drawn from some unknown probability
    density <math|p(x)> in some D-dimensional Euclidean space.

    Consider some small region <math|\<cal-R\>> containing <math|\<b-x\>>.

    The probability mass associated with this region is given by \ 

    <\equation*>
      P= \ <big|int><rsub|\<cal-R\>> \ p(\<b-x\>) \<mathd\>\<b-x\>
    </equation*>
  </hidden>|<\shown>
    Collected a data set comprising <math|N> observations drawn from
    <math|p(x)>.

    Each data point has a probability <math|P> of falling within
    <math|\<cal-R\>>.

    The total number <math|K> of points that lie inside <math|\<cal-R\>> will
    be distributed according to the binomial distribution \ 

    <\equation*>
      Bin(K\|N, P ) = <frac|N!|K!<around*|(|N-K|)>!>P<rsup|K><around*|(|1-P|)><rsup|N-K>
    </equation*>

    \;
  </shown>|<\hidden>
    Using Eq.<eqref|2.11>, we see that the mean fraction of points falling
    inside the region is\ 

    <\equation*>
      \<bbb-E\><around*|[|<frac|K|N>|]> = P
    </equation*>

    and similarly using Eq. <eqref|2.12> we see that the variance around this
    mean is\ 

    <\equation*>
      var<around*|[|<frac|K|N>|]>=<frac|P (1 \<minus\> P )|N>.
    </equation*>
  </hidden>|<\hidden>
    For large <math|N> , this distribution will be sharply peaked around the
    mean and so \ 

    <\equation*>
      K\<simeq\>N P.\ 
    </equation*>

    If, however, we also assume that the region <math|\<cal-R\>> is
    sufficiently small that the probability density <math|p(x)> is roughly
    constant over the region, then we have\ 

    <\equation*>
      \ P\<simeq\>p(\<b-x\>)V
    </equation*>

    where <math|V> is the volume of <math|\<cal-R\>>. The density estimate in
    the form \ 

    <\equation>
      p(x) = <frac|K|N V>.<label|2.246>
    </equation>
  </hidden>|<\hidden>
    <tit|Exploit>

    \;

    Exploit the result <eqref|2.246> in two different ways.

    <\itemize-dot>
      <item>Fix <math|K> and determine the value of <math|V> from the data,
      which gives rise to the <em|K-nearest-neighbour> technique.

      <item>Fix <math|V> and determine <math|K> from the data, giving rise to
      the <em|kernel> approach.
    </itemize-dot>

    It can be shown that both the K-nearest-neighbour density estimator and
    the kernel density estimator converge to the true probability density in
    the limit <math|N \<rightarrow\> \<infty\>> provided <math|V> shrinks
    suitably with <math|N> , and <math|K> grows with <math|N> (Duda and Hart,
    1973).
  </hidden>|<\hidden>
    <tit|Parzen window>

    The region <math|\<cal-R\>> is a small hypercube centred on the point
    <math|\<b-x\>>.

    In order to count the number <math|K> of points falling within this
    region, it is convenient to define the following function \ 

    <\equation*>
      k(\<b-u\>) =<choice|<tformat|<table|<row|<cell|1,>|<cell|<around*|\||u<rsub|i>|\|>\<leqslant\>1/2,>|<cell|i=1,\<cdots\>,D,>>|<row|<cell|0,>|<cell|otherwise>|<cell|>>>>>
    </equation*>

    which represents a unit cube centred on the origin.

    The function <math|k(\<b-u\>)> is an example of a <em|kernel function>,
    and in this context is also called a <em|Parzen window>.
  </hidden>|<\hidden>
    The quantity <math|k((\<b-x\>\<minus\> \<b-x\><rsub|n>)/h)> will be one
    if the data point <math|\<b-x\><rsub|n>> lies inside a cube of side
    <math|h> centred on <math|\<b-x\>>, and zero otherwise.

    The total number of data points lying inside this cube will therefore be
    \ 

    <\equation*>
      K=<big|sum><rsub|n=1><rsup|N>k<around*|(|<frac|\<b-x\>-\<b-x\><rsub|n>|h>|)>
    </equation*>

    Substituting this expression into Eq. <eqref|2.246> then gives the
    following result for the estimated density at <math|\<b-x\>> \ 

    <\equation>
      p(x) = <frac|1|N h<rsup|D>><big|sum><rsub|n=1><rsup|N>k<around*|(|<frac|\<b-x\>-\<b-x\><rsub|n>|h>|)><label|2.249>
    </equation>

    where we have used <math|V = h <rsup|D>> for the volume of a hypercube of
    side <math|h> in <math|D> dimensions.

    Using the symmetry of the function <math|k(\<b-u\>)>, we can now
    re-interpret this equation, not as a single cube centred on
    <math|\<b-x\>> but as the sum over <math|N> cubes centred on the <math|N>
    data points <math|\<b-x\><rsub|n>>.
  </hidden>|<\hidden>
    We can obtain a smoother density model if we choose a smoother kernel
    function, and a common choice is the Gaussian, which gives rise to the
    following kernel density model \ 

    <\equation>
      p(x) = <frac|1|N><big|sum><rsub|n=1><rsup|N><frac|1|<around*|(|2\<pi\>h<rsup|2>|)><rsup|D/2>>exp<around*|{|-<frac|<around*|\<\|\|\>|\<b-x\>-\<b-x\><rsub|n>|\<\|\|\>><rsup|2>|2h<rsup|2>>|}><label|2.250>
    </equation>

    where <math|h> represents the standard deviation of the Gaussian
    components.

    Thus our density model is obtained by placing a Gaussian over each data
    point and then adding up the contributions over the whole data set, and
    then dividing by <math|N> so that the density is correctly normalized.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_25_kernel_density.png|.3par|||>|<label|fig2.25>Illustration
      of the kernel density model <eqref|2.250> applied to the same data set
      used to demonstrate the histogram approach in Figure
      <reference|fig2.24>. We see that <math|h> acts as a smoothing parameter
      and that if it is set too small (top panel), the result is a very noisy
      density model, whereas if it is set too large (bottom panel), then the
      bimodal nature of the underlying distribution from which the data is
      generated (shown by the green curve) is washed out. The best density
      model is obtained for some intermediate value of <math|h> (middle
      panel).>
    </padded-center>
  </hidden>|<\hidden>
    <unroll-greyed|<\shown>
      We can choose any other kernel function <math|k(\<b-u\>)> in Eq.
      <eqref|2.249> subject to the conditions \ 

      <\eqnarray*>
        <tformat|<table|<row|<cell|k<around*|(|\<b-u\>|)>>|<cell|\<geqslant\>>|<cell|0>>|<row|<cell|<big|int>k<around*|(|\<b-u\>|)>\<mathd\>\<b-u\>>|<cell|=>|<cell|1>>>>
      </eqnarray*>

      which ensure that the resulting probability distribution is nonnegative
      everywhere and integrates to one.
    </shown>|<\shown>
      The class of density model given by Eq. <eqref|2.249> is called a
      kernel density estimator, or Parzen estimator.
    </shown>|<\shown>
      It has a great merit that there is no computation involved in the
      `training' phase because this simply requires storage of the training
      set.
    </shown>|<\shown>
      However, this is also one of its great weaknesses because the
      computational cost of evaluating the density grows linearly with the
      size of the data set.
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Nearest-neighbour methods>

    One of the difficulties with the kernel approach to density estimation is
    that the parameter <math|h> governing the kernel width is fixed for all
    kernels.

    In regions of high data density, a large value of <math|h> may lead to
    over-smoothing and a washing out of structure that might otherwise be
    extracted from the data.

    However, reducing <math|h> may lead to noisy estimates elsewhere in data
    space where the density is smaller.

    Thus the optimal choice for <math|h> may be dependent on location within
    the data space.

    This issue is addressed by <em|nearest-neighbour> methods for density
    estimation.
  </hidden>|<\hidden>
    Instead of fixing <math|V> and determining the value of <math|K> from the
    data, we consider a fixed value of <math|K> and use the data to find an
    appropriate value for <math|V> .

    To do this, we consider a small sphere centred on the point <math|x> at
    which we wish to estimate the density <math|p(x)>, and we allow the
    radius of the sphere to grow until it contains precisely <math|K> data
    points.

    The estimate of the density <math|p(x)> is then given by Eq.
    <eqref|2.246> with <math|V> set to the volume of the resulting sphere.

    This technique is known as <em|K nearest neighbours>.
  </hidden>|<\hidden>
    <\padded-center>
      <\small-figure|<image|image/fig_2_26_k_nearest_neighbour_density.png|.3par|||>>
        Illustration of K-nearest-neighbour density estimation using the same
        data set as in Figures <reference|fig2.25> and <reference|fig2.24>.
        We see that the parameter K governs the degree of smoothing, so that
        a small value of <math|K> leads to a very noisy density model (top
        panel), whereas a large value (bottom panel) smoothes out the bimodal
        nature of the true distribution (shown by the green curve) from which
        the data set was generated.
      </small-figure>
    </padded-center>
  </hidden>|<\hidden>
    <tit|K-nearest-neighbour classification>

    Apply the K-nearest-neighbour density estimation technique to each class
    separately and then make use of Bayes' theorem.

    Suppose that we have a data set comprising <math|N<rsub|k>> points in
    class <math|C<rsub|k>> with <math|N> points in total, so that
    <math|<big|sum><rsub|k>N<rsub|k> = N >.

    If we \ wish to classify a new point <math|x>, we draw a sphere centred
    on <math|x> containing precisely <math|K> points irrespective of their
    class.

    Suppose this sphere has volume <math|V> and contains <math|K<rsub|k>>
    points from class <math|C<rsub|k>>.

    Then Eq. <eqref|2.246> provides an estimate of the density associated
    with each class\ 

    <\equation*>
      p(x\|C<rsub|k>) =<frac|K<rsub|k>|N<rsub|k>V>
    </equation*>

    \;
  </hidden>|<\hidden>
    \ \ Similarly, the unconditional density is given by \ 

    <\equation*>
      p(x) = <frac|K|N V>
    </equation*>

    \ \ while the class priors are given by \ 

    <\equation*>
      p(C<rsub|k>) = <frac|N<rsub|k>|N>
    </equation*>

    Using Bayes' theorem to obtain the posterior probability of class
    membership \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|C<rsub|k>\|x|)>>|<cell|=>|<cell|<frac|p<around*|(|x\|C<rsub|k>|)>p<around*|(|C<rsub|k>|)><rsub|>|p<around*|(|x|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|K<rsub|k>|K>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    If we wish to minimize the probability of misclassification, this is done
    by assigning the test point <math|x> to the class having the largest
    posterior probability, corresponding to the largest value of
    <math|K<rsub|k>/K>.

    Thus to classify a new point, we identify the K nearest points from the
    training data set and then assign the new point to the class having the
    largest number of representatives amongst this set.

    Ties can be broken at random.

    The particular case of <math|K = 1> is called the nearest-neighbour rule,
    because a test point is simply assigned to the same class as the nearest
    point from the training set.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_27_k_nearest_neighbour_classification.png|.5par|||>|(a)
      In the K-nearestneighbour classifier, a new point, shown by the black
      diamond, is classified according to the majority class membership of
      the K closest training data points, in this case <math|K = 3>. (b) In
      the nearest-neighbour (<math|K = 1>) approach to classification, the
      resulting decision boundary is composed of hyperplanes that form
      perpendicular bisectors of pairs of points from different classes.>
    </padded-center>
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_2_28_k_nearest_neighbour_classification_oil_data.png|.9par|||>|Plot
      of 200 data points from the oil data set showing values of
      <math|x<rsub|6>> plotted against <math|x<rsub|7>>, where the red,
      green, and blue points correspond to the `laminar', `annular', and
      `homogeneous' classes, respectively. Also shown are the classifications
      of the input space given by the K-nearest-neighbour algorithm for
      various values of K.>
    </padded-center>
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
    <associate|2.105|<tuple|40|?>>
    <associate|2.108|<tuple|41|?>>
    <associate|2.11|<tuple|7|?>>
    <associate|2.12|<tuple|8|?>>
    <associate|2.121|<tuple|41|?>>
    <associate|2.126|<tuple|43|?>>
    <associate|2.129|<tuple|44|?>>
    <associate|2.13|<tuple|9|15>>
    <associate|2.130|<tuple|45|?>>
    <associate|2.131|<tuple|46|?>>
    <associate|2.132|<tuple|47|?>>
    <associate|2.135|<tuple|48|?>>
    <associate|2.136|<tuple|48|1>>
    <associate|2.140|<tuple|50|?>>
    <associate|2.146|<tuple|51|?>>
    <associate|2.15|<tuple|10|16>>
    <associate|2.154|<tuple|52|?>>
    <associate|2.158|<tuple|53|?>>
    <associate|2.159|<tuple|54|?>>
    <associate|2.167|<tuple|55|?>>
    <associate|2.169|<tuple|56|?>>
    <associate|2.173|<tuple|57|?>>
    <associate|2.18|<tuple|11|19>>
    <associate|2.181|<tuple|58|?>>
    <associate|2.188|<tuple|59|1>>
    <associate|2.189|<tuple|60|?>>
    <associate|2.194|<tuple|61|?>>
    <associate|2.195|<tuple|62|?>>
    <associate|2.199|<tuple|63|1>>
    <associate|2.20|<tuple|12|23>>
    <associate|2.226|<tuple|64|?>>
    <associate|2.227|<tuple|65|?>>
    <associate|2.228|<tuple|66|?>>
    <associate|2.246|<tuple|67|?>>
    <associate|2.249|<tuple|68|?>>
    <associate|2.250|<tuple|69|?>>
    <associate|2.29|<tuple|13|30>>
    <associate|2.3|<tuple|1|7>>
    <associate|2.34|<tuple|14|33>>
    <associate|2.38|<tuple|15|37>>
    <associate|2.4|<tuple|2|7>>
    <associate|2.43|<tuple|16|?>>
    <associate|2.44|<tuple|17|44>>
    <associate|2.45|<tuple|18|?>>
    <associate|2.46|<tuple|19|46>>
    <associate|2.48|<tuple|20|?>>
    <associate|2.49|<tuple|21|47>>
    <associate|2.5|<tuple|3|7>>
    <associate|2.50|<tuple|22|?>>
    <associate|2.55|<tuple|23|?>>
    <associate|2.62|<tuple|24|?>>
    <associate|2.65|<tuple|25|?>>
    <associate|2.67|<tuple|26|?>>
    <associate|2.7|<tuple|4|9>>
    <associate|2.70|<tuple|27|?>>
    <associate|2.71|<tuple|28|?>>
    <associate|2.73|<tuple|29|?>>
    <associate|2.75|<tuple|30|?>>
    <associate|2.76|<tuple|31|?>>
    <associate|2.78|<tuple|32|?>>
    <associate|2.8|<tuple|5|10>>
    <associate|2.81|<tuple|33|?>>
    <associate|2.82|<tuple|34|?>>
    <associate|2.84|<tuple|35|1>>
    <associate|2.85|<tuple|36|1>>
    <associate|2.88|<tuple|37|?>>
    <associate|2.9|<tuple|6|11>>
    <associate|2.92|<tuple|38|?>>
    <associate|2.93|<tuple|39|?>>
    <associate|auto-1|<tuple|1|5>>
    <associate|auto-10|<tuple|7|1>>
    <associate|auto-11|<tuple|8|?>>
    <associate|auto-12|<tuple|9|?>>
    <associate|auto-13|<tuple|10|?>>
    <associate|auto-14|<tuple|11|?>>
    <associate|auto-15|<tuple|12|1>>
    <associate|auto-16|<tuple|13|?>>
    <associate|auto-17|<tuple|14|?>>
    <associate|auto-18|<tuple|15|?>>
    <associate|auto-19|<tuple|16|?>>
    <associate|auto-2|<tuple|1|12>>
    <associate|auto-20|<tuple|17|?>>
    <associate|auto-21|<tuple|18|?>>
    <associate|auto-22|<tuple|19|?>>
    <associate|auto-23|<tuple|20|?>>
    <associate|auto-24|<tuple|21|?>>
    <associate|auto-25|<tuple|22|1>>
    <associate|auto-26|<tuple|23|?>>
    <associate|auto-27|<tuple|4|?>>
    <associate|auto-28|<tuple|5|?>>
    <associate|auto-29|<tuple|24|1>>
    <associate|auto-3|<tuple|2|17>>
    <associate|auto-30|<tuple|25|?>>
    <associate|auto-31|<tuple|26|?>>
    <associate|auto-32|<tuple|27|?>>
    <associate|auto-33|<tuple|28|?>>
    <associate|auto-4|<tuple|3|21>>
    <associate|auto-5|<tuple|2|26>>
    <associate|auto-6|<tuple|4|36>>
    <associate|auto-7|<tuple|5|38>>
    <associate|auto-8|<tuple|3|41>>
    <associate|auto-9|<tuple|6|44>>
    <associate|fig2.1|<tuple|1|12>>
    <associate|fig2.10|<tuple|10|?>>
    <associate|fig2.11|<tuple|11|?>>
    <associate|fig2.13|<tuple|13|?>>
    <associate|fig2.14|<tuple|14|?>>
    <associate|fig2.15|<tuple|15|?>>
    <associate|fig2.16|<tuple|16|?>>
    <associate|fig2.17|<tuple|17|?>>
    <associate|fig2.18|<tuple|18|?>>
    <associate|fig2.19|<tuple|19|?>>
    <associate|fig2.2|<tuple|2|17>>
    <associate|fig2.20|<tuple|20|?>>
    <associate|fig2.24|<tuple|24|?>>
    <associate|fig2.25|<tuple|25|?>>
    <associate|fig2.4|<tuple|4|36>>
    <associate|fig2.7|<tuple|7|1>>
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

      <tuple|normal|<surround|<hidden-binding|<tuple>|4>||The Dirichlet
      distribution over three variables <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<mu\><rsub|1>,
      \<mu\><rsub|2>, \<mu\><rsub|3>>> \ is confined to a simplex (a bounded
      linear manifold) of the form shown, as a consequence of the constraints
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|0\<leqslant\>\<mu\><rsub|k>\<leqslant\>1>>
      and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<big|sum><rsub|k>\<mu\><rsub|k>=1>>.>|<pageref|auto-6>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|5>||Plots of the
      Dirichlet distribution over three variables, where the two horizontal
      axes are coordinates in the plane of the simplex and the vertical axis
      corresponds to the value of the density.
      Here<with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|
      {\<alpha\><rsub|k>} = 0.1>> on the left plot,
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|{\<alpha\><rsub|k>}
      = 1>> in the centre plot, and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|{\<alpha\><rsub|k>}
      = 10>> in the right plot.>|<pageref|auto-7>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|6>||Histogram plots of
      the mean of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N>>
      uniformly distributed numbers for various values of
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N>>
      . We observe that as <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N>>
      increases, the distribution tends towards a
      Gaussian.>|<pageref|auto-9>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|7>||The red curve shows
      the elliptical surface of constant probability density for a Gaussian
      in a two-dimensional space <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|x
      = (x<rsub|1>, x<rsub|2>)>> on which the density is
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|exp(\<minus\>1/2)>>
      of its value at <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|x
      = \<mu\>>>. The axes of the ellipse are defined by the eigenvectors
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<b-u\><rsub|i>>>
      of the covariance matrix, with corresponding eigenvalues
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<lambda\><rsub|i>>>.>|<pageref|auto-10>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|8>||Contours of
      constant probability density for a Gaussian distribution in two
      dimensions in which the covariance matrix is (a) of general form, (b)
      diagonal, in which the elliptical contours are aligned with the
      coordinate axes, and (c) proportional to the identity matrix, in which
      the contours are concentric circles.>|<pageref|auto-11>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|9>||The plot on the
      left shows the contours of a Gaussian distribution
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|p(x<rsub|a>,
      x<rsub|b>)>> over two variables, and the plot on the right shows the
      marginal distribution <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|p(x<rsub|a>)>>
      (blue curve) and the conditional distribution
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|p(x<rsub|a>\|x<rsub|b>)>>
      for <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|x<rsub|b>
      = 0.7>> (red curve).>|<pageref|auto-12>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|10>||A schematic
      illustration of two correlated random variables
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|z>>
      and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<theta\>>>,
      together with the regression function
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|f(\<theta\>)>>
      given by the conditional expectation
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<bbb-E\>[z\|\<theta\>]>>.
      The RobbinsMonro algorithm provides a general sequential procedure for
      finding the root <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<theta\>>>
      of such functions.>|<pageref|auto-13>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|11>||In the case of a
      Gaussian distribution, with <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<theta\>>>
      \ corresponding to the mean <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<mu\><rsub|ML>>>,
      the regression function illustrated in Figure <reference|fig2.10> takes
      the form of a straight line, as shown in red. In this case, the random
      variable <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|z>>
      corresponds to the derivative of the log likelihood function and is
      given by <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|(x
      \<minus\> \<mu\><rsub|ML>)/\<sigma\><rsup|2>>>, and its expectation
      that defines the regression function is a straight line given by
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|(\<mu\>
      \<minus\> \<mu\>ML)/\<sigma\><rsup|2>>>. The root of the regression
      function corresponds to the true mean
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<mu\>>>.>|<pageref|auto-14>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|12>||Illustration of
      Bayesian inference for \ the mean <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<mu\>>>
      of a Gaussian distribution, in which the variance is assumed to be
      known. The curves show the prior distribution over
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<mu\>>>
      (the curve labelled <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N
      = 0>>), which in this case is itself Gaussian, along with the posterior
      distribution given by Eq. (<reference|2.140>) for increasing numbers
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N>>
      of data points. The data points are generated from a Gaussian of mean
      0.8 and variance 0.1, and the prior is chosen to have mean 0. In both
      the prior and the likelihood function, the variance is set to the true
      value.>|<pageref|auto-15>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|13>||Plot of the gamma
      distribution <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|Gam(\<lambda\>\|a,b)>>
      defined by Eq. (<reference|2.146>) for various values of the parameters
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|a>>
      and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|b>>.>|<pageref|auto-16>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|14>||Contour plot of
      the normal-gamma distribution Eq. (<reference|2.154>) for parameter
      values <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<mu\><rsub|0>
      = 0, \<beta\> = 2, a = 5>> and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|b
      = 6>>.>|<pageref|auto-17>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|15>||Plot of Student's
      t-distribution (<reference|2.159>) \ for
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<mu\>
      = 0>> and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<lambda\>
      = 1>> for various values of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<nu\>>>.
      The limit <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<nu\>
      \<rightarrow\> \<infty\>>> corresponds to a Gaussian distribution with
      mean <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<mu\>>>
      and precision <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<lambda\>>>.>|<pageref|auto-18>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|16>||Illustration of
      the robustness of Student's t-distribution compared to a Gaussian. (a)
      Histogram distribution of 30 data points drawn from a Gaussian
      distribution, together with the maximum likelihood fit obtained from a
      t-distribution (red curve) and a Gaussian (green curve, largely hidden
      by the red curve). Because the t-distribution contains the Gaussian as
      a special case it gives almost the same solution as the Gaussian. (b)
      The same data set but with three additional outlying data points
      showing how the Gaussian (green curve) is strongly distorted by the
      outliers, whereas the t-distribution (red curve) is relatively
      unaffected.>|<pageref|auto-19>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|17>||Illustration of
      the representation of values <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<theta\><rsub|n>>>
      of a periodic variable as two dimensional vectors
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|x<rsub|n>>>
      living on the unit circle. Also shown is the average
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<wide|x|\<bar\>>>>
      of those vectors.>|<pageref|auto-20>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|18>||The von Mises
      distribution can be derived by considering \ a two-dimensional Gaussian
      of the form (<reference|2.173>), whose density contours are shown in
      blue and conditioning on the unit circle shown in
      red.>|<pageref|auto-21>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|19>||The von Mises
      distribution plotted for two different parameter values, shown as a
      Cartesian plot on the left and as the corresponding polar plot on the
      right.>|<pageref|auto-22>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|20>||Plot of the Bessel
      function <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|I<rsub|0>(m)>>
      defined by (2.180), together with the function
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|A(m)>>
      defined by (2.186).>|<pageref|auto-23>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|21>||Plots of the `old
      faithful' data in which the blue curves show contours of constant
      probability density. On the left is a single Gaussian distribution
      which has been fitted to the data using maximum likelihood. Note that
      this distribution fails to capture the two clumps in the data and
      indeed places much of its probability mass in the central region
      between the clumps where the data are relatively sparse. On the right
      the distribution is given by a linear combination of two Gaussians
      which has been fitted to the data by maximum likelihood which gives a
      better representation of the data.>|<pageref|auto-24>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|22>||Example of a
      Gaussian mixture distribution \ in one dimension showing three
      Gaussians (each scaled by a coefficient) in blue and their sum in
      red.>|<pageref|auto-25>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|23>||Illustration of a
      mixture of 3 Gaussians in a two-dimensional space. (a) Contours of
      constant density for each of the mixture components, in which the 3
      components are denoted red, blue and green, and the values of the
      mixing coefficients are shown below each component. (b) Contours of the
      marginal probability density <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|p(x)>>
      of the mixture distribution. (c) A surface plot of the distribution
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|p(x)>>.>|<pageref|auto-26>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|24>||An illustration of
      the histogram approach \ to density estimation, in which a data set of
      50 data points is generated from the distribution shown by the green
      curve. Histogram density estimates with a common bin width \<#2206\>
      are shown for various values of \<#2206\>.>|<pageref|auto-29>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|25>||Illustration of
      the kernel density model (<reference|2.250>) applied to the same data
      set used to demonstrate the histogram approach in Figure
      <reference|fig2.24>. We see that <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|h>>
      acts as a smoothing parameter and that if it is set too small (top
      panel), the result is a very noisy density model, whereas if it is set
      too large (bottom panel), then the bimodal nature of the underlying
      distribution from which the data is generated (shown by the green
      curve) is washed out. The best density model is obtained for some
      intermediate value of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|h>>
      (middle panel).>|<pageref|auto-30>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|26>|>
        Illustration of K-nearest-neighbour density estimation using the same
        data set as in Figures <reference|fig2.25> and <reference|fig2.24>.
        We see that the parameter K governs the degree of smoothing, so that
        a small value of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|K>>
        leads to a very noisy density model (top panel), whereas a large
        value (bottom panel) smoothes out the bimodal nature of the true
        distribution (shown by the green curve) from which the data set was
        generated.
      </surround>|<pageref|auto-31>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|27>||(a) In the
      K-nearestneighbour classifier, a new point, shown by the black diamond,
      is classified according to the majority class membership of the K
      closest training data points, in this case
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|K
      = 3>>. (b) In the nearest-neighbour
      (<with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|K
      = 1>>) approach to classification, the resulting decision boundary is
      composed of hyperplanes that form perpendicular bisectors of pairs of
      points from different classes.>|<pageref|auto-32>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Binary
      Variables> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Multinomial
      Variables> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Gaussian Distribution> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      Exponential Family> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Nonparametric
      Methods> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>