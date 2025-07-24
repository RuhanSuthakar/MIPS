# Written for ECE2071 S1 2024
# Copyright Monash University 2024
# Multiplication via successive addition


.text                   # Start generating instructions
.globl main             # Makes the label main globally known
.text                   # Instructions in the program:
start:
# setting $t0 = 2 and $t1 = 3:
addi    $t0, $0, 2
addi    $t1, $0, 3


# main program:
main:
# WRITE YOUR CODE HERE
    add $s0, $zero, $zero
    
    mulipication:
    
    	ble $t1, $zero, infinite
    
    	add $s0, $s0, $t0
    	addi $t1, $t1, -1   
    	j mulipication


infinite:

     j infinite
