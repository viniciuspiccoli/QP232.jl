  include("num_integration.jl")

  func(x) = x^2 * sin(2*x) + exp(-sin(3*x)) # function that will be integrated from 0 to 5
  
  # evaluating a numerical integration using monte_carlo
  function mc_int(n::Int64,func::Function)
    
    # main variables
    sum = 0.
    crude_mc = 0.
 
    # monte-carlo evaluation
    for i in 1:n
      x = rand()  # sorting numbers between 0 and 1
      fx = func(x)
      crude_mc += fx        
      sum += fx*fx
    end
   
    crude_mc = crude_mc / n
    sum = sum / n
    variance = sum -(crude_mc*crude_mc)
   
    return crude_mc,  variance

  end
  


  # calculation
  n = 1000000
  a = 0  
  b = 1

  It = integration(a,b,n,func)
  Imc = mc_int(n,func)

  println("Trapezoidal integration with $n steps = ",It)
  println("Monte-carlo integration with $n steps = ",Imc)


