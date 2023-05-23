#import "lib.typ": *
#import "typst-cd.typ": node, arr, commutative_diagram

= Functors

The preceding observation motivates the followin definition, absolutely central in category theory, because it allows us to compare how categories themselves behave in respect to each other.

#definition[
    (Covariant functors). Let $cat$ and $cat2$ be categories.
    A covariant functor $F$ is two things:
    - For each object $c in cat$, an object $F c in cat2$.
    - For each arrow $f : x -> y$, and arrow $F f : F x -> F y$.
    And, the arrows $F f$ needs to satisfy the following two conditions:
    - For any composable $f$ and $g$, we have $F (g f) = (F g) (F f)$
    - For all $x in cat$, we have $F(1_x) = 1_(F x)$.
]

#definition[
    ($Cat$). $Cat$ is the cateogry formed with categories as objects and functors as arrows. In addition to that, one can now verify that $dual((\_)) : Cat -> Cat$ is indeed a functor.
]

#remark[
    One can say that this may lead to a foundation problem, becausee we would have $Cat in Cat$, which would lead to a Russel-like paradox. However, this text is only an introduction, so I can't give a satisfactory response to this observation.
]

#example[
    (Goups as one object groupoids). Geven a group $G$, one can construct a one object groupoid $B G$, as explained previously.

    We now consider #Groupoid, the category formed by groupoids and functors.

    Given two groupoids $G$ and $G'$ together with a group morphism $phi.alt : G -> G'$. Define $B phi.alt : B G -> B G'$ as the functor that sends the object $Delta$ of $B G$ to the object $Delta'$ of $B G'$, and arrows $x : Delta -> Delta$ to $phi.alt(x) : Delta' -> Delta'$. Beacuase $phi.alt$ is a groupd morphism, it is clear (but verify!) that $B phi.alt$ is a functor.

    _In fine_, we have that $B : Grp -> Groupoid$ is a functor.
]

With this example in mind, we see that it is important to view functors and morphisms in a inofied way, as functors are just morphisms of #Cat. Now, let's give some more interesting examples.

#example[
    (Some examples of functors to know).
    - The functor $U : Grp -> Set$ that sends a group to its base set (and group morphisms to the underlying functions). This functor is called a "forgetful" functor, because it "forgets" the structure.
    - Given $cat$ a locally small category, and $x in cat$, we have a functor $cat(x, \_) : cat -> Set$ sending $y in cat$ to the _set_ (because $cat$ is locally small) of arrows between $x$ and $y$, and $f : y -> z$ to the function
    #align(center)[$
        f^* : cat(x, y) &-> cat(x, z) \
        g & |-> f g
    $]
    - The powerset functor $pset : Set -> Set$ that sends $X$ to $pset(X)$ and $f$ to the mapping between powersets: $pset(f)(X) := f(X)$.
]

From the power set $pset$, we can define another "functor" like object: it sends $X$ to $pset(X)$, but from an arrow $f : X -> Y$ tkaes it to the arrow $f^(-1) : pset(Y) -> pset(X)$. This satisfies the definition of a functor, only not of $Set -> Set$, but of $dual(Set) -> Set$, which motivates us to consider another kind of functors, to describe this "arrow inversion" functoriality.

#definition[
    (Contravariant functor). Given $cat$ and $cat2$ two categories, a contravariant functor is a functor $F : dual(cat) -> cat2$.
    This means that it is two things:
    - For each object $c in cat$, an object $F c in cat2$.
    - For each arrow $f : y -> x$, and arrow $F f : F x -> F y$.
    And the arrows $F f$ need to satisfy the following two conditions:
    - For any composable $f$ and $g$, we have $F(g f) = (F f) (F g)$.
    - For all $x in cat$, we have $F(1_x) = 1_(F x)$.
]

#lemma[
    (Functor preserves isomorphism). _Let $F : cat -> cat2$ be a functor, and $f$ be a morphism in $cat$, then_

    #align(center)[$f italic("isomorphism") ==> F f italic("isomorphism")$]

    #proof[
        Let $g$ be the inverse to $f$, then it is easy to verify that $F g$ is the inserve to $F f$.
    ]
]

#warning[
    $F cat$ with arrows on the form $F f$ is not a subcategory of $cat2$.
    #proof[
        Take the following categories:
        #align(center)[#commutative_diagram(
            node((0, 0), [$A$]),
            node((0, 1), [$B$]),
            node((1, 0), [$C$]),
            node((1, 1), [$D$]),
            arr((0, 0), (0, 1), [$f$]),
            arr((1, 0), (1, 1), [$g$]),
        )]
        And $3$:
        #commutative_diagram(
            node((0, 0), [$0$]),
            node((0, 1), [$1$]),
            node((0, 2), [$2$]),
            arr((0, 0), (0, 1), [$u$]),
            arr((0, 1), (0, 2), [$v$]),
        )

        We consider the functor $F$ that sends $A$ to 0, $B$ to 1, $C$ to 1, $D$ to 2, $f$ to $u$, and $g$ to $v$.

        However, $F f$ and $F g$ are composable in 3, but their composition does not belong to $F$.
    ]
]

Analoous sets/groups/... and bijections/isomorphisms/..., we can try to define the fact that two categories have the same properties by finding an "isofunctor" between them. Unlike functions however, functors not only transforms the elements (objects), but also the arrows: we therefore have to account for a sort of surjectivity and injectivity on arrows as well. This gives rise to the following definitions:

#definition[
    (Fullness and faithfullness). Let $cat$ and $cat2$ be locally small categories $F : cat -> cat2$ be a functor.

    We say that $F$ is:
    - _full_ if for all $x, y in cat$ the function from $cat(x, y) -> cat2(F x, F y)$ is surjective.
    - _faithful_ if for all $x, y in cat$ the function from $cat(x, y) -> cat2(F x, F y)$ is injective.
    - _essentially surjective_ if for all $y in cat2$, there exists an $x in C$ s.t. $F x iso y$.
]

A full functor is a functor that covers all the posible maps, and a faithfull functor is a functor that you can trust on the maps it covers (hence the names). However, these conditions are _local_: given $f : x -> y$ and $g : a -> b$, with $f != g$, $F f = F g$ does not contradict faithfullness.

In the following, we will say that a functor $F$ is _fully faithful_ if it is both faithful and full.

We also have this useful result:
#property[
    (Fully faithful functors reflect isomorphisms). Let $F : cat -> cat2$, then for all $f : x -> y$, we have
    #align(center)[$F f "isomorphism" ==> f "isomorphism"$.]
]

However, our picture of category theory is not yet complete: what do "same" mean between functors? The first idea (in this categorical setting) would be to make a cateory where functors are _objects_, then what is an arrow $alpha : F -> G$?