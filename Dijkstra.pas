program Dijkstra;

const
  INF = 1000000000;
  N = 5;

var
  graph: array[1..N, 1..N] of integer;
  dist: array[1..N] of integer;
  visited: array[1..N] of boolean;
  i, j, u, start, minDist: integer;

begin
  { Initialisation du graphe (matrice d’adjacence) }
  graph := (
    (0, 4, 0, 0, 6),
    (4, 0, 2, 0, 0),
    (0, 2, 0, 5, 0),
    (0, 0, 5, 0, 3),
    (6, 0, 0, 3, 0)
  );

  start := 1;

  { Initialisation }
  for i := 1 to N do
  begin
    dist[i] := INF;
    visited[i] := false;
  end;
  dist[start] := 0;

  { Algorithme de Dijkstra }
  for i := 1 to N - 1 do
  begin
    minDist := INF;
    u := -1;

    for j := 1 to N do
      if (not visited[j]) and (dist[j] < minDist) then
      begin
        minDist := dist[j];
        u := j;
      end;

    if u = -1 then break;

    visited[u] := true;

    for j := 1 to N do
      if (not visited[j]) and (graph[u, j] <> 0) and
         (dist[u] + graph[u, j] < dist[j]) then
        dist[j] := dist[u] + graph[u, j];
  end;

  { Affichage }
  writeln('Distances depuis le sommet ', start);
  for i := 1 to N do
    writeln('Vers ', i, ' : ', dist[i]);

end.
