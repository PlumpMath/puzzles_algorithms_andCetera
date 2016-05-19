> You are given an implementation of a funciton:

`def solution(M, A)`

> that, given an integer M adn a zero-indexde array A consisting of N non-negative integers, which are not greater than M, returns the value (or one of the values) that occurs most ofen in this array.

For example, give M = 3 and array A such that:

```
A[0] = 1
A[1] = 2
A[2] = 3
A[3] = 3
A[4] = 1
A[5] = 3
A[6] = 1
```
> the function may return 1 or 3.

> Unfortunately, despite the fact that the function may return expected result for the example input, there is a bug in the implementation that may produce incorrect results for other inputs. Find the bug and correct it. You should modify at most four lines of code.

> Assume that:
>  - N is an integer with the range [1..200,000]
> - M is an integer within the range [1..10,000]
> - each element of hte array is an integer within the range [0..M]

### Complexity:

- expected worst-case time complexity is O(N+M);
- expected worst-case space complexity is O(M), beyond input storage (not counting the storgae requred for input arguments).

Elements of input arrays can be modified.
