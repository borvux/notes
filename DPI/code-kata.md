# binary tree height
## example

```
      A
    /   \
  B       C
 / \     / \
D   E   F   G
```

`queue = [A]` since `A` is the root
`queue.length = 1`  
so we loop one time

## `1.times`
```
  A
 / \
B   C 
```
we add `B, C` since its A childerns, then we take out `A` from the queue  
so the queue was `[A, B, C]` => `[B, C]`  
and the loop ends since its `1.times`  
and we add `height = 0 + 1 = 1` `height = 1`

---

now the queue is `[B, C]`
`queue.length = 2`  
so we loop 2 times

## `2.times`
### first loop:

`B` becomes the root node 
```
  B
 / \     
D   E 
```
So we want to add `[D, E]` to the `queue` since its `B` is now the root

so the queue will be `queue = [B, C, D, E]`, then take out the root node `B`  
so the queue become `queue = [C, D, E]`  
the first iteration comes to end

### second loop:
`C` becomes the root node 
```
  C
 / \     
F   G
```
So we want to add `[F, G]` to the `queue` since its `C` is now the root
so the queue will be `queue = [C, D, E, F, G]`, then take out the root node `C`  
so the queue become `queue = [D, E, F, G]`  
the second iteration comes to end
 
and we add `height = 1 + 1 = 2` `height = 2`

--- 

now the queue is `[D, E, F, G]`
`queue.length = 4`  
so we loop 4 times

## `4.times`
### first loop:

`D` becomes the root node  
we can't add anything to the loop though since `D` have no childern

so the queue will be `queue = [D, E, F, G]`, then take out the root node `D`  
so the queue become `queue = [E, F, G]`  
the first iteration comes to end

### second loop:
`E` becomes the root node 
we can't add anything to the loop though since `E` have no childern

so the queue will be `queue = [E, F, G]`, then take out the root node `E`  
so the queue become `queue = [F, G]`  
the second iteration comes to end

### third loop:
`F` becomes the root node 
we can't add anything to the loop though since `F` have no childern

so the queue will be `queue = [F, G]`, then take out the root node `F`  
so the queue become `queue = [G]`  
the third iteration comes to end

### fourth loop:
`G` becomes the root node 
we can't add anything to the loop though since `G` have no childern

so the queue will be `queue = [G]`, then take out the root node `G`  
so the queue become `queue = []`  
the fourth iteration comes to end
 
and we add `height = 2 + 1 = 3` `height = 3`

---

## loops come to an end since the queue is now empty so the height is 3 
