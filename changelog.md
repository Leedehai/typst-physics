# Changelog

## 0.9.2

* Let `braket()` take an optional third argument to render `braket(u,A,v)` as
`⟨u|A|v⟩`. The one argument case `braket(a)` is still rendered as `⟨a|a⟩` and
the two argument case `braket(u,v)` is still rendered as `⟨u|v⟩`.
* Let `expval()` take an optional second argument to render `expval(A,a)` as
`⟨a|A|a⟩`. The one argument case `expval(A)` is still rendered as `⟨A⟩`.
* **(breaking)** Differentiated big-O `Order(...)` and little-o `order(...)`.
* Let Taylor series term `taylorterm(...)` automatically add parenthesis, so
that e.g. `tarlorterm(f,x,1+a,n-1)`'s `1+a` and `n-1` can be put inside
parenthesis when needed.
* Fixed a rendering issue of `Set(...)` when it contains tall contents.
* Removed the `box(..)` layer from `tensor(...)`'s phantom index.
* Added 2D and 3D rotation matrix `rot2mat(...)` and `rot3mat(...)`.
* Added Gram matrix `grammat(...)`.
* Removed `gradient` and `divergence`, since most users will use the abbreviated
names `grad` and `div`. This prevents name collisions when users do wildcard
importing, especially with Typst's built-in `gradient` that shows color
gradients on texts.

## 0.9.1

* Added show rules `super-T-as-transpose` and `super-plus-as-dagger`, so that
`..^T` and `..^+` can be rendered as a transpose operator and a dagger
(i.e. conjugate transpose) operator, respectively, just like handwriting.
* Adjusted spacing for `dd()`, following advice in TeXBook Chapter 18. The
intra spacing can be disabled by a new optional argument `compact:#true`.
* Fixed a spacing issue of `vecrow(..)`.
* **(breaking)** Let `iprod(..)` be rendered in the more familiar inner
product `⟨a,b⟩`, instead of `⟨a|b⟩`--that can be done with `braket(a,b)`.
* Added optional argument `big:#true` to Jacobian matrix and Hessian matrix, so
that the fractions can be rendered in an "uncramped" form. The default is the
"cramped" form just like LaTeX.
* Added `taylorterm(...)` to display terms in the Taylor series.

## 0.9.0

Changed the minimum Typst version to 0.10.0.

* Fixed the appearance of `braket`, `ketra`, and `mel`.
* Fixed Hessian matrix `hmax(...)`.

## 0.8.1

## 0.8.0

* Added CI.
* **(breaking)** Let `va(...)` (vector arrow) be not bold, according to the ISO
standard.

## 0.7.5

* First appeared in the official package collection
[typst/packages](https://github.com/typst/packages).

## 0.7.4

* Renamed from `physics` to `physica`, meaning _natural sciences_.

## 0.7.1

## 0.6

## 0.5
