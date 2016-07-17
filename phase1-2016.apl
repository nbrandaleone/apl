⍝ APL code for Dyalog 2016 contest - Phase 1

⍝ Problem 1 - Statistics - Mean
mean←{
    0=≢⍵:0
    (+/⍵)÷≢⍵
}

⍝ Problem 2 - Statistics - Median
median←{
   (≢⍵)=0:0
   (≢⍵)=1:⍵
   sort←⍵[⍋⍵]
   0.5×sort[⌊1+0.5×≢⍵]+sort[⌈0.5×≢⍵]
}

⍝ Problem 3 - Statistics - Mode
mode←{
    v←⍵
⍝ Find the mode of a vector
    m←⌈/{≢⍵}⌸v     ⍝ Determine the max times a number appears
⍝ Create a binary mask and apply it to original vector keys
    (m=(⍉{⍺,≢⍵}⌸v)[2;])/{⍺}⌸v
}

⍝ Problem 4 - Just Meshing Around
interleave←{
⍝ We need to know the minimum length of the two vectors
    len←(≢⍺){(⍺-⍵)>0:⍵ ⋄ ⍺}≢⍵

⍝ Shape the left and right argument into a 2 row matrix
⍝ Transpose the row/col, and then ravel into a single vector
⍝ We adjust for the fact that the 2 vectors may have different lengths
    (,⍉(2,len)⍴(len↑⍺),(len↑⍵)),(len↓⍺),len↓⍵
}

Problem 5 – You're Unique, Just Like Everyone Else
Write a dfn that takes vector as its right argument and returns elements that occur only once in the vector.
