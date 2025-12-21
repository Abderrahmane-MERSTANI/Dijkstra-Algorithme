#include <stdio.h>
#include <limits.h>

#define N 6            // nombre de sommets
#define INF INT_MAX

// Renvoie l'indice du sommet non-visité avec la plus petite distance
int minDistance(int dist[], int visited[]) {
    int min = INF, minIndex = -1;
    for (int i = 0; i < N; i++) {
        if (!visited[i] && dist[i] < min) {
            min = dist[i];
            minIndex = i;
        }
    }
    return minIndex;
}

// Affiche le chemin depuis la source jusqu'à v en utilisant parent[]
void printPath(int parent[], int v) {
    if (v == -1) return;
    printPath(parent, parent[v]);
    printf("%d ", v);
}

void dijkstra(int graph[N][N], int src) {
    int dist[N];
    int visited[N];
    int parent[N];

    for (int i = 0; i < N; i++) {
        dist[i] = INF;
        visited[i] = 0;
        parent[i] = -1;
    }
    dist[src] = 0;

    // On répète N-1 fois : on "fixe" le meilleur sommet restant
    for (int count = 0; count < N - 1; count++) {
        int u = minDistance(dist, visited);
        if (u == -1) break;          // plus aucun sommet atteignable
        visited[u] = 1;

        // Relaxation des voisins de u
        for (int v = 0; v < N; v++) {
            // condition: arête u->v existe, v non visité, u atteignable,
            // et dist[u] + w(u,v) améliore dist[v]
            if (!visited[v] && graph[u][v] > 0 && dist[u] != INF) {
                int w = graph[u][v];

                // éviter overflow si dist[u] est grand
                if (dist[u] <= INF - w && dist[u] + w < dist[v]) {
                    dist[v] = dist[u] + w;
                    parent[v] = u;
                }
            }
        }
    }

    // Résultats
    printf("Source = %d\n", src);
    for (int v = 0; v < N; v++) {
        if (dist[v] == INF) {
            printf("Vers %d : INF (inatteignable)\n", v);
        } else {
            printf("Vers %d : dist = %d, chemin = ", v, dist[v]);
            printPath(parent, v);
            printf("\n");
        }
    }
}

int main(void) {
    // Exemple (matrice d'adjacence)
    // 0 = pas d'arête, poids > 0
    int graph[N][N] = {
        {0, 7, 9, 0, 0, 14},
        {7, 0, 10, 15, 0, 0},
        {9, 10, 0, 11, 0, 2},
        {0, 15, 11, 0, 6, 0},
        {0, 0, 0, 6, 0, 9},
        {14, 0, 2, 0, 9, 0}
    };

    dijkstra(graph, 0);
    return 0;
}
