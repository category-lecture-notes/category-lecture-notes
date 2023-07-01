#import "lib.typ": *
#import "@vendor/typst-theorems:1.0.0": thmref

= Natural Transformations

#definition(name: "Natural transformation")[
  Let $F, G : cat(C) -> cat(D)$ be two functors.

  A _natural transformation_ $alpha$ between $F$ and $G$ is a family of arrows $(alpha_c : F c -> G c)_(c in cat(C))$ such that for all $x, y in cat(C)$ and $f in cat(C)(x, y)$ the following diagram commutes (_i.e._ $G f alpha_x = alpha_y F f$):

  #align(center, tikzcd[
    ```
    Fx && Gx \\
    \\
    Fy && Gy
    \arrow["Ff"', from=1-1, to=3-1]
    \arrow["{\alpha_x}"', from=1-1, to=1-3]
    \arrow["Gf"', from=1-3, to=3-3]
    \arrow["{\alpha_y}"', from=3-1, to=3-3]
    ```
  ])

  A natural transformation will be written $alpha : F => G$, and will be written diagrammatically as:

  #align(center, tikzcd[
    ```
    \mathcal{C}
    \arrow[r, bend left=65, "F"{name=F}]
    \arrow[r, bend right=65, "H"{name=H, swap}]
    \arrow[from=F.south-|H,to=H,Rightarrow,shorten=2pt,"\alpha"] &
    \mathcal{D}
    ```
  ])
]

To put it simply, a natural transformation is a bridge between the arrows $F f$ and $G f$, allowing you to go from one functor to another.

We define a _natural isomorphism_ as a natural transformation $alpha : F -> G$ for which all $alpha_c$ are isomorphisms. Given a functor $F$, a particular example of natural isomorphism is $1_F : F => F$, consisting of the family $(1_(F c))_(c in cat(C))$.

$1_F$ is trivially a natural transformation.

Moreover, given $alpha : F => G$ and $beta : G => H$, we write $beta * alpha : F => H$ for the natural transformation $(beta_c alpha_c : F c -> H c)_(c in cat(C))$. It is a good exercise to verify that this is indeed a natural transformation.

This composition is called the _vertical_ composition because diagrammatically, it looks like this:

#align(center, grid(columns: 3, gutter: 3em,
  tikzcd[
    ```
    {\mathcal C} && {\mathcal D}
    \arrow[""{name=0, anchor=center, inner sep=0}, "G"'{pos=0.7}, from=1-1, to=1-3]
    \arrow[""{name=1, anchor=center, inner sep=0}, "F", curve={height=-30pt}, from=1-1, to=1-3]
    \arrow[""{name=2, anchor=center, inner sep=0}, "H"', curve={height=30pt}, from=1-1, to=1-3]
    \arrow["\alpha"', shorten <=4pt, shorten >=4pt, Rightarrow, from=1, to=0]
    \arrow["\beta"', shorten <=4pt, shorten >=4pt, Rightarrow, from=0, to=2]
    ```
  ],
  align(horizon, $=$),
  tikzcd[
    ```
    {\mathcal C} && {\mathcal D}
    \arrow[""{name=0, anchor=center, inner sep=0}, "F", curve={height=-30pt}, from=1-1, to=1-3]
    \arrow[""{name=1, anchor=center, inner sep=0}, "H"', curve={height=30pt}, from=1-1, to=1-3]
    \arrow["{\beta * \alpha}"', shorten <=8pt, shorten >=8pt, Rightarrow, from=0, to=1]
    ```
  ]
))

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
       phi.alt & |-> phi.alt(1)
  $]

  First, $alpha$ is a natural transformation: indeed, given two groups $G$ and $H$, together with $phi.alt : G -> H$, the following diagram commutes:

  #align(center, tikzcd[
    ```
    {\mathbf{Grp}(\mathbb{Z}, G)} && UG \\
    \\
    {\mathbf{Grp}(\mathbb{Z}, H)} && UH
    \arrow["{\alpha_g}"', from=1-1, to=1-3]
    \arrow["{\phi^*}"', from=1-1, to=3-1]
    \arrow["U\phi"', from=1-3, to=3-3]
    \arrow["{\alpha_H}"', from=3-1, to=3-3]
    ```
  ])

  Indeed, given $f : ZZ -> G$, we have $ (U phi.alt)(alpha_G(f)) = phi.alt(f(1)) = (phi.alt compose f)(1) = alpha_G((U phi.alt)(f)) $

  And, given $x in G$, because $ZZ$ is generated by a single element, there is exactly one morphism $ZZ -> G$ such that $phi.alt(1) = x$, which means that every arrow $alpha_G$ is a bijection (an isomorphism in $Set$).
]

On the contravariant case, we instead use the (contravariant) functor $cat(C)(\_, w)$: a good example is the fact $pset iso Set({0, 1}, \_)$.

#proof[
  For every $X in Set$, let's consider the following function:
  #align(center)[$
    alpha_X : {0, 1}^X &  -> pset(X) \
                     f & |-> f^(-1)(1)
  $]
]

Let's look at a few examples.

In fact, $Set(\_, {0, 1}) iso pset$.

#proof[
  We define $alpha : Set(\_, {0,1}) => pset$ as the natural transformation $(alpha_X : {0,1}^X -> pset(X))_(X in Set)$.

  Where, for each $X in Set$, $alpha_X$ is the function $f |-> f^(-1)(1)$.

  First, it is clear that, for all $X$, $alpha_X$ is a bijection (therefore an isomorphism in $Set$).

  And, given $f : X -> Y$, the following diagram commutes:

  #align(center, tikzcd[
    ```
    {\mathbf{Set}(X, \{0, 1\})} && {\mathcal{P}(Y)} \\
    \\
    {\mathbf{Set}(Y, \{0, 1\})} && {\mathcal{P}(Y)}
    \arrow["{\alpha_X}"', from=1-1, to=1-3]
    \arrow["{f^*}"', from=1-1, to=3-1]
    \arrow["{\mathcal{P}f}"', from=1-3, to=3-3]
    \arrow["{\alpha_Y}"', from=3-1, to=3-3]
    ```
  ])
]
