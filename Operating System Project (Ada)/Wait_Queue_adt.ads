with Ada.Numerics;
with Ada.Numerics.Discrete_Random;
--specificationss for the ready queue
package Wait_Queue_adt is
   subtype process_index_type is integer range 1..25;--the process index
--------------------------------------------------------------------------
   type Process_Type is record--record of the process properties
      process_Name : string(1..4);--the process name representation in the record
      process_amount : integer;--process amount
      process_index:process_index_type;--process index
      end record;
  type Queue_Type (Max_Size : Positive) is limited private;
--------------------------------------------------------------------------
  UNDERFLOW : exception;--general exceptions
  OVERFLOW  : exception;
--------------------------------------------------------------------------
--functions and procedures for dealing with the queue
  procedure Clear (Wait_Queue : in out Queue_Type);
  function Is_Empty (Wait_Queue : Queue_Type) return Boolean;
  function Is_Full (Wait_Queue : Queue_Type) return Boolean;
  procedure Enqueue (The_Process :in Process_Type;
		Wait_Queue: in out Queue_Type);
  procedure Dequeue (Wait_Queue : in out Queue_Type);
  function Front_Of (Wait_Queue : Queue_Type) return Process_Type;
 function Length_Of (Wait_Queue : Queue_Type) return Natural;
 procedure Copy (Wait_Queue    : in     Queue_Type;
                 To_Wait_Queue : in out Queue_Type);
 function Is_Equal (Left  : Queue_Type;
                    Right : Queue_Type) return Boolean;
--------------------------------------------------------------------------
private
  type Queue_Array is array (Positive range <>) of Process_Type;
  type Queue_Type (Max_Size : Positive) is
    record
      Count    : Natural  := 0;               -- Number of items in the queue
      Front    : Positive := 1;               -- Pointer to first item in the queue
      Rear     : Positive := Max_Size;        -- Pointer to last item in the queue
      Processes : Queue_Array (1..Max_Size);   -- The queue array
      next	:process_index_type:= process_index_type'First;--next item in queue
      end record;
end Wait_Queue_Adt;
