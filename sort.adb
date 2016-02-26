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
	task partition is
		entry startPart(lo: integer; hi: integer);
	end partition;
	task quicksortTask1 is
		entry startSort(lo: integer; hi: integer);
	end quicksortTask1;
		task quicksortTask2 is
		entry startSort(lo: integer; hi: integer);
	end quicksortTask2;
	
	task body  partition is
		i : integer;
		pivot: integer;
		j: integer;
		low: integer;
		high: integer;
	begin
		accept startPart(lo: integer; hi: integer) do
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
			new_line;
 		end startPart;
			new_line;
			--put(low, i, high);
			new_line;
			quicksortTask1.startSort(low,i-1);
			quicksortTask2.startSort(i+1,high);
	end partition;
    task body quicksortTask1 is
		low: integer;
		high: integer;
		begin
		accept startSort(lo:Integer; hi:Integer) do
			low := lo;
			high := hi;
		end startSort;
		
		if low < high then
			partition.startPart(low,high);
		end if;
	end quicksortTask1;
		task body quicksortTask2 is
		low: integer;
		high: integer;
		begin
		accept startSort(lo:Integer; hi:Integer) do
			low := lo;
			high := hi;
		end startSort;
		
		if low < high then
			partition.startPart(low,high);
		end if;
	end quicksortTask2;
		
begin
	for i in 1..30 loop
		get(A(i));
	end loop;
	partition.startPart(1,30);
	for i in 1..30 loop
		put(A(i));
	end loop;

end Main;
