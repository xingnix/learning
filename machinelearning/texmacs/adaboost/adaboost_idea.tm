<TeXmacs|2.1>

<style|<tuple|generic|chinese|old-dots|old-lengths>>

<\body>
  <doc-data|<doc-title|Adaboost>|<doc-author|<author-data|<author-name|Xing
  Chao>|<\author-affiliation>
    2021-12-15
  </author-affiliation>>>>

  \<#95EE\>\<#9898\>\<#63CF\>\<#8FF0\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|t<rsub|n>>|<cell|=>|<cell|<around*|{|-1,1|}><space|4em>\<#6807\>\<#7B7E\>>>|<row|<cell|y<rsub|m><around*|(|x|)>>|<cell|=>|<cell|<around*|{|<tabular*|<tformat|<table|<row|<cell|1>|<cell|,x\<gtr\>0>>|<row|<cell|-1>|<cell|,x\<less\>0>>>>>|\<nobracket\>><space|2em>\<#5F31\>\<#5206\>\<#7C7B\>\<#5668\>>>|<row|<cell|F<rsub|i><around*|(|x|)>>|<cell|=>|<cell|<frac|1|2><big|sum><rsub|m=1><rsup|i>\<alpha\><rsub|m>y<rsub|m><around*|(|x|)><space|2em>\<#5F31\>\<#5206\>\<#7C7B\>\<#5668\>\<#7EC4\>\<#5408\>>>|<row|<cell|E>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>e<rsup|-t<rsub|n>F<rsub|i><around*|(|x<rsub|n>|)>><space|3em>\<#635F\>\<#5931\>\<#51FD\>\<#6570\>>>>>
  </eqnarray*>

  \<#5F97\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|E>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>e<rsup|-<frac|1|2><big|sum><rsub|m=1><rsup|i>t<rsub|n>\<alpha\><rsub|m>y<rsub|m><around*|(|x|)>>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>e<rsup|-<frac|1|2><big|sum><rsub|m=1><rsup|i-1>t<rsub|n>\<alpha\><rsub|m>y<rsub|m><around*|(|x|)>-<frac|1|2>\<alpha\><rsub|i>t<rsub|n>y<rsub|i><around*|(|x<rsub|n>|)>>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>e<rsup|-<frac|1|2><big|sum><rsub|m=1><rsup|i-1>t<rsub|n>\<alpha\><rsub|m>y<rsub|m><around*|(|x|)>>e<rsup|-<frac|1|2>\<alpha\><rsub|i>t<rsub|n>y<rsub|i><around*|(|x<rsub|n>|)>>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>w<rsub|n><rsup|<around*|(|i|)>>e<rsup|-<frac|1|2>\<alpha\><rsub|i>t<rsub|n>y<rsub|i><around*|(|x<rsub|n>|)>>>>|<row|<cell|w<rsub|n><rsup|<around*|(|i|)>>>|<cell|=>|<cell|e<rsup|-<frac|1|2><big|sum><rsub|m=1><rsup|i-1>t<rsub|n>\<alpha\><rsub|m>y<rsub|m><around*|(|x<rsub|n>|)>>>>>>
  </eqnarray*>

  \<#4E0E\><math|t<rsub|n>y<rsub|i><around*|(|x<rsub|n>|)>>\<#6709\>\<#5173\>\<#7684\>\<#5316\>\<#7B80\>\<#65B9\>\<#6CD5\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|T>|<cell|=>|<cell|<around*|{|n\|t<rsub|n>y<rsub|i><around*|(|x<rsub|n>|)>=1|}>>>|<row|<cell|F>|<cell|=>|<cell|<around*|{|n
    \|t<rsub|n>y<rsub|i><around*|(|x<rsub|n>|)>=-1|}>>>|<row|<cell|e<rsup|-<frac|1|2>\<alpha\><rsub|i>t<rsub|n>y<rsub|i><around*|(|x<rsub|n>|)>>>|<cell|=>|<cell|<frac|1+t<rsub|n>y<rsub|i><around*|(|x<rsub|n>|)>|2>e<rsup|-<frac|1|2>\<alpha\><rsub|i>>+<frac|1-t<rsub|n>y<rsub|i><around*|(|x<rsub|n>|)>|2>e<rsup|<frac|1|2>\<alpha\><rsub|i>>>>|<row|<cell|>|<cell|=>|<cell|<frac|e<rsup|-<frac|1|2>\<alpha\><rsub|i>>+e<rsup|<rsup|<frac|1|2>\<alpha\><rsub|i>>>|2>+<frac|e<rsup|-<frac|1|2>\<alpha\><rsub|i>>-e<rsup|<frac|1|2>\<alpha\>i>|2>t<rsub|n>y<rsub|i><around*|(|x<rsub|n>|)>>>>>
  </eqnarray*>

  \<#6C42\>\<#89E3\><math|y<rsub|i><around*|(|\<cdot\>|)>>\<#FF0C\>\<#5C06\>E\<#770B\>\<#4F5C\><math|y<rsub|i><around*|(|\<cdot\>|)>>\<#7684\>\<#51FD\>\<#6570\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|E<around*|(|y<rsub|i>|)>>|<cell|=>|<cell|const\<cdot\><big|sum><rsub|n=1><rsup|N>w<rsub|n><rsup|<around*|(|i|)>>t<rsub|n>y<rsub|i><around*|(|x<rsub|n>|)>+const>>|<row|<cell|y<rsub|i>>|<cell|=>|<cell|arg
    min<rsub|y<rsub|i>><big|sum><rsub|n\<in\>F><rsup|>w<rsub|n><rsup|<around*|(|i|)>>>>>>
  </eqnarray*>

  \<#6C42\>\<#89E3\><math|\<alpha\>>

  <\eqnarray*>
    <tformat|<table|<row|<cell|<frac|\<partial\>E|\<partial\>\<alpha\><rsub|i>>>|<cell|=>|<cell|-<frac|1|2><big|sum><rsub|n=1><rsup|N>w<rsub|n><rsup|<around*|(|i|)>>e<rsup|-<frac|1|2>\<alpha\><rsub|i>t<rsub|n>y<rsub|i><around*|(|x<rsub|n>|)>>t<rsub|n>y<rsub|i><around*|(|x<rsub|n>|)>>>|<row|<cell|0>|<cell|=>|<cell|<big|sum><rsub|n=1><rsup|N>w<rsub|n><rsup|<around*|(|i|)>>e<rsup|-<frac|1|2>\<alpha\><rsub|i>t<rsub|n>y<rsub|i><around*|(|x<rsub|n>|)>>t<rsub|n>y<rsub|i><around*|(|x<rsub|n>|)>>>|<row|<cell|0>|<cell|=>|<cell|<big|sum><rsub|n\<in\>T>w<rsub|n><rsup|<around*|(|i|)>>e<rsup|-<frac|1|2>\<alpha\><rsub|i>>-<big|sum><rsub|n\<in\>F>w<rsub|n><rsup|<around*|(|i|)>>e<rsup|<frac|1|2>\<alpha\><rsub|i>>>>|<row|<cell|<big|sum><rsub|n\<in\>F>w<rsub|n><rsup|<around*|(|i|)>>e<rsup|<frac|1|2>\<alpha\><rsub|i>>>|<cell|=>|<cell|<big|sum><rsub|n\<in\>T>w<rsub|n><rsup|<around*|(|i|)>>e<rsup|-<frac|1|2>\<alpha\><rsub|i>>>>|<row|<cell|<big|sum><rsub|n\<in\>F>w<rsub|n><rsup|<around*|(|i|)>>e<rsup|\<alpha\><rsub|i>>>|<cell|=>|<cell|<big|sum><rsub|n\<in\>T>w<rsub|n><rsup|<around*|(|i|)>>>>|<row|<cell|e<rsup|\<alpha\><rsub|i>>>|<cell|=>|<cell|<frac|<big|sum><rsub|n\<in\>T>w<rsub|n><rsup|<around*|(|i|)>>|<big|sum><rsub|n\<in\>F>w<rsub|n><rsup|<around*|(|i|)>>>>>|<row|<cell|>|<cell|=>|<cell|<frac|<big|sum><rsub|n=1><rsup|N>w<rsub|n><rsup|<around*|(|i|)>>-<big|sum><rsub|n\<in\>F><rsup|>w<rsub|n><rsup|<around*|(|i|)>>|<big|sum><rsub|n\<in\>F><rsup|>w<rsub|n><rsup|<around*|(|i|)>>>>>>>
  </eqnarray*>

  \<#6C42\>\<#89E3\><math|w<rsub|n><rsup|<around*|(|i|)>>>

  <\eqnarray*>
    <tformat|<table|<row|<cell|w<rsub|n><rsup|<around*|(|i|)>>>|<cell|=>|<cell|e<rsup|-<frac|1|2><big|sum><rsub|m=1><rsup|i-1>t<rsub|n>\<alpha\><rsub|m>y<rsub|m><around*|(|x<rsub|n>|)>>>>|<row|<cell|w<rsub|n><rsup|<around*|(|i+1|)>>>|<cell|=>|<cell|w<rsub|n><rsup|<around*|(|i|)>>e<rsup|-<frac|1|2>t<rsub|n>\<alpha\><rsub|i>y<rsub|i><around*|(|x<rsub|n>|)>>>>>>
  </eqnarray*>
</body>

<\initial>
  <\collection>
    <associate|font|roman>
    <associate|font-base-size|12>
    <associate|info-flag|minimal>
    <associate|page-medium|papyrus>
  </collection>
</initial>