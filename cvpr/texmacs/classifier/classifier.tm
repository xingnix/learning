<TeXmacs|2.1.4>

<style|<tuple|beamer|blackboard>>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <doc-data|<doc-title|<with|font-base-size|20|\<#8BA1\>\<#7B97\>\<#89C6\>\<#89C9\>\<#4E0E\>\<#6A21\>\<#5F0F\>\<#8BC6\>\<#522B\>>>>

    \;
  </hidden>|<\hidden>
    <tit|\<#5206\>\<#7C7B\>\<#5668\>>

    \ \<#6570\>\<#636E\>\<#96C6\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<around*|(|x<rsub|1>,y<rsub|1>|)>>|<cell|\<cdots\>>|<cell|<around*|(|x<rsub|n>,y<rsub|n>|)>>>>>
    </eqnarray*>

    \<#5206\>\<#7C7B\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|x<rsub|new>>|<cell|\<rightarrow\>>|<cell|?>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#98CE\>\<#9669\>\<#51FD\>\<#6570\>>

    \;

    \<#635F\>\<#5931\>\<#51FD\>\<#6570\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|L<around*|(|i\<rightarrow\>j|)>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|l\<gtr\>0>>|<row|<cell|0>>>>><space|2em><tabular|<tformat|<table|<row|<cell|i\<neq\>j>>|<row|<cell|i=j>>>>>>>>>
    </eqnarray*>

    \;

    \<#98CE\>\<#9669\>\<#51FD\>\<#6570\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|R(s)>|<cell|=>|<cell|P r {1 \<rightarrow\>
      2\|using s} L(1 \<rightarrow\> 2) + P r {2 \<rightarrow\> 1\|using s}
      L(2 \<rightarrow\> 1)>>>>
    </eqnarray*>

    \;

    \;
  </hidden>|<\hidden>
    <tit|\<#5206\>\<#7C7B\>\<#8FB9\>\<#754C\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|>|<cell|>|<cell|P{class is 2\|x} L(2
      \<rightarrow\> 1) + P {class is 1\|x} L(1 \<rightarrow\>
      1)>>|<row|<cell|>|<cell|=>|<cell|P {class is 2\|x} L(2 \<rightarrow\>
      1) + 0>>|<row|<cell|>|<cell|=>|<cell|p(2\|x)L(2 \<rightarrow\>
      1)>>|<row|<cell|>|<cell|>|<cell|P {class is 1\|x} L(1 \<rightarrow\> 2)
      >>|<row|<cell|>|<cell|=>|<cell|p(1\|x)L(1 \<rightarrow\> 2)>>>>
    </eqnarray*>

    \<#8FB9\>\<#754C\>\<#4E0A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|p(2\|x)L(2 \<rightarrow\>
      1)>|<cell|=>|<cell|p(1\|x)L(1 \<rightarrow\> 2)>>>>
    </eqnarray*>

    \<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|p(x\|2)p<around*|(|2|)>L(2 \<rightarrow\>
      1)>|<cell|=>|<cell|p(x\|1)p<around*|(|1|)>L(1 \<rightarrow\> 2)>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5206\>\<#7C7B\>>

    \;

    \;

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|x\<rightarrow\>1<space|5em>p(x\|2)p<around*|(|2|)>L(2
      \<rightarrow\> 1)>|<cell|\<less\>>|<cell|p(x\|1)p<around*|(|1|)>L(1
      \<rightarrow\> 2)>>|<row|<cell|x\<rightarrow\>2<space|5em>p(x\|2)p<around*|(|2|)>L(2
      \<rightarrow\> 1)>|<cell|\<gtr\>>|<cell|p(x\|1)p<around*|(|1|)>L(1
      \<rightarrow\> 2)>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#591A\>\<#7C7B\>\<#522B\>\<#8D1D\>\<#53F6\>\<#65AF\>\<#5206\>\<#7C7B\>\<#5668\>>

    \<#635F\>\<#5931\>\<#51FD\>\<#6570\>

    <\itemize-dot>
      <item><math|\<exists\>k,Pr<around*|(|k\|x|)>\<gtr\>1-d>

      <\eqnarray*>
        <tformat|<table|<row|<cell|L<around*|(|i\<rightarrow\>j|)>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|1>|<cell|i\<neq\>j>>|<row|<cell|0>|<cell|i=j>>>>>>>>>
      </eqnarray*>

      <item><math|\<forall\>k,Pr<around*|(|k\|x|)>\<less\>1-d>,d\<less\>1

      <\eqnarray*>
        <tformat|<table|<row|<cell|L<around*|(|i\<rightarrow\>j|)>>|<cell|=>|<cell|d>>>>
      </eqnarray*>
    </itemize-dot>

    \<#9009\>\<#62E9\>\<#7C7B\>\<#522B\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|c>|<cell|=>|<cell|arg max<rsub|k>
      Pr<around*|(|k\|x|)>>>>>
    </eqnarray*>
  </hidden>|<\shown>
    \;

    <image|img/decision_boundary.png|1par|||>
  </shown>|<\hidden>
    <tit|Logistic regression>

    <\eqnarray*>
      <tformat|<table|<row|<cell|log<frac|p<around*|(|1\|\<b-x\>|)>|p<around*|(|-1\|\<b-x\>|)>>>|<cell|=>|<cell|\<b-a\><rsup|T>\<b-x\>>>|<row|<cell|p<around*|(|1\|\<b-x\>|)>>|<cell|=>|<cell|<frac|e<rsup|\<b-a\><rsup|T>\<b-x\>>|1+e<rsup|\<b-a\><rsup|T>\<b-x\>>>>>|<row|<cell|p<around*|(|-1\|\<b-x\>|)>>|<cell|=>|<cell|<frac|1|1+e<rsup|\<b-a\><rsup|T>\<b-x\>>>>>|<row|<cell|L>|<cell|=>|<cell|-<big|sum><rsub|i><frac|1+y<rsub|i>|2>\<b-a\><rsup|T>\<b-x\><rsub|i>-ln<around*|(|1+e<rsup|\<b-a\><rsup|T>\<b-x\><rsub|i>>|)>>>|<row|<cell|<wide|a|^>>|<cell|=>|<cell|arg
      min<rsub|a> L>>>>
    </eqnarray*>

    <\folded-std>
      note
    <|folded-std>
      <\eqnarray*>
        <tformat|<table|<row|<cell|p<around*|(|1\|\<b-x\>|)>>|<cell|=>|<cell|<frac|1|1+e<rsup|-\<b-a\><rsup|T>\<b-x\>>>>>|<row|<cell|p<around*|(|-1\|\<b-x\>|)>>|<cell|=>|<cell|<frac|1|1+e<rsup|\<b-a\><rsup|T>\<b-x\>>>>>|<row|<cell|p<around*|(|y\|\<b-x\>|)>>|<cell|=>|<cell|<frac|1|1+e<rsup|-y\<b-a\><rsup|T>\<b-x\>>><space|2em><around*|(|y=\<pm\>1|)>>>|<row|<cell|L<around*|(|y<rsub|i>,\<gamma\><rsub|i>|)>>|<cell|=>|<cell|-ln\<nospace\><around*|[|p<around*|(|y<rsub|i>\|\<b-x\><rsub|i>|)>|]>>>|<row|<cell|>|<cell|=>|<cell|ln<around*|(|1+e<rsup|-y<rsub|i>\<gamma\><rsub|i>>|)><space|2em><around*|(|\<gamma\><rsub|i>=\<b-a\><rsup|T>\<b-x\><rsub|i>|)>>>>>
      </eqnarray*>
    </folded-std>
  </hidden>|<\hidden>
    <tit|\<#6B63\>\<#5219\>\<#5316\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|L>|<cell|=>|<cell|-<big|sum><rsub|i><frac|1+y<rsub|i>|2>\<b-a\><rsup|T>\<b-x\><rsub|i>-ln<around*|(|1+e<rsup|\<b-a\><rsup|T>\<b-x\><rsub|i>>|)>+\<lambda\><around*|\<\|\|\>|\<b-a\>|\<\|\|\>><rsub|p>>>>>
    </eqnarray*>

    <\itemize-dot>
      <item><math|p=2>

      <\eqnarray*>
        <tformat|<table|<row|<cell|<around*|\<\|\|\>|\<b-a\>|\<\|\|\>><rsub|2>>|<cell|=>|<cell|\<lambda\>\<b-a\><rsup|T>\<b-a\>>>>>
      </eqnarray*>

      <item>p=1

      <\eqnarray*>
        <tformat|<table|<row|<cell|<around*|\<\|\|\>|\<b-a\>|\<\|\|\>><rsub|1>>|<cell|=>|<cell|<big|sum><rsub|i><around*|\||a<rsub|i>|\|>>>>>
      </eqnarray*>
    </itemize-dot>
  </hidden>|<\hidden>
    <image|img/decision_boundary_only.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6B63\>\<#6001\>\<#7C7B\>\<#522B\>\<#6761\>\<#4EF6\>\<#5206\>\<#5E03\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-mu\><rsub|k>>|<cell|=>|<cell|<frac|1|N<rsub|k>><big|sum><rsub|i=1><rsup|N<rsub|k>>\<b-x\><rsub|k,i>>>|<row|<cell|\<b-Sigma\><rsub|k>>|<cell|=>|<cell|<frac|1|N<rsub|k>-1><big|sum><rsub|i=1><rsup|N<rsub|k>><around*|(|\<b-x\><rsub|k,i>-\<b-mu\><rsub|k>|)><around*|(|\<b-x\><rsub|k,i>-\<b-mu\><rsub|k>|)><rsup|T>>>>>
    </eqnarray*>

    \<#9009\>\<#62E9\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|c>|<cell|=>|<cell|arg min<rsub|k>
      \<delta\><around*|(|\<b-x\>;\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)><rsup|2>-Pr<around*|{|k|}>>>>>
    </eqnarray*>

    \<#5176\>\<#4E2D\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<delta\><around*|(|\<b-x\>;\<b-mu\><rsub|k>,\<b-Sigma\><rsub|k>|)>>|<cell|=>|<cell|<frac|1|2><around*|(|<around*|(|\<b-x\>-\<b-mu\><rsub|k>|)><rsup|T>\<b-Sigma\><rsub|k><rsup|-1><around*|(|\<b-x\>-\<b-mu\><rsub|k>|)>|)><rsup|1/2>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|k\<#90BB\>\<#5206\>\<#7C7B\>\<#5668\>>

    \<#5BF9\>\<#4E8E\>\<#7279\>\<#5F81\>\<#5411\>\<#91CF\><math|\<b-x\>>

    <\itemize-dot>
      <item>\<#786E\>\<#5B9A\>\<#8DDD\>\<#79BB\><math|\<b-x\>>\<#6700\>\<#8FD1\>\<#7684\>k\<#4E2A\>\<#8BAD\>\<#7EC3\>\<#6837\>\<#4F8B\>

      <item>\<#786E\>\<#5B9A\>k\<#4E2A\>\<#6837\>\<#4F8B\>\<#4E2D\>\<#5C5E\>\<#4E8E\>\<#5404\>\<#7C7B\>\<#522B\>\<#7684\>\<#6837\>\<#4F8B\>\<#6570\>

      <item>\<#6709\>\<#6700\>\<#591A\>\<#6837\>\<#4F8B\>\<#7684\>\<#7C7B\>\<#522B\>\<#8BB0\>\<#4F5C\>c,\<#4E2A\>\<#6570\>\<#8BB0\>\<#4F5C\>n

      <item><math|n\<gtr\>l>\<#65F6\><math|x\<in\>c>\<#FF0C\>\<#5426\>\<#5219\>\<#62D2\>\<#7EDD\>\<#5206\>\<#7C7B\>
    </itemize-dot>
  </hidden>|<\hidden>
    <tit|\<#4F30\>\<#8BA1\>\<#3001\>\<#63D0\>\<#9AD8\>\<#6027\>\<#80FD\>>

    <\itemize-dot>
      <item>Cross Validation

      \<#5212\>\<#5206\>\<#6570\>\<#636E\>\<#96C6\>\<#FF0C\>\<#4EA4\>\<#66FF\>\<#9009\>\<#62E9\>\<#8BAD\>\<#7EC3\>\<#96C6\>\<#4E0E\>\<#6D4B\>\<#8BD5\>\<#96C6\>

      <item>Bootstrapping

      \<#90E8\>\<#5206\>\<#6570\>\<#636E\>\<#96C6\>\<#7528\>\<#4E8E\>\<#8BAD\>\<#7EC3\>\<#FF0C\>\<#4F59\>\<#4E0B\>\<#7684\>\<#6D4B\>\<#8BD5\>\<#FF0C\>\<#51FA\>\<#9519\>\<#6837\>\<#4F8B\>\<#518D\>\<#6B21\>\<#8BAD\>\<#7EC3\>
    </itemize-dot>
  </hidden>|<\hidden>
    <tit|\<#76AE\>\<#80A4\>\<#50CF\>\<#7D20\>\<#5206\>\<#7C7B\>>

    \;

    \<#6BD4\>\<#8F83\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|p<around*|(|\<b-x\>\|skin|)>p<around*|(|skin|)>|p<around*|(|\<b-x\>|)>>L<around*|(|skin\<rightarrow\>not
      skin|)>>|<cell|>|<cell|>>|<row|<cell|<frac|p<around*|(|\<b-x\>\|not
      skin|)>p<around*|(|not skin|)>|p<around*|(|\<b-x\>|)>>L<around*|(|not
      skin\<rightarrow\>skin|)>>|<cell|>|<cell|>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    <space|6em><image|img/skin_sample.png|0.6par|||>
  </hidden>|<\hidden>
    \;

    <image|img/skin_roc.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#6734\>\<#7D20\>\<#8D1D\>\<#53F6\>\<#65AF\>>

    \;

    <\eqnarray*>
      <tformat|<table|<row|<cell|P (image\|face)>|<cell|=>|<cell|P (label 1
      at (x1 , y1),\<ldots\>,label k at (xk ,
      yk)\|face)>>|<row|<cell|>|<cell|=>|<cell|P (label 1 at (x1 , y1)\|face)
      \<cdots\>P (label k at (xk , yk )\|face)>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|PCA>

    <\eqnarray*>
      <tformat|<table|<row|<cell|v<around*|(|\<b-x\><rsub|i>|)>>|<cell|=>|<cell|\<b-v\><rsup|T><around*|(|\<b-x\><rsub|i>-\<b-mu\>|)>>>|<row|<cell|var<around*|(|\<b-v\>|)>>|<cell|=>|<cell|<frac|1|n-1>v<around*|(|\<b-x\><rsub|i>|)>v<around*|(|\<b-x\><rsub|i>|)><rsup|T>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|n-1><big|sum><rsub|i=1><rsup|n>\<b-v\><rsup|T><around*|(|\<b-x\><rsub|i>-\<b-mu\>|)><around*|(|\<b-x\><rsub|i>-\<b-mu\>|)><rsup|T>\<b-v\><rsup|>>>|<row|<cell|>|<cell|=>|<cell|\<b-v\><rsup|T>\<Sigma\>\<b-v\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    <space|5em><image|img/pca.png|0.7par|||>\ 
  </hidden>|<\hidden>
    <tit|Canonical Variates>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|\<b-mu\>|\<wide-bar\>>>|<cell|=>|<cell|<frac|1|g><big|sum><rsub|j=1><rsup|g>\<b-mu\><rsub|j>>>|<row|<cell|\<cal-B\>>|<cell|=>|<cell|<frac|1|g-1><big|sum><rsub|j=1><rsup|g><around*|(|\<b-mu\><rsub|j>-<wide|\<b-mu\>|\<wide-bar\>>|)><around*|(|\<b-mu\><rsub|j>-<wide|\<b-mu\>|\<wide-bar\>>|)><rsup|T>>>>>
    </eqnarray*>

    \<#6700\>\<#5927\>\<#5316\>

    <\equation*>
      <frac|\<b-v\><rsub|1><rsup|T>\<cal-B\>\<b-v\><rsub|1>|\<b-v\><rsub|1><rsup|T>\<Sigma\>\<b-v\><rsub|1>>
    </equation*>

    \ \<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<cal-B\>\<b-v\><rsub|1>+\<lambda\>\<Sigma\>\<b-v\><rsub|1>>|<cell|=>|<cell|0>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <space|2em><image|img/canonical_variate.png|0.8par|||>

    <\folded-std>
      Figure 25.10
    <|folded-std>
      Principal component analysis doesn't take into account the fact that
      there may be more than one class of item in a dataset. This can lead to
      significant problems. For a classifier, we would like to obtain a set
      of features that firstly reduces the number of features and secondly
      makes the difference between classes most obvious. For the data set on
      the top, one class is indicated by circles and the other by stars. PCA
      would suggest projection onto a vertical axis, which captures the
      variance in the dataset, but cannot be used to discriminate it, as we
      can see from the axes obtained by PCA, which are overlaid on the data
      set. The bottom row shows the projections onto those axes. On the
      bottom left, we show the projection onto the first principal component
      \V which has higher variance, but separates the classes poorly \V and
      on the bottom right, we show the projection onto the second principal
      component \V which has significantly lower variance (look at the axes)
      and gives better separation.
    </folded-std>
  </hidden>>
</body>

<\initial>
  <\collection>
    <associate|font|roman>
    <associate|font-base-size|12>
    <associate|font-family|rm>
    <associate|info-flag|minimal>
    <associate|math-font|roman>
    <associate|page-medium|beamer>
    <associate|preamble|false>
  </collection>
</initial>