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
  </hidden>|<\shown>
    <small-figure|<image|image/fig_2_7_transform.png|.5par|||>|<label|fig2.7>The
    red curve shows the elliptical surface of constant probability density
    for a Gaussian in a two-dimensional space <math|x = (x<rsub|1>,
    x<rsub|2>)> on which the density is <math|exp(\<minus\>1/2)> of its value
    at <math|x = \<mu\>>. The axes of the ellipse are defined by the
    eigenvectors <math|\<b-u\><rsub|i>> of the covariance matrix, with
    corresponding eigenvalues <math|\<lambda\><rsub|i>>.>
  </shown>|<\hidden>
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
    <tit|<math|\<b-mu\>\<b-z\><rsup|T>,\<b-mu\><rsup|T>\<b-z\>,\<b-z\>\<b-z\><rsup|T>>>

    Note that the cross-terms involving <math|\<b-mu\>\<b-z\><rsup|T>> and
    <math|\<b-mu\><rsup|T>\<b-z\>> will again vanish by symmetry.

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
    <associate|2.13|<tuple|7|15>>
    <associate|2.15|<tuple|8|16>>
    <associate|2.18|<tuple|9|19>>
    <associate|2.20|<tuple|10|23>>
    <associate|2.29|<tuple|11|30>>
    <associate|2.3|<tuple|1|7>>
    <associate|2.34|<tuple|12|33>>
    <associate|2.38|<tuple|13|37>>
    <associate|2.4|<tuple|2|7>>
    <associate|2.43|<tuple|14|?>>
    <associate|2.44|<tuple|15|44>>
    <associate|2.45|<tuple|16|?>>
    <associate|2.46|<tuple|17|46>>
    <associate|2.48|<tuple|18|?>>
    <associate|2.49|<tuple|19|47>>
    <associate|2.5|<tuple|3|7>>
    <associate|2.50|<tuple|20|?>>
    <associate|2.55|<tuple|21|?>>
    <associate|2.62|<tuple|22|?>>
    <associate|2.7|<tuple|4|9>>
    <associate|2.8|<tuple|5|10>>
    <associate|2.9|<tuple|6|11>>
    <associate|auto-1|<tuple|1|5>>
    <associate|auto-10|<tuple|7|?>>
    <associate|auto-2|<tuple|1|12>>
    <associate|auto-3|<tuple|2|17>>
    <associate|auto-4|<tuple|3|21>>
    <associate|auto-5|<tuple|2|26>>
    <associate|auto-6|<tuple|4|36>>
    <associate|auto-7|<tuple|5|38>>
    <associate|auto-8|<tuple|3|41>>
    <associate|auto-9|<tuple|6|44>>
    <associate|fig2.1|<tuple|1|12>>
    <associate|fig2.2|<tuple|2|17>>
    <associate|fig2.4|<tuple|4|36>>
    <associate|fig2.7|<tuple|7|?>>
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
    </associate>
  </collection>
</auxiliary>