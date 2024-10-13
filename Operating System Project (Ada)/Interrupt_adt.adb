package body Interrupt_adt is-----------------------------------------------------------
--clear the queue
 procedure Clear (Interruptions_Q : in out Queue_Type) is
   begin
      Interruptions_Q.Count := 0;
      Interruptions_Q.Front := 1;
      Interruptions_Q.Rear  := Interruptions_Q.Max_Size;
   end Clear;
--------------------------------------------------------------------------
--test to see that queue is empty
   function Is_Empty (Interruptions_Q : in Queue_Type) return Boolean is
   begin
      return Interruptions_Q.Count = 0;
   end Is_Empty;
   function Is_Full (Interruptions_Q : in Queue_Type) return Boolean is
   begin
      return Interruptions_Q.Count = Interruptions_Q.Max_Size;
   end Is_Full;
--------------------------------------------------------------------------
--puts processes on the queue
  procedure Enqueue (Excuse_Me  : in     Interrupt_Type;
                     Interruptions_Q : in out Queue_Type) is
   begin
      if Is_Full (Interruptions_Q) then
        raise OVERFLOW;
      else
        Interruptions_Q.Rear := Interruptions_Q.Rear rem Interruptions_Q.Max_Size + 1;
        Interruptions_Q.Processes(Interruptions_Q.Rear) := Excuse_Me;
         Interruptions_Q.Count := Interruptions_Q.Count + 1;
      end if;
   end Enqueue;
--------------------------------------------------------------------------
--removes process from queue
   procedure Dequeue (Interruptions_Q : in out Queue_Type) is
   begin
      if Is_Empty (Interruptions_Q) then
        raise UNDERFLOW;
      else
        Interruptions_Q.Front := Interruptions_Q.Front rem Interruptions_Q.Max_Size + 1;
        Interruptions_Q.Count := Interruptions_Q.Count - 1;
      end if;
   end Dequeue;
--------------------------------------------------------------------------
--finds the first process in the queue
   function Front_Of (Interruptions_Q : Queue_Type) return Interrupt_Type is
   begin
      if Is_Empty (Interruptions_Q) then
         raise UNDERFLOW;
      else
         return Interruptions_Q.Processes(Interruptions_Q.Front);
      end if;
   end Front_Of;
--------------------------------------------------------------------------
--finds the length of the queue
  function Length_Of (Interruptions_Q : Queue_Type) return Natural is
  begin
    return Interruptions_Q.Count;
  end Length_Of;
--------------------------------------------------------------------------
--copies the queue
  procedure Copy (Interruptions_Q    : in     Queue_Type;
                  Q_Interrupted : in out Queue_Type) is
  begin
    Q_Interrupted := Interruptions_Q;
  end Copy;
--------------------------------------------------------------------------
--tests equality in queue
  function Is_Equal (Left  : Queue_Type;
                     Right : Queue_Type) return Boolean is
    i : Positive;
  begin
    if Left.Count /= Right.Count then
      return false;
    else
      i := Left.Front;
      while i /= Left.Rear loop
        if Left.Processes(i) /= Right.Processes(i) then
          return false;
        end if;
        i := i + 1 mod Left.Max_Size;
      end loop;
      return Left.Processes(Left.Rear) = Right.Processes(Right.Rear);
    end if;
  end Is_Equal;
--------------------------------------------------------------------------
end Interrupt_ADT;
