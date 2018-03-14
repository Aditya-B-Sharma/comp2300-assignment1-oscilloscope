  .syntax unified
  .global main
  .type main, %function

@ for details on how this assignment template works, see
@ https://cs.anu.edu.au/courses/comp2300/assignments/01-synth/#getting-started


main:
  bl init
  mov r10, 12

loop:

  dot1:
    mov r0, 0xd8f0
    mov r11, pc
    b checkloop

  dot2:
    mov r0, 0xe2b4
    mov r11, pc
    b checkloop

  dot3:
    mov r0, 0xec78
    mov r11, pc
    b checkloop    

  dot4:
    mov r0, 0xf63c
    mov r11, pc
    b checkloop

  dot5:
    mov r0, 0x0
    mov r11, pc
    b checkloop

  dot6:
    mov r0, 0x9c4
    mov r11, pc
    b checkloop

  dot7:
    mov r0, 0x1388
    mov r11, pc
    b checkloop

  dot8:
    mov r0, 0x1d4c
    mov r11, pc
    b checkloop

  dot9:
    mov r0, 0x2710
    mov r11, pc
    b checkloop     
  
  b loop

  checkloop:
    bl BSP_AUDIO_OUT_Play_Sample
    subs r10, 1
    cmp r10, 0
    bne checkloop
    mov r10, 12
    mov pc, r11

  .size main, .-main

/*

    .syntax unified
  .global main
  .type main, %function

@ for details on how this assignment template works, see
@ https://cs.anu.edu.au/courses/comp2300/assignments/01-synth/#getting-started

init:
  bl init
  mov r9, 1 @tick counter

main:
  mov r8, 110

  cmp r9, 1
  beq dot1

  cmp r9, 2
  beq dot2

  cmp r9, 3
  beq dot3

  cmp r9, 4
  beq dot4

  cmp r9, 5
  beq dot5

  cmp r9, 6
  beq dot6

  cmp r9, 7
  beq dot7

  cmp r9, 8
  beq dot8

  cmp r9, 9
  beq dot9

loop:
  
  @ replace this infinite loop with your Part 1 code
  @ https://cs.anu.edu.au/courses/comp2300/assignments/01-synth/#part-1
  nop
  @110 hz
  dot1:
    mov r11, 0xb1e0
    add r9, r9, 1
    b play_loop



  dot2:
    mov r11, 0xc568
    add r9, r9, 1
    b play_loop



  dot3:
    mov r11, 0xd8f0
    add r9, r9, 1
    b play_loop

  

  dot4:
    mov r11, 0xec78
    add r9, r9, 1
    b play_loop



  dot5:
    mov r11, 0x0
    add r9, r9, 1
    b play_loop



  dot6:
    mov r11, 0x1388
    add r9, r9, 1
    b play_loop



  dot7:
    mov r11, 0x2710
    add r9, r9, 1
    b play_loop



  dot8:
    mov r11, 0x3a98
    add r9, r9, 1
    b play_loop



  dot9:
    mov r11, 0x4e20
    mov r9, 1
    b play_loop


  play_loop:
      subs r8, r8, 1
      mov r0, r11
      bl BSP_AUDIO_OUT_Play_Sample
      cmp r8, 0
      beq main
      bne play_loop
      b main

  .size main, .-main
  */