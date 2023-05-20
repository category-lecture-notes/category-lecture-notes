#import "lib.typ": quotient

= Introduction

I'll start by a question: What does "same" mean?

Intuitively, we feel that $(ZZ, <)$ and $(QQ, <)$ are different as ordered structures, that $quotient(ZZ, 4ZZ)$ and $quotient(ZZ, 2ZZ) times quotient(ZZ, 2ZZ)$ are two "different" groups:
 - for the former example, $QQ$ is a dense order, and $ZZ$ is not,
 - for the latter one, $quotient(ZZ, 4ZZ)$ is cyclic, and the other is not.

Clearly, in the sense of two object being the "same" (or not), there is some kind of interactions between elements that creates different behaviours.
One would say that there is no "structure preserving bijection", for the first one, no bijective order embedding, for the second, no group isomorphism.
However, defining "structure" by "I preserve structure" is not a satisfying approach.

Yet, in the two examples, we were able to say those "structures" were different by simply finding a property that one possesses and the other don't.
So, instead of trying to state what this general "structure" thing is, let's just look at how it behaves!
That this "structure" is, to put it mildly, just relations that the elements have one with another.
That what really matters is not to characterise interactions, but to characterise the definition of interaction, by grouping objects and those relations in a new object.
So, we just simply consider those objects, with, between two objets, a sort of "relation" that would describe the interactions of one between another.

We therefore give it a name: a _category_.
