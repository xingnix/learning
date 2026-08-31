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
    p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>|)>=p<around*|(|\<b-x\><rsub|1>|)><big|prod><rsub|n=2><rsup|N>p<around*|(|\<b-x\><rsub|n>\|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>|)>
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
    particular observation <math|x<rsub|n>> depends on the values of the two
    previous observations <math|x<rsub|n\<minus\>1>> and
    \ <math|x<rsub|n\<minus\>2>>.>
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

  <\equation>
    \<b-z\><rsub|n+1>\<bot\>\<b-z\><rsub|n-1>\|\<b-z\><rsub|n><label|13.5>
  </equation>

  <\padded-center>
    <small-figure|<image|image/fig_13_5_latent_markov.png|.5par|||>|<label|fig13.5>We
    can represent sequential data using a Markov chain of latent variables,
    with each observation conditioned on the state of the corresponding
    latent variable. This important graphical structure forms the foundation
    both for the hidden Markov model and for linear dynamical systems.>
  </padded-center>

  The joint distribution for this model is given by

  <\equation>
    p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>,\<b-z\><rsub|1>,\<cdots\>,\<b-z\><rsub|N>|)>=p<around*|(|\<b-z\><rsub|1>|)><around*|[|<big|prod><rsub|n=2><rsup|N>p<around*|(|\<b-z\><rsub|n>\|\<b-z\><rsub|n-1>|)>|]><big|prod><rsub|n=1><rsup|N>p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)><label|13.6>
  </equation>

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

  The transition matrix is sometimes illustrated diagrammatically by drawing
  the states as nodes in a state transition diagram as shown in Figure
  <reference|fig13.6> for the case of <math|K=3>. Note that this does not
  represent a probabilistic graphical model, because the nodes are not
  separate variables but rather states of a single variable, and so we have
  shown the states as boxes rather than circles.

  <\padded-center>
    <small-figure|<image|image/fig_13_6_transition_diagram.png|0.2par|||>|<label|fig13.6>Transition
    diagram showing a model whose latent variables have three possible states
    corresponding to the three boxes. The black lines denote the elements of
    the transition matrix \ <math|A<rsub|j k>>.>
  </padded-center>

  It is sometimes useful to take a state transition diagram, of the kind
  shown in Figure <reference|fig13.6>, and unfold it over time. This gives an
  alternative representation of the transitions between latent states, known
  as a <em|lattice> or <em|trellis> diagram, and which is \ shown for the
  case of the hidden Markov model in Figure <reference|fig13.7>.

  <\padded-center>
    <small-figure|<image|image/fig_13_7_lattice_trellis_diagram.png|.3par|||>|<label|fig13.7>If
    we unfold the state transition diagram of Figure <reference|fig13.6> over
    time, we obtain a lattice, or trellis, representation of the latent
    states. Each column of this diagram corresponds to one of the latent
    variables <math|\<b-z\><rsub|n>>.>
  </padded-center>

  The specification of the probabilistic model is completed by defining the
  conditional distributions of the observed variables
  <math|p(\<b-x\><rsub|n>\|\<b-z\><rsub|n>, \<b-varphi\>)>, where
  <math|\<b-varphi\> >is a set of parameters governing the distribution.
  These are known as emission probabilities, and might for example be given
  by Gaussians of the form (9.11) if the elements of <math|\<b-x\>> are
  continuous variables, or by conditional probability tables if
  <math|\<b-x\>> is discrete. Because <math|\<b-x\><rsub|n>> is observed, the
  distribution <math|p(\<b-x\><rsub|n>\|\<b-z\><rsub|n>,\<b-varphi\>)>
  consists, for a given value of <math|\<b-varphi\>>, of a vector of <math|K>
  numbers corresponding to the <math|K> possible states of the binary vector
  <math|\<b-z\><rsub|n>>. We can represent the emission probabilities in the
  form

  <\equation*>
    p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>,\<b-varphi\>|)>=<big|prod><rsub|k=1><rsup|K>p<around*|(|\<b-x\><rsub|n>\|\<b-varphi\><rsub|k>|)><rsup|z<rsub|n
    k>>.
  </equation*>

  \;

  We shall focuss attention on <em|homogeneous> models for which all of the
  conditional distributions governing the latent variables share the same
  parameters <math|A>, and similarly all of the emission distributions share
  the same parameters <math|\<b-varphi\>> (the extension to more general
  cases is straightforward). Note that a mixture model for an i.i.d. data set
  corresponds to the special case in which the parameters <math|A<rsub|j k>>
  are the same for all values of <math|j>, so that the conditional
  distribution <math|p(\<b-z\><rsub|n>\|\<b-z\><rsub|n\<minus\>1>)> is
  independent of <math|\<b-z\><rsub|n\<minus\>1>>. This corresponds to
  deleting the horizontal links in the graphical model shown in Figure
  <reference|fig13.5>.

  The joint probability distribution over both latent and observed variables
  is then given by

  <\equation>
    p<around*|(|X,Z\|\<b-theta\>|)>=p<around*|(|\<b-z\><rsub|1><around*|\||\<b-pi\>|\|>|)><around*|[|<big|prod><rsup|N><rsub|n=2>p<around*|(|\<b-z\><rsub|n>\|\<b-z\><rsub|n-1>,A|)>|]><big|prod><rsub|m=1><rsup|N>p<around*|(|\<b-x\><rsub|m>\|\<b-z\><rsub|m>,\<b-varphi\>|)><label|13.10>
  </equation>

  where <math|X={\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>}>,
  <math|Z={\<b-z\><rsub|1>,\<cdots\>,\<b-z\><rsub|N>}>, and
  <math|\<b-theta\>={\<b-pi\>,A,\<b-varphi\>}> denotes the set of parameters
  governing the model. Most of our discussion of the hidden Markov model will
  be independent of the particular choice of the emission probabilities.
  Indeed, the model is tractable for a wide range of emission distributions
  including discrete tables, Gaussians, and mixtures of Gaussians. It is also
  possible to exploit discriminative models such as neural networks. These
  can be used to model the emission density <math|p(\<b-x\>\|\<b-z\>)>
  directly, or to provide a representation for <math|p(\<b-z\>\|\<b-cal-x\>)>
  that can be converted into the required emission density
  <math|p(\<b-x\>\|\<b-z\>)> using Bayes' theorem (Bishop et al., 2004).

  We can gain a better understanding of the hidden Markov model by
  considering it from a generative point of view. Recall that to generate
  samples from a mixture of Gaussians, we first chose one of the components
  at random with probability given by the mixing coefficients
  <math|\<pi\><rsub|k>> and then generate a sample vector <math|\<b-x\>> from
  the corresponding Gaussian component. This process is repeated <math|N>
  times to generate a data set of <math|N> independent samples. In the case
  of the hidden Markov model, this procedure is modified as follows. We first
  choose the initial latent variable <math|\<b-z\><rsub|1>> with
  probabilities governed by the parameters <math|\<pi\><rsub|k>> and then
  sample the corresponding observation <math|\<b-x\><rsub|1>>. Now we choose
  the state of the variable <math|\<b-z\><rsub|2>> according to the
  transition probabilities <math|p(\<b-z\><rsub|2>\|\<b-z\><rsub|1>)> using
  the already instantiated value of <math|\<b-z\><rsub|1>>. Thus suppose that
  the sample for <math|\<b-z\><rsub|1>> corresponds to state <math|j>. Then
  we choose the state <math|k> of <math|\<b-z\><rsub|2>> with probabilities
  <math|A<rsub|j k>> for <math|k=1, \<cdots\>,K>. Once we know
  <math|\<b-z\><rsub|2>> we can draw a sample for <math|\<b-x\><rsub|2>> and
  also sample the next latent variable <math|\<b-z\><rsub|3>> and so on. This
  is an example of ancestral sampling for a directed graphical model. If, for
  instance, we have a model in which the diagonal transition elements
  <math|A<rsub|k k>> are much larger than the off-diagonal elements, then a
  typical data sequence will have long runs of points generated from a single
  component, with infrequent transitions from one component to another. The
  generation of samples from a hidden Markov model is illustrated in Figure
  <reference|fig13.8>.

  <\padded-center>
    <small-figure|<image|image/fig_13_8_hmm_sampling.png|.5par|||>|<label|fig13.8>Illustration
    of sampling from a hidden Markov model having a 3-state latent variable
    <math|\<b-z\>> and a Gaussian emission model <math|p(\<b-x\>\|\<b-z\>)>
    where <math|\<b-x\>> is 2-dimensional. (a) Contours of constant
    probability density for the emission distributions corresponding to each
    of the three states of the latent variable. (b) A sample of 50 points
    drawn from the hidden Markov model, colour coded according to the
    component that generated them and with lines connecting the successive
    observations. Here the transition matrix was fixed so that in any state
    there is a 5% probability of making a transition to each of the other
    states, and consequently a 90% probability of remaining in the same
    state.>
  </padded-center>

  There are many variants of the standard HMM model, obtained for instance by
  imposing constraints on the form of the transition matrix <math|A>
  (Rabiner, 1989). Here we mention one of particular practical importance
  called the <em|left-to-right> HMM, which is obtained by setting the
  elements <math|A<rsub|j k>> of <math|A> to zero if <math|k\<less\>j>, as
  illustrated in the state transition diagram for a 3-state HMM in Figure
  <reference|fig13.9>.\ 

  <\padded-center>
    <small-figure|<image|image/fig_13_9_hmm_left2right.png|0.2par|||>|<label|fig13.9>Example
    of the state transition diagram for a 3-state \ left-to-right hidden
    Markov model. Note that once a state has been vacated, it cannot later be
    re-entered.>
  </padded-center>

  Typically for such models the initial state probabilities for
  <math|p(\<b-z\><rsub|1>)> are modified so that <math|p(\<b-z\><rsub|11>)=1>
  and <math|p(\<b-z\><rsub|1j>)=0> for <math|j\<neq\>1>, in other words every
  sequence is constrained to start in state <math|j=1>. The transition matrix
  may be further constrained to ensure that large changes in the state index
  do not occur, so that <math|A<rsub|j k>=0> if <math|k\<gtr\>j+\<#2206\>>.
  This type of model is illustrated using a lattice diagram in Figure
  <reference|fig13.10>.

  <\padded-center>
    <small-figure|<image|image/fig_13_10_hmm_left2right_lattice.png|.3par|||>|<label|fig13.10>Lattice
    diagram for a 3-state leftto-right HMM in which the state index <math|k>
    is allowed to increase by at most 1 at each transition.>
  </padded-center>

  Many applications of hidden Markov models, for example speech recognition,
  or on-line character recognition, make use of left-to-right architectures.
  As an illustration of the left-to-right hidden Markov model, we consider an
  example involving handwritten digits. This uses on-line data, meaning that
  each digit is represented by the trajectory of the pen as a function of
  time in the form of a sequence of pen coordinates, in contrast to the
  off-line digits data, discussed in Appendix A, which comprises static
  two-dimensional pixellated images of the ink. Examples of the online digits
  are shown in Figure <reference|fig13.11>.\ 

  <\padded-center>
    <small-figure|<image|image/fig_13_11_online_digit_2.png|0.3par|||>|<label|fig13.11>Top
    row: examples of on-line handwritten digits. Bottom row: synthetic digits
    sampled generatively from a left-to-right hidden Markov model that has
    been trained on a data set of 45 handwritten digits.>
  </padded-center>

  Here we train a hidden Markov model on a subset of data comprising 45
  examples of the digit `2'. There are <math|K=16> states, each of which can
  generate a line segment of fixed length having one of 16 possible angles,
  and so the emission distribution is simply a 16\<times\>16 table of
  probabilities associated with the allowed angle values for each state index
  value. Transition probabilities are all set to zero except for those that
  keep the state index <math|k> the same or that increment it by 1, and the
  model parameters are optimized using 25 iterations of EM. We can gain some
  insight into the resulting model by running it generatively, as shown in
  Figure <reference|fig13.11>.

  One of the most powerful properties of hidden Markov models is their
  ability to exhibit some degree of invariance to local warping (compression
  and stretching) of the time axis. To understand this, consider the way in
  which the digit `2' is written in the on-line handwritten digits example. A
  typical digit comprises two distinct sections joined at a cusp. The first
  part of the digit, which starts at the top left, has a sweeping arc down to
  the cusp or loop at the bottom left, followed by a second more-or-less
  straight sweep ending at the bottom right. Natural variations in writing
  style will cause the relative sizes of the two sections to vary, and hence
  the location of the cusp or loop within the temporal sequence will vary.
  From a generative perspective such variations can be accommodated by the
  hidden Markov model through changes in the number of transitions to the
  same state versus the number of transitions to the successive state. Note,
  however, that if a digit `2' is written in the reverse order, that is,
  starting at the bottom right and ending at the top left, then even though
  the pen tip coordinates may be identical to an example from the training
  set, the probability of the observations under the model will be extremely
  small. In the speech recognition context, warping of the time axis is
  associated with natural variations in the speed of speech, and again the
  hidden Markov model can accommodate such a distortion and not penalize it
  too heavily.

  <subsection|Maximum likelihood for the HMM><label|sec13.2.1>

  \;

  If we have observed a data set <math|X={\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>}>,
  we can determine the parameters of an HMM using maximum likelihood. The
  likelihood function is obtained from the joint distribution <eqref|13.10>
  by marginalizing over the latent variables

  <\equation>
    p<around*|(|\<b-X\>\|\<b-theta\>|)>=<big|sum><rsub|Z>p<around*|(|X,Z\|\<b-theta\>|)><label|13.11>
  </equation>

  Because the joint distribution <math|p(X,Z\|\<b-theta\>)> does not
  factorize over <math|n> (in contrast to the mixture distribution considered
  in Chapter 9), we cannot simply treat each of the summations over
  <math|\<b-z\><rsub|n>> independently. Nor can we perform the summations
  explicitly because there are <math|N> variables to be summed over, each of
  which has <math|K> states, resulting in a total of <math|K<rsup|N>> terms.
  Thus the number of terms in the summation grows exponentially with the
  length of the chain. In fact, the summation in Eq. <eqref|13.11>
  corresponds to summing over exponentially many paths through the lattice
  diagram in Figure <reference|fig13.7>.

  We have already encountered a similar difficulty when we considered the
  inference problem for the simple chain of variables in Figure 8.32. There
  we were able to make use of the conditional independence properties of the
  graph to re-order the summations in order to obtain an algorithm whose cost
  scales linearly, instead of exponentially, with the length of the chain. We
  shall apply a similar technique to the hidden Markov model.

  A further difficulty with the expression <eqref|13.11> for the likelihood
  function is that, because it corresponds to a generalization of a mixture
  distribution, it represents a summation over the emission models for
  different settings of the latent variables. Direct maximization of the
  likelihood function will therefore lead to complex expressions with no
  closed-form solutions, as was the case for simple mixture models \ (recall
  that a mixture model for i.i.d. data is a special case of the HMM).

  We therefore turn to the expectation maximization algorithm to find an
  efficient framework for maximizing the likelihood function in hidden Markov
  models. The EM algorithm starts with some initial selection for the model
  parameters, which we denote by <math|\<b-theta\><rsup|old>>. In the E step,
  we take these parameter values and find the posterior distribution of the
  latent variables <math|p(Z\|X, \<b-theta\><rsup|old>)>. We then use this
  posterior distribution to evaluate the expectation of the logarithm of the
  complete-data likelihood function, as a function of the parameters
  <math|\<b-theta\>>, to give the function <math|Q(\<b-theta\>,
  \<b-theta\><rsup|old>)> defined by

  <\equation>
    Q<around*|(|\<b-theta\>,\<b-theta\><rsup|old>|)>=<big|sum><rsub|Z>p<around*|(|Z\|X,\<b-theta\><rsup|old>|)>ln
    p<around*|(|X,Z\|\<b-theta\>|)><label|13.12>
  </equation>

  At this point, it is convenient to introduce some notation. We shall use
  <math|\<gamma\>(\<b-z\><rsub|n>)> to denote the marginal posterior
  distribution of a latent variable <math|\<b-z\><rsub|n>>, and
  <math|\<xi\>(\<b-z\><rsub|n\<minus\>1>, \<b-z\><rsub|n>)> to denote the
  joint posterior distribution of two successive latent variables, so that

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<gamma\><around*|(|\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-z\><rsub|n>\|X,\<b-theta\><rsup|old>|)>>>|<row|<cell|\<xi\><around*|(|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>\|X,\<b-theta\><rsup|old>|)>>>>>
  </eqnarray*>

  For each value of n, we can store <math|\<gamma\>(\<b-z\><rsub|n>)> using a
  set of K nonnegative numbers that sum to unity, and similarly we can store
  <math|\<xi\>(\<b-z\><rsub|n\<minus\>1>,\<b-z\><rsub|n>)> using a
  <math|K\<times\>K> matrix of nonnegative numbers that again sum to unity.
  We shall also use <math|\<gamma\>(z<rsub|n k>)> to denote the conditional
  probability of <math|z<rsub|n k>=1>, with a similar use of notation for
  <math|\<xi\>(z<rsub|n\<minus\>1,j>,z<rsub|n k>)> and for other
  probabilistic variables introduced later. Because the expectation of a
  binary random variable is just the probability that it takes the value 1,
  we have

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<gamma\><around*|(|z<rsub|n
    k>|)>>|<cell|=>|<cell|\<bbb-E\><around*|[|z<rsub|n
    k>|]>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|\<b-z\><rsub|n>>\<gamma\><around*|(|\<b-z\><rsub|n>|)>z<rsub|n
    k>>>|<row|<cell|\<xi\><around*|(|z<rsub|n-1,j>,z<rsub|n
    k>|)>>|<cell|=>|<cell|\<bbb-E\><around*|[|z<rsub|n-1,j>z<rsub|n
    k>|]>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>>\<xi\><around*|(|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>|)>z<rsub|n-1,j>z<rsub|n
    k>>>>>
  </eqnarray*>

  If we substitute the joint distribution <math|p(X, Z\|\<b-theta\>)> given
  by Eq. <eqref|13.10> into Eq. <eqref|13.12>, and make use of the
  definitions of <math|\<gamma\>> and <math|\<xi\>> , we obtain

  <\equation>
    Q<around*|(|\<b-theta\>,\<b-theta\><rsup|old>|)>=<big|sum><rsub|k=1><rsup|K>\<gamma\><around*|(|z<rsub|1k>|)>ln\<pi\><rsub|k>+<big|sum><rsub|n=2><rsup|N><big|sum><rsub|j=1><rsup|K><big|sum><rsub|k=1><rsup|K>\<xi\><around*|(|z<rsub|n-1,j>,z<rsub|n
    k>|)>ln A<rsub|j k>+<big|sum><rsub|n=1><rsup|N><big|sum><rsub|k=1><rsup|K>\<gamma\><around*|(|z<rsub|n
    k>|)>ln p<around*|(|\<b-x\><rsub|n>\|\<b-varphi\><rsub|k>|)><label|13.17>
  </equation>

  The goal of the E step will be to evaluate the quantities
  <math|\<gamma\>(\<b-z\><rsub|n>)> and <math|\<xi\>(\<b-z\><rsub|n\<minus\>1>,
  \<b-z\><rsub|n>)> efficiently, and we shall discuss this in detail shortly.

  In the M step, we maximize <math|Q(\<b-theta\>, \<b-theta\><rsup|old>)>
  with respect to the parameters <math|\<b-theta\>={\<b-pi\>,A,\<b-varphi\>}>
  in which we treat <math|\<gamma\>(\<b-z\><rsub|n>)> and
  <math|\<xi\>(\<b-z\><rsub|n\<minus\>1>,\<b-z\><rsub|n>)> as constant.
  Maximization with respect to <math|\<b-pi\>> and <math|A> is easily
  achieved using appropriate Lagrange multipliers with the results

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<pi\><rsub|k>>|<cell|=>|<cell|<frac|\<gamma\><around*|(|z<rsub|1k>|)>|<big|sum><rsub|j=1><rsup|K>\<gamma\><around*|(|z<rsub|1j>|)>>>>|<row|<cell|A<rsub|j
    k>>|<cell|=>|<cell|<frac|<big|sum><rsub|n=2><rsup|N>\<xi\><around*|(|z<rsub|n-1,j>,z<rsub|n
    k>|)>|<big|sum><rsub|l=1><rsup|K><big|sum><rsub|n=2><rsup|N>\<xi\><around*|(|z<rsub|n-1,j>,z<rsub|n
    l>|)>>>>>>
  </eqnarray*>

  The EM algorithm must be initialized by choosing starting values for
  <math|\<b-pi\>> and <math|A>, which should of course respect the summation
  constraints associated with their probabilistic interpretation. Note that
  any elements of <math|\<b-pi\>> or <math|A> that are set to zero initially
  will remain zero in subsequent EM updates. A typical initialization
  procedure would involve selecting random starting values for these
  parameters subject to the summation and non-negativity constraints. Note
  that no particular modification to the EM results are required for the case
  of left-to-right models beyond choosing initial values for the elements
  <math|A<rsub|j k>> in which the appropriate elements are set to zero,
  because these will remain zero throughout.

  To maximize <math|Q(\<b-theta\>,\<b-theta\><rsup|old>)> with respect to
  <math|\<b-varphi\><rsub|k>>, we notice that only the final term \ in Eq.
  <eqref|13.17> depends on <math|\<b-varphi\><rsub|k>>, and furthermore this
  term has exactly the same form as the data-dependent term in the
  corresponding function for a standard mixture distribution for i.i.d. data,
  as can be seen by comparison with (9.40) for the case of a Gaussian
  mixture. Here the quantities <math|\<gamma\>(z<rsub|n k>)> are playing the
  role of the responsibilities. If the parameters <math|\<b-varphi\><rsub|k>>
  are independent for the different components, then this term decouples into
  a sum of terms one for each value of <math|k>, each of which can be
  maximized independently. We are then simply maximizing the weighted log
  likelihood function for the emission density
  <math|p(\<b-x\>\|\<b-varphi\><rsub|k>)> with weights
  <math|\<gamma\>(z<rsub|n k>)>. Here we shall suppose that this maximization
  can be done efficiently. For instance, in the case of Gaussian emission
  densities we have <math|p(\<b-x\>\|\<b-varphi\><rsub|k>)=\<cal-N\>(\<b-x\>\|\<b-mu\><rsub|k>,\<Sigma\><rsub|k>)>,
  and maximization of the function <math|Q(\<b-theta\>,\<b-theta\><rsup|old>)>
  then gives

  <\eqnarray*>
    <tformat|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|\<b-mu\><rsub|k>>|<cell|=>|<cell|<frac|<big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|z<rsub|n
    k>|)>\<b-x\><rsub|n>|<big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|z<rsub|n
    k>|)>><eq-number><label|13.20>>>|<row|<cell|\<Sigma\><rsub|k>>|<cell|=>|<cell|<frac|<big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|z<rsub|n
    k>|)><around*|(|\<b-x\><rsub|n>-\<b-mu\><rsub|k>|)><around*|(|\<b-x\><rsub|n>-\<b-mu\><rsub|k>|)><rsup|T>|<big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|z<rsub|n
    k>|)>>>>>>
  </eqnarray*>

  For the case of discrete multinomial observed variables, the conditional
  distribution of the observations takes the form

  <\equation*>
    p<around*|(|\<b-x\>\|\<b-z\>|)>=<big|prod><rsub|i=1><rsup|D><big|prod><rsub|k=1><rsup|K>\<mu\><rsub|i
    k><rsup|x<rsub|i>z<rsub|k>>
  </equation*>

  and the corresponding M-step equations are given by

  <\equation*>
    \<mu\><rsub|i k>=<frac|<big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|z<rsub|n
    k>|)>x<rsub|n i>|<big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|z<rsub|n
    k>|)>>.
  </equation*>

  An analogous result holds for Bernoulli observed variables.

  The EM algorithm requires initial values for the parameters of the emission
  distribution. One way to set these is first to treat the data initially as
  i.i.d. and fit the emission density by maximum likelihood, and then use the
  resulting values to initialize the parameters for EM.

  <subsection|The forward-backward algorithm><label|sec13.2.2>

  \;

  Next we seek an efficient procedure for evaluating the quantities
  <math|\<gamma\>(z<rsub|n k>)> and <math|\<xi\>(z<rsub|n\<minus\>1,j>,z<rsub|n
  k>)>, corresponding to the E step of the EM algorithm. The graph for the
  hidden Markov model, shown in Figure <reference|fig13.5>, is a tree, and so
  we know that the posterior distribution of the latent variables can be
  obtained efficiently using a two stage message passing algorithm. In the
  particular context of the hidden Markov \ model, this is known as the
  <em|forward-backward> algorithm (Rabiner, 1989), or the <em|Baum-Welch>
  algorithm (Baum, 1972). There are in fact several variants of the basic
  algorithm, all of which lead to the exact marginals, according to the
  precise form of the messages that are propagated along the chain (Jordan,
  2007). We shall focus on the most widely used of these, known as the
  <em|alpha-beta> algorithm.

  As well as being of great practical importance in its own right, the
  forwardbackward algorithm provides us with a nice illustration of many of
  the concepts introduced in earlier chapters. We shall therefore begin in
  this section with a `conventional' derivation of the forward-backward
  equations, making use of the sum and product rules of probability, and
  exploiting conditional independence properties which we shall obtain from
  the corresponding graphical model using d-separation. Then in Section
  <reference|sec13.2.3>, we shall see how the forward-backward algorithm can
  be obtained very simply as a specific example of the sum-product algorithm
  introduced in Section 8.4.4.

  It is worth emphasizing that evaluation of the posterior distributions of
  the latent variables is independent of the form of the emission density
  <math|p(\<b-x\>\|\<b-z\>)> or indeed of whether the observed variables are
  continuous or discrete. All we require is the values of the quantities
  <math|p(\<b-x\><rsub|n>\|\<b-z\><rsub|n>)> for each value of
  <math|\<b-z\><rsub|n>> for every <math|n>. Also, in this section and the
  next we shall omit the explicit dependence on the model parameters
  <math|\<b-theta\><rsup|old>> because these fixed throughout.

  We therefore begin by writing down the following conditional independence
  properties (Jordan, 2007)

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|X\|\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)>p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n>|)><eq-number><label|13.24>>>|<row|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>\|\<b-x\><rsub|n>,\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>\|\<b-z\><rsub|n>|)><eq-number><label|13.25>>>|<row|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>\|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>\|\<b-z\><rsub|n-1>|)><eq-number><label|13.26>>>|<row|<cell|p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n>,\<b-z\><rsub|n+1>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n+1>|)><eq-number><label|13.27>>>|<row|<cell|p<around*|(|\<b-x\><rsub|n+2>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n+1>,\<b-x\><rsub|n+1>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|n+2>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n+1>|)><eq-number><label|13.28>>>|<row|<cell|p<around*|(|X\|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>\|\<b-z\><rsub|n-1>|)>p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)>p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n>|)><eq-number><label|13.29>>>|<row|<cell|p<around*|(|\<b-x\><rsub|N+1>\|X,\<b-z\><rsub|N+1>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|N+1>\|\<b-z\><rsub|N+1>|)><eq-number><label|13.30>>>|<row|<cell|p<around*|(|\<b-z\><rsub|N+1>\|\<b-z\><rsub|N>,X|)>>|<cell|=>|<cell|p<around*|(|\<b-z\><rsub|N+1>\|\<b-z\><rsub|N>|)><eq-number><label|13.31>>>>>
  </eqnarray*>

  where <math|X={\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>}>. These relations
  are most easily proved using d-separation. For instance in the first of
  these results, we note that every path from any one of the nodes
  <math|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>> to the node
  <math|\<b-x\><rsub|n>> passes through the node <math|\<b-z\><rsub|n>>,
  which is observed. Because all such paths are head-to-tail, it follows that
  the conditional independence property must hold. The reader should take a
  few moments to verify each of these properties in turn, as an exercise in
  the application of d-separation. These relations can also be proved
  directly, though with significantly greater effort, from the joint
  distribution for the hidden Markov model using the sum and product rules of
  probability.

  Let us begin by evaluating <math|\<gamma\>(z<rsub|n k>)>. Recall that for a
  discrete multinomial random variable the expected value of one of its
  components is just the probability of that component having the value 1.
  Thus we are interested in finding the posterior distribution
  <math|p(\<b-z\><rsub|n>\|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>)> of
  <math|\<b-z\><rsub|n>> given the observed data set
  <math|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>>. This represents a vector
  of length <math|K> whose entries correspond to the expected values of
  <math|z<rsub|n k>>. Using Bayes' theorem, we have

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<gamma\><around*|(|\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-z\><rsub|n>\|X|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|p<around*|(|X\|\<b-z\><rsub|n>|)>p<around*|(|\<b-z\><rsub|n>|)>|p<around*|(|X|)>>>>>>
  </eqnarray*>

  Note that the denominator <math|p(X)> is implicitly conditioned on the
  parameters <math|\<b-theta\><rsup|old>> of the HMM and hence represents the
  likelihood function. Using the conditional independence property
  <eqref|13.24>, together with the product rule of probability, we obtain

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<gamma\><around*|(|\<b-z\><rsub|n>|)>>|<cell|=>|<cell|<frac|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>,\<b-z\><rsub|n>|)>p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)>|p<around*|(|X|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<alpha\><around*|(|\<b-z\><rsub|n>|)>\<beta\><around*|(|\<b-z\><rsub|n>|)>|p<around*|(|X|)>><eq-number><label|13.33>>>>>
  </eqnarray*>

  where we have defined

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<alpha\><around*|(|\<b-z\><rsub|n>|)>>|<cell|\<equiv\>>|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>,\<b-z\><rsub|n>|)><eq-number><label|13.34>>>|<row|<cell|\<beta\><around*|(|\<b-z\><rsub|n>|)>>|<cell|\<equiv\>>|<cell|p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)><eq-number><label|13.35>>>>>
  </eqnarray*>

  The quantity <math|\<alpha\>(\<b-z\><rsub|n>)> represents the joint
  probability of observing all of the given data up to time <math|n> and the
  value of <math|\<b-z\><rsub|n>>, whereas <math|\<beta\>(\<b-z\><rsub|n>)>
  represents the conditional probability of all future data from time
  <math|n+1> up to <math|N> given the value of <math|\<b-z\><rsub|n>>. Again,
  <math|\<alpha\>(\<b-z\><rsub|n>)> and <math|\<beta\>(\<b-z\><rsub|n>)> each
  represent set of <math|K> numbers, one for each of the possible settings of
  the 1-of-K coded binary vector <math|\<b-z\><rsub|n>>. We shall use the
  notation \<alpha\><math|(z<rsub|n k>)> to denote the value of
  <math|\<alpha\>(\<b-z\><rsub|n>)> when <math|z<rsub|n k>=1>, with an
  analogous interpretation of <math|\<beta\>(z<rsub|n k>)>.

  We now derive recursion relations that allow
  <math|\<alpha\>(\<b-z\><rsub|n>)> and <math|\<beta\>(\<b-z\><rsub|n>)> to
  be evaluated efficiently. Again, we shall make use of conditional
  independence properties, in particular Eq. <eqref|13.25> and <eqref|13.26>,
  together with the sum and product rules, allowing us to express
  <math|\<alpha\>(\<b-z\><rsub|n>)> in terms of
  <math|\<alpha\>(\<b-z\><rsub|n\<minus\>1>)> as follows

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<alpha\><around*|(|\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>,\<b-z\><rsub|n>|)>>>|<row|<cell|>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)>p<around*|(|\<b-z\><rsub|n>|)>>>|<row|<cell|>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)>p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>\|\<b-z\><rsub|n>|)>p<around*|(|\<b-z\><rsub|n>|)>>>|<row|<cell|>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)>p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>,\<b-z\><rsub|n>|)>>>|<row|<cell|>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)><big|sum><rsub|\<b-z\><rsub|n-1>>p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>,\<b-z\><rsub|n-1>,\<b-z\><rsub|n>|)>>>|<row|<cell|>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)><big|sum><rsub|\<b-z\><rsub|n-1>>p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>,\<b-z\><rsub|n>\|\<b-z\><rsub|n-1>|)>p<around*|(|\<b-z\><rsub|n-1>|)>>>|<row|<cell|>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)><big|sum><rsub|\<b-z\><rsub|n-1>>p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>\|\<b-z\><rsub|n-1>|)>p<around*|(|\<b-z\><rsub|n>\|\<b-z\><rsub|n-1>|)>p<around*|(|\<b-z\><rsub|n-1>|)>>>|<row|<cell|>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)><big|sum><rsub|\<b-z\><rsub|n-1>>p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>,\<b-z\><rsub|n-1>|)>p<around*|(|\<b-z\><rsub|n>\|\<b-z\><rsub|n-1>|)>>>>>
  </eqnarray*>

  Making use of the definition <eqref|13.34> for
  <math|\<alpha\>(\<b-z\><rsub|n>)>, we then obtain

  <\equation>
    \<alpha\><around*|(|\<b-z\><rsub|n>|)>=p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)><big|sum><rsub|\<b-z\><rsub|n-1>>\<alpha\><around*|(|\<b-z\><rsub|n-1>|)>p<around*|(|\<b-z\><rsub|n>\|\<b-z\><rsub|n-1>|)><label|13.36>
  </equation>

  It is worth taking a moment to study this recursion relation in some
  detail. Note that there are <math|K> terms in the summation, and the
  right-hand side has to be evaluated for each of the <math|K> values of
  <math|\<b-z\><rsub|n>> so each step of the <math|\<alpha\>> recursion has
  computational cost that scaled like <math|O(K<rsup|2>)>. The forward
  recursion equation for <math|\<alpha\>(\<b-z\><rsub|n>)> is illustrated
  using a lattice diagram in Figure <reference|fig13.12>.

  <\padded-center>
    <small-figure|<image|image/fig_13_12_forward_resursion.png|0.3par|||>|<label|fig13.12>Illustration
    of the forward recursion <eqref|13.36> for evaluation of the
    <math|\<alpha\>> variables. In this fragment of the lattice, we see that
    the quantity <math|\<alpha\>(z<rsub|n1>)> is obtained by taking the
    elements <math|\<alpha\>(z<rsub|n\<minus\>1,j>)> of
    <math|\<alpha\>(\<b-z\><rsub|n\<minus\>1>)> at step <math|n\<minus\>1>
    and summing them up with weights given by <math|A<rsub|j1>>,
    corresponding to the values of <math|p(\<b-z\><rsub|n>\|\<b-z\><rsub|n\<minus\>1>)>,
    and then multiplying by the data contribution
    <math|p(\<b-x\><rsub|n>\|z<rsub|n1>)>.>
  </padded-center>

  In order to start this recursion, we need an initial condition that is
  given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<alpha\><around*|(|\<b-z\><rsub|1>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|1>,\<b-z\><rsub|1>|)>>>|<row|<cell|>|<cell|=>|<cell|p<around*|(|\<b-z\><rsub|1>|)>p<around*|(|\<b-x\><rsub|1>\|\<b-z\><rsub|1>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|prod><rsub|k=1><rsup|K><around*|{|\<pi\><rsub|k>p<around*|(|\<b-x\><rsub|1>\|\<b-varphi\><rsub|k>|)>|}><rsup|z<rsub|1k>><eq-number><label|13.37>>>>>
  </eqnarray*>

  which tells us that <math|\<alpha\>(z<rsub|1k>)>, for
  <math|k=1,\<cdots\>,K>, takes the value
  <math|\<pi\><rsub|k>p(\<b-x\><rsub|1>\|\<b-varphi\><rsub|k>)>. Starting at
  the first node of the chain, we can then work along the chain and evaluate
  <math|\<alpha\>(\<b-z\><rsub|n>)> for every latent node. Because each step
  of the recursion involves multiplying by a <math|K\<times\>K> matrix, the
  overall cost of evaluating these quantities for the whole chain is of
  <math|O(K<rsup|2>N)>.

  We can similarly find a recursion relation for the quantities
  <math|\<beta\>(\<b-z\><rsub|n>)> by making use of the conditional
  independence properties <eqref|13.27> and <eqref|13.28> giving

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<beta\><around*|(|\<b-z\><rsub|N>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|\<b-z\><rsub|n+1>>p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|N>,\<b-z\><rsub|n+1>\|\<b-z\><rsub|n>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|\<b-z\><rsub|n+1>>p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n>,\<b-z\><rsub|n+1>|)>p<around*|(|\<b-z\><rsub|n+1>\|\<b-z\><rsub|n>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|\<b-z\><rsub|n+1>>p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n+1>|)>p<around*|(|\<b-z\><rsub|n+1>\|\<b-z\><rsub|n>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|\<b-z\><rsub|n+1>>p<around*|(|\<b-x\><rsub|n+2>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n+1>|)>p<around*|(|\<b-x\><rsub|n+1>\|\<b-z\><rsub|n+1>|)>p<around*|(|\<b-z\><rsub|n+1>\|\<b-z\><rsub|n>|)>>>>>
  </eqnarray*>

  Making use of the definition <eqref|13.35> for
  <math|\<beta\>(\<b-z\><rsub|n>)>, we then obtain \ 

  <\equation>
    \<beta\>(\<b-z\><rsub|n>) = \ <big|sum><rsub|\<b-z\><rsub|n+1>>\<beta\>(\<b-z\><rsub|n+1>)p(\<b-x\><rsub|n+1>\|\<b-z\><rsub|n+1>)p(\<b-z\><rsub|n+1>\|\<b-z\><rsub|n>).<label|13.38>
  </equation>

  Note that in this case we have a backward message passing algorithm that
  evaluates<math| \<beta\>(\<b-z\><rsub|n>)> in terms of
  <math|\<beta\>(\<b-z\><rsub|n+1>)>. At each step, we absorb the effect of
  observation <math|\<b-x\><rsub|n+1>> through the emission probability
  <math|p(\<b-x\><rsub|n+1>\|\<b-z\><rsub|n+1>)>, multiply by the transition
  matrix <math|p(\<b-z\><rsub|n+1>\|\<b-z\><rsub|n>)>, and then marginalize
  out <math|\<b-z\><rsub|n+1>>. This is illustrated in Figure
  <inactive|<reference|fig13.13>>.

  <\padded-center>
    <small-figure|<image|image/fig_13_13_backward_resursion.png|.3par|||>|Illustration
    of the backward recursion <eqref|13.38> for evaluation of the
    <math|\<beta\>> variables. In this fragment of the lattice, we see that
    the quantity <math|\<beta\>(z<rsub|n1>)> is obtained by taking the
    components <math|\<beta\>(z<rsub|n+1,k>)> of
    <math|\<beta\>(\<b-z\><rsub|n+1>)> at step <math|n+1> and summing them up
    with weights given by the products of <math|A<rsub|1k>>, corresponding to
    the values of <math|p(\<b-z\><rsub|n+1>\|\<b-z\><rsub|n>)> and the
    corresponding values of the emission density
    <math|p(\<b-x\><rsub|n>\|z<rsub|n+1,k>)>.>
  </padded-center>

  Again we need a starting condition for the recursion, namely a value for
  <math|\<beta\>(\<b-z\><rsub|N>)>. This can be obtained by setting
  <math|n=N> in Eq. <eqref|13.33> and replacing
  <math|\<alpha\>(\<b-z\><rsub|N>)> with its definition <eqref|13.34> to give

  <\equation*>
    p<around*|(|\<b-z\><rsub|N>\|X|)>=<frac|p<around*|(|X,\<b-z\><rsub|N>|)>\<beta\><around*|(|\<b-z\><rsub|N>|)>|p<around*|(|X|)>>
  </equation*>

  which we see will be correct provided we take
  <math|\<beta\>(\<b-z\><rsub|N>)=1> for all settings of
  <math|\<b-z\><rsub|N>>.

  In the M step equations, the quantity <math|p(X)> will cancel out, as can
  be seen, for instance, in the M-step equation for \<mu\>k given by Eq.
  <eqref|13.20>, which takes the form

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<b-mu\><rsub|k>>|<cell|=>|<cell|<frac|<big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|z<rsub|n
    k>|)>\<b-x\><rsub|n>|<big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|z<rsub|n
    k>|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|<big|sum><rsub|n=1><rsup|N>\<alpha\><around*|(|z<rsub|n
    k>|)>\<beta\><around*|(|z<rsub|n k>|)>\<b-x\><rsub|n>|<big|sum><rsub|n=1><rsup|N>\<alpha\><around*|(|z<rsub|n
    k>|)>\<beta\><around*|(|z<rsub|n k>|)>>>>>>
  </eqnarray*>

  However, the quantity <math|p(X>) represents the likelihood function whose
  value we typically wish to monitor during the EM optimization, and so it is
  useful to be able to evaluate it. If we sum both sides of Eq. <eqref|13.33>
  over <math|\<b-z\><rsub|n>>, and use the fact that the left-hand side is a
  normalized distribution, we obtain

  <\equation*>
    p<around*|(|X|)>=<big|sum><rsub|\<b-z\><rsub|n>>\<alpha\><around*|(|\<b-z\><rsub|n>|)>\<beta\><around*|(|\<b-z\><rsub|n>|)>
  </equation*>

  Thus we can evaluate the likelihood function by computing this sum, for any
  convenient choice of <math|n>. For instance, if we only want to evaluate
  the likelihood function, then we can do this by running the
  <math|\<alpha\>> recursion from the start to the end of the chain, and then
  use this result for <math|n=N> , making use of the fact that
  <math|\<beta\>(\<b-z\><rsub|N>)> is a vector of 1s. In this case no
  <math|\<beta\>> recursion is required, and we simply have

  <\equation>
    p<around*|(|X|)>=<big|sum><rsub|\<b-z\><rsub|N>>\<alpha\><around*|(|\<b-z\><rsub|N>|)><label|13.42>
  </equation>

  \;

  Let us take a moment to interpret this result for <math|p(X)>. Recall that
  to compute the likelihood we should take the joint distribution
  <math|p(X,Z)> and sum over all possible values of <math|Z>. Each such value
  represents a particular choice of hidden state for every time step, in
  other words every term in the summation is a path through the lattice
  diagram, and recall that there are exponentially many such paths. By
  expressing the likelihood function in the form <eqref|13.42>, we have
  reduced the computational cost from being exponential in the length of the
  chain to being linear by swapping the order of the summation and
  multiplications, so that at each time step <math|n> we sum the
  contributions from all paths passing through each of the states
  <math|z<rsub|n k>> to give the intermediate quantities
  <math|\<alpha\>(\<b-z\><rsub|n>)>.

  Next we consider the evaluation of the quantities
  <math|\<xi\>(\<b-z\><rsub|n\<minus\>1>,\<b-z\><rsub|n>)>, which correspond
  to the values of the conditional probabilities
  <math|p(\<b-z\><rsub|n\<minus\>1>,\<b-z\><rsub|n>\|X)> for each of the
  <math|K\<times\>K> settings for <math|(\<b-z\><rsub|n\<minus\>1>,\<b-z\><rsub|n>)>.
  Using the definition of <math|\<xi\>(\<b-z\><rsub|n\<minus\>1>,\<b-z\><rsub|n>)>,
  and applying Bayes' theorem, we have

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<xi\><around*|(|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>\|X|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|p<around*|(|X\|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>|)>p<around*|(|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>|)>|p<around*|(|X|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>\|\<b-z\><rsub|n-1>|)>p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)>p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)>p<around*|(|\<b-z\><rsub|n>\|\<b-z\><rsub|n-1>|)>p<around*|(|\<b-z\><rsub|n-1>|)>|p<around*|(|X|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<alpha\><around*|(|\<b-z\><rsub|n-1>|)>p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)>p<around*|(|\<b-z\><rsub|n>\|\<b-z\><rsub|n-1>|)>\<beta\><around*|(|\<b-z\><rsub|n>|)>|p<around*|(|X|)>><eq-number><label|13.43>>>>>
  </eqnarray*>

  where we have made use of the conditional independence property
  <eqref|13.29> together with the definitions of
  <math|\<alpha\>(\<b-z\><rsub|n>)> and <math|\<beta\>(\<b-z\><rsub|n>)>
  given by <eqref|13.34> and <eqref|13.35>. Thus we can calculate the
  <math|\<xi\>(\<b-z\><rsub|n\<minus\>1>,\<b-z\><rsub|n>)> directly by using
  the results of the <math|\<alpha\>> and <math|\<beta\>> recursions.

  Let us summarize the steps required to train a hidden Markov model using
  the EM algorithm. We first make an initial selection of the parameters
  <math|\<b-theta\><rsup|old>> where <math|\<b-theta\>\<equiv\>(\<b-pi\>,A,\<b-varphi\>)>.
  The <math|A> and <math|\<b-pi\>> parameters are often initialized either
  uniformly or randomly from a uniform distribution (respecting their
  non-negativity and summation constraints). Initialization of the parameters
  <math|\<b-varphi\>> will depend on the form of the distribution. For
  instance in the case of Gaussians, the parameters <math|\<b-mu\><rsub|k>>
  might be initialized by applying the K-means algorithm to the data, and
  <math|\<Sigma\><rsub|k>> might be initialized to the covariance matrix of
  the corresponding K means cluster. Then we run both the forward
  <math|\<alpha\>> recursion and the backward <math|\<beta\>> recursion and
  use the results to evaluate <math|\<gamma\>(\<b-z\><rsub|n>)> and
  <math|\<xi\>(\<b-z\><rsub|n\<minus\>1>,\<b-z\><rsub|n>)>. At this stage, we
  can also evaluate the likelihood function.

  This completes the E step, and we use the results to find a revised set of
  parameters <math|\<b-theta\><rsup|new>> using the M-step equations from
  Section <reference|sec13.2.1>. We then continue to alternate between E and
  M steps until some convergence criterion is satisfied, for instance when
  the change in the likelihood function is below some threshold.

  Note that in these recursion relations the observations enter through
  conditional distributions of the form <math|p(\<b-x\><rsub|n>\|\<b-z\><rsub|n>)>.
  The recursions are therefore independent of the type or dimensionality of
  the observed variables or the form of this conditional distribution, so
  long as its value can be computed for each of the <math|K> possible states
  of <math|\<b-z\><rsub|n>>. Since the observed variables
  <math|{\<b-x\><rsub|n>}> are fixed, the quantities
  <math|p(\<b-x\><rsub|n>\|\<b-z\><rsub|n>)> can be pre-computed as functions
  of <math|\<b-z\><rsub|n>> at the start of the EM algorithm, and remain
  fixed throughout.

  We have seen in earlier chapters that the maximum likelihood approach is
  most effective when the number of data points is large in relation to the
  number of parameters. Here we note that a hidden Markov model can be
  trained effectively, using maximum likelihood, provided the training
  sequence is sufficiently long. Alternatively, we can make use of multiple
  shorter sequences, which requires a straightforward modification of the
  hidden Markov model EM algorithm. In the case of left-to-right models, this
  is particularly important because, in a given observation sequence, a given
  state transition corresponding to a nondiagonal element of A will seen at
  most once.

  Another quantity of interest is the predictive distribution, in which the
  observed data is <math|X={\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>}> and
  we wish to predict <math|\<b-x\><rsub|N+1>>, which would be important for
  real-time applications such as financial forecasting. Again we make use of
  the sum and product rules together with the conditional independence
  properties <eqref|13.29> and <eqref|13.31> giving

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|x<rsub|N+1>\|X|)>>|<cell|=>|<cell|<big|sum><rsub|\<b-z\><rsub|N+1>>p<around*|(|\<b-x\><rsub|N+1>,\<b-z\><rsub|N+1>\|X|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|\<b-z\><rsub|N+1>>p<around*|(|\<b-x\><rsub|N+1>\|\<b-z\><rsub|N+1>|)>p<around*|(|\<b-z\><rsub|N+1>\|X|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|\<b-z\><rsub|N+1>>p<around*|(|\<b-x\><rsub|N+1>\|\<b-z\><rsub|N+1>|)><big|sum><rsub|\<b-z\><rsub|N>>p<around*|(|\<b-z\><rsub|N+1>,\<b-z\><rsub|N>\|X|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|\<b-z\><rsub|N+1>>p<around*|(|\<b-x\><rsub|N+1>\|\<b-z\><rsub|N+1>|)><big|sum><rsub|\<b-z\><rsub|N>>p<around*|(|\<b-z\><rsub|N+1>\|\<b-z\><rsub|N>|)>p<around*|(|\<b-z\><rsub|N>\|X|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|\<b-z\><rsub|N+1>>p<around*|(|\<b-x\><rsub|N+1>\|\<b-z\><rsub|N+1>|)><big|sum><rsub|\<b-z\><rsub|N>>p<around*|(|\<b-z\><rsub|N+1>\|\<b-z\><rsub|N>|)><frac|p<around*|(|\<b-z\><rsub|N>,X|)>|p<around*|(|X|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|p<around*|(|X|)>><big|sum><rsub|\<b-z\><rsub|N+1>>p<around*|(|\<b-x\><rsub|N+1>\|\<b-z\><rsub|N+1>|)><big|sum><rsub|\<b-z\><rsub|N>>p<around*|(|\<b-z\><rsub|N+1>\|\<b-z\><rsub|N>|)>\<alpha\><around*|(|\<b-z\><rsub|N>|)><eq-number><label|13.44>>>>>
  </eqnarray*>

  which can be evaluated by first running a forward <math|\<alpha\>>
  recursion and then computing the final summations over
  <math|\<b-z\><rsub|N>> and <math|\<b-z\><rsub|N+1>>. The result of the
  first summation over <math|\<b-z\><rsub|N>> can be stored and used once the
  value of <math|\<b-x\><rsub|N+1>> is observed in order to run the
  <math|\<alpha\>> recursion forward to the next step in order to predict the
  subsequent value <math|\<b-x\><rsub|N+2>>.

  Note that in <eqref|13.44>, the influence of all data from
  <math|\<b-x\><rsub|1>> to <math|\<b-x\><rsub|N>> is summarized in the
  <math|K> values of <math|\<alpha\>(\<b-z\><rsub|N>)>. Thus the predictive
  distribution can be carried forward indefinitely using a fixed amount of
  storage, as may be required for real-time applications.

  Here we have discussed the estimation of the parameters of an HMM using
  maximum likelihood. This framework is easily extended to regularized
  maximum likelihood by introducing priors over the model parameters
  <math|\<b-pi\>>, <math|A> and <math|\<b-varphi\>> whose values are then
  estimated by maximizing their posterior probability. This can again be done
  using the EM algorithm in which the E step is the same as discussed above,
  and the M step involves adding the log of the prior distribution
  <math|p(\<b-theta\>)> to the function <math|Q(\<b-theta\>,\<b-theta\><rsup|old>)>
  before maximization and represents a straightforward application of the
  techniques developed at various points in this book. Furthermore, we can
  use variational methods to give a fully Bayesian treatment of the HMM in
  which we marginalize over the \ parameter distributions (MacKay, 1997). As
  with maximum likelihood, this leads to a two-pass forward-backward
  recursion to compute posterior probabilities.

  <subsection|The sum-product algorithm for the HMM><label|sec13.2.3>

  \;

  The directed graph that represents the hidden Markov model, shown in Figure
  <reference|fig13.5>, is a tree and so we can solve the problem of finding
  local marginals for the hidden variables using the sum-product algorithm.
  Not surprisingly, this turns out to \ be equivalent to the forward-backward
  algorithm considered in the previous section, and so the sum-product
  algorithm therefore provides us with a simple way to derive the alpha-beta
  recursion formulae.

  We begin by transforming the directed graph of Figure <reference|fig13.5>
  into a factor graph, of which a representative fragment is shown in Figure
  <reference|fig13.14>. This form of the factor graph shows all variables,
  both latent and observed, explicitly.\ 

  <\padded-center>
    <small-figure|<image|image/fig_13_14_factor_graph_hmm.png|.5par|||>|<label|fig13.14>A
    fragment of the factor graph representation for the hidden Markov model.>
  </padded-center>

  However, for the purpose of solving the inference problem, we shall always
  be conditioning on the variables <math|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>>,
  and so we can simplify the factor graph by absorbing the emission
  probabilities into the transition probability factors. This leads to the
  simplified factor graph representation in Figure <reference|fig13.15>, in
  which the factors are given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|h<around*|(|\<b-z\><rsub|1>|)>>|<cell|=>|<cell|p<around*|(|\<b-z\><rsub|1>|)>p<around*|(|\<b-x\><rsub|1>\|\<b-z\><rsub|1>|)><eq-number><label|13.45>>>|<row|<cell|f<rsub|n><around*|(|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-z\><rsub|n>\|\<b-z\><rsub|n-1>|)>p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)><eq-number><label|13.46>>>>>
  </eqnarray*>

  \;

  <\padded-center>
    <small-figure|<image|image/fig_13_15_simplified_factor_graph_hmm.png|.5par|||>|<label|fig13.15>A
    simplified form of factor graph to describe the hidden Markov model.>
  </padded-center>

  To derive the alpha-beta algorithm, we denote the final hidden variable
  <math|\<b-z\><rsub|N>> as the root node, and first pass messages from the
  leaf node <math|h> to the root. From the general results (8.66) and (8.69)
  for message propagation, we see that the messages which are propagated in
  the hidden Markov model take the form

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<mu\><rsub|\<b-z\><rsub|n-1>\<rightarrow\>f<rsub|n>><around*|(|\<b-z\><rsub|n-1>|)>>|<cell|=>|<cell|\<mu\><rsub|f<rsub|n-1>\<rightarrow\>\<b-z\><rsub|n-1>><around*|(|\<b-z\><rsub|n-1>|)><eq-number><label|13.47>>>|<row|<cell|\<mu\><rsub|f<rsub|n>-\<b-z\><rsub|n>><around*|(|\<b-z\><rsub|n>|)>>|<cell|=>|<cell|<big|sum><rsub|\<b-z\><rsub|n-1>>f<rsub|n><around*|(|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>|)>\<mu\><rsub|z<rsub|n-1>\<rightarrow\>f<rsub|n><around*|(|\<b-z\><rsub|n-1>|)>><eq-number><label|13.48>>>>>
  </eqnarray*>

  These equations represent the propagation of messages forward along the
  chain and are equivalent to the alpha recursions derived in the previous
  section, as we shall now show. Note that because the variable nodes
  <math|\<b-z\><rsub|n>> have only two neighbours, they perform no
  computation.

  We can eliminate<math| \<mu\><rsub|\<b-z\><rsub|n\<minus\>1>\<rightarrow\>f<rsub|n>>
  (\<b-z\><rsub|n\<minus\>1>)> from <eqref|13.48> using <eqref|13.47> to give
  a recursion for the <math|f\<rightarrow\>\<b-z\>> messages of the form

  <\equation*>
    \<mu\><rsub|f<rsub|n>\<rightarrow\>\<b-z\><rsub|n>><around*|(|\<b-z\><rsub|n>|)>=<big|sum><rsub|\<b-z\><rsub|n-1>>f<rsub|n><around*|(|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>|)>\<mu\><rsub|f<rsub|n-1>\<rightarrow\>\<b-z\><rsub|n-1>><around*|(|\<b-z\><rsub|n-1>|)>
  </equation*>

  If we now recall the definition <eqref|13.46>, and if we define

  <\equation*>
    \<alpha\><around*|(|\<b-z\><rsub|n>|)>=\<mu\><rsub|f<rsub|n>\<rightarrow\>\<b-z\><rsub|n>><around*|(|\<b-z\><rsub|n>|)>
  </equation*>

  then we obtain the alpha recursion given by <eqref|13.36>. We also need to
  verify that the quantities <math|\<alpha\>(\<b-z\><rsub|n>)> are themselves
  equivalent to those defined previously. This is easily done by using the
  initial condition (8.71) and noting that <math|\<alpha\>(\<b-z\><rsub|1>)>
  is given by <math|h(\<b-z\><rsub|1>)=p(\<b-z\><rsub|1>)p(\<b-x\><rsub|1>\|\<b-z\><rsub|1>)>
  which is identical to <eqref|13.37>. Because the initial <math|\<alpha\>>
  is the same, and because they are iteratively computed using the same
  equation, all subsequent <math|\<alpha\>> quantities must be the same.

  Next we consider the messages that are propagated from the root node back
  to the leaf node. These take the form

  <\equation*>
    \<mu\><rsub|f<rsub|n+1>\<rightarrow\>f<rsub|n>><around*|(|\<b-z\><rsub|n>|)>=<big|sum><rsub|\<b-z\><rsub|n+1>>f<rsub|n+1><around*|(|\<b-z\><rsub|n>,\<b-z\><rsub|n+1>|)>\<mu\><rsub|f<rsub|n+2>\<rightarrow\>f<rsub|n+1>><around*|(|\<b-z\><rsub|n+1>|)>
  </equation*>

  where, as before, we have eliminated the messages of the type
  <math|z\<rightarrow\>f> since the variable nodes perform no computation.
  Using the definition <eqref|13.46> to substitute for
  <math|f<rsub|n+1>(\<b-z\><rsub|n>,\<b-z\><rsub|n+1>)>, and defining

  <\equation*>
    \<beta\><around*|(|\<b-z\><rsub|n>|)>=\<mu\><rsub|f<rsub|n+1>\<rightarrow\>\<b-z\><rsub|n>><around*|(|\<b-z\><rsub|n>|)>
  </equation*>

  we obtain the beta recursion given by Eq. <eqref|13.38>. Again, we can
  verify that the beta variables themselves are equivalent by noting that
  (8.70) implies that the initial message send by the root variable node is
  <math|\<mu\><rsub|\<b-z\><rsub|N>\<rightarrow\>f<rsub|N>>(\<b-z\><rsub|N>)=1>,
  which is identical to the initialization of
  <math|\<beta\>(\<b-z\><rsub|N>)> given in Section <reference|sec13.2.2>.

  The sum-product algorithm also specifies how to evaluate the marginals once
  all the messages have been evaluated. In particular, the result (8.63)
  shows that the local marginal at the node <math|\<b-z\><rsub|n>> is given
  by the product of the incoming messages. Because we have conditioned on the
  variables <math|X=<around*|{|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>|}>>,
  we are computing the joint distribution

  <\equation*>
    p<around*|(|\<b-z\><rsub|n>,X|)>=\<mu\><rsub|f<rsub|n>\<rightarrow\>\<b-z\><rsub|n>><around*|(|\<b-z\><rsub|n>|)>\<mu\><rsub|f<rsub|n+1>\<rightarrow\>\<b-z\><rsub|n>><around*|(|\<b-z\><rsub|n>|)>=\<alpha\><around*|(|\<b-z\><rsub|n>|)>\<beta\><around*|(|\<b-z\><rsub|n>|)>
  </equation*>

  Dividing both sides by <math|p(X)>, we then obtain

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<gamma\><around*|(|\<b-z\><rsub|n>|)>>|<cell|=>|<cell|<frac|p<around*|(|\<b-z\><rsub|n>,X|)>|p<around*|(|X|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<alpha\><around*|(|\<b-z\><rsub|n>|)>\<beta\><around*|(|\<b-z\><rsub|n>|)>|p<around*|(|X|)>>>>>>
  </eqnarray*>

  in agreement with Eq. <eqref|13.33>. The result <eqref|13.43> can similarly
  be derived from (8.72).

  <subsection|Scaling factors>

  \;

  There is an important issue that must be addressed before we can make use
  of the forward backward algorithm in practice. From the recursion relation
  Eq. <eqref|13.36>, we note that at each step the new value
  <math|\<alpha\>(\<b-z\><rsub|n>)> is obtained from the previous value
  <math|\<alpha\>(\<b-z\><rsub|n\<minus\>1>)> by multiplying by quantities
  <math|p(\<b-z\><rsub|n>\|\<b-z\><rsub|n\<minus\>1>)> and
  <math|p(\<b-x\><rsub|n>\|\<b-z\><rsub|n>)>. Because these probabilities are
  often significantly less than unity, as we work our way forward along the
  chain, the values of <math|\<alpha\>(\<b-z\><rsub|n>)> can go to zero
  exponentially quickly. For moderate lengths of chain (say 100 or so), the
  calculation of the <math|\<alpha\>(\<b-z\><rsub|n>)> will soon exceed the
  dynamic range of the computer, even if double precision floating point is
  used.

  In the case of i.i.d. data, we implicitly circumvented this problem with
  the evaluation of likelihood functions by taking logarithms. Unfortunately,
  this will not help here because we are forming sums of products of small
  numbers (we are in fact implicitly summing over all possible paths through
  the lattice diagram of Figure <reference|fig13.7>. We therefore work with
  re-scaled versions of <math|\<alpha\>(\<b-z\><rsub|n>)> and
  <math|\<beta\>(\<b-z\><rsub|n>)> whose values remain of order unity. As we
  shall see, the corresponding scaling factors cancel out when we use these
  re-scaled quantities in the EM algorithm.

  In Eq. <eqref|13.34>, we defined <math|\<alpha\>(\<b-z\><rsub|n>)=p(\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>,\<b-z\><rsub|n>)>
  representing the joint distribution of all the observations up to
  <math|\<b-x\><rsub|n>> and the latent variable <math|\<b-z\><rsub|n>>. Now
  we define a normalized version of <math|\<alpha\>> given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|<wide|\<alpha\>|^><around*|(|\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-z\><rsub|n>\|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<alpha\><around*|(|\<b-z\><rsub|n>|)>|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>|)>>>>>>
  </eqnarray*>

  which we expect to be well behaved numerically because it is a probability
  distribution over <math|K> variables for any value of n. In order to relate
  the scaled and original alpha variables, we introduce scaling factors
  defined by conditional distributions over the observed variables

  <\equation*>
    c<rsub|n>=p<around*|(|\<b-x\><rsub|n>\|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>|)>
  </equation*>

  From the product rule, we then have

  <\equation>
    p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>|)>=<big|prod><rsub|m=1><rsup|n>c<rsub|m><label|13.57>
  </equation>

  and so

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<alpha\><around*|(|\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-z\><rsub|n>\|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>|)>p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>|)>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|<big|prod><rsub|m=1><rsup|n>c<rsub|m>|)><wide|\<alpha\>|^><around*|(|\<b-z\><rsub|n>|)>>>>>
  </eqnarray*>

  We can then turn the recursion equation <eqref|13.36> for <math|\<alpha\>>
  into one for <math|<wide|\<alpha\>|^>> given by

  <\equation>
    c<rsub|n><wide|\<alpha\>|^><around*|(|\<b-z\><rsub|n>|)>=p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)><big|sum><rsub|\<b-z\><rsub|n-1>><wide|\<alpha\>|^><around*|(|\<b-z\><rsub|n-1>|)>p<around*|(|\<b-z\><rsub|n>\|\<b-z\><rsub|n-1>|)><label|13.59>
  </equation>

  Note that at each stage of the forward message passing phase, used to
  evaluate <math|\<alpha\>(\<b-z\><rsub|n>)>, we have to evaluate and store
  <math|c<rsub|n>>, which is easily done because it is the coefficient that
  normalizes the right-hand side of Eq. <eqref|13.59> to give
  <math|<wide|\<alpha\>|^>(\<b-z\><rsub|n>)>.

  We can similarly define re-scaled variables
  <math|<wide|\<beta\>|^>(\<b-z\><rsub|n>)> using

  <\equation*>
    \<beta\><around*|(|\<b-z\><rsub|n>|)>=<around*|(|<big|prod><rsub|m=n+1><rsup|N>c<rsub|m>|)><wide|\<beta\>|^><around*|(|\<b-z\><rsub|n>|)>
  </equation*>

  which will again remain within machine precision because, from Eq.
  <eqref|13.35>, the quantities <math|<wide|\<beta\>|^>(\<b-z\><rsub|n>)> are
  simply the ratio of two conditional probabilities

  <\equation*>
    <wide|\<beta\>|^><around*|(|\<b-z\><rsub|n>|)>=<frac|p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n>|)>|p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|N>\|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>|)>>
  </equation*>

  The recursion result <eqref|13.38> for <math|\<beta\>> then gives the
  following recursion for the re-scaled variables

  <\equation*>
    c<rsub|n+1><wide|\<beta\>|^><around*|(|\<b-z\><rsub|n>|)>=<big|sum><rsub|\<b-z\><rsub|n+1>><wide|\<beta\>|^><around*|(|\<b-z\><rsub|n+1>|)>p<around*|(|\<b-x\><rsub|n+1>\|\<b-z\><rsub|n+1>|)>p<around*|(|\<b-z\><rsub|n+1>\|\<b-z\><rsub|n>|)>
  </equation*>

  In applying this recursion relation, we make use of the scaling factors
  <math|c<rsub|n>> that were previously computed in the <math|\<alpha\>>
  phase.

  From Eq. <eqref|13.57>, we see that the likelihood function can be found
  using

  <\equation>
    p<around*|(|X|)>=<big|prod><rsub|n=1><rsup|N>c<rsub|n><label|13.63>
  </equation>

  Similarly, using Eq. <eqref|13.33> and <eqref|13.43>, together with Eq.
  <eqref|13.63>, we see that the required \ marginals are given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<gamma\><around*|(|\<b-z\><rsub|n>|)>>|<cell|=>|<cell|<wide|\<alpha\>|^><around*|(|\<b-z\><rsub|n>|)><wide|\<beta\>|^><around*|(|\<b-z\><rsub|n>|)>>>|<row|<cell|\<xi\><around*|(|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>|)>>|<cell|=>|<cell|c<rsub|n><rsup|-1><wide|\<alpha\>|^><around*|(|\<b-z\><rsub|n-1>|)>p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)>p<around*|(|\<b-z\><rsub|n>\|\<b-z\><rsub|n-1>|)><wide|\<beta\>|^><around*|(|\<b-z\><rsub|n>|)>>>>>
  </eqnarray*>

  \;

  Finally, we note that there is an alternative formulation of the
  forward-backward algorithm (Jordan, 2007) in which the backward pass is
  defined by a recursion based on the quantities
  <math|\<gamma\><around*|(|\<b-z\><rsub|n>|)>=<wide|\<alpha\>|^>(\<b-z\><rsub|n>)<wide|\<beta\>|^>(\<b-z\><rsub|n>)>
  instead of using <math|<wide|\<beta\>|^>(\<b-z\><rsub|n>)>. This
  <math|\<alpha\>\U\<gamma\>> recursion requires that the forward pass be
  completed first so that all the quantities
  <math|<wide|\<alpha\>|^>(\<b-z\><rsub|n>)> are available for the backward
  pass, whereas the forward and backward passes of the
  <math|\<alpha\>\U\<beta\>> algorithm can be done independently. Although
  these two algorithms have comparable computational cost, the
  <math|\<alpha\>\U\<beta\>> version is the most commonly encountered one in
  the case of hidden Markov models, whereas for linear dynamical systems a
  \ recursion analogous to the <math|\<alpha\>\U\<gamma\>> form is more
  usual.

  <subsection|The Viterbi algorithm>

  \;

  In many applications of hidden Markov models, the latent variables have
  some meaningful interpretation, and so it is often of interest to find the
  most probable sequence of hidden states for a given observation sequence.
  For instance in speech recognition, we might wish to find the most probable
  phoneme sequence for a given series of acoustic observations. Because the
  graph for the hidden Markov model is a directed tree, this problem can be
  solved exactly using the max-sum algorithm. We recall from our discussion
  in Section 8.4.5 that the problem of finding the most probable sequence of
  latent states is not the same as that of finding the set of states that are
  individually the most probable. The latter problem can be solved by first
  running the forward-backward (sum-product) algorithm to find the latent
  variable marginals <math|\<gamma\>(\<b-z\><rsub|n>)> and then maximizing
  each of these individually (Duda et al., 2001). However, the set of such
  states will not, in general, correspond to the most probable sequence of
  states. In fact, this set of states might even represent a sequence having
  zero probability, if it so happens that two successive states, which in
  isolation are individually the most probable, are such that the transition
  matrix element connecting them is zero.

  In practice, we are usually interested in finding the most probable
  sequence of states, and this can be solved efficiently using the max-sum
  algorithm, which in the context of hidden Markov models is known as the
  Viterbi algorithm (Viterbi, 1967). Note that the max-sum algorithm works
  with log probabilities and so there is no need to use re-scaled variables
  as was done with the forward-backward algorithm. Figure
  <reference|fig13.16> shows a fragment of the hidden Markov model expanded
  as lattice diagram. As we have already noted, the number of possible paths
  through the lattice grows exponentially with the length of the chain. The
  Viterbi algorithm searches this space of paths efficiently to find the most
  probable path with a computational cost that grows only linearly with the
  length of the chain.

  <\padded-center>
    <small-figure|<image|image/fig_13_16_hmm_fragment_2_path.png|.3par|||>|<label|fig13.16>A
    fragment of the HMM lattice showing two possible paths. The Viterbi
    algorithm efficiently determines the most probable path from amongst the
    exponentially many possibilities. For any given path, the corresponding
    probability is given by the product of the elements of the transition
    matrix <math|A<rsub|j k>>, corresponding to the probabilities
    <math|p(\<b-z\><rsub|n+1>\|\<b-z\><rsub|n>)> for each segment of the
    path, along with the emission densities <math|p(\<b-x\><rsub|n>\|k)>
    associated with each node on the path.>
  </padded-center>

  As with the sum-product algorithm, we first represent the hidden Markov
  model as a factor graph, as shown in Figure <reference|fig13.15>. Again, we
  treat the variable node <math|\<b-z\><rsub|N>> as the root, and pass
  messages to the root starting with the leaf nodes. Using the results (8.93)
  and (8.94), we see that the messages passed in the max-sum algorithm are
  given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<mu\><rsub|\<b-z\><rsub|n>\<rightarrow\>f<rsub|n+1>><around*|(|\<b-z\><rsub|n>|)>>|<cell|=>|<cell|\<mu\><rsub|f<rsub|n>\<rightarrow\>\<b-z\><rsub|n>><around*|(|\<b-z\><rsub|n>|)>>>|<row|<cell|\<mu\><rsub|f<rsub|n+1>\<rightarrow\>\<b-z\><rsub|n+1>><around*|(|\<b-z\><rsub|n+1>|)>>|<cell|=>|<cell|max<rsub|\<b-z\><rsub|n>><around*|{|ln
    f<rsub|n+1><around*|(|\<b-z\><rsub|n>,\<b-z\><rsub|n+1>|)>+\<mu\><rsub|\<b-z\><rsub|n>\<rightarrow\>f<rsub|n+1>><around*|(|\<b-z\><rsub|n>|)>|}>>>>>
  </eqnarray*>

  If we eliminate <math|\<mu\><rsub|\<b-z\><rsub|n>\<rightarrow\>f<rsub|n+1>>(\<b-z\><rsub|n>)>
  between these two equations, and make use of Eq. <eqref|13.46>, we obtain a
  recursion for the <math|f\<rightarrow\>z> messages of the form

  <\equation*>
    w<around*|(|\<b-z\><rsub|n+1>|)>=ln p<around*|(|\<b-x\><rsub|n+1>\|\<b-z\><rsub|n+1>|)>+max<rsub|z<rsub|n>><around*|{|ln
    p<around*|(|\<b-z\><rsub|n+1>\|\<b-z\><rsub|n>|)>+w<around*|(|\<b-z\><rsub|n>|)>|}>
  </equation*>

  where we have introduced the notation <math|\<omega\>(\<b-z\><rsub|n>)\<equiv\>\<mu\><rsub|f<rsub|n>\<rightarrow\>\<b-z\><rsub|n>>(\<b-z\><rsub|n>)>.

  From (8.95) and (8.96), these messages are initialized using

  <\equation*>
    w<around*|(|\<b-z\><rsub|1>|)>=ln p<around*|(|\<b-z\><rsub|1>|)>+ln
    p<around*|(|\<b-x\><rsub|1>\|\<b-z\><rsub|1>|)>
  </equation*>

  where we have used Eq. <eqref|13.45>. Note that to keep the notation
  uncluttered, we omit the dependence on the model parameters
  <math|\<b-theta\>> that are held fixed when finding the most probable
  sequence.

  The Viterbi algorithm can also be derived directly from the definition
  <eqref|13.6> of the joint distribution by taking the logarithm and then
  exchanging maximizations and summations. It is easily seen that the
  quantities <math|\<omega\>(\<b-z\><rsub|n>)> have the probabilistic
  \ interpretation

  <\equation*>
    w<around*|(|\<b-z\><rsub|n>|)>=max<rsub|\<b-z\><rsub|1>,\<cdots\>,\<b-z\><rsub|n-1>>ln
    p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>,\<b-z\><rsub|1>,\<cdots\>,\<b-z\><rsub|n>|)>
  </equation*>

  \;

  Once we have completed the final maximization over <math|\<b-z\><rsub|N>> ,
  we will obtain the value of the joint distribution <math|p(X,Z)>
  corresponding to the most probable path. We also wish to find the sequence
  of latent variable values that corresponds to this path. To do this, we
  simply make use of the back-tracking procedure discussed in Section 8.4.5.
  Specifically, we note that the maximization over <math|\<b-z\><rsub|n>>
  must be performed for each of the <math|K> possible values of
  <math|\<b-z\><rsub|n+1>>. Suppose we keep a record of the values of
  <math|\<b-z\><rsub|n>> that correspond to the maxima for each value of the
  <math|K> values of <math|\<b-z\><rsub|n+1>>. Let us denote this function by
  <math|\<psi\>(k<rsub|n>)> where <math|k\<in\>{1,\<cdots\>,K}>. Once we have
  passed messages to the end of the chain and found the most probable state
  of <math|\<b-z\><rsub|N>> , we can then use this function to backtrack
  along the chain by applying it recursively

  <\equation*>
    k<rsub|n-1><rsup|max>=\<psi\><around*|(|k<rsub|n><rsup|max>|)>
  </equation*>

  \;

  Intuitively, we can understand the Viterbi algorithm as follows. Naively,
  we could consider explicitly all of the exponentially many paths through
  the lattice, evaluate the probability for each, and then select the path
  having the highest probability. However, we notice that we can make a
  dramatic saving in computational cost as follows. Suppose that for each
  path we evaluate its probability by summing up products of transition and
  emission probabilities as we work our way forward along each path through
  the lattice. Consider a particular time step <math|n> and a particular
  state <math|k> at that time step. There will be many possible paths
  converging on the corresponding node in the lattice diagram. However, we
  need only retain that particular path that so far has the highest
  probability. Because there are <math|K> states at time step <math|n>, we
  need to keep track of <math|K> such paths. At time step <math|n+1>, there
  will be <math|K<rsup|2>> possible paths to consider, comprising <math|K>
  possible paths leading out of each of the <math|K> current states, but
  again we need only retain <math|K> of these corresponding to the best path
  for each state at time <math|n+1>. When we reach the final time step
  <math|N> we will discover which state corresponds to the overall most
  probable path. Because there is a unique path coming into that state we can
  trace the path back to step <math|N\<minus\>1> to see what state it
  occupied at that time, and so on back through the lattice to the state
  <math|n=1>.

  <subsection|Extensions of the hidden Markov model>

  \;

  The basic hidden Markov model, along with the standard training algorithm
  based on maximum likelihood, has been extended in numerous ways to meet the
  requirements of particular applications. Here we discuss a few of the more
  important examples.

  We see from the digits example in Figure <reference|fig13.11> that hidden
  Markov models can be quite poor generative models for the data, because
  many of the synthetic digits look quite unrepresentative of the training
  data. If the goal is sequence classification, there can be significant
  benefit in determining the parameters of hidden Markov models using
  discriminative rather than maximum likelihood techniques. Suppose we have a
  training set of <math|R> observation sequences <math|X<rsub|r>>, where
  <math|r=1,\<cdots\>,R>, each of which is labelled according to its class
  <math|m>, where <math|m=1,\<cdots\>,M>. For each class, we have a separate
  hidden Markov model with its own parameters <math|\<b-theta\><rsub|m>>, and
  we treat the problem of determining the parameter values as a standard
  classification problem in which we optimize the cross-entropy

  <\equation*>
    <big|sum><rsub|r=1><rsup|R>ln p<around*|(|m<rsub|r>\|X<rsub|r>|)>.
  </equation*>

  Using Bayes' theorem this can be expressed in terms of the sequence
  probabilities associated with the hidden Markov models

  <\equation>
    <big|sum><rsub|r=1><rsup|R>ln<around*|{|<frac|p<around*|(|X<rsub|r><around*|\||\<b-theta\><rsub|r>|\<nobracket\>>|)>p<around*|(|m<rsub|r>|)>|<big|sum><rsub|l=1><rsup|M>p<around*|(|X<rsub|r>\|\<b-theta\><rsub|l>|)>p<around*|(|l<rsub|r>|)>>|}><label|13.73>
  </equation>

  where <math|p(m)> is the prior probability of class <math|m>. Optimization
  of this cost function is more complex than for maximum likelihood (Kapadia,
  1998), and in particular requires that every training sequence be evaluated
  under each of the models in order to compute the denominator in Eq.
  <eqref|13.73>. Hidden Markov models, coupled with discriminative training
  methods, are widely used in speech recognition (Kapadia, 1998).

  A significant weakness of the hidden Markov model is the way in which it
  represents the distribution of times for which the system remains in a
  given state. To see the problem, note that the probability that a sequence
  sampled from a given hidden Markov model will spend precisely <math|T>
  steps in state <math|k> and then make a transition to a different state is
  given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|T|)>>|<cell|=>|<cell|<around*|(|A<rsub|k
    k>|)><rsup|T><around*|(|1-A<rsub|k k>|)>>>|<row|<cell|>|<cell|\<propto\>>|<cell|exp<around*|(|T
    ln A<rsub|k k>|)>>>>>
  </eqnarray*>

  and so is an exponentially decaying function of <math|T> . For many
  applications, this will be a very unrealistic model of state duration. The
  problem can be resolved by modelling state duration directly in which the
  diagonal coefficients <math|A<rsub|k k>> are all set to zero, and each
  state <math|k> is explicitly associated with a probability distribution
  <math|p(T\|k)> of possible duration times. From a generative point of view,
  when a state <math|k> is entered, a value <math|T> representing the number
  of time steps that the system will remain in state <math|k> is then drawn
  from <math|p(T\|k)>. The model then emits <math|T> values of the observed
  variable <math|\<b-x\><rsub|t>>, which are generally assumed to be
  independent so that the corresponding emission density is simply
  <math|<big|prod><rsub|t=1><rsup|T>p(\<b-x\><rsub|t>\|k)>. This approach
  requires some straightforward \ modifications to the EM optimization
  procedure (Rabiner, 1989).

  Another limitation of the standard HMM is that it is poor at capturing
  longrange correlations between the observed variables (i.e., between
  variables that are separated by many time steps) because these must be
  mediated via the first-order Markov chain of hidden states. Longer-range
  effects could in principle be included by adding extra links to the
  graphical model of Figure <reference|fig13.5>. One way to address this is
  to generalize the HMM to give the <em|autoregressive hidden Markov model>
  (Ephraim et al., 1989), an example of which is shown in Figure
  <inactive|<reference|fig13.17>>. For discrete observations, this
  corresponds to expanded tables of conditional probabilities for the
  emission distributions. In the case of a Gaussian emission density, we can
  use the linearGaussian framework in which the conditional distribution for
  <math|\<b-x\><rsub|n>> given the values of the previous observations, and
  the value of <math|\<b-z\><rsub|n>>, is a Gaussian whose mean is a linear
  combination of the values of the conditioning variables. Clearly the number
  of additional links in the graph must be limited to avoid an excessive the
  number of free parameters. In the example shown in Figure
  <inactive|<reference|fig13.17>>, each observation depends on the two
  preceding observed variables as well as on the hidden state. Although this
  graph looks messy, we can again appeal to d-separation to see that in fact
  it still has a simple probabilistic structure. In particular, if we imagine
  conditioning on zn we see that, as with the standard HMM, the values of
  <math|\<b-z\><rsub|n\<minus\>1>> and <math|\<b-z\><rsub|n+1>> are
  independent, corresponding to the conditional independence property
  <eqref|13.5>. This is easily verified by noting that every path from node
  <math|\<b-z\><rsub|n\<minus\>1>> to node <math|\<b-z\><rsub|n+1>> passes
  through at least one observed node that is head-to-tail with respect to
  that path. As a consequence, we can again use a forward-backward recursion
  in the E step of the EM algorithm to determine the posterior distributions
  of the latent variables in a computational time that is linear in the
  length of the chain. Similarly, the M step involves only a minor
  modification of the standard M-step equations. In the case of Gaussian
  emission densities this involves estimating the parameters using the
  standard linear regression equations, discussed in Chapter 3.

  <\padded-center>
    <small-figure|<image|image/fig_13_17_autoregressive_hmm.png|.3par|||>|<label|fig13.17>Section
    of an autoregressive hidden Markov model, in which the distribution of
    the observation <math|\<b-x\><rsub|n>> depends on a subset of the
    previous observations as well as on the hidden state
    <math|\<b-z\><rsub|n>>. In this example, the distribution of
    <math|\<b-x\><rsub|n>> depends on the two previous observations
    <math|\<b-x\><rsub|n\<minus\>1>> and <math|\<b-x\><rsub|n\<minus\>2>>.>
  </padded-center>

  We have seen that the autoregressive HMM appears as a natural extension of
  the standard HMM when viewed as a graphical model. In fact the
  probabilistic graphical modelling viewpoint motivates a plethora of
  different graphical structures based on the HMM. Another example is the
  <em|input-output> hidden Markov model (Bengio and Frasconi, 1995), in which
  we have a sequence of observed variables
  <math|\<b-u\><rsub|1>,\<cdots\>,\<b-u\><rsub|N>>, in addition to the output
  variables <math|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>>, whose values
  influence either the distribution of latent variables or output variables,
  or both. An example is shown in Figure <reference|fig13.18>. This extends
  the HMM framework to the domain of supervised learning for sequential data.
  It is again easy to show, through the use of the d-separation criterion,
  that the Markov property <eqref|13.5> for the chain of latent variables
  still holds. To verify this, simply note that there is only one path from
  node <math|\<b-z\><rsub|n\<minus\>1>> to node <math|\<b-z\><rsub|n+1>> and
  this is head-to-tail with respect to the observed node
  <math|\<b-z\><rsub|n>>. This conditional independence property again allows
  the formulation of a computationally efficient learning algorithm. In
  particular, we can determine the parameters <math|\<b-theta\>> of the model
  by maximizing the likelihood function <math|L(\<b-theta\>)=p(X\|U,\<b-theta\>)>
  where <math|U> is a matrix whose rows are given by
  <math|\<b-u\><rsub|n><rsup|T>>. As a consequence of the conditional
  independence property <eqref|13.5> this likelihood function can be
  maximized efficiently using an EM algorithm in which the E step involves
  forward and backward recursions.

  <\padded-center>
    <small-figure|<image|image/fig_13_18_input_output_hmm.png|.3par|||>|<label|fig13.18>Example
    of an input-output hidden \ Markov model. In this case, both the emission
    probabilities and the transition probabilities depend on the values of a
    sequence of observations <math|\<b-u\><rsub|1>,\<cdots\>,\<b-u\><rsub|N>>.>

    \;
  </padded-center>

  Another variant of the HMM worthy of mention is the <em|factorial hidden
  Markov model> (Ghahramani and Jordan, 1997), in which there are multiple
  independent Markov chains of latent variables, and the distribution of the
  observed variable at a given time step is conditional on the states of all
  of the corresponding latent variables at that same time step. Figure
  <inactive|<hybrid|ref|fig13.19>> shows the corresponding graphical model.
  The motivation for considering factorial HMM can be seen by noting that in
  order to represent, say, 10 bits of information at a given time step, a
  standard HMM would need <math|K=2<rsup|10>=1024> latent states, whereas a
  factorial HMM could make use of 10 binary latent chains.\ 

  <\padded-center>
    <small-figure|<image|image/fig_13_19_factorial_hmm.png|.3par|||>|<label|fig13.19>A
    factorial hidden Markov model comprising two Markov chains of latent
    variables. For continuous observed variables <math|\<b-x\>>, one possible
    choice of emission model is a linear-Gaussian density in which the mean
    of the Gaussian is a linear combination of the states of the
    corresponding latent variables.>
  </padded-center>

  The primary disadvantage of factorial HMMs, however, lies in the additional
  complexity of training them. The M step for the factorial HMM model is
  straightforward. However, observation of the <math|\<b-x\>> variables
  introduces dependencies between the latent chains, leading to difficulties
  with the E step. This can be seen by noting that in Figure
  <reference|fig13.19>, the variables <math|\<b-z\><rsup|(n1)>> and
  <math|\<b-z\><rsup|(n2)>> are connected by a path which is head-to-head at
  node <math|\<b-x\><rsub|n>> and hence they are not d-separated. The exact E
  step for this model does not correspond to running forward and backward
  recursions along the M Markov chains independently. This is confirmed by
  noting that the key conditional independence property <eqref|13.5> is not
  satisfied for the individual Markov chains in the factorial HMM model, as
  is shown using d-separation in Figure <reference|fig13.20>.\ 

  <\padded-center>
    <small-figure|<image|image/fig_13_20_factorial_hmm_conditional_independence.png|.3par|||>|<label|fig13.20>Example
    of a path, highlighted in green, \ which is head-to-head at the observed
    nodes <math|\<b-x\><rsub|n\<minus\>1>> and <math|\<b-x\><rsub|n+1>>, and
    head-to-tail at the unobserved nodes <math|\<b-z\><rsup|(2)><rsub|n\<minus\>1>>,
    <math|\<b-z\><rsup|(2)><rsub|n>> and \ <math|z<rsup|(2)><rsub|n+1>>. Thus
    the path is not blocked and so the conditional independence property
    <eqref|13.5> does not hold for the individual latent chains of the
    factorial HMM model. As a consequence, there is no efficient exact E step
    for this model.>
  </padded-center>

  Now suppose that there are M chains of hidden nodes and for simplicity
  suppose that all latent variables have the same number <math|K> of states.
  Then one approach would be to note that there are <math|K<rsup|M>>
  combinations of latent variables at a given time step and so we can
  transform the model into an equivalent standard HMM having a single chain
  of latent variables each of which has <math|K<rsup|M>> latent states. We
  can then run the standard forward-backward recursions in the E step. This
  has computational complexity <math|O(N K<rsup|2M>)> that is exponential in
  the number <math|M> of latent chains and so will be intractable for
  anything other than small values of <math|M> . One solution would be to use
  sampling methods (discussed in Chapter 11). As an elegant deterministic
  alternative, Ghahramani and Jordan (1997) exploited variational inference
  techniques \ to obtain a tractable algorithm for approximate inference.
  This can be done using a simple variational posterior distribution that is
  fully factorized with respect to the latent variables, or alternatively by
  using a more powerful approach in which the variational distribution is
  described by independent Markov chains corresponding to the chains of
  latent variables in the original model. In the latter case, the variational
  inference algorithms involves running independent forward and backward
  recursions along each chain, which is computationally efficient and yet is
  also able to capture correlations between variables within the same chain.

  Clearly, there are many possible probabilistic structures that can be
  constructed according to the needs of particular applications. Graphical
  models provide a general technique for motivating, describing, and
  analysing such structures, and variational methods provide a powerful
  framework for performing inference in those models for which exact solution
  is intractable.

  <section|Linear Dynamical Systems>

  In order to motivate the concept of linear dynamical systems, let us
  consider the following simple problem, which often arises in practical
  settings. Suppose we wish to measure the value of an unknown quantity z
  using a noisy sensor that returns a observation <math|x> representing the
  value of <math|z> plus zero-mean Gaussian noise. Given a single
  measurement, our best guess for <math|z> is to assume that <math|z=x>.
  However, we can improve our estimate for <math|z> by taking lots of
  measurements and averaging them, because the random noise terms will tend
  to cancel each other. Now let's make the situation more complicated by
  assuming that we wish to measure a quantity <math|z> that is changing over
  time. We can take regular measurements of <math|x> so that at some point in
  time we have obtained <math|x<rsub|1>,\<cdots\>,x<rsub|N>> and we wish to
  find the corresponding values <math|z<rsub|1>,\<cdots\>,z<rsub|N>>. If we
  simply average the measurements, the error due to random noise will be
  reduced, but unfortunately we will just obtain a single averaged estimate,
  in which we have averaged over the changing value of <math|z>, thereby
  introducing a new source of error.

  Intuitively, we could imagine doing a bit better as follows. To estimate
  the value of <math|z<rsub|N>> , we take only the most recent few
  measurements, say <math|x<rsub|N-L>,\<cdots\>,x<rsub|N>> and just average
  these. If <math|z> is changing slowly, and the random noise level in the
  sensor is high, it would make sense to choose a relatively long window of
  observations to average. Conversely, if the signal is changing quickly, and
  the noise levels are small, we might be better just to use <math|x<rsub|N>>
  directly as our estimate of <math|z<rsub|N>> . Perhaps we could do even
  better if we take a weighted average, in which more recent measurements
  make a greater contribution than less recent ones.

  Although this sort of intuitive argument seems plausible, it does not tell
  us how to form a weighted average, and any sort of hand-crafted weighing is
  hardly likely to be optimal. Fortunately, we can address problems such as
  this much more systematically by defining a probabilistic model that
  captures the time evolution and measurement processes and then applying the
  inference and learning methods developed in earlier chapters. Here we shall
  focus on a widely used model known as a <em|linear dynamical system>.

  As we have seen, the HMM corresponds to the state space model shown in
  Figure <reference|fig13.5> in which the latent variables are discrete but
  with arbitrary emission probability distributions. This graph of course
  describes a much broader class of probability distributions, all of which
  factorize according to Eq. <eqref|13.6>. We now consider extensions to
  other distributions for the latent variables. In particular, we consider
  continuous latent variables in which the summations of the sum-product
  algorithm become integrals. The general form of the inference algorithms
  will, however, be the same as for the hidden Markov model. It is
  interesting to note that, historically, hidden Markov models and linear
  dynamical systems were developed independently. Once they are both
  expressed as graphical models, however, the deep relationship between them
  immediately becomes apparent.

  One key requirement is that we retain an efficient algorithm for inference
  which is linear in the length of the chain. This requires that, for
  instance, when we take a quantity <math|<wide|\<alpha\>|^>(\<b-z\><rsub|n\<minus\>1>)>,
  representing the posterior probability of <math|\<b-z\><rsub|n>> given
  observations <math|\<b-x\><rsub|1>,\<cdots\>\<b-x\><rsub|N>>, and multiply
  by the transition probability <math|p(\<b-z\><rsub|n>\|\<b-z\><rsub|n\<minus\>1>)>
  and the emission probability <math|p(\<b-x\><rsub|n>\|\<b-z\><rsub|n>)> and
  then marginalize over <math|\<b-z\><rsub|n\<minus\>1>>, we obtain a
  distribution over <math|\<b-z\><rsub|n>> that is of the same functional
  form as that over <math|<wide|\<alpha\>|^>(\<b-z\><rsub|n\<minus\>1>)>.
  That is to say, the distribution must not become more complex at each
  stage, but must only change in its parameter values. Not surprisingly, the
  only distributions that have this property of being closed under
  multiplication are those belonging to the exponential family.

  Here we consider the most important example from a practical perspective,
  which is the Gaussian. In particular, we consider a linear-Gaussian state
  space model so that the latent variables <math|{\<b-z\><rsub|n>}>, as well
  as the observed variables <math|{\<b-x\><rsub|n>}>, are multivariate
  Gaussian distributions whose means are linear functions of the states of
  their parents in the graph. We have seen that a directed graph of
  linear-Gaussian units is equivalent to a joint Gaussian distribution over
  all of the variables. Furthermore, marginals such as
  <math|<wide|\<alpha\>|^>(\<b-z\><rsub|n>)> are also Gaussian, so that the
  functional form of the messages is preserved and we will obtain an
  efficient inference algorithm. By contrast, suppose that the emission
  densities <math|p(\<b-x\><rsub|n>\|\<b-z\><rsub|n>)> comprise a mixture of
  <math|K> Gaussians each of which has a mean that is linear in
  <math|\<b-z\><rsub|n>>. Then even if <math|<wide|\<alpha\>|^>(\<b-z\><rsub|1>)>
  is Gaussian, the \ quantity <math|<wide|\<alpha\>|^>(\<b-z\><rsub|2>)> will
  be a mixture of <math|K> Gaussians, <math|<wide|\<alpha\>|^>(\<b-z\><rsub|3>)>
  will be a mixture of <math|K<rsup|2>> Gaussians, and so on, and exact
  inference will not be of practical value.

  We have seen that the hidden Markov model can be viewed as an extension of
  the mixture models of Chapter 9 to allow for sequential correlations in the
  data. In a similar way, we can view the linear dynamical system as a
  generalization of the continuous latent variable models of Chapter 12 such
  as probabilistic PCA and factor analysis. Each pair of nodes
  <math|{\<b-z\><rsub|n>,\<b-x\><rsub|n>}> represents a linear-Gaussian
  latent variable model for that particular observation. However, the latent
  variables <math|{\<b-z\><rsub|n>}> are no longer treated as independent but
  now form a Markov chain.

  Because the model is represented by a tree-structured directed graph,
  inference problems can be solved efficiently using the sum-product
  algorithm. The forward recursions, analogous to the <math|\<alpha\>>
  messages of the hidden Markov model, are known as the <em|Kalman filter>
  equations (Kalman, 1960; Zarchan and Musoff, 2005), and the backward
  recursions, analogous to the <math|\<beta\>> messages, are known as the
  <em|Kalman smoother> equations, or the <em|Rauch-Tung-Striebel> (RTS)
  equations (Rauch et al., 1965). The Kalman filter is widely used in many
  real-time tracking applications.

  Because the linear dynamical system is a linear-Gaussian model, the joint
  distribution over all variables, as well as all marginals and conditionals,
  will be Gaussian. It follows that the sequence of individually most
  probable latent variable values is the same as the most probable latent
  sequence. There is thus no need to consider the \ analogue of the Viterbi
  algorithm for the linear dynamical system.

  Because the model has linear-Gaussian conditional distributions, we can
  write the transition and emission distributions in the general form

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|\<b-z\><rsub|n>\|\<b-z\><rsub|n-1>|)>>|<cell|=>|<cell|\<cal-N\><around*|(|\<b-z\><rsub|n>\|A\<b-z\><rsub|n-1>,\<Gamma\>|)>>>|<row|<cell|p<around*|(|*\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)>>|<cell|=>|<cell|\<cal-N\><around*|(|\<b-x\><rsub|n>\|C\<b-z\><rsub|n>,\<Sigma\>|)>>>>>
  </eqnarray*>

  The initial latent variable also has a Gaussian distribution which we write
  as

  <\equation*>
    p<around*|(|\<b-z\><rsub|1>|)>=\<cal-N\><around*|(|\<b-z\><rsub|1>\|\<b-mu\><rsub|0>,V<rsub|0>|)>
  </equation*>

  Note that in order to simplify the notation, we have omitted additive
  constant terms from the means of the Gaussians. In fact, it is
  straightforward to include them if desired. Traditionally, these
  distributions are more commonly expressed in an equivalent form in terms of
  noisy linear equations given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<b-z\><rsub|n>>|<cell|=>|<cell|A\<b-z\><rsub|n-1>+\<b-w\><rsub|n>>>|<row|<cell|\<b-x\><rsub|n>>|<cell|=>|<cell|C\<b-z\><rsub|n>+\<b-v\><rsub|n>>>|<row|<cell|\<b-z\><rsub|1>>|<cell|=>|<cell|\<b-mu\><rsub|0>+\<b-u\>>>>>
  </eqnarray*>

  where the noise terms have the distributions

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<b-w\>>|<cell|\<sim\>>|<cell|\<cal-N\><around*|(|\<b-w\>\|\<b-0\>,\<Gamma\>|)>>>|<row|<cell|\<b-v\>>|<cell|\<sim\>>|<cell|\<cal-N\><around*|(|\<b-v\>\|\<b-0\>,\<Sigma\>|)>>>|<row|<cell|\<b-u\>>|<cell|\<sim\>>|<cell|\<cal-N\><around*|(|\<b-u\>\|\<b-0\>,V<rsub|0>|)>>>>>
  </eqnarray*>

  The parameters of the model, denoted by
  <math|\<b-theta\>={A,\<Gamma\>,C,\<Sigma\>,\<b-mu\><rsub|0>,V<rsub|0>}>,
  can be determined using maximum likelihood through the EM algorithm. In the
  E step, we need to solve the inference problem of determining the local
  posterior marginals for the latent variables, which can be solved
  efficiently using the sum-product algorithm, as we discuss in the next
  section.

  <subsection|Inference in LDS>

  \;

  We now turn to the problem of finding the marginal distributions for the
  latent variables conditional on the observation sequence. For given
  parameter settings, we also wish to make predictions of the next latent
  state <math|\<b-z\><rsub|n>> and of the next observation
  <math|\<b-x\><rsub|n>> conditioned on the observed data
  <math|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>> for use in real-time
  applications. These inference problems can be solved efficiently using the
  sum-product algorithm, which in the context of the linear dynamical system
  gives rise to the Kalman filter and Kalman smoother equations.

  It is worth emphasizing that because the linear dynamical system is a
  linearGaussian model, the joint distribution over all latent and observed
  variables is simply a Gaussian, and so in principle we could solve
  inference problems by using the standard results derived in previous
  chapters for the marginals and conditionals of a multivariate Gaussian. The
  role of the sum-product algorithm is to provide a more efficient way to
  perform such computations.

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|13.10|<tuple|1.4|5>>
    <associate|13.11|<tuple|1.5|8>>
    <associate|13.12|<tuple|1.6|8>>
    <associate|13.17|<tuple|1.7|8>>
    <associate|13.2|<tuple|1.1|2>>
    <associate|13.20|<tuple|1.8|9>>
    <associate|13.24|<tuple|1.9|10>>
    <associate|13.25|<tuple|1.10|10>>
    <associate|13.26|<tuple|1.11|10>>
    <associate|13.27|<tuple|1.12|10>>
    <associate|13.28|<tuple|1.13|10>>
    <associate|13.29|<tuple|1.14|10>>
    <associate|13.30|<tuple|1.15|10>>
    <associate|13.31|<tuple|1.16|10>>
    <associate|13.33|<tuple|1.17|10>>
    <associate|13.34|<tuple|1.18|11>>
    <associate|13.35|<tuple|1.19|11>>
    <associate|13.36|<tuple|1.20|11>>
    <associate|13.37|<tuple|1.21|11>>
    <associate|13.38|<tuple|1.22|12>>
    <associate|13.42|<tuple|1.23|13>>
    <associate|13.43|<tuple|1.24|13>>
    <associate|13.44|<tuple|1.25|14>>
    <associate|13.45|<tuple|1.26|15>>
    <associate|13.46|<tuple|1.27|15>>
    <associate|13.47|<tuple|1.28|15>>
    <associate|13.48|<tuple|1.29|15>>
    <associate|13.5|<tuple|1.2|3>>
    <associate|13.57|<tuple|1.30|16>>
    <associate|13.59|<tuple|1.31|17>>
    <associate|13.6|<tuple|1.3|4>>
    <associate|13.63|<tuple|1.32|17>>
    <associate|13.73|<tuple|1.33|19>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1.7|5>>
    <associate|auto-11|<tuple|1.8|6>>
    <associate|auto-12|<tuple|1.9|6>>
    <associate|auto-13|<tuple|1.10|7>>
    <associate|auto-14|<tuple|1.11|7>>
    <associate|auto-15|<tuple|1.2.1|7>>
    <associate|auto-16|<tuple|1.2.2|9>>
    <associate|auto-17|<tuple|1.12|11>>
    <associate|auto-18|<tuple|1.13|12>>
    <associate|auto-19|<tuple|1.2.3|14>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-20|<tuple|1.14|15>>
    <associate|auto-21|<tuple|1.15|15>>
    <associate|auto-22|<tuple|1.2.4|16>>
    <associate|auto-23|<tuple|1.2.5|17>>
    <associate|auto-24|<tuple|1.16|18>>
    <associate|auto-25|<tuple|1.2.6|19>>
    <associate|auto-26|<tuple|1.17|20>>
    <associate|auto-27|<tuple|1.18|21>>
    <associate|auto-28|<tuple|1.19|21>>
    <associate|auto-29|<tuple|1.20|22>>
    <associate|auto-3|<tuple|1.1|2>>
    <associate|auto-30|<tuple|1.3|22>>
    <associate|auto-31|<tuple|1.3.1|24>>
    <associate|auto-4|<tuple|1.2|2>>
    <associate|auto-5|<tuple|1.3|2>>
    <associate|auto-6|<tuple|1.4|3>>
    <associate|auto-7|<tuple|1.5|4>>
    <associate|auto-8|<tuple|1.2|4>>
    <associate|auto-9|<tuple|1.6|5>>
    <associate|fig13.1|<tuple|1.1|1>>
    <associate|fig13.10|<tuple|1.10|7>>
    <associate|fig13.11|<tuple|1.11|7>>
    <associate|fig13.12|<tuple|1.12|11>>
    <associate|fig13.14|<tuple|1.14|15>>
    <associate|fig13.15|<tuple|1.15|15>>
    <associate|fig13.16|<tuple|1.16|18>>
    <associate|fig13.17|<tuple|1.17|20>>
    <associate|fig13.18|<tuple|1.18|21>>
    <associate|fig13.19|<tuple|1.19|21>>
    <associate|fig13.20|<tuple|1.20|22>>
    <associate|fig13.4|<tuple|1.4|3>>
    <associate|fig13.5|<tuple|1.5|4>>
    <associate|fig13.6|<tuple|1.6|5>>
    <associate|fig13.7|<tuple|1.7|5>>
    <associate|fig13.8|<tuple|1.8|6>>
    <associate|fig13.9|<tuple|1.9|6>>
    <associate|sec13.2.1|<tuple|1.2.1|7>>
    <associate|sec13.2.2|<tuple|1.2.2|9>>
    <associate|sec13.2.3|<tuple|1.2.3|14>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1.1>||Example of a
      spectrogram of the spoken words \PBayes' theorem\Q showing a plot of
      the intensity of the spectral coefficients versus time
      index.>|<pageref|auto-2>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.2>||The simplest
      approach to modelling a sequence of observations is to treat them as
      independent, corresponding to a graph without links.>|<pageref|auto-4>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.3>||A first-order
      Markov chain of observations <with|mode|<quote|math>|<around*|{|\<b-x\><rsub|n>|}>
      >in which the distribution <with|mode|<quote|math>|p<around*|(|\<b-x\><rsub|n>\|\<b-x\><rsub|n-1>|)>>
      of a particular observation <with|mode|<quote|math>|\<b-x\><rsub|n>> is
      conditioned on the value of the previous observation
      <with|mode|<quote|math>|\<b-x\><rsub|n-1>>.>|<pageref|auto-5>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.4>||A second-order
      Markov chain, in \ which the conditional distribution of a particular
      observation <with|mode|<quote|math>|x<rsub|n>> depends on the values of
      the two previous observations <with|mode|<quote|math>|x<rsub|n\<minus\>1>>
      and \ <with|mode|<quote|math>|x<rsub|n\<minus\>2>>.>|<pageref|auto-6>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.5>||We can represent
      sequential data using a Markov chain of latent variables, with each
      observation conditioned on the state of the corresponding latent
      variable. This important graphical structure forms the foundation both
      for the hidden Markov model and for linear dynamical
      systems.>|<pageref|auto-7>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.6>||Transition
      diagram showing a model whose latent variables have three possible
      states corresponding to the three boxes. The black lines denote the
      elements of the transition matrix \ <with|mode|<quote|math>|A<rsub|j
      k>>.>|<pageref|auto-9>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.7>||If we unfold the
      state transition diagram of Figure <reference|fig13.6> over time, we
      obtain a lattice, or trellis, representation of the latent states. Each
      column of this diagram corresponds to one of the latent variables
      <with|mode|<quote|math>|\<b-z\><rsub|n>>.>|<pageref|auto-10>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.8>||Illustration of
      sampling from a hidden Markov model having a 3-state latent variable
      <with|mode|<quote|math>|\<b-z\>> and a Gaussian emission model
      <with|mode|<quote|math>|p(\<b-x\>\|\<b-z\>)> where
      <with|mode|<quote|math>|\<b-x\>> is 2-dimensional. (a) Contours of
      constant probability density for the emission distributions
      corresponding to each of the three states of the latent variable. (b) A
      sample of 50 points drawn from the hidden Markov model, colour coded
      according to the component that generated them and with lines
      connecting the successive observations. Here the transition matrix was
      fixed so that in any state there is a 5% probability of making a
      transition to each of the other states, and consequently a 90%
      probability of remaining in the same state.>|<pageref|auto-11>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.9>||Example of the
      state transition diagram for a 3-state \ left-to-right hidden Markov
      model. Note that once a state has been vacated, it cannot later be
      re-entered.>|<pageref|auto-12>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.10>||Lattice diagram
      for a 3-state leftto-right HMM in which the state index
      <with|mode|<quote|math>|k> is allowed to increase by at most 1 at each
      transition.>|<pageref|auto-13>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.11>||Top row:
      examples of on-line handwritten digits. Bottom row: synthetic digits
      sampled generatively from a left-to-right hidden Markov model that has
      been trained on a data set of 45 handwritten
      digits.>|<pageref|auto-14>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.12>||Illustration of
      the forward recursion (<reference|13.36>) for evaluation of the
      <with|mode|<quote|math>|\<alpha\>> variables. In this fragment of the
      lattice, we see that the quantity <with|mode|<quote|math>|\<alpha\>(z<rsub|n1>)>
      is obtained by taking the elements <with|mode|<quote|math>|\<alpha\>(z<rsub|n\<minus\>1,j>)>
      of <with|mode|<quote|math>|\<alpha\>(\<b-z\><rsub|n\<minus\>1>)> at
      step <with|mode|<quote|math>|n\<minus\>1> and summing them up with
      weights given by <with|mode|<quote|math>|A<rsub|j1>>, corresponding to
      the values of <with|mode|<quote|math>|p(\<b-z\><rsub|n>\|\<b-z\><rsub|n\<minus\>1>)>,
      and then multiplying by the data contribution
      <with|mode|<quote|math>|p(\<b-x\><rsub|n>\|z<rsub|n1>)>.>|<pageref|auto-17>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.13>||Illustration of
      the backward recursion (<reference|13.38>) for evaluation of the
      <with|mode|<quote|math>|\<beta\>> variables. In this fragment of the
      lattice, we see that the quantity <with|mode|<quote|math>|\<beta\>(z<rsub|n1>)>
      is obtained by taking the components
      <with|mode|<quote|math>|\<beta\>(z<rsub|n+1,k>)> of
      <with|mode|<quote|math>|\<beta\>(\<b-z\><rsub|n+1>)> at step
      <with|mode|<quote|math>|n+1> and summing them up with weights given by
      the products of <with|mode|<quote|math>|A<rsub|1k>>, corresponding to
      the values of <with|mode|<quote|math>|p(\<b-z\><rsub|n+1>\|\<b-z\><rsub|n>)>
      and the corresponding values of the emission density
      <with|mode|<quote|math>|p(\<b-x\><rsub|n>\|z<rsub|n+1,k>)>.>|<pageref|auto-18>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.14>||A fragment of
      the factor graph representation for the hidden Markov
      model.>|<pageref|auto-20>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.15>||A simplified
      form of factor graph to describe the hidden Markov
      model.>|<pageref|auto-21>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.16>||A fragment of
      the HMM lattice showing two possible paths. The Viterbi algorithm
      efficiently determines the most probable path from amongst the
      exponentially many possibilities. For any given path, the corresponding
      probability is given by the product of the elements of the transition
      matrix <with|mode|<quote|math>|A<rsub|j k>>, corresponding to the
      probabilities <with|mode|<quote|math>|p(\<b-z\><rsub|n+1>\|\<b-z\><rsub|n>)>
      for each segment of the path, along with the emission densities
      <with|mode|<quote|math>|p(\<b-x\><rsub|n>\|k)> associated with each
      node on the path.>|<pageref|auto-24>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.17>||Section of an
      autoregressive hidden Markov model, in which the distribution of the
      observation <with|mode|<quote|math>|\<b-x\><rsub|n>> depends on a
      subset of the previous observations as well as on the hidden state
      <with|mode|<quote|math>|\<b-z\><rsub|n>>. In this example, the
      distribution of <with|mode|<quote|math>|\<b-x\><rsub|n>> depends on the
      two previous observations <with|mode|<quote|math>|\<b-x\><rsub|n\<minus\>1>>
      and <with|mode|<quote|math>|\<b-x\><rsub|n\<minus\>2>>.>|<pageref|auto-26>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.18>||Example of an
      input-output hidden \ Markov model. In this case, both the emission
      probabilities and the transition probabilities depend on the values of
      a sequence of observations <with|mode|<quote|math>|\<b-u\><rsub|1>,\<cdots\>,\<b-u\><rsub|N>>.>|<pageref|auto-27>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.19>||A factorial
      hidden Markov model comprising two Markov chains of latent variables.
      For continuous observed variables <with|mode|<quote|math>|\<b-x\>>, one
      possible choice of emission model is a linear-Gaussian density in which
      the mean of the Gaussian is a linear combination of the states of the
      corresponding latent variables.>|<pageref|auto-28>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|1.20>||Example of a
      path, highlighted in green, \ which is head-to-head at the observed
      nodes <with|mode|<quote|math>|\<b-x\><rsub|n\<minus\>1>> and
      <with|mode|<quote|math>|\<b-x\><rsub|n+1>>, and head-to-tail at the
      unobserved nodes <with|mode|<quote|math>|\<b-z\><rsup|(2)><rsub|n\<minus\>1>>,
      <with|mode|<quote|math>|\<b-z\><rsup|(2)><rsub|n>> and
      \ <with|mode|<quote|math>|z<rsup|(2)><rsub|n+1>>. Thus the path is not
      blocked and so the conditional independence property (<reference|13.5>)
      does not hold for the individual latent chains of the factorial HMM
      model. As a consequence, there is no efficient exact E step for this
      model.>|<pageref|auto-29>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Sequential
      \ Data> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      1.1<space|2spc>Markov Models <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      1.2<space|2spc>Hidden Markov Models
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      <with|par-left|<quote|1tab>|1.2.1<space|2spc>Maximum likelihood for the
      HMM <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|1tab>|1.2.2<space|2spc>The forward-backward
      algorithm <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|1tab>|1.2.3<space|2spc>The sum-product algorithm
      for the HMM <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|1tab>|1.2.4<space|2spc>Scaling factors
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <with|par-left|<quote|1tab>|1.2.5<space|2spc>The Viterbi algorithm
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>>

      <with|par-left|<quote|1tab>|1.2.6<space|2spc>Extensions of the hidden
      Markov model <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>>

      1.3<space|2spc>Linear Dynamical Systems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>

      <with|par-left|<quote|1tab>|1.3.1<space|2spc>Inference in LDS
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31>>
    </associate>
  </collection>
</auxiliary>