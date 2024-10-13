package body Ready_Queue_adt is
--------------------------------------------------------------------------
--clear the queue
 procedure Clear (Ready_Queue : in out Queue_Type) is
   begin
      Ready_Queue.Count := 0;
      Ready_Queue.Front := 1;
      Ready_Queue.Rear  := Ready_Queue.Max_Size;
   end Clear;
--------------------------------------------------------------------------
--test to see that queue is empty
   function Is_Empty (Ready_Queue : in Queue_Type) return Boolean is
   begin
      return Ready_Queue.Count = 0;
   end Is_Empty;
   function Is_Full (Ready_Queue : in Queue_Type) return Boolean is
   begin
      return Ready_Queue.Count = Ready_Queue.Max_Size;
   end Is_Full;
--------------------------------------------------------------------------
--puts processes on the queue
  procedure Enqueue (The_Process  : in     Process_Type;
                     Ready_Queue : in out Queue_Type) is
   begin
      if Is_Full (Ready_Queue) then
        raise OVERFLOW;
      else
        Ready_Queue.Rear := Ready_Queue.Rear rem Ready_Queue.Max_Size + 1;
        Ready_Queue.Processes(Ready_Queue.Rear) := The_Process;
         Ready_Queue.Count := Ready_Queue.Count + 1;
      end if;
   end Enqueue;
--------------------------------------------------------------------------
--removes process from queue
   procedure Dequeue (Ready_Queue : in out Queue_Type) is
   begin
      if Is_Empty (Ready_Queue) then
        raise UNDERFLOW;
      else
        Ready_Queue.Front := Ready_Queue.Front rem Ready_Queue.Max_Size + 1;
        Ready_Queue.Count := Ready_Queue.Count - 1;
      end if;
   end Dequeue;
--------------------------------------------------------------------------
--finds the first process in the queue
   function Front_Of (Ready_Queue : Queue_Type) return Process_Type is
   begin
      if Is_Empty (Ready_Queue) then
         raise UNDERFLOW;
      else
         return Ready_Queue.Processes(Ready_Queue.Front);
      end if;
   end Front_Of;
--------------------------------------------------------------------------
--finds the length of the queue
  function Length_Of (Ready_Queue : Queue_Type) return Natural is
  begin
    return Ready_Queue.Count;
  end Length_Of;
--------------------------------------------------------------------------
--copies the queue
  procedure Copy (Ready_Queue    : in     Queue_Type;
                  To_Ready_Queue : in out Queue_Type) is
  begin
    To_Ready_Queue := Ready_Queue;
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
end Ready_Queue_ADT;
