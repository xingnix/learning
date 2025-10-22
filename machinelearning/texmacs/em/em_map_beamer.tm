<TeXmacs|2.1.1>

<style|<tuple|beamer|old-spacing|old-dots|old-lengths|manila-paper|chinese>>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    <doc-data|<doc-title|EM\<#7B97\>\<#6CD5\>>>

    \;

    \;

    \;

    \;

    <space|22em>(\<#8282\>\<#9009\>\<#81EA\>
    \<#9AD8\>\<#7B49\>\<#6570\>\<#7406\>\<#7EDF\>\<#8BA1\>
    \<#8306\>\<#8BD7\>\<#677E\>)
  </hidden>|<\hidden>
    \;

    \;

    <\itemize-dot>
      <item>EM\<#7B97\>\<#6CD5\>\<#662F\>\<#4E00\>\<#79CD\>\<#8FED\>\<#4EE3\>\<#7B97\>\<#6CD5\>\<#FF0C\>\<#6700\>\<#521D\>\<#7531\>Dempster\<#7B49\>\<#63D0\>\<#51FA\>\<#FF0C\>\<#4E3B\>\<#8981\>\<#7528\>\<#6765\>\<#6C42\>\<#540E\>\<#9A8C\>\<#5206\>\<#5E03\>\<#7684\>\<#4F17\>\<#6570\>\<#FF08\>\<#5373\>\<#6781\>\<#5927\>\<#4F3C\>\<#7136\>\<#4F30\>\<#8BA1\>\<#FF09\>\<#FF0C\>

      <item>\<#5B83\>\<#7684\>\<#6BCF\>\<#4E00\>\<#6B21\>\<#8FED\>\<#4EE3\>\<#7531\>\<#4E24\>\<#6B65\>\<#7EC4\>\<#6210\>\<#FF1A\>E\<#6B65\>\<#FF08\>\<#6C42\>\<#671F\>\<#671B\>\<#FF09\>,M\<#6B65\>\<#FF08\>\<#6781\>\<#5927\>\<#5316\>\<#FF09\>\<#3002\>

      <item>\<#4E00\>\<#822C\>\<#5730\>\<#FF0C\>

      <\itemize-dot>
        <item>\<#4EE5\><math|P<around*|(|\<theta\>\|Y|)>>\<#8868\>\<#793A\><math|\<theta\>>\<#7684\>\<#57FA\>\<#4E8E\>\<#89C2\>\<#6D4B\>\<#6570\>\<#636E\>\<#7684\>\<#540E\>\<#9A8C\>\<#5206\>\<#5E03\>\<#5BC6\>\<#5EA6\>\<#51FD\>\<#6570\>\<#FF0C\>\<#79F0\>\<#4E3A\>\<#89C2\>\<#6D4B\>\<#540E\>\<#9A8C\>\<#5206\>\<#5E03\>\<#FF0C\>

        <item><math|p<around*|(|Z\|\<theta\>,Y|)>>\<#8868\>\<#793A\>\<#5728\>\<#7ED9\>\<#5B9A\><math|\<theta\>>\<#548C\>\<#89C2\>\<#6D4B\>\<#6570\>\<#636E\>Y\<#4E0B\>\<#6F5C\>\<#5728\>\<#6570\>\<#636E\>Z\<#6761\>\<#4EF6\>\<#5206\>\<#5E03\>\<#5BC6\>\<#5EA6\>\<#51FD\>\<#6570\>\<#3002\>
      </itemize-dot>
    </itemize-dot>
  </hidden>|<\hidden>
    \<#6211\>\<#4EEC\>\<#7684\>\<#76EE\>\<#7684\>\<#662F\>\<#8BA1\>\<#7B97\>\<#89C2\>\<#6D4B\>\<#540E\>\<#9A8C\>\<#5206\>\<#5E03\><math|p<around*|(|\<theta\>\|Y|)>>\<#7684\>\<#4F17\>\<#6570\>\<#FF0C\>\<#4E8E\>\<#662F\>\<#FF0C\>EM\<#7B97\>\<#6CD5\>\<#5982\>\<#4E0B\>\<#8FDB\>\<#884C\>\<#3002\>

    \<#8BB0\><math|\<theta\><rsup|<around*|(|i|)>>>\<#4E3A\>\<#7B2C\><math|i+1>\<#6B21\>\<#8FED\>\<#4EE3\>\<#5F00\>\<#59CB\>\<#65F6\>\<#540E\>\<#9A8C\>\<#4F17\>\<#6570\>\<#7684\>\<#4F30\>\<#8BA1\>\<#503C\>\<#FF0C\>\<#5219\>\<#7B2C\><math|i+1>\<#6B21\>\<#8FED\>\<#4EE3\>\<#7684\>\<#4E24\>\<#6B65\>\<#4E3A\>

    E\<#6B65\>\<#FF1A\>\<#5C06\><math|p<around*|(|\<theta\>\|Y,Z|)>>\<#6216\><math|log
    p<around*|(|\<theta\>\|Y,Z|)>>\<#5173\>\<#4E8E\>Z\<#7684\>\<#6761\>\<#4EF6\>\<#5206\>\<#5E03\>\<#6C42\>\<#671F\>\<#671B\>\<#FF0C\>\<#4ECE\>\<#800C\>\<#628A\>Z\<#79EF\>\<#6389\>\<#FF0C\>\<#5373\>\<#FF1A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|Q<around*|(|\<theta\>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>>|<cell|\<triangleq\>>|<cell|E<rsub|z><around*|[|log
      p<around*|(|\<theta\>\|Y,Z|)>\|\<theta\><rsup|<around*|(|i|)>>,Y|]>>>|<row|<cell|>|<cell|=>|<cell|<big|int>log<around*|[|p<around*|(|\<theta\>\|Y,Z|)>|]>p<around*|(|Z\|\<theta\><rsup|<around*|(|i|)>>,Y|)>\<mathd\>Z<eq-number><label|6.44>>>>>
    </eqnarray*>

    M\<#6B65\>\<#FF1A\>\<#5C06\><math|Q<around*|(|\<theta\><around*|\||\<theta\><rsup|<around*|(|i|)>>,Y|\<nobracket\>>|)>>\<#6781\>\<#5927\>\<#5316\>\<#FF0C\>\<#5373\>\<#627E\>\<#4E00\>\<#4E2A\>\<#70B9\><math|\<theta\><rsup|<around*|(|i+1|)>>>\<#FF0C\>\<#4F7F\>

    <\equation>
      Q<around*|(|\<theta\><rsup|<around*|(|i+1|)>>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>=max<rsub|\<theta\>>
      Q<around*|(|\<theta\>\|\<theta\><rsup|<around*|(|i|)>>,Y|)><label|6.45>
    </equation>

    \<#5982\>\<#6B64\>\<#5F62\>\<#6210\>\<#4E00\>\<#6B21\>\<#8FED\>\<#4EE3\><math|\<theta\><rsup|<around*|(|i|)>>\<rightarrow\>\<theta\><rsup|<around*|(|i+1|)>>>,\<#5C06\>\<#4E0A\>\<#8FF0\>E\<#6B65\>\<#548C\>M\<#6B65\>\<#8FDB\>\<#884C\>\<#8FED\>\<#4EE3\>\<#76F4\>\<#81F3\><math|<around*|\<\|\|\>|\<theta\><rsup|<around*|(|i+1|)>>-\<theta\><rsup|<around*|(|i|)>>|\<\|\|\>>>\<#6216\>

    <math|<around*|\<\|\|\>|Q<around*|(|\<theta\><rsup|<around*|(|i+1|)>>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>-Q<around*|(|\<theta\><rsup|<around*|(|i|)>><around*|\||\<theta\><rsup|<around*|(|i|)>>,Y|\|>|)>|\<\|\|\>>>\<#5145\>\<#5206\>\<#5C0F\>\<#65F6\>\<#505C\>\<#6B62\>\<#3002\>
  </hidden>|<\hidden>
    \<#4E0B\>\<#9762\>\<#6211\>\<#4EEC\>\<#770B\>\<#4E00\>\<#4E2A\>\<#4F8B\>\<#5B50\>\<#3002\>\<#4F8B\>6.13
    \<#5047\>\<#8BBE\>\<#4E00\>\<#6B21\>\<#8BD5\>\<#9A8C\>\<#53EF\>\<#80FD\>\<#6709\>\<#56DB\>\<#4E2A\>\<#7ED3\>\<#679C\>\<#FF0C\>\<#5176\>\<#53D1\>\<#751F\>\<#7684\>\<#6982\>\<#7387\>\<#5206\>\<#522B\>\<#4E3A\>

    <math|<frac|1|2>+<frac|\<theta\>|4>,<frac|1|4><around*|(|1-\<theta\>|)>,<frac|1|4><around*|(|1-\<theta\>|)>,<frac|\<theta\>|4>>,\<#5176\>\<#4E2D\><math|\<theta\>\<in\><around*|(|0,1|)>>

    \<#73B0\>\<#8FDB\>\<#884C\>\<#4E86\>197\<#6B21\>\<#8BD5\>\<#9A8C\>\<#FF0C\>\<#56DB\>\<#79CD\>\<#7ED3\>\<#679C\>\<#7684\>\<#53D1\>\<#751F\>\<#6B21\>\<#6570\>\<#5206\>\<#522B\>\<#4E3A\>125,18,20,34,\<#6B64\>\<#5904\>\<#89C2\>\<#6D4B\>\<#6570\>\<#636E\>\<#4E3A\>

    <\equation*>
      Y=<around*|(|y<rsub|1>,y<rsub|2>,y<rsub|3>,y<rsub|4>|)>=<around*|(|125,18,20,34|)>
    </equation*>

    \<#53D6\><math|\<theta\>>\<#7684\>\<#5148\>\<#9A8C\>\<#5206\>\<#5E03\><math|\<pi\><around*|(|\<theta\>|)>>\<#4E3A\>\<#5E73\>\<#5766\>\<#5206\>\<#5E03\>\<#FF08\>\<#6B64\>\<#5904\>\<#5373\>(0,1)\<#4E0A\>\<#7684\>\<#5747\>\<#5300\>\<#5206\>\<#5E03\>\<#FF09\>\<#FF0C\>\<#5219\><math|\<theta\>>\<#7684\>\<#89C2\>\<#6D4B\>\<#540E\>\<#9A8C\>\<#5206\>\<#5E03\>\<#4E3A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<theta\>\|Y|)>>|<cell|\<propto\>>|<cell|\<pi\><around*|(|\<theta\>|)>p<around*|(|Y\|\<theta\>|)>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|<frac|1|2>+<frac|\<theta\>|4>|)><rsup|y<rsub|1>><around*|[|<frac|1|4><around*|(|1-\<theta\>|)>|]><rsup|y<rsub|2>><around*|[|<frac|1|4><around*|(|1-\<theta\>|)>|]><rsup|y<rsub|3>><around*|(|<frac|\<theta\>|4>|)><rsup|y<rsub|4>>>>|<row|<cell|>|<cell|\<propto\>>|<cell|<around*|(|2+\<theta\>|)><rsup|y<rsub|1>><around*|(|1-\<theta\>|)><rsup|y<rsub|2>+y<rsub|3>>\<theta\><rsup|y<rsub|4>><eq-number><label|6.46>>>>>
    </eqnarray*>

    \<#89C2\>\<#5BDF\>\<#5047\>\<#8BBE\>\<#7B2C\>\<#4E00\>\<#79CD\>\<#7ED3\>\<#679C\>\<#53EF\>\<#4EE5\>\<#5206\>\<#89E3\>\<#6210\>\<#4E24\>\<#90E8\>\<#5206\>\<#FF0C\>\<#5176\>\<#53D1\>\<#751F\>\<#6982\>\<#7387\>\<#5206\>\<#522B\>\<#4E3A\><math|<frac|1|2>>\<#548C\><math|<frac|\<theta\>|4>>,
  </hidden>|<\hidden>
    \;

    \;

    \<#4EE4\>Z\<#548C\><math|y<rsub|1>-Z>\<#5206\>\<#522B\>\<#8868\>\<#793A\>\<#8BD5\>\<#9A8C\>\<#4E2D\>\<#7ED3\>\<#679C\>\<#843D\>\<#5165\>\<#8FD9\>\<#4E24\>\<#90E8\>\<#5206\>\<#7684\>\<#6B21\>\<#6570\>(Z\<#662F\>\<#4E0D\>\<#80FD\>\<#89C2\>\<#6D4B\>\<#7684\>\<#6F5C\>\<#5728\>\<#6570\>\<#636E\>)\<#FF0C\>

    \<#5219\><math|\<theta\>>\<#7684\>\<#6DFB\>\<#52A0\>\<#540E\>\<#9A8C\>\<#5206\>\<#5E03\>\<#4E3A\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<theta\>\|Y,Z|)>>|<cell|\<propto\>>|<cell|\<pi\><around*|(|\<theta\>|)>p<around*|(|Y,Z\|\<theta\>|)>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|<frac|1|2>|)><rsup|Z><around*|(|<frac|\<theta\>|4>|)><rsup|y<rsub|1>-Z><around*|[|<frac|1|4><around*|(|1-\<theta\>|)>|]><rsup|y<rsub|2>><around*|[|<frac|1|4><around*|(|1-\<theta\>|)>|]><rsup|y<rsub|3>><around*|(|<frac|\<theta\>|4>|)><rsup|y<rsub|4>>>>|<row|<cell|>|<cell|\<propto\>>|<cell|\<theta\><rsup|y<rsub|1>-Z+y<rsub|4>><around*|(|1-\<theta\>|)><rsup|y<rsub|2>+y<rsub|3>><eq-number><label|6.47>>>>>
    </eqnarray*>

    \<#7528\>(<reference|6.46>)\<#6C42\><math|\<theta\>>\<#7684\>\<#540E\>\<#9A8C\>\<#4F17\>\<#6570\>\<#6BD4\>\<#8F83\>\<#9EBB\>\<#70E6\>\<#FF0C\>\<#800C\>\<#7528\>(<reference|6.47>)\<#5F0F\>\<#6C42\>\<#540E\>\<#9A8C\>\<#4F17\>\<#6570\>\<#5219\>\<#5341\>\<#5206\>\<#7B80\>\<#5355\>\<#FF0C\>

    \<#56E0\>\<#6B64\>\<#FF0C\>\<#6211\>\<#4EEC\>\<#53EF\>\<#7528\>EM\<#7B97\>\<#6CD5\>\<#6C42\>(<reference|6.46>)\<#7684\>\<#540E\>\<#9A8C\>\<#4F17\>\<#6570\>\<#3002\>
  </hidden>|<\hidden>
    \;

    \;

    \<#5728\>\<#7B2C\>i\<#6B21\>\<#8FED\>\<#4EE3\>\<#4E2D\>\<#FF0C\>\<#5047\>\<#8BBE\>\<#6709\>\<#4F30\>\<#8BA1\>\<#503C\><math|\<theta\><rsup|<around*|(|i|)>>>\<#FF0C\>\<#5219\>\<#53EF\>\<#901A\>\<#8FC7\>E\<#6B65\>\<#548C\>M\<#6B65\>\<#5F97\>\<#5230\><math|\<theta\>>\<#7684\>\<#4E00\>\<#4E2A\>\<#65B0\>\<#7684\>\<#4F30\>\<#8BA1\>\<#3002\>\<#5728\>E\<#6B65\>\<#4E2D\>\<#FF0C\>\<#7531\>(<reference|6.44>)\<#6709\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|Q<around*|(|\<theta\>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>>|<cell|=>|<cell|E<rsup|Z><around*|[|<around*|(|y<rsub|1>-Z+y<rsub|4>|)>log\<theta\>+<around*|(|y<rsub|2>+y<rsub|3>|)>log<around*|(|1-\<theta\>|)>\|\<theta\><rsup|<around*|(|i|)>>,Y|]>>>|<row|<cell|>|<cell|=>|<cell|<around*|[|y<rsub|1>-E<rsup|Z><around*|(|Z\|\<theta\><rsup|<around*|(|i|)>>,Y|)>+y<rsub|4>|]>log\<theta\>+<around*|(|y<rsub|2>+y<rsub|3>|)>log<around*|(|1-\<theta\>|)>>>>>
    </eqnarray*>

    \<#56E0\>\<#5728\><math|\<theta\><rsup|<around*|(|i|)>>>\<#548C\>Y\<#7ED9\>\<#5B9A\>\<#4E0B\>\<#FF0C\><math|Z\<sim\>b<around*|(|y<rsub|1>,<frac|2|\<theta\><rsup|<around*|(|i|)>>+2>|)>>,\<#6545\>

    <\equation*>
      E<rsup|Z><around*|(|Z\|\<theta\><rsup|<around*|(|i|)>>,Y|)>=<frac|2y<rsub|1>|\<theta\><rsup|<around*|(|i|)>>+2>
    </equation*>
  </hidden>|<\hidden>
    \<#5728\>M\<#6B65\>\<#4E2D\>\<#5C06\><math|Q<around*|(|\<theta\>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>>\<#5BF9\><math|\<theta\>>\<#6C42\>\<#5BFC\>\<#5E76\>\<#4EE4\>\<#5176\>\<#4E3A\>0,\<#6709\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<theta\><rsup|<around*|(|i+1|)>>>|<cell|=>|<cell|<frac|y<rsub|1>+y<rsub|4>-E<rsup|Z><around*|(|Z\|\<theta\><rsup|<around*|(|i|)>>,Y|)>|y<rsub|1>+y<rsub|2>+y<rsub|3>+y<rsub|4>-E<rsup|Z><around*|(|Z\|\<theta\><rsup|<around*|(|i|)>>,Y|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<theta\><rsup|<around*|(|i|)>>y<rsub|1>+<around*|(|\<theta\><rsup|<around*|(|i|)>>+2|)>y<rsub|4>|\<theta\><rsup|<around*|(|i|)>>y<rsub|1>+<around*|(|\<theta\><rsup|<around*|(|i|)>>+2|)><around*|(|y<rsub|2>+y<rsub|3>+y<rsub|4>|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|159\<theta\><rsup|<around*|(|i|)>>+68|197\<theta\><rsup|<around*|(|i|)>>+144>>>>>
    </eqnarray*>

    \<#4ECE\><math|\<theta\><rsup|<around*|(|0|)>>=0.5>\<#5F00\>\<#59CB\>\<#FF0C\>\<#7ECF\>\<#8FC7\>\<#56DB\>\<#6B21\>\<#8FED\>\<#4EE3\>\<#FF0C\>EM\<#7B97\>\<#6CD5\>\<#6536\>\<#655B\>\<#5230\>\<#89C2\>\<#6D4B\>\<#540E\>\<#9A8C\>\<#5206\>\<#5E03\>\<#7684\>\<#4F17\>\<#6570\>0.6268\<#3002\>

    \<#4E5F\>\<#53EF\>\<#76F4\>\<#63A5\>\<#8BA1\>\<#7B97\>\<#FF0C\>\<#82E5\>\<#6536\>\<#655B\>\<#FF0C\>\<#5219\>\<#6709\>

    <\equation*>
      <wide|\<theta\>|^>=<frac|159<wide|\<theta\>|^>+68|197<wide|\<theta\>|^>+144>
    </equation*>

    \<#89E3\>\<#5F97\><math|<wide|\<theta\>|^>=0.626821497\<#3002\>>
  </hidden>|<\hidden>
    \;

    EM\<#7B97\>\<#6CD5\>\<#7684\>\<#6700\>\<#5927\>\<#4F18\>\<#70B9\>\<#662F\>\<#7B80\>\<#5355\>\<#548C\>\<#7A33\>\<#5B9A\>\<#3002\>

    EM\<#7B97\>\<#6CD5\>\<#7684\>\<#4E3B\>\<#8981\>\<#76EE\>\<#7684\>\<#662F\>\<#63D0\>\<#4F9B\>\<#4E00\>\<#4E2A\>\<#7B80\>\<#5355\>\<#7684\>\<#8FED\>\<#4EE3\>\<#7B97\>\<#6CD5\>\<#6765\>\<#8BA1\>\<#7B97\>\<#540E\>\<#9A8C\>\<#4F17\>\<#6570\>\<#FF08\>\<#6216\>MLE\<#FF09\>\<#FF0C\>\<#4EBA\>\<#4EEC\>\<#81EA\>\<#7136\>\<#4F1A\>\<#95EE\>\<#FF0C\>

    \<#5982\>\<#6B64\>\<#5EFA\>\<#7ACB\>\<#7684\>EM\<#7B97\>\<#6CD5\>\<#80FD\>\<#5426\>\<#8FBE\>\<#5230\>\<#9884\>\<#671F\>\<#8981\>\<#6C42\>\<#FF0C\>\<#5C31\>\<#662F\>\<#8BF4\>\<#FF0C\>\<#7531\>EM\<#7B97\>\<#6CD5\>\<#5F97\>\<#5230\>\<#7684\>\<#4F30\>\<#8BA1\>\<#5E8F\>\<#5217\>\<#662F\>\<#5426\>\<#6536\>\<#655B\>\<#FF0C\>

    \<#5982\>\<#679C\>\<#6536\>\<#655B\>\<#5176\>\<#7ED3\>\<#679C\>\<#662F\>\<#5426\>\<#662F\><math|p<around*|(|\<theta\>\|Y|)>>\<#7684\>\<#6700\>\<#5927\>\<#503C\>\<#6216\>\<#5C40\>\<#90E8\>\<#6700\>\<#5927\>\<#503C\>\<#3002\>

    \<#4E3A\>\<#6B64\>\<#FF0C\>\<#6211\>\<#4EEC\>\<#603B\>\<#7ED3\>\<#51FA\>\<#4E0B\>\<#8FF0\>\<#4E24\>\<#4E2A\>\<#5B9A\>\<#7406\>\<#FF0C\>\<#8BB0\>EM\<#7B97\>\<#6CD5\>\<#5F97\>\<#5230\>\<#7684\>\<#4F30\>\<#8BA1\>\<#5E8F\>\<#5217\>\<#4E3A\><math|\<theta\><rsup|<around*|(|i|)>>,i=1,2,\<cdots\>,L<around*|(|\<theta\>\|Y|)>=log
    p<around*|(|\<theta\>\|Y|)>>\<#3002\>
  </hidden>|<\hidden>
    <\theorem>
      \;

      EM\<#7B97\>\<#6CD5\>\<#5728\>\<#6BCF\>\<#4E00\>\<#6B21\>\<#8FED\>\<#4EE3\>\<#540E\>\<#5747\>\<#63D0\>\<#9AD8\>\<#FF08\>\<#89C2\>\<#6D4B\>\<#FF09\>\<#540E\>\<#9A8C\>\<#5BC6\>\<#5EA6\>\<#51FD\>\<#6570\>\<#503C\>\<#FF0C\>\<#5373\>

      <\equation*>
        p<around*|(|\<theta\><rsup|<around*|(|i+1|)>>\|Y|)>\<geqslant\>p<around*|(|\<theta\><rsup|<around*|(|i|)>>\|Y|)>
      </equation*>
    </theorem>

    <\proof>
      \;

      \<#7531\>\<#5168\>\<#6982\>\<#7387\>\<#516C\>\<#5F0F\>

      <\equation*>
        p<around*|(|\<theta\>,Z\|Y|)>=p<around*|(|Z\|\<theta\>,Y|)>p<around*|(|\<theta\>\|Y|)>=p<around*|(|\<theta\>\|Y,Z|)>p<around*|(|Z\|Y|)>
      </equation*>

      \<#5C06\>\<#4E0A\>\<#5F0F\>\<#540E\>\<#9762\>\<#4E24\>\<#9879\>\<#53D6\>\<#5BF9\>\<#6570\>\<#6709\>

      <\equation*>
        log p<around*|(|\<theta\>\|Y|)>=log p<around*|(|\<theta\>\|Y,Z|)>-log
        p<around*|(|Z\|\<theta\>,Y|)>+log p<around*|(|Z\|Y|)>
      </equation*>

      \<#8BBE\>\<#73B0\>\<#6709\>\<#4F30\>\<#8BA1\><math|\<theta\><rsup|<around*|(|i|)>>>,\<#5C06\>\<#4E0A\>\<#5F0F\>\<#5BF9\>Z\<#5173\>\<#4E8E\><math|p<around*|(|Z\|\<theta\><rsup|<around*|(|i|)>>,Y|)>>\<#6C42\>\<#671F\>\<#671B\>\<#FF0C\>\<#6709\>

      <\eqnarray*>
        <tformat|<table|<row|<cell|log p<around*|(|\<theta\>\|Y|)>>|<cell|=>|<cell|<big|int><around*|[|log
        p<around*|(|\<theta\>\|Y,Z|)>-log p<around*|(|Z\|\<theta\>,Y|)>+log
        p<around*|(|Z\|Y|)>|]>p<around*|(|Z\|\<theta\><rsup|<around*|(|i|)>>,Y|)>\<mathd\>Z>>|<row|<cell|>|<cell|\<triangleq\>>|<cell|Q<around*|(|\<theta\>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>-H<around*|(|\<theta\>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>+K<around*|(|\<theta\><rsup|<around*|(|i|)>>,Y|)><eq-number><label|6.51>>>>>
      </eqnarray*>

      \<#5176\>\<#4E2D\><math|Q<around*|(|\<theta\>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>>\<#5DF2\>\<#5728\>(<reference|6.44>)\<#4E2D\>\<#5B9A\>\<#4E49\>\<#FF0C\>

      <\eqnarray*>
        <tformat|<table|<row|<cell|H<around*|(|\<theta\>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>>|<cell|=>|<cell|<big|int>log<around*|[|p<around*|(|Z\|\<theta\>,Y|)>|]>p<around*|(|Z\|\<theta\><rsup|<around*|(|i|)>>,Y|)>\<mathd\>Z>>|<row|<cell|K<around*|(|\<theta\><rsup|<around*|(|i|)>>,Y|)>>|<cell|=>|<cell|<big|int>log<around*|[|p<around*|(|Z\|Y|)>|]>p<around*|(|Z\|\<theta\><rsup|<around*|(|i|)>>,Y|)>\<mathd\>Z>>>>
      </eqnarray*>

      \<#5206\>\<#522B\>\<#5728\>(<reference|6.51>)\<#4E2D\>\<#53D6\><math|\<theta\>>\<#4E3A\><math|\<theta\><rsup|<around*|(|i|)>>>\<#548C\><math|\<theta\><rsup|<around*|(|i+1|)>>>\<#5E76\>\<#76F8\>\<#51CF\>\<#FF0C\>\<#6709\>

      <\eqnarray*>
        <tformat|<table|<row|<cell|>|<cell|>|<cell|log
        p<around*|(|\<theta\><rsup|<around*|(|i+1|)>>\|Y|)>-log
        p<around*|(|\<theta\><rsup|<around*|(|i|)>>\|Y|)>>>|<row|<cell|>|<cell|=>|<cell|<around*|[|Q<around*|(|\<theta\><rsup|<around*|(|i+1|)>>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>-Q<around*|(|\<theta\><rsup|<around*|(|i|)>><around*|\||\<theta\><rsup|<around*|(|i|)>>,Y|\<nobracket\>>|)>|]>-<around*|[|H<around*|(|\<theta\><rsup|<around*|(|i+1|)>>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>-H<around*|(|\<theta\><rsup|<around*|(|i|)>>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>|]>>>>>
      </eqnarray*>

      \<#7531\>Jensen\<#4E0D\>\<#7B49\>\<#5F0F\>

      <\eqnarray*>
        <tformat|<table|<row|<cell|E<rsup|Z\|\<theta\><rsup|<around*|(|i|)>>,Y>log<around*|(|<frac|p<around*|(|Z\|\<theta\><rsup|<around*|(|i+1|)>>,Y|)>|p<around*|(|Z\|\<theta\><rsup|<around*|(|i|)>>,Y|)>>|)>>|<cell|\<leqslant\>>|<cell|l
        og <around*|{|E<rsup|Z\|\<theta\><rsup|<around*|(|i|)>>,Y><around*|(|<frac|p<around*|(|Z\|\<theta\><rsup|<around*|(|i+1|)>>,Y|)>|p<around*|(|Z\|\<theta\><rsup|<around*|(|i|)>>,Y|)>>|)>|}>=0>>>>
      </eqnarray*>

      \<#6545\><math|H<around*|(|\<theta\><rsup|<around*|(|i+1|)>>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>-H<around*|(|\<theta\><rsup|<around*|(|i|)>>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>\<leqslant\>0>\<#FF0C\>\<#800C\><math|\<theta\><rsup|<around*|(|i+1|)>>>\<#662F\>\<#4F7F\><math|Q<around*|(|\<theta\>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>>\<#8FBE\>\<#5230\>\<#6700\>\<#5927\>\<#7684\>\<#FF0C\>\<#663E\>\<#7136\>

      <\equation*>
        Q<around*|(|\<theta\><rsup|<around*|(|i+1|)>>\|\<theta\><rsup|<around*|(|i|)>>,Y|)>-Q<around*|(|\<theta\><rsup|<around*|(|i|)>>,Y|)>\<geqslant\>0
      </equation*>

      \;
    </proof>
  </hidden>|<\hidden>
    <\theorem>
      \;

      (1)\<#5982\>\<#679C\><math|p<around*|(|\<theta\>\|Y|)>>\<#6709\>\<#4E0A\>\<#754C\>\<#FF0C\>\<#5219\><math|L<around*|(|\<theta\><rsup|<around*|(|i|)>>\|Y|)>>\<#6536\>\<#655B\>\<#5230\>\<#67D0\>\<#4E2A\><math|L<rsup|\<ast\>>>;

      (2)\<#5982\>\<#679C\><math|Q<around*|(|\<theta\>\|\<varphi\>|)>>\<#5173\>\<#4E8E\><math|\<theta\>>\<#548C\><math|\<varphi\>>\<#90FD\>\<#8FDE\>\<#7EED\>\<#FF0C\>\<#5219\>\<#5728\>\<#5173\>\<#4E8E\>L\<#7684\>\<#5F88\>\<#4E00\>\<#822C\>\<#7684\>\<#6761\>\<#4EF6\>\<#4E0B\>\<#FF0C\>

      \<#7531\>EM\<#7B97\>\<#6CD5\>\<#5F97\>\<#5230\>\<#7684\>\<#4F30\>\<#8BA1\>\<#5E8F\>\<#5217\><math|\<theta\><rsup|\<ast\>>>\<#662F\>L\<#7684\>\<#7A33\>\<#5B9A\>\<#70B9\>\<#3002\>
    </theorem>

    <\proof>
      \;

      \<#FF08\>1\<#FF09\>\<#7684\>\<#8BC1\>\<#660E\>\<#7531\>\<#5355\>\<#8C03\>\<#6536\>\<#655B\>\<#5B9A\>\<#7406\>\<#7ACB\>\<#5F97\>\<#3002\>\<#FF08\>2\<#FF09\>\<#7684\>\<#8BC1\>\<#660E\>\<#89C1\>\<#6587\>\<#732E\>[13]
    </proof>
  </hidden>|<\hidden>
    \<#53E6\>\<#4E00\>\<#79CD\>\<#8BC1\>\<#660E\>\<#601D\>\<#8DEF\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<theta\>\|Y|)>p<around*|(|Z\|Y,\<theta\>|)>>|<cell|=>|<cell|p<around*|(|\<theta\>\|Y,Z|)>p<around*|(|Z\|Y|)>>>|<row|<cell|ln
      p<around*|(|\<theta\>\|Y|)>>|<cell|=>|<cell|ln<around*|[|p<around*|(|\<theta\>\|Y,Z|)>p<around*|(|Z\|Y|)>|]>-ln
      p<around*|(|Z\|Y,\<theta\>|)>>>>>
    </eqnarray*>

    <math|\<theta\>=\<theta\><rsup|<around*|(|i|)>>>\<#65F6\>\<#FF0C\>\<#53D6\><math|Z\<sim\>p<around*|(|Z\|Y\<comma\>\<theta\><rsup|<around*|(|i|)>>|)>>,

    <\eqnarray*>
      <tformat|<table|<row|<cell|ln p<around*|(|\<theta\>\|Y|)>>|<cell|=>|<cell|E<rsub|Z>
      ln<around*|[|p<around*|(|\<theta\>\|Y,Z|)>p<around*|(|Z\|Y|)>|]>-E<rsub|Z>ln
      p<around*|(|Z\|Y,\<theta\>|)>>>|<row|<cell|>|<cell|=>|<cell|E<rsub|Z>
      ln<frac|p<around*|(|\<theta\>\|Y,Z|)>p<around*|(|Z\|Y|)>|p<around*|(|Z\|Y,\<theta\><rsup|<around*|(|i|)>>|)>>-E<rsub|Z>ln<frac|p<around*|(|Z\|Y,\<theta\>|)>|p<around*|(|Z\|Y,\<theta\><rsup|<around*|(|i|)>>|)>>>>|<row|<cell|>|<cell|=>|<cell|L<around*|(|\<theta\>|)>+K<around*|(|\<theta\>|)>>>|<row|<cell|Q<around*|(|\<theta\>|)>>|<cell|=>|<cell|E<rsub|Z>
      ln p<around*|(|\<theta\>\|Y,Z|)>>>|<row|<cell|L<around*|(|\<theta\>|)>>|<cell|=>|<cell|E<rsub|Z>
      ln<frac|p<around*|(|\<theta\>\|Y,Z|)>p<around*|(|Z\|Y|)>|p<around*|(|Z\|Y,\<theta\><rsup|<around*|(|i|)>>|)>>>>|<row|<cell|>|<cell|=>|<cell|Q<around*|(|\<theta\>|)>+const>>|<row|<cell|K<around*|(|\<theta\>|)>>|<cell|=>|<cell|-E<rsub|Z>ln<frac|p<around*|(|Z\|Y,\<theta\>|)>|p<around*|(|Z\|Y,\<theta\><rsup|<around*|(|i|)>>|)>>>>>>
    </eqnarray*>
  </hidden>|<\shown>
    \<#4E14\>\<#6709\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|ln p<around*|(|\<theta\><rsup|<around*|(|i|)>>\|Y|)>>|<cell|=>|<cell|L<around*|(|\<theta\><rsup|<around*|(|i|)>>|)>>>|<row|<cell|K<around*|(|\<theta\>|)>>|<cell|\<geqslant\>>|<cell|-E<rsub|Z><around*|(|<frac|p<around*|(|Z\|Y,\<theta\>|)>|p<around*|(|Z\|Y,\<theta\><rsup|<around*|(|i|)>>|)>>-1|)>>>|<row|<cell|>|<cell|\<geqslant\>>|<cell|0>>|<row|<cell|ln
      p<around*|(|\<theta\>\|Y|)>>|<cell|\<geqslant\>>|<cell|L<around*|(|\<theta\>|)>>>>>
    </eqnarray*>

    \<#5F53\>\<#53D6\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<theta\><rsup|<around*|(|i+1|)>>>|<cell|=>|<cell|arg
      max<rsub|\<theta\>> Q<around*|(|\<theta\>|)>>>>>
    </eqnarray*>

    \<#6709\>

    <\equation*>
      ln p<around*|(|\<theta\>\|Y|)>\<geqslant\>L<around*|(|\<theta\>|)>\<geqslant\>L<around*|(|\<theta\><rsup|<around*|(|i|)>>|)>
    </equation*>
  </shown>|<\hidden>
    \;

    \;

    \;

    \<#7531\>\<#4E8E\><math|<tabular|<tformat|<table|<row|<cell|p<around*|(|\<theta\>\|Y|)>>|<cell|\<propto\>>|<cell|\<pi\><around*|(|\<theta\>|)>p<around*|(|Y\|\<theta\>|)>>>>>>>\<#FF0C\>\<#56E0\>\<#6B64\>\<#5BF9\><math|p<around*|(|\<theta\>\|Y|)>>\<#7684\>\<#4F18\>\<#5316\>\<#53EF\>\<#4EE5\>\<#901A\>\<#8FC7\>\<#4F18\>\<#5316\><math|\<pi\><around*|(|\<theta\>|)>p<around*|(|Y\|\<theta\>|)>>\<#8FDB\>\<#884C\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|Y\|\<theta\>|)>p<around*|(|Z\|Y,\<theta\>|)>>|<cell|=>|<cell|p<around*|(|Z,Y\|\<theta\>|)>>>|<row|<cell|\<pi\><around*|(|\<theta\>|)>p<around*|(|Y\|\<theta\>|)>p<around*|(|Z\|Y,\<theta\>|)>>|<cell|=>|<cell|\<pi\><around*|(|\<theta\>|)>p<around*|(|Z,Y\|\<theta\>|)>>>|<row|<cell|ln<around*|[|\<pi\><around*|(|\<theta\>|)>p<around*|(|Y\|\<theta\>|)>|]>>|<cell|=>|<cell|ln<around*|[|\<pi\><around*|(|\<theta\>|)>p<around*|(|Z,Y\|\<theta\>|)>|]>-ln
      p<around*|(|Z\|Y,\<theta\>|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    E\<#6B65\>

    \<#5047\>\<#8BBE\><math|\<theta\>=\<theta\><rsup|<around*|(|i|)>>>\<#FF0C\><math|Z\<sim\>p<around*|(|Z\|Y,\<theta\><rsup|<around*|(|i|)>>|)>>\<#FF0C\>\<#5F97\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|Q<around*|(|\<theta\>|)>>|<cell|=>|<cell|E<rsub|Z><around*|{|ln<around*|[|\<pi\><around*|(|\<theta\>|)>p<around*|(|Z,Y\|\<theta\>|)>|]>|}>>>>>
    </eqnarray*>

    M\<#6B65\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|\<theta\><rsup|<around*|(|i+1|)>>>|<cell|=>|<cell|arg
      max<rsub|\<theta\>> Q<around*|(|\<theta\>|)>>>>>
    </eqnarray*>
  </hidden>|<\hidden>
    \<#8BC1\>\<#660E\>\<#601D\>\<#8DEF\>\<#5982\>\<#4E0B\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|ln<around*|[|\<pi\><around*|(|\<theta\>|)>p<around*|(|Y\|\<theta\>|)>|]>>|<cell|=>|<cell|E<rsub|Z>ln<around*|[|\<pi\><around*|(|\<theta\>|)>p<around*|(|Z,Y\|\<theta\>|)>|]>-E<rsub|Z>ln
      p<around*|(|Z\|Y,\<theta\>|)>>>|<row|<cell|>|<cell|=>|<cell|E<rsub|Z>ln<frac|\<pi\><around*|(|\<theta\>|)>p<around*|(|Z,Y\|\<theta\>|)>|p<around*|(|Z\|Y,\<theta\><rsup|<around*|(|i|)>>|)>>-E<rsub|Z>ln
      <frac|p<around*|(|Z\|Y,\<theta\>|)>|p<around*|(|Z\|Y,\<theta\><rsup|<around*|(|i|)>>|)>>>>|<row|<cell|>|<cell|=>|<cell|L<around*|(|\<theta\>|)>-K<around*|(|\<theta\>|)>>>|<row|<cell|L<around*|(|\<theta\>|)>>|<cell|=>|<cell|E<rsub|Z>ln<frac|\<pi\><around*|(|\<theta\>|)>p<around*|(|Z,Y\|\<theta\>|)>|p<around*|(|Z\|Y,\<theta\><rsup|<around*|(|i|)>>|)>>>>|<row|<cell|>|<cell|=>|<cell|Q<around*|(|\<theta\>|)>+const>>|<row|<cell|K<around*|(|\<theta\>|)>>|<cell|=>|<cell|-E<rsub|Z>ln
      <frac|p<around*|(|Z\|Y,\<theta\>|)>|p<around*|(|Z\|Y,\<theta\><rsup|<around*|(|i|)>>|)>>>>|<row|<cell|ln<around*|[|\<pi\><around*|(|\<theta\><rsup|<around*|(|i|)>>|)>p<around*|(|Y\|\<theta\><rsup|<around*|(|i|)>>|)>|]>>|<cell|=>|<cell|L<around*|(|\<theta\><rsup|<around*|(|i|)>>|)>>>>>
    </eqnarray*>

    \<#7531\>\<#4E8E\> <math|ln<around*|(|x|)>\<leqslant\>x-1,K<around*|(|\<theta\>|)>\<geqslant\>0>\<#FF0C\>\<#56E0\>\<#6B64\>\<#5F53\><math|L<around*|(|\<theta\>|)>\<gtr\>L<around*|(|\<theta\><rsup|<around*|(|i|)>>|)>>\<#65F6\>\<#FF0C\>\<#6709\>

    <\eqnarray*>
      <tformat|<table|<row|<cell|ln<around*|[|\<pi\><around*|(|\<theta\>|)>p<around*|(|Y\|\<theta\>|)>|]>>|<cell|\<geqslant\>>|<cell|L<around*|(|\<theta\>|)>\<gtr\>L<around*|(|\<theta\><rsup|<around*|(|i|)>>|)>>>>>
    </eqnarray*>
  </hidden>>
</body>

<\initial>
  <\collection>
    <associate|font|stix>
    <associate|font-family|rm>
    <associate|math-font|math-stix>
    <associate|page-height|auto>
    <associate|page-type|16:9>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|6.44|<tuple|1|?>>
    <associate|6.45|<tuple|2|?>>
    <associate|6.46|<tuple|3|?>>
    <associate|6.47|<tuple|4|?>>
    <associate|6.51|<tuple|5|?>>
  </collection>
</references>