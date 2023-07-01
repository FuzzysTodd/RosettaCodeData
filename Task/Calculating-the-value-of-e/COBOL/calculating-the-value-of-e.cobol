       >>SOURCE FORMAT IS FIXED
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EULER.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 EPSILON USAGE COMPUTATIONAL-2 VALUE 1.0E-15.
           01 FACT USAGE BINARY-DOUBLE UNSIGNED VALUE 1.
           01 N USAGE BINARY-INT UNSIGNED.
           01 E USAGE COMPUTATIONAL-2 VALUE 2.0.
           01 E0 USAGE COMPUTATIONAL-2 value 0.0.
           01 RESULT-MESSAGE.
              03 FILLER PIC X(4) VALUE 'e = '.
              03 RESULT-VALUE PIC 9.9(18) USAGE DISPLAY.
       PROCEDURE DIVISION.
       MAIN SECTION.
           PERFORM
              VARYING N FROM 2 BY 1
              UNTIL FUNCTION ABS(E - E0) < EPSILON
              MOVE E TO E0
              COMPUTE FACT = FACT * N
              COMPUTE E = E + 1.0 / FACT
           END-PERFORM.
           MOVE E TO RESULT-VALUE.
           DISPLAY RESULT-MESSAGE.
           STOP RUN.