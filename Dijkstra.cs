using System;

class Dijkstra
{
    static int INF = int.MaxValue;

    static int[] DijkstraAlgo(int[,] graph, int start)
    {
        int n = graph.GetLength(0);
        int[] dist = new int[n];
        bool[] visited = new bool[n];

        // Initialisation
        for (int i = 0; i < n; i++)
        {
            dist[i] = INF;
            visited[i] = false;
        }

        dist[start] = 0;

        for (int count = 0; count < n - 1; count++)
        {
            int min = INF;
            int u = -1;

            // Trouver le sommet avec la distance minimale
            for (int i = 0; i < n; i++)
            {
                if (!visited[i] && dist[i] <= min)
                {
                    min = dist[i];
                    u = i;
                }
            }

            if (u == -1)
                break;

            visited[u] = true;

            // Mise à jour des distances
            for (int v = 0; v < n; v++)
            {
                if (!visited[v] &&
                    graph[u, v] != 0 &&
                    dist[u] != INF &&
                    dist[u] + graph[u, v] < dist[v])
                {
                    dist[v] = dist[u] + graph[u, v];
                }
            }
        }

        return dist;
    }

    static void Main()
    {
        int[,] graph = {
            { 0, 4, 0, 0, 8 },
            { 4, 0, 3, 0, 2 },
            { 0, 3, 0, 7, 0 },
            { 0, 0, 7, 0, 1 },
            { 8, 2, 0, 1, 0 }
        };
