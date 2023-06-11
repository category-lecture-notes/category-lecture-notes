#import "../deps/typst-theorems/theorems.typ": thmbox

// Prevent using fraction
#let quotient(numerator, denominator) = { numerator; "/"; denominator }

// Common groups
#let Cat = $bold("Cat")$
#let Groupoid = $bold("Grpd")$
#let Grp = $bold("Grp")$
#let Ring = $bold("Ring")$
#let Set = $bold("Set")$
#let Top = $bold("Top")$

// Common functions
#let pset = $cal(P)$

// Common categories functions
#let cat(x) = $cal(#x)$
#let dual(x) = $#x^"op"$

#let iso = $tilde.eqq$
#let equiv = $tilde.eq$

// Common numbered boxes
#let definition = thmbox("box", "Definition")
#let example = thmbox("box", "Example")
#let lemma = thmbox("box", "Lemma")
#let property = thmbox("box", "Property")
#let theorem = thmbox("box", "Theorem")

#let remark = thmbox("box", "Remark")
#let warning = thmbox("box", "Warning")

#let proof(content) = {
  [_Proof. _]
  content; h(1fr)
  $square.stroked.big$
}
