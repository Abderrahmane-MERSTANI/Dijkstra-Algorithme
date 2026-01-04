let inf = max_int

let dijkstra graph start =
  let n = Array.length graph in
  let dist = Array.make n inf in
  let visited = Array.make n false in

  dist.(start) <- 0;

  for _ = 0 to n - 2 do
    let u = ref (-1) in
    let min_val = ref inf in

    (* Trouver le sommet non visité avec la distance minimale *)
    for i = 0 to n - 1 do
      if (not visited.(i)) && dist.(i) < !min_val then begin
        min_val := dist.(i);
        u := i
      end
    done;

    if !u <> -1 then begin
      visited.(!u) <- true;

      (* Mise à jour des distances *)
      for v = 0 to n - 1 do
        if (not visited.(v)) && graph.(!u).(v) <> 0 then
          if dist.(!u) + graph.(!u).(v) < dist.(v) then
            dist.(v) <- dist.(!u) + graph.(!u).(v)
      done
    end
  done;
  dist

let () =
  let graph = [|
    [|0; 2; 0; 0; 6|];
    [|2; 0; 3; 0; 0|];
    [|0; 3; 0; 1; 0|];
    [|0; 0; 1; 0; 4|];
    [|6; 0; 0; 4; 0|]
  |] in

  let start = 0 in
  let dist = dijkstra graph start in

  Printf.printf "Distances depuis le sommet %d\n" start;
  Array.iteri (fun i d ->
    Printf.printf "Vers %d : %d\n" i d
  ) dist
