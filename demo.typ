// Copyright 2023 Leedehai
// Use of this code is governed by a MIT license in the LICENSE.txt file.
// For a manual on this package, see physica-manual.pdf.

#import "physica.typ": *

#show: super-T-as-transpose // Render "..^T" as transposed matrix

$
A^T, curl vb(E) = - pdv(vb(B), t),
quad
tensor(Lambda,+mu,-nu) = dmat(1,RR),
quad
f(x,y) dd(x,y),
quad
dd(vb(x),y,[3]),
quad
dd(x,y,2,d:Delta,prod:and),
quad
dv(phi,t,d:upright(D)) = pdv(phi,t) + vb(u) grad phi \

H(f) = hmat(f;x,y;delim:"[",big:#true),
quad
vb(v^a) = sum_(i=1)^n alpha_i vu(u^i),
quad
Set((x, y), pdv(f,x,y,[2,1]) + pdv(f,x,y,[1,2]) < epsilon) \

-1/c^2 pdv(,t,2)psi + laplacian psi = (m^2c^2) / hbar^2 psi,
quad
ket(n^((1))) = sum_(k in.not D) mel(k^((0)), V, n^((0))) / (E_n^((0)) - E_k^((0))) ket(k^((0))),
quad
integral_V dd(V) (pdv(cal(L), phi) - partial_mu (pdv(cal(L), (partial_mu phi)))) = 0 \

dd(s,2) = -(1-(2G M)/r) dd(t,2) + (1-(2G M)/r)^(-1) dd(r,2) + r^2 dd(Omega,2)
$

$
"clk:" & signals("|1....|0....|1....|0....|1....|0....|1....|0..", step: #0.5em) \
"bus:" & signals(" #.... X=... ..... ..... X=... ..... ..... X#.", step: #0.5em)
$
