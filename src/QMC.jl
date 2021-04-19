  using Random, Plots, LaTeXStrings, ProgressMeter
let

  # initialization
  alpha    = collect(0.1:0.1:1.14)
  results = zeros(length(alpha));
  energy   = 0.
  energy2  = 0.
  mcs = 10000000    # monte-carlo samplings 


@showprogress 1 "COmputing MC simulation"  for a in 1:length(alpha)
    

    for i in 0:mcs
      x = rand() / sqrt(2) / alpha[a] 
      local_energy = (alpha[a])*(alpha[a]) + x*x*(1 - ((alpha[a])^4))
      energy  += local_energy 
      energy2 += local_energy*local_energy
    end


    # mean energy
    energy = energy / mcs
 
    # standard deviation
    sd  = sqrt(((energy2 /mcs ) - (energy/mcs)^2))
 
    results[a] = energy

  end
  gr(dpi=600)
  plot(xlabel=L"\mathrm{\alpha}", ylabel=L"\mathrm{E_{0}}", framestyle=:box)
  plot!(xtickfontsize=14,ytickfontsize=14,xguidefontsize=14,yguidefontsize=14,legendfontsize=14)
  scatter!(alpha, results, label="MC simulations with N = $mcs")
  plot!(size(400,400))
  savefig("monte_carlo_sp.png")

  println(results[10])

end
