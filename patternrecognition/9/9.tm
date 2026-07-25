<TeXmacs|2.1.1>

<style|<tuple|beamer|manila-paper>>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    <doc-data|<\doc-title>
      Mixture Models and EM
    </doc-title>>
  </hidden>|<\hidden>
    \;

    <\itemize-dot>
      <unroll-greyed|<\shown>
        \;
      </shown>|<\shown>
        <item>The introduction of latent variables thereby allows complicated
        distributions to be formed from simpler components.
      </shown>|<\shown>
        <item>If we define a joint distribution over observed and latent
        variables, the corresponding distribution of the observed variables
        alone is obtained by marginalization.\ 
      </shown>|<\shown>
        <item>This allows relatively complex marginal distributions over
        observed variables to be expressed in terms of more tractable joint
        distributions over the expanded space of observed and latent
        variables.
      </shown>>
    </itemize-dot>

    \;
  </hidden>|<\hidden>
    \;

    <expanded|<\shown>
      \;

      <\itemize-dot>
        <item>As well as providing a framework for building more complex
        probability distributions, mixture models can also be used to cluster
        data.

        <item>considering the problem of finding clusters in a set of data
        points, which we approach first using a nonprobabilistic technique
        called the <strong|K-means> algorithm.

        <item>In the latent variable view of mixture distributions the
        discrete latent variables can be interpreted as defining assignments
        of data points to specific components of the mixture.

        <item>A general technique for finding maximum likelihood estimators
        in latent variable models is the expectation-maximization (EM)
        algorithm.
      </itemize-dot>
    </shown>>
  </hidden>|<\shown>
    <tit|K-means Clustering>

    \;
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