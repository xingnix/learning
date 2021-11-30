---
jupyter:
  jupytext:
    formats: ipynb,md
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.13.0
  kernelspec:
    display_name: Python 3
    language: python
    name: python3
---

<!-- #region slideshow={"slide_type": "slide"} -->
# Monty Hall Dilemma
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "slide"} -->
**Cars and goats: the Monty Hall dilemma**

On Sunday September 9, 1990, the following question appeared in the "Ask
Marilyn" column in Parade, a Sunday supplement to many newspapers across
the United States:

-   Suppose you're on a game show, and you're given the choice of three
    doors;

-   behind one door is a car; behind the others, goats.

-   You pick a door, say No. 1, and the host, who knows what's behind
    the doors, opens another door, say No. 3, which has a goat.

-   He then says to you, "Do you want to pick door No. 2?"

-   Is it to your advantage to switch your choice?---Craig F. Whitaker,
    Columbia, Md.
                               <https://www.boards.ie/b/thread/2056147144>
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "slide"} -->

Inital guess, Suppose picking No.1 door: 

\begin{align}
  P ( {car}_{1} | {pick}_{1} ) & = & \frac{1}{3}\\
  P ( {car}_{2} | {pick}_{1} ) & = & \frac{1}{3}\\
  P ( {car}_{3} | {pick}_{1} ) & = & \frac{1}{3}
\end{align}

<!-- #endregion -->

<!-- #region slideshow={"slide_type": "slide"} -->
Open a door with a goat: $$\begin{aligned}
  P ( {{open}}_{2} | {{car}}_{1} , {{pick}}_{1} ) & = & \frac{1}{2}\\
  P ( {{open}}_{3} | {{car}}_{1} , {{pick}}_{1} ) & = & \frac{1}{2}\\
  P ( {{open}}_{2} | {{car}}_{2} , {{pick}}_{1} ) & = & 0\\
  P ( {{open}}_{3} | {{car}}_{2} , {{pick}}_{1} ) & = & 1\\
  P ( {{open}}_{2} | {{car}}_{3} , {{pick}}_{1} ) & = & 1\\
  P ( {{open}}_{3} | {{car}}_{3} , {{pick}}_{1} ) & = & 0\end{aligned}$$
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "slide"} -->
Posterior probability: $$\begin{align*}
  P ( {{car}}_{1} | {{pick}}_{1} , {{open}}_{2} ) & =  \frac{P (
  {{open}}_{2} | {{car}}_{1} , {{pick}}_{1} ) P ( {{car}}_{1} |
  {{pick}}_{1} )}{\sum_{i=1}^{3} P ( {{open}}_{2} | {{car}}_{i} ,
  {{pick}}_{1} ) P ( {{car}}_{i} | {{pick}}_{1} )}\\
  & =  \frac{\frac{1}{2} \cdot\frac{1}{3}}{\frac{1}{2} \cdot
  \frac{1}{3} +0 \cdot\frac{1}{3} +1 \cdot\frac{1}{3}}\\
  & =  \frac{1}{3}\\
  P ( {{car}}_{1} | {{pick}}_{1} , {{open}}_{3} ) & =  \frac{P (
  {{open}}_{3} | {{car}}_{1} , {{pick}}_{1} ) P ( {{car}}_{1} |
  {{pick}}_{1} )}{\sum_{i=1}^{3} P ( {{open}}_{3} | {{car}}_{i} ,
  {{pick}}_{1} ) P ( {{car}}_{i} | {{pick}}_{1} )}\\
  & =  \frac{\frac{1}{2} \cdot\frac{1}{3}}{\frac{1}{2} \cdot
  \frac{1}{3} +1 \cdot\frac{1}{3} +0 \cdot\frac{1}{3}}\\
  & =  \frac{1}{3}\\
  P ( {{car}}_{2} | {{pick}}_{1} , {{open}}_{2} ) & =  \frac{P (
  {{open}}_{2} | {{car}}_{2} , {{pick}}_{1} ) P ( {{car}}_{2} |
  {{pick}}_{1} )}{\sum_{i=1}^{3} P ( {{open}}_{2} | {{car}}_{i} ,
  {{pick}}_{1} ) P ( {{car}}_{i} | {{pick}}_{1} )}\\
  & =  \frac{0 \cdot\frac{1}{3}}{\frac{1}{2} \cdot\frac{1}{3} +0
  \cdot\frac{1}{3} +1 \cdot\frac{1}{3}}\\
  & =  0\\
  P ( {{car}}_{3} | {{pick}}_{1} , {{open}}_{2} ) & =  \frac{P (
  {{open}}_{2} | {{car}}_{3} , {{pick}}_{1} ) P ( {{car}}_{3} |
  {{pick}}_{1} )}{\sum_{i=1}^{3} P ( {{open}}_{2} | {{car}}_{i} ,
  {{pick}}_{1} ) P ( {{car}}_{i} | {{pick}}_{1} )}\\
  & =  \frac{1 \cdot\frac{1}{3}}{\frac{1}{2} \cdot\frac{1}{3} +0
  \cdot\frac{1}{3} +1 \cdot\frac{1}{3}}\\
  & =  \frac{2}{3}\\
  P ( {{car}}_{3} | {{pick}}_{1} , {{open}}_{3} ) & =  \frac{P (
  {{open}}_{3} | {{car}}_{3} , {{pick}}_{1} ) P ( {{car}}_{3} |
  {{pick}}_{1} )}{\sum_{i=1}^{3} P ( {{open}}_{3} | {{car}}_{i} ,
  {{pick}}_{1} ) P ( {{car}}_{i} | {{pick}}_{1} )}\\
  & =  \frac{0 \cdot\frac{1}{3}}{\frac{1}{2} \cdot\frac{1}{3} +1
  \cdot\frac{1}{3} +0 \cdot\frac{1}{3}}\\
  & =  0\\
  P ( {{car}}_{2} | {{pick}}_{1} , {{open}}_{3} ) & =  \frac{P (
  {{open}}_{3} | {{car}}_{2} , {{pick}}_{1} ) P ( {{car}}_{2} |
  {{pick}}_{1} )}{\sum_{i=1}^{3} P ( {{open}}_{3} | {{car}}_{i} ,
  {{pick}}_{1} ) P ( {{car}}_{i} | {{pick}}_{1} )}\\
  & =  \frac{1 \cdot\frac{1}{3}}{\frac{1}{2} \cdot\frac{1}{3} +1
  \cdot\frac{1}{3} +0 \cdot\frac{1}{3}}\\
  & =  \frac{2}{3}\end{align*}$$
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "slide"} -->
  Then it shows that:

   Switch to another closed door can increase the probability of winning
from $\frac{1}{3}$ to $\frac{2}{3}$ .

<!-- #endregion -->
