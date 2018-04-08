#####################################
#
#输入10个数并排序  by Zhuyuze
#
#####################################

.data
    num:     .space 60
    msg1:    .asciiz  "\ninput 10 integers: "
    msg2:    .asciiz  "\n\noutput: "
    bfs:     .asciiz  "\nbefore sorted: "
    space:   .asciiz  " "
.text
.globl main
main:
    li    $v0, 4
    la    $a0, msg1
    syscall
    la    $t7, num
    #addi  $sp, $sp, -40
    add   $t1, $0, $0
input:
    li    $v0, 5
    add  $t1, $t1, 1
    syscall
    move  $t2, $v0   
    sw    $t2, 0($t7)
    add   $t7, $t7, 4
    slt   $t2, $t1, 10
    bnez  $t2, input

    li    $v0, 4
    la    $a0, bfs
    syscall
    add   $t1, $0, $0
    la    $t7, num
output1:
    li    $v0, 1
    lw    $a0, 0($t7)
    add   $t1, $t1, 1
    syscall
    li    $v0, 4
    la    $a0, space
    syscall
    add   $t7, $t7, 4
    slt   $t2, $t1, 10
    bnez  $t2, output1

    add   $t6, $0, $0
sortout:
    add   $t6, $t6, 1
    add   $t1, $0, 10
sortin:
    sub   $t1, $t1, 1
    mul   $t2, $t1, 4   
    la    $t7, num
    add   $t7, $t7, $t2
    lw    $t4, 0($t7)
    sub   $t7, $t7, 4
    lw    $t5, 0($t7)
    slt   $t3, $t4, $t5
    bnez  $t3, else
    sw    $t4, 0($t7)
    add   $t7, $t7, 4
    sw    $t5, 0($t7)
else:
    slt   $t3, $t1, 2
    beqz  $t3, sortin
    slt   $t8, $t6, 10
    bnez  $t8, sortout
    li    $v0, 4
    la    $a0, msg2
    syscall
    add   $t1, $0, $0
    la    $t7, num
output:
    li    $v0, 1
    lw    $a0, 0($t7)
    add   $t1, $t1, 1
    syscall
    li    $v0, 4
    la    $a0, space
    syscall
    add   $t7, $t7, 4
    slt   $t2, $t1, 10
    bnez  $t2, output
    li    $v0, 10
    syscall

    



