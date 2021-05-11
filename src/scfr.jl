# implementation of the self-consistent-field (SCF) method

```
Form the density matrix R from the occupied columns of U. C contains (as columns) the MO
coefficients and the R-matrix is formed from the first nocc columns.

C - The eigenvectors are stored as columns of length m
R - The charge and bond order matrix generated is stored in R by columns (m x m)
m - The dimension of the matrices (basis set size)
nocc - The number of occupied orbitals (half of the number of eletrons in the closed-shell case)

```
function scfr(C, R, m::Int64, nocc::Int64)  # C and R : Matrix
  for i in 1:m
    for j in 1:i
      sum = 0
      for k in 1:nocc
        kk = m*(k-1)
        ik = kk + i
        jk = kk + j
        sum = sum + C[ik]*C[jk]
      end
      ij = m*(j - 1) + i
      ji = m*(i - 1) + j
      R[ij] = sum;
      R[ji] = sum;
    end
  end
end

export scfr
