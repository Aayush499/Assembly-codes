.data
    arr: .word 32, 37, -14, -48, 13, -15, -35, -3, -46, 1, -46, 34, 37, 0, -16, -32, 33, 32, 7, -44, 47, 38, -4, 15, 48, 25, 29, 3, -9, 50, 50, 23	
    
.text
    .global main
    
main:
 	
    xor	%r10,			%r10
    xor	%rax,			%rax
    xor	%rbx,			%rbx
    mov	arr@GOTPCREL(%rip),	%r13 	#store location of beginning address of array on rbx
    mov	$32,			%r9 	#just stored the length of my array
    dec	%r9				#This is my cx

#bubble sorting 32 numbers
 
.outerLoop:
    mov	arr@GOTPCREL(%rip),	%r10		#%r10 is my si
    mov 	%r9,			%r11		#%r11 is my dx
    
    
    
    .innerloop:
	    movw 	(%r10),		%ax
	    movswq 	2(%r10),		%rbx  # hello
	    cmpw	%bx,			%ax
	    jl 	.next
	    movw	%bx,			(%r10)		#swapping
	    movw	%ax,			2(%r10)					
	    
	    .next:
	    		add 	$2,	%r10
	    		dec	%r11
	    	jnz .innerloop
			   dec		%r9
			   jnz	     .outerLoop
	   
mov     $0,                  %rcx

.L_test:					#testing the code
    
    xor     %rsi,                %rsi
    movswq    (%r13,%rcx,2),       %rsi    
    inc     %rcx
    cmp     $32,                 %rcx
    jnz     .L_test

    ret
     
    
