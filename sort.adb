with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Main is
	A : array(1..30) of integer;
	procedure Swap(a,b: in out integer) is
		temp: integer;
	begin
		temp := a;
		a := b;
		b := temp;
	end Swap;
	procedure quicksort(lo,hi:integer ) is
	
			pivot: integer;
		function partition(lo,hi: integer) return integer is
			i : integer;
			j: integer;
			low: integer;
			high: integer;
		begin
				pivot := A(hi);
				i := lo;
				j := lo;
				low := lo;
				high := hi;
				while j <= hi-1 loop
					if A(j) < pivot then
						swap(A(i), A(j));
						i := i+1;
					end if;
					j := j+1;
				end loop;
				swap(A(i),A(j));
				for i in 1..30 loop
					put (A(i));
				new_line;
				end loop;
		return i;
			--put(low, i, high);
		end;
		procedure go(lo,pivot,hi: integer) is
			low: integer;
			high: integer;
			task quicksortTask1;
			task quicksortTask2;
			task body quicksortTask1 is
			begin
				low := lo;
				high := hi;
			
			if low < high then
				quicksort(low,pivot-1);
			end if;
			end quicksortTask1;
			task body quicksortTask2 is
			begin
				low := lo;
				high := hi;
			
			if low < high then
				quicksort(pivot+1,high);
			end if;
			end quicksortTask2;
		begin
			null;
		end go;
	begin
		pivot := partition(lo,hi);
		go(lo,pivot,hi);
	end quicksort;

	
begin
	for i in 1..30 loop
		get(A(i));
	end loop;
	quicksort(1,30);
	for i in 1..30 loop
		put(A(i));
	end loop;

end Main;
