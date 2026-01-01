       IDENTIFICATION DIVISION.
       PROGRAM-ID. DIJKSTRA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  N           PIC 9 VALUE 5.
       77  START       PIC 9 VALUE 1.
       77  INF         PIC 9(9) VALUE 999999999.
       01  I           PIC 9.
       01  J           PIC 9.
       01  U           PIC 9.
       01  MIN-DIST    PIC 9(9).

       01  GRAPH.
           05 ROW OCCURS 5 TIMES.
              10 COL OCCURS 5 TIMES PIC 9.

       01  DISTANCE OCCURS 5 TIMES PIC 9(9).
       01  VISITED  OCCURS 5 TIMES PIC X VALUE 'N'.

       PROCEDURE DIVISION.
       MAIN.
           MOVE 0 TO GRAPH(1,1) GRAPH(1,3) GRAPH(1,4)
           MOVE 4 TO GRAPH(1,2)
           MOVE 6 TO GRAPH(1,5)

           MOVE INF TO DISTANCE(1) DISTANCE(2) DISTANCE(3)
                     DISTANCE(4) DISTANCE(5)
           MOVE 0 TO DISTANCE(START)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               MOVE 'N' TO VISITED(I)
           END-PERFORM

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               MOVE INF TO MIN-DIST
               MOVE 0 TO U

               PERFORM VARYING J FROM 1 BY 1 UNTIL J > N
                   IF VISITED(J) = 'N' AND DISTANCE(J) < MIN-DIST
                       MOVE DISTANCE(J) TO MIN-DIST
                       MOVE J TO U
                   END-IF
               END-PERFORM

               IF U = 0
                   EXIT PERFORM
               END-IF

               MOVE 'Y' TO VISITED(U)
           END-PERFORM

           DISPLAY "Distances depuis le sommet " START
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY "Vers " I " : " DISTANCE(I)
           END-PERFORM

           STOP RUN.
