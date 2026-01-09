INF = 1_000_000

def dijkstra(graph : Array(Array(Int32)), start : Int32)
  n = graph.size
  dist = Array.new(n, INF)
  visited = Array.new(n, false)

  dist[start] = 0

  (n - 1).times do
    min = INF
    u = -1

    # Trouver le sommet non visité avec la distance minimale
    n.times do |i|
      if !visited[i] && dist[i] < min
        min = dist[i]
        u = i
      end
    end

    break if u == -1
    visited[u] = true

    # Mise à jour des distances
    n.times do |v|
      if !visited[v] && graph[u][v] != 0 &&
         dist[u] + graph[u][v] < dist[v]
        dist[v] = dist[u] + graph[u][v]
      end
    end
  end

  dist
end

graph = [
  [0, 4, 0, 0, 2],
  [4, 0, 3, 0, 0],
  [0, 3, 0, 5, 0],
  [0, 0, 5, 0, 1],
  [2, 0, 0, 1, 0]
]

puts dijkstra(graph, 0)
