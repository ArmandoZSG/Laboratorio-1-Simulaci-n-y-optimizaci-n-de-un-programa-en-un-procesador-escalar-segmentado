.data
prompt: .asciiz "Ingrese el primer n�mero: "
prompt2: .asciiz "Ingrese el segundo n�mero: "
prompt3: .asciiz "Ingrese el tercer n�mero: "
result_msg: .asciiz "El n�mero menor es: "

.text
main:
    # Imprimir el primer prompt y leer el primer n�mero
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $t0, $v0 # Guardar el primer n�mero en $t0
    
    # Imprimir el segundo prompt y leer el segundo n�mero
    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0 # Guardar el segundo n�mero en $t1
    
    # Imprimir el tercer prompt y leer el tercer n�mero
    li $v0, 4
    la $a0, prompt3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0 # Guardar el tercer n�mero en $t2
    
    # Comparar los n�meros y encontrar el menor
    move $t3, $t0 # Inicializar $t3 con el primer n�mero
    blt $t3, $t1, check_t1 # Comparar con el segundo n�mero
    move $t3, $t1 # Actualizar con el segundo n�mero si es menor
check_t1:
    blt $t3, $t2, print_t3 # Comparar con el tercer n�mero
    move $t3, $t2 # Actualizar con el tercer n�mero si es menor
print_t3:
    # Imprimir el resultado
    li $v0, 4
    la $a0, result_msg
    syscall
    li $v0, 1
    move $a0, $t3
    syscall
    li $v0, 10
    syscall

