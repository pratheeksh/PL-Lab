Control.Print.printDepth := 100;
Control.Print.printLength := 100;

fun insertInt x []= [x]
 | insertInt x (y::ys) = if x<y then x::y::ys else y::insertInt x ys;

fun sortInt [] = []
| sortInt (x::xs) = insertInt x (sortInt xs);

fun sort (op <) [] = []
| sort (op <) (x::xs) =
 
 let fun insert (x,nil)= [x]
 
 | insert(x, y::ys) = if x<y then x::y::ys else y::insert(x,ys)
 in
 insert (x, (sort (op <) xs))
 end;
 
 
 fun reduce f b [] = b
| reduce f b (x::xs) = f(x, reduce f b xs);


 datatype 'a tree  = leaf of 'a
| node of 'a tree list;


 fun fringe ( leaf x) = [x]
 | fringe (node L) = reduce (op @) [] (map fringe L);


fun mapTree (op f) (leaf k) = leaf (f(k))
  |mapTree (op f) (node L) = node (map (mapTree (op f)) L);


 fun sortTree (op <) (leaf L) = leaf(sort (op <) L)
| sortTree (op <) (node M) = node( map (sortTree (op <))  M);

fun sortTree2 (op <) L = mapTree (sort (op <)) L;



 fun merge (op <) L [] = L
 | merge (op <) [] M = M
 | merge (op <) (x::xs) (y::ys) = 
 if x < y then x::(merge (op <) xs (y::ys))
 else y::(merge (op <) (x::xs) ys);


fun mergeTree (op <) T =
 let 
 val N = sortTree (op <) T
 val L = fringe N
 val K = reduce (op @) [] L
 in
 sort (op <) K
 end;

