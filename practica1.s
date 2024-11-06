//------------------------------------------------------------
// Programa: Convertir_Celsius_Fahrenheit.s
// Descripción: Convierte temperatura de Celsius a Fahrenheit.
// Autor: [gerardo]
// Fecha: [05/11/2024]
// Arquitectura: ARM64
//------------------------------------------------------------

.section .data
    prompt_msg: .asciz "Ingrese la temperatura en Celsius:\n"
    result_msg: .asciz "Temperatura en Fahrenheit: %.2f\n"

.section .text
    .global _start

_start:
    // Imprimir el mensaje de entrada
    ldr x0, =prompt_msg      // Cargar dirección de mensaje
    bl printf                // Llamar a printf para mostrar el mensaje

    // Leer la entrada del usuario en Celsius (suponiendo que ingresará un valor decimal)
    // Aquí, asumimos que tenemos acceso a scanf para leer el valor en x0 como un número de punto flotante
    mov x0, sp               // Apuntar al stack para almacenar el valor leído
    ldr x1, ="%lf"           // Especificador de formato para leer un valor double
    bl scanf                 // Llamar a scanf (almacena el valor en d0)

    // Conversion de Celsius a Fahrenheit
    fmov d1, d0              // Mover Celsius a d1 para cálculo
    fmul d1, d1, 1.8         // Multiplicar Celsius por 1.8
    fadd d1, d1, 32.0        // Sumar 32 al resultado para obtener Fahrenheit

    // Imprimir el resultado
    ldr x0, =result_msg      // Cargar la dirección del mensaje de resultado
    fmov x1, d1              // Mover Fahrenheit a x1 para pasar a printf
    bl printf                // Llamar a printf para mostrar el resultado

    // Salida del programa
    mov x0, 0                // Código de salida 0
    mov x8, 93               // syscall para salir en Linux (ARM64)
    svc 0                    // Llamada al sistema
