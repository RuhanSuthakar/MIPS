# Written for ECE2071 S1 2024
# Copyright Monash University 2024

# Fix the errors in this program and examine its execution    

.text                       # Start generating instructions
.globl start                # This label should be globally known

start:
       li $t0, 0x1          # Load the value 1
       li $t1, 0x2          # Load the value 2
       add $t2, $t0, $t1   # Add the values, store in $t2
       sub $t3, $t1,$t0     # Subtract value 1 from value 2
                            # and store in $t3
infinite:
   	 j infinite          # an infinite loop so that the
   				            # computer will not execute code
   				            # past the end of the program
