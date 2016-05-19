

I didn't copy out the problem description for this one, but basically :

Imagine an infinite chessboard coordinatised like a Cartesian plane, with a knight at the origin (0,0).

Given an arbitrary target square, calculate the distance of the shortest path to target in number of moves.

Practical constraints limit target square to within something like 10,000 squares from origin in either axis.

##### solution:
Exhaustive search blows up pretty quickly, but if the knight is close enough in then exhaustive search is quite manageable.  And if far enough out then can use heuristic to simply aim the knight on best approximate path.  Hence the 'direct-trajectory' file.

I call it "Knight's Errand".
