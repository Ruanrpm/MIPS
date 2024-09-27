.data 
	print_entrada: .asciiz "escreva os numeros que voce deseja ordenar: \n"
	espaço: .asciiz "\n"
	print_saida: .asciiz "assim ficou os numeros ordenados: \n"
.text
.globl main

main:
	li $v0 , 4
	la $a0 , print_entrada
	syscall	

	li $v0, 5
	syscall
	move $t0 , $v0

	li $v0, 5
	syscall
	move $t1 , $v0

	li $v0, 5
	syscall
	move $t2 , $v0
	
	#chamar função
	jal funct_ordenar
	
	li $v0 , 4
	la $a0 , print_saida
	syscall
	
	move $a0 , $t0
	li $v0 , 1
	syscall
	
	li $v0 , 4
	la $a0 , espaço
	syscall
	
	move $a0 , $t1
	li $v0 , 1
	syscall
	
	li $v0 , 4
	la $a0 , espaço
	syscall
	
	move $a0 , $t2
	li $v0 , 1
	syscall
	j fim	
	

#funçao ordenar
funct_ordenar: 
	bge $t0 , $t1 , if1
	bge $t1 , $t2 , if2
	jr $ra
	
	if1:
	move $t4 , $t0
	move $t0 , $t1
	move $t1 , $t4
	bge $t1 , $t2 , if2
	jr $ra
	
	if2:
	move $t4 , $t1
	move $t1 , $t2
	move $t2 , $t4
	bge $t0 , $t1 , if1
	
	#voltar para o main
	jr $ra
fim:









