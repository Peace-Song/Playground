import tensorflow as tf
import os

os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

data = [[2, 0, 81], [4, 4, 93], [6, 2, 91], [8, 3, 97]]

learning_rate = 0.1

x1 = [x_row1[0] for x_row1 in data]
x2 = [x_row2[1] for x_row2 in data]
y_data = [y_row[2] for y_row in data]

w_0 = tf.Variable(tf.random.uniform([1], 0, 10,  dtype=tf.float64, seed=0))
w_1 = tf.Variable(tf.random.uniform([1], 0, 10,  dtype=tf.float64, seed=0))
bias = tf.Variable(tf.random.uniform([1], 0, 100, dtype=tf.float64, seed=0))

y = w_0 * x1 + w_1 * x2 + bias

RMSE = tf.sqrt(tf.reduce_mean(tf.square(y - y_data)))

grad_desc = tf.compat.v1.train.GradientDescentOptimizer(learning_rate).minimize(RMSE)

with tf.compat.v1.Session() as sess:
    sess.run(tf.compat.v1.global_variables_initializer())

    for step in range(2001):
        sess.run(grad_desc)

        if step % 100 == 0:
            print("Epoch: %.f, RMSE == %.04f, w_0 == %.4f, w_1 == %.4f, bias == %.4f" % (step, sess.run(RMSE),
            sess.run(w_0), sess.run(w_1), sess.run(bias)))

