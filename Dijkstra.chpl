config const INF = 1_000_000;

proc dijkstra(graph: [] [] int, start: int): [] int {
  const n = graph.size;
  var dist: [0..n-1] int = INF;
  var visited: [0..n-1] bool = false;

  dist[start] = 0;

  for i in 0..n-2 {
    var minDist = INF;
    var u = -1;

    // Trouver le sommet non visité avec la distance minimale
    for j in 0..n-1 {
      if !visited[j] && dist[j] < minDist {
        minDist = dist[j];
        u = j;
      }
    }

    if u == -1 then break;
    visited[u] = true;

    // Mise à jour des distances
    for v in 0..n-1 {
      if !visited[v] && graph[u][v] != 0 &&
         dist[u] + graph[u][v] < dist[v] {
        dist[v] = dist[u] + graph[u][v];
      }
    }
  }
  return dist;
}

proc main() {
  const graph = [
    [0, 4, 0, 0, 2],
    [4, 0, 3, 0, 0],
    [0, 3, 0, 5, 0],
    [0, 0, 5, 0, 1],
    [2, 0, 0, 1, 0]
  ];

  const distances = dijkstra(graph, 0);
  writeln(distances);
}
