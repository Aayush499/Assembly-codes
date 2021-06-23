.data
    arr: .word 5, -10, 32, 7, 18, 31, 9, 16, 11, 23, 17, 28, 6, 8, 19, 26, 3, 30, 1, 24, 25, 4, 15, 20, 27, 29, 0, 14, 21, 12, 13, -22
    
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
	    mov 	(%r10),		%ax
	    mov 	2(%r10),		%bx
	    cmp	%bx,			%ax
	    jl 	.next
	    mov	%bx,			(%r10)		#swapping
	    mov	%ax,			2(%r10)					
	    
	    .next:
	    		add 	$2,	%r10
	    		dec	%r11
	    	jnz .innerloop
	   dec		%r9
	   jnz	     .outerLoop
	   
mov     $0,                  %rcx
.L_test:
    
    xor     %rsi,                %rsi
    movw    (%r13,%rcx,2),       %si    
    inc     %rcx
    cmp     $32,                 %rcx
    jnz     .L_test

    ret
     
    
