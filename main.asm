# Dots and Boxes Game in MIPS Assembly Language

.data
    board_title: .asciiz "0 1 2 3 4 5 6 7 8\n" 
    a: .asciiz ". . . . . . . . .\n"
    b: .asciiz ". . . . . . . . .\n"
    c: .asciiz ". . . . . . . . .\n"
    d: .asciiz ". . . . . . . . .\n"
    e: .asciiz ". . . . . . . . .\n"
    f: .asciiz ". . . . . . . . .\n"
    g: .asciiz ". . . . . . . . .\n"
    
    a_letter: .asciiz "a"
    b_letter: .asciiz "b"
    c_letter: .asciiz "c"
    d_letter: .asciiz "d"
    e_letter: .asciiz "e"
    f_letter: .asciiz "f"
    g_letter: .asciiz "g"

    num_0: .asciiz "x0"
    num_1: .asciiz "x1"
    num_2: .asciiz "x2"
    num_3: .asciiz "x3"
    num_4: .asciiz "x4"
    num_5: .asciiz "x5"
    num_6: .asciiz "x6"
    num_7: .asciiz "x7"
    num_8: .asciiz "x8"

    prompt: .asciiz "Your turn: \n"
    first_co_prompt: .asciiz "  Enter coordinate of the first dot: "
    second_co_prompt: .asciiz "  Enter coordinate of the second dot: "
    
    it_works: .asciiz "It works!\n"

    first_co: .space 3
    second_co: .space 3
    greater: .word 0
    lower: .word 0
    multiplier: .word 0

    valid_message: .asciiz "The input is valid.\n"
    invalid_message: .asciiz "The input is invalid.\n"
    same_message: .asciiz "The coordinates are the same.\n"
    not_consecutive_message: .asciiz "The coordinates are not consecutive.\n"

    # Define a null-terminated string containing the letters 'a' to 'g'
    letters: .asciiz "abcdefg"

.text

main:

    jal display_board

    jal get_first_coordinate

    jal get_second_coordinate

    jal return_greater

    jal update_board

    jal display_board
    
    # Print the it works message
    li $v0, 4
    la $a0, it_works
    syscall

exit:
    # Exit the program
    li $v0, 10
    syscall

.include "get_user_input.asm"
.include "validate_coordinate.asm"
.include "check_second_not_same.asm"
.include "update_board.asm"
.include "is_second_consecutive.asm"
.include "display_board.asm"
.include "return_greater.asm"