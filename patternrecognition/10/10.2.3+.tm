<TeXmacs|2.1.1>

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
    b<rsub|N>|]>-b<rsub|0><frac|a<rsub|N>|b<rsub|N>>-ln\<Gamma\><around*|(|a<rsub|N>|)>>>|<row|<cell|-\<bbb-E\><rsub|\<b-w\>><around*|[|ln
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
  marginal likelihood <math|p(\<b-t\>\|M)> for the model. If we assign equal
  prior probabilities <math|p(M)> to the different values of <math|M>, then
  we can interpret <math|\<cal-L\>> as an approximation to the posterior
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
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|10.2.5|<tuple|3|3>>
    <associate|10.90|<tuple|1|4>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|3|7>>
    <associate|auto-11|<tuple|2|7>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|1|2>>
    <associate|auto-4|<tuple|3|3>>
    <associate|auto-5|<tuple|1|4>>
    <associate|auto-6|<tuple|2|4>>
    <associate|auto-7|<tuple|1.1|4>>
    <associate|auto-8|<tuple|1.2|6>>
    <associate|auto-9|<tuple|1.3|6>>
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
    </associate>
  </collection>
</auxiliary>