.data
arr:
	.word 0xc, 0xa, 0xf, 0xe
	.word 0xb, 0, 0, 0xb
	.word 0xd, 0xe, 0xa, 0xd
	.word 0xb, 0xa, 0xb, 0xe

# Номер столбца: 0, 1, 2 или 3
target: .byte 2

.text
.globl main

main:
    la a0, arr		# первый аргумент: адрес начала массива
    lb a1, target	# a1 = номер столбца
	jal ra, foo

	mv a1, a0		# число для печати
    li a0, 1		# ecall №1 — печать целого числа
    ecall

    li a0, 10           # ecall №10 — завершение программы
    ecall

foo:
	mv t0, a0
	mv t1, a1 
    li t2, 0		# t2 = i = 0
    li t3, 4		# t3 = количество строк
    li t4, 0		# t4 = сумма

loop:

    # offset = i * 16 + col * 4
    slli t5, t2, 4     # t5 = i * 16  кол-во столбцов на размер элементов
    slli t6, t1, 2     # t6 = col * 4 размер элемента
    add t5, t5, t6     

    add t5, t0, t5     # t5 = адрес array[i][col]
    lw t6, 0(t5)       # t6 = array[i][col]

    add t4, t4, t6     # sum += array[i][col]

    addi t2, t2, 1

	bne t2,t3,loop

	mv a0, t4
    ret  