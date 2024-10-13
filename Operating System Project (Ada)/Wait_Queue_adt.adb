package body Wait_Queue_adt is
--------------------------------------------------------------------------
--clear the queue
 procedure Clear (Wait_Queue : in out Queue_Type) is
   begin
      Wait_Queue.Count := 0;
      Wait_Queue.Front := 1;
      Wait_Queue.Rear  := Wait_Queue.Max_Size;
   end Clear;
--------------------------------------------------------------------------
--test to see that queue is empty
   function Is_Empty (Wait_Queue : in Queue_Type) return Boolean is
   begin
      return Wait_Queue.Count = 0;
   end Is_Empty;
   function Is_Full (Wait_Queue : in Queue_Type) return Boolean is
   begin
      return Wait_Queue.Count = Wait_Queue.Max_Size;
   end Is_Full;
--------------------------------------------------------------------------
--puts processes on the queue
  procedure Enqueue (The_Process  : in     Process_Type;
                     Wait_Queue : in out Queue_Type) is
   begin
      if Is_Full (Wait_Queue) then
        raise OVERFLOW;
      else
        Wait_Queue.Rear := Wait_Queue.Rear rem Wait_Queue.Max_Size + 1;
        Wait_Queue.Processes(Wait_Queue.Rear) := The_Process;
         Wait_Queue.Count := Wait_Queue.Count + 1;
      end if;
   end Enqueue;
--------------------------------------------------------------------------
--removes process from queue
   procedure Dequeue (Wait_Queue : in out Queue_Type) is
   begin
      if Is_Empty (Wait_Queue) then
        raise UNDERFLOW;
      else
        Wait_Queue.Front := Wait_Queue.Front rem Wait_Queue.Max_Size + 1;
        Wait_Queue.Count := Wait_Queue.Count - 1;
      end if;
   end Dequeue;
--------------------------------------------------------------------------
--finds the first process in the queue
   function Front_Of (Wait_Queue : Queue_Type) return Process_Type is
   begin
      if Is_Empty (Wait_Queue) then
         raise UNDERFLOW;
      else
         return Wait_Queue.Processes(Wait_Queue.Front);
      end if;
   end Front_Of;
--------------------------------------------------------------------------
--finds the length of the queue
  function Length_Of (Wait_Queue : Queue_Type) return Natural is
  begin
    return Wait_Queue.Count;
  end Length_Of;
--------------------------------------------------------------------------
--copies the queue
  procedure Copy (Wait_Queue    : in     Queue_Type;
                  To_Wait_Queue : in out Queue_Type) is
  begin
    To_Wait_Queue := Wait_Queue;
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
end Wait_Queue_ADT;
