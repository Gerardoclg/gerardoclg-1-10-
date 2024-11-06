.section .data
celsius:     .word 25             // Temperatura en Celsius (25°C)
fahrenheit:  .word 0              // Variable para almacenar el resultado en Fahrenheit

.section .text
.global _start

_start:
    ldr w1, =celsius              // Cargar dirección de celsius en w1
    ldr w0, [w1]                  // Cargar el valor de celsius en w0

    // Multiplicamos Celsius por 9
    mov w2, #9
    mul w0, w0, w2                // w0 = Celsius * 9

    // Dividimos el resultado por 5
    mov w2, #5
    udiv w0, w0, w2               // w0 = w0 / 5

    // Sumamos 32 para completar la conversión
    add w0, w0, #32               // w0 = w0 + 32

    // Guardar el resultado en fahrenheit
    ldr w1, =fahrenheit
    str w0, [w1]                  // Almacena el resultado en fahrenheit

    // Syscall exit
    mov x8, #93
    svc #0
