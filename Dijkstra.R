INF <- Inf

dijkstra <- function(graph, start) {
  n <- nrow(graph)
  dist <- rep(INF, n)
  visited <- rep(FALSE, n)

  dist[start] <- 0

  for (i in 1:(n - 1)) {
    minDist <- INF
    u <- -1

    # Trouver le sommet non visité avec la distance minimale
    for (j in 1:n) {
      if (!visited[j] && dist[j] < minDist) {
        minDist <- dist[j]
        u <- j
      }
    }

    if (u == -1) break

    visited[u] <- TRUE

    # Mise à jour des distances
    for (v in 1:n) {
      if (!visited[v] && graph[u, v] != 0 &&
          dist[u] + graph[u, v] < dist[v]) {
        dist[v] <- dist[u] + graph[u, v]
      }
    }
  }

  return(dist)
}

# Exemple d'utilisation
graph <- matrix(c(
  0, 2, 0, 0, 6,
  2, 0, 3, 0, 0,
  0, 3, 0, 1, 0,
  0, 0, 1, 0, 4,
  6, 0, 0, 4, 0
), nrow = 5, byrow = TRUE)

start <- 1
distances <- dijkstra(graph, start)

cat("Distances depuis le sommet", start, "\n")
for (i in 1:length(distances)) {
  cat("Vers", i, ":", distances[i], "\n")
}
