# numerial integration trapezoidal method

  function integration(a,b,n::Int64, func::Function)
    sum = 0.
    step = (b-a) / n # b and a are, respectivelly, upper and lower limits. n is the number of steps
    fa = func(a) / 2 
    fb = func(b) / 2
    for i in 1:n-1
      x = i*step + a
      sum += func(x)
    end
    sum = (sum + fb + fa)*step
  
    return sum
  end


# Numerical integration

  function width(array)
    dt = ((maximum(array) - minimum(array))/(length(array)-1))
    return dt
  end

# NUMERICAL INTEGRATION - TRAPEZIUM METHOD


  function integration(x::Vector, y::Vector) 
    dx = width(x)

# I = (h/2) * (y(1) + 2*y(2) + ... + 2y(n) + y(n+1)
    I = 0.   
    n = length(y) - 1
    for i in 2:n
      I = I + y[i]
    end
    I = (dx/2)*(y[1]+2*I+y[n+1])
    
    return I

  end

# Simpson's method

  function integration_simp(x::Vector, y::Vector)
    dx = width(x)
    n = length(y) - 1
    
    if n % 2 != 0
      n += 1
    end
   
    I = y[1]
    for i in 2:n
      if i % 2 == 0
        I = I + 4*y[i] 
      elseif i % 2 == 1
        I = I + 2*y[i]
      end
    end

    I = (dx/3) * (I + y[n+1])
    return I
  end
   
  
   
