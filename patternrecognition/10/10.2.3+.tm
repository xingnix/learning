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
    <tformat|<table|<row|<cell|h<around*|(|\<b-w\>,\<b-xi\>|)>>|<cell|=>|<cell|<big|prod><rsub|n=1><rsup|N>\<sigma\><around*|(|\<xi\><rsub|n>|)>exp<around*|{|\<b-w\><rsup|T>\<b-varphi\><rsub|n>t<rsub|n>-<around*|(|\<b-w\><rsup|T>\<b-varphi\><rsub|n>+\<xi\><rsub|n>|)>/2-\<lambda\><around*|(|\<xi\><rsub|n>|)><around*|(|<around*|[|\<b-w\><rsup|T>\<b-varphi\><rsub|n>|]><rsup|2>-\<xi\><rsup|2><rsub|n>|)>|}><eq-number><label|10.153>>>>>
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

  <\equation>
    Q(\<b-xi\>,\<b-xi\><rsup|old>)=\<bbb-E\>[ln
    <around*|{|h(\<b-w\>,\<b-xi\>)p(\<b-w\>)|}>]<label|10.160>
  </equation>

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
    \<cal-L\><around*|(|\<b-xi\>|)>=<frac|1|2>ln<around*|\||<frac|S<rsub|N>|S<rsub|0>>|\|>+<frac|1|2>\<b-m\><rsub|N><rsup|T>S<rsub|N><rsup|-1>\<b-m\><rsub|N>-<frac|1|2>\<b-m\><rsub|0><rsup|T>S<rsub|0><rsup|-1>\<b-m\><rsub|0>+<big|sum><rsub|n=1><rsup|N><around*|{|ln
    \<sigma\><around*|(|\<xi\><rsub|n>|)>-<frac|1|2>\<xi\><rsub|n>+\<lambda\><around*|(|\<xi\><rsub|n>|)>\<xi\><rsup|2><rsub|n>|)>
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

  <\padded-center>
    <\small-figure|<image|image/fig_10_13_bayes_classification.png|0.5par|||>>
      \ Illustration of the Bayesian approach to logistic regression for a
      simple linearly separable data set. The plot on the left shows the
      predictive distribution obtained using variational inference. We see
      that the decision boundary lies roughly mid way between the clusters of
      data points, and that the contours of the predictive distribution splay
      out away from the data re\]ecting the greater uncertainty in the
      classication of such regions. The plot on the right shows the decision
      boundaries corresponding to ve samples of the parameter vector
      <math|\<b-w\>> drawn from the posterior distribution
      <math|p(\<b-w\>\|t)>.
    </small-figure>
  </padded-center>

  <subsection|Inference of hyperparameters>

  So far, we have treated the hyperparameter <math|\<alpha\>> in the prior
  distribution as a known constant. We now extend the Bayesian logistic
  regression model to allow the value of this parameter to be inferred from
  the data set. This can be achieved by combining the global and local
  variational approximations into a single framework, so as to maintain a
  lower bound on the marginal likelihood at each stage. Such a combined
  approach was adopted by Bishop and SvensÈn (2003) in the context of a
  Bayesian treatment of the hierarchical mixture of experts model.

  Specically, we consider once again a simple isotropic Gaussian prior
  distribution of the form

  <\equation>
    p<around*|(|\<b-w\>\|\<alpha\>|)>=\<cal-N\><around*|(|\<b-w\>\|\<b-0\>,\<alpha\><rsup|-1>I|)><label|10.165>
  </equation>

  Our analysis is readily extended to more general Gaussian priors, for
  instance if we wish to associate a different hyperparameter with different
  subsets of the parameters <math|w<rsub|j>>. As usual, we consider a
  conjugate hyperprior over <math|\<alpha\>> given by a gamma distribution

  <\equation>
    p(\<alpha\>) = Gam(\<alpha\>\|a<rsub|0>,b<rsub|0>)<label|10.166>
  </equation>

  governed by the constants <math|a<rsub|0>> and <math|b<rsub|0>> .

  The marginal likelihood for this model now takes the form

  <\equation*>
    p<around*|(|\<b-t\>|)>=<big|int><big|int>p<around*|(|\<b-w\>,\<alpha\>,\<b-t\>|)>\<mathd\>\<b-w\>\<mathd\>\<alpha\>
  </equation*>

  where the joint distribution is given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|\<b-w\>,\<alpha\>,\<b-t\>|)>>|<cell|=>|<cell|p<around*|(|\<b-t\>\|\<b-w\>|)>p<around*|(|\<b-w\>\|\<alpha\>|)>p<around*|(|\<alpha\>|)>>>>>
  </eqnarray*>

  We are now faced with an analytically intractable integration over
  <math|\<b-w\>> and <math|\<alpha\>>, which we shall tackle by using both
  the local and global variational approaches in the same model.

  To begin with, we introduce a variational distribution
  <math|q<around*|(|\<b-w\>,\<alpha\>|)>>, and then apply the decomposition
  (10.2), which in this instance takes the form

  <\equation*>
    ln p(\<b-t\>)=\<cal-L\>(q) + KL(q\<\|\|\>p)
  </equation*>

  where the lower bound <math|\<cal-L\>(q)> and the Kullback-Leibler
  divergence <math|KL(q\<\|\|\>p)> are defined by

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<cal-L\><around*|(|q|)>>|<cell|=>|<cell|<big|int><big|int>q<around*|(|\<b-w\>,\<alpha\>|)>ln<around*|{|<frac|p<around*|(|\<b-w\>,\<alpha\>,\<b-t\>|)>|q<around*|(|\<b-w\>,\<alpha\>|)>>|}>\<mathd\>\<b-w\>\<mathd\>\<alpha\>>>|<row|<cell|KL<around*|(|q\<\|\|\>p|)>>|<cell|=>|<cell|-<big|int><big|int>q<around*|(|\<b-w\>,\<alpha\>|)>ln<around*|{|<frac|p<around*|(|\<b-w\>,\<alpha\>\|\<b-t\>|)>|q<around*|(|\<b-w\>,\<alpha\>|)>>|}>\<mathd\>\<b-w\>\<mathd\>\<alpha\>>>>>
  </eqnarray*>

  At this point, the lower bound <math|\<cal-L\>(q)> is still intractable due
  to the form of the likelihood factor <math|p(\<b-t\>\|\<b-w\>)>. We
  therefore apply the local variational bound to each of the logistic sigmoid
  factors as before. This allows us to use the inequality Eq. <eqref|10.152>
  and place a lower bound on <math|\<cal-L\>(q)>, which will therefore also
  be a lower bound on the log marginal likelihood

  <\eqnarray*>
    <tformat|<table|<row|<cell|ln p<around*|(|\<b-t\>|)>>|<cell|\<geqslant\>>|<cell|\<cal-L\><around*|(|q|)>>>|<row|<cell|>|<cell|\<geqslant\>>|<cell|<wide|\<cal-L\>|~><around*|(|q,\<b-xi\>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|int><big|int>q<around*|(|\<b-w\>,\<alpha\>|)>ln<around*|{|<frac|h<around*|(|\<b-w\>,\<b-xi\>|)>p<around*|(|\<b-w\>\|\<alpha\>|)>p<around*|(|\<alpha\>|)>|q<around*|(|\<b-w\>,\<alpha\>|)>>|}>\<mathd\>\<b-w\>\<mathd\>\<alpha\>>>>>
  </eqnarray*>

  Next we assume that the variational distribution factorizes between
  parameters and hyperparameters so that

  <\equation*>
    q(\<b-w\>, \<alpha\>) = q(\<b-w\>)q(\<alpha\>).
  </equation*>

  With this factorization we can appeal to the general result (10.9) to nd
  expressions for the optimal factors. Consider rst the distribution q(w).
  Discarding terms that are independent of <math|\<b-w\>>, we have

  <\eqnarray*>
    <tformat|<table|<row|<cell|ln q<around*|(|\<b-w\>|)>>|<cell|=>|<cell|\<bbb-E\><rsub|\<alpha\>><around*|[|ln<around*|{|h<around*|(|\<b-w\>,\<b-xi\>|)>p<around*|(|\<b-w\>\|\<alpha\>|)>p<around*|(|\<alpha\>|)>|}>|]>+const>>|<row|<cell|>|<cell|=>|<cell|ln
    h<around*|(|\<b-w\>,\<b-xi\>|)>+\<bbb-E\><rsub|\<alpha\>><around*|[|ln
    p<around*|(|\<b-w\>,\<alpha\>|)>|]>+const>>>>
  </eqnarray*>

  We now substitute for <math|ln h(\<b-w\>,\<b-xi\>)> using Eq.
  <eqref|10.153>, and for <math|ln p(\<b-w\>\|\<alpha\>)> using Eq.
  <eqref|10.165>, giving

  <\equation*>
    ln q<around*|(|\<b-w\>|)>=-<frac|\<bbb-E\><around*|[|\<alpha\>|]>|2>\<b-w\><rsup|T>\<b-w\>+<big|sum><rsub|n=1><rsup|N><around*|{|<around*|(|t<rsub|n>-<frac|1|2>|)>\<b-w\><rsup|T>\<b-varphi\><rsub|n>-\<lambda\><around*|(|\<xi\><rsub|n>|)>\<b-w\><rsup|T>\<b-varphi\><rsub|n>\<b-varphi\><rsub|n><rsup|T>\<b-w\>|}>+const
  </equation*>

  We see that this is a quadratic function of <math|\<b-w\>> and so the
  solution for <math|q(\<b-w\>)> will be Gaussian. Completing the square in
  the usual way, we obtain

  <\equation*>
    q(\<b-w\>) = \<cal-N\>(\<b-w\>\|\<b-mu\><rsub|N>, \<Sigma\><rsub|N>)
  </equation*>

  where we have dened

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<Sigma\><rsub|N><rsup|-1>\<b-mu\><rsub|N>>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N><around*|(|t<rsub|n>-<frac|1|2>|)>\<b-varphi\><rsub|n>>>|<row|<cell|\<Sigma\><rsub|N><rsup|-1>>|<cell|=>|<cell|\<bbb-E\><around*|[|\<alpha\>|]>I+2<big|sum><rsub|n=1><rsup|N>\<lambda\><around*|(|\<xi\><rsub|n>|)>\<b-varphi\><rsub|n>\<b-varphi\><rsub|n><rsup|T>>>>>
  </eqnarray*>

  Similarly, the optimal solution for the factor <math|q(\<alpha\>)> is
  obtained from

  <\equation*>
    ln q(\<alpha\>) = \<bbb-E\><rsub|\<b-w\>> [ln p(\<b-w\>\|\<alpha\>)] + ln
    p(\<alpha\>) + const.
  </equation*>

  Substituting for <math|ln p(\<b-w\>\|\<alpha\>)> using Eq. <eqref|10.165>,
  and for <math|ln p(\<alpha\>)> using Eq. <eqref|10.166>, we obtain

  <\equation*>
    ln q<around*|(|\<alpha\>|)>=<frac|M|2>ln\<alpha\>-<frac|\<alpha\>|2>\<bbb-E\><around*|[|\<b-w\><rsup|T>\<b-w\>|]>+<around*|(|a<rsub|0>-1|)>ln\<alpha\>-b<rsub|0>\<alpha\>+const
  </equation*>

  We recognize this as the log of a gamma distribution, and so we obtain

  <\eqnarray*>
    <tformat|<table|<row|<cell|q<around*|(|\<alpha\>|)>>|<cell|=>|<cell|Gam<around*|(|\<alpha\>\|a<rsub|N>,b<rsub|N>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|\<Gamma\><around*|(|a<rsub|N>|)>>a<rsub|0><rsup|b<rsub|N>>\<alpha\><rsup|a<rsub|N>-1>e<rsup|-b<rsub|N>\<alpha\>>>>>>
  </eqnarray*>

  where

  <\eqnarray*>
    <tformat|<table|<row|<cell|a<rsub|N>>|<cell|=>|<cell|a<rsub|0>+<frac|M|2>>>|<row|<cell|b<rsub|N>>|<cell|=>|<cell|b<rsub|0>+<frac|1|2>\<bbb-E\><rsub|\<b-w\>><around*|[|\<b-w\><rsup|T>\<b-w\>|]>>>>>
  </eqnarray*>

  We also need to optimize the variational parameters <math|\<xi\><rsub|n>>,
  and this is also done by maximizing the lower bound
  <math|<wide|\<cal-L\>|~><around*|(|q,\<b-xi\>|)>>. Omitting terms that are
  independent of <math|\<b-xi\>>, and integrating over <math|\<alpha\>>, we
  have

  <\equation*>
    <wide|\<cal-L\>|~><around*|(|q,\<b-xi\>|)>=<big|int>q<around*|(|\<b-w\>|)>ln
    h<around*|(|\<b-w\>,\<b-xi\>|)>\<mathd\>\<b-w\>+const
  </equation*>

  Note that this has precisely the same form as Eq. <eqref|10.160>, and so we
  can again appeal to our earlier result Eq. <eqref|10.163>, which can be
  obtained by direct optimization of the marginal likelihood function,
  leading to re-estimation equations of the form

  <\equation*>
    <around*|(|\<xi\><rsub|n><rsup|new>|)><rsup|2>=\<b-varphi\><rsub|n><rsup|T><around*|(|\<Sigma\><rsub|N>+\<b-mu\><rsub|N>\<b-mu\><rsub|N><rsup|T>|)>\<b-varphi\><rsub|n>
  </equation*>

  We have obtained re-estimation equations for the three quantities
  <math|q(\<b-w\>)>, <math|q<around*|(|\<alpha\>|)>>,and <math|\<b-xi\>>, and
  so after making suitable initializations, we can cycle through these
  quantities, updating each in turn. The required moments are given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<alpha\>|]>>|<cell|=>|<cell|<frac|a<rsub|N>|b<rsub|N>>>>|<row|<cell|\<bbb-E\><around*|[|\<b-w\>\<b-w\><rsup|T>|]>>|<cell|=>|<cell|\<Sigma\><rsub|N>+\<b-mu\><rsub|N>\<b-mu\><rsub|N><rsup|T>>>>>
  </eqnarray*>

  <section| Expectation Propagation>

  We conclude this chapter by discussing an alternative form of deterministic
  approximate inference, known as <em|expectation propagation> or <em|EP>
  (Minka, 2001a; Minka,2001b). As with the variational Bayes methods
  discussed so far, this too is based on the minimization of a
  Kullback-Leibler divergence but now of the reverse form, which gives the
  approximation rather different properties.

  Consider for a moment the problem of minimizing <math|KL(p\<\|\|\>q)> with
  respect to <math|q(\<b-z\>)> when <math|p(\<b-z\>)> is a fixed distribution
  and <math|q(\<b-z\>)> is a member of the exponential family and so, from
  (2.194), can be written in the form

  <\equation*>
    q<around*|(|\<b-z\>|)>=h<around*|(|\<b-z\>|)>g<around*|(|\<b-eta\>|)>exp<around*|{|\<b-eta\><rsup|T>\<b-u\><around*|(|\<b-z\>|)>|}>
  </equation*>

  As a function of <math|\<b-eta\>>, the Kullback-Leibler divergence then
  becomes

  <\equation*>
    KL(p\<\|\|\>q)=-ln g(\<b-eta\>)-\<b-eta\><rsup|T>
    \<bbb-E\><rsub|p(\<b-z\>)>[\<b-u\>(\<b-z\>)] + const
  </equation*>

  where the constant terms are independent of the natural parameters
  <math|\<b-eta\>>. We can minimize <math|KL(p\<\|\|\>q)> within this family
  of distributions by setting the gradient with respect to <math|\<b-eta\>>
  to zero, giving

  <\equation*>
    -\<nabla\>ln g(\<b-eta\>)=\<bbb-E\><rsub|p(\<b-z\>)>[\<b-u\>(\<b-z\>)].
  </equation*>

  However, we have already seen in (2.226) that the negative gradient of
  <math|ln g(\<b-eta\>)> is given by the expectation of
  <math|\<b-u\><around*|(|\<b-z\>|)>> under the distribution
  <math|q(\<b-z\>)>. Equating these two results, we obtain

  <\equation>
    \<bbb-E\><rsub|q<around*|(|\<b-z\>|)>>[\<b-u\>(\<b-z\>)]=\<bbb-E\><rsub|p(\<b-z\>)>[\<b-u\>(\<b-z\>)].<label|10.187>
  </equation>

  We see that the optimum solution simply corresponds to matching the
  expected sufcient statistics. So, for instance, if <math|q(\<b-z\>)> is a
  Gaussian <math|\<cal-N\>(\<b-z\>\|\<b-mu\>,\<Sigma\>)> then we minimize the
  Kullback-Leibler divergence by setting the mean <math|\<b-mu\>> of
  <math|q(\<b-z\>)> equal to the mean of the distribution <math|p(\<b-z\>)>
  and the covariance <math|\<Sigma\>> equal to the covariance of
  <math|p(\<b-z\>)>. This is sometimes called <em|moment matching>. An
  example of this was seen in Figure 10.3(a).

  Now let us exploit this result to obtain a practical algorithm for
  approximate inference. For many probabilistic models, the joint
  distribution of data <math|\<cal-D\>> and hidden variables (including
  parameters) <math|\<b-theta\>> comprises a product of factors in the form

  <\equation>
    p<around*|(|\<cal-D\>,\<b-theta\>|)>=<big|prod><rsub|i>f<rsub|i><around*|(|\<b-theta\>|)><label|10.188>
  </equation>

  This would arise, for example, in a model for independent, identically
  distributed data in which there is one factor
  <math|f<rsub|n>(\<b-theta\>)=p(\<b-x\><rsub|n>\|\<b-theta\>)> for each data
  point <math|\<b-x\><rsub|n>>, along with a factor
  <math|f<rsub|0>(\<b-theta\>)=p(\<b-theta\>)> corresponding to the prior.
  More generally, it would also apply to any model dened by a directed
  probabilistic graph in which each factor is a conditional distribution
  corresponding to one of the nodes, or an undirected graph in which each
  factor is a clique potential. We are interested in evaluating the posterior
  distribution <math|p(\<b-theta\>\|\<cal-D\>)> for the purpose of making
  predictions, as well as the model evidence <math|p(\<cal-D\>)> for the
  purpose of model comparison. From Eq. <eqref|10.188> the posterior is given
  by

  <\equation>
    p<around*|(|\<b-theta\>\|\<cal-D\>|)>=<frac|1|p<around*|(|\<cal-D\>|)>><big|prod><rsub|i>f<rsub|i><around*|(|\<b-theta\>|)><label|10.189>
  </equation>

  and the model evidence is given by

  <\equation>
    p<around*|(|\<cal-D\>|)>=<big|int><big|prod><rsub|i>f<rsub|i><around*|(|\<cal-D\>|)>\<mathd\>\<b-theta\><label|10.190>
  </equation>

  Here we are considering continuous variables, but the following discussion
  applies equally to discrete variables with integrals replaced by
  summations. We shall suppose that the marginalization over
  <math|\<b-theta\>>, along with the marginalizations with respect to the
  posterior distribution required to make predictions, are intractable so
  that some form of approximation is required.

  Expectation propagation is based on an approximation to the posterior
  distribution which is also given by a product of factors

  <\equation>
    q<around*|(|\<b-theta\>|)>=<frac|1|Z><big|prod><rsub|i><wide|f<rsub|i>|~><around*|(|\<b-theta\>|)><label|10.191>
  </equation>

  in which each factor <math|<wide|f<rsub|i>|~><around*|(|\<b-theta\>|)>> in
  the approximation corresponds to one of the factors
  <math|f<rsub|i><around*|(|\<b-theta\>|)>> in the true posterior Eq.
  <eqref|10.189>, and the factor <math|1/Z> is the normalizing constant
  needed to ensure that the left-hand side of Eq. <eqref|10.191> integrates
  to unity. In order to obtain a practical algorithm, we need to constrain
  the factors <math|<wide|f|~><rsub|i><around*|(|\<b-theta\>|)>> in some way,
  and in particular we shall assume that they come from the exponential
  family. The product of the factors will therefore also be from the
  exponential family and so can be described by a finite set of sufficient
  statistics. For example, if each of the
  <math|<wide|f|~><rsub|i><around*|(|\<b-theta\>|)>> is a Gaussian, then the
  overall approximation <math|q<around*|(|\<b-theta\>|)>> will also be
  Gaussian. Ideally we would like to determine the
  <math|<wide|f|~><rsub|i><around*|(|\<b-theta\>|)>> by minimizing the
  Kullback-Leibler divergence between the true posterior and the
  approximation given by

  <\equation*>
    KL<around*|(|p\<\|\|\>q|)>=KL<around*|(|<frac|1|p<around*|(|\<cal-D\>|)>><big|prod><rsub|i>f<rsub|i><around*|(|\<b-theta\>|)><around*|\<\|\|\>|<frac|1|Z><big|prod><wide|f|~><rsub|i><around*|(|\<b-theta\>|)>|\<nobracket\>>|)>
  </equation*>

  Note that this is the reverse form of KL divergence compared with that used
  in variational inference. In general, this minimization will be intractable
  because the KL divergence involves averaging with respect to the true
  distribution. As a rough approximation, we could instead minimize the KL
  divergences between the corresponding pairs
  <math|f<rsub|i><around*|(|\<b-theta\>|)>> and
  <math|<wide|f<rsub|i>|~><around*|(|\<b-theta\>|)>> of factors. This
  represents a much simpler problem to solve, and has the advantage that the
  algorithm is noniterative. However, because each factor is individually
  approximated, the product of the factors could well give a poor
  approximation.

  Expectation propagation makes a much better approximation by optimizing
  each factor in turn in the context of all of the remaining factors. It
  starts by initializing the factors <math|<wide|f<rsub|i>|~><around*|(|\<b-theta\>|)>>,
  and then cycles through the factors refining them one at a time. This is
  similar in spirit to the update of factors in the variational Bayes
  framework considered earlier. Suppose we wish to refine factor
  <math|<wide|f<rsub|j>|~><around*|(|\<b-theta\>|)>>. We first remove this
  factor from the product to give <math|<big|prod><rsub|i\<neq\>j><wide|f|~><rsub|i><around*|(|\<b-theta\>|)>>.
  Conceptually, we will now determine a revised form of the factor
  <math|<wide|f<rsub|i>|~><around*|(|\<b-theta\>|)>> by ensuring that the
  product

  <\equation>
    q<rsup|new><around*|(|\<b-theta\>|)>\<propto\><wide|f|~><rsub|j><around*|(|\<b-theta\>|)><big|prod><rsub|i\<neq\>j><wide|f|~><rsub|i><around*|(|\<b-theta\>|)><label|10.193>
  </equation>

  is as close as possible to

  <\equation*>
    f<rsub|i><around*|(|\<b-theta\>|)><big|prod><rsub|i\<neq\>j><wide|f<rsub|i>|~><around*|(|\<b-theta\>|)>
  </equation*>

  in which we keep fixed all of the factors
  <math|<wide|f<rsub|i>|~><around*|(|\<b-theta\>|)>> for <math|i\<neq\>j>.
  This ensures that the approximation is most accurate in the regions of high
  posterior probability as defined by the remaining factors. We shall see an
  example of this effect when we apply EP to the \<#2018\>clutter
  problem\<#2019\>. To achieve this, we first remove the factor
  <math|<wide|f|~><rsub|i><around*|(|\<b-theta\>|)>> from the current
  approximation to the posterior by defining the unnormalized distribution

  <\equation>
    q<rsup|\\j><around*|(|\<b-theta\>|)>=<frac|q<around*|(|\<b-theta\>|)>|<wide|f<rsub|j>|~><around*|(|\<b-theta\>|)>><label|10.195>
  </equation>

  Note that we could instead nd <math|q<rsup|\\j><around*|(|\<b-theta\>|)>>
  from the product of factors <math|i\<neq\>j>, although in practice division
  is usually easier. This is now combined with the factor
  <math|f<rsub|j><around*|(|\<b-theta\>|)>> to give a distribution

  <\equation>
    <frac|1|Z<rsub|j>>f<rsub|j><around*|(|\<b-theta\>|)>q<rsup|\\j><around*|(|\<b-theta\>|)><label|10.196>
  </equation>

  where <math|Z<rsub|j>> is the normalization constant given by

  <\equation>
    Z<rsub|j>=<big|int>f<rsub|j><around*|(|\<b-theta\>|)>q<rsup|\\j><around*|(|\<b-theta\>|)>\<mathd\>\<b-theta\><label|10.197>
  </equation>

  We now determine a revised factor <math|<wide|f<rsub|j>|~><around*|(|\<b-theta\>|)>>
  by minimizing the Kullback-Leibler divergence

  <\equation*>
    KL<around*|(|<around*|\<nobracket\>|<frac|f<rsub|j><around*|(|\<b-theta\>|)>q<rsup|\\j><around*|(|\<b-theta\>|)>|Z<rsub|j>>|\<\|\|\>>q<rsup|new><around*|(|\<b-theta\>|)>|)>
  </equation*>

  This is easily solved because the approximating distribution
  <math|q<rsup|new>(\<b-theta\>)> is from the exponential family, and so we
  can appeal to the result Eq. <eqref|10.187>, which tells us that the
  parameters of <math|q<rsup|new>(\<b-theta\>)> are obtained by matching its
  expected sufcient statistics to the corresponding moments of Eq.
  <eqref|10.196>. We shall assume that this is a tractable operation. For
  example, if we choose <math|q(\<b-theta\>)> to be a Gaussian distribution
  <math|N(\<b-theta\>\|\<b-mu\>,\<Sigma\>)>, then <math|\<b-mu\>> is set
  equal to the mean of the (unnormalized) distribution
  <math|f<rsub|j><around*|(|\<b-theta\>|)>q<rsup|\\j><around*|(|\<b-theta\>|)>>),
  and <math|\<Sigma\>> is set to its covariance. More generally, it is
  straightforward to obtain the required expectations for any member of the
  exponential family, provided it can be normalized, because the expected
  statistics can be related to the derivatives of the normalization
  coefcient, as given by (2.226). The EP approximation is illustrated in
  Figure <reference|fig10.14>.

  <\padded-center>
    <\small-figure|<image|image/fig_10_14_expectation_propagation_gauss.png|.5par|||>>
      <label|fig10.14> Illustration of the expectation propagation
      approximation using a Gaussian distribution for the example considered
      earlier in Figures 4.14 and 10.1. The left-hand plot shows the original
      distribution (yellow) along with the Laplace (red), global variational
      (green), and EP (blue) approximations, and the right-hand plot shows
      the corresponding negative logarithms of the distributions. Note that
      the EP distribution is broader than that obtained by variational
      inference, as a consequence of the different form of KL divergence.
    </small-figure>
  </padded-center>

  From Eq <eqref|10.193>, we see that the revised factor
  <math|<wide|f<rsub|i>|~><around*|(|\<b-theta\>|)>> can be found by taking
  <math|q<rsup|new><around*|(|\<b-theta\>|)>> and dividing out the remaining
  factors so that

  <\equation>
    <wide|f<rsub|j>|~><around*|(|\<b-theta\>|)>=K<frac|q<rsup|new><around*|(|\<b-theta\>|)>|q<rsup|\\j><around*|(|\<b-theta\>|)>><label|10.199>
  </equation>

  where we have used Eq. <eqref|10.195>. The coefcient <math|K> is
  determined by multiplying both sides of Eq. <eqref|10.199> by
  <math|q<rsup|\\j><around*|(|\<b-theta\>|)>> and integrating to give

  <\equation*>
    K=<big|int><wide|f<rsub|j>|~><around*|(|\<b-theta\>|)>q<rsup|\\j><around*|(|*\<b-theta\>|)>\<mathd\>\<b-theta\>
  </equation*>

  where we have used the fact that <math|q<rsup|new>(\<b-theta\>)> is
  normalized. The value of <math|K> can therefore be found by matching
  zeroth-order moments

  <\equation*>
    <big|int><wide|f|~><rsub|j><around*|(|\<b-theta\>|)>q<rsup|\\j><around*|(|\<b-theta\>|)>\<mathd\>\<b-theta\>=<big|int>f<rsub|j><around*|(|\<b-theta\>|)>q<rsup|\\j><around*|(|\<b-theta\>|)>\<mathd\>\<b-theta\>
  </equation*>

  Combining this with Eq. <eqref|10.197>, we then see that<math| K=Z<rsub|j>>
  and so can be found by evaluating the integral in Eq. <eqref|10.197>.

  In practice, several passes are made through the set of factors, revising
  each factor in turn. The posterior distribution
  <math|p<around*|(|\<b-theta\>\|\<cal-D\>|)>> is then approximated using Eq.
  <eqref|10.191>, and the model evidence <math|p<around*|(|\<cal-D\>|)>> can
  be approximated by using Eq. <eqref|10.190> with the factors
  <math|f<rsub|i><around*|(|\<b-theta\>|)>> replaced by their approximations
  <math|<wide|f|~><rsub|i><around*|(|\<b-theta\>|)>>.

  \;

  Expectation Propagation

  We are given a joint distribution over observed data <math|\<cal-D\>> and
  stochastic variables <math|\<b-theta\>> in the form of a product of factors

  <\equation*>
    p<around*|(|\<cal-D\>,\<b-theta\>|)>=<big|prod><rsub|i>f<rsub|i><around*|(|\<b-theta\>|)>
  </equation*>

  and we wish to approximate the posterior distribution
  <math|p(\<b-theta\>\|\<cal-D\>)> by a distribution of the form

  <\equation*>
    q<around*|(|\<b-theta\>|)>=<frac|1|Z><big|prod><rsub|i><wide|f<rsub|i>|~><around*|(|\<b-theta\>|)>
  </equation*>

  We also wish to approximate the model evidence <math|p(\<cal-D\>)>.

  <\enumerate-numeric>
    <item>Initialize all of the approximating factors
    <math|<wide|f<rsub|i>|~><around*|(|\<b-theta\>|)>>.

    <item>Initialize the posterior approximation by setting

    <\equation*>
      q<around*|(|\<b-theta\>|)>\<propto\><big|prod><rsub|i><wide|f<rsub|i>|~><around*|(|\<b-theta\>|)>
    </equation*>

    <item>Until convergence:

    <\enumerate-alpha>
      <item> Choose a factor <math|<wide|f<rsub|j>|~><around*|(|\<b-theta\>|)>>
      to refine.

      <item>Remove <math|<wide|f<rsub|j>|~><around*|(|\<b-theta\>|)>> from
      the posterior by division

      <\equation>
        q<rsup|\\j><around*|(|\<b-theta\>|)>=<frac|q<around*|(|\<b-theta\>|)>|<wide|f<rsub|j>|~><around*|(|\<b-theta\>|)>><label|10.205>
      </equation>

      <item>Evaluate the new posterior by setting the sufcient statistics
      (moments) of <math|q<rsup|new><around*|(|\<b-theta\>|)>> equal to those
      of <math|q<rsup|\\j><around*|(|\<b-theta\>|)>f<rsub|j><around*|(|\<b-theta\>|)>>,
      including evaluation of the normalization constant

      <\equation>
        Z<rsub|j>=<big|int>q<rsup|\\j><around*|(|\<b-theta\>|)>f<rsub|j><around*|(|\<b-theta\>|)>\<mathd\>\<b-theta\><label|10.206>
      </equation>

      <item>Evaluate and store the new factor

      <\equation>
        <wide|f<rsub|j>|~><around*|(|\<b-theta\>|)>=Z<rsub|j><frac|q<rsup|new><around*|(|\<b-theta\>|)>|q<rsup|\\j><around*|(|\<b-theta\>|)>><label|10.207>
      </equation>

      \;

      \;
    </enumerate-alpha>

    <item>Evaluate the approximation to the model evidence

    <\equation>
      p<around*|(|\<cal-D\>|)>\<simeq\><big|int><big|prod><rsub|i><wide|f<rsub|i>|~><around*|(|\<b-theta\>|)>\<mathd\>\<b-theta\><label|10.208>
    </equation>
  </enumerate-numeric>

  \;

  A special case of EP, known as<em| assumed density filtering> (ADF) or
  <em|moment matching> (Maybeck, 1982; Lauritzen, 1992; Boyen and Koller,
  1998; Opper and Winther, 1999), is obtained by initializing all of the
  approximating factors except the first to unity and then making one pass
  through the factors updating each of them once. Assumed density filtering
  can be appropriate for on-line learning in which data points are arriving
  in a sequence and we need to learn from each data point and then discard it
  before considering the next point. However, in a batch setting we have the
  opportunity to re-use the data points many times in order to achieve
  improved accuracy, and it is this idea that is exploited in expectation
  propagation. Furthermore, if we apply ADF to batch data, the results will
  have an undesirable dependence on the (arbitrary) order in which the data
  points are considered, which again EP can overcome.

  One disadvantage of expectation propagation is that there is no guarantee
  that the iterations will converge. However, for approximations
  <math|q(\<b-theta\>)> in the exponential family, if the iterations do
  converge, the resulting solution will be a stationary point of a particular
  energy function (Minka, 2001a), although each iteration of EP does not
  necessarily decrease the value of this energy function. This is in contrast
  to variational Bayes, which iteratively maximizes a lower bound on the log
  marginal likelihood, in which each iteration is guaranteed not to decrease
  the bound. It is possible to optimize the EP cost function directly, in
  which case it is guaranteed to converge, although the resulting algorithms
  can be slower and more complex to implement.

  Another difference between variational Bayes and EP arises from the form of
  KL divergence that is minimized by the two algorithms, because the former
  minimizes <math|KL(q\<\|\|\>p)> whereas the latter minimizes
  <math|KL(p\<\|\|\>q)>. As we saw in Figure 10.3, for distributions
  <math|p(\<b-theta\>)> which are multimodal, minimizing
  <math|KL(p\<\|\|\>q)> can lead to poor approximations. In particular, if EP
  is applied to mixtures the results are not sensible because the
  approximation tries to capture all of the modes of the posterior
  distribution. Conversely, in logistic-type models, EP often out-performs
  both local variational methods and the Laplace approximation (Kuss and
  Rasmussen, 2006).

  <subsection|Example: The clutter problem>

  <\small-figure|<image|image/fig_10_15_clutter.png|0.3par|||>>
    <label|fig10.15>Illustration of the clutter problem for a data space
    dimensionality of <math|D=1>. Training data points, denoted by the
    crosses, are drawnfrom a mixture of two Gaussians with components shown
    in red and green. The goal is to infer the mean of the green Gaussian
    from the observed data.
  </small-figure>

  Following Minka (2001b), we illustrate the EP algorithm using a simple
  example in which the goal is to infer the mean <math|\<b-theta\>> of a
  multivariate Gaussian distribution over a variable <math|\<b-x\>> given a
  set of observations drawn from that distribution. To make the problem more
  interesting, the observations are embedded in background clutter, which
  itself is also Gaussian distributed, as illustrated in Figure
  <reference|fig10.15>. The distribution of observed values <math|\<b-x\>> is
  therefore a mixture of Gaussians, which we take to be of the form

  <\equation*>
    p<around*|(|\<b-x\>\|\<b-theta\>|)>=<around*|(|1-w|)>\<cal-N\><around*|(|\<b-x\>\|\<b-theta\>,I|)>+w\<cal-N\><around*|(|\<b-x\>\|\<b-0\>,a
    I|)>
  </equation*>

  where <math|w> is the proportion of background clutter and is assumed to be
  known. The prior over <math|\<b-theta\>> is taken to be Gaussian

  <\equation*>
    p(\<b-theta\>) = \<cal-N\>(\<b-theta\>\|\<b-0\>,b I)
  </equation*>

  and Minka (2001a) chooses the parameter values <math|a=10, b=100> and
  <math|w=0.5>. The joint distribution of <math|N> observations
  <math|D={\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>}> and <math|\<b-theta\>>
  is given by

  <\equation*>
    p<around*|(|\<cal-D\>,\<b-theta\>|)>=p<around*|(|\<b-theta\>|)><big|prod><rsub|n=1><rsup|N>p<around*|(|\<b-x\><rsub|n>\|\<b-theta\>|)>
  </equation*>

  and so the posterior distribution comprises a mixture of <math|2<rsup|N>>
  Gaussians. Thus the computational cost of solving this problem exactly
  would grow exponentially with the size of the data set, and so an exact
  solution is intractable for moderately large <math|N>.

  To apply EP to the clutter problem, we rst identify the factors
  <math|f<rsub|0>(\<b-theta\>)=p(\<b-theta\>)> and
  <math|f<rsub|n>(\<b-theta\>)=p(\<b-x\><rsub|n>\|\<b-theta\>)>. Next we
  select an approximating distribution from the exponential family, and for
  this example it is convenient to choose a spherical Gaussian

  <\equation*>
    q<around*|(|\<b-theta\>|)>=\<cal-N\><around*|(|\<b-theta\>\|\<b-m\>,v
    I|)>
  </equation*>

  The factor approximations will therefore take the form of
  exponential-quadratic functions of the form

  <\equation*>
    <wide|f|~><rsub|n><around*|(|\<b-theta\>|)>=s<rsub|n>\<cal-N\><around*|(|\<b-theta\>\|\<b-m\><rsub|n>,v<rsub|n>I|)>
  </equation*>

  where <math|n=1,\<cdots\>,N>, and we set
  <math|<wide|f|~><rsub|0><around*|(|\<b-theta\>|)>> equal to the prior
  <math|p<around*|(|\<b-theta\>|)>>. Note that the use of
  <math|\<cal-N\><around*|(|\<b-theta\>\|\<cdummy\>,\<cdummy\>|)>> does not
  imply that the right-hand side is a well-defined Gaussian density (in fact,
  as we shall see, the variance parameter <math|v<rsub|n>> can be negative)
  but is simply a convenient shorthand notation. The approximations
  <math|<wide|f|~><rsub|n><around*|(|\<b-theta\>|)>>, for
  <math|n=1,\<cdots\>,N>, can be initialized to unity, corresponding to
  <math|s<rsub|n>=<around*|(|2\<pi\>v<rsub|n>|)><rsup|D/2>>,
  <math|v<rsub|n>\<rightarrow\>\<infty\>> and <math|\<b-m\><rsub|n>=\<b-0\>>,
  where <math|D> is the dimensionality of <math|\<b-x\>> and hence of
  <math|\<b-theta\>>. The initial <math|q<around*|(|\<b-theta\>|)>>, defined
  by Eq. <eqref|10.191>, is therefore equal to the prior.

  We then iteratively reÔ¨Åne the factors by taking one factor
  <math|f<rsub|n><around*|(|\<b-theta\>|)>> at a time and applying Eq.
  <eqref|10.205>, <eqref|10.206>, and <eqref|10.207>. Note that we do not
  need to revise the term <math|f<rsub|0><around*|(|\<b-theta\>|)>> because
  an EP update will leave this term unchanged. Here we state the results and
  leave the reader to fill in the details.

  First we remove the current estimate <math|<wide|f|~><rsub|n><around*|(|\<b-theta\>|)>>
  from <math|q<around*|(|\<b-theta\>|)>> by division using Eq. <eqref|10.205>
  to give <math|q<rsup|\\n><around*|(|\<b-theta\>|)>>, which has mean and
  inverse variance given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<b-m\><rsup|\\n>>|<cell|=>|<cell|\<b-m\>+v<rsup|\\n>v<rsub|n><rsup|-1><around*|(|\<b-m\>-\<b-m\><rsub|n>|)>>>|<row|<cell|<around*|(|v<rsup|\\n>|)><rsup|-1>>|<cell|=>|<cell|v<rsup|-1>-v<rsup|-1><rsub|n>>>>>
  </eqnarray*>

  Next we evaluate the normalization constant <math|Z<rsub|n>> using Eq.
  <eqref|10.206> to give

  <\equation*>
    Z<rsub|n>=<around*|(|1-w|)>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-m\><rsup|\\n>,<around*|(|v<rsup|\\n>+1|)>I|)>+w\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-0\>,a
    I|)>
  </equation*>

  Similarly, we compute the mean and variance of
  <math|q<rsup|new><around*|(|\<b-theta\>|)>> by nding the mean and variance
  of <math|q<rsup|\\n><around*|(|\<b-theta\>|)>f<rsub|n><around*|(|\<b-theta\>|)>>
  to give

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<b-m\><rsup|new>>|<cell|=>|<cell|\<b-m\><rsup|\\n>+\<rho\><rsub|n><frac|v<rsup|\\n>|v<rsup|\\n>+1><around*|(|\<b-x\><rsub|n>-\<b-m\><rsup|\\n>|)>>>|<row|<cell|v<rsup|new>>|<cell|=>|<cell|v<rsup|\\n>-\<rho\><rsub|n><frac|<around*|(|v<rsup|\\n>|)><rsup|2>|v<rsup|\\n>+1>+\<rho\><rsub|n><around*|(|1-\<rho\><rsub|n>|)><frac|<around*|(|v<rsup|\\n>|)><rsup|2><around*|\<\|\|\>|\<b-x\><rsub|n>-\<b-m\><rsup|\\n>|\<\|\|\>><rsup|2>|D<around*|(|v<rsup|\\n>+1|)><rsup|2>>>>>>
  </eqnarray*>

  where the quantity

  <\equation*>
    \<rho\><rsub|n>=1-<frac|w|Z<rsub|n>>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-0\>,a
    I|)>
  </equation*>

  has a simple interpretation as the probability of the point
  <math|\<b-x\><rsub|n>> not being clutter. Thenwe use Eq. <eqref|10.207> to
  compute the refined factor <math|<wide|f|~><rsub|n><around*|(|\<b-theta\>|)>>
  whose parameters are given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|v<rsub|n><rsup|-1>>|<cell|=>|<cell|<around*|(|v<rsup|new>|)><rsup|-1>-<around*|(|v<rsup|\\n>|)><rsup|-1>>>|<row|<cell|\<b-m\><rsub|n>>|<cell|=>|<cell|\<b-m\><rsup|\\n>+<around*|(|v<rsub|n>+v<rsup|\\n>|)><around*|(|v<rsup|\\n>|)><rsup|-1><around*|(|\<b-m\><rsup|new>-\<b-m\><rsup|\\n>|)>>>|<row|<cell|s<rsub|n>>|<cell|=>|<cell|<frac|Z<rsub|n>|<around*|(|2\<pi\>v<rsub|n>|)><rsup|D/2>\<cal-N\><around*|(|\<b-m\><rsub|n>\|\<b-m\><rsup|\\n>,<around*|(|v<rsub|n>+v<rsup|\\n>|)>I|)>>>>>>
  </eqnarray*>

  This renement process is repeated until a suitable termination criterion
  is satised, for instance that the maximum change in parameter values
  resulting from a complete pass through all factors is less than some
  threshold. Finally, we use Eq. <eqref|10.208> to evaluate the approximation
  to the model evidence, given by

  <\equation*>
    p<around*|(|\<cal-D\>|)>\<simeq\><around*|(|2\<pi\>v<rsup|new>|)><rsup|D/2>exp<around*|(|B/2|)><big|prod><rsub|n=1><rsup|N><around*|{|s<rsub|n><around*|(|2\<pi\>v<rsub|n>|)><rsup|-D/2>|}>
  </equation*>

  where

  <\equation*>
    B=<frac|<around*|(|\<b-m\><rsup|new>|)><rsup|T><around*|(|\<b-m\><rsup|new>|)>|v>-<big|sum><rsub|n=1><rsup|N><frac|\<b-m\><rsub|n><rsup|T>\<b-m\><rsub|n>|v<rsub|n>>
  </equation*>

  Examples of factor approximations for the clutter problem with a
  one-dimensional parameter space <math|\<theta\>> are shown in Figure
  <reference|fig10.16>. Note that the factor approximations can have innite
  or even negative values for the `variance' parameter <math|v<rsub|n>> .
  This simply corresponds to approximations that curve upwards instead of
  downwards and are not necessarily problematic provided the overall
  approximate posterior <math|q(\<b-theta\>)> has positive variance. Figure
  <reference|fig10.17> compares the performance of EP with variational Bayes
  (mean eld theory) and the Laplace approximation on the clutter problem.

  <\padded-center>
    \;
  </padded-center>

  <\padded-center>
    <\small-figure|<image|image/fig_10_16_clutter_factor.png|.5par|||>>
      <label|fig10.16>Examples of the approximation of specic factors for a
      one-dimensional version of the clutter problem, showing
      <math|f<rsub|n>(\<theta\>)> in blue,
      <math|<wide|f|~><rsub|n><around*|(|\<theta\>|)>> in red, and
      <math|q<rsup|\\n>(\<theta\>)> in green. Notice that the current form
      for <math|q<rsup|\\n>(\<theta\>)> controls the range of
      <math|\<theta\>> over which <math|<wide|f|~><rsub|n><around*|(|\<theta\>|)>>
      will be a good approximation to <math|f<rsub|n>(\<theta\>)>.
    </small-figure>
  </padded-center>

  <\padded-center>
    <\small-figure|<image|image/fig_10_17_clutter_compare.png|.5par|||>>
      <label|fig10.17> Comparison of expectation propagation, variational
      inference, and the Laplace approximation on the clutter problem. The
      left-hand plot shows the error in the predicted posterior mean versus
      the number of \]oating point operations, and the right-hand plot shows
      the corresponding results for the model evidence.
    </small-figure>
  </padded-center>

  <subsection|Expectation propagation on graphs>

  \;

  So far in our general discussion of EP, we have allowed the factors
  <math|f<rsub|i>(\<b-theta\>)> in the distribution <math|p(\<b-theta\>)> to
  be functions of all of the components of <math|\<b-theta\>>, and similarly
  for the approximating factors <math|<wide|f|~><around*|(|\<b-theta\>|)>> in
  the approximating distribution <math|q(\<b-theta\>)>. We now consider
  situations in which the factors depend only on subsets of the variables.
  Such restrictions can be conveniently expressed using the framework of
  probabilistic graphical models, as discussed in Chapter 8. Here we use a
  factor graph representation because this encompasses both directed and
  undirected graphs.

  We shall focus on the case in which the approximating distribution is fully
  factorized, and we shall show that in this case expectation propagation
  reduces to loopy belief propagation (Minka, 2001a). To start with, we show
  this in the context of a simple example, and then we shall explore the
  general case. First of all, recall from (10.17) that if we minimize the
  Kullback-Leibler divergence <math|KL(p\<\|\|\>q)> with respect to a
  factorized distribution <math|q>, then the optimal solution for each factor
  is simply the corresponding marginal of <math|p>. Now consider the factor
  graph shown on the left in Figure 10.18, which was introduced earlier in
  the context of the sum-product algorithm. The joint distribution is given
  by

  <\equation*>
    p<around*|(|\<b-x\>|)>=f<rsub|a><around*|(|x<rsub|1>,x<rsub|2>|)>f<rsub|b><around*|(|x<rsub|2>,x<rsub|3>|)>f<rsub|c><around*|(|x<rsub|2>,x<rsub|4>|)>
  </equation*>

  We seek an approximation <math|q(\<b-x\>)> that has the same factorization,
  so that

  <\equation*>
    q(\<b-x\>)\<propto\><wide|f|~><rsub|a>(x<rsub|1>,x<rsub|2>)<wide|f|~><rsub|b>(x<rsub|2>,x<rsub|3>)<wide|f|~><rsub|c>
    (x<rsub|2>,x<rsub|4>).
  </equation*>

  Note that normalization constants have been omitted, and these can be
  re-instated at the end by local normalization, as is generally done in
  belief propagation. Now suppose we restrict attention to approximations in
  which the factors themselves factorize with respect to the individual
  variables so that

  <\equation*>
    q(\<b-x\>)\<propto\><wide|f|~><rsub|a1>(x<rsub|1>)<wide|f|~><rsub|a2>(x<rsub|2>)<wide|f|~><rsub|b2>(x<rsub|2>)<wide|f|~><rsub|b3>(x<rsub|3>)<wide|f|~><rsub|c2>
    (x<rsub|2>)<wide|f|~><rsub|c4> (x<rsub|4>)
  </equation*>

  which corresponds to the factor graph shown on the right in Figure 10.18.
  Because the individual factors are factorized, the overall distribution
  <math|q(\<b-x\>)> is itself fully factorized.

  <\padded-center>
    <\small-figure|<image|<tuple|<#89504E470D0A1A0A0000000D494844520000052F000001920806000000025334F1000000097048597300000EC400000EC401952B0E1B0000000C744558746C6F676963616C5800343537601E58D20000000C744558746C6F676963616C5900353238834290030000000F7445587473637265656E0048444D492D412D312F0D9F850000200049444154789CECDD795C54F5FE3FF0178BA0625198496EA0998906B986E55E88E6921926A2666A66994A59DDBCEECB4DD3CAAB17CDE59A572395D25C4B0BC5D214955C0313F5A702B9808E0BA223DBC0F9FD31DF59CE2C30C0CC9C33675ECFC7C347670EC3F09EE9F399F339EFCFE6210882002222222222222222222299F1943A00222222222222222222224B98BC242222222222222222225962F2928888888888888888886489C94B2222222222222222229225262F898888888888888888489698BC242222222222222222225962F2928888888888888888886489C94B2222222222222222229225262F898888888888888888489698BC242222222222222222225962F2928888888888888888886489C94B2222222222222222229225262F898888888888888888489698BC242222222222222222225962F2928888888888888888886489C94B2222222222222222229225262F898888888888888888489698BC242222222222222222225962F2928888888888888888886489C94B2222222222222222229225262F898888888888888888489698BC242222222222222222225962F2928888888888888888886489C94B22222222222222222292256FA90370946BD7AEE1BFFFFD2FCE9C3983FAF5EB63CC983108090901009C3F7F1EFFFDEF7F71F9F265B46DDB16EFBEFB2E1E7EF861892326225B9C387102F1F1F1B87AF52AC2C2C2306EDC380404040000929292B071E346E4E7E723323212C3860D83878787C4111351790441C0F6EDDBB173E74EDCBB770F11111118397224BCBCBC505A5A8A356BD6E0B7DF7E43AD5AB53064C81074E9D245EA9089EC8AD73622E5E1B58D48991E3C7880B56BD7E2D0A143F0F1F1C1E0C1831119190900B87BF72E962E5D8AD4D45404070763CC983178F2C927258E58191439F2322525056FBFFD36222222F0EDB7DFA255AB5668D7AE1D0E1C38807DFBF6E1A38F3EC2E0C183B162C50AECD8B103BD7BF7963A6422B2C1CA952B11171787F7DE7B0FDF7CF30DAE5EBD8A76EDDAE1E6CD9B58B060017EFCF1474C9D3A159F7CF2093EF9E4134C9F3E5DEA9089A81C25252578F7DD77F1D75F7F61DEBC7958BC783156AD5A8501030640A3D1E0F5D75F8746A3C1D2A54BD1B56B5744464662F7EEDD52874D6437BCB611290FAF6D44CA74E3C60D444747E3D1471FC5CA952B317EFC7844474763E1C285C8CECE46FFFEFDD1A64D1B7CF3CD37C8CFCFD75FCFC90E0485494D4D157AF6EC293C78F040743E28284868D1A285101E1E2EDCBD7B57100441F8E0830F040082A7A7A75058582845B84464A3D5AB570B13274E149DCBC8C8100008DDBA75135E7BED35FDF956AD5A0900844E9D3A393B4C22AAA09123470A5BB66C119D5BB3668D0040E8DEBDBBB078F162411004E1C68D1B42B56AD50400C2B469D3A40895C8EE786D2352265EDB889447AD560B5DBA7411CE9F3F2F3AFFE69B6F0AD5AB57173A76EC289C387142100441D8B66D9B004000202425254911AEE2286EDAF8FBEFBF8FFFFDEF7FA851A386E87CAD5AB5F0D75F7F61E1C285FA29E28220C0CBCB0B63C78E858F8F8F14E112910D542A15FEFBDFFFE2D0A143A2F3B56AD50200ECDBB70FC78F1FD79F170401B56AD5C29831639C1A2711554C525212BCBCBC3060C000D1795DDD4E4B4BC3CF3FFF0C403B45A7468D1AA85BB72E060D1AE4F45889EC8DD7362265E2B58D4899E6CD9B873163C6E0A9A79E129DAF55AB160A0A0A10101080D6AD5B03008A8B8BE1E5E585F0F07074E8D0418A70154751C9CB949414D4AB570FC1C1C1A2F3C5C5C5B878F12200882E228B172FC6A79F7EAABF905873EBD62DA4A5A5A15BB76EF60E99886CF0BFFFFD0FA3478F86A7A778A58BB367CF02001A366C88366DDAE8CF9F387102050505A859B3A6C5D7BB7AF52AFEFCF34FE4E5E5A159B366080D0D45B56AD51CF70688C8A2458B1661D1A24566E77575BB77EFDEF0F5F50500040505212727073E3E3EF0F2F2B2F87A696969387FFE3C8A8A8AD0B46953B46BD78E6B03926CD9FBDAA6B377EF5EB46DDB168F3CF288FD8326A272D9F3DA56545484B4B434A4A7A7A36EDDBA68D9B225EAD5ABE7D8374044668A8B8BB163C70ECC9A35CBEC67BABA6D9C6B1A387020727373ADE69A341A0D525252909999093F3F3FB46CD9D22C294A628A5AF3B25EBD7A58BC78B1D9F9D4D454141414A051A34668DCB8B1E867D60A537E7E3ECE9D3B87C58B17232C2C0C3366CC7048CC4454BE975F7E1923478E343B9F92920200E8DEBDBBE8BCA7A7A7C59BBBFBF7EF63DCB871F8E4934F90919181B4B434C4C4C4E0A9A79EC2FAF5EB1D133C1159F5E9A79FA259B36666E77575DBB4D3B0468D1A166FEE2E5EBC88175F7C119B366D82AFAF2FFCFDFD317DFA74346FDE1CBFFEFAAB436227AA2A7B5DDB4A4A4AA052A9B07BF76E44474723222202274E9C704CD044542E7B5DDBF6ECD9833E7DFAE0C71F7FC4EDDBB7B176ED5A040505E18D37DE407676B643622722CB044140424202BCBDC5E3FF4A4B4B71ECD83100E675DB5AAE69E7CE9D78F1C51771E2C409D4AD5B170F1E3C40BF7EFDF0E28B2FE2F2E5CB0E895F091435F2B261C38616CFEFDFBF1F00D0B56B579B5EE7EAD5AB78E38D37D0AC5933F4EEDD1BD7AF5F4793264DEC162711554C585898C5F315ADDB63C68CC1D0A143D1A74F1FFDB92953A6A05FBF7E18366C18BCBCBC3078F0E0AA074C4436D14DAD31565A5A8A83070F02B0BD6EF7E9D30763C68CC1871F7EA83F17111181A79E7A0A7DFBF6C5E9D3A7791D27D9B1D7B5EDB3CF3EC31F7FFC812E5DBAC0DFDF1F80F6268B88A4618F6BDBA953A7B068D1226CDBB60D7E7E7EFAF343870E45DFBE7D71E6CC191C3870A0DC91D844641F3E3E3E68D9B2A5D9F953A74EE1EEDDBB68D8B0A1D940394BB2B2B2F0C61B6F60FBF6EDE8DCB9B3FE7C9B366D10121282C8C848A4A7A7DB3576A550D4C84B6BF6EDDB07C0F64660FDFAF5F1EBAFBF62C58A1578E5955738E58C48864A4B4B71E0C00100B6D5EDB367CFEA6F088DF9F9F9E9A7F618273E88481AA74E9D426E6E2E1A34686053C2F1D6AD5B3877EE1CA64E9D0A8D46A33FEFE3E383D6AD5B233F3F1F7BF6EC7164C8447653D16B1B004C9B360D3B76ECC0C71F7F8CA0A020478647449554D16BDBFCF9F3F1D8638FA1A4A44474BE77EFDEE8DFBF3F4E9C388175EBD6392A5C22B25145734DC78E1DC39D3B773067CE1CD1F9E6CD9BC3DFDF1F67CF9EC5B973E7EC1DA622283E79A9D1682ADC834D44F277FCF871E4E6E6A27EFDFA78F2C927CB7DFE99336770EDDA354C9A34C9EC67616161A859B326B2B3B3F1F7DF7F3B225C22B2D1DEBD7B01D87ECDAE5DBB36FEFDEF7F63C9922566537974D3EA1A346860DF20891CA4A2D73622720D15BDB69D397306DF7EFB2D76EFDE6DF633DDE61F478E1CB15F8044542915ADDB3D7AF4C0A44993306DDA34D1F9070F1E202F2F0FDEDEDEA85BB7AEDDE35402C5272F8F1E3D8ABCBC3CD4AB570F4D9B3635FBF9E79F7F8EC2C242092223A2AA484A4A0260F9425152528279F3E689CEBDF4D24B183B762CE6CE9D6BF6FCC2C242FDF780F1D41C2272BEB2EAF6DF7FFF8D6FBEF9C6ECFCC48913317AF468D1B9B367CFE2F8F1E3080B0B43AF5EBD1C132C919D55F4DA4644AEA1A2D7B659B36661DCB871E8D9B3A7D9F3F3F2F200B0CD4A24B5E2E262FCFEFBEF002CD7ED5F7EF905478F1E159D7BF8E187317FFE7CB3E76FD8B0018220E09D77DEE1867B56282A7979F4E8517CF5D55750ABD5FA7389898900808E1D3B9A3DFFEAD5ABD8B2658B7EB7372292A72D5BB660C3860DA27365D5EDCD9B37E3D6AD5BA273FEFEFE58B66C19FAF7EF6FF6FC5F7FFD15252525080F0F47EDDAB5ED1839115953505080152B56203939597FEEC18307FA35C12CD5EDF9F3E7232020A0DCD74E4D4D45747434C2C3C3919898687577722229D9E3DA4644F262AF6BDB6BAFBD86A54B97E2A1871E327BBE6E2914E335DC89C8B1AE5CB982FFFCE73FC8CCCCD49F4B4E4EC6FDFBF751A74E1DB39DC20541C0D4A953111C1C5CE6EB96949460DBB66D983C7932468F1E6D71036AD252CC863D77EEDC41D7AE5D919F9F8F1A356A60D4A851282D2D4542420200ED3A96A6E6CF9F8F7FFDEB5FCE0E95882AE0975F7E4154541400ED3499264D9AE0EFBFFFD6AF09665AB78B8B8BB172E54A7CF7DD7736BD7E71713166CE9C093F3F3F2C59B2C4BEC1139155B366CDC282050BD0B06143FD720D5BB66CC183070F0098D7ED2B57AEE0C2850BE8D7AF9FD5D78C8B8B43626222CE9E3D8B9A356BE2F3CF3F476060A0E3DE04512539FADA4644D270C4B5CDD8D6AD5B71F4E8510C1A3488B30A889C68E0C081484949C1F1E3C7111F1F0F00FA75672DE59AB66CD982975F7E1975EAD4B1F87A8220E0BDF7DEC3F9F3E771FAF46974EBD60DFFFCE73FCD96402203C58CBC3C75EA14F2F3F3111010A0DFA27ED1A245888E8E46BD7AF5F4DBD7EBAC5CB912356AD4408F1E3D248896886C75F8F06100DA1DD8828383515A5A8A89132762D1A245F0F4F414D5ED929212BCF3CE3B183F7EBCD50B85A98F3FFE18FFEFFFFD3FECDEBD1BEDDBB777C87B202273BABAAD4BE0DCB973075F7DF515A64F9F0E00A2BA7DEBD62D8C1E3D1A4B972E2DF335636363B173E74E5CBC78110B172E44646424860E1D8AFCFC7C07BD0BA2CA71F4B58D88A4E1886B9B4E464606468D1A85989818AC5FBFDECE911391354545453871E204BCBDBDF1CA2BAF0000FEF8E30F64676763C08001484F4FD7775000DA7ABE76ED5A4C9932C5EA6B7A787860F9F2E5D8BB772F727272D0BA756B346FDE1C5F7EF9A5C3DF8FAB524C5AF785175E40CF9E3D51BB766DFCFEFBEF98376F1EFCFDFDF1E5975FE295575EC1EBAFBF8E89132722242404BFFCF20BDAB56B87CF3FFF5CEAB089A81C23468CC077DF7D873E7DFAE0EBAFBFC68E1D3B3074E850C4C4C4E0A1871EC2F4E9D3E1EFEF0F6F6F6F6CDFBE1D93264DB2B927FA8B2FBEC0A64D9BB077EF5EB46DDBD6C1EF84888C7DF2C927B876ED1A9A346982458B1661D7AE5D58B16205C2C2C270EBD62D7CF0C107183F7E3CAE5DBB8683070FE2EBAFBF46E3C68D6D7EFDC8C848C4C6C6EAA7E3716435C98923AF6D44241D475DDBAE5EBD8A9E3D7B62F0E0C1F8EAABAFE0E9A998314844B2E7E3E383C9932763F7EEDDC8CBCBC38C1933909A9A8A6FBFFD1600F0EAABAF223A3A1AFDFBF7C7B163C770FFFE7D6CDCB811356AD4B0E9F53D3C3C3065CA14FCF4D34FF8C73FFE81C68D1BEB3B40C8C043100441EA20EC2935351559595968D3A68D68F86E6161A17EF39E76EDDAE1F1C71FB7F935AB55AB860E1D3AE8A7F210917369341A1C3E7C180F1E3C40870E1DE0EFEFAFFFD9EDDBB771ECD8317D3DB5F522B160C1026CDFBE1D9B376FC6134F3CE1A8D089A80C797979387CF8306AD5AA85F6EDDBC3C7C747FFB3CCCC4C9C3E7D1A75EBD645BB76EDE0E1E161F575AE5FBF6E7167C6C4C444F4EAD50B3E3E3EB877EF9EE8F589A4E6886BDBDCB973316DDA34242525E1A5975E7254E84454067B5DDB74AE5CB9825EBD7A2136361663C68C7164E8445486CB972FE3D4A95368D2A4095AB46821AABFA74E9DC2E5CB971112126271A3689DC2C242E4E7E75BDC9467F2E4C9FACD7CF6EDDBE788B7E0D21433F252272C2C0C61616166E77D7D7DD1A95327092222A2AAF2F6F646E7CE9D2DFE2C202000919191157ABDCF3EFB0CE9E9E9D8B76F9FA8413976EC584C9932050D1B36AC52BC44649B871F7ED8E24EAA00101C1C5CEE22E780B6DEAE5CB912EBD6ADC3902143443FD325838A8A8A90979787C71E7BACCA3113D98BBDAF6D44240FF6B8B6E95CBE7C19AFBFFE3A962F5F2EFABEC8CACAC2E79F7F8EAFBEFAAAAAE112918D1A366C68F53EB155AB5668D5AA55B9AFD1BA756B646464203D3DDDECBB40D76EBD79F36695635522C5252F8988CAF2E9A79FA2A8A848BFD0B28E20084849494183060D248A8C882AE3EFBFFF86200850ABD5663F3B77EE1C00E0E9A79F66E29288885CCADF7FFF8DD1A347E3DB6FBF35DBC9F8E0C183154A821291F4341A0DAE5EBD8AE2E2628BEBB1EBDAAD1C7467199397E550ABD5282929415E5E9ED4A1105115CD9933079F7EFA299E7CF2496CDAB4497FBEB4B41477EFDE45C3860D6D9ABE4344F2316AD42814171763D4A851A2F3A5A5A5F8EAABAFE0E5E585E5CB974B141D9173DDBD7B57F45F22724D595959E8DEBD3B0A0A0AF41B8400DACEF6E2E2625CBD7A159B376F96304222AA286F6F6FBCF9E69BA85DBB36424242443FBB76ED1AB66CD9827AF5EA61F6ECD91245286F8A5BF3D25EBA76ED8AD2D2525CBB760DF7EFDF476969291E7FFC713CFAE8A368D5AA95CDBBC211913CFCFCF3CFE8DDBB7799CF79F3CD37B176ED5AE704444476B36EDD3A7CFBEDB7E8DEBD3B9E79E619DCBB770F2B56ACC0F5EBD7111717C7E9B7A4686BD7AEC5EAD5AB51505080ACAC2C787878C0D3D3138D1B3786979717E2E2E2D0BA756BA9C324A20A080F0FC71F7FFC51E67332323238FA92C8C594969662CA9429387FFE3C222222D0B8716364656561C1820578FAE9A71117178766CD9A491DA62C3179494444442E4FA3D1E0C89123B874E9123C3D3DD1A2450B848585C1DB9B934C88888888483EEEDEBD8B949414646565A176EDDA78E6996798B42C079397444444444444444444244B9E52074044444444444444444464099397444444444444444444244B4C5E121111111111111111912C317949444444444444444444B2C4E425111111111111111111C9129397444444444444444444244BDE5207E0349999C0A143C0850BC0D9B3404282F5E78685012D5B027DFB02414140AB56809F9FD34225221B6934407A3A909606A4A40067CE004949D69F1F1101B46801848703A1A1404808E0ED3E5F83442E43AD064E9D02B2B2809F7E0254AAB2EB764C0C50A78EB66EBFF002101CECB45089EC8EE59F4899542AE0E851E0D225ED7DE95F7F01A9A9969F1B180874EF0E346F0E346D0AF4E8A1ADE744243FA6B9A6DF7E0372722C3F57976B7AE105A04913A07D7BD66D1B79088220481D84436834C0EEDDC0BA7565272A6D151606444501C387B351482425B51A58B306D8BEBDEC9B395B454400FDFB032347B29382484A2A15B07C39B079B3F59BB98A888901860D03BA7665DD26F963F92752A6B43460EB566DFDB696CCB0556020306890F65F78383BE089A4A2D16807CE6CDC08C4C555FDF5020381B163810103B4036CC822E5252F333381458BEC5388AC090B03264DD25E3878D120728EE46460D62CFB242CAD8988D0FE8D8E1D1DF73788C840A3D136FC162CB04FC2C69AD85860E244763E92BCB0FC1329935A0D2C5C689F84655966CFD6263C386A8BC8399C916B0A0C04A64EE5C01A0B9493BC4C4B033EFBACFC5196313186E1F7A1A1C0430F897F7EE60C909BAB9DA653D6507EC050B0DE7D97494C2247494E06DE7BAFFCBAD8BDBB76F87D4080E5BA7DE81070FBB6F6BF650DE507D84141E468BAA4CD471F955F1775CBB800DA3A6EECDE3DEDF5DF96693ABAD75BB68C1D14242D7B97FF8A5CDB58FE891C4797B49C39B3ECE7192F63F4C823DA636357AF6A978DB065B933407B7F3B6F1E3B28881C2533139832A562B9A6A020A07E7DF1CF75B9265B963B03B41D141F7DC424E6FF71FDE4A55A0DBCFDB6F5821411A1CD5A57760D20DDBA437BF75AEF3D0B0C0456AF067AF7AEF8EB1391659999DAE9DCD69296BA2971955D2744B7EE5062A2F5DEB3B030EDD2131CBE4F643FBB76016FBD653DC9327B36F0D24B955F6F5AA502F6ECD12E2F61AD51181303FCE73F1CAD42CEE78CF27FF4A8766408CB3F9173E83A24860EB5FC73E329A1955D6F3D33533BB866D52AEB6DE3D9B3B5091676BC13D9875AADAD5365DD2BBEFDB6B693B132B926DDFE0DE52D2DB17E3D07D5C0D593971B3658BE48E846444647DBB761A65BDBE0ABAF2C274B2322B431B1314854791A8DB687C9D245423722B27F7FFBF640A9D5C0FEFDC0E4C9961B843131407CBCDB5F3088AA44A502860CB19C50D18D08B3F71A5EBA3572E7CEB5DC205CB204183FDE7E7F8FC81A967F22652AABB33D2646DBB6B47727B86E8D5C4B233C0303811F7EE0086BA2AA2AABB3D1514B3694359B382C4CBBE7831B8FB076CDE4A5B5D1968181DAA1FACEC84A97357478E74E8EC224AA0C954ADB0960DA0074E654376BD3D4030381C387DDFA82415469C9C9C0C081E60D40674D752B6B9A6E4404B06D1BA7E490E3B0FC132993B58134B1B1C0B4698E1FD052D634F5D858EDCFD8F14E5431650DA459B2C4396B5196956B5ABF5EDB19EA865C2F79A952691319A68DAFD8586D03D0D98DAFB434EDD455D344C7ECD9C08C19CE8D85C8952527039D3A999F976A98FC860D966FF40E1E646F365145CC99637E6325D5C8108D46DB56B0140F3B27C81158FE899447A3015E7ED97C24B55423A3AC0DECE1AC40A28AB13690262646BB6483B3734DD64676BBE9AC40D74A5E5AEAB9964383CB5A63D04D0B15518559EAB996C36810B51A78F555F3C6293B2788CA67EDDA2887D1209999C0F3CFB373821CCB52E2522EE5DFD2CD10CB3F51F9AC252EE5301ACADABD726A2A139844E5B134482E3010D8BD5BFAFD0F962E05264C109F8B88007EFED9AD724DAE93BCB4342A4B6EC9414B170C372C54441562E9E64E6EEB7059BA60308149649DA59B3BB96D6E676D5A1013385455D6921B725A5688E59FA8E2D46AED2EC2721B4863CCD2FABA4C601295CD52A7B61C06D2184B4B032223DD3AD7E41AC9CBCC4CA07163F139B9260E2C65EC2322B43B9F129198A5119772BD71B2D48122D7EF2122A9BDFFBE382922E71B274B1D2872FD1E22D7605AA658FE895C9FA54E09B9253774AC7520CAF57B88484A96F2377298256189A569ED6E94C0947FF2D25261927BC2C052A1927BCC44CE66291928F71B264B3D5E728F99C8D95C2971A3B36B17D0A78FF8DC8D1BF28E99E489E59F4879AC252EE59E30B0F47D74F9B2BC6326722657CC3559FB3E7283C172F24E5E6A3440DBB6AE9904B45411E4345D88484A2A15F0F8E3E273AE92044C4BD3D66D631919F2992E442425D324882B246E744C4782F3268F2ACAB4538EE59F48194C9380AE90B8D4319D09E126490E229BF4E8214E02BA4AAEC95202536ECBAE3980BC9397A65FB6AE5298742C2530D9934DEECE52A784AB242E752CDDA0F2268FDC9DE935CF9512373AA637A83131DAA40E517994D0E663F9273267DAE60B0B038E1F779D369FA524871C361722929AE99E06AE76CDB3D4EE484D957E732107926FF2D274F486ABF612998ED272B50B1E91BD99DE1CB95AA7848EE9052F3616F8CF7FA48B87486AA6BDD7AED629A163FA3E789347B6504AF91F32044848303C66F927776669831E57EB9400B409CC860DC5EF83B386C89D29254763BA378CC207D4784A1D80451A0DF0D65B86C78181DAC5905D5168A87608AF4E6A2AB071A374F1B8BA5DBB000F0F69FFB9528F8CDC64669A4FBB993245B270AA64FC786DFC3A7171DAF74795B36183B4F5FA8927B4372954391B36984FBB71C5C40DA06D6F04061A1E7FF411CB06956DD72E71F98F8D75DDF21F1FEF1AE55FEA6B86878776449E2B4B4E96FE33947B9B7ACA14F325C05C2D7109681319870F8BCFBDFDB634B1D84AA5D2B6CDD82EACBCCC4CE0D967A5ADE34B974AFD2998D3688061C3C4E792925C33E1171CACED64D4C9C901E6CD932C1C4793E7C84BD391594A582BF2D967C5D364EFDF97DFCE74AEE08927C48D08A9C8B0DAB804D39129AED87B6D4CAD066AD5323C0E0B03FEFC53BA785C998787D411B8EE087FA9998E4C71D5DE6B63A63DF21C594DD6988E6862F9770E395C33020381EC6CA9A3A83CB6A9CB663AA2C9D5A6945A62BAB6AD9CEFB14DEF19A4E0EAED42D3FC8354E456C74DEB8112661898CE9A50E8C86AF9252F4D93014AB85000E61740579D2A2B3539345601F97D09BB02D3358394B2A8B0E905D055A70A4A8D75DB759976382A65BD1D3769085215B1FC4B83D78CAAE3675836D3E49912069E98AE3B2FE729A62C9F55C7CFD09CA50E47250C3C31DD0C5729393413F29B36BE70A1F8B1DC7A7A2B2B3858DB73AD3373A6EB0F4527AA88F7DE331C070602EFBE2B5D2CF634689078848AF1FB24523AB5DA7C830F25246E0060D52AF1E3F87869E220F9D268DCA7FC2F5A244D1C4452C8CC345FFBD8D51397803649B96C99E1714E0E973323F7B271A378C4F9F6EDD2C5624F75EA88972A4C4850E47266F24A5E9ADE04CD9EEDDA534A4D99AE3F609AA82552AAE464F1B485850BE5D9CB5B19A60DC1D454D75F078BC856A68D3E25ADB3E3E7A76D87E8B0D3914C99DEF42BB9FCC7C5B1FC93FB305E8F3D3050DB51AD141D3B8A3BDD3FFA48BA58889C49A31197F7981879CD28A8AA9123C58F5D755F8932C82B79697A13347CB83471388A9F9FB692E82C5FAEAD44444A677C83A7B4462060DE109C354BB250889C4AC98D40C0FCA66ECD1A69E2207962F927521EB55ABC6482923ADC754C475FB2D39DDC414A8A78D4E5E4C9D2C5E208A69D8E09098AEB749457F272C102C3B1121B8180B8573E27475B8988944CADD68ED8D0993A55798D40009834C9709C94A4B88B059199B434653702016D43D078C917D3A9B4E4BEDCB1FCCF9D2B5D2C44CE629AA4EFDF5F9A381CC9B4D39D53C7C91D7CF595E1382C4C39CBBC1833ED74DCBF5F9A381C443EC94B954A3CAD74DC38E96271A4E0605E2CC8BD987E699A0E69570AD3C6AD52D65021B2E6EBAF0DC78181CA6C0402E291E2A9A9DAA415D1D6AD86632597FFD1A30DC739392CFFA47CC69D54B1B1CA58EBD292B7DF361CC7C5713620299BE9886AE341274AE2E7074444181E2B6CBD6AF9242FF7EC113F0E0F97260E6730BD581029D9BA7586E38808E536024D9785E0F43A523AE3CEB7A953A58BC3D13A76D426A77414D68B4D95B47CB9E178EC58E9E270B4D050967F721FA6836994B6CC91B1E868F163CE0624253B754AFC588923AA75264E341C2B6C36A07C92973FFD64388E8951E6B4521DD38B8502778222D233EEE552EAA84B9D61C30CC74949ECC526E552A9C45366FBF6952E166730BE81E5A86A322DFF030648178B3318276759FE49C98E1E153F56F2609A3A75C4B301F7EE952E162247332EDF4A1E4C03005DBB8A1F9B266E5D987C9297C6090EA5DF04D5A923EEC53E7448BA58881CC93431FFC20B9284E134EDDB8B1FA7A74B130791A399CE9650E21AD5C67AF6341CB363824C131C2121D2C4E12C2FBD643866F927254B4C341C4744287B300D004445198E376F962E0E2247339E2DA1E45197803631ABD08E0979242FDD2DC10100DDBB1B8E8D479D12298969625EE9090ED38E09AE0D464A653CBDCC78B904A532ED98B872459A38481EDC2DC1D1AA95F831CB3F29D5BE7D8663A527380071C784F174792225D168C4B3254C47262A9171C7C48103D2C56167F2485E47B7924500002000494441545EBD2A7EACF40407201E5DFAD75FD2C541E448B76F1B8EDD21C101883B262E5C902E0E224752A90CC7EED0E158A78EF8F19933D2C441F2605CFEDD21C1613ABD8EE59F94CA3881D7BAB57471384BFDFAE2C75CCA8C94C8B4C3CD78A08952B56B67384E4A922E0E3B9347F2322BCB706C3CC455C982820CC7ECE922A5321E79697AF3AF54CD9B1B8ECF9E952E0E2247325EEA252040BA389CC978F7C6DC5CE9E220E9B97BF9BF7449BA38881CC5B85302304FEC2991E980A17BF7240983C8A14C3BDCDCE19EB4450BF163856CDA238FE4A5F1E8AC962DA58BC3994C2F880A295044562979D173634D9B1A8E8D6F708994CA1D465E02E2C62E977B211D772CFF5CAB9D94C8F45EAC410369E270362E77444A67DCE16CDC11A764A6095AD3CE1917258FE4251B418A295044224CDE11298FBB76B6198FAA2672374ADF4C93C894D2D7B2D5315EEE8848E9DC61D425A0D8DDD4E5F7ADEC2E3707A615A7716369E2A0CAF1F0903A02922BD351382C2BAE85FFBFC81AE351D5E4BEB8269CB663929D93642FBCEE4A4B100CC743876AFF11D9939CEAB871792797238F9197C6DCE5E640A1D97022AB4C772B55AA070FA48E80C8B9783D2352BEF3E7A58E80881C811BC7923B61797769F24B5EA6A4481D8173B8EBB43B725FA74E491D8173D4AC29750444CEC5EB1991F2356B26750444E408EEB2DF0411C0F2EEE2E4376DDC5DD67E347D9F1919E63BBE9139B90C3BE79073DB3CF1049093237514CE65BA862FCB8A6D58B75D875A0DD4AA257514CE77E182D411901CB86B5BCD7873CD981860C306E96201E473CDA0AA93CB753733D33D97F132AE4BEBD703438648178B31D671E590BA8E6FD860580E81E5CAA5C963E4A5BBECD4581677593C96DC8BBB2F026EBC83239152B8EB34F1B367A58E80E4E8DE3DA923700E6EAE49EE46A3913A02E7F8ED37A92320721E779936AED00181F2485E0604188EDDE50BF4CC19F16377BD1924F7E12E4B42188FCE72F7E42DB90777496A183778B9F3B27B33EE984A4B932E0E6732BE1162F9272532BD17BB72459A389CCD78865468A8747110394A5090E1383555BA389CC97449A7060DA489C3CEE491BC34FEA2749729A6B9B986E38808E9E2207224E351D5A6097BA5321E9DD5BCB974711039524C8CE1D8783AA9921937788D1BC2E47E8C3BA6DC653981A424C3F1238F48170791A398CE82BB7A559A389C293353FCF8A187240983C8A1EAD7173F56E8A84411D38105DEF25B2DB232E491BC34FDA234FD2255A29F7E321C73CA38295593268663E31B1F254B48301C376D2A5D1C448E647CDDDABE5DBA389CC5B4A16BDA1026F762DC3175E0807471388B69F96FD1429A38881C2D2CCC707CF2A47471388BE9C002775DD39794CD74D4E1F9F3D2C4E14CC61DABC6030E5C9C3C9297A65F94EE3005CD38C1C1E937A454EDDB8B1F2BBD63C2F4FD713D5F52AA9E3D0DC74949CA5F1BECE851F163854CBFA14A6AD7CE70CCF24FA41C5151866377E8984B4C341C7326202995B7B7B86362EF5EE9627196CD9B0DC70A9A09288FE42520CE081B8F4A54222638C85DD4A9235E1B4CE91D13A6EF8F3DD8A454A61D13E9E9D2C4E12CA637780A997E4395C4F22F5D2C448EF4D24B866377E898D8B8D170DCBFBF747110399A71C78471624F89D46AF15247C6DF6B2E4E3EC94BE3D1870909CABE5898266799E020251B34C870BC6081747138C39A358663050DD1273263DA31B175AB74B1389A4603C4C5191EF3068FDCADFC33C141EEA2552BF163256F36A95289F79AE8DA55BA58881CCD3881979AAAEC752FF7EF173F36FD5E7361F2495EF6E8217EBC7BB7347138C3DCB986E3D858E9E2207206E3E4A5922F166AB5785DCF61C3A48B85C819C68E351C2F5F2E5D1C8E667AF31A1D2D4D1C242FA6E55FA99DEE2929E20407973A2225F3F3134F2F9D354BB2501CCEF4BA1D12224D1C44CE101E2E7EFCFDF7D2C4E10C8B16198E2322B4DF6B0A219FE4659D3AE2B5368C3F7425494B133702478F962E16226770978B85F1A84B803DD8A47C0306188E737280E464E96271A4AFBE321C878571933DD21A3EDC709C93A3DC115AA6E59FB38548E93EFBCC709C94A4ED9C5622E3E4E5ECD95C0E8294CDDB5B3C686CD52AE9627124954A3C9866E244E9627100F9242F01F1879B94A4CCCD3D8C2F8881814068A874B1103983E9C562EE5CE58D50D168C423AA636214D5CB45645168A878EAAC719243293233C51BECBDFDB664A190CC04078B4768BDF79E64A1388C4AC5F24FEEC7B4F379E14269E270A4E464F1601AE3CE4822A5329D0DA8C44E77D311D59191D2C4E120F24A5E46468A6F84A64C912E164730BD099A3A55B250889CCAB863222747BC7E96126CDC286E048E1B275D2C44CE647C539790A0BC4EC7F878F1E39123A58983E469D224C3716AAAF2CABFE94D10CB3FB9033F3FF1BAE533672AAFD3DDB8B3252C8C8369C83D74EC28CE3529ADD351ADD67E5FE9287044B5BC9297DEDEE23584947623649A8C652390DC4570B07859888F3E524E4350A3D1BE1F9DB030EDC591C81D0C1AA4DC4E4795CABC11C811D564CCB4FC2B696422CB3FB9B379F3C48F57AC90260E47D8B54BBC13F1B265D2C542E46CC69DEE4A1B7D693A4ADC38AFA610F24A5E02E22400A09C86605A9A78D4251B8195637C93E0CE31B822E345CF7372CC1B86AE6AC50AF1A84B36022B470EF54A0E31B81A6F6FF12C828404E53404DF7F5FFCD8B47D42E4ED2DBE59484AD226069440EEE55F0EDFD77288A12AE410BF1C62B02438583CFA72C204656C38A9D1006FBD65781C1828DF0E7739940D39C4E0EAE4F6199A763ABEF79E3206D464668A3B1C636214B946BBFC92977E7EC0FAF586C74A68086A34E29D870303E5D7087415A9A9D27E0906068A7B2BC9761D3B9A4FC371F591D52A95B641AB131121DF46A0DCB16EBBAE77DF15FFBF1B38D0F51B82BB76893B1C972C61872359667A23F4D65BCA2BFF72EC70E735A3EAF81996CDB493DD34A1EF8AE6CD1377B8FFF08374B19487E5B3EA962C91F6EFCBF133F4F60656AF363C4E4D55C6C86AD3017FFFF98F3471389887200882D44198D16880B66DC585FDC60DD7CD1EBFFF3E10176778BC7E3D30648874F1104945A5021E7FDCF0382C0C387EDC35D7E3D06880975F16EFE89691C19D58C93DEDDA05F4E963781C1BEBBA0D27954AFBDDA4BBC10B0C042E5F76CDEF29728EE464A05327C3E3981860C306E9E2A90A967F22833973C4A3995CF91E2E2D4DBCC9982B7F4F1155558F1ECAB9875BBA543C9866C91260FC78E9E2712079262F01F32F58574D729836682322803D7BA48B87486AA65FB0AE9AE4306DD02AF842416413D386E0CE9D40EFDED2C55319963A250E1EE4886A2ADF9021E2D18AAE9AE450423D26B2178D0668D8503C5AD115931C6A35D0B4A9F87DB8F2C020A2AACACC041A37363C76D58E3AD39C99ABBE0F1BC96FDAB84E68A8769A8A4E6A2A307CB874F1544666A638711918C81E2EA2F1E3C59BF7C4C569139AAE64D72E71E23222423B7596C89D6DDB269EE2D5A78FEBAD7F396F9E3871131BCBC425D966D52A71F91F3AD4F5CAFF9C39E6E59F894B7267DEDEC0EEDDE273CF3FEF5AEB5F6A34C0ABAF8A13973B77327149EE2D3858BC54614E8EB6F3DA95967D51A980C848F1B9C387159BB804E43CF212B03C0262F66C60C60CE962B295E9B41B80A33788745CB97E988EA606D87B4DA463A9073835D535EA87E9686A579DF141D2312DFF80EB5C1F58FE89AC339D35E42AF5C3D2BD34A78B131998CE9A7095FA61E95EDA55677C54807C475E02DA0BC2860DE29EEC9933B50D2C39B3549866CF768DC40C9133D4A963BE4878A74EF21FA562297179F0A06BDC9812394368A87881F89C1CEDF550EEA3544C13378181DA9B3DB9DF9892BC84868A4772002CFF444A307EBC78D3C9D4546D5250AD962EA6F2584A5C464400F1F1D2C5442437F1F1E24EC78404ED7E25721E81A95269EBB269AE49E1894B40EE232F752C2503636381850BE5D7B04A4BD30EDF352D4CAE305A94C8D92C2503E5BA76A4E9862480EB8C16257236D3640820DFFA62295657192D47F2C4F24FA43C969281729D5D602D5605AF8547546996724D1111C0CF3FCBAFBE588BD54DF65491F7C84B9D3A75B41706E311987171DA2F6539F5666FD8605E98626298B824B2A66347ED0D9DB10913E4D5E3A5D1686FEE4C13971C4D4D64DD8C19E275AB016D47859CA6E2A8D5DACD492C2599E476234AAE85E59F4879BCBDB5C90CE375DB75B30BE4347328331368DBD67292556E89182239B0946B4A4AD2D62339E59A9293AD2759DD846B242F01EB852A2C4C3B224A4A1A8D7698EED0A1E2F3B367CBABA1EAC69293933160C000F4EBD70F23468C40464686D421918EA504665C9CF68291992949487A2A95B693C4D2CD1D3B256483F55BA62C2570860ED55E2FA59E6A9796A6DD79D5F4E6EEC60D764A907D582BFF3D7AC8B7FC6764B87CF93F76EC18468C1881091326E0F4E9D3A29FA9D56AAC5EBD5AA2C85C47616121162C5880989818AC5CB912858585A29FEFD8B1C37DAFB3D612989D3A693BBAA5EE78DFB041BB83726AAAE15C44843C47875601CBA87DF0FBD288A55C536A2AF0F8E3F2C835BDFFBEF67BC674909C1C47873A92E06A6EDC1084B0304100C4FF6262B43F73B69D3B052130D03C9E254B9C1F0B59B463C70EA17AF5EA426262A270FFFE7D213A3A5A68D6AC99D46191A983072DD7A5D9B305A1B8D8B9B114176BEBB0692C8181DA38493658BF5DC0FAF596EBD2FAF5CE8FE5FE7D6D7BC1523C52B42148F958FE9D66DBB66DC2638F3D2674EDDA5578FCF1C7050F0F0F21262646D8B66D9BB066CD1AA14D9B36427272B2D461CA9A5AAD165E7CF145A1458B1642FBF6ED052F2F2FA151A346C2BFFFFD6FE1E79F7F16C68D1B270C1A3448282929913A546915176BDBA7726927666408424484793C1111CE6F433B18CBA87DF0FBD28AE262EB752923C3F9F194757FEC865C2F792908DA42151B6BFE3F51F73FF2FE7DC7C770F0A0E5246A60A020A4A63AFEEF934D1E3C7820D4A95347E8D2A58B200882F0C1071F0800040F0F0FE1C18307124747666EDCB07CC1D0DDE839BA01565CACFD3B962E1211118AB8B95312D66F17929161B95E858539E746EFFE7DCB379A80B63DA1B09B3B92193997FF98184594FFB4B434212A2A4AB879F3A6200882505C5C2CAC5CB95268D4A8910040A857AF9E70E0C00189A394BFB7DF7E5BF8E1871FF48FCF9D3B270C1E3C58F0F4F4140008A3468D128A8A8A248C506676EEB45EAF9C91E8C8C8B05EB7153A908665B4EAF87D590E6B9D13CECE3559EB6C74E38134AE99BCD4B136EA5157B0EC9D44BC7F5FFB372D252D75172A671466B2D98A152B0400C2E4C993054110844F3EF944F0F6F616626363258E8CCA6469D4A3EE0B7BC912FB27116FDCD0BEAEB5EF93254B147173A734ACDF2EA6B8D872434C97C4D9B9D3FED7D0D454EB0DD0C040EDDF247286F2CAFFFAF5F62FFF652536A41AFDE920A5A5A516131625252542464686505858284154AEA7A0A0C0E2F9DBB76F0B3939394E8EC64558EB7837EEA0B0771BD25A6243F737153C908665B4EAF87D69A3D454EBF7863131F6AF67C5C565E79A389046708DDDC6CBA2D100F3E699AF49A71318084C9D0A74ED0A8484547C4D00950A387A1458B70E4848B0FC9CB030EDCF43432BF6DAE470BD7AF542626222366FDE8CD75E7B0D0070EFDE3D3CF4D043124746E552A9B4EB7B9455EF264D025E7801080EAEF8EB676602870E016BD688D7FD32161101AC5A55B9D7278763FD76516969C0B061E235B98C454400132702EDDB577C8D2E8D06484F07F6EFD7D65D6B7F233656DB76F0F3ABD8EB1355952DE57FE4C8CA5DDB58FE89A4B36B17F0D65BE235E98CC5C6023D7B56EEDAA65603A74E017BF702CB975BFF1BEBD7038306B9D71A78448EA4D1002B56683794B5243010183B1678E925A055AB8A5F5775B9A6C444ED9E0FD6FEC6EAD540EFDE157B6D0572FDE4A54E6626B06891F5FFE93A616140CB9640DFBE86734141405696E1F1850BC0D9B3D693263A8181C0C285BC48C8942008080808406E6E2E2E5DBA84C68D1B4B1D1255467232306B96F504A34E4484B631685CB7EBD605AE5F373C4E4901CE9C29FFB5C2C28065CB5C7EE3022563FD76711A0DB07B373079B2F5048B4E4C8CB66E87871BCE85866A93403A3FFD04FCF5976DAF356F1E3B24487AC9C9C07BEFD9AFFCAB54E55FDB58FE891C4BA301366E043EFAC87A8211D0DE4376EF0E346FAEDD3C0B001E7904F0F535B45B6FDFD676B2DB726D9B3D5BFB37D92141E4186AB536EF636DC09C8E2ED7F4C20B404080F65C501070F72E909BAB7DACCB35FDF65BF9DF13CC3589282779A9A32B5865F54A555544843699C2C486AC5DBC78114D9B3685BFBF3F72755F16E4BA6CEDA0A88AD858ED882FDED8C91EEBB782D8DA415159BA5EF1B16315B5DB2A2984B3CAFFF0E1BCB611394B453AE82A2B2C0C78FB6DED486D262D899C43ADD6CEDA9B3BD7B1B9A6891381C848262D4D282F79692C2D0DD8BA15D8BCB9EA170E5D21EADA95170817B169D3260C1A34089D3B77C6EFBFFF2E7538642F1A8D7604E5C68DDA7F55BD70C4C468A7F0F102E15258BF1548ADD64E772D6B99165B05066A7BAA070D624723B9064795FFF0705EDB88A4A45201DF7F0F6CDF5EF54E8AB030202A0A183080CB951149CDDEB9A6FEFD81E86876B49741D9C94B632A1570FEBC767AF84F3F69CF591A861F13A3FDAF6E18FF0B2F000D1AB0E1E72232323270F8F061088280AD5BB762F3E6CDE8D6AD1B468F1E0D00080808C0CB2FBF2C71946457BAB5422E5DD24EAF01CC87E1EBA6E700DA3ADDA409D0A20547A1B818D66F37A35B975637750E304FEAE8A6E700DA252382828066CDD8F023D75799F2FFC823955B4F4F61D46A35162E5C88FDFBF7C3CFCF0F7DFBF6C5983163A40ECBE5C4C7C7233E3E1E356BD64448480866CE9C899A356B4A1D966BD3AD4B9B9666983A6A69C907DD5248BA252382822AB79E9EC2252727E3CB2FBF8446A341EDDAB53173E64C2E235441595959983B772EB2B2B250AB562D4C983001DDBA75933A2CD7A35B97362B4B3BC846A5B29C6BD2D56D5DAE2934B472FBB2B829F7495E925BD8B973277EFABFE4F48E1D3B70EDDA35444646A24993260080264D9AE01FFFF887942192B37878188EF935A708ACDF44445496828202BCFCF2CBA856AD1A76ECD881FDFBF763C8902158BA742962740314A85C93264DC2BA75EB70E4C811141515212A2A0AE1E1E158B972A5D4A12917DBAD15F2E38F3F62D0A041D8BE7D3B3A76EC88B7DE7A0B274F9EC4B973E7A40ECD655CBA74099D3B77C6E8D1A3316BD62C7CF1C517983D7B36FEFAEB2F04738007C9109397A458C1C1C1C8CACAC2A953A7F0ECB3CF4A1D0E391B1B818AC6FA4D4444A6162E5C888F3FFE18BFFEFA2B42434351AF5E3D14171763D2A449983F7FBED4E1B984E3C78FA35DBB769831630666CF9E8DD6AD5BE3D4A953080F0FC7912347A40E4FB9D86EB5597E7E3E82828210121282FDFBF763E2C48958BC78313C3C3CA056AB51A3460DA9437409FDFAF5C39E3D7B909B9B8BC4C444BCFAEAAB00809F7FFE19BD7AF592383A22739E520740E40877EEDC41565616AA55AB86909010A9C321223BAA68FD2E2828704254444424258D4683C58B17C3DBDB1BE1E1E1282D2D85AFAF2F8282823074E850A9C373195F7EF92500A0E3FFAD17ECE3E383871F7E1813264C90322C22BDF8F878A8542A5119F5F6F6C684091398B8B4D1D9B367B173E74EB469D306D5AB57879797173C3D3DD1B9736774E9D245EAF0882CE2E47A52A453A74E01005AB66C091F1F1F89A321227BB2A57EFFF0C30FF8E8A38F909393031F1F1FDCBD7B179E9EECAF232252AA63C78EE1CA952B080D0D45CD9A3551B3664D5CBF7E1DD5AB57E7F7BF8D341A0D7EFCF1470040BB76ED0000870E1D42616121D7BB24D9D8BA752B0043195DB06001A64D9B86871E7A48CAB05CCAB66DDB200882FE33ECDBB72F727373F91992ACF14A4E8A74F2E4490040AB56AD248E8488ECCD96FA3D70E0409C3B770E25252568D3A60D6F5C8988144E37A5B975EBD6FA73356BD6E4F77F059C3E7D1A6AB51A8D1A354240400000C0CBCB8B894B920D411090929202405CD79974AB184BDF97FC0C49EE7835274562F29248B96CADDFA74F9F46494909774D24227203C78F1F07C0B65F55F03324B9BB74E912727373E1EFEFCF9DC5AB80759D5C119397A448BA69A5FC4226521E5BEBF7BE7DFB00005DBB76757448444424B113274E00003771AB027E862477BA321A1616267124AE4BA552E1CA952BF0F6F6468B162DA40E87C8665CF39214A7A0A00067CF9E05C0C61791D254A47EFFF6DB6FF0F1F1C1F3CF3FEF8CD08888C8C976ECD8817BF7EEA1B4B414E7CE9D0300FCF5D75FC8CECE86878707BA74E982060D1A481CA5BCA5A4A4E0C2850B000C9D7E376FDEC4FAF5EB010021212168D3A68D54E11121232303870F1F862008FAF52EBDBCBCF465342020002FBFFCB29421CADEBD7BF7B06BD72E68341A7D3BBA76EDDAF8E1871F00683FCF010306C0D7D757CA3089CAC4E42529CEE9D3A7A1D168101C1C8C471E79A4DCE797969622292909C9C9C9A85FBF3EA2A2A2E0EFEF8FFCFC7CAEFD412433B6D66F8D4683DF7FFF1DE1E1E1B87BF72E12121270F9F265444444E877A7242222D7555C5C8CBD7BF7A2A8A808D7AE5D4349490902020270E6CC190080A7A727C2C2C298BC2CC7A1438770FEFC79088280F4F47400407E7E3E0E1E3C0800F0F3F363F2922475E6CC191C3870000070F8F06100DA1DC67565B44993264C5E96E3DAB56BF8FDF7DF515A5A8A63C78E0100EAD4A9A3FF0C7D7D7DD1AF5F3F262F49D63C044110A40E82C89E56AD5A853163C6E0D5575FD5F7CE5973F3E64D0C1E3C188D1B37C6F4E9D3A152A93067CE1CE4E5E5E1DEBD7BFA2F7772411E1E86637ECD2986ADF53B2525051D3A74C0B3CF3E8BD0D0508C1F3F1E81818178FDF5D7D1B76F5FCC9831C3895113119123AD5DBB1623478EB4A9ED4796656666A271E3C678E4914770E7CE1DA9C3713F6CB7DA243838185959593875EA549933704A4B4BA1D168E0E3E3E3C4E85CC3881123F0CD37DF60F1E2C578FFFDF7CB7C6E414101AA57AFEEA4C888CAC6352F49716CDDCC43A552A16DDBB6A85FBF3E56AD5A85468D1AA16DDBB678E79D77B06FDF3E3469D2C419E1125105D85ABF7553DF3A75EA84F8F87884878723282808B1B1B19833670E2E5EBCE8E8508988C8499CB551E3DEBD7B919B9BEBD0BF2115477F8677EFDEC5FEFDFBF1EDB7DFE2E0C183B87BF7AE43FE0E29D79D3B77909595856AD5AA212424C4E273264D9A84C0C04054AB560DAFBEFAAA4DAF9B9E9E8E8D1B3762FBF6EDFA29D54A565E5DBF74E91242424250AB562DD4A851037FFCF147B9AF79F9F265ECDCB913F1F1F1D8BF7F3F1E3C7860D7988900262F4981749B793CF7DC73653E2F3636162A950A8B162D129DF7F8BF9ECFEEDDBB3B264022AA345BEBF7EFBFFF8EEAD5ABE38B2FBED0D76900F0F7F7474949894D0D312222720D8EDAA8B1A4A4042A950ABB77EF46747434222222F41B86288D2337BB5CBC7831060F1E8C63C78EE1EAD5AB983E7D3A1A366C88193366A0B8B8D8EE7F8F944957465BB66C697544E582050BB06EDD3A949696A27DFBF665BEDE850B173060C0002C5FBE1C376FDE445252129E7FFE7974ECD851B1EDC4A2A222FDF210D646AE3669D204E9E9E968D5AA157C7C7C101A1A6AF5F5F2F3F33174E850CC9E3D1B6AB51AF5EBD7C7B66DDBD0A85123C4C5C539E43D90FBE29A97A428A5A5A5484D4D85A7A767999B741C3F7E1CDF7DF71D060D1A84808000D1CF7423B698BC2492175BEB774949090E1E3C88F0F070D4A85143F4B3F3E7CFEB5F8B88885C9F20080E4BBC7DF6D967F8E38F3FD0A54B17F8FBFBEBFF9E12396AE4E5F2E5CB919393839F7FFE597FEE9FFFFC27264D9A847FFDEB5F50A95458BE7CB95DFF262993AD6554F77DD0AD5B37ABCFB977EF1E468E1C89F8F878346EDC587FFEC30F3FC4F3CF3F8FC8C848A4A4A4E0E9A79FAE7AE03272FAF46914171797BB767C494909D2D2D2D0A14307B3B6B4B1891327A2A0A000DF7CF30DBCBDB5A9A5975E7A09D9D9D978FFFDF7F1F8E38F63F0E0C1767F1FE49E38F29214E5FCF9F350ABD568DFBE7D995FC8BA459F232323CD7EB66FDF3ED4AD5B17CD9B3777589C445471B6D6EF3367CE202F2F0F9D3B7736FBD96FBFFD0600080F0F77589C4444E43C972E5D425E5E1E1E79E411040505D9F5B5A74D9B861D3B76E0E38F3FB6FB6BCB8DA392979F7EFA29EAD4A963767ECE9C39A85BB72E56AC58A1EF58242A4B45960EF2F1F141870E1DAC3E67FDFAF5282929417E7EBEE87CE3C68D3179F264DCBD7B17B367CFAE7AD03263EB6778F2E449E4E5E5A16BD7AE653E2F3939195BB66C414A4A8AE8BCEEB3DFBE7D7B15A2251263F29214453795A74F9F3E653EEFCF3FFF0400B46DDB5674FEDEBD7B387EFCB8BEA72E3B3B1B972F5FB67FA0445461B6D6EFAB57AF02309F0E73EBD62DECDEBD1BCD9B3747D3A64D1D13241111399523A73BBB8B5BB76EE1CA952B65AE255819B76FDFC6B56BD7F0F1C71FE3E6CD9BA29FF9FAFAA275EBD6008023478ED8ED6F9272D952D74B4A4A70E0C0018BB36F8C9D397306870F1FC6B265CBCC7EA64BBC29B15CDAFA7DA9EBEC2F6BF42AA09DA63F6DDA34B46BD74E743E3B3B1B00D0A041834A464A648ED3C6C9A5EDD9B3077BF6ECC13FFEF10FD4A95307070E1C80A7A727860F1F5EE6EFD5AB570F00CC7A82B76DDB86929212FD88ADB8B838BCF2CA2B68D8B0A163DE00115955D9FAAD6B283DF4D043A2F3FFFBDFFF50525282AFBFFEDA6131131191735574C460767636B66CD902954A85975E7A099D3B77C69D3B77F0E8A38F3A324C59D37D8665AD2568ACB4B414494949484E4E46FDFAF5111515057F7F7FE4E7E78BAEBD010101F8D7BFFE056F6F6F3CF6D86366AF9397970700F0F3F3B3D33B21A52A2828D06FA653D62EE3C78E1D435E5E1EBA75EB86BFFEFA0B898989282929415454946833D6D1A347233F3F1F63C78E357B0D25974B5BBF2F7FFDF557F8F8F8E0D9679FC5962D5B70EAD429848686222A2A0A9E9E86F16FBD7BF746EFDEBD45BF5B5454844D9B36A156AD5A18376E9CFDDF04B92D8EBC2497959A9A8A9E3D7BE28B2FBEC0962D5B000089898978FDF5D7CB9DDA131D1D0D2F2F2FFD82C5807654D7FCF9F30168172A2E2D2DC5C99327CB9C7240448E5195FA1D121282962D5BE2F7DF7FD79F3B7AF42866CD9A852FBFFC121D3B767468EC4444E43C151979B961C30674EEDC19C1C1C1183B762CF6EFDF8F3163C6E0B1C71EC34F3FFDE4E85065AB229FE1CD9B37111919894D9B36E1ADB7DE42DBB66D316AD428F4E8D1C3E27AF1D3A64DC33FFFF94FB3F3B76EDDC2C9939587481000002000494441542751AB562D74E9D2A5EA6F8214EDF4E9D3D06834E5AED5A8DBBBE0B7DF7EC3FAF5EBD1B76F5F74E9D2051D3B76C4EEDDBBF5CF0B0B0BC3AA55ABD0B2654BB3D7D8B3670F80F267FAB81A4110F4B30FCBAAEB1A8D06070F1E44404000468C1881EAD5AB63DCB871D8B3670F7AF5EA55E6BAF1376EDCC0B061C3505252825F7EF905C1C1C1F67E1BE4C638F2925C567676360441405050107AF7EE8DAD5BB742AD5663C99225E5FE6E585818D6AC59830F3FFC1023468CC0C58B1751B3664D1C397204FDFAF5C392254BB069D3267CFCF1C7A29D8A89C839AA52BFBDBCBCF0DD77DF61C48811F0F5F5C5FDFBF7F1EBAFBF62E7CE9DE54E7F212222D762EB48A2050B1660F6ECD9387AF4A83E61316DDA343CF7DC73282D2D158DCA7237B67E862A950AEDDAB543B76EDDB06AD52A0040A3468DF0CE3BEFA04F9F3E78FDF5D76DFE9B73E6CC417E7E3E962D5B66714D4C22631559EFD2C3C303E3C78F477474B4FE7C9F3E7D3066CC1864666696F9FB59595958B972259A356B86C9932757396E39B970E102EEDFBF5FEEFAC0C78F1FC7FDFBF7111A1A8A75EBD6E9372B9B3163061A366C88F8F8788C183142F43B7BF6ECC18A152B70E1C2055CBB760D4B962C2977B777A28A62F2925C56B76EDDD0A3470FB469D306DF7FFF3DD6AE5D8B4D9B36D9DC007AE38D37101D1D8D8B172FA269D3A6A856AD1A00ED452F2B2B0B8F3EFA281E7EF86147BE0522B2A2AAF5FB99679EC1D1A34771F1E245787A7AE2F3CF3F7770C44444E46C376EDCC0B56BD7E0E3E353E65A8DA74F9FC6F4E9D3F1E1871F9A8DB4F2F0F040DDBA75D1A2450B47872B5BB62686626363A152A9B068D122D1795D47BFA59197966CDDBA154B972EC592254B2C4EDB2532654B192D292941727232BA74E9224A5C0280BFBF3FB2B2B2909D9D8D279E78C2E2EF171515E1F5D75F47A3468D909494A44FDA2985ADF55C377369DEBC79A2CF40777CF8F061B3E4658F1E3DD0A3470F00DA2469BF7EFDB060C1026CDDBA95A32FC96E98BC2497E5EBEB8BC4C4441C3E7C18B9B9B93874E85085938DD61ABB4ADF519248EEEC51BF3D3C3CB8310F119182194F772E6BADC6C99327A3B8B8186FBEF9A6E8BC6EA3C68103073A344E39CBCFCFC7F9F3E7E1E5E585366DDA587DDEF1E3C7F1DD77DF61D0A04108080810FD4C3755D796E4E5BE7DFBF0D65B6F61F5EAD5660910226B7475FDB9E79EB3FA9C93274FE2DEBD7B1667D9E876B4B736E5B9B8B818D1D1D1F0F6F6C6BE7DFB50BB76EDAA072D33B67C8600B07FFF7EF8FAFAE2F9E79F179D2FEF33D469DAB429162F5E8C5EBD7AE1B5D75EC31F7FFC016F6FA69DA8EA588AC8A5797878E085175E903A0C227200D66F22222A8B6E2451596B190B8280E4E4643468D0C0ACC3FAE0C18328292941D7AE5D1D1AA79CA5A6A6A2A4A404AD5BB736DBE8CED88103070000919191663FDBB76F1FEAD6AD8BE6CD9B97F9B77EFDF557BCF3CE3BD8B973A7596284C89AD2D252A4A6A6C2D3D3B3CC7273F8F06100D06FBCAA535C5C8CE4E464D4AB570FF5EBD737FB3DDD88CBC0C0407CFFFDF7366D5AE58A6CF9BE04B49F63FBF6EDE1EBEB2B3AAFDB813C3C3C5C7FEEFAF5EBA85BB7AED96B74E9D2051E1E1E3879F2240E1E3CC8659BC82EB8610F1111111111B91CDDCDB8A5849ACEDF7FFF8D3B77EEA06DDBB6663F331D3198929262FF2065CE96CF10807EA30FD3CF51377A55979CC8CECEC6E5CB97CD7E7FEFDEBD98316306F6EDDB274A40AD5FBF1E09090955790BA470E7CF9F875AAD46FBF6EDCBDCACE7EAD5AB00CC7723FFE5975F70E7CE1DF4EBD7CFEC778A8A8A101D1D8D888808AC5CB95294B8ECDBB7AF9DDE813C9C3C7912D5AA552B7384746161216EDFBE6D7147F7848404F8FAFA2222220200F0DD77DF21303010EFBCF38ED973AB57AFAE4F7EDEBC79D34EEF80DC1D93974444444444E4724E9C38013F3FBF3247F5D4AD5B179E9E9E666B2697949460DBB66D78ECB1C7D0BC7973DCBD7B1773E7CE7570C4F273E2C40900E5EFAC5CAF5E3D0030FB1CB76DDB86929212FD68B7B8B8385CB97245F49C3D7BF660D9B265484C4C341BF9B66FDF3E2EF14265B2B58C3668D0001E1E1EA855AB96E8FC8A152B10181888CF3EFB4C74BEB0B0106FBCF106468D1A85091326887E76E5CA1508826087E8E5E1DAB56BB87EFD3A3A77EE5CE6086B5F5F5FD4AE5DDBEC39478F1EC5891327306BD62CFD1A96BA4E8AFBF7EF9BBDCEDF7FFF8D828202787A7A721615D90D93974444444444246BB76EDDC2A79F7E8A4D9B36010072727270E1C2050C1E3C18D5AB57B7FA7BD5AB5747545414D2D3D3F5E7341A0DDE7FFF7DDCB87143BFCBF8D6AD5B11131363F575EEDEBD2BFAAF2BD2683458BD7A353EFDF453FDB903070EE0C9279F44A74E9DCAFCDDE8E868787979893EC713274E60FEFCF90080264D9AA0B4B414274F9E44870E1DF4CFD9BD7B375E79E515FCF9E79F68D7AE1D42424210121282E6CD9BA351A34658B3664D999B2D91FBD9B3670F3EF9E413A8542A00DA32EAE9E989E1C38797F97B7DFBF685AFAFAF7E8903409B4C3F72E408121212F0E8A38FEACF17161662C08001484C4CC4279F7CA22F9721212178EAA9A7D0B2654B97DEC42B3D3D1D93264DD2277E759FC9C89123CBFDDD810307EA37ED0180DCDC5C0C1E3C1883060DC2C71F7FAC3F1F151585162D5AE08B2FBE307B8D254B96000066CF9EADEFF820AA2A0F41495D0A44443AFFB7F32500805F734444442E2D2A2A0A5BB66C41606020B2B3B3111F1F8FD1A347E3F8F1E3080D0D2DF377552A15860C1982E0E060346AD408E9E9E9183F7E3C542A15468F1E8D71E3C6213333135F7FFDB5686389B56BD762F5EAD5282828405656163C3C3CE0E9E989C68D1BC3CBCB0B71717168DDBAB5A3DFBADD2C59B204B1B1B10080B367CFA2468D1A080A0AC2F2E5CBF1EEBBEF96FBFBDF7EFB2DBEF8E20B8C183102172F5E44CD9A353163C60CF4EBD70F356BD644606020860C19A29F567AE7CE1DD4AB570F050505565F3328280899999976797F2E8DED5600DA35585BB56A054110B062C50ABCF3CE3B68D2A4099E7BEE397CF7DD77E5FEFE0F3FFC80050B1660F0E0C1F8F3CF3F91939383AFBFFE1A8D1A35123D6FD2A449F8FCF3CFCB7CAD356BD6B8E4A65225252578E28927A052A93078F06024242460D4A851F8EDB7DF909E9E5E66670FA04D560E1B360CF5EBD747707030B66CD982E1C3879B8D4E058063C78E61FAF4E978E69967101E1E0E6F6F6FFCF8E38FD8B66D1B66CE9C89091326C0C3B86C135501939744A44C6C0412111129C6F3CF3F8FA3478F62EAD4A998397326DAB56B87575F7D153366CCB0F935B2B3B3515A5A2A9ABA9C9F9F8FAB57AFBAC5D4E5C9932763FEFCF978F1C517919494840F3EF800A74F9F46525292CD0986A2A2225CBC78114D9B3645B56AD5F4E7B3B2B2F0E8A38FE2E1871F7654F8CAC6762B0020313111BD7AF5425050100E1C388063C78EE1DD77DFC5E9D3A7CD962CB0A6A8A808E7CF9F479D3A752C6E26A3746AB51AFEFEFEA85EBD3A366DDA84B0B0303CFDF4D3F8F1C71FCB5CEFD2544E4E0E6EDFBE8DA79E7A4A54D72D494D4DC5D9B36791979787E6CD9BE3D9679F2D737A3A516530794944CAC44620111191626CDFBE1DF3E7CFC7DB6FBF8D1F7FFC11356BD6C437DF7C231A294965BB74E912060E1C8837DF7C13972F5FC6810307B065CB168B3B309393B1DD0A403B9DBB5FBF7E68D3A60D1E7BEC31AC5DBB16CB962D43972E5DA40ECDA54C9E3C19172E5C4064642456AE5C89E1C387EB475D13B92A262F894899D8082422225294EBD7AFE3C8912368D2A449B953C5C9B2FCFC7CECDFBF1F7E7E7EE8D0A143B923AAC849D86ED5130401870F1F466E6E2E3A75EAC4D1BC9574F6EC599C3B770E6DDBB64583060DA40E87A8CA98BC242265622390888888885C01DBAD444465E26EE3444444444444444444244B4C5E121111111111111111912C317949444444444444444444B2C4E425111111111111111111C9129397444444444444440400282C2CC482050B10131383952B57A2B0B050F4F31D3B7620232343A2E888C81D71B771225226EEDA4844444444CEA052016161404E8E7431AC5F0F0C1952E59779F0E001FAF5EB879C9C1CF8F9F9E1C48913A85FBF3E3EF8E003848484E0A79F7E824AA5424242023C3D39168A889C83C94B225226262F89888888C8197AF4009292A48EC22E6DDE3163C6A067CF9E888A8A02009C3F7F1E3367CEC4C68D1B515A5A8A51A34661C58A15A856AD5A95FF161191AD98BC24226562F292888888889CC1B8DD29253BB4790B0B0BE1EBEB6B76FECE9D3B282A2A42DDBA75ABFC3788882A8AC94B225226262F89888888C8191494BC242292232E5241444444444444444444B2C4E425111111111111111111C91293974444444444444424121F1F8F888808BCF2CA2B983469121E3C7820754844E4A6BCA50E8088888888888888E463D2A44958B76E1D8E1C3982A2A222444545213737172B57AE943A342272434C5E121111111111111100E0F8F1E3FFBFBD7B8FF2BAAEF307FE446EEA78210C9D0D51D056257310BA6862799B8329A0B19A1ECC2E9A6996886527D6362FB4AE9B6E2C9BB51AA9B57942CB4D0D53D4958EBA80482912B04A1E5647457772BC903A203230BF3FBEBF611886CB0033F3FDCE7C1F8F73387C3E9FEFE7FBF9BCBEFFCC799FE7FB96EBAEBB2E575C7145060D1A94E1C387E74F7FFA5376DE79E76297069429D3C60100008024C90F7EF08324C9C8912393247DFAF4C91E7BEC9109132614B32CA08CF5686C6C6C2C761100EDAE478FE6637FE60000E8281BB63B8BA91DDABC0D0D0DE9D7AF5FEAEBEBF3FAEBAFA77FFFFE59BB766D56AF5E9D5D77DDB51D8A04D876465E0200000059B26449EAEBEBB3DF7EFBA57FFFFE49929E3D7B0A2E81A2125E0200000079F2C9279324871F7E78912B016826BC04000000B260C18224C9B061C38A5C094033BB8D03000040999A3F7F7E962D5B962479E491479224AFBDF65AA64F9F9E24193A7468468C1851ACF200849700000050AE1E7BECB13CFBECB3696C6CCC33CF3C932459B56A55E6CC999324A9A8A8105E024565B771A07BB2DB3800009DA19BEC365E535393214386A45FBF7E79F3CD37DBA928801D67CD4B00000028734F3DF554129BF500A5C7B47100000028730B172E4CD2FEE1E533CF3C93C58B17A76FDFBE39F8E08373C82187B4EBF381EECFC84B0000002873ED3DF272D9B26519376E5C6EBCF1C6BCF6DA6B99356B563EF1894F64E4C891F9C31FFED02EEF00CA83352F81EEC99A97000074866EB2E6E5A04183B27CF9F22C5CB830C3860DDBA167BDFDF6DB39F9E49373EBADB766C89021EBAF3FFFFCF3F9C4273E9177DF7D37F3E7CFCFC1071FBC43EF01CA83919700000050C65E7FFDF52C5FBE3CBD7BF7CED0A14377F879D3A74FCFDAB56BB36AD5AA16D7870C1992CB2EBB2C7FFDEB5F3379F2E41D7E0F501E849700000050C69AA68C1F7AE8A1E9D3A7CF0E3FEFE9A79FCEBC79F372C30D37B4FAECC8238F4C923CFEF8E33BFC1EA03CD8B007000000CAD8F66CD653535393FBEEBB2F2FBFFC720E3EF8E01C7BECB1D97FFFFD9324E79D775E56AD5A950B2FBCB0D5F7DE7AEBAD24494545453B540E9403232F010000A08C6DCB663DAB57AFCE65975D963163C664EFBDF7CEC4891373D86187E594534EC992254B9224555555B9E9A69B72E8A187B6FAFE430F3D9424193D7A743BFE02A03B33F212000000CA585BC3CB952B57E6E8A38F4E9F3E7D327BF6ECBCEF7DEF4B92DC76DB6D59B46851162E5C980F7FF8C39BFDFE0B2FBC9069D3A6E5A0830ECA65975DD67E3F00E8D6849700000050A656AD5A95679F7D363D7BF6CC881123B678EFC48913B378F1E22C59B2647D709924C3860DCBF9E79F9F71E3C66DF6BBEFBDF75E3EFBD9CF66BFFDF6CBAC59B3B2E79E7BB6DB6F00BAB71E8D8D8D8DC52E02A0DDF5E8D17CECCF1C00001D65C37667316D679B77FEFCF939F2C823337CF8F02C58B060B3F7CD9B372F471D7554C68E1D9B7BEEB9679BDEB166CD9A9C71C619F9CB5FFE92DFFDEE77D96BAFBDB6AB56A03C59F312000000CA54D394F151A3466DF1BE1933662449C68C19B34DCF7FEFBDF772FAE9A767EFBDF7CE238F3C22B804B699F012000000CA54D368CBAD6DA0F3EAABAF26D9B61DC9DF7BEFBD9C79E699A9AEAECEB469D3D2A74F9FF59F6D6B080A942FE1250000009481868686DC72CB2DB9FAEAABD75F9B3D7B760E3CF0C01C7DF4D15BFCEE21871C9224E9DBB7EF263FAFABABCBDD77DFBDFE7CF5EAD5F9FCE73F9F73CF3D3713264C6871EFF2E5CB63053BA0AD849700000050066EBCF1C69C77DE79B9FCF2CBF3E73FFF392FBEF862962E5D9A6F7DEB5BE9B195B53BCF3BEFBCBCFFFDEFCF030F3CD0EAB3279E782263C68CC9BEFBEE9BA4105C8E1B372E0F3EF860BEFDED6F67E8D0A1EBFFFDEDDFFE6D0E3DF4D07CE8431FEA90DF08743F761B07000080ED555999D4D616BF863678E595579224C71F7F7C0E3AE8A05C72C92539FEF8E373C105176CF5BBFDFBF7CFC30F3F9CF3CF3F3F353535A9AAAA4A6D6D6D9E7EFAE91C70C001993163462AFF7F1D575C7145EEBFFFFE24C95FFFFAD74D3EEFD0430F6D53CD00761B07BA27BB8D0300D019EAEA92AAAAE205989595C9A245C980015BBDF5B9E79ECBE9A79F9E2F7EF18B79E9A597327BF6ECDC75D75D193870E036BD72C58A1579E9A597B2DF7EFB65CF3DF7DCDECA01DA447809744FC24B00006865D5AA5579F4D14753515191238F3C32BD7BF72E7649005B24BC04BA27E125000000747936EC01000000004A92F012000000002849C24B00000000A024092F01000000809224BC044AD7DCB9858D77B6E7DF86B6E7FB7FF337495D5D717E3700000090C46EE34029DB3884EC6C9595C9FFFD5F716B000000803266E425C0E6D4D6B6FB235F78E1859C7FFEF939F1C41373DA69A7E591471E69F777000000407721BC04E824CF3DF75C8E3AEAA8FCCDDFFC4D1E78E0811C71C411193D7A746A6A6A8A5D1A0000009424D3C681D255EC69E349D28E7F22C78E1D9B871E7A282B56ACC8830F3E98CF7CE6334992FBEFBF3F9FFEF4A7DBED3D000000D05D187909D009962E5D9AFBEEBB2F23468CC8CE3BEF9C9E3D7B66A79D76CA273FF9C97CEA539F2A767900000050927A15BB008072F0DBDFFE368D8D8DF9E8473F9A241933664C56AC5891DD77DFBDC89501000040E932F212A0133CFEF8E34992E1C387AFBF26B8040000802D135E027482279F7C324972F8E18717B912000000E83A6CD80394AE6EB2614F5D5D5DF6DE7BEFF4EAD52BEFBCF34EFAF6EDDB0E8501000040F767CD4B800EF0F6DB6F67E6CC99696868C8D2A54B93247BEDB5577EF39BDF24497AF6EC9971E3C60932010000600B8497001DE095575EC97FFFF77F67DDBA7579E28927922403060CC89C397392247DFBF6CDD8B1638597000000B005A68D03A5AB9B4C1BFFD297BE945FFCE217F9B77FFBB74C9C38B11D8A02000080F260C31E800EF6D4534F25B1590F0000006C2B232F81D2D50D465EBEF7DE7BD96DB7DDB266CD9ABCF9E69BE9D7AF5F3B1506000000DD9F9197001D68C9922559B3664D060F1E2CB8040000806D24BC04E840A68C030000C0F6135E0274A0850B1726115E020000C0F6105E027420232F01000060FBD9B007285D5D7CC39EC6C6C6ECB1C71E79E79D7752535393FDF7DF7FABDF59B16245EEBDF7DE2C5DBA3495959539EAA8A33262C488EDAE01000000BA32232F013AC8B265CBF2CE3BEFA45FBF7E6D0A2E7FF9CB5F66D8B06159B16245CE3DF7DC8C1D3B36575E79657EF6B39F7542B5000000507A7A15BB0080EE6A5BA68C7FF5AB5FCD5D77DD95871E7A28C3860D4B923CF1C41399397366F6D9679F9C7BEEB91D5A2B0000009422E125400769DAACE7E31FFFF816EF9B3E7D7AA64D9B969B6FBE797D70992495959539FBECB3F3CD6F7EB343EB040000805265CD4BA07475F1352F4F3AE9A43CF0C003993163464E39E5944DDEB36AD5AA7CE0031FC84E3BED94DADADAF4EEDD7BBBDF07000000DD8D352F013AC8534F3D95DEBD7BE7B8E38EDBEC3D8F3EFA6856AC5891134F3C5170090000001B115E027480575E79257FF9CB5FF2C94F7E32BBEFBEFB66EF7BF5D55793B46D5D4C0000002837C24B8076F0CC33CF64D2A44959B060419264F6ECD9499273CE39678BDF3BE4904392247DFBF6DDE4E70D0D0D761B070000A06C092F0176D0DAB56B73CC31C7E4BAEBAECBBFFCCBBF24491E7CF0C10C1E3C38A79F7EFA16BFFBF18F7F3CC71F7F7C1E78E081569FD5D6D666ECD8B159B76E5D87D40D000000A5CE863D40E9EA221BF6D4D7D767CF3DF7CCCE3BEF9CFFFCCFFF4C5555550E3EF8E0FCEE77BFDBE27A974DDE78E38D7CFDEB5FCFCA952B73C20927E4DD77DFCDD34F3F9DC6C6C67CF39BDF6CB103390000009413E12550BABA48789924975D7659962D5B9651A34665DAB469F9C217BE908B2FBE789B5EF5EEBBEF66D9B26519306040F6D9679FEDA916000000BA15E12550BABA507899244B972ECD9FFFFCE77CE4231FC9BEFBEEDB81450100004079105E02A5AB8B859700000040FBB2610F50BA2A2BCBFBFD00000050E6849740E95AB4A87801626565E1FD00000040D198360E744F1B4E39F7670E000000BA24232F01000000809224BC04000000004A92F012000000002849C24B00000000A024092F01000000809224BC04000000004A92F0120000004892AC5EBD3AD75E7B6DC68F1F9F69D3A665F5EAD52D3EBFE79E7BF2FCF3CF17A93AA01CF5686C6C6C2C761100EDAE478FE6637FE60000E82873E726471F5DBCF75756268B16250306ECF0A356AE5C99B163C7A6B6B63615151559B06041060E1C984B2EB92443870ECDBDF7DE9BBABABADC7EFBEDD9692763A180CE21BC04BA27E12500009D61C37667B1545626FFF77F3BFC98F3CF3F3F279E78624E3BEDB424C9B3CF3E9B2BAFBC3277DC7147D6AD5B9773CF3D373FF9C94FD2BB77EF1D7E17405B092F81EE4978090040672885F032699736EFEAD5ABD3B76FDF56D7DF7CF3CDBCF7DE7BD9679F7D76F81D00DB4A7809744FC24B00003A43370A2F014A91452A00000000809224BC04000000004A92F01200000068E1D65B6F4D7575754E39E5944C9A34292B57AE2C76494099EA55EC0200000080D23169D2A4FCF297BFCCE38F3F9EF7DE7B2FA79D765A56AC589169D3A615BB34A00C092F0100008024C9934F3E99EBAEBB2E575C7145060D1A94E1C387E74F7FFA5376DE79E76297069429D3C60100008024C90F7EF08324C9C8912393247DFAF4C91E7BEC9109132614B32CA08CF5686C6C6C2C761100EDAE478FE6637FE60000E8281BB63B8BA91DDABC0D0D0DE9D7AF5FEAEBEBF3FAEBAFA77FFFFE59BB766D56AF5E9D5D77DDB51D8A04D876465E0200000059B26449EAEBEBB3DF7EFBA57FFFFE49929E3D7B0A2E81A2125E0200000079F2C9279324871F7E78912B016826BC04000000B260C18224C9B061C38A5C094033BB8D03000040999A3F7F7E962D5B962479E491479224AFBDF65AA64F9F9E24193A7468468C1851ACF200849700000050AE1E7BECB13CFBECB3696C6CCC33CF3C932459B56A55E6CC999324A9A8A8105E024565B771A07BB2DB3800009DA19BEC365E535393214386A45FBF7E79F3CD37DBA928801D67CD4B00000028734F3DF554928EDDAC67F5EAD5993469521A1A1A3AEC1D40F723BC0400008032B770E1C2241D1B5E7EFBDBDFCE75D75D97FAFAFA0E7B07D0FD082F010000A0CC75F4C8CB993367E6A73FFD69873C1BE8DE849700000050E63A32BCACADADCD0D37DC90BFFBBBBF6BF76703DD9FF012000000CAD8EBAFBF9EE5CB97A777EFDE193A7468BB3EBBB1B13113264CC80F7FF8C3F4E9D3A75D9F0D94875EC52E00000000289EA65197871E7A689B03C69A9A9ADC77DF7D79F9E59773F0C107E7D8638FCDFEFBEFDFEABEA953A7E694534EC981071ED8AE3503E5C3C84B0000002863DBB259CFEAD5AB73D9659765CC9831D97BEFBD3371E2C41C76D86139E59453B264C99216F73EF5D45359B264493EFFF9CF7748DD407930F212000000CA585BD7BB5CB972658E3EFAE8F4E9D327B367CFCEFBDEF7BE24C96DB7DD96458B1665E1C285F9F0873FBCFEDEEF7EF7BBB9FDF6DB3BB678A0DB135E02000040196B6B783971E2C42C5EBC384B962C591F5C26C9B061C372FEF9E767DCB871EBAF7DEB5BDFCA15575C913DF6D8A3638A06CA86F012000000CAD4AA55ABF2ECB3CFA667CF9E193162C466EF9B376F5E6EBEF9E68C1D3B36071F7C708BCF8E3FFEF81C7FFCF1EBCFEFBCF3CE0C1A3428471C714487D50D940FE12500000094A9458B1665EDDAB5193E7C7876DF7DF7CDDE3763C68C24C9983163B6F8BC37DE7823DFFDEE7773F9E597E7D7BFFE758BCF9E7FFEF9248570B3A2A222555555EDBEBB39D0FD082F010000A04C354D191F356AD416EF7BF5D557936C7D6A798F1E3DF2D5AF7E35757575AD3EABA9A959FFAC5D76D9C50EE4409B082F010000A04C2D58B02049327AF4E82DDE77C821872449FAF6EDBBC9CFEBEAEA3267CE9C8C1B372E13274EDCE43DBFFAD5AFF2C20B2FE4C20B2FCC9E7BEEB9035503E564A762170000000074BC868686DC72CB2DB9FAEAABD75F9B3D7B760E3CF0C01C7DF4D15BFCEE79E79D97F7BFFFFD79E081075A7DF6C4134F64CC9831D977DF7DB7F88CA6D19B4DFF03B485919700000050066EBCF1C65C7CF1C54992CF7EF6B3D965975DB274E9D2DC78E38DE9D1A3C716BFDBBF7FFF3CFCF0C339FFFCF353535393AAAAAAD4D6D6E6E9A79FCE01071C90193366A4B2B2B2D5F76A6B6B73FAE9A7E79D77DEC95B6FBD95010306E4E4934FCE3EFBEC936F7DEB5BF9CC673ED321BF15E83E8497000000B0BD2A2B93DADAE2D7D006AFBCF24A92C2EEE0071D74502EB9E4921C7FFCF1B9E0820BDAF4FD0F7FF8C379ECB1C7B262C58ABCF4D24BD96FBFFDB63AFDBBB2B23273E6CC69D3F30136A54763636363B18B0068771BF61CFB3307004047A9AB4BAAAA8A17605656268B162503066CF5D6E79E7B2EA79F7E7ABEF8C52FE6A5975ECAECD9B373D75D7765E0C0819D5028C0F6115E02DD93F0120080AEA093DBADAB56ADCAA38F3E9A8A8A8A1C79E491E9DDBB7787BF136047082F81EE497809004057A0DD0AB045761B07000000004A92F012000000002849C24B00000000A024092F01000000809224BC04000000004A92F012000000002849C24B00000000A024092F01000000809224BC04000000004A92F012000000002849C24B00000000A024092F01000000809224BC04000000004A92F012000000002849C24B00000000A024092F01000000809224BC04000000004A92F012000000002849C24B00000000A024092F01000000809224BC04000000004A92F012000000002849C24B00000000A024092F2E51437F0000170C4944415401000000809224BC04000000004A92F012000000002849C24B00000000A024092F01000000809224BC04000000004A92F0120000000028493D1A1B1B1B8B5D04C076A9AF4F162E4C9E7A2A79ECB1E4E18793DADACDDF5F59991C775C72D451C9F0E1C9E1872715159D572F0000E5A9A6A6D05E9D3F3FA9AB4B6EBF7DCBF757572703062463C624871D960C1D9AF4EAD529A502941AE125D0B5D4D52537DE98DC7967B268D18E3FAFAA2A39EDB4E40B5F48060FDEF1E7010040434321A8BCE38EE4FAEBDBE799D5D5C937BE911C738C0E78A0AC082F81D2D7D05068F85D7B6DFB04969B5355954C9A949C71869E6D0000B65D7D7D32654A72E5951DFB9E8B2F2E04993ADF813220BC044A57536879E9A55B9E0E5E55951C7B6C72C411C9FEFB27030716AEAF5C99ECBA6BE1F8EDB793C58B0B3DE04F3F9DCC9AB5F9E75556161A9D424C0000DAA2A626F9CE77B63E1D7CFCF8C21246FDFB17FE6FB261BBF5E9A793152B927BEFDDFAB248E3C727975D56985A0ED04D092F81D234776EF2B5AF6D7EA4E5E4C9C909276CFFBA950D0DC933CF2477DFBDF99EF1CACAE437BF49468EDCF6E70300D0FD353424D75CB3F9F6645555F295AF14D6AEDCDE51927575C91FFF984C9DBAF90EF8F1E3939B6E329D1CE89684974069696828AC3FB9A95EEBAAAAE4861B0A232CDB734464D39A449B0B4B35060100D8D8E2C5C9A8519B1E1939797272E185854D77DA537D7DF2F39F27FFF44F9B7EEFF4E9C95967B5EF3B018A4C7809948E9A9AE4139F68DD10ABAE4EAEBAAA734640D6D4147AC737EED5AEAC4CFEEBBF4CC9010028775B1A6D39797261C9A38EEEF4DED2F24AE3C727B7DE6AF923A0DB105E02A561E6CC64F4E896D72A2B935B6E494E3EB938F57CF9CBAD1B833FFA5172D1459D5F0F0000C5D7D0909C7452EB8EEEF1E3931FFEB0FD475A6E4D7D7D61ADCD8D7734AFAC2CCC28EAEC7A003A80F01228BEEF7DAF75CF7529F4186F6E0AFBE4C9C9155714A72600008AA3AEAE302368E36586EEBBAF389DED1BDAD414760126D04D082F81E2DA5470596A6BF5DC765BF2B9CFB5BC26C00400281F757585F5D7370C07ABAA0A23304B251CACAF4F3EF399D6A342172DB2F411D0A5092F81E2D9547039674E69EEEE3D776E72FAE92D1BAC024C0080EEAFA1211934A8653BB0BA3AB9FFFED25B577253EB711A81097471C24BA038E6CE4D8E3EBAF9BCB23299372F193CB868256DD5A67ADC4B6D94280000ED67536B5C966A70B9A18D07090830812E4C780974BE9A9A64C89096D7BACA74964D05985DA5760000B6CDC4892D37C3E90AC165938D03CCEAEAE4A1878A570FC076125E029D6B53D36E4A75AAF8E66C6AD4E84B2F758D462C00006D337366327A74F379570A2E9B9C7556CBCD277FF4A3E4A28B8A570FC076D8A9D8050065E6D24B5B06973FFA51D70A2E9342BDD3A7379FD7D61676250700A07BA8AF4FBEFCE5E6F3CACAC2268E5D29B84C925B6F2DCC1A6A326142611614401762E425D079369E2EDED5A7AE6CDC936DFA380040F7B0713BAFABCD14DA505D5DB2F7DECDE75555C99FFE54BC7A00B691919740E739F5D496E7BFFD6D71EA682F37DD54E8856F72F6D98569F10000745D8B17B70C2E2FBEB8EB06974961939E0D670D2D5A5418450AD045082F81CE31776EA1A1D464FAF4A4A2A278F5B4878A8A64CA94E6F3458B923BEE285E3D0000ECB8B3CF6E3EAEAC4CAEB9A678B5B497B3CE6A397DFCD24B75BA035D86F012E81C5FFB5AF371555572C619C5ABA53D6DDC10BCF6DAE2D50200C08ED9B8C37DCA94AEDFE1DEE497BF6C3EAEADD5E90E7419C24BA0E36DDC08BCE186AEB7D8F996DC7043F3F1A24585DF0B0040D7F3EFFFDE7C5C59D97D3ADC93C2DAECD5D5CDE7465F025D84F012E8781B3702BBF29A419B327264CBD197575D55B4520000D84E75752DD7BA9C32A57B75B8272DDBA9B5B5C9FCF9452B05A0AD849740C7AAAF6FDD08EC8EFEF99F9B8F67CD2AFC6E0000BA8E5FFFBAE579771A75D964E34E7753C7812E40780974AC471F6D79BEF18EE3DDC531C7B43CFFF9CF8B53070000DBE7A69B9A8F2FBEB8FB8DBA6CF295AF341F5F7FBD4E77A0E4092F818EB5E1C2E0D5D5DD67C1F38D5554141AB94D66CC285E2D00006C9BBABA966BB477C751974DCE39A7E5F9C285C5A903A08D849740C7DA70CAF8C60DA5EEE6C4139B8F67CDB2003A004057F1C73FB63C3FE288E2D4D1192A2A5A4E1DFFFDEF8B570B401B082F818E5353D3F2FCA8A38A5246A7F9D8C75A9E3FF34C71EA000060DB3CF860F3717575F79D32DEE4B4D39A8FEFBCB3787500B481F012E8388F3DD6F27CF0E0A294D169060C28ECA6DE64F1E2E2D5020040DB3DF248F371775DA37D43279CD07CBCE17479801224BC043ACE1B6F341F8F1F5FBC3A3AD371C7351FCF9F5FBC3A000068BB0D03BCE1C38B5747671938B0E5F9C633A6004A88F012E8381B8EBC1C30A0787574A60DA7C6D7D515AF0E0000DA66E3E06EE360AF3BDA7846D4CB2F17A50C80B6105E029DA33B2F7ABEA1FEFD9B8F37DCAC080080AEA1BB2F75D464C34D7B5E78A17875006C85F012E838E518DEF5EB57EC0A000060EB0E3DB4D81500B489F012E81CE512EA7DE843C5AE0000806DF1F4D3C5AE00802D105E029D43A8070040295AB1A2D81500B005C24BA0736CB8790F0000948AFDF72F7605006C81F012E8389595C5AEA0F309690100BA9672D85D1CA00B135E021DE7B8E38A5D41719563780B00D0D5353414BB82CEF1F0C3C5AE00A04D849740E7B8F7DE6257D039962D6B3E2EF7F01600A02BA8A86879BE7C7971EAE84C0D0D496D6DF3F9618715AF1680AD105E021D67CC98E6E3BABAE2D5D199962E6D3E3EE490E2D5010040DB0C18D0F2BC1C761FDF38A03563082861C24BA0E3F4EBD77C3C6B56794CC1B9FDF6E6E30F7EB078750000D076D5D5CDC74F3C51BC3A3ACBC601EDC6012E4009115E021DE7631F6B79FECC33C5A9A3B3D4D4B43C3FEAA8A2940100C036FAE4279B8FEFBCB378757496071F6C3EDE30B8052841C24BA0E30C18D0720ACAA38F16AF96CEB0F14EE3830717A50C0000B6D10927341F2F5A94D4D717AF96CE70C71DCDC7A79E5ABC3A00DA40780974AC33CE683EBEE9A6E2D5D1197EFEF3E6E3F1E38B57070000DBE6F0C35B9E77E74EF79A9A969BF51C734CD14A01680BE125D0B1360C2F172DEABE1BF7D4D515D6F56C72F6D9C5AB0500806D5351D172FAF4D4A9C5ABA5A3DD7A6BF3716565327468F16A016803E125D0B18E38A2E5F98D3716A78E8EF6EB5FB73C1F35AA38750000B07DBEF18DE6E359B3BAE7D4F1868696EDF10B2F4C7AF52A5E3D006D20BC043A56AF5EC9E4C9CDE7575ED9FD761D6F6848FEE99F9ACF2FBE58231000A0ABD978FAF49429C5A9A323DD7147CB29E3E3C615AF168036125E021DEF0B5F6879BEE102E1DDC1C68DC00D7BED0100E81A2A2A5A77BA77B7D197D75EDB7C5C55951C7658F16A016823E125D0F1060F6EB981CDA597769F86604343E1F734A9AAB2CB38004057B571A77B771A7D397366610DFA2637DC50BC5A00B681F012E81CD75CD37C5C5B9B7CE73BC5ABA53D5D734DCB51971A8100005DD7C69DEE575E59D89DBBAB6B6848BEFCE5E6F3AAAA64E4C8E2D503B00D7A3436363616BB08A04C9C755672FBEDCDE7CF3FDFB54729D6D4244386349F8F1F9FDC765BD1CA0100A01DD4D5257BEFDD7C5E5D9D3CF450F1EA690F132726D75FDF7CBE689129E3409721BC043A4F7D7DB2DB6ECDE79595C94B2F75CDCD6D1A1A928F7CA4E5D49B575F4D060C285E4D0000B48F1FFF389930A1F9FC473F4A2EBAA878F5EC88B97393A38F6E3ED7E10E7431A68D039DA7A222993EBDF9BCB6B6F5BA425DC5A597B60C2E7FF423C125004077F1D5AF163ADA9B4C98902C5E5CBC7AB6575D5D72FAE9CDE79595C94D3715AF1E80ED20BC043AD7596715A6DE34B9FDF6E47BDF2B5E3DDBE3C73F6E39EDA6BABAEBF6C40300D05AAF5EC9BC792DAF8D1A550803BB8A8686423B75C3F5D96FB9A530A000A00B316D1CE87CF5F5C9073FD8B22175DF7DC9C92717AFA6B6DA78DA4D65656104A651970000DDCF6DB7259FFB5CF3795769FB353424279D94CC9AD57CEDE28B931FFEB07835016C27232F81CE5751D172CA75928C1E5DFA6BEF6C1C5C26C96F7E53FA8D570000B6CF5967259327379FD7D61676EA2EE511989B0A2EABAB9329538A5713C00E105E02C531604032674ECB6B9FFB5CE94E21FFDEF75A079773E624234716A71E00003AC71557B45CF6A89403CCFAFA4D0797F7DFDF3537C9048869E340B16D6A34E3F8F1C9ADB7964603ABA1A1B039CF866B5C26824B008072B2A9D18C49692D7DB47871615DCE0D9766AAAA2AD46CA610D08519790914D7C891AD4760DE7E7B3268505253539492D6ABA929D421B80400286FBD7A15462F5E7C71CBEBA34727132716C2CD626968286C285955D532B8ACAE4E9E7C5270097479C24BA0F8468E4C5E7DB5B0007A93DADA64C8904263B0BEBE73EBA9AF2FBC77C890960DC0A605DA05970000E5A757AFC286371BAE8199143ABA070D4A66CEECFC9A162F4E3EF29164C28496D7C78F37551CE8368497406918302059B6ACD0D0DAD0F5D7177626FFDEF73A3EC4ACAF2F6C1AF4C10FB61E6D595D5DA8EFB0C33AB60600004ADB15571466E26CDCF13E7A74326C586159A48E565353D84CA8AAAAF54698D3A717DAB4824BA09BB0E625507A6EBBADB079CFA64C9E9C8C1BD7BE21624D4D618DCD2BAFDCF4E7D3A7171A870000D0A4AEAE305BE7F6DB5B7F565595FCF33F27C71C935454B4CFFB1A1A92F9F393ABAE6ABDF666D33B67CC48060F6E9FF7019408E125509AEAEB93AF7C65D38DC1A4D0383BEDB4E4841392C30FDFB646614343F2CC33C9A38F2637DDD4BAB7BAC9F8F185CFDBABC1090040F733776E72FAE92D971BDA50757572CE39C951476D7BB0585797FCF18FC9830FB69E19D4A4B232993245673BD06D092F81D25653937CE73B9B0F319B545626C71D576814F6EFDFFAF337DE481E7B2C79F8E1CD372C9B8C1F9F5C738D5E6B0000DAA6A121B9E38EE4D24BB7DED6ACAE2E2C993466CCA63F9F3FBF105AB6A5FD3B654A72EAA93ADB816E4D7809740D4D53BB6FBC71EB0DC2ED5159995C7861F2852F082D0100D87E73E76E7E6A777B689A923E6A94752D81B220BC04BA9EB97393DFFF3EB9F3CECD4FF96E8B0DA79E1F7184C61F0000EDA7BEBEB04CD12F7FB9F551945B535D5D186179E69985519B0065447809746DF5F5C973CF258B17374FB1490AFFCF9AD53C2D2729FC7FC41185CD7E0E38C0F41A00003A4F4D4DF2F4D3C98A15C9BDF7365F6F5AD668FCF8E66B4D4B211D7554B2EFBE3AD981B226BC04000000004AD24EC52E000000000060538497000000004049125E020000000025497809000000009424E1250000000050927A15BB00806DB160C182DC7AEBAD79F9E59753555595AF7FFDEBE9DFBF7F9264D6AC59B9E38E3BB26AD5AA8C1A352A679F7D767AF4E851E48A010028378D8D8D99316346EEBBEFBEBCFDF6DBA9AEAECE39E79C939E3D7B66DDBA75F9F9CF7F9E871F7E38BBEDB65BCE3AEBAC7CEA539F2A76C900254B78097419D3A64DCBBC79F3F29DEF7C27FBEEBB6FBEF9CD6FE6A31FFD68FEF0873FE4965B6EC92BAFBC927FF8877FC85B6FBD9551A346E5CF7FFE73AEBEFAEA62970D00401959BB766DBEF6B5AF65BFFDF6CB35D75C93B56BD7E6D4534FCD3DF7DC93BBEEBA2B679E7966468D1A951FFFF8C7B9FFFEFB336AD4A8DC73CF3D19356A54B14B0728493D1A1B1B1B8B5D04C0D6FCEC673FCB92254BF2AFFFFAAFEBAFD5D4D464C8902139F6D863D3BF7FFFDC79E79D4992E1C38767E1C28539FAE8A3337BF6EC62950C0040193AF7DC733376ECD88C1B376EFDB5FFF88FFFC839E79C93E38E3B2EA79E7A6A264E9C98BABABA0C1C38306BD6ACC977BFFBDDFCE33FFE6311AB06285D465E0225AFAEAE2E3FFDE94FF3D8638FB5B8BEDB6EBB25491E79E4913CF9E493EBAF37363666B7DD76CBF9E79FDFA975020050DE66CD9A959E3D7BB6082E93E676EBE2C58B73FFFDF7274956AE5C995D76D925FBECB34FCE38E38C4EAF15A0AB105E0225EF673FFB59CE3BEFBCECB453CB3DC6962E5D9A2419346850468C18B1FEFA82050BF2EEBBEF66D75D776DD3F37FF8C31FE6A4934ECA41071DD47E4503005076A64E9D9AA953A7B6BADED46E3DF9E493D3B76FDF24C9FEFBEF9FDADADAF4E9D3273D7BF6DCEAB39F7BEEB9DC7DF7DDB9F4D24BDBB768801227BC044ADE49279D94430F3DB4D5F5F9F3E727498E3BEEB816D777DA69A736079777DF7D772EB9E4920C1E3C58780900C00EB9FAEAAB37D9A66C6AB71E7BECB12DAEEFB2CB2E6D7AEE9A356B72E69967A6A1A1417809949D9DB67E0B40715555556DB237FAD1471F4D921C73CC31DBF5DCE5CB97E7EB5FFFFA0ED50600004D860F1FDEEADABA75EB3267CE9C24DBDF6EBDFCF2CBB368D1A21DAA0DA0AB125E025DD2BA75EBD66FC6B33D8DC075EBD665C28409B9E0820BDABB340000586FE1C28559B16245F6DD77DF1C70C001DBFCFD59B36665CD9A35F9C0073ED001D501943EE125D0253DF9E49359B16245060E1C98030F3C709BBFFFFDEF7F3FE3C78FCFE0C183DBBF380000F8FF7EFFFBDF27D9BE0EF7D75E7B2D53A74ECD35D75CD3DE65017419C24BA04B9A356B56924D3702D7AE5DBBC506DEFCF9F3F3E28B2FDAD51100800EB7A576EB8B2FBE985FFCE2179BFDEE8409133265CA94F59BFC009423E12550F2EEBAEBAEDC76DB6D2DAE3DF8E0834992912347B6BAFFCE3BEFCCEBAFBFBEC967BDFDF6DB993C7972A64C99D2FE85020050B6DE7DF7DDFCE4273FC9DCB973D75F5BB972E5FAF52E37D56EFDFEF7BF9FFEFDFB6FF27937DC70434E38E1841C72C8211D5330401761B771A0A43DF0C00339EDB4D39224471E79640E38E080BCF8E28BEBD7BB1C3870608BFBD7AC599369D3A6E557BFFAD5269FF78D6F7C23575F7D752A2A2A3AB6700000CACA55575D956BAFBD3683060DCA8B2FBE98A4D009BF72E5CA24ADDBADCB972FCFB265CB3276ECD856CFFA9FFFF99F3CFEF8E3B9F5D65B3BBE70801267E42550D2E6CD9B972419316244060F1E9C75EBD6E51BDFF846A64E9D9A9D76DA294F3CF1C4FA7BD7AE5D9B0B2EB820175D7451060C18D0EA59B7DD765B3EF4A10F65C488119D563F0000E5A1A9DDDAD4F1FEE69B6FE6DFFFFDDF73F9E59727498B76EBEBAFBF9EF3CE3B2F3FFEF18F5B3DE7DD77DFCDA4499372FDF5D77742D500A5CFC84BA0A47DE94B5FCAAF7EF5AB8C1E3D3A37DF7C73EEB9E79E7CEE739FCBF8F1E3B3FBEEBBE7F2CB2FCF9E7BEE995EBD7A65C68C19993469523EFDE94FB77ACEF3CF3F9F1933666C7644260000EC886F7FFBDB79E5955772C0010764EAD4A9993973667EF2939FA4AAAA2AAFBFFE7A2EB9E4925C74D14579E595573267CE9CDC7CF3CD19326448ABE7FCFDDFFF7D264D9A947EFDFA15E15700949E1E8D8D8D8DC52E02604B1A1A1A326FDEBCAC5CB932471E7964F6DC73CFF59FBDF1C61B79E28927D2BB77EF1C79E491D965975D36F98CE38F3F3EA79E7A6A2A2B2B5B5C7FF4D14773E38D37E6D24B2FCDC73EF6B15456566ED74E900000F0D65B6F65DEBC79D96DB7DDF2B18F7D2C7DFAF459FF594D4D4D962C59927DF6D9271FFDE847D3A3478F56DF7FE4914772D55557E5C20B2F6CF5D9840913B2EBAEBBE6DA6BAF4D9254575767AFBDF6EAB81F0350228CBC044A5EAF5EBDF2C94F7E72939FF5EFDF3FA3468DDAEA33C68F1F9F952B57A6B6B6B6C5F5679F7D3649B262C58AD4D6D6DAC9110080EDB6C71E7BE4C4134FDCE46783070FCEE0C183B7F8FDBDF6DA2BE3C68D6BD5665DB3664DEAEAEA3270E0C0F59FAD59B3A65D6A062875465E0265EDB2CB2ECBF7BFFFFDFCF6B7BFCDA9A79E5AEC720000A095D5AB5767E79D77CEE1871F9EA79E7AAAD8E500742A1BF60065EDD5575F6DF13F0000949AA6B66A5D5D5D912B01E87C465E0265E9B39FFD6C962F5F9EFFFDDFFF4D8F1E3DD2AB57AF0C193224279C7042264F9E5CECF20000203367CECC35D75C93575F7D352B56AC486363633EF0810F64F7DD77CFF4E9D3B3FFFEFB17BB44800E27BC04000000004A9269E3000000004049125E020000000025497809000000009424E1250000000050928497000000004049125E020000000025497809000000009424E1250000000050928497000000004049125E020000000025497809000000009424E125000000005092FE1F2D60B0583B81E8EE0000000049454E44AE426082>|png>|0.5par|||>>
      \ On the left is a simple factor graph from Figure 8.51 and reproduced
      here for convenience. On

      the right is the corresponding factorized approximation.
    </small-figure>
  </padded-center>

  Now we apply the EP algorithm using the fully factorized approximation.
  Suppose that we have initialized all of the factors and that we choose to
  rene factor <math|<wide|f|~><rsub|b><around*|(|x<rsub|2>,x<rsub|3>|)>=<wide|f|~><rsub|b2><around*|(|x<rsub|2>|)><wide|f|~><rsub|b3><around*|(|x<rsub|3>|)>>.
  We first remove this factor from the approximating distribution to give

  <\equation*>
    q<rsup|\\b><around*|(|\<b-x\>|)>=<wide|f|~><rsub|a1><around*|(|x<rsub|1>|)><wide|f|~><rsub|a2><around*|(|x<rsub|2>|)><wide|f|~><rsub|c2><around*|(|x<rsub|2>|)><wide|f<rsub|c4>|~><around*|(|x<rsub|4>|)>
  </equation*>

  and we then multiply this by the exact factor
  <math|f<rsub|b>(x<rsub|2>,x<rsub|3>)> to give

  <\equation*>
    <wide|p|^><around*|(|\<b-x\>|)>=q<rsup|\\b><around*|(|\<b-x\>|)>f<rsub|b><around*|(|x<rsub|2>,x<rsub|3>|)>=<wide|f|~><rsub|a1><around*|(|x<rsub|1>|)><wide|f|~><rsub|a2><around*|(|x<rsub|2>|)><wide|f|~><rsub|c2><around*|(|x<rsub|2>|)><wide|f<rsub|c4>|~><around*|(|x<rsub|4>|)>f<rsub|b><around*|(|x<rsub|2>,x<rsub|3>|)>
  </equation*>

  We now find <math|q<rsup|new>(\<b-x\>)> by minimizing the Kullback-Leibler
  divergence <math|KL(<wide|p|^><mid|\|\|>q<rsup|new>)>. The result, as noted
  above, is that <math|q<rsup|new>(z)> comprises the product of factors, one
  for each variable <math|x<rsub|i>>, in which each factor is given by the
  corresponding marginal of <math|<wide|p|^>(x)>. These four marginals are
  given by

  <\eqnarray*>
    <tformat|<table|<row|<cell|<wide|p|^><around*|(|x<rsub|1>|)>>|<cell|\<propto\>>|<cell|<wide|f|~><rsub|a1><around*|(|x<rsub|1>|)>>>|<row|<cell|<wide|p|^><around*|(|x<rsub|2>|)>>|<cell|\<propto\>>|<cell|<wide|f|~><rsub|a2><around*|(|x<rsub|2>|)><wide|f|~><rsub|c2><around*|(|x<rsub|2>|)><big|sum><rsub|x<rsub|3>>f<rsub|b><around*|(|x<rsub|2>,x<rsub|3>|)>>>|<row|<cell|<wide|p|^><around*|(|x<rsub|3>|)>>|<cell|\<propto\>>|<cell|<big|sum><rsub|x<rsub|2>><around*|{|f<rsub|b><around*|(|x<rsub|2>,x<rsub|3>|)><wide|f|~><rsub|a2><around*|(|x<rsub|2>|)><wide|f|~><rsub|c2><around*|(|x<rsub|2>|)>|}>>>|<row|<cell|<wide|p|^><around*|(|x<rsub|4>|)>>|<cell|\<propto\>>|<cell|<wide|f|~><rsub|c4><around*|(|x<rsub|4>|)>>>>>
  </eqnarray*>

  and <math|q<rsup|new>(\<b-x\>)> is obtained by multiplying these marginals
  together. We see that the only factors in <math|q(\<b-x\>)> that change
  when we update <math|<wide|f|~><rsub|b><around*|(|x<rsub|2>,x<rsub|3>|)>>
  are those that involve the variables in <math|f<rsub|b>> namely
  <math|x<rsub|2>> and <math|x<rsub|3>> . To obtain the refined factor
  <math|<wide|f|~><rsub|b><around*|(|x<rsub|2>,x<rsub|3>|)>=<wide|f|~><rsub|b2><around*|(|x<rsub|2>|)><wide|f|~><rsub|b3><around*|(|x<rsub|3>|)>>
  we simply divide <math|q<rsup|new>(\<b-x\>)> by
  <math|q<rsup|\\b>(\<b-x\>)>, which gives

  <\eqnarray*>
    <tformat|<table|<row|<cell|<wide|f|~><rsub|b2><around*|(|x<rsub|2>|)>>|<cell|\<propto\>>|<cell|<big|sum><rsub|x<rsub|3>>f<rsub|b><around*|(|x<rsub|2>,x<rsub|3>|)>>>|<row|<cell|<wide|f|~><rsub|b3><around*|(|x<rsub|3>|)>>|<cell|\<propto\>>|<cell|<big|sum><rsub|x<rsub|2>><around*|{|f<rsub|b><around*|(|x<rsub|2>,x<rsub|3>|)><wide|f|~><rsub|a2><around*|(|x<rsub|2>|)><wide|f|~><rsub|c2><around*|(|x<rsub|2>|)>|}><eq-number><label|10.235>>>>>
  </eqnarray*>

  These are precisely the messages obtained using belief propagation in which
  messages from variable nodes to factor nodes have been folded into the
  messages from factor nodes to variable nodes. \ In particular,
  <math|<wide|f|~><rsub|b2><around*|(|x<rsub|2>|)>> corresponds to the
  message <math|\<mu\><rsub|f<rsub|b>\<rightarrow\>x<rsub|2>><around*|(|x<rsub|2>|)>>
  sent by factor node <math|f<rsub|b>> to variable node <math|x<rsub|2>> and
  is given by (8.81). Similarly, if we substitute (8.78) into (8.79), we
  obtain Eq. <eqref|10.235> in which <math|<wide|f|~><rsub|a2><around*|(|x<rsub|2>|)>>
  corresponds to <math|\<mu\><rsub|f<rsub|a>\<rightarrow\>x<rsub|2>><around*|(|x<rsub|2>|)>>
  and <math|<wide|f|~><rsub|c2><around*|(|x<rsub|2>|)>> corresponds to
  <math|\<mu\><rsub|f<rsub|c>\<rightarrow\>x<rsub|2>><around*|(|x<rsub|2>|)>>,
  giving the message \ <math|<wide|f|~><rsub|b3><around*|(|x<rsub|3>|)>>
  which corresponds to <math|\<mu\><rsub|f<rsub|b>\<rightarrow\>x<rsub|3>><around*|(|x<rsub|3>|)>>.

  This result differs slightly from standard belief propagation in that
  messages are passed in both directions at the same time. We can easily
  modify the EP procedure to give the standard form of the sum-product
  algorithm by updating just one of the factors at a time, for instance if we
  refine only <math|<wide|f|~><rsub|b3><around*|(|x<rsub|3>|)>>, then
  <math|<wide|f|~><rsub|b2><around*|(|x<rsub|2>|)>> is unchanged by
  definition, while the refined version of
  <math|<wide|f|~><rsub|b3><around*|(|x<rsub|3>|)>> is again given by Eq.
  <eqref|10.235>. If we are refining only one term at a time, then we can
  choose the order in which the refinements are done as we wish. In
  particular, for a tree-structured graph we can follow a two-pass update
  scheme, corresponding to the standard belief propagation schedule, which
  will result in exact inference of the variable and factor marginals. The
  initialization of the approximation factors in this case is unimportant.

  Now let us consider a general factor graph corresponding to the
  distribution

  <\equation*>
    p<around*|(|\<b-theta\>|)>=<big|prod><rsub|i>f<rsub|i><around*|(|\<b-theta\><rsub|i>|)>
  </equation*>

  where <math|\<b-theta\><rsub|i>> represents the subset of variables
  associated with factor <math|f<rsub|i>>. We approximate this using a fully
  factorized distribution of the form

  <\equation*>
    q<around*|(|\<b-theta\>|)>\<propto\><big|prod><rsub|i><big|prod><rsub|k><wide|f|~><rsub|i
    k><around*|(|\<theta\><rsub|k>|)>
  </equation*>

  where <math|\<theta\><rsub|k>> corresponds to an individual variable node.
  Suppose that we wish to refine the particular term <math|<wide|f|~><rsub|j
  l><around*|(|\<theta\><rsub|l>|)>> keeping all other terms fixed. We first
  remove the term <math|<wide|f|~><rsub|j><around*|(|\<b-theta\><rsub|j>|)>>
  from <math|q<around*|(|\<b-theta\>|)>> to give

  <\equation*>
    q<rsup|\\j><around*|(|\<b-theta\>|)>\<propto\><big|prod><rsub|i\<neq\>j><big|prod><rsub|k><wide|f|~><rsub|i
    k><around*|(|\<theta\><rsub|k>|)>
  </equation*>

  and then multiply by the exact factor <math|f<rsub|j><around*|(|\<b-theta\><rsub|j>|)>>.
  To determine the refined term <math|<wide|f|~><rsub|j
  l><around*|(|\<theta\><rsub|l>|)>>, we need only consider the functional
  dependence on <math|\<theta\><rsub|l>>, and so we simply find the
  corresponding marginal of

  <\equation*>
    q<rsup|\\j><around*|(|\<b-theta\>|)>f<rsub|j><around*|(|\<b-theta\><rsub|j>|)>
  </equation*>

  Up to a multiplicative constant, this involves taking the marginal of
  <math|f<rsub|j><around*|(|\<b-theta\><rsub|j>|)>> multiplied by any terms
  from <math|q<rsup|\\j>(\<b-theta\>)> that are functions of any of the
  variables in <math|\<b-theta\><rsub|j>>. Terms that correspond to other
  factors <math|<wide|f|~><rsub|i><around*|(|\<b-theta\><rsub|i>|)>> for
  <math|i\<neq\>j> will cancel between numerator and denominator when we
  subsequently divide by <math|q<rsup|\\j><around*|(|\<b-theta\>|)>>. We
  therefore obtain

  <\equation>
    <wide|f|~><rsub|j l><around*|(|\<theta\><rsub|l>|)>\<propto\><big|sum><rsub|\<theta\><rsub|m\<neq\>l>\<in\>\<b-theta\><rsub|j>>f<rsub|j><around*|(|\<b-theta\><rsub|j>|)><big|prod><rsub|k><big|prod><rsub|m\<neq\>l><wide|f|~><rsub|k
    m><around*|(|\<theta\><rsub|m>|)><label|10.240>
  </equation>

  We recognize this as the sum-product rule in the form in which messages
  from variable nodes to factor nodes have been eliminated, as illustrated by
  the example shown in Figure 8.50. The quantity <math|<wide|f|~><rsub|j
  m><around*|(|\<theta\><rsub|m>|)>> corresponds to the message
  <math|\<mu\><rsub|f<rsub|j>\<rightarrow\>\<theta\><rsub|m>><around*|(|\<theta\><rsub|m>|)>>,
  which factor node <math|j> sends to variable node <math|m>, and the product
  over <math|k> in Eq. <eqref|10.240> is over all factors that depend on the
  variables <math|\<theta\><rsub|m>> that have variables (other than variable
  <math|\<theta\><rsub|m>>) in common with factor
  <math|f<rsub|j><around*|(|\<b-theta\><rsub|j>|)>>. In other words, to
  compute the outgoing message from a factor node, we take the product of all
  the incoming messages from other factor nodes, multiply by the local
  factor, and then marginalize.

  Thus, the sum-product algorithm arises as a special case of expectation
  propagation if we use an approximating distribution that is fully
  factorized. This suggests that more flexible approximating distributions,
  corresponding to partially disconnected graphs, could be used to achieve
  higher accuracy. Another generalization is to group factors
  <math|f<rsub|i><around*|(|\<b-theta\><rsub|i>|)>> together into sets and to
  refine all the factors in a set together at each iteration. Both of these
  approaches can lead to improvements in accuracy (Minka, 2001b). In general,
  the problem of choosing the best combination of grouping and disconnection
  is an open research issue.

  We have seen that variational message passing and expectation propagation
  optimize two different forms of the Kullback-Leibler divergence. Minka
  (2005) has shown that a broad range of message passing algorithms can be
  derived from a common framework involving minimization of members of the
  alpha family of divergences, given by (10.19). These include variational
  message passing, loopy belief propagation, and expectation propagation, as
  well as a range of other algorithms, which we do not have space to discuss
  here, such as <em|tree-reweighted message> passing (Wainwright et al.,
  2005), <em|fractional belief propagation> (Wiegerinck and Heskes, 2003),
  and power EP (Minka, 2004).
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
    <associate|10.150|<tuple|14|13>>
    <associate|10.151|<tuple|15|14>>
    <associate|10.152|<tuple|15|14>>
    <associate|10.153|<tuple|17|14>>
    <associate|10.156|<tuple|18|14>>
    <associate|10.157|<tuple|18|14>>
    <associate|10.158|<tuple|19|14>>
    <associate|10.159|<tuple|21|15>>
    <associate|10.160|<tuple|22|15>>
    <associate|10.163|<tuple|23|15>>
    <associate|10.165|<tuple|24|16>>
    <associate|10.166|<tuple|25|16>>
    <associate|10.187|<tuple|26|18>>
    <associate|10.188|<tuple|27|18>>
    <associate|10.189|<tuple|28|19>>
    <associate|10.190|<tuple|29|19>>
    <associate|10.191|<tuple|30|19>>
    <associate|10.193|<tuple|31|19>>
    <associate|10.195|<tuple|32|20>>
    <associate|10.196|<tuple|33|20>>
    <associate|10.197|<tuple|34|20>>
    <associate|10.199|<tuple|35|20>>
    <associate|10.2.5|<tuple|3|3>>
    <associate|10.205|<tuple|36|21>>
    <associate|10.206|<tuple|37|21>>
    <associate|10.207|<tuple|38|21>>
    <associate|10.208|<tuple|39|21>>
    <associate|10.235|<tuple|40|?>>
    <associate|10.240|<tuple|41|?>>
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
    <associate|auto-19|<tuple|4.2|15>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-20|<tuple|7|16>>
    <associate|auto-21|<tuple|4.3|16>>
    <associate|auto-22|<tuple|5|18>>
    <associate|auto-23|<tuple|8|20>>
    <associate|auto-24|<tuple|5.1|22>>
    <associate|auto-25|<tuple|9|23>>
    <associate|auto-26|<tuple|10|24>>
    <associate|auto-27|<tuple|11|24>>
    <associate|auto-28|<tuple|5.2|?>>
    <associate|auto-29|<tuple|12|?>>
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
    <associate|fig10.14|<tuple|8|20>>
    <associate|fig10.15|<tuple|9|?>>
    <associate|fig10.16|<tuple|10|?>>
    <associate|fig10.17|<tuple|11|?>>
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

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7>|>
        \ Illustration of the Bayesian approach to logistic regression for a
        simple linearly separable data set. The plot on the left shows the
        predictive distribution obtained using variational inference. We see
        that the decision boundary lies roughly mid way between the clusters
        of data points, and that the contours of the predictive distribution
        splay out away from the data re\]ecting the greater uncertainty in
        the classication of such regions. The plot on the right shows the
        decision boundaries corresponding to ve samples of the parameter
        vector <with|mode|<quote|math>|\<b-w\>> drawn from the posterior
        distribution <with|mode|<quote|math>|p(\<b-w\>\|t)>.
      </surround>|<pageref|auto-20>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8>|>
        \ Illustration of the expectation propagation approximation using a
        Gaussian distribution for the example considered earlier in Figures
        4.14 and 10.1. The left-hand plot shows the original distribution
        (yellow) along with the Laplace (red), global variational (green),
        and EP (blue) approximations, and the right-hand plot shows the
        corresponding negative logarithms of the distributions. Note that the
        EP distribution is broader than that obtained by variational
        inference, as a consequence of the different form of KL divergence.
      </surround>|<pageref|auto-23>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9>|>
        Illustration of the clutter problem for a data space dimensionality
        of <with|mode|<quote|math>|D=1>. Training data points, denoted by the
        crosses, are drawnfrom a mixture of two Gaussians with components
        shown in red and green. The goal is to infer the mean of the green
        Gaussian from the observed data.
      </surround>|<pageref|auto-25>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|10>|>
        Examples of the approximation of specic factors for a
        one-dimensional version of the clutter problem, showing
        <with|mode|<quote|math>|f<rsub|n>(\<theta\>)> in blue,
        <with|mode|<quote|math>|<wide|f|~><rsub|n><around*|(|\<theta\>|)>> in
        red, and <with|mode|<quote|math>|q<rsup|\\n>(\<theta\>)> in green.
        Notice that the current form for <with|mode|<quote|math>|q<rsup|\\n>(\<theta\>)>
        controls the range of <with|mode|<quote|math>|\<theta\>> over which
        <with|mode|<quote|math>|<wide|f|~><rsub|n><around*|(|\<theta\>|)>>
        will be a good approximation to <with|mode|<quote|math>|f<rsub|n>(\<theta\>)>.
      </surround>|<pageref|auto-26>>
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

      <with|par-left|<quote|1tab>|4.3<space|2spc>Inference of hyperparameters
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>
      Expectation Propagation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Example: The clutter problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Expectation propagation on
      graphs <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>>
    </associate>
  </collection>
</auxiliary>