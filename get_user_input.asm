# Loop until a valid first coordinate is entered
get_first_coordinate:
    # Save the return address on the stack
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Print the prompt for the first coordinate
    li $v0, 4      # Set the system call code for printing a string
    la $a0, first_co_prompt
    syscall        # Print the string

    # Read user input
    li $v0, 8      # Set the system call code for reading a string
    la $a0, first_co   # Read user input into the input buffer
    li $a1, 3       # Set the maximum number of characters to read
    syscall         # Read user input

    # Validate the first coordinate
    jal validate_coordinate

    # Store the result of the validation check in $t0
    move $t0, $v0

    # If the first coordinate is invalid, print the invalid message and loop back to read the first coordinate again
    beqz $t0, print_invalid_first_coordinate
    j end_get_first_coordinate

print_invalid_first_coordinate:
    # Print the invalid message for the first coordinate
    li $v0, 4
    la $a0, invalid_message
    syscall

    # Jump back to the start of the loop to read the first coordinate again
    j get_first_coordinate

end_get_first_coordinate:
    # Restore the return address from the stack and return to the calling function
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

get_second_coordinate:
    # Save the return address on the stack
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Print the prompt for the second coordinate
    li $v0, 4      # Set the system call code for printing a string
    la $a0, second_co_prompt
    syscall        # Print the string

    # Read user input
    li $v0, 8      # Set the system call code for reading a string
    la $a0, second_co   # Read user input into the input buffer
    li $a1, 3       # Set the maximum number of characters to read
    syscall         # Read user input

    # Validate the second coordinate
    jal validate_coordinate

    # Store the result of the validation check in $t0
    move $t0, $v0

    # If the second coordinate is invalid, print the invalid message and loop back to read the second coordinate again
    beqz $t0, print_invalid_second_coordinate

    # Check if the second characters of the coordinates are consecutive
    jal is_second_consecutive
    
    beqz $v0, print_coordinate_not_consecutive

    j end_get_second_coordinate

print_invalid_second_coordinate:
    # Print the invalid message for the second coordinate
    li $v0, 4
    la $a0, invalid_message
    syscall

    # Jump back to the start of the loop to read the second coordinate again
    j get_second_coordinate

print_coordinate_not_consecutive:
    # Print the coordinate not consecutive message and loop back to read the second coordinate again
    li $v0, 4
    la $a0, not_consecutive_message
    syscall
    j get_second_coordinate

end_get_second_coordinate:
    # Restore the return address from the stack and return to the calling function
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
