<TeXmacs|2.1>

<style|generic>

<\body>
  <doc-data|<doc-title|SVM(Support Vector
  Machine)>|<doc-author|<author-data|<author-name|Xing Chao>>>>

  \<#9996\>\<#5148\>\<#7B80\>\<#8981\>\<#4ECB\>\<#7ECD\>SVM\<#5206\>\<#7C7B\>\<#5668\>\<#FF0C\>\<#7136\>\<#540E\>\<#518D\>\<#7ED3\>\<#5408\>\<#51F8\>\<#4F18\>\<#5316\>\<#76F8\>\<#5173\>\<#7406\>\<#8BBA\>\<#4F5C\>\<#8FDB\>\<#4E00\>\<#6B65\>\<#5206\>\<#6790\>\<#3002\>

  <section|SVM\<#5206\>\<#7C7B\>\<#5668\>>

  <subsection|\<#6700\>\<#5927\>\<#95F4\>\<#9694\>\<#5206\>\<#79BB\>\<#8D85\>\<#5E73\>\<#9762\>>

  \<#7EBF\>\<#6027\>\<#53EF\>\<#5206\>\<#7684\>\<#8BAD\>\<#7EC3\>\<#6837\>\<#4F8B\>

  <\equation*>
    T=<around*|{|<around*|(|\<b-x\><rsub|1>,y<rsub|1>|)>,<around*|(|\<b-x\><rsub|2>,y<rsub|2>|)>,\<cdots\>,<around*|(|\<b-x\><rsub|N>,y<rsub|N>|)>|}>
  </equation*>

  \<#5176\>\<#4E2D\><math|\<b-x\><rsub|i>\<in\>\<bbb-R\><rsup|n>,y<rsub|i>\<in\><around*|{|+1,-1|}>,i=1,2,\<cdots\>,N>

  \<#8D85\>\<#5E73\>\<#9762\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<b-w\>\<cdot\>\<b-x\>+b>|<cell|=>|<cell|0>>|<row|<cell|<frac|\<b-w\>\<cdot\>\<b-x\>+b|<around*|\<\|\|\>|\<b-w\>|\<\|\|\>>>>|<cell|=>|<cell|0>>>>
  </eqnarray*>

  <math|\<b-x\><rsub|i>>\<#5230\>\<#8D85\>\<#5E73\>\<#9762\>\<#8DDD\>\<#79BB\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<gamma\><rsub|i>>|<cell|=>|<cell|<frac|y<rsub|i><around*|(|\<b-w\>\<cdot\>\<b-x\><rsub|i>+b|)>|<around*|\<\|\|\>|\<b-w\>|\<\|\|\>>>>>>>
  </eqnarray*>

  \<#5F53\><math|\<b-w\>\<cdot\>\<b-x\><rsub|i>+b=\<pm\>1>\<#65F6\>\<#FF0C\><math|\<gamma\><rsub|i>=<frac|1|<around*|\<\|\|\>|\<b-w\>|\<\|\|\>>>>\<#3002\>

  \<#6700\>\<#5927\>\<#95F4\>\<#9694\>\<#5206\>\<#79BB\>\<#8D85\>\<#5E73\>\<#9762\>\<#95EE\>\<#9898\>\<#FF1A\>

  <\equation*>
    min<rsub|\<b-w\>,b><frac|1|2><around*|\<\|\|\>|\<b-w\>|\<\|\|\>><space|5em>s.t.<space|1em>y<rsub|i><around*|(|\<b-w\>\<cdot\>\<b-x\><rsub|i>+b|)>\<geqslant\>1
  </equation*>

  \<#6709\>\<#7EA6\>\<#675F\>\<#7684\>\<#539F\>\<#59CB\>\<#76EE\>\<#6807\>\<#51FD\>\<#6570\>\<#8F6C\>\<#6362\>\<#4E3A\>\<#65E0\>\<#7EA6\>\<#675F\>\<#7684\>\<#65B0\>\<#6784\>\<#9020\>\<#7684\>\<#62C9\>\<#683C\>\<#6717\>\<#65E5\>\<#76EE\>\<#6807\>\<#51FD\>\<#6570\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|L<around*|(|\<b-w\>,b,\<b-alpha\>|)>>|<cell|=>|<cell|<frac|1|2><around*|\<\|\|\>|\<b-w\>|\<\|\|\>><rsup|2>-<big|sum><rsub|i=1><rsup|N>\<alpha\><rsub|i><around*|(|y<rsub|i><around*|(|\<b-w\>\<cdot\>\<b-x\><rsub|i>+b|)>-1|)>>>>>
  </eqnarray*>

  \<#5176\>\<#4E2D\><math|\<alpha\><rsub|i>\<geqslant\>0>\<#4E3A\>\<#62C9\>\<#683C\>\<#6717\>\<#65E5\>\<#4E58\>\<#5B50\>\<#3002\>\<#539F\>\<#7EA6\>\<#675F\>\<#95EE\>\<#9898\>\<#7B49\>\<#4EF7\>\<#4E8E\>

  <\equation*>
    min<rsub|\<b-w\>,b> max<rsub|\<alpha\><rsub|i>\<geqslant\>0>
    L<around*|(|\<b-w\>,b,\<b-alpha\>|)>
  </equation*>

  \<#53EF\>\<#8F6C\>\<#6362\>\<#4E3A\>\<#5BF9\>\<#5076\>\<#95EE\>\<#9898\>\<#FF1A\>

  <\equation*>
    \ max<rsub|\<alpha\><rsub|i>\<geqslant\>0> min<rsub|\<b-w\>,b>
    L<around*|(|\<b-w\>,b,\<b-alpha\>|)>
  </equation*>

  \<#7531\>

  <\equation*>
    min<rsub|\<b-w\>,b> L<around*|(|\<b-w\>,b,\<b-alpha\>|)>\<leqslant\>L<around*|(|\<b-w\>,b,\<b-alpha\>|)>\<leqslant\>max<rsub|\<alpha\><rsub|i>\<geqslant\>0>
    L<around*|(|\<b-w\>,b,\<b-alpha\>|)>
  </equation*>

  \<#5F97\>\<#FF1A\>

  <\equation*>
    \ max<rsub|\<alpha\><rsub|i>\<geqslant\>0> min<rsub|\<b-w\>,b>
    L<around*|(|\<b-w\>,b,\<b-alpha\>|)>\<leqslant\>min<rsub|\<b-w\>,b>
    max<rsub|\<alpha\><rsub|i>\<geqslant\>0>
    L<around*|(|\<b-w\>,b,\<b-alpha\>|)>
  </equation*>

  <subsection|\<#62C9\>\<#683C\>\<#6717\>\<#65E5\>\<#5BF9\>\<#5076\>>

  KKT(Karush-Kuhn-Tucker)\<#6761\>\<#4EF6\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<alpha\><rsub|i>>|<cell|\<geqslant\>>|<cell|0>>|<row|<cell|y<rsub|i><around*|(|\<b-w\>\<cdot\>\<b-x\><rsub|i>+b|)>-1>|<cell|\<geqslant\>>|<cell|0>>|<row|<cell|\<alpha\><rsub|i><around*|(|y<around*|(|\<b-w\>\<cdot\>\<b-x\><rsub|i>+b|)>-1|)>>|<cell|=>|<cell|0>>>>
  </eqnarray*>

  \<#7531\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|<frac|\<partial\>L|\<partial\>\<b-w\>>>|<cell|=>|<cell|0>>|<row|<cell|<frac|\<partial\>L|\<partial\>b>>|<cell|=>|<cell|0>>>>
  </eqnarray*>

  \<#5F97\>\<#FF1A\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<b-w\>>|<cell|=>|<cell|<big|sum><rsub|i=1><rsup|n>\<alpha\><rsub|i>y<rsub|i>\<b-x\><rsub|i>>>|<row|<cell|<big|sum><rsub|i=1><rsup|N>\<alpha\><rsub|i>y<rsub|i>>|<cell|=>|<cell|0>>>>
  </eqnarray*>

  \<#4EE3\>\<#5165\>\<#62C9\>\<#683C\>\<#6717\>\<#65E5\>\<#76EE\>\<#6807\>\<#51FD\>\<#6570\>\<#FF0C\>\<#5F97\>\<#FF1A\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|min<rsub|\<b-w\>,b>
    L<around*|(|\<b-w\>,b,\<b-alpha\>|)>>|<cell|=>|<cell|<frac|1|2><big|sum><rsub|i=1><rsup|N><big|sum><rsub|j=1><rsup|N>\<alpha\><rsub|i>\<alpha\><rsub|j>y<rsub|i>y<rsub|j><around*|(|\<b-x\><rsub|i>\<cdot\>\<b-x\><rsub|j>|)>-<big|sum><rsub|i=1><rsup|N>\<alpha\><rsub|i>y<rsub|i><around*|(|<around*|(|<big|sum><rsub|j=1><rsup|N>\<alpha\><rsub|j>y<rsub|j>\<b-x\><rsub|j>|)>\<cdot\>\<b-x\><rsub|j>+b|)>+<big|sum><rsub|i=1><rsup|N>\<alpha\><rsub|i>>>|<row|<cell|>|<cell|=>|<cell|-<frac|1|2><big|sum><rsub|i=1><rsup|N><big|sum><rsub|j=1><rsup|N>\<alpha\><rsub|i>\<alpha\><rsub|j>y<rsub|i>y<rsub|j><around*|(|\<b-x\><rsub|i>\<cdot\>\<b-x\><rsub|j>|)>+<big|sum><rsub|i=1><rsup|N>\<alpha\><rsub|i>>>>>
  </eqnarray*>

  \<#53EF\>\<#5F97\>\<#5BF9\>\<#5076\>\<#95EE\>\<#9898\>\<#FF1A\>

  <\equation*>
    max<rsub|a<rsub|i>\<geqslant\>0> -<frac|1|2><big|sum><rsub|i=1><rsup|N><big|sum><rsub|j=1><rsup|N>\<alpha\><rsub|i>\<alpha\><rsub|j>y<rsub|i>y<rsub|j><around*|(|\<b-x\><rsub|i>\<cdot\>\<b-x\><rsub|j>|)>+<big|sum><rsub|i=1><rsup|N>\<alpha\><rsub|i><space|7em>s.t.
    <big|sum><rsub|i=1><rsup|N>\<alpha\><rsub|i>y<rsub|i>=0
  </equation*>

  \<#6839\>\<#636E\>KKT\<#6761\>\<#4EF6\>\<#FF0C\>\<#6709\><math|\<alpha\><rsub|i>=0>\<#6216\><math|y<rsub|i><around*|(|\<b-w\>\<cdot\>\<b-x\><rsub|i>+b|)>-1=0>\<#FF0C\>\<#5F53\><math|\<alpha\><rsub|i>\<gtr\>0>\<#65F6\>\<#FF0C\>\<#5BF9\>\<#5E94\>\<#7684\><math|\<b-x\><rsub|i>>\<#4E3A\>\<#652F\>\<#6301\>\<#5411\>\<#91CF\>\<#3002\>\<#53EF\>\<#5F97\>\<#FF1A\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<b-w\><rsup|\<ast\>>>|<cell|=>|<cell|<big|sum><rsub|i=1><rsup|N>\<alpha\><rsub|i><rsup|\<ast\>>y<rsub|i>\<b-x\><rsub|i>>>|<row|<cell|b<rsup|\<ast\>>>|<cell|=>|<cell|y<rsub|j>-<big|sum><rsub|i=1><rsup|N>\<alpha\><rsub|i><rsup|\<ast\>>y<rsub|i><around*|(|\<b-x\><rsub|i>\<cdot\>\<b-x\><rsub|j>|)>>>>>
  </eqnarray*>

  \<#5176\>\<#4E2D\><math|\<alpha\><rsup|\<ast\>><rsub|i>\<gtr\>0>

  \<#5206\>\<#7C7B\>\<#51B3\>\<#7B56\>\<#51FD\>\<#6570\>\<#FF1A\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|f<around*|(|\<b-x\>|)>>|<cell|=>|<cell|sign<around*|(|\<b-w\><rsup|\<ast\>>\<cdot\>\<b-x\>+b<rsup|\<ast\>><rsup|*>|)>>>>>
  </eqnarray*>

  \<#975E\>\<#7EBF\>\<#6027\>SVM

  \<#6838\>\<#51FD\>\<#6570\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|K<around*|(|\<b-x\>,\<b-z\>|)>>|<cell|=>|<cell|\<phi\><around*|(|\<b-x\>|)>\<cdot\>\<phi\><around*|(|\<b-z\>|)>>>>>
  </eqnarray*>

  \<#7528\>\<#6838\>\<#51FD\>\<#6570\>\<#4EE3\>\<#66FF\>\<#5185\>\<#79EF\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|b<rsup|\<ast\>>>|<cell|=>|<cell|y<rsub|j>-<big|sum><rsub|i=1><rsup|N>\<alpha\><rsub|i><rsup|\<ast\>>y<rsub|i>K<around*|(|\<b-x\><rsub|i>,\<b-x\><rsub|j>|)>>>|<row|<cell|f<around*|(|\<b-x\>|)>>|<cell|=>|<cell|sign<around*|(|<big|sum><rsub|i=1><rsup|N>\<alpha\><rsup|\<ast\>><rsub|i>y<rsub|i>K<around*|(|\<b-x\><rsub|i>,\<b-x\>|)>+b<rsup|\<ast\>><rsup|*>|)>>>>>
  </eqnarray*>

  <section|\<#51F8\>\<#4F18\>\<#5316\>\<#FF0C\>\<#978D\>\<#70B9\>\<#FF0C\>\<#62C9\>\<#683C\>\<#6717\>\<#65E5\>\<#5BF9\>\<#5076\>>

  \<#5BF9\>\<#4E8E\>\<#4F18\>\<#5316\>\<#95EE\>\<#9898\>,<math|f<around*|(|x|)>,g<rsub|i><around*|(|x|)>>\<#4E3A\>\<#51F8\>\<#51FD\>\<#6570\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|minimize>|<cell|>|<cell|f<around*|(|x|)>>>|<row|<cell|subject
    to>|<cell|>|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>
  </eqnarray*>

  \<#8BBE\>\<#5176\>\<#89E3\>\<#4E3A\><math|x<rsup|\<ast\>>>,\<#5373\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|f<around*|(|x<rsup|\<ast\>>|)>>|<cell|\<leqslant\>>|<cell|f<around*|(|x|)>>>|<row|<cell|g<rsub|i><around*|(|x|)>>|<cell|\<leqslant\>>|<cell|0>>|<row|<cell|g<rsub|i><around*|(|x<rsup|\<ast\>>|)>>|<cell|\<leqslant\>>|<cell|0>>>>
  </eqnarray*>

  \<#8003\>\<#8651\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|L<around*|(|x,\<lambda\>|)>>|<cell|=>|<cell|f<around*|(|x|)>+<big|sum><rsub|i>\<lambda\><rsub|i>g<rsub|i><around*|(|x|)><space|3em>\<lambda\><rsub|i>\<geqslant\>0>>>>
  </eqnarray*>

  \<#7531\>

  <\equation*>
    min<rsub|x> L<around*|(|x,\<lambda\>|)>\<leqslant\>L<around*|(|x,\<lambda\>|)>\<leqslant\>max<rsub|\<lambda\>\<geqslant\>0>
    L<around*|(|x,\<lambda\>|)>
  </equation*>

  \<#5F97\>\<#FF1A\>

  <\equation>
    \ max<rsub|\<lambda\>> min<rsub|x> L<around*|(|x,\<lambda\>|)>\<leqslant\>min<rsub|x>
    max<rsub|\<lambda\>> L<around*|(|x,\<lambda\>|)><label|minmax>
  </equation>

  \<#82E5\>

  <\equation>
    min<rsub|x> max<rsub|\<lambda\>> L<around*|(|x,\<lambda\>|)>\<leqslant\>L<around*|(|<wide|x|\<wide-bar\>>,<wide|\<lambda\>|\<wide-bar\>>|)>\<leqslant\>max<rsub|\<lambda\>>
    min<rsub|x> L<around*|(|x,\<lambda\>|)><text|><label|saddle>
  </equation>

  \<#5219\><math|<around*|(|<wide|x|\<wide-bar\>>,<wide|\<lambda\>|\<wide-bar\>>|)>>\<#79F0\>\<#4E3A\><math|L<around*|(|x,\<lambda\>|)>>\<#7684\>\<#978D\>\<#70B9\>\<#3002\>\<#4E14\>\<#6709\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|min<rsub|x>
    max<rsub|\<lambda\>>L<around*|(|x,\<lambda\>|)>>|<cell|=>|<cell|max<rsub|\<lambda\>>L<around*|(|<wide|x|\<wide-bar\>>,\<lambda\>|)><eq-number><label|saddleleft>>>|<row|<cell|max<rsub|\<lambda\>>L<around*|(|<wide|x|\<wide-bar\>>,\<lambda\>|)>>|<cell|=>|<cell|L<around*|(|<wide|x|\<wide-bar\>>,<wide|\<lambda\>|\<wide-bar\>>|)>>>|<row|<cell|max<rsub|\<lambda\>>
    min<rsub|x> L<around*|(|x,\<lambda\>|)>>|<cell|=>|<cell|min<rsub|x>L<around*|(|x,<wide|\<lambda\>|\<wide-bar\>>|)><eq-number><label|saddleright>>>|<row|<cell|min<rsub|x>L<around*|(|x,<wide|\<lambda\>|\<wide-bar\>>|)>>|<cell|=>|<cell|L<around*|(|<wide|x|\<wide-bar\>>,<wide|\<lambda\>|\<wide-bar\>>|)>>>>>
  </eqnarray*>

  \;

  \<#4E0B\>\<#9762\>\<#5206\>\<#6790\>\<#978D\>\<#70B9\>\<#548C\>\<#539F\>\<#4F18\>\<#5316\>\<#95EE\>\<#9898\>\<#89E3\><math|f<around*|(|x<rsup|\<ast\>>|)>>\<#4E4B\>\<#95F4\>\<#7684\>\<#5173\>\<#7CFB\>\<#3002\>

  <subsection|\<#4ECE\>\<#978D\>\<#70B9\>\<#5230\>\<#6781\>\<#503C\>\<#70B9\>>

  \<#5148\>\<#770B\>\<#5F0F\>(<reference|saddle>)\<#5DE6\>\<#8FB9\>\<#4E0E\>\<#5F0F\>(<reference|saddleleft>)\<#FF0C\>\<#5F53\><math|g<rsub|i><around*|(|<wide|x|\<wide-bar\>>|)>\<gtr\>0>\<#65F6\>\<#FF0C\>\<#6709\>

  <\equation*>
    max<rsub|\<lambda\>> L<around*|(|<wide|x|\<wide-bar\>>,\<lambda\>|)>=\<infty\>
  </equation*>

  \<#53EF\>\<#77E5\><math|g<rsub|i><around*|(|<wide|x|\<wide-bar\>>|)>\<leqslant\>0>,\<#4E14\>\<#6709\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|max<rsub|\<lambda\>>
    f<around*|(|<wide|x|\<wide-bar\>>|)>+\<lambda\><rsub|i>g<rsub|i><around*|(|<wide|x|\<wide-bar\>>|)>>|<cell|=>|<cell|f<around*|(|<wide|x|\<wide-bar\>>|)>>>|<row|<cell|>|<cell|=>|<cell|L<around*|(|<wide|x|\<wide-bar\>>,\<lambda\>|)>\|<rsub|\<lambda\><rsub|i>g<rsub|i><around*|(|<wide|x|\<wide-bar\>>|)>=0>>>|<row|<cell|L<around*|(|<wide|x|\<wide-bar\>>,<wide|\<lambda\>|\<wide-bar\>>|)>>|<cell|=>|<cell|f<around*|(|<wide|x|\<wide-bar\>>|)>>>>>
  </eqnarray*>

  \<#518D\>\<#770B\>\<#5F0F\>(<reference|saddle>)\<#5F0F\>\<#53F3\>\<#8FB9\>\<#4E0E\>\<#5F0F\>(<reference|saddleright>)\<#FF0C\>\<#7531\><math|<tabular|<tformat|<table|<row|<cell|min<rsub|x>L<around*|(|x,<wide|\<lambda\>|\<wide-bar\>>|)>>|<cell|=>|<cell|L<around*|(|<wide|x|\<wide-bar\>>,<wide|\<lambda\>|\<wide-bar\>>|)>>>>>>>\<#5F97\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|f<around*|(|<wide|x|\<wide-bar\>>|)>>|<cell|=>|<cell|min<rsub|x>
    L<around*|(|x,<wide|\<lambda\>|\<wide-bar\>>|)>>>|<row|<cell|>|<cell|\<leqslant\>>|<cell|min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>
    L<around*|(|x,<wide|\<lambda\>|\<wide-bar\>>|)>>>|<row|<cell|>|<cell|\<leqslant\>>|<cell|min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>
    f<around*|(|x|)>+<big|sum><rsub|i>0\<cdot\>g<rsub|i><around*|(|x|)>>>>>
  </eqnarray*>

  \<#53EF\>\<#77E5\>

  <\equation*>
    f<around*|(|<wide|x|\<wide-bar\>>|)>=min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>
    f<around*|(|x|)>
  </equation*>

  \<#56E0\>\<#6B64\>\<#FF0C\>\<#53EF\>\<#7531\>\<#978D\>\<#70B9\>\<#5F97\>\<#539F\>\<#4F18\>\<#5316\>\<#95EE\>\<#9898\>\<#7684\>\<#6781\>\<#5C0F\>\<#503C\>\<#70B9\>\<#3002\>

  <subsection|\<#4ECE\>\<#6781\>\<#503C\>\<#70B9\>\<#5230\>\<#978D\>\<#70B9\>>

  \<#5F53\>\<#5DF2\>\<#77E5\>\<#539F\>\<#4F18\>\<#5316\>\<#95EE\>\<#9898\>\<#7684\>\<#6781\>\<#5C0F\>\<#503C\>\<#70B9\>\<#65F6\>\<#FF0C\>\<#5373\>

  <\equation*>
    f<around*|(|x<rsup|\<ast\>>|)>=min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>
    f<around*|(|x|)>
  </equation*>

  \<#6839\>\<#636E\>\<#51F8\>\<#4F18\>\<#5316\>\<#76F8\>\<#5173\>\<#7406\>\<#8BBA\>\<#FF0C\>\<#53EF\>\<#77E5\>\<#5B58\>\<#5728\><math|\<lambda\><rsub|i><rsup|\<ast\>>\<geqslant\>0>\<#FF0C\>\<#6EE1\>\<#8DB3\>\<#FF1A\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<nabla\>f<around*|(|x<rsup|\<ast\>>|)>+<big|sum><rsub|i>\<lambda\><rsub|i><rsup|\<ast\>>\<nabla\>g<rsub|i><around*|(|x|)>>|<cell|=>|<cell|0<eq-number><label|grad>>>|<row|<cell|\<lambda\><rsub|i><rsup|\<ast\>>g<rsub|i><around*|(|x|)>>|<cell|=>|<cell|0>>|<row|<cell|L<around*|(|x<rsup|\<ast\>>,\<lambda\><rsup|\<ast\>>|)>>|<cell|=>|<cell|f<around*|(|x<rsup|\<ast\>>|)>>>>>
  </eqnarray*>

  \<#5148\>\<#770B\>\<#5F0F\>(<reference|saddle>)\<#5DE6\>\<#8FB9\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|min<rsub|x> max<rsub|\<lambda\>>
    L<around*|(|x,\<lambda\>|)>>|<cell|\<leqslant\>>|<cell|min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>
    max<rsub|\<lambda\>> f<around*|(|x|)>+<big|sum><rsub|i>\<lambda\><rsub|i>g<rsub|i><around*|(|x|)>>>|<row|<cell|>|<cell|\<leqslant\>>|<cell|min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>
    max<rsub|\<lambda\>> f<around*|(|x|)>+<big|sum><rsub|i>\<lambda\><rsub|i>\<cdot\>0>>|<row|<cell|>|<cell|=>|<cell|min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>f<around*|(|x|)>>>|<row|<cell|>|<cell|=>|<cell|f<around*|(|x<rsup|\<ast\>>|)>+\<lambda\><rsup|\<ast\>><rsub|i>g<rsub|i><around*|(|x<rsup|\<ast\>>|)>>>|<row|<cell|min<rsub|x>
    max<rsub|\<lambda\>> L<around*|(|x,\<lambda\>|)>>|<cell|\<leqslant\>>|<cell|L<around*|(|x<rsup|\<ast\>>,\<lambda\><rsup|\<ast\>>|)><eq-number><label|left>>>>>
  </eqnarray*>

  \<#518D\>\<#770B\>\<#5F0F\>(<reference|saddle>)\<#53F3\>\<#8FB9\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|max<rsub|\<lambda\>> min<rsub|x>
    L<around*|(|x\<comma\>\<lambda\>|)>>|<cell|\<geqslant\>>|<cell|min<rsub|x>
    f<around*|(|x|)>+<big|sum><rsub|i>\<lambda\><rsup|\<ast\>><rsub|i>g<rsub|i><around*|(|x|)>>>>>
  </eqnarray*>

  \<#7531\>\<#4E8E\><math|L<around*|(|x,\<lambda\><rsup|\<ast\>>|)>=f<around*|(|x|)>+<big|sum><rsub|i>\<lambda\><rsup|\<ast\>><rsub|i>g<rsub|i><around*|(|x|)>>\<#4E3A\>\<#51F8\>\<#51FD\>\<#6570\>\<#FF0C\>\<#56E0\>\<#6B64\>\<#6709\>\<#60DF\>\<#4E00\>\<#6781\>\<#5C0F\>\<#503C\>\<#6EE1\>\<#8DB3\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<nabla\>f<around*|(|x|)>+<big|sum><rsub|i>\<lambda\><rsup|\<ast\>><rsub|i>g<rsub|i><around*|(|x|)>>|<cell|=>|<cell|0>>>>
  </eqnarray*>

  \<#4E0E\>\<#5F0F\>(<reference|grad>)\<#7ED3\>\<#5408\>\<#53EF\>\<#77E5\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|f<around*|(|x<rsup|\<ast\>>|)>>|<cell|=>|<cell|min<rsub|x>
    f<around*|(|x|)>+<big|sum><rsub|i>\<lambda\><rsup|\<ast\>><rsub|i>g<rsub|i><around*|(|x|)>>>|<row|<cell|L<around*|(|x<rsup|\<ast\>>,\<lambda\><rsup|\<ast\>>|)>>|<cell|\<leqslant\>>|<cell|max<rsub|\<lambda\>>
    min<rsub|x> L<around*|(|x\<comma\>\<lambda\>|)><eq-number><label|right>>>>>
  </eqnarray*>

  \<#7ED3\>\<#5408\>\<#5F0F\>(<reference|left>)\<#3001\>\<#5F0F\>(<reference|right>)\<#5F97\>

  <\equation*>
    min<rsub|x> max<rsub|\<lambda\>> L<around*|(|x,\<lambda\>|)>\<leqslant\>L<around*|(|x<rsup|\<ast\>>,\<lambda\><rsup|\<ast\>>|)>\<leqslant\>max<rsub|\<lambda\>>
    min<rsub|x> L<around*|(|x,\<lambda\>|)>
  </equation*>

  \<#7531\>\<#5F0F\>(<reference|minmax>),\<#5F97\>

  <\equation*>
    min<rsub|x> max<rsub|\<lambda\>> L<around*|(|x,\<lambda\>|)>=L<around*|(|x<rsup|\<ast\>>,\<lambda\><rsup|\<ast\>>|)>=max<rsub|\<lambda\>>
    min<rsub|x> L<around*|(|x,\<lambda\>|)>
  </equation*>

  \<#5373\>\<#FF1A\>\<#7531\>\<#539F\>\<#95EE\>\<#9898\>\<#6781\>\<#503C\>\<#89E3\>\<#53EF\>\<#5F97\>\<#978D\>\<#70B9\>\<#3002\>

  <subsection|<math|min<rsub|x> max<rsub|\<lambda\>>
  L<around*|(|x,\<lambda\>|)>>\<#4E0E\>\<#539F\>\<#95EE\>\<#9898\>\<#7684\>\<#5173\>\<#7CFB\>>

  \<#4E0B\>\<#9762\>\<#8BF4\>\<#660E\><math|min<rsub|x> max<rsub|\<lambda\>>
  L<around*|(|x,\<lambda\>|)>>\<#4E0E\>\<#539F\>\<#95EE\>\<#9898\>\<#7684\>\<#5173\>\<#7CFB\>\<#FF0C\>\<#5F53\><math|g<rsub|i><around*|(|x|)>\<gtr\>0>\<#65F6\>\<#6709\>

  <\eqnarray*>
    <tformat|<table|<row|<cell| max<rsub|\<lambda\>>
    L<around*|(|x,\<lambda\>|)>>|<cell|=>|<cell|\<infty\>>>>>
  </eqnarray*>

  \<#53EF\>\<#5F97\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<gtr\>0>>>>>>
    max<rsub|\<lambda\>> L<around*|(|x,\<lambda\>|)>>|<cell|=>|<cell|\<infty\>>>|<row|<cell|min<rsub|x>
    max<rsub|\<lambda\>> L<around*|(|x,\<lambda\>|)>>|<cell|=>|<cell|min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>
    max<rsub|\<lambda\>> L<around*|(|x,\<lambda\>|)>>>>>
  </eqnarray*>

  \<#56E0\>\<#6B64\>

  <\eqnarray*>
    <tformat|<table|<row|<cell|min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>
    max<rsub|\<lambda\>> L<around*|(|x,\<lambda\>|)>>|<cell|=>|<cell|min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>
    max<rsub|\<lambda\>> f<around*|(|x|)>+<big|sum><rsub|i>\<lambda\><rsub|i>g<rsub|i><around*|(|x|)>>>|<row|<cell|>|<cell|\<leqslant\>>|<cell|min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>
    max<rsub|\<lambda\>> f<around*|(|x|)>+<big|sum><rsub|i>\<lambda\><rsub|i>\<cdot\>0>>|<row|<cell|>|<cell|=>|<cell|min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>f<around*|(|x|)>>>|<row|<cell|min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>
    max<rsub|\<lambda\>> L<around*|(|x,\<lambda\>|)>>|<cell|\<geqslant\>>|<cell|min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>f<around*|(|x|)>+<big|sum><rsub|i>0\<cdot\>g<rsub|i><around*|(|x|)>>>|<row|<cell|>|<cell|=>|<cell|min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>f<around*|(|x|)>>>>>
  </eqnarray*>

  \<#5F97\>

  <\equation*>
    min<rsub|x> max<rsub|\<lambda\>> L<around*|(|x,\<lambda\>|)>=min<rsub|<tabular*|<tformat|<table|<row|<cell|x>>|<row|<cell|g<rsub|i><around*|(|x|)>\<leqslant\>0>>>>>>f<around*|(|x|)>
  </equation*>

  \<#5373\>\<#4E0E\>\<#539F\>\<#95EE\>\<#9898\>\<#7B49\>\<#4EF7\>\<#3002\>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|1.1|?>>
    <associate|auto-3|<tuple|1.2|?>>
    <associate|auto-4|<tuple|2|?>>
    <associate|auto-5|<tuple|2.1|?>>
    <associate|auto-6|<tuple|2.2|?>>
    <associate|auto-7|<tuple|2.3|?>>
    <associate|grad|<tuple|5|?>>
    <associate|left|<tuple|6|?>>
    <associate|minmax|<tuple|1|?>>
    <associate|right|<tuple|7|?>>
    <associate|saddle|<tuple|2|?>>
    <associate|saddleleft|<tuple|3|?>>
    <associate|saddleright|<tuple|4|?>>
  </collection>
</references>