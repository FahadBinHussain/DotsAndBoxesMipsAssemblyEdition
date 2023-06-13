# Function to check if two coordinates have consecutive second characters
# Arguments:
#   $a0 - pointer to first coordinate
#   $a1 - pointer to second coordinate
# Returns:
#   1 if second characters are consecutive, 0 otherwise
is_second_consecutive:
    # Save the return address on the stack
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # Load the second characters of each coordinate from memory
    la $a0, first_co
    la $a1, second_co
    lb $t0, 1($a0)
    lb $t1, 1($a1)
    lb $t3, 0($a0)
    lb $t4, 0($a1)

    beq $t3, $t4, is_second_character_consecutive

    j is_first_character_consecutive

is_second_character_consecutive:
    # Save the return address on the stack
    addi $sp, $sp, -4
    sw $ra, 0($sp)


    # Check if the second characters are consecutive
    sub $t2, $t1, $t0
    beq $t2, 1, return_true
    beq $t2, -1, return_true
    
    j return_false

is_first_character_consecutive:
    # Save the return address on the stack
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # Check if the first characters are consecutive
    sub $t2, $t3, $t4
    beq $t2, 1, is_second_character_same
    beq $t2, -1, is_second_character_same

    j return_false

is_second_character_same:
    # Save the return address on the stack
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    beq $t0, $t1, return_true

    j return_false

return_true:
    # If consecutive, return 1
    li $v0, 1

    # Restore the return address from the stack and return to the calling function
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

return_false:
    # If not consecutive, return 0
    li $v0, 0
    
    # Restore the return address from the stack and return to the calling function
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
