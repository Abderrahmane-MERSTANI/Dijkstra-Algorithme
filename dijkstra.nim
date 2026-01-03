const INF = 1_000_000

proc dijkstra(graph: seq[seq[int]], start: int): seq[int] =
  let n = graph.len
  var dist = newSeq[int](n)
  var visited = newSeq[bool](n)

  # Initialisation
  for i in 0..<n:
    dist[i] = INF
    visited[i] = false
  dist[start] = 0

  for _ in 0..<n-1:
    var u = -1
    var minVal = INF

    # Trouver le sommet non visité avec la distance minimale
    for i in 0..<n:
      if not visited[i] and dist[i] < minVal:
        minVal = dist[i]
        u = i

    if u == -1: break
    visited[u] = true

    # Mise à jour des distances
    for v in 0..<n:
      if not visited[v] and graph[u][v] != 0 and
         dist[u] + graph[u][v] < dist[v]:
        dist[v] = dist[u] + graph[u][v]

  return dist

when isMainModule:
  let graph = @[
    @[0, 7, 0, 0, 2],
    @[7, 0, 3, 0, 0],
    @[0, 3, 0, 4, 0],
    @[0, 0, 4, 0, 1],
    @[2, 0, 0, 1, 0]
  ]

  let start = 0
  let distances = dijkstra(graph, start)

  echo "Distances depuis le sommet ", start
  for i, d in distances:
    echo "Vers ", i, " : ", d
