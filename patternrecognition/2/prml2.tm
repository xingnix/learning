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
    <tit|>

    We begin by considering the binomial and multinomial distributions for
    discrete random variables and the Gaussian distribution for continuous
    random variables.

    These are specific examples of <em|parametric> distributions, so-called
    because they are governed by a small number of adaptive parameters, such
    as the mean and variance in the case of a Gaussian for example.

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

    We shall see that an important role is played by conjugate priors, that
    lead to posterior distributions having the same functional form as the
    prior, and that therefore lead to a greatly simplified Bayesian analysis.

    For example, the conjugate prior for the parameters of the multinomial
    distribution is called the Dirichlet distribution, while the conjugate
    prior for the mean of a Gaussian is another Gaussian.

    All of these distributions are examples of the <em|exponential family> of
    distributions, which possess a number of important properties, and which
    will be discussed in some detail.\ 

    \;
  </hidden>|<\shown>
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
  </shown>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|Binary Variables>
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
    <associate|auto-1|<tuple|1|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Binary
      Variables> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>