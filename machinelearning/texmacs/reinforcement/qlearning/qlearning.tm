<TeXmacs|2.1.1>

<style|<tuple|beamer|manila-paper|chinese>>

<\body>
  <screens|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <doc-data|<doc-title|Q-Learning>>
  </hidden>|<\hidden>
    \;

    <space|4em><image|img/room.png|0.8par|||>
  </hidden>|<\hidden>
    \;

    \ <space|4em><image|img/graph0.png|0.7par|||>
  </hidden>|<\hidden>
    \ 

    <space|6em><image|img/graph1.png|0.7par|||>
  </hidden>|<\hidden>
    \;

    <space|4em><image|img/room_start2_finish5.png|0.8par|||>
  </hidden>|<\hidden>
    \;

    <space|6em><image|img/graph_start2_finish5.png|0.7par|||>
  </hidden>|<\hidden>
    \;

    \ <space|3em><image|img/R.png|0.7par|||>
  </hidden>|<\hidden>
    <tit|The Q-Learning algorithm>

    <\itemize>
      <item>Initilazie

      <\itemize-dot>
        <item>Set the <math|\<gamma\>> parameter, and environment rewards in
        matrix R.

        <item>Initialize matrix <math|Q> to zero
      </itemize-dot>

      <item>For each episode:

      <\itemize-dot>
        <item>Select a random initial state.

        <item>While <math|state\<neq\>state<rsub|goal>>

        <\itemize-dot>
          <item>Select one possible <math|action> for the current
          <math|state>, consider going to the <math|state<rsub|next>>.

          <item>Get maximum <math|Q> value for <math|state<rsub|next>> based
          on all possible actions. Compute:

          <\equation*>
            Q<rsub|state, action> = R<rsub|state, action> +
            \<gamma\>max<rsub|action<rprime|'>>[Q<rsub|state<rsub|next>,
            action<rprime|'>>]
          </equation*>

          <item>Set the <math|state<rsub|next>> as the current state.
        </itemize-dot>
      </itemize-dot>
    </itemize>
  </hidden>|<\hidden>
    <tit|Algorithm to utilize the <math|Q> matrix>

    \;

    <\quotation>
      1. Set current state = initial state.

      2. From current state, find the action with the highest Q value.

      3. Set current state = next state.

      4. Repeat Steps 2 and 3 until current state = goal state.
    </quotation>

    The algorithm above will return the sequence of states from the initial
    state to the goal state.
  </hidden>|<\hidden>
    <tit|Q-Learning Example By Hand>

    We'll start by setting the value of the learning parameter
    <math|\<gamma\>=0.8>, and the initial state as Room 1.Initialize matrix Q
    as a zero matrix:

    \ <space|10em><image|img/example_initial_q.png|0.3par|||>
  </hidden>|<\hidden>
    Look at the second row (state 1) of matrix R. There are two possible
    actions for the current state 1: go to state 3, or go to state 5. By
    random selection, we select to go to 5 as our action.

    \ <space|6em><image|img/R.png|0.4par|||>

    Now let's imagine what would happen if our agent were in state 5.<nbsp>
    Look at the sixth row of the reward matrix R (i.e. state 5).<nbsp> It has
    3 possible actions: go to state 1, 4 or 5

    <\quotation>
      Q(state, action) = R(state, action) + Gamma * Max[Q(next state, all
      actions)]

      Q(1, 5) = R(1, 5) + 0.8 * Max[Q(5, 1), Q(5, 4), Q(5, 5)] = 100 + 0.8 *
      0 = 100
    </quotation>
  </hidden>|<\hidden>
    The next state, 5, now becomes the current state.<nbsp> Because 5 is the
    goal state, we've finished one episode.<nbsp> Our agent's brain now
    contains an updated matrix Q as:

    <space|5em><image|img/example_q_1.png|0.5par|||>
  </hidden>|<\hidden>
    \;

    \;

    For the next episode, we start with a randomly chosen initial
    state.<nbsp> This time, we have state 3 as our initial state.

    Look at the fourth row of matrix R; it has 3 possible actions: go to
    state 1, 2 or 4.<nbsp> By random selection, we select to go to state 1 as
    our action.

    Now we imagine that we are in state 1.<nbsp> Look at the second row of
    reward matrix R (i.e. state 1).<nbsp> It has 2 possible actions: go to
    state 3 or state 5.<nbsp> Then, we compute the Q value:

    <\quotation>
      Q(state, action) = R(state, action) + Gamma * Max[Q(next state, all
      actions)]

      Q(3, 1) = R(3, 1) + 0.8 * Max[Q(1, 2), Q(1, 5)] = 0 + 0.8 * Max(0, 100)
      = 80
    </quotation>
  </hidden>|<\hidden>
    We use the updated matrix Q from the last episode.<nbsp> Q(1, 3) = 0 and
    Q(1, 5) = 100.<nbsp> The result of the computation is Q(3, 1) = 80
    because the reward is zero.<nbsp> The matrix Q becomes:

    \;

    <space|6em><image|img/example_q_2.png|0.5par|||>

    The next state, 1, now becomes the current state.<nbsp> We repeat the
    inner loop of the Q learning algorithm because state 1 is not the goal
    state.
  </hidden>|<\hidden>
    \;

    So, starting the new loop with the current state 1, there are two
    possible actions: go to state 3, or go to state 5.<nbsp> By lucky draw,
    our action selected is 5.

    Now, imaging we're in state 5, there are three possible actions: go to
    state 1, 4 or 5.<nbsp> We compute the Q value using the maximum value of
    these possible actions.

    <\quotation>
      Q(state, action) = R(state, action) + Gamma * Max[Q(next state, all
      actions)]

      Q(1, 5) = R(1, 5) + 0.8 * Max[Q(5, 1), Q(5, 4), Q(5, 5)] = 100 + 0.8 *
      0 = 100
    </quotation>
  </hidden>|<\hidden>
    Because 5 is the goal state, we finish this episode.<nbsp> Our agent's
    brain now contain updated matrix Q as:

    \;

    <space|5em><image|img/example_q_3.png|0.5par|||>
  </hidden>|<\hidden>
    <tit|More episode>

    \;

    \;

    \;

    <space|5em><image|img/example_q_more.png|0.5par|||>
  </hidden>|<\hidden>
    This matrix Q, can then be normalized (i.e.; converted to percentage) by
    dividing all non-zero entries by the highest number (500 in this case):

    \;

    \;

    <space|7em><image|img/example_q_normal.png|0.5par|||>
  </hidden>|<\shown>
    <space|4em><image|img/graph2.png|0.7par|||>
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