--Kelsey Willett
--"sumofsqs" (v.1)
--asks for an integer, 
--squares that integer and 
--adds the square of the integer to the sum of all integers
								--from 1 to that number 
--output formatting could be better
		--there is no exception handling for non-integers  
with ada.integer_text_IO;
with ada.text_IO;
use ada.text_IO;
use ada.integer_text_IO;	 
procedure sumofsqs is

topNum	: integer		; --the number being asked for, "x"
   sum	: integer	:=	0; --sum of squares

begin
   loop
      put("Enter an integer value. ");
            get(topNum);
      for i in 1..topNum loop	  --from 1 to the integer
         sum := sum + (i * i);	    
      end loop;
      new_line;
      put("The sum of the squares up to and including ");
      put(topNum);			  --displays number entered
      put(" is: ");
      put(sum);
      sum := 0;	--reset sum
      new_line;
      new_line;
      exit when (topNum <= 0); --exit program when 0 is entered
   end loop;
end;


