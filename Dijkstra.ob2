MODULE Dijkstra;

CONST
  N   = 5;
  INF = 1000000;

TYPE
  Matrix = ARRAY N, N OF INTEGER;
  Vector = ARRAY N OF INTEGER;
  BoolVec = ARRAY N OF BOOLEAN;

VAR
  Graph : Matrix = (
    (0,4,0,0,2),
    (4,0,3,0,0),
    (0,3,0,5,0),
    (0,0,5,0,1),
    (2,0,0,1,0)
  );
  Dist    : Vector;
  Visited : BoolVec;

PROCEDURE Dijkstra(start: INTEGER);
VAR i, j, u, min: INTEGER;
BEGIN
  FOR i := 0 TO N-1 DO
    Dist[i] := INF; Visited[i] := FALSE
  END;
  Dist[start] := 0;

  FOR i := 0 TO N-2 DO
    min := INF; u := -1;
    FOR j := 0 TO N-1 DO
      IF ~Visited[j] & (Dist[j] < min) THEN
        min := Dist[j]; u :
