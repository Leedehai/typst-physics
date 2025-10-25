# Changelog

## 0.9.7

* **(breaking)** In derivative `dv` and partial derivative `pdv`, rename
argument `s` to `style`. For the original argument value `s:\/`, write
`style:"horizontal"` instead, just like what you would write in
[`math.frac`](https://staging.typst.app/docs/reference/math/frac/) starting from
Typst 0.14.0.
* **(breaking)** In differential `dd`, rename argument `p` to `prod`.
* Fix isotope so that it can also be rendered in text mode (#71)
* Make hbar based on `U+210e` directly instead of on `sym.planck`, because since
Typst 0.14.0 `sym.planck` is the reduced Planck constant, taking the place of
the deprecated `sym.planck.reduced` (#67)
* Replace `angle.r` and `angle.l` with `chevron.r` and `chevron.l`, as required
by the deprecation notice of Typst 0.14.0.

## 0.9.6

* Fix differential's smart spacing -- though this space is recommended by
TeXBook, it creates a bug https://github.com/Leedehai/typst-physics/issues/63.
* *Adding rising and falling edge support (#62)
* Allow passing multiple conditions to Set by using the array syntax (#59)

## 0.9.5

* Fix [Issue #45](https://github.com/Leedehai/typst-physics/issues/45) and
[Issue #47](https://github.com/Leedehai/typst-physics/issues/47) caused
by the new release of Typst 0.13.
* Replace the call sites of the deprecated Typst builtin `path` with `curve`.
* Remove the space in `pdv`'s numerator that appears when the function name is
text.
* Add a `"large"` slash option to ordinary and partial derivatives, in which
the d/dx operator is put in front of the (potentially very large) function.
* **(breaking)** Remove `eval` (the abbreviation of `evaluated`) to avoid
colliding with Typst. `evaluated` still remains available.

## 0.9.4

* Add binary logarithm `lb`.
* Make the differential symbol of `pdv` (partial derivative) customizable.
* Let `tensor` show everything as a superscript if no `+` or `-` is given.
* Documentation improvements; internal refactorings and cleanups.

## 0.9.3

* Add `delim` to `vecrow(..)` to specify the delimiter.

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
* **(breaking)** Removed `gradient` and `divergence`, since most users will use
the abbreviated names `grad` and `div`. This prevents name collisions when users
do wildcard importing, especially with Typst's built-in `gradient` that shows
color gradients on texts.

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
