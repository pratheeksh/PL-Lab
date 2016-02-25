with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Quicksort(low:integer;high:integer) is
	A:  array(1..30) of integer;

	procedure Swap(a,b:integer) is
		temp: integer;
	begin
		temp := a;
		a := b;
		b := temp;
	end Swap;

	function partition(lo:integer;hi:integer) return Integer is
		pivot: integer;
		i: integer;
		j: integer;
	begin
		pivot := A(hi);
		i := lo;
		j := lo;
		while j <= hi-1 loop
		begin
			if A(j) <= pivot then
			begin
				swap(A(i),A(j));
				i := i+1;
			end if;
		j:= j+1;
		end loop;
		swap(A(i),A(hi));
	return i;
	end partition;

begin
null;
end Quicksort;
		


