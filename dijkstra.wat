(module
  (memory 1)
  (export "memory" (memory 0))

  ;; Constantes
  (global $INF i32 (i32.const 1000000))

  ;; dijkstra(start, n, graphPtr, distPtr, visitedPtr)
  (func (export "dijkstra")
        (param $start i32) (param $n i32)
        (param $g i32) (param $d i32) (param $v i32)
        (local $i i32) (local $j i32) (local $u i32) (local $min i32)

    ;; initialisation
    (local.set $i (i32.const 0))
    (loop $init
      (br_if $end_init (i32.ge_u (local.get $i) (local.get $n)))
      (i32.store (i32.add (local.get $d) (i32.mul (local.get $i) (i32.const 4)))
                 (global.get $INF))
      (i32.store8 (i32.add (local.get $v) (local.get $i)) (i32.const 0))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br $init)
    )
    (block $end_init)

    ;; dist[start] = 0
    (i32.store (i32.add (local.get $d) (i32.mul (local.get $start) (i32.const 4)))
               (i32.const 0))

    ;; boucle principale (simplifiée)
    (local.set $i (i32.const 0))
    (loop $main
      (br_if $end (i32.ge_u (local.get $i) (local.get $n)))
      ;; sélection du minimum et relaxation (omises ici pour pédagogie)
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br $main)
    )
    (block $end)
  )
)
