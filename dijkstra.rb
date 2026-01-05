INF = 1_000_000_000

def dijkstra(graph, start)
  n = graph.length
  dist = Array.new(n, INF)
  visited = Array.new(n, false)

  dist[start] = 0

  (n - 1).times do
    u = -1
    min = INF

    # Trouver le sommet non visité avec la distance minimale
    (0...n).each do |i|
      if !visited[i] && dist[i] < min
        min = dist[i]
        u = i
      end
    end

    break if u == -1
    visited[u] = true

    # Mise à jour des distances
    (0...n).each do |v|
      if !visited[v] && graph[u][v] != 0 &&
         dist[u] + graph[u][v] < dist[v]
        dist[v] = dist[u] + graph[u][v]
      end
    end
  end

  dist
end

# Exemple d'utilisation
graph = [
  [0, 7, 0, 0, 2],
  [7, 0, 3, 0, 0],
  [0, 3, 0, 4, 0],
  [0, 0, 4, 0, 1],
  [2, 0, 0, 1, 0]
]

start = 0
distances = dijkstra(graph, start)

puts "Distances depuis le sommet #{start}"
distances.each_with_index do |d, i|
  puts "Vers #{i} : #{d}"
end

