.data
    arr: .word -10, -5 , -2 , 2 , 5 , 7 , 11 , 14 , 20, 22 , 23, 24 , 27, 29, 30, 32, 35, 39, 40, 45, 46, 47 ,48, 49, 50, 53, 55, 56, 57, 59, 60, 61
    
.text
    .global main
    
main:
    
    xor	%r10,			%r10
    xor	%rax,			%rax
    xor	%rbx,			%rbx
    mov	arr@GOTPCREL(%rip),	%r13 	#store location of beginning address of array on rbx
    mov	$32,			%r9 	#just stored the length of my arraythis is my dx
    
    mov 	$0,			%rbx	#this is my lower bound
    mov	$51,			%r15 	#this is my key
    xor	%r14,			%r14
    
    .again:
    		inc	%r14
    		cmp	%r9,		%rbx
    		jg 	.fail
    		mov	%rbx,		%rax
    		add     %r9,		%rax
    		shr	$1,		%rax
    		mov 	%rax,		%r10	#my si
    	#	add 	%r10,		%r10
    		mov	-2(%r13,%r10,2),	%r8w
    		cmp	%r8,	  	%r15
    		jge 	.big
    		dec	%rax
    		mov	%rax,		%r9
    		jmp 	.again
    
    .big:
    		je 	.success
    		inc	%rax
    		mov 	%rax,		%rbx
    		jmp	.again
    		
    .success:
    		mov 	%r14,		%r9	#stores number of iterations
    		ret
  		#rax will give you position, r9 the number of iterations
    
    .fail:
    		mov 	$-1,	%r9		#displaying -1
    		ret
    		#r14 will give iterations, r9 the -1	
