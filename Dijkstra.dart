import 'dart:math';

const int INF = 1 << 30;

List<int> dijkstra(List<List<int>> graph, int start) {
  int n = graph.length;
  List<int> dist = List.filled(n, INF);
  List<bool> visited = List.filled(n, false);

  dist[start] = 0;

  for (int i = 0; i < n - 1; i++) {
    int minDist = INF;
    int u = -1;

    // Trouver le sommet non visité avec la distance minimale
    for (int j = 0; j < n; j++) {
      if (!visited[j] && dist[j] < minDist) {
        minDist = dist[j];
        u = j;
      }
    }

    if (u == -1) break;

    visited[u] = true;

    // Mise à jour des distances
    for (int v = 0; v < n; v++) {
      if (!visited[v] &&
          graph[u][v] != 0 &&
          dist[u] + graph[u][v] < dist[v]) {
        dist[v] = dist[u] + graph[u][v];
      }
    }
  }

  return dist;
}

void main() {
  List<List<int>> graph = [
    [0, 8, 0, 0, 3],
    [8, 0, 2, 0, 0],
    [0, 2, 0, 5, 0],
    [0, 0, 5, 0, 1],
    [3, 0, 0, 1, 0],
  ];

  int start = 0;
  List<int> distances = dijkstra(graph, start);

  print("Distances depuis le sommet $start");
  for (int i = 0; i < distances.length; i++) {
    print("Vers $i : ${distances[i]}");
  }
}
