with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
package body quicksort is
	procedure quicksort(lo:integer;hi:integer; A:in out myarray ) is
				pivot: integer;
		function partition(lo,hi: integer) return integer is
			i : integer;
			j: integer;
			low: integer;
			high: integer;
			temp: integer;
		begin
				pivot := A(hi);
				i := lo;
				j := lo;
				low := lo;
				high := hi;
				while j <= hi-1 loop
					if A(j) < pivot then
						temp := A(i);
						A(i) := A(j);
						A(j) := temp;
				
						i := i+1;
					end if;
					j := j+1;
				end loop;
				temp := A(i);
				A(i) := A(j);
				A(j) := temp;
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
				quicksort(low,pivot-1,A);
			end if;
			end quicksortTask1;
			task body quicksortTask2 is
			begin
				low := lo;
				high := hi;
			
			if low < high then
				quicksort(pivot+1,high,A);
			end if;
			end quicksortTask2;
		begin
			null;
		end go;
	begin
		pivot := partition(lo,hi);
		go(lo,pivot,hi);
	end quicksort;
end quicksort;
