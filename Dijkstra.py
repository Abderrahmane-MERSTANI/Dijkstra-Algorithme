import sys

INF = sys.maxsize
V = 5

def min_distance(dist, visited):
    minimum = INF
    index = -1
    for i in range(V):
        if not visited[i] and dist[i] < minimum:
            minimum = dist[i]
            index = i
    return index

def dijkstra(graph, src):
    dist = [INF] * V
    visited = [False] * V

    dist[src] = 0

    for _ in range(V - 1):
        u = min_distance(dist, visited)
        visited[u] = True

        for v in range(V):
            if (not visited[v] and graph[u][v] > 0 and
                dist[u] != INF and
                dist[u] + graph[u][v] < dist[v]):
                dist[v] = dist[u] + graph[u][v]

    print("Sommet | Distance depuis la source")
    for i in range(V):
        print(f"{i} \t | {dist[i]}")

# Exemple
graph = [
    [0, 10, 0, 0, 5],
    [0, 0, 1, 0, 2],
    [0, 0, 0, 4, 0],
    [7, 0, 6, 0, 0],
    [0, 3, 9, 2, 0]
]

dijkstra(graph, 0)
