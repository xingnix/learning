<TeXmacs|2.1.1>

<style|<tuple|beamer|blackboard|chinese>>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    <doc-data|<doc-title|\<#7EBF\>\<#6027\>\<#6A21\>\<#578B\>>>

    \;
  </hidden>|<\hidden>
    <tit|\<#57FA\>\<#672C\>\<#5F62\>\<#5F0F\>>

    <space|2em>\<#7ED9\>\<#5B9A\>\<#7531\><math|d>\<#4E2A\>\<#5C5E\>\<#6027\>\<#63CF\>\<#8FF0\>\<#7684\>\<#5B9E\>\<#4F8B\><math|(x<rsub|1>,x<rsub|2>,\<cdots\>,x<rsub|d>)<rsup|T>>\<#FF0C\>\<#5176\>\<#4E2D\><math|x<rsub|i>>\<#5BF9\>\<#5E94\>\<#7B2C\><math|i>\<#4E2A\>\<#5C5E\>\<#6027\>\<#4E0A\>\<#7684\>\<#503C\>\<#FF0C\>\<#7EBF\>\<#6027\>\<#6A21\>\<#578B\>(linear
    model)\<#5229\>\<#7528\>\<#5C5E\>\<#6027\>\<#7684\>\<#7EBF\>\<#6027\>\<#7EC4\>\<#5408\>\<#6765\>\<#8FDB\>\<#884C\>\<#9884\>\<#6D4B\>\<#FF0C\>\<#5373\>\<#FF1A\>

    <\equation*>
      f(\<b-x\> )=w<rsub|0>+w<rsub|1>x<rsub|1>+w<rsub|2>x<rsub|2>+\<cdots\>+w<rsub|d>x<rsub|d>
    </equation*>

    \<#5411\>\<#91CF\>\<#5F62\>\<#5F0F\>\<#4E3A\>\<#FF1A\>

    <\equation*>
      f(\<b-x\> )=\<b-w\><rsup|T>\<b-x\>\ 
    </equation*>

    \<#5176\>\<#4E2D\> <math|\<b-w\>=(w<rsub|0,>w<rsub|1>,w<rsub|2>,\<cdots\>,w<rsub|d>)<rsup|T>,x=<around*|(|1,x<rsub|1>,x<rsub|2>,\<cdots\>,x<rsub|d>|)>>\<#3002\>
  </hidden>|<\hidden>
    <tit|\<#7EBF\>\<#6027\>\<#56DE\>\<#5F52\>>

    \<#7ED9\>\<#5B9A\>\<#6570\>\<#636E\>\<#96C6\>

    <\equation*>
      D={( x<rsub|1>,y<rsub|1>),( x<rsub|2>,y<rsub|2>),\<cdots\>,(x<rsub|m>,y<rsub|m>)},
    </equation*>

    \<#5176\>\<#4E2D\><math|x<rsub|i>=(x<rsub|i1>,x<rsub|i2>,\<cdots\>,x<rsub|id>),y<rsub|i>\<in\>R>\<#3002\>

    \P\<#7EBF\>\<#6027\>\<#56DE\>\<#5F52\>\Q(linear
    regression)\<#5B66\>\<#4E60\>\<#4E00\>\<#4E2A\>\<#7EBF\>\<#6027\>\<#6A21\>\<#578B\>\<#4EE5\>\<#5C3D\>\<#53EF\>\<#80FD\>\<#51C6\>\<#786E\>\<#5730\>\<#9884\>\<#6D4B\>\<#5B9E\>\<#503C\>\<#8F93\>\<#51FA\>\<#6807\>\<#8BB0\>\<#3002\>
  </hidden>|<\hidden>
    <tit|\<#5747\>\<#65B9\>\<#8BEF\>\<#5DEE\>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|f<around*|(|x|)>>|<cell|=>|<cell|\<b-w\><rsup|T>\<b-x\>>>|<row|<cell|E>|<cell|=>|<cell|<big|sum><rsub|i=1><rsup|m><around*|(|y<rsub|i>-f<around*|(|x<rsub|i>|)>|)><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|\<b-y\>-X*\<b-w\>|)><rsup|T><around*|(|\<b-y\>-X*\<b-w\>|)>>>>>
    </eqnarray*>

    \<#5176\>\<#4E2D\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|X>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-x\><rsub|1>,\<cdots\>,x<rsub|m>>>>>><rsup|T>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#6700\>\<#5C0F\>\<#4E8C\>\<#4E58\>\<#6CD5\>>

    <\eqnarray*>
      <tformat|<table|<row|\<b-w\>|<cell|=>|<cell|<around*|(|X<rsup|T>X|)><rsup|T>X<rsup|T>Y>>|<row|<cell|f<around*|(|\<b-x\>|)>>|<cell|=>|<cell|\<b-w\><rsup|T>\<b-x\>>>|<row|<cell|>|<cell|=>|<cell|\<b-x\><rsup|T><around*|(|X<rsup|T>X|)><rsup|T>X<rsup|T>Y>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#5BF9\>\<#6570\>\<#7EBF\>\<#6027\>\<#56DE\>\<#5F52\>(log-linear
    regression)>

    <\eqnarray*>
      <tformat|<table|<row|<cell|ln y>|<cell|=>|<cell|\<b-w\><rsup|T>\<b-x\>>>>>
    </eqnarray*>

    <space|5em><image|img/log-linear_regression.png|0.5par|||>
  </hidden>|<\hidden>
    <\tit>
      \<#5E7F\>\<#4E49\>\<#7EBF\>\<#6027\>\<#6A21\>\<#578B\>(generalized
      linear model)
    </tit>

    <\eqnarray*>
      <tformat|<table|<row|<cell|y>|<cell|=>|<cell|g<rsup|-1><around*|(|\<b-w\><rsup|T>\<b-x\>|)>>>>>
    </eqnarray*>

    \<#5176\>\<#4E2D\><math|g<around*|(|\<cdummy\>|)>>\<#79F0\>\<#4E3A\>\P\<#8054\>\<#7CFB\>\<#51FD\>\<#6570\>\Q(link
    function)\<#3002\>
  </hidden>|<\hidden>
    <tit|\<#5BF9\>\<#6570\>\<#51E0\>\<#7387\>\<#56DE\>\<#5F52\>>

    \<#5BF9\>\<#6570\>\<#51E0\>\<#7387\>(log odds, logit): <math|ln
    <frac|y|1-y>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|ln<frac|y|1-y>>|<cell|=>|<cell|\<b-w\><rsup|T>\<b-x\>>>|<row|y|<cell|=>|<cell|<frac|1|1+e<rsup|-\<b-w\><rsup|T>\<b-x\>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|logistic function>

    <space|2em><image|img/logistic_fuction.png|0.8par|||>
  </hidden>|<\hidden>
    <\tit>
      \<#6781\>\<#5927\>\<#4F3C\>\<#7136\>\<#6CD5\>(maximum likelihood
      method)
    </tit>

    <\eqnarray*>
      <tformat|<table|<row|<cell|ML<around*|(|\<b-w\>|)>>|<cell|=>|<cell|<big|sum><rsub|i=1><rsup|m>ln
      p<around*|(|y<rsub|i><around*|\||\<b-x\><rsub|i>,\<b-w\>|\<nobracket\>>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i=1><rsup|m><around*|{|y<rsub|i>ln
      p<around*|(|y<rsub|i>=1<around*|\||\<b-x\><rsub|i>,\<b-w\>|\<nobracket\>>|)>+<around*|(|1-y<rsub|i>|)>ln
      p<around*|(|y<rsub|i>=0<around*|\||\<b-x\><rsub|i>,\<b-w\>|\<nobracket\>>|)>|}>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i=1><rsup|m><around*|{|y<rsub|i>\<b-w\><rsup|T>\<b-x\>-ln<around*|(|1+e<rsup|\<b-w\><rsup|T>\<b-x\>>|)>|}>>>>>
    </eqnarray*>

    \<#5176\>\<#4E2D\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|y=1<around*|\|||\<nobracket\>>\<b-x\>,\<b-w\>|)>>|<cell|=>|<cell|<frac|1|1+e<rsup|-\<b-w\><rsup|T>\<b-x\>>>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    <tit|\<#7EBF\>\<#6027\>\<#5224\>\<#522B\>\<#5206\>\<#6790\>>

    \;

    \<#7EBF\>\<#6027\>\<#5224\>\<#522B\>\<#5206\>\<#6790\>\<#FF08\> Linear
    Discriminant Analysis \<#FF0C\> LDA \<#FF09\>\<#601D\>\<#60F3\>\<#FF1A\>

    <\itemize-dot>
      <item>\<#7ED9\>\<#5B9A\>\<#8BAD\>\<#7EC3\>\<#6837\>\<#4F8B\>\<#96C6\>\<#FF0C\>\<#8BBE\>\<#6CD5\>\<#5C06\>\<#6837\>\<#4F8B\>\<#6295\>\<#5F71\>\<#5230\>\<#4E00\>\<#6761\>\<#76F4\>\<#7EBF\>\<#4E0A\>\<#FF0C\>\<#4F7F\>\<#5F97\>

      <\itemize-dot>
        <item>\<#540C\>\<#7C7B\>\<#6837\>\<#4F8B\>\<#7684\>\<#6295\>\<#5F71\>\<#70B9\>\<#5C3D\>\<#53EF\>\<#80FD\>\<#63A5\>\<#8FD1\>\<#3001\>

        <item>\<#5F02\>\<#7C7B\>\<#6837\>\<#4F8B\>\<#7684\>\<#6295\>\<#5F71\>\<#70B9\>\<#5C3D\>\<#53EF\>\<#80FD\>\<#8FDC\>\<#79BB\>\<#FF1B\>
      </itemize-dot>

      <item>\<#5728\>\<#5BF9\>\<#65B0\>\<#6837\>\<#672C\>\<#8FDB\>\<#884C\>\<#5206\>\<#7C7B\>\<#65F6\>\<#FF0C\>\<#5C06\>\<#5176\>\<#6295\>\<#5F71\>\<#5230\>\<#540C\>\<#6837\>\<#7684\>\<#8FD9\>\<#6761\>\<#76F4\>\<#7EBF\>\<#4E0A\>\<#FF0C\>\<#518D\>\<#6839\>\<#636E\>\<#6295\>\<#5F71\>\<#70B9\>\<#7684\>\<#4F4D\>\<#7F6E\>\<#6765\>\<#786E\>\<#5B9A\>\<#65B0\>\<#6837\>\<#672C\>\<#7684\>\<#7C7B\>\<#522B\>\<#3002\>
    </itemize-dot>
  </hidden>|<\hidden>
    <tit|\<#7EBF\>\<#6027\>\<#5224\>\<#522B\>\<#5206\>\<#6790\>\<#793A\>\<#4F8B\>>

    <space|2em><image|img/LDA.png|0.8par|||>
  </hidden>|<\hidden>
    \<#6570\>\<#636E\>\<#96C6\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|D<rsub|0>>|<cell|=>|<cell|<around*|{|<around*|(|\<b-x\><rsup|<around*|(|0|)>><rsub|i>,0|)><around*|\|||\<nobracket\>>i=1,\<cdots\>,m<rsub|0>|}>>>|<row|<cell|D<rsub|1>>|<cell|=>|<cell|<around*|{|<around*|(|\<b-x\><rsup|<around*|(|1|)>><rsub|i>,0|)><around*|\|||\<nobracket\>>i=1,\<cdots\>,m<rsub|1>|}>>>|<row|<cell|X<rsub|j>>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|\<b-x\><rsup|<around*|(|j|)>><rsub|1>>|<cell|\<b-x\><rsup|<around*|(|j|)>><rsub|2>>|<cell|\<cdots\>>|<cell|\<b-x\><rsup|<around*|(|j|)>><rsub|m<rsub|j>>>>>>>>>>>
    </eqnarray*>

    \<#5747\>\<#503C\>\<#3001\>\<#534F\>\<#65B9\>\<#5DEE\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-mu\><rsub|j>>|<cell|=>|<cell|<frac|1|m<rsub|j>><big|sum><rsub|i=1><rsup|m<rsub|j>>\<b-x\><rsup|<around*|(|j|)>><rsub|i>>>|<row|<cell|\<Sigma\><rsub|j>>|<cell|=>|<cell|<frac|1|m<rsub|j>><big|sum><rsub|i=1><rsup|m<rsub|j>><around*|(|\<b-x\><rsup|<around*|(|j|)>><rsub|i>-\<b-mu\><rsub|j>|)><around*|(|\<b-x\><rsup|<around*|(|j|)>><rsub|i>-\<b-mu\><rsub|j>|)><rsup|T>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \<#6295\>\<#5F71\>\<#5230\>\<#76F4\>\<#7EBF\><math|\<b-w\><rsup|T>>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-x\><rprime|'>>|<cell|=>|<cell|\<b-w\><rsup|T>\<b-x\>>>>>
    </eqnarray*>

    \<#5747\>\<#503C\>\<#3001\>\<#65B9\>\<#5DEE\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<b-mu\><rprime|'><rsub|j>>|<cell|=>|<cell|<frac|1|m<rsub|j>><big|sum><rsub|i=1><rsup|m<rsub|j>>\<b-w\><rsup|T>\<b-x\><rsup|<around*|(|j|)>><rsub|i>=\<b-w\><rsup|T>\<b-mu\>>>|<row|<cell|\<Sigma\><rprime|'><rsub|j>>|<cell|=>|<cell|<frac|1|m<rsub|j>><big|sum><rsub|i=1><rsup|m<rsub|j>><around*|(|\<b-w\><rsup|T>\<b-x\><rsup|<around*|(|j|)>><rsub|i>-\<b-mu\><rprime|'><rsub|j>|)><around*|(|\<b-w\><rsup|T>\<b-x\><rsup|<around*|(|j|)>><rsub|i>-\<b-mu\><rprime|'><rsub|j>|)><rsup|T>>>|<row|<cell|>|<cell|=>|<cell|\<b-w\><rsup|T>\<Sigma\><rsub|j>\<b-w\>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \;

    \<#7C7B\>\<#5185\>\<#6563\>\<#5EA6\>\<#77E9\>\<#9635\>\<#FF08\>within-class
    scatter matrix\<#FF09\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|S<rsub|w>>|<cell|=>|<cell|\<Sigma\><rsub|0>+\<Sigma\><rsub|1>>>>>
    </eqnarray*>

    \<#7C7B\>\<#95F4\>\<#6563\>\<#5EA6\>\<#77E9\>\<#9635\>\<#FF08\>between-class
    scatter matrix\<#FF09\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|S<rsub|b>>|<cell|=>|<cell|<around*|(|\<b-mu\><rsub|0>-\<b-mu\><rsub|1>|)><around*|(|\<b-mu\><rsub|0>-\<b-mu\><rsub|1>|)><rsup|T>>>>>
    </eqnarray*>

    \<#5E7F\>\<#4E49\>\<#745E\>\<#5229\>\<#5546\>(generalized Rayleigh
    quotient)

    <\eqnarray*>
      <tformat|<table|<row|<cell|J>|<cell|=>|<cell|<frac|\<b-w\><rsup|T>S<rsub|b>\<b-w\>|\<b-w\><rsup|T>S<rsub|w>\<b-w\>>>>>>
    </eqnarray*>
  </hidden>|<\shown>
    \<#4F18\>\<#5316\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|min<rsub|\<b-w\>>>|<cell|-\<b-w\><rsup|T>S<rsub|b>\<b-w\>>|<cell|>>|<row|<cell|s.t.>|<cell|\<b-w\><rsup|T>S<rsub|w>\<b-w\>=1>|<cell|>>>>
    </eqnarray*>

    \<#5F97\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|J<around*|(|\<b-w\>|)>>|<cell|=>|<cell|-\<b-w\><rsup|T>S<rsub|b>\<b-w\>+\<lambda\><rprime|'><around*|(|\<b-w\><rsup|T>S<rsub|w>\<b-w\>-1|)>>>|<row|<cell|<frac|\<partial\>J|\<partial\>\<b-w\>>>|<cell|=>|<cell|-\<b-w\><rsup|T>S<rsub|b>+\<lambda\><lprime|`>\<b-w\><rsup|T>S<rsub|w>>>|<row|<cell|0>|<cell|=>|<cell|-S<rsub|b>\<b-w\>+\<lambda\><rprime|'>S<rsub|w>\<b-w\>>>|<row|<cell|0>|<cell|=>|<cell|-S<rsub|b>\<b-w\>+\<lambda\><rprime|'><around*|(|\<b-mu\><rsub|0>-\<b-mu\><rsub|1>|)><around*|(|\<b-mu\><rsub|0>-\<b-mu\><rsub|1>|)><rsup|T>\<b-w\>>>|<row|<cell|S<rsub|b>\<b-w\>>|<cell|=>|<cell|\<lambda\><around*|(|\<b-mu\><rsub|0>-\<b-mu\><rsub|1>|)><space|4em>\<lambda\>=\<lambda\><rprime|'><around*|(|\<b-mu\><rsub|0>-\<b-mu\><rsub|1>|)><rsup|T>\<b-w\>>>|<row|<cell|\<b-w\>>|<cell|=>|<cell|S<rsub|b><rsup|-1>\<lambda\><around*|(|\<b-mu\><rsub|0>-\<b-mu\><rsub|1>|)>>>>>
    </eqnarray*>

    \;
  </shown>|<\hidden>
    <tit|\<#591A\>\<#5206\>\<#7C7B\>>

    <math|n>\<#4E2A\>\<#7C7B\>\<#522B\>\<#FF0C\>\<#5747\>\<#503C\>\<#4E3A\><math|\<b-mu\>>

    \<#7C7B\>\<#5185\>\<#6563\>\<#5EA6\>\<#77E9\>\<#9635\>\<#FF08\>within-class
    scatter matrix\<#FF09\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|S<rsub|w>>|<cell|=>|<cell|<big|sum><rsub|j=1><rsup|n><frac|1|m<rsub|j>><big|sum><rsub|i=1><rsup|m<rsub|j>><around*|(|\<b-x\><rsup|<around*|(|j|)>><rsub|i>-\<b-mu\><rsub|j>|)><around*|(|\<b-x\><rsup|<around*|(|j|)>><rsub|i>-\<b-mu\><rsub|j>|)><rsup|T>>>>>
    </eqnarray*>

    \<#7C7B\>\<#95F4\>\<#6563\>\<#5EA6\>\<#77E9\>\<#9635\>\<#FF08\>between-class
    scatter matrix\<#FF09\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|S<rsub|b>>|<cell|=>|<cell|<big|sum><rsub|j=1><rsup|n>m<rsub|j><around*|(|\<b-mu\><rsub|j>-\<b-mu\>|)><around*|(|\<b-mu\><rsub|j>-\<b-mu\>|)><rsup|T>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \<#4F18\>\<#5316\>\<#76EE\>\<#6807\>

    <\equation*>
      max<rsub|W><frac|tr<around*|(|W<rsup|T>S<rsub|b>W|)>|tr<around*|(|W<rsup|T>S<rsub|w>W|)>>
    </equation*>

    \<#5176\>\<#4E2D\><math|W\<in\>\<bbb-R\><rsup|d\<times\><around*|(|N-1|)>>>,<math|tr<around*|(|\<point\>|)>>\<#8868\>\<#793A\>\<#77E9\>\<#9635\>\<#7684\>\<#8FF9\>(trace)\<#3002\>\<#53EF\>\<#8F6C\>\<#5316\>\<#4E3A\>\<#5E7F\>\<#4E49\>\<#7279\>\<#5F81\>\<#503C\>\<#95EE\>\<#9898\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|S<rsub|b>W>|<cell|=>|<cell|\<lambda\>S<rsub|w>W>>|<row|<cell|S<rsub|w><rsup|-1>S<rsub|b>W>|<cell|=>|<cell|\<lambda\>W>>>>
    </eqnarray*>

    <math|W>\<#7684\>\<#89E3\>\<#662F\><math|S<rsub|w><rsup|-1>S<rsub|b>>\<#7684\><math|N-1>\<#4E2A\>\<#6700\>\<#5927\>\<#5E7F\>\<#4E49\>\<#7279\>\<#5F81\>\<#503C\>\<#5BF9\>\<#5E94\>\<#7684\>\<#7279\>\<#5F81\>\<#5411\>\<#91CF\>\<#7EC4\>\<#6210\>\<#7684\>\<#77E9\>\<#9635\>\<#3002\>
  </hidden>|<\hidden>
    <tit|\<#591A\>\<#5206\>\<#7C7B\>\<#5B66\>\<#4E60\>>

    \;

    <space|2em><image|img/OvO_OvR.png|0.8par|||>
  </hidden>|<\hidden>
    \;

    \<#7EA0\>\<#9519\>\<#8F93\>\<#51FA\>\<#7801\>(Error Correcting Output
    Codes,ECOC)

    <image|img/ECOC.png|1par|||>
  </hidden>|<\hidden>
    <tit|\<#7C7B\>\<#522B\>\<#4E0D\>\<#5E73\>\<#8861\>\<#FF08\>class-imbalance\<#FF09\>>

    \<#518D\>\<#7F29\>\<#653E\>(rescaling)\<#4E0E\>\<#518D\>\<#5E73\>\<#8861\>(rebalance):

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|y|1-y>>|<cell|\<gtrless\>>|<cell|<frac|m<rsup|+>|m<rsup|->>>>|<row|<cell|<frac|y|1-y>\<times\><frac|m<rsup|->|m<rsup|+>>>|<cell|\<gtrless\>>|<cell|0.5>>>>
    </eqnarray*>

    \P\<#4EE3\>\<#4EF7\>\<#654F\>\<#611F\>\<#5B66\>\<#4E60\>\Q\<#FF08\>cost-sensitive
    learning\<#FF09\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|<frac|y|1-y>\<times\><frac|cost<rsup|+>|cost<rsup|->>>|<cell|\<gtrless\>>|<cell|0.5>>>>
    </eqnarray*>
  </hidden>>
</body>

<\initial>
  <\collection>
    <associate|font|stix>
    <associate|font-base-size|14>
    <associate|font-family|rm>
    <associate|info-flag|minimal>
    <associate|math-font|math-stix>
    <associate|page-medium|paper>
  </collection>
</initial>