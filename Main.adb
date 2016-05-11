with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
with quicksort;
use quicksort;
procedure Main is
	A: quicksort.myarray;


   task PrintTask is
      entry printSum(sum : INTEGER);
	  entry printArray;
	end printTask;
   task addTask is
   entry addArray;
   end addTask;
	
	task readTask;
	task sortTask is
		entry sortArray;
	end sortTask;
	task body readTask is
	begin
		for i in 1..30 loop
			get(A(i));
		end loop;
		printTask.printArray;
   end readTask;
   task body printTask is
   begin
      Put_Line("Printing array");
		accept printArray do
			for i in 1..30 loop
				put(A(i));
				new_line;
			end loop;
		end printArray;
		New_line;
		sortTask.sortArray;
		put_line("Printing sorted array");	
		accept printArray do
			for i in 1..30 loop
				put(A(i));
				new_line;
			end loop;
		end printArray;

         accept printSum(sum: Integer) do
            Put("Sum of the array is");
            Put(Sum);
         end printSum;
   end printTask;

   
   task body addTask is
   sum: integer;
   begin
   	accept addArray do
   	 	sum := 0;
      	for Index in 1..30 loop
        	 sum := sum+A(Index);
      	end loop;
	  
	    printTask.printSum(sum);
   	end addArray;
   end addTask;
   task body sortTask is
   begin
   		accept sortArray do
		quicksort.quicksort(1,30,A);
		end sortArray;
		printTask.printarray;
		addtask.addArray;
	end sortTask;
begin
null;
-- quicksort.quicksort(1,30);
end Main;
