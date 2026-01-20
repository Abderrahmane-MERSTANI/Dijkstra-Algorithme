MODULE Dijkstra;

CONST
  N = 5;
  INF = 1000000;

TYPE
  Graph = ARRAY [0..N-1], [0..N-1] OF INTEGER;
  ArrayInt = ARRAY [0..N-1] OF INTEGER;
  ArrayBool = ARRAY [0..N-1] OF BOOLEAN;

VAR
  graph : Graph := {
    {0, 4, 0, 0, 2},
    {4, 0, 3, 0, 0},
    {0, 3, 0, 5, 0},
    {0, 0, 5, 0, 1},
    {2, 0, 0, 1, 0}
  };

  dist    : ArrayInt;
  visited : ArrayBool;

PROCEDURE MinDistance() : INTEGER =
VAR
  min := INF;
  index := -1;
BEGIN
  FOR i := 0 TO N-1 DO
    IF NOT visited[i] AND dist[i] < min THEN
      min := dist[i];
      index := i;
    END;
  END;
  RETURN index;
END MinDistance;

BEGIN
  FOR i := 0 TO N-1 DO
    dist[i] := INF;
    visited[i] := FALSE;
  END;

  dist[0] := 0;

  FOR count := 1 TO N-1 DO
    VAR u := MinDistance();
    IF u = -1 THEN EXIT END;

    visited[u] := TRUE;

    FOR v := 0 TO N-1 DO
      IF NOT visited[v] AND graph[u][v] # 0 AND
         dist[u] + graph[u][v] < dist[v] THEN
        dist[v] := dist[u] + graph[u][v];
      END;
    END;
  END;
END Dijkstra.
