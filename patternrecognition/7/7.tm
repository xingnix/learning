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

    <image|img/7_1margin.png|1par|||>
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
    Lagrange multipliers an \N 0, with one multiplier an for each of the
    constraints in Eq. <eqref|7.5>, giving the Lagrangian function

    <\equation*>
      L<around*|(|\<b-w\>,b,\<b-a\>|)>=<frac|1|2><around*|\<\|\|\>|\<b-w\>|\<\|\|\>><rsup|2>-<big|sum><rsub|n=1><rsup|N>a<rsub|n><around*|{|t<rsub|n><around*|(|\<b-w\><rsup|T>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>+b|)>-1|}>
    </equation*>

    where <math|a=(a<rsub|1>,\<cdots\>,a<rsub|N>)<rsup|T>>.

    Setting the derivatives of <math|L(w, b, a) >with respect to w and b
    equal to zero, we obtain the following two conditions

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-w\>>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>a<rsub|n>t<rsub|n>\<b-varphi\><around*|(|\<b-x\><rsub|n>|)>>>|<row|<cell|0>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>a<rsub|n>t<rsub|n>>>>>
    </eqnarray*>
  </hidden>|<\shown>
    Eliminating w and b from <math|L(w,b,a)> using these conditions then
    gives the dual representation of the maximum margin problem in which we
    maximize\ 

    <\equation*>
      <wide|L|~><around*|(|\<b-a\>|)>=<big|sum><rsub|n=1><rsup|N>a<rsub|n>-<frac|1|2><big|sum><rsub|n=1><rsup|N><big|sum><rsub|m=1><rsup|N>a<rsub|n>a<rsub|m>t<rsub|n>t<rsub|m>k<around*|(|\<b-x\><rsub|n>,\<b-x\><rsub|m>|)>
    </equation*>

    with respect to a subject to the constraints\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|a<rsub|n>>|<cell|\<geqslant\>>|<cell|0,\<space\><application-space|1em><space|1em>n=1,\<cdots\>,N,>>|<row|<cell|<big|sum><rsub|n=1><rsup|N>a<rsub|n>t<rsub|n>>|<cell|=>|<cell|0.>>>>
    </eqnarray*>

    Here the kernel function is defined by <math|k(\<b-x\>,\<b-x\><rprime|'>)
    = \<b-varphi\>(\<b-x\>)<rsup|T>\<b-varphi\>(\<b-x\><rprime|'>)>.
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
    <associate|7.1|<tuple|1|?>>
    <associate|7.5|<tuple|2|?>>
  </collection>
</references>