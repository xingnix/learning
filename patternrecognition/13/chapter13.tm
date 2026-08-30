<TeXmacs|2.1.1>

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

  <subsection|Maximum likelihood for the HMM>

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

  <subsection|The forward-backward algorithm>

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
    <tformat|<table|<row|<cell|p<around*|(|X\|\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)>p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n>|)><eq-number><label|13.24>>>|<row|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>\|\<b-x\><rsub|n>,\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>\|\<b-z\><rsub|n>|)><eq-number><label|13.25>>>|<row|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>\|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>\|\<b-z\><rsub|n-1>|)><eq-number><label|13.26>>>|<row|<cell|p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n>,\<b-z\><rsub|n+1>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n+1>|)><eq-number><label|13.27>>>|<row|<cell|p<around*|(|\<b-x\><rsub|n+2>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n+1>,\<b-x\><rsub|n+1>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|n+2>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n+1>|)><eq-number><label|13.28>>>|<row|<cell|p<around*|(|X\|\<b-z\><rsub|n-1>,\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n-1>\|\<b-z\><rsub|n-1>|)>p<around*|(|\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)>p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|N>\|\<b-z\><rsub|n>|)>>>|<row|<cell|p<around*|(|\<b-x\><rsub|N+1>\|X,\<b-z\><rsub|N+1>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|N+1>\|\<b-z\><rsub|N+1>|)>>>|<row|<cell|p<around*|(|\<b-z\><rsub|N+1>\|\<b-z\><rsub|N>,X|)>>|<cell|=>|<cell|p<around*|(|\<b-z\><rsub|N+1>\|\<b-z\><rsub|N>|)>>>>>
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
    <tformat|<table|<row|<cell|\<alpha\><around*|(|\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|n>,\<b-z\><rsub|n>|)><eq-number><label|13.34>>>|<row|<cell|\<beta\><around*|(|\<b-z\><rsub|n>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|n+1>,\<cdots\>,\<b-x\><rsub|n>\|\<b-z\><rsub|n>|)><eq-number><label|13.35>>>>>
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
    <tformat|<table|<row|<cell|\<alpha\><around*|(|\<b-z\><rsub|1>|)>>|<cell|=>|<cell|p<around*|(|\<b-x\><rsub|1>,\<b-z\><rsub|1>|)>>>|<row|<cell|>|<cell|=>|<cell|p<around*|(|\<b-z\><rsub|1>|)>p<around*|(|\<b-x\><rsub|1>\|\<b-z\><rsub|1>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|prod><rsub|k=1><rsup|K><around*|{|\<pi\><rsub|k>p<around*|(|\<b-x\><rsub|1>\|\<b-varphi\><rsub|k>|)>|}><rsup|z<rsub|1k>>>>>>
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

  <subsection|The sum-product algorithm for the HMM><label|sec13.2.3>

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|13.10|<tuple|1.2|5>>
    <associate|13.11|<tuple|1.3|8>>
    <associate|13.12|<tuple|1.4|8>>
    <associate|13.17|<tuple|1.5|8>>
    <associate|13.2|<tuple|1.1|2>>
    <associate|13.20|<tuple|1.6|?>>
    <associate|13.24|<tuple|1.7|?>>
    <associate|13.25|<tuple|1.8|?>>
    <associate|13.26|<tuple|1.9|?>>
    <associate|13.27|<tuple|1.10|?>>
    <associate|13.28|<tuple|1.11|?>>
    <associate|13.33|<tuple|1.12|?>>
    <associate|13.34|<tuple|1.13|?>>
    <associate|13.35|<tuple|1.14|?>>
    <associate|13.36|<tuple|1.15|?>>
    <associate|13.38|<tuple|1.16|?>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1.7|5>>
    <associate|auto-11|<tuple|1.8|6>>
    <associate|auto-12|<tuple|1.9|6>>
    <associate|auto-13|<tuple|1.10|7>>
    <associate|auto-14|<tuple|1.11|7>>
    <associate|auto-15|<tuple|1.2.1|7>>
    <associate|auto-16|<tuple|1.2.2|9>>
    <associate|auto-17|<tuple|1.12|?>>
    <associate|auto-18|<tuple|1.13|?>>
    <associate|auto-19|<tuple|1.2.3|?>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.1|2>>
    <associate|auto-4|<tuple|1.2|2>>
    <associate|auto-5|<tuple|1.3|2>>
    <associate|auto-6|<tuple|1.4|3>>
    <associate|auto-7|<tuple|1.5|4>>
    <associate|auto-8|<tuple|1.2|4>>
    <associate|auto-9|<tuple|1.6|5>>
    <associate|fig13.1|<tuple|1.1|1>>
    <associate|fig13.10|<tuple|1.10|7>>
    <associate|fig13.11|<tuple|1.11|7>>
    <associate|fig13.12|<tuple|1.12|?>>
    <associate|fig13.4|<tuple|1.4|3>>
    <associate|fig13.5|<tuple|1.5|4>>
    <associate|fig13.6|<tuple|1.6|5>>
    <associate|fig13.7|<tuple|1.7|5>>
    <associate|fig13.8|<tuple|1.8|6>>
    <associate|fig13.9|<tuple|1.9|6>>
    <associate|sec13.2.3|<tuple|1.2.3|?>>
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
      observation xn depends on the values of the two previous observations
      xn\<minus\>1 and \ xn\<minus\>2.>|<pageref|auto-6>>

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
    </associate>
  </collection>
</auxiliary>