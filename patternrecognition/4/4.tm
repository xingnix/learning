<TeXmacs|2.1.1>

<style|<tuple|beamer|manila-paper>>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <doc-data|<doc-title|Linear Models for Classification>>
  </hidden>|<\hidden>
    <tit|Classification>

    <\itemize-dot>
      <item>The goal in classification is to take an input vector <math|x>
      and to assign it to one of <math|K> discrete classes
      <math|\<cal-C\><rsub|k>> where <math|k = 1,\<cdots\>,K>.\ 

      <item>In the most common scenario, the classes are taken to be
      disjoint, so that each input is assigned to one and only one class. The
      input space is thereby divided into decision regions whose boundaries
      are called <em|decision boundaries<name|<strong|<strong|<strong|<strong|<em|<verbatim|<samp|>>>>>>>>>
      or<em| decision surfaces>.\ 

      <item>Linear decision surfaces are linear functions of the input vector
      <math|x> and hence are defined by (<math|D \<minus\> 1>)-dimensional
      hyperplanes within the D-dimensional input space. Data sets whose
      classes can be separated exactly by linear decision surfaces are said
      to be <em|linearly separable>.
    </itemize-dot>
  </hidden>|<\hidden>
    <tit|Target representation(probabilistic models)>

    <\itemize-dot>
      <item>For two-class problems, \ binary representation uses a single
      target variable t \<in\> {0, 1} such that <math|t=1> represents class
      <math|\<cal-C\><rsub|1>> and <math|t=0> represents class
      <math|\<cal-C\><rsub|2>>. We can interpret the value of <math|t> as the
      probability that the class is <math|\<cal-C\><rsub|1>>, with the values
      of probability taking only the extreme values of 0 and 1.\ 

      <item>For <math|K\<gtr\>2> classes, it is convenient to use a
      1-of-<math|K> coding scheme in which t is a vector of length K such
      that if the class is <math|\<cal-C\><rsub|j>>, then all elements
      <math|t<rsub|k>> of t are zero except element <math|t<rsub|j>> , which
      takes the value 1.\ 

      <item>For instance, if there are <math|K=5> classes, then a pattern
      from class 2 has the target vector\ 

      <\equation*>
        t = (0, 1, 0, 0, 0)<rsup|T>.
      </equation*>

      Again, we can interpret the value of <math|t<rsub|k>> as the
      probability that the class is <math|\<cal-C\><rsub|k>>.
    </itemize-dot>
  </hidden>|<\hidden>
    <tit|Ddistinct approaches to the classification problem>

    <\itemize-dot>
      <item>Constructing a <strong|discriminant function> that directly
      assigns each vector x to a specific class.\ 

      <item>Models the conditional probability distribution
      <math|p(\<cal-C\><rsub|k>\|x) >in an inference stage, and then subse-
      quently uses this distribution to make optimal decisions. \ There are
      two different approaches to determining the conditional probabilities
      <math|p(\<cal-C\><rsub|k>\|x)>.\ 

      <\itemize-dot>
        <item>One technique is to model them directly, for example by
        representing them as parametric models and then optimizing the
        parameters using a training set.

        <item>Alternatively, we can adopt a generative approach in which we
        model the class-conditional densities given by
        <math|p(x\|\<cal-C\><rsub|k>)>, together with the prior probabilities
        <math|p(\<cal-C\><rsub|k>)> for the classes, and then we compute the
        required posterior probabilities using Bayes' theorem

        <\equation*>
          p(\<cal-C\><rsub|k>\|x) = <frac|p(x\|\<cal-C\><rsub|k>)p(\<cal-C\><rsub|k>)|
          p(x)>.
        </equation*>
      </itemize-dot>
    </itemize-dot>
  </hidden>|<\hidden>
    <tit|Generalized linear models>

    For classification problems, we wish to predict discrete class labels, or
    more generally posterior probabilities that lie in the range
    <math|(0,1)>. Consider a generalization of linear model regression.
    Transform the linear function of <math|w> using a nonlinear function
    <math|f(\<cdummy\>) > so that\ 

    <\equation*>
      y(x)=f <around*|(|w<rsup|T>x|)>.
    </equation*>

    In the machine learning literature <math|f(\<cdummy\>)> is known as an
    <strong|activation function>, whereas its inverse is called a
    <strong|link function> in the statistics literature.

    The decision surfaces correspond to <math|y(x) = constant>, so that
    <math|w<rsup|T>x \ = constant> and hence the decision surfaces are linear
    functions of <math|x>, even if the function <math|f(\<cdummy\>)> is
    nonlinear. For this reason, the class of models are called generalized
    linear models.
  </hidden>|<\hidden>
    <tit|Discriminant Functions(two classes)>

    A discriminant is a function that takes an input vector <math|x> and
    assigns it to one of <math|K> classes, denoted <math|\<cal-C\><rsub|k>> .

    The simplest representation of a linear discriminant function is obtained
    by taking a linear function of the input vector so that\ 

    <\equation*>
      y(x) = w<rsup|T>x + w<rsub|0>
    </equation*>

    where <math|w> is called a weight vector, and <math|w<rsub|0>> is a bias
    (not to be confused with bias in the statistical sense). The negative of
    the bias is sometimes called a threshold.\ 

    An input vector <math|x> is assigned to class <math|\<cal-C\><rsub|1>> if
    <math|y(x)\<less\>0> and to class <math|\<cal-C\><rsub|2>> otherwise. The
    corresponding decision boundary is therefore defined by the relation
    <math|y(x)=0>, which corresponds to a (<math|D\<minus\>1>)-dimensional
    hyperplane within the <math|D>-dimensional input space.\ 
  </hidden>|<\hidden>
    Consider two points <math|x<rsub|A>> and <math|x<rsub|B>> both of which
    lie on the decision surface. Because

    <\equation*>
      y(x<rsub|A>) = y(x<rsub|B>) = 0,
    </equation*>

    we have

    <\equation*>
      w<rsup|T>(x<rsub|A> \<minus\>x<rsub|B>) = 0
    </equation*>

    and hence the vector <math|w> is orthogonal to every vector lying within
    the decision surface, and so w determines the orientation of the decision
    surface.\ 

    Similarly, if <math|x> is a point on the decision surface, then
    <math|y(x) = 0>, and so the normal distance from the origin to the
    decision surface is given by\ 

    <\equation*>
      <frac|w<rsup|T>x|<around*|\<\|\|\>|w|\<\|\|\>>>=<frac|\<minus\>w<rsub|0>|<around*|\<\|\|\>|w|\<\|\|\>>>
      .
    </equation*>
  </hidden>|<\hidden>
    \;

    <image|img/figure_4_1_linear_discriminant_2D.png|1par|||>

    \;
  </hidden>|<\hidden>
    the value of <math|y(x)> gives a signed measure of the perpendicular
    distance <math|r> of the point <math|x> from the decision surface. so
    that

    <\equation*>
      x=x<rsub|\<noplus\>\<bot\>>+r<frac|w|<around*|\<\|\|\>|w|\<\|\|\>>>
    </equation*>

    Consider an arbitrary point <math|x> and let <math|x<rsub|\<bot\>>> be
    its orthogonal projection onto the decision surface,\ 

    Multiplying both sides of this result by <math|w<rsup|T>> and adding
    <math|w<rsub|0>>, and making use of

    <\equation*>
      y(x) = w<rsup|T>x+w<rsub|0>
    </equation*>

    and

    <\equation*>
      y(x<rsub|\<bot\>>)=w<rsup|T>x<rsub|\<bot\>> +w<rsub|0> =0,
    </equation*>

    we have\ 

    <\equation*>
      r = <frac|y(x)|<around*|\<\|\|\>|w|\<\|\|\>>>.
    </equation*>
  </hidden>|<\hidden>
    <tit|Multiple classes>

    <\itemize-dot>
      <item>one-versus-the-rest classifier use of <math|K\<minus\>1>
      classifiers each of which solves a two-class problem of separating
      points in a particular class <math|\<cal-C\><rsub|k>> from points not
      in that class.

      <item>one-versus-one classifier introduce <math|K(K\<minus\>1)/2>
      binary discriminant functions, one for every possible pair of classes.

      <item>considering a single <math|K>-class discriminant comprising
      <math|K> linear functions of the form\ 

      <\equation*>
        y<rsub|k>(x) = w<rsub|k><rsup|T>x + w<rsub|k0>\ 
      </equation*>

      and then assigning a point <math|x> to class Ck if <math|y<rsub|k>(x)
      \<gtr\> y<rsub|j>(x)> for all <math|j\<neq\>k>. The decision boundary
      between class <math|\<cal-C\><rsub|k>> and class
      <math|\<cal-C\><rsub|j>> is therefore given by <math|y<rsub|k>(x) =
      y<rsub|j>(x)> and hence corresponds to a
      (<math|D\<minus\>1>)-dimensional hyperplane defined by\ 

      <\equation*>
        (w<rsub|k> \<minus\> w<rsub|j>)<rsup|T>x + (w<rsub|k><rsub|0>
        \<minus\> w<rsub|j0>) = 0.
      </equation*>
    </itemize-dot>

    \;
  </hidden>|<\hidden>
    \;

    \;

    <space|4em><image|img/figure_4_2_1vr_1v1.png|0.8par|||>
  </hidden>|<\hidden>
    \;

    \;

    <image|img/figure_4_3_decision_regions.png|1par|||>

    The decision regions of such a discriminant are always singly connected
    and convex.\ 

    \;

    \;
  </hidden>|<\hidden>
    \;

    Consider two points <math|x<rsub|A>> and <math|x<rsub|B>> both of which
    lie inside decision region <math|\<cal-R\><rsub|k>>. Any point <math|x>
    that lies on the line connecting <math|x<rsub|A>> and <math|x<rsub|B>>
    can be expressed in the form\ 

    <\equation*>
      <wide|x|^>=\<lambda\>x<rsub|A> +(1\<minus\>\<lambda\>)x<rsub|B>
    </equation*>

    where <math|0\<leqslant\>\<lambda\>\<leqslant\>1>. From the linearity of
    the discriminant functions, it follows that\ 

    <\equation*>
      y<rsub|k>(x) = \<lambda\>y<rsub|k>(x<rsub|A>) + (1 \<minus\>
      \<lambda\>)y<rsub|k>(x<rsub|B>).
    </equation*>

    Because both <math|x<rsub|A>> and <math|x<rsub|B>> lie inside
    <math|\<cal-R\><rsub|k>> , it follows that <math|y<rsub|k>(x<rsub|A>)
    \<gtr\> y<rsub|j>(x<rsub|A>)>, and <math|y<rsub|k>(x<rsub|B>)\<gtr\>y<rsub|j>(x<rsub|B>)>,
    for all <math|j\<neq\>k>, and hence <math|y<rsub|k>(x)\<gtr\>y<rsub|j>(x)>,
    and so <math|x> also lies inside <math|\<cal-R\><rsub|k>>. Thus
    <math|\<cal-R\><rsub|k>> is singly connected and convex.
  </hidden>|<\hidden>
    <tit|Learning the parameters>

    \;

    learning the parameters of linear discrimi- nant functions based on\ 

    \;

    <\itemize-dot>
      <item>least squares,\ 

      <item>Fisher's linear discriminant,\ 

      <item>and the perceptron algorithm.
    </itemize-dot>
  </hidden>|<\hidden>
    <tit|Least squares for classification>

    Consider a general classification problem with <math|K> classes, with a
    1-of-<math|K> binary coding scheme for the target vector <math|t>. Each
    class <math|\<cal-C\><rsub|k>> is described by its own linear model so
    that

    <\equation*>
      y<rsub|k>(x) = w<rsub|k><rsup|T>x + w<rsub|k0>
    </equation*>

    where <math|k = 1,\<cdots\>,K> . We can conveniently group these together
    using vector notation so that\ 

    <\equation*>
      y(x) = <wide|w|~><rsup|T><wide|x|~>
    </equation*>

    where <math|<wide|W|~>> is a matrix whose <math|k<rsup|th>> column
    comprises the <math|D+1>-dimensional vector <math|<wide|w|~><rsub|k>
    =(w<rsub|k0>,w<rsub|k><rsup|T>)<rsup|T>> and <math|x> is the
    corresponding augmented inputvector <math|(1,x<rsup|T>)<rsup|><rsup|T>>
    with a dummy input <math|x<rsub|0> = 1>. A new input <math|x> is then
    assigned to the class for which the output
    <math|y<rsub|k>=<wide|w|~><rsub|k><rsup|T><wide|x|~>> is largest.
  </hidden>|<\hidden>
    Consider a training data set <math|{x<rsub|n>,t<rsub|n>}>where
    <math|n=1,...,N>, and define a matrix <math|T> whose <math|n<rsup|th>>
    row is the vector <math|t<rsup|T><rsub|n>>, together with a matrix
    <math|<wide|X|~>> whose <math|n<rsup|th>> row is
    <math|<wide|x|~><rsup|T><rsub|n>> . The sum-of-squares error function can
    then be written as\ 

    <\equation*>
      E<rsub|D>(<wide|W|~>) = <frac|1|2>Tr <around*|{|(<wide|X|~><wide|W|~>
      \<minus\> T)<rsup|T>(<wide|X|~><wide|W|~> \<minus\> T)|}>.
    </equation*>

    Setting the derivative with respect to <math|W>, to zero, and
    rearranging, we then obtain the\ 

    solution for <math|W>, in the form

    <\equation*>
      <wide|W|~>= (<wide|X|~><rsup|T><wide|X|~>)<rsup|\<minus\>1><wide|X|~><rsup|T>T
      = <wide|X|~><rsup|\<dagger\>>T
    </equation*>

    where <math|<wide|X|~><rsup|\<dag\>>> is the pseudo-inverse of the matrix
    <math|<wide|X|~>> , as discussed in Section 3.1.1. We then obtain the
    discriminant function in the form

    <\equation*>
      y<around*|(|x|)>=<wide|W|~><rsup|T><wide|x|~>=T<rsup|T><around*|(|<wide|x|~><rsup|\<dag\>>|)><rsup|T><wide|x|~>
    </equation*>
  </hidden>|<\hidden>
    <tit|A property of least-squares solutions with multiple target>

    An interesting property of least-squares solutions with multiple target
    variables is that if every target vector in the training set satisfies
    some linear constraint\ 

    <\equation*>
      \<b-a\><rsup|T>\<b-t\><rsub|n> + b = 0
    </equation*>

    for some constants <math|\<b-a\>> and <math|b>, then the model prediction
    for any value of <math|\<b-x\>> will satisfy the same constraint so that\ 

    <\equation*>
      \<b-a\><rsup|T>\<b-y\>(\<b-x\>) + b = 0.
    </equation*>

    <\unfolded-std>
      Notes
    <|unfolded-std>
      <\summarized-plain>
        Thus if we use a 1-of-<math|K> coding scheme for <math|K> classes,
        then the predictions made by the model will have the property that
        the elements of <math|\<b-y\>(\<b-x\>)> will sum to 1 for any value
        of <math|\<b-x\>>. However, this summation constraint alone is not
        sufficient to allow the model outputs to be interpreted as
        probabilities because they are not constrained to lie within the
        interval (0, 1).
      <|summarized-plain>
        \;
      </summarized-plain>
    </unfolded-std>
  </hidden>|<\hidden>
    \;

    <space|4em><image|img/figure_4_5_ls.png|0.8par|||>
  </hidden>|<\hidden>
    <tit|Fisher's linear discriminant>

    View a linear classification model is in terms of dimensionality
    reduction. Consider the case of two classes, and take the
    <math|D>-dimensional input vector <math|x>, project it down to one
    dimension using

    <\equation*>
      y = \<b-w\><rsup|T>\<b-x\>.
    </equation*>

    Classify <math|y\<geqslant\>\<minus\>w<rsub|0>> as class
    <math|\<cal-C\><rsub|1>>, and otherwise class <math|\<cal-C\><rsub|2>>.

    Consider a two-class problem in which there are <math|N<rsub|1>> points
    of class <math|\<cal-C\><rsub|1>> and <math|N<rsub|2>> points of class
    <math|\<cal-C\><rsub|2>>, mean vectors of the two classes are given by\ 

    <\equation*>
      \<b-m\><rsub|1>=<frac|1|N<rsub|1>><big|sum><rsub|n\<in\>\<cal-C\><rsub|1>>x<rsub|n>,<space|2em>\<b-m\><rsub|2>=<frac|1|N<rsub|2>><big|sum><rsub|n\<in\>\<cal-C\><rsub|2>>x<rsub|n>.
    </equation*>

    \;
  </hidden>|<\hidden>
    The simplest measure of the separation of the classes, when projected
    onto <math|\<b-w\>>, is the separation of the projected class means. This
    suggests that we might choose <math|\<b-w\>> so as to maximize\ 

    <\equation*>
      m<rprime|'><rsub|2> \<minus\> m<rprime|'><rsub|1> =
      \<b-w\><rsup|T>(\<b-m\><rsub|2> \<minus\> \<b-m\><rsub|1>)
    </equation*>

    where\ 

    <\equation*>
      m<rprime|'><rsub|k> = \<b-w\><rsup|T>\<b-m\><rsub|k>
    </equation*>

    is the mean of the projected data from class <math|\<cal-C\><rsub|k>>.

    constrain <math|\<b-w\>> to have unit length,

    <\equation*>
      \<b-w\><rsup|T>\<b-w\>=1
    </equation*>

    there is

    <\equation*>
      \ \<b-w\>\<propto\> (m<rsub|2> \<minus\> m<rsub|1>).
    </equation*>
  </hidden>|<\hidden>
    <image|img/figure_4_6_fisher_linear_discriminant.png|1par|||>
  </hidden>|<\hidden>
    The idea proposed by Fisher is to maximize a function that will give a
    large separation between the projected class means while also giving a
    small variance within each class, thereby minimizing the class overlap.\ 

    The projection <math|y=\<b-w\><rsup|T>x> transforms the set of labelled
    data points in <math|x> into a labelled set in the one-dimensional space
    <math|y>. The within-class variance of the transformed data from class
    <math|\<cal-C\><rsub|k>> is therefore given by\ 

    <\equation*>
      s<rsub|k><rsup|2>=<big|sum><rsub|n\<in\>\<cal-C\><rsub|k>><around*|(|y<rsub|n>-m<rsub|k>|)><rsup|2>
    </equation*>

    where <math|yn = \<b-w\><rsup|T>\<b-x\><rsub|n>>. We can define the total
    within-class variance for the whole data set to be simply
    <math|s<rsup|2><rsub|1> + s<rsup|2><rsub|2>>. The Fisher criterion is
    defined to be the ratio of the between-class variance to the within-class
    variance and is given by\ 

    <\equation*>
      J(\<b-w\>)=<frac|(m<rsub|2>\<minus\>
      m<rsub|1>)<rsup|2>|s<rsup|2><rsub|1>+s<rsup|2><rsub|2>>
    </equation*>
  </hidden>|<\hidden>
    <tit|Fisher criterion>

    <\equation*>
      J(w) = <frac|\<b-w\><rsup|T>S<rsub|B>\<b-w\>|\<b-w\><rsup|T>S<rsub|w>\<b-w\>
      >\ 
    </equation*>

    where SB is the between-class covariance matrix and is given by\ 

    <\equation*>
      SB = (m2 \<minus\> m1)(m2 \<minus\> m1)T
    </equation*>

    and SW is the total within-class covariance matrix, given by

    <\equation*>
      SW = (xn \<minus\> m1)(xn \<minus\> m1)T + (xn \<minus\> m2)(xn
      \<minus\> m2)T. n\<in\>C1 n\<in\>C2\ 
    </equation*>

    \;
  </hidden>|<\hidden>
    <tit|Fisher's linear discriminant>

    Differentiating <math|J<around*|(|\<b-w\>|)>> with respect to
    <math|\<b-w\>>, we find that <math|J(\<b-w\>)> is maximized when\ 

    <\equation*>
      (\<b-w\><rsup|T>S<rsub|B>\<b-w\>)S<rsub|W>\<b-w\> =
      (\<b-w\><rsup|T>S<rsub|W>\<b-w\>)S<rsub|B>\<b-w\>.
    </equation*>

    <math|S<rsub|B>\<b-w\>> is always in the direction of
    <math|(\<b-m\><rsub|2>-\<b-m\><rsub|1>)>.\ 

    Furthermore, we do not care about the magnitude of <math|\<b-w\>>, only
    its direction, and so we can drop the scalar factors
    <math|(\<b-w\><rsup|T>S<rsub|B>\<b-w\>)> and
    <math|(\<b-w\><rsup|T>S<rsub|W>\<b-w\>)>.

    Multiplying both sides by <math|S<rsub|W><rsup|<rsub|-1>>>, then obtain

    <\equation*>
      \<b-w\>\<propto\>S<rsup|-1><rsub|W>(\<b-m\><rsub|2>\<minus\>\<b-m\><rsub|1>).
    </equation*>
  </hidden>|<\hidden>
    <tit|Relation to least squares>

    Take the targets for class <math|\<cal-C\><rsub|1>> to be
    <math|N/N<rsub|1>>, where <math|N<rsub|1>> is the number of patterns in
    class <math|\<cal-C\><rsub|1>>, and <math|N> is the total number of
    patterns. This target value approximates the reciprocal of the prior
    probability for class <math|\<cal-C\><rsub|1>>. For class
    <math|\<cal-C\><rsub|2>>, we shall take the targets to be
    <math|\<minus\>N/N<rsub|2>>, where <math|N<rsub|2>> is the number of
    patterns in class <math|\<cal-C\><rsub|2>>.\ 

    The sum-of-squares error function can be written\ 

    <\equation*>
      E=<frac|1|2><big|sum><rsub|n=1><rsup|N><around*|(|\<b-w\><rsup|T>\<b-x\><rsub|n>+w<rsub|0>-t<rsub|n>|)><rsup|2>
    </equation*>

    \;

    \;
  </hidden>|<\hidden>
    Setting the derivatives of <math|E> with respect to <math|w<rsub|0>> and
    <math|\<b-w\>> to zero, we obtain respectively

    <\eqnarray*>
      <tformat|<table|<row|<cell|<big|sum><rsub|n=1><rsup|N><around*|(|\<b-w\><rsup|T>\<b-x\><rsub|n>+w<rsub|0>-t<rsub|n>|)>>|<cell|=>|<cell|0>>|<row|<cell|<big|sum><rsub|n=1><rsup|N><around*|(|\<b-w\><rsup|T>\<b-x\><rsub|n>+w<rsub|0>-t<rsub|n>|)>\<b-x\><rsub|n>>|<cell|=>|<cell|0>>>>
    </eqnarray*>

    and making use of our choice of target coding scheme for the
    <math|t<rsub|n>>, \ 

    <\equation*>
      w<rsub|0>=-\<b-w\><rsup|T>\<b-m\>
    </equation*>

    where\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|<big|sum><rsub|n=1><rsup|N>t<rsub|n>>|<cell|=>|<cell|N<rsub|1><frac|N|N<rsub|1>>-N<rsub|2><frac|N|N<rsub|2>>=0>>|<row|<cell|m>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n>=<frac|1|N><around*|(|N<rsub|1>\<b-m\><rsub|1>+N<rsub|2>\<b-m\><rsub|2>|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    <\folded-std>
      After some straightforward algebra,
    <|folded-std>
      <\eqnarray*>
        <tformat|<table|<row|<cell|<big|sum><rsub|N>t<rsub|n>x<rsub|n>>|<cell|=>|<cell|<big|sum><rsub|N<rsub|1>><frac|N|N<rsub|1>>x<rsub|n>-<big|sum><rsub|N<rsub|2>><frac|N|N<rsub|2>>x<rsub|n>>>|<row|<cell|>|<cell|=>|<cell|N<around*|(|m<rsub|1>-m<rsub|2>|)>>>|<row|<cell|<big|sum><rsub|N>w<rsub|0>x<rsub|n>>|<cell|=>|<cell|-<big|sum><rsub|N>m
        x<rsub|n><rsup|T>w>>|<row|<cell|>|<cell|=>|<cell|-<big|sum><rsub|N<rsub|1>>m
        x<rsup|T>w-<big|sum><rsub|N<rsub|2>>m
        x<rsup|T>w>>|<row|<cell|>|<cell|=>|<cell|-N<rsub|1>m
        m<rsup|T><rsub|1>w-N<rsub|2>m m<rsub|2><rsup|T>w>>|<row|<cell|<big|sum><rsub|N><around*|(|w<rsup|T>x<rsub|n>|)>x<rsub|n>>|<cell|=>|<cell|<big|sum><rsub|N<rsub|1>>x<rsub|n>x<rsub|n><rsup|T>w+<big|sum><rsub|N<rsub|2>>x<rsub|n>x<rsub|n><rsup|T>w>>>>
      </eqnarray*>

      then

      <\eqnarray*>
        <tformat|<table|<row|<cell|<big|sum><rsub|N<rsub|1>>x<rsub|n>x<rsub|n><rsup|T>w-N<rsub|1>m
        m<rsup|T><rsub|1>w>|<cell|=>|<cell|<big|sum><rsub|N<rsub|1>>x<rsub|n>x<rsub|n><rsup|T>w-<big|sum><rsub|N<rsub|1>>m<rsub|1>m<rsup|T><rsub|1>w+<big|sum><rsub|N<rsub|1>>m<rsub|1>m<rsup|T><rsub|1>w-N<rsub|1>m
        m<rsub|1><rsup|T>w>>|<row|<cell|>|<cell|=>|<cell|S<rsub|W1>w+N<rsub|1><around*|(|m<rsub|1>-m|)>m<rsub|1><rsup|T>w>>|<row|<cell|>|<cell|=>|<cell|S<rsub|W1>w+N<rsub|1><around*|(|m<rsub|1>-<frac|N<rsub|1>m<rsub|1>+N<rsub|2>m<rsub|2>|N>|)>m<rsub|1><rsup|T>w>>|<row|<cell|>|<cell|=>|<cell|S<rsub|W1>w+<frac|N<rsub|1>N<rsub|2>|N><around*|(|m<rsub|1>-m<rsub|2>|)>m<rsub|1><rsup|T>w>>|<row|<cell|<big|sum><rsub|N<rsub|2>>x<rsub|n>x<rsub|n><rsup|T>w-N<rsub|2>m
        m<rsup|T><rsub|2>w>|<cell|=>|<cell|S<rsub|W2>w+<frac|N<rsub|1>N<rsub|2>|N><around*|(|m<rsub|2>-m<rsub|1>|)>m<rsub|2><rsup|T>w>>>>
      </eqnarray*>

      then

      <\eqnarray*>
        <tformat|<table|<row|<cell|<big|sum><rsub|n=1><rsup|N><around*|(|w<rsup|T>x<rsub|n>+w<rsub|0>|)>x<rsub|n>>|<cell|=>|<cell|<around*|(|S<rsub|W1>+S<rsub|W2>|)>w+<frac|N<rsub|1>N<rsub|2>|N><around*|(|m<rsub|1>-m<rsub|2>|)>m<rsub|1><rsup|T>w+<frac|N<rsub|1>N<rsub|2>|N><around*|(|m<rsub|2>-m<rsub|1>|)>m<rsub|2><rsup|T>w>>|<row|<cell|>|<cell|=>|<cell|S<rsub|W>w+<frac|N<rsub|1>N<rsub|2>|N><around*|(|m<rsub|1>-m<rsub|2>|)><around*|(|m<rsub|1><rsup|T>-m<rsub|2><rsup|T>|)>w>>|<row|<cell|>|<cell|=>|<cell|S<rsub|W>w+<frac|N<rsub|1>N<rsub|2>|N>S<rsub|B>w>>>>
      </eqnarray*>

      and

      <\eqnarray*>
        <tformat|<table|<row|<cell|<big|sum><rsub|n=1><rsup|N><around*|(|w<rsup|T>x<rsub|n>+w<rsub|0>-t<rsub|n>|)>x<rsub|n>>|<cell|=>|<cell|<around*|(|S<rsub|W>+<frac|N<rsub|1>N<rsub|2>|N>S<rsub|B>|)>w-N<around*|(|m<rsub|1>-m<rsub|2>|)>>>>>
      </eqnarray*>
    </folded-std>

    \;

    \;

    <\equation*>
      <around*|(|S<rsub|W>+<frac|N<rsub|1>N<rsub|2>|N> S<rsub|B>|)>\<b-w\>=
      N(\<b-m\><rsub|1>\<minus\>\<b-m\><rsub|2>) \ 
    </equation*>

    substitute for the bias \ and <math|S<rsub|B>\<b-w\>> is always in the
    direction of <math|(\<b-m\><rsub|2>\<minus\>\<b-m\><rsub|1>)>. Thus we
    can write\ 

    <\equation*>
      \<b-w\> \<propto\> S<rsup|-1><rsub|W>(\<b-m\><rsub|2>\<minus\>\<b-m\><rsub|1>)
    </equation*>
  </hidden>|<\hidden>
    <tit|Fisher's discriminant for multiple classes>

    <\equation*>
      dim(D)\<gtr\>K\<gtr\>2
    </equation*>

    where <math|K> is the number of classes and <math|D> is the
    dimensionality of the input space.

    we introduce <math|D<rprime|'>\<gtr\>1> linear `features'\ 

    <\equation*>
      y<rsub|k> = \<b-w\><rsub|k><rsup|T>\<b-x\>,
    </equation*>

    \ where <math|k= 1,\<cdots\>,D<rprime|'>>. These feature values can
    conveniently be grouped together to form a vector <math|\<b-y\>>. The
    weight vectors <math|{\<b-w\><rsub|k>}> can be considered to be the
    columns of a matrix <math|W>, so that\ 

    <\equation*>
      \<b-y\>= W<rsup|T>\<b-x\>.
    </equation*>

    <\folded-std>
      Note
    <|folded-std>
      Note that again we are nNot including any bias parameters in the
      definition of y.
    </folded-std>
  </hidden>|<\hidden>
    \;

    The generalization of the <strong|<em|<em|within-class covariance
    matrix>>> to the case of <math|K> classes

    <\eqnarray*>
      <tformat|<table|<row|<cell|S<rsub|W>>|<cell|=>|<cell|<big|sum><rsub|k=1><rsup|K>S<rsub|k>>>>>
    </eqnarray*>

    where

    <\eqnarray*>
      <tformat|<table|<row|<cell|S<rsub|k>>|<cell|=>|<cell|<big|sum><rsub|n\<in\>\<cal-C\><rsub|k>><around*|(|\<b-x\><rsub|n>-\<b-m\><rsub|k>|)><around*|(|\<b-x\><rsub|n>-\<b-m\><rsub|k>|)><rsup|T>>>|<row|<cell|\<b-m\><rsub|k>>|<cell|=>|<cell|<frac|1|N<rsub|k>><big|sum><rsub|n\<in\>\<b-C\><rsub|k>>\<b-x\><rsub|n>>>>>
    </eqnarray*>

    and <math|N<rsub|k>> is the number of patterns in class
    <math|\<cal-C\><rsub|k>>.\ 
  </hidden>|<\hidden>
    \ total covariance matrix

    <\equation*>
      S<rsub|T>=<big|sum><rsub|n=1><rsup|N><around*|(|\<b-x\><rsub|n>-\<b-m\>|)><around*|(|\<b-x\><rsub|n>-\<b-m\>|)><rsup|T>
    </equation*>

    where <math|\<b-m\>> is the mean of the total data set

    <\equation*>
      \<b-m\>=<frac|1|N><big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n>=<frac|1|N><big|sum><rsub|k=1><rsup|K>N<rsub|k>\<b-m\><rsub|k>
    </equation*>

    and

    <\equation*>
      N=<big|sum><rsub|k>N<rsub|k>
    </equation*>

    is the total number of data points.
  </hidden>|<\hidden>
    \;

    \;

    <\folded-std>
      <math|S<rsub|B>>: <strong|between-class covariance>.
    <|folded-std>
      The total covariance matrix can be decomposed into the sum of the
      within-class covariance matrix, plus an additional matrix
      <math|S<rsub|B>> which we identify as a measure of the between-class
      covariance.
    </folded-std>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|S<rsub|B>>|<cell|=>|<cell|<big|sum><rsub|k=1><rsup|K>N<rsub|k><around*|(|\<b-m\><rsub|k>-\<b-m\>|)><around*|(|\<b-m\><rsub|k>-\<b-m\>|)><rsup|T>>>>>
    </eqnarray*>

    and

    <\eqnarray*>
      <tformat|<table|<row|<cell|S<rsub|T>>|<cell|=>|<cell|S<rsub|W>+S<rsub|B>>>>>
    </eqnarray*>

    \;
  </hidden>|<\hidden>
    similar matrices in the projected <math|D<rprime|'>>-dimensional
    <math|y>-space

    <\eqnarray*>
      <tformat|<table|<row|<cell|S<rsub|<rprime|'>W>>|<cell|=>|<cell|<big|sum><rsub|k=1><rsup|K><big|sum><rsub|n\<in\>\<cal-C\><rsub|k>><around*|(|\<b-y\><rsub|n>-\<b-mu\><rsub|k>|)><around*|(|\<b-y\><rsub|n>-\<b-mu\><rsub|k>|)><rsup|T>>>|<row|<cell|S<rprime|'><rsub|B>>|<cell|=>|<cell|<big|sum><rsub|k=1><rsup|K>N<rsub|k><around*|(|\<b-mu\><rsub|k>-\<b-mu\>|)><around*|(|\<b-mu\><rsub|k>-\<b-mu\>|)><rsup|T>>>>>
    </eqnarray*>

    where

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-mu\><rsub|k>>|<cell|=>|<cell|<frac|1|N<rsub|k>><big|sum><rsub|n\<in\>\<cal-C\><rsub|k>>\<b-y\><rsub|n>>>|<row|<cell|\<b-mu\><rsub|k>>|<cell|=>|<cell|<frac|1|N><big|sum><rsub|k=1><rsup|K>N<rsub|k>\<b-mu\><rsub|k>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    Construct a scalar that is large when the between-class covariance is
    large and when the within-class covariance is small.

    <\equation*>
      J(W) = Tr <around*|{|S<rprime|'><rsub|W><rsup|<rsub|-1>>S<rprime|'><rsub|B>|}>
    </equation*>

    This criterion can then be rewritten as an explicit function of the
    projection matrix <math|W> in the form\ 

    <\equation*>
      J(W) = Tr <around*|{|(W S<rsub|W>W<rsup|T>)<rsup|\<minus\>1>(W
      S<rsub|B>W<rsup|T>)|}>
    </equation*>

    The weight values are determined by those eigenvectors of
    <math|S<rsub|W><rsup|\<minus\>1>S<rsub|B>> that correspond to the
    <math|D<rprime|'>> largest eigenvalues.

    <\folded-std>
      ...
    <|folded-std>
      There is one important result that is common to all such criteria,
      which is worth emphasizing. <math|S<rsub|B>> is composed of the sum of
      <math|K> matrices, each of which is an outer product of two vectors and
      therefore of rank 1. In addition, only <math|(K \<minus\> 1)> of these
      matrices are independent as a result of the constraint. Thus,
      <math|S<rsub|B>> has rank at most equal to <math|(K \<minus\> 1)> and
      so there are at most <math|(K \<minus\> 1)> nonzero eigenvalues. This
      shows that the projection onto the <math|(K \<minus\> 1)>-dimensional
      subspace spanned by the eigenvectors of <math|S<rsub|B>> does not alter
      the value of <math|J(W)>, and so we are therefore unable to find more
      than <math|(K \<minus\> 1)> linear `features' by this means.
    </folded-std>
  </hidden>|<\hidden>
    <tit|The perceptron algorithm>

    It corresponds to a two-class model in which the input vector <math|x> is
    first transformed using a fixed nonlinear transformation to give a
    feature vector <math|\<varphi\>(x)>, and this is then used to construct a
    generalized linear model of the form\ 

    <\equation*>
      y(x) = f<around*|(|\<b-w\><rsup|T>\<varphi\>(\<b-x\>)*|)>
    </equation*>

    where the nonlinear activation function <math|f(\<cdummy\>)> is given by
    a step function of the form\ 

    <\equation*>
      f<around*|(|a|)>=<choice|<tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|+1,>|<cell|a\<geqslant\>0>>|<row|<cell|-1,>|<cell|a\<less\>0.>>>>>
    </equation*>

    \;

    The vector <math|\<varphi\>(x)> will typically include a bias component
    <math|\<varphi\><rsub|0>(x)=1>.\ 

    <\folded-std>
      <text-dots>
    <|folded-std>
      In earlier discussions of two-class classification problems, we have
      focussed on a target coding scheme in which <math|t\<in\>{0,1}>, which
      is appropriate in the context of probabilistic models. For the
      perceptron, it is more convenient to use target values <math|t=+1> for
      class <math|\<cal-C\><rsub|1>> and <math|t=\<minus\>1> for class
      <math|\<cal-C\><rsub|2>>, which matches the choice of activation
      function.
    </folded-std>
  </hidden>|<\hidden>
    <tit|perceptron criterion>

    Seek a weight vector w such that patterns xn in class
    <math|\<cal-C\><rsub|1>> will have <math|\<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>)\<gtr\>0>,
    whereas patterns <math|\<b-x\><rsub|n>> in class <math|\<cal-C\><rsub|2>>
    have <math|\<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>)\<less\>0>.<space|1em>Using
    the <math|t\<in\>{\<minus\>1,+1}> target coding scheme it follows

    <\equation*>
      \<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>)t<rsub|n>\<gtr\>0.
    </equation*>

    The perceptron criterion associates zero error with any pattern that is
    correctly classified, whereas for a misclassified pattern
    <math|\<b-x\><rsub|n>> it tries to minimize the quantity

    <\equation*>
      -\<b-w\><rsup|T>\<b-varphi\>(\<b-x\><rsub|n>)t<rsub|n>.
    </equation*>

    The perceptron criterion is therefore given by

    <\equation*>
      E<rsub|P><around*|(|\<b-w\>|)>=-<big|sum><rsub|n\<in\>\<cal-M\>>\<b-w\><rsup|T>\<b-varphi\><rsub|n>t<rsub|n>
    </equation*>

    <\folded-std>
      where <math|\<cal-M\>> denotes the set of all misclassified patterns.
    <|folded-std>
      The contribution to the error associated with a particular
      misclassified pattern is a linear function of <math|\<b-w\>> in regions
      of <math|\<b-w\>> space where the pattern is misclassified and zero in
      regions where it is correctly classified. The total error function is
      therefore piecewise linear.
    </folded-std>
  </hidden>|<\hidden>
    <tit|stochastic gradient descent>

    We now apply the stochastic gradient descent algorithm to this error
    function. The change in the weight vector w is then given by\ 

    <\equation*>
      \<b-w\><rsup|(\<tau\>+1)> = \<b-w\><rsup|(\<tau\>)> \<minus\>
      \<eta\>\<nabla\>E<rsub|P>(\<b-w\>) =\<b-w\><rsup|(\<tau\>)> +
      \<eta\>\<b-varphi\><rsub|n>t<rsub|n>
    </equation*>

    where <math|\<eta\>> is the learning rate parameter and <math|\<tau\>> is
    an integer that indexes the steps of the algorithm.
  </hidden>|<\hidden>
    \;

    \ <space|9em><image|img/figure_4_7_perceptron_learning.png|.45par|||>

    <\folded-std>
      <active*|<hgroup|<inactive*|>>>Figure 4.7 Illustration of the
      convergence of the perceptron learning algorithm,
    <|folded-std>
      showing data points from two classes (red and blue) in a
      two-dimensional feature space (\<varphi\>1,\<varphi\>2). The top left
      plot shows the initial parameter vector w shown as a black arrow
      together with the corresponding decision boundary (black line), in
      which the arrow points towards the decision region which classified as
      belonging to the red class. The data point circled in green is
      misclassified and so its feature vector is added to the current weight
      vector, giving the new decision boundary shown in the top right plot.
      The bottom left plot shows the next misclassified point to be
      considered, indicated by the green circle, and its feature vector is
      again added to the weight vector giving the decision boundary shown in
      the bottom right plot for which all data points are correctly
      classified.
    </folded-std>

    \;
  </hidden>|<\hidden>
    <tit|Probabilistic Generative Models>

    \;

    In a generative approach,

    <\itemize-dot>
      <item>model the class-conditional densities
      <math|p(\<b-x\>\|\<cal-C\><rsub|k>)>,\ 

      <item>as well as the class priors <math|p(\<cal-C\><rsub|k>)>,\ 

      <item>and then use these to compute posterior probabilities
      <math|p(\<cal-C\><rsub|k>\|\<b-x\>)> through Bayes' theorem.
    </itemize-dot>
  </hidden>|<\hidden>
    Consider first of all the case of two classes. The posterior probability
    for class <math|\<cal-C\><rsub|1>> can be written as\ 

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|p(\<cal-C\><rsub|1>\|\<b-x\>)
      >|<cell|=>|<cell|<frac| \ p(\<b-x\>\|\<cal-C\><rsub|1>
      )p(\<cal-C\><rsub|1> ) |p(\<b-x\>\|\<cal-C\><rsub|1>)p(\<cal-C\><rsub|1>)
      + p(\<b-x\>\|\<cal-C\><rsub|2>)p(\<cal-C\><rsub|2>)><label|posterior>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|1+exp<around*|(|-a|)>>>>|<row|<cell|>|<cell|=>|<cell|\<sigma\><around*|(|a|)>>>>>
    </eqnarray*>

    where

    <\equation*>
      a = ln p(\<b-x\>\|\<cal-C\><rsub|1>)p(\<cal-C\><rsub|1>)
      p(\<b-x\>\|\<cal-C\><rsub|2> )p(\<cal-C\><rsub|2> )\ 
    </equation*>

    and <math|\<sigma\>(a)> is the <strong|logistic sigmoid> function defined
    by\ 

    <\equation*>
      \<sigma\>(a) = <frac|1 |1 + exp(\<minus\>a)>
    </equation*>
  </hidden>|<\hidden>
    \;

    \;

    <image|img/figure_4_9_logistic_sigmoid.png|1par|||>
  </hidden>|<\hidden>
    The term `sigmoid' means S-shaped. This type of function is sometimes
    also called a `squashing function' because it maps the whole real axis
    into a finite interval.\ 

    The logistic sigmoid satisfies the following symmetry property\ 

    <\equation*>
      \<sigma\>(\<minus\>a) = 1 \<minus\> \<sigma\>(a)
    </equation*>

    as is easily verified. The inverse of the logistic sigmoid is given by\ 

    <\equation*>
      a = ln <around*|(|<frac|\<sigma\> \ |1\<minus\>\<sigma\>>|)>
    </equation*>

    and is known as the <strong|logit> function. It represents the log of the
    ratio of probabilities

    <\equation*>
      ln [p(\<cal-C\><rsub|1> \|\<b-x\>)/p(\<cal-C\><rsub|2> \|\<b-x\>)]
    </equation*>

    for the two classes, also known as the <strong|log odds>.
  </hidden>|<\hidden>
    For the case of <math|K\<gtr\>2> classes, we have\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|p(\<cal-C\><rsub|k>\|\<b-x\>)>|<cell|=>|<cell|<frac|p<around*|(|\<b-x\><around*|\||\<cal-C\><rsub|k>|\<nobracket\>>|)>p<around*|(|\<cal-C\><rsub|k>|)>|<big|sum><rsub|j>p<around*|(|\<b-x\><around*|\||\<cal-C\><rsub|j>|\<nobracket\>>|)>p<around*|(|\<cal-C\><rsub|j>|)>><label|multi-posterior>>>|<row|<cell|>|<cell|=>|<cell|<frac|exp<around*|(|a<rsub|k>|)>|<big|sum><rsub|j>exp<around*|(|a<rsub|j>|)>>>>>>
    </eqnarray*>

    which is known as the <strong|normalized exponential> and can be regarded
    as a multiclass generalization of the logistic sigmoid. Here the
    quantities <math|a<rsub|k>> are defined by\ 

    <\equation*>
      a<rsub|k>= ln p(\<b-x\>\|\<cal-C\><rsub|k>)p(\<cal-C\><rsub|k>).
    </equation*>

    The normalized exponential is also known as the <strong|softmax
    function>, as it represents a smoothed version of the `max' function
    because, if <math|a<rsub|k>\<gg\>a<rsub|j>> for all <math|j\<neq\>k>,
    then <math|p(\<cal-C\><rsub|k>\|x)\<cong\>1>, and
    <math|p(\<cal-C\><rsub|j>\|\<b-x\>)\<cong\>0>.
  </hidden>|<\hidden>
    <tit|Continuous inputs>

    assume that the class-conditional densities are Gaussian, all classes
    share the same covariance matrix. the density for class
    <math|\<cal-C\><rsub|k>> is given by\ 

    <\equation*>
      p(\<b-x\>\|\<cal-C\><rsub|k>) = <frac|1|<around*|(|2\<pi\>|)><rsup|D/2>><frac|1|<around*|\||<big|sum>|\|><rsup|1/2>>exp<around*|{|\<minus\><frac|1|2>(\<b-x\>
      \<minus\> \<b-mu\><rsub|k>)<rsup|T>\<Sigma\><rsup|-1>(\<b-x\>
      \<minus\>\<b-mu\><rsub|k>) |}>.
    </equation*>

    Consider first the case of two classes.

    <\equation*>
      <around*|[|<reference|posterior>|]><space|5em>p<around*|(|\<cal-C\><rsub|1><around*|\||\<b-x\>|\<nobracket\>>|)>=\<sigma\><around*|(|\<b-w\><rsup|T>\<b-x\>+w<rsub|0>|)>
    </equation*>

    <math|>where we have defined

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-w\>>|<cell|=>|<cell|\<Sigma\><rsup|-1><around*|(|\<b-mu\><rsub|1>-\<b-mu\><rsub|2>|)>>>|<row|<cell|w<rsub|0>>|<cell|=>|<cell|-<frac|1|2>\<b-mu\><rsub|1><rsup|T>\<Sigma\><rsup|-1>\<b-mu\><rsub|1>+<frac|1|2>\<b-mu\><rsub|2><rsup|T>\<Sigma\><rsup|-1>\<b-mu\><rsub|2>+ln<frac|p<around*|(|\<cal-C\><rsub|1>|)>|p<around*|(|\<cal-C\><rsub|2>|)>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    <image|img/figure_4_10_conditional_posterior.png|1par|||>
  </hidden>|<\hidden>
    \;

    \;

    For the general case of <math|K> classes we have,

    <\equation*>
      <around*|[|<reference|multi-posterior>|]><space|6em>a<rsub|k>(\<b-x\>)
      = \<b-w\><rsub|k><rsup|T>\<b-x\> + w<rsub|k0>\ 
    </equation*>

    where we have defined\ 

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-w\><rsub|k>>|<cell|=>|<cell|\<Sigma\><rsup|-1>\<b-mu\><rsub|k>>>|<row|<cell|<next-line>\<b-w\><rsub|k0>>|<cell|=>|<cell|
      \<minus\><frac|1|2>\<b-mu\><rsup|T><rsub|k>\<Sigma\><rsup|-1>\<b-mu\><rsub|k>
      +ln p(\<cal-C\><rsub|k>).>>>>
    </eqnarray*>
  </hidden>|<\shown>
    \;

    <space|2em><image|img/figure_4_11_boundary.png|0.8par|||>
  </shown>>
</body>

<\initial>
  <\collection>
    <associate|bg-color|white>
    <associate|info-flag|none>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-packet|6>
    <associate|page-type|16:9>
    <associate|page-width|auto>
    <associate|title-bar-color|<macro|<pattern|/Applications/TeXmacs.app/Contents/Resources/share/TeXmacs/misc/patterns/vintage/paper-manila-medium.png||>>>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|multi-posterior|<tuple|<with|mode|<quote|math>|\<bullet\>>|?>>
    <associate|posterior|<tuple|<with|mode|<quote|math>|\<bullet\>>|1>>
  </collection>
</references>