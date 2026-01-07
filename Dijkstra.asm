section .data
    n       equ 5
    INF     equ 9999

    graph   dd  0, 4, 0, 0, 2
            dd  4, 0, 3, 0, 0
            dd  0, 3, 0, 5, 0
            dd  0, 0, 5, 0, 1
            dd  2, 0, 0, 1, 0

    dist    dd  INF, INF, INF, INF, INF
    visited db  0, 0, 0, 0, 0

section .text
    global _start

_start:
    mov dword [dist], 0      ; distance du sommet source = 0
    mov ecx, n               ; nombre d’itérations

main_loop:
    dec ecx
    js end

    ; (Sélection du sommet avec distance minimale non visité — simplifiée)
    ; (Mise à jour des distances — logique conceptuelle)

    jmp main_loop

end:
    mov eax, 60              ; syscall exit
    xor edi, edi
    syscall
