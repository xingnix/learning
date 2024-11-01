import numpy as np

# data set of xor problem
x = np.array([[1, 0, 1], [1, 1, 1], [0, 0, 1], [0, 1, 1]])
y = np.array([1, -1, -1, 1])

x1 = np.array([[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]]).transpose()
y1 = np.array([1, 1, 1, -1, -1, -1, 1, 1, 1, -1])


# y = np.array([-1, -1, -1, -1, -1, -1, -1, 1, 1, 1])


class sigmoid_batch:
    def __init__(self, w, x, y):
        self.k = x[0] * 0 + np.random.random(x.shape[1]) - 0.5
        for i in range(500):
            o1 = 1 / (1 + np.exp(-(x.dot(self.k))))
            o2 = 2 * (o1 - 0.5)
            dk =  len(w) * x.transpose().dot(np.diag(w)).dot(o1 * (1 - o1) * (o2 - y))
            # dk = 5 * x.transpose().dot(o1 * (1 - o1) * (o2 - y))
            if np.linalg.norm(dk) < 0.001:
                break
            else:
                self.k = self.k - 5.3*dk

        o1 = 1 / (1 + np.exp(-(x.dot(self.k))))
        o2 = 2 * (o1 - 0.5)
        o2[o2 >= 0] = 1
        o2[o2 < 0] = -1
        # self.epsilon = (o2 - y).transpose().dot(np.diag(w).dot(o2 - y))/o2.shape[0]
        #self.epsilon = (np.exp(-y * o2).dot(w) - np.exp(-np.abs(y)).dot(w)) / np.exp(np.abs(y)).dot(w)
        self.epsilon = np.abs(y - o2).dot(w)/2

    def test(self, x):
        o = x.dot(self.k)
        o[o >= 0] = 1
        o[o < 0] = -1
        return o


class sigmoid_single:
    def __init__(self, w, x, y):
        self.k = x[0] * 0 + np.random.random(x.shape[1]) - 0.5
        for i in range(500):
            for t in range(x.shape[0]):
                o1 = 1 / (1 + np.exp(-(x[t].dot(self.k))))
                o2 = 2 * (o1 - 0.5)
                dk = len(w) * x[t] * w[t] * o1 * (1 - o1) * (o2 - y[t])
                # dk = 5 * x.transpose().dot(o1 * (1 - o1) * (o2 - y))
                if np.linalg.norm(dk) < 0.001:
                    break
                else:
                    self.k = self.k - 5*dk

        o1 = 1 / (1 + np.exp(-(x.dot(self.k))))
        o2 = 2 * (o1 - 0.5)
        o2[o2 >= 0] = 1
        o2[o2 < 0] = -1
        # self.epsilon = (o2 - y).transpose().dot(np.diag(w).dot(o2 - y))/o2.shape[0]
        #self.epsilon = (np.exp(-y * o2).dot(w) - np.exp(-np.abs(y)).dot(w)) / np.exp(np.abs(y)).dot(w)
        self.epsilon = np.abs(y - o2).dot(w)/2

    def test(self, x):
        o = x.dot(self.k)
        o[o >= 0] = 1
        o[o < 0] = -1
        return o


class decision_stump:
    def __init__(self, w, x, y):
        e = np.inf
        for i in range(x.shape[1]):
            d = np.sort(x[:, i])
            for j in d[:-1] + (d[1:] - d[:-1]) / 2.0:
                for n in [-1, 1]:
                    t = np.ones(y.shape) * n
                    t[d < j] = -n
                    new_e = np.abs(t - y).dot(w) / 2.0
                    if new_e < e:
                        e = new_e
                        pin = j
                        index = i
                        flag = n
        self.test = lambda x_test: (np.double(x_test[:, index] > pin) * 2 - 1) * flag
        self.epsilon = e


class adaboost:
    def __init__(self, x, y, T, weak):
        n = np.shape(x)[0]
        w = np.ones(n, 'double') / n
        self.alpha = []
        self.F = []
        for t in range(T):
            self.F = self.F + [weak(w, x, y)]
            epsilon = self.F[-1].epsilon
            alpha_t = 1.0 / 2 * np.log((1 - epsilon) / epsilon)
            self.alpha = self.alpha + [alpha_t]
            w = w * np.exp(-y * alpha_t * self.F[-1].test(x))
            w = w / np.sum(w)

    def test(self, x):
        o = x[:, 0] * 0
        for t in range(len(self.F)):
            o = o + self.F[t].test(x) * self.alpha[t]
        o[o >= 0] = 1
        o[o < 0] = -1
        return o


print ("-------------  xor problem ----------------")
print ("input")
print (x)
print ("expect")
print (y)
n = np.shape(x)[0]
w = np.ones(n, 'double') / n
m = sigmoid_batch(w, x, y)
o = m.test(x)
print ("weak learner gradient descent(batch)")
print (o)

m = sigmoid_single(w, x, y)
o = m.test(x)
print ("weak learner gradient descent(single)")
print (o)


a = adaboost(x, y, 5, sigmoid_batch)
o = a.test(x)
print ("adaboost (weak learner:gradient descent,batch)")
print (o)

a = adaboost(x, y, 3, sigmoid_single)
o = a.test(x)
print ("adaboost (weak learner: gradient descent,single)")
print (o)

print ("------------- another demo problem ----------------")

print ("input")
print (x1.reshape(-1))
print ("expect")
print (y1)
n1 = np.shape(x1)[0]
w1 = np.ones(n1, 'double') / n1
s = decision_stump(w1, x1, y1)
o1 = s.test(x1)
print ("decision stump")
print (o1)

a = adaboost(x1, y1, 3, decision_stump)
o = a.test(x1)
print ("adaboost with decision stump")
print (o)
