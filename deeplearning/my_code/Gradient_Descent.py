import tensorflow as tf
import os

os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

data = [[2, 81], [4, 93], [6, 91], [8, 97]]

x_data = [x_row[0] for x_row in data]
y_data = [y_row[1] for y_row in data]

learning_rate = 0.1

weight = tf.Variable(tf.random.uniform([1], 0, 10,  dtype=tf.float64, seed=0))
bias = tf.Variable(tf.random.uniform([1], 0, 100, dtype=tf.float64, seed=0))

y = weight * x_data + bias

RMSE = tf.sqrt(tf.reduce_mean(tf.square(y - y_data)))

grad_desc = tf.compat.v1.train.GradientDescentOptimizer(learning_rate).minimize(RMSE)

with tf.compat.v1.Session() as sess:
    sess.run(tf.compat.v1.global_variables_initializer())

    for step in range(2001):
        sess.run(grad_desc)

        if step % 100 == 0:
            print("Epoch: %.f, RMSE == %.04f, weight == %.4f, bias == %.4f" % (step, sess.run(RMSE), sess.run(weight), sess.run(bias)))

