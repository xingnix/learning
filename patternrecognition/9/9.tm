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

    <\overlays-greyed|5|5>
      <expanded|<\shown>
        \;

        <\itemize-dot>
          <overlay-from|2|<item>As well as providing a framework for building
          more complex probability distributions, mixture models can also be
          used to cluster data.|>

          <overlay-from|3|<item>considering the problem of finding clusters
          in a set of data points, which we approach first using a
          nonprobabilistic technique called the <strong|K-means> algorithm.|>

          <overlay-from|4|<item>In the latent variable view of mixture
          distributions the discrete latent variables can be interpreted as
          defining assignments of data points to specific components of the
          mixture.|>

          <overlay-from|5|<item>A general technique for finding maximum
          likelihood estimators in latent variable models is the
          expectation-maximization (EM) algorithm.|>
        </itemize-dot>
      </shown>>
    </overlays-greyed>
  </hidden>|<\hidden>
    <tit|K-means Clustering>

    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      We begin by considering the problem of identifying groups, or clusters,
      of data points in a multidimensional space.\ 
    </shown>|<\shown>
      Suppose we have a data set <math|{x<rsub|1>,\<cdots\>,x<rsub|N>}>
      consisting of <math|N> observations of a random D-dimensional Euclidean
      variable <math|x>.\ 
    </shown>|<\shown>
      Our goal is to partition the data set into some number <math|K> of
      clusters, where we shall suppose for the moment that the value of
      <math|K> is given.
    </shown>>
  </hidden>|<\hidden>
    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      Intuitively, we might think of a cluster as comprising a group of data
      points whose inter-point distances are small compared with the
      distances to points outside of the cluster. \ 
    </shown>|<\shown>
      We can formalize this notion by rst introducing a set of
      <math|D>-dimensional vectors <math|\<mu\><rsub|k>> , where <math|k=
      1,\<cdots\>,K>, in which <math|\<mu\><rsub|k>> is a prototype
      associated with the k'th cluster.
    </shown>|<\shown>
      As we shall see shortly, we can think of the \<mu\>k as representing
      the centres of the clusters.\ 
    </shown>|<\shown>
      Our goal is then to nd an assignment of data points to clusters, as
      well as a set of vectors <math|{\<mu\><rsub|k> }>, such that the sum of
      the squares of the distances of each data point to its closest vector
      <math|\<mu\><rsub|k>> , is a minimum.
    </shown>>

    \;
  </hidden>|<\hidden>
    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      \ For each data point xn , we introduce a corresponding set of binary
      indicator variables <math|r<rsub|nk>\<in\>{0, 1}>, where
      <math|k=1,\<cdots\>,K> describing which of the <math|K> clusters the
      data point <math|x<rsub|n>> is assigned to,
    </shown>|<\shown>
      \ so that if data point <math|x<rsub|n>> is assigned to cluster
      <math|k> then <math|r<rsub|n k>=1>, and <math|r<rsub|n j>=0> for
      <math|j\<neq\>k>. This is known as the <strong|1-of-K coding
      scheme<progressive-in||1s>>.
    </shown>|<\shown>
      We can then define an objective function, sometimes called a distortion
      measure, given by

      <\equation>
        J=<big|sum><rsub|n=1><rsup|N><big|sum><rsub|k=1><rsup|N>r<rsub|n
        k><around*|\<\|\|\>|\<b-x\><rsub|n>-\<b-mu\><rsub|k>|\<\|\|\>><rsup|2><progressive-in|<label|9.1>|1s>
      </equation>

      which represents the sum of the squares of the distances of each data
      point to its assigned vector <math|\<b-mu\><rsub|k>> . Our goal is to
      nd values for the <math|{r<rsub|nk>}> and the <math|{\<mu\><rsub|k>}>
      so as to minimize <math|J>.
    </shown>>
  </hidden>|<\hidden>
    <tit|K-means EM>

    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      Each iteration involves two successive steps corresponding to
      successive optimizations with respect to the rnk and the
      <math|\<mu\><rsub|k>>.\ 
    </shown>|<\shown>
      First choose some initial values for the <math|\<mu\><rsub|k>>.\ 
    </shown>|<\shown>
      Then in the rst phase we minimize <math|J> with respect to the
      <math|r<rsub|nk>> , keeping the <math|\<mu\><rsub|k>> xed.\ 
    </shown>|<\shown>
      In the second phase we minimize <math|J> with respect to the
      <math|\<mu\><rsub|k>> , keeping <math|r<rsub|nk>> xed.\ 
    </shown>|<\shown>
      This two-stage optimization is then repeated until convergence.
    </shown>|<\shown>
      We shall see that these two stages of updating <math|r<rsub|nk>> and
      updating <math|\<mu\><rsub|k>> correspond respectively to the <strong|E
      (expectation)> and <strong|M (maximization)> steps of the EM algorithm,
      and to emphasize this we shall use the terms E step and M step in the
      context of the K-means algorithm.<tiny-switch|<shown|>>
    </shown>>
  </hidden>|<\hidden>
    \;

    <\overlays-greyed|6|6>
      <overlay-from|2|Consider first the determination of the
      <math|r<rsub|nk>>.|> <overlay-from|3|Because <math|J> in Eq.
      <eqref|9.1> is a linear function of <math|r<rsub|nk>>, this
      optimization can be performed easily to give a closed form solution. |>

      <overlay-from|4|The terms involving different <math|n> are independent
      and so we can optimize for each <math|n> separately by choosing
      <math|r<rsub|nk>> to be 1 for whichever value of <math|k> gives the
      minimum value of <math|<around*|\<\|\|\>|\<b-x\><rsub|n>-\<b-mu\><rsub|j>|\<\|\|\>><rsup|2>>.|>

      \ <overlay-from|5|In other words, we simply assign the n'th data point
      to the closest cluster centre.|><overlay-from|6|More formally, this can
      be expressed as|>

      <\overlay-from|6>
        <\equation>
          r<rsub|n k>=<choice|<tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|1>|<cell|>|<cell|if
          k=argmin<rsub|j> <around*|\<\|\|\>|\<b-x\><rsub|n>-\<b-mu\><rsub|j>|\<\|\|\>><rsup|2>>>|<row|<cell|0>|<cell|>|<cell|otherwise>>>>><label|9.2>
        </equation>
      </overlay-from|>
    </overlays-greyed>
  </hidden>|<\hidden>
    <\overlays-greyed|9|9>
      \;

      <overlay-from|2|Now consider the optimization of the
      <math|\<mu\><rsub|k>> with the <math|r<rsub|nk>> held fixed.|>
      <overlay-from|3|The objective function <math|J> is a quadratic function
      of <math|\<mu\><rsub|k>>,|> <overlay-from|4|and it can be minimized by
      setting its derivative with respect to <math|\<mu\><rsub|k>> to zero
      giving|>

      <\overlay-from|5>
        <\equation>
          2<big|sum><rsub|n=1><rsup|N>r<rsub|n
          k><around*|(|x<rsub|n>-\<mu\><rsub|k>|)>=0<label|9.3>
        </equation>
      </overlay-from|>

      <\overlay-from|6>
        which we can easily solve for <math|\<mu\><rsub|k>> to give

        <\equation>
          \<b-mu\><rsub|k>=<frac|<big|sum><rsub|n>r<rsub|n
          k>\<b-x\><rsub|n>|<big|sum><rsub|n>r<rsub|n k>><label|9.4>
        </equation>
      </overlay-from|>

      <overlay-from|7|The denominator in this expression is equal to the
      number of points assigned to cluster <math|k>,|> <overlay-from|8|and so
      this result has a simple interpretation, namely set
      <math|\<mu\><rsub|k>> equal to the mean of all of the data points
      <math|x<rsub|n>> assigned to cluster <math|k>.|> <overlay-from|9|For
      this reason, the procedure is known as the <strong|K-means>
      algorithm.<progressive-in||1s>|>
    </overlays-greyed>
  </hidden>|<\shown>
    <space|8em><image|image/fig_9_1_kmeans.png|0.6par|||>
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
    <associate|9.1|<tuple|1|4>>
    <associate|9.2|<tuple|2|6>>
    <associate|9.3|<tuple|3|1>>
    <associate|9.4|<tuple|4|1>>
  </collection>
</references>