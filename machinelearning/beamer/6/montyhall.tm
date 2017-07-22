<TeXmacs|1.0.7.21>

<style|generic>

<\body>
  <doc-data|<doc-title|Notes on Monty Hall
  puzzle>|<doc-author|<author-data|<author-name|Xing
  Chao>>>|<doc-misc|xingnix@live.com>>

  \;

  <strong|Cars and goats: the Monty Hall dilemma>

  On Sunday September 9, 1990, the following question appeared in the \PAsk
  Marilyn\Q column in Parade, a Sunday supplement to many newspapers across
  the United States:\ 

  <\itemize-dot>
    <item>Suppose you're on a game show, and you're given the choice of three
    doors;\ 

    <item>behind one door is a car; behind the others, goats.\ 

    <item>You pick a door, say No. 1, and the host, who knows what's behind
    the doors, opens another door, say No. 3, which has a goat.\ 

    <item>He then says to you, \PDo you want to pick door No. 2?\Q\ 

    <item>Is it to your advantage to switch your choice?\VCraig F. Whitaker,
    Columbia, Md.
  </itemize-dot>

  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ <hlink|https://www.boards.ie/b/thread/2056147144|https://www.boards.ie/b/thread/2056147144>

  Inital guess, Suppose picking No.1 door:

  <\eqnarray*>
    <tformat|<table|<row|<cell|P<around*|(|car<rsub|1>\|pick<rsub|1>|)>>|<cell|=>|<cell|<frac|1|3>>>|<row|<cell|P<around*|(|car<rsub|2>\|pick<rsub|1>|)>>|<cell|=>|<cell|<frac|1|3>>>|<row|<cell|P<around*|(|car<rsub|3>\|pick<rsub|1>|)>>|<cell|=>|<cell|<frac|1|3>>>>>
  </eqnarray*>

  Open a door with a goat:

  <\eqnarray*>
    <tformat|<table|<row|<cell|P<around*|(|open<rsub|2>\|car<rsub|1>,pick<rsub|1>|)>>|<cell|=>|<cell|<frac|1|2>>>|<row|<cell|P<around*|(|open<rsub|3>\|car<rsub|1>,pick<rsub|1>|)>>|<cell|=>|<cell|<frac|1|2>>>|<row|<cell|P<around*|(|open<rsub|2>\|car<rsub|2>,pick<rsub|1>|)>>|<cell|=>|<cell|0>>|<row|<cell|P<around*|(|open<rsub|3>\|car<rsub|2>,pick<rsub|1>|)>>|<cell|=>|<cell|1>>|<row|<cell|P<around*|(|open<rsub|2>\|car<rsub|3>,pick<rsub|1>|)>>|<cell|=>|<cell|1>>|<row|<cell|P<around*|(|open<rsub|3>\|car<rsub|3>,pick<rsub|1>|)>>|<cell|=>|<cell|0>>>>
  </eqnarray*>

  Posterior probability:

  <\eqnarray*>
    <tformat|<table|<row|<cell|P<around*|(|car<rsub|1>\|pick<rsub|1>,open<rsub|2>|)>>|<cell|=>|<cell|<frac|P<around*|(|open<rsub|2>\|car<rsub|1>,pick<rsub|1>|)>P<around*|(|car<rsub|1>\|pick<rsub|1>|)>|<big|sum><rsub|i=1><rsup|3>P<around*|(|open<rsub|2>\|car<rsub|i>,pick<rsub|1>|)>P<around*|(|car<rsub|i>\|pick<rsub|1>|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|<frac|1|2>\<cdummy\><frac|1|3>|<frac|1|2>\<cdummy\><frac|1|3>+0\<cdummy\><frac|1|3>+1\<cdummy\><frac|1|3>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|3>>>|<row|<cell|P<around*|(|car<rsub|1>\|pick<rsub|1>,open<rsub|3>|)>>|<cell|=>|<cell|<frac|P<around*|(|open<rsub|3>\|car<rsub|1>,pick<rsub|1>|)>P<around*|(|car<rsub|1>\|pick<rsub|1>|)>|<big|sum><rsub|i=1><rsup|3>P<around*|(|open<rsub|3>\|car<rsub|i>,pick<rsub|1>|)>P<around*|(|car<rsub|i>\|pick<rsub|1>|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|<frac|1|2>\<cdummy\><frac|1|3>|<frac|1|2>\<cdummy\><frac|1|3>+1\<cdummy\><frac|1|3>+0\<cdummy\><frac|1|3>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|3>>>|<row|<cell|P<around*|(|car<rsub|2>\|pick<rsub|1>,open<rsub|2>|)>>|<cell|=>|<cell|<frac|P<around*|(|open<rsub|2>\|car<rsub|2>,pick<rsub|1>|)>P<around*|(|car<rsub|2>\|pick<rsub|1>|)>|<big|sum><rsub|i=1><rsup|3>P<around*|(|open<rsub|2>\|car<rsub|i>,pick<rsub|1>|)>P<around*|(|car<rsub|i>\|pick<rsub|1>|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|0\<cdummy\><frac|1|3>|<frac|1|2>\<cdummy\><frac|1|3>+0\<cdummy\><frac|1|3>+1\<cdummy\><frac|1|3>>>>|<row|<cell|>|<cell|=>|<cell|0>>|<row|<cell|P<around*|(|car<rsub|3>\|pick<rsub|1>,open<rsub|2>|)>>|<cell|=>|<cell|<frac|P<around*|(|open<rsub|2>\|car<rsub|3>,pick<rsub|1>|)>P<around*|(|car<rsub|3>\|pick<rsub|1>|)>|<big|sum><rsub|i=1><rsup|3>P<around*|(|open<rsub|2>\|car<rsub|i>,pick<rsub|1>|)>P<around*|(|car<rsub|i>\|pick<rsub|1>|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1\<cdummy\><frac|1|3>|<frac|1|2>\<cdummy\><frac|1|3>+0\<cdummy\><frac|1|3>+1\<cdummy\><frac|1|3>>>>|<row|<cell|>|<cell|=>|<cell|<frac|2|3>>>|<row|<cell|P<around*|(|car<rsub|3>\|pick<rsub|1>,open<rsub|3>|)>>|<cell|=>|<cell|<frac|P<around*|(|open<rsub|3>\|car<rsub|3>,pick<rsub|1>|)>P<around*|(|car<rsub|3>\|pick<rsub|1>|)>|<big|sum><rsub|i=1><rsup|3>P<around*|(|open<rsub|3>\|car<rsub|i>,pick<rsub|1>|)>P<around*|(|car<rsub|i>\|pick<rsub|1>|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|0\<cdummy\><frac|1|3>|<frac|1|2>\<cdummy\><frac|1|3>+1\<cdummy\><frac|1|3>+0\<cdummy\><frac|1|3>>>>|<row|<cell|>|<cell|=>|<cell|0>>|<row|<cell|P<around*|(|car<rsub|2>\|pick<rsub|1>,open<rsub|3>|)>>|<cell|=>|<cell|<frac|P<around*|(|open<rsub|3>\|car<rsub|2>,pick<rsub|1>|)>P<around*|(|car<rsub|2>\|pick<rsub|1>|)>|<big|sum><rsub|i=1><rsup|3>P<around*|(|open<rsub|3>\|car<rsub|i>,pick<rsub|1>|)>P<around*|(|car<rsub|i>\|pick<rsub|1>|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1\<cdummy\><frac|1|3>|<frac|1|2>\<cdummy\><frac|1|3>+1\<cdummy\><frac|1|3>+0\<cdummy\><frac|1|3>>>>|<row|<cell|>|<cell|=>|<cell|<frac|2|3>>>>>
  </eqnarray*>

  Then it shows that:

  \ \ \ \ Switch to another closed door can increase the probability of
  winning from <math|<frac|1|3>> to <math|<frac|2|3>> .
</body>

<initial|<\collection>
</collection>>