 ⍝ Ullam Spiral. You need a primes program as well.
 R←spiral N;start;indices
 start←(2|N)+(N+1)×⌊N÷2
 indices←+\(N*2)↑start,(2/⍳N)/(2×N)⍴1(-N)¯1 N
 R[indices]←R←⍳⍴indices
 R←(N,N)⍴R
 
 ⍝ Print out the primes on the spiral. Say x is 7.
 ⍝ ' ○'[⎕IO+(Spiral X)∊Primes X*2] 