GET "libhdr"

LET N = 5
LET INF = 1000000

MANIFEST
{
  NODES = 5
}

LET graph = VEC NODES * NODES
LET dist = VEC NODES
LET visited = VEC NODES

LET idx = 0
FOR i = 0 TO NODES-1 DO
  FOR j = 0 TO NODES-1 DO
  {
    graph!(i*NODES + j) :=
      (idx = 0 -> 0,
       idx = 1 -> 4,
       idx = 2 -> 0,
       idx = 3 -> 0,
       idx = 4 -> 2,
       idx = 5 -> 4,
       idx = 6 -> 0,
       idx = 7 -> 3,
       idx = 8 -> 0,
       idx = 9 -> 0,
       idx = 10 -> 0,
       idx = 11 -> 3,
       idx = 12 -> 0,
       idx = 13 -> 5,
       idx = 14 -> 0,
       idx = 15 -> 0,
       idx = 16 -> 0,
       idx = 17 -> 5,
       idx = 18 -> 0,
       idx = 19 -> 1,
       idx = 20 -> 2,
       idx = 21 -> 0,
       idx = 22 -> 0,
       idx = 23 -> 1,
       idx = 24 -> 0);
    idx := idx + 1
  }

FOR i = 0 TO NODES-1 DO
{
  dist!i := INF
  visited!i := FALSE
}

dist!0 := 0

FOR step = 1 TO NODES-1 DO
{
  LET min = INF
  LET u = -1

  FOR i = 0 TO NODES-1 DO
    IF visited!i = FALSE & dist!i < min THEN
    {
      min := dist!i
      u := i
    }

  IF u = -1 BREAK
  visited!u := TRUE

  FOR v = 0 TO NODES-1 DO
    IF visited!v = FALSE & graph!(u*NODES + v) ~= 0 &
       dist!u + graph!(u*NODES + v) < dist!v THEN
      dist!v := dist!u + graph!(u*NODES + v)
}

WRITEF("Distances: ")
FOR i = 0 TO NODES-1 DO WRITEF("%N ", dist!i)
