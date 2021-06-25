.text
.global rotate

rotate:

     
    mov     $4,         %r8      # n / 2
    mov     $7,         %r9      # n - 1
    xor     %ecx,       %ecx     # counter i = 0 -> i < n / 2
   
  xor	    %r13,	        %r13	# my j	
    
.outerloop:
	
	leaq     (,%rcx,8),       %r10    # j = i -> j < n - N - i - 1
    leaq    (,%r10,2),           %r10    
    leaq     (%rdi,%r10),        %r11
    xor     %r12,       %r12           # this is my j, reset to 0
        .innerLoop:
           
            movw     (%r11, %r12, 2),     %r13w # this is arr[i][j]

            
            
            inc     %r12                        # incrementing j
            cmpq    $8,     %r12
            jl      .innerLoop
            
        inc	        %rcx                    # incrementing i
        cmp	        $8,		%rcx
        jl	.outerloop
        ret
