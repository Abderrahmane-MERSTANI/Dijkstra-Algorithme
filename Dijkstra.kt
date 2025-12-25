import java.util.*

const val INF = Int.MAX_VALUE

fun dijkstra(graph: Array<IntArray>, start: Int): IntArray {
    val n = graph.size
    val dist = IntArray(n) { INF }
    val visited = BooleanArray(n)

    dist[start] = 0

    for (i in 0 until n - 1) {
        var min = INF
        var u = -1

        // Trouver le sommet non visité avec la distance minimale
        for (j in 0 until n) {
            if (!visited[j] && dist[j] < min) {
                min = dist[j]
                u = j
            }
        }

        if (u == -1) break

        visited[u] = true

        // Mise à jour des distances
        for (v in 0 until n) {
            if (!visited[v] &&
                graph[u][v] != 0 &&
                dist[u] != INF &&
                dist[u] + graph[u][v] < dist[v]
            ) {
                dist[v] = dist[u] + graph[u][v]
            }
        }
    }

    return dist
}

fun main() {
    val graph = arrayOf(
        intArrayOf(0, 6, 0, 0, 9),
        intArrayOf(6, 0, 2, 0, 3),
        intArrayOf(0, 2, 0, 5, 0),
        intArrayOf(0, 0, 5, 0, 1),
        intArrayOf(9, 3, 0, 1, 0)
    )

    val start = 0
    val distances = dijkstra(graph, start)

    println("Distances depuis le sommet $start")
    for (i in distances.indices) {
        println("Vers $i : ${distances[i]}")
    }
}
