package body proj3lib is
	procedure Get (order : in ordertype; rest : out ordertype) is
	begin
		if n = null then
			rest := null;
	else
        	rest := n.rest;
      	end if;
   	end get;
