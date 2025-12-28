const INF = typemax(Int)

function dijkstra(graph::Array{Int,2}, start::Int)
    n = size(graph, 1)
    dist = fill(INF, n)
    visited = fill(false, n)

    dist[start] = 0

    for _ in 1:n-1
        minDist = INF
        u = -1

        # Trouver le sommet non visité avec la distance minimale
        for i in 1:n
            if !visited[i] && dist[i] < minDist
                minDist = dist[i]
                u = i
            end
        end

        if u == -1
            break
        end

        visited[u] = true

        # Mise à jour des distances
        for v in 1:n
            if !visited[v] && graph[u, v] != 0 &&
               dist[u] + graph[u, v] < dist[v]
                dist[v] = dist[u] + graph[u, v]
            end
        end
    end

    return dist
end

# Exemple d'utilisation
graph = [
    0 4 0 0 6;
    4 0 2 0 0;
    0 2 0 5 0;
    0 0 5 0 3;
    6 0 0 3 0
]

start = 1
distances = dijkstra(graph, start)

println("Distances depuis le sommet ", start)
for i in 1:length(distances)
    println("Vers ", i, " : ", distances[i])
end
