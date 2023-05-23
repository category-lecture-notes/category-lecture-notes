#import "lib.typ": *
#import "../deps/typst-cd/typst-cd.typ": node, arr, commutative_diagram
#import "../deps/typst-theorems/theorems.typ": thmref

= Natural Transformations

#definition(name: "Natural transformation")[
  Let $F, G : cat(C) -> cat(D)$ be two functors.

  A _natural transformation_ $alpha$ between $F$ and $G$ is a family of arrows $(alpha_c : F c -> G c)_(c in cat(C))$ such that for all $x, y in cat(C)$ and $f in cat(C)(x, y)$ the following diagram commutes (_i.e._ $G f alpha_x = alpha_y F f$):

  #align(center)[
    #commutative_diagram(
      node((0, 0), [$F x$]),
      node((0, 1), [$G x$]),
      node((1, 0), [$F y$]),
      node((1, 1), [$G y$]),
      arr((0, 0), (0, 1), [$alpha_x$]),
      arr((1, 0), (1, 1), [$alpha_y$]),
      arr((0, 0), (1, 0), [$F f$]),
      arr((0, 1), (1, 1), [$G f$]),
    )
  ]

  A natural transformation will be written $alpha : F => G$, and will be written diagrammatically as:

  // TODO: Make commutative diagram
  // \begin{tikzcd}[column sep=huge]
  //   \mathcal{C}
  //     \arrow[r, bend left=65, "F"{name=F}]
  //     \arrow[r, bend right=65, "H"{name=H, swap}]
  //     \arrow[from=F.south-|H,to=H,Rightarrow,shorten=2pt,"\alpha"] &
  //   \mathcal{D}.
  // \end{tikzcd}
]

To put it simply, a natural transformation is a bridge between the arrows $F f$ and $G f$, allowing you to go from one functor to another.

We define a _natural isomorphism_ as a natural transformation $alpha : F -> G$ for which all $alpha_c$ are isomorphisms. Given a functor $F$, a particular example of natural isomorphism is $1_F : F => F$, consisting of the family $(1_(F c))_(c in cat(C))$.

$1_F$ is trivially a natural transformation.

Moreover, given $alpha : F => G$ and $beta : G => H$, we write $beta * alpha : F => H$ for the natural transformation $(beta_c alpha_c : F c -> H c)_(c in cat(C))$. It is a good exercise to verify that this is indeed a natural transformation.

This composition is called the _vertical_ composition because diagrammatically, it looks like this:

// TODO: Make commutative diagram
// \begin{tikzcd}[column sep=huge]
//   \mathcal{C}
//   \arrow[r, bend left=65, "F"{name=F}]
//   \arrow[r, "G"{inner sep=0,fill=white,anchor=center,name=G}]
//   \arrow[r, bend right=65, "H"{name=H, swap}]
//   \arrow[from=F.south-|G,to=G,Rightarrow,shorten=2pt,"\alpha"]
//   \arrow[from=G,to=H.north-|G,Rightarrow,shorten=2pt,"\beta"] &
//   \mathcal{D}
// \end{tikzcd}
// =
// \begin{tikzcd}[column sep=huge]
//   \mathcal{C}
//   \arrow[r, bend left=65, "F"{name=F}]
//   \arrow[r, bend right=65, "H"{name=H, swap}]
//   \arrow[from=F.south-|G,to=H,Rightarrow,shorten=2pt,"\beta * \alpha"] &
//   \mathcal{D}.
// \end{tikzcd}

Those two considerations amounts to considering a new kind of category.

#definition(name: "Power category")[
  Let $cat(C)$ and $cat(D)$ be two categories.

  We define the _power category_, written $cat(D) ^ cat(C)$, as the category:
    - with objects being functors between $cat(C)$ and $cat(D)$,
    - and arrows natural transformations (composition being the vertical composition, identity being $1_F$).
]

With this definition, we note that a natural isomoprphism is an isomorphism in $cat(D) ^ cat(C)$ (verify it! it is not hard, but serves to familiarize with manipulation of natural transformations and diagramatic reasonning).

Let's hold on a minute and go back to our favorite category, $Set$.

In $Set$, to study two sets $X$ and $Y$, we can find a pair of inverse functions between $X$ and $Y$. Or, instead, we can find a surjective and injective function from $X$ to $Y$ or $Y$ to $X$. This idea can be translated as a general one inside of category theory with the following definition and theorem:

#definition(name: "Equivalence of categories")[
  Let $cat(C)$ and $cat(D)$ be categories, and $F : cat(C) -> cat(D)$ and $G : cat(D) -> cat(C)$ be functors.

  We say that $F$ and $G$ realizes an _equivalence of categories_ if there exists two natural isomorphisms $eta : G F => 1_cat(C)$ and $epsilon : F G => 1_cat(D)$.

  We write an equivalence of categories $cat(C) equiv cat(D)$.
]

This notion of equivalence demonstrates an important point: because functors are not functions, we still need to account for their effects on arrows, and $eta$ and $epsilon$ are here to rule out this problem, and essentially saying (give it a thought) that their effects on hom-sets also cancel each others, up to isomorphism, and that, indeed, the two categories $cat(C)$ and $cat(D)$ behave in the same manner. In this same way it is hard to find the inverse of a function, it is hard to find both $G$, $eta$ and $epsilon$. We therefore introduce this powerful theorem:

#theorem[
  Let $cat(C)$ and $cat(D)$ be locally small categories, and $F : cat(C) -> cat(D)$.

  The following are equivalent (assuming the axiom of choice):
    - $F$ is fully faithful and essentially surjective,
    - there exists $G: cat(D) -> cat(C)$ such that $F$ and $G$ realizes an equivalence $cat(C) equiv cat(D)$.

  #proof[
    A natural isomorphism $alpha : F ==> G$ can be reframed as a conjuction relation: $forall f : x -> y, F f = alpha_y^(-1) G f alpha_x$.
  ]
]

This means that, to study a functor $F$, one can study another functor $G$ naturally isomorphic to $F$.
One of the easiest functors to study (in a practical sense) is $cat(C)(x, \_)$ introduced in example #thmref(<some_examples>). So, it would be interesting, given a functor $F : cat(C) -> cat(D)$ to know how it behaves relative to all of the functors $cat(C)(x, \_)$ (one functor for each $x in cat(C)$): the following questions are:
  - Is there always an $x$ such that $F iso cat(C)(x, \_)$?
  - Is there at most (up to isomorphism) one $x$ such that $F iso cat(C)(x, \_)$?
  - If such an $x$ exists, what properties does it have?

This question might seem a bit "out of the blue": we are talking here about encoding a functor $F : cat(C) -> cat(D)$ (meaning transformations of both elements and arrows) into a _single_ element of $cat(C)$.

However, given $U : Grp -> Set$ the forgetful functor, we have $Grp(ZZ, \_) iso U$.

#proof[
  Let's define $alpha : Grp(ZZ, \_) => U$. For all groups $G$, $alpha_G$ is the function:

  #align(center)[$
    Grp(ZZ, G) &  -> U G \
       phi.alt & |-> phi.alt(0)
  $]

  First, $alpha$ is a natural transformation: indeed, given two groups $G$ and $H$, together with $phi.alt : G -> H$, the following diagram commutes:

  #align(center)[
    #commutative_diagram(
      node((0, 0), [$Grp(ZZ,G)$]),
      node((0, 1), [$U G$]),
      node((1, 0), [$Grp(ZZ, H)$]),
      node((1, 1), [$U H$]),
      arr((0, 0), (0, 1), [$alpha_G$]),
      arr((1, 0), (1, 1), [$alpha_H$]),
      arr((0, 0), (1, 0), [$phi.alt^*$]),
      arr((0, 1), (1, 1), [$U phi.alt$]),
    )
  ]

  Indeed, given $f : ZZ -> G$, we have $ (U phi.alt)(alpha_G(f)) = phi.alt(f(0)) = (phi.alt compose f)(0) = alpha_G((U phi.alt)(f)) $

  And, given $x in G$, because $ZZ$ is generated by a single element, there is exactly one morphism $ZZ -> G$ such that $phi.alt(0) = x$, which means that every arrow $alpha_G$ is a bijection (an isomorphism in $Set$).
]

On the contravariant case, we instead use the (contravariant) functor $cat(C)(\_, w)$: a good example is the fact $cat(P) iso Set({0, 1}, \_)$.

#proof[
  For every $X in Set$, let's consider the following function:
  #align(center)[$
    alpha_X : {0, 1}^X &  -> cat(P)(X) \
                     f & |-> f^(-1)(1)
  $]
]

Let's look at a few examples.

In fact, $Set({0, 1}, \_) iso cat(P)$.

#proof[
  We define $alpha : Set({0,1}, \_) => cat(P)$ as the natural transformation $(alpha_X : {0,1}^X -> cat(P)(X))_(X in Set)$.

  Where, for each $X in Set$, $alpha_X$ is the function $f |-> f^(-1)(1)$.

  First, it is clear that, for all $X$, $alpha_X$ is a bijection (therefore an isomorphism in $Set$).

  And, given $f : X -> Y$, the following diagram commutes (_i.e._ for all $g in {0, 1}^X$ we have ${f(x) | g(x) = 1} = "TODO"$):

  #align(center)[
    #commutative_diagram(
      node((0, 0), [$Set({0,1},X)$]),
      node((0, 1), [$cat(P)(X)$]),
      node((1, 0), [$Set({0,1},Y)$]),
      node((1, 1), [$cat(P)(Y)$]),
      arr((0, 0), (0, 1), [$alpha_X$]),
      arr((1, 0), (1, 1), [$alpha_Y$]),
      arr((0, 0), (1, 0), [$f^*$]),
      arr((0, 1), (1, 1), [$cat(P) f$]),
    )
  ]
]
