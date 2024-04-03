.data
num: .asciiz "Ingrese un n�mero para la serie Fibonacci: "
fib_msg: .asciiz "La serie Fibonacci es: "

.text
main:
    # Imprimir el num y leer el n�mero
    li $v0, 4
    la $a0, num
    syscall
    li $v0, 5
    syscall
    move $t0, $v0 # Guardar el n�mero en $t0
    
    # Inicializar los primeros dos n�meros de la serie Fibonacci
    li $t1, 0 # F(0)
    li $t2, 1 # F(1)
    
    # Imprimir mensaje de inicio de la serie Fibonacci
    li $v0, 4
    la $a0, fib_msg
    syscall
    
    # Caso especial: si el n�mero ingresado es 0, la serie Fibonacci es 0
    beq $t0, $zero, print_0
    
    # Mostrar el primer n�mero de la serie Fibonacci
    li $v0, 1
    move $a0, $t1
    syscall
    
    # Calcular y mostrar la serie Fibonacci
    loop:
        # Calcular el siguiente n�mero en la serie Fibonacci
        add $t3, $t1, $t2 # F(n) = F(n-1) + F(n-2)
        
        # Comprobar si se ha alcanzado el n�mero ingresado
        bge $t3, $t0, end_loop
        
        # Mostrar coma y espacio
        li $v0, 4
        la $a0, ", " # Aqu� cargamos directamente la direcci�n de la cadena
        syscall
        
        # Mostrar el n�mero actual
        li $v0, 1
        move $a0, $t3
        syscall
        
        # Actualizar los valores de la serie para el siguiente c�lculo
        move $t1, $t2 # Actualizar F(n-1)
        move $t2, $t3 # Actualizar F(n-2)
        
        # Volver al inicio del bucle
        j loop
    
    end_loop:
    # Mostrar nueva l�nea y terminar programa
    li $v0, 4
    la $a0, "\n"
    syscall
    li $v0, 10
    syscall
    
    # Etiqueta para imprimir 0 si el n�mero ingresado es 0
    print_0:
    li $v0, 4
    la $a0, "0"
    syscall
    j end_loop
