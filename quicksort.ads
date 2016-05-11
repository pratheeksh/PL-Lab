Package quicksort is
	subtype int is integer range 1..1000;
	type myarray is array(1..30) of integer;
	Procedure Quicksort(lo:integer;hi: integer;A: in out myarray);
end quicksort;
