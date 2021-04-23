
#=
------------------------
STO-3g Basis function  -
------------------------
The STO-3G basis is a very well-known minimal basis set which contracts 3 Gaussian functions to approximate the more accurate (but more difficult to compute) Slater type orbitals.
=#


# Builds a STO-3G basis that aproximates a single slater type orbital  with Slater orbital exponent zeta
function STO3G(center, zeta)
  scaling = zeta^2
  sto = STONG(3,[0.444635, 0.535328, 0.154329],  
	      [Gaussian1s(scaling*.109818, center),
               Gaussian1s(scaling*.405771, center),
               Gaussian1s(scaling*2.22766, center)])
  return sto
end


# procurar ver de onde sairam of parâmetros de contração


