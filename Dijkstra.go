package main

import (
	"fmt"
	"math"
)

const INF = math.MaxInt32

func dijkstra(graph [][]int, start int) []int {
	n := len(graph)
	dist := make([]int, n)
	visited := make([]bool, n)

	// Initialisation des distances
	for i := 0; i < n; i++ {
		dist[i] = INF
	}
	dist[start] = 0

	for i := 0; i < n-1; i++ {
		u := -1
		min := INF

		// Trouver le sommet non visité avec la plus petite distance
		for j := 0; j < n; j++ {
			if !visited[j] && dist[j] < min {
				min = dist[j]
				u = j
			}
		}

		if u == -1 {
			break
		}

		visited[u] = true

		// Mise à jour des distances
		for v := 0; v < n; v++ {
			if !visited[v] && graph[u][v] != 0 &&
				dist[u] != INF &&
				dist[u]+graph[u][v] < dist[v] {
				dist[v] = dist[u] + graph[u][v]
			}
		}
	}

	return dist
}

func main() {
	graph := [][]int{
		{0, 10, 0, 0, 5},
		{10, 0, 1, 0, 2},
		{0, 1, 0, 4, 0},
		{0, 0, 4, 0, 3},
		{5, 2, 0, 3, 0},
	}

	start := 0
	distances := dijkstra(graph, start)

	fmt.Println("Distances depuis le sommet", start)
	for i, d := range distances {
		fmt.Printf("Vers %d : %d\n", i, d)
	}
}
