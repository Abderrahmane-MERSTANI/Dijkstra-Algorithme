public class Dijkstra {

    static final int V = 5;
    static final int INF = Integer.MAX_VALUE;

    int minDistance(int[] dist, boolean[] visited) {
        int min = INF, index = -1;

        for (int i = 0; i < V; i++) {
            if (!visited[i] && dist[i] <= min) {
                min = dist[i];
                index = i;
            }
        }
        return index;
    }

    void dijkstra(int[][] graph, int src) {
        int[] dist = new int[V];
        boolean[] visited = new boolean[V];

        for (int i = 0; i < V; i++) {
            dist[i] = INF;
            visited[i] = false;
        }

        dist[src] = 0;

        for (int count = 0; count < V - 1; count++) {
            int u = minDistance(dist, visited);
            visited[u] = true;

            for (int v = 0; v < V; v++) {
                if (!visited[v] && graph[u][v] != 0 &&
                    dist[u] != INF &&
                    dist[u] + graph[u][v] < dist[v]) {
                    dist[v] = dist[u] + graph[u][v];
                }
            }
        }

        System.out.println("Sommet | Distance depuis la source");
        for (int i = 0; i < V; i++) {
            System.out.println(i + " \t | " + dist[i]);
        }
    }

    public static void main(String[] args) {
        int[][] graph = {
            {0, 10, 0, 0, 5},
            {0, 0, 1, 0, 2},
            {0, 0, 0, 4, 0},
            {7, 0, 6, 0, 0},
            {0, 3, 9, 2, 0}
        };

        Dijkstra d = new Dijkstra();
        d.dijkstra(graph, 0);
    }
}
