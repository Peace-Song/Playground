def decorator_func(inner_func):
  def wrapper_func():
    print("wrapper_func() called")
    return inner_func()

  return wrapper_func


@decorator_func
def helloWorld():
  print("Hello, World!")

if __name__ == "__main__":
  helloWorld()

