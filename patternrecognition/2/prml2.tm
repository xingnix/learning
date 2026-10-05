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
      <small-figure|<image|image/fig_2_16_periodic_var.png|.3par|||>|<label|fig2.17>Illustration
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
    The Cartesian coordinates of the observations are given by
    \ <math|\<b-x\><rsub|n> = (cos \<theta\><rsub|n>, sin \<theta\><rsub|n>)>
    , and we can write the Cartesian coordinates of the sample mean in the
    form <math|<wide|\<b-x\>|\<wide-bar\>> = (<wide|r|\<wide-bar\>> cos
    \<theta\>,<wide|r|\<wide-bar\>> sin \<theta\>)>.\ 

    Substituting into Eq. <eqref|2.167> and equating the <math|x<rsub|1>> and
    <math|x<rsub|2>> components then gives \ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|r|\<wide-bar\>>cos<wide|\<theta\>|\<wide-bar\>>>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N>cos\<theta\><rsub|n>>>|<row|<cell|<wide|r|\<wide-bar\>>sin<wide|\<theta\>|\<wide-bar\>>>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N>sin\<theta\><rsub|n>>>>>
    </eqnarray*>

    Taking the ratio, and using the identity <math|tan \<theta\> = sin
    \<theta\>/ cos \<theta\>>, we can solve for <math|\<theta\>> to give \ 

    <\equation*>
      <wide|\<theta\>|\<wide-bar\>> = tan<rsup|\<minus\>1><around*|{|<frac|<big|sum><rsub|n>sin
      \<theta\><rsub|n>|<big|sum><rsub|n>cos \<theta\><rsub|n>>|}>
    </equation*>
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
      <small-figure|<image|<tuple|<#89504E470D0A1A0A0000000D49484452000000DE000000D808020000000B5CCAFD000000097048597300000EC400000EC401952B0E1B00001D4B49444154789CED9D7D7054D5F9C7BFD18892044CAD8B1BDE1AE6C73811748129059B6069865552D04604D10DAD5319E98886CDD8FCE1102D76D3518719A235ABD519A8567113E4AD80090E4310A91B85522CECF2A20E651701597679299025C4DDE4FEFE389B9BBB9B7D39775FEE3D7BF77C2633793BF7DE67EFFDDEE7BC3DE73979822080C3618F1BD43680C3890E97268751B834398CC2A5C961142E4D0EA370697218854B93C3285C9A1C46E1D2E4300A97268751B834398CC2A5C961142E4D0EA37069721825A7A5B971E3C63FFCE10FC160506D433851C8CBE578CDBCBC3C00369BADA6A6466D5B3891E4AED7ECECEC243FAC5CB9525D4B3851C95D69BEF5D65BE40787C3E1743AD5358633981CADD0FD7E7F515191F8ABC9646A696951D11ECE6072D46B363535497F6D6D6DF5FBFD6A19C3894A767BCDCB972F6FD8B0A1AFAFEFBFFFFDEFF2E5CBD7AC59535050100804EAEAEAE21C150C06C78C19E3F178A47FB45AADB5B5B519B6972307216BE9EDED6D6C6C0C068382202C58B060D6AC59DDDDDD4F3DF5D4D4A9534981BEBEBE03070E7CFAE9A7972E5D921E68B7DB07DF07BD5EAFC267E0C4268B2BF49D3B77CE9B37EFC61B6F0470E1C285F2F2F25B6EB9E5C5175FDCB2650B80EBD7AFD7D7D75FBE7CB9B7B7F781071ED8B871A378E0A851A3F47A7DC4D92A2B2B95349E9318B5DF8D34100C06870D1BF6E9A79F4AFFF8F7BFFFBDAEAE8EFCBC76EDDA1FFFF8C77D7D7D11076AE60E68927C755F8CB470E0C0819E9E9E7BEFBD57FAC7E9D3A7777777939F478E1C79E5CA9540203064C810350CE4248316A4B96BD7AE69D3A60D1D3A14C0F7DF7FEFF3F9264D9A545656565656460AB4B6B62E59B284EB32BBC8E2B6E6430F3DF4C20B2FF4F5F5D96C365185369BEDCE3BEF9416DBB061436F6F6F7373B31A367292278BA5E9F7FBC78E1DFBDA6BAFAD5EBDFAECD9B3DBB76FB75AAD555555C47D12B66EDD7AEAD4A977DF7DF7DCB973BDBDBD2A5ACB914B768F6BBA5CAE9292925B6EB905C0C99327C78E1D4B223608DBB66DBB7AF5EA830F3ED8DBDBDBD4D4F4F2CB2F471C4E0A67F51DD030D92DCD38ECDAB5ABAAAA4A0C782B2F2F17E33944B8345946B3D2A4814B9365B2B8ADC9D1365C9A1C46E1D2E4300A97268751B834398CC2A5C961142E4D0EA370697218854B93C3285C9A1C46E1D2E4300A97268751B834398CC2A5C961142E4D0EA370697218854B93C3285A58ECAB2E3E1F0667F21A3D1AF9FCD6A606BF7F32080671EC189C4EECDB079F0FADAD09CA1B0C983811E5E59832059327A3B050112BB5025F1B94786D90CF878F3EC2D6ADE8E8885EC0640AFBF5C811381C518A190C983F1FB36661FA74EE5313C3A519539A7E3FB66EC5CA95613A23F29A3A15132640A74BE008DD6E9C39839327D1D616E9622D16CC9B877BEE49F9336818B5922DB140AC3BE0720966B3000C7C592C82DD2E7475A57439974BB05A058361E0B40683D0DE2E0402299D56AB706986DD01974B309906A463360B767BFAA5E3F50A56ABA0D787AEA2D70B369BA2023D7EFC787777374D49A7D399696362C1A519BA035D5D619ED26249D547D260B70F3851BD5EB0DB337E4541109C4E6743430365E1B56BD76EDDBA35A3F6C4824B138220D86C033E4C19514A910AD46412BCDE0C5EEBEAD5AB0F3FFC30A5CB242C5DBAF49B6FBEC99C49B1E0D2D4198D0AC9220E818060B30DF8ECF6F64C5DA8A1A1E1E38F3F967588DBED9E33674E86EC89438E4BB30238AB64651A9FAEAE8196AED99CFED6E7F5EBD70D06436F6FAFDC031F7DF4D17FFFFBDF69B62611B93B51D9D808C00EE88D461C3F8E8A0AB50D020A0BD1D282F67600686EC69831F0F9D279FE9D3B77565656DE7083EC87FEC0030FBCFFFEFBE9348506855F05160804A43D9E5AB5CD8982D71B6A7DEAF582CB25E3C0BD7BF7AE59B3A6BEBEBEA7A767CD9A35AB57AF7EF6D967BDFDCD94C58B17B7B4B48885BFFCF2CB2953A68C1A35AAA4A464F6ECD982209C3C79F28E3BEE183972E4840913A4F5FEB163C7264E9C98968F464FCE49331010C4C62550C1ECCB29B593BEB1F1E73FFF591084F1E3C72F5EBCB8ABAB4B108437DE7863E1C285E4BF53A64CF9CF7FFE33F810008F3FFE785F5F5F7777777979B9CD668B28F3C30F3FE4E7E70FDEA721A330FA603284F8BC893762BCDE907A771A757A3C9EB56BD75EBB766DC89021FFFAD7BFC81F376CD8307CF870F2F3C89123DD6EF7E0037FFBDBDF0258BE7CF9BC79F3DE78E38DA8271F366CD8F9F3E793FC2449C1EE83493B525D922A2E8DD274B9425F691F78B258E4F9CE5DBB764977A2696C6C1477EB1A3A74685479F5F4F4DC77DF7D001E79E49158A71D356AD4B7DF7E2BDBFA14C8A16E507D3D3A3AA0D7C3E1804E97D2A99C4E3436A2A6069326212F0F797918372EF4555414FA4B4D0DEAEAB07D7B94903959AC58018B0500162CA0EA157DF6D9673367CE141387EFDFBF7FEAD4A9E4E7E2E2E26BD7AE0D3E64C890213367CE1C3264485B5B5BD4ADE800F8FDFEE2E2E2A43E41B228F91EA888E87BA4BD0A5977201010EC76C16C1E189C977E190C82C9246DC5867D198D82D59AD2A0A9E8EF137AE5FBEEBB4FAC94AF5CB9525050D0D1D1417E9D3469D2A14387061FF2DE7BEFCD9933E7D0A143B7DE7AEBEDB7DF7EE2C4898802BDBDBD37DD745312A34EA99013D2B4DBA3D78994D224E3E152451A0C82C522381C31BBCF5D5D82CB25B4B787CDC893517D593D6EA90D449D4663BC62A4A1F9C1071F905F972E5DBA78F162F1BF8F3DF698B4874ED8B265CBB469D3489F69C78E1DF9F9F913274EBC7CF9B2B4CCB163C7264F9E9C8CDD29A07D697ABD215559AD91FFA291A6549446A360B3C9767EA2BB950A348926695757CC0F22D2D1D1F1A31FFDE82F7FF94B5B5BDB1FFFF847B2AF92F8DF77DE79A7BEBE5EFC75DBB66DE3C78F2F2828282E2E3E7DFAB42008EBD6AD1B3E7C784141416969E9EF7FFF7BB1E4071F7C60B158645B9C1ADA97661C67135F9A0EC7C0D4B6C19086E9A2AEAE81760599AC973BDFE370848E7538A21778F1C5174957E6CC99333FFCF043C47F2F5EBC3861C28424C6801E7DF4D1A82D818CA271699289E9584DB438D2B45A331510249D8D341A65FB60226E8321BAAC67CC98618DE35405C16C36EFD8B143D615CF9C3953555525EB90B4A065698A35602C6D4595A674343109C74689CB15B24DAF8FE902A31208847C79C4B8786F6FEF575F7D75D34D376DDEBC99EC111F954B972ECD9D3BF7FAF5EBF4575CBA74E9E1C38765989826B42C4DA23093296681C1D2F47A939983490EE97C8FAC5023B15A975605DF7DF7DDAA55AB9A9B9B57AD5A75E0C0813887EFDFBF9F3E5EB3A5A565DDBA75328C4B1F9A95A6CB157A7E716ACC08698A1D26714C3ED3040203ADCFB8F57024A44910E7AD8BCF912347FC7E3F4DC9F82ACF289A95267978F1BB9552694A4767140E256E6F97EDA7BBBAA20CD36A0C6D4A537499F145269526A9FD69C6B43381E83BE9BD353944F1211DE5D0A634291F9B284DB13FAE5694BBD0EFE6F57ADA8E97D74BF5FA652F1A94A658D9257C66449A62AF42DD4077CAF91E29348D96EC4583D2244D379A2E029126198B49F101A725F248EC8751BE24E4A5EA8F2BD21A1A9426911ACDD30500D4C8AA46A5381C82C5123DDAC36814DADB9391299923301868CB93ABCB1A19CD16B4264DB105462335209F2C5B935B954B97E78A934651238FE42E1D0E04426A1B14691E1DD24AD6649DAE356912AF63365315262E93DE4509E163F27ABD60B54619BEE9EA8A8C399235A24EE2A4281DB9F82A6A0FAD7D2622081A2F180808725DA674769126158C344D8DAC39CFA85391B12026696F80536BD2A41F4FE90FE2A40DA811C74AE58EC98B23EA94BE5CB48DB2AB4E466429759C45684A9A443D9415747F0C07D5625FB1EF9C5CC087383E45391B1908C878C7E84724B20B4D4993343429FB04FD3D6B1D4D6171C431E9402431D29EB2374D5A02348D54AD363735B56CEDF87100183F3E7149A7131E0F000790782558676768BDDB962DC96713AEA808AD3EFBCD6FA8CA93621F7E98B8A4B8042F184CCE3446D19434BFFE1A00CACB1397DCB3877CDF4473DA679E0180A6A65493B1373484D6737676262E3C732600B4B65209CE680480D3A753328F3534254D92949A46405F7C41BEFF236149A7130E070C062C5C98926D00F2F3D1D404007FFA53E2C285853204471CE7D1A32918C71E9A922681668DF99123E4FBD58425FFF10F0058B2243D1B03545703404707D5E274F241AE26B6110F3E0800FFFB5F2AA6318776A4292B1341FFCE01893DD2DB6F03FDCF3E75445F78F060E2C2656500E074A6E7D2598776A449325B180CB20E4ADC8EF37800A0B434098BA2F3E4930070F264E29234FD3929FBF625630FB368479A848913139771BBA1836FAACE5D0A9492DFDDEEA8DD0DB71B00F4FA745A48A097111976880FD9E425BDC9385547EB3B2BF9FD3871024E278E1FC7D75F63F76E783CA580179251A371E3C20E217BA43DF8208A8BF3874F004A2B2BD369111940A091112949861DE2336C586A36318916A5E9F7E3E041ECDA854D9BA26F7B0600F8EAB659DF5CDC05C0643211C986FEE170C0E120BDFDD18000ECDEFD385A1E4279795AEAF53367D25F529368479A79D7FC73B0A761F76B28DA15F60F9309E5E5B8ED369497A3B0103A9DDF8FA222E022803C00A6969681C2C1204E9F0EED91B66F5FDFA79FDD70D851E9598745EB420552DE268DB43269065F49499A1E98C6868D42A83D1D950E22520A9119659B2D4E344E7FC1C477A0105D15B0F7BC60098BD024F17049AD2422EB9668A231C8BC2B7D4959CB85D9279BA5190808EDED52C5EC84710EA836D6EB3F4297509A64F63C143817B14D1A9249FD461FC3463F8D4E2FE22C223BA519915690844F7675D1C7B7F787519626942689EB898C67236B2FE40B54D66A1E6224CD89E93D71169185D2B4DB0744199EC18D38509A67D95FFFCF4928CD78C9082252BF51E42694B506927C4A9A560339ADC65608659534BDDE81A8F1686905E943DCFBC37B5B685ADB447E31032223041A3BFC9D32710381F857CAD8537A1167115922CD40202CAD608CAA8BBEC925FA42209FBE70BC669F3437A1C130D88389EBD1285D267D720E31EE586364C307922E15339BE3F81C12AE4B19EFDD7FCA0A9AC2E20692095A0BD274B1E11D6672B958793107434E435347CBF2AF5904F3D2145B9614892845F74643BF178EBE4DCE60881B4B9C09569AFDCD6814BABA066F0A931012B84ED95BD2EA7A5FB6A5293E63EAECE7F43D21B939830281811ADB6A4DE4FCFADFA8804EFFC89D0E2A4D4B209F9B72995BD8F0968660559AD2BCA8720645C843A51C7C065AE4FA1BF165D1EB85F6B843A8DF1DF03AF5B348E927FEEF73FA3E8AAC0485B216B865174C4A535A05CAF406A4B949D9F0024A9378AED2F6A438F1D4DE2EB85C82C321D86C61D96656A05FCBD469121226539622EBF36617EC4953ECF424951B58F422348702208E937E85B888DD1E73032BD1AD86B2CA889E96C23FD3245396423F63947530264D718825859CD5F4753A0040475F7B0E86E490B1D9049329F465B10836DBA00E9BD8C34FA44E5963F2F4E91AB31196A429D6E306432A379B7E32908477885DEF0C6D761122D6966F124401537E7A529E3E1F6776C18C34931862890D651E43224D71BB938C3F63517AD12CA3906E186205A3BDBE398119698ABE2B1DD36D641E3261E7400C8A93E68DC92C62BB33BCCA4FC2000D7780086C48537427698A50A0F428D2784D312D51C6BB14E24BD85F6D27E7B6C9219AEC00111890A6D8294DEB6DA649EF1B114A2CBE20998DC90D4FDAEEF58644463F8729F4570B196F1FAB8ADAD2143D4612E337894E9C30BDEFE02877B1BE359B33F9D4FBEBEF6F5EB211230D06190D19F1A369D8650AEA4B938C2FCBF218D488E97D637578A32EC010BB2349EC6D2ADB38A0142EB909E8C8FBA3D58EB988AAD214DB7719930019268CE59163AD0D92EE089809CF44B2159389A2B377C87B2DC5E68FF6D21047A09E34636D519B56C4188EA80A8BB36CADAB6B60B2272D9BA18BA715DB0CF9085CBF4DCE9602F2833EB31AF5A429F65332DC92173B37835D73C21595EDED616B3D52193FF07AC362E143739862EB816E903D93CD1FE650499AE2149B22EB5948B53EF889D22CF68D5821479A07763BED848DCB2558AD91E120617571FC3687043127BCC6165AC4224FE87F428A525787E666984C90A627C818C120C68C81C703A3119F7C32908E302F2F0F00CD1D0806B17E3D56AE0CCB06623442A70BA530F8C94F306A14D09FB95392C666A0BCD98CE79E1B9401C4E7C3881100E072C5C90ED2D989193300A0BD1D73E624B45713A8F03AA811951075BA25893BE0F50AEDED09628EA45F24FEC8E1885B0527581737D062CE8526A6881A5EB3B1112FBDA498CB14713A43290E2D16AC5801C8F19A83F1FBE1F38532D000686B0BFDBDAC2C947CB03F8D0DDDB98A8A80E88ED3E783C1008F47F91BA6364ABF0BAA6E322FF63A88FB51E70E4425C6024AD1D9A7B2F94696A2F883495479651A519D66B340B291A9654918D1562A4907FF734D97820AD264602B5AF191033B8142152D098374D5FBE7EFC5FEB8C9948BBA14949626334BA6C58A1238CB4A3E96FE28B7406020EF5D4EF57B2250569AE496B3916CCFEB255E931D8B4255CAEC321764AF24D5200A4A53D68A324500F28115E2648FBAB3D28180B0778E450056C0222B1049AB28284DF6C2B2490FDDE11898EC899BB726839019D17BE01080CB0577E466E332020577C0D8B50B009E7F5EB92BD271CF3D38750A562B003437A3A8088D8DF276214A85CE4E4C9A84B973E1F120CF704F50A71F7EED5CFE256D6D66911CCABD05F4395F9422E20E487324922E48E66AD5888CCA03D9EF48735CDB41C27428254D5999B29422EACB49822945811A0C82D59ACE5A3E22F13C11E5400D1E3D0B722EA2945664E517548A38F586CB15961F8668D4629111731471369246413ABD6E340A76FBA0314B5949E2348D5273E864DEDC66434D8D1297A323E11C7A30887DFBB07E3D9A9BC3FEAED7A3B2326CBA5C8A7462FDC891C8AD8B0C062C5982279F8CBD037149093C1E78BD7413F09A452969D6D4A0B5357EDC97F2C80A8A3B760C7BF660EB567474C8BE90C180F9F3316B16264FA6D8139BDC2B872395DD89348052D2CCCB03C09A27483AF2C8E783DF1F0ACD14638EA4903DB44810E7E8D13237AC7EF34D2C5BC65A0DA33C8AECB626EE4CCA922E5341A7834E17AA00D2AF9FDB6E03807DFB725C9A8A8C6B9E3E0D20B411382721F41BAC6A1A45A449F601D58ACBCC38E446B5B6AA6D87CA28224DFA1D433900454729275070A29234A13839494949494949494B4B8B9F7A0A5841697272188FC7E3F178162D5A545454545757E7743A131EC2A5C9306EB7DA166484E6E66683C13069D2A4EDDBB7C72B979639A5F6F6F63897201191393D10229316F46F3BAC755A5A5A62894A09AF795C816B688B896A1BA00CF9F9F9E5713AC769F19A0960752779E5EE805C40BDB37B9610A13AB3D9EC4A141EA9C86C102739E4CD6F66010683E1F9E79FAFAEAE2EA41820D3DA87E7B089D7EBFDF6DB6F2B2A2AE80F51509A393F294C8B18729055ECD8B1E3FCF9F30E87A3BABAFACA952B274E9C70BBDDCB962D1B33660C009D4EA793391DA88834F9A4B02C48C801C9CF9425ECD8B1A3A8A868F6ECD993274FBEFFFEFB57AE5CF9EB5FFF7AECD8B13367CE24D24C0245C63549C322E727856921210713B3A99B7EF8F06152595FB870E1E2C58B0B162C183972E4DEBD7BE748122E5EBC78F12499B2A64311698A9E3C3BAB2AA521CF8FE4EDCC12EAEBEBC90F7BF7EE9D3E7DFAD0A1436FB8E18669D3A69188D8C3870FAF5AB5AAAAAA6AE3C68DF4E754AAAD6934A2A303A74F3315E5CE28FBF6014071B1DA7624C3679F7DF6CB5FFE32E28F77DF7DF7DD77DF2DCB6542B9894AE2384955C589CFD1A300306182DA76C8261008FCF39FFFFCC52F7E417E4D300F9908A5A449AA2792258113876030B4F868F468B54DA165CF9E3D23468CB872E5CAFAF5EB7B7A7ACACACA009C3A75EADCB973A99C562969924EFAA64D0A5D2E7B39760C008CC62C1A6FBF7EFDFA5D77DD65B7DBCF9F3FDFD4D4F4F6DB6F7FFCF1C7DBB66DFBDDEF7E97CA6995FAFCA489E970C0EFE7A1B2F1D8B30700AAABD5B64306B367CFAEA8A8B878F122E98F5FBE7CB9B7B7F7A1871E4AF1B40A06C5994C0070F0A07257CC46B66E05809933D5B6431E45454563C78E253FDF7AEBADB7450B1B8F3A991E0705A5499A9BEBD72B77C5ACC3EF0F3534EFBA4B6D53D2C98913275E7BEDB5CECECEB6B6B6D75F7FDD4737F9A2E00E18E206398100230DA95476C0C808DBB763EEDCDCDBEA223A0A7A4D9D2EB4DE978CDB7106B37C39003CFBACDA763081B2FB0611AF603462E74EE52E1A1BB6BC267BB58ABA28BB3688B4EE3B3A94CBAC9A457CF4110098CD5C970465A5595818EAA73735297A5DF60906F1F2CB00F0D4536A9BC20A8A6F04E87663DC38E8F538754A75F7C05085DED282458B6030E0D021B54D6105C517FB969686B65CE4A3485248E4CE5FFFAAB61D0CA1C6F6A9640365061C272B5E93DC10EE32C3512345424505779C03048378E6190078F555B54D610B35BC26243BCF7775A938A5CE84D7145B99070EA8DEF8660A9512CB545484BAEA0D0DEA18C0087E3F162D02800F3FE4BA8C4025AF09C908B37A09DED5F79A246D3B9F998C867AE9B874BAD00E67D5D539BA66A8B333B4946FF56AB54D61115533C53DFD34F47A381CE85FF49443F8FD58B000006C361EC01A15F52A740219810760B7434E6A87B4A066857EFFFDE8E860279C8041D4CEAF595A0A9B0D00162CC8A11C0A6FBE898E0EE8F5D8B2456D53D8456DAF4920BD01A3119F7CA26447551DAF290E9CE5FCA655F151DB6B1256AF865E8F8E0EFCEA571AEF12B9DD215D5A2C5C97F161439A8585703842EAD47097C8E7C3CF7F0E00663356AC50DB1AD661A34227885D228B459927A76885EEF385A667156FB764296C784D426929EC760078E9253436AA6D4D5AE1BA940F4BD204505111A64E6DB43BB92E9382A50A5D44ECC366F8592A51A1777662C102AECB2460CC6B122A2AE0720DF4D9B377BC73FB76CC98C175991CEA48B3AFAF6FF3E6CD4F3CF144CC12A5A5037D7683019D9D0A5A970E8241D4D561EE5C00B058B07327D7A55C54A8D05F7DF5D59E9E1EBBDDDED3D3F3F9E79FC72BEAF7E3E18743092D2C163434A4F70167AA4277BB515D0D870300DADB21C9CCCB91411AF78691456D6DED8C1933A88A926D8700C16010126D36238BF4DF814020CC5AAF379D27CF31986C6B465053136A7A3A1C18370E75758C2E63773AF1D39F864283CD661C38C0B7804F85C8FA71D3A64D274E9C282929B9F7DE7BF7EFDFEFF3F9468F1EFDC8238FA862DC00A5A538750AEFBC8365CBD0DC8CF5EBD1D484850B5969C0F9FD58B224147C6930E0C30FF92464EA843DDA73E7CE5DBA7469FEFCF993274F7EE595576A6B6B2B2B2B753ADD6069EEDDBBD746228662F3F4D34F4F4CE3360EF9F9A8ADC5638FA1AE0EADAD58B408F5F5EA0BD4EDC6EBAFA3B939F4ABCDC6D00B93E5847583DE7FFFFDAAAAAA2FBFFC72E9D2A56EB7FBE69B6F3E76EC58494949F1A094F7DDDDDDDF7FFF7DFC538F193366C89021B1FEBB6CD9B283070F26E806C5A2B313CF3C13EA67E8F5686A4275751201B9297583DC6E34340CEC386336E395577850703A19DCFC349BCD353535996EE4CAE806C5C26E170C86509F0310CC66C16E97B5E568AC3B100FAF57B05AC3AE6BB1085D5DF24EC2A1204AD5B37BF7EEDADADAF8820E0683172E5C885FE6F6DB6FBFF1C61B937B61A8A8A8C0A143E8ECC45B6FA1B515CDCDA18AD562C1AC59983C399D3ECCEDC6175FE0BDF742235900F47A2C5D8AFA7AEE293344E4B8E6F9F3E7478C1871F4E851B28F412CEC76FBDFFEF6B7F8A77EEEB9E70CB177B34BA9421F8CDF8F3D7BB07C79A89627180C983F1FB36661D4A8A88B36E355E87E3F7C3E7CF105DADA22F789339BB170A1F2CB45728D48696EDAB4A9B6B6F6ECD9B399BEF092254B0E1E3CB87FFFFE349FD7E7C3CE9D51F40440AF476525CACA307E3CF9C3A2458B0084F5E7F6EDC3D1A303AE517AECC28558B810D3A7F35E8E32444AB3A1A1C1E3F1BCFBEEBB99BB645353D3C99327376FDE7CF5EAD59A9A9A828282A60CE53424B5705B1B8E1C09F3A694984CD0E9307B367EF6333E42A93C91D2BC74E9D2CD37DF5C5050A0964119C4E783C703A753FCC34B8B16950126AB15E28E0DC5C59830013A1D6F41AA0E9341714AA17EF60E4E6CB261A292939370697218854B93C3285C9A1C46E1D2E4300A97268751B834398CC2A5C961949C9E0EB65AAD5177EEE6B0404ECF0671588657E81C46E1D2E4300A97268751B834398CC2A5C961142E4D0EA370697218854B93C3285C9A1C46F97F9426DFB91E0A38ED0000000049454E44AE426082>|png>|.3par|||>|<label|fig2.18>The
      von Mises distribution can be derived by considering \ a
      two-dimensional Gaussian of the form <eqref|2.173>, whose density
      contours are shown in blue and conditioning on the unit circle shown in
      red.>
    </padded-center>
  </hidden>|<\shown>
    \;
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
    <associate|2.105|<tuple|38|?>>
    <associate|2.108|<tuple|39|?>>
    <associate|2.121|<tuple|39|?>>
    <associate|2.126|<tuple|41|?>>
    <associate|2.129|<tuple|42|?>>
    <associate|2.13|<tuple|7|15>>
    <associate|2.130|<tuple|43|?>>
    <associate|2.131|<tuple|44|?>>
    <associate|2.132|<tuple|45|?>>
    <associate|2.135|<tuple|46|?>>
    <associate|2.136|<tuple|46|1>>
    <associate|2.140|<tuple|48|?>>
    <associate|2.146|<tuple|49|?>>
    <associate|2.15|<tuple|8|16>>
    <associate|2.154|<tuple|50|?>>
    <associate|2.158|<tuple|51|?>>
    <associate|2.159|<tuple|52|?>>
    <associate|2.167|<tuple|53|?>>
    <associate|2.173|<tuple|54|?>>
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
    <associate|2.65|<tuple|23|?>>
    <associate|2.67|<tuple|24|?>>
    <associate|2.7|<tuple|4|9>>
    <associate|2.70|<tuple|25|?>>
    <associate|2.71|<tuple|26|?>>
    <associate|2.73|<tuple|27|?>>
    <associate|2.75|<tuple|28|?>>
    <associate|2.76|<tuple|29|?>>
    <associate|2.78|<tuple|30|?>>
    <associate|2.8|<tuple|5|10>>
    <associate|2.81|<tuple|31|?>>
    <associate|2.82|<tuple|32|?>>
    <associate|2.84|<tuple|33|1>>
    <associate|2.85|<tuple|34|1>>
    <associate|2.88|<tuple|35|?>>
    <associate|2.9|<tuple|6|11>>
    <associate|2.92|<tuple|36|?>>
    <associate|2.93|<tuple|37|?>>
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
    <associate|auto-3|<tuple|2|17>>
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
    <associate|fig2.2|<tuple|2|17>>
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