defmodule Dijkstra do
  @inf 1_000_000_000

  def dijkstra(graph, start) do
    n = length(graph)
    dist = List.duplicate(@inf, n) |> List.replace_at(start, 0)
    visited = List.duplicate(false, n)

    iterate(graph, dist, visited, n - 1)
  end

  defp iterate(_graph, dist, _visited, 0), do: dist

  defp iterate(graph, dist, visited, k) do
    {u, _} =
      dist
      |> Enum.with_index()
      |> Enum.filter(fn {_, i} -> not Enum.at(visited, i) end)
      |> Enum.min_by(fn {d, _} -> d end, fn -> {@inf, -1} end)

    if u == -1 do
      dist
    else
      visited = List.replace_at(visited, u, true)
      dist = relax(graph, dist, visited, u)
      iterate(graph, dist, visited, k - 1)
    end
  end

  defp relax(graph, dist, visited, u) do
    Enum.with_index(dist)
    |> Enum.map(fn {d, v} ->
      w = graph |> Enum.at(u) |> Enum.at(v)

      cond do
        Enum.at(visited, v) -> d
        w == 0 -> d
        Enum.at(dist, u) + w < d -> Enum.at(dist, u) + w
        true -> d
      end
    end)
  end
end

# Exemple d'utilisation
graph = [
  [0, 4, 0, 0, 1],
  [4, 0, 2, 0, 0],
  [0, 2, 0, 3, 0],
  [0, 0, 3, 0, 5],
  [1, 0, 0, 5, 0]
]

start = 0
distances = Dijkstra.dijkstra(graph, start)

IO.puts("Distances depuis le sommet #{start}")
Enum.with_index(distances)
|> Enum.each(fn {d, i} ->
  IO.puts("Vers #{i} : #{d}")
end)
