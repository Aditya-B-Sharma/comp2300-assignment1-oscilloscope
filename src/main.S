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
  mov r0, 0x5528


trianglelowloop:
  sub r6, r0, 807
  bl BSP_AUDIO_OUT_Play_Sample
  mov r0, r6
  subs r10, 1
  bne trianglelowloop
  mov r10, 54
  mov r0, 0xaad8

trianglehighloop:
  add r6, r0, 807
  bl BSP_AUDIO_OUT_Play_Sample
  mov r0, r6
  subs r10, 1
  bne trianglehighloop
  mov r10, 54 
  b lowloop


.size main, .-main  



/*
main:
  @@ initialise 
start:
  @@ initialise increment ceiling
  @@ initialise upper amplitude ceiling
  @@ initialise lower amplitude ceiling
squarelow:
  @@ put lower amplitude ceiling into r0
  @@ play sample
  @@ decrement tick
  @@ check for tick == 0, if tick /= 0,
  @@ branch to squarelow
  @@ else, reset increment ceiling and go to squarehigh
squarehigh:
  @@ put higher amplitude ceiling into r0
  @@ play sample
  @@ decrement tick
  @@ check for tick == 0, if tick /= 0,
  @@ branch to squarehigh
  @@ else, reset increment ceiling and,
  @@ set r0 to higher amplitude ceiling and,
  @@ continue to triangle low
trianglelow:
  @@ put higher amplitude ceiling into r0
  @@ save higher amplitude ceiling minus decrement value 
  @@ play sample
  @@ decrement r0
  @@ decrement tick
  @@ check for tick == 0, if tick /= 0,
  @@ branch to trianglelow
  @@ else, reset increment/decrement ceiling and,
  @@ set r0 to lower ceiling and go to squarehigh
trianglehigh:
  @@ put lower amplitude ceiling into r0
  @@ save lower amplitude ceiling minus decrement value 
  @@ play sample
  @@ increment r0
  @@ decrement tick
  @@ check for tick == 0, if tick /= 0,
  @@ branch to trianglehigh
  @@ else, reset increment/decrement ceiling and,
  @@ branch to squarelow */