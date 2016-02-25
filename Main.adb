with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Main is
	subtype int is integer range 0..1000;
	A: array(1..30) of int;


   task PrintTask is
      entry printSum(sum : INTEGER);
	  entry printArray;
	end printTask;
   task addTask is
   entry addArray;
   end addTask;
	
	task readTask;
	
	task body readTask is
	begin
		for i in 1..30 loop
			get(A(i));
		end loop;
		printTask.printArray;
		addtask.addArray;
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
begin
 null;
end Main;
