       IDENTIFICATION DIVISION.
       PROGRAM-Id. factorial.

       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
           01   NUMB PIC 9(2) VALUE 9.
           01   FACT PIC 9(6) VALUE 1.
           01   NUM PIC 9.
           01   V.
           02  X PIC 9(6) OCCURS 10 INDEXED BY I.
       
       PROCEDURE DIVISION.
           MOVE 1 TO NUM.
           COMPUTE X(NUM)=FACT.
           IF NUMB =0
               MOVE 1 TO FACT
           ELSE
               PERFORM AA UNTIL NUM=NUMB
           END-IF.
           DISPLAY NUM '!=' FACT.
           MOVE 1 to I.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I>NUMB
               DISPLAY X(I)
           END-PERFORM.
           STOP RUN.
       AA.
           COMPUTE NUM = NUM + 1.
           COMPUTE FACT = NUM * FACT.
           COMPUTE X(NUM)=FACT.

