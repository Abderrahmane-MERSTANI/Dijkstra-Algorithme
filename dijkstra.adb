with Ada.Text_IO; use Ada.Text_IO;

procedure Dijkstra is
   N   : constant Integer := 5;
   INF : constant Integer := 1_000_000;

   type Matrix is array (1 .. N, 1 .. N) of Integer;
   type Vector is array (1 .. N) of Integer;
   type Bool_Array is array (1 .. N) of Boolean;

   Graph   : Matrix :=
     ((0, 10, 0, 0, 5),
      (10, 0, 1, 0, 2),
      (0, 1, 0, 4, 0),
      (0, 0, 4, 0, 3),
      (5, 2, 0, 3, 0));

   Dist    : Vector;
   Visited : Bool_Array;

   Start   : constant Integer := 1;
   Min     : Integer;
   U       : Integer;

begin
   -- Initialisation
   for I in 1 .. N loop
      Dist(I)    := INF;
      Visited(I) := False;
   end loop;
   Dist(Start) := 0;

   -- Algorithme de Dijkstra
   for I in 1 .. N - 1 loop
      Min := INF;
      U   := -1;

      for J in 1 .. N loop
         if (not Visited(J)) and (Dist(J) < Min) then
            Min := Dist(J);
            U   := J;
         end if;
      end loop;

      exit when U = -1;

      Visited(U) := True;

      for V in 1 .. N loop
         if (not Visited(V)) and (Graph(U, V) /= 0) and
            (Dist(U) + Graph(U, V) < Dist(V)) then
            Dist(V) := Dist(U) + Graph(U, V);
         end if;
      end loop;
   end loop;

   -- Affichage
   Put_Line("Distances depuis le sommet" & Integer'Image(Start));
   for I in 1 .. N loop
      Put_Line("Vers" & Integer'Image(I) & " :" & Integer'Image(Dist(I)));
   end loop;

end Dijkstra;
