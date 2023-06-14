#import "lib.typ": *

= Definition of a category, and internal properties

#definition(name: "Category")[
  A category is the following things:
    - A collection of objects,
    - A collection of morphism, or arrows, such that each morphism $f$ has a _domain_ and _codomain_. A morphism $f$ of domain $x$ and codomain $y$ will be written $f : x -> y$. We also ask the following properties:
      - for $f : x -> y$ and $g : y -> z$, there is a morphism $g f : x -> z$. Two such morphisms $f$ and $g$ will be called _composable_,
      - for each object $x$ there is a morphism $1_x : x -> x$,
      - for $f$, $g$ and $h$ composable, we have $h (g f) = (h g) f$,
      - for $f : x -> y$, we have $f 1_x = f = 1_y f$
]

#example[
  Some categories are already known:
    - $Set$, the category of sets, and arrows as functions,
    - $Grp$, the category of groups, and arrows as group morphisms,
    - $Ring$, the category of rings, and arrows as ring morphisms,
    - $Top$, the category of topological spaces and continous functions.

  But a category can be just a refomulation of a known object:
    - any (pre)ordered set $(P, <=)$ is a category, named $P$ with objects the element of $P$, and between $(x, y)$, a unique $f : x -> y$ iff $x <= y$,
    - any graph $(V, E)$ gives rise to a category by considering $V$ as the collection of elements, and having exactly one arrow $f : x -> y$ iff $y$ is reachable from $x$.
]

It is important to note that the composition $g f$ is comprised in the definition of a category either implicitely (like the first examples), or explicitely with the past two examples.

So, a lot of objects can be naturally described as a category, their internal structure being discribed by arrows and compositions of such arrows.

Category admit a natural, "graph like" representation: element are points, and morphism are arrows between points. We usually omit the composition arrows and the $1_x$ arrows. The following category, for example, is named $bold(1)$:

#align(center, tikzcd[
  ```
  x \arrow[loop left, "\mathrm{1}_{x}"]
  ```
])

Now that we defined the concept, let's give some terminology and present classical constructions.

#definition(name: $dual(cat(C))$)[
  Let $cat(C)$ be a category.

  We call $dual(cat(C))$ the category with the same objects, and for arrows, a morphism $dual(f) : y -> x$ for each morphism $f : x -> y$.
]

#example[
  It is not outright clear why this construction is important, but it serves to naturally express some concepts, as we will see in, for example: Given a poset $cat(C) := (P, <=)$, $dual(cat(C))$ is $(P, >=)$.
]

Our initial objective was to give a general sense to what "same" means: what would be an "isomorphism" in a category. We'll now introduce terminology on arrows.

#definition(name: "Monomorphism, epimorphism and isomorphism")[
  Let $cat(C)$ be a category.
  We say that $f : x -> y$ is:
    - a monomorphism if, for all $a, b : y -> z$, $f a = f b ==> a = b$,
    - an epimorphism if $dual(f)$ is a monomorphism, _i.e._ for all $a, b : z -> x$, $a f = b f ==> a = b$,
    - an isomorphism if there exists a $g : y -> x$ such that $g f = 1_x$ and $f g = 1_y$. If there exists such an $f$, we will say that $x$ and $y$ are _isomorphic_, and write it $x iso y$.
]

It is clear that an isomorphism is a monomorphism and an epimorphism, but the contrary is (true in $Set$) but NOT in general: take $f : x -> y$ in the following category $bold(2)$:

#align(center, tikzcd[
  ```
  x \arrow[loop left, "\mathrm{1}_{x}"] \arrow[r, "f"] &
  y \arrow[loop right, "\mathrm{1}_{y}"]
  ```
])

We say that a category $cat(C)$ that only contains isomorphisms is a _groupoid_.

A special kind of groupoid is a groupoid with only one element, that we will call a... group. Indeed, given $G in Grp$, we consider the category comprised of only one element $Delta$, and, for each $x in G$, an arrow $x : Delta -> Delta$, composition of arrow is defined by composition of elements, and $e$ is the arrow $1_Delta$.

We'll explore this construction more in detail in the next chapter.

Indeed, isomorphism are exactly what we wanted to define structure: indeed, two objets $x$ and $y$ are said _isomorphic_ if there is an isomorphism between them: it is the category _itself_ that defines the notion of structure by defining the isomorphism, as opposite to the "traditional" approach, that would define a specific kind of structure (like groups, vector spaces) and then define isomorphism as "bijective maps preservin the structure".

#definition(name: "Hom-set, small and locally small categories")[
  Let $cat(C)$ be a category. For all $x, y in cat(C)$, we name $cat(C)(x, y)$ (also written as $"Hom"_(cat(C))(x, y)$) the collection of arrows between $x$ and $y$.

  We say that a category is _small_ if it has only a set worth of objects.

  We say that a category is locally small if, for all $x, y in cat(C)$, $cat(C)(x, y)$ is a set.
]

As for now, the importance of smallness and local smallness don't seem relevant, but the importance of local smallness will be highlighted in the next chapter.
