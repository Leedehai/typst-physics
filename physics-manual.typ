// Copyright 2023 Leedehai
// This document is shared under the Creative Commons BY-ND 4.0 license.

#let version = 0.5

#set page(
  numbering: "1/1",
  header: align(right)[The `physics` package, version #version],
)

#set heading(numbering: "1.")

#align(center, text(16pt)[*The `physics` package*])

#let linkurl(s, url) = {
  link(url)[#underline(text(fill: blue, s))]
}

#align(center)[
  Leedehai \
  #linkurl("https://github.com/leedehai/typst-physics", "https://github.com/leedehai/typst-physics")
]

#align(center)[
  Version #version, March 31, 2023\
  Document updated: March 31, 2023
]

#set par(justify: true)

*NOTE (2023-03-31):* #linkurl("Typst", "https://typst.app") is in beta and evolving, and this package evolves with it. Also, the package itself is under development and fine-tuning. As a result, no backward compatibility is guaranteed yet, until the major version becomes a positive number.

#outline(indent: true)

= Introduction

#v(1em)

The `physics` package provides handy #linkurl("Typst", "https://typst.app") typesetting functions that make academic writing for physics simpler and faster by simplifying otherwise very complex expressions.

This manual itself was generated using the Typst CLI and the `physics` package,
so hopefully the manual source code is able to provide you with a sufficiently
self evident demonstration of how this package shall be used.

= Using `physics`

#v(1em)

// TODO: update usage when Typst has package management.

- To use the `physics` package, you may import names specifically:
  ```typ
  #import "physics.typ": curl, grad

  The expression $op("curl")(op("grad") f) ident curl (grad f) = 0$ is not
  foreign to any trained eye in physical mathematics.
  ```

- or you may simply import all names:
  ```typ
  #import "physics.typ": *

  The expression $op("curl")(op("grad") f) ident curl (grad f)$ is not foreign
  to any trained eye in physical mathematics.
  ```

- sometimes you may want to import the names under a name space:
  ```typ
  #import "physics.typ"

  The expression $op("curl")(op("grad") f) ident physics.curl (physics.grad f)$
  is not foreign to any trained eye in physical mathematics.
  ```

= The symbols

#v(1em)

#import "physics.typ": *

#let builtin = text(fill:blue, "TBI")

#let hl(s) = {  // Highlight. Usage: hl("..."), hl(`...`)
  show regex("#\(.+?\)|#\d+"): set text(blue)
  show regex("\W\w:"): set text(red)  // Single letter
  show regex(";"): set text(red, weight: "bold")
  s
}

Some symbols are already provided as a Typst built-in (#builtin). They are listed here just for completeness, as users coming from LATEX's `physics` package might not know they are already available in Typst out of box.

All symbols need to be used in *math mode* `$...$`.

== Braces

#v(1em)

#table(
  columns: (auto, 2fr, 6fr, 5fr),
  align: left,
  stroke: none,
  [*Symbol*], [*Abbr.*], [*Example*], [*Notes*],

  [`abs(`_content_`)`],
  [],
  [`abs(phi(x))`   #sym.arrow $abs(phi(x))$],
  [absolute, #builtin],

  [`norm(`_content_`)`],
  [],
  [`norm(phi(x))`   #sym.arrow $norm(phi(x))$],
  [norm, #builtin],

  [`order(`_content_`)`],
  [],
  [`order(x^2)`   #sym.arrow $order(x^2)$],
  [order of magnitude],

  [`Set`],
  [],
  [
    `Set(a_n)` #sym.arrow $Set(a_n)$ \
    `Set(integral u, forall u)` \ #sym.arrow $Set(integral u, forall u)$
  ],
  [math set, use `Set` not `set` since the latter is a Typst keyword],

  [`evaluated`],
  [`eval`],
  [
    `eval(f(x))_0^infinity` \ #sym.arrow $eval(f(x))_0^infinity$ \
    `eval(f(x)/g(x))_0^1` \ #sym.arrow $eval(f(x)/g(x))_0^1$
  ],
  [attach a vertical bar on the right to denote evaluation boundaries],

  [`expectationvalue`],
  [`expval`],
  [`expval(u)`  #sym.arrow $expval(u)$],
  [expectation value],
)

== Vector notations

#v(1em)

#table(
  columns: (auto, 1fr, 6fr, 5fr),
  align: left,
  stroke: none,
  [*Symbol*], [*Abbr.*], [*Example*], [*Notes*],

  [`vec`],
  [],
  [`vec(1,2)` #sym.arrow $vec(1,2)$],
  [column vector, #builtin],

  [`vecrow`],
  [],
  [
    `vecrow(1,2)` #sym.arrow $vecrow(1,2)$ \
    `vecrow(sum_0^n a_i, b)` \ #sym.arrow $vecrow(sum_0^n a_i,b)$ \
  ],
  [row vector],

  [`TT`],
  [],
  [`v^TT, A^TT` #sym.arrow $v^TT, A^TT$],
  [transpose (same for matrices)],

  [`vectorbold(`_content_`)`],
  [`vb`],
  [`vb(a),va(mu_1)` #sym.arrow $vb(a),vb(mu_1)$],
  [vector, bold],

  [`vectorarrow(`_content_`)`],
  [`va`],
  [`va(a),va(mu_1)` #sym.arrow $va(a),va(mu_1)$],
  [vector, arrow],

  [`vectorunit(`_content_`)`],
  [`vu`],
  [`vu(a),vu(mu_1)` #sym.arrow $vu(a),vu(mu_1)$],
  [unit vector],

  [`gradient`],
  [`grad`],
  [`grad f` #sym.arrow $grad f$],
  [gradient],

  [`divergence`],
  [`div`],
  [`div vb(E)` #sym.arrow $div vb(E)$],
  [divergence],

  [`curl`],
  [],
  [`curl vb(B)` #sym.arrow $curl vb(B)$],
  [curl],

  [`laplacian`],
  [],
  [`diaer(u) = c^2 laplacian u` \ #sym.arrow $diaer(u) = c^2 laplacian u$],
  [laplacian],

  [`dotproduct`],
  [],
  [`a dotproduct b` #sym.arrow $a dotproduct b$],
  [dot product],

  [`crossproduct`],
  [],
  [`a crossproduct b` #sym.arrow $a crossproduct b$],
  [cross product],
)

== Matrix notations

#v(1em)

#table(
  columns: (auto, 1fr, 6fr, 5fr),
  align: left,
  stroke: none,
  [*Symbol*], [*Abbr.*], [*Example*], [*Notes*],

  [`TT`],
  [],
  [`v^TT, A^TT` #sym.arrow $v^TT, A^TT$],
  [transpose (same for vectors)],

  [`mat`],
  [],
  [`mat(1,2;3,4)` #sym.arrow $mat(1,2;3,4)$],
  [matrix, #builtin],

  [`matrixdet(`...`)`],
  [`mdet`],
  [
    #hl(`mdet(1,x;1,y)`) #sym.arrow $mdet(1,x;1,y)$
  ],
  [matrix determinant],

  [`diagonalmatrix(`...`)`],
  [`dmat`],
  [
    `dmat(1,2)` #sym.arrow $dmat(1,2)$ \
    `dmat(1,a,xi,delim:"[")` \ #sym.arrow $dmat(1,a,xi,delim:"[")$
  ],
  [diagonal matrix],

  [`antidiagonalmatrix(`...`)`],
  [`admat`],
  [
    `admat(1,2)` #sym.arrow $admat(1,2)$ \
    `admat(1,a,xi,delim:"[")` \ #sym.arrow $admat(1,a,xi,delim:"[")$
  ],
  [anti-diagonal matrix],

  [`identitymatrix(`...`)`],
  [`imat`],
  [
    #hl(`imat(#2)`) #sym.arrow $imat(#2)$ \
    #hl(`imat(#3,delim:"[")`) #sym.arrow $imat(#3,delim:"[")$
  ],
  [identity matrix, *note:* Typst needs `#` to parse input as a number],

  [`zeromatrix(`...`)`],
  [`zmat`],
  [
    #hl(`zmat(#2)`) #sym.arrow $zmat(#2)$ \
    #hl(`zmat(#3,delim:"[")`) #sym.arrow $zmat(#3,delim:"[")$
  ],
  [zero matrix, *note:* Typst needs `#` to parse input as a number],
)

== Dirac braket notations

#v(1em)

#table(
  columns: (auto, 1fr, 6fr, 3fr),
  align: left,
  stroke: none,
  [*Symbol*], [*Abbr.*], [*Example*], [*Notes*],

  [`bra(`_content_`)`],
  [],
  [
    `bra(u)`  #sym.arrow $bra(u)$ \
    `bra(limits(sum)_(i=0)^n i)` \ #sym.arrow $bra(limits(sum)_(i=0)^n i)$
  ],
  [bra],

  [`ket(`_content_`)`],
  [],
  [
    `ket(u)`  #sym.arrow $ket(u)$ \
    `ket(limits(sum)_(i=0)^n i)` \ #sym.arrow $ket(limits(sum)_(i=0)^n i)$
  ],
  [ket],

  [`braket(`_a_, _b_`)`],
  [],
  [
    `braket(u, v)` \ #sym.arrow $braket(u, v)$ \
    `braket(limits(sum)_(i=0)^n i, b)` \ #sym.arrow $braket(limits(sum)_(i=0)^n i, b)$
  ],
  [braket],

  [`ketbra(`_a_, _b_`)`],
  [],
  [
    `ketbra(u, v)` \ #sym.arrow $ketbra(u, v)$ \
    `ketbra(limits(sum)_(i=0)^n i, b)` \ #sym.arrow $ketbra(limits(sum)_(i=0)^n i, b)$
  ],
  [ketbra],

  [`innerproduct(`_a_, _b_`)`],
  [`iprod`],
  [
    `iprod(u, v)` \ #sym.arrow $iprod(u, v)$ \
    `iprod(limits(sum)_(i=0)^n i, b)` \ #sym.arrow $iprod(limits(sum)_(i=0)^n i, b)$
  ],
  [innerproduct],

  [`outerproduct(`_a_, _b_`)`],
  [`oprod`],
  [
    `oprod(u, v)` \ #sym.arrow $oprod(u, v)$ \
    `oprod(limits(sum)_(i=0)^n i,b)` \ #sym.arrow $oprod(limits(sum)_(i=0)^n i,b)$
  ],
  [outerproduct],

  [`matrixelement(`_n_, _M_, _m_`)`],
  [`mel`],
  [
    `mel(n, diff_nu H, m)` \ #sym.arrow $mel(n, diff_nu H, m)$ \
    `mel(n, limits(sum)_(i=0)^n i, m)` \ #sym.arrow $mel(n, limits(sum)_(i=0)^n i, m)$
  ],
  [matrix element \ (quantum theory)],
)

== Math functions

#v(1em)

Typst built-in (#builtin) math operators: #linkurl("source code", "https://github.com/typst/typst/blob/main/library/src/math/op.rs").

#table(
  columns: (auto, auto),
  align: left,
  stroke: none,
  column-gutter: 25pt,
  [*Expressions*], [*Results*],

  [`sin(x), sinh(x), arcsin(x), asin(x)`],
  [$sin(x), sinh(x), arcsin(x), asin(x)$],

  [`cos(x), cosh(x), arccos(x), acos(x)`],
  [$cos(x), cosh(x), arccos(x), acos(x)$],

  [`tan(x), tanh(x), arctan(x), atan(x)`],
  [$tan(x), tanh(x), arctan(x), atan(x)$],

  [`sec(x), sech(x), arcsec(x), asec(x)`],
  [$sec(x), sech(x), arcsec(x), asec(x)$],

  [`csc(x), csch(x), arccsc(x), acsc(x)`],
  [$csc(x), csch(x), arccsc(x), acsc(x)$],

  [`cot(x), coth(x), arccot(x), acot(x)`],
  [$cot(x), coth(x), arccot(x), acot(x)$],
)

#table(
  columns: (auto, auto, auto),
  align: left,
  stroke: none,
  [*Expressions*], [*Results*], [*Notes*],

  [`Pr(x)`],
  [$Pr(x)$],
  [probability, #builtin],

  [`exp x, log x, lg x, ln x`],
  [$exp x, log x, lg x, ln x$],
  [exponential and logarithmic, #builtin],

  [`det A`],
  [$det A$],
  [matrix determinant, #builtin],

  [`diag(-1,1,1,1)`],
  [$diag(-1,1,1,1)$],
  [diagonal matrix, compact form (use `dmat` for the "real" matrix form)],

  [`trace A, tr A`],
  [$trace A, tr A$],
  [matrix trace],

  [`Trace A, Tr A`],
  [$Trace A, Tr A$],
  [matrix trace, alt.],

  [`rank A`],
  [$rank A$],
  [matrix rank],

  [`erf(x)`],
  [$erf(x)$],
  [Gauss error function],

  [`Res A`],
  [$Res A$],
  [residue],

  [`Re z, Im z `],
  [$Re z, Im z$],
  [real, imaginary parts of a complex number],

  [`sgn x`],
  [$sgn x$],
  [sign function],
)

== Differentials and derivatives

#v(1em)

#table(
  columns: (auto, 1fr, 6fr, 5fr),
  align: left,
  stroke: none,
  [*Symbol*], [*Abbr.*], [*Example*], [*Notes*],

  [`differential(`...`)`],
  [`dd`],
  [
    e.g. $dd(f), dd(x,y), dd(x,n:3), dd(x,y,p:and)$ \
    See @differentials
  ],
  [differential],

  [`variation(`...`)`],
  [`var`],
  [
    `var(f)` #sym.arrow $var(f)$ \
    `var(x,y)` #sym.arrow $var(x,y)$ \
  ],
  [variation, shorthand of \ `dd(..., d: delta)`],

  [`derivative(`...`)`],
  [`dv`],
  [
    e.g. $dv(,x), dv(f,x), dv(f,x,k,d:Delta), dv(f,x,s:\/)$ \
    See @ordinary-derivatives
  ],
  [derivative],

  [`partialderivative(`...`)`],
  [`pdv`],
  [
    e.g. $pdv(,x), pdv(f,x), pdv(f,x,y,#2), pdv(f,x,y,#(2,3)), pdv(f,x,s:\/)$ \
    See @partial-derivatives
  ],
  [partial derivative, could be mixed order],
)

=== Differentials <differentials>

#v(1em)

Functions: `differential(`\*_args_, \*\*_kwargs_`)`, abbreviated as `dd(`...`)`.
- positional _args_: the variable names,
- named _kwargs_:
  - `n`: an order number an order number array [default: `none`],
  - `d`: the differential symbol [default: `upright(d)`].
  - `p`: the product symbol connecting the components [default: `none`].

*Order assignment algorithm:*
- If there is no order number or order number array, all variables has order 1.
- If there is an order number (not an array), then this order number is assigned to _every_ variable, e.g. `dd(x,y,n:2)` assigns $x <- 2, y <- 2$.
- If there is an order number array, then the order numbers therein are assigned to the variables in order, e.g. `dd(f,x,y,n:(2,3))` assigns $x <- 2, y <- 3$.
- If the order number array holds fewer numbers than the number of variables, then the orders of the remaining variables are 1, e.g. `dd(x,y,z,n:(2,3))` assigns $x <- 2, y <- 3, z <- 1$.
- If a variable $x$ has order 1, it is rendered as $upright(d) x$ not $upright(d)^1 x$.

#align(center, [*Examples*])

#grid(
  columns: (50%, 50%),
  row-gutter: 1em,
  column-gutter: 2em,

  [
    *(1)* #hl(`dd(f), dd(x,y), dd(x,y,z,p:and)`) \
    $ dd(f), dd(x,y), dd(x,y,z,p:and) $
  ],
  [
    *(2)* #hl(`dd(phi,n:k,d:delta)`) \
    $ dd(phi,n:k,d:delta) $
  ],
  [
    *(3)* #hl(`dd(f,n:2), dd(vb(x),t,n:(3,))`) \
    $ dd(f,n:2), dd(vb(x),t,n:(3,)) $
  ],
  [
    *(4)* #hl(`dd(x,y,n:(2,3)), dd(x,y,z,n:(2,3))`) \
    $ dd(x,y,n:(2,3)), dd(x,y,z,n:(2,3)) $
  ],
  [
    *(5)* #hl(`dd(x, y, z, n: ((1,1),rho+1,n_1))`) \
    $ dd(x, y, z, n: ((1,1),rho+1,n_1)) $
  ],
  [
    *(6)* #hl(`dd(x,y,d:Delta), dd(x,y,n:2,d:Delta)`) \
    $ dd(x,y,d:Delta), dd(x,y,n:2,d:Delta) $
  ],
)

=== Ordinary derivatives <ordinary-derivatives>

#v(1em)

Function: `derivative(`_f_, \*_args_, \*\*_kwargs_`)`, abbreviated as `dv(`...`)`.
- _f_: the function, which can be `#none` or omitted,
- positional _args_: the variable name, *optionally* followed by an order number,
- named _kwargs_:
  - `d`: the differential symbol [default: `upright(d)`].
  - `s`: the "slash" separating the numerator and denominator [default: `none`], by default it produces the normal fraction form $dv(f,x)$. The most common non-default is `slash` or simply `\/`, so as to create a flat form $dv(f,x,s:\/)$ that fits inline.

*Order assignment algorithm:* there is just one variable, so the assignment is trivial: simply assign the order number (default to 1) to the variable. If a variable $x$ has order 1, it is rendered as $x$ not $x^1$.

#align(center, [*Examples*])

#grid(
  columns: (50%, 50%),
  row-gutter: 1em,
  column-gutter: 2em,

  [
    *(1)* #hl(`dv(,x), dv(,x,2), dv(,x,k+1)`) \
    $ dv(,x), dv(,x,2), dv(,x,k+1) $
  ],
  [
    *(2)* #hl(`dv(, vb(r)), dv(, vb(r), 2)`) \
    $ dv(, vb(r)), dv(, vb(r), 2) $
  ],
  [
    *(3)* #hl(`dv(f,x), dv(f,x,2), dv(f,xi,k+1)`) \
    $ dv(f,x), dv(f,x,2), dv(f,xi,k+1) $
  ],
  [
    *(4)* #hl(`dv(f, vb(r)), dv(f, vb(r), 2)`) \
    $ dv(f, vb(r)), dv(f, vb(r), 2) $
  ],
  [
    *(5)* #hl(`dv(f,x,2,s:\/), dv(f,xi,k+1,s:slash)`) \
    $ dv(f,x,2,s:\/), dv(f,xi,k+1,s:slash) $
  ],
  [
    *(6)* #hl(`dv(, x, d:delta), dv(, x, 2, d:Delta)`) \
    $ dv(, x, d:delta), dv(, x, 2, d:Delta) $
  ],
  [
    *(7)* #hl(`dv(vb(u), t, 2, d: upright(D))`) \
    $ dv(vb(u), t, 2, d: upright(D)) $
  ],
  [
    *(8)* #hl(`dv(vb(u),t,2,d:upright(D),s:slash)`) \
    $ dv(vb(u),t,2,d:upright(D),s:slash) $
  ],
)

=== Partial derivatives <partial-derivatives>

#v(1em)

Function: `partialderivative(`_f_, \*_args_, \*\*_kwargs_`)`, abbreviated as `pdv(`...`)`.
- _f_: the function, which can be `#none` or omitted,
- positional _args_: the variable names, *optionally* followed by an order number e.g. `#2`, or an order number array e.g. `#(2,3)`.
  - Note `#` is important, since Typst constructs a number or array in *code mode* -- without `#`, what follows will just be parsed as a sequence of generic symbols (not numbers) that are not operable in the numeric computation of the total order.
- named _kwargs_:
  - `s`: the "slash" separating the numerator and denominator [default: `none`], by default it produces the normal fraction form $pdv(f,x)$. The most common non-default is `slash` or simply `\/`, so as to create a flat form $pdv(f,x,s:\/)$ that fits inline.

*Order assignment algorithm:*
- If there is no order number or order number array, all variables has order 1.
- If there is an order number (not an array), then this order number is assigned to _every_ variable, e.g. `pdv(f,x,y,#2)` assigns $x <- 2, y <- 2$.
- If there is an order number array, then the order numbers therein are assigned to the variables in order, e.g. `pdv(f,x,y,#(2,3))` assigns $x <- 2, y <- 3$.
- If the order number array holds fewer numbers than the number of variables, then the orders of the remaining variables are 1, e.g. `pdv(f,x,y,z,#(2,3))` assigns $x <- 2, y <- 3, z <- 1$.
- If a variable $x$ has order 1, it is rendered as $x$, not $x^1$.

The total order applied to the function differential is automatically calculated by adding the order numbers of the variables. Examples:
- `pdv(f, x)` has total order 1,
- `pdv(f, x, #2)` has total order 2,
- `pdv(f, x, y, #2)` has total order 2 + 2 = 4,
- `pdv(f, x, y, #(2, 3))` has total order 2 + 3 = 5,
- `pdv(f, x, y, z, #(2, 3))` has total order 2 + 3 + 1 = 6,

#align(center, [*Examples*])

#grid(
  columns: (50%, 50%),
  row-gutter: 1em,
  column-gutter: 2em,
  [
    *(1)* #hl(`pdv(,x), pdv(,t,#2)`) \
    $ pdv(,x), pdv(,t,#2) $
  ],
  [
    *(2)* #hl(`pdv(f,vb(r)), pdv(phi,vb(r),#2)`) \
    $ pdv(phi,vb(r)), pdv(phi,vb(r),#2) $
  ],
  [
    *(3)* #hl(`pdv(,x,y), pdv(,x,y,#2)`) \
    $ pdv(,x,y), pdv(,x,y,#2) $
  ],
  [
    *(4)* #hl(`pdv(f,x,y,#2), pdv(f,x,y,#3)`) \
    $ pdv(phi,x,y,#2), pdv(phi,x,y,#3) $
  ],
  [
    *(5)* #hl(`pdv(,x,y,#(2,)), pdv(,x,y,#(1,2))`) \
    $ pdv(,x,y,#(2,)), pdv(,x,y,#(1,2)) $
  ],
  [
    *(6)* #hl(`pdv(,t,#2,s:\/), pdv(f,x,y,s:slash)`) \
    $ pdv(,t,#2,s:\/), pdv(f,x,y,s:slash) $
  ],
  [
    *(7)* #hl(`pdv(, (x^1), (x^2), (x^3), #(1,3))`) \
    $ pdv(, (x^1), (x^2), (x^3), #(1,3)) $
  ],
  [
    *(8)* #hl(`pdv(phi,x,y,z,tau, #(2,2,2,1))`) \
    $ pdv(phi,x,y,z,tau, #(2,2,2,1)) $
  ],
)

*(9)* #hl(`integral_V dd(V) (pdv(cal(L), phi) - diff_mu (pdv(cal(L), (diff_mu phi)))) = 0`) \
$ integral_V dd(V) (pdv(cal(L), phi) - diff_mu (pdv(cal(L), (diff_mu phi)))) = 0 $

== Miscellaneous

#v(1em)

=== Reduced Planck constant (hbar)

#v(1em)

Due to the default font, the built-in symbol `planck.reduce` $planck.reduce$ looks a bit off: on letter "h" there is a slash instead of a horizontal bar, contrary to the symbol's colloquial name "h-bar". This package offers `hbar` to render the symbol in the familiar form: $hbar$. Contrast:

#table(
  columns: (auto, auto, auto, auto, auto),
  align: horizon,
  column-gutter: 1em,
  stroke: none,

  [Typst's `planck.reduce`],
  [$ E = planck.reduce omega $],
  [$ (pi G^2) / (planck.reduce c^4) $],
  [$ A e^(frac(i(p x - E t), planck.reduce)) $],
  [$ i planck.reduce pdv(,t) psi = -frac(planck.reduce^2, 2m) laplacian psi $],

  [this package's `hbar`],
  [$ E = hbar omega $],
  [$ (pi G^2) / (hbar c^4) $],
  [$ A e^(frac(i(p x - E t), hbar)) $],
  [$ i hbar pdv(,t) psi = -frac(hbar^2, 2m) laplacian psi $],
)

=== Tensors

#v(1em)

Tensors are often expressed using the #linkurl("abstract index notation", "https://en.wikipedia.org/wiki/Abstract_index_notation"), which makes the contravariant and covariant "slots" explicit. The intuitive solution of using superscripts and subscripts do not suffice if both upper (contravariant) and lower (covariant) indices exist, because the notation rules require the indices be vertically separated: e.g. $tensor(T,+a,-b)$ and $tensor(T,-a,+b)$, which are of different shapes. "$T^a_b$" is flatly wrong, and `T^(space w)_(i space j)` produces a weird-looking "$T^(space w)_(i space j)$" (note $w,j$ vertically overlap).

Function: `tensor(`_symbol_, \*_args_`)`.
- _symbol_: the tensor symbol,
- positional args: comma-separated list taking the form of $+dots.h$ or $-dots.h$, where a `+` prefix denotes an upper index and a `-` prefix denotes a lower index.

#align(center, [*Examples*])

#grid(
  columns: (50%, 50%),
  row-gutter: 1em,
  column-gutter: 2em,

  [
    *(1)* #hl(`tensor(u,+a), tensor(v,-a)`) \
    $ tensor(u,+a), tensor(v,-a) $
  ],
  [
    *(2)* #hl(`tensor(h,+mu,+nu), tensor(g,-mu,-nu)`) \
    $ tensor(h, +mu, +nu), tensor(g, -mu, -nu) $
  ],
  [
    *(3)* #hl(`tensor(T,+a,-b), tensor(T,-a,+b)`) \
    $ tensor(T,+a,-b), tensor(T,-a,+b) $
  ],
  [
    *(4)* #hl(`tensor(T, -i, +w, -j)`) \
    $ tensor(T, -i, +w, -j) $
  ],
  [
    *(5)* #hl(`tensor((dd(x^lambda)),-a)`) \
    $ tensor((dd(x^lambda)),-a) $
  ],
  [
    *(6)* #hl(`tensor(AA,+a,+b,-c,-d,+e,-f,+g,-h)`) \
    $ tensor(AA,+a,+b,-c,-d,+e,-f,+g,-h) $
  ],
  [
    *(7)* #hl(`tensor(R, -a, -b, -c, +d)`) \
    $ tensor(R, -a, -b, -c, +d) $
  ],
  [
    *(8)* #hl(`tensor(T,+1,-I(1,-1),+a_bot,-+,+-)`) \
    $ tensor(T,+1,-I(1,-1),+a_bot,-+,+-) $
  ],
)

*(9)* `grad_mu A^nu = diff_mu A^nu + tensor(Gamma,+nu,-mu,-lambda) A^lambda`
$ grad_mu A^nu = diff_mu A^nu + tensor(Gamma,+nu,-mu,-lambda) A^lambda $

=== Isotopes

#v(1em)

Function: `isotope(`_element_, _a_: ..., _z_: ...`)`.
- _element_: the chemical element (use `".."` for multi-letter symbols)
- _a_: the mass number _A_ [default: `none`].
- _z_: the atomic number _Z_ [default: `none`].

#align(center, [*Examples*])

#grid(
  columns: (50%, 50%),
  row-gutter: 1em,
  column-gutter: 2em,
  [
    *(1)* #hl(`isotope(I, a:127)`) \
    $ isotope(I, a:127) $
  ],
  [
    *(2)* #hl(`isotope("Fe", z:26)`) \
    $ isotope("Fe", z:26) $
  ],
)

*(3)* #hl(`isotope("Bi",a:211,z:83) --> isotope("Tl",a:207,z:81) + isotope("He",a:4,z:2)`)
$ isotope("Bi",a:211,z:83) --> isotope("Tl",a:207,z:81) + isotope("He",a:4,z:2) $

*(4)* #hl(`isotope("Tl",a:207,z:81) --> isotope("Pb",a:207,z:82) + isotope(e,a:0,z:-1)`)
$ isotope("Tl",a:207,z:81) --> isotope("Pb",a:207,z:82) + isotope(e,a:0,z:-1) $

= Acknowledgement

#v(1em)

Huge thanks to Sergio C. de la Barrera's LATEX `physics` package and Simon
Jensen's LATEX `derivative` package, which lit the way for physics typesetting.

#v(2em)

#align(bottom, text(8pt)[

#sym.copyright Copyright 2023 Leedehai. The document is shared under Creative Commons Attribution-NoDerivatives 4.0 license (#linkurl("CC BY-ND 4.0", "https://creativecommons.org/licenses/by-nd/4.0/legalcode")).

])
