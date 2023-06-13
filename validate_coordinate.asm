validate_coordinate:
    # Validate the coordinate
    # Load the first character into $t0
    lb $t0, ($a0)
    # Check if the first character is equal to any letter from 'a' to 'g'
    la $t1, letters

    is_first_char_equal_to_a_to_g:
        lb $t2, ($t1)
        beq $t0, $t2, is_second_char_equal_to_0_to_8
        addi $t1, $t1, 1
        bne $t2, $zero, is_first_char_equal_to_a_to_g

        j is_false

    is_second_char_equal_to_0_to_8:
        # Load the second character into $t0
        lb $t0, 1($a0)

        # Check if the second character is a number between 0 and 8
        li $t1, '0'
        li $t2, '8'
        blt $t0, $t1, is_false
        bgt $t0, $t2, is_false

        # If the input is valid, return success
        li $v0, 1
        jr $ra

    is_false:
        # If the input is not valid, return failure
        li $v0, 0
        jr $ra
