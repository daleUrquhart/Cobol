       IDENTIFICATION DIVISION.
       PROGRAM-ID. Sublist.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
           01 N PIC 99 VALUE 0.
           01 L OCCURS 100 TIMES PIC 9(5) VALUE ZERO.
           01 S OCCURS 100 TIMES PIC 9(5) VALUE ZERO.
           01 Last-Square PIC 99999999 VALUE 0.
           01 FPI PIC 9999 VALUE 0.
           01 LSI PIC 9999 VALUE 0.
           01 IS-EVEN PIC X VALUE 'N'.
           01 I PIC 999 VALUE 0.
           01 J PIC 999 VALUE 0.
           01 CURRENT-ELEMENT PIC 99 VALUE 0.
           01 K PIC 99 VALUE 0.
           01 IS-PRIME-NUM-FLAG PIC 99 VALUE 0.
           01 WS-SQRT PIC 99 VALUE 0.
           01 IS-PRIME-FLAG PIC X VALUE 'N'.
           01 IS-PERFECT-SQUARE-FLAG PIC X VALUE 'N'.
           01 S-START PIC 999 VALUE 0.

       PROCEDURE DIVISION.
           DISPLAY "Enter the number of elements (N) in the list (L): "
           ACCEPT N
           DISPLAY "Enter N elements for L"
           PERFORM READ-LIST
           PERFORM FIND-FIRST-ELEMENT
           IF IS-PRIME-FLAG='Y'
               PERFORM FIND-LAST-SQUARE
               IF IS-PERFECT-SQUARE-FLAG='Y'
                   PERFORM CALCULATE-SUBLIST
                   PERFORM OUTPUT-SUBLIST
               END-IF
           END-IF
           STOP RUN.
     
       READ-LIST.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               ACCEPT L(I)
           END-PERFORM.
 
       FIND-FIRST-ELEMENT.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               MOVE L(I) TO CURRENT-ELEMENT
               PERFORM IS-PRIME
               IF IS-PRIME-FLAG = 'Y'
                       MOVE I TO FPI
                       EXIT PERFORM
               END-IF
           END-PERFORM.

       IS-PRIME.
           IF CURRENT-ELEMENT < 3
                   MOVE 'N' TO IS-PRIME-FLAG
           
           ELSE
               PERFORM VARYING J FROM 2 BY 1 UNTIL J > CURRENT-ELEMENT
                   DIVIDE CURRENT-ELEMENT BY J
                   GIVING CURRENT-ELEMENT REMAINDER IS-PRIME-NUM-FLAG
                   IF IS-PRIME-NUM-FLAG = 0
                       MOVE 'N' TO IS-PRIME-FLAG
                       EXIT PERFORM
                   END-IF
               END-PERFORM
               IF J>CURRENT-ELEMENT
                       MOVE 'Y' TO IS-PRIME-FLAG
               END-IF
           END-IF.
            

       FIND-LAST-SQUARE.
           MOVE 0 TO LSI
           PERFORM VARYING I FROM N BY -1 UNTIL I < 1
               MOVE L(I) TO CURRENT-ELEMENT
               PERFORM IS-PERFECT-SQUARE
               IF IS-PERFECT-SQUARE-FLAG = 'Y'
                   MOVE I TO LSI
                   EXIT PERFORM
               END-IF
           END-PERFORM.

       CALCULATE-SUBLIST.
           MOVE 1 TO I
           MOVE L(FPI) TO S(1)
           MOVE L(LSI) TO S(LSI)
           COMPUTE S-START = FPI + 1
           PERFORM VARYING I FROM S-START BY 1 UNTIL I=LSI
                   MULTIPLY L(I) BY L(I) GIVING J
                   MULTIPLY J BY L(I) GIVING S(I)
           END-PERFORM.

       OUTPUT-SUBLIST.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LSI
               DISPLAY S(I)
           END-PERFORM.

       IS-PERFECT-SQUARE.
           MOVE 1 TO WS-SQRT
           PERFORM VARYING K FROM 1 BY 1 UNTIL WS-SQRT * WS-SQRT >= L(I)
               COMPUTE WS-SQRT = WS-SQRT + 1
           END-PERFORM
           IF WS-SQRT * WS-SQRT = L(I) THEN
               MOVE 'Y' TO IS-PERFECT-SQUARE-FLAG
           ELSE
               MOVE 'N' TO IS-PERFECT-SQUARE-FLAG
           END-IF.

