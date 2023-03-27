// Copyright 2023 Leedehai
// Use of this code is governed by a MIT license in the LICENSE.txt file.
// For a manual on this package, see manual.pdf.

// == Braces

#let Set(..sink) = {
  let args = sink.pos()  // array
  let expr = if args.len() >= 1 { args.at(0) } else { none }
  let cond = if args.len() >= 2 { args.at(1) } else { none }

  if expr == none {
    if cond == none { ${}$ } else { $lr({|#cond})$ }
  } else {
    if cond == none { $lr({#expr})$ } else { $lr({#expr | #cond})$ }
  }
}

#let order(content) = $cal(O)(content)$

#let evaluated(content) = {
  $lr(zwj#content|)$
}
#let eval = evaluated

#let expectationvalue(f) = $lr(angle.l #f angle.r)$
#let expval = expectationvalue

// == Vector notations

#let vecrow(..content) = $lr(( #content.pos().join(",") ))$

#let TT = $sans(upright(T))$

#let vectorbold(a) = $bold(italic(#a))$
#let vb = vectorbold

#let vectorarrow(a) = $arrow(bold(italic(#a)))$
#let va = vectorarrow

#let vectorunit(a) = $accent(bold(italic(#a)), hat)$
#let vu = vectorunit

#let gradient = $bold(nabla)$
#let grad = gradient

#let divergence = $bold(nabla)dot.c$
#let div = divergence

#let curl = $bold(nabla)times$

#let laplacian = $nabla^2$

#let dotproduct = $dot.op$
#let crossproduct = $times$

// == Matrices

#let diagonalmatrix(..sink) = {
  let args = sink.pos()  // array
  let kwargs = sink.named()  // dictionary

  let delim = if "delim" in kwargs { kwargs.at("delim") } else { "(" }

  let arrays = ()  // array of arrays
  let n = args.len()
  for i in range(n) {
    let array = range(n).map((j) => {
      let e = if j == i { args.at(i) } else { 0 }
      return e
    })
    arrays.push(array)
  }
  math.mat(delim: delim, ..arrays)
}
#let dmat = diagonalmatrix

#let antidiagonalmatrix(..sink) = {
  let args = sink.pos()  // array
  let kwargs = sink.named()  // dictionary

  let delim = if "delim" in kwargs { kwargs.at("delim") } else { "(" }

  let arrays = ()  // array of arrays
  let n = args.len()
  for i in range(n) {
    let array = range(n).map((j) => {
      let complement = n - 1 - i
      let e = if j == complement { args.at(i) } else { 0 }
      return e
    })
    arrays.push(array)
  }
  math.mat(delim: delim, ..arrays)
}
#let admat = antidiagonalmatrix

#let identitymatrix(order, delim:"(") = {
  assert(type(order) == "integer", message: "expecting an integer e.g. #3")

  let ones = range(order).map((i) => 1)
  diagonalmatrix(..ones, delim: delim)
}
#let imat = identitymatrix

#let zeromatrix(order, delim:"(") = {
  assert(type(order) == "integer", message: "expecting an integer e.g. #3")

  let ones = range(order).map((i) => 0)
  diagonalmatrix(..ones, delim: delim)
}
#let zmat = zeromatrix

#let matrixdet(..sink) = {
  math.mat(..sink, delim:"|")
}
#let mdet = matrixdet

// == Dirac braket notations

#let bra(f) = $lr(angle.l #f bar.v)$
#let ket(f) = $lr(bar.v #f angle.r)$

#let braket(f, g) = $lr(angle.l #f|#g angle.r)$ // Do not replace "|" with "bar.v" -- takes up too much width
#let ketbra(f, g) = $lr(bar.v #f angle.r) lr(angle.l #g bar.v)$

#let innerproduct(f, g) = { braket(f, g) }
#let iprod = innerproduct

#let outerproduct(f, g) = { ketbra(f, g) }
#let oprod = outerproduct

#let matrixelement(n, M, m) = $lr(angle.l #n lr(|#M|) #m angle.r)$
#let mel = matrixelement

// == Math functions

#let sin = $op("sin")$
#let sinh = $op("sinh")$
#let arcsin = $op("arcsin")$
#let asin = $op("asin")$

#let cos = $op("cos")$
#let cosh = $op("cosh")$
#let arccos = $op("arccos")$
#let acos = $op("acos")$

#let tan = $op("tan")$
#let tanh = $op("tanh")$
#let arctan = $op("arctan")$
#let atan = $op("atan")$

#let sec = $op("sec")$
#let sech = $op("sech")$
#let arcsec = $op("arcsec")$
#let asec = $op("asec")$

#let csc = $op("csc")$
#let csch = $op("csch")$
#let arccsc = $op("arccsc")$
#let acsc = $op("acsc")$

#let cot = $op("cot")$
#let coth = $op("coth")$
#let arccot = $op("arccot")$
#let acot = $op("acot")$

#let diag = math.op("diag")

#let trace = $op("trace")$
#let tr = $op("tr")$
#let Trace = $op("Trace")$
#let Tr = $op("Tr")$

#let rank = $op("rank")$
#let erf = $op("erf")$
#let Res = $op("Res")$

#let Re = $op("Re")$
#let Im = $op("Im")$

#let sgn = $op("sgn")$

// == Differentials

// Given a Content generated from lr(), return the array of sub Content objects.
// Example: "(1,a_1,(1,1),n+1)" => "1", "a_1", "(1,1)", "n+1"
#let __extract_array_contents(content) = {
  if content.func() != math.lr { return none }
  // A Content object made by lr() definitely has a "body" field, and a
  // "children" field underneath it. It holds an array of Content objects,
  // starting with a Content holding "(" and ending with a Content holding ")".
  let children = content.at("body").at("children")

  // "a_1", "(1,1)" are all recognized as one AST node, respectively,
  // because they are syntactically meaningful in Typst. However, things like
  // "a+b", "a*b" are recognized as 3 nodes, respectively, because in Typst's
  // view they are just plain sequences of symbols. We need to join the symbols.
  let current_element_pieces = ()  // array of Content objects
  let elements = ()  // array of Content objects

  for i in range(1, children.len() - 1) { // Skip "(", ")" of the lr() content
    let e = children.at(i)
    if e == [,] {
      if current_element_pieces.len() > 0 {
        elements.push(current_element_pieces.join())
        current_element_pieces = ()
      }
      continue;
    }
    if e == [ ] { continue; }
    current_element_pieces.push(e)
  }
  if current_element_pieces.len() > 0 {
    elements.push(current_element_pieces.join())
    current_element_pieces = ()
  }

  return elements;
}

#let differential(..sink) = {
  let args = sink.pos()  // array
  let kwargs = sink.named()  // dictionary

  let orders = ()
  let default_order = 1
  if "n" in kwargs {
    let value = kwargs.at("n")
    if type(value) == "content" {
      if value.func() == math.lr {
        orders = __extract_array_contents(value)  // array
      } else {
        default_order = value  // treat as a single element
        orders.push(default_order)
      }
    } else {
      default_order = value  // treat as a single element
      orders.push(default_order)
    }
  }

  let dsym = if "d" in kwargs {
    kwargs.at("d")
  } else {
    $upright(d)$
  }

  let prod = if "p" in kwargs {
    kwargs.at("p")
  } else {
    none
  }

  let difference = args.len() - orders.len()
  while difference > 0 {
    orders.push(default_order)
    difference -= 1
  }

  let arr = ()
  for i in range(args.len()) {
    let var = args.at(i)
    let order = orders.at(i)
    if order != 1 {
      arr.push($dsym^#order #var$)
    } else {
      arr.push($dsym #var$)
    }
  }
  $#arr.join(prod)$
}
#let dd = differential

#let variation = dd.with(d: sym.delta)
#let var = variation

#let derivative(f, ..sink) = {
  if f == [] { f = none }  // Convert empty content to none

  let args = sink.pos()  // array
  let kwargs = sink.named()  // dictionary
  assert(args.len() > 0, message: "variable name expected")

  let d = if "d" in kwargs { kwargs.at("d") } else { $upright(d)$ }
  let slash = if "s" in kwargs { kwargs.at("s") } else { none }

  let var = args.at(0)
  assert(args.len() >= 1, message: "expecting at least one argument")

  let display(num, denom, slash) = {
    if slash == none {
      $#num/#denom$
    } else {
      let sep = (sym.zwj, slash, sym.zwj).join()
      $#num#sep#denom$
    }
  }

  if args.len() >= 2 {
    let n = args.at(1)  // Not necessarily representing a number
    let upper = if f == none { $#d^#n$ } else { $#d^#n #f$ }
    display(upper, $#d #var^#n$, slash)
  } else {
    let upper = if f == none { $#d$ } else { $#d #f$ }
    display(upper, $#d #var$, slash)
  }
}
#let dv = derivative

#let partialderivative(..sink) = {
  let args = sink.pos()  // array
  let kwargs = sink.named()  // dictionary
  assert(args.len() >= 2, message: "at least one function name and one variable name")

  let f = args.at(0)
  if f == [] { f = none }  // Convert empty content to none
  let var_num = args.len() - 1
  let orders = ()
  let default_order = 1

  // The last argument might be the order numbers, let's check.
  let last = args.at(args.len() - 1)
  if type(last) == "array" {
    var_num -= 1
    orders = last  // array
  } else if type(last) == "integer" {
    var_num -= 1
    default_order = last
    orders.push(default_order)
  }

  let difference = var_num - orders.len()
  while difference > 0 {
    orders.push(default_order)
    difference -= 1
  }

  let lowers = ()
  let total_order = 0
  for i in range(var_num) {
    let v = args.at(1 + i)  // 1st element is the function name
    let order = orders.at(i)
    assert(order > 0, message: "an order number must be positive")
    total_order += order
    if order == 1 {
      lowers.push($diff #v$)
    } else {
      lowers.push($diff #v^#order$)
    }
  }

  let upper = if total_order > 1 {
    if f == none { $diff^#total_order$ } else { $diff^#total_order #f$ }
  } else {
    if f == none { $diff$ } else { $diff #f$ }
  }

  let display(num, denom, slash) = {
    if slash == none {
      math.frac(num, denom)
    } else {
      let sep = (sym.zwj, slash, sym.zwj).join()
      $#num#sep#denom$
    }
  }

  let slash = if "s" in kwargs { kwargs.at("s") } else { none }
  display(upper, lowers.join(), slash)
}
#let pdv = partialderivative

// == Miscellaneous

// With the default font, the original symbol `planck.reduce` has a slash on the
// letter "h", and it is different from the usual "hbar" symbol, which has a
// horizontal bar on the letter "h".
//
// Here, we manually create a "hbar" symbol by adding the font-independent
// horizontal bar produced by strike() to the current font's Planck symbol, so
// that the new "hbar" symbol and the existing Planck symbol look similar in any
// font (not just "New Computer Modern").
//
// However, strike() causes some side effects in math mode: it shifts the symbol
// downward. This seems like a Typst bug. Therefore, we need to use move() to
// eliminate those side effects so that the symbol behave nicely in math
// expressions.
//
// We also need to use wj (word joiner) to eliminate the unwanted horizontal
// spaces that manifests when using the symbol in math mode.
//
// Credit: Enivex in https://github.com/typst/typst/issues/355 was very helpful.
#let hbar = (sym.wj, move(dy: -0.08em, strike(offset: -0.55em, extent: -0.05em, sym.planck)), sym.wj).join()

#let tensor(T, ..sink) = {
  let args = sink.pos()

  let uppers = ()
  let lowers = ()
  let hphantom(s) = { hide(box(height: 0em, s)) }  // Like Latex's \hphantom

  for i in range(args.len()) {
    let arg = args.at(i)
    let tuple = if arg.has("children") == true {
      arg.at("children")
    } else {
      ([+], sym.square)
    }
    assert(type(tuple) == "array", message: "shall be array")
    let pos = tuple.at(0)
    let symbol = if tuple.len() >= 2 {
      tuple.slice(1).join()
    } else {
      sym.square
    }
    if pos == [+] {
      let rendering = $#symbol$
      uppers.push(rendering)
      lowers.push(hphantom(rendering))
    } else {  // Curiously, equality with [-] is always false, so we don't do it
      let rendering = $#symbol$
      uppers.push(hphantom(rendering))
      lowers.push(rendering)
    }
  }

  // Do not use "...^..._...", because the lower indices appear to be placed
  // slightly lower than a normal subscript.
  // Use a phantom with zwj (zero-width word joiner) to vertically align the
  // starting points of the upper and lower indices. Also, we put T inside
  // the first argument of attach(), so that the indices' vertical position
  // auto-adjusts with T's height.
  math.attach((T,hphantom(sym.zwj)).join(), top: uppers.join(), bottom: lowers.join())
}

#let isotope(element, /*atomic mass*/a: none, /*atomic number*/z: none) = {
  style(styles => {
    let size = measure([0], styles)  // The reference
    // Use a right-aligned table to have the numbers aligned on the right.
    // Did try using box(width: ..., align(right, ...)), but it unexpectedly
    // shifts indices downward.
    let tab = table(
      align: right, gutter: 0em, stroke: none,
      columns: (auto,), rows: size.height, inset: 0em,
      [#text(size: size.height, a)], [#text(size: size.height, z)],
    )
    $#tab#math.upright(element)$
  })
}

// Add symbol definitions to the corresponding sections. Do not simply append
// them at the end of file.
