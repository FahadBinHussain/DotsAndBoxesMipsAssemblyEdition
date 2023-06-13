check_second_not_same:
    # Save the return address on the stack
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # Load the first coordinate from memory into $t0
    la $t0, first_co
    # Load the second coordinate from memory into $t1
    la $t1, second_co
    # Compare the first letter of the first coordinate to the first letter of the second coordinate
    lb $t2, ($t0)
    lb $t3, ($t1)
    bne $t2, $t3, different_letters

    # Compare the second letter of the first coordinate to the second letter of the second coordinate
    lb $t2, 1($t0)
    lb $t3, 1($t1)
    bne $t2, $t3, different_letters

    # If the coordinates are the same, print the same coordinate message and loop back to read the second coordinate again
    j print_same_coordinate_message

different_letters:
    # If the coordinates are different, return 1 (valid)
    li $v0, 1

    # Restore the return address from the stack and return to the calling function
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

print_same_coordinate_message:
    # Print the same coordinate message
    li $v0, 4
    la $a0, same_message
    syscall

    # Jump back to read the second coordinate again
    j get_second_coordinate


