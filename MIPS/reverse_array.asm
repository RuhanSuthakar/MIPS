# Written for ECE2071 S1 2024
# Copyright Monash University 2024
# Array Reversal

.text                       # Start generating instructions 
.globl reverse_array        # This label should be globally known

start:
    li  $a0, 0x10010000     # load argument register $a0 with address of an array
    jal reverse_array       # call the reverse array function
		
infinite:
    j infinite              # wait here when the operation has finished 

#---------------------------------------------------------------
# reverse_array - input parameter $a0 contains address of array
#   no return value needed for function
#---------------------------------------------------------------		
reverse_array:	
    #*****************************************
    # your code goes here 
    main:
    	lw $t0, 0($a0)   #number of elements
    	
    	#addi $t0, $t0, 1
    	li $s3, 4
	mult $s3, $t0
	mflo $s7   
	add $s6, $s3, $a0 #contains the adress of the first element
	add $s7, $s7,$a0  #containes adress of the last element
	
    	#A.   obtaining the last adress of the array in $s7, and first in $s6
   
    	lw $t0, 0($a0)   #number of elements
   	li $t2, 2  #divider of 2
    
   	div     $t0, $t2
    	mfhi    $t6         # $t6 now contains $t0% $t2
    	mflo    $t4         #contains divided value
    
    	li $t1, 0                   #start steps
    	add $t3, $zero, $t4  #middle step
    	
    	bne  $t6, $zero, odd 
    	j even 
    	
    	#B.   idenitfy if the the element are odd or even number
 
     odd:
     	 
     	lw $t5, 0($s6)   #t5 stores first element current
     	lw $t7, 0($s7)   #t7 stores last element current
    	
    	sw $t5, 0($s7)
     	sw $t7, 0($s6)   
     	
     	addi $s6, $s6, 4
     	addi $s7, $s7, -4	
     	
     	addi $t1, $t1, 1
     	bne $t1, $t3, odd 
     				
    	 jr $ra  
     
     even:
     	#addi $t1, $t1, -1
    	loop:
     		lw $t5, 0($s6)   #t5 stores first element current
     		lw $t7, 0($s7)   #t7 stores last element current
    	
    		sw $t5, 0($s7)
     		sw $t7, 0($s6)   
     	
     		addi $s6, $s6, 4
     		addi $s7, $s7, -4	
     	
     		addi $t1, $t1, 1
     		bne $t1, $t3, loop 
    
    #*****************************************
    jr $ra                  # jump to contents of return address register $ra

.data                                   # Items below this line will be stored in the
                                        # .data section of memory
# store the array in memory
.word 4, 654, 324, 42, 78
