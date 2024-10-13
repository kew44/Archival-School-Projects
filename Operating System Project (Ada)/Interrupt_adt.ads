package Interrupt_adt is
   subtype Interrupt_index_type is integer range 1..5;
   ---------------------------
type Interrupt_Type is record
Interrupt_Position_S: integer;
Interrupt_Position_E: integer;
Interr_Description:String(1..4);
Old_Processor_State:character;
New_Processor_State:character;
      Interrupt_Index:Interrupt_index_type;
   end record;
   ----------------------------
  type Queue_Type (Max_Size : Positive) is limited private;
--------------------------------------------------------------------------
  UNDERFLOW : exception;--general exceptions
  OVERFLOW  : exception;
--------------------------------------------------------------------------
--functions and procedures for dealing with the queue

  procedure Clear (Interruptions_Q : in out Queue_Type);
  function Is_Empty (Interruptions_Q : Queue_Type) return Boolean;
  function Is_Full (Interruptions_Q : Queue_Type) return Boolean;
  procedure Enqueue (Excuse_Me :in Interrupt_Type;
		Interruptions_Q: in out Queue_Type);
  procedure Dequeue (Interruptions_Q : in out Queue_Type);
  function Front_Of (Interruptions_Q : Queue_Type) return Interrupt_Type;
 function Length_Of (Interruptions_Q : Queue_Type) return Natural;
 procedure Copy (Interruptions_Q    : in     Queue_Type;
                 Q_Interrupted : in out Queue_Type);
 function Is_Equal (Left  : Queue_Type;
                    Right : Queue_Type) return Boolean;
--------------------------------------------------------------------------
private
  type Queue_Array is array (Positive range <>) of Interrupt_Type;
  type Queue_Type (Max_Size : Positive) is
    record
      Count    : Natural  := 0;               -- Number of items in the queue
      Front    : Positive := 1;               -- Pointer to first item in the queue
      Rear     : Positive := Max_Size;        -- Pointer to last item in the queue
         Processes : Queue_Array (1..Max_Size);   -- The queue array
         next	:Interrupt_index_type:= Interrupt_index_type'First;--next item in queue--***?really 'first?
      end record;-------------------------------------
end Interrupt_Adt;
