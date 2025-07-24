# Written for ECE2071 S1 2024
# Copyright Monash University 2024
# Stack Usage program   

.text                       # Start generating instructions
.globl start                # This label should be globally known

start: 
    #*****************************************
    # your code goes here 
    
    li $t0, 1
    li $t1, 11
     
    loop:
    	addi  $sp, $sp, -4
    	sw $t0, 0($sp)
    	
    	addi $t0, $t0, 1
    	bne $t0, $t1, loop
    
    
 
    #*****************************************


infinite:
        j infinite
