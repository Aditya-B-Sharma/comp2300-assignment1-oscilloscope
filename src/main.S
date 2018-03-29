  .syntax unified
  .global main
  .type main, %function

@ for details on how this assignment template works, see
@ https://cs.anu.edu.au/courses/comp2300/assignments/01-synth/#getting-started

main:
  bl init

loop:
  mov r10, 54
  mov r1, 0xaad8  @@lower range of square wave
  mov r2, 0x5528  @@upper range of square wave

lowloop:
  mov r0, 0xaad8
  bl BSP_AUDIO_OUT_Play_Sample
  subs r10, 1
  bne lowloop
  mov r10, 54

highloop:
  mov r0, 0x5528
  bl BSP_AUDIO_OUT_Play_Sample
  subs r10, 1
  bne highloop
  mov r10, 54
  b lowloop


.size main, .-main  