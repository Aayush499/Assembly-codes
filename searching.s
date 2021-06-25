

.text
.global search

search:
    mov     $32,    %r15 
    # rdi, rcx, r8, r9, r10, r11, r12, r13, r15,
    xor     %rax,       %rax
    xor     %ecx,       %ecx

    
        .loop:
            movb     (%rdi,%rcx),  %r8b
            cmpb      %sil,            %r8b    
            je  .success
            jmp .next
            .success:
                inc     %rax
                jmp     .next

            .next:
                inc     %rcx
                cmp     %r15,      %rcx
                jle     .loop

            
     ret

