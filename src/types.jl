# Types to do a HF calculation
abstract type BasisFunction end

#= 1s Gaussian-type function
Smallest possible basis set is called the minimal basis set, and it contais one orbital.
For example, hydrogen has just one orbital, but carbon has 5 (1s, 2s, 2px, 2py, and 2pz) even though one of the p orbitals for carbon atom will be unoccupied.
=#
struct Gaussian1s <: BasisFunction
  #Gaussian orbital exponent
  alpha :: Float64
  #nuclear coordinates
  center::Float64
end

# Slater Type Orbital fit with N gaussians (STO-NG) type basis
struct STONG <: BasisFunction
  n::Integer
  #contraction coeffiecents
  d::Array{Float64} 
  #primative gaussians
  g::Array{Gaussian1s}
end



#=
The STO-3G basis is a very well-known minimal basis set which contracts 3 Gaussian functions to approximate the more accurate (but more difficult to compute) Slater type orbitals. Although a contracted GTO might give a good approximation to an atomic orbital, it lacks any flexibility to expand or shrink in the presence of other atoms in a molecule. Hence, a minimal basis set such as STO-3G is not capable of giving highly accurate results.
=#

