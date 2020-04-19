n = int(input(">>> "))
curr_n = n

while True:
  if n % 2 == 1:
    n = 3*n + 1
  else:
    n = n // 2

  if n == 1:
    print("success!")
    break
  else:
    print("current on {n}".format(n=n))
