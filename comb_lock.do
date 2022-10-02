force clock 0

run 2 


force clock 1
force reset 0
force ld1 1
force ld2 0
force ld3 0
force enter 1
 

run 2

examine state_reg ld1 ld2 ld3 enter unlock

force clock 0
run 2



force clock 1
force reset 0
force ld1 0
force ld2 1
force ld3 0
force enter 1
force value 0111
 

run 2

examine state_reg ld1 ld2 ld3 enter unlock

force clock 0
run 2

force clock 1
force reset 0
force ld1 0
force ld2 0
force ld3 1
force enter 1
force value 0101
 

run 2

examine state_reg ld1 ld2 ld3 enter unlock

force clock 0
run 2


force clock 1
force reset 0
force ld1 0
force ld2 0
force ld3 0
force enter 1
force value 1001

run 2

examine state_reg ld1 ld2 ld3 enter unlock

force clock 0
run 2

force clock 1
force reset 0
force ld1 0
force ld2 0
force ld3 0
force enter 1

run 2

examine state_reg ld1 ld2 ld3 enter unlock

force clock 0
run 2

force clock 1
force reset 0
force ld1 0
force ld2 0
force ld3 0
force enter 1

run 2

examine state_reg ld1 ld2 ld3 enter unlock

