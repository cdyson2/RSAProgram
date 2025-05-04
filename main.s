# ------------------------------------------------------------
# Program Name : main.s
# Author       : Corey Dyson, Ziyu Lin, Joseph Cuttone
# Date         : 5/4/2025
# Purpose      : Main entry point for the RSA program. Displays a menu
#                and routes the user to key generation, encryption, or decryption.
#
# Functions    :
#   - _start: Initializes stack, shows menu, calls RSA subroutines
#
# Inputs       : User input from menu selection (scanf)
# Outputs      : Invokes RSA subroutines based on user choice
# ------------------------------------------------------------

.text
.global _start
.extern generate_keys
.extern encrypt_message
.extern decrypt_message
.extern menu_text
.extern scan_format
.extern menu_choice

_start:

    // Reserve stack space and preserve callee-saved registers
    SUB     sp, sp, #28
    STR     lr, [sp, #0]
    STR     r4, [sp, #4]
    STR     r5, [sp, #8]
    STR     r6, [sp, #12]
    STR     r7, [sp, #16]
    STR     r8, [sp, #20]
    STR     r9, [sp, #24]

menu_loop:
    // Display main menu
    LDR     r0, =menu_text
    BL      printf

    // Read menu selection from user
    LDR     r0, =scan_format
    LDR     r1, =menu_choice
    BL      scanf

    // Load user's choice
    LDR     r0, =menu_choice
    LDR     r0, [r0]

    CMP     r0, #1
    BEQ     do_generate_keys

    CMP     r0, #2
    BEQ     do_encrypt_message

    CMP     r0, #3
    BEQ     do_decrypt_message

    CMP     r0, #4
    BEQ     Done

    B       menu_loop      // Re-show menu on invalid input

do_generate_keys:
    BL      generate_keys
    B       menu_loop

do_encrypt_message:
    BL      encrypt_message
    B       menu_loop

do_decrypt_message:
    BL      decrypt_message
    B       menu_loop

Done:
    // Restore preserved registers
    LDR     lr, [sp, #0]
    LDR     r4, [sp, #4]
    LDR     r5, [sp, #8]
    LDR     r6, [sp, #12]
    LDR     r7, [sp, #16]
    LDR     r8, [sp, #20]
    LDR     r9, [sp, #24]
    ADD     sp, sp, #28
    MOV     pc, lr

# END OF _start

