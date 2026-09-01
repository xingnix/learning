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
    \;

    \;

    \;

    \;

    <\padded-center>
      <section|K-means Clustering><label|section9.1>
    </padded-center>
  </hidden>|<\hidden>
    <tit|Clustering>

    \;

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
      As we shall see shortly, we can think of the <math|\<mu\><rsub|k>> as
      representing the centres of the clusters.\ 
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
      \ For each data point <math|x<rsub|n>>, we introduce a corresponding
      set of binary indicator variables <math|r<rsub|nk>\<in\>{0, 1}>, where
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
      successive optimizations with respect to the <math|r<rsub|n k>> and the
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
      <small-figure|<image|image/fig_9_2_kmeans_iteration.png|0.5par|||>|<label|fig9.2>Plot
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

    <\overlays-greyed|6|6>
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
  </hidden>|<\hidden>
    <tit|Discrete Search>

    \;

    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      For a general choice of dissimilarity measure, the M step is
      potentially more complex than for K-means, and so it is common to
      restrict each cluster prototype to be equal to one of the data vectors
      assigned to that cluster, as this allows the algorithm to be
      implemented for any choice of dissimilarity measure
      <math|\<cal-V\>(\<cdummy\>,\<cdummy\>)> so long as it can be readily
      evaluated.

      <with|gr-mode|<tuple|edit|point>|gr-frame|<tuple|scale|1cm|<tuple|0.5gw|0.5gh>>|gr-geometry|<tuple|geometry|1par|1cm|center>|gr-grid|<tuple|empty>|gr-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|empty>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-color|blue|gr-point-size|10ln|gr-opacity|20%|<graphics||<point|-1.23902|1.93443>|<point|-3.5|0>|<point|-3.2|0>|<point|-2.8|0.4>|<point|-2.8|0.4>|<point|-2.7|0>|<point|-3|0>|<point|-4|0>|<point|-4|0>|<point|-3.6|0.3>|<point|-3|-0.3>|<point|-1.8|-0.3>|<point|-1.5|0>|<with|color|red|<point|1|0.2>>|<with|color|red|<point|1.8|0.2>>|<with|color|red|<point|1.6|-0.2>>|<with|color|red|<point|0.7|-0.2>>|<with|color|red|<point|-0.4|0>>|<with|color|red|<point|-0.3|-0.3>>|<with|color|red|<point|0.2|0.3>>|<with|color|red|<point|0.3|-0.2>>|<with|color|red|opacity|20%|point-size|10ln|<point|0.7|-0.2>>|<with|color|blue|opacity|20%|point-size|10ln|<point|-3|0>>>>
    </shown>|<\shown>
      Thus the M step involves, for each cluster <math|k>, a discrete search
      over the <math|N<rsub|k>> points assigned to that cluster, which
      requires <math|O(N<rsub|k><rsup|2>)> evaluations of
      <math|\<cal-V\>(\<cdummy\>,\<cdummy\>)>.
    </shown>>

    <\unfolded>
      \;
    <|unfolded>
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
    </unfolded>
  </hidden>|<\hidden>
    <tit|Image segmentation>

    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      As an illustration of the application of the K-means algorithm, we
      consider the related problems of image segmentation and image
      compression.
    </shown>|<\shown>
      The goal of segmentation is to partition an image into regions each of
      which has a reasonably homogeneous visual appearance or which
      corresponds to objects or parts of objects (Forsyth and Ponce, 2003).\ 
    </shown>|<\shown>
      Each pixel in an image is a point in a 3-dimensional space comprising
      the intensities of the red, blue, and green channels, and our
      segmentation algorithm simply treats each pixel in the image as a
      separate data point.
    </shown>>

    \;
  </hidden>|<\hidden>
    \;

    \;

    \;

    We illustrate the result of running K-means to convergence, for any
    particular value of K, by re-drawing the image replacing each pixel
    vector with the <math|{R,G,B}> intensity triplet given by the centre
    <math|\<mu\><rsub|k>> to which that pixel has been assigned.\ 

    Results for various values of K are shown in Figure <reference|fig9.3>.
    We see that for a given value of K, the algorithm is representing the
    image using a palette of only K colours. It should be emphasized that
    this use of K-means is not a particularly sophisticated approach to image
    segmentation, not least because it takes no account of the spatial
    proximity of different pixels.
  </hidden>|<\hidden>
    <\folded>
      <small-figure|<image|image/fig_9_3_imagesegmentation.png|0.7par|||>|<label|fig9.3>Two
      examples of the application of the K-means clustering algorithm to
      image segmentation show- ing the initial images together with their
      K-means segmentations obtained using various values of K. >
    <|folded>
      \ This also illustrates of the use of vector quantization for data
      compression, in which smaller values of K give higher compression at
      the expense of poorer image quality.
    </folded>
  </hidden>|<\hidden>
    <tit|Image compression>

    \;

    \;

    <\overlays-greyed|6|6>
      <overlay-from|2|We can also use the result of a clustering algorithm to
      perform data compression.|> <overlay-from|3|It is important to
      distinguish between <strong|lossless data compression>,|>
      <overlay-from|4|in which the goal is to be able to reconstruct the
      original data exactly from the compressed representation,|>
      <overlay-from|5|and <strong|lossy data compression>,|>
      <overlay-from|6|in which we accept some errors in the reconstruction in
      return for higher levels of compression than can be achieved in the
      lossless case. |>
    </overlays-greyed>
  </hidden>|<\hidden>
    <tit|Vector quantization>

    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      We can apply the K-means algorithm to the problem of lossy data
      compression as follows.\ 
    </shown>|<\shown>
      For each of the <math|N> data points, we store only the identity
      <math|k> of the cluster to which it is assigned.
    </shown>|<\shown>
      We also store the values of the K clus- ter centres
      <math|\<mu\><rsub|k>>, which typically requires significantly less
      data, provided we choose <math|K\<ll\>N>.
    </shown>|<\shown>
      Each data point is then approximated by its nearest centre
      <math|\<mu\><rsub|k>>.
    </shown>|<\shown>
      New data points can similarly be compressed by first finding the
      nearest <math|\<mu\><rsub|k>> and then storing the label k instead of
      the original data vector.
    </shown>|<\shown>
      This framework is often called vector quantization, and the vectors
      <math|\<mu\><rsub|k>> are called <strong|code-book vectors>.
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Compression illustration>

    \;

    <\overlays-greyed|11|11>
      <overlay-from|2|The image segmentation problem discussed above also
      provides an illustration of the use of clustering for data compression.
      |>

      <overlay-from|3|Suppose the original image has <math|N> pixels
      comprising <math|{R,G,B}> values each of which is stored with 8 bits of
      precision. |><overlay-from|4|Then to transmit the whole image directly
      would cost <math|24N> bits.|>\ 

      <overlay-from|5|Now suppose we first run K-means on the image data,|>
      <overlay-from|6|and then instead of transmitting the original pixel
      intensity vectors we transmit the identity of the nearest vector
      <math|\<mu\><rsub|k>>. |><overlay-from|7|Because there are K such
      vectors, this requires <math|log<rsub|2>K> bits per
      pixel.|><overlay-from|8| We must also transmit the K code book vectors
      <math|\<mu\><rsub|k>>, |><overlay-from|9|which requires 24K bits,|>
      <overlay-from|10|and so the total number of bits required to transmit
      the image is <math|24K+N log<rsub|2>K>|> <overlay-from|11|(rounding up
      to the nearest integer).|>
    </overlays-greyed>

    \;
  </hidden>|<\hidden>
    <tit|Example Result>

    <unroll-greyed|<\shown>
      \;
    </shown>|<\shown>
      The original image shown in Figure <reference|9.3> has
      <math|240\<times\>180=43,200> pixels and so requires
      <math|24\<times\>43,200=1,036,800> bits to transmit directly.
    </shown>|<\shown>
      By comparison, the compressed images require 43,248 bits (K = 2),
      86,472 bits (K = 3), and 173, 040 bits (K = 10), respectively, to
      transmit.
    </shown>|<\shown>
      These represent compression ratios compared to the original image of
      4.2%, 8.3%, and 16.7%, respectively.\ 
    </shown>>

    <\unfolded>
      \;
    <|unfolded>
      We see that there is a trade-off between degree of compression and
      image quality. Note that our aim in this example is to illustrate the
      K-means algorithm. If we had been aiming to produce a good image
      compressor, then it would be more fruitful to consider small blocks of
      adjacent pixels, for instance 5\<times\>5, and thereby exploit the
      correlations that exist in natural images between nearby pixels.
    </unfolded>
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    <\padded-center>
      <section|Mixtures of Gaussians><label|section9.2>
    </padded-center>
  </hidden>|<\hidden>
    <active*|>

    Now turn to a formulation of Gaussian mixtures in terms of discrete
    latent variables.\ 

    This will provide us with a deeper insight into this important
    distribution, and will also serve to motivate the
    Expectation-Maximization algorithm.\ 

    The Gaussian mixture distribution can be written as a linear
    superposition of Gaussians in the form\ 

    <\equation>
      p(\<b-x\>)=<big|sum><rsub|k=1><rsup|K>\<pi\><rsub|k>\<cal-N\>(\<b-x\>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>).<label|9.7>
    </equation>
  </hidden>|<\hidden>
    Let us introduce a K-dimensional binary random variable z having a 1-of-K
    representation in which a particular element <math|z<rsub|k>> is equal to
    1 and all other elements are equal to 0.\ 

    The values of <math|z<rsub|k>> therefore satisfy
    <math|z<rsub|k>\<in\>{0,1}> and <math|<big|sum><rsub|k>z<rsub|k>=1>, and
    we see that there are K possible states for the vector z according to
    which element is nonzero.\ 

    We shall define the joint distribution <math|p(x,z)> in terms of a
    marginal distribution <math|p(\<b-z\>)> and a conditional distribution
    <math|p(\<b-x\>\|\<b-z\>)>, corresponding to the graphical model in
    Figure <reference|fig9.4>.

    <\small-figure|<image|image/fig_9_4_mixture.png|50pt|||>>
      <label|fig9.4>Graphical representation of a mixture model, in which the
      joint distribution is expressed in the form <math|p(x,z) =
      p(z)p(x\|z)>.
    </small-figure>
  </hidden>|<\hidden>
    The marginal distribution over <math|z> is specified in terms of the
    mixing coefficients <math|\<pi\><rsub|k>>, such that\ 

    <\equation*>
      p(z<rsub|k> =1)=\<pi\><rsub|k>
    </equation*>

    where the parameters <math|{\<pi\><rsub|k>}> must satisfy

    <\equation*>
      0\<leqslant\>\<pi\><rsub|k>\<leqslant\>1
    </equation*>

    together with

    <\equation>
      <big|sum><rsub|k=1><rsup|K>\<pi\><rsub|k>=1<label|9.9>
    </equation>

    in order to be valid probabilities. Because z uses a 1-of-K
    representation, we can also write this distribution in the form

    <\equation>
      p<around*|(|\<b-z\>|)>=<big|prod><rsub|k=1><rsup|K>\<pi\><rsub|k><rsup|z<rsub|k>><label|9.10>
    </equation>
  </hidden>|<\hidden>
    \;

    \;

    Similarly, the conditional distribution of <math|\<b-x\>> given a
    particular value for <math|\<b-z\>> is a Gaussian\ 

    <\equation*>
      p(\<b-x\>\|z<rsub|k>=1) = \<cal-N\>(\<b-x\>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>)
    </equation*>

    which can also be written in the form

    <\equation>
      p<around*|(|\<b-x\><around*|\||\<b-z\>|\<nobracket\>>|)>=<big|prod><rsub|k=1><rsup|K>\<cal-N\><around*|(|\<b-x\><around*|\||\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|\<nobracket\>>|)><rsup|z<rsub|k>><label|9.11>
    </equation>
  </hidden>|<\hidden>
    \;

    \;

    The joint distribution is given by <math|p(z)p(x\|z)>, and the marginal
    distribution of <math|x> is then obtained by summing the joint
    distribution over all possible states of <math|z> to give

    <\equation*>
      p(\<b-x\>) = <big|sum><rsub|z>p(z)p(x\|z)
      =<big|sum><rsub|k=1><rsup|K>\<pi\><rsub|k>\<cal-N\><around*|(|\<b-x\>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>
    </equation*>

    where we have made use of <eqref|9.10> and <eqref|9.11>. Thus the
    marginal distribution of <math|x> is a Gaussian mixture of the form
    <eqref|9.7>.\ 

    If we have several observations <math|x<rsub|1>,\<cdots\>,x<rsub|N>>,
    then, because we have represented the marginal distribution in the form
    <math|p(x)=<big|sum><rsub|z>p(x,z)>, it follows that for every observed
    data point <math|x<rsub|n>> there is a corresponding latent variable
    <math|z<rsub|n>>.
  </hidden>|<\hidden>
    \ we are now able to work with the joint distribution <math|p(x, z)>
    instead of the marginal distribution <math|p(x)>, and this will lead to
    signicant simplications, most notably through the introduction of the
    expectation-maximization (EM) algorithm.

    Another quantity that will play an important role is the conditional
    probability of <math|z> given <math|x>. We shall use
    <math|\<gamma\>(z<rsub|k>)> to denote <math|p(z<rsub|k>= 1\|x)>, whose
    value can be found using Bayes' theorem

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<gamma\>\<equiv\>p<around*|(|z<rsub|k>=1<around*|\||x|\<nobracket\>>|)>>|<cell|=>|<cell|<frac|p<around*|(|z<rsub|k>=1|)>p<around*|(|x<around*|\||z<rsub|k>=1|\<nobracket\>>|)>|<big|sum><rsub|j=1><rsup|K>p<around*|(|z<rsub|j>=1|)>p<around*|(|x<around*|\||z<rsub|j>=1|\<nobracket\>>|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<pi\><rsub|k>\<cal-N\><around*|(|x<around*|\||\<mu\><rsub|k>,\<Sigma\><rsub|k>|\<nobracket\>>|)>|<big|sum><rsub|j=1><rsup|K>\<pi\><rsub|j>\<cal-N\><around*|(|x<around*|\||\<mu\><rsub|j>,\<Sigma\><rsub|j>|\<nobracket\>>|)>><eq-number><label|9.13>>>>>
    </eqnarray*>

    We shall view <math|\<pi\><rsub|k>> as the prior probability of
    <math|z<rsub|k> = 1>, and the quantity <math|\<gamma\>(z<rsub|k>)> as the
    corresponding posterior probability once we have observed <math|x>. As we
    shall see later, <math|\<gamma\>(z<rsub|k>)> can also be viewed as the
    responsibility that component <math|k> takes for `explaining' the
    observation <math|x>.
  </hidden>|<\hidden>
    <\small-figure|<image|image/fig_9_5_mixture_gaussion_sample.png|0.9par|||>>
      <label|fig9.5> Example of 500 points drawn from the mixture of 3
      Gaussians shown in Figure 2.23. (a) Samples from the joint distribution
      <math|p(z)p(x\|z)> in which the three states of <math|z>, corresponding
      to the three components of the mixture, are depicted in red, green, and
      blue, and (b) the corresponding samples from the marginal distribution
      <math|p(x)>, which is obtained by simply ignoring the values of
      <math|z> and just plotting the <math|x> values. The data set in (a) is
      said to be complete, whereas that in (b) is incomplete. (c) The same
      samples in which the colours represent the value of the
      responsibilities <math|\<gamma\>(z<rsub|n k>)> associated with data
      point xn, obtained by plotting the corresponding point using
      proportions of red, blue, and green ink given by
      <math|\<gamma\>(z<rsub|n k>)> for <math|k = 1,2,3>, respectively
    </small-figure>

    \;
  </hidden>|<\hidden>
    <tit|Maximum likelihood>

    Suppose we have a data set of observations
    <math|{x<rsub|1>,\<cdots\>,x<rsub|N>}>, and we wish to model this data
    using a mixture of Gaussians.\ 

    We can represent this data set as an N\<times\>D matrix <math|X> in which
    the nth row is given by <math|\<b-x\><rsup|T><rsub|n>> .\ 

    Similarly, the corresponding latent variables will be denoted by an
    N\<times\>K matrix <math|Z> with rows <math|\<b-z\><rsup|T><rsub|n>> .\ 

    f we assume that the data points are drawn independently from the
    distribution, then we can express the Gaussian mixture model for this
    i.i.d. data set using the graphical representation in Figure
    <reference|fig9.6>.
  </hidden>|<\hidden>
    \;

    I

    <small-figure|<image|image/fig_9_6_mixture_gaussion_n.png|0.3par|||>|<label|fig9.6>Graphical
    representation of a Gaussian mixture model for a set of <math|N> i.i.d.
    data points <math|{x<rsub|n>}>, with corresponding <math|\<pi\>> latent
    points <math|{z<rsub|n>}>, where <math|n = 1,...,N>.>
  </hidden>|<\hidden>
    \;

    \;

    \;

    From Eq. <eqref|9.7> the log of the likelihood function is given by

    <\equation>
      ln p<around*|(|X\|\<b-pi\>,\<b-mu\>,\<b-Sigma\>|)>=<big|sum><rsub|n=1><rsup|N>ln<around*|{|<big|sum><rsub|k=1><rsup|K>\<pi\><rsub|k>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>|}><label|9.14>
    </equation>
  </hidden>|<\hidden>
    \;

    <small-figure|<image|image/fig_9_7_mixture_gaussion_singularity.png|0.5par|||>|Illustration
    of how singularities in the likelihood function arise with mixtures of
    Gaussians. This should be compared with the case of a single Gaussian
    shown in Figure 1.14 for which no singularities arise.>
  </hidden>|<\hidden>
    <tit|EM for Gaussian mixtures>

    An elegant and powerful method for finding maximum likelihood solutions
    for models with latent variables is called the expectation-maximization
    algorithm, or EM algorithm (Dempster et al., 1977; McLachlan and
    Krishnan, 1997).

    Later we shall give a general treatment of EM, and we shall also show how
    EM can be generalized to obtain the variational inference framework.\ 

    Initially, we shall motivate the EM algorithm by giving a relatively
    informal treatment in the context of the Gaussian mixture model.\ 

    We emphasize, however, that EM has broad applicability, and indeed it
    will be encountered in the context of a variety of different models in
    this book.
  </hidden>|<\hidden>
    <tit|<math|\<b-mu\><rsub|k>>>

    Let us begin by writing down the conditions that must be satisfied at a
    maximum of the likelihood function.\ 

    Setting the derivatives of <math|ln p(X\|\<pi\>, \<mu\>, \<Sigma\>)> in
    Eq. <eqref|9.14> with respect to the means <math|\<b-mu\><rsub|k>> of the
    Gaussian components to zero, we obtain\ 

    <\equation*>
      0=-<big|sum><rsub|n=1><rsup|N><with|color|magenta|<wide*|<with|color|<pattern|/Applications/TeXmacs.app/Contents/Resources/share/TeXmacs/misc/patterns/vintage/granite-dark.png||>|<frac|\<pi\>
      <rsub|k<rsub| >>\<cal-N\> ( x<rsub|n>
      \|\<mu\><rsub|k>,\<Sigma\><rsub|k>)|<big|sum><rsub|j>\<pi\><rsub|j>\<cal-N\>(x<rsub|n>\|\<mu\><rsub|j>,\<Sigma\><rsub|j>)>>|\<wide-underbrace\>><rsub|<with|color|magenta|\<gamma\><around*|(|z<rsub|n
      k>|)>>>>\<Sigma\><rsub|k>(\<b-x\><rsub|n> \<minus\>\<b-mu\><rsub|k>)
    </equation*>

    where we have made use of the form (2.43) for the Gaussian distribution.
    Note that the posterior probabilities, or responsibilities, given by Eq.
    <eqref|9.13> appear naturally on the right-hand side.\ 
  </hidden>|<\hidden>
    \;

    Multiplying by <math|\<Sigma\><rsup|-1>> (which we assume to be
    nonsingular) and rearranging we obtain

    <\equation>
      \<b-mu\><rsub|k>=<frac|1|N<rsub|k>><big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|z<rsub|n
      k>|)>\<b-x\><rsub|n><label|9.17>
    </equation>

    where

    <\equation>
      N<rsub|k>=<big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|<rsub|Z<rsub|n
      k>>|)>.<label|9.18>
    </equation>

    We can interpret <math|N<rsub|k>> as the effective number of points
    assigned to cluster <math|k>. Note carefully the form of this solution.
    We see that the mean <math|\<mu\><rsub|k>> for the k'th Gaussian
    component is obtained by taking a weighted mean of all of the points in
    the data set, in which the weighting factor for data point
    <math|x<rsub|n>> is given by the posterior probability
    <math|\<gamma\>(z<rsub|n k>)> that component <math|k> was responsible for
    generating <math|x<rsub|n>>.
  </hidden>|<\hidden>
    <tit|<math|\<Sigma\><rsub|k>>>

    If we set the derivative of <math|ln p(X\|\<pi\>,\<mu\>,\<Sigma\>)> with
    respect to <math|\<Sigma\><rsub|k>> to zero, and follow a similar line of
    reasoning, making use of the result for the maximum likelihood solution
    for the covariance matrix of a single Gaussian, we obtain\ 

    <\equation>
      \<Sigma\><rsub|k>=<frac|1|N<rsub|k>><big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|z<rsub|n
      k>|)><around*|(|\<b-x\><rsub|n>-\<b-mu\><rsub|k>|)><around*|(|\<b-x\><rsub|n>-\<b-mu\><rsub|k>|)><rsup|T><label|9.19>
    </equation>

    which has the same form as the corresponding result for a single Gaussian
    fitted to the data set, but again with each data point weighted by the
    corresponding posterior probability and with the denominator given by the
    effective number of points associated with the corresponding component.
  </hidden>|<\hidden>
    <tit|<math|\<pi\><rsub|k>>>

    Finally, we maximize ln <math|p(X\|\<pi\>, \<mu\>, \<Sigma\>)> with
    respect to the mixing coefficients <math|\<pi\><rsub|k>>. Here we must
    take account of the constraint <eqref|9.9>, which requires the mixing
    coefficients to sum to one. This can be achieved using a Lagrange
    multiplier and maximizing the following quantity

    <\equation*>
      ln p<around*|(|X\|\<pi\>,\<b-mu\>,\<b-Sigma\>|)>+\<lambda\><around*|(|<big|sum><rsub|k=1><rsup|K>\<pi\><rsub|k>-1|)>
    </equation*>

    which gives

    <\folded>
      <\equation*>
        0=<big|sum><rsub|n=1><rsup|N><frac|\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>|<big|sum><rsub|j>\<pi\><rsub|j>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|j>,\<b-Sigma\><rsub|j>|)>>+\<lambda\>
      </equation*>
    <|folded>
      <\eqnarray*>
        <tformat|<table|<row|<cell|0>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N><frac|\<pi\><rsub|k>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>|<big|sum><rsub|j>\<pi\><rsub|j>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|j>,\<b-Sigma\><rsub|j>|)>>+\<lambda\>\<pi\><rsub|k>>>|<row|<cell|0>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N><big|sum><rsub|k=1><rsup|K><frac|\<pi\><rsub|k>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>|<big|sum><rsub|j>\<pi\><rsub|j>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|j>,\<b-Sigma\><rsub|j>|)>>+\<lambda\><big|sum><rsub|k=1><rsup|K>\<pi\><rsub|k>>>|<row|<cell|0>|<cell|=>|<cell|N+\<lambda\>>>>>
      </eqnarray*>
    </folded>

    where again we see the appearance of the responsibilities.\ 
  </hidden>|<\hidden>
    \;

    If we now multiply both sides by <math|\<pi\><rsub|k>> and sum over
    <math|k> making use of the constraint Eq. <eqref|9.9>, we find
    <math|\<lambda\>=\<minus\>N>. Using this to eliminate <math|\<lambda\>>
    and rearranging we obtain\ 

    <\folded>
      <\equation>
        \<pi\><rsub|k> = <frac|N<rsub|k>|N><label|9.22>
      </equation>
    <|folded>
      <\eqnarray*>
        <tformat|<table|<row|<cell|0>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N><frac|\<pi\><rsub|k>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>|<big|sum><rsub|j>\<pi\><rsub|j>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|j>,\<b-Sigma\><rsub|j>|)>>+\<lambda\>\<pi\><rsub|k>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|z<rsub|n
        k>|)>-N\<pi\><rsub|k>>>|<row|<cell|>|<cell|=>|<cell|N<rsub|k>-N\<pi\><rsub|k>>>>>
      </eqnarray*>
    </folded>

    \;
  </hidden>|<\hidden>
    <tit|EM algorithm>

    It is worth emphasizing that the results Eq. <eqref|9.17>, Eq.
    <eqref|9.19>, and Eq. <eqref|9.22> do not constitute a closed-form
    solution for the parameters of the mixture model because the
    responsibilities <math|\<gamma\>(z<rsub|n k>)> depend on those parameters
    in a complex way through <eqref|9.13>.\ 

    However, these results do suggest a simple iterative scheme for finding a
    solution to the maximum likelihood problem, which as we shall see turns
    out to be an instance of the EM algorithm for the particular case of the
    Gaussian mixture model.\ 

    \;
  </hidden>|<\hidden>
    \;

    We first choose some initial values for the means, covariances, and
    mixing coefficients.\ 

    Then we alternate between the following two updates that we shall call
    the E step and the M step, for reasons that will become apparent shortly.\ 

    In the expectation step, or E step, we use the current values for the
    parameters to evaluate the posterior probabilities, or responsibilities,
    given by <eqref|9.13>.\ 

    We then use these probabilities in the maximization step, or M step, to
    re-estimate the means, covariances, and mix- ing coefficients using the
    results Eq. <eqref|9.17>, Eq. <eqref|9.19>, and Eq. <eqref|9.22>.\ 

    Note that in so doing we first evaluate the new means using Eq.
    <eqref|9.17> and then use these new values to find the covariances using
    Eq. <eqref|9.19>, in keeping with the corresponding result for a single
    Gaussian distribution.
  </hidden>|<\hidden>
    <\folded>
      <\small-figure|<image|image/fig_9_8_mixture_gaussion_EM.png|0.65par|||>>
        Illustration of the EM algorithm using the Old Faithful set as used
        for the illustration of the K-means algorithm in Figure
        <reference|fig9.1>.
      </small-figure>
    <|folded>
      Gaussian components are shown as blue and red circles. Plot (b) shows
      the result of the initial E step, in which each data point is depicted
      using a proportion of blue ink equal to the posterior probability of
      having been generated from the blue com- ponent, and a corresponding
      proportion of red ink given by the posterior probability of having been
      generated by the red component. Thus, points that have a significant
      probability for belonging to either cluster appear purple. The
      situation after the first M step is shown in plot (c), in which the
      mean of the blue Gaussian has moved to the mean of the data set,
      weighted by the probabilities of each data point belonging to the blue
      cluster, in other words it has moved to the centre of mass of the blue
      ink. Similarly, the covariance of the blue Gaussian is set equal to the
      covariance of the blue ink. Analogous results hold for the red
      component. Plots (d), (e), and (f) show the results after 2, 5, and 20
      complete cycles of EM, respectively. In plot (f) the algorithm is close
      to convergence.
    </folded>
  </hidden>|<\hidden>
    <tit|EM for Gaussian Mixtures>

    Given a Gaussian mixture model, the goal is to maximize the likelihood
    function with respect to the parameters (comprising the means and
    covariances of the components and the mixing coefficients).

    <\folded>
      1. Initialize the means <math|\<b-mu\><rsub|k>> , covariances
      <math|\<b-Sigma\><rsub|k>> and mixing coeffïcients
      <math|\<pi\><rsub|k>>,\ 
    <|folded>
      and evaluate the initial value of the log likelihood.
    </folded>

    <\folded>
      2. E step. Evaluate the responsibilities using the current parameter
      values
    <|folded>
      <\equation*>
        \<gamma\><around*|(|z<rsub|n k>|)>=<tfrac|\<pi\><rsub|k>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>|<big|sum><rsub|j=1><rsup|N>\<pi\><rsub|j>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|j>,\<b-Sigma\><rsub|j>|)>>
      </equation*>
    </folded>

    <\folded>
      3. M step. Re-estimate the parameters using the current
      responsibilities
    <|folded>
      <\eqnarray*>
        <tformat|<table|<row|<cell|\<b-mu\><rsub|k><rsup|new>>|<cell|=>|<cell|<frac|1|N<rsub|k>><big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|z<rsub|n
        k>|)>\<b-x\><rsub|n>>>|<row|<cell|\<b-Sigma\><rsub|k><rsup|new>>|<cell|=>|<cell|<frac|1|N<rsub|k>><big|sum><rsub|n=1><rsup|K>\<gamma\><around*|(|z<rsub|n
        k>|)><around*|(|\<b-x\><rsub|n>-\<b-mu\><rsub|k><rsup|new>|)><around*|(|\<b-x\><rsub|n>-\<b-mu\><rsub|k><rsup|new>|)><rsup|T>>>|<row|<cell|\<pi\><rsub|k><rsup|new>>|<cell|=>|<cell|<frac|N<rsub|k>|N>>>>>
      </eqnarray*>

      where

      <\equation*>
        N<rsub|k>=<big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|z<rsub|n
        k>|)>
      </equation*>
    </folded>

    <\folded>
      4. Evaluate the log likelihood
    <|folded>
      <\equation*>
        ln p<around*|(|X\|\<b-mu\>,\<b-Sigma\>,\<b-pi\>|)>=<big|sum><rsub|n=1><rsup|N>ln<around*|{|<big|sum><rsub|k=1><rsup|K>\<pi\><rsub|k>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>|}>
      </equation*>
    </folded>

    <\folded>
      5. Check for convergence of either the parameters or the log
      likelihood.
    <|folded>
      If the convergence criterion is not satisfied return to step 2.
    </folded>

    \ 
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    <\padded-center>
      <section|An Alternative View of EM><label|section9.3>
    </padded-center>
  </hidden>|<\hidden>
    The goal of the EM algorithm is to find maximum likelihood solutions for
    models having latent variables.\ 

    We denote the set of all observed data by <math|X>, in which the n'th row
    represents <math|\<b-x\><rsub|n><rsup|T>>, and similarly we denote the
    set of all latent variables by <math|Z>, with a corresponding row
    <math|z<rsup|T><rsub|n>> . The set of all model parameters is denoted by
    <math|\<b-theta\>> and so the log likelihood function is given by

    <\equation*>
      ln p(X\|\<b-theta\>) = ln<big|sum><rsub|Z>p(X, Z\|\<b-theta\>) .
    </equation*>

    Note that our discussion will apply equally well to continuous latent
    variables simply by replacing the sum over <math|Z> with an integral.

    A key observation is that the summation over the latent variables appears
    inside the logarithm. Even if the joint distribution
    <math|p(X,Z\|\<theta\>)> belongs to the exponential family, the marginal
    distribution <math|p(X\|\<theta\>)> typically does not as a result of
    this summation. The presence of the sum prevents the logarithm from
    acting directly on the joint distribution, resulting in complicated
    expressions for the maximum likelihood solution.
  </hidden>|<\hidden>
    Now suppose that, for each observation in <math|X>, we were told the
    corresponding value of the latent variable <math|Z>. We shall call
    <math|{X, Z}> the complete data set, and we shall refer to the actual
    observed data <math|X> as incomplete, as illustrated in Figure
    <reference|fig9.5>. The likelihood function for the complete data set
    simply takes the form <math|ln p(X,Z\|\<theta\>)>, and we shall suppose
    that maximization of this complete-data log likelihood function is
    straightforward.

    In practice, however, we are not given the complete data set
    <math|{X,Z}>, but only the incomplete data <math|X>. Our state of
    knowledge of the values of the latent variables in <math|Z> is given only
    by the posterior distribution <math|p(Z\|X,\<theta\>)>.\ 

    Because we cannot use the complete-data log likelihood, we consider
    instead its expected value under the posterior distribution of the latent
    variable, which corresponds (as we shall see) to the E step of the EM
    algorithm.

    In the subsequent M step, we maximize this expectation.\ 

    If the current estimate for the parameters is denoted
    <math|\<theta\><rsup|old>>, then a pair of successive E and M steps gives
    rise to a revised estimate <math|<math|\<theta\>><rsup|new>> .\ 

    The algorithm is initialized bychoosing some starting value for the
    parameters <math|\<theta\><rsub|0>> .
  </hidden>|<\hidden>
    In the E step, we use the current parameter values
    <math|\<b-theta\><rsup|old>> to find the posterior distribution of the
    latent variables given by <math|p(Z\|X, \<b-theta\><rsup|old>)>. We then
    use this posterior distribution to find the expectation of the
    complete-data log likelihood evaluated for some general parameter value
    <math|\<b-theta\>>. This expectation, denoted
    <math|\<cal-Q\>(\<b-theta\>,\<b-theta\><rsup|old>)>, is given by

    <\equation*>
      \<cal-Q\><around*|(|\<b-theta\>,\<b-theta\><rsup|old>|)>=<big|sum><rsub|z>p<around*|(|Z\|X,\<b-theta\><rsup|old>|)>ln
      p<around*|(|X,Z\|\<b-theta\>|)>
    </equation*>

    In the M step, we determine the revised parameter estimate
    <math|\<b-theta\><rsup|new>> by maximizing this function

    <\equation*>
      \<b-theta\><rsup|new>=arg max<rsub|\<b-theta\>>
      \<cal-Q\><around*|(|\<b-theta\>,\<b-theta\><rsup|old>|)>
    </equation*>

    Note that in the definition of <math|\<cal-Q\><around*|(|\<b-theta\>,\<b-theta\><rsup|old>|)>>,
    the logarithm acts directly on the joint distribution <math|p(X,
    Z\|\<b-theta\>)>, and so the corresponding M-step maximization will, by
    supposition, be tractable.
  </hidden>|<\hidden>
    <tit|The General EM Algorithm>

    Given a joint distribution <math|p(X,Z\|\<theta\>)> over observed
    variables <math|X> and latent variables <math|Z>, governed by parameters
    \<theta\>, the goal is to maximize the likelihood function
    <math|p(X\|\<theta\>)> with respect to <math|\<theta\>>.

    <hspace|3.5ex>1. Choose an initial setting for the parameters
    <math|\<b-theta\><rsup|old>>.

    <hspace|3.5ex>2. E step Evaluate <math|p(Z\|X,\<b-theta\><rsup|old>)>.

    <\folded-std>
      3. M step Evaluate <math|\<b-theta\><rsup|new>>
    <|folded-std>
      <\equation*>
        \<b-theta\><rsup|new>=arg max<rsub|\<theta\>>\<cal-Q\><around*|(|\<b-theta\>,\<b-theta\><rsup|old>|)>
      </equation*>

      where

      <\equation*>
        \<cal-Q\><around*|(|\<b-theta\>,\<b-theta\><rsup|old>|)>=<big|sum><rsub|Z>p<around*|(|Z\|X,\<b-theta\><rsup|<rsup|old>>|)>ln
        p<around*|(|X,Z\|\<b-theta\>|)>
      </equation*>
    </folded-std>

    <\folded>
      4. Check for convergence of either the log likelihood or the parameter
      values.
    <|folded>
      If the convergence criterion is not satisfied, then let

      <\equation*>
        \<b-theta\><rsup|old>\<leftarrow\>\<b-theta\><rsup|new>
      </equation*>

      and return to step 2.
    </folded>

    \;
  </hidden>|<\hidden>
    <tit| Gaussian mixtures revisited>

    <\padded-center>
      <\small-figure|<image|image/fig_9_9_mixture_gaussion_complete_data.png|.3par|||>>
        This shows the same graph as in Figure <reference|fig9.6> except that
        we now suppose that the discrete variables <math|z<rsub|n>> are
        observed, as well as the data variables <math|x<rsub|n>>.
      </small-figure>
    </padded-center>
  </hidden>|<\hidden>
    <tit|likelihood for the complete data set>

    \;

    Now consider the problem of maximizing the likelihood for the complete
    data set <math|{X,Z}>. From Eq. <eqref|9.10> and Eq. <eqref|9.11>, this
    likelihood function takes the form

    <\equation*>
      p<around*|(|X,Z\|\<b-mu\>,\<b-Sigma\>,\<b-pi\>|)>=<big|prod><rsub|n=1><rsup|N><big|prod><rsub|k=1><rsup|K>\<pi\><rsub|k><rsup|z<rsub|n
      k>>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)><rsup|z<rsub|n
      k>>
    </equation*>

    where <math|z<rsub|nk>> denotes the k'th component of <math|z<rsub|n>> .
    Taking the logarithm, we obtain

    <\equation*>
      ln p<around*|(|X,Z\|\<b-mu\>,\<b-Sigma\>,\<b-pi\>|)>=<big|sum><rsub|n=1><rsup|N><big|sum><rsub|k=1><rsup|K>z<rsub|n
      k><around*|{|ln \<pi\><rsub|k>+ln\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>|}>
    </equation*>

    which can be maximized trivially in closed form.
  </hidden>|<\hidden>
    <tit|posterior distribution of the latent variables>

    \;

    Consider the expectation, with respect to the posterior distribution of
    the latent variables, of the complete-data log likelihood.

    <\folded>
      <\equation*>
        p<around*|(|Z\|X,\<b-mu\>,\<b-Sigma\>,\<b-pi\>|)>\<propto\><big|prod><rsub|n=1><rsup|N><big|prod><rsub|k=1><rsup|K><around*|[|\<pi\><rsub|k>\<cal-N\><around*|(|x<rsub|n>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>|]><rsup|z<rsub|n
        k>>
      </equation*>
    <|folded>
      \;

      <\eqnarray*>
        <tformat|<table|<row|<cell|p<around*|(|z\|x|)>>|<cell|=>|<cell|<frac|p<around*|(|x,z|)>|p<around*|(|x|)>>>>|<row|<cell|>|<cell|\<propto\>>|<cell|p<around*|(|x,z|)>>>>>
      </eqnarray*>
    </folded>

    \;

    For each n, there is

    <\equation*>
      p<around*|(|\<b-z\><rsub|n>\|X,\<b-mu\>,\<b-Sigma\>,\<b-pi\>|)>\<propto\><big|prod><rsub|k=1><rsup|K><around*|[|\<pi\><rsub|k>\<cal-N\><around*|(|x<rsub|n>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>|]><rsup|z<rsub|n
      k>>
    </equation*>
  </hidden>|<\hidden>
    <tit|<math|\<bbb-E\><around*|[|z<rsub|n k>|]>>>

    The expected value of the indicator variable <math|z<rsub|nk>> under this
    posterior distribution is then given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|z<rsub|nk>|]>>|<cell|=>|<cell|<frac|<around*|[|<big|sum><rsub|\<b-z\><rsub|n>>\<b-z\><rsub|n>p<around*|(|\<b-z\><rsub|n>\|X,\<b-mu\>,\<b-Sigma\>,\<b-pi\>|)>|]><rsub|k>|<big|sum><rsub|\<b-z\><rsub|n>>p<around*|(|\<b-z\><rsub|n>\|X,\<b-mu\>,\<b-Sigma\>,\<b-pi\>|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|<around*|{|<big|sum><rsub|\<b-z\><rsub|n>>\<b-z\><rsub|n><big|prod><rsub|k=1><rsup|K><around*|[|\<pi\><rsub|k>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>|]><rsup|<rsup|<rsub|z<rsub|nk>>>>|}><rsub|k>|<big|sum><rsub|\<b-z\><rsub|n>><big|prod><rsub|j=1><rsup|K><around*|[|\<pi\><rsub|j>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|j>,\<b-Sigma\><rsub|j>|)>|]><rsup|z<rsub|nj>>>>>|<row|<cell|>|<cell|=>|<cell|<frac|<around*|[|\<pi\><rsub|k>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>|]><rsup|<rsup|<rsub|z<rsub|nk>>>>|<big|sum><rsub|j=1><rsup|K><around*|[|\<pi\><rsub|j>\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|j>,\<b-Sigma\><rsub|j>|)>|]><rsup|z<rsub|nj>>>>>|<row|<cell|>|<cell|=>|<cell|\<gamma\><around*|(|z<rsub|nk>|)>>>>>
    </eqnarray*>

    which is just the responsibility of component k for data point
    <math|\<b-x\><rsub|n>>.
  </hidden>|<\hidden>
    The expected value of the complete-data log likelihood function is
    therefore given by

    <\equation>
      \<bbb-E\><rsub|Z><around*|[|ln p<around*|(|X,Z\|\<b-mu\>,\<b-Sigma\>,\<b-pi\>|)>|]>=<big|sum><rsub|n=1><rsup|N><big|sum><rsub|k=1><rsup|K>\<gamma\><around*|(|z<rsub|n
      k>|)><around*|{|ln \<pi\><rsub|k>+ln\<cal-N\><around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>|}><label|9.40>
    </equation>

    We can now proceed as follows. First we choose some initial values for
    the parameters <math|\<b-mu\><rsup|old>> , <math|\<b-Sigma\><rsup|old>>
    and <math|\<b-pi\><rsup|old>> , and use these to evaluate the
    responsibilities (the E step). We then keep the responsibilities xed and
    maximize Eq. <eqref|9.40> with respect to <math|\<mu\><rsup|k>>,<math|
    \<Sigma\><rsup|k>> and <math|\<pi\><rsup|k>> (the M step). This leads to
    closed form solutions for <math|\<mu\><rsup|new>> ,
    <math|\<Sigma\><rsup|new>> and <math|\<pi\><rsup|new>> given by Eq.
    <eqref|9.17>, <eqref|9.19>, and <eqref|9.22> as before. This is precisely
    the EM algorithm for Gaussian mixtures as derived earlier.
  </hidden>|<\hidden>
    <tit|Relation to K-means>

    Comparison of the K-means algorithm with the EM algorithm for Gaussian
    mixtures shows that there is a close similarity. Whereas the K-means
    algorithm performs a hard assignment of data points to clusters, in which
    each data point is associated uniquely with one cluster, the EM algorithm
    makes a soft assignment based on the posterior probabilities. In fact, we
    can derive the K-means algorithm as a particular limit of EM for Gaussian
    mixtures as follows.
  </hidden>|<\hidden>
    Consider a Gaussian mixture model in which the covariance matrices of the
    mixture components are given by <math|\<varepsilon\>I>, where
    <math|\<varepsilon\>> is a variance parameter that is shared by all of
    the components, and <math|I> is the identity matrix, so that

    <\equation*>
      p<around*|(|\<b-x\>\|\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>=<frac|1|<around*|(|2\<pi\>\<varepsilon\>|)><rsup|1/2>>exp<around*|{|-<frac|1|2\<varepsilon\>><around*|\<\|\|\>|\<b-x\>-\<b-mu\><rsub|k>|\<\|\|\>><rsup|2>|}>
    </equation*>

    We now consider the EM algorithm for a mixture of K Gaussians of this
    form in which we treat <math|\<varepsilon\>> as a fixed constant, instead
    of a parameter to be re-estimated.

    <\equation*>
      <text|>
    </equation*>
  </hidden>|<\hidden>
    From Eq. <eqref|9.13> the posterior probabilities, or responsibilities,
    for a particular data point <math|x<rsub|n>>, are given by\ 

    <\equation*>
      \<gamma\><around*|(|z<rsub|nk>|)>=<frac|\<pi\><rsub|k>exp<around*|{|-<around*|\<\|\|\>|\<b-x\><rsub|n>-\<b-mu\><rsub|k>|\<\|\|\>><rsup|2>/2\<varepsilon\>|}>|<big|sum><rsub|j>\<pi\><rsub|j>exp<around*|{|-<around*|\<\|\|\>|\<b-x\><rsub|n>-\<b-mu\><rsub|j>|\<\|\|\>><rsup|2>/2\<varepsilon\>|}>>
    </equation*>

    If we consider the limit <math|\<varepsilon\>\<rightarrow\>0>, we see
    that in the denominator the term for which
    <math|<around*|\<\|\|\>|\<b-x\><rsub|n>-\<b-mu\><rsub|j>|\<\|\|\>><rsup|2>>
    is smallest will go to zero most slowly, and hence the responsibilities
    <math|\<gamma\><around*|(|z<rsub|nk>|)>> for the data point
    <math|\<b-x\><rsub|n>> all go to zero except for term <math|j>, for which
    the responsibility <math|\<gamma\><around*|(|z<rsub|nj>|)>> will go to
    unity. Note that this holds independently of the values of the
    <math|\<pi\><rsub|k>> so long as none of the <math|\<pi\><rsub|k>> is
    zero. Thus, in this limit, we obtain a hard assignment of data points to
    clusters, just as in the K-means algorithm, so that
    <math|\<gamma\><around*|(|z<rsub|nk>|)>\<rightarrow\>r<rsub|nk>> where
    <math|r<rsub|nk>> is defined by Eq. <eqref|9.2>. Each data point is
    thereby assigned to the cluster having the closest mean.
  </hidden>|<\hidden>
    \;

    The EM re-estimation equation for the <math|\<b-mu\><rsub|k>> , given by
    Eq. <eqref|9.17>, then reduces to the K-means result Eq. <eqref|9.4>.
    Note that the re-estimation formula for the mixing coefficients Eq.
    <eqref|9.22> simply re-sets the value of <math|\<pi\><rsub|k>> to be
    equal to the fraction of data points assigned to cluster k, although
    these parameters no longer play an active role in the algorithm.

    Finally, in the limit <math|\<varepsilon\>\<rightarrow\>0> the expected
    complete-data log likelihood, given by Eq. <eqref|9.40>, becomes

    <\equation*>
      \<bbb-E\><rsub|Z><around*|[|ln p<around*|(|X,Z\|\<b-mu\>,\<b-Sigma\>,\<b-pi\>|)>|]>\<rightarrow\>-<frac|1|2><big|sum><rsub|n=1><rsup|N><big|sum><rsub|k=1><rsup|K>r<rsub|nk><around*|\<\|\|\>|\<b-x\><rsub|n>-\<b-mu\><rsub|k>|\<\|\|\>><rsup|2>+const
    </equation*>

    \;

    Thus we see that in this limit, maximizing the expected complete-data log
    likelihood is equivalent to minimizing the distortion measure <math|J>
    for the K-means algorithm given by Eq. <eqref|9.1>.
  </hidden>|<\hidden>
    <tit|Mixtures of Bernoulli distributions>

    So far in this chapter, we have focussed on distributions over continuous
    variables described by mixtures of Gaussians.

    As a further example of mixture modelling, and to illustrate the EM
    algorithm in a different context, we now discuss mixtures of discrete
    binary variables described by Bernoulli distributions.

    This model is also known as latent class analysis (Lazarsfeld and Henry,
    1968; McLachlan and Peel, 2000). As well as being of practical importance
    in its own right, our discussion of Bernoulli mixtures will also lay the
    foundation for a consideration of hidden Markov models over discrete
    variables.
  </hidden>|<\hidden>
    <tit|Bernoulli distribution>

    Consider a set of <math|D> binary variables <math|x<rsub|i>> , where
    <math|i=1,\<cdots\>,D>, each of which is governed by a Bernoulli
    distribution with parameter <math|\<mu\><rsub|i>>, so that

    <\equation*>
      p<around*|(|\<b-x\>\|\<b-mu\>|)>=<big|prod><rsub|i=1><rsup|D>\<mu\><rsub|i><rsup|<rsup|x<rsub|i>>><around*|(|1-\<mu\><rsub|i>|)><rsup|<around*|(|1-x<rsub|i>|)>>
    </equation*>

    where <math|\<b-x\>=(x<rsub|1>,\<cdots\>,x<rsub|D>)<rsup|T>> and
    <math|\<b-mu\>=(\<mu\><rsub|1>,\<cdots\>,\<mu\><rsub|D>)<rsup|T>> . We
    see that the individual variables <math|x<rsub|i>> are independent, given
    <math|\<b-mu\>>. The mean and covariance of this distribution are easily
    seen to be

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<b-x\>|]>>|<cell|=>|<cell|\<b-mu\>>>|<row|<cell|cov<around*|[|\<b-x\>|]>>|<cell|=>|<cell|diag<around*|{|\<mu\><rsub|i><around*|(|1-\<mu\><rsub|i>|)>|}>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|mixture>

    Now let us consider a finite mixture of these distributions given by

    <\equation>
      p<around*|(|\<b-x\>\|\<b-mu\>,\<b-pi\>|)>=<big|sum><rsub|k=1><rsup|K>\<pi\><rsub|k>p<around*|(|\<b-x\>\|\<b-mu\><rsub|k>|)><label|9.47>
    </equation>

    where <math|\<b-mu\>=<around*|{|\<b-mu\><rsub|1>,\<cdots\>,\<b-mu\><rsub|K>|}>>,<math|\<b-pi\>=<around*|{|\<pi\><rsub|1>,\<cdots\>,\<pi\><rsub|K>|}>>
    and

    <\equation*>
      p<around*|(|\<b-x\>\|\<b-mu\><rsub|k>|)>=<big|prod><rsub|i=1><rsup|D>\<mu\><rsub|k
      i><rsup|<rsup|x<rsub|i>>><around*|(|1-\<mu\><rsub|k
      i>|)><rsup|<around*|(|1-x<rsub|i>|)>>
    </equation*>

    \;
  </hidden>|<\hidden>
    \;

    The mean and covariance of this mixture distribution are given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|\<b-x\>|]>>|<cell|=>|<cell|<big|sum><rsub|k=1><rsup|K>\<pi\><rsub|k>\<b-mu\><rsub|k>>>|<row|<cell|cov<around*|[|<math-bf|x>|]>>|<cell|=>|<cell|<big|sum><rsub|k=1><rsup|K>\<pi\><rsub|k><around*|{|\<Sigma\><rsub|K>+\<b-mu\><rsub|k>\<b-mu\><rsub|k><rsup|T>|}>-\<bbb-E\><around*|[|\<b-x\>|]>\<bbb-E\><around*|[|x|]><rsup|T>>>>>
    </eqnarray*>

    where

    <\equation*>
      \<Sigma\><rsub|k>=diag<around*|{|\<mu\><rsub|k
      i><around*|(|1-\<mu\><rsub|k i>|)>|}>
    </equation*>

    \ Because the covariance matrix <math|cov[\<b-x\>]> is no longer
    diagonal, the mixture distribution can capture correlations between the
    variables, unlike a single Bernoulli distribution.
  </hidden>|<\hidden>
    <tit|likelihood>

    \;

    If we are given a data set <math|X={\<b-x\><rsub|1>,\<cdots\>,\<b-x\><rsub|N>}>
    then the log likelihood function for this model is given by

    <\equation*>
      ln p<around*|(|X\|\<b-mu\>,\<b-pi\>|)>=<big|sum><rsub|n=1><rsup|N>ln<around*|{|<big|sum><rsub|k=1><rsup|K>\<pi\><rsub|k>p<around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|k>|)>|}>
    </equation*>

    Again we see the appearance of the summation inside the logarithm, so
    that the maximum likelihood solution no longer has closed form.
  </hidden>|<\hidden>
    <tit|Latent variable>

    We now derive the EM algorithm for maximizing the likelihood function for
    the mixture of Bernoulli distributions.\ 

    To do this, we rst introduce an explicit latent variable <math|\<b-z\>>
    associated with each instance of <math|\<b-x\>>.\ 

    As in the case of the Gaussian mixture, <math|\<b-z\> =
    (z<rsub|1>,\<cdots\>,z<rsup|K>)<rsup|T>> is a binary K-dimensional
    variable having a single component equal to 1, with all other components
    equal to 0.\ 
  </hidden>|<\hidden>
    \;

    We can then write the conditional distribution of <math|\<b-x\>>, given
    the latent variable, as

    <\equation*>
      p<around*|(|\<b-x\>\|\<b-z\>,\<b-mu\>|)>=<big|prod><rsub|k=1><rsup|K>p<around*|(|\<b-x\>\|\<b-mu\><rsub|k>|)><rsup|<rsup|z<rsub|k>>>
    </equation*>

    while the prior distribution for the latent variables is the same as for
    the mixture of Gaussians model, so that

    <\equation*>
      p<around*|(|\<b-z\>\|\<b-pi\>|)>=<big|prod><rsub|k=1><rsup|K>\<pi\><rsub|k><rsup|z<rsub|k>>
    </equation*>

    If we form the product of <math|p(x\|z, \<mu\>)> and <math|p(z\|\<pi\>)>
    and then marginalize over <math|z>, then we recover Eq. <eqref|9.47>.
  </hidden>|<\hidden>
    In order to derive the EM algorithm, we first write down the
    complete-data log likelihood function, which is given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|ln p<around*|(|X,Z\|\<b-mu\>,\<b-pi\>|)>>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N><big|sum><rsub|k=1><rsup|K>z<rsub|n
      k><around*|{|ln \<pi\><rsub|k>+<big|sum><rsub|i=1><rsup|D><around*|[|x<rsub|n
      i>ln \<mu\><rsub|k i>+<around*|(|1-x<rsub|n
      i>|)>ln<around*|(|1-\<mu\><rsub|k i>|)>|]>|}>>>>>
    </eqnarray*>

    where <math|X={\<b-x\><rsub|n>}> and <math|Z={\<b-z\><rsub|n>}>. Next we
    take the expectation of the complete-data log likelihood with respect to
    the posterior distribution of the latent variables to give

    <\eqnarray*>
      <tformat|<table|<row|<cell|>|<cell|>|<cell|\<bbb-E\><rsub|\<b-z\>><around*|[|ln
      p<around*|(|X,Z\|\<b-mu\>,\<b-pi\>|)>|]>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N><big|sum><rsub|k=1><rsup|K>\<gamma\><around*|(|z<rsub|n
      k>|)><around*|{|ln \<pi\><rsub|k>+<big|sum><rsub|i=1><rsup|D><around*|[|x<rsub|n
      i>ln \<mu\><rsub|k i>|]>+<around*|(|1-x<rsub|n
      i>|)>ln<around*|(|1-\<mu\><rsub|k i>|)>|}><eq-number><label|9.55>>>>>
    </eqnarray*>

    where <math|\<gamma\>(z<rsub|n k>)=\<bbb-E\>[z<rsub|n k>]> is the
    posterior probability, or responsibility, of component k given data point
    <math|\<b-x\><rsub|n>>.
  </hidden>|<\hidden>
    \ 

    \;

    In the E step, these responsibilities are evaluated using Bayes' theorem,
    which takes the form

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<gamma\><around*|(|z<rsub|n
      k>|)>>|<cell|=>|<cell|\<bbb-E\><around*|[|z<rsub|n
      k>|]>>>|<row|<cell|>|<cell|=>|<cell|<frac|<big|sum><rsub|z<rsub|n
      k>>z<rsub|n k><around*|[|\<pi\><rsub|k>p<around*|(|\<b-x\><rsub|n><around*|\||\<b-mu\><rsub|k>|\|>|)>|]><rsup|z<rsub|n
      k>>|<big|sum><rsub|z<rsub|n j>><around*|[|\<pi\><rsub|j>p<around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|j>|)>|]><rsup|z<rsub|n
      j>>>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<pi\><rsub|k>p<around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|k>|)>|<big|sum><rsub|j=1><rsup|K>\<pi\><rsub|j>p<around*|(|\<b-x\><rsub|n>\|\<b-mu\><rsub|j>|)>>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    If we consider the sum over <math|n> in <eqref|9.55>, we see that the
    responsibilities enter only through two terms, which can be written as\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|N<rsub|k>>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|z<rsub|n
      k>|)>>>|<row|<cell|<wide|\<b-x\>|\<wide-bar\>><rsub|k>>|<cell|=>|<cell|<frac|1|N<rsub|k>><big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|z<rsub|n
      k>|)>\<b-x\><rsub|n>>>>>
    </eqnarray*>

    where <math|N<rsub|k>> is the effective number of data points associated
    with component <math|k>.
  </hidden>|<\hidden>
    In the M step, we maximize the expected complete-data log likelihood with
    respect to the parameters <math|\<b-mu\><rsub|k>> and <math|\<b-pi\>>. If
    we set the derivative of Eq. <eqref|9.55> with respect to
    <math|\<b-mu\><rsub|k>> equal to zero and rearrange the terms, we obtain

    <\equation*>
      \<b-mu\><rsub|k>=<wide|\<b-x\>|\<wide-bar\>><rsub|k>
    </equation*>

    We see that this sets the mean of component k equal to a weighted mean of
    the data, with weighting coefficients given by the responsibilities that
    component k takes for data points. For the maximization with respect to
    <math|\<pi\><rsub|k>> , we need to introduce a Lagrange multiplier to
    enforce the constraint <math|<big|sum><rsub|k>\<pi\><rsub|k>=1>.
    Following analogous steps to those used for the mixture of Gaussians, we
    then obtain

    <\equation*>
      \<pi\><rsub|k>=<frac|N<rsub|k>|N>
    </equation*>

    which represents the intuitively reasonable result that the mixing
    coefficient for component k is given by the effective fraction of points
    in the data set explained by that component.
  </hidden>|<\hidden>
    <small-figure|<image|image/fig_9_10_bernoulli_digits.png|0.8par|||>|Illustration
    of the Bernoulli mixture model in which the top row shows examples from
    the digits data set after converting the pixel values from grey scale to
    binary using a threshold of 0.5. On the bottom row the first three images
    show the parameters <math|\<mu\><rsub|ki>> for each of the three
    components in the mixture model. As a comparison, we also fit the same
    data set using a single multivariate Bernoulli distribution, again using
    maximum likelihood. This amounts to simply averaging the counts in each
    pixel and is shown by the right-most image on the bottom row.>
  </hidden>|<\hidden>
    <tit|EM for Bayesian linear regression>

    As a third example of the application of EM, we return to the evidence
    approximation for Bayesian linear regression. In Section 3.5.2, we
    obtained the re-estimation equations for the hyperparameters
    <math|\<alpha\>> and <math|\<beta\>> by evaluation of the evidence and
    then setting the derivatives of the resulting expression to zero.\ 

    We now turn to an alternative approach for finding <math|\<alpha\>> and
    <math|\<beta\>> based on the EM algorithm. Recall that our goal is to
    maximize the evidence function <math|p(t\|\<alpha\>,\<beta\>)> given by
    (3.77) with respect to <math|\<alpha\>> and <math|\<beta\>>. Because the
    parameter vector <math|\<b-w\>> is marginalized out, we can regard it as
    a latent variable, and hence we can optimize this marginal likelihood
    function using EM.
  </hidden>|<\hidden>
    In the E step, we compute the posterior distribution of <math|\<b-w\>>
    given the current setting of the parameters <math|\<alpha\>> and
    <math|\<beta\>> and then use this to find the expected
    comple<active|<active*|>>te-data log likelihood.\ 

    In the M step, we maximize this quantity with respect to <math|\<alpha\>>
    and <math|\<beta\>>. We have already derived the posterior distribution
    of <math|\<b-w\>> because this is given by (3.49). The complete-data log
    likelihood function is then given by\ 

    <\equation*>
      ln p(\<b-t\>, \<b-w\>\|\<alpha\>, \<beta\>) = ln p(\<b-t\>\|\<b-w\>,
      \<beta\>) + ln p(\<b-w\>\|\<alpha\>)
    </equation*>

    where the likelihood <math|p(\<b-t\>\|\<b-w\>, \<beta\>) >and the prior
    <math|p(\<b-w\>\|\<alpha\>)> are given by (3.10) and (3.52),
    respectively, and <math|y(x, \<b-w\>)> is given by (3.3).
  </hidden>|<\hidden>
    Taking the expectation with respect to the posterior distribution of
    <math|\<b-w\>> then gives

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|ln
      p<around*|(|\<b-t\>,\<b-w\>\|\<alpha\>,\<beta\>|)>|]>>|<cell|=>|<cell|<frac|M|2>ln<around*|(|<frac|\<alpha\>|2\<pi\>>|)>-<frac|\<alpha\>|2>\<bbb-E\><around*|[|\<b-w\><rsup|T>\<b-w\>|]>+<frac|N|2><around*|(|<frac|\<beta\>|2\<pi\>>|)>-<frac|\<beta\>|2><big|sum><rsub|n=1><rsup|N>\<bbb-E\><around*|[|<around*|(|t<rsub|n>-\<b-w\><rsup|T>\<b-varphi\><rsub|n>|)><rsup|2>|]>>>>>
    </eqnarray*>

    Setting the derivatives with respect to <math|\<alpha\>> to zero, we
    obtain the M step re-estimation equation

    <\equation>
      \<alpha\>=<frac|M|\<bbb-E\><around*|[|\<b-w\><rsup|T>\<b-w\>|]>>=<frac|M|\<b-m\><rsup|T><rsub|N>\<b-m\><rsub|N>+Tr<around*|(|S<rsub|N>|)>><label|9.63>
    </equation>

    An analogous result holds for <math|\<beta\>>.
  </hidden>|<\hidden>
    These two approaches to determining <math|\<alpha\>> should of course
    converge to the same result (assuming they find the same local maximum of
    the evidence function). This can be verified by first noting that the
    quantity <math|\<gamma\>> is defined by \ 

    <\equation*>
      \<gamma\>=M-\<alpha\><big|sum><rsub|i=1><rsup|M><frac|1|\<lambda\><rsub|i>
      + \<alpha\>> = M \<minus\> \<alpha\>Tr(S<rsub|N> ).
    </equation*>

    \ At a stationary point of the evidence function, the re-estimation
    equation (3.92) will be self-consistently satisfied, and hence we can
    substitute for \<gamma\> to give

    <\equation*>
      \<alpha\>\<b-m\><rsup|T><rsub|N>\<b-m\><rsub|N>
      =\<gamma\>=M\<minus\>\<alpha\>Tr(S<rsub|N>)
    </equation*>

    and solving for <math|\<alpha\>> we obtain Eq. <eqref|9.63>, which is
    precisely the EM re-estimation equation.
  </hidden>|<\hidden>
    <tit|relevance vector machine for regression>

    As a final example, we consider a closely related model, namely the
    relevance vector machine for regression discussed in Section 7.2.1.\ 

    There we used direct maximization of the marginal likelihood to derive
    re-estimation equations for the hyper- parameters <math|\<alpha\>> and
    <math|\<beta\>>.\ 

    Here we consider an alternative approach in which we view the weight
    vector w as a latent variable and apply the EM algorithm.
  </hidden>|<\hidden>
    \;

    The E step involves finding the posterior distribution over the weights,
    and this is given by (7.81). In the M step we maximize the expected
    complete-data log likelihood, which is defined by\ 

    <\equation*>
      \<bbb-E\><rsub|\<b-w\>> [ln p(\<b-t\>\|X, \<b-w\>,
      \<beta\>)p(\<b-w\>\|\<alpha\>)]
    </equation*>

    where the expectation is taken with respect to the posterior distribution
    computed using the `old' parameter values. To compute the new parameter
    values we maximize with respect to <math|\<alpha\>> and <math|\<beta\>>
    to give

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<alpha\><rsup|new><rsub|i>>|<cell|=>|<cell|<frac|1|m<rsup|2><rsub|i>+\<Sigma\><rsub|i
      i>>>>|<row|<cell|<around*|(|\<beta\><rsup|new>|)><rsup|-1>>|<cell|=>|<cell|<frac|<around*|\<\|\|\>|\<b-t\>-\<Phi\>\<b-m\><rsub|N>|\<\|\|\>><rsup|2>+\<beta\><rsup|-1><big|sum><rsub|i>\<gamma\><rsub|i>|N>>>>>
    </eqnarray*>

    These re-estimation equations are formally equivalent to those obtained
    by direct maxmization.\ 
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    <\padded-center>
      <section|The EM Algorithm in General><label|section9.4>
    </padded-center>
  </hidden>|<\hidden>
    The expectation maximization algorithm, or EM algorithm, is a general
    technique for finding maximum likelihood solutions for probabilistic
    models having latent vari- ables (Dempster et al., 1977; McLachlan and
    Krishnan, 1997).\ 

    Here we give a very general treatment of the EM algorithm and in the
    process provide a proof that the EM algorithm derived heuristically in
    Sections <reference|section9.2> and <reference|section9.3> for Gaussian
    mixtures does indeed maximize the likelihood function (Csisza`r and
    Tusna`dy, 1984; Hath- away, 1986; Neal and Hinton, 1999).\ 

    Our discussion will also form the basis for the derivation of the
    variational inference framework.
  </hidden>|<\hidden>
    Consider a probabilistic model in which we collectively denote all of the
    observed variables by <math|X> and all of the hidden variables by
    <math|Z>. The joint distribution <math|p(X, Z\|\<b-theta\>)> is governed
    by a set of parameters denoted <math|\<b-theta\>>. Our goal is to
    maximize the likelihood function that is given by

    <\equation*>
      p(X\|\<theta\>) = <big|sum><rsub|Z>p(X, Z\|\<theta\>)
    </equation*>

    Here we are assuming <math|Z> is discrete, although the discussion is
    identical if <math|Z> comprises continuous variables or a combination of
    discrete and continuous variables, with summation replaced by integration
    as appropriate.
  </hidden>|<\hidden>
    \;

    We shall suppose that direct optimization of <math|p(X\|\<theta\>)> is
    difficult, but that opti- mization of the complete-data likelihood
    function <math|p(X, Z\|\<theta\>)> is significantly easier.

    Next we introduce a distribution <math|q(Z)> defined over the latent
    variables, and we observe that, for any choice of <math|q(Z)>, the
    following decomposition holds

    <\equation>
      ln p(X\|\<b-theta\>) = L(q, \<b-theta\>) + KL(q\<\|\|\>p)<label|9.70>
    </equation>

    where we have defined\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-L\>(q, \<b-theta\>)>|<cell|
      =>|<cell|<big|sum><rsub|Z> q(Z)ln<around*|{|<frac|p(X, Z\|\<b-theta\>)
      |q(Z)>|}><eq-number><label|9.71>>>|<row|<cell|KL(q\<\|\|\>p)
      >|<cell|=>|<cell|-<big|sum><rsub|Z>q(Z)ln<around*|{|<frac|p(
      Z\|X,\<b-theta\>) |q(Z)>|}><eq-number><label|9.72>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    Note that <math|\<cal-L\>(q, \<b-theta\>)> is a functional (see Appendix
    D for a discussion of functionals) of the distribution <math|q(Z)>, and a
    function of the parameters <math|\<b-theta\>>. It is worth studying
    carefully the forms of the expressions Eq. <eqref|9.71> and <eqref|9.72>,
    and in particular noting that they differ in sign and also that
    <math|\<cal-L\>(q, \<b-theta\>)> contains the joint distribution of
    <math|X> and <math|Z> while <math|KL(q\<\|\|\>p)> contains the
    conditional distribution of <math|Z> given <math|X>. To verify the
    decomposition Eq. <eqref|9.70>, we first make use of the product rule of
    probability to give\ 

    <\equation*>
      ln p(X, Z\|\<b-theta\>) = ln p(Z\|X, \<b-theta\>) + ln
      p(X\|\<b-theta\>)
    </equation*>

    which we then substitute into the expression for <math|\<cal-L\>(q,
    \<b-theta\>)>. This gives rise to two terms, one of which cancels
    <math|KL(q\<\|\|\>p)> while the other gives the required log likelihood
    <math|ln p(X\|\<b-theta\>)> after noting that <math|q(Z)> is a normalized
    distribution that sums to 1.

    From Eq. <eqref|9.72>, we see that <math|KL(q\<\|\|\>p)> is the
    Kullback-Leibler divergence between <math|q(Z)> and the posterior
    distribution <math|p(Z\|X, \<b-theta\>)>. Recall that the K-L divergence
    satisfies <math|KL(q\<\|\|\>p)\<geqslant\>0>, with equality if, and only
    if, <math|q(Z) = p(Z\|X, \<b-theta\>)>. It therefore follows from Eq.
    <eqref|9.70> that <math|L(q,\<theta\>)\<leqslant\>ln p(X\|\<theta\>)>, in
    other words that <math|L(q,\<b-theta\>)> is a lower bound on <math|ln
    p(X\|\<b-theta\>)>.
  </hidden>|<\hidden>
    <small-figure|<image|image/fig_9_11_em.png|0.6par|||>|Illustration of the
    decomposition given by Eq. <eqref|9.70>, which holds for any choice of
    distribution <math|q(Z)>. Because the Kullback-Leibler divergence
    satisfies <math|KL(q\<\|\|\>p)\<geqslant\>0>, we see that the quantity
    <math|\<cal-L\>(q,\<b-theta\>)> is a lower bound on the log likelihood
    function <math|ln p(X\|\<b-theta\>)>.>
  </hidden>|<\hidden>
    The EM algorithm is a two-stage iterative optimization technique for
    finding maximum likelihood solutions. We can use the decomposition Eq.
    <eqref|9.70> to define the EM algorithm and to demonstrate that it does
    indeed maximize the log likelihood.\ 

    Suppose that the current value of the parameter vector is
    <math|\<theta\><rsup|old>>. In the E step, the lower bound
    <math|\<cal-L\>(q, \<theta\><rsup|old>)> is maximized with respect to
    <math|q(Z)> while holding <math|\<theta\><rsup|old>> fixed. The solution
    to this maximization problem is easily seen by noting that the value of
    ln <math|p(X\|\<theta\><rsup|old>)> does not depend on <math|q(Z)> and so
    the largest value of <math|\<cal-L\>(q, \<theta\><rsup|old>)> will occur
    when the Kullback-Leibler divergence vanishes, in other words when
    <math|q(Z)> is equal to the posterior distribution
    <math|p(Z\|X,\<theta\><rsup|old>)>.\ 

    In this case, the lower bound will equal the log likelihood, as
    illustrated in Figure <eqref|fig9.12>.
  </hidden>|<\hidden>
    \;

    <\padded-center>
      <small-figure|<image|<tuple|<#89504E470D0A1A0A0000000D49484452000004360000025F08020000000B9AC1B30000000373424954080808DBE14FE0000000097048597300000EC400000EC401952B0E1B0000200049444154789CECDD797C8CD7E2C7F133C964250809892C282DB117554B2CB5D6D5524BAB96522EAD5AAB6829D7D216C56DDDA297FAB9A86AA24D2DB7966A6B0B825045545B7B42489A4D90C89EF9FDF1FCFAFCA63399C96496E4243EEF575FF7F5CCCC79CE73123773E63BCF59343A9D4E00000000801C9CCABA0100000000F0FF882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884885284E3C78FDFBB77CF11354747471F3D7AD4F632D6B97AF5EA952B571C5133000000602F4414434B972E1D3E7C786666A6232A9F3265CAF8F1E36D2F639D949494D0D0D09D3B773AA272000000C02E88287F3167CE9C254B96ECD9B3A776EDDA8EA8FFFEFDFBF7EFDFB7BD8C75DAB56BB76EDDBA175F7CF1ABAFBE7244FD00000080EDB4569FB97BF7EEF3E7CF7B7A7ABAB8B8383B3B3B39FD5FDAD1E9743A9D2E2F2F2F373737232363CC9831C1C1C1C6A72F5BB64C08E1EEEEAED56A95737372721E3E7CF8F0E1C3575E79E589279E50AF72EEDC39E52A5AAD56A3D168341AF542050505F9F9F9B9B9B9999999C3860D53CFB2CECA952B972D5BB66FDFBEC68D1BDB528FCCFAF7EFFFD65B6F8D1A35AA4E9D3AEDDAB52BEBE60000000086AC8F28972F5FDEBE7D7B4E4ECE9D3B77EEDEBD6BF06A7070B0B7B7B756AB1D3C787091A7EFD8B1233A3A5AA7D3193CEFE3E3F3ECB3CFAA61E3F2E5CB3B76EC307595EAD5ABD7AA55CBDDDDDDD9D9B977EFDE56FF2C4288C3870FBFF5D65BB367CFEEDEBDBB2DF5C86FF1E2C5274F9E1C3060C0E9D3A7030303CBBA390E949A9ABA79F3E6D3A74FDFBC79D3DDDDBD7EFDFA83060DEADEBDBBB3B37359370D00000026698C4342491516167EFCF1C73367CE541E7A7979454747878484147BE2BE7DFBFAF4E9A31C77E8D061EAD4A93D7AF4A85EBDBA2557F1F4F43C70E080BDEE03DCBF7FBF51A346DEDEDE3FFFFCB39B9B9B5DEA2C524848484646C6AD5BB76C2C63A3C4C4C466CD9A8584841C3972C471572943858585FFF8C73F3EFAE8A366CD9A4D9932A5458B1677EFDEDDBD7BF79A356BFCFDFDB76EDDDABA75EBB26E230000008A6687B9284E4E4E03070E541F2A9F7D2D39B16BD7AEAEAEAE356AD4888888888A8A7AE9A5974CE513E3ABB468D1C28EE394DE7FFFFD848484952B573A349FC8C3CFCF6FCA9429478F1EDDB2654B59B7C5FE1E3E7C3860C080C58B174F9D3AF5F4E9D3AFBCF24AF3E6CDBB74E9B27CF9F2989898070F1E74E8D061FDFAF565DD4C00000014CD3ED3E5F53FD9BBBABA5A78D6ECD9B3FDFDFD4F9E3C696A309899ABD8314B5CB97265E5CA95A1A1A1157E8897BE8913277A7A7ACE9C39D34153F3CBD0F8F1E3BFFDF6DB6EDDBA7DF8E187062F3DF6D8637BF7EED5E974E3C78FDFBF7F7F99340F000000E695CD8A5E3A9D6EE2C4897BF6EC397AF46883060DCAA40DAAE9D3A7E7E6E6CE9D3BB76C9B51CAAA57AF3E66CC98C4C4C4F7DE7BAFACDB624F070F1EFCE28B2F8410F3E6CD535756D0D7AA55AB61C3861514148C1F3F3E2727A7D41B08000080629441442928281833664C6464E49123478282824ABF01FA2E5CB8B06BD7AEA0A0A09E3D7B966D4B4ADF5B6FBDE5ECECBC6EDD3A076D02532694C4E5EBEBDBA54B1753655E7AE92521C4B56BD7C2C3C34BAF65000000B04C694794BCBCBCA143879E3F7FFEF0E1C37E7E7EA57C75631B366C10428C1831425D34F9D151AF5EBD5EBD7A3D78F0202222A2ACDB621F376EDC501600E8D0A1839962EDDBB7570E3EFFFCF3D268160000004AA2543F97E7E4E40C1C38F0D6AD5B070F1EF4F1F129CD4B1729373757992FDEBF7FFFB26E4BD9506E355498B9E3E1E1E1CA0A75456EC5A3F2F6F656E632454646DEB973A7941A07000000CB945E44C9CCCCECDBB7EF83070F7EFCF1C76AD5AA95DA75CDD8BB776F4A4A8AABAB6BCB962DCBBA2D65A353A74E4288A8A8A8EBD7AF97755BECE0E8D1A3CA41B101B856AD5A42089D4E77F2E44987370B00000025514A11E5DEBD7BBD7AF5727676FEEEBBEF2A57AE5C3A172DD681030784102D5BB6B4657DB0BCBCBC7BF7EE193F5F5858687DCB8AF3F0E1433353BDD3D2D22CBC7A9B366D3C3C3C8410919191766B5CD93973E68C72506C445107199E3A75CAB16D0200004009954644494D4DEDD6AD9BB7B7F7B7DF7EAB7C209684326FA16DDBB6569C9B9494F4FEFBEF376AD4A8468D1A4D9B366DDCB8F1CE9D3B9597B2B2B2060D1AB474E9527BB6F54F77EEDC79F6D967EBD6AD5BB972E56EDDBA9D3B774E7DE9DCB9732FBDF492AFAF6FF3E6CD3D3D3D070D1A74FBF66DF3B5B9BABA2A3FBE7AFFA1FCBA7FFF7E7272B2726C66831D458D1A3594831B376E38B6590000002821874794C4C4C42E5DBAFCFCF3CF0F1F3EB47CCB945270F7EEDD0B172E08219E7EFAE9929EBB71E3C6FAF5EB7FF2C927FFF8C73F5252526EDDBA1516163679F2E4AD5BB70A21468E1CB97DFBF6264D9AD8BDCDF9F9F9CF3FFF7CBB76ED1212128E1F3F7EE8D0A1EEDDBB2B63B4366DDA3470E04065AA4F7C7CFC8913274E9C38D1AA55AB62F78F0F0D0D157FA6B5724D7F8317171717F385B55AAD7250E41D300000009421AD436BBF79F366F7EEDDAF5EBD2A843874E8D0AA55ABA64C99E2D02B5A2E262646995ADDAA552BCBCFD2E974AFBDF6DAFAF5EB6BD7AE7DE2C409755A76CB962D77EEDCD9AF5FBF9898986FBEF9C6C9C94999E6615F5BB76E7575755DB0608110E2A9A79EAA52A54A5A5ADAEAD5ABBDBDBD7FF8E18753A74EA9039C9E7CF2C9458B168D193366C8902157AF5EAD54A992A93AEBD5AB2784B876ED5A6666A69962F2D38F28CECECEE60BAB058828000000B2716044B97AF56AF7EEDD7BF4E8919090A0ECBC316BD6AC679F7DF689279E70DC452DA78EF051664E5B68FCF8F1EBD7AFF7F0F0D8BD7BB7C1B251AD5BB76ED5AAD592254B8410CD9B37F7F6F6B6636B151B366C983A75AAFAB0A0A04008B172E5CAB66DDBFEF0C30F06937C060F1EAC6CCEB87CF97225D514491D13151717D7B871632B5AF5CD37DF2C58B0C0BE9BABF8FBFBEFDCB9B366CD9A969FA21F518A5D429A88020000202D470DF4BA78F162E7CE9D478F1EFD9FFFFC479D95919595356AD428E583759953D7B0AA52A58A85A7AC5DBB76DDBA75428837DF7CF3C9279F342EF0CC33CF28075DBB76B54313FFEAE6CD9B274F9EECD7AF9FF23031315149051A8D66D3A64DC68B10787979292BA77DF9E59766AA55234A6C6CAC750D737676D63A40917BC39B4144010000A8181C7217E5E79F7FEEDDBBF7AC59B3A64F9F2E84983061C28E1D3B94E5B34E9E3CB97CF9F259B36639E2BA25A26C8851A952A562E72D28AE5EBDAAFC38D5AB577FE79D774C95510E1C115176EDDA151A1AEAE9E9A93C3C7EFCB8723072E4485337A6F2F3F38510376EDCC8C9C931B56A991A51E2E3E3AD6BD8800103060C1860DDB976A4FCB08A62E38DBAE2595E5E9E03DB04A0BCF9FE7BF1C71F62E4C8B26E07003CDAEC1F51AE5DBBD6A3478F0F3FFCF0B5D75E539ED168341B366C68D6AC99F23DF7FCF9F3FBF6EDDBAC5933BB5FBA44945B1055AB56B5B0FCDCB9731F3E7C288418316284A9B39475B1341A8D2326A2C4C5C5BDF4D24BEAC3C3870F2B077DFBF62DB2FCFDFBF73332328410050505D7AE5D3335884B5DDBCABE23B54A9FFE3F8A32CBC80CF5569E85FF07C8CFCE5F3BF2F8A26D0D130B4B302C108FB05821B2840829EB66C04AA34695EAE5A6889573C507BE22B954AF0ADBFC2684E08F1C72F2F3136FBC21DE7843F8FA967553AC67FF815E090909AB56AD52F38922383878C58A15CA716E6EEEC891234BF3DBEBEBD7AF6767671B3CA9E40D0B3791BC74E95244448472AC9F13F4A5A4A45CBC785108D1BC79F36217BDB5C2B265CBC68E1DAB3E3C74E8901042A3D174EEDCB9C8F2EA2D1D218499B5D4D4A656A488A27F47A5486A010B87F92DFADBB1C9119DC927B0CC8B42D413A2B110F5CBBA25281F568A293DC4FEB26E054AA0AB108D85682C44D7B26E095084C444317FBED09BBD5C1ED93FA274ECD871F8F0E1C6CF8F1933E66F7FFB9B727CEEDCB9F7DE7BCFEE9736A5458B16B76EDD327852F990AA2E3E6BDEE6CD9B95A141DEDEDEEDDBB72FB24C6464A4F2E5BD2346791950E350D3A64D4D6D53181D1DAD1ED7AE5DDB54556A7A29F663BDE4F4234A6E6EAEF9C225BA8B929F9DBF36926FCA60A16421BEF9F3F8BA106165D916941F31A2F90551C6830B60A10B42A8BB1D470A1155966D014C0B0F17E5F9DB67FB471433D300D6AF5FAFAE73B564C992D2D9D83B2121212323232020C0E0796552C783070F2CA964F7EEDDCA418F1E3D4C4DC5566E6B88528928870F1F2E360E9D3C795239A85BB7AE3A83C5983ACBBC5CAF382CFE1A36B2B2B2CC17560B58BE58026099357F7DE8902D5C512179098BFA2394B9257F7DF869D9B402A8E04A63777995BFBFFFEAD5AB95E382828251A346198FBFB2BB2B57AE54AF5EDDF833BAF28C250B3A3D78F020262646393635AA4AE88DBC72C4441403EA4414331165FFFEFF1B36F0DC73CF99A92A3D3D5D39301363CA052F2F2F3565E9AFEE55A4C4C444E5C0CCFD2595D65D3B67D0251B9B874743BE51448911E242D9B405E54A73115357C496752B50BC4C21C2FFFA4CB810E5F89B6A546053A688F2FCEDB363B76E34366CD8B0EDDBB76FDBB64D08F1FBEFBFCF9933E7A38F3E72E815CF9F3F6F7C0B4508A18C8FB224A2DCBE7D5B3D36B5157D6262E2AFBFFE2A8468D6AC993A01DD719488626622CAB973E79425CB841083060D325395FA1BB0BAD97171713B76ECB0EF5496DAB56BBFF2CA2B160EC35368349A366DDA4446460ABDDC654A42428272D0BA756B4B2A1FBFB9831047FE6757AD98EC869637098F9E1F8448347A7209C3BD60869F487C43AC79C330DC42521B8B7AF22321E695764300D394E9F2D3A797753B6C52DA114508B166CD9A23478E2427270B21FEF5AF7FF5EFDFDFCCAD09DBEDDBB72F3030D0F8796557F58282826277554F4949510E9C9D9D5BB46851649983070F2A07A530CA2B2929A9D88928FFFDEF7F958376EDDA996F921A51945F8815366DDA64666B48AB75E8D0A161C392E58176EDDA2911C578EA91BEACAC2C35C3B46DDBD6929AB5EEDA495F779E54A2D6E0D1D3A2C5EC3F6FB8EA0BCFC8F89FF23E90B202CBCC1446DB4AFDC58D1BA26E5D8736C14F8885422C74E8356017F9F9F98B828244A2E137116BFCFCDEBD75AB445FAB0130AF0CFE9C7C7D7D3FFBECB38103070A210A0B0B5F7DF5D5989818E39D07ED223636F6871F7E78F5D5578D5F523F9127252599FF74AEEE225FAB562D534B63FDF8E38FCA41294414E553B8996BE974BA2D5BB628C70B1716D3EDDDBD7B5739B03AA2CC9E3DFB6F7FFB9BB2429ABDF8FBFB9BDAECC58CFEFDFB2BFB84AAFB7216490D308D1A352AF3C5AF5161C4C6C6C614155084101B376E9C3489842BA93FBFCF3169C50AF1C927A5D214482F3A3A3AD1289F0821121313A3A3A33B76EC58FA4D022AAAB249FC03060C183E7CB8B2EBF98D1B3766CC98B176ED5A475C68EEDCB9F9F9F945DE4551BFA13F77EE9CF94FE74141419E9E9E0F1F3E3475CBE2E1C387DF7DF79D28AD8928EABCFC366DDA1459E0CB2FBF54561C1E376E5CAF5EBDCCD7A6DC90A956AD5ACD9A35AD6B8FABABEB534F3D65DDB9F6D5BE7DFB962D5B9E3B77EEA79F7E2A282850B79037F0C30F3F2807AFBCF24A29B60E15DCE6CD9B4DBDB468D122228AB48A1D0AB172A558BCB85C8FE886DD9819323061C284F3E7CF97625B800ACE3ED3E5D5BDBA0D8ECDF8D7BFFEA58E7CF8ECB3CFF6ECD953A2AB58E2E38F3F5652509111A5418306B56AD512429C3973C67C3D1A8D469982A20C4E33366DDAB43FFEF843981D796547EA5CF92B57AE18BF9A9E9E3E63C60C2144B366CDD4BD68CC50D655AB30DFFDBCF9E69B42887BF7EEA943EF8C29A3E0AA55AB367EFCF8D26B192AB4CCCCCCF9F3E79B7A353131312A8A8549651415653C66A708C5DE69C1A3203636565D87C6584C4C4C6C6C6C293607A8E0EC1351D499D9426FAD24F37C7C7CEAEA0DEF1D316284A93112455EC5FCB0A2F8F8F81123464CFFF3CBB122A7CB0B21943B1EC5461421C4E2C58B8510090909972F5F367869DEBC79FFF33FFFA31C97C228AF3FFEF8E3B7DF7E13427878786CDEBCD9600390DCDCDCA14387FEF1C71F8D1B37DEBF7FBF25C3DF9588E2D0E940A569D4A8512FBCF0821062C1820545EEF472EAD42925E32D5DBAD4113B6CE2D1F4DFE23EC33A62BE166CF7A965EBC596F349A7B00F33774A2D2C00C0721A657B0D2B9C3D7BF6D2A54BB9B9B97171719B376FD6DFCBBC6FDFBE7DFAF4F1F6F6767676EED1A387C15251B76FDFDEB973E7C99327D5F9120A3737B7575E79A575EBD6B56AD51A306080F9AB383B3BBFFBEEBB8F3FFEB8FECE83C9C9C9090909274E9C3876EC98FECF75E1C285A64D9B1AFF08AB56AD9A32658AAFAF6F525252B13FEFEBAFBFBE6EDDBAE79E7B6ED7AE5DCA33C9C9C913274EBC79F3664040C0F6EDDB8510DF7CF38DF9E5B3424242323232CC4FE6365FE6ABAFBE7AF9E597851013264CB872E54A6060E0860D1B9497121313FFFEF7BFEFDDBBF7F9E79FDFB0618325F773E2E3E38382828410274E9C68D7AE5DB1E5CB85BB77EFB66DDBF6EAD5AB93264D5AB56A95FE4B2929296DDAB4898B8B7BF3CD372DB9C50458A8458B16C57EC9929494E4EBEB5B3AED8125929385E5E35B8F1D1315E56633AC919F9FEFE2E2526CB18C8C0CD6C600EC4367AD69D3A6797979F9FAFAD6AE5D3B2828283838B84E9D3A75EAD4090E0E0E0C0CF4F7F7AF51A386BBBBFBC993270D4EDCBD7BB78787878F8F8FFE89010101BEBEBE55AB567577770F0E0E560B2BE3766C94969656E48F101717A7ECC3181B1B6BC98FFCF1C71FBBB8B874E9D265CE9C39FDFAF5F3F7F7FFC73FFE919393A34CECD66834494949E66B68D4A8516060A02D65D4B149DBB66DBB7BF76EB76EDDDAB76F3F67CE9C51A34655AD5AB54993269F7FFEB9253F8B4259FD393838B8A0A0C0F2B3E4979E9E3E6CD8302144F7EEDD232323EFDFBF1F1B1BBB76ED5A5F5F5F0F0F8F12FD8A80621D3B76CC9237A2850B1796754BF1170B17EA84B0F4BFA143CBBAB92853960C4717427CF9E59765DD52A082B0FE2E4AC5D0A74F9F7DFBF6AD5AB5CAC2C9ACF7EFDF3F75EAD46FBFFD56BB76ED9E3D7B56A95225212141D9FEAF69D3A6172E14B3479BED77511A356A74E9D2258D46939292A28C533A7EFCF8F9F3E7BDBCBC1A376EDCAA552B4B7E0AD5840913D6AC59336FDEBC6217FE2A8F943B75478F1EBD73E74EA54A95EAD4A9F3C20B2F0C1F3EDCEA850180220D1B362C3C3CBCF87242E4E5E5B12CA924F2F345518BC79A939424B80DF6C8B2E44EA910A279F3E64C9A07ECE2518F28DBB66D1B3C78706868E8D1A347ADAB213C3C5CF9C27EE2C489AB57AF365FD8C688A2C6A1962D5B9E3D7BD6BA06AB7273736BD7AE9D969676F5EAD5C71E7BCCC6DA8047536666A6E56BA6EFD9B3E76F7FFB9B43DB030B454589D0D0929DB270A198C7FE7C8FA40B172E346FDEDCC2C23131312C670FD8CE3ED3E5CBAF7EFDFAF9F9F94545455DBB76CDBA1AD4F5B54A61AEBC7AAD679E79C6F6DAF6ECD9939A9ADAA74F1FF20960B58F3EFAC8F2C2B367CF765C4B5022132694F894356B44516B70A0E25BBF7EBDE585972C59E2B896008F8E473DA2B8B8B82C59B244A7D3FDF39FFFB4AE06353694C2A258EAB5BA74E9627B6DCB972FD76AB5CB972FB7BD2AE0D1949F9FBF66CD1ACBCBC7C4C4143B1C14A5203656583066C75062A2888E76406B20B7CCCCCC952B575A5E3E3C3C3C3333D371ED011E118F7A4411428C1A35AA7DFBF61B376EB470B9647DEA32C44D9A342985190E4A44D16834A1251DA06064FFFEFD274E9C183F7E7CE3C68DEDD032E091646AAB69334AF4752C1CC4EAB561593BFA11B471E3C65238058001228AD068349F7EFA695E5EDEAC59B34A7AEE8F3FFEA81CD89E198A151F1FAFC4A190901083759C4BAAA0A060D6AC59DEDEDE1572963C506A0E1C3850D2534AF4752C1CC4DAB987E2975F18EBF5C82976D723BB9C02C000114508219E7CF2C93973E67CFEF9E766368E3576F5EA5575187AA54A950A0B0B1DD33A2184C8CFCFFFD7BFFEA51C7B7B7B676767DB52DB3FFFF9CF3367CEAC59B386BD0B815266F9A45BC88925D91E35566C67C40E4880ED8828FF67E1C28503060C18376E5C4A4A8AF9926161613E3E3E5AADF6F1C71F579720FCF8E38FDDDCDCBCBDBD172D5A64DF861D3C78B066CD9AEEEEEE6A1C8A8A8AF2F4F4F4F2F2B26E69A00B172E2C58B060EAD4A943860CB16B4B8147CE1B6FBC51A2C8E1E7E7C7545A19583D5E6BCE1C7B3603E5C2ECD9B3FDFCFC2C2FEFE7E7C7C21880ED1EF54587F565666676EAD4C9C3C3E3E0C1836E6E6EA68ADDBC795329E0E6E6E6EEEEAED56A7373737372727272727273734343431B346860EA5C2B161D4E4E4EDEBB77AF722D0F0F8FC2C2C29C9C9CECECEC9C9C9CFAF5EB977480596262E2D34F3FDDA64D9B88880865DB4A00368A8D8DD57F58AF5E3DF5F8C68D1BFA2F050606B22F8A24DE7B4FAC5953B27D51A64C118B170BB60E7F3459FE675EB76EDD52691150C11151FE223535B577EFDEF5EBD70F0F0F77C427F8E6CD9B6764645CBF7EDDC632D6C9C8C878E699671E7BECB12D5BB6B8B8B8D8BD7E0042088D46A31EF3062BB3FC7C111FFFFF0FF53E73FE1FFD4F9EBEBE8413FC3FFECC0147E3FBBCBFA851A3C691234766CC9871E5CA95860D1BDABDFE175F7CF1E1C387B697B1CEC18307070F1EFCF6DB6FEBBFB702C0A349AB15E6BFEFE6DB7000282BDC4501007BE2EBD572CAF8AB1BFEF5600A7FE680A3311B010000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A000000008910510000000048848802142F3F5FAC5E2D5AB4101A8D9DFF9B3A555CB8606BF3F6EE7548DB7AF6147BF7DADAB6A828316C98FDDBD6A285080B13F9F936B553AA787A00002000494441542D36564C9D6AFFB6099120C424212AD9D2B6E464F1DE7BC2DFDFCE6DF3F717EFBD2792936DFABDC9FCE7909F6FFD9F8331833F87A8289BDA2684888A123D7B3AE41F05002A188D4EA72BEB3600B25BBD5A4C9EECC0FA333244256B3FD0464589D050BBB6E6AF6EDC1075EB5A796E66A6A85CD99E8D31F0E59762D8302BCFCDCF1741412231D1AE0DFA8BF942BC67F51BECB061223CDCBEEDF97FCD9B8BF3E7AD3FFDBDF7C4FCF9F66BCD5FF9F9895BB784566BE5E932FF39C4C68A7AF54CBE6AE33F0A4A99462FD4F2390A7004EEA200C5C8CF178B1639F612FFFDAFF5E72E5860B76614E9DD77AD3FF7A38FECD78EA22C5D6AFDB9D1D10ECD2742888556DF48898D75603E1142C4C4587FB3223FDF81F94408919828BEFEDAFAD3274CB05F538AB279B3A3CE8D8911B1B1D6570E00150C1105287B696965DD8247CFBD7B65DD029443A9A90EACFCC10307560E00E50B11052886562BDE78C3B197183DDAFA731D7D1765F66CEBCF75F4EFED9D77AC3FB7572FE1E767BFA61461BE1099D69D59B7AEE8D1C3BE8DF98BE6CD45B366569EABD58A850BEDDA1A232FBD64FDB9FFFEB7FDDA519469D3AC3F77E44873AFDAF28F0200150F110528DEBBEF8A55AB44F3E6F6AFB9470F111363FD44142144C78E0E6CDB9E3D367D6CF2F5157BF638E4D376F3E662D52A9B3ECB6AB5E2871FC49429F66BD3FF4B1462BE106B6CA9222C4C2C5CE8901035658A4D030B8510D3A73BB06D3131D64F4411423CFDB463FF1CAC9E882284A85BD7E49F83EDFF280050C1305D1E00EC8979B4E59AB26C57C78E65DD0EC88D3F73C0D1882800604F7C76012A3CFECC014763A01700000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A200000000900811050000008044882800000000244244010000002011220A00000000891051000000004884880200000040224414000000001221A20090DD9933677AF5EAD5AA55AB3A75EA54AE5C393232D2C21377EFDEDDBD7BF7962D5B0606067A7878DCBE7DDBA1ED0400C0BC69D3A6858686868484F8FAFA76EFDEDDF213172F5EDCB973E7264D9AD4AA552B2424C4712D9404110580EC7C7C7C9E7DF6591F1F9F9B376F6666665A7E62707070EFDEBD9D9D9D6FDFBE9D9D9DEDB81602006089F6EDDB77EDDA352121212525A5B0B0D0F2135BB66CD9BD7BF7B4B4B4A4A4A4FCFC7CC7B550121A9D4E57D66D0080E2A5A6A6FAF8F808210E1F3EDCA54B17CB4F8C8A8A0A0D0D1542C4C7C707040438AA7D7FD26834EA316FB04085C49F396C3479F2E4D5AB5777EDDAF5D0A143253A71D1A24573E7CE6DD0A0C1952B571CD4364970170540F950B56AD5523E11000047A0472B16110540F9A0FFB565E99C08008023D0A3158B8802000000402244140000000012D1967503009874FCF8F1264D9A54E081A7F9F9F9C78F1FBF78F1E2BD7BF76AD6ACD9A14387468D1AD958677A7AFAD9B367D3D2D21A366C181212E2ECEC5CEC2957AF5ED5E9748F3FFEB88D97068047993C7D567474746E6E6EA74E9D4AF3A277EEDC898C8C8C8F8F777373AB5FBF7ED7AE5D2B55AA64639D376FDEFCEDB7DFB2B3B35BB46851B76EDD62CB57A4EE8CBB2880A4962E5D3A7CF8F012ADB15BBE6CDFBE3D383878DEBC79B76FDFAE5DBBF6EDDBB7070D1AD4A143875F7FFDD5BA0AE3E2E2060E1C181010B064C992A8A8A8F9F3E73FFEF8E30B162CC8CDCD357F624A4A4A6868E8CE9D3BADBB2E0040AA3E6BCA9429E3C78F2FB5CBA5A4A40C1F3EBC55AB563FFCF083979797ABABEB575F7D151414B46CD9B2828202EBEA3C76EC589B366D5AB56AF5D9679F1D397264ECD8B14F3CF144444484F915E42A5477A603E0002929299191916BD7AEFDF4D34F4F9D3A55D2D3DF7DF7DDAA55AB5EBC78D1116D73908C8C8C3367CE7CFDF5D7274F9EBC77EF9E9992D9D9D92FBEF862A54A95B66CD9A2FF7C6E6EEEABAFBEEAEAEAFAF1C71F1B9FA52E037FF8F061E35757AE5CE9E9E9D9A64D9B1B376EA84FE6E5E54D9932455D68383E3EDE549376EEDCA9D56AB76EDD5AEC8F592CDE60810ACFF63FF3C2C242FB36A96CC9D667356AD4283030D0EAD30B0B0B6FDEBCF9DD77DFEDDAB5EBDAB56B050505660AEFDBB7CFD7D7B757AF5E7FFCF187FEF3C78F1FF7F1F169DDBA755C5C9CF15973E7CE154274EDDAD5F8A5DCDCDC3163C668349AD1A347DFBF7F5F7D3E2929A94B972E4A8FD6A0410353EDB1637756B618E805D8934EA7DBBF7FFFEAD5AB77EFDEADBF25D3ABAFBEBA7EFD7A4B061D092156AE5CB96CD9B27DFBF6356EDCD8612DB59BC2C2C22D5BB67CFAE9A7A74F9FD6FDD9733B3939F5EBD76FF9F2E50D1A34303E65CE9C391111119F7CF2C9F0E1C3F59F777171D9B871E3E5CB97A74F9FDEB871E3DEBD7B5BD8865DBB764D9932253030F0E0C1835E5E5EEAF35AADF6934F3E7177775FB66C99F91AFAF7EFFFD65B6F8D1A35AA4E9D3AEDDAB5B3F0BA0060891D3B76FCF7BFFF4D4949494D4D4D4949494949E9D1A34744444459B7CB3ECCF45953A74ECDCACA727575D56AB5CECECE1A8D465D904AF9189A9F9F5F5050909393939D9DFDC5175FA827464747AF59B3C6D3D3D3C5C545ABD52A27161616E6E5E5E5E5E5E5E6E62AFFBB61C3064F4F4F3BFE2CD7AE5DFBF8E38FC3C2C2D2D3D3D52703030367CD9A3561C204E3D5B4E2E3E35F7EF9E5CA952BEFD8B1C3A025EDDBB70F0B0BEBD5ABD7F0E1C32323239D9C2C1DB8346BD6AC0D1B36F4EFDF7FC3860DFACFFBFAFAEEDFBFBF4B972EB76FDF36737AC5E9CECA321F0115CB2FBFFCD2B66D5B537F6BE1E1E1965472E8D0216767E7B973E73ABAB57671FEFCF9279F7C52F9011F7BECB1152B561C387060C68C19CA335E5E5E870E1D3238E5F0E1C31A8DC6CDCD2D2323A3C83A376FDE2C84F0F7F74F4D4DD57FDED45D94F8F8F8EAD5AB0B21D6AD5B576485DF7EFBAD72A299BB284AFD9D3B77F6F3F3BB75EB56B13FB819BCC102155E49FFCC972F5FDEB06143FD2F50060F1EECE846960EF37D9625D327145AAD56FFC46FBEF9C692B3D2D3D38BBCAE157751F2F3F3E7CF9FEFE6E62684D06834AFBEFAEACE9D3BB76EDD1A1212A25CEB85175EC8CFCF3738AB5BB76E4208533F7E6161A1F23DDD92254B0C5E32751765EFDEBD4A10BA74E9529175BEF5D65BC2EC5D149DFDBAB3B2450F0AD8C792254B5C5D5DEBD6ADBB63C78ED3A74F7FF6D9674D9A34D17F271D387060B195DCBB77CFDFDFBF71E3C6D9D9D9A5D0661B7DF5D557EA97467DFBF6D51FDCF5DA6BAF29CF7B7B7B1BDCE3EEDBB7AF10A259B366A6AA4D484850CEFDE4934FF49F371551E6CD9BA73C7FFBF6ED222BDCBD7BB752C07C44512EEDE3E3D3A95327F3C5CCD3FF47B7A51E00D2B2EECF3C272767ECD8B1CA591523A214DB67EDDAB56BEB9FD47E415FE7CE9D9557BFFAEA2BFD136FDEBCF9C5175FAC58B1E2D5575FAD57AF9E52B856AD5A93264D5ABA74E9A64D9BC2C3C3B76EDD9A9B9B5BE4754B1A51D2D3D395B02184707777DFB56B97FA526C6CAC8B8B8BF2D25B6FBDA57FD6E9D3A795E7B76DDB66AAE6D75F7F5D08E1E3E363106F4C4594CE9D3B0B211E7FFC7153152A5F029A8F283A3B7567658B1E14B0556161E1C489138510B56BD7BE73E78EFA7C424282AFAFAFFA46FCF4D34F175B95F2D6B37FFF7E47B6D73EB66CD9A2DEB66EDBB6EDC3870FF55F3D79F2A4FA838F193346FFA5CA952B0B21BA74E962AAE69C9C1CE5C4010306E83F6F2AA274E9D2450851A9522553155A1E51743ADD7BEFBD2784F8E28B2F8A2D690A1105A8F0ACFE333F70E040458A2825EAB3F2F2F2DAB76F6F10519C9D9D8F1C3962E6ACACACAC162D5A0821AA55AB76F9F2650B1B56A288929E9EAE8E80D06834CA94747DCF3EFBACF2AA56ABBD76ED9AFAFC3FFFF94FE579E3F102AAD9B3672B65CE9F3FAFFF7C9111253F3F5F1910DEB76F5F53155A185174F6E8CECA162B7A01B69A3A75EAA79F7EEAE4E4141111E1EFEFAF3EEFE7E73764C810F561B18B0F5EB97265E5CA95A1A1A1DDBB7777545BEDE4F0E1C3A3468D5226DB787878848585797878E81768DEBCB97ABC79F3E6FBF7EF2BC759595919191942087777775395BBBABA2AEFD14949499634263939596946897F8CA24C9C38D1D3D373E6CC996A9B01C05EAA54A952D64DB09B92F6595AAD362C2CCC6049E2828282E1C387DFBD7BD7D45953A74E3D7FFEBC1062D3A64D8E584BB7B0B0F0A5975E3A75EA94F270DCB87183070F3628A3F668F9F9F99F7DF699FABCDA4999E9D1D4BEC9921E2D2D2D4D5901CC2E3D5A79EFCE8828804DF6EEDDBB6AD52A21C49831633A74E860F0AAFE58AF175E78C17C55D3A74FCFCDCD55BE5991D99D3B77860C19A22EA43873E6CCFAF5EB1B94F1F0F050DF61F3F3F3232323D5E795B161F7EEDD3355FF83070F94CAF5EF4199A1144B4B4B536FB3D8A27AF5EA63C68C494C4C54BE7F02003B329E6F5D7E59D167D5AD5B77EDDAB5064FDEBA754B1DFF66203C3C7CDDBA754288193366F4EFDFDFEAA69A316FDEBC1F7EF84139AE5AB5EA871F7E685CA6468D1AEAF1FEFDFBD5631F1F1FE5C04C8FA64EBBB7A447AB5EBD7A89BEA12BB6B672DD9D115100EBA5A5A5296FACAEAEAEEFBFFFBE7181ECEC6C21848787C7E2C58B274F9E6CA6AA0B172EECDAB52B2828A867CF9E0E6AADBD4C9E3C597DF7F4F2F27AF3CD378DCB141616AAE3B58410EA1754420865A06D7C7CBCA9FAD59794115CC5522A2C2C2C5427B1D8E8ADB7DE7276765EB76E9D240BFC03806CACEEB35E7EF9E5D1A3471B3CB97DFB76FDBB138ACB972F2BD357424343972C59624B6B4D397BF6AC7E26993C79B2B7B7B771B1ACAC2CFD53F2F2F29463A5F71142DCBA75CBD425941EAD468D1A06D3538BE4ECECAC7CD769A68B2C9172DD9D115100EBCD983143F9583C78F0603F3F3FE3024141418B162DFAFDF7DFD5D1A8A6286B0B8E1831C2F27509CBC4DEBD7BB76FDFAE3E1C3D7A74916FE8E9E9E9FA6B2E2B63B114EFBCF38E9393537C7CFC8913278ABCC4D6AD5B851001010123478EB4A449AFBFFE7AB56AD594B61559A0A47757EAD5ABD7AB57AF070F1E5498254101C0BE6CE9B356AD5AF5C4134F183C396DDA34FD7D7BB3B2B25E7CF1C58C8C0C5F5FDFAFBEFA4AABB5FF26193A9D6EFCF8F1EA8800AD566BEA9BC4D4D454FDB3D4874F3FFDB432C8CD5467F1E0C1833D7BF60821DE7EFB6D0B7F8477DE79470871E3C68DDF7FFFBDC80225EAD1CA777756D6936180F22A3636567DC7397EFCB82D55E5E4E428F78B4F9E3C69AFE63988C1AACA67CE9C29B2D84F3FFDA45F6CD0A041FAAFCE9F3F5F08F1D24B2F199F989C9C1C181858E4044AF5B6CCC183070D5E52524DC3860D1F3C7860F0526E6EAE3A41F3FAF5EB16FE98CAF76A1D3B76B4B0BC3EDE60810ACFEA3F73F5BDB15C4F97B7BDCF3A73E68CABABABC127D266CD9A656565290594110A4E4E4E3FFEF8A315F55B325DDEE05BADE79F7FDE54C9E79E7B4EBFE4850B17D4971212126AD5AAE5E4E4141313637CA2D295F4EEDDDB78A74EE58BCBCE9D3B1B9F357EFC7821C4F0E1C38D5F8A8B8B5316D90F0E0E36FFD319B4C1BAEEAC6CD183025652BF6E79F2C9276DAC6AC78E1D4208575757C9D71A3E76EC98FEDB74A3468D4C95FCFCF3CFF54B1A74C60505056FBEF9A6B3B3F3D8B163D3D2D2D4E77FFAE9A7BA75EB56AF5EDD60D7F9ECECECF8F8F8F0F070A5B6993367C6C5C5E9EFB9ABD3E9962E5DEAE6E6D6B66D5BFDFD7DE3E2E29E79E61975A6E3ECD9B3AF5DBB66B0F85891A2A2A29453F4176FB1101105A8F01EF18862973EEBA38F3E1246264E9CA8D3E9D43D1C172E5C685DE59644941E3D7AE85FDACC76ECEAAAC78A5F7EF945FFD5E8E8E8860D1BFAFBFB7FFFFDF7EA935959593367CE14423CF7DC73C9C9C9FAE59393932F5DBAA40C12AB59B3E6993367F4D702D5E974999999C3860D1342BCF6DA6BFAAB2A1F3B76AC5EBD7ACAFE98CECECE111111717171C65BB518B0A53B2B5BF4A08035929393D52D41FEFDEF7FDB58DBA4499384106DDBB6B5A592070F1E187FF82E2828B0A54E0303070ED47F9B9E3D7BB6A992CADE52AAB163C71A97397BF6EC33CF3CE3E6E6D6BC79F33E7DFAF8FBFB57AA5469ECD8B106EFE63A9D6EF7EEDD9E9E9E356AD4080808080808A85EBDBA878787F1D57FFBEDB79E3D7B7A79790D183060C28409BD7BF76ED6ACD9E6CD9B77EDDAA5DF984D9B3615FB93E6E4E428D3FD376CD860C12FE62F88284085570A114559FFD0E0C9070F1E187C3B6385FCFC7CFD6DAC0CA4A7A7E7E4E498AFC12E7D56616161EFDEBD8D53CAD2A54B9505307BF5EA657517566C4451560953B9BABA9AFAC5A6A7A71B2C7260BC7E7D4E4ECE071F7C50B3664D5F5FDF9E3D7B3EF5D453AEAEAE4D9A34D9B973A77185EDDAB5AB5AB56AAD5AB58282826AD5AAE5E5E5A5D56A8DC3DEEEDDBB434242FCFDFD5F79E59571E3C6B56BD7EE99679E3979F2A4BA39B2223636D6FCAFC296EEAC6CD18302D65056F1124268341A83EF3FACA07CCD3F69D2242BCEFDE5975F5E7BEDB58080801A356AF8F8F874EBD64DBD077DFDFAF5C68D1BDB38084D959C9CACAC34A23253B3C1E26666BE094B4D4D3D71E2C4F7DF7FFFF3CF3F17DB2F5A222525252A2AEAE0C183EAB0AEA4A4A4C3870F9F3F7F3E2E2EEEDEBD7BC637DC8BA44CD61F3D7A74491B4044012A3C474494B56BD7F6EEDDBB75EBD675EAD451F68F5AB06081F2D2E5CB97478C18111818181414E4E4E454B972E5E79E7BEEC08103256D764E4ECEA449937C7C7C3C3D3D1B366CA8BF01484242C2F4E9D36BD7AE1D1414A4D56A3B74E870F4E85153F5D8D267E94B4C4CAC59B3A6714A11420406061A7F5D65B96223CA942953F42FD7AB572F5325D5F5BE145AADD6D48D8BC2C2C28B172FEEDFBFFFC89123F6DAD63D3636F6D0A143515151EA0081DF7FFFFDD8B163172F5EBC7DFB766666A6259558DD9D952D7A50C01AA1A1A1CABB55FBF6ED6DAC2A2D2D4DF986A6A4FB2B6567674F9B364DA3D1346DDA342A2A4AF9E41D1616E6EBEBFBFBEFBFA7A5A5D5AF5FDFC9C9497F24952D366EDCA8FF365DB56A55536FD3D9D9D96E6E6EFA85CDECBC2BAD3973E60821EAD7AF5FD21389284085E78888B272E5CA6EDDBAD5AD5B57AD598928FFF9CF7F020202C2C2C2525353753A5D7A7ABABAFECACA952B4B74F52953A63CFBECB3F7EFDFBF7BF76EEDDAB5351ACDF6EDDB757F0EB25DB468917289E4E4E48E1D3BBAB8B8AC5AB5CAB812ABFBAC227DF7DD77452EC47CECD8315BAA2D36A2E8FF9E85101F7DF491A992CAE44955B366CD6C695899B0BA3B2B5BF4A04089C5C7C7AB6FA94B972EB5B1B6C3870F2B555DBC78D1F2B3D2D2D2DAB4692384E8DEBDBBC1CD87152B56F4EEDD5BD90DD7F679322A837D5DFAF4E99361C2BE7DFB0C3A9BB8B8387B35A3D4AC5FBF5E69BCF1580BF388284085E78888A25257725FB06041444444E7CE9DF5A7D8299485A4DCDCDC2CDF70FDC68D1B55AA54494949511EF6EBD74F08D1AA55ABBD7BF73668D0E0E79F7FD62F7CF5EA552727278D4673FAF469837AACEBB3CC3018186C97BED57C443977EE9CC1E58E1E3D6AAA475357165694BB7B113A1BBAB3B225F5F2A6809C949BE3CAB1F22E6F8B1B376E2807B56AD5B2F094FBF7EFF7EAD5EBA79F7E6AD8B0E1B66DDB0CD64579E38D377EFAE927252758B8B548B17272720C6E767FF7DD77954D50D291CAD7D7373838D82ECD284DCAAA294288B8B8B8B26D0980478A3A43E3DEBD7B6FBFFDF6E6CD9B8D47430D1A344808919393A3AE2352ACCD9B370F1D3A54DD8550596CF7E79F7FFEFBDFFFBE6BD7AE279F7C52BF70FDFAF55BB66CA9D3E90C663E08ABFA2CF3962C5962707521C4DCB9734F9F3E6D97FA8D7DFBEDB706CF74EAD4C9548F76E4C811FD924F3DF594835AE538E5B43B23A20025A62C732E84080A0A6AD4A8918DB55DBF7E5D39A852A58A85A7BCFEFAEBCA57712B57AEAC5AB5AAC1AB6E6E6EEA5490AE5DBBDAD83CC5B973E71E3E7C68DDB906EB149717EA7B7A6C6C6C993604C0A3459988228458BF7EFDF8F1E3EBD4A9635C46DD57C4F88680299B376F1E326488FAF0DAB56BCAC1E2C58B8BECC894AF962223236FDFBEADFFBC157D9679AEAEAEC65BCEE7E5E50D1D3AF4C1830776B98481E3C78F5B7D6EB98E28E5AB3B23A2002593959575F4E851E5D860C942EBDCB973470851A952251717174BCA87858529DB8074EFDEBD57AF5E4596B97AF5AA1042A3D174EAD4C9F6160A21CE9C39A3FFB06AD5AA999999D94549494931F841FAF7EF6F97369432F53DDD5EBBFC028025D481C4191919A3468D2AB28CB25FAD10222929C9923A2F5EBC989898D8B16347E5616A6AEAA54B9784108F3FFEB8A94D72D52D020DF6102C699F6589A54B971A3F79EDDAB5891327DAEB12FA0C7AB465CB9615D99D656767BFFDF6DBFA250302025AB76EED8826395439EDCE882840C91C397244DD43F099679EB1BDC2CCCC4C2184F1CD9022E5E5E5CD9A354B3936F5DE9D9292A2F4282D5AB450DF986C64B01563A74E9D3C3D3DDD8A121D1D9D9797A7967471713158AAB8BC50874328FF400050CAEAD4A9636A3095BA71B0DA1F9977FDFAF5418306A9A38223232395E1CACF3EFBACA9EDE1D59B274A985195A8CFB2C48A152BB66FDF2E840809093178E98B2FBED8B2658BBD2EA4B879F3667272B2FE33DDBA752BB23B7373733B74E8907EC92143861439B95F72E5B43B23A20025A33F254399B06823650095FA9598799B366DBA75EB9610A272E5CA7DFAF429B28CDAF7D86B228A10E2B7DF7ED37FA8EED76EECC71F7FD47FD8AB572FF5CDB17C51D35DF97A4F075061985A90575F6161A125553DFFFCF3FA3BEAAA9FBC4D0D06D6E974EA802E83E98E25EAB38A75E2C48977DE794708317CF8F093274F1A6C922884983061823A26CD2E0CBA330F0F8F162D5A1459F2EEDDBB06F75B860E1D6AC796949A72DA9D1151809251234ACB962D6BD7AE6D7B85CACD74F52B31F3366DDAA41C74EFDEDDDDDDBDC832EA722BF69A88228430F8CEC9CCF4128388F2F2CB2FDBAB0DA54CED95D5D10E00509A0CB241912C8C2806946E42A3D1182C57A5FAFDF7DFEFDDBBA71C1BF47425EAB3CC4B4D4D1D3264485E5E5EA3468DD6AE5D5BA54A95B0B030839A1F3C78306CD830FD9BF33632E8CE5AB56A65EA673970E080FEAFB77EFDFACA429AE54E39EDCE88284009DCBA75EB975F7E518E5F7CF145BBD4A9EC526FC9A4C0D4D4D493274F2AC7A666A1883FBF1EB3E3441461F49EDEB265CB228BFDFEFBEF172F5E541F06040428CBCE9447F7EFDF570E947D8E01A062484E4E56DEA89B366DEAE3E3536419B5AF11423469D244FF25CBFB2CF3743ADD8811236EDDBAE5E9E9191111A12C12D0AE5DBB050B1618943C75EAD4BC79F36CBC9CCAA03B335E4C4CF5CD37DFE83F9C3A75AABDDA50CACA69774644014A60EFDEBDCA819393D3B061C3EC52A7F276AF7E5F65C6F1E3C7D56F744C7DF5959494A4F43DCD9A35B3E308ABACAC2CF5B856AD5AA67AB52FBEF842FFE17BEFBDE7E1E161AF3694B2F4F474E540F90702808A411D0C6CE64EFBFEFDFB9583A64D9B1A2C2966799F65DEA2458B94C5F13FFDF4D3A64D9BAACFCF9E3DDB7894F2B265CB0E1C3860E31515FADD99300A60AAFBF7EFEBAF4DFCD8638F8D1F3FDE2E0D287DE5B43B23A20025F0F5D75F2B072FBCF082C1DEB456533EEE5BF276AF4E5EAC5CB972E3C68D8B2C53EC0863EBE80F3B6ED0A0419165743A9DFEBCC6264D9A985A8BA65C50FF45CAE95C1A002852B183810B0A0AD41D788DEF845BDE679971E8D021E56EC9A851A35E7DF555FD979C9C9CB66CD962B0D64B6161E1C891235352526CB9A8C260168DA91E2D2222423FCC2C59B2C48E2B9895B272DA9D1151004BDDBA754B7D679F3E7DBA1535C4C5C519DC62164228B3030B0A0A8A9DC7A6BE3BB76CD9D2D41A2CEAF74CF68D287E7E7EEAB1A95B28DBB66DBB79F3A6FA70E9D2A5CECECE766C432953DFD38DA76F0240F9A50E06367537FED8B16369696942884A952A4D9A34C9E055CBFB2C53121313870E1D5A5050D0A449937FFFFBDFC605020303D50DD15577EEDC193D7AB47557D4A7DF9D09133D9A4EA7FBE4934FD4876DDAB4B1D7D0EE32514EBB33220A60A9D5AB572BE3AC5E7EF965756F440B454747878686D6AD5B372121C1E025F52DA3D8E5EDD53DDACD6CD6AECC5637D3F758E7E9A79F568FBDBCBC8C0BE874BAF7DF7F5F7D3878F0E0BE7DFBDAB101A5EFEEDDBBCA41F97A4F0700339292927EFDF5576176228A3A6477EAD4A9C6652CEFB38A545050F0F2CB2FFFF1C71F952A558A88883035F468C08001AFBDF69AC193BB77EF5EBD7AB51517D5A7DF9D09133DDAF6EDDB2F5CB8A01CBBBBBBAF59B3A63CAE35AC2AA7DD191105B0C8DDBB773FFBEC3321849B9BDBD8B1632F5CB8A00EEE2CD6975F7ED9B163C7A8A8A84E9D3A356FDEDCE0D5860D1B2A07C56E12AC9634D5AFFCFCF3CFCADEB14D9B3635733FF7ECD9B3EFBEFBEEFAF5EB2D5FDCA377EFDEEA7191DDD2860D1B62626294E3D6AD5BEBAF6E594E29537AAA55AB66C9BA9F00502EA863014C2D4E75F5EA5565C86ED3A64D8B9CA46E799F55A4B973E74646460A21D6AE5D6BBC118ABE152B561817983973A6DAD758272020407FFE505CEAE400000FFF4944415489718F969595F5EEBBEF2AC71A8D66D3A64DE574212F5539EDCE882880453EF8E003E556694E4E4E8F1E3D9A376FEEEDEDEDEDEDDDAA55AB71E3C67DFDF5D7A6C6C8E6E4E4CC9C39B3A0A0A052A54AEBD6AD332ED0A0410365732E83F5D78D3569D2A44A952AC2684112455656D6DFFFFE77E5D8CC28AF5F7FFDB55DBB764B962C19376E9CC10860335E78E185C0C040E5383A3ADA6099CBEBD7AF4F9B364D390E0808F8F6DB6FCBD79CBC229D3A754A08A16EC60C00B653DF3C9509EBB697292935A25CB972A5C80293264DCAC9C9A952A54A7878B89B9B9B7101CBFB2C637BF7EE5536921F3B76EC881123CC17F6F4F4346E437676F6D0A1430DA6BC9794FEE8B513274E18BC3A73E6CCCB972F2BC70B162C183264882DD7924139EDCE882840F17EFAE9A7952B571A3F9F9E9E7EF6ECD9F5EBD70F1932A466CD9AAD5AB59A3163C6EEDDBBF5E3CA9A356B1212127C7D7D0F1D3AD4A851A322EB5756072EF6EDBE72E5CAB367CF16421C3972C4A07FCACECEEEDFBFFFF9F3E795876622CAEEDDBB73737395E32FBFFCF2EAD5ABE62FAAD06AB5EAEDF57BF7EE7DF7DD77EA4B7171713D7BF65416A06CD5AA556464A45DB68B2973CA7BBA7DC7CB0178C4FDF1C71F060766CA981949A596B1FC7EBE428D2867CE9C31D8C45008F1FEFBEF7FFFFDF75E5E5EFBF6EDD35F65CB80857D567E7E7E7676F6DDBB77E3E2E2CE9D3BF7F9E79F0F1B364CA7D3393B3B376DDAF4F4E9D377EFDECDC9C929F2DCBCBCBC9C9C9C468D1AE90F2156FCFAEBAF6FBEF9668E1E3359AE4863C78E7DEAA9A794E3AFBEFA4AFFF40F3EF8E0D34F3F154268B5DAE5CB97DB71B1E332545EBB331D00B312131395E19BBD7BF79E3367CEB871E33A75EA54ECE2E2952B576ED2A4496868A856ABAD57AFDEE5CB97CD5C42C93FBEBEBEC536262B2B4B192AB67CF972F5C973E7CEB568D1E2B5D75EAB5FBFBE1042A3D12427279BAA21222242BF9DEBD6ADB3FC57F1E1871F2A67F9F8F8AC5DBBF6C891231F7CF081726347083171E2C4ECEC6CCB6B93D9AD5BB7941FEAC48913253D973758A0C22BE99FF9993367B66CD9B262C50AFD2FAA264F9EBC71E3C6B0B0B0BCBC3C9D4E171D1DBD65CB968F3EFA487F8DA9D1A3476FD8B0212C2C2C333353BF1EFD451D478E1CB96EDDBAB0B0B0F4F474F3CD502743366EDC78D1A245CD9A357BF0E081F2527676B6F215584848C8D9B367CDD763619F3577EE5CF31DA510A26EDDBA459EFBC20B2F147BAEEADCB97306A7376AD4283030D04CDBE2E2E29E78E209E5F4214386ECDBB76FFBF6ED3D7AF4509E090E0E3E7EFCB8F99FAEBCB0A53B2B5BF4A0803977EFDE557A82193366141414A8CFE7E7E71F3F7E7CFEFCF9EDDBB737B36E558D1A35162F5EACF601A6C4C5C5292B74C5C6C616DBA4CCCCCC9123473A3B3B0F1D3AF49D77DEE9DCB973DDBA75C3C3C3EFDCB9A35CB469D3A6664E2F2C2C9C3C7972B56AD5424242060C18307FFE7CCB7E13FFE7BBEFBE33D8E8AA72E5CA6FBCF1C62FBFFC52A27A24B76DDB36A597D2FF47B790FE2FC7116D0350E64AFA673E6DDA347777F76AD5AAD5AA552B3030303838D8DFDFBF468D1A952A55D26AB51919193A9D6EDCB87106656AD7AEEDE3E353B97265AD56ABF40E4A3D55AB56AD59B3A67E192F2F2F17179762DF87B76EDDAAB479F2E4C9858585D3A64DAB5FBFFE8C1933264F9E5CAF5EBD9A356BCE9F3FFFE1C387C5FE3816F65973E7CE757171F1F4F4AC56AD9AAFAF6F4040409D3A758283838382820202026AD6AC59AD5AB5060D1A1479EEC081032B57AE5CA3460D3F3FBFC0C0C0A0A0A0E0E0E03A75EAA835040606D6AA55AB7AF5EAEEEEEE5644149D4E9796963665CA1465CB4855EBD6AD376EDC98959555EC2FA1BCB0A53B2B5B1A5D09EF8E018F9465CB96EDDEBD7BC68C19FDFAF53355E6FEFDFB478F1E8D8E8EBE76EDDA8D1B376263639D9C9C424242FAF6ED3B76EC5883B73F53FAF4E9B36FDFBE55AB5619AFF058A43B77EE444747DFBE7DBB61C386DDBA757376760E0F0F5776939C3469D2AA55AB2CA9E4C30F3FCCC9C9993F7FBE2585F5C5C6C65EBA74293F3FBF418306F5EAD57375752D690D929B3061C29A356BE6CD9BB770E1C2929EABBFF00B6FB04085544EFFCCC78F1FAFACFBB263C70EE536C5A54B974E9C38919B9BFBC4134FB46FDFBEC8C927452A699F55CA424242323232D41B0866E4E4E49C3973262929A966CD9A8F3FFEB8AFAF6F2934AF34D9D29D952D220A20856DDBB60D1E3C383434F4E8D1A3D6D5F0FAEBAF2BD3F1232222060F1E6CC92913274E6CDAB4E91B6FBC61DD152BAADCDCDCDAB56BA7A5A55DBD7AF5B1C71E2BE9E9E5F4B30B00CB95D33FF3468D1A5DBA74C9C9C9292525C5DBDBDB96AA6CEFB31CCAF28852B1D9D89D952DA6CB0352E8D7AF9F9F9F5F5454D4B56BD7ACAB419D0469F994B8989898D6AD5B5B77B90A6CCF9E3DA9A9A97DFAF429776FE800604A4242C2A54B9784102D5AB4B0319F087BF4592805E5BA3B23A20052707171F9DFF6EE2FB4E6FF0FE0F8689AD3280C1D174AE40A933F9190682837C87F175CFA5773697263A576614A0AB59B513442DCB8B296A4144991144209CB522EB6E6CB66BF8BFD7EF2E36B3B3BE773765EE7783CAEE69CF7E7EC7DE1EC7D9EE77DCEE7D3D0D0D0D7D7D7D8D898C5E11F3E7CE83F49E2AC59B3323CF1F9FBF7EF5FBE7C397FFEFC2C7E5D693B7EFC78FFB95C0A3D1180C4FC781B6BC58A15B93F5A8E6B16C3A3A89733890251ECDEBD7BC99225CDCDCDEDEDED433DF6C7DA33C0E9867FD1D4D4545B5B5B5E5E3ED4DF55DA5A5B5BEFDDBBB777EFDE9F4F980350ECB2D8691F582E6B16C3A0D897338902518C1831E2F4E9D3DFBE7DABABAB1BEAB1B76EDDEAFF61D9B265998C7FF7EE5D5353936FA1FCA2B7B7B7AEAE6EFCF8F145F7B5428081B5B5B5F5FF90D425FC7259B3C8B71258CE240A04326FDEBC23478E9C3F7FBEB5B535C3437A7B7B6FDFBE7DF5EAD5FE7FA652A9410FF9FAF5EBF6EDDB0F1F3E3C6EDCB8ECE75A8A1A1B1B1F3E7C78F6ECD9091326147A2E0089B971E346FF857A3359233297C59AC5F02881E5CC19BD2096BEBEBE4D9B363D7AF4E8C1830713274E1C60646D6DEDB973E7FA4FA8FFF3ED15151563C78EBD7CF9F2AA55ABFEF5C0FDFBF77777773737372739EFE2F7E4C993458B16EDD9B3E7E4C993B93C4E919EEA07C85CB13CCD3F7FFE3C6FDEBC77EFDE7DFBF6EDE7DB53A9545555D5D3A74F7F5C7B376B99AF59C3E92F3FA35752CB5961491408A7ABAB6BF9F2E5A954AAADAD6D80B3D4DFBF7FFFD9B367A3478FAEA8A8A8A8A8183972E43FFFF3FDFBF70D1B36FC69ED79FEFCF9CC99337F5E62696F6F5FBC78F1C2850BAF5CB9D27F49B2AC15CB6B17206BC5F234FFFEFD7B4B4B4B5959592A954AA55223478EFCF2E54BFF32914AA5323C3DFDA0325CB386D3DF9C28092E6785255120A24F9F3EAD5DBB76C68C192D2D2D45FD27A628747676AE5CB972FAF4E9172E5C18356A548E8F562CAF5D80AC799AFF22DA9A555D5DDDD9D9F9EAD5AB424F64B825BB9C1556E1FF1B01BFABAAAABA73E74E5555D58B172F0A3D97D2D7D6D6B679F3E64B972E15FB1F74808288B6666DD9B265DBB66D859E450194D2726617052049DE5E8592E7690EF966170500000844A2000000814814000020108902000004225100008040240A000010884401000002912800004020120500000844A2000000814814000020108902000004225100008040240A000010884401000002912800004020120500000844A2000000814814000020108902000004225100008040240A000010884401000002912800004020120500000844A2000000814814000020108902000004225100008040240A000010884401000002912800004020120500000844A2000000814814000020108902000004225100008040240A000010884401000002912800004020120500000844A2000000814814000020108902000004225100008040240A000010884401000002912800004020120500000844A2000000814814000020108902000004225100008040240A000010884401000002912800004020120500000844A2000000814814000020108902000004225100008040240A000010884401000002912800004020120500000844A2000000814814000020108902000004225100008040240A000010884401000002912800004020120500000844A2000000814814000020108902000004225100008040240A00001088440100000291280059EAEAEA3A78F0E088FFF7F3805FEE5ABD7AF59B376F0A3459201B1D1D1D3B77EECCFC69BE73E7CE8E8E8E42CD164A864401C8527373F3A953A7321FDFDADABA7EFDFAFCCD0748DCD9B3675B5A5A321FDFD2D272ECD8B1FCCD07FE121205204B2F5EBC18EA211F3F7ECCC74C803CB976EDDA500FB97DFB761E26027F17890290A5B56BD70EF590D9B367E76326409E6CDAB469180E017E31A2AFAFAFD07300284A5D5D5D63C68C19D22177EFDE5DBA74699EE60324AEA3A363F2E4C9433AE4F5EBD7D3A64DCBCF74E06F611705204B959595F5F5F5998F4FA7D3FA048ACBA449936A6A6A321F5F5353A34F20771205207BBB76EDCA7CF0912347F23713204F8E1E3D9AA7C1C09FF8A017404EE6CE9DFBF8F1E34C46767676565656E67B3E40E2A64C99D2DEDE3EE8B0743AFDF6EDDBF2F2F26198129436BB2800393973E64C26C36A6B6BF50914A90CB740F7EDDBA74F201176510072D2D3D33375EAD441DF617DFCF8F19C397386674A40B2323C37869D52488A5D14809C949797EFDBB76FE031D5D5D5FA048A576565E58E1D3B061EB363C70E7D0249B18B0290AB41DF61BD79F3E6BA75EB866D3E40E29E3C79525D5D3DC000A7148704D94501C8D5A0EFB0AE59B366D82603E4C39C3973064894EAEA6A7D0209922800093870E0C09FEEAAAFAFF70D5A2801870E1DCAE22E200B3EE805908C3F9D96D4A5A6A134F4F4F48C1A35EA5FEFF2457948965D1480649C3871E2F71B5D6A1A4A467979797D7DFDEFB7D7D7D7EB1348965D14C8C89B376FD6AF5F9FE115FA00000A229D4E5FBD7AB5D8BF1C25512023995F411C00A080D2E9F4DBB76F8BFA6B903EE8050000A563D0AB09C7275120230D0D0DE974BAD0B3000018C4C58B178B7A0BA5CC07BD60481E3E7C58E8295004AE5CB9D2DDDDBD75EBD6D1A347177A2E40F27A7A7AAE5FBF5E5656B671E3C6627F2148E959B06041A1A7900089024320510080C84A23517CD00B00000844A2000000814814000020108902000004225100008040240A000010884401000002912800004020120500000844A2000000814814000020108902000004225100008040240A000010884401000002912800004020120500000844A200000081481400002010890200000422510000804046F4F5F5157A0E000000FF65170500000844A2000000814814000020108902000004225100008040240A000010884401000002912800004020120500000844A2000000814814000020108902000004225100008040240A000010884401000002912800004020120500000844A2000000814814000020108902000004225100008040240A000010884401000002912800004020120500000844A2000000814814000020108902000004225100008040240A000010884401000002912800004020120500000844A2000000814814000020108902000004F21F99EDA05AFAE70AD20000000049454E44AE426082>|png>|0.6par|||>|<label|fig9.12>Illustration
      of the E step of the EM algorithm. The <math|q> distribution is set
      equal to the posterior distribution for the current parameter values
      <math|\<theta\><rsup|old>>, causing the lower bound to move up to the
      same value as the log like- lihood function, with the KL divergence
      vanishing.>
    </padded-center>
  </hidden>|<\hidden>
    In the subsequent M step, the distribution <math|q(Z)> is held fixed and
    the lower bound <math|\<cal-L\>(q,\<theta\>)> is maximized with respect
    to <math|\<theta\>> to give some new value <math|\<theta\><rsup|new>>.
    This will cause the lower bound <math|\<cal-L\>> to increase (unless it
    is already at a maximum), which will necessarily cause the corresponding
    log likelihood function to increase.\ 

    Because the distribution <math|q> is determined using the old parameter
    values rather than the new values and is held fixed during the M step, it
    will not equal the new posterior distribution
    <math|p(Z\|X,\<theta\><rsup|new>)>, and hence there will be a nonzero KL
    divergence.\ 

    The increase in the log likelihood function is therefore greater than the
    increase in the lower bound, as shown in Figure <reference|fig9.13>.
  </hidden>|<\hidden>
    <\padded-center>
      <\small-figure|<image|image/fig_9_13_em_m.png|.45par|||>>
        <label|fig9.13>Illustration of the M step of the EM algorithm. The
        distribution <math|q(Z)> is held fixed and the lower bound
        <math|L(q,\<theta\>)> is maximized with respect to the parameter
        vector <math|\<theta\>> to give a revised value \<theta\>new. Because
        the KL divergence is nonnegative, this causes the log likelihood
        <math|ln p(X\|\<theta\>)> to increase by at least as much as the
        lower bound does.
      </small-figure>
    </padded-center>
  </hidden>|<\hidden>
    If we substitute <math|q(Z) = p(Z\|X, \<theta\><rsup| old> )> into Eq.
    (<reference|9.71>), we see that, after the E step, the lower bound takes
    the form\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|L<around*|(|q,\<theta\>|)>>|<cell|=>|<cell|<big|sum><rsub|Z>p<around*|(|Z\|X,\<theta\><rsup|old>|)>ln
      p<around*|(|X,Z\|\<theta\>|)>-<big|sum><rsub|Z>p<around*|(|Z,X,\<theta\><rsup|old>|)>ln
      p<around*|(|Z\|X,\<theta\><rsup|old>|)>>>|<row|<cell|>|<cell|=>|<cell|\<cal-Q\><around*|(|\<theta\>,\<theta\><rsup|old>|)>+cons>>>>
    </eqnarray*>

    where the constant is simply the negative entropy of the <math|q>
    distribution and is therefore independent of <math|\<theta\>>. Thus in
    the M step, the quantity that is being maximized is the expectation of
    the complete-data log likelihood, as we saw earlier in the case of
    mixtures of Gaussians.

    Note that the variable <math|\<theta\>> over which we are optimizing
    appears only inside the logarithm. If the joint distribution
    <math|p(Z,X\|\<theta\>)> comprises a member of the exponential family, or
    a product of such members, then we see that the logarithm will cancel the
    exponential and lead to an M step that will be typically much simpler
    than the maximization of the corresponding incomplete-data log likelihood
    function <math|p(X\|\<theta\>)>.
  </hidden>|<\hidden>
    The operation of the EM algorithm can also be viewed in the space of
    parameters, as illustrated schematically in Figure <reference|fig9.14>.
    Here the red curve depicts the (in-complete data) log likelihood function
    whose value we wish to maximize. We start with some initial parameter
    value <math|\<theta\><rsup|old>>, and in the first E step we evaluate the
    posterior distribution over latent variables, which gives rise to a lower
    bound <math|\<cal-L\>(\<theta\>, \<theta\><rsup|(old)>)> whose value
    equals the log likelihood at <math|\<theta\><rsup|(old)>>, as shown by
    the blue curve.\ 

    Note that the bound makes a tangential contact with the log likelihood at
    <math|\<theta\><rsup|(old)>>, so that both curves have the same gradient.
    This bound is a convex function having a unique maximum (for mixture
    components from the exponential family). In the M step, the bound is
    maximized giving the value <math|\<theta\><rsup|(new)>>, which gives a
    larger value of log likelihood than <math|\<theta\><rsup|(old)>>. The
    subsequent E step then constructs a bound that is tangential at
    <math|\<theta\><rsup|(new)>> as shown by the green curve.
  </hidden>|<\hidden>
    <\padded-center>
      <small-figure|<image|image/fig_9_14_em_parameter.png|0.5par|||>|<label|fig9.14>The
      EM algorithm involves alternately computing a lower bound on the log
      likelihood for the cur- rent parameter values and then maximizing this
      bound to obtain the new parameter values.>
    </padded-center>
  </hidden>|<\hidden>
    For the particular case of an independent, identically distributed data
    set, <math|X> will comprise N data points <math|{\<b-x\><rsub|n>}> while
    <math|Z> will comprise N corresponding latent variables
    <math|{\<b-z\><rsub|n>}>, where <math|n=1,\<cdots\>,N>. From the
    independence assumption, we have <math|p(X, Z) =
    <big|prod><rsub|n>p(\<b-x\><rsub|n>,\<b-z\><rsub|n> )> and, by
    marginalizing over the <math|{\<b-z\><rsub|n>}> we have <math|p(X)
    =<big|prod><rsub|n>p<around*|(|\<b-x\><rsub|n>|)>>. Using the sum and
    product rules, we see that the posterior probability that is evaluated in
    the E step takes the form

    <\equation*>
      p<around*|(|Z\|X,\<b-theta\>|)>=<frac|p<around*|(|X,Z\|\<b-theta\>|)>|<big|sum><rsub|Z>p<around*|(|X,Z\|\<b-theta\>|)>>=<frac|<big|prod><rsub|n=1><rsup|N>p<around*|(|\<b-x\><rsub|n>,\<b-z\><rsub|n>\|\<b-theta\>|)>|<big|sum><rsub|Z><big|prod><rsub|n=1><rsup|N>p<around*|(|\<b-x\><rsub|n>,\<b-z\><rsub|n>\|\<b-theta\>|)>>=<big|prod><rsub|n=1><rsup|N>p<around*|(|\<b-z\><rsub|n>\|\<b-x\><rsub|n>,\<b-theta\>|)>
    </equation*>

    and so the posterior distribution also factorizes with respect to
    <math|n>. In the case of the Gaussian mixture model this simply says that
    the responsibility that each of the mixture components takes for a
    particular data point <math|x<rsub|n>> depends only on the value of
    <math|x<rsub|n>> and on the parameters <math|\<theta\>> of the mixture
    components, not on the values of the other data points.

    We have seen that both the E and the M steps of the EM algorithm are
    increas- ing the value of a well-defined bound on the log likelihood
    function and that the complete EM cycle will change the model parameters
    in such a way as to cause the log likelihood to increase (unless it is
    already at a maximum, in which case the parameters remain unchanged).
  </hidden>|<\hidden>
    <tit|posterior distribution>

    We can also use the EM algorithm to maximize the posterior distribution
    <math|p(\<theta\>\|X)> for models in which we have introduced a prior
    <math|p(\<theta\>)> over the parameters.\ 

    To see this, we note that as a function of <math|\<theta\>>, we have

    <\equation*>
      p(\<theta\>\|X) = p(\<theta\>, X)/p(X)
    </equation*>

    and so\ 

    <\equation*>
      ln p(\<theta\>\|X) = ln p(\<theta\>, X) \<minus\> ln p(X).\ 
    </equation*>

    \;
  </hidden>|<\hidden>
    Making use of the decomposition Eq. <eqref|9.70>, we have\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|lnp(\<theta\>\|X) >|<cell|=>|<cell|
      \<cal-L\>(q,\<theta\>)+KL(q\<\|\|\>p)+ln p(\<theta\>)\<minus\>ln
      p(X)>>|<row|<cell|>|<cell|\<leqslant\>>|<cell| \<cal-L\>(q, \<theta\>)
      + ln p(\<theta\>) \<minus\> ln p(X)>>>>
    </eqnarray*>

    where <math|ln p(X)> is a constant. We can again optimize the right-hand
    side alternately with respect to <math|q> and <math|\<theta\>>. The
    optimization with respect to <math|q> gives rise to the same E- step
    equations as for the standard EM algorithm, because q only appears in
    <math|L(q,\<theta\>)>. The M-step equations are modified through the
    introduction of the prior term <math|ln p(\<theta\>)>, which typically
    requires only a small modification to the standard maximum likeli-hood
    M-step equations.
  </hidden>|<\hidden>
    <tit|generalized EM>

    The generalized EM, or GEM, algorithm addresses the problem of an
    intractable M step. Instead of aiming to maximize
    <math|\<cal-L\>(q,\<theta\>)> with respect to <math|\<theta\>>, it seeks
    instead to change the parameters in such a way as to increase its value.
    Again, because <math|\<cal-L\>(q,\<theta\>)> is a lower bound on the log
    likelihood function, each complete EM cycle of the GEM algorithm is
    guaranteed to increase the value of the log likelihood (unless the
    parameters already correspond to a local maximum).\ 

    One way to exploit the GEM approach would be to use one of the nonlinear
    optimization strategies, such as the conjugate gradients algorithm,
    during the M step.\ 

    Another form of GEM algorithm, known as the expectation conditional
    maximization, or ECM, algorithm, involves making several constrained
    optimizations within each M step (Meng and Rubin, 1993). For instance,
    the parameters might be partitioned into groups, and the M step is broken
    down into multiple steps each of which involves optimizing one of the
    subset with the remainder held xed.
  </hidden>|<\hidden>
    We can similarly generalize the E step of the EM algorithm by performing
    a partial, rather than complete, optimization of
    <math|\<cal-L\>(q,\<theta\>)> with respect to <math|q(Z)> (Neal and
    Hinton, 1999).\ 

    As we have seen, for any given value of <math|\<theta\>> there is a
    unique maximum of <math|\<cal-L\>(q,\<theta\>)> with respect to
    <math|q(Z)> that corresponds to the posterior distribution
    <math|q<rsub|\<theta\>>(Z) = p(Z\|X, \<theta\>)> and that for this choice
    of <math|q(Z)> the bound <math|\<cal-L\>(q,\<theta\>)> is equal to the
    log likelihood function <math|ln p(X\|\<theta\>)>.\ 

    It follows that any algorithm that converges to the global maximum of
    <math|\<cal-L\>(q,\<theta\>)> will nd a value of <math|\<theta\>> that
    is also a global maximum of the log likelihood <math|ln p(X\|\<theta\>)>.\ 

    Provided <math|p(X,Z\|\<theta\>)> is a continuous function of
    <math|\<theta\>> then, by continuity, any local maximum of
    <math|\<cal-L\><math|(q,\<theta\>)>> will also be a local maximum of
    <math|ln p(X\|\<theta\>)>.
  </hidden>|<\hidden>
    Consider the case of N independent data points
    <math|x<rsub|1>,\<cdots\>,x<rsub|N>> with corresponding latent variables
    <math|z<rsub|1>,\<cdots\>,z<rsub|N>>. The joint distribution
    <math|p(X,Z\|\<theta\>)> factorizes over the data points, and this
    structure can be exploited in an incremental form of EM in which at each
    EM cycle only one data point is processed at a time.\ 

    In the E step, instead of recomputing the responsibilities for all of the
    data points, we just re-evaluate the responsibilities for one data point.\ 

    It might appear that the subsequent M step would require computation
    involving the responsibilities for all of the data points. However, if
    the mixture components are members of the exponential family, then the
    responsibilities enter only through simple sufcient statistics, and
    these can be updated efciently.

    Consider, for instance, the case of a Gaussian mixture, and suppose we
    perform an update for data point <math|m> in which the corresponding old
    and new values of the responsibilities are denoted
    <math|\<gamma\><rsup|old>(z<rsub|mk>)> and
    <math|\<gamma\><rsup|new>(z<rsub|mk>)>. In the M step, the required
    sufcient statistics can be updated incrementally.
  </hidden>|<\shown>
    For instance, for the means the sufficient statistics are defined by Eq.
    <eqref|9.17> and <eqref|9.18> from which we obtain

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-mu\><rsub|k><rsup|new>>|<cell|=>|<cell|\<b-mu\><rsub|k><rsup|old>+<around*|(|<frac|\<gamma\><rsup|new><around*|(|z<rsub|mk>|)>-\<gamma\><rsup|old><around*|(|z<rsub|mk>|)>|N<rsub|k><rsup|new>>|)><around*|(|\<b-x\><rsub|m>-\<mu\><rsub|k><rsup|old>|)>>>|<row|<cell|N<rsub|k><rsup|new>>|<cell|=>|<cell|N<rsub|k><rsup|old>+\<gamma\><rsup|new><around*|(|z<rsub|mk>|)>-\<gamma\><rsup|old><around*|(|z<rsub|mk>|)>>>>>
    </eqnarray*>

    The corresponding results for the covariances and the mixing coefficients
    are analogous.

    Thus both the E step and the M step take fixed time that is independent
    of the total number of data points. Because the parameters are revised
    after each data point, rather than waiting until after the whole data set
    is processed, this incremental version can converge faster than the batch
    version.\ 

    Each E or M step in this incremental algorithm is increasing the value of
    <math|\<cal-L\>(q, \<b-theta\>)> and, as we have shown above, if the
    algorithm converges to a local (or global) maximum of <math|\<cal-L\>(q,
    \<b-theta\>)>, this will correspond to a local (or global) maximum of the
    log likelihood function <math|ln p(X\|\<b-theta\>)>.
  </shown>>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|10>
    <associate|info-flag|minimal>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-packet|11>
    <associate|page-type|16:9>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|9.1|<tuple|1|4>>
    <associate|9.10|<tuple|9|?>>
    <associate|9.11|<tuple|10|?>>
    <associate|9.13|<tuple|11|?>>
    <associate|9.14|<tuple|12|?>>
    <associate|9.17|<tuple|13|?>>
    <associate|9.18|<tuple|14|?>>
    <associate|9.19|<tuple|15|?>>
    <associate|9.2|<tuple|2|6>>
    <associate|9.22|<tuple|16|?>>
    <associate|9.3|<tuple|3|1>>
    <associate|9.4|<tuple|4|1>>
    <associate|9.40|<tuple|17|?>>
    <associate|9.47|<tuple|18|1>>
    <associate|9.5|<tuple|5|?>>
    <associate|9.55|<tuple|19|?>>
    <associate|9.6|<tuple|6|?>>
    <associate|9.63|<tuple|20|?>>
    <associate|9.7|<tuple|7|?>>
    <associate|9.70|<tuple|21|1>>
    <associate|9.71|<tuple|22|1>>
    <associate|9.72|<tuple|23|1>>
    <associate|9.9|<tuple|8|?>>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-10|<tuple|8|?>>
    <associate|auto-11|<tuple|3|?>>
    <associate|auto-12|<tuple|9|?>>
    <associate|auto-13|<tuple|10|?>>
    <associate|auto-14|<tuple|4|1>>
    <associate|auto-15|<tuple|11|1>>
    <associate|auto-16|<tuple|12|?>>
    <associate|auto-17|<tuple|13|?>>
    <associate|auto-18|<tuple|14|1>>
    <associate|auto-2|<tuple|1|?>>
    <associate|auto-3|<tuple|2|?>>
    <associate|auto-4|<tuple|3|1>>
    <associate|auto-5|<tuple|2|?>>
    <associate|auto-6|<tuple|4|?>>
    <associate|auto-7|<tuple|5|?>>
    <associate|auto-8|<tuple|6|?>>
    <associate|auto-9|<tuple|7|?>>
    <associate|fig9.1|<tuple|1|?>>
    <associate|fig9.12|<tuple|12|?>>
    <associate|fig9.13|<tuple|13|?>>
    <associate|fig9.14|<tuple|14|?>>
    <associate|fig9.2|<tuple|2|?>>
    <associate|fig9.3|<tuple|3|1>>
    <associate|fig9.4|<tuple|4|?>>
    <associate|fig9.5|<tuple|5|?>>
    <associate|fig9.6|<tuple|6|?>>
    <associate|section9.1|<tuple|1|?>>
    <associate|section9.2|<tuple|2|?>>
    <associate|section9.3|<tuple|3|?>>
    <associate|section9.4|<tuple|4|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||Illustration of the
      K-means algorithm using the re-scaled Old Faithful data
      set.>|<pageref|auto-2>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|2>||Plot of the cost
      function <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|J>>
      given by Eq. (<reference|9.1>) after each E step (blue points) and M
      step (red points) of the K-means algorithm for the example shown in
      Figure <reference|fig9.1>. >|<pageref|auto-3>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3>||Two examples of the
      application of the K-means clustering algorithm to image segmentation
      show- ing the initial images together with their K-means segmentations
      obtained using various values of K. >|<pageref|auto-4>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4>|>
        Graphical representation of a mixture model, in which the joint
        distribution is expressed in the form
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|p(x,z)
        = p(z)p(x\|z)>>.
      </surround>|<pageref|auto-6>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5>|>
        \ Example of 500 points drawn from the mixture of 3 Gaussians shown
        in Figure 2.23. (a) Samples from the joint distribution
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|p(z)p(x\|z)>>
        in which the three states of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|z>>,
        corresponding to the three components of the mixture, are depicted in
        red, green, and blue, and (b) the corresponding samples from the
        marginal distribution <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|p(x)>>,
        which is obtained by simply ignoring the values of
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|z>>
        and just plotting the <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|x>>
        values. The data set in (a) is said to be complete, whereas that in
        (b) is incomplete. (c) The same samples in which the colours
        represent the value of the responsibilities
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<gamma\>(z<rsub|n
        k>)>> associated with data point xn, obtained by plotting the
        corresponding point using proportions of red, blue, and green ink
        given by <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<gamma\>(z<rsub|n
        k>)>> for <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|k
        = 1,2,3>>, respectively
      </surround>|<pageref|auto-7>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|6>||Graphical
      representation of a Gaussian mixture model for a set of
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N>>
      i.i.d. data points <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|{x<rsub|n>}>>,
      with corresponding <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<pi\>>>
      latent points <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|{z<rsub|n>}>>,
      where <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|n
      = 1,...,N>>.>|<pageref|auto-8>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|7>||Illustration of how
      singularities in the likelihood function arise with mixtures of
      Gaussians. This should be compared with the case of a single Gaussian
      shown in Figure 1.14 for which no singularities
      arise.>|<pageref|auto-9>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8>|>
        Illustration of the EM algorithm using the Old Faithful set as used
        for the illustration of the K-means algorithm in Figure
        <reference|fig9.1>.
      </surround>|<pageref|auto-10>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9>|>
        This shows the same graph as in Figure <reference|fig9.6> except that
        we now suppose that the discrete variables
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|z<rsub|n>>>
        are observed, as well as the data variables
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|x<rsub|n>>>.
      </surround>|<pageref|auto-12>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|10>||Illustration of
      the Bernoulli mixture model in which the top row shows examples from
      the digits data set after converting the pixel values from grey scale
      to binary using a threshold of 0.5. On the bottom row the first three
      images show the parameters <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<mu\><rsub|ki>>>
      for each of the three components in the mixture model. As a comparison,
      we also fit the same data set using a single multivariate Bernoulli
      distribution, again using maximum likelihood. This amounts to simply
      averaging the counts in each pixel and is shown by the right-most image
      on the bottom row.>|<pageref|auto-13>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|11>||Illustration of
      the decomposition given by Eq. (<reference|9.70>), which holds for any
      choice of distribution <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|q(Z)>>.
      Because the Kullback-Leibler divergence satisfies
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|KL(q\<\|\|\>p)\<geqslant\>0>>,
      we see that the quantity <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<cal-L\>(q,\<b-theta\>)>>
      is a lower bound on the log likelihood function
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|ln
      p(X\|\<b-theta\>)>>.>|<pageref|auto-15>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|12>||Illustration of
      the E step of the EM algorithm. The
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|q>>
      distribution is set equal to the posterior distribution for the current
      parameter values <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<theta\><rsup|old>>>,
      causing the lower bound to move up to the same value as the log like-
      lihood function, with the KL divergence vanishing.>|<pageref|auto-16>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|13>|>
        Illustration of the M step of the EM algorithm. The distribution
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|q(Z)>>
        is held fixed and the lower bound
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|L(q,\<theta\>)>>
        is maximized with respect to the parameter vector
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<theta\>>>
        to give a revised value \<theta\>new. Because the KL divergence is
        nonnegative, this causes the log likelihood
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|ln
        p(X\|\<theta\>)>> to increase by at least as much as the lower bound
        does.
      </surround>|<pageref|auto-17>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|14>||The EM algorithm
      involves alternately computing a lower bound on the log likelihood for
      the cur- rent parameter values and then maximizing this bound to obtain
      the new parameter values.>|<pageref|auto-18>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>K-means
      Clustering> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Mixtures
      of Gaussians> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>An
      Alternative View of EM> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      EM Algorithm in General> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>