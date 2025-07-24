# Written for ECE2071 S1 2024
# Copyright Monash University 2024
# Prime Number detector

.text                       # Start generating instructions 
.globl is_prime             # This label should be globally known

start:
    li  $a0, 0x0003         # load argument register $a0 with number to be test
    jal is_prime            # call the function to test if prime
		
infinite:
    j infinite              # wait here when the calculation has finished 
                            # $v0 contains the result

#---------------------------------------------------------------
# is_prime - input parameter $a0 contains number to test
#   result returned in register $v0 (1 if prime, 0 if not prime)
#---------------------------------------------------------------		
is_prime:	
    #*****************************************
    # your code goes here 
    
    
 
    j main
     exit_1:
    
        li $v0, 1
        jr $ra  
    
    exit_0:
    
        li $v0, 0
        jr $ra       	
    
    main:             
   	 li $t1, 2
   	 
   	 li $t7, 2
  	 add $t0, $a0, $zero
    
   	 beq $a0 $t7, exit_1
    
    	li  $t5   3      
   	blt $a0, $t5, exit_0
   	 
    	     	
    
    loop:
    	add $t0,$t0, -1
    	beq $t0, $t1, prime_present	
    	
    	
	div     $a0, $t0
	mfhi    $t6         # $t6 now contains $a0 % $t0  
	
	beq $t6, $zero, no_prime_present		
    	
    	j loop
    	
    prime_present:
        li $v0, 1
        jr $ra    
    		
    no_prime_present:
    	li $v0, 0
    
    		
    #*****************************************
    jr $ra                  # jump to contents of return address register $ra
