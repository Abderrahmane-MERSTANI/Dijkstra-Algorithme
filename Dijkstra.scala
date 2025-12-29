object Dijkstra {

  val INF: Int = Int.MaxValue

  def dijkstra(graph: Array[Array[Int]], start: Int): Array[Int] = {
    val n = graph.length
    val dist = Array.fill(n)(INF)
    val visited = Array.fill(n)(false)

    dist(start) = 0

    for (_ <- 0 until n - 1) {
      var min = INF
      var u = -1

      // Trouver le sommet non visité avec la distance minimale
      for (i <- 0 until n) {
        if (!visited(i) && dist(i) < min) {
          min = dist(i)
          u = i
        }
      }

      if (u == -1) return dist

      visited(u) = true

      // Mise à jour des distances
      for (v <- 0 until n) {
        if (!visited(v) &&
            graph(u)(v) != 0 &&
            dist(u) != INF &&
            dist(u) + graph(u)(v) < dist(v)) {
          dist(v) = dist(u) + graph(u)(v)
        }
      }
    }

    dist
  }

  def main(args: Array[String]): Unit = {
    val graph = Array(
      Array(0, 5, 0, 0, 2),
      Array(5, 0, 3, 0, 0),
      Array(0, 3, 0, 6, 0),
      Array(0, 0, 6, 0, 4),
      Array(2, 0, 0, 4, 0)
    )

    val start = 0
    val distances = dijkstra(graph, start)

    println(s"Distances depuis le sommet $start")
    for (i <- distances.indices) {
      println(s"Vers $i : ${distances(i)}")
    }
  }
}
