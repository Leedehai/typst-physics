// Copyright 2023 Leedehai
// This document is shared under the Creative Commons BY-ND 4.0 license.
#import "physica.typ": *

#let version = "0.9.5"

#set document(
  title: [physica-manual.typ],
  author: ("Leedehai"),
  // Prevents setting the creation date to PDF metadata, so the same *.typ
  // file content will result in the same *.pdf binary.
  date: none,
)

#set page(
  numbering: "1/1",
  header: align(right)[#text(8pt)[The `physica` package\ version #version]],
)

#set heading(numbering: "1.")

#align(center, text(16pt)[*The `physica` package*])

#let linkurl(s, url) = {
  link(url)[#underline(text(fill: blue, s))]
}

#align(center)[
  Leedehai \
  #linkurl("GitHub", "https://github.com/leedehai/typst-physics") |
  #linkurl("Typst", "https://typst.app/docs/packages/")
]

#set par(justify: true)

#v(1em)

#align(center)[
/ physica: _noun_. Latin, study of nature.
]

#v(1em)

#outline(indent: auto)
#pagebreak(weak: true)

= Introduction

#v(1em)

#linkurl("Typst", "https://typst.app") is typesetting framework aiming to become the next generation alternative to LATEX. It excels in its friendly user experience and performance.

The `physica` package provides handy Typst typesetting functions that make academic writing for natural sciences simpler and faster, by simplifying otherwise very complex and repetitive expressions in the domain of natural sciences.

This manual itself was generated using the Typst CLI and the `physica` package, so hopefully this document is able to provide you with a sufficiently self evident demonstration of how this package shall be used.

= Using `physica`

#v(1em)

With `typst`'s #linkurl("package management", "https://github.com/typst/packages"):

```typst
#import "@preview/physica:0.9.4": *

$ curl (grad f), pdv(,x,y,z,[2,k]), tensor(Gamma,+k,-i,-j) = pdv(vb(e_i),x^j)vb(e^k) $
```

$ curl (grad f), pdv(,x,y,z,[2,k]), tensor(Gamma,+k,-i,-j)=pdv(vb(e_i),x^j)vb(e^k) $

= The symbols

#v(1em)

// Put the superscript *before* the symbol, in case there are symbols after it.
#let builtin(symbol) = [#super(text(fill: blue, "typst "))#symbol]

#let hl(s) = {  // Highlight. Usage: hl("..."), hl(`...`)
  show regex("#\(.+?\)|#(\d|\w)+"): set text(eastern)
  show regex("\[|\]"): set text(red)
  show regex("\w+:"): set text(blue)
  show regex(";"): set text(red, weight: "bold")
  s
}

#let SUM = $limits(sum)_(i=0)^n i$

Some symbols are already provided as a Typst built-in. They are listed here just for completeness with annotation like #builtin([`this`]), as users coming from LATEX might not know they are already available in Typst out of box.

All symbols need to be used in *math mode* `$...$`.

== Braces

#v(1em)

#table(
  columns: (auto, auto, auto, auto),
  align: left,
  stroke: none,
  [*Symbol*], [*Abbr.*], [*Example*], [*Notes*],

  [#builtin([`abs(`_content_`)`])],
  [],
  [`abs(phi(x))`   #sym.arrow $abs(phi(x))$],
  [absolute],

  [#builtin([`norm(`_content_`)`])],
  [],
  [`norm(phi(x))`   #sym.arrow $norm(phi(x))$],
  [norm],

  [`Order(`_content_`)`],
  [],
  [`Order(x^2)`   #sym.arrow $Order(x^2)$],
  [big O],

  [`order(`_content_`)`],
  [],
  [`order(1)`   #sym.arrow $order(1)$],
  [small O],

  [`Set(`_content_`)`],
  [],
  [
    `Set(a_n), Set(a_i, forall i)` \ #sym.arrow $Set(a_n), Set(a_i, forall i)$ \
    `Set(vec(1,n), forall n)` \ #sym.arrow $Set(vec(1,n), forall n)$
  ],
  [math set, use `Set` not `set` since the latter is a Typst keyword],

  [`evaluated(`_content_`)`],
  [],
  [
    `evaluated(f(x))_0^oo` \ #sym.arrow $evaluated(f(x))_0^oo$ \
    `evaluated(f(x)/g(x))_0^1` \ #sym.arrow $evaluated(f(x)/g(x))_0^1$
  ],
  [attach a vertical bar on the right to denote evaluation boundaries],

  [`expectationvalue`],
  [`expval`],
  [
    `expval(u)`  #sym.arrow $expval(u)$ \
    `expval(p,psi)`  #sym.arrow $expval(p,psi)$ \
  ],
  [expectation value, also see bra-ket @dirac-braket below],
)

== Vector notations

#v(1em)

#table(
  columns: (5fr, 2fr, auto, 5fr),
  align: left,
  stroke: none,
  [*Symbol*], [*Abbr.*], [*Example*], [*Notes*],

  [#builtin([`vec(`...`)`])],
  [],
  [`vec(1,2)` #sym.arrow $vec(1,2)$],
  [column vector],

  [`vecrow(`...`)`],
  [],
  [
    `vecrow(alpha, b)` \ #sym.arrow $vecrow(alpha, b)$ \
    `vecrow(sum_0^n i, b, delim:"[")` \ #sym.arrow $vecrow(sum_0^n i,b,delim:"[")$ \
  ],
  [row vector],

  [`TT`],
  [],
  [`v^TT, A^TT` #sym.arrow $v^TT, A^TT$],
  [transpose, also see\ @matrix-transpose],

  [`vectorbold(`_content_`)`],
  [`vb`],
  [`vb(a),vb(mu_1)` #sym.arrow $vb(a),vb(mu_1)$],
  [vector, bold],

  [`vectorunit(`_content_`)`],
  [`vu`],
  [`vu(a),vu(mu_1)` #sym.arrow $vu(a),vu(mu_1)$],
  [unit vector],

  [`vectorarrow(`_content_`)`],
  [`va`],
  [`va(a),va(mu_1)` #sym.arrow $va(a),va(mu_1)$],
  [vector, arrow \ #sub[(not bold: see ISO 80000-2:2019)]],

  [`grad`],
  [],
  [`grad f` #sym.arrow $grad f$],
  [gradient],

  [`div`],
  [],
  [`div vb(E)` #sym.arrow $div vb(E)$],
  [divergence],

  [`curl`],
  [],
  [`curl vb(B)` #sym.arrow $curl vb(B)$],
  [curl],

  [`laplacian`],
  [],
  [`diaer(u) = c^2 laplacian u` \ #sym.arrow $diaer(u) = c^2 laplacian u$],
  [Laplacian,\ not #builtin(`laplace`) $laplace$],

  [`dotproduct`],
  [`dprod`],
  [`a dprod b` #sym.arrow $a dprod b$],
  [dot product],

  [`crossproduct`],
  [`cprod`],
  [`a cprod b` #sym.arrow $a cprod b$],
  [cross product],

  [`innerproduct`],
  [`iprod`],
  [
    `iprod(u, v)` #sym.arrow $iprod(u, v)$ \
    `iprod(sum_i a_i, b)` \ #sym.arrow $iprod(sum_i a_i, b)$
  ],
  [inner product],
)

== Matrix notations

#v(1em)

=== Determinant, (anti-)diagonal, identity, zero matrix

#table(
  columns: (auto, auto, auto, auto),
  align: left,
  stroke: none,
  [*Symbol*], [*Abbr.*], [*Example*], [*Notes*],

  [`TT`],
  [],
  [`v^TT, A^TT` #sym.arrow $v^TT, A^TT$],
  [transpose, also see\ @matrix-transpose],

  [#builtin([`mat(`...`)`])],
  [],
  [`mat(1,2;3,4)` #sym.arrow $mat(1,2;3,4)$],
  [matrix],

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
    #hl(`dmat(1,a,xi,delim:"[",fill:0)`) \ #sym.arrow $dmat(1,a,xi,delim:"[",fill:0)$
  ],
  [diagonal matrix],

  [`antidiagonalmatrix(`...`)`],
  [`admat`],
  [
    `admat(1,2)` #sym.arrow $admat(1,2)$ \
    #hl(`admat(1,a,xi,delim:"[",fill:dot)`) \ #sym.arrow $admat(1,a,xi,delim:"[",fill:dot)$
  ],
  [anti-diagonal matrix],

  [`identitymatrix(`...`)`],
  [`imat`],
  [
    `imat(2)` #sym.arrow $imat(2)$ \
    #hl(`imat(3,delim:"[",fill:*)`) #sym.arrow \ $imat(3,delim:"[",fill:*)$
  ],
  [identity matrix],

  [`zeromatrix(`...`)`],
  [`zmat`],
  [
    `zmat(2)` #sym.arrow $zmat(2)$ \
    #hl(`zmat(3,delim:"[")`) #sym.arrow \ $zmat(3,delim:"[")$
  ],
  [zero matrix],
)

=== Jacobian matrix

`jacobianmatrix(`...`)`, i.e. `jmat(`...`)`.

#table(
  columns: (25%, auto, auto),
  align: center,
  stroke: none,
  column-gutter: 1em,

  [
    \ Typst (like LaTeX) \ cramps fractions in a matrix...
  ],
  [
    #hl(`jmat(f_1,f_2; x,y)`)
    $ jmat(f_1,f_2;x,y) $
  ],
  [
    #hl(`jmat(f,g; x,y,z; delim:"[")`)
    $ jmat(f,g;x,y,z;delim:"[") $
  ],
  [
    \ ...but you can uncramp them using argument #hl(`big:#true`) here
  ],
  [
    #hl(`jmat(f_1,f_2;x,y;big:#true)`)
    $ jmat(f_1,f_2;x,y;big:#true) $
  ],
  [
    #hl(`jmat(f,g;x,y,z;delim:"|",big:#true)`)
    $ jmat(f,g;x,y,z;delim:"|",big:#true) $
  ],
)

=== Hessian matrix

`hessianmatrix(`...`)`, i.e. `hmat(`...`)`.

#table(
  columns: (25%, auto, auto),
  align: center,
  stroke: none,
  column-gutter: 1em,

  [
    \ Typst (like LaTeX) \ cramps fractions in a matrix...
  ],
  [
    #hl(`hmat(f; x,y)`)
    $ hmat(f; x,y) $
  ],
  [
    #hl(`hmat(; x,y,z; delim:"[")`)
    $ hmat(; x,y,z; delim:"[") $
  ],
  [
    \ ...but you can uncramp them using argument #hl(`big:#true`) here
  ],
  [
    #hl(`hmat(f;x,y;big:#true)`)
    $ hmat(f;x,y;big:#true) $
  ],
  [
    #hl(`hmat(;x,y,z;delim:"|",big:#true)`)
    $ hmat(; x,y,z;delim:"|",big:#true) $
  ],
)

=== Matrix with an element builder

`xmatrix(`_m, n, func_`)`, i.e. `xmat(`...`)`. The element building function
_func_ takes two integers which are the row and column numbers starting from 1.

#table(
  columns: (auto, auto),
  align: left,
  stroke: none,
  column-gutter: 1em,

  [
#hl(`#let g = (i,j) => $g^(#(i - 1)#(j - 1))$
xmat(2, 2, #g)`)
    $ #let g = (i,j) => $g^(#(i - 1)#(j - 1))$
    xmat(2, 2, #g) $
  ],
)

=== Rotation matrices, 2D and 3D

#table(
  columns: (auto, auto, auto),
  align: center,
  stroke: none,
  column-gutter: 1em,

  [
    #hl(`rot2mat(theta)`)
    $ rot2mat(theta) $
  ],
  [
    #hl(`rot2mat(-a/2,delim:"[")`)
    $ rot2mat(-a/2, delim:"[") $
  ],
  [
    #hl(`rot2mat(display(a/2),delim:"[")`)
    $ rot2mat(display(a/2),delim:"[") $
  ],

  [
    #hl(`rot3xmat(theta)`)
    $ rot3xmat(theta) $
  ],
  [
    #hl(`rot3ymat(45^degree)`)
    $ rot3ymat(45^degree) $
  ],
  [
    #hl(`rot3zmat(theta,delim:"[")`)
    $ rot3zmat(theta,delim:"[") $
  ],
)

=== Gram matrix

#table(
  columns: (auto, auto, auto),
  align: center,
  stroke: none,
  column-gutter: 1em,

  [
    #hl(`grammat(alpha,beta)`)
    $ grammat(alpha, beta) $
  ],
  [
    #hl(`grammat(v_1,v_2,v_3, delim:"[")`)
    $ grammat(v_1,v_2,v_3, delim:"[") $
  ],
  [
    #hl(`grammat(v_1,v_2, norm:#true)`)
    $ grammat(v_1,v_2, norm:#true) $
  ],
)

== Dirac braket notations <dirac-braket>

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
    `bra(vec(1,2))` #sym.arrow $bra(vec(1,2))$
  ],
  [bra],

  [`ket(`_content_`)`],
  [],
  [
    `ket(u)`  #sym.arrow $ket(u)$ \
    `ket(vec(1,2))` #sym.arrow $ket(vec(1,2))$
  ],
  [ket],

  [`braket(`..`)`],
  [],
  [
    `braket(a), braket(u, v)` \ #sym.arrow $braket(a), braket(u, v)$ \
    `braket(psi,A/N,phi)` #sym.arrow $braket(psi,A/N,phi)$
  ],
  [braket, with 1, 2, or 3 arguments],

  [`ketbra(`..`)`],
  [],
  [
    `ketbra(a), ketbra(u, v)` \ #sym.arrow $ketbra(a), ketbra(u, v)$ \
    `ketbra(a/N, b)` #sym.arrow $ketbra(a/N, b)$
  ],
  [ketbra, with 1 or 2 arguments],

  [`expval(`_content_`)`],
  [],
  [
    `expval(u)`  #sym.arrow $expval(u)$ \
    `expval(A,psi)` #sym.arrow $expval(A,psi)$
  ],
  [expectation],

  [`matrixelement(`..`)`],
  [`mel`],
  [
    `mel(n, partial_nu H, m)` \ #sym.arrow $mel(n, partial_nu H, m)$
  ],
  [matrix element, same as `braket(n,M,n)`],
)

== Math functions

#v(1em)

Typst built-in math operators: #linkurl(`math.op`, "https://typst.app/docs/reference/math/op/").

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
  columns: (3fr, 3fr, 4fr),
  align: left,
  stroke: none,
  [*Expressions*], [*Results*], [*Notes*],

  [#builtin([`Pr(x)`])],
  [$Pr(x)$],
  [probability],

  [#builtin([`exp x`])],
  [$exp x$],
  [exponential],

  [#builtin([`log x, lg x, ln x`])],
  [$log x, lg x, ln x$],
  [logarithmic],
  
  [`lb x`],
  [$lb x$],
  [binary logarithm],

  [#builtin([`det A`])],
  [$det A$],
  [matrix determinant],

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
  [residue (complex analysis)],

  [`Re z, Im z `],
  [$Re z, Im z$],
  [real, imaginary (complex analysis)],

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
    e.g. $dd(f), dd(x,y), dd(x,3), dd(x,y,p:and)$ \
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

  [`difference(`...`)`],
  [],
  [
    `difference(f)` #sym.arrow $difference(f)$ \
    `difference(x,y)` #sym.arrow $difference(x,y)$ \
  ],
  [difference, shorthand of \ `dd(..., d: Delta)`],

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
    e.g. $pdv(,x), pdv(f,x), pdv(f,x,y,2), pdv(f,x,y,[2,3]), pdv(f,x,s:\/)$ \
    See @partial-derivatives
  ],
  [partial derivative, could be mixed order],
)

=== Differentials <differentials>

#v(1em)

Functions: `differential(`\*_args_, \*\*_kwargs_`)`, abbreviated as `dd(`...`)`.
- positional _args_: the variable names, *optionally* followed by an order number e.g. `2`, or an order array e.g. `[2,3]`, `[k]`, `[m n, lambda+1]`.
- named _kwargs_:
  - `d`: the differential symbol [default: `upright(d)`].
  - `p`: the product symbol connecting the components [default: `none`].
  - `compact`: only effective if `p` is `none`. If `#true`, will remove the TeXBook-advised thin spaces between the d-units [default: `#false`].

TeXBook advises _[f]ormulas involving calculus look best when an extra thin space
appears before dx or dy or d whatever_ (Chapter 18 p.168), and this package
heeds this advice. If you don't want the spaces between the d-units, you may
pass a `compact:#true` argument: $dd(r,theta) "vs." dd(r,theta,compact:#true)$ (compact).
// https://github.com/typst/typst/issues/147 advocates for set rules for
// non built-in functions. When that's implemented, user can do a
// #set dd(compact: true) to set this param for all dd() invocations.

*Order assignment algorithm:*
- If there is no order number or order array, all variables have order 1.
- If there is an order number (not an array), then this order number is assigned to _every_ variable, e.g. `dd(x,y,2)` assigns $x <- 2, y <- 2$.
- If there is an order array, then the orders therein are assigned to the variables in order, e.g. `dd(f,x,y,[2,3])` assigns $x <- 2, y <- 3$.
- If the order array holds fewer elements than the number of variables, then the orders of the remaining variables are 1, e.g. `dd(x,y,z,[2,3])` assigns $x <- 2, y <- 3, z <- 1$.
- If a variable $x$ has order 1, it is rendered as $upright(d) x$ not $upright(d)^1 x$.

#align(center, [*Examples*])

#grid(
  columns: (50%, 50%),
  row-gutter: 1em,
  column-gutter: 2em,

  [
    *(1)* #hl(`dd(f), f(r,theta) dd(r,theta)`) \
    $ dd(f), f(r,theta) dd(r,theta) $
  ],
  [
    *(2)* #hl(`dd(x,3), dd(f,[k]), dd(f,[k],d:delta)`) \
    $ dd(x,3), dd(f,[k]), dd(f,[k],d:delta) $
  ],
  [
    *(3)* #hl(`dd(f,2), dd(vb(x),t,[3,])`) \
    $ dd(f,2), dd(vb(x),t,[3,]) $
  ],
  [
    *(4)* #hl(`dd(x,y), dd(x,y,[2,3]), dd(x,y,z,[2,3])`) \
    $ dd(x,y), dd(x,y,[2,3]), dd(x,y,z,[2,3]) $
  ],
  [
    *(5)* #hl(`dd(x, y, z, [[1,1],rho+1,n_1])`) \
    $ dd(x, y, z, [[1,1],rho+1,n_1]) $
  ],
  [
    *(6)* #hl(`dd(x,y,d:Delta), dd(x,y,2,d:Delta)`) \
    $ dd(x,y,d:Delta), dd(x,y,2,d:Delta) $
  ],
  [
    *(7)* #hl(`dd(t,x_1,x_2,x_3,p:and)`) \
    $ dd(t,x_1,x_2,x_3,p:and) $
  ],
  [
    *(7)* #hl(`dd(t,x_1,x_2,x_3,d:upright(D))`) \
    $ dd(t,x_1,x_2,x_3,d:upright(D)) $
  ]
)

=== Ordinary derivatives <ordinary-derivatives>

#v(1em)

Function: `derivative(`_f_, \*_args_, \*\*_kwargs_`)`, abbreviated as `dv(`...`)`.
- _f_: the function, which can be `#none` or omitted,
- positional _args_: the variable name, *optionally* followed by an order number e.g. `2`,
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
    *(1)* #hl(`dv(,x), dv(,x,2), dv(f,x,k+1)`) \
    $ dv(,x), dv(,x,2), dv(f,x,k+1) $
  ],
  [
    *(2)* #hl(`dv(, vb(r)), dv(f, vb(r)_e, 2)`) \
    $ dv(, vb(r)), dv(, vb(r)_e, 2) $
  ],
  [
    *(3)* #hl(`dv(f,x,2,s:\/), dv(f,xi,k+1,s:slash)`) \
    $ dv(f,x,2,s:\/), dv(f,xi,k+1,s:slash) $
  ],
  [
    *(4)* #hl(`dv(, x, d:delta), dv(, x, 2, d:Delta)`) \
    $ dv(, x, d:delta), dv(, x, 2, d:Delta) $
  ],
  [
    *(5)* #hl(`dv(vb(u), t, 2, d: upright(D))`) \
    $ dv(vb(u), t, 2, d: upright(D)) $
  ],
  [
    *(6)* #hl(`dv(vb(u),t,2,d:upright(D),s:slash)`) \
    $ dv(vb(u),t,2,d:upright(D),s:slash) $
  ],
)

=== Partial derivatives (incl. mixed orders) <partial-derivatives>

#v(1em)

Function: `partialderivative(`_f_, \*_args_, \*\*_kwargs_`)`, abbreviated as `pdv(`...`)`.
- _f_: the function, which can be `#none` or omitted,
- positional _args_: the variable names, *optionally* followed by an order number e.g. `2`, or an order array e.g. `[2,3]`, `[k]`, `[m n, lambda+1]`.
- named _kwargs_:
  - `d`: the differential symbol [default: `partial`].
  - `s`: the "slash" separating the numerator and denominator [default: `none`], by default it produces the normal fraction form $pdv(f,x)$. The most common non-default is `slash` or simply `\/`, so as to create a flat form $pdv(f,x,s:\/)$ that fits inline.
  - `total`: the user-specified total order.
    - If it is absent, then (1) if the orders assigned to all variables are numeric, the total order number will be *automatically computed*; (2) if non-number symbols are present, computation will be attempted with minimum effort, and a user override with argument `total` may be necessary.

*Order assignment algorithm:*
- If there is no order number or order array, all variables have order 1.
- If there is an order number (not an array), then this order number is assigned to _every_ variable, e.g. `pdv(f,x,y,2)` assigns $x <- 2, y <- 2$.
- If there is an order array, then the orders therein are assigned to the variables in order, e.g. `pdv(f,x,y,[2,3])` assigns $x <- 2, y <- 3$.
- If the order array holds fewer elements than the number of variables, then the orders of the remaining variables are 1, e.g. `pdv(f,x,y,z,[2,3])` assigns $x <- 2, y <- 3, z <- 1$.
- If a variable $x$ has order 1, it is rendered as $x$, not $x^1$.

#align(center, [*Examples*])

#grid(
  columns: (50%, 50%),
  row-gutter: 1em,
  column-gutter: 2em,
  [
    *(1)* #hl(`pdv(,x), pdv(,t,2), pdv(,lambda,[k])`) \
    $ pdv(,x), pdv(,t,2), pdv(,lambda,[k]) $
  ],
  [
    *(2)* #hl(`pdv(f,vb(r)), pdv(phi,vb(r)_e,2)`) \
    $ pdv(phi,vb(r)), pdv(phi,vb(r)_e,2) $
  ],
  [
    *(3)* #hl(`pdv(,x,y), pdv(,x,y,2)`) \
    $ pdv(,x,y), pdv(,x,y,2) $
  ],
  [
    *(4)* #hl(`pdv(f,x,y,2), pdv(f,x,y,3)`) \
    $ pdv(phi,x,y,2), pdv(phi,x,y,3) $
  ],
  [
    *(5)* #hl(`pdv(,x,y,[2,]), pdv(,x,y,[1,2])`) \
    $ pdv(,x,y,[2,]), pdv(,x,y,[1,2]) $
  ],
  [
    *(6)* #hl(`pdv(,t,2,s:\/), pdv(f,x,y,s:slash)`) \
    $ pdv(,t,2,s:\/), pdv(f,x,y,s:slash) $
  ],
  [
    *(7)* #hl(`pdv(, (x^1), (x^2), (x^3), [1,3])`) \
    $ pdv(, (x^1), (x^2), (x^3), [1,3]) $
  ],
  [
    *(8)* #hl(`pdv(phi,x,y,z,tau, [2,2,2,1])`) \
    $ pdv(phi,x,y,z,tau, [2,2,2,1]) $
  ],
  [
    *(9)* #hl(`pdv(,x,y,z,t,[1,xi,2,eta+2])`) \
    $ pdv(,x,y,z,t,[1,xi,2,eta+2]) $
  ],
  [
    *(10)* #hl(`pdv(,x,y,z,[xi n,n-1],total:(xi+1)n)`) \
    $ pdv(,x,y,z,[xi n,n-1],total:(xi+1)n) $
  ],
  [
    *(11)* #hl(`pdv(S, phi.alt, phi.alt, d:delta)`) \
    $ pdv(S, phi.alt, phi.alt, d:delta) $
  ],
  [
    *(12)* #hl(`pdv(W[J], J^mu (x), J^nu (y), d:delta)`) \
    $ pdv(W[J], J^mu (x), J^nu (y), d:delta) $
  ]
)

*(13)* #hl(`integral_V dd(V) (pdv(cal(L), phi) - partial_mu (pdv(cal(L), (partial_mu phi)))) = 0`) \
$ integral_V dd(V) (pdv(cal(L), phi) - partial_mu (pdv(cal(L), (partial_mu phi)))) = 0 $

== Special show rules

#v(1em)

=== Matrix transpose with superscript T <matrix-transpose>

#v(1em)

Matrix transposition can be simply written as `..^T`, just like handwriting,
and the only superscript `T` will be formatted properly to represent
transposition instead of a normal capital letter $T$.

This $square.stroked.dotted^T => square.stroked.dotted^TT$
conversion is disabled if the base is either
- a `limits(...)` or `scripts(...)` element, or
- an integration $integral$ or sum $sum$ (not greek $Sigma$) or product $product$ (not greek $Pi$) or vertical bar $|$, or
- an equation or `lr(...)` element whose last child is one of the above.

Overrides: if you really want to
- print a transpose explicitly: use symbol `TT`: `A^TT` $=> A^TT$;
- print a superscript letter $T$: use `scripts(T)`: `2^scripts(T)` $=> 2^scripts(T)$.

This feature needs to be enabled explicitly through a _show rule_.
```typ
#show: super-T-as-transpose
(A B)^T = B^T A^T
```

If you only want to enable it within a content block's scope, you may do
```typ
#[
  #show: super-T-as-transpose // Enabled from here till the end of block.
  (A B)^T = B^T A^T
]
```

#align(center, [*Examples*])

#show: super-T-as-transpose  // Necessary!

#grid(
  columns: (auto, auto),
  row-gutter: 1em,
  column-gutter: 2em,

  [
    *(1)* #hl(`(U V_n W')^T = W'^T V_n^T U^T`) \
    $ (Sigma V_n W')^T = W'^T V_n^T Sigma^T  $
  ],
  [
    *(2)* #hl(`vec(a, b)^T, mat(a, b; c, d)^T`) \
    $ vec(a, b)^T, mat(a, b; c, d)^T $
  ],
  [
    *(3)* #hl(`abs(a)^T, norm(a)^T, evaluated(F(t))^T_0`) \
    $ abs(a)^T, norm(a)^T, evaluated(F(t))^T_0 $
  ],
  [
    *(4)* #hl(`integral^T, sum^T, product^T`) \
    $ integral^T, sum^T, product^T $
  ],
  [
    *(5)* #hl(`limits(e)^T, scripts(e)^T`) \
    $ limits(e)^T, scripts(e)^T $
  ],
  [
    *(6)* #hl(`(M+N)^T, (m+n)^scripts(T)`) \
    $ (M+N)^T, (m+n)^scripts(T) $
  ]
)

=== Matrix dagger with superscript +

The conjugate transpose, also known as the Hermitian transpose, transjugate, or
adjoint, of a complex matrix $A$ is performed by first transposing and then
complex-conjugating each matrix element. It is often denoted as $A^*$,
$A^upright(sans(H))$, and sometimes with a dagger symbol:
`A^dagger` $=> A^dagger$.

Writing `..^dagger` often visually clutters an equation in the source code form.
Therefore, the package offers the ability to write `..^+` instead.

This $square.stroked.dotted^+ => square.stroked.dotted^dagger$ conversion is
disabled if the base is either
- a `limits(...)` or `scripts(...)` element, or
- an equation or `lr(...)` element whose last child is one of the above.

This feature needs to be enabled explicitly through a _show rule_.
```typ
#show: super-plus-as-dagger
U^+U = U U^+ = I
```

If you only want to enable it within a content block's scope (e.g. you want
to have $square.stroked.dotted^+$ for ions or Moore–Penrose inverse outside the
block), you may do
```typ
#[
  #show: super-plus-as-dagger // Enabled from here till the end of block.
  U^+U = U U^+ = I
]
```

Overrides: if you really want to
- print a dagger explicitly: use the built-in symbol `dagger` as normal: `A^dagger` $=> A^dagger$;
- print a superscript plus sign: use `scripts(+)`: `A^scripts(+)` $=> A^scripts(+)$.

#align(center, [*Examples*])

#show: super-plus-as-dagger  // Necessary!

#grid(
  columns: (auto, auto),
  row-gutter: 1em,
  column-gutter: 2em,

  [
    *(1)* #hl(`U^+U = U U^+ = I`) \
    $ U^+U = U U^+ = I  $
  ],
  [
    *(2)* #hl(`mat(1+i,1;2-i,1)^+ = mat(1-i,2+i;1,1)`) \
    $ mat(1+i,1;2-i,1)^+ = mat(1-i,2+i;1,1) $
  ],
  [
    *(3)* #hl(`limits(N)^+, scripts(N)^+`) \
    $ limits(N)^+, scripts(N)^+ $
  ],
  [
    *(4)* #hl(`#let eq = $scripts(N)$; eq^+`) \
    $ #let eq = $scripts(N)$; eq^+ $
  ],
)

== Miscellaneous

#v(1em)

=== Reduced Planck constant (hbar)

#v(1em)

In the default font, the Typst built-in symbol `planck.reduce` $planck.reduce$ looks a bit off: on letter "h" there is a slash instead of a horizontal bar, contrary to the symbol's colloquial name "h-bar". This package offers `hbar` to render the symbol in the familiar form: $hbar$. Contrast:

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

*Known limitation*: `hbar` uses the `strike` function, and show rules of `strike` will affect `hbar`.
Therefore, you may have to revert your show rules for `hbar`. The following is an example.
// There hardly exists a robust fix before https://github.com/typst/typst/issues/420 is resolved.

#raw(
  ```typst
  #import "@preview/physica:{VERSION}": hbar as old-hbar

  #show strike: set text(gray)
  #let hbar = {
    show strike: set text(black)
    old-hbar
  }

  $hbar$ is black, while $#old-hbar$ is gray.
  ```.text.replace("{VERSION}", version),
  lang: "typst",
)

=== Tensors

#v(1em)

Tensors are often expressed using the #linkurl("abstract index notation", "https://en.wikipedia.org/wiki/Abstract_index_notation"), which makes the contravariant and covariant "slots" explicit. The intuitive solution of using superscripts and subscripts do not suffice if both upper (contravariant) and lower (covariant) indices exist, because the notation rules require the indices be vertically separated: e.g. $tensor(T,+a,-b)$ and $tensor(T,-a,+b)$, which are of different shapes. "$T^a_b$" is flatly wrong, and `T^(space w)_(i space j)` produces a weird-looking "$T^(space w)_(i space j)$" (note $w,j$ vertically overlap).

Function: `tensor(`_symbol_, \*_args_`)`.
- _symbol_: the tensor symbol,
- positional _args_: each argument takes the form of $+dots.h$ or $-dots.h$, where a `+` prefix denotes an upper index and a `-` prefix denotes a lower index.

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
    *(7)* #hl(`tensor(R, -a, -b, +d)`) \
    $ tensor(R, -a, -b, +d) $
  ],
  [
    *(8)* #hl(`tensor(T,+1,-I(1,-1),+a_bot,-+,+-)`) \
    $ tensor(T,+1,-I(1,-1),+a_bot,-+,+-) $
  ],
)

*(9)* `grad_mu A^nu = partial_mu A^nu + tensor(Gamma,+nu,-mu,-lambda) A^lambda`
$ grad_mu A^nu = partial_mu A^nu + tensor(Gamma,+nu,-mu,-lambda) A^lambda $

=== Isotopes

#v(1em)

Function: `isotope(`_element_, _a_: ..., _z_: ...`)`.
- _element_: the chemical element (use `".."` for multi-letter symbols)
- _a_: the mass number _A_ [default: `none`].
- _z_: the atomic number _Z_ [default: `none`].

*Change log*: Typst merged my #linkurl("PR", "https://github.com/typst/typst/pull/825"), which fixed a misalignment issue with the surrounding text.

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

*(3)* #hl(`isotope("Bi",a:211,z:83) -> isotope("Tl",a:207,z:81) + isotope("He",a:4,z:2)`)
$ isotope("Bi",a:211,z:83) -> isotope("Tl",a:207,z:81) + isotope("He",a:4,z:2) $

*(4)* #hl(`isotope("Tl",a:207,z:81) -> isotope("Pb",a:207,z:82) + isotope(e,a:0,z:-1)`)
$ isotope("Tl",a:207,z:81) -> isotope("Pb",a:207,z:82) + isotope(e,a:0,z:-1) $

=== The n-th term in Taylor series

#v(1em)

Function: `taylorterm(`_func_, _x_, _x0_, _idx_`)`.
- _func_: the function e.g. `f`, `(f+g)`,
- _x_: the variable name e.g. `x`,
- _x0_: the variable value at the expansion point e.g. `x_0`, `(1+a)`,
- _idx_: the index of the term, e.g. `0`, `1`, `2`, `n`, `(n+1)`.
If _x0_ or _idx_ is an add/sub sequence e.g. `-a`, `a+b`, then the function
automatically adds a parenthesis where appropriate.

#align(center, [*Examples*])

#grid(
  columns: (50%, 50%),
  row-gutter: 1em,
  column-gutter: 2em,
  [
    *(1)* #hl(`taylorterm(f,x,x_0,0)`) \
    $ taylorterm(f,x,x_0,0) $
  ],
  [
    *(2)* #hl(`taylorterm(f,x,x_0,1)`) \
    $ taylorterm(f,x,x_0,1) $
  ],
  [
    *(3)* #hl(`taylorterm(F,x^nu,x^nu_0,n)`) \
    $ taylorterm(F,x^nu,x^nu_0,n) $
  ],
  [
    *(4)* #hl(`taylorterm(f,x,x_0,n)`) \
    $ taylorterm(f,x,x_0,n) $
  ],
  [
    *(5)* #hl(`taylorterm(f,x,1+a,2)`) \
    $ taylorterm(f,x,1+a,2) $
  ],
  [
    *(6)* #hl(`taylorterm(f_p,x,x_0,n-1)`) \
    $ taylorterm(f_p,x,x_0,n-1) $
  ],
)


=== Signal sequences (digital timing diagrams)

In engineering, people often need to draw digital timing diagrams for signals, like $signals("1|0|1|0")$.

Function: `signals(str`, `step:`:..., `style`:...`)`.
- `str`: a string representing the signals. Each character represents an glyph (see below).
- `step` (optional): step width, i.e. how wide each glyph is [default: `#1em`].
- `color` (optional): the stroke color [default: `#black`].

#align(center, [*Glyph characters*])

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  row-gutter: 1em,
  column-gutter: 2em,

  [`HLM` #sym.arrow.l.r.double `"10-"` #text(size: 0.5em, [full step]) \ $ signals("HLM&10-") $],
  [`hlm ^v` #text(size: 0.5em, [1/2 step, 1/10 step])  \ $ signals("hlm&^v") $],
  [`| ' ,` (edge) #text(size: 0.5em, [0 step]) \ $ signals("|&'&,") $],
  [`= #` #text(size: 0.5em, [empty, shaded]) \ $ signals("=&#") $],

  [`R` (rise) \ $ signals("R") $],
  [`F` (fall) \ $ signals("F") $],
  [`C` (charge) \ $ signals("C") $],
  [`D` (drain) \ $ signals("D") $],

  [`<` \ $ signals("<") $],
  [`>` \ $ signals(">") $],
  [`X` \ $ signals("X") $],
  [],

  [ignore: (blankspace) \ separate: `&`],
  [repeat: `.` (dot)],
)

#align(center, [*Examples*])

*(1)* `signals("10.1"), signals("1|0|1|0R"), signals("CD"), signals("CD", step: #2em)`
$ signals("10.1"), signals("1|0|1|0R"), signals("CD"), signals("CD", step: #2em) $

*(2)* `signals("M'H|L|h|l|^|v,&|H'M'H|l,m,l|")` (the ampersand `&` serves as a separator)
$ signals("M'H|L|h|l|^|v,&|H'M'H|l,m,l|") $

*(3)* `signals("-|=|-", step: #2em), signals("-|#|-"), signals("-<=>-<=")`
$ signals("-|=|-", step: #2em), signals("-|#|-"), signals("-<=>-<=") $

*(4)* `signals("R1..F0..", step: #.5em)signals("R1.|v|1", step: #.5em, color:#fuchsia)`
$ signals("R1..F0..", step: #.5em)signals("R1.|v|1", step: #.5em, color:#fuchsia) $

*(5)*
```typst
"clk:" & signals("|1....|0....|1....|0....|1....|0....|1....|0..", step: #0.5em) \
"bus:" & signals(" #.... X=... ..... ..... X=... ..... ..... X#.", step: #0.5em)
```
$
"clk:" & signals("|1....|0....|1....|0....|1....|0....|1....|0..", step: #0.5em) \
"bus:" & signals(" #.... X=... ..... ..... X=... ..... ..... X#.", step: #0.5em)
$

== Symbolic addition

#v(1em)

This package implements a very rudimentary, *bare-minimum-effort* symbolic addition function to aid the automatic computation of a partial derivative's total order in the absence of user override (see @partial-derivatives). Though rudimentary and unsophisticated, this should suffice for most use cases in partial derivatives.

Function: `BMEsymadd([`...`])`.
- `...`: symbols that need to be added up e.g. `[1,2]`, `[a+1,b^2+1,2]`.

#align(center, [*Examples*])

#grid(
  columns: (auto, auto, auto),
  row-gutter: 1em,
  column-gutter: 2em,

  [*(1)* #hl(`BMEsymadd([1]), BMEsymadd([2, 3])`)],
  [#sym.arrow],
  [$BMEsymadd([1]), BMEsymadd([2, 3])$],

  [*(2)* #hl(`BMEsymadd([a, b^2, 1])`)],
  [#sym.arrow],
  [$BMEsymadd([a, b^2, 1])$],

  [*(3)* #hl(`BMEsymadd([a+1,2c,b,2,b])`)],
  [#sym.arrow],
  [$BMEsymadd([a+1,2c,b,2,b])$],

  [*(4)* #hl(`BMEsymadd([a+1,2(b+1),1,b+1,15])`)],
  [#sym.arrow],
  [$BMEsymadd([a+1,2(b+1),1,b+1,15])$],

  [*(5)* #hl(`BMEsymadd([a+1,2(b+1),1,(b+1),15])`)],
  [#sym.arrow],
  [$BMEsymadd([a+1,2(b+1),1,(b+1),15])$],

  [*(6)* #hl(`BMEsymadd([a+1,2(b+1),1,3(b+1),15])`)],
  [#sym.arrow],
  [$BMEsymadd([a+1,2(b+1),1,3(b+1),15])$],

  [*(7)* #hl(`BMEsymadd([2a+1,xi,b+1,a xi + 2b+a,2b+1])`)],
  [#sym.arrow],
  [$BMEsymadd([2a+1,xi,b+1,a xi + 2b+a,2b+1])$],
)

#pagebreak()

= Acknowledgement

#v(1em)

Huge thanks to these LATEX packages, for lighting the way of physics typesetting.
- `physics` by Sergio C. de la Barrera,
- `derivatives` by Simon Jensen,
- `tensor` by Philip G. Ratcliffe et al.

= License

Source code:
#sym.copyright Copyright 2023 Leedehai. See the license
#linkurl("here", "https://github.com/Leedehai/typst-physics/blob/master/LICENSE.txt").

The document:
Creative Commons Attribution-NoDerivatives 4.0 license (#linkurl("CC BY-ND 4.0", "https://creativecommons.org/licenses/by-nd/4.0/legalcode")).
