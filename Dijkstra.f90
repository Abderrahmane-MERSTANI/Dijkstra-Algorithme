program dijkstra_example
    implicit none
    integer, parameter :: INF = 1000000000
    integer :: n, start, i
    integer, dimension(5,5) :: graph
    integer, dimension(5) :: dist
    logical, dimension(5) :: visited

    graph = reshape([ &
        0, 4, 0, 0, 6, &
        4, 0, 2, 0, 0, &
        0, 2, 0, 5, 0, &
        0, 0, 5, 0, 3, &
        6, 0, 0, 3, 0  &
    ], [5,5])

    start = 1
    n = 5

    call dijkstra(graph, n, start, dist)

    print *, "Distances depuis le sommet", start
    do i = 1, n
        print *, "Vers", i, ":", dist(i)
    end do
contains

subroutine dijkstra(graph, n, start, dist)
    integer, intent(in) :: n, start
    integer, intent(in) :: graph(n,n)
    integer, intent(out) :: dist(n)
    logical :: visited(n)
    integer :: i, j, u, minDist

    visited = .false.
    dist = INF
    dist(start) = 0

    do i = 1, n-1
        minDist = INF
        u = -1

        do j = 1, n
            if (.not. visited(j) .and. dist(j) < minDist) then
                minDist = dist(j)
                u = j
            end if
        end do

        if (u == -1) exit

        visited(u) = .true.

        do j = 1, n
            if (.not. visited(j) .and. graph(u,j) /= 0) then
                if (dist(u) + graph(u,j) < dist(j)) then
                    dist(j) = dist(u) + graph(u,j)
                end if
            end if
        end do
    end do
end subroutine dijkstra

end program dijkstra_example
