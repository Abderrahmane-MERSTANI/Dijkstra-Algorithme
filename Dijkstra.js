const INF = Number.MAX_SAFE_INTEGER;
const V = 5;

function minDistance(dist, visited) {
  let min = INF, index = -1;
  for (let i = 0; i < V; i++) {
    if (!visited[i] && dist[i] <= min) {
      min = dist[i];
      index = i;
    }
  }
  return index;
}

function dijkstra(graph, src) {
  let dist = Array(V).fill(INF);
  let visited = Array(V).fill(false);

  dist[src] = 0;

  for (let i = 0; i < V - 1; i++) {
    let u = minDistance(dist, visited);
    visited[u] = true;

    for (let v = 0; v < V; v++) {
      if (!visited[v] && graph[u][v] > 0 &&
          dist[u] !== INF &&
          dist[u] + graph[u][v] < dist[v]) {
        dist[v] = dist[u] + graph[u][v];
      }
    }
  }

  console.log("Sommet | Distance");
  dist.forEach((d, i) => console.log(i, " | ", d));
}

// Exemple
const graph = [
  [0, 10, 0, 0, 5],
  [0, 0, 1, 0, 2],
  [0, 0, 0, 4, 0],
  [7, 0, 6, 0, 0],
  [0, 3, 9, 2, 0]
];

dijkstra(graph, 0);
