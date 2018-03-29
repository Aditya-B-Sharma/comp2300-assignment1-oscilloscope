  .syntax unified
  .global main
  .type main, %function

@ for details on how this assignment template works, see
@ https://cs.anu.edu.au/courses/comp2300/assignments/01-synth/#getting-started

main:
  bl init

loop:
  mov r10, 109
  mov r0, 0xaad8

checkloop:
  add r6, r0, 400
  bl BSP_AUDIO_OUT_Play_Sample
  mov r0, r6
  subs r10, 1
  bne checkloop
  beq loop

.size main, .-main  