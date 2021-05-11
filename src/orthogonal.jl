# Orthogonalisation

```
Name - gmprd
The matriz R is formed as AB = R
A - The first factor in the product (n x m), unchanged on output
B - Second factor in product (m x l), unchanged on output
R - Product matrix (n x l)
n - number of rows in A (and in R)
m - number of columns in A and rows in B
l - number of columns in B (and in R)

see also: gtprd


```
function gmprd(A, B, R, n, m, l)
  ir =  0
  ik = -m   
  for k in 1:l
    ik = ik + m
    for j in 1:n
      ir = ir + 1
      ji = j - n
      ib = ik
      R[ir] = 0.
      for i in 1:m
        ji = ji + n
        ib = ib + 1
        R[ir] = R[ir] + A[ji]*B[ib]
      end
    end
  end
end
export gmprd

```
Manual page is similar to the function gmprd

```
function gtprd(A, B, R, n, m, l)
  ir =  0
  ik = -n
  for k in 1:l
    ij = 0
    ik = ik + m
    for j in 1:m
      ir = ir + 1
      ib = ik
      R[ir] = 0.
      for i in 1:n
        ij = ij + 1
        ib = ib + 1
        R[ir] = R[ir] + A[ij]*B[ib]
      end
    end
  end
end

export gtprd

