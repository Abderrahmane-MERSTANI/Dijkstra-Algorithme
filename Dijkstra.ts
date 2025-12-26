const INF = Number.MAX_SAFE_INTEGER;

function dijkstra(graph: number[][], start: number): number[] {
  const n = graph.length;
  const dist: number[] = new Array(n).fill(INF);
  const visited: boolean[] = new Array(n).fill(false);

  dist[start] = 0;

  for (let i = 0; i < n - 1; i++) {
    let min = INF;
    let u = -1;

    // Trouver le sommet non visité avec la distance minimale
    for (let j = 0; j < n; j++) {
      if (!visited[j] && dist[j] < min) {
        min = dist[j];
        u = j;
      }
    }

    if (u === -1) break;

    visited[u] = true;

    // Mise à jour des distances
    for (let v = 0; v < n; v++) {
      if (
        !visited[v] &&
        graph[u][v] !== 0 &&
        dist[u] !== INF &&
        dist[u] + graph[u][v] < dist[v]
      ) {
        dist[v] = dist[u] + graph[u][v];
      }
    }
  }

  return dist;
}

// Exemple d'utilisation
const graph: number[][] = [
  [0, 2, 0, 0, 6],
  [2, 0, 3, 0, 0],
  [0, 3, 0, 1, 0],
  [0, 0, 1, 0, 4],
  [6, 0, 0, 4, 0],
];

const start = 0;
const distances = dijkstra(graph, start);

console.log(`Distances depuis le sommet ${start}`);
distances.forEach((d, i) => {
  console.log(`Vers ${i} : ${d}`);
});
