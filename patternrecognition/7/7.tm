<TeXmacs|2.1.1>

<style|<tuple|beamer|manila-paper>>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <doc-data|<\doc-title>
      Sparse Kernel Machines
    </doc-title>>

    \;
  </hidden>|<\hidden>
    \;

    <\itemize-dot>
      <item>Kernel-based algorithms that have <strong|sparse> solutions.
      Predictions for new inputs depend only on the kernel function evaluated
      at a subset of the training data points.

      <item><strong|Support vector machine> (SVM) became popular in some
      years ago for solving problems in classification, regression, and
      novelty detection.\ 

      <\itemize-dot>
        <item>An important property of support vector machines is that the
        determination of the model parameters corresponds to a <strong|convex
        optimization> problem, and so any local solution is also a global
        optimum.\ 

        <item>The discussion of support vector machines makes extensive use
        of <strong|Lagrange multipliers>.\ 

        <item>The SVM is a decision machine and so does not provide posterior
        probabilities.
      </itemize-dot>

      <item>An alternative sparse kernel technique, known as the
      <strong|relevance vector machine> (RVM), is based on a Bayesian
      formulation and provides posterior probabilistic outputs, as well as
      having typically much sparser solutions than the SVM.
    </itemize-dot>

    \;
  </hidden>|<\hidden>
    <tit|Maximum Margin Classifiers>

    Begin discussion of support vector machines by returning to the two-class
    classification problem using linear models of the form

    <\equation>
      y(x) = \<b-w\><rsup|T>\<b-varphi\>(x) + b<label|7.1>
    </equation>

    where <math|\<varphi\>(x)> denotes a fixed feature-space transformation,
    and we have made the bias parameter <math|b> explicit.\ 

    Note that we shall shortly introduce a dual representation expressed in
    terms of kernel functions, which avoids having to work explicitly in
    feature space.\ 

    The training data set comprises <math|N> input vectors
    <math|x<rsub|1>,\<cdots\>,x<rsub|N>> , with corresponding target valuest
    <math|1,\<cdots\>,t<rsub|N>> where <math|t<rsub|n>\<in\>{\<minus\>1,1}>,
    and new data points <math|x> are classified according to the sign of
    <math|y(x)>.
  </hidden>|<\hidden>
    \;

    <math|\<b-varphi\>(x)><image|img/7_1margin.png|1par|||>
  </hidden>|<\hidden>
    Recall from Figure 4.1 that the perpendicular distance of a point x from
    a hyper- plane defined by <math|y(x)=0> where <math|y(x)> takes the form
    Eq. <eqref|7.1> is given by <math|\|y(x)\|/<around*|\<\|\|\>|\<b-w\>|\<\|\|\>>>
    . Furthermore, we are only interested in solutions for which all data
    points are correctly classified, so that <math|t<rsub|n>y(x<rsub|n>)
    \<gtr\> 0> for all <math|n>. Thus the distance of a point
    <math|x<rsub|n>> to the decision surface is given by\ 

    <\equation*>
      <frac|t<rsub|n>y(\<b-x\><rsub|n>)|<around*|\<\|\|\>|\<b-w\>|\<\|\|\>>>
      = <frac|t<rsub|n>(\<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>) +
      b)|<around*|\<\|\|\>|\<b-w\>|\<\|\|\>>>.
    </equation*>

    The margin is given by the perpendicular distance to the closest point
    <math|\<b-x\><rsub|n>> from the data set, and we wish to optimize the
    parameters <math|\<b-w\>> and <math|b> in order to maximize this
    distance. Thus the maximum margin solution is found by solving\ 

    <\equation*>
      arg max<rsub|\<b-w\>,b> <around*|{|<frac|1|<around*|\<\|\|\>|\<b-w\>|\<\|\|\>>>
      min<rsub|n><around*|[|t<rsub|n><around*|(|\<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>)+b|)>|]>|}>
    </equation*>
  </hidden>|<\hidden>
    we note that if we make the rescaling <math|w \<rightarrow\> \<kappa\>w>
    and <math|b \<rightarrow\> \<kappa\>b>, then the distance from any point
    <math|x<rsub|n>> to the decision surface, given by
    <math|t<rsub|n>y(x<rsub|n>)/w> , is unchanged. We can use this freedom to
    set\ 

    <\equation*>
      t<rsub|n><around*|(|\<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>)+b|)>=1
    </equation*>

    for the point that is closest to the surface. In this case, all data
    points will satisfy the constraints\ 

    <\equation>
      t<rsub|n><around*|(|\<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>)+b|)>
      \<geqslant\>1,<space|2em>n=1,\<cdots\>,N.<label|7.5>
    </equation>

    This is known as the <strong|canonical> representation of the decision
    hyperplane. In the case of data points for which the equality holds, the
    constraints are said to be <strong|active>, whereas for the remainder
    they are said to be <strong|inactive>.
  </hidden>|<\hidden>
    The optimization problem then simply requires that we maximize
    <math|<around*|\<\|\|\>|\<b-w\>|\<\|\|\>><rsup|\<minus\>1>>, which is
    equivalent to minimizing <math|<around*|\<\|\|\>|\<b-w\>|\<\|\|\>><rsup|2>>,
    and so we have to solve the optimization problem\ 

    <\equation*>
      arg min<rsub|\<b-w\>,b><frac|1|2><around*|\<\|\|\>|\<b-w\>|\<\|\|\>><rsup|2>
    </equation*>

    subject to the constraints given by Eq. <eqref|7.5>.

    This is an example of a <strong|quadratic programming> problem in which
    we are trying to minimize a quadratic function subject to a set of linear
    inequality constraints.
  </hidden>|<\hidden>
    In order to solve this constrained optimization problem, we introduce
    Lagrange multipliers <math|a<rsub|n>\<gtr\>0>, with one multiplier an for
    each of the constraints in Eq. <eqref|7.5>, giving the Lagrangian
    function

    <\equation*>
      L<around*|(|\<b-w\>,b,\<b-a\>|)>=<frac|1|2><around*|\<\|\|\>|\<b-w\>|\<\|\|\>><rsup|2>-<big|sum><rsub|n=1><rsup|N>a<rsub|n><around*|{|t<rsub|n><around*|(|\<b-w\><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>+b|)>-1|}>
    </equation*>

    where <math|a=(a<rsub|1>,\<cdots\>,a<rsub|N>)<rsup|T>>.

    Setting the derivatives of <math|L(w, b, a) >with respect to <math|w> and
    <math|b> equal to zero, we obtain the following two conditions

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-w\>>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>a<rsub|n>t<rsub|n>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)><eq-number><label|7.8>>>|<row|<cell|0>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>a<rsub|n>t<rsub|n><eq-number><label|7.9>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    Eliminating <math|w> and <math|b> from <math|L(w,b,a)> using these
    conditions then gives the <strong|dual representation> of the maximum
    margin problem in which we maximize\ 

    <\equation>
      <wide|L|~><around*|(|\<b-a\>|)>=<big|sum><rsub|n=1><rsup|N>a<rsub|n>-<frac|1|2><big|sum><rsub|n=1><rsup|N><big|sum><rsub|m=1><rsup|N>a<rsub|n>a<rsub|m>t<rsub|n>t<rsub|m>k<around*|(|\<b-x\><rsub|n>,\<b-x\><rsub|m>|)><label|7.10>
    </equation>

    with respect to <math|a> subject to the constraints\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|a<rsub|n>>|<cell|\<geqslant\>>|<cell|0,\<space\><application-space|1em><space|1em>n=1,\<cdots\>,N,>>|<row|<cell|<big|sum><rsub|n=1><rsup|N>a<rsub|n>t<rsub|n>>|<cell|=>|<cell|0.>>>>
    </eqnarray*>

    Here the kernel function is defined by <math|k(\<b-x\>,\<b-x\><rprime|'>)
    = \<b-varphi\>(\<b-x\>)<rsup|T>\<b-varphi\>(\<b-x\><rprime|'>)>.
  </hidden>|<\hidden>
    In order to classify new data points using the trained model, we evaluate
    the sign of <math|y(x)> defined by Eq. <eqref|7.1>. This can be expressed
    in terms of the parameters <math|{a<rsub|n>}> and the kernel function by
    substituting for <math|w> using Eq. <eqref|7.8> to give

    <\equation>
      <label|7.13>y<around*|(|\<b-x\>|)>=<big|sum><rsub|n=1><rsup|N>a<rsub|n>t<rsub|n>k<around*|(|\<b-x\>,\<b-x\><rsub|n>|)>+b
    </equation>

    a constrained optimization of this form satisfies the Karush-Kuhn-Tucker
    (<strong|KKT>) conditions, which in this case require that the following
    three properties hold\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|a<rsub|n>>|<cell|\<geqslant\>>|<cell|0>>|<row|<cell|t<rsub|n>y<around*|(|\<b-x\><rsub|n>|)>-1>|<cell|\<geqslant\>>|<cell|0>>|<row|<cell|a<rsub|n><around*|{|t<rsub|n>y<around*|(|\<b-x\><rsub|n>|)>-1|}>>|<cell|=>|<cell|0>>>>
    </eqnarray*>

    <strong|support vectors>:<math|a<rsub|n>\<gtr\>0,t<rsub|n>y<around*|(|\<b-x\><rsub|n>|)>=1>
  </hidden>|<\hidden>
    Having solved the quadratic programming problem and found a value for
    <math|\<b-a\>>, we can then determine the value of the threshold
    parameter <math|b> by noting that any support vector
    <math|\<b-x\><rsub|n>> satisfies <math|t<rsub|n>y(\<b-x\><rsub|n> ) = 1>.
    Using Eq. <eqref|7.13> this gives

    <\equation*>
      t<rsub|n><around*|(|<big|sum><rsub|m\<in\>\<cal-S\>>a<rsub|m>t<rsub|m>k<around*|(|\<b-x\><rsub|n>,\<b-x\><rsub|m>|)>+b|)>=1
    </equation*>

    where <math|\<cal-S\>> denotes the set of indices of the support vectors.
    Although we can solve this equation for <math|b> using an arbitrarily
    chosen support vector <math|\<b-x\><rsub|n>>, a numerically more stable
    solution is obtained by first multiplying through by <math|t<rsub|n>> ,
    making use of <math|t<rsup|2><rsub|n>=1>, and then averaging these
    equations over all support vectors and solving for <math|b> to give

    <\equation*>
      b=<frac|1|N<rsub|\<cal-S\>>><big|sum><rsub|n\<in\>\<cal-S\>><around*|(|t<rsub|n>-<big|sum><rsub|m\<in\>\<cal-S\>>a<rsub|m>t<rsub|m>k<around*|(|\<b-x\><rsub|n>,\<b-x\><rsub|m>|)>|)>
    </equation*>

    where <math|N<rsub|\<cal-S\>>> is the total number of support vectors.
  </hidden>|<\hidden>
    For later comparison with alternative models, we can express the
    maximum-margin classifier in terms of the minimization of an error
    function, with a simple quadratic regularizer, in the form

    <\equation*>
      <big|sum><rsub|n=1><rsup|N>E<rsub|\<infty\>><around*|(|y<around*|(|\<b-x\><rsub|n>|)>t<rsub|n>-1|)>+\<lambda\><around*|\<\|\|\>|\<b-w\>|\<\|\|\>><rsup|2>
    </equation*>

    where <math|E\<infty\>(z)> is a function that is zero if
    <math|z\<geqslant\>0> and <math|\<infty\>> otherwise and ensures that the
    constraints Eq. <eqref|7.5> are satisfied. Note that as long as the
    regularization parameter satisfies <math|\<lambda\>\<gtr\>0>, its precise
    value plays no role.
  </hidden>|<\hidden>
    \;

    <image|img/7_2example.png|1par|||>
  </hidden>|<\hidden>
    <tit|Overlapping class distributions>

    Introduce <em|slack variables>,\ 

    <\equation*>
      \<xi\><rsub|n>\<geqslant\>0
    </equation*>

    where <math|n=1,\<cdots\>,N> , with one slack variable for each training
    data point.

    <\equation*>
      \<xi\><rsub|n>=<choice|<tformat|<table|<row|<cell|0>|<cell|<text|data
      points on or inside the correct margin
      boundary>>>|<row|<cell|<around*|\||t<rsub|n>\<minus\>y(x<rsub|n>)|\|>>|<cell|<text|others.>>>>>>
    </equation*>

    The exact classification constraints Eq. <eqref|7.5> are then replaced
    with\ 

    <\equation*>
      t<rsub|n>y(x<rsub|n>)\<geqslant\>1\<minus\>\<xi\><rsub|n>,\<space\>\<space\>\<space\><application-space|1em>n=1,\<cdots\>,N
    </equation*>

    \ 

    \ 
  </hidden>|<\hidden>
    \;

    <image|img/7_3_slack_variable.png|1par|||>
  </hidden>|<\hidden>
    Our goal is now to maximize the margin while softly penalizing points
    that lie on the wrong side of the margin boundary. We therefore minimize

    <\equation>
      C<big|sum><rsub|n=1><rsup|N>\<xi\><rsub|n>+<frac|1|2><around*|\<\|\|\>|\<b-W\>|\<\|\|\>><rsup|2><label|7.21>
    </equation>

    where the parameter <math|C\<gtr\>0> controls the trade-off between the
    slack variable penalty and the margin.

    <\itemize-dot>
      <item><math|<big|sum><rsub|n>\<xi\><rsub|n>> is an upper bound on the
      number of misclassified points Because any point that is misclassified
      has <math|\<xi\><rsub|n>\<gtr\>1>.

      <item><math|C> is therefore analogous to (the inverse of) a
      regularization coefficient because it controls the trade-off between
      minimizing training errors and controlling model complexity.
    </itemize-dot>
  </hidden>|<\hidden>
    <tit|Lagrangian >

    \;

    \;

    The corresponding Lagrangian is given by

    <\equation*>
      L<around*|(|\<b-W\>,b,\<b-a\>|)>=<frac|1|2><around*|\<\|\|\>|\<b-W\>|\<\|\|\>><rsup|2>+C<big|sum><rsub|n=1><rsup|N>\<xi\><rsub|n>-<big|sum><rsub|n=1><rsup|N>a<rsub|n><around*|{|t<rsub|n>y<around*|(|\<b-x\><rsub|n>|)>-1+\<xi\><rsub|n>|}>-<big|sum><rsub|n=1><rsup|N>\<mu\><rsub|n>\<xi\><rsub|n>
    </equation*>

    where <math|{a<rsub|n>\<geqslant\>0}> and
    <math|{\<mu\><rsub|n>\<geqslant\>0}> are Lagrange multipliers.

    \;
  </hidden>|<\hidden>
    <tit|KKT conditions>

    KKT conditions are given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|a<rsub|n>>|<cell|\<geqslant\>>|<cell|0>>|<row|<cell|t<rsub|n>y<around*|(|\<b-x\><rsub|n>|)>-1+\<xi\><rsub|n>>|<cell|\<geqslant\>>|<cell|0<label|7.25><eq-number>>>|<row|<cell|a<rsub|n><around*|(|t<rsub|n>y<around*|(|\<b-x\><rsub|n>|)>-1+\<xi\><rsub|n>|)>>|<cell|=>|<cell|0>>|<row|<cell|\<xi\><rsub|n>>|<cell|\<geqslant\>>|<cell|0>>|<row|<cell|\<mu\><rsub|n>>|<cell|\<geqslant\>>|<cell|0>>|<row|<cell|\<mu\><rsub|n>\<xi\><rsub|n>>|<cell|=>|<cell|0<label|7.28><eq-number>>>>>
    </eqnarray*>

    where <math|n=1,\<cdots\>,N>.
  </hidden>|<\hidden>
    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<partial\>L|\<partial\>\<b-w\>>=0>|<cell|\<Rightarrow\>>|<cell|\<b-W\>=<big|sum><rsub|n=1><rsup|N>a<rsub|n>t<rsub|n>\<varphi\><around*|(|\<b-x\><rsub|n>|)><label|7.29><eq-number>>>|<row|<cell|<frac|\<partial\>L|\<partial\>b>=0>|<cell|\<Rightarrow\>>|<cell|<big|sum><rsub|n=1><rsup|N>a<rsub|n>t<rsub|n>=0<label|7.30><eq-number>>>|<row|<cell|<frac|\<partial\>L|\<partial\>\<xi\><rsub|n>>=0>|<cell|\<Rightarrow\>>|<cell|a<rsub|n>=C-\<mu\><rsub|n><label|7.31><eq-number>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    Using these results to eliminate <math|w, b,> and <math|{\<xi\><rsub|n>}>
    from the Lagrangian, we obtain the

    dual Lagrangian in the form

    <\equation>
      <wide|L|~><around*|(|a|)>=<big|sum><rsub|n=1><rsup|N>a<rsub|n>-<frac|1|2><big|sum><rsub|n=1><rsup|N><big|sum><rsub|m=1><rsup|N>a<rsub|n>a<rsub|m>t<rsub|n>t<rsub|m>k<around*|(|\<b-x\><rsub|n>,\<b-x\><rsub|m>|)><label|7.32>
    </equation>

    \ with respect to the dual variables <math|{a<rsub|n>}> subject to

    <\eqnarray*>
      <tformat|<table|<row|<cell|0\<leqslant\>>|<cell|a<rsub|n>>|<cell|\<leqslant\>C<label|7.33><eq-number>>>|<row|<cell|<big|sum><rsub|n=1><rsup|N>a<rsub|n>t<rsub|n>>|<cell|=>|<cell|0<label|7.34><eq-number>>>>>
    </eqnarray*>

    for <math|n=1,\<cdots\>,N>. where Eq. <eqref|7.33> are known as
    <strong|box constraints>. This again represents a quadratic programming
    problem. If we substitute Eq. <eqref|7.29>into <eqref|7.1>, we see that
    predictions for new data points are again made by using
    <eqref|7.13>.<htab|5mm><htab|5mm>

    \;
  </hidden>|<\hidden>
    <tit|Interpret the resulting solution>

    \;

    As before, a subset of the data points may have <math|a<rsub|n>=0>, in
    which case they do not contribute to the predictive model Eq.
    <eqref|7.13>.\ 

    The remaining data points constitute the support vectors. These have
    <math|a<rsub|n>\<gtr\>0> and hence from Eq. <eqref|7.25> must satisfy

    <\equation*>
      t<rsub|n>y(x<rsub|n>) = 1 \<minus\> \<xi\><rsub|n>.
    </equation*>

    If <math|a<rsub|n>\<less\>C>, then Eq. <eqref|7.31> implies that
    <math|\<mu\><rsub|n>\<gtr\>0>, which from <eqref|7.28> requires
    <math|\<xi\><rsub|n>=0> and hence such points lie on the margin.\ 

    Points with <math|a<rsub|n>=C> can lie inside the margin and can either
    be correctly classified if <math|\<xi\><rsub|n>\<leqslant\>1> or
    misclassified if <math|\<xi\><rsub|n>\<gtr\>1>.

    \;
  </hidden>|<\hidden>
    <tit|Determine the parameter <math|b>>

    To determine the parameter <math|b> in Eq. <eqref|7.1>, we note that
    those support vectors for which <math|0\<less\>a<rsub|n>\<less\>C> have
    <math|\<xi\><rsub|n>=0> so that <math|t<rsub|n>y(x<rsub|n>)=1> and hence
    will satisfy\ 

    <\equation*>
      t<rsub|n><around*|(|<big|sum><rsub|m\<in\>\<cal-S\>>a<rsub|m>t<rsub|m>k<around*|(|x<rsub|n>,x<rsub|m>|)>+b|)>=1.
    </equation*>

    Again, a numerically stable solution is obtained by averaging to give\ 

    <\equation*>
      b=<frac|1|N<rsub|\<cal-M\>>><big|sum><rsub|n\<in\>\<cal-M\>><around*|(|t<rsub|n>-<big|sum><rsub|m\<in\>\<cal-S\>>a<rsub|m>t<rsub|m>k<around*|(|x<rsub|n>,x<rsub|m>|)>|)>
    </equation*>

    \ 

    where <math|\<cal-M\>> denotes the set of indices of data points having
    <math|0\<less\>a<rsub|n>\<less\>C>.
  </hidden>|<\hidden>
    <tit|<math|\<nu\>-SVM>>

    An alternative, equivalent formulation of the support vector machine,
    known as the \<nu\>-SVM, involves maximizing\ 

    <\equation*>
      <wide|L|~><around*|(|a|)>=-<frac|1|2><big|sum><rsub|n=1><rsup|N><big|sum><rsub|m=1><rsup|N>a<rsub|n>a<rsub|m>t<rsub|n>t<rsub|m>k<around*|(|x<rsub|n>,x<rsub|m>|)>
    </equation*>

    subject to the constraints\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|0\<leqslant\>>|<cell|a<rsub|n>>|<cell|\<leqslant\>1/N>>|<row|<cell|<big|sum><rsub|n=1><rsup|N>a<rsub|n>t<rsub|n>>|<cell|=>|<cell|0>>|<row|<cell|<big|sum><rsub|n=1><rsup|N>a<rsub|n>>|<cell|\<geqslant\>>|<cell|\<nu\>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    <tit|Advantage with <math|\<nu\>>>

    \;

    \;

    This approach has the advantage that the parameter <math|\<nu\>>, which
    replaces <math|C>, can be interpreted as both an upper bound on

    the fraction of <strong|margin errors> (points for which
    <math|\<xi\><rsub|n>\<gtr\>0> and hence which lie on the wrong side of
    the margin boundary and which may or may not be misclassified)\ 

    and a lower bound on the fraction of support vectors.
  </hidden>|<\hidden>
    \;

    \;

    <image|img/7_4_nu_svm.png|1par|||>
  </hidden>|<\hidden>
    <tit|Quadratic optimization>

    the objective function <math|<wide|L|~>(a)> given by <eqref|7.10> or
    <eqref|7.32> is quadratic and so any local optimum will also be a global
    optimum provided the constraints define a convex region (which they do as
    a conse- quence of being linear).\ 

    Direct solution of the quadratic programming problem using traditional
    techniques is often infeasible due to the demanding computation and
    memory requirements, and so more practical approaches need to be found.

    \;
  </hidden>|<\hidden>
    <tit|Probabilistic outputs>

    To use the SVM as a module in a larger probabilistic system, then
    probabilistic predictions of the class label <math|t> for new inputs
    <math|x> are required.

    The required conditional probability is assumed to be of the form\ 

    <\equation*>
      p(t=1\|x)=\<sigma\>(A y(x)+B)
    </equation*>

    where <math|y(x)> is defined by <eqref|7.1>.

    Values for the parameters <math|A> and <math|B> are found by minimizing
    the cross-entropy error function defined by a training set consisting of
    pairs of values <math|y(x<rsub|n>)> and <math|t<rsub|n>>.\ 

    The data used to fit the sigmoid needs to be independent of that used to
    train the original SVM in order to avoid severe over-fitting.\ 

    This two-stage approach is equivalent to assuming that the output
    <math|y(x)> of the support vector machine represents the log-odds of
    <math|x> belonging to class <math|t=1>.
  </hidden>|<\hidden>
    <tit|Relation to logistic regression>

    For data points that are on the correct side of the margin boundary, and
    which therefore satisfy <math|y<rsub|n>t<rsub|n>\<geqslant\>1>, we have
    <math|\<xi\><rsub|n>=0>, and for the remaining points we have
    <math|\<xi\><rsub|n>=1\<minus\>y<rsub|n>t<rsub|n>>.\ 

    Thus the objective function <eqref|7.21> can be written (up to an overall
    multiplicative constant) as

    <\equation*>
      <big|sum><rsub|n=1><rsup|N>E<rsub|SV><around*|(|y<rsub|n>t<rsub|n>|)>+\<lambda\><around*|\<\|\|\>|\<b-w\>|\<\|\|\>><rsup|2>
    </equation*>

    where <math|\<lambda\>=(2C)<rsup|\<minus\>1>>, and
    <math|E<rsub|SV>(\<cdummy\>)> is the <strong|hinge> error function
    defined by

    <\equation*>
      E<rsub|SV><around*|(|y<rsub|n>t<rsub|n>|)>=<around*|[|1-y<rsub|n>t<rsub|n>|]><rsub|+>
    </equation*>

    where <math|[\<cdummy\>]<rsub|+>> denotes the positive part.
  </hidden>|<\hidden>
    \;

    \;

    <image|img/7_5_hinge.png|1par|||>

    \;
  </hidden>|<\hidden>
    For comparison with the support vector machine, we first reformulate
    maximum likelihood logistic regression using the target variable
    <math|t\<in\>{\<minus\>1,1}>.\ 

    To do this, we note that <math|p(t =1\|y) =\<sigma\>(y)> where
    <math|y(x)> is given by <eqref|7.1>, and <math|\<sigma\>(y)> is the
    logistic sigmoid function defined by (4.59). It follows that <math|p(t
    =\<minus\>1\|y) = 1\<minus\>\<sigma\>(y)=\<sigma\>(\<minus\>y)>, where we
    have used the properties of the logistic sigmoid function, and so we can
    write

    <\equation*>
      p<around*|(|t\|y|)>=\<sigma\><around*|(|y t|)>
    </equation*>

    From this we can construct an error function by taking the negative
    logarithm of the likelihood function that, with a quadratic regularizer,
    takes the form

    <\equation*>
      <big|sum><rsub|n=1><rsup|N>E<rsub|LR><around*|(|y<rsub|n>t<rsub|n>|)>+\<lambda\><around*|\<\|\|\>|\<b-w\>|\<\|\|\>><rsup|2>.
    </equation*>

    where

    <\equation*>
      E<rsub|LR><around*|(|y t|)>=ln<around*|(|1+exp<around*|(|-y t|)>|)>.
    </equation*>
  </hidden>|<\hidden>
    <tit|Multiclass SVMs>

    \;

    <\itemize-dot>
      <item>one-versus-the-rest

      <item>one-versus-one

      <item>based on error-correcting out-put codes

      <item>single-class support vector machines
    </itemize-dot>
  </hidden>|<\hidden>
    <tit|SVMs for regression>

    \;

    In simple linear regression, minimize a regularized error function given
    by

    <\equation*>
      <frac|1|2><big|sum><rsub|n=1><rsup|N><around*|{|y<rsub|n>-t<rsub|n>|}><rsup|2>+<frac|\<lambda\>|2><around*|\<\|\|\>|\<b-w\>|\<\|\|\>><rsup|2>
    </equation*>

    To obtain sparse solutions, the quadratic error function is replaced by
    an <math|\<varepsilon\>>-insensitive error function. which gives zero
    error if the absolute difference be-tween the prediction <math|y(x)> and
    the target <math|t> is less than <math|\<varepsilon\>> where
    <math|\<varepsilon\>\<gtr\>0>.
  </hidden>|<\hidden>
    A simple example of an <math|\<varepsilon\>>-insensitive error function,
    having a linear cost associated with errors outside the insensitive
    region, is given by

    <\equation*>
      E<rsub|\<varepsilon\>><around*|(|y<around*|(|x|)>-t|)>=<choice|<tformat|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|0,>|<cell|>|<cell|if
      <around*|\||y<around*|(|x|)>-t|\|>\<less\>\<varepsilon\>>>|<row|<cell|<around*|\||y<around*|(|x|)>-t|\|>,>|<cell|>|<cell|otherwise>>>>>
    </equation*>

    minimize a regularized error function given by

    <\equation*>
      C<big|sum><rsub|n=1><rsup|N>E<rsub|\<varepsilon\>><around*|(|y<around*|(|x<rsub|n>|)>-t<rsub|n>|)>+<frac|1|2><around*|\<\|\|\>|\<b-w\>|\<\|\|\>><rsup|2>
    </equation*>

    where <math|y(x)> is given by <eqref|7.1>. By convention the (inverse)
    regularization parameter, denoted <math|C>, appears in front of the error
    term.
  </hidden>|<\hidden>
    \;

    \;

    \;

    <image|img/7_6_epsilon_insensitive_error_function.png|1par|||>
  </hidden>|<\hidden>
    \;

    As before, we can re-express the optimization problem by introducing
    slack variables.

    For each data point <math|x<rsub|n>>, we now need two slack variables
    <math|<wide|\<xi\>|~><rsub|n>\<geqslant\>0> and
    <math|\<xi\><rsub|n>\<gtr\>0>, where <math|\<xi\><rsub|n>\<gtr\>0>
    corresponds to a point for which <math|t<rsub|n>\<gtr\>y(x<rsub|n>)+\<varepsilon\>>,
    and <math|\<xi\><rsub|n>\<gtr\>0> corresponds to a point for which
    <math|t<rsub|n>\<less\>y(x<rsub|n>)\<minus\>\<varepsilon\>>.

    The condition for a target point to lie inside the
    <math|\<varepsilon\>>-tube is that <math|y<rsub|n>\<minus\>\<varepsilon\>\<leqslant\>t<rsub|n>\<leqslant\>
    y<rsub|n>+\<varepsilon\>>, where <math|y<rsub|n>=y(x<rsub|n>)>.
    Introducing the slack variables allows points to lie outside the tube
    provided the slack variables are nonzero, and the corresponding
    conditions are

    <\eqnarray*>
      <tformat|<table|<row|<cell|t<rsub|n>>|<cell|\<leqslant\>>|<cell|y<around*|(|x<rsub|n>|)>+\<varepsilon\>+\<xi\><rsub|n><label|7.53><eq-number>>>|<row|<cell|t<rsub|n>>|<cell|\<geqslant\>>|<cell|y<around*|(|x<rsub|n>|)>-\<varepsilon\>-<wide|\<xi\>|^><rsub|n><label|7.54><eq-number>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    \;

    <image|img/7_7_svm_regression.png|1par|||>
  </hidden>|<\hidden>
    The error function for support vector regression can then be written as

    <\equation*>
      C<big|sum><rsub|n=1><rsup|N><around*|(|\<xi\><rsub|n>+<wide|\<xi\>|^><rsub|n>|)>+<frac|1|2><around*|\<\|\|\>|\<b-w\>|\<\|\|\>><rsup|2>
    </equation*>

    which must be minimized subject to the constraints
    <math|\<xi\><rsub|n>\<geqslant\>0> and
    <math|<wide|\<xi\>|^><rsub|n>\<geqslant\>0> as well as Eq. <eqref|7.53>
    and <eqref|7.54>. This can be achieved by introducing Lagrange
    multipliers <math|a<rsub|n>\<geqslant\>0>,
    <math|<wide|a|^><rsub|n>\<geqslant\>0>,
    <math|\<mu\><rsub|n>\<geqslant\>0>, and
    <math|<wide|\<mu\>|^><rsub|n>\<geqslant\>0> and optimizing the Lagrangian

    <\eqnarray*>
      <tformat|<table|<row|<cell|L>|<cell|=>|<cell|C<big|sum><rsub|n=1><rsup|N><around*|(|\<xi\><rsub|n>+<wide|\<xi\>|^><rsub|n>|)>+<frac|1|2><around*|\<\|\|\>|\<b-w\>|\<\|\|\>><rsup|2>-<big|sum><rsub|n=1><rsup|N><around*|(|\<mu\><rsub|n>\<xi\><rsub|n>+<wide|\<mu\>|^><rsub|n><wide|\<xi\>|^><rsub|n>|)>>>|<row|<cell|>|<cell|>|<cell|-<big|sum><rsub|n=1><rsup|N>a<rsub|n><around*|(|\<varepsilon\>+\<xi\><rsub|n>+y<rsub|n>-t<rsub|n>|)>-<big|sum><rsub|n=1><rsup|N><wide|a|^><rsub|n><around*|(|\<varepsilon\>+<wide|\<xi\>|^><rsub|n>-y<rsub|n>+t<rsub|n>|)>.>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    substitute for <math|y(x)> using Eq. <eqref|7.1> and then set the
    derivatives of the Lagrangian with respect to <math|w, b,
    \<xi\><rsub|n>>, and <math|<wide|\<xi\>|^><rsub|n>> to zero, giving

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|\<partial\>L|\<partial\>\<b-w\>>=0>|<cell|\<Rightarrow\>>|<cell|\<b-w\>=<big|sum><rsub|n=1><rsup|N><around*|(|a<rsub|n>-<wide|a|^><rsub|n>|)>\<varphi\><around*|(|\<b-x\><rsub|n>|)><label|7.57><eq-number>>>|<row|<cell|<frac|\<partial\>L|\<partial\>b>=0>|<cell|\<Rightarrow\>>|<cell|<big|sum><rsub|n=1><rsup|N><around*|(|a<rsub|n>-<wide|a|^><rsub|n>|)>=0<label|7.58><eq-number>>>|<row|<cell|<frac|\<partial\>L|\<partial\>\<xi\><rsub|n>>=0>|<cell|\<Rightarrow\>>|<cell|a<rsub|n>+\<mu\><rsub|n>=C<label|7.59><eq-number>>>|<row|<cell|<frac|\<partial\>L|\<partial\><wide|\<xi\>|^><rsub|n>>=0>|<cell|\<Rightarrow\>>|<cell|<wide|a|^><rsub|n>+<wide|\<mu\>|^><rsub|n>=C<label|7.60><eq-number>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    Using these results to eliminate the corresponding variables from the
    Lagrangian, we see that the dual problem involves maximizing

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|L|~><around*|(|a,<wide|a|^>|)>>|<cell|=>|<cell|-<frac|1|2><big|sum><rsub|n=1><rsup|N><big|sum><rsub|m=1><rsup|N><around*|(|a<rsub|n>-<wide|a|^><rsub|n>|)><around*|(|a<rsub|m>-<wide|a|^><rsub|m>|)>k<around*|(|\<b-x\><rsub|n>,\<b-x\><rsub|m>|)>>>|<row|<cell|>|<cell|>|<cell|-\<varepsilon\><big|sum><rsub|n=1><rsup|N><around*|(|a<rsub|n>+<wide|a|^><rsub|n>|)>+<big|sum><rsub|n=1><rsup|N><around*|(|a<rsub|n>-<wide|a|^><rsub|n>|)>t<rsub|n>>>>>
    </eqnarray*>

    with respect to <math|{a<rsub|n>}> and <math|{a<rsub|n>}>, where we have
    introduced the kernel <math|k(x,x<rprime|'>) =
    \<b-varphi\>(x)<rsup|T>\<b-varphi\>(x<rprime|'>)>.
  </hidden>|<\hidden>
    To find the constraints we note that <math|a<rsub|n>\<geqslant\>0> and
    <math|<wide|a|^><rsub|n>\<geqslant\>0> are both required because these
    are Lagrange multipliers. Also <math|\<mu\><rsub|n>\<geqslant\>0> and
    <math|<wide|\<mu\>|^><rsub|n>\<geqslant\>0> together with <eqref|7.59>
    and <eqref|7.60>, require <math|a<rsub|n>\<leqslant\>C> and
    <math|a<rsub|n><rsub|>\<leqslant\>C>, and so again we have the box
    constraints

    <\eqnarray*>
      <tformat|<table|<row|<cell|0\<leqslant\>>|<cell|a<rsub|n>>|<cell|\<leqslant\>C>>|<row|<cell|0\<leqslant\>>|<cell|<wide|a|^><rsub|n>>|<cell|\<leqslant\>C>>>>
    </eqnarray*>

    together with the condition <eqref|7.58>.

    Substituting <eqref|7.57> into <eqref|7.1>, we see that predictions for
    new inputs can be made using

    <\equation>
      y<around*|(|x|)>=<big|sum><rsub|n=1><rsup|N><around*|(|a<rsub|n>-<wide|a|^><rsub|n>|)>k<around*|(|x,x<rsub|n>|)>+b<label|7.64>
    </equation>

    which is again expressed in terms of the kernel function.<next-line>
  </hidden>|<\hidden>
    The corresponding Karush-Kuhn-Tucker (KKT) conditions, which state that
    at the solution the product of the dual variables and the constraints
    must vanish, are given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|a<rsub|n><around*|(|\<varepsilon\>+\<xi\><rsub|n>+y<rsub|n>-t<rsub|n>|)>>|<cell|=>|<cell|0<label|7.65><eq-number>>>|<row|<cell|<wide|a|^><rsub|n><around*|(|\<varepsilon\>+<wide|\<xi\>|^><rsub|n>-y<rsub|n>+t<rsub|n>|)>>|<cell|=>|<cell|0<label|7.66><eq-number>>>|<row|<cell|<around*|(|C-a<rsub|n>|)>\<xi\><rsub|n>>|<cell|=>|<cell|0<label|7.67><eq-number>>>|<row|<cell|<around*|(|C-<wide|a|^><rsub|n>|)><wide|\<xi\>|^><rsub|n>>|<cell|=>|<cell|0<label|7.68><eq-number>>>>>
    </eqnarray*>

    Note that a coefficient <math|a<rsub|n>> can only be nonzero if
    <math|\<varepsilon\>+\<xi\><rsub|n>+y<rsub|n>-t<rsub|n>=0>, which implies
    that the data point either lies on the upper boundary of the
    <math|\<varepsilon\>>-tube (<math|\<xi\><rsub|n>=0>) or lies above the
    upper boundary (<math|\<xi\><rsub|n>\<gtr\>0>). So does
    <math|<wide|a|^><rsub|n>>.\ 

    The two constraints <math|\<varepsilon\>+\<xi\><rsub|n> +y<rsub|n>
    \<minus\>t<rsub|n> = 0> and<math| \<varepsilon\>+\<xi\><rsub|n>
    \<minus\>y<rsub|n> +t<rsub|n> = 0> are incompatible, as is easily seen by
    adding them together and noting that <math|\<xi\><rsub|n>> and
    <math|<wide|\<xi\>|^><rsub|n>> are nonnegative while
    <math|\<varepsilon\>> is strictly positive, and so for every data point
    <math|x<rsub|n>>, either <math|a<rsub|n>> or <math|<wide|a|^><rsub|n>>
    (or both) must be zero.
  </hidden>|<\hidden>
    The parameter b can be found by considering a data point for which
    <math|0 \<less\> a<rsub|n> \<less\> C>, which from <eqref|7.67> must have
    <math|\<xi\><rsub|n> = 0>, and from <eqref|7.65> must therefore satisfy
    <math|\<varepsilon\>+ y<rsub|n> \<minus\> t<rsub|n> = 0>. Using
    <eqref|7.1> and solving for <math|b>, we obtain

    <\eqnarray*>
      <tformat|<table|<row|<cell|b>|<cell|=>|<cell|t<rsub|n>-\<varepsilon\>-\<b-w\><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>>>|<row|<cell|>|<cell|=>|<cell|t<rsub|n>-\<varepsilon\>-<big|sum><rsub|m=1><rsup|N><around*|(|a<rsub|m>-<wide|a|^><rsub|m>|)>k<around*|(|\<b-x\><rsub|n>,\<b-x\><rsub|m>|)>>>>>
    </eqnarray*>

    where we have used <eqref|7.57>. We can obtain an analogous result by
    considering a point for which <math|0 \<less\> a<rsub|n> \<less\> C>. In
    practice, it is better to average over all such estimates of <math|b>.
  </hidden>|<\hidden>
    A parameter <math|\<nu\>> bounds the fraction of points lying outside the
    tube. This involves maximizing

    <\equation*>
      <wide|L|~><around*|(|a,<wide|a|^>|)>=-<frac|1|2><big|sum><rsub|n=1><rsup|N><big|sum><rsub|m=1><rsup|N><around*|(|a<rsub|n>-<wide|a|^><rsub|n>|)><around*|(|a<rsub|m>-<wide|a|^><rsub|m>|)>k<around*|(|\<b-x\><rsub|n>,\<b-x\><rsub|m>|)>+<big|sum><rsub|n=1><rsup|N><around*|(|a<rsub|n>-<wide|a|^><rsub|n>|)>t<rsub|n>
    </equation*>

    subject to the constraints

    <\eqnarray*>
      <tformat|<table|<row|<cell|0\<leqslant\>>|<cell|a<rsub|n>>|<cell|\<leqslant\>C/N>>|<row|<cell|0\<leqslant\>>|<cell|<wide|a|^><rsub|n>>|<cell|\<leqslant\>C/N>>|<row|<cell|<big|sum><rsub|n=1><rsup|N><around*|(|a<rsub|n>-<wide|a|^><rsub|n>|)>>|<cell|=>|<cell|0>>|<row|<cell|<big|sum><rsub|n=1><rsup|N><around*|(|a<rsub|n>+<wide|a|^><rsub|n>|)>>|<cell|\<leqslant\>>|<cell|\<nu\>C>>>>
    </eqnarray*>

    It can be shown that there are at most <math|\<nu\>N> data points falling
    outside the insensitive tube, while at least <math|\<nu\>N> data points
    are support vectors and so lie either on the tube or outside it.
  </hidden>|<\hidden>
    \;

    \;

    <image|img/7_8_n_svm_regression.png|1par|||>
  </hidden>|<\hidden>
    <tit|Computational learning theory>

    <\description>
      <item*|Probably approximately correct, or PAC>A function
      <math|f(x;\<cal-D\>)>, drawn from a space <math|\<cal-F\>> of such
      functions on the basis of the training set <math|\<cal-D\>>, has good
      generalization if its expected error rate is below some pre-specified
      threshold <math|\<varepsilon\>>, so that\ 

      <\equation>
        E<rsub|x,t> [I (f(x; \<cal-D\>)\<neq\> t)]
        \<less\>\<varepsilon\><label|7.75>
      </equation>

      where <math|I(\<cdummy\>)> is the indicator function, and the
      expectation is with respect to the distribution <math|p(x,t)>. The
      quantity on the left-hand side is a random variable, because it depends
      on the training set <math|\<cal-D\>>, and the PAC framework requires
      that <eqref|7.75> holds, with probability greater than
      <math|1\<minus\>\<delta\>>, for a data set <math|\<cal-D\>> drawn
      randomly from <math|p(x,t)>.

      <item*|Vapnik-Chervonenkis dimension, or VC dimension>provides a
      measure of the complexity of a space of functions, and which allows the
      PAC framework to be extended to spaces containing an infinite number of
      functions.
    </description>
  </hidden>|<\hidden>
    <tit|Relevance Vector Machines>

    <\itemize-dot>
      <item>the outputs of an SVM represent decisions rather than posterior
      probabilities.

      the SVM was originally formulated for two classes, and the extension to
      K\<gtr\>2 classes is prob- lematic. There is a complexity parameter C,
      or \<nu\> (as well as a parameter <math|\<varepsilon\>> in the case of
      regression), that must be found using a hold-out method such as
      cross-validation.\ 

      Predictions are expressed as linear combinations of kernel functions
      that are centred on training data points and that are required to be
      positive definite.

      <item>The relevance vector machine or RVM is a Bayesian sparse kernel
      technique for regression and classification that shares many of the
      characteristics of the SVM whilst avoiding its principal limitations.\ 

      Additionally, it typically leads to much sparser models resulting in
      correspondingly faster performance on test data whilst maintaining
      comparable generalization error.
    </itemize-dot>
  </hidden>|<\hidden>
    <tit|RVM for regression>

    The relevance vector machine for regression is a linear model of the form
    studied in Chapter 3 but with a modified prior that results in sparse
    solutions. The model defines a conditional distribution for a real-valued
    target variable <math|t>, given an input vector <math|\<b-x\>>, which
    takes the form

    <\equation>
      p<around*|(|t<around*|\||\<b-x\>,\<b-w\>,\<beta\>|\<nobracket\>>|)>=\<cal-N\><around*|(|t<around*|\||y<around*|(|\<b-x\>|)>,\<beta\><rsup|-1>|\<nobracket\>>|)><label|7.76>
    </equation>

    where <math|\<beta\>=\<sigma\><rsup|\<minus\>2>> is the noise precision
    (inverse noise variance), and the mean is given by a linear model of the
    form

    <\equation>
      y<around*|(|x|)>=<big|sum><rsub|i=1><rsup|M>w<rsub|i>\<varphi\><rsub|i><around*|(|\<b-x\>|)>=\<b-w\><rsup|T>\<b-varphi\><around*|(|\<b-x\>|)><label|7.77>
    </equation>

    with fixed nonlinear basis functions <math|\<varphi\><rsub|i>(\<b-x\>)>,
    which will typically include a constant term so that the corresponding
    weight parameter represents a `bias'.
  </hidden>|<\hidden>
    <tit|SVM-like form>

    \;

    The relevance vector machine is a specific instance of this model, which
    is intended to mirror the structure of the support vector machine.

    In particular, the basis functions are given by kernels, with one kernel
    associated with each of the data points from the training set.\ 

    The general expression <eqref|7.77> then takes the SVM-like form

    <\equation*>
      y<around*|(|\<b-x\>|)>=<big|sum><rsub|n=1><rsup|N>w<rsub|n>k<around*|(|\<b-x\>,\<b-x\><rsub|n>|)>+b
    </equation*>

    where b is a bias parameter.

    In contrast to the SVM, there is no restriction to positive-definite
    kernels, nor are the basis functions tied in either number or location to
    the training data points.
  </hidden>|<\hidden>
    <tit|Likelihood & prior>

    \;

    Suppose we are given a set of <math|N> observations of the input vector
    <math|\<b-x\>>, which we denote collectively by a data matrix <math|X>
    whose <math|n<rsup|th>> row is <math|x<rsup|T><rsub|n>> with
    <math|n=1,\<cdots\>,N>. The corresponding target values are given by
    <math|t=(t<rsub|1>,\<cdots\>,t<rsub|N>)<rsup|T>>. Thus, the likelihood
    function is given by

    <\equation*>
      p<around*|(|\<b-t\><around*|\||X,\<b-w\>,\<beta\>|\<nobracket\>>|)>=<big|prod><rsub|n=1><rsup|N>p<around*|(|t<rsub|n><around*|\||\<b-x\><rsub|n>,\<b-w\>,\<beta\><rsup|-1>|\<nobracket\>>|)>
    </equation*>

    \ the weight prior takes the form

    <\equation*>
      p<around*|(|\<b-w\><around*|\||\<b-alpha\>|\<nobracket\>>|)>=<big|prod><rsub|i=1><rsup|N>\<cal-N\><around*|(|w<rsub|i><around*|\||0,\<alpha\><rsup|-1><rsub|i>|\<nobracket\>>|)>
    </equation*>

    where <math|\<alpha\><rsub|i>> represents the precision of the
    corresponding parameter <math|w<rsub|i>>, and <math|\<alpha\>> denotes
    <math|(\<alpha\><rsub|1>,\<cdots\>,\<alpha\><rsub|M>)<rsup|T>>.
  </hidden>|<\hidden>
    <tit|Posterior>

    Using the result (3.49) for linear regression models, we see that the
    posterior distribution for the weights is again Gaussian and takes the
    form

    <\equation>
      p(\<b-w\>\|\<b-t\>, X, \<b-alpha\>, \<beta\>) =
      \<cal-N\>(\<b-w\>\|\<b-m\>,\<b-Sigma\>)<label|7.81>
    </equation>

    where the mean and covariance are given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-m\>>|<cell|=>|<cell|\<beta\>\<b-Sigma\>\<b-Phi\><rsup|T>\<b-t\><label|7.82><eq-number>>>|<row|<cell|\<b-Sigma\>>|<cell|=>|<cell|<around*|(|A+\<beta\>\<b-Phi\><rsup|T>\<b-Phi\>|)><rsup|-1><label|7.83><eq-number>>>>>
    </eqnarray*>

    where <math|\<b-Phi\>> is the <math|N\<times\>M> design matrix with
    elements <math|\<Phi\><rsub|ni>=\<varphi\><rsub|i>(\<b-x\><rsub|n>)>, and
    <math|A=diag(\<alpha\><rsub|i>)>.
  </hidden>|<\hidden>
    <tit|Evidence approximation>

    maximize the marginal likeli- hood function obtained by integrating out
    the weight parameters

    <\equation*>
      p<around*|(|\<b-t\><around*|\||X,\<b-alpha\>,\<beta\>|\<nobracket\>>|)>=<big|int>p<around*|(|\<b-t\><around*|\||X,\<b-w\>,\<beta\>|\<nobracket\>>|)>p<around*|(|\<b-w\><around*|\||\<b-alpha\>|\<nobracket\>>|)>\<mathd\>\<b-w\>
    </equation*>

    Because this represents the convolution of two Gaussians, it is readily
    evaluated to\ 

    give the log marginal likelihood in the form

    <\equation>
      ln p<around*|(|\<b-t\><around*|\||X,\<b-alpha\>,\<beta\>|\<nobracket\>>|)>=ln
      \<cal-N\><around*|(|\<b-t\><around*|\||\<b-0\>,C|\<nobracket\>>|)>-<frac|1|2><around*|{|N
      ln<around*|(|2\<pi\>|)>+ln<around*|\||C|\|>+\<b-t\><rsup|T>C<rsup|-1>\<b-t\>|}><label|7.85>
    </equation>

    where <math|t = (t<rsub|1>,\<cdots\>, t<rsub|N>)<rsup|T>>, and we have
    defined the <math|N\<times\>N> matrix <math|C> given by

    <\equation>
      C=\<beta\><rsup|\<minus\>1>\<b-I\>+\<b-Phi\>A<rsup|\<minus\>1>\<b-Phi\><rsup|T>.<label|7.86>
    </equation>
  </hidden>|<\hidden>
    <tit|Alternately re-estimating>

    \;

    set the required derivatives of the marginal likelihood to zero and
    obtain the following re-estimation equations

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<alpha\><rsup|new><rsub|i>>|<cell|=>|<cell|<frac|\<gamma\><rsub|i>|m<rsup|2><rsub|i>>>>|<row|<cell|<around*|(|\<beta\><rsup|new>|)><rsup|-1>>|<cell|=>|<cell|<frac|<around*|\<\|\|\>|\<b-t\>-\<b-Phi\>\<b-m\>|\<\|\|\>><rsup|2>|N-<big|sum><rsub|i>\<gamma\><rsub|i>>>>>>
    </eqnarray*>

    where <math|m<rsub|i>> is the <math|i<rsup|th>> component of the
    posterior mean <math|\<b-m\>> defined by <eqref|7.82>. The quantity
    <math|\<gamma\><rsub|i>> measures how well the corresponding parameter
    <math|w<rsub|i>> is determined by the data and is defined by

    <\equation*>
      \<gamma\><rsub|i>=1-\<alpha\><rsub|i>\<Sigma\><rsub|ii>
    </equation*>

    in which <math|\<Sigma\><rsub|ii>> is the ith diagonal component of the
    posterior covariance <math|\<Sigma\>> given by <eqref|7.83>.
  </hidden>|<\hidden>
    <tit|Predictive distribution>

    Having found values <math|\<alpha\><rsup|\<ast\>>> and
    <math|\<beta\><rsup|\<ast\>>> for the hyperparameters that maximize the
    marginal likelihood, we can evaluate the predictive distribution over
    <math|t> for a new input <math|x>. Using <eqref|7.76> and <eqref|7.81>,
    this is given by\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|p(t\|x,X,t,\<alpha\><rsup|\<ast\>>
      ,\<beta\><rsup|\<ast\>> ) >|<cell|=>|<cell|<big|int>
      p(t\|x,w,\<beta\><rsup|\<ast\>> )p(w\|X,t,\<alpha\><rsup|\<ast\>>,\<beta\><rsup|\<ast\>>
      )dw >>|<row|<cell|>|<cell|=>|<cell| \<cal-N\><around*|(|
      t\|m<rsup|T>\<varphi\>(x), \<sigma\><rsup|2>(x)|)>.>>>>
    </eqnarray*>

    Thus the predictive mean is given by <eqref|7.76> with <math|w> set equal
    to the posterior mean <math|m>, and the variance of the predictive
    distribution is given by\ 

    <\equation*>
      \<sigma\><rsup|2>(\<b-x\>) = (\<beta\> <rsup|\<ast\>>)<rsup|\<minus\>1>
      + \<varphi\>(\<b-x\>)<rsup|T>\<Sigma\>\<varphi\>(\<b-x\>)
    </equation*>
  </hidden>|<\hidden>
    \;

    \;

    <image|img/7.9_rvm_regression.png|1par|||>
  </hidden>|<\hidden>
    <tit|Analysis of sparsity>

    Consider a data set comprising <math|N = 2> observations <math|t<rsub|1>>
    and <math|t<rsub|2>>, together with a model having a single basis
    function <math|\<varphi\>(x)>, with hyperparameter <math|\<alpha\>>,
    along with isotropic noise having precision <math|\<beta\>>. From
    <eqref|7.85>, the marginal likelihood is given by <math|p(t\|\<alpha\>,
    \<beta\>) = \<cal-N\>(t\|0, C)> in which the covariance matrix takes the
    form\ 

    <\equation*>
      C = <frac|1|\<beta\>> \<b-I\> + <frac|1|\<alpha\>>
      \<b-varphi\>\<b-varphi\><rsup|T>
    </equation*>

    where <math|\<b-varphi\>> denotes the <math|N>-dimensional vector
    <math|(\<varphi\>(\<b-x\><rsub|1>),\<varphi\>(\<b-x\><rsub|2>))<rsup|T>>,
    and similarly <math|t = (t<rsub|1>,t<rsub|2>)<rsup|T>>.
  </hidden>|<\hidden>
    \;

    <space|2em><image|img/7_10_sparse.png|0.9par|||>
  </hidden>|<\hidden>
    <tit|Sparsity from a more mathematical perspective>

    pull out the contribution from \<alpha\>i in the matrix C defined by
    <eqref|7.86> to give

    <\eqnarray*>
      <tformat|<table|<row|<cell|C>|<cell|=>|<cell|\<beta\><rsup|-1>\<b-I\>+<big|sum><rsub|j\<neq\>i>\<alpha\><rsup|-1><rsub|j>\<b-varphi\><rsub|j>\<b-varphi\><rsup|T><rsub|j>+\<alpha\><rsup|-1><rsub|i>\<b-varphi\><rsub|i>\<b-varphi\><rsup|T><rsub|i>>>|<row|<cell|>|<cell|=>|<cell|C<rsub|-i>+\<alpha\><rsup|-1><rsub|i>\<b-varphi\><rsub|i>\<b-varphi\><rsup|T><rsub|i>>>>>
    </eqnarray*>

    where <math|\<varphi\><rsub|i>> denotes the ith column of <math|\<Phi\>>,
    in other words the N-dimensional vector with elements
    <math|(\<varphi\><rsub|i>(x<rsub|1>),\<cdots\>
    ,\<varphi\><rsub|i>(x<rsub|N>))>, in contrast to
    <math|\<varphi\><rsub|n>>, which denotes the nth row of <math|\<Phi\>>.
    the determinant and inverse of <math|C> can then be written

    <\eqnarray*>
      <tformat|<table|<row|<cell|<around*|\||C|\|>>|<cell|=>|<cell|<around*|\||C<rsub|-i>|\|><around*|\||1+\<alpha\><rsup|-1><rsub|i>\<varphi\><rsup|T><rsub|i>C<rsup|-1><rsub|-i>|\|>>>|<row|<cell|C<rsup|-1>>|<cell|=>|<cell|C<rsup|-1><rsub|-i>-<frac|C<rsup|-1><rsub|-i>\<varphi\><rsub|i>\<varphi\><rsup|T><rsub|i>C<rsup|-1><rsub|-i>|\<alpha\><rsub|i>+\<varphi\><rsup|T><rsub|i>C<rsup|-1><rsub|-i>\<varphi\><rsub|i>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    write the log marginal likelihood function (7.85) in the form\ 

    <\equation*>
      L(\<alpha\>) = L(\<alpha\><rsub|\<minus\>i>) +
      \<lambda\>(\<alpha\><rsub|i>)
    </equation*>

    where <math|L(\<alpha\><rsub|\<minus\>i>)> is simply the log marginal
    likelihood with basis function <math|\<varphi\><rsub|i>> omitted, and the
    quantity <math|\<lambda\>(\<alpha\><rsub|i>)> is defined by

    <\equation*>
      \<lambda\><around*|(|\<alpha\><rsub|i>|)>=<frac|1|2><around*|[|ln\<alpha\><rsub|i>-ln<around*|(|\<alpha\><rsub|i>+s<rsub|i>|)>+<frac|q<rsup|2><rsub|i>|\<alpha\><rsub|i>+s<rsub|i>>|]>
    </equation*>

    and contains all of the dependence on <math|\<alpha\><rsub|i>>. Here we
    have introduced the two quantities\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|s<rsub|i>>|<cell|=>|<cell|\<b-varphi\><rsup|T><rsub|i>C<rsup|-1><rsub|-i>\<b-varphi\><rsub|i>>>|<row|<cell|q<rsub|i>>|<cell|=>|<cell|\<b-varphi\><rsup|T><rsub|i>C<rsup|-1><rsub|-i>\<b-t\>>>>>
    </eqnarray*>

    Here <math|s<rsub|i>> is called the <strong|sparsity> and
    <math|q<rsub|i>> is known as the <strong|quality> of
    <math|\<varphi\><rsub|i>>,
  </hidden>|<\hidden>
    \;

    \;

    \;

    <image|img/7_11_sparsity_quality.png|1par|||>
  </hidden>|<\shown>
    The stationary points of the marginal likelihood with respect to
    <math|\<alpha\><rsub|i>> occur when the derivative

    <\equation*>
      <frac|\<mathd\>\<lambda\><around*|(|\<alpha\><rsub|i>|)>|\<mathd\>\<alpha\><rsub|i>>=<frac|\<alpha\><rsup|-1><rsub|i>s<rsup|2><rsub|i>-<around*|(|q<rsup|2><rsub|i>-s<rsub|i>|)>|2<around*|(|\<alpha\><rsub|i>+s<rsub|i>|)><rsup|2>>
    </equation*>

    is equal to zero.

    There are two possible forms for the solution. Recalling that
    <math|\<alpha\><rsub|i>\<less\>0>, we see that if
    <math|q<rsub|i><rsup|2>\<less\>s<rsub|i>>, then
    <math|\<alpha\><rsub|i>\<rightarrow\>\<infty\>> provides a solution.
    Conversely, if <math|q<rsub|i><rsup|2>\<gtr\>s<rsub|i>>, we can solve for
    <math|\<alpha\><rsub|i>> to obtain

    <\equation*>
      \<alpha\><rsub|i>=<frac|s<rsup|2><rsub|i>|q<rsup|2><rsub|i>-s<rsub|i>>
    </equation*>
  </shown>>
</body>

<\initial>
  <\collection>
    <associate|info-flag|minimal>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|16:9>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|7.1|<tuple|1|1>>
    <associate|7.10|<tuple|5|?>>
    <associate|7.13|<tuple|6|?>>
    <associate|7.21|<tuple|7|?>>
    <associate|7.25|<tuple|<with|mode|<quote|math>|\<bullet\>>|?>>
    <associate|7.28|<tuple|8|?>>
    <associate|7.29|<tuple|9|?>>
    <associate|7.30|<tuple|10|?>>
    <associate|7.31|<tuple|11|?>>
    <associate|7.32|<tuple|13|?>>
    <associate|7.33|<tuple|13|1>>
    <associate|7.34|<tuple|14|1>>
    <associate|7.5|<tuple|2|?>>
    <associate|7.53|<tuple|<with|mode|<quote|math>|\<bullet\>>|?>>
    <associate|7.54|<tuple|16|?>>
    <associate|7.57|<tuple|17|?>>
    <associate|7.58|<tuple|18|?>>
    <associate|7.59|<tuple|19|?>>
    <associate|7.60|<tuple|20|?>>
    <associate|7.64|<tuple|22|?>>
    <associate|7.65|<tuple|22|?>>
    <associate|7.66|<tuple|23|?>>
    <associate|7.67|<tuple|24|?>>
    <associate|7.68|<tuple|25|?>>
    <associate|7.75|<tuple|27|?>>
    <associate|7.76|<tuple|28|?>>
    <associate|7.77|<tuple|29|?>>
    <associate|7.8|<tuple|3|?>>
    <associate|7.81|<tuple|30|?>>
    <associate|7.82|<tuple|30|?>>
    <associate|7.83|<tuple|31|?>>
    <associate|7.85|<tuple|33|?>>
    <associate|7.86|<tuple|34|?>>
    <associate|7.9|<tuple|4|?>>
  </collection>
</references>