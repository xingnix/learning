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
  </hidden>|<\shown>
    <tit|Maximum Margin Classifiers>

    \;
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