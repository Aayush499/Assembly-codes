.text
.global rotate

rotate:

     
   # mov     $4,         %r8      # n / 2
   xor      %r8,        %r8
    mov     $7,         %r9      # n - 1
    xor     %ecx,       %ecx     # counter i = 0 -> i < n / 2
   
  xor	    %r13,	        %r13	# my temp variable
    
.outerloop:
	
     
	leaq     (,%rcx,8),       %r10     
    leaq    (,%r10,2),           %r10    
    leaq     (%rdi,%r10),        %r11  # &arr[i]
    mov     %rcx,       %r12           # this is my j, reset to i
        .innerLoop:
           
           mov     $7,         %r9 
            mov     %r9,        %r14


            
            movw     (%r11, %r12, 2),     %r13w # this is arr[i][j] : temp = arr[i][j]
            
            subq    %rcx,   %r9                 # this is N-1-i
            subq    %r12,   %r14                # this is N-1-j

            leaq    (,%r9,8),       %rbx        # contains 8*(N-1-i)
            leaq    (%rax,%rbx,2),  %rbx        # now contains &arr[N-1-i]
            
            leaq    (,%r14,8),       %rdx        # contains 8*(N-1-j)
            leaq    (%rax,%rdx,2),  %rdx        # now contains &arr[N-1-j]

            leaq    (,%r12,8),       %r15       # contains 8*(j)
            leaq    (%rax,%r15,2),  %r15        # now contains &arr[j]

            movw    (%r15,%r9,2),   %r8w         # r8 contains arr[N-1-j][i]
            movw    %r8w,         (%r11, %r12, 2) #   a[i][j] = a[N - 1 - j][i];   (((((((1)))))))

            movw    (%rbx,%r14,2),   %r8w         # r8 contains arr[N - 1 - i][N - 1 - j];
            movw    %r8w,         (%r15, %r9, 2) #   a[i][j] = a[N - 1 - j][i];   (((((((2)))))))

            movw    (%rdx,%rcx,2),   %r8w         # r8 contains arr[N - 1 - y][i];
            movw    %r8w,         (%rbx, %r14, 2) #   a[i][j] = a[N - 1 - j][i];   (((((((3)))))))

             movw    %r13w,   (%rdx,%rcx,2)        # r8 contains arr[N - 1 - y][i];

            inc     %r12                        # incrementing j

            
            cmpq    %r9,     %r12
            jl      .innerLoop

        inc	        %rcx                    # incrementing i
        cmp	        $4,		%rcx
        jl	.outerloop
        ret
