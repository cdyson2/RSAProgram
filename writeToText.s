    .data
file_name:      .asciz "user_data.txt"
prompt:         .asciz "Enter a sentence: "
input_buffer:   .space 256

    .text
    .global main

main:
    @ --- Display prompt using write(1, prompt, 18) ---
    MOV R0, #1                      @ stdout
    LDR R1, =prompt
    MOV R2, #18
    BL write

    @ --- Read user input: read(0, buffer, 256) ---
    MOV R0, #0                      @ stdin
    LDR R1, =input_buffer
    LDR R2, =256
    BL read
    MOV R4, R0                      @ store bytes read

    CMP R4, #0
    BLE exit_program                @ skip if no input or error

    @ --- Open file: open("user_data.txt", O_WRONLY|O_CREAT|O_TRUNC, 0644) ---
    LDR R0, =file_name
    LDR R1, =577                    @ O_WRONLY | O_CREAT | O_TRUNC
    LDR R2, =420                    @ 0644 decimal
    BL open
    MOV R5, R0

    @ --- Write to file: write(fd, buffer, bytes_read) ---
    MOV R0, R5
    LDR R1, =input_buffer
    MOV R2, R4
    BL write

    @ --- Close file ---
    MOV R0, R5
    BL close

exit_program:
    MOV R0, #0
    BL exit

    .extern read
    .extern write
    .extern open
    .extern close
    .extern exit
