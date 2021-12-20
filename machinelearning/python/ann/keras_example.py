import tensorflow.keras as K
import numpy as np
x=K.Input(shape=[2])
z=K.layers.Dense(3,activation='sigmoid')(x)
y=K.layers.Dense(1,activation='sigmoid')(z)
m=K.models.Model(x,y)
#m.compile(loss=K.losses.MSE,optimizer=K.optimizers.SGD(lr=0.1,decay=1e-6, momentum=0.9,nesterov=True))
#m.compile(loss=K.losses.MSE,optimizer=K.optimizers.SGD(lr=0.1,decay=1e-6, momentum=0.9))
m.compile(loss=K.losses.MSE,optimizer=K.optimizers.SGD(lr=0.1,momentum=0.9))
m.fit(np.reshape(np.array([0,0,1,1,1,0,0,1]),(4,2)),np.array([0,0,1,1]),batch_size=4,epochs=1000)
print(m.predict(np.reshape(np.array([0,0,1,1,1,0,0,1]),(4,2))))

