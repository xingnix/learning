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
  </hidden>|<\hidden>
    <\folded>
      <space|1em><small-figure|<image|image/fig_9_1_kmeans.png|0.55par|||>|<label|fig9.1>Illustration
      of the K-means algorithm using the re-scaled Old Faithful data set.>
    <|folded>
      \ (a) Green points denote the data set in a two-dimensional Euclidean
      space. The initial choices for centres <math|\<mu\><rsub|1>> and
      <math|\<mu\><rsub|2>> are shown by the red and blue crosses,
      respectively.\ 

      (b) In the initial E step, each data point is assigned either to the
      red cluster or to the blue cluster, according to which cluster centre
      is nearer. This is equivalent to classifying the points according to
      which side of the perpendicular bisector of the two cluster centres,
      shown by the magenta line, they lie on.\ 

      (c) In the subsequent M step, each cluster centre is re-computed to be
      the mean of the points assigned to the corresponding cluster.\ 

      (d)\U(i) show successive E and M steps through to final convergence of
      the algorithm.
    </folded>
  </hidden>|<\hidden>
    <\unfolded>
      <small-figure|<image|image/fig_9_2_kmeans_iteration.png|0.5par|||>|Plot
      of the cost function <math|J> given by Eq. <eqref|9.1> after each E
      step (blue points) and M step (red points) of the K-means algorithm for
      the example shown in Figure <reference|fig9.1>. >
    <|unfolded>
      The algorithm has converged after the third M step, and the final EM
      cycle produces no changes in either the assignments or the prototype
      vectors.
    </unfolded>
  </hidden>|<\hidden>
    <tit|Speed Up>

    \;

    \;

    <overlays-greyed|3|3|<overlay-this|2|A direct implementation of the
    K-means algorithm as discussed here can be relatively slow, because in
    each E step it is necessary to compute the Euclidean distance between
    every prototype vector and every data point. |><overlay-this|3|Various
    schemes have been proposed for speeding up the K-means algorithm, some of
    which are based on precomputing a data structure such as a tree such that
    nearby points are in the same subtree (Ramasubramanian and Paliwal, 1990;
    Moore, 2000). Other approaches make use of the triangle inequality for
    distances, thereby avoiding unnecessary dis- tance calculations (Hodgson,
    1998; Elkan, 2003)|>>
  </hidden>|<\hidden>
    <tit|stochastic algorithm>

    \;

    <\overlays-greyed|3|6>
      \ 

      <overlay-this|2|So far, we have considered a batch version of K-means
      in which the whole data set is used together to update the prototype
      vectors.|> <overlay-from|3|We can also derive an on-line stochastic
      algorithm (MacQueen, 1967) by applying the Robbins-Monro procedure to
      the problem of finding the roots of the regression function given by
      the derivatives of <math|J> in Eq. <eqref|9.1> with respect to
      <math|\<mu\><rsub|k>>. |><overlay-from|4|This leads to a sequential
      update in which, for each data point xn in turn, we update the nearest
      prototype <math|\<mu\><rsub|k>> using |>

      <\overlay-from|5>
        <\equation>
          \<b-mu\><rsub|k><rsup|new> = \<b-mu\><rsub|k><rsup|old> +
          \<eta\><rsub|n> (\<b-x\><rsub|n>\<minus\>
          \<b-mu\><rsub|k><rsup|old>) \ <label|9.5>
        </equation>
      </overlay-from|>

      <overlay-from|6|where <math|\<eta\><rsub|n>> is the learning rate
      parameter, which is typically made to decrease mono- tonically as more
      data points are considered.|>
    </overlays-greyed>
  </hidden>|<\hidden>
    <tit|Measure of Dissimilarity>

    <\overlays-greyed|5|5>
      \;

      \;

      <overlay-from|2|The K-means algorithm is based on the use of squared
      Euclidean distance as the measure of dissimilarity between a data point
      and a prototype vector. |>

      <overlay-from|3|Not only does this limit the type of data variables
      that can be considered|> <overlay-from|4|(it would be inappropriate for
      cases where some or all of the variables represent categorical labels
      for instance),|> <overlay-from|5|but it can also make the determination
      of the cluster means nonrobust to outliers. |>

      \;
    </overlays-greyed>
  </hidden>|<\hidden>
    <tit|K-medoids algorithm>

    \;

    We can generalize the K-means algorithm by introducing a more general
    dissimilarity measure <math|\<cal-V\>(x,x<rprime|'>)> between two vectors
    <math|x> and <math|x<rprime|'>> and then minimizing the following
    distortion measure

    <\equation>
      <wide|J|~>=<big|sum><rsub|n=1><rsup|N><big|sum><rsub|k=1><rsup|K>r<rsub|n
      k>\<cal-V\><around*|(|\<b-x\><rsub|n>,\<b-mu\><rsub|k>|)><label|9.6>
    </equation>

    which gives the <strong|K-medoids> algorithm. The E step again involves,
    for given cluster prototypes <math|\<mu\><rsub|k>>, assigning each data
    point to the cluster for which the dissimilarity to the corresponding
    prototype is smallest. The computational cost of this is <math|O(KN)>, as
    is the case for the standard K-means algorithm.\ 

    \;
  </hidden>|<\shown>
    \;

    For a general choice of dissimilarity measure, the M step is potentially
    more complex than for K-means, and so it is common to restrict each
    cluster prototype to be equal to one of the data vectors assigned to that
    cluster, as this allows the algorithm to be implemented for any choice of
    dissimilarity measure <math|\<cal-V\>(\<cdummy\>,\<cdummy\>)> so long as
    it can be readily evaluated.\ 

    Thus the M step involves, for each cluster <math|k>, a discrete search
    over the <math|N<rsub|k>> points assigned to that cluster, which requires
    <math|O(N<rsub|k><rsup|2>)> evaluations of
    <math|\<cal-V\>(\<cdummy\>,\<cdummy\>)>.

    <\folded>
      \;
    <|folded>
      One notable feature of the K-means algorithm is that at each iteration,
      every data point is assigned uniquely to one, and only one, of the
      clusters. Whereas some data points will be much closer to a particular
      centre <math|\<mu\><rsub|k>> than to any other centre, there may be
      other data points that lie roughly midway between cluster centres. In
      the latter case, it is not clear that the hard assignment to the
      nearest cluster is the most appropriate. We shall see in the next
      section that by adopting a probabilistic approach, we obtain `soft'
      assignments of data points to clusters in a way that reflects the level
      of uncertainty over the most appropriate assignment. This probabilistic
      formulation brings with it numerous benefits.
    </folded>
  </shown>|<\hidden>
    <tit|Image segmentation and compression>

    \;

    \;

    \;
  </hidden>|<\hidden>
    <\folded>
      <small-figure|<image|image/fig_9_3_imagesegmentation.png|0.7par|||>|Two
      examples of the application of the K-means clustering algorithm to
      image segmentation show- ing the initial images together with their
      K-means segmentations obtained using various values of K. >
    <|folded>
      \ This also illustrates of the use of vector quantization for data
      compression, in which smaller values of K give higher compression at
      the expense of poorer image quality.
    </folded>
  </hidden>>
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
    <associate|9.5|<tuple|5|?>>
    <associate|9.6|<tuple|6|?>>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|2|?>>
    <associate|auto-3|<tuple|3|?>>
    <associate|auto-4|<tuple|4|?>>
    <associate|fig9.1|<tuple|1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||Illustration of the
      K-means algorithm using the re-scaled Old Faithful data
      set.>|<pageref|auto-1>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|2>||Plot of the cost
      function <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|J>>
      given by Eq. (<reference|9.1>) after each E step (blue points) and M
      step (red points) of the K-means algorithm for the example shown in
      Figure <reference|fig9.1>. >|<pageref|auto-2>>
    </associate>
  </collection>
</auxiliary>