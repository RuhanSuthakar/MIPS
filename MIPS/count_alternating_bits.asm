# Written for ECE2071 S1 2025
# Copyright Monash University 2025
# Alternating Bits Counter

.text                          # Start generating instructions 
.globl count_alternating_bits  # This label should be globally known

start:
    li  $a0, 0xF0F0F0F2         # load argument register $a0 with number to be test
    jal count_alternating_bits  # call the function to count alternating bits
		
infinite:
    j infinite              # wait here when the calculation has finished 
                            # $v0 contains the result

#---------------------------------------------------------------
# count_alternating_bits - input parameter $a0 contains number to test
#   result returned in register $v0 
#---------------------------------------------------------------		
count_alternating_bits:	
    #*****************************************
    # your code goes here 
    
    main:
    
   	 add $t0, $t0, $a0
    
  	  li $t2, 2
   	  li $v0, -1    #count
    
  	  div     $t0, $t2
   	  mfhi    $t6         # $t6 contains remainder prev
    
    
   addCount:
    	addi $v0, $v0, 1
    	add $t6, $t5, $zero
    	j loop  
    	
    loop:
    
    	srl $t0, $t0, 1
    	
	div     $t0, $t2
	mfhi    $t5         # $t5 contains current prev
	
	
	bne $t5, $t6, addCount
	
	add $t6, $t5, $zero
    	bne $t0, $zero, loop
    	 
    addi $v0, $v0, -1
    #add $v0, $t1, $zero
    #*****************************************
    jr $ra                  # jump to contents of return address register $ra
