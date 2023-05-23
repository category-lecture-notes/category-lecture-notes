#import "lib.typ": *

= The end?

The picture seems to be somehow "complete": we descibed what "same" means, we gave a general frame of work to study "structures", and gave some terminology. We could simply transpose all of our results from various fields of mathematics in new language, and everything will be great.

  - On one hand, we have the categories themselves in which inside of them we describe structures.
  - On the other hand, we have a general notion of category that serves as a framework.

However, there is one "little" question that remains to be answered, and that is on the back of our minds since the definition of $dual(cat(C))$: if we flip the arrows twice, we end up with the same category: $dual((dual(cat(C)))) = cal(C)$.

The construction of $dual(cat(C))$ is taking a category $cat(C)$, keeping the same elements, while flipping every arrow. Moreover, we defined the composition such that $dual(g f)$ is $dual(f) dual(g)$, and of course $dual(1_x) = 1_x$.

So, the "thing", that we will name $dual((\_))$ is sending a category $cat(C)$ to $dual(cat(C))$ is, "composed" with itself, the "identity over categories". Moreover, it preserves the composition and the identity arrows. So, $dual((\_))$ is sort of a "morphism of categories".

Which would imply that categories themselves are a structure? But what is a morphism of categories then?
