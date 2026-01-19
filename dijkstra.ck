// Implémentation de Dijkstra en ChucK (hors audio)

5 => int N;
1000000 => int INF;

int graph[5][5];
int dist[5];
int visited[5];

// Graphe (matrice d’adjacence)
[
 [0, 4, 0, 0, 2],
 [4, 0, 3, 0, 0],
 [0, 3, 0, 5, 0],
 [0, 0, 5, 0, 1],
 [2, 0, 0, 1, 0]
] @=> graph;

// Initialisation
for (0 => int i; i < N; i++) {
    INF => dist[i];
    0 => visited[i];
}

0 => dist[0]; // sommet source

// Algorithme de Dijkstra
for (0 => int step; step < N - 1; step++) {
    INF => int min;
    -1 => int u;

    for (0 => int i; i < N; i++) {
        if (!visited[i] && dist[i] < min) {
            dist[i] => min;
            i => u;
        }
    }

    if (u == -1) break;
    1 => visited[u];

    for (0 => int v; v < N; v++) {
        if (!visited[v] && graph[u][v] != 0 &&
            dist[u] + graph[u][v] < dist[v]) {
            dist[u] + graph[u][v] => dist[v];
        }
    }
}

// Affichage
<<< "Distances :", dist[0], dist[1], dist[2], dist[3], dist[4] >>>;
