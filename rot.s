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

    leaq     (%rax,%r10),        %r11
     xor     %r12,       %r12
        .innerLoop:
           
        movw     (%r11, %r12, 2),     %r13w # r11 = &arr[i][j]

        #     mov     (%r11),              %r12w # r12 = temp = arr[i][j
           
		inc     %r12
        cmpq    $8,     %r12
        jl      .innerLoop
		inc	        %rcx
		cmp	        $8,		%rcx
		jl	.outerloop
		ret
