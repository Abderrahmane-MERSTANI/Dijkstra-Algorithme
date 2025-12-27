import Foundation

let INF = Int.max

func dijkstra(graph: [[Int]], start: Int) -> [Int] {
    let n = graph.count
    var dist = Array(repeating: INF, count: n)
    var visited = Array(repeating: false, count: n)

    dist[start] = 0

    for _ in 0..<(n - 1) {
        var minDist = INF
        var u = -1

        // Trouver le sommet non visité avec la distance minimale
        for i in 0..<n {
            if !visited[i] && dist[i] < minDist {
                minDist = dist[i]
                u = i
            }
        }

        if u == -1 { break }

        visited[u] = true

        // Mise à jour des distances
        for v in 0..<n {
            if !visited[v],
               graph[u][v] != 0,
               dist[u] != INF,
               dist[u] + graph[u][v] < dist[v] {
                dist[v] = dist[u] + graph[u][v]
            }
        }
    }

    return dist
}

// Exemple d'utilisation
let graph = [
    [0, 4, 0, 0, 7],
    [4, 0, 1, 0, 2],
    [0, 1, 0, 6, 0],
    [0, 0, 6, 0, 3],
    [7, 2, 0, 3, 0]
]

let start = 0
let distances = dijkstra(graph: graph, start: start)

print("Distances depuis le sommet \(start)")
for (i, d) in distances.enumerated() {
    print("Vers \(i) : \(d)")
}
