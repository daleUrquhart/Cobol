       IDENTIFICATION DIVISION.
       PROGRAM-ID. Guesser.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 MIN-A          PIC 99 VALUE 11.
           01 MAX-A          PIC 99 VALUE 21.
           01 MAX-S          PIC 99 VALUE 12.
           01 MIN-S          PIC 99 VALUE 11.
           01 MIN-G          PIC 99 VALUE 2.
           01 SIZE-A         PIC 99.
           01 COUNTER        PIC 99 VALUE 0.
           01 N-CORRECT      PIC 99 VALUE 0.
           01 N-INCORRECT    PIC 99 VALUE 0.
           01 X              PIC 9999.
           01 N              PIC 99.
           01 SQRT-N         PIC 99.
           01 Y              PIC 99.
           01 K              PIC 99.
           01 J              PIC 99.
           01 I              PIC 99.
           01 L              PIC 99.
           01 GUESS          PIC 9999.
           01 FOUND          PIC 9 VALUE 0.
           01 WS-MSG         PIC X(30).   
           01 WS-TABLE.
           05 WS-A        PIC 9999 OCCURS 21 TIMES.
           05 WS-B        PIC 9999 OCCURS 21 TIMES.
       
           01 ARR
              05 ROW PIC 99 OCCURS 21 TIMES.
              10 COL PIC 999 OCCURS 12 TIMES.

             
       PROCEDURE DIVISION.
           DISPLAY "Enter a number:" WITH NO ADVANCING
           ACCEPT X
           PERFORM GEN-N
           PERFORM GEN-Y
           PERFORM GEN-K
           PERFORM INIT-ARR
           PERFORM GUESS-LOOP
           PERFORM CHECK-RESULTS
           DISPLAY "Thank you for playing." WITH NO ADVANCING
           STOP RUN.

       GEN-N.
           COMPUTE N = MIN-A + FUNCTION MOD(X, (MAX-A - MIN-A + 1)).

       GEN-Y.
           COMPUTE SQRT-N = FUNCTION SQRT(N).
           COMPUTE Y = MIN-G + (X - ((X / SQRT-N) * SQRT-N)) - 1.

       GEN-K.
           MOVE Y TO K.

       INIT-ARR.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 21
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 12
                       COMPUTE ARR(I, J) = (I - 1) * 12 + J
               END-PERFORM
           END-PERFORM.


       GUESS-LOOP.
       PERFORM UNTIL N-CORRECT = N OR N-INCORRECT = K
          DISPLAY "Enter your guess:" WITH NO ADVANCING
          ACCEPT GUESS
          MOVE 0 TO FOUND
          PERFORM VARYING I FROM 1 BY 1 UNTIL I = N OR FOUND = 1
              PERFORM VARYING J FROM 1 BY 1 UNTIL J = MAX-S OR FOUND =1
                  IF WS-A(I) = GUESS
         STRING "Array " I " : " GUESS " " DELIMITED BY SIZE INTO WS-MSG
                      DISPLAY WS-MSG WITH NO ADVANCING
         PERFORM VARYING K FROM 1 BY 1 UNTIL K > MAX-S OR WS-B(K) = 0
                          DISPLAY WS-B(K) WITH NO ADVANCING
                      END-PERFORM
                      ADD 1 TO N-CORRECT
                      ADD 1 TO FOUND
                  END-IF
              END-PERFORM
          END-PERFORM
          IF FOUND = 0
              DISPLAY "Incorrect guess" WITH NO ADVANCING
              ADD 1 TO N-INCORRECT
          ELSE
              DISPLAY "Nice, you found " FOUND " arrays"
          END-IF
          ADD 1 TO COUNTER
       END-PERFORM.

       CHECK-RESULTS.
           IF N-CORRECT >= N
               DISPLAY "Congratulations."
           ELSE
               DISPLAY "Sorry."
           END-IF.