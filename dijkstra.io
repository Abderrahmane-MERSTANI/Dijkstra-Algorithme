INF := 1000000
N := 5

graph := list(
  list(0, 4, 0, 0, 2),
  list(4, 0, 3, 0, 0),
  list(0, 3, 0, 5, 0),
  list(0, 0, 5, 0, 1),
  list(2, 0, 0, 1, 0)
)

dist := List clone
visited := List clone

N repeat(i,
  dist append(INF)
  visited append(false)
)

dist atPut(0, 0)  // sommet source

for(step, 0, N - 2,
  min := INF
  u := -1

  for(i, 0, N - 1,
    if(visited at(i) == false and dist at(i) < min,
      min = dist at(i)
      u = i
    )
  )

  if(u == -1, break)
  visited atPut(u, true)

  for(v, 0, N - 1,
    if(
      visited at(v) == false and
      graph at(u) at(v) != 0 and
      dist at(u) + graph at(u) at(v) < dist at(v),
      dist atPut(v, dist at(u) + graph at(u) at(v))
    )
  )
)

dist println
