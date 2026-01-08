const inf = 1_000_000

fn dijkstra(graph [][]int, start int) []int {
	n := graph.len
	mut dist := []int{len: n, init: inf}
	mut visited := []bool{len: n, init: false}

	dist[start] = 0

	for _ in 0 .. n - 1 {
		mut min := inf
		mut u := -1

		// Trouver le sommet non visité avec la plus petite distance
		for i in 0 .. n {
			if !visited[i] && dist[i] < min {
				min = dist[i]
				u = i
			}
		}

		if u == -1 {
			break
		}

		visited[u] = true

		// Mise à jour des distances
		for v in 0 .. n {
			if !visited[v] && graph[u][v] != 0 &&
				dist[u] + graph[u][v] < dist[v] {
				dist[v] = dist[u] + graph[u][v]
			}
		}
	}
	return dist
}

fn main() {
	graph := [
		[0, 4, 0, 0, 2],
		[4, 0, 3, 0, 0],
		[0, 3, 0, 5, 0],
		[0, 0, 5, 0, 1],
		[2, 0, 0, 1, 0],
	]

	distances := dijkstra(graph, 0)
	println(distances)
}
