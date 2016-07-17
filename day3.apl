⍝ Solving Day 3 problem - a Santa Clause map problem

⍝ Read in the file. 80 is 8 bit character format.
'/Users/nbrand/Desktop/day3.txt' ⎕ntie 0
text←⎕NREAD ¯1 80 8192 0
⎕nuntie ¯1

⍝ ⎕nsize ¯1    8192
⍝ ⎕nnames ¯1   /Users/nbrand/Desktop/day3.txt

⍝ How large horizontally and vertically do we make our data structure?
      {+/⍵=text}¨'<>^v'
2038 2079 1990 2085

⍝ Net size for H and V. Use running total (i.e. scan) to find out
work←text
      work[(work='<')/⍳⍴ work]←¯1
      work[(work='>')/⍳⍴ work]←1
      ⌈/ |+\(~work∊'^v')/work
55

)erase work     
      work←text  
      work[(work='^')/⍳⍴ work]←¯1 
      work[(work='v')/⍳⍴ work]←1 
      ⌈/ |+\(~work∊'<>')/work
127

⍝ I represent moves by numbers, scan them,
⍝ and then see which numbers are unique. I add/subtract 1000, which
⍝ represents a row switch. It is bigger than any possible column conflict.
      )erase work  
      work←text
      (¯1 1 ¯1000 1000){work[(work=⍵)/⍳⍴work]←⍺}¨'<>^v'
      ind←+\1,work
      ⍴ ∪ ind
2592

⍝ There is now a robot, which splits the work. Find the number of houses.
workodd←1,(∊4096\⊂1 0)/work ⋄ workeven←1,(∊4096\⊂0 1)/work
      ⍴ ∪(+\workeven), (+\workodd)
2360
