<TeXmacs|2.1>

<style|<tuple|book|granite>>

<\body>
  <chapter|Sequential \ Data>

  \;

  So far in this book, we have focussed primarily on sets of data points that
  were assumed to be independent and identically distributed (i.i.d.). This
  assumption allowed us to express the likelihood function as the product
  over all data points of the probability distribution evaluated at each data
  point. For many applications, however, the i.i.d. assumption will be a poor
  one. Here we consider a particularly important class of such data sets,
  namely those that describe sequential data. These often arise through
  measurement of time series, for example the rainfall measurements on
  successive days at a particular location, or the daily values of a currency
  exchange rate, or the acoustic features at successive time frames used for
  speech recognition. An example involving speech data is shown in Figure
  <reference|fig13.1>. Sequential data can also arise in contexts other than
  time series, for example the sequence of nucleotide base pairs along a
  strand of DNA or the sequence of characters in an English sentence. For
  convenience, we shall sometimes refer to `past' and `future' observations
  in a sequence. However, the models explored in this chapter are equally
  applicable to all forms of sequential data, not just temporal sequences.

  <\padded-center>
    <small-figure|<image|image/fig_13_1_time_series.png|.3par|||>|<label|fig13.1>Example
    of a spectrogram of the spoken words \PBayes' theorem\Q showing a plot of
    the intensity of the spectral coefficients versus time index.>
  </padded-center>

  It is useful to distinguish between stationary and nonstationary sequential
  distributions. In the stationary case, the data evolves in time, but the
  distribution from which it is generated remains the same. For the more
  complex nonstationary situation, the generative distribution itself is
  evolving with time. Here we shall focus on the stationary case.

  For many applications, such as financial forecasting, we wish to be able to
  predict the next value in a time series given observations of the previous
  values. Intuitively, we expect that recent observations are likely to be
  more informative than more historical observations in predicting future
  values. The example in Figure <reference|fig13.1> shows that successive
  observations of the speech spectrum are indeed highly correlated.
  Furthermore, it would be impractical to consider a general dependence of
  future observations on all previous observations because the complexity of
  such a model would grow without limit as the number of observations
  increases. This leads us to consider Markov models in which we assume that
  future predictions are independent of all but the most recent observations.

  Although such models are tractable, they are also severely limited. We can
  obtain a more general framework, while still retaining tractability, by the
  introduction of latent variables, leading to <em|state space models>. As in
  Chapters 9 and 12, we shall see that complex models can thereby be
  constructed from simpler components (in particular, from distributions
  belonging to the exponential family) and can be readily characterized using
  the framework of probabilistic graphical models. Here we focus on the two
  most important examples of state space models, namely the <em|hidden Markov
  model>, in which the latent variables are discrete, and <em|linear
  dynamical systems>, in which the latent variables are Gaussian. Both models
  are described by directed graphs having a tree structure (no loops) for
  which inference can be performed efficiently using the sum-product
  algorithm.

  <section|Markov Models>

  \;

  The easiest way to treat sequential data would be simply to ignore the
  sequential aspects and treat the observations as i.i.d., corresponding to
  the graph in Figure <inactive|<reference|fig13.2>>. Such an approach,
  however, would fail to exploit the sequential patterns in the data, such as
  correlations between observations that are close in the sequence. Suppose,
  for instance, that we observe a binary variable denoting whether on a
  particular day it rained or not. Given a time series of recent observations
  of this variable, we wish to predict whether it will rain on the next day.
  If we treat the data as i.i.d., then the only information we can glean from
  the data is the relative frequency of rainy days. However, we know in
  practice that the weather often exhibits trends that may last for several
  days. Observing whether or not it rains today is therefore of significant
  help in predicting if it will rain tomorrow.

  <\padded-center>
    <small-figure|<image|image/fig_13_2_no_link.png|.3par|||>|The simplest
    approach to modelling a sequence of observations is to treat them as
    independent, corresponding to a graph without links.>
  </padded-center>

  To express such effects in a probabilistic model, we need to relax the
  i.i.d. assumption, and one of the simplest ways to do this is to consider a
  Markov model. First of all we note that, without loss of generality, we can
  use the product rule to express the joint distribution for a sequence of
  observations in the form

  <\equation*>
    p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>|)>=<big|prod><rsub|n=1><rsup|N>p<around*|(|\<b-x\><rsub|n>\|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>|)>
  </equation*>

  If we now assume that each of the conditional distributions on the
  right-hand side is independent of all previous observations except the most
  recent, we obtain the first-order Markov chain, which is depicted as a
  graphical model in Figure <inactive|<reference|fig13.3>>. The joint
  distribution for a sequence of N observations under this model is given by

  <\equation>
    p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>|)>=p<around*|(|\<b-x\><rsub|1>|)><big|prod><rsub|n=2><rsup|N>p<around*|(|\<b-x\><rsub|n>\|\<b-x\><rsub|n-1>|)><label|13.2>
  </equation>

  From the d-separation property, we see that the conditional distribution
  for observation <math|\<b-x\><rsub|n>>, given all of the observations up to
  time <math|n>, is given by

  <\equation*>
    p<around*|(|\<b-x\><rsub|n>\|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>|)>=p<around*|(|\<b-x\><rsub|n>\|\<b-x\><rsub|n-1>|)>
  </equation*>

  which is easily verified by direct evaluation starting from Eq.
  <eqref|13.2> and using the product rule of probability. Thus if we use such
  a model to predict the next observation in a sequence, the distribution of
  predictions will depend only on the value of the immediately preceding
  observation and will be independent of all earlier observations.

  <\padded-center>
    <small-figure|<image|image/fig_13_3_first_order_markov.png|.3par|||>|A
    first-order Markov chain of observations
    <math|<around*|{|\<b-x\><rsub|n>|}> >in which the distribution
    <math|p<around*|(|\<b-x\><rsub|n>\|\<b-x\><rsub|n-1>|)>> of a particular
    observation <math|\<b-x\><rsub|n>> is conditioned on the value of the
    previous observation <math|\<b-x\><rsub|n-1>>.>
  </padded-center>

  In most applications of such models, the conditional distributions
  <math|p<around*|(|\<b-x\><rsub|n>\|\<b-x\><rsub|n-1>|)>> that define the
  model will be constrained to be equal, corresponding to the assumption of a
  stationary time series. The model is then known as a homogeneous Markov
  chain. For instance, if the conditional distributions depend on adjustable
  parameters (whose values might be inferred from a set of training data),
  then all of the conditional distributions in the chain will share the same
  values of those parameters.

  Although this is more general than the independence model, it is still very
  restrictive. For many sequential observations, we anticipate that the
  trends in the data over several successive observations will provide
  important information in predicting the next value. One way to allow
  earlier observations to have an influence is to move to higher-order Markov
  chains. If we allow the predictions to depend also on the previous-but-one
  value, we obtain a second-order Markov chain, represented by the graph in
  Figure <reference|fig13.4>.\ 

  <\padded-center>
    <small-figure|<image|image/fig_13_4_secondt_order_markov.png|.3par|||>|<label|fig13.4>A
    second-order Markov chain, in \ which the conditional distribution of a
    particular observation xn depends on the values of the two previous
    observations xn\<minus\>1 and \ xn\<minus\>2.>
  </padded-center>

  The joint distribution is now given by

  <\equation*>
    p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>|)>=p<around*|(|\<b-x\><rsub|1>|)>p<around*|(|\<b-x\><rsub|2>\|\<b-x\><rsub|1>|)><big|prod><rsub|n=3><rsup|N>p<around*|(|\<b-x\><rsub|n>\|\<b-x\><rsub|n-1>,\<b-x\><rsub|n-2>|)>
  </equation*>

  Again, using d-separation or by direct evaluation, we see that the
  conditional distribution of <math|\<b-x\><rsub|n>> given
  <math|\<b-x\><rsub|n-1>> and <math|\<b-x\><rsub|n-2>> is independent of all
  observations <math|x<rsub|1>,\<cdots\>,\<b-x\><rsub|n-3>>. Each observation
  is now influenced by two previous observations. We can similarly consider
  extensions to an M'th order Markov chain in which the conditional
  distribution for a particular variable depends on the previous M variables.
  However, we have paid a price for this increased flexibility because the
  number of parameters in the model is now much larger. Suppose the
  observations are discrete variables having <math|K> states. Then the
  conditional distribution <math|p(\<b-x\><rsub|n>\|\<b-x\><rsub|n\<minus\>1>)>
  in a first-order Markov chain will be specified by a set of
  <math|K\<minus\>1> parameters for each of the <math|K> states of
  <math|\<b-x\><rsub|n\<minus\>1>> giving a total of <math|K(K\<minus\>1)>
  parameters. Now suppose we extend the model to an M'th order Markov chain,
  so that the joint distribution is built up from conditionals
  <math|p(\<b-x\><rsub|n>\|\<b-x\><rsub|n\<minus\>M>,\<cdots\>,
  \<b-x\><rsub|n\<minus\>1>)>. If the variables are discrete, and if the
  conditional distributions are represented by general conditional
  probability tables, then the number of parameters in such a model will have
  <math|K<rsup|M\<minus\>1>(K\<minus\>1)> parameters. Because this grows
  exponentially with <math|M> , it will often render this approach
  impractical for larger values of <math|M> .

  For continuous variables, we can use linear-Gaussian conditional
  distributions in which each node has a Gaussian distribution whose mean is
  a linear function of its parents. This is known as an <em|autoregressive>
  or <em|AR> model (Box et al., 1994; Thiesson et al., 2004). An alternative
  approach is to use a parametric model for
  <math|p(\<b-x\><rsub|n>\|\<b-x\><rsub|n\<minus\>M>,\<cdots\>,
  \<b-x\><rsub|n\<minus\>1>)> such as a neural network. This technique is
  sometimes called a <em|tapped delay line> because it corresponds to storing
  (delaying) the previous <math|M> values of the observed variable in order
  to predict the next value. The number of parameters can then be much
  smaller than in a completely general model (for example it may grow
  linearly with M ), although this is achieved at the expense of a restricted
  family of conditional distributions.

  Suppose we wish to build a model for sequences that is not limited by the
  Markov assumption to any order and yet that can be specified using a
  limited number of free parameters. We can achieve this by introducing
  additional latent variables to permit a rich class of models to be
  constructed out of simple components, as we did with mixture distributions
  in Chapter 9 and with continuous latent variable models in Chapter 12. For
  each observation <math|\<b-x\><rsub|n>>, we introduce a corresponding
  latent variable <math|\<b-z\><rsub|n>> (which may be of different type or
  dimensionality to the observed variable). We now assume that it is the
  latent variables that form a Markov chain, giving rise to the graphical
  structure known as a state space model, which is shown in Figure
  <reference|fig13.5>. It satisfies the key conditional independence property
  that <math|\<b-z\><rsub|n-1>> and <math|\<b-z\><rsub|n+1>> are independent
  given <math|\<b-z\><rsub|n>>, so that

  <\equation*>
    \<b-z\><rsub|n+1>\<bot\>\<b-z\><rsub|n-1>\|\<b-z\><rsub|n>
  </equation*>

  <\padded-center>
    <small-figure|<image|image/fig_13_5_latent_markov.png|.5par|||>|<label|fig13.5>We
    can represent sequential data using a Markov chain of latent variables,
    with each observation conditioned on the state of the corresponding
    latent variable. This important graphical structure forms the foundation
    both for the hidden Markov model and for linear dynamical systems.>
  </padded-center>

  The joint distribution for this model is given by

  <\equation*>
    p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>,\<b-z\><rsub|1>,\<cdots\>,\<b-z\><rsub|N>|)>=p<around*|(|\<b-z\><rsub|1>|)><around*|[|<big|prod><rsub|n=2><rsup|N>p<around*|(|\<b-z\><rsub|n>\|\<b-z\><rsub|n-1>|)>|]><big|prod><rsub|n=1><rsup|N>p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)>
  </equation*>

  Using the d-separation criterion, we see that there is always a path
  connecting any two observed variables <math|\<b-x\><rsub|n>> and
  <math|\<b-x\><rsub|m>> via the latent variables, and that this path is
  never blocked. Thus the predictive distribution
  <math|p<around*|(|\<b-x\><rsub|n+1>\|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>|)>>
  for observation <math|\<b-x\><rsub|n+1>> given all previous observations
  does not exhibit any conditional independence properties, and so our
  predictions for <math|\<b-x\><rsub|n+1>> depends on all previous
  observations. The observed variables, however, do not satisfy the Markov
  property at any order. We shall discuss how to evaluate the predictive
  distribution in later sections of this chapter.

  There are two important models for sequential data that are described by
  this graph. If the latent variables are discrete, then we obtain the
  <em|hidden Markov model>, <em|>or <em|HMM> (Elliott et al., 1995). Note
  that the observed variables in an HMM may \ be discrete or continuous, and
  a variety of different conditional distributions can be used to model them.
  If both the latent and the observed variables are Gaussian (with a
  linear-Gaussian dependence of the conditional distributions on their
  parents), then we obtain the <em|linear dynamical system>.

  <section|Hidden Markov Models>

  \;

  The hidden Markov model can be viewed as a specific instance of the state
  space model of Figure <reference|fig13.5> in which the latent variables are
  discrete. However, if we examine a single time slice of the model, we see
  that it corresponds to a mixture distribution, with component densities
  given by <math|p<around*|(|\<b-x\>\|\<b-z\>|)>>. It can therefore also be
  interpreted as an extension of a mixture model in which the choice of
  mixture component for each observation is not selected independently but
  depends on the choice of component for the previous observation. The HMM is
  widely used in speech recognition (Jelinek, 1997; Rabiner and Juang, 1993),
  natural language modelling (Manning and Sch<wide|u|\<ddot\>>tze, 1999),
  on-line handwriting recognition (Nag et al., 1986), and for the analysis of
  biological sequences such as proteins and DNA (Krogh et al., 1994; Durbin
  et al., 1998; Baldi and Brunak, 2001).

  As in the case of a standard mixture model, the latent variables are the
  discrete multinomial variables <math|\<b-z\><rsub|n>> describing which
  component of the mixture is responsible for generating the corresponding
  observation <math|\<b-x\><rsub|n>>. Again, it is convenient to use a 1-of-K
  coding scheme, as used for mixture models in Chapter 9. We now allow the
  probability distribution of <math|\<b-z\><rsub|n>> to depend on the state
  of the previous latent variable <math|\<b-z\><rsub|n-1>> through a
  conditional distribution <math|p(\<b-z\><rsub|n>\|\<b-z\><rsub|n\<minus\>1>)>.
  Because the latent variables are K-dimensional binary variables, this
  conditional distribution corresponds to a table of numbers that we denote
  by <math|A>, the elements of which are known as transition probabilities.
  They are given by <math|A<rsub|j k>\<equiv\>p(\<b-z\><rsub|n
  k>=1\|\<b-z\><rsub|n\<minus\>1,j>=1)>, and because they are probabilities,
  they satisfy <math|0\<leqslant\>A<rsub|j k>\<leqslant\>1> with
  <math|<big|sum><rsub|k>A<rsub|j k>=1>, so that the matrix <math|A> has
  <math|K(K\<minus\>1)> independent parameters. We can then write the
  conditional distribution explicitly in the form

  <\equation*>
    p<around*|(|\<b-z\><rsub|n>\|\<b-z\><rsub|n-1>,A|)>=<big|prod><rsub|k=1><rsup|K><big|prod><rsub|j=1><rsup|K>A<rsub|j
    k><rsup|z<rsub|n-1,j>z<rsub|n k>>
  </equation*>

  The initial latent node <math|\<b-z\><rsub|1>> is special in that it does
  not have a parent node, and so it has a marginal distribution
  <math|p(\<b-z\><rsub|1>)> represented by a vector of probabilities
  <math|\<b-pi\>> with elements <math|\<pi\><rsub|k>\<equiv\>p(z<rsub|1k>=1)>,
  so that

  <\equation*>
    p<around*|(|\<b-z\><rsub|1>\|\<b-pi\>|)>=<big|prod><rsub|k=1><rsup|K>\<pi\><rsub|k><rsup|z<rsub|1k>>
  </equation*>

  where <math|<big|sum><rsub|k>\<pi\><rsub|k>=1>.
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|13.2|<tuple|1.1|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-1|<tuple|1|1|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-2|<tuple|1.1|1|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-3|<tuple|1.1|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-4|<tuple|1.2|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-5|<tuple|1.3|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-6|<tuple|1.4|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-7|<tuple|1.5|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-8|<tuple|1.2|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|fig12.4|<tuple|1.4|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|fig13.1|<tuple|1.1|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|fig13.4|<tuple|1.4|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|fig13.5|<tuple|1.5|?|../../../../.TeXmacs/texts/scratch/no_name_6.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1.1>||Example of a
      spectrogram of the spoken words \PBayes' theorem\Q showing a plot of
      the intensity of the spectral coefficients versus time
      index.>|<pageref|auto-2>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Sequential
      \ Data> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>