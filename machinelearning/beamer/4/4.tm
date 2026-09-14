<TeXmacs|2.1>

<style|<tuple|beamer|manila-paper|chinese>>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <doc-data|<doc-title|\<#4EBA\>\<#5DE5\>\<#795E\>\<#7ECF\>\<#7F51\>\<#7EDC\>>>
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      <section|<with|font|fireflysung|\<#7B80\>\<#4ECB\>>>
    </padded-center>
  </hidden>|<\hidden>
    <tit|\<#4EBA\>\<#5DE5\>\<#795E\>\<#7ECF\>\<#7F51\>\<#7EDC\>\<#FF08\>Artificial
    Neural Networks\V\VANNs\<#FF09\>>

    <\itemize>
      <item><with|font|fireflysung|\<#4EBA\>\<#5DE5\>\<#795E\>\<#7ECF\>\<#7F51\>\<#7EDC\>><with|font|roman|\<#FF08\>>Artificial
      Neural Networks\V\VANNs<with|font|roman|\<#FF09\>><with|font|fireflysung|\<#63D0\>\<#4F9B\>\<#4E86\>\<#4E00\>\<#79CD\>\<#666E\>\<#904D\>\<#800C\>\<#4E14\>\<#5B9E\>\<#7528\>\<#7684\>\<#65B9\>\<#6CD5\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#6765\>\<#4ECE\>\<#6837\>\<#4F8B\>\<#4E2D\>\<#5B66\>\<#4E60\>\<#503C\>\<#4E3A\>\<#5B9E\>\<#6570\>>\<#3001\><with|font|fireflysung|\<#79BB\>\<#6563\>\<#6216\>\<#5411\>\<#91CF\>\<#7684\>\<#51FD\>\<#6570\>>\<#3002\>

      <item><with|font|fireflysung|\<#53CD\>\<#5411\>\<#4F20\>\<#64AD\>><with|font|roman|\<#FF08\>>BackPropagation<with|font|roman|\<#FF09\>><with|font|fireflysung|\<#7B97\>\<#6CD5\>\<#4F7F\>\<#7528\>\<#68AF\>\<#5EA6\>\<#4E0B\>\<#964D\>\<#6765\>\<#8C03\>\<#8282\>\<#7F51\>\<#7EDC\>\<#53C2\>\<#6570\>\<#4EE5\>\<#6700\>\<#4F73\>\<#62DF\>\<#5408\>\<#7531\>\<#8F93\>\<#5165\>>-<with|font|fireflysung|\<#8F93\>\<#51FA\>\<#5BF9\>\<#7EC4\>\<#6210\>\<#7684\>\<#8BAD\>\<#7EC3\>\<#96C6\>\<#5408\>>\<#3002\>

      <item>ANN<with|font|fireflysung|\<#5B66\>\<#4E60\>\<#5BF9\>\<#4E8E\>\<#8BAD\>\<#7EC3\>\<#6570\>\<#636E\>\<#4E2D\>\<#7684\>\<#9519\>\<#8BEF\>\<#9C81\>\<#68D2\>\<#6027\>\<#5F88\>\<#597D\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#4E14\>\<#5DF2\>\<#7ECF\>\<#6210\>\<#529F\>\<#5730\>\<#5E94\>\<#7528\>\<#5230\>\<#5F88\>\<#591A\>\<#9886\>\<#57DF\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#4F8B\>\<#5982\>
      >

      <\itemize>
        <item><with|font|fireflysung|\<#89C6\>\<#89C9\>\<#573A\>\<#666F\>\<#5206\>\<#6790\>><with|font|roman|\<#FF08\>>interpreting
        visual scenes<with|font|roman|\<#FF09\> >

        <item><with|font|fireflysung|\<#8BED\>\<#97F3\>\<#8BC6\>\<#522B\> >

        <item><with|font|fireflysung|\<#673A\>\<#5668\>\<#4EBA\>\<#63A7\>\<#5236\>
        >

        <item>......
      </itemize>
    </itemize>
  </hidden>|<\hidden>
    <tit|`\<#793A\>\<#4F8B\>>

    <\itemize>
      <item>Pomerleau<with|font|roman|\<#FF08\>>1993<with|font|roman|\<#FF09\>><with|font|fireflysung|\<#7684\>
      >ALVINN (Autonomous Land Vehicle In a Neural
      Network)<with|font|fireflysung|\<#7CFB\>\<#7EDF\>\<#662F\>>ANN<with|font|fireflysung|\<#5B66\>\<#4E60\>\<#7684\>\<#4E00\>\<#4E2A\>\<#5178\>\<#578B\>\<#5B9E\>\<#4F8B\>><with|font|roman|\<#FF0C\>>

      <item><with|font|fireflysung|\<#8FD9\>\<#4E2A\>\<#7CFB\>\<#7EDF\>\<#4F7F\>\<#7528\>\<#4E00\>\<#4E2A\>\<#5B66\>\<#4E60\>\<#5230\>\<#7684\>>ANN<with|font|fireflysung|\<#4EE5\>\<#6B63\>\<#5E38\>\<#7684\>\<#901F\>\<#5EA6\>\<#5728\>\<#9AD8\>\<#901F\>\<#516C\>\<#8DEF\>\<#4E0A\>\<#9A7E\>\<#9A76\>\<#6C7D\>\<#8F66\>>\<#3002\>

      <\itemize>
        <item>ANN<with|font|fireflysung|\<#7684\>\<#8F93\>\<#5165\>\<#662F\>\<#4E00\>\<#4E2A\>>30x32<with|font|fireflysung|\<#50CF\>\<#7D20\>\<#7684\>\<#7F51\>\<#683C\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#50CF\>\<#7D20\>\<#7684\>\<#4EAE\>\<#5EA6\>\<#6765\>\<#81EA\>\<#4E00\>\<#4E2A\>\<#5B89\>\<#88C5\>\<#5728\>\<#8F66\>\<#8F86\>\<#4E0A\>\<#7684\>\<#524D\>\<#5411\>\<#6444\>\<#50CF\>\<#673A\>>\<#3002\>

        <item>ANN<with|font|fireflysung|\<#7684\>\<#8F93\>\<#51FA\>\<#662F\>\<#8F66\>\<#8F86\>\<#884C\>\<#8FDB\>\<#7684\>\<#65B9\>\<#5411\>>\<#3002\>

        <item><with|font|fireflysung|\<#8FD9\>\<#4E2A\>>ANN<with|font|fireflysung|\<#901A\>\<#8FC7\>\<#89C2\>\<#5BDF\>\<#4EBA\>\<#7C7B\>\<#9A7E\>\<#9A76\>\<#65F6\>\<#7684\>\<#64CD\>\<#7EB5\>\<#547D\>\<#4EE4\>\<#8FDB\>\<#884C\>\<#8BAD\>\<#7EC3\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#8BAD\>\<#7EC3\>\<#8FC7\>\<#7A0B\>\<#5927\>\<#7EA6\>>5<with|font|fireflysung|\<#5206\>\<#949F\>>\<#3002\>
      </itemize>

      <item>ALVINN<with|font|fireflysung|\<#7528\>\<#5B66\>\<#4E60\>\<#5230\>\<#7684\>\<#7F51\>\<#7EDC\>\<#5728\>\<#9AD8\>\<#901F\>\<#516C\>\<#8DEF\>\<#4E0A\>\<#4EE5\>>70<with|font|fireflysung|\<#82F1\>\<#91CC\>\<#65F6\>\<#901F\>\<#6210\>\<#529F\>\<#5730\>\<#9A7E\>\<#9A76\>\<#4E86\>>90<with|font|fireflysung|\<#82F1\>\<#91CC\>><with|font|roman|\<#FF08\>><with|font|fireflysung|\<#5728\>\<#5206\>\<#884C\>\<#516C\>\<#8DEF\>\<#7684\>\<#5DE6\>\<#8F66\>\<#9053\>\<#884C\>\<#9A76\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#540C\>\<#65F6\>\<#6709\>\<#5176\>\<#4ED6\>\<#8F66\>\<#8F86\>><with|font|roman|\<#FF09\>>\<#3002\>
    </itemize>
  </hidden>|<\hidden>
    <tit|\<#793A\>\<#4F8B\>(ALVINN\<#7CFB\>\<#7EDF\>)>

    <space|8em><image|./image/alvinn1.png|0.5par|||>
  </hidden>|<\hidden>
    <tit|\<#793A\>\<#4F8B\>(ALVINN\<#539F\>\<#7406\>)>

    <space|13em><image|./image/alvinn2.png|0.36par|||>
  </hidden>|<\hidden>
    <tit|\<#793A\>\<#4F8B\>(\<#9690\>\<#85CF\>\<#5355\>\<#5143\>\<#6743\>\<#503C\>)>

    <space|12em><image|./image/alvinn3.png|0.4par|||>
  </hidden>|<\hidden>
    <tit|\<#4EBA\>\<#5DE5\>\<#795E\>\<#7ECF\>\<#7F51\>\<#7EDC\>\<#9002\>\<#7528\>\<#95EE\>\<#9898\>>

    <\itemize>
      <item><with|font|fireflysung|\<#5B9E\>\<#4F8B\>\<#662F\>\<#7528\>\<#5F88\>\<#591A\>>\P<with|font|fireflysung|\<#5C5E\>\<#6027\>>-<with|font|fireflysung|\<#503C\>>\Q<with|font|fireflysung|\<#5BF9\>\<#8868\>\<#793A\>\<#7684\>>\<#3002\>

      <\itemize>
        <item><with|font|fireflysung|\<#8981\>\<#5B66\>\<#4E60\>\<#7684\>\<#76EE\>\<#6807\>\<#51FD\>\<#6570\>\<#662F\>\<#5B9A\>\<#4E49\>\<#5728\>\<#53EF\>\<#4EE5\>\<#7528\>\<#5411\>\<#91CF\>\<#63CF\>\<#8FF0\>\<#7684\>\<#5B9E\>\<#4F8B\>\<#4E4B\>\<#4E0A\>\<#7684\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#5411\>\<#91CF\>\<#7531\>\<#9884\>\<#5148\>\<#5B9A\>\<#4E49\>\<#7684\>\<#7279\>\<#5F81\>\<#7EC4\>\<#6210\>><with|font|roman|\<#FF0C\>
        >

        <with|font|fireflysung|\<#4F8B\>\<#5982\>>ALVINN<with|font|fireflysung|\<#4F8B\>\<#5B50\>\<#4E2D\>\<#7684\>\<#50CF\>\<#7D20\>\<#503C\>>\<#3002\>

        <item><with|font|fireflysung|\<#8FD9\>\<#4E9B\>\<#8F93\>\<#5165\>\<#5C5E\>\<#6027\>\<#4E4B\>\<#95F4\>\<#53EF\>\<#4EE5\>\<#9AD8\>\<#5EA6\>\<#76F8\>\<#5173\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#4E5F\>\<#53EF\>\<#4EE5\>\<#76F8\>\<#4E92\>\<#72EC\>\<#7ACB\>>\<#3002\>

        <item><with|font|fireflysung|\<#8F93\>\<#5165\>\<#503C\>\<#53EF\>\<#4EE5\>\<#662F\>\<#4EFB\>\<#4F55\>\<#5B9E\>\<#6570\>>\<#3002\>
      </itemize>

      \;
    </itemize>
  </hidden>|<\hidden>
    \;

    <\itemize-dot>
      <item><with|font|fireflysung|\<#76EE\>\<#6807\>\<#51FD\>\<#6570\>\<#7684\>\<#8F93\>\<#51FA\>\<#53EF\>\<#80FD\>\<#662F\>\<#79BB\>\<#6563\>\<#503C\>>\<#3001\><with|font|fireflysung|\<#5B9E\>\<#6570\>\<#503C\>\<#6216\>\<#8005\>\<#7531\>\<#82E5\>\<#5E72\>\<#5B9E\>\<#6570\>\<#5C5E\>\<#6027\>\<#6216\>\<#79BB\>\<#6563\>\<#5C5E\>\<#6027\>\<#7EC4\>\<#6210\>\<#7684\>\<#5411\>\<#91CF\>>\<#3002\>

      <\itemize>
        <item><with|font|fireflysung|\<#4F8B\>\<#5982\>><with|font|roman|\<#FF0C\>
        >

        <\itemize>
          <item><with|font|fireflysung|\<#5728\>>ALVINN<with|font|fireflysung|\<#7CFB\>\<#7EDF\>\<#4E2D\>\<#8F93\>\<#51FA\>\<#7684\>\<#662F\>>30<with|font|fireflysung|\<#4E2A\>\<#5C5E\>\<#6027\>\<#7684\>\<#5411\>\<#91CF\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#6BCF\>\<#4E00\>\<#4E2A\>\<#5206\>\<#91CF\>\<#5BF9\>\<#5E94\>\<#4E00\>\<#4E2A\>\<#5EFA\>\<#8BAE\>\<#7684\>\<#9A7E\>\<#9A76\>\<#65B9\>\<#5411\>>\<#3002\>

          <item><with|font|fireflysung|\<#6BCF\>\<#4E2A\>\<#8F93\>\<#51FA\>\<#503C\>\<#662F\>>0<with|font|fireflysung|\<#548C\>>1<with|font|fireflysung|\<#4E4B\>\<#95F4\>\<#7684\>\<#67D0\>\<#4E2A\>\<#5B9E\>\<#6570\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#5BF9\>\<#5E94\>\<#4E8E\>\<#5728\>\<#9884\>\<#6D4B\>\<#76F8\>\<#5E94\>\<#9A7E\>\<#9A76\>\<#65B9\>\<#5411\>\<#65F6\>\<#7684\>\<#7F6E\>\<#4FE1\>\<#5EA6\>><with|font|roman|\<#FF08\>>confidence<with|font|roman|\<#FF09\>>\<#3002\>

          <item><with|font|fireflysung|\<#6211\>\<#4EEC\>\<#4E5F\>\<#53EF\>\<#4EE5\>\<#8BAD\>\<#7EC3\>\<#4E00\>\<#4E2A\>\<#5355\>\<#4E00\>\<#7F51\>\<#7EDC\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#540C\>\<#65F6\>\<#8F93\>\<#51FA\>\<#884C\>\<#9A76\>\<#65B9\>\<#5411\>\<#548C\>\<#5EFA\>\<#8BAE\>\<#7684\>\<#52A0\>\<#901F\>\<#5EA6\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#8FD9\>\<#53EA\>\<#8981\>\<#7B80\>\<#5355\>\<#5730\>\<#628A\>\<#7F16\>\<#7801\>\<#8FD9\>\<#4E24\>\<#79CD\>\<#8F93\>\<#51FA\>\<#9884\>\<#6D4B\>\<#7684\>\<#5411\>\<#91CF\>\<#8FDE\>\<#63A5\>\<#5728\>\<#4E00\>\<#8D77\>\<#5C31\>\<#53EF\>\<#4EE5\>\<#4E86\>>\<#3002\>
        </itemize>
      </itemize>
    </itemize-dot>
  </hidden>|<\hidden>
    \;

    \;

    <\itemize>
      <item><with|font|fireflysung|\<#8BAD\>\<#7EC3\>\<#6570\>\<#636E\>\<#53EF\>\<#80FD\>\<#5305\>\<#542B\>\<#9519\>\<#8BEF\>>\<#3002\>

      <\itemize>
        <item>ANN<with|font|fireflysung|\<#5B66\>\<#4E60\>\<#7B97\>\<#6CD5\>\<#5BF9\>\<#4E8E\>\<#8BAD\>\<#7EC3\>\<#6570\>\<#636E\>\<#4E2D\>\<#7684\>\<#9519\>\<#8BEF\>\<#6709\>\<#975E\>\<#5E38\>\<#597D\>\<#7684\>\<#9C81\>\<#68D2\>\<#6027\>>\<#3002\>
      </itemize>

      <item><with|font|fireflysung|\<#53EF\>\<#5BB9\>\<#5FCD\>\<#957F\>\<#65F6\>\<#95F4\>\<#7684\>\<#8BAD\>\<#7EC3\>>\<#3002\>

      <\itemize>
        <item><with|font|fireflysung|\<#7F51\>\<#7EDC\>\<#8BAD\>\<#7EC3\>\<#7B97\>\<#6CD5\>\<#901A\>\<#5E38\>\<#6BD4\>\<#50CF\>\<#51B3\>\<#7B56\>\<#6811\>\<#5B66\>\<#4E60\>\<#8FD9\>\<#6837\>\<#7684\>\<#7B97\>\<#6CD5\>\<#9700\>\<#8981\>\<#66F4\>\<#957F\>\<#7684\>\<#8BAD\>\<#7EC3\>\<#65F6\>\<#95F4\>>\<#3002\>

        <\itemize>
          <item><with|font|fireflysung|\<#8BAD\>\<#7EC3\>\<#65F6\>\<#95F4\>\<#53EF\>\<#80FD\>\<#4ECE\>\<#51E0\>\<#79D2\>\<#949F\>\<#5230\>\<#51E0\>\<#5C0F\>\<#65F6\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#8FD9\>\<#8981\>\<#770B\>\<#7F51\>\<#7EDC\>\<#4E2D\>\<#6743\>\<#503C\>\<#7684\>\<#6570\>\<#91CF\>>\<#3001\><with|font|fireflysung|\<#8981\>\<#8003\>\<#8651\>\<#7684\>\<#8BAD\>\<#7EC3\>\<#5B9E\>\<#4F8B\>\<#7684\>\<#6570\>\<#91CF\>>\<#3001\><with|font|fireflysung|\<#4EE5\>\<#53CA\>\<#4E0D\>\<#540C\>\<#5B66\>\<#4E60\>\<#7B97\>\<#6CD5\>\<#53C2\>\<#6570\>\<#7684\>\<#8BBE\>\<#7F6E\>\<#7B49\>\<#56E0\>\<#7D20\>>\<#3002\>
        </itemize>
      </itemize>

      \;
    </itemize>
  </hidden>|<\hidden>
    \;

    \;

    <\itemize-dot>
      <item><with|font|fireflysung|\<#53EF\>\<#80FD\>\<#9700\>\<#8981\>\<#5FEB\>\<#901F\>\<#6C42\>\<#51FA\>\<#76EE\>\<#6807\>\<#51FD\>\<#6570\>\<#503C\>>\<#3002\>

      <\itemize>
        <item><with|font|fireflysung|\<#5C3D\>\<#7BA1\>>ANN<with|font|fireflysung|\<#7684\>\<#5B66\>\<#4E60\>\<#65F6\>\<#95F4\>\<#76F8\>\<#5BF9\>\<#8F83\>\<#957F\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#4F46\>\<#5BF9\>\<#5B66\>\<#4E60\>\<#5230\>\<#7684\>\<#7F51\>\<#7EDC\>\<#6C42\>\<#503C\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#4EE5\>\<#4FBF\>\<#628A\>\<#7F51\>\<#7EDC\>\<#5E94\>\<#7528\>\<#5230\>\<#540E\>\<#7EED\>\<#7684\>\<#5B9E\>\<#4F8B\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#901A\>\<#5E38\>\<#662F\>\<#975E\>\<#5E38\>\<#5FEB\>\<#901F\>\<#7684\>>\<#3002\>

        <\itemize>
          <item><with|font|fireflysung|\<#4F8B\>\<#5982\>><with|font|roman|\<#FF0C\>>ALVINN<with|font|fireflysung|\<#5728\>\<#8F66\>\<#8F86\>\<#5411\>\<#524D\>\<#884C\>\<#9A76\>\<#65F6\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#6BCF\>\<#79D2\>\<#5E94\>\<#7528\>\<#5B83\>\<#7684\>\<#795E\>\<#7ECF\>\<#7F51\>\<#7EDC\>\<#82E5\>\<#5E72\>\<#6B21\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#4EE5\>\<#4E0D\>\<#65AD\>\<#5730\>\<#66F4\>\<#65B0\>\<#9A7E\>\<#9A76\>\<#65B9\>\<#5411\>>\<#3002\>
        </itemize>
      </itemize>

      <item><with|font|fireflysung|\<#4EBA\>\<#7C7B\>\<#80FD\>\<#5426\>\<#7406\>\<#89E3\>\<#5B66\>\<#5230\>\<#7684\>\<#76EE\>\<#6807\>\<#51FD\>\<#6570\>\<#662F\>\<#4E0D\>\<#91CD\>\<#8981\>\<#7684\>>\<#3002\>

      <\itemize>
        <item><with|font|fireflysung|\<#795E\>\<#7ECF\>\<#7F51\>\<#7EDC\>\<#65B9\>\<#6CD5\>\<#5B66\>\<#4E60\>\<#5230\>\<#7684\>\<#6743\>\<#503C\>\<#7ECF\>\<#5E38\>\<#662F\>\<#4EBA\>\<#7C7B\>\<#96BE\>\<#4EE5\>\<#89E3\>\<#91CA\>\<#7684\>>\<#3002\>

        <item><with|font|fireflysung|\<#5B66\>\<#5230\>\<#7684\>\<#795E\>\<#7ECF\>\<#7F51\>\<#7EDC\>\<#6BD4\>\<#5B66\>\<#5230\>\<#7684\>\<#89C4\>\<#5219\>\<#96BE\>\<#4E8E\>\<#4F20\>\<#8FBE\>\<#7ED9\>\<#4EBA\>\<#7C7B\>>\<#3002\>
      </itemize>
    </itemize-dot>
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    <\padded-center>
      <section|<with|font|fireflysung|\<#611F\>\<#77E5\>\<#5668\>>>
    </padded-center>
  </hidden>|<\hidden>
    <tit|\<#611F\>\<#77E5\>\<#5668\>>

    \;

    <space|7em><image|./image/perceptron.png|0.4par|||>

    <\equation*>
      o<around|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|1>|<cell|<text|if
      >w<rsub|0>+w<rsub|1>*x<rsub|1>+\<cdots\>+w<rsub|n>*x<rsub|n>\<gtr\>0>>|<row|<cell|-1>|<cell|<text|otherwise.>>>>>>|\<nobracket\>>
    </equation*>

    <with|font|fireflysung|\<#7B80\>\<#5316\>\<#8868\>\<#793A\>>:

    <\equation*>
      o<around|(|<wide|x|\<vect\>>|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|1>|<cell|<text|if
      ><wide|w|\<vect\>>\<cdot\><wide|x|\<vect\>>\<gtr\>0>>|<row|<cell|-1>|<cell|<text|otherwise.>>>>>>|\<nobracket\>>
    </equation*>
  </hidden>|<\hidden>
    <tit|\<#4E24\>\<#8F93\>\<#5165\>\<#611F\>\<#77E5\>\<#5668\>\<#7684\>\<#51B3\>\<#7B56\>\<#5E73\>\<#9762\>>

    <image|./image/ann-linearly-separable.png|.9par|||>
  </hidden>|<\hidden>
    <tit|\<#611F\>\<#77E5\>\<#5668\>\<#8BAD\>\<#7EC3\>\<#6CD5\>\<#5219\>(perceptron
    learning rule)>

    <\equation*>
      w<rsub|i>\<leftarrow\>w<rsub|i>+\<Delta\>*w<rsub|i>
    </equation*>

    where

    <\equation*>
      \<Delta\>*w<rsub|i>=\<eta\>*<around|(|t-o|)>*x<rsub|i>
    </equation*>

    <with|font|fireflysung|\<#5176\>\<#4E2D\>>:

    <\itemize>
      <item><math|t=c<around|(|<wide|x|\<vect\>>|)>>
      <with|font|fireflysung|\<#662F\>\<#5F53\>\<#524D\>\<#8BAD\>\<#7EC3\>\<#6837\>\<#4F8B\>\<#7684\>\<#76EE\>\<#6807\>\<#8F93\>\<#51FA\>
      >

      <item><math|o> <with|font|fireflysung|\<#662F\>\<#611F\>\<#77E5\>\<#5668\>\<#7684\>\<#8F93\>\<#51FA\>
      >

      <item><math|\<eta\>> <with|font|fireflysung|\<#662F\>\<#4E00\>\<#4E2A\>\<#6B63\>\<#7684\>\<#5E38\>\<#6570\>\<#79F0\>\<#4E3A\>\<#5B66\>\<#4E60\>\<#901F\>\<#7387\>><with|font|roman|\<#FF08\>>learning
      rate<with|font|roman|\<#FF09\> >
    </itemize>
  </hidden>|<\hidden>
    <tit|\<#6536\>\<#655B\>\<#6027\>>

    \;

    \;

    <\itemize>
      <item><with|font|fireflysung|\<#5728\>\<#6709\>\<#9650\>\<#6B21\>\<#4F7F\>\<#7528\>\<#611F\>\<#77E5\>\<#5668\>\<#8BAD\>\<#7EC3\>\<#6CD5\>\<#5219\>\<#540E\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#8BAD\>\<#7EC3\>\<#8FC7\>\<#7A0B\>\<#4F1A\>\<#6536\>\<#655B\>\<#5230\>\<#4E00\>\<#4E2A\>\<#80FD\>\<#6B63\>\<#786E\>\<#5206\>\<#7C7B\>\<#6240\>\<#6709\>\<#8BAD\>\<#7EC3\>\<#6837\>\<#4F8B\>\<#7684\>\<#6743\>\<#5411\>\<#91CF\>><with|font|roman|\<#FF0C\>
      >
    </itemize>

    <with|font|fireflysung|\<#524D\>\<#63D0\>><with|font|roman|\<#FF1A\>>

    <\itemize>
      <item><with|font|fireflysung|\<#8BAD\>\<#7EC3\>\<#6837\>\<#4F8B\>\<#7EBF\>\<#6027\>\<#53EF\>\<#5206\>><with|font|roman|\<#FF0C\>
      >

      <item><with|font|fireflysung|\<#4F7F\>\<#7528\>\<#4E86\>\<#5145\>\<#5206\>\<#5C0F\>\<#7684\>
      ><math|\<eta\>> <with|font|roman|\<#FF08\>><with|font|fireflysung|\<#53C2\>\<#89C1\>>Minskey
      & Papert 1969<with|font|roman|\<#FF09\> >
    </itemize>
  </hidden>|<\hidden>
    <tit|\<#5B66\>\<#4E60\>\<#7EBF\>\<#6027\>\<#5355\>\<#5143\>>

    <with|font|fireflysung|\<#8003\>\<#8651\>\<#7EBF\>\<#6027\>\<#5355\>\<#5143\>><with|font|roman|\<#FF1A\>>

    <\equation*>
      o=w<rsub|0>+w<rsub|1>*x<rsub|1>+\<cdots\>+w<rsub|n>*x<rsub|n>
    </equation*>

    <with|font|fireflysung|\<#5B66\>\<#4E60\>\<#4F7F\>\<#5747\>\<#65B9\>\<#8BEF\>\<#5DEE\>>

    <\equation*>
      E<around|[|<wide|w|\<vect\>>|]>\<equiv\><frac|1|2>*<big|sum><rsub|d\<in\>D><around|(|t<rsub|d>-o<rsub|d>|)><rsup|2>
    </equation*>

    <with|font|fireflysung|\<#6700\>\<#5C0F\>\<#7684\> ><math|w<rsub|i>>
    \<#3002\><with|font|fireflysung|\<#5176\>\<#4E2D\> ><math|D>
    <with|font|fireflysung|\<#8BAD\>\<#7EC3\>\<#6837\>\<#4F8B\>\<#96C6\>\<#5408\>>\<#3002\>
  </hidden>|<\hidden>
    <tit|\<#8BEF\>\<#5DEE\>\<#66F2\>\<#9762\>>

    <space|7em><image|./image/parabola-floor.png|0.6par|||>
  </hidden>|<\hidden>
    <tit|\<#68AF\>\<#5EA6\>\<#4E0B\>\<#964D\>\<#7B97\>\<#6CD5\>>

    <\equation*>
      \<nabla\>*E<around|[|<wide|w|\<vect\>>|]>\<equiv\><around*|[|<frac|\<partial\>*E|\<partial\>*w<rsub|0>>,<frac|\<partial\>*E|\<partial\>*w<rsub|1>>,\<cdots\>*<frac|\<partial\>*E|\<partial\>*w<rsub|n>>|]>
    </equation*>

    <with|font|fireflysung|\<#8BAD\>\<#7EC3\>\<#6CD5\>\<#5219\>>:

    <\equation*>
      \<Delta\>*<wide|w|\<vect\>>=-\<eta\>*\<nabla\>*E<around|[|<wide|w|\<vect\>>|]>
    </equation*>

    <with|font|fireflysung|\<#6216\>><with|font|roman|\<#FF1A\>>

    <\equation*>
      \<Delta\>*w<rsub|i>=-\<eta\><frac|\<partial\>*E|\<partial\>*w<rsub|i>>
    </equation*>
  </hidden>|<\hidden>
    <tit|\<#63A8\>\<#5BFC\>\<#FF1A\>>

    <\eqnarray>
      <tformat|<table|<row|<cell|<frac|\<partial\>*E|\<partial\>*w<rsub|i>>>|<cell|=>|<cell|<frac|\<partial\>|\<partial\>*w<rsub|i>>*<frac|1|2>*<big|sum><rsub|d><around|(|t<rsub|d>-o<rsub|d>|)><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2>*<big|sum><rsub|d><frac|\<partial\>|\<partial\>*w<rsub|i>>*<around|(|t<rsub|d>-o<rsub|d>|)><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2>*<big|sum><rsub|d>2*<around|(|t<rsub|d>-o<rsub|d>|)>*<frac|\<partial\>|\<partial\>*w<rsub|i>>*<around|(|t<rsub|d>-o<rsub|d>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|d><around|(|t<rsub|d>-o<rsub|d>|)>*<frac|\<partial\>|\<partial\>*w<rsub|i>>*<around|(|t<rsub|d>-<wide|w|\<vect\>>\<cdot\><wide|x<rsub|d>|\<vect\>>|)>>>|<row|<cell|<frac|\<partial\>*E|\<partial\>*w<rsub|i>>>|<cell|=>|<cell|<big|sum><rsub|d><around|(|t<rsub|d>-o<rsub|d>|)>*<around|(|-x<rsub|i,d>|)>>>>>
    </eqnarray>
  </hidden>|<\hidden>
    <tit|\<#8BAD\>\<#7EC3\>\<#7EBF\>\<#6027\>\<#5355\>\<#5143\>\<#7684\>\<#68AF\>\<#5EA6\>\<#4E0B\>\<#964D\>\<#7B97\>\<#6CD5\>>

    Gradient-Descent( training_examples , <math|e*t*a>)

    <\itemize>
      <item><math|t*r*a*i*n*i*n*g_e*x*a*m*p*l*e*s>
      <with|font|fireflysung|\<#4E2D\>\<#6BCF\>\<#4E2A\>\<#8BAD\>\<#7EC3\>\<#6837\>\<#4F8B\>\<#5F62\>\<#5F0F\>\<#4E3A\>\<#5E8F\>\<#5076\>
      ><math|<around|\<langle\>|<wide|x|\<vect\>>,t|\<rangle\>>>
      <with|font|roman|\<#FF0C\> ><with|font|fireflysung|\<#5176\>\<#4E2D\> >

      <\itemize>
        <item><math|<wide|x|\<vect\>>> <with|font|fireflysung|\<#662F\>\<#8F93\>\<#5165\>\<#503C\>\<#5411\>\<#91CF\>><with|font|roman|\<#FF0C\>
        >

        <item><math|t> <with|font|fireflysung|\<#662F\>\<#76EE\>\<#6807\>\<#8F93\>\<#51FA\>\<#503C\>>\<#3002\>

        <item><math|\<eta\>> <with|font|fireflysung|\<#662F\>\<#5B66\>\<#4E60\>\<#901F\>\<#7387\>><with|font|roman|\<#FF08\>><with|font|fireflysung|\<#4F8B\>\<#5982\>>0.05<with|font|roman|\<#FF09\>>\<#3002\>
      </itemize>

      <item><with|font|fireflysung|\<#521D\>\<#59CB\>\<#5316\>\<#6BCF\>\<#4E2A\>
      ><math|w<rsub|i>> <with|font|fireflysung|\<#4E3A\>\<#67D0\>\<#4E2A\>\<#5C0F\>\<#7684\>\<#968F\>\<#673A\>\<#503C\>
      >

      \;
    </itemize>
  </hidden>|<\hidden>
    \;

    <\itemize-dot>
      <item><with|font|fireflysung|\<#9047\>\<#5230\>\<#7EC8\>\<#6B62\>\<#6761\>\<#4EF6\>\<#4E4B\>\<#524D\>>:

      <\itemize>
        <item><with|font|fireflysung|\<#521D\>\<#59CB\>\<#5316\>\<#6BCF\>\<#4E2A\>
        ><math|\<Delta\>*w<rsub|i>> <with|font|fireflysung|\<#4E3A\>>0

        <item><with|font|fireflysung|\<#5BF9\>\<#4E8E\>\<#8BAD\>\<#7EC3\>\<#6837\>\<#4F8B\>
        ><math|t*r*a*i*n*i*n*g_e*x*a*m*p*l*e*s>
        <with|font|fireflysung|\<#4E2D\>\<#7684\>\<#6BCF\>\<#4E2A\>
        ><math|<around|\<langle\>|<wide|x|\<vect\>>,t|\<rangle\>>>
        <with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#505A\>><with|font|roman|\<#FF1A\>
        >

        <\itemize>
          <item><with|font|fireflysung|\<#628A\>\<#5B9E\>\<#4F8B\>
          ><math|<wide|x|\<vect\>>> <with|font|fireflysung|\<#8F93\>\<#5165\>\<#5230\>\<#6B64\>\<#5355\>\<#5143\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#8BA1\>\<#7B97\>\<#8F93\>\<#51FA\>
          ><math|o>

          <item><with|font|fireflysung|\<#5BF9\>\<#4E8E\>\<#7EBF\>\<#6027\>\<#5355\>\<#5143\>\<#7684\>\<#6BCF\>\<#4E2A\>\<#6743\>
          ><math|w<rsub|i>> :

          <\equation*>
            \<Delta\>*w<rsub|i>\<leftarrow\>\<Delta\>*w<rsub|i>+\<eta\>*<around|(|t-o|)>*x<rsub|i>
          </equation*>
        </itemize>

        <item><with|font|fireflysung|\<#5BF9\>\<#4E8E\>\<#7EBF\>\<#6027\>\<#5355\>\<#5143\>\<#7684\>\<#6BCF\>\<#4E2A\>\<#6743\>
        ><math|w<rsub|i>> <with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#505A\>
        >

        <\equation*>
          w<rsub|i>\<leftarrow\>w<rsub|i>+\<Delta\>*w<rsub|i>
        </equation*>
      </itemize>
    </itemize-dot>
  </hidden>|<\hidden>
    <tit|\<#968F\>\<#673A\>(\<#589E\>\<#91CF\>)\<#68AF\>\<#5EA6\>\<#4E0B\>\<#964D\>\<#7B97\>\<#6CD5\>>

    <\itemize>
      <item>\<#6279\>\<#91CF\>\<#68AF\>\<#5EA6\>\<#4E0B\>\<#964D\>:

      <\itemize>
        <item><math|E<rsub|D><around|[|<wide|w|\<vect\>>|]>\<equiv\><frac|1|2>*<big|sum><rsub|d\<in\>D><around|(|t<rsub|d>-o<rsub|d>|)><rsup|2>>\<#FF0C\>\<#8BA1\>\<#7B97\>\<#68AF\>\<#5EA6\>
        <math|\<nabla\>*E<rsub|D><around|[|<wide|w|\<vect\>>|]>>,

        <item><math|<wide|w|\<vect\>>\<leftarrow\><wide|w|\<vect\>>-\<eta\>*\<nabla\>*E<rsub|D><around|[|<wide|w|\<vect\>>|]>>
      </itemize>

      <item>\<#589E\>\<#91CF\>\<#68AF\>\<#5EA6\>\<#4E0B\>\<#964D\>:

      <\itemize>
        <item>\<#5BF9\>\<#8BAD\>\<#7EC3\>\<#96C6\> <math|D>
        \<#4E2D\>\<#7684\>\<#6837\>\<#4F8B\> <math|d>

        <\itemize>
          <item><math|E<rsub|d><around|[|<wide|w|\<vect\>>|]>\<equiv\><frac|1|2>*<around|(|t<rsub|d>-o<rsub|d>|)><rsup|2>>\<#FF0C\>\<#8BA1\>\<#7B97\>\<#68AF\>\<#5EA6\>
          <math|\<nabla\>*E<rsub|d><around|[|<wide|w|\<vect\>>|]>>

          <item><math|<wide|w|\<vect\>>\<leftarrow\><wide|w|\<vect\>>-\<eta\>*\<nabla\>*E<rsub|d><around|[|<wide|w|\<vect\>>|]>>
        </itemize>
      </itemize>
    </itemize>

    \;
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    <\padded-center>
      <section|<with|font|fireflysung|\<#591A\>\<#5C42\>\<#7F51\>\<#7EDC\>\<#548C\>\<#53CD\>\<#5411\>\<#4F20\>\<#64AD\>\<#7B97\>\<#6CD5\>>>
    </padded-center>
  </hidden>|<\hidden>
    <tit|\<#591A\>\<#5C42\>\<#7F51\>\<#7EDC\>>

    <space|5em><image|./image/ann-lippmann.png|.6par|||>
  </hidden>|<\hidden>
    <tit|Sigmoid \<#5355\>\<#5143\>>

    \;

    \;

    <image|./image/ann-sigmoid.png|1par|||>
  </hidden>|<\hidden>
    \;

    \;

    <\equation*>
      \<sigma\><around|(|x|)>=<frac|1|1+e<rsup|-x>>
    </equation*>

    <\equation*>
      <frac|d*\<sigma\><around|(|x|)>|d*x>=\<sigma\><around|(|x|)>*<around|(|1-\<sigma\><around|(|x|)>|)>
    </equation*>

    <with|font|fireflysung|\<#53EF\>\<#5F97\>\<#68AF\>\<#5EA6\>\<#4E0B\>\<#964D\>\<#6CD5\>\<#5219\>\<#7528\>\<#4E8E\>\<#8BAD\>\<#7EC3\>><with|font|roman|\<#FF1A\>
    >

    <\itemize>
      <item><with|font|fireflysung|\<#5355\>\<#4E2A\> >sigmoid
      <with|font|fireflysung|\<#5355\>\<#5143\> >

      <item><with|font|fireflysung|\<#7531\> >sigmoid
      <with|font|fireflysung|\<#5355\>\<#5143\>\<#6784\>\<#6210\>\<#7684\>\<#591A\>\<#5C42\>\<#7F51\>\<#7EDC\>
      ><math|\<rightarrow\>> <with|font|fireflysung|\<#53CD\>\<#5411\>\<#4F20\>\<#64AD\>><with|font|roman|\<#FF08\>>Backpropagation<with|font|roman|\<#FF09\>
      >
    </itemize>
  </hidden>|<\hidden>
    <tit|Sigmoid \<#5355\>\<#5143\>\<#7684\>\<#8BEF\>\<#5DEE\>\<#68AF\>\<#5EA6\>>

    <\eqnarray>
      <tformat|<table|<row|<cell|<frac|\<partial\>*E|\<partial\>*w<rsub|i>>>|<cell|=>|<cell|<frac|\<partial\>|\<partial\>*w<rsub|i>>
      <frac|1|2>*<big|sum><rsub|d\<in\>D><around|(|t<rsub|d>-o<rsub|d>|)><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2>*<big|sum><rsub|d><frac|\<partial\>|\<partial\>*w<rsub|i>>*<around|(|t<rsub|d>-o<rsub|d>|)><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2>*<big|sum><rsub|d>2*<around|(|t<rsub|d>-o<rsub|d>|)>
      <frac|\<partial\>|\<partial\>*w<rsub|i>>*<around|(|t<rsub|d>-o<rsub|d>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|d><around|(|t<rsub|d>-o<rsub|d>|)>*<around*|(|-<frac|\<partial\>*o<rsub|d>|\<partial\>*w<rsub|i>>|)>>>|<row|<cell|>|<cell|=>|<cell|-<big|sum><rsub|d><around|(|t<rsub|d>-o<rsub|d>|)>*<frac|\<partial\>*o<rsub|d>|\<partial\>*n*e*t<rsub|d>>*<frac|\<partial\>*n*e*t<rsub|d>|\<partial\>*w<rsub|i>>>>>>
    </eqnarray>
  </hidden>|<\hidden>
    <with|font|fireflysung|\<#5DF2\>\<#77E5\>>:

    <\equation*>
      <frac|\<partial\>*o<rsub|d>|\<partial\>*n*e*t<rsub|d>>=<frac|\<partial\>*\<sigma\>*<around|(|n*e*t<rsub|d>|)>|\<partial\>*n*e*t<rsub|d>>=o<rsub|d><around|(|1-o<rsub|d>|)>
    </equation*>

    <\equation*>
      <frac|\<partial\>*n*e*t<rsub|d>|\<partial\>*w<rsub|i>>=<frac|\<partial\>*<around|(|<wide|w|\<vect\>>\<cdot\><wide|x|\<vect\>><rsub|d>|)>|\<partial\>*w<rsub|i>>=x<rsub|i,d>
    </equation*>

    <with|font|fireflysung|\<#5F97\>>:

    <\eqnarray>
      <tformat|<table|<row|<cell|<frac|\<partial\>*E|\<partial\>*w<rsub|i>>>|<cell|=>|<cell|-<big|sum><rsub|d\<in\>D><around|(|t<rsub|d>-o<rsub|d>|)>*o<rsub|d><around|(|1-o<rsub|d>|)>*x<rsub|i,d>>>>>
    </eqnarray>
  </hidden>|<\hidden>
    <tit|\<#53CD\>\<#5411\>\<#4F20\>\<#64AD\>\<#7B97\>\<#6CD5\>>

    Backpropagation( training_examples , <math|\<eta\>> , <math|n<rsub|i*n>>
    , <math|n<rsub|o*u*t>> , <math|n<rsub|h*i*d*d*e*n>> )

    <\itemize>
      <item>trainning_examples <with|font|fireflysung|\<#4E2D\>\<#6BCF\>\<#4E00\>\<#4E2A\>\<#8BAD\>\<#7EC3\>\<#6837\>\<#4F8B\>\<#662F\>\<#5F62\>\<#5F0F\>\<#4E3A\>
      ><math|\<less\><wide|x|\<vect\>>,<wide|t|\<vect\>>\<gtr\>>
      <with|font|fireflysung|\<#7684\>\<#5E8F\>\<#5076\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#5176\>\<#4E2D\>
      ><math|<wide|x|\<vect\>>> <with|font|fireflysung|\<#662F\>\<#7F51\>\<#7EDC\>\<#8F93\>\<#5165\>\<#503C\>\<#5411\>\<#91CF\>><with|font|roman|\<#FF0C\>
      ><math|<wide|t|\<vect\>>> <with|font|fireflysung|\<#662F\>\<#76EE\>\<#6807\>\<#8F93\>\<#51FA\>\<#503C\>>\<#3002\>

      <item><math|\<eta\>> <with|font|fireflysung|\<#662F\>\<#5B66\>\<#4E60\>\<#901F\>\<#7387\>><with|font|roman|\<#FF08\>><with|font|fireflysung|\<#4F8B\>\<#5982\>>0.05<with|font|roman|\<#FF09\>>\<#3002\>

      <item><math|n<rsub|i*n>> <with|font|fireflysung|\<#662F\>\<#7F51\>\<#7EDC\>\<#8F93\>\<#5165\>\<#7684\>\<#6570\>\<#91CF\>><with|font|roman|\<#FF0C\>
      >

      <item><math|n<rsub|h*i*d*d*e*n>> <with|font|fireflysung|\<#662F\>\<#9690\>\<#85CF\>\<#5C42\>\<#5355\>\<#5143\>\<#6570\>><with|font|roman|\<#FF0C\>
      >

      <item><math|n<rsub|o*u*t>> <with|font|fireflysung|\<#662F\>\<#8F93\>\<#51FA\>\<#5355\>\<#5143\>\<#6570\>>\<#3002\>

      <item><with|font|fireflysung|\<#4ECE\>\<#5355\>\<#5143\>>i<with|font|fireflysung|\<#5230\>\<#5355\>\<#5143\>>j<with|font|fireflysung|\<#7684\>\<#8F93\>\<#5165\>\<#8868\>\<#793A\>\<#4E3A\>
      ><math|x<rsub|j*i>> <with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#5355\>\<#5143\>>i<with|font|fireflysung|\<#5230\>\<#5355\>\<#5143\>>j<with|font|fireflysung|\<#7684\>\<#6743\>\<#503C\>\<#8868\>\<#793A\>\<#4E3A\>
      ><math|w<rsub|i*j>> \<#3002\>
    </itemize>
  </hidden>|<\hidden>
    Backpropagation( training_examples , <math|\<eta\>> , <math|n<rsub|i*n>>
    , <math|n<rsub|o*u*t>> , <math|n<rsub|h*i*d*d*e*n>> )

    <\itemize>
      <item><with|font|fireflysung|\<#521B\>\<#5EFA\>\<#7F51\>\<#7EDC\>>:
      <math|n<rsub|i*n>> <with|font|fireflysung|\<#4E2A\>\<#8F93\>\<#5165\>><with|font|roman|\<#FF0C\>><math|n<rsub|h*i*d*d*e*n>>
      <with|font|fireflysung|\<#4E2A\>\<#9690\>\<#85CF\>\<#5355\>\<#5143\>><with|font|roman|\<#FF0C\>
      ><math|n<rsub|o*u*t>> <with|font|fireflysung|\<#4E2A\>\<#8F93\>\<#51FA\>
      >

      <item><with|font|fireflysung|\<#521D\>\<#59CB\>\<#5316\>\<#6240\>\<#6709\>\<#7F51\>\<#7EDC\>\<#6743\>\<#503C\>\<#4E3A\>\<#5C0F\>\<#7684\>\<#968F\>\<#673A\>\<#503C\>><with|font|roman|\<#FF08\>><with|font|fireflysung|\<#5982\>
      ><math|<around|[|-0.05,0.05|]>> <with|font|roman|\<#FF09\> >

      <item><with|font|fireflysung|\<#5728\>\<#9047\>\<#5230\>\<#7EC8\>\<#6B62\>\<#6761\>\<#4EF6\>\<#524D\>>:

      <with|font|fireflysung|\<#5BF9\>\<#4E8E\>\<#8BAD\>\<#7EC3\>\<#6837\>\<#4F8B\>
      >training_examples <with|font|fireflysung|\<#4E2D\>\<#7684\>\<#6BCF\>\<#4E2A\>
      ><math|\<less\><wide|x|\<vect\>>,<wide|t|\<vect\>>\<gtr\>> :

      <\itemize>
        <item><with|font|fireflysung|\<#628A\>\<#8F93\>\<#5165\>\<#6CBF\>\<#7F51\>\<#7EDC\>\<#524D\>\<#5411\>\<#4F20\>\<#64AD\>
        >

        <\itemize>
          <item><with|font|fireflysung|\<#628A\>\<#5B9E\>\<#4F8B\>\<#8F93\>\<#5165\>\<#7F51\>\<#7EDC\>><with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#5E76\>\<#8BA1\>\<#7B97\>\<#7F51\>\<#7EDC\>\<#4E2D\>\<#6BCF\>\<#4E2A\>\<#5355\>\<#5143\>
          ><math|u> <with|font|fireflysung|\<#7684\>\<#8F93\>\<#51FA\>
          ><math|o<rsub|u>> \<#3002\>
        </itemize>

        \;
      </itemize>
    </itemize>
  </hidden>|<\hidden>
    <\itemize>
      <\itemize>
        <item><with|font|fireflysung|\<#4F7F\>\<#8BEF\>\<#5DEE\>\<#6CBF\>\<#7F51\>\<#7EDC\>\<#53CD\>\<#5411\>\<#4F20\>\<#64AD\>
        >

        <\itemize>
          <item><with|font|fireflysung|\<#5BF9\>\<#4E8E\>\<#7F51\>\<#7EDC\>\<#7684\>\<#6BCF\>\<#4E2A\>\<#8F93\>\<#51FA\>\<#5355\>\<#5143\>>k<with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#8BA1\>\<#7B97\>\<#5B83\>\<#7684\>\<#8BEF\>\<#5DEE\>\<#9879\>
          ><math|\<delta\><rsub|k>>

          <\equation*>
            \<delta\><rsub|k>\<leftarrow\>o<rsub|k><around|(|1-o<rsub|k>|)>*<around|(|t<rsub|k>-o<rsub|k>|)>
          </equation*>

          <item><with|font|fireflysung|\<#5BF9\>\<#4E8E\>\<#7F51\>\<#7EDC\>\<#7684\>\<#6BCF\>\<#4E2A\>\<#9690\>\<#85CF\>\<#5355\>\<#5143\>
          ><math|h> <with|font|roman|\<#FF0C\>><with|font|fireflysung|\<#8BA1\>\<#7B97\>\<#5B83\>\<#7684\>\<#8BEF\>\<#5DEE\>\<#9879\>
          ><math|\<delta\><rsub|h>>

          <\equation*>
            \<delta\><rsub|h>\<leftarrow\>o<rsub|h><around|(|1-o<rsub|h>|)>*<big|sum><rsub|k\<in\>o*u*t*p*u*t*s>w<rsub|h,k>*\<delta\><rsub|k>
          </equation*>

          <item><with|font|fireflysung|\<#66F4\>\<#65B0\>\<#6BCF\>\<#4E2A\>\<#7F51\>\<#7EDC\>\<#6743\>\<#503C\>
          ><math|w<rsub|i,j>>

          <\equation*>
            w<rsub|i,j>\<leftarrow\>w<rsub|i,j>+\<Delta\>*w<rsub|i,j>
          </equation*>

          <with|font|fireflysung|\<#5176\>\<#4E2D\> >

          <\equation*>
            \<Delta\>*w<rsub|i,j>=\<eta\>*\<delta\><rsub|j>*x<rsub|i,j>
          </equation*>
        </itemize>
      </itemize>
    </itemize>
  </hidden>|<\hidden>
    <tit|Learning Hidden Layer Representations>

    <tabular|<tformat|<cwith|1|1|3|3|cell-valign|c>|<table|<row|<cell|<space|5em><image|./image/ann-838.png|0.3par|||>>|<cell|>|<cell|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|3|3|cell-halign|r>|<cwith|1|-1|3|3|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-bborder|1ln>|<table|<row|<cell|Input>|<cell|<math|\<rightarrow\>>>|<cell|Output>>|<row|<cell|10000000>|<cell|<math|\<rightarrow\>>>|<cell|10000000>>|<row|<cell|01000000>|<cell|<math|\<rightarrow\>>>|<cell|01000000>>|<row|<cell|00100000>|<cell|<math|\<rightarrow\>>>|<cell|00100000>>|<row|<cell|00010000>|<cell|<math|\<rightarrow\>>>|<cell|00010000>>|<row|<cell|00001000>|<cell|<math|\<rightarrow\>>>|<cell|00001000>>|<row|<cell|00000100>|<cell|<math|\<rightarrow\>>>|<cell|00000100>>|<row|<cell|00000010>|<cell|<math|\<rightarrow\>>>|<cell|00000010>>|<row|<cell|00000001>|<cell|<math|\<rightarrow\>>>|<cell|00000001>>>>>>>>>>
  </hidden>|<\hidden>
    <tit|Learning Hidden Layer Representations(result)>

    <padded-center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|3|3|cell-halign|r>|<cwith|1|-1|4|4|cell-halign|r>|<cwith|1|-1|5|5|cell-halign|r>|<cwith|1|-1|6|6|cell-halign|l>|<cwith|1|-1|7|7|cell-halign|r>|<cwith|1|-1|7|7|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|10000000>|<cell|<math|\<rightarrow\>>>|<cell|.89>|<cell|.04>|<cell|.08>|<cell|<math|\<rightarrow\>>>|<cell|10000000>>|<row|<cell|01000000>|<cell|<math|\<rightarrow\>>>|<cell|.01>|<cell|.11>|<cell|.88>|<cell|<math|\<rightarrow\>>>|<cell|01000000>>|<row|<cell|00100000>|<cell|<math|\<rightarrow\>>>|<cell|.01>|<cell|.97>|<cell|.27>|<cell|<math|\<rightarrow\>>>|<cell|00100000>>|<row|<cell|00010000>|<cell|<math|\<rightarrow\>>>|<cell|.99>|<cell|.97>|<cell|.71>|<cell|<math|\<rightarrow\>>>|<cell|00010000>>|<row|<cell|00001000>|<cell|<math|\<rightarrow\>>>|<cell|.03>|<cell|.05>|<cell|.02>|<cell|<math|\<rightarrow\>>>|<cell|00001000>>|<row|<cell|00000100>|<cell|<math|\<rightarrow\>>>|<cell|.22>|<cell|.99>|<cell|.99>|<cell|<math|\<rightarrow\>>>|<cell|00000100>>|<row|<cell|00000010>|<cell|<math|\<rightarrow\>>>|<cell|.80>|<cell|.01>|<cell|.98>|<cell|<math|\<rightarrow\>>>|<cell|00000010>>|<row|<cell|00000001>|<cell|<math|\<rightarrow\>>>|<cell|.60>|<cell|.94>|<cell|.01>|<cell|<math|\<rightarrow\>>>|<cell|00000001>>>>>>
  </hidden>|<\shown>
    <tit|\<#5176\>\<#5B83\>\<#8BEF\>\<#5DEE\>\<#51FD\>\<#6570\>>

    <\itemize>
      <item><with|font|fireflysung|\<#4E3A\>\<#6743\>\<#503C\>\<#589E\>\<#52A0\>\<#60E9\>\<#7F5A\>\<#9879\>><with|font|roman|\<#FF1A\>
      >

      <\equation*>
        E<around|(|<wide|w|\<vect\>>|)>\<equiv\><frac|1|2>*<big|sum><rsub|d\<in\>D><big|sum><rsub|k\<in\>o*u*t*p*u*t*s><around|(|t<rsub|k*d>-o<rsub|k*d>|)><rsup|2>+\<gamma\>*<big|sum><rsub|i,j>w<rsub|j*i><rsup|2>
      </equation*>

      <item><with|font|fireflysung|\<#5BF9\>\<#8BEF\>\<#5DEE\>\<#589E\>\<#52A0\>\<#4E00\>\<#9879\>\<#76EE\>\<#6807\>\<#51FD\>\<#6570\>\<#7684\>\<#659C\>\<#7387\>><with|font|roman|\<#FF08\>>slope<with|font|roman|\<#FF09\>><with|font|fireflysung|\<#6216\>\<#5BFC\>\<#6570\>><with|font|roman|\<#FF1A\>
      >

      <\equation*>
        E<around|(|<wide|w|\<vect\>>|)>\<equiv\><frac|1|2>*<big|sum><rsub|d\<in\>D><big|sum><rsub|k\<in\>o*u*t*p*u*t*s><around*|[|<around|(|t<rsub|k*d>-o<rsub|k*d>|)><rsup|2>+\<mu\>*<big|sum><rsub|j\<in\>i*n*p*u*t*s><around*|(|<frac|\<partial\>*t<rsub|k*d>|\<partial\>*x<rsup|j><rsub|d>>-<frac|\<partial\>*o<rsub|k*d>|\<partial\>*x<rsup|j><rsub|d>>|)><rsup|2>|]>
      </equation*>

      <item><with|font|fireflysung|\<#4F7F\>\<#7F51\>\<#7EDC\>\<#5BF9\>\<#76EE\>\<#6807\>\<#503C\>\<#7684\>\<#4EA4\>\<#53C9\>\<#71B5\>><with|font|roman|\<#FF08\>>cross
      entropy<with|font|roman|\<#FF09\>><with|font|fireflysung|\<#6700\>\<#5C0F\>\<#5316\>
      >

      <item><with|font|fireflysung|\<#6743\>\<#503C\>\<#5171\>\<#4EAB\>><with|font|roman|\<#FF08\>>weight
      sharing<with|font|roman|\<#FF09\> >
    </itemize>
  </shown>>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|16:9>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|2|../../../../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-2|<tuple|2|11|../../../../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-3|<tuple|3|21|../../../../../.TeXmacs/texts/scratch/no_name_7.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc><with|font|<quote|fireflysung>|\<#7B80\>\<#4ECB\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc><with|font|<quote|fireflysung>|\<#611F\>\<#77E5\>\<#5668\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc><with|font|<quote|fireflysung>|\<#591A\>\<#5C42\>\<#7F51\>\<#7EDC\>\<#548C\>\<#53CD\>\<#5411\>\<#4F20\>\<#64AD\>\<#7B97\>\<#6CD5\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>