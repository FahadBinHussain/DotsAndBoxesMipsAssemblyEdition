return_greater:
    # Save the return address on the stack
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # Load the second characters of each coordinate from memory
    la $a0, first_co
    la $a1, second_co
    lb $t0, 1($a0)
    lb $t1, 1($a1)
    lb $t2, 0($a0)
    lb $t3, 0($a1)

    # Compare the first and second characters
    beq $t2, $t3, return_greater_number
    beq $t0, $t1, return_greater_letter

return_greater_number:

    bgt $t0, $t1, first_number_is_greater
    move $s0, $t1
    move $s1, $t0

    j end_return_greater

first_number_is_greater:

    move $s0, $t0
    move $s1, $t1

    j end_return_greater
    
return_greater_letter:

    bgt $t2, $t3, first_letter_is_greater
    move $s0, $t3
    move $s1, $t2

    j end_return_greater
    
first_letter_is_greater:

    move $s0, $t2
    move $s1, $t3

    j end_return_greater

end_return_greater:
    # Store the greater character in the "greater" variable as an integer
    la $t4, greater    # Load address of "greater" variable into $t0
    sw $s0, 0($t4)     # Store the value in $s0 as a 32-bit word at the location pointed to by $t0

    # Store the lower character in the "lower" variable as an integer
    la $t4, lower      # Load address of "lower" variable into $t0
    sw $s1, 0($t4)     # Store the value in $s1 as a 32-bit word at the location pointed to by $t0

    # Restore the return address from the stack and return
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra