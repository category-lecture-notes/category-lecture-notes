#import "theorems.typ": thmbox

// Prevent using fraction
#let quotient(numerator, denominator) = { numerator; "/"; denominator }

#let dual(x) = $#x^"op"$
#let iso = $tilde.rev.eqq$
#let equiv = $tilde.eq$

#let cat = $cal(C)$
#let cat2 = $cal(D)$
#let pset = $cal(P)$

#let Set = $bold("Set")$
#let Grp = $bold("Grp")$
#let Groupoid = $bold("Grpd")$
#let Ring = $bold("Ring")$
#let Top = $bold("Top")$
#let Cat = $bold("Cat")$

#let remark = thmbox("remark", "Remark")
#let warning = thmbox("remark", "Warning")

#let definition = thmbox("definition", "Definition")
#let example = thmbox("definition", "Example")
#let property = thmbox("definition", "Property")

#let theorem = thmbox("theorem", "Theorem")
#let lemma = thmbox("theorem", "Lemma")

#let proof(content) = {
    [_Proof. _];
    content;
    place(right, $square.stroked.big$)
}
