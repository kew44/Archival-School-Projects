with ada.Integer_Text_IO, ada.Text_IO;
use ada.Integer_Text_IO, ada.Text_IO;

procedure proj3 is
   subtype actionCodeType is character;
   subtype itemcodetype   is string(1..5);
   subtype stockedtype    is integer;
   subtype itemrange      is positive range 1..50;
   		--we will assume that the store has at most 50 different items

   type inventorytype is record
      itemcode:itemcodetype;
      stocked:stockedtype;
   end record;
   --inventory is above the *end* in datafile
   	--only properties are the itemcode and # stocked
   		--will be put into array

   type ordertype is record
      actioncode:actioncodetype;
      item:itemcodetype;
      Quant:stockedtype;
   end record;
   --order is below *end*

   type inventoryarray is array(itemrange) of inventorytype;
      Rawdata: File_Type;
      Report: File_type;
	  inventoryrecord:inventorytype;
	  orderrecord:ordertype;

   procedure getinventory(itemcode: in  itemcodetype;
			   stocked: in out stockedtype) is
   begin
    Open(File => Rawdata, Mode => In_File, Name => "E:\ADA NOW!\proj3data.txt");
      loop
         get(rawdata, inventoryrecord.itemcode);--gets itemcode
         get(rawdata, inventoryrecord.stocked);--gets number stocked
         exit when inventoryrecord.itemcode = "*END*";
      end loop;
   end getinventory;


    procedure getorder(actioncode: in  actioncodetype;
			item : in  itemcodetype;
			quant: in  stockedtype) is
    begin
    Open(File => Rawdata, Mode => In_File, Name => "E:\ADA NOW!\proj3data.txt");
      loop
	 get(rawdata, orderrecord.actioncode);
         get(rawdata, orderrecord.item);
         get(rawdata, orderrecord.quant);
      end loop;
    end getorder;

begin
    Open(File => Rawdata, Mode => In_File, Name => "E:\ADA NOW!\proj3data.txt");
    Create(Report, Mode => Out_File, Name => "e:\ada now!\proj3report.txt");
    while not End_Of_File(File => Rawdata) LOOP
      getinventory(inventoryrecord.itemcode,
                   inventoryrecord.stocked);

      getorder(orderrecord.actioncode,
               orderrecord.item,
               orderrecord.quant);

      case orderrecord.actioncode is
         when 'o'  => put(report, "You are ordering: ");
            put(report,orderrecord.Quant);
            put(report," of item: ");
            put(report,orderrecord.item);
            	if orderrecord.quant > inventoryrecord.stocked then
               		put(report, "Unfortunately, there is not enough in stock to fill your order. We only have ");
               		put(report, inventoryrecord.stocked);
               		put(report," availible. This order will not be filled. Try back soon!");
            	else
               		inventoryrecord.stocked := inventoryrecord.stocked - orderrecord.Quant;
            	end if;

         when 'c'  => put(report, "You are checking the amount in stock of: ");
            put(report, orderrecord.item);
            put(report, "We currently have ");
            put(report, inventoryrecord.stocked);
            put(report, orderrecord.item);
            put(report, " in stock.");

         when 'r'  => put(report, "You are restocking: ");
            put(report,orderrecord.Quant);
            put(report," of item: ");
            put(report,orderrecord.item);
               inventoryrecord.stocked := inventoryrecord.stocked + orderrecord.Quant;
            put(report, "There are now ");
            put(report, inventoryrecord.stocked);
            put(report,orderrecord.item);

	when 'q'  => exit;
	when others => raise constraint_error;
      end case;
   	Close(File => RawData);
   	close(file => report);
    end loop;

exception
	when constraint_error =>
		put_line("invalid");


end proj3;


