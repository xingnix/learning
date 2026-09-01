import jax
x=jax.numpy.array([[1,2],[3,4]])
j=jax.jacobian(jax.grad(lambda y:jax.numpy.sum(y*jax.numpy.inner(x,y))))(jax.numpy.array([3.0,2]))
print(j)
