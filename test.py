from math import sqrt

def solve(coefficients):
  if len(coefficients) == 3:
    a = coefficients[0]
    b = coefficients[1]
    c = coefficients[2]
    
    if a != 0:
      if b**2 - 4*a*c > 0:
        x = [(-b + sqrt(b**2 - 4*a*c))/2*a, (-b - sqrt(b**2 - 4*a*c))/2*a]
      elif b**2 - 4*a*c == 0:
        x = [-b/2*a]
      else:
        x = [(-b + sqrt(-(b**2 - 4*a*c))*1j)/2*a, (-b - sqrt(-(b**2 - 4*a*c))*1j)/2*a]

    else:
      if b != 0: 
        x = [-c/b] 
      else:
        if c == 0:
          print("Warning: indeterminate (0/0 form)")
          x = float('nan')
        else:
          print("Warning: undefined (there is no possible solution")
          x = float('nan')

  elif len(coefficients) == 2:
    b = coefficients[0]
    c = coefficients[1]
    if b != 0:
      x = [-c/b]
    else:
      if c == 0:         
        print("Warning: indeterminate (0/0 form)")
        x = float('nan')
      else:
        print("Warning: undefined (there is no possible solution")
        x = float('nan')

  else:
    print("can't solve!", str(coefficients))

  return x
