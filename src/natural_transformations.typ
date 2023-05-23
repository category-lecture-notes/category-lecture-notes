#import "lib.typ": *
#import "typst-cd.typ": node, arr, commutative_diagram

= Natural Transformations

#definition[
    (Natural transformation). Let $F, G : cat -> cat2$ be two functors.
    
    A _natural transformation_ $alpha$ between $F$ and $G$ is a family of arrows $(alpha_c : F c -> G c)_(c in cat)$ such that for all $x, y in cat$ and $f in cat(x, y)$ the following diagram commutes (_i.e._ $G f alpha_x = alpha_y F f$):

    #align(center)[#commutative_diagram(
        node((0, 0), [$F x$]),
        node((0, 1), [$G x$]),
        node((1, 0), [$F y$]),
        node((1, 1), [$G y$]),
        arr((0, 0), (0, 1), [$alpha_x$]),
        arr((1, 0), (1, 1), [$alpha_y$]),
        arr((0, 0), (1, 0), [$F f$]),
        arr((0, 1), (1, 1), [$G f$]),
    )]

    A natural transformation wil be written $alpha : F => G$, and will be written diagrammatically as:
    
    //TODO
]

To put it simply, a natural transformation is a bridge between the arrow $F f$ and $G f$, allowing you to go from one functor to another.

We define a _natural isomorphism_ as a natural transformation $alpha : F -> G$ for which all $alpha_c$ are isomorphisms. Given a functor $F$, a particular example of natural isomorphism is $1_F : F => F$, consisting of the family $(1_(F c))_(c in C)$.

$1_F$ is trivially a natural transformation.

Morover, giver $alpha : F => G$ and $beta : G => H$, we write $beta * alpha : F => H$ for the natural transformation $(beta_c alpha_c : F c -> H c)_(c in cat)$. It is a good exercise to verify that this is ineed a natural transformation.

This composition is called the _vertical_ composition because diagrammatically, it looks like this:

//TODO

Those two considerations amounts to considering a new kind of category.

#definition[
    (Power cateory). Let $cat$ and $cat2$ be two categories.

    We define the _power category_, written $cat2 ^ cat$, as the category:
    - with objects being functors between $cat$ and $cat2$,
    - and arrows natural transformations (composition being the vertical composition, identity being $1_F$).
]

With this definition, we note that a natural isomoprphism is an isomorphism in $cat2 ^ cat$ (verify it! it is not hard, but serves to familiarize with manipulation of natural transformations and diagramatic reasonning).

Let's hold on a minute and go back to our favorite category, #Set.

In #Set, to study two sets $X$ and $Y$, we can find a pair of inverse functions between $X$ and $Y$. Or, instead, we can find a surjective and injective function from $X$ to $Y$ or $Y$ to $X$. This idea can be translated as a general one inside of category theory with the following definition and theorem:

#definition[
    (Equivalence of categories). Let $cat$ and $cat2$ be categories, and $F : cat -> cat2$ and $G : cat2 -> cat$ be functors.

    We say that $F$ and $G$ realizes an _equivalence of categories_ if there exists two natural isomorphisms $eta : G F => 1_cat$ and $epsilon : F G => 1_cat2$.

    We write an equivalence of categories $cat equiv cat2$.
]

This notion of equivalence demonstrates an important point: because functors are not functions, we still need to account for their effects on arrows, and $eta$ and $epsilon$ are here to rule out this problem, and essentially saying (give it a thought) that their effects on hom-sets also cancel each others, up to isomorphism, and that, indeed, the two cateories $cat$ and $cat2$ behave in the same manner. In this same way it is hard to find the inverse of a function, it is hard to find both $G$, $eta$ and $epsilon$. We therefor introduce this powerful theorem:

#theorem[
    _Let $cat$ and $cat2$ be locally small categories, and $F : cat -> cat2$._

    _The following are equivalent (assuming the axiom of choice):_
    - _$F$ is fully faithful and essentially surjective,_
    - _there exists $G: cat2 -> cat$ such that $F$ and $G$ realizes an equivalence $cat equiv cat2$._

    #proof[
        A natural isomorphism $alpha : F ==> G$ can be reframed as a conjuction relation: $forall f : x -> y, F f = alpha_y^(-1) G f alpha_x$.
    ]
]

This means that, to study a functor $F$, one can study another functor $G$ naturally isomorphic to $F$. One of the easiest functors to study (in a practical sense) is $cat(x,\_)$ introdeced in example ??. So, it would be interesting, given a functor $F : cat -> cat2$ to know how it behaves relative to all of the functors $cat(x,\_)$ (one functor for each $x in cat$): the following questions are:

- Is there always an $x$ such that $F iso cat(x,\_)$?
- Is there at most (up to isomorphism) one $x$ such that $F iso cat(x,\_)$?
- If such an $x$ exists, what properties does it have?

This question might seem a bit "out of the blue": we are talking here about encoding a functor $F : cat -> cat2$ (meaning transformations of both elements and arrows) into a _single_ element of $cat$.

However, givern $U : Grp -> Set$ the forgetful functor, we have $Grp(ZZ,\_) iso U$.

#proof[
    Let's define $alpha : Grp(ZZ, \_) => U$. For all groups $G$, $alpha_G$ is the function:

    #align(center)[$
        Grp(ZZ, G) &-> U G \
        phi.alt &|-> phi.alt(1)
    $]

    First, $alpha$ is a natural transformation: indeed, given two groups $G$ and $H$, together with $phi.alt : G -> H$, the following diagram commutes:

    #align(center)[#commutative_diagram(
        node((0, 0), [$Grp(ZZ,G)$]),
        node((0, 1), [$U G$]),
        node((1, 0), [$Grp(ZZ, H)$]),
        node((1, 1), [$U H$]),
        arr((0, 0), (0, 1), [$alpha_G$]),
        arr((1, 0), (1, 1), [$alpha_H$]),
        arr((0, 0), (1, 0), [$phi.alt^*$]),
        arr((0, 1), (1, 1), [$U phi.alt$]),
    )]

    Indeed, given $f : ZZ -> G$, we have
    #align(center)[$(U phi.alt)(alpha_G(f))=phi.alt(f(1))=(phi.alt compose f)(1)=alpha_G((U phi.alt)(f))$.]

    And, given $x in G$, because $ZZ$ is generated by a single element, there is exactly one morphism $ZZ -> G$ such that $phi.alt(1) = x$, which means that every arrow $alpha_G$ is a bijection (an isomorphism in #Set).
]

On the contravariant case, we instead use the (contravariant functor) $cat(\_, w)$: a good example is the fact $pset iso Set({0,1},\_)$.
#proof[
    We define $alpha : Set({0,1},\_) => pset$ as the natural transformation $(alpha_X : {0,1}^X -> pset(X))_(X in Set)$.

    Where, for each $X in Set$, $alpha_X$ is the function $f |-> f^(-1)(1)$.

    First, it is clear that, for all $X$, $alpha_X$ is a bijection (therefore an isomorphism in #Set).

    And, given $f : X -> Y$, the following diagram commutes (_i.e._ for all $g in {0,1}^X$ we have ${f(x)|g(x)=1}="TODO"$):
    
    #align(center)[#commutative_diagram(
        node((0, 0), [$Set({0,1},X)$]),
        node((0, 1), [$pset(X)$]),
        node((1, 0), [$Set({0,1},Y)$]),
        node((1, 1), [$pset(Y)$]),
        arr((0, 0), (0, 1), [$alpha_X$]),
        arr((1, 0), (1, 1), [$alpha_Y$]),
        arr((0, 0), (1, 0), [$f^*$]),
        arr((0, 1), (1, 1), [$pset f$]),
    )]
]
