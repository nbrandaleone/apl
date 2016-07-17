z←n fillcage x;t;o;c;k;f;m;at;z1;z2   ⍝ we have to search and place the number

⍝ o = The charcter of function to be tried: 'x'
⍝ f = function to be tried (x,+,-,÷, )
⍝ t = target number
⍝ c = cage vector
⍝ m = intermediate matrix, which holds results of all possible combinations
⍝ at= Put values into solution matrix
⍝ k = how many cells we have to work with -1
⍝ n = dimensions of ken ken

t o c←x
f←{|⍎⍕⍺,o,⍵}     ⍝ executes char operation in a function
at←{a←(n×n)⍴0 ⋄ a[(,⍳n n)⍳⍺]←⍵ ⋄ n n⍴a} ⍝ Places numbers ⍵ in the cells ⍺
k←⊃¯1+⍴c
:If o=' '
    z←⊂c at t
:Else
    m←(⍳n)({⍺∘.f ⍵}⍣k)⍳n       ⍝ All possible combinations
    :If ~o='÷'
        z←c∘at¨(t=,m)/,⍳⍴m     ⍝ The coords of the cells that make the target #
    :Else
        z1←c∘at¨(t=,m)/,⍳⍴m    ⍝ For division we need to check the reciprocal too
        z2←c∘at¨((÷t)=,m)/,⍳⍴m 
        z←z1,z2
    :EndIf
:EndIf

⍝ Test. 4 fillcage 16, '×', ⊂(1 1)(1 2)(2 2)

⍝
z←kenken x;n;sum

⍝ sum = function that combines the results from fillcage, but only
⍝       accepts choices when the numbers are not repeated on same row or column.
⍝ n   = dimension of the KenKen
⍝ x = board vector. There are 3 cols for board. target, operation, cage vector.

n←0.5*⍨⊃⍴⊃,/x[;3]   ⍝  dimension of the KenKen
sum←{a←,⍺∘.+⍵ ⋄ f←{∧/{{⍵≡∪⍵}⍵~0}¨↓⍵} ⋄ a/⍨(f¨⍉¨a)∧f¨a}
⍝ It applies f on the transpose of a, so makes the test also on the cols.
⍝ function 'a' makes all the combination of the sum of two cages

z←⊃⊃sum/n∘fillcage¨↓x

⍝ Test board. kenken board
      board←7 3 ⍴0
      board[;1]←16 7 2 4 12 2 2
      board[;2]←'×+- ×÷÷'
      board[;3]←((1 1)(1 2)(2 2))((1 3)(1 4)(2 3))((2 1)(3 1))(,⊂(2 4))((3 2)(4 1)(4 2))((3 3)(3 4))((4 3)(4 4))
 2 4 1 3
 1 2 3 4
 3 1 4 2
 4 3 2 1

⍝ Test board 2      
      board2←7 3 ⍴0
      board2[;1]←12 2 11 2 2 4 3 
      board2[;2]←'×÷+- +-'
      board2[;3]←((1 1)(1 2)(2 2))((1 3)(1 4))((2 1)(3 1)(4 1)(3 2))((2 3)(3 3))(,⊂(2 4))((3 4)(4 4))((4 2)(4 3))
  1 3 2 4
  3 4 1 2
  4 2 3 1
  2 1 4 3
  
⍝ Test board 3
        bigboard←15 3⍴0
        bigboard[;1]←11 2 20 6 3 3 240 6 6 7 30 6 9 8 2
        bigboard[;2]←'+÷××-÷×××+××++÷'
        bigboard[;3]←((1 1)(2 1))((1 2)(1 3))((1 4)(2 4))((1 5)(1 6)(2 6)(3 6))((2 2)(2 3))((2 5)(3 5))((3 1)(3 2)(4 1)(4 2))((3 3)(3 4))((4 3)(5 3))((4 4)(5 4)(5 5))((4 5)(4 6))((5 1)(5 2))((5 6)(6 6))((6 1)(6 2)(6 3))((6 4)(6 5))
        kenken bigboard
  5 6 3 4 1 2
  6 1 4 5 2 3
  4 5 2 3 6 1
  3 4 1 2 5 6
  2 3 6 1 4 5
  1 2 5 6 3 4