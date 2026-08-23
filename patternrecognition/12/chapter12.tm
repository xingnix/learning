<TeXmacs|2.1>

<style|generic>

<\body>
  <chapter|Continuous Latent Variables>

  In Chapter 9, we discussed probabilistic models having discrete latent
  variables, such as the mixture of Gaussians. We now explore models in which
  some, or all, of the latent variables are continuous. An important
  motivation for such models is that many data sets have the property that
  the data points all lie close to a manifold of much lower dimensionality
  than that of the original data space. To see why this might arise, consider
  an artificial data set constructed by taking one of the off-line digits,
  represented by a 64x64 pixel grey-level image, and embedding it in a larger
  image of size 100x100 by padding with pixels having the value zero
  (corresponding to white pixels) in which the location and orientation of
  the digit is varied at random, as illustrated in Figure 12.1. Each of the
  resulting images is represented by a point in the
  <math|100x100=10,000>-dimensional data space. However, across a data set of
  such images, there are only three <em|degrees of freedom> of variability,
  corresponding to the vertical and horizontal translations and the
  rotations. The data points will therefore live on a subspace of the data
  space whose <em|intrinsic dimensionality> is three. Note
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|2fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-size|<quote|1.19>|1<space|2spc>Continuous
      Latent Variables> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|1fn>
    </associate>
  </collection>
</auxiliary>