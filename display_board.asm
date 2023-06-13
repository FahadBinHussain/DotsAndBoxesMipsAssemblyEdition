display_board:

    li $v0, 4      # Set the system call code for printing a string
    la $a0, board_title  # Print the title
    syscall        # Print the title

    li $v0, 4      # Set the system call code for printing a string
    la $a0, a  # Print the board
    syscall        # Print the board

    li $v0, 4      # Set the system call code for printing a string
    la $a0, b  # Print the board
    syscall        # Print the board

    li $v0, 4      # Set the system call code for printing a string
    la $a0, c  # Print the board
    syscall        # Print the board

    li $v0, 4      # Set the system call code for printing a string
    la $a0, d  # Print the board
    syscall        # Print the board

    li $v0, 4      # Set the system call code for printing a string
    la $a0, e  # Print the board
    syscall        # Print the board

    li $v0, 4      # Set the system call code for printing a string
    la $a0, f  # Print the board
    syscall        # Print the board

    li $v0, 4      # Set the system call code for printing a string
    la $a0, g  # Print the board
    syscall        # Print the board

    li $v0, 4      # Set the system call code for printing a string
    la $a0, prompt  # Print the prompt
    syscall        # Print the prompt

    jr $ra
    