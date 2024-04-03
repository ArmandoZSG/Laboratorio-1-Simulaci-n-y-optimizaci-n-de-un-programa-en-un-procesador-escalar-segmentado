.data 
num1: .asciiz "Ingrese el Primer numero: "
num2: .asciiz "Ingrese el segundo numero: "
num3: .asciiz "Ingrese el tercer numero: "
result_msg: .asciiz "El numero mayor es: "

.text
main:
   #Imprimir el primer numero y leer el primer numero
   li $v0, 4
   la $a0, num1
   syscall
   li $v0, 5
   syscall
   move $t0, $v0 # Guardar el primer numero en $t0
   
   	#Imprimir el segundo numero y leer el segundo numero 
   	li $v0, 4
   	la $a0, num2
   	syscall
   	li $v0,5
   	syscall
   	move $t1, $v0 #	Guardar el segundo numero en $t1
   	
   	#Imprimir el tercer numero y leer el tercer numero 
   	li $v0, 4
   	la $a0, num3
        syscall
        li $v0, 5
        syscall
        move $t2, $v0 #Guardar el tercer numero en $t2
        
        #Comparar los numeros y encontrar el mayor 
         move $t3, $t0 # Inicializar $t3 con el primer número
         bgt $t1, $t3, check_t1 # Comparar con el segundo número
         move $t3, $t1 # Actualizar con el segundo número si es mayor
check_t1:
   	  bgt $t2, $t3, print_t2 # Comparar con el tercer número
   	  move $t3, $t2 # Actualizar con el tercer número si es mayor
   	  print_t2:
    # Imprimir el resultado
    li $v0, 1
    move $a0, $t3
    syscall
    li $v0, 10
    syscall  	