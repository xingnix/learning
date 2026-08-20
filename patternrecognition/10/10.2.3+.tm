<TeXmacs|2.1>

<style|article>

<\body>
  <subsection| Predictive density><label|sec10.2.3>

  In applications of the Bayesian mixture of Gaussians model we will often be
  interested in the predictive density for a new value <math|x> of the
  observed variable. As- sociated with this observation will be a
  corresponding latent variable z, and the pre- dictive density is then given
  by

  <\equation*>
    p<around*|(|<wide|\<b-x\>|^>\|X|)>=<big|sum><rsub|<wide|\<b-z\>|^>><big|iiint>p<around*|(|<wide|\<b-x\>|^>\|<wide|\<b-z\>|^>,\<b-mu\>,\<Lambda\>|)>p<around*|(|<wide|\<b-z\>|^>\|\<b-pi\>|)>p<around*|(|\<b-pi\>,\<b-mu\>,\<Lambda\>\|X|)>\<mathd\>\<b-pi\>\<mathd\>\<b-mu\>\<mathd\>\<Lambda\>
  </equation*>

  where <math|p(\<b-pi\>,\<b-mu\>,\<Lambda\>\|X)> is the (unknown) true
  posterior distribution of the parameters. Using (10.37) and (10.38) we can
  first perform the summation over <math|<wide|\<b-z\>|^>> to give

  <\equation*>
    p<around*|(|<wide|\<b-x\>|^>\|X|)>=<big|sum><rsub|k=1><rsup|K><big|iiint>\<pi\><rsub|k>\<cal-N\><around*|(|<wide|\<b-x\>|^>\|\<b-mu\><rsub|k>,\<Lambda\><rsub|k><rsup|-1>|)>p<around*|(|\<b-pi\>,\<b-mu\>,\<Lambda\>\|X|)>\<mathd\>\<b-pi\>\<mathd\>\<b-mu\>\<mathd\>\<Lambda\>
  </equation*>

  (note: <math|<big|sum><rsub|\<up-z\>><around*|[|<big|prod><rsub|\<b-z\>>\<pi\><rsub|k><rsup|z<rsub|k>>|]>=<big|sum><rsub|k=1><rsup|K>\<pi\><rsub|k>>)

  Because the remaining integrations are intractable, we approximate the
  predictive density by replacing the true posterior distribution
  <math|p(\<b-pi\>,\<b-mu\>,\<Lambda\>\|X)> with its variational
  approximation <math|q(\<b-pi\>)q(\<b-mu\>,\<Lambda\>)> to give

  <\equation*>
    p<around*|(|<wide|\<b-x\>|^>\|X|)>\<cong\><big|sum><rsub|k=1><rsup|K><big|iiint>\<pi\><rsub|k>\<cal-N\><around*|(|<wide|\<b-x\>|^>\|\<b-mu\><rsub|k>,\<Lambda\><rsup|-1><rsub|k>|)>q<around*|(|\<b-pi\>|)>q<around*|(|\<b-mu\><rsub|k>,\<Lambda\><rsub|k>|)>\<mathd\>\<b-pi\>\<mathd\>\<b-mu\><rsub|k>\<mathd\>\<Lambda\><rsub|k>
  </equation*>

  where we have made use of the factorization (10.55) and in each term we
  have implicitly integrated out all variables
  <math|{\<b-mu\><rsub|j>,\<Lambda\><rsub|j>}> for <math|j\<neq\>k> The
  remaining integrations can now be evaluated analytically giving a mixture
  of Student's t-distributions

  <\equation*>
    p<around*|(|<wide|\<b-x\>|^>\|X|)>=<frac|1|<wide|\<alpha\>|^>><big|sum><rsub|k=1><rsup|K>\<alpha\><rsub|k>St<around*|(|<wide|\<b-x\>|^>\|\<b-m\><rsub|k>,L<rsub|k>,\<nu\><rsub|k>+1-D|)>
  </equation*>

  in which the k'th component has mean <math|\<b-m\><rsub|k>>, and the
  precision is given by

  <\equation*>
    L<rsub|k>=<frac|<around*|(|\<nu\><rsub|k>+1-D|)>\<beta\><rsub|k>|<around*|(|1+\<beta\><rsub|k>|)>>W<rsub|k>
  </equation*>

  in which <math|\<nu\><rsub|k>> is given by (10.63). When the size N of the
  data set is large the predictive distribution (10.81) reduces to a mixture
  of Gaussians.

  <subsection|Determining the number of components><label|sec10.2.4>

  We have seen that the variational lower bound can be used to determine a
  posterior distribution over the number K of components in the mixture
  model.\ 

  There is, however, one subtlety that needs to be addressed. For any given
  setting of the parameters in a Gaussian mixture model (except for specific
  degenerate settings), there will exist other parameter settings for which
  the density over the observed variables will be identical. These parameter
  values differ only through a re-labelling of the components.\ 

  For instance, consider a mixture of two Gaussians and a single observed
  variable x, in which the parameters have the values <math|\<pi\><rsub|1> =
  a>, <math|\<pi\><rsub|2> = b>, <math|\<mu\><rsub|1> = c>,
  <math|\<mu\><rsub|2> =d>,<math|\<sigma\><rsub|1>
  =e>,<math|\<sigma\><rsub|2> =f>. Then the parameter values
  <math|\<pi\><rsub|1> =b>,<math|\<pi\><rsub|2> =a>,<math|\<mu\><rsub|1> =d>,
  <math|\<mu\><rsub|2> = c>, <math|\<sigma\><rsub|1> = f>,
  <math|\<sigma\><rsub|2> = e>, in which the two components have been
  exchanged, will by symmetry give rise to the same value of <math|p(x)>. If
  we have a mixture model comprising K components, then each parameter
  setting will be a member of a family of <math|K!> equivalent settings.

  In the context of maximum likelihood, this redundancy is irrelevant because
  the parameter optimization algorithm (for example EM) will, depending on
  the initialization of the parameters, find one specific solution, and the
  other equivalent solutions play no role. In a Bayesian setting, however, we
  marginalize over all possible parameter values. We have seen in Figure 10.3
  that if the true posterior distribution is multimodal, variational
  inference based on the minimization of <math|KL(q\<\|\|\>p)> will tend to
  approximate the distribution in the neighbourhood of one of the modes and
  ignore the others. Again, because equivalent modes have equivalent
  predictive densities, this is of no concern provided we are considering a
  model having a specific number K of components. If, however, we wish to
  compare different values of K, then we need to take account of this
  multimodality. A simple approximate solution is to add a term
  <inactive|<mouse-over-balloon|<math|ln K!>| |left|Bottom>>onto the lower
  bound when used for model comparison and averaging.

  note:

  <eqnarray*|<tformat|<table|<row|<cell|q<rsup|m>=>|<cell|<big|sum><rsub|i=1><rsup|K!><frac|q<rsub|i><rsup|s>|K!>>|<cell|<text|<tabular|<tformat|<table|<row|<cell|multi-mode
  <math|q<rsup|m>> is generated by single-mode
  <math|q<rsup|s>>>>|<row|<cell|<math|q<rsup|s><rsub|i>> is created by
  scaling<infix-and>shifting from <math|q<rsup|s>>>>>>>>>>|<row|<cell|\<cal-L\><rsub|s>=>|<cell|<big|int>q<rsup|s><frac|ln
  p|q<rsup|s>>>|<cell|>>|<row|<cell|\<cal-L\><rsub|m>=>|<cell|<big|int>q<rsup|m><frac|ln
  p|q<rsup|m>>>|<cell|>>|<row|<cell|=>|<cell|<big|int><big|sum><rsub|i=1><rsup|K!><frac|q<rsub|i><rsup|s>|K!>ln<frac|p|<big|sum><rsub|i=1><rsup|K!><frac|q<rsub|i><rsup|s>|K!>>>|<cell|>>|<row|<cell|=>|<cell|K!<big|int><rsub|q<rsup|s>\<gtr\>0><big|sum><rsub|i=1><rsup|K!><frac|q<rsub|i><rsup|s>|K!>ln<frac|p|<big|sum><rsub|i=1><rsup|K!><frac|q<rsub|i><rsup|s>|K!>>>|<cell|<text|value
  of <math|p> at different mode is equal>>>|<row|<cell|=>|<cell|K!<big|int><rsub|q<rsup|s>\<gtr\>0><big|sum><rsub|i=1><rsup|K!><frac|q<rsub|i><rsup|s>|K!>ln<frac|p|<big|sum><rsub|i=1><rsup|K!><frac|q<rsub|i><rsup|s>|K!>>>|<cell|<text|<math|q<rsup|s><rsub|i>
  is separated with each other <big|prod><rsub|i=1><rsup|K!>q<rsup|s><rsub|i>=0>>>>|<row|<cell|=>|<cell|K!<big|int><rsub|q<rsup|s>\<gtr\>0><frac|q<rsup|s>|K!>ln<frac|p|<around*|(|<frac|q<rsup|s>|K!>|)>>>|<cell|>>|<row|<cell|=>|<cell|<big|int><rsub|q<rsup|s>\<gtr\>0>q<rsup|s>ln<frac|p
  K!|q<rsup|s>>>|<cell|>>|<row|<cell|=>|<cell|<big|int>q<rsup|s><around*|[|ln<frac|p|q<rsup|s>>+ln
  K!|]>>|<cell|>>|<row|<cell|=>|<cell|<around*|[|<big|int>q<rsup|s>ln<frac|p|q<rsup|s>>|]>+ln
  K!>|<cell|>>|<row|<cell|=>|<cell|\<cal-L\><rsub|s>+ln K!>|<cell|>>>>>

  Figure 10.7 shows a plot of the lower bound, including the multimodality
  factor, versus the number K of components for the Old Faithful data set. It
  is worth emphasizing once again that maximum likelihood would lead to
  values of the likelihood function that increase monotonically with K
  (assuming the singular solutions have been avoided, and discounting the
  effects of local maxima) and so cannot be used to determine an appropriate
  model complexity. By contrast, Bayesian inference automatically makes the
  trade-off between model complexity and fitting the data.\ 

  <\padded-center>
    <small-figure|<image|image/fig_10_7_L_K.png|0.3par|||>|Plot of the
    variational lower bound <math|\<cal-L\>> versus the number <math|K> of
    components in the Gaussian mixture model, for the Old Faithful data,
    showing a distinct peak at <math|K = 2> components. For each value of K,
    the model is trained from 100 different random starts, and the results
    shown as `+' symbols plotted with small random hori zontal perturbations
    so that they can be distinguished. Note that some solutions find
    suboptimal local maxima, but that this happens infrequently.>
  </padded-center>

  This approach to the determination of K requires that a range of models
  having different K values be trained and compared. An alternative approach
  to determining a suitable value for K is to treat the mixing coefficients
  <math|\<b-pi\>> as parameters and make point estimates of their values by
  maximizing the lower bound (Corduneanu and Bishop, 2001) with respect to
  <math|\<b-pi\>> instead of maintaining a probability distribution over them
  as in the fully Bayesian approach. This leads to the re-estimation equation

  <\equation*>
    \<pi\><rsub|k>=<frac|1|N><big|sum><rsub|n=1><rsup|N>r<rsub|n k>
  </equation*>

  and this maximization is interleaved with the variational updates for the
  <math|q> distribution over the remaining parameters. Components that
  provide insufficient contribution to explaining the data will have their
  mixing coefficients driven to zero during the optimization, and so they are
  effectively removed from the model through <strong|automatic relevance
  determination>. This allows us to make a single training run in which we
  start with a relatively large initial value of K, and allow surplus
  components to be pruned out of the model. The origins of the sparsity when
  optimizing with respect to hyperparameters is discussed in detail in the
  context of the relevance vector machine.

  \;

  <subsection|Induced factorizations><label|10.2.5>

  In deriving these variational update equations for the Gaussian mixture
  model, we assumed a particular factorization of the variational posterior
  distribution given by (10.42). However, the optimal solutions for the
  various factors exhibit additional factorizations. In particular, the
  solution for <math|q <rsup|\<ast\>>(\<b-mu\>,\<Lambda\>)> is given by the
  product of an independent distribution <math|q<rsup|\<ast\>>(\<b-mu\><rsub|k>,\<Lambda\><rsub|k>)>
  over each of the components <math|k> of the mixture, whereas the
  variational posterior distribution <math|q<rsup|\<ast\>>(Z)> over the
  latent variables, given by (10.48), factorizes into an independent
  distribution <math|q<rsup|\<ast\>>(\<b-z\><rsub|n>)> for each observation
  <math|n> (note that it does not further factorize with respect to <math|k>
  because, for each value of <math|n>, the <math|z<rsub|nk>> are constrained
  to sum to one over <math|k>). These additional factorizations are a
  consequence of the interaction between the assumed factorization and the
  conditional independence properties of the true distribution, as
  characterized by the directed graph in Figure 10.5.

  We shall refer to these additional factorizations as <strong|induced
  factorizations> because they arise from an interaction between the
  factorization assumed in the variational posterior distribution and the
  conditional independence properties of the true joint distribution. In a
  numerical implementation of the variational approach it is important to
  take account of such additional factorizations. For instance, it would be
  very inefficient to maintain a full precision matrix for the Gaussian
  distribution over a set of variables if the optimal form for that
  distribution always had a diagonal precision matrix (corresponding to a
  factorization with respect to the individual variables described by that
  Gaussian).

  Such induced factorizations can easily be detected using a simple graphical
  test based on d-separation as follows. We partition the latent variables
  into three disjoint groups A, B, C and then let us suppose that we are
  assuming a factorization between C and the remaining latent variables, so
  that\ 

  <\equation*>
    q(A, B, C) = q(A, B)q(C).<space|2em>(10.84)
  </equation*>

  Using the general result (10.9), together with the product rule for
  probabilities, we see that the optimal solution for q(A, B) is given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|ln q<rsup|\<ast\>><around*|(|A,B|)><rsup|*>>|<cell|=>|<cell|\<bbb-E\><rsub|C><around*|[|ln
    p<around*|(|X,A,B,C|)>|]>+const>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><rsub|C><around*|[|ln
    p<around*|(|A,B\|X,C|)>|]>+const>>>>
  </eqnarray*>

  We now ask whether this resulting solution will factorize between A and B,
  in other words whether <math|q <rsup|\<ast\>>(A,B) = q<rsup|\<ast\>>
  (A)q<rsup|\<ast\>> (B)>. This will happen if, and only if, <math|ln
  p(A,B\|X, C)=ln p(A\|X,C)+ln p(B\|X,C)>, that is, if the conditional
  independence relation\ 

  <\equation*>
    A \<bot\>B \| X,C
  </equation*>

  is satisfied. We can test to see if this relation does hold, for any choice
  of A and B by making use of the d-separation criterion.

  To illustrate this, consider again the Bayesian mixture of Gaussians
  represented by the directed graph in Figure 10.5, in which we are assuming
  a variational factorization given by (10.42). We can see immediately that
  the variational posterior distribution over the parameters must factorize
  between <math|\<b-pi\>> and the remaining parameters <math|\<b-mu\>> and
  <math|\<Lambda\>> because all paths connecting <math|\<b-pi\>> to either
  <math|\<b-mu\>> or <math|\<Lambda\>> must pass through one of the nodes
  <math|\<b-z\><rsub|n>> all of which are in the conditioning set for our
  conditional independence test and all of which are head-to-tail with
  respect to such paths.

  <section|Variational Linear Regression>

  As a second illustration of variational inference, we return to the
  Bayesian linear regression model of Section 3.3. In the evidence framework,
  we approximated the integration over <math|\<alpha\>> and <math|\<beta\>>
  by making point estimates obtained by maximizing the log marginal
  likelihood. A fully Bayesian approach would integrate over the
  hyperparameters as well as over the parameters. Although exact integration
  is intractable, we can use variational methods to find a tractable
  approximation. In order to simplify the discussion, we shall suppose that
  the noise precision parameter <math|\<beta\>> is known, and is fixed to its
  true value, although the framework is easily extended to include the
  distribution over <math|\<beta\>>. For the linear regression model, the
  variational treatment will turn out to be equivalent to the evidence
  framework. Nevertheless, it provides a good exercise in the use of
  variational methods and will also lay the foundation for variational
  treatment of Bayesian logistic regression in Section 10.6.

  Recall that the likelihood function for <math|\<b-w\>>, and the prior over
  <math|\<b-w\>>, are given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|\<b-t\>\|\<b-w\>|)>>|<cell|=>|<cell|<big|prod><rsub|n=1><rsup|N>\<cal-N\><around*|(|t<rsub|n>\|\<b-w\><rsup|T>\<b-varphi\><rsub|n>,\<beta\><rsup|-1>|)>>>|<row|<cell|p<around*|(|\<b-w\>\|\<alpha\>|)>>|<cell|=>|<cell|\<cal-N\><around*|(|\<b-w\>\|\<b-0\>,\<alpha\><rsup|-1>I|)>>>>>
  </eqnarray*>

  where <math|\<b-varphi\><rsub|n>=\<b-varphi\>(\<b-x\><rsub|n>)>. We now
  introduce a prior distribution over <math|\<alpha\>>. From our discussion
  in Section 2.3.6, we know that the conjugate prior for the precision of a
  Gaussian is given by a gamma distribution, and so we choose

  <\equation*>
    p(\<alpha\>) = Gam(\<alpha\>\|a<rsub|0>,b<rsub|0>)
  </equation*>

  where <math|Gam(\<cdummy\>\|\<cdummy\>,\<cdummy\>)> is defined by (B.26).
  Thus the joint distribution of all the variables is given by\ 

  <\equation>
    p(\<b-t\>, \<b-w\>, \<alpha\>) = p(\<b-t\>\|\<b-w\>)p(\<b-w\>\|\<alpha\>)p(\<alpha\>).<label|10.90>
  </equation>

  This can be represented as a directed graphical model as shown in Figure
  10.8.

  <\padded-center>
    <small-figure|<image|image/fig_10_8_L_bayes_linear_regression.png|0.3par|||>|Probabilistic
    graphical model representing the joint distribution Eq. <eqref|10.90> for
    the Bayesian linear regression model.>
  </padded-center>

  <subsection|Variational distribution><label|sec10.3.1>

  Our first goal is to find an approximation to the posterior distribution
  <math|p(\<b-w\>,\<alpha\>\|\<b-t\>)>. To do this, we employ the variational
  framework of Section 10.1, with a variational posterior distribution given
  by the factorized expression\ 

  <\equation*>
    q(\<b-w\>, \<alpha\>) = q(\<b-w\>)q(\<alpha\>).
  </equation*>

  We can find re-estimation equations for the factors in this distribution by
  making use of the general result (10.9). Recall that for each factor, we
  take the log of the joint distribution over all variables and then average
  with respect to those variables not in that factor. Consider first the
  distribution over <math|\<alpha\>>. Keeping only terms that have a
  functional dependence on <math|\<alpha\>>, we have

  <\eqnarray*>
    <tformat|<table|<row|<cell|ln q<rsup|\<ast\>><around*|(|\<alpha\>|)>>|<cell|=>|<cell|ln
    p<around*|(|\<alpha\>|)>+\<bbb-E\><rsub|\<b-w\>><around*|[|ln
    p<around*|(|\<b-w\>\|\<alpha\>|)>|]>+const>>|<row|<cell|>|<cell|=>|<cell|<around*|(|a<rsub|0>-1|)>ln\<alpha\>-b<rsub|0>\<alpha\>+<frac|M|2>ln\<alpha\>-<frac|\<alpha\>|2>\<bbb-E\><around*|[|\<b-w\><rsup|T>\<b-w\>|]>+const>>>>
  </eqnarray*>

  We recognize this as the log of a gamma distribution, and so identifying
  the coefficients of <math|\<alpha\>> and ln <math|\<alpha\>> we obtain

  <\equation*>
    q <rsup|\<ast\>>(\<alpha\>)=Gam(\<alpha\>\|a<rsub|N>,b<rsub|N>)
  </equation*>

  where

  <\eqnarray*>
    <tformat|<table|<row|<cell|a<rsub|N>>|<cell|=>|<cell|a<rsub|0>+<frac|M|2>>>|<row|<cell|b<rsub|N>>|<cell|=>|<cell|b<rsub|0>+<frac|1|2>\<bbb-E\><around*|[|\<b-w\><rsup|T>\<b-w\>|]>>>>>
  </eqnarray*>

  Similarly, we can find the variational re-estimation equation for the
  posterior distribution over <math|\<b-w\>>. Again, using the general result
  (10.9), and keeping only those terms that have a functional dependence on
  <math|\<b-w\>>, we have

  <\eqnarray*>
    <tformat|<table|<row|<cell|ln q<rsup|\<ast\>><around*|(|\<b-w\>|)>>|<cell|=>|<cell|ln
    p<around*|(|\<b-t\>\|\<b-w\>|)>+\<bbb-E\><rsub|\<alpha\>><around*|[|ln
    p<around*|(|\<b-w\>\|\<alpha\>|)>|]>+const>>|<row|<cell|>|<cell|=>|<cell|-<frac|\<beta\>|2><big|sum><rsub|n=1><rsup|N><around*|{|\<b-w\><rsup|T>\<b-varphi\><rsub|n>-t<rsub|n>|}><rsup|2>-<frac|1|2>\<bbb-E\><around*|[|\<alpha\>|]>\<b-w\><rsup|T>\<b-w\>+const>>|<row|<cell|>|<cell|=>|<cell|-<frac|1|2>\<b-w\><rsup|T><around*|(|\<bbb-E\><around*|[|\<alpha\>|]>I+\<beta\>\<Phi\><rsup|T>\<Phi\>|)>\<b-w\>+\<beta\>\<b-w\><rsup|T>\<Phi\><rsup|T>\<b-t\>+const>>>>
  </eqnarray*>

  Because this is a quadratic form, the distribution
  <math|q<rsup|\<ast\>>(\<b-w\>)> is Gaussian, and so we can complete the
  square in the usual way to identify the mean and covariance, giving

  <\equation*>
    q<rsup|\<ast\>>(\<b-w\>)=\<cal-N\>(\<b-w\>\|\<b-m\><rsub|N>,S<rsub|N>)
  </equation*>

  where\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<b-m\><rsub|N>>|<cell|=>|<cell|\<beta\>S<rsub|N>\<Phi\><rsup|T>\<b-t\>>>|<row|<cell|S<rsub|N>>|<cell|=>|<cell|<around*|(|\<bbb-E\><around*|[|\<alpha\>|]>I+\<beta\>\<Phi\><rsup|T>\<Phi\>|)><rsup|-1>>>>>
  </eqnarray*>

  Note the close similarity to the posterior distribution (3.52) obtained
  when <math|\<alpha\>> was treated as a fixed parameter. The difference is
  that here \<alpha\> is replaced by its expectation <math|E[\<alpha\>]>
  under the variational distribution. Indeed, we have chosen to use the same
  notation for the covariance matrix <math|S<rsub|N>> in both cases.\ 

  Using the standard results (B.27), (B.38), and (B.39), we can obtain the
  required moments as follows

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<alpha\>|]>>|<cell|=>|<cell|a<rsub|N>/b<rsub|N>>>|<row|<cell|\<bbb-E\><around*|[|\<b-w\>\<b-w\><rsup|T>|]>>|<cell|=>|<cell|\<b-m\><rsub|N>\<b-m\><rsub|N><rsup|T>+S<rsub|N>>>>>
  </eqnarray*>

  The evaluation of the variational posterior distribution begins by
  initializing the parameters of one of the distributions <math|q(\<b-w\>)>
  or <math|q(\<alpha\>)>, and then alternately re-estimates these factors in
  turn until a suitable convergence criterion is satisfied (usually specified
  in terms of the lower bound to be discussed shortly).\ 

  It is instructive to relate the variational solution to that found using
  the evidence framework in Section 3.5. To do this consider the case
  <math|a<rsub|0>=b<rsub|0>=0>, corresponding to the limit of an infinitely
  broad prior over <math|\<alpha\>>. The mean of the variational posterior
  distribution <math|q(\<alpha\>)> is then given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<alpha\>|]>>|<cell|=>|<cell|<frac|a<rsub|N>|b<rsub|N>>>>|<row|<cell|>|<cell|=>|<cell|<frac|M/2|\<bbb-E\><around*|[|\<b-w\><rsup|T>\<b-w\>|]>/2>>>|<row|<cell|>|<cell|=>|<cell|<frac|M|\<b-m\><rsup|T><rsub|N>\<b-m\><rsub|N>+Tr<around*|(|S<rsub|N>|)>>>>>>
  </eqnarray*>

  Comparison with (9.63) shows that in the case of this particularly simple
  model, the variational approach gives precisely the same expression as that
  obtained by maximizing the evidence function using EM except that the point
  estimate for <math|\<alpha\>> is replaced by its expected value. Because
  the distribution <math|q(\<b-w\>)> depends on <math|q(\<alpha\>)> only
  through the expectation <math|E[\<alpha\>]>, we see that the two approaches
  will give identical results for the case of an infinitely broad prior.

  <subsection|Predictive distribution>

  The predictive distribution over <math|t>, given a new input
  <math|\<b-x\>>, is easily evaluated for this model using the Gaussian
  variational posterior for the parameters

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|t\|\<b-x\>,\<b-t\>|)>>|<cell|=>|<cell|<big|int>p<around*|(|t\|\<b-x\>,\<b-w\>|)>p<around*|(|\<b-w\>\|\<b-t\>|)>\<mathd\>\<b-w\>>>|<row|<cell|>|<cell|\<simeq\>>|<cell|<big|int>p<around*|(|t\|\<b-x\>,\<b-w\>|)>q<around*|(|\<b-w\>|)>\<mathd\>\<b-w\>>>|<row|<cell|>|<cell|=>|<cell|<big|int>\<cal-N\><around*|(|t\|\<b-w\><rsup|T>\<b-varphi\><around*|(|\<b-x\>|)>,\<beta\><rsup|-1>|)>\<cal-N\><around*|(|\<b-w\>\|\<b-m\><rsub|N>,S<rsub|N>|)>\<mathd\>\<b-w\>>>|<row|<cell|>|<cell|=>|<cell|\<cal-N\><around*|(|t\|\<b-m\><rsub|N><rsup|T>\<b-varphi\><around*|(|\<b-x\>|)>,\<sigma\><rsup|2><around*|(|\<b-x\>|)>|)>>>>>
  </eqnarray*>

  where we have evaluated the integral by making use of the result (2.115)
  for the linear-Gaussian model. Here the input-dependent variance is given
  by

  <\equation*>
    \<sigma\><rsup|2><around*|(|\<b-x\>|)>=<frac|1|\<beta\>>+\<b-varphi\><around*|(|x|)><rsup|T>S<rsub|N>\<b-varphi\><around*|(|\<b-x\>|)>
  </equation*>

  Note that this takes the same form as the result (3.59) obtained with fixed
  <math|\<alpha\>> except that now the expected value
  <math|\<bbb-E\>[\<alpha\>]> appears in the definition of <math|S<rsub|N>>.

  <subsection|Lower bound>

  Another quantity of importance is the lower bound <math|\<cal-L\>> defined
  by

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<cal-L\><around*|(|q|)>>|<cell|=>|<cell|\<bbb-E\><around*|[|ln
    p<around*|(|\<b-w\>,\<alpha\>,\<b-t\>|)>|]>-\<bbb-E\><around*|[|ln
    q<around*|(|\<b-w\>,\<alpha\>|)>|]>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><rsub|\<b-w\>><around*|[|ln
    p<around*|(|\<b-t\>\|\<b-w\>|)>|]>+\<bbb-E\><rsub|\<b-w\>,\<alpha\>><around*|[|ln
    p<around*|(|\<b-w\>\|\<alpha\>|)>|]>+\<bbb-E\><rsub|\<alpha\>><around*|[|ln
    p<around*|(|\<alpha\>|)>|]>-\<bbb-E\><rsub|\<b-w\>><around*|[|ln
    q<around*|(|\<b-w\>|)>|]>-\<bbb-E\><rsub|\<alpha\>><around*|[|ln
    q<around*|(|\<alpha\>|)>|]>>>>>
  </eqnarray*>

  Evaluation of the various terms is straightforward, making use of results
  obtained in previous chapters, and gives

  <\eqnarray*>
    <tformat|<table|<row|<cell|E<rsub|\<b-w\>><around*|[|ln
    p<around*|(|\<b-t\>\|\<b-w\>|)>|]>>|<cell|=>|<cell|<frac|N|2>ln<around*|(|<frac|\<beta\>|2\<pi\>>|)>-<frac|\<beta\>|2>\<b-t\><rsup|T>\<b-t\>+\<beta\>\<b-m\><rsup|T><rsub|N>\<Phi\><rsup|T>\<b-t\>-<frac|\<beta\>|2>Tr<around*|[|\<Phi\><rsup|T>\<Phi\><around*|(|\<b-m\><rsub|N>\<b-m\><rsub|N><rsup|T>+S<rsub|N>|)>|]>>>|<row|<cell|\<bbb-E\><rsub|\<b-w\>,\<alpha\>><around*|[|ln
    p<around*|(|\<b-w\>\|\<alpha\>|)>|]>>|<cell|=>|<cell|-<frac|M|2>ln<around*|(|2\<pi\>|)>+<frac|M|2><around*|(|\<psi\><around*|(|a<rsub|N>|)>-ln
    b<rsub|N>|)>-<frac|2a<rsub|N>|2b<rsub|N>><around*|[|\<b-m\><rsup|T><rsub|N>\<b-m\><rsub|N>+Tr<around*|(|S<rsub|N>|)>|]>>>|<row|<cell|\<bbb-E\><rsub|\<alpha\>><around*|[|ln
    p<around*|(|\<alpha\>|)>|]>>|<cell|=>|<cell|a<rsub|0>ln
    b<rsub|0>+<around*|(|a<rsub|0>-1|)><around*|[|\<psi\><around*|(|a<rsub|N>|)>-ln
    b<rsub|N>|]>-b<rsub|0><frac|a<rsub|N>|b<rsub|N>>-ln\<Gamma\><around*|(|a<rsub|0>|)>>>|<row|<cell|-\<bbb-E\><rsub|\<b-w\>><around*|[|ln
    q<around*|(|\<b-w\>|)>|]>>|<cell|=>|<cell|<frac|1|2>ln<around*|\||S<rsub|N>|\|>+<frac|M|2><around*|[|1+ln<around*|(|2\<pi\>|)>|]>>>|<row|<cell|-\<bbb-E\><rsub|\<alpha\>><around*|[|ln
    q<around*|(|\<alpha\>|)>|]>>|<cell|=>|<cell|ln\<Gamma\><around*|(|a<rsub|N>|)>-<around*|(|a<rsub|N>-1|)>\<psi\><around*|(|a<rsub|N>|)>-ln
    b<rsub|N>+a<rsub|N>>>>>
  </eqnarray*>

  Figure 10.9 shows a plot of the lower bound <math|\<cal-L\>(q)> versus the
  degree of a polynomial model for a synthetic data set generated from a
  degree three polynomial. Here the prior parameters have been set to
  <math|a<rsub|0>=b<rsub|0>=0>, corresponding to the noninformative prior
  <math|p(\<alpha\>) \<propto\> 1/\<alpha\>>, which is uniform over
  <math|ln\<alpha\>> as discussed in Section 2.3.6. As we saw in Section
  10.1, the quantity <math|\<cal-L\>> represents lower bound on the log
  marginal likelihood <math|ln p(\<b-t\>\|M)> for the model. If we assign
  equal prior probabilities <math|p(M)> to the different values of <math|M>,
  then we can interpret <math|\<cal-L\>> as an approximation to the posterior
  model probability <math|p(M\|\<b-t\>)>. Thus the variational framework
  assigns the highest probability to the model with <math|M=3>. This should
  be contrasted with the maximum likelihood result, which assigns ever
  smaller residual error to models of increasing complexity until the
  residual error is driven to zero, causing maximum likelihood to favour
  severely over-fitted models.

  <\padded-center>
    <small-figure|<image|image/fig_10_9_lower_bound_polynomial.png|0.3par|||>|Plot
    of the lower bound <math|\<cal-L\>> versus the order <math|M> of the
    polynomial, for a polynomial model, in which a set of 10 data points is
    generated from a polynomial with <math|M=3> sampled over the interval
    <math|(\<minus\>5,5)> with additive Gaussian noise of variance
    <math|0.09>. The value of the bound gives the log probability of the
    model, and we see that the value of the bound peaks at <math|M=3>,
    corresponding to the true model from which the data set was generated.>
  </padded-center>

  <section|Exponential Family Distributions>

  In Chapter 2, we discussed the important role played by the exponential
  family of distributions and their conjugate priors. For many of the models
  discussed in this book, the complete-data likelihood is drawn from the
  exponential family. However, in general this will not be the case for the
  marginal likelihood function for the observed data. For example, in a
  mixture of Gaussians, the joint distribution of observations
  <math|\<b-x\><rsub|n>> and corresponding hidden variables
  <math|\<b-z\><rsub|n>> is a member of the exponential family, whereas the
  marginal distribution of <math|\<b-x\><rsub|n>> is a mixture of Gaussians
  and hence is not.\ 

  Up to now we have grouped the variables in the model into observed
  variables and hidden variables. We now make a further distinction between
  latent variables, denoted <math|Z>, and parameters, denoted
  <math|\<b-theta\>>, where parameters are intensive (fixed in number
  independent of the size of the data set), whereas latent variables are
  extensive (scale in number with the size of the data set). For example, in
  a Gaussian mixture model, the indicator variables <math|z<rsub|kn>> (which
  specify which component <math|k> is responsible for generating data point
  <math|\<b-x\><rsub|n>>) represent the latent variables, whereas the means
  <math|\<b-mu\><rsub|k>>, precisions <math|\<Lambda\><rsub|k>> and mixing
  proportions <math|\<pi\><rsub|k>> represent the parameters.\ 

  Consider the case of independent identically distributed data. We denote
  the data values by <math|X={\<b-x\><rsub|n>}>, where <math|n=1,\<cdots\>,N>
  , with corresponding latent variables <math|Z={\<b-z\><rsub|n>}>. Now
  suppose that the joint distribution of observed and latent variables is a
  member of the exponential family, parameterized by natural parameters
  <math|\<b-eta\>> so that

  <\equation*>
    p<around*|(|X,Z\|\<b-eta\>|)>=<big|prod><rsub|n=1><rsup|N>h<around*|(|\<b-x\><rsub|n>,\<b-z\><rsub|n>|)>g<around*|(|\<b-eta\>|)>exp<around*|{|\<b-eta\><rsup|T>\<b-u\><around*|(|\<b-x\><rsub|n>,\<b-z\><rsub|n>|)>|}>
  </equation*>

  We shall also use a conjugate prior for <math|\<b-eta\>>, which can be
  written as

  <\equation*>
    p<around*|(|\<b-eta\>\|\<nu\><rsub|0>,\<b-v\><rsub|0>|)>=f<around*|(|\<nu\><rsub|0>,\<b-chi\><rsub|0>|)>g<around*|(|\<b-eta\>|)><rsup|\<nu\><rsub|0>>exp<around*|{|\<nu\><rsub|0>\<b-eta\><rsup|T>\<b-chi\><rsub|0>|}>
  </equation*>

  Recall that the conjugate prior distribution can be interpreted as a prior
  number <math|\<nu\><rsub|0>> of observations all having the value
  <math|\<b-chi\><rsub|0>> for the <math|\<b-u\>> vector. Now consider a
  variational distribution that factorizes between the latent variables and
  the parameters, so that <math|q(Z,\<b-eta\>) = q(Z)q(\<b-eta\>)>. Using the
  general result (10.9), we can solve for the two factors as follows

  <\eqnarray*>
    <tformat|<table|<row|<cell|ln q<rsup|\<ast\>><around*|(|Z|)>>|<cell|=>|<cell|\<bbb-E\><rsub|\<b-eta\>><around*|[|ln
    p<around*|(|X,Z\|\<b-eta\>|)>|]>+const>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N><around*|{|ln
    h<around*|(|\<b-x\><rsub|n,>\<b-z\><rsub|n>|)>+\<bbb-E\><around*|[|\<b-eta\><rsup|T>|]>\<b-u\><around*|(|\<b-x\><rsub|n>,\<b-z\><rsub|n>|)>|}>+const>>>>
  </eqnarray*>

  Thus we see that this decomposes into a sum of independent terms, one for
  each value of <math|n>, and hence the solution for
  <math|q<rsup|\<ast\>>(Z)> will factorize over <math|n> so that
  <math|q<rsup|\<ast\>><around*|(|Z|)>=<big|prod><rsub|n>q<rsup|\<ast\>><around*|(|\<b-z\><rsub|n>|)>.>
  This is an example of an induced factorization. Taking the exponential of
  both sides, we have

  <\equation*>
    q<rsup|\<ast\>><around*|(|\<b-z\><rsub|n>|)>=h<around*|(|\<b-x\><rsub|n>,\<b-z\><rsub|n>|)>g<around*|(|\<bbb-E\><around*|[|\<b-eta\>|]>|)>exp<around*|{|\<bbb-E\><around*|[|\<b-eta\><rsup|T>|]>\<b-u\><around*|(|\<b-x\><rsub|n>,\<b-z\><rsub|n>|)>|}>
  </equation*>

  where the normalization coefficient has been reinstated by comparison
  standard form for the exponential family.\ 

  Similarly, for the variational distribution over the parameters, we have

  <\eqnarray*>
    <tformat|<table|<row|<cell|ln q<rsup|\<ast\>><around*|(|\<b-eta\>|)>>|<cell|=>|<cell|ln
    p<around*|(|\<b-eta\>\|\<nu\><rsub|0>,\<b-chi\><rsub|0>|)>+\<bbb-E\><rsub|Z><around*|[|ln
    p<around*|(|X,Z\|\<b-eta\>|)>|]>+const>>|<row|<cell|>|<cell|=>|<cell|\<nu\><rsub|0>ln
    g<around*|(|\<b-eta\>|)>+\<nu\><rsub|0>\<b-eta\><rsup|T>\<b-chi\><rsub|0>+<big|sum><rsub|n=1><rsup|N><around*|{|ln
    g<around*|(|\<b-eta\>|)>+\<b-eta\><rsup|T>\<bbb-E\><rsub|\<b-z\><rsub|n>><around*|[|\<b-u\><around*|(|\<b-x\><rsub|n>,\<b-z\><rsub|n>|)>|]>|}>+const>>>>
  </eqnarray*>

  Again, taking the exponential of both sides, and re-instating the
  normalization coefficient by inspection, we have

  <\equation*>
    q<rsup|\<ast\>><around*|(|\<b-eta\>|)>=f<around*|(|v<rsub|N>,\<b-chi\><rsub|N>|)>g<around*|(|\<b-eta\>|)><rsup|\<nu\><rsub|N>>exp<around*|{|\<nu\><rsub|N>\<b-eta\><rsup|T>\<b-chi\><rsub|N>|}>
  </equation*>

  where we have defined

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<nu\><rsub|N>>|<cell|=>|<cell|\<nu\><rsub|0>+N>>|<row|<cell|\<nu\><rsub|N>\<b-chi\><rsub|N>>|<cell|=>|<cell|\<nu\><rsub|0>\<b-chi\><rsub|0>+<big|sum><rsub|n=1><rsup|N>\<bbb-E\><rsub|\<b-z\><rsub|n>><around*|[|\<b-u\><around*|(|\<b-x\><rsub|n>,\<b-z\><rsub|n>|)>|]>>>>>
  </eqnarray*>

  Note that the solutions for <math|q<rsup|\<ast\>>(\<b-z\><rsub|n>)> and
  <math|q<rsup|\<ast\>>(\<b-eta\>)> are coupled, and so we solve them
  iteratively in a two-stage procedure. In the variational E step, we
  evaluate the expected sufficient statistics
  <math|\<bbb-E\>[\<b-u\>(\<b-x\><rsub|n>,\<b-z\><rsub|n>)]> using the
  current posterior distribution <math|q(z<rsub|n>)> over the latent
  variables and use this to compute a revised posterior distribution
  <math|q(\<b-eta\>)> over the parameters. Then in the subsequent variational
  M step, we use this revised parameter posterior distribution to find the
  expected natural parameters <math|\<bbb-E\>[\<b-eta\><rsup|T>]>, which
  gives rise to a revised variational distribution over the latent variables.

  <subsection|Variational message passing>

  We have illustrated the application of variational methods by considering a
  specific model, the Bayesian mixture of Gaussians, in some detail. This
  model can be described by the directed graph shown in Figure 10.5. Here we
  consider more generally the use of variational methods for models described
  by directed graphs and derive a number of widely applicable results.\ 

  The joint distribution corresponding to a directed graph can be written
  using the decomposition

  <\equation>
    p<around*|(|\<b-x\>|)>=<big|prod><rsub|i>p<around*|(|\<b-x\><rsub|i>\|pa<rsub|i>|)><label|10.122>
  </equation>

  where <math|\<b-x\><rsub|i>> denotes the variable(s) associated with node
  <math|i>, and <math|pa<rsub|i>> denotes the parent set corresponding to
  node <math|i>. Note that <math|\<b-x\><rsub|i>> may be a latent variable or
  it may belong to the set of observed variables. Now consider a variational
  approximation in which the distribution <math|q(\<b-x\>)> is assumed to
  factorize with respect to the <math|\<b-x\><rsub|i>> so that

  <\equation*>
    q<around*|(|\<b-x\>|)>=<big|prod><rsub|i>q<rsub|i><around*|(|\<b-x\><rsub|i>|)>
  </equation*>

  Note that for observed nodes, there is no factor <math|q(\<b-x\><rsub|i>)>
  in the variational distribution. We now substitute Eq. <eqref|10.122> into
  our general result (10.9) to give

  <\equation*>
    ln q<rsup|\<ast\>><rsub|j><around*|(|\<b-x\><rsub|j>|)>=\<bbb-E\><rsub|i\<neq\>j><around*|[|<big|sum><rsub|i>ln
    p<around*|(|\<b-x\><rsub|i>\|pa<rsub|i>|)>|]>+const
  </equation*>

  Any terms on the right-hand side that do not depend on
  <math|\<b-x\><rsub|j>> can be absorbed into the additive constant. In fact,
  the only terms that do depend on <math|\<b-x\><rsub|j>> are the conditional
  distribution for <math|\<b-x\><rsub|j>> given by
  <math|p(\<b-x\><rsub|j>\|pa<rsub|j>)> together with any other conditional
  distributions that have <math|\<b-x\><rsub|j>> in the conditioning set. By
  definition, these conditional distributions correspond to the children of
  node <math|j>, and they therefore also depend on the <em|co-parents> of the
  child nodes, i.e., the other parents of the child nodes besides node
  <math|\<b-x\><rsub|j>> itself. We see that the set of all nodes on which
  <math|q<rsup|\<ast\>><rsub|j>(<math-bf|x><rsub|j>)> depends corresponds to
  the Markov blanket of node <math|\<b-x\><rsub|j>>, as illustrated in Figure
  8.26. Thus the update of the factors in the variational posterior
  distribution represents a local calculation on the graph. This makes
  possible the construction of general purpose software for variational
  inference in which the form of the model does not need to be specified in
  advance (Bishop et al., 2003).\ 

  If we now specialize to the case of a model in which all of the conditional
  distributions have a conjugate-exponential structure, then the variational
  update procedure can be cast in terms of a local message passing algorithm
  (Winn and Bishop, 2005). In particular, the distribution associated with a
  particular node can be updated once that node has received messages from
  all of its parents and all of its children. This in turn requires that the
  children have already received messages from their co-parents. The
  evaluation of the lower bound can also be simplified because many of the
  required quantities are already evaluated as part of the message passing
  scheme. This distributed message passing formulation has good scaling
  properties and is well suited to large networks.

  <section|Local Variational Methods>

  The variational framework discussed in Sections 10.1 and 10.2 can be
  considered a `global' method in the sense that it directly seeks an
  approximation to the full posterior distribution over all random variables.
  An alternative `local' approach involves finding bounds on functions over
  individual variables or groups of variables within a model. For instance,
  we might seek a bound on a conditional distribution <math|p(y\|x)>, which
  is itself just one factor in a much larger probabilistic model specified by
  a directed graph. The purpose of introducing the bound of course is to
  simplify the resulting distribution. This local approximation can be
  applied to multiple variables in turn until a tractable approximation is
  obtained, and in Section 10.6.1 we shall give a practical example of this
  approach in the context of logistic regression. Here we focus on developing
  the bounds themselves.\ 

  We have already seen in our discussion of the Kullback-Leibler divergence
  that the convexity of the logarithm function played a key role in
  developing the lower bound in the global variational approach. We have
  defined a (strictly) convex func- tion as one for which every chord lies
  above the function. Convexity also plays a central role in the local
  variational framework. Note that our discussion will ap- ply equally to
  concave functions with `min' and `max' interchanged and with lower bounds
  replaced by upper bounds.\ 

  Let us begin by considering a simple example, namely the function
  <math|f(x)=exp(\<minus\>x)>, which is a convex function of <math|x>, and
  which is shown in the left-hand plot of Figure <reference|fig10.10>. Our
  goal is to approximate <math|f(x)> by a simpler function, in particular a
  linear function of <math|x>. From Figure <reference|fig10.10>, we see that
  this linear function will be a lower bound on <math|f(x)> if it corresponds
  to a tangent. We can obtain the tangent line <math|y(x)> at a specific
  value of <math|x>, say <math|x=\<xi\>>, by making a first order Taylor
  expansion\ 

  <\equation>
    y(x) = f(\<xi\>) + f<rprime|'>(\<xi\>)(x \<minus\> \<xi\>)<label|10.125>
  </equation>

  so that <math|y(x)\<leqslant\>f(x)> with equality when <math|x=\<xi\>>. For
  our example function <math|f(x)=exp(\<minus\>x)>, we therefore obtain the
  tangent line in the form\ 

  <\equation*>
    y(x) = exp(\<minus\>\<xi\>) \<minus\> exp(\<minus\>\<xi\>)(x \<minus\>
    \<xi\>)
  </equation*>

  which is a linear function parameterized by <math|\<xi\>>. For consistency
  with subsequent discussion, let us define
  <math|\<eta\>=\<minus\>exp(\<minus\>\<xi\>)> so that\ 

  <\equation*>
    y(x, \<eta\>) =\<eta\>x \<minus\>\<eta\> + \<eta\>
    ln(\<minus\>\<lambda\>).
  </equation*>

  Different values of <math|\<eta\>> correspond to different tangent lines,
  and because all such lines are lower bounds on the function, we have
  <math|f(x)\<geqslant\>y(x,\<eta\>)>. Thus we can write the function in the
  form\ 

  <\equation*>
    f (x) = max<rsub|\<eta\>> {\<eta\>x \<minus\>\<eta\> +\<eta\>
    ln(\<minus\>\<eta\>)} .
  </equation*>

  We have succeeded in approximating the convex function <math|f(x)> by a
  simpler, linear function <math|y(x,\<eta\>)>. The price we have paid is
  that we have introduced a variational parameter <math|\<eta\>>, and to
  obtain the tightest bound we must optimize with respect to <math|\<eta\>>.

  <\padded-center>
    <small-figure|<image|image/fig_10_10_lower_bound_tangent.png|0.5par|||>|<label|fig10.10>In
    the left-hand figure the red curve shows the function exp(\<minus\>x),
    and the blue line shows the tangent at <math|x=\<xi\>> defined by Eq.
    <eqref|10.125> with <math|\<xi\>=1>. This line has slope
    <math|\<eta\>=f<rprime|'>(\<xi\>)=\<minus\>exp(\<minus\>\<xi\>)>. Note
    that any other tangent line, for example the ones shown in green, will
    have a smaller value of <math|y> at <math|x=\<xi\>>. The right-hand
    figure shows the corresponding plot of the function
    <math|\<eta\>\<xi\>\<minus\>g(\<eta\>)>, where <math|g(\<eta\>)> is given
    by Eq. <eqref|10.131>, versus <math|\<eta\>> for <math|\<xi\>=1>, in
    which the maximum corresponds to <math|\<eta\>=\<minus\>exp(\<minus\>\<xi\>)=\<minus\>1/e>.>
  </padded-center>

  \;

  We can formulate this approach more generally using the framework of convex
  duality (Rockafellar, 1972; Jordan et al., 1999). Consider the illustration
  of a convex function <math|f(x)> shown in the left-hand plot in Figure
  <reference|fig10.11>. In this example, the function <math|\<eta\>x> is a
  lower bound on <math|f(x)> but it is not the best lower bound that can be
  achieved by a linear function having slope <math|\<eta\>>, because the
  tightest bound is given by the tangent line. Let us write the equation of
  the tangent line, having slope <math|\<eta\>> as
  <math|\<eta\>x\<minus\>g(\<eta\>)> where the (negative) intercept
  <math|g(\<eta\>)> clearly depends on the slope <math|\<eta\>> of the
  tangent. To determine the intercept, we note that the line must be moved
  vertically by an amount equal to the smallest vertical distance between the
  line and the function, as shown in Figure <eqref|fig10.11>. Thus

  <\eqnarray*>
    <tformat|<table|<row|<cell|g<around*|(|\<eta\>|)>>|<cell|=>|<cell|-min<rsub|x><around*|{|f<around*|(|x|)>-\<eta\>x|}>>>|<row|<cell|>|<cell|=>|<cell|max<rsub|x><around*|{|\<eta\>x-f<around*|(|x|)>|}><eq-number><label|10.129>>>>>
  </eqnarray*>

  <\padded-center>
    <\small-figure|<image|image/fig_10_11_convex_duality.png|0.7par|||>>
      <label|fig10.11>In the left-hand plot the red curve shows a convex
      function <math|f(x)>, and the blue line represents the linear function
      <math|\<eta\>x>, which is a lower bound on <math|f(x)> because
      <math|f(x)\<gtr\>\<eta\>x> for all <math|x>. For the given value of
      slope <math|\<eta\>> the contact point of the tangent line having the
      same slope is found by minimizing with respect to <math|x> the
      discrepancy (shown by the green dashed lines) given by
      <math|f(x)\<minus\>\<eta\>x>. This defines the dual function
      <math|g(\<eta\>)>, which corresponds to the (negative of the) intercept
      of the tangent line having slope <math|\<eta\>>.
    </small-figure>
  </padded-center>

  Now, instead of fixing <math|\<eta\>> and varying <math|x>, we can consider
  a particular <math|x> and then adjust <math|\<eta\>> until the tangent
  plane is tangent at that particular <math|x>. Because the <math|y> value of
  the tangent line at a particular <math|x> is maximized when that value
  coincides with its contact point, we have\ 

  <\equation>
    f (x) = max<rsub|\<eta\>>{\<eta\>x \<minus\> g(\<eta\>)}.<label|10.130>
  </equation>

  We see that the functions <math|f(x>) and <math|g(\<eta\>)> play a dual
  role, and are related through Eq. <eqref|10.129> and <eqref|10.130>.

  Let us apply these duality relations to our simple example
  <math|f(x)=exp(\<minus\>x)>. From Eq. <eqref|10.129> we see that the
  maximizing value of <math|x> is given by
  <math|\<xi\>=\<minus\>ln(\<minus\>\<eta\>)>, and back-substituting we
  obtain the conjugate function <math|g(\<eta\>)> in the form\ 

  <\equation>
    g(\<eta\>)=\<eta\> \<minus\>\<eta\> ln(\<minus\>\<eta\>)<label|10.131>
  </equation>

  as obtained previously. The function <math|\<eta\>\<xi\>\<minus\>g(\<eta\>)>
  is shown, for <math|\<xi\>=1> in the right-hand plot in Figure
  <reference|fig10.10>. As a check, we can substitute Eq. <eqref|10.131> into
  Eq. <eqref|10.130>, which gives the maximizing value of
  <math|\<eta\>=\<minus\>exp(\<minus\>x)>, and back-substituting then
  recovers the original function <math|f(x)= exp(\<minus\>x)>.\ 

  For concave functions, we can follow a similar argument to obtain upper
  bounds, in which \<#2018\>max' is replaced with `min', so that

  <\eqnarray*>
    <tformat|<table|<row|<cell|f<around*|(|x|)>>|<cell|=>|<cell|min<rsub|\<eta\>><around*|{|\<eta\>x-g<around*|(|\<eta\>|)>|}><eq-number><label|10.132>>>|<row|<cell|g<around*|(|\<eta\>|)>>|<cell|=>|<cell|min<rsub|x><around*|{|\<eta\>x-f<around*|(|x|)>|}><eq-number><label|10.133>>>>>
  </eqnarray*>

  \;

  If the function of interest is not convex (or concave), then we cannot
  directly apply the method above to obtain a bound. However, we can first
  seek invertible transformations either of the function or of its argument
  which change it into a convex form. We then calculate the conjugate
  function and then transform back to the original variables.

  An important example, which arises frequently in pattern recognition, is
  the logistic sigmoid function defined by\ 

  <\equation>
    \<sigma\><around*|(|x|)>=<frac|1|1+e<rsup|-x>><label|10.134>
  </equation>

  As it stands this function is neither convex nor concave. However, if we
  take the logarithm we obtain a function which is concave, as is easily
  verified by finding the second derivative. From Eq.<eqref|10.133> the
  corresponding conjugate function then takes the form\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|g<around*|(|\<eta\>|)>>|<cell|=>|<cell|min<rsub|x><around*|{|\<eta\>x-f<around*|(|x|)>|}>>>|<row|<cell|>|<cell|=>|<cell|-\<eta\>ln\<eta\>-<around*|(|1-\<eta\>|)>ln<around*|(|1-\<lambda\>|)>>>>>
  </eqnarray*>

  which we recognize as the binary entropy function for a variable whose
  probability of having the value <math|1> is <math|\<eta\>>. Using Eq.
  <eqref|10.132>, we then obtain an upper bound on the log sigmoid

  <\equation*>
    ln \<sigma\>(x)\<leqslant\>\<lambda\>x \<minus\> g(\<lambda\>)
  </equation*>

  and taking the exponential, we obtain an upper bound on the logistic
  sigmoid itself of the form\ 

  <\equation>
    \<sigma\>(x)\<leqslant\> exp(\<eta\>x \<minus\> g(\<eta\>))<label|10.137>
  </equation>

  which is plotted for two values of <math|\<eta\>> on the left-hand plot in
  Figure 10.12.

  <\padded-center>
    <small-figure|<image|image/fig_10_12_bound_sigmoid.png|0.7par|||>|<label|fig10.12>The
    left-hand plot shows the logistic sigmoid function <math|\<sigma\>(x)>
    defined by Eq. <eqref|10.134> in red, together with two examples of the
    exponential upper bound Eq. <eqref|10.137> shown in blue. The right-hand
    plot shows the logistic sigmoid again in red together with the Gaussian
    lower bound Eq. <eqref|10.144> shown in blue. Here the parameter
    <math|\<xi\>=2.5>, and the bound is exact at <math|x=\<xi\>> and
    <math|x=\<minus\>\<xi\>>, denoted by the dashed green lines.>
  </padded-center>

  We can also obtain a lower bound on the sigmoid having the functional form
  of a Gaussian. To do this, we follow Jaakkola and Jordan (2000) and make
  transformations both of the input variable and of the function itself.
  First we take the log of the logistic function and then decompose it so
  that\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|ln \<sigma\>(x)>|<cell|=>|<cell|\<minus\> ln(1
    + e<rsup|\<minus\>x>) >>|<row|<cell|>|<cell|=>|<cell| \<minus\> ln
    <around*|{|e<rsup|-x/2><around*|(|e<rsup|x/2> +
    e<rsup|\<minus\>x/2>|)>|}>>>|<row|<cell|>|<cell|=>|<cell|x/2 \<minus\>
    ln(e<rsup|x/2> + e<rsup|\<minus\>x/2>)>>>>
  </eqnarray*>

  We now note that the function <math|f(x)=\<minus\>ln(e<rsup|x/2> +
  e<rsup|\<minus\>x/2>)> is a convex function of the variable
  <math|x<rsup|2>>, as can again be verified by finding the second
  derivative. This leads to a lower bound on <math|f(x)>, which is a linear
  function of <math|x<rsup|2>> whose conjugate function is given by

  <\equation*>
    g<around*|(|\<eta\>|)>=max<rsub|x<rsup|2>><around*|{|\<eta\>x<rsup|2>-f<around*|(|<sqrt|x<rsup|2>>|)>|}>
  </equation*>

  The stationarity condition leads to\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|0>|<cell|=>|<cell|\<eta\>-<frac|\<mathd\>x|\<mathd\>x<rsup|2>><frac|\<mathd\>|\<mathd\>x>f<around*|(|x|)>>>|<row|<cell|>|<cell|=>|<cell|\<eta\>+<frac|1|4x>tanh<around*|(|<frac|x|2>|)>>>>>
  </eqnarray*>

  If we denote this value of <math|x>, corresponding to the contact point of
  the tangent line for this particular value of <math|\<eta\>>, by
  <math|\<xi\>>, then we have\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<eta\><around*|(|\<xi\>|)>>|<cell|=>|<cell|-<frac|1|4\<xi\>>tanh<around*|(|<frac|\<xi\>|2>|)>>>|<row|<cell|>|<cell|=>|<cell|-<frac|1|2\<xi\>><around*|[|\<sigma\><around*|(|\<xi\>|)>-<frac|1|2>|]>=-\<lambda\><around*|(|\<xi\>|)><eq-number><label|10.141>>>>>
  </eqnarray*>

  where we have defined <math|\<lambda\>=\<minus\>\<eta\>> to maintain
  consistency with Jaakkola and Jordan (2000).

  Instead of thinking of <math|\<lambda\>> as the variational parameter, we
  can let <math|\<xi\>> play this role as this leads to simpler expressions
  for the conjugate function, which is then given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|g<around*|(|\<lambda\>|)>>|<cell|=>|<cell|-\<lambda\><around*|(|\<xi\>|)>\<xi\><rsup|2>-f<around*|(|\<xi\>|)>>>|<row|<cell|>|<cell|=>|<cell|-\<lambda\><around*|(|\<xi\>|)>\<xi\><rsup|2>+ln<around*|(|e<rsup|\<xi\>/2>+e<rsup|-\<xi\>/2>|)>>>>>
  </eqnarray*>

  Hence the bound on <math|f(x)> can be written as

  <\eqnarray*>
    <tformat|<table|<row|<cell|f<around*|(|x|)>>|<cell|\<geqslant\>>|<cell|-\<lambda\><around*|(|\<xi\>|)>x<rsup|2>-g<around*|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=>|<cell|-\<lambda\><around*|(|\<xi\>|)>x<rsup|2>+\<lambda\><around*|(|\<xi\>|)>\<xi\><rsup|2>-ln<around*|(|e<rsup|\<xi\>/2>+e<rsup|-\<xi\>/2>|)>>>>>
  </eqnarray*>

  The bound on the sigmoid then becomes

  <\equation>
    \<sigma\><around*|(|x|)>\<geqslant\>\<sigma\><around*|(|\<xi\>|)>exp<around*|{|<around*|(|x-\<xi\>|)>/2-\<lambda\><around*|(|\<xi\>|)><around*|(|x<rsup|2>-\<xi\><rsup|2>|)>|}><label|10.144>
  </equation>

  where <math|\<lambda\>(\<xi\>)> is defined by Eq. <eqref|10.141>. This
  bound is illustrated in the right-hand plot of Figure <reference|fig10.12>.
  We see that the bound has the form of the exponential of a quadratic
  function of <math|x>, which will prove useful when we seek Gaussian
  representations of posterior distributions defined through logistic sigmoid
  functions.\ 

  The logistic sigmoid arises frequently in probabilistic models over binary
  variables because it is the function that transforms a log odds ratio into
  a posterior probability. The corresponding transformation for a multiclass
  distribution is given by the softmax function. Unfortunately, the lower
  bound derived here for the logistic sigmoid does not directly extend to the
  softmax. Gibbs (1997) proposes a method for constructing a Gaussian
  distribution that is conjectured to be a bound (although no rigorous proof
  is given), which may be used to apply local variational methods to
  multiclass problems.\ 

  We shall see an example of the use of local variational bounds in Sections
  10.6.1. For the moment, however, it is instructive to consider in general
  terms how these bounds can be used. Suppose we wish to evaluate an integral
  of the form

  <\equation*>
    I=<big|int>\<sigma\><around*|(|a|)>p<around*|(|a|)>\<mathd\>a
  </equation*>

  where <math|\<sigma\>(a)> is the logistic sigmoid, and <math|p(a)> is a
  Gaussian probability density. Such integrals arise in Bayesian models when,
  for instance, we wish to evaluate the predictive distribution, in which
  case <math|p(a)> represents a posterior parameter distribution. Because the
  integral is intractable, we employ the variational bound Eq.
  <eqref|10.144>, which we write in the form
  <math|\<sigma\>(a)\<geqslant\>f(a,\<xi\>)> where <math|\<xi\>> is a
  variational parameter. The integral now becomes the product of two
  exponential-quadratic functions and so can be integrated analytically to
  give a bound on <math|I>

  <\equation*>
    I\<geqslant\><big|int>f<around*|(|a,\<xi\>|)>p<around*|(|a|)>\<mathd\>a=F<around*|(|\<xi\>|)>
  </equation*>

  We now have the freedom to choose the variational parameter <math|\<xi\>>,
  which we do by finding the value <math|\<xi\>> that maximizes the function
  <math|F(\<xi\>)>. The resulting value <math|F(\<xi\>)> represents the
  tightest bound within this family of bounds and can be used as an
  approximation to <math|I>. This optimized bound, however, will in general
  not be exact. Although the bound <math|\<sigma\>(a)\<geqslant\>f(a,\<xi\>)>
  on the logistic sigmoid can be optimized exactly, the required choice for
  <math|\<xi\>> depends on the value of <math|a>, so that the bound is exact
  for one value of <math|a> only. Because the quantity <math|F(\<xi\>)> is
  obtained by integrating over all values of <math|a>, the value of
  <math|\<xi\>> represents a compromise, weighted by the distribution
  <math|p(a)>.

  <section|Variational Logistic Regression>

  We now illustrate the use of local variational methods by returning to the
  Bayesian logistic regression model studied in Section 4.5. There we
  focussed on the use of the Laplace approximation, while here we consider a
  variational treatment based on the approach of Jaakkola and Jordan (2000).
  Like the Laplace method, this also leads to a Gaussian approximation to the
  posterior distribution. However, the greater flexibility of the variational
  approximation leads to improved accuracy compared to the Laplace method.
  Furthermore (unlike the Laplace method), the variational approach is
  optimizing a well defined objective function given by a rigourous bound on
  the model evidence. Logistic regression has also been treated by Dybowski
  and Roberts (2005) from a Bayesian perspective using Monte Carlo sampling
  techniques.

  <subsection|Variational posterior distribution>

  Here we shall make use of a variational approximation based on the local
  bounds introduced in Section 10.5. This allows the likelihood function for
  logistic regression, which is governed by the logistic sigmoid, to be
  approximated by the exponential of a quadratic form. It is therefore again
  convenient to choose a conjugate Gaussian prior of the form (4.140). For
  the moment, we shall treat the hyperparameters <math|\<b-m\><rsub|0>> and
  <math|S<rsub|0>> as fixed constants. In Section 10.6.3, we shall
  demonstrate how the variational formalism can be extended to the case where
  there are unknown hyperparameters whose values are to be inferred from the
  data.

  In the variational framework, we seek to maximize a lower bound on the
  marginal likelihood. For the Bayesian logistic regression model, the
  marginal likelihood takes the form

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|\<b-t\>|)>>|<cell|=>|<cell|<big|int>p<around*|(|\<b-t\>\|\<b-w\>|)>p<around*|(|\<b-w\>|)>\<mathd\>\<b-w\>>>|<row|<cell|>|<cell|=>|<cell|<big|int><around*|[|<big|prod><rsub|n=1><rsup|N>p<around*|(|t<rsub|n>\|\<b-w\>|)>|]>p<around*|(|\<b-w\>|)>\<mathd\>\<b-w\>>>>>
  </eqnarray*>

  We first note that the conditional distribution for t can be written as

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|t\|\<b-w\>|)>>|<cell|=>|<cell|\<sigma\><around*|(|a|)><rsup|t><around*|{|1-\<sigma\><around*|(|a|)>|}><rsup|1-t>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|<frac|1|1+e<rsup|-a>>|)><rsup|t><around*|(|1-<frac|1|1+e<rsup|-a>>|)><rsup|1-t>>>|<row|<cell|>|<cell|=>|<cell|e<rsup|a*t><frac|e<rsup|-a>|1+e<rsup|-a>>>>|<row|<cell|>|<cell|=>|<cell|e<rsup|a*t>\<sigma\><around*|(|-a|)>>>>>
  </eqnarray*>

  where <math|a=\<b-w\><rsup|T>\<b-varphi\>>. In order to obtain a lower
  bound on <math|p(\<b-t\>)>, we make use of the variational lower bound on
  the logistic sigmoid function given by Eq. <eqref|10.144>, which we
  reproduce here for convenience

  <\equation>
    \<sigma\><around*|(|z|)>\<geqslant\>\<sigma\><around*|(|\<xi\>|)>exp<around*|{|<around*|(|z-\<xi\>|)>/2-\<lambda\><around*|(|\<xi\>|)><around*|(|z<rsup|2>-\<xi\><rsup|2>|)>|}><label|10.149>
  </equation>

  where

  <\equation>
    \<lambda\><around*|(|\<xi\>|)>=<frac|1|2\<xi\>><around*|[|\<sigma\><around*|(|\<xi\>|)>-<frac|1|2>|]><label|10.150>
  </equation>

  We can therefore write

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|t\|\<b-w\>|)>>|<cell|=>|<cell|e<rsup|a*t>\<sigma\><around*|(|-a|)>>>|<row|<cell|>|<cell|\<geqslant\>>|<cell|e<rsup|a*t>\<sigma\><around*|(|\<xi\>|)>exp<around*|{|-<around*|(|a+\<xi\>|)>/2-\<lambda\><around*|(|\<xi\>|)><around*|(|a<rsup|2>-\<xi\><rsup|2>|)>|}><eq-number><label|10.151>>>>>
  </eqnarray*>

  Note that because this bound is applied to each of the terms in the
  likelihood function separately, there is a variational parameter
  <math|\<xi\><rsub|n>> corresponding to each training set observation
  <math|(\<b-varphi\><rsub|n>,t<rsub|n>)>. Using
  <math|a=\<b-w\><rsup|T>\<b-varphi\>>, and multiplying by the prior
  distribution, we obtain the following bound on the joint distribution of
  <math|\<b-t\>> and <math|\<b-w\>>

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|\<b-t\>,\<b-w\>|)>>|<cell|=>|<cell|p<around*|(|\<b-t\>\|\<b-w\>|)>p<around*|(|\<b-w\>|)>>>|<row|<cell|>|<cell|\<geqslant\>>|<cell|h<around*|(|\<b-w\>,\<b-xi\>|)>p<around*|(|\<b-w\>|)><label|10.152><eq-number>>>>>
  </eqnarray*>

  where <math|\<b-xi\>> denotes the set <math|{\<xi\><rsub|n>}> of
  variational parameters, and

  <\eqnarray*>
    <tformat|<table|<row|<cell|h<around*|(|\<b-w\>,\<b-xi\>|)>>|<cell|=>|<cell|<big|prod><rsub|n=1><rsup|N>\<sigma\><around*|(|\<xi\><rsub|n>|)>exp<around*|{|\<b-w\><rsup|T>\<b-varphi\><rsub|n>t<rsub|n>-<around*|(|\<b-w\><rsup|T>\<b-varphi\><rsub|n>+\<xi\><rsub|n>|)>/2-\<lambda\><around*|(|\<xi\><rsub|n>|)><around*|(|<around*|[|\<b-w\><rsup|T>\<b-varphi\><rsub|n>|]><rsup|2>-\<xi\><rsup|2><rsub|n>|)>|}>>>>>
  </eqnarray*>

  Evaluation of the exact posterior distribution would require normalization
  of the lefthand side of this inequality. Because this is intractable, we
  work instead with the right-hand side. Note that the function on the
  right-hand side cannot be interpreted as a probability density because it
  is not normalized. Once it is normalized to give a variational posterior
  distribution <math|q(\<b-w\>)>, however, it no longer represents a bound.
  \ Because the logarithm function is monotonically increasing, the
  inequality <math|A\<geqslant\>B> implies <math|ln A\<geqslant\>ln B>. This
  gives a lower bound on the log of the joint distribution of <math|\<b-t\>>
  and <math|\<b-w\>> of the form

  <\eqnarray*>
    <tformat|<table|<row|<cell|ln<around*|{|p<around*|(|\<b-t\>\|\<b-w\>|)>p<around*|(|\<b-w\>|)>|}>>|<cell|\<geqslant\>>|<cell|<big|sum><rsub|n=1><rsup|N><around*|{|ln
    \<sigma\><around*|(|\<xi\><rsub|n>|)>+\<b-w\><rsup|T>\<b-varphi\><rsub|n>t<rsub|n>-<around*|(|\<b-w\><rsup|T>\<b-varphi\><rsub|n>+\<xi\><rsub|n>|)>/2-\<lambda\><around*|(|\<xi\><rsub|n>|)><around*|(|<around*|[|\<b-w\><rsup|T>\<b-varphi\><rsub|n>|]><rsup|2>-\<xi\><rsup|2><rsub|n>|)>|}>>>|<row|<cell|>|<cell|>|<cell|+ln
    p<around*|(|\<b-w\>|)>>>>>
  </eqnarray*>

  Substituting for the prior <math|p(\<b-w\>)>, the right-hand side of this
  inequality becomes, as a function of <math|\<b-w\>>

  <\eqnarray*>
    <tformat|<table|<row|<cell|>|<cell|>|<cell|-<frac|1|2><around*|(|\<b-w\>-\<b-m\><rsub|0>|)><rsup|T>S<rsub|0><rsup|-1><around*|(|\<b-w\>-\<b-m\><rsub|0>|)>+<big|sum><rsub|n=1><rsup|N><around*|{|\<b-w\><rsup|T>\<b-varphi\><rsub|n><around*|(|t<rsub|n>-1/2|)>-\<lambda\><around*|(|\<xi\><rsub|n>|)>\<b-w\><rsup|T><around*|(|\<b-varphi\><rsub|n>\<b-varphi\><rsub|n><rsup|T>|)>\<b-w\>|}>+const>>>>
  </eqnarray*>

  This is a quadratic function of <math|\<b-w\>>, and so we can obtain the
  corresponding variational approximation to the posterior distribution by
  identifying the linear and quadratic terms in <math|\<b-w\>>, giving a
  Gaussian variational posterior of the form \ 

  <\equation>
    q(\<b-w\>)=\<cal-N\> (\<b-w\>\|\<b-m\><rsub|N>,S<rsub|N>)<label|10.156>
  </equation>

  where

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<b-m\><rsub|N>>|<cell|=>|<cell|S<rsub|N><around*|(|S<rsub|0><rsup|-1>\<b-m\><rsub|0>+<big|sum><rsub|n=1><rsup|N><around*|(|t<rsub|n>-1/2|)>\<b-varphi\><rsub|n>|)><label|10.157><eq-number>>>|<row|<cell|S<rsup|-1><rsub|N>>|<cell|=>|<cell|S<rsup|-1><rsub|0>+2<big|sum><rsub|n=1><rsup|N>\<lambda\><around*|(|\<xi\><rsub|n>|)>\<b-varphi\><rsub|n>\<b-varphi\><rsub|n><rsup|T><label|10.158><eq-number>>>>>
  </eqnarray*>

  \;

  As with the Laplace framework, we have again obtained a Gaussian
  approximation to the posterior distribution. However, the additional
  flexibility provided by the variational parameters <math|{\<xi\><rsub|n>}>
  leads to improved accuracy in the approximation (Jaakkola and Jordan,
  2000).\ 

  Here we have considered a batch learning context in which all of the
  training data is available at once. However, Bayesian methods are
  intrinsically well suited to sequential learning in which the data points
  are processed one at a time and then discarded. The formulation of this
  variational approach for the sequential case is straightforward.

  Note that the bound given by Eq. <eqref|10.149> applies only to the
  two-class problem and so this approach does not directly generalize to
  classification problems with <math|K\<gtr\>2> classes. An alternative bound
  for the multiclass case has been explored by Gibbs (1997).

  <subsection|Optimizing the variational parameters>

  We now have a normalized Gaussian approximation to the posterior
  distribution, which we shall use shortly to evaluate the predictive
  distribution for new data points. First, however, we need to determine the
  variational parameters <math|{\<xi\><rsub|n>}> by maximizing the lower
  bound on the marginal likelihood.

  To do this, we substitute the inequality Eq. <eqref|10.152> back into the
  marginal likelihood to give

  <\eqnarray*>
    <tformat|<table|<row|<cell|ln p<around*|(|\<b-t\>|)>>|<cell|=>|<cell|ln<big|int>p<around*|(|\<b-t\>\|\<b-w\>|)>p<around*|(|\<b-w\>|)>\<mathd\>\<b-w\>>>|<row|<cell|>|<cell|\<geqslant\>>|<cell|ln<big|int>h<around*|(|\<b-w\>,\<b-xi\>|)>p<around*|(|\<b-w\>|)>\<mathd\>\<b-w\>>>|<row|<cell|>|<cell|=>|<cell|\<cal-L\><around*|(|\<b-xi\>|)><eq-number><label|10.159>>>>>
  </eqnarray*>

  As with the optimization of the hyperparameter <math|\<alpha\>> in the
  linear regression model of Section 3.5, there are two approaches to
  determining the <math|\<xi\><rsub|n>> . In the rst approach, we recognize
  that the function <math|\<cal-L\>(\<b-xi\>)> is dened by an integration
  over <math|\<b-w\>> and so we can view <math|\<b-w\>> as a latent variable
  and invoke the EM algorithm. In the second approach, we integrate over
  <math|\<b-w\>> analytically and then perform a direct maximization over
  <math|\<b-xi\>>. Let us begin by considering the EM approach.

  The EM algorithm starts by choosing some initial values for the parameters
  <math|{\<xi\><rsub|n>}>, which we denote collectively by
  <math|\<b-xi\><rsup|old>>. In the E step of the EM algorithm,we then use
  these parameter values to nd the posterior distribution over
  <math|\<b-w\>>, which is given by Eq. <eqref|10.156>. In the M step, we
  then maximize the expected complete-data log likelihood which is given by

  <\equation*>
    Q(\<b-xi\>,\<b-xi\><rsup|old>)=\<bbb-E\>[ln
    h(\<b-w\>,\<b-xi\>)p(\<b-w\>)]
  </equation*>

  where the expectation is taken with respect to the posterior distribution
  <math|q(\<b-w\>)> evaluated using <math|\<b-xi\><rsup|old>>. Noting that
  <math|p(\<b-w\>)> does not depend on <math|\<b-xi\>>, and substituting for
  <math|h(\<b-w\>,\<b-xi\>)> we obtain

  <\equation*>
    Q<around*|(|\<b-xi\>,\<b-xi\><rsup|old>|)>=<big|sum><rsub|n=1><rsup|N><around*|{|ln
    \<sigma\><around*|(|\<xi\><rsub|n>|)>-<frac|\<xi\><rsub|n>|2>-\<lambda\><around*|(|\<xi\><rsub|n>|)><around*|(|\<b-varphi\><rsub|n><rsup|T>\<bbb-E\><around*|[|\<b-w\>\<b-w\><rsup|T>|]>\<b-varphi\><rsub|n>-\<xi\><rsup|2><rsub|n>|)>|}>+const
  </equation*>

  where `const' denotes terms that are independent of <math|\<b-xi\>>. We now
  set the derivative with respect to <math|\<xi\><rsub|n>> equal to zero. A
  few lines of algebra, making use of the denitions of
  <math|\<sigma\>(\<b-xi\>)> Eq. <eqref|10.134> and
  <math|\<lambda\>(\<b-xi\>)> Eq.<eqref|10.150>, then gives

  \ 

  <\equation*>
    0=\<lambda\><rprime|'><around*|(|\<xi\><rsub|n>|)><around*|(|\<b-varphi\><rsub|n><rsup|T>\<bbb-E\><around*|[|\<b-w\>\<b-w\><rsup|T>|]>\<b-varphi\><rsub|n>-\<xi\><rsup|2><rsub|n>|)>
  </equation*>

  We now note that <math|\<lambda\><rprime|'><around*|(|\<b-xi\>|)>> is a
  monotonic function of <math|\<xi\>> for <math|\<xi\>\<geqslant\>0>, and
  that we can restrict attention to nonnegative values of <math|\<xi\>
  >without loss of generality due to the symmetry of the bound around
  <math|\<xi\>=0>. Thus <math|\<lambda\><rprime|'><around*|(|\<xi\>|)>\<neq\>0>,
  and hence we obtain the following re-estimation equations

  <\eqnarray*>
    <tformat|<table|<row|<cell|<around*|(|\<xi\><rsub|n><rsup|new>|)><rsup|2>>|<cell|=>|<cell|\<b-varphi\><rsup|T><rsub|n>\<bbb-E\><around*|[|\<b-w\>\<b-w\><rsup|T>|]>\<b-varphi\><rsub|n>>>|<row|<cell|>|<cell|=>|<cell|\<b-varphi\><rsub|n><rsup|T><around*|(|S<rsub|N>+\<b-m\><rsub|N>\<b-m\><rsub|N><rsup|T>|)>\<b-varphi\><rsub|n><eq-number><label|10.163>>>>>
  </eqnarray*>

  where we have used Eq. <eqref|10.156>.\ 

  Let us summarize the EM algorithm for nding the variational posterior
  distribution. We rst initialize the variational parameters
  <math|\<b-xi\><rsup|old>>. In the E step, we evaluate the posterior
  distribution over <math|\<b-w\>> given by Eq. <eqref|10.156>, in which the
  mean and covariance are dened by Eq. <eqref|10.157> and <eqref|10.158>. In
  the M step, we then use this variational posterior to compute a new value
  for <math|\<b-xi\>> given by Eq. <eqref|10.163>. The E and M steps are
  repeated until a suitable convergence criterion is satised, which in
  practice typically requires only a few iterations.

  An alternative approach to obtaining re-estimation equations for
  <math|\<b-xi\>> is to note that in the integral over <math|\<b-w\>> in the
  denition Eq. <eqref|10.159> of the lower bound <math|\<cal-L\>(\<b-xi\>)>,
  the integrand has a Gaussian-like form and so the integral can be evaluated
  analytically. Having evaluated the integral, we can then differentiate with
  respect to <math|\<xi\><rsub|n>>. It turns out that this gives rise to
  exactly the same re-estimation equations as does the EM approach given by
  Eq. <eqref|10.163>.

  As we have emphasized already, in the application of variational methods it
  is useful to be able to evaluate the lower bound <math|\<cal-L\>(\<b-xi\>)>
  given by Eq. <eqref|10.159>. The integration over <math|\<b-w\>> can be
  performed analytically by noting that <math|p(\<b-w\>)> is Gaussian and
  <math|h(\<b-w\>,\<b-xi\>)> is the exponential of a quadratic function of
  <math|\<b-w\>>. Thus, by completing the square and making use of the
  standard result for the normalization coefcient of a Gaussian
  distribution, we can obtain a closed form solution which takes the form

  <\equation*>
    \<cal-L\><around*|(|\<b-xi\>|)>=<frac|1|2>ln<around*|\||<frac|S<rsub|N>|S<rsub|0>>|\|>-<frac|1|2>\<b-m\><rsub|N><rsup|T>S<rsub|N><rsup|-1>\<b-m\><rsub|N>+<frac|1|2>\<b-m\><rsub|0><rsup|T>S<rsub|0><rsup|-1>\<b-m\><rsub|0>+<big|sum><rsub|n=1><rsup|N><around*|{|ln
    \<sigma\><around*|(|\<xi\><rsub|n>|)>-<frac|1|2>\<xi\><rsub|n>-\<lambda\><around*|(|\<xi\><rsub|n>|)>\<xi\><rsup|2><rsub|n>|)>
  </equation*>

  This variational framework can also be applied to situations in which the
  data is arriving sequentially (Jaakkola and Jordan, 2000). In this case we
  maintain a Gaussian posterior distribution over <math|\<b-w\>>, which is
  initialized using the prior <math|p(\<b-w\>)>. As each data point arrives,
  the posterior is updated by making use of the bound Eq. <eqref|10.151> and
  then normalized to give an updated posterior distribution.

  The predictive distribution is obtained by marginalizing over the posterior
  distribution, and takes the same form as for the Laplace approximation
  discussed in Section 4.5.2. Figure 10.13 shows the variational predictive
  distributions for a synthetic data set. This example provides interesting
  insights into the concept of `large margin', which was discussed in Section
  7.1 and which has qualitatively similar behaviour to the Bayesian solution.

  <subsection|Inference of hyperparameters>

  So far, we have treated the hyperparameter <math|\<alpha\>> in the prior
  distribution as a known constant. We now extend the Bayesian logistic
  regression model to allow the value of this parameter to be inferred from
  the data set. This can be achieved by combining the global and local
  variational approximations into a single framework, so as to maintain a
  lower bound on the marginal likelihood at each stage. Such a combined
  approach was adopted by Bishop and Svensén (2003) in the context of a
  Bayesian treatment of the hierarchical mixture of experts model.

  Specically, we consider once again a simple isotropic Gaussian prior
  distribution of the form
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|10.122|<tuple|2|8>>
    <associate|10.125|<tuple|3|9>>
    <associate|10.129|<tuple|4|10>>
    <associate|10.130|<tuple|5|10>>
    <associate|10.131|<tuple|6|10>>
    <associate|10.132|<tuple|7|11>>
    <associate|10.133|<tuple|8|11>>
    <associate|10.134|<tuple|9|11>>
    <associate|10.137|<tuple|10|11>>
    <associate|10.141|<tuple|11|12>>
    <associate|10.144|<tuple|12|12>>
    <associate|10.149|<tuple|13|13>>
    <associate|10.150|<tuple|14|?>>
    <associate|10.151|<tuple|15|?>>
    <associate|10.152|<tuple|15|?>>
    <associate|10.156|<tuple|17|?>>
    <associate|10.157|<tuple|17|?>>
    <associate|10.158|<tuple|18|?>>
    <associate|10.159|<tuple|20|?>>
    <associate|10.163|<tuple|21|?>>
    <associate|10.2.5|<tuple|3|3>>
    <associate|10.90|<tuple|1|4>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|3|7>>
    <associate|auto-11|<tuple|2|7>>
    <associate|auto-12|<tuple|2.1|8>>
    <associate|auto-13|<tuple|3|9>>
    <associate|auto-14|<tuple|4|10>>
    <associate|auto-15|<tuple|5|10>>
    <associate|auto-16|<tuple|6|11>>
    <associate|auto-17|<tuple|4|13>>
    <associate|auto-18|<tuple|4.1|13>>
    <associate|auto-19|<tuple|4.2|14>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-20|<tuple|4.3|?>>
    <associate|auto-3|<tuple|1|2>>
    <associate|auto-4|<tuple|3|3>>
    <associate|auto-5|<tuple|1|4>>
    <associate|auto-6|<tuple|2|4>>
    <associate|auto-7|<tuple|1.1|4>>
    <associate|auto-8|<tuple|1.2|6>>
    <associate|auto-9|<tuple|1.3|6>>
    <associate|fig10.10|<tuple|4|10>>
    <associate|fig10.11|<tuple|5|10>>
    <associate|fig10.12|<tuple|6|11>>
    <associate|sec10.2.3|<tuple|1|1>>
    <associate|sec10.2.4|<tuple|2|1>>
    <associate|sec10.3.1|<tuple|1.1|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||Plot of the
      variational lower bound <with|mode|<quote|math>|\<cal-L\>> versus the
      number <with|mode|<quote|math>|K> of components in the Gaussian mixture
      model, for the Old Faithful data, showing a distinct peak at
      <with|mode|<quote|math>|K = 2> components. For each value of K, the
      model is trained from 100 different random starts, and the results
      shown as `+' symbols plotted with small random hori zontal
      perturbations so that they can be distinguished. Note that some
      solutions find suboptimal local maxima, but that this happens
      infrequently.>|<pageref|auto-3>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|2>||Probabilistic
      graphical model representing the joint distribution Eq.
      (<reference|10.90>) for the Bayesian linear regression
      model.>|<pageref|auto-6>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3>||Plot of the lower
      bound <with|mode|<quote|math>|\<cal-L\>> versus the order
      <with|mode|<quote|math>|M> of the polynomial, for a polynomial model,
      in which a set of 10 data points is generated from a polynomial with
      <with|mode|<quote|math>|M=3> sampled over the interval
      <with|mode|<quote|math>|(\<minus\>5,5)> with additive Gaussian noise of
      variance <with|mode|<quote|math>|0.09>. The value of the bound gives
      the log probability of the model, and we see that the value of the
      bound peaks at <with|mode|<quote|math>|M=3>, corresponding to the true
      model from which the data set was generated.>|<pageref|auto-10>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4>||In the left-hand
      figure the red curve shows the function exp(\<minus\>x), and the blue
      line shows the tangent at <with|mode|<quote|math>|x=\<xi\>> defined by
      Eq. (<reference|10.125>) with <with|mode|<quote|math>|\<xi\>=1>. This
      line has slope <with|mode|<quote|math>|\<eta\>=f<rprime|'>(\<xi\>)=\<minus\>exp(\<minus\>\<xi\>)>.
      Note that any other tangent line, for example the ones shown in green,
      will have a smaller value of <with|mode|<quote|math>|y> at
      <with|mode|<quote|math>|x=\<xi\>>. The right-hand figure shows the
      corresponding plot of the function <with|mode|<quote|math>|\<eta\>\<xi\>\<minus\>g(\<eta\>)>,
      where <with|mode|<quote|math>|g(\<eta\>)> is given by Eq.
      (<reference|10.131>), versus <with|mode|<quote|math>|\<eta\>> for
      <with|mode|<quote|math>|\<xi\>=1>, in which the maximum corresponds to
      <with|mode|<quote|math>|\<eta\>=\<minus\>exp(\<minus\>\<xi\>)=\<minus\>1/e>.>|<pageref|auto-14>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5>|>
        In the left-hand plot the red curve shows a convex function
        <with|mode|<quote|math>|f(x)>, and the blue line represents the
        linear function <with|mode|<quote|math>|\<eta\>x>, which is a lower
        bound on <with|mode|<quote|math>|f(x)> because
        <with|mode|<quote|math>|f(x)\<gtr\>\<eta\>x> for all
        <with|mode|<quote|math>|x>. For the given value of slope
        <with|mode|<quote|math>|\<eta\>> the contact point of the tangent
        line having the same slope is found by minimizing with respect to
        <with|mode|<quote|math>|x> the discrepancy (shown by the green dashed
        lines) given by <with|mode|<quote|math>|f(x)\<minus\>\<eta\>x>. This
        defines the dual function <with|mode|<quote|math>|g(\<eta\>)>, which
        corresponds to the (negative of the) intercept of the tangent line
        having slope <with|mode|<quote|math>|\<eta\>>.
      </surround>|<pageref|auto-15>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|6>||The left-hand plot
      shows the logistic sigmoid function
      <with|mode|<quote|math>|\<sigma\>(x)> defined by Eq.
      (<reference|10.134>) in red, together with two examples of the
      exponential upper bound Eq. (<reference|10.137>) shown in blue. The
      right-hand plot shows the logistic sigmoid again in red together with
      the Gaussian lower bound Eq. (<reference|10.144>) shown in blue. Here
      the parameter <with|mode|<quote|math>|\<xi\>=2.5>, and the bound is
      exact at <with|mode|<quote|math>|x=\<xi\>> and
      <with|mode|<quote|math>|x=\<minus\>\<xi\>>, denoted by the dashed green
      lines.>|<pageref|auto-16>>
    </associate>
    <\associate|toc>
      <with|par-left|<quote|1tab>|1<space|2spc> Predictive density
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|1tab>|2<space|2spc>Determining the number of
      components <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|3<space|2spc>Induced factorizations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Variational
      Linear Regression> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Variational distribution
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Predictive distribution
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Lower bound
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Exponential
      Family Distributions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Variational message passing
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Local
      Variational Methods> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Variational
      Logistic Regression> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Variational posterior
      distribution <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Optimizing the variational
      parameters <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>
    </associate>
  </collection>
</auxiliary>