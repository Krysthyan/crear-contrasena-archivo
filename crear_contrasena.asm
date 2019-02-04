; al momento que pide la contraseña ud ingresa y al momento que termine debe de dar enter
; para que se guarde en el archivo.


.MODEL SMALL
.CODE
.DATA

DATOS SEGMENT
    CONT DW ?

PROGRAMA:

    MOV AH,02H
    MOV DL,50H
    INT 21H
    MOV DL,41H
    INT 21H
    MOV DL,53H
    INT 21H
    MOV DL,53H
    INT 21H
    MOV DL,57H
    INT 21H  
    MOV DL,4FH
    INT 21H   
    MOV DL,52H
    INT 21H  
    MOV DL,44H
    INT 21H
    
    MOV DL,3AH
    INT 21H
    
    MOV AX,1377H
    MOV DS,AX
    MOV BX,0200H
    MOV CONT, 0200H
read:
    ; CODE READ CHARACTER BY KEYBOARD

    MOV DL,2AH
    MOV AH,07H
    INT 21H
    
    CMP AL,13
    JE save
    
    
    MOV [BX],AL
    XOR [BX],30H
    MOV AH,02H
    INT 21H
    
    
    ; CODE TO GENERATE DATE FOR EACH LETTER
    
    MOV DL,09H  ;TAB
    
    ADD CONT,2H
    
    MOV BX,CONT
    MOV [BX],DL
    
    MOV AH,2CH  ;HOUR
    INT 21H
    MOV AL,CH
    AAM
    MOV CX,AX
    MOV DL,CH   ;STORE HOUR
    ADD DL,30H
    
    ADD CONT,1H
    MOV BX,CONT
    MOV [BX],DL
    MOV DL,CL
    ADD DL,30H
    
    ADD CONT,1H
    MOV BX,CONT
    MOV [BX],DL
    MOV DL,3AH  ;INSERT :
    
    ADD CONT,1H
    MOV BX,CONT
    MOV [BX],DL
    MOV AH,2CH  ;MINUTE
    INT 21H
    MOV AL,CL
    AAM
    MOV CX,AX
    MOV DL,CH   ;STORE MINUTE
    ADD DL,30H
    
    ADD CONT,1H
    MOV BX,CONT
    MOV [BX],DL
    MOV DL,CL
    ADD DL,30H
    
    ADD CONT,1H
    MOV BX,CONT
    MOV [BX],DL
    MOV DL,3AH  ;INSERT :
    
    ADD CONT,1H
    MOV BX,CONT
    MOV [BX],DL
    MOV AH,2CH  ;SEG
    INT 21H
    MOV AL,DH
    AAM
    MOV CX,AX
    MOV DL,CH   ;STORE SEG
    ADD DL,30H
    
    ADD CONT,1H
    MOV BX,CONT
    MOV [BX],DL
    MOV DL,CL
    ADD DL,30H
    
    ADD CONT,1H
    MOV BX,CONT
    MOV [BX],DL

    
    MOV AH,02H
    MOV DL,0DH
    
    ADD CONT,1H
    MOV BX,CONT
    MOV [BX],DL
    
    MOV AH,02H
    MOV DL,0AH
    
    ADD CONT,1H
    MOV BX,CONT
    
    MOV [BX],DL
    ADD CONT,1H
    MOV BX,CONT
    jne read

save:  
    ; CODE TO SAVE LOCALLY IN AN ARCHIVE 

    MOV AX,4552H
    MOV BX,0300H
    MOV [BX],AX
    MOV AX,4947H
    MOV BX,0302H
    MOV [BX],AX
    MOV AX,2E31H
    MOV BX,0304H
    MOV [BX],AX
    MOV AX,5854H
    MOV BX,0306H
    MOV [BX],AX
    MOV AX,0054H
    MOV BX,0308H
    MOV [BX],AX
    
    MOV AX,0000H
    MOV CX,02H
    MOV AH,3CH
    MOV DX,0300H
    INT 21H
    
    MOV BX,AX
    MOV AH,40H
    MOV CX,00C8H
    MOV DX,0200H
    INT 21H
    
    MOV AH,4CH
    INT 21H
.STACK
END PROGRAMA