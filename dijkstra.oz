declare
INF = 1000000
N = 5

Graph = [
  [0 4 0 0 2]
  [4 0 3 0 0]
  [0 3 0 5 0]
  [0 0 5 0 1]
  [2 0 0 1 0]
]

fun {InitList Value}
  {List.make N Value}
end

fun {MinDistance Dist Visited}
  fun {Loop I Min U}
    if I > N then U
    elseif {Nth Visited I} == false andthen {Nth Dist I} < Min then
      {Loop I+1 {Nth Dist I} I}
    else
      {Loop I+1 Min U}
    end
  end
in
  {Loop 1 INF 0}
end

fun {Dijkstra Graph Start}
  Dist = {InitList INF}
  Visited = {InitList false}
in
  {List.put Dist Start 0}

  for Step in 1..N-1 do
    U = {MinDistance Dist Visited}
    if U == 0 then skip end
    {List.put Visited U true}

    for V in 1..N do
      if {Nth Visited V} == false andthen
         {Nth {Nth Graph U} V} \= 0 andthen
         {Nth Dist U} + {Nth {Nth Graph U} V} < {Nth Dist V} then
        {List.put Dist V {Nth Dist U} + {Nth {Nth Graph U} V}}
      end
    end
  end
  Dist
end

{Browse {Dijkstra Graph 1}}
