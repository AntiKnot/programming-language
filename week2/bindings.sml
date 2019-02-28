val x = 12;
val n =2 + x;
val x = n-14;
val n = n*x;
val b = if n =x then 8 else 5;
val a = if b = 5 then x else b;

fun addd(x:int, y:int) =
    x+y
val i = (2,3);
val j = addd i;

fun swap (pr: int*bool) = 
  (#2 pr, #1 pr)
  
(* (int * int) * (int * int) -> int *)
fun sum_two_pairs (pr1:int*int, pr2:int*int) = 
  (#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2)
  
(* int * int -> (int * int) *)
fun div_mod (x:int,y:int) = 
  (x div y, x mod y)

fun sort_pair (pr: int * int) = 
  if (#1 pr) < (#2 pr)
  then pr
  else (#2 pr, #1 pr)
