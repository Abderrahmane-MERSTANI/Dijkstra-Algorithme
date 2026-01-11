Object subclass: Dijkstra [
    
    Dijkstra class >> shortestPaths: graph from: start [
        | n dist visited |
        n := graph size.
        dist := Array new: n withAll: 1000000.
        visited := Array new: n withAll: false.

        dist at: start put: 0.

        1 to: n - 1 do: [
            | u min |
            min := 1000000.
            u := nil.

            1 to: n do: [:i |
                ((visited at: i) not and: [(dist at: i) < min]) ifTrue: [
                    min := dist at: i.
                    u := i
                ]
            ].

            u ifNil: [ ^ dist ].
            visited at: u put: true.

            1 to: n do: [:v |
                ((visited at: v) not and: [(graph at: u) at: v ~= 0]) ifTrue: [
                    ((dist at: u) + ((graph at: u) at: v) < (dist at: v))
                        ifTrue: [
                            dist at: v put: (dist at: u) + ((graph at: u) at: v)
                        ]
                ]
            ].
        ].
        ^ dist
    ]
]

" Exemple d'utilisation "
| graph result |
graph := #(
    #(0 4 0 0 2)
    #(4 0 3 0 0)
    #(0 3 0 5 0)
    #(0 0 5 0 1)
    #(2 0 0 1 0)
).

result := Dijkstra shortestPaths: graph from: 1.
Transcript show: result.
