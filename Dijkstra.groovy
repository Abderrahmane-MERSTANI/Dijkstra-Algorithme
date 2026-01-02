class Dijkstra {

    static final int INF = Integer.MAX_VALUE

    static int[] dijkstra(int[][] graph, int start) {
        int n = graph.length
        int[] dist = new int[n]
        boolean[] visited = new boolean[n]

        // Initialisation
        Arrays.fill(dist, INF)
        dist[start] = 0

        for (int i = 0; i < n - 1; i++) {
            int min = INF
            int u = -1

            // Trouver le sommet non visité avec la distance minimale
            for (int j = 0; j < n; j++) {
                if (!visited[j] && dist[j] < min) {
                    min = dist[j]
                    u = j
                }
            }

            if (u == -1) break

            visited[u] = true

            // Mise à jour des distances
            for (int v = 0; v < n; v++) {
                if (!visited[v] &&
                    graph[u][v] != 0 &&
                    dist[u] != INF &&
                    dist[u] + graph[u][v] < dist[v]) {
                    dist[v] = dist[u] + graph[u][v]
                }
            }
        }
        return dist
    }

    static void main(String[] args) {
        int[][] graph = [
            [0, 3, 0, 0, 6],
            [3, 0, 2, 0, 0],
            [0, 2, 0, 5, 0],
            [0, 0, 5, 0, 1],
            [6, 0, 0, 1, 0]
        ]

        int start = 0
        int[] distances = dijkstra(graph, start)

        println "Distances depuis le sommet $start"
        distances.eachWithIndex { d, i ->
            println "Vers $i : $d"
        }
    }
}
