n = 2
lvl = 2

while True:
  if n % 2 == 1:
    n = 3 * n - 1
  else:
    n = n // 2

  if n == 1:
    print("success on {num}".format(num=lvl))
    lvl += 1
    n = lvl

  else:
    print("current: {num}".format(num=n))

