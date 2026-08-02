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
      <section|K-means Clustering>
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
      <section|Mixtures of Gaussians>
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

    <\equation*>
      N<rsub|k>=<big|sum><rsub|n=1><rsup|N>\<gamma\><around*|(|<rsub|Z<rsub|n
      k>>|)>.
    </equation*>

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
      <section|An Alternative View of EM>
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
      <\small-figure|<image|image/fig_9_8_mixture_gaussion_complete_data.png|.3par|||>>
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
  </hidden>|<\shown>
    <tit|Mixtures of Bernoulli distributions>

    So far in this chapter, we have focussed on distributions over continuous
    variables described by mixtures of Gaussians. As a further example of
    mixture modelling, and to illustrate the EM algorithm in a different
    context, we now discuss mixtures of discrete binary variables described
    by Bernoulli distributions. This model is also known as latent class
    analysis (Lazarsfeld and Henry, 1968; McLachlan and Peel, 2000). As well
    as being of practical importance in its own right, our discussion of
    Bernoulli mixtures will also lay the foundation for a consideration of
    hidden Markov models over discrete variables.
  </shown>>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|10>
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
    <associate|9.10|<tuple|9|?>>
    <associate|9.11|<tuple|10|?>>
    <associate|9.13|<tuple|11|?>>
    <associate|9.14|<tuple|12|?>>
    <associate|9.17|<tuple|13|?>>
    <associate|9.19|<tuple|14|?>>
    <associate|9.2|<tuple|2|6>>
    <associate|9.22|<tuple|15|?>>
    <associate|9.3|<tuple|3|1>>
    <associate|9.4|<tuple|4|1>>
    <associate|9.40|<tuple|16|?>>
    <associate|9.5|<tuple|5|?>>
    <associate|9.6|<tuple|6|?>>
    <associate|9.7|<tuple|7|?>>
    <associate|9.9|<tuple|8|?>>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-10|<tuple|8|?>>
    <associate|auto-11|<tuple|3|?>>
    <associate|auto-12|<tuple|9|?>>
    <associate|auto-2|<tuple|1|?>>
    <associate|auto-3|<tuple|2|?>>
    <associate|auto-4|<tuple|3|1>>
    <associate|auto-5|<tuple|2|?>>
    <associate|auto-6|<tuple|4|?>>
    <associate|auto-7|<tuple|5|?>>
    <associate|auto-8|<tuple|6|?>>
    <associate|auto-9|<tuple|7|?>>
    <associate|fig9.1|<tuple|1|?>>
    <associate|fig9.2|<tuple|2|?>>
    <associate|fig9.3|<tuple|3|1>>
    <associate|fig9.4|<tuple|4|?>>
    <associate|fig9.5|<tuple|5|?>>
    <associate|fig9.6|<tuple|6|?>>
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
    </associate>
  </collection>
</auxiliary>