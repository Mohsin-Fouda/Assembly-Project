include Irvine32.inc
.DATA

ground1 BYTE ".,---,---..-.--+--.,,-..,_.--,--'`,---..-.--+--.,,-,,..._.--...._.-.__...,..,___.--,--'`,---..-.--+--.,,-,,..._.--....",0

es6            db "   ->  Your Score is:            ########        ##          ##    ##      ########                           ", 0
es7            db "                                ##      ##      ####         ###  ###      ##     #                           ", 0
es8            db "                               ###       #      # ##        ## ## # ##     ##                                 ", 0
es9            db "   ->  Play Again?             ###             ##  ##       ##  ##  ##     #####                              ", 0
es10           db "                               ###    ####     ######       ##  ##  ##     ##                                 ", 0
es11           db "       Press Space             ###      ##    ##   ##      ##        ##    ##                                 ", 0 
es12           db "                                ###     ##    ##    ##     ##        ##    ##     #                           ", 0
es13           db "                                 ########    ###    ###   ####      ####   ########                           ", 0
es14           db "                                                                                                              ", 0
es15           db "                                                                                                              ", 0
es16           db "                                 #######      ###      ###    ########    ########                            ", 0
es17           db "                                ##     ###     ##      ##     ##     #    ##     ##                           ", 0
es18           db "                               ##       ###    ##      ##     ##          ##      #                           ", 0
es19           db "            ################   ##       ###    ##     ##      #####       ##    ###    ################       ", 0
es20           db "                               ##       ###     ##    ##      ##          #######                             ", 0
es21           db "                               ##       ###     ##   ##       ##          ##   #                              ", 0
es22           db "                                ##     ###        ####        ##     #    ##    ##                            ", 0
es23           db "                                 #######           ##         ########    ##     ####                         ", 0
es24           db "																												 ", 0
es27           db "							                                                   				                     ", 0
es28           db "                                                                                                              ", 0
es29           db "                                                                                                              ", 0
es30           db "																                                                 ", 0
es31           db "                                                                                                              ", 0
amount db 99
score db "Score : ",0
scorecounter dd 0,0
x BYTE 20	
y BYTE 28 ; edited
inputchar BYTE "h"
isJumping BYTE 'F'




.CODE
MAIN PROC	



mov dl , 0
mov dh , 29
call Gotoxy
lea dx , ground1
call WriteString

;-------- Display Score : ----------

mov dl , 80
mov dh , 15
call gotoxy
lea dx , score
call WriteString

call dp
call DrawCollision
	
	gameLoop:						;make collision move:

			cmp amount,99
			jge onGround2
			call UpdateCollison
			dec amount
			cmp amount , 21			;making the collison stop at player to check if it jumped 
			je therest
			call DrawCollision
			mov eax,25
			call delay
			jmp gameLoop

		
		
	onground2:

		 	call UpdateCollison
			mov amount , 50			; making the collision move back to its initial place
			call DrawCollision
 			cmp amount , 10
			jg restt
			je therest
			
	restt:							;gravity logic:
			mov y ,20

	gravity:
			cmp y,26
			jge onGround 
			add y ,8
			add x , 3
			mov eax,250
			call delay
			jmp gameLoop
			jmp gravity
 

	onGround:

	 		therest:
				call UpdateCollison
				mov eax,25 
				call delay







;-----------------get user key input-------------------------------------
		
there20:
	 
		mov  eax,50          ; sleep, to allow OS to time slice
		call Delay           ; (otherwise, some key presses are lost)
		call ReadKey    
		cmp al , 'x'
		je KeepGoing
		jne EndScreen

;----------------------   End Screen Label   -----------------------------


EndScreen:

mov dl , 0
mov dh , 2
call gotoxy
mov edx , OFFSET es6
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 3
call gotoxy
mov edx , OFFSET es7
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 4
call gotoxy
mov edx , OFFSET es8
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 5
call gotoxy
mov edx , OFFSET es9
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 6
call gotoxy
mov edx , OFFSET es10
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 7
call gotoxy
mov edx , OFFSET es11
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 8
call gotoxy
mov edx , OFFSET es12
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 9
call gotoxy
mov edx , OFFSET es13
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 10
call gotoxy
mov edx , OFFSET es14
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 11
call gotoxy
mov edx , OFFSET es15
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 12
call gotoxy
mov edx , OFFSET es16
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 13
call gotoxy
mov edx , OFFSET es17
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 14
call gotoxy
mov edx , OFFSET es18
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 15
call gotoxy
mov edx , OFFSET es19
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 16
call gotoxy
mov edx , OFFSET es20
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 17
call gotoxy
mov edx , OFFSET es21
call WriteString
 ;----------------------------------------------------
mov dl , 0
mov dh , 18
call gotoxy
mov edx , OFFSET es22
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 19
call gotoxy
mov edx , OFFSET es23
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 20
call gotoxy
mov edx , OFFSET es24
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 24
call gotoxy
mov edx , OFFSET es27
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 25
call gotoxy
mov edx , OFFSET es28
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 26
call gotoxy
mov edx , OFFSET es29
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 27
call gotoxy
mov edx , OFFSET es30
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 28
call gotoxy
mov edx , OFFSET es31
call WriteString
Call UpdateDrawGround1

;----------------------- Display Score Counter  -----------------------------
mov dl ,22
mov dh , 2
call gotoxy
mov eax,scorecounter
call WriteDec	
call readchar

		mov inputchar,al
		call ReadKey    
		cmp al , ' '
		je  UpdateEndScreen
		




		
;----------------------------------------------------


KeepGoing:
		call dp2
		call up1
		mov eax ,250
		call delay
		call dp
		call up2

		mov dl , 88
		mov dh , 15
		call gotoxy

		mov inputchar,al
		inc scorecounter
		mov eax,scorecounter 
        call WriteDec

jumpLoop:
		mov y , 20				; how high the jump is

								; making the ground move
		mov ecx , 3				; how long the ground moves , and the player is in air
		mov eax ,100
		call delay

myloop:
		call DrawGround1
		dec x
		mov eax , 30
		call delay
		cmp x , 0
		je starting
		jne rest 

starting:

		mov x , 5

rest:
		loop myloop
		call UpdateCollison

gravity5:

		cmp y , 23			
		jge onGround5
		call UpdateCollison
		dec amount

;--------------------- checking to end the game ------------------------------
		cmp amount , 20
		je there
		jne theree
there:

		mov inputchar,al
		cmp al , "x"

theree:


		cmp amount , 20				; making the collision stop at x = 0 and get back to its initial plcae / edited
		je onground2
		mov bl , y
		mov ecx , 8


l:

 		inc y 
		loop l

		mov y , bl
		call DrawCollision
		mov eax , 20
		call delay
		jmp gravity5


onGround5:

		mov eax , 500
		call delay
		call UpdateCollison
		dec amount
		call DrawCollision
		mov ecx , 10 

jumploop5:							;allow player to jump

		call UpdateCollison
		dec amount
		call DrawCollision
		mov eax ,20
		call delay
		loop jumploop5



	exitGame:
	exit
main ENDP


;---------------------- Draw Ground proc -------------------------


DrawGround1 proc

	mov  dl,x
	mov  dh,29
	call Gotoxy
	mov  edx,OFFSET ground1
	call WriteString

DrawGround1 endp

;---------------------- Update Draw Ground proc -------------------------

UpdateDrawGround1 proc

	mov  dl,x
	mov  dh,29
	call Gotoxy
	mov al," "
	call WriteString

UpdateDrawGround1 endp



DrawCollision PROC

	mov dl, amount
	mov dh,27
	call gotoxy
	mov al , 0ddh
	CALL WriteChar

	mov dl, amount
	mov dh,26
	call gotoxy
	mov al , 0ddh
	CALL WriteChar

	mov dl, amount
	mov dh,25
	call gotoxy
	mov al , 0ddh
	CALL WriteChar

	mov dl, amount
	mov dh,24
	call gotoxy
	mov al , 0ddh
	CALL WriteChar

	mov dl, amount
	mov dh,23
	call gotoxy
	mov al , 0ddh
	CALL WriteChar

	ret
DrawCollision ENDP





UpdateCollison PROC

	mov dl,amount 
	mov dh,27
	call gotoxy
	mov al," "
	call writechar

	mov dl,amount 
	mov dh,26
	call gotoxy
	mov al," "
	call writechar

	mov dl,amount 
	mov dh,25
	call gotoxy
	mov al," "
	call writechar

	mov dl,amount 
	mov dh,24
	call gotoxy
	mov al," "
	call writechar

	mov dl,amount 
	mov dh,23
	call gotoxy
	mov al," "
	call writechar

	ret
UpdateCollison ENDP

 




dp proc 

;-------------------------first line-------------------------------

	mov dl,8
	mov dh,24
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,24
	call gotoxy
	mov al," "
	CALL WriteChar	
	mov dl,10
	mov dh,24
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,11
	mov dh,24
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,12
	mov dh,24
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,13
	mov dh,24
	call gotoxy
	mov al," "

	CALL WriteChar	
	mov dl,14
	mov dh,24
	call gotoxy
	mov al,"/"
	CALL WriteChar

	mov dl,15
	mov dh,24
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,24
	call gotoxy
	mov al,"."
	CALL WriteChar
		
	mov dl,17
	mov dh,24
	call gotoxy
	mov al,"\"
	CALL WriteChar

;------------------------------ second line -----------------------------------
	mov dl,8
	mov dh,9
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,25
	call gotoxy
	mov al," "
	CALL WriteChar	
	mov dl,10
	mov dh,25
	call gotoxy
	mov al," "
	CALL WriteChar
	mov dl,11
	mov dh,25
	call gotoxy
	mov al," "
	CALL WriteChar
	mov dl,12
	mov dh,25
	call gotoxy
	mov al," "
	CALL WriteChar	
	mov dl,13
	mov dh,25
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,14
	mov dh,25
	call gotoxy
	mov al,"|"
	CALL WriteChar

	mov dl,15
	mov dh,25
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,25
	call gotoxy
	mov al,"-"
	CALL WriteChar
		
	mov dl,17
	mov dh,25
	call gotoxy
	mov al,"'"
	CALL WriteChar
		
;-----------------------third line---------------------------------

	mov dl,8
	mov dh,26
	call gotoxy
	mov al,"-"
	CALL WriteChar
	
	mov dl,9
	mov dh,26
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,10
	mov dh,26
	call gotoxy
	mov al,"-"
	CALL WriteChar

	mov dl,11
	mov dh,26
	call gotoxy
	mov al,"-"
	CALL WriteChar

	mov dl,12
	mov dh,26
	call gotoxy
	mov al,"-"
	CALL WriteChar	

	mov dl,13
	mov dh,26
	call gotoxy
	mov al,"-"
	CALL WriteChar	

	mov dl,14
	mov dh,26
	call gotoxy
	mov al,"'"
	CALL WriteChar

	mov dl,15
	mov dh,26
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,26
	call gotoxy
	mov al,"|"
	CALL WriteChar
		
	mov dl,17
	mov dh,26
	call gotoxy
	mov al,">"
	CALL WriteChar
		


;-----------------------forth line---------------------------------

	mov dl,8
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,27
	call gotoxy
	mov al,"\"
	CALL WriteChar	

	mov dl,10
	mov dh,27
	call gotoxy
	mov al,"_"
	CALL WriteChar

	mov dl,11
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,12
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,13
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,14
	mov dh,27
	call gotoxy
	mov al,"_"
	CALL WriteChar

	mov dl,15
	mov dh,27
	call gotoxy
	mov al,"/"
	CALL WriteChar
	
	mov dl,16
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar
		
	mov dl,17
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar
		


;-----------------------fifth line---------------------------------

	mov dl,8
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,10
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,11
	mov dh,28
	call gotoxy
	mov al,"/"
	CALL WriteChar

	mov dl,12
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,13
	mov dh,28
	call gotoxy
	mov al,"\"
	CALL WriteChar	

	mov dl,14
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,15
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar
		
	mov dl,17
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar
	
	ret


dp endp


up1 proc 

;-------------------------first line-------------------------------

	mov dl,8
	mov dh,24
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,24
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,10
	mov dh,24
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,11
	mov dh,24
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,12
	mov dh,24
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,13
	mov dh,24
	call gotoxy
	mov al," "

	CALL WriteChar	

	mov dl,14
	mov dh,24
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,15
	mov dh,24
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,24
	call gotoxy
	mov al," "
	CALL WriteChar
		
	mov dl,17
	mov dh,24
	call gotoxy
	mov al," "
	CALL WriteChar
	
;------------------------------ second line -------------------------
	mov dl,8
	mov dh,9
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,25
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,10
	mov dh,25
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,11
	mov dh,25
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,12
	mov dh,25
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,13
	mov dh,25
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,14
	mov dh,25
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,15
	mov dh,25
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,25
	call gotoxy
	mov al," "
	CALL WriteChar
		
	mov dl,17
	mov dh,25
	call gotoxy
	mov al," "
	CALL WriteChar
		
;-----------------------third line---------------------------------

	mov dl,8
	mov dh,26
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,26
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,10
	mov dh,26
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,11
	mov dh,26
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,12
	mov dh,26
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,13
	mov dh,26
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,14
	mov dh,26
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,15
	mov dh,26
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,26
	call gotoxy
	mov al," "
	CALL WriteChar
		
	mov dl,17
	mov dh,26
	call gotoxy
	mov al," "
	CALL WriteChar
		


;-----------------------forth line---------------------------------

	mov dl,8
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,10
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,11
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,12
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,13
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,14
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,15
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar
		
	mov dl,17
	mov dh,27
	call gotoxy
	mov al," "
	CALL WriteChar
		


;-----------------------fifth line---------------------------------

	mov dl,8
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,10
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,11
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,12
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,13
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,14
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,15
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar
		
	mov dl,17
	mov dh,28
	call gotoxy
	mov al," "
	CALL WriteChar
	

	ret
up1 endp






dp2 proc 

;-------------------------first line-------------------------------

	mov dl,8
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,10
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,11
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,12
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,13
	mov dh,18
	call gotoxy
	mov al," "

	CALL WriteChar	
	mov dl,14
	mov dh,18
	call gotoxy
	mov al,"/"
	CALL WriteChar

	mov dl,15
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,18
	call gotoxy
	mov al,"."
	CALL WriteChar
		
	mov dl,17
	mov dh,18
	call gotoxy
	mov al,"\"
	CALL WriteChar
		
 
;----------------- second line ------------------------
	mov dl,8
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,10
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,11
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,12
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,13
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,14
	mov dh,19
	call gotoxy
	mov al,"|"
	CALL WriteChar

	mov dl,15
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,19
	call gotoxy
	mov al,"-"
	CALL WriteChar
		
	mov dl,17
	mov dh,19
	call gotoxy
	mov al,"'"
	CALL WriteChar
		
;-----------------------third line---------------------------------

	mov dl,8
	mov dh,20
	call gotoxy
	mov al,"-"
	CALL WriteChar
	
	mov dl,9
	mov dh,20
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,10
	mov dh,20
	call gotoxy
	mov al,"-"
	CALL WriteChar

	mov dl,11
	mov dh,20
	call gotoxy
	mov al,"-"
	CALL WriteChar

	mov dl,12
	mov dh,20
	call gotoxy
	mov al,"-"
	CALL WriteChar	

	mov dl,13
	mov dh,20
	call gotoxy
	mov al,"-"
	CALL WriteChar	

	mov dl,14
	mov dh,20
	call gotoxy
	mov al,"'"
	CALL WriteChar

	mov dl,15
	mov dh,20
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,20
	call gotoxy
	mov al,"|"
	CALL WriteChar
		
	mov dl,17
	mov dh,20
	call gotoxy
	mov al,">"
	CALL WriteChar
		


;-----------------------forth line---------------------------------

	mov dl,8
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,21
	call gotoxy
	mov al,"\"
	CALL WriteChar	

	mov dl,10
	mov dh,21
	call gotoxy
	mov al,"_"
	CALL WriteChar

	mov dl,11
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,12
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,13
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,14
	mov dh,21
	call gotoxy
	mov al,"_"
	CALL WriteChar

	mov dl,15
	mov dh,21
	call gotoxy
	mov al,"/"
	CALL WriteChar
	
	mov dl,16
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar
		
	mov dl,17
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar
		


;-----------------------fifth line---------------------------------

	mov dl,8
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,10
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,11
	mov dh,22
	call gotoxy
	mov al,"/"
	CALL WriteChar

	mov dl,12
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,13
	mov dh,22
	call gotoxy
	mov al,"\"
	CALL WriteChar	

	mov dl,14
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,15
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar
		
	mov dl,17
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar
		
	ret
dp2 endp



up2 proc 

;-------------------------first line-------------------------------

	mov dl,8
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,10
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,11
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,12
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,13
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,14
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,15
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar
		
	mov dl,17
	mov dh,18
	call gotoxy
	mov al," "
	CALL WriteChar
		
 

;------------------------------ second line -----------------------------------
	mov dl,8
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,10
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,11
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,12
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,13
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar
	

	mov dl,14
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,15
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar
		
	mov dl,17
	mov dh,19
	call gotoxy
	mov al," "
	CALL WriteChar
		
;-----------------------third line---------------------------------

	mov dl,8
	mov dh,20
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,20
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,10
	mov dh,20
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,11
	mov dh,20
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,12
	mov dh,20
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,13
	mov dh,20
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,14
	mov dh,20
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,15
	mov dh,20
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,20
	call gotoxy
	mov al," "
	CALL WriteChar
		
	mov dl,17
	mov dh,20
	call gotoxy
	mov al," "
	CALL WriteChar
		


;-----------------------forth line-------------------------

	mov dl,8
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,10
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,11
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,12
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,13
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,14
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,15
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar
		
	mov dl,17
	mov dh,21
	call gotoxy
	mov al," "
	CALL WriteChar
		


;-----------------------fifth line---------------------------------

	mov dl,8
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,9
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,10
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,11
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,12
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,13
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar	

	mov dl,14
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar

	mov dl,15
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar
	
	mov dl,16
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar
		
	mov dl,17
	mov dh,22
	call gotoxy
	mov al," "
	CALL WriteChar

	ret
up2 endp



;----------------------  Update End Screen Label   -----------------------------



updateEndScreen PROC

mov dl , 0
mov dh , 2
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 3
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 4
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 5
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 6
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 7
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 8
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 9
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 10
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 11
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 12
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 13
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 14
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 15
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 16
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 17
call gotoxy
mov al," "
call WriteString
 ;----------------------------------------------------
mov dl , 0
mov dh , 18
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 19
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 20
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 24
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 25
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 26
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 27
call gotoxy
mov al," "
call WriteString
;----------------------------------------------------
mov dl , 0
mov dh , 28
call gotoxy
mov al," "
call WriteString

jmp main

updateEndScreen endp



END MAIN