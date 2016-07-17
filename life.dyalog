`a life←{⊃1 ⍵∨.∧3 4=+/+⌿1 0 ¯1∘.⊖1 0 ¯1⌽¨⊂⍵}
⍝ https://www.youtube.com/watch?v=a9xAKttWgP4
⍝ Use DL equals 0
⍝ gen←{(life⍣⍵)⍺}
⍝ r←(3 3 ⍴ ⍳ 9)∊ 1 2 3 4 7
⍝ R←¯1 ⊖¯2⌽5 7 ↑ r
⍝ RR←15 35 ↑ ¯10 ¯20 ↑ R
⍝ pic ←'·⌹'[RR] 
⍝ {}{pic∘←'·⌹'[⍵]⋄_←⎕dl ÷8 ⋄ life ⍵}⍣≡RR
⍝ https://dfns.dyalog.com/n_life.htm