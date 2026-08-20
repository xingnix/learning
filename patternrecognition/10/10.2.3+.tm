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

  Following Minka (2001b), we illustrate the EP algorithm using a simple
  example in which the goal is to infer the mean <math|\<b-theta\>> of a
  multivariate Gaussian distribution over a variable <math|\<b-x\>> given a
  set of observations drawn from that distribution. To make the problem more
  interesting, the observations are embedded in background clutter, which
  itself is also Gaussian distributed, as illustrated in Figure 10.15. The
  distribution of observed values <math|\<b-x\>> is therefore a mixture of
  Gaussians, which we take to be of the form

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
  one-dimensional parameter space <math|\<theta\>> are shown in Figure 10.16.
  Note that the factor approximations can have innite or even negative
  values for the `variance' parameter <math|v<rsub|n>> . This simply
  corresponds to approximations that curve upwards instead of downwards and
  are not necessarily problematic provided the overall approximate posterior
  <math|q(\<b-theta\>)> has positive variance. Figure 10.17 compares the
  performance of EP with variational Bayes (mean eld theory) and the Laplace
  approximation on the clutter problem.

  <\padded-center>
    <\small-figure|<image|image/fig_10_15_clutter.png|0.3par|||>>
      Illustration of the clutter problem for a data space dimensionality of
      <math|D=1>. Training data points, denoted by the crosses, are drawnfrom
      a mixture of two Gaussians with components shown in red and green. The
      goal is to infer the mean of the green Gaussian from the observed data.
    </small-figure>
  </padded-center>

  <\padded-center>
    <\small-figure|<image|image/fig_10_16_clutter_factor.png|.5par|||>>
      Examples of the approximation of specic factors for a one-dimensional
      version of the clutter problem, showing <math|f<rsub|n>(\<theta\>)> in
      blue, <math|<wide|f|~><rsub|n><around*|(|\<theta\>|)>> in red, and
      <math|q<rsup|\\n>(\<theta\>)> in green. Notice that the current form
      for <math|q<rsup|\\n>(\<theta\>)> controls the range of
      <math|\<theta\>> over which <math|<wide|f|~><rsub|n><around*|(|\<theta\>|)>>
      will be a good approximation to <math|f<rsub|n>(\<theta\>)>.
    </small-figure>
  </padded-center>

  <subsection|Expectation propagation on graphs>

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
    <associate|10.205|<tuple|36|?>>
    <associate|10.206|<tuple|37|?>>
    <associate|10.207|<tuple|38|?>>
    <associate|10.208|<tuple|39|?>>
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
    <associate|auto-25|<tuple|9|?>>
    <associate|auto-26|<tuple|10|?>>
    <associate|auto-27|<tuple|5.2|?>>
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
    </associate>
  </collection>
</auxiliary>