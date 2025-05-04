.text
_start:
    
    SUB sp, sp, #28
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]
    STR r6, [sp, #12]
    STR r7, [sp, #16]
    STR r8, [sp, #20]
    STR r9, [sp, #24]
    
    # Main Menu
    menu_loop:
        LDR r0, =menu_text
            BL printf


            LDR r0, =scan_format
            LDR r1, =menu_choice
            BL scanf


            LDR r0, =menu_choice
            LDR r0, [r0]


            CMP r0, #1
            BEQ do_generate_keys
    
        CMP r0, #2
        BEQ encrypt_message
        
        CMP r0, #3          @ Decrypt
        BEQ do_decrypt_message


        CMP r0, #4
            BEQ Done
    
        B menu_loop     @ re-show menu if input was invalid
    
    do_generate_keys:
            BL generate_keys
            B menu_loop


    do_encrypt_message:
            BL encrypt_message
            B menu_loop


do_decrypt_message:
        BL decrypt_message
        B menu_loop
                
    Done:
        LDR lr, [sp, #0]
        LDR r4, [sp, #4]
        LDR r5, [sp, #8]
        LDR r6, [sp, #12]
        LDR r7, [sp, #16]
        LDR r8, [sp, #20]
        LDR r9, [sp, #24]
        ADD sp, sp, #28
        MOV pc, lr
