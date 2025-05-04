## 1. Introduction
### 1.1 Purpose  
The purpose of this project is to implement the RSA algorithm using ARM Assembly, providing an educational experience in low-level cryptographic computations and team-based software development. The implementation will include:
Key generation (public and private keys).
Encryption of messages using the public key.
Decryption of messages using the private key.
File handling for encrypted and plaintext messages.
### 1.2 Scope  
This project will be developed in ARM Assembly, following a modular approach with separate functions in a library (RSALib). The program will:
Generate RSA key pairs (limited to small values of p and q).
Encrypt a user-provided message and save the result to encrypted.txt.
Decrypt the message from encrypted.txt and save the output to plaintext.txt.
1.3 Goals & Constraints  
✔ Correctness: RSA encryption and decryption must function correctly.  
✔ Efficiency: Functions should be optimized for ARM performance.  
✔ Readability: Code will follow Chuck Kann’s ARM Assembly Code Style Guide.  
✔ Security Considerations: While small values are used, the algorithm should align with cryptographic best practices.  
✔ Bonus: If time permits, we will implement RSA for large numbers (BigInt handling).  

## 2. System Architecture  
### 2.1 High-Level Flow
User selects an option (Generate Keys, Encrypt, Decrypt).  
Generate Public/Private Keys:  
User enters p and q (prime numbers).  
Compute n = p * q and Φ(n) = (p - 1) * (q - 1).  
Generate public and private key exponents (e, d).  
Encrypt a Message:  
Convert plaintext to ASCII.  
Compute: c = m^e mod n.  
Save encrypted text to encrypted.txt.  
Decrypt a Message:  
Read encrypted text from encrypted.txt.  
Compute: m = c^d mod n.  
Convert ASCII to characters.  
Save decrypted text to plaintext.txt.  

## 3. Functional Specification  
### 3.1 User Interface  
### 3.1.1 Menu System  
A simple menu will be displayed using printf:  
mathematica  
CopyEdit  
Select an option:    
1 - Generate Public and Private Keys  
2 - Encrypt a Message  
3 - Decrypt a Message  
4 - Exit  

Users will input choices via scanf.  
### 3.2 Key Generation (generate_keys)  
### 3.2.1 Input  
User enters two prime numbers p and q (p, q < 50).  
User enters a small public exponent e.  
### 3.2.2 Steps  
Prime Check (is_prime): Verify p and q are prime.  
Compute n = p * q (modulus).  
Compute Φ(n) = (p - 1) * (q - 1).  
Select Public Key Exponent e:  
1 < e < Φ(n), and gcd(e, Φ(n)) = 1.  
Compute Private Key Exponent d:  
ini  
CopyEdit  
d = (1 + x * Φ(n) ) / e for some integer x  


Store Keys in Memory:  
(n, e): Public Key  
(n, d): Private Key  
### 3.2.3 Output  
Display generated public and private keys.  
### 3.3 Encryption (encrypt_message)  
### 3.3.1 Input  
User enters a plaintext message.  
Uses the public key (n, e).  
### 3.3.2 Steps  
Convert characters to ASCII (char_to_ascii).  
Encrypt each character using:  
ini  
CopyEdit  
c = m^e mod n  


Save encrypted message to encrypted.txt.  
### 3.3.3 Output  
Display encrypted message.  
Confirm message is written to encrypted.txt.  
### 3.4 Decryption (decrypt_message)  
### 3.4.1 Input  
Read encrypted.txt.  
Uses the private key (n, d).  
### 3.4.2 Steps  
Read encrypted characters from encrypted.txt.  
Decrypt using:  
ini  
CopyEdit  
m = c^d mod n  


Convert ASCII values back to characters (ascii_to_char).  
Save decrypted message to plaintext.txt.  
### 3.4.3 Output  
Display decrypted message.  
Confirm message is written to plaintext.txt.  

## 4. Software Modules  
Function Name  
Purpose  
generate_keys  
Generate RSA keys  
is_prime  
Check if a number is prime  
gcd  
Compute the Greatest Common Divisor  
encrypt_message  
Encrypts a user message  
decrypt_message    
Decrypts an encrypted message  
mod_exp  
Compute modular exponentiation  


## 5. File Handling  
File  
Purpose  
encrypted.txt  
Stores encrypted message  
plaintext.txt  
Stores decrypted message  

