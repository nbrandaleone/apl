⍝ APL code for solving a Sudoku Puzzle
⍝ https://www.youtube.com/watch?v=DmT80OseAGs
⍝ https://dfns.dyalog.com/n_sudoku.htm


⍝ at←{⍵+(⍴⍵)↑(-⍺⍺)↑⍺}             ⍝ 99 (1 1 at) s44. Place number at spot (1, 1)
⍝ avl←{(⍳⊃⍴⍵)~⍵×⊃⍺⌷cmap rcb ⍴⍵}   ⍝ 1 1 avl s44. Which numbers are possible at spot (1,1)       
⍝ box←{⍵⌿⍵/⍵ ⍵⍴⍳⍵*2}              ⍝ box 2; box 4
⍝ cmap←{⊂[⍳⍴⍴⍵]1∊¨⍵∘.=⍵}          ⍝ cmap rcb 4 4. Contention map; 1s where possible contention.
⍝ emt←{(,⍵=0)/,⍳⍴⍵}               ⍝ emt s44. A vector of empty cells in s44
⍝ pvec←{(⍺ avl ⍵)(⍺ at)¨⊂⍵}       ⍝ 1 1 pvec s44. Give a vector of valid boards while exploring
                                  ⍝ all possible permutations for spot (1,1).
⍝ pvex←{⊃,/⍺∘pvec¨ ⍵}             ⍝ 2 1 pvex 2 2 pvex 1 1 pvex ⊂s44.
                                  ⍝ Explore (concatenate) solutions for spots...
⍝ rcb←{(⍳⍵),¨box⊃⍵*÷2}            ⍝ rcb 4 4. Row, column box data matrix.   
⍝ svec←{⊃pvex/(emt ⍵),⊂⊂⍵}        ⍝ svec s44; svec s99. Solves sudoku puzzle given starting board.

⍝ There is dicussion of improving performance at end (8:00) of video.
⍝ Here is a more performant version. We eliminate some redundancy in the recursive calls.
⍝ This version of the commands can not be used for debugging, but flow from svec.

at←{⍵+(⍴⍵)↑(-⍺⍺)↑⍺}                 
avl←{(⍳⊃⍴⍵)~⍵×⊃⍺⌷⍺⍺}                
box←{⍵⌿⍵/⍵ ⍵⍴⍳⍵*2}                  
cmap←{⊂[⍳⍴⍴⍵]1∊¨⍵∘.=⍵}              
emt←{(,⍵=0)/,⍳⍴⍵}                   
pvec←{(⍺(⍺⍺ avl)⍵)(⍺ at)¨⊂⍵}        
pvex←{⊃,/⍺∘(⍺⍺ pvec)¨⍵}             
rcb←{(⍳⍵),¨box⊃⍵*÷2}                
svec←{⊃(cmap rcb⍴⍵)pvex/(emt ⍵),⊂⊂⍵}


 ⍝ Sample puzzle
       s44
 0 0 0 0
 0 0 2 1
 3 0 0 4
 0 0 0 0
 
       s99
 0 0 1 6 9 0 5 0 0
 4 0 0 2 7 0 0 0 1
 0 7 0 0 0 0 0 9 0
 0 0 0 0 0 0 0 3 0
 0 0 0 4 3 0 0 0 7
 0 0 0 7 8 0 6 0 0
 0 0 6 0 0 0 8 0 5
 0 2 0 1 4 0 0 6 0
 0 1 0 3 5 0 0 4 0
 
      svec s44
 2 1 4 3 
 4 3 2 1 
 3 2 1 4 
 1 4 3 2