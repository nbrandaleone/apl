 R←A Interlace B;size;even
 size←1 2×⍴A
 R←size⍴0
 even←2×⍳(⍴B)[2]
 R[;even]←B
 R[;even-1]←A