⍝ Pythagorean Theorem Check
      right←{((⍺[1]*2)+(⍺[2]*2))=⍵*2}
      
      3 4 right 5
1
      2 3 right 4
0
      right1←{=/((+/)*∘2)¨⍺ ⍵}
      3 4 right1 5
1
      right2←{=/+.×⍨¨⍺ ⍵}
      3 4 right2 5
1
      5 right2 3 4
1