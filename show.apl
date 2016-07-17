⍝ Cool show function.

string←'If you can read this, it worked!'
      vowels←{⍵∊'aeiouAEIOU'}
      vowels string
1 0 0 0 1 1 0 0 1 0 0 0 1 1 0 0 0 0 1 0 0 0 1 0 0 0 1 0 0 1 0 0
      show←{⍵⍪⍵{↑(1 0⍕ ⍵)(⍵\⍵/⍺)}⍺⍺ ⍵}
      vowels show string
If you can read this, it worked!
10001100100011000010001000100100
I   ou  a   ea    i   i   o  e  