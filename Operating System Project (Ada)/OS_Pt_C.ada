-- Kelsey Willett
-- Csc 312
--------------------------------------------------------------------------
With Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;use Ada.Integer_Text_IO;
with Ready_Queue_adt;use Ready_Queue_adt;
with Wait_Queue_adt; use Wait_Queue_adt;
with Interrupt_adt; use Interrupt_adt;
--with Memory;use Memory;
--------------------------------------------------------------------------
Procedure OS_Pt_C is
   process_list, reporting, waiting, interrupts, HemHem:File_Type;--i/o files--process_list is basically pcb
   tick_counter:integer;--tick counter for arrival times
   running_tick:integer:=0;--overall tick counter
   --------------------------------------------------------------------------
   --variables for the data:
   process_name:string(1..4);--process name with room for 4 characters, in this sample, 1 will be formatting
   process_Amt:integer;--amount of time for each process to run
   process_index:integer;--the index of the process in the list
   --------------------------------------------------------------------------
   type Interrupt_Type is record--interrupt
      Interrupt_Position_S: integer;
      Interrupt_Position_E: integer;
      Interr_Description:String(1..4);
      Old_Processor_State:character;
      New_Processor_State:character;
   end record;
   -------------------------------------------------------------------------
   interr_mem_position_start:integer;--interrupt
   interr_mem_position_end:integer;
   interr_code:String(1..4);
   interr_old_state:character;
   interr_new_state:character;
   ----------------------------------------------------------------------------
   The_Process : Ready_Queue_adt.Process_Type;--record of the process
   Wait_Process : Wait_Queue_adt.Process_Type;
   Excuse_Me:Interrupt_adt.Interrupt_Type;
   -----------------------------------------------------------------------------
   Ready_Queue : Ready_Queue_adt.Queue_Type(1);--queue of processes
   Wait_Queue: Wait_Queue_adt.Queue_type(25);
   Interruptions_Q:Interrupt_adt.Queue_Type(25);
   --------------------------------------------------------------------------
Begin
   tick_counter := 0;
   --------------------------------------------------------------------------
   Open(File => process_list, Mode => In_File, Name => "C:\Users\Kelsey\Desktop\os\project files\code\process_list_2.txt");--open datafile
   Open(File => interrupts, Mode => In_File, Name => "C:\Users\Kelsey\Desktop\os\project files\code\interrupts.txt");--open datafile
   Create(reporting, Mode => Out_File, Name => "C:\Users\Kelsey\Desktop\os\project files\code\reporting.txt");--create out file
   Create(waiting, Mode=> Out_file, Name =>  "C:\Users\Kelsey\Desktop\os\project files\code\waiting.txt");
   Create(HemHem, Mode => Out_File, Name => "C:\Users\Kelsey\Desktop\os\project files\code\hemhem.txt");--create out file
   ----------------------------------------------------------------------------------
   while  Not Ada.Text_IO.End_Of_File(File => process_list) LOOP--while there is data in the input file
      for i in 1..1000 loop--assuming memory size will allow for 1000 processing ticks
         if running_tick < i then
            ------------------------------------
            get(interrupts, interr_mem_position_start);--gets interrupt info
            get(interrupts, interr_mem_position_end);
            get(interrupts, interr_code);
            get(interrupts, interr_old_state);
            get(interrupts, interr_new_state);
            ----------------------------------------
            get(process_list, process_name);--gets the process name from datafile
            get(process_list, process_Amt);
            get(process_list, process_Index);
            --------------------------------------------
            The_Process.process_Name := process_name;--stores name in the record
            The_Process.process_amount:=process_Amt;
            The_Process.process_index:=process_Index;
            --------------------------------------------------------------------------
            Wait_Process.process_Name := process_name;--stores name in the record
            Wait_Process.process_amount:=process_Amt;
            Wait_Process.process_index:=process_Index;
            --------------------------------------------------------------------------
            Wait_Process.process_Name := process_name;--stores name in the record
            Wait_Process.process_amount:=process_Amt;
            Wait_Process.process_index:=process_Index;
            --------------------------------------------------
            Excuse_Me.Interrupt_Position_S:=interr_mem_position_start;--interrupt
            Excuse_Me.Interrupt_Position_E:=   interr_mem_position_end;
            Excuse_Me.Interr_Description:=   interr_code;
            Excuse_Me.Old_Processor_State:=   interr_old_state;
            Excuse_Me.New_Processor_State:=   interr_new_state;
            -----------------------------------------------------------------------
            running_tick:=tick_counter+process_amt;--adds a total tick
            ------------------------------------------------------------------
            Enqueue(Wait_Process, Wait_Queue);
            Enqueue(The_Process, Ready_Queue);--puts the process on the  queue
            Enqueue(Excuse_Me, Interruptions_Q);
            -----------------------------------
            put(reporting, "Process " );--output to reporting file
            put(reporting, process_name);
            put(reporting, " was processed at time ");
            put(reporting, tick_counter);
            put(reporting, " and will run for ");
            put(reporting, process_Amt);
            put(reporting, " ticks, ");
            put(reporting, " finishing at time ");
            put(reporting, running_tick);
            put(reporting, " Index: ");
            put(reporting, process_Index);
            ------------------------------
            tick_counter:=tick_counter + 1;
            --------------------------------------------------------------------------
            if Ready_Queue_adt.Is_Full(Ready_Queue) Then--puts into the wait queue if there is no room in ready
               put(waiting, "Processes waiting: ");
               put(waiting, Wait_Queue.Max_Size);
               Ada.Text_IO.New_Line (File => waiting);
               for i in 1..Wait_Queue.Max_Size loop
                  get(process_list, process_name);--gets the process name from datafile
                  get(process_list, process_Amt);
                  get(process_list, process_Index);
                  ------------------------
                  put(waiting, "Process " );--output to waiting file
                  put(waiting, process_name);
                  put(waiting, " arrived at time ");
                  put(waiting, tick_counter);
                  put(waiting, ", will enter the Ready Queue at time ");
                  put(waiting, running_tick);
                  put(waiting, ", and will run for ");
                  put(waiting, process_Amt);
                  put(waiting, " ticks, finishing at time ");
                  ---------------- tick calculations assume fifo scheduling
                  running_tick:=running_tick+process_Amt;
                  put(waiting, running_tick);
                  Ada.Text_IO.New_Line (File => waiting);
                  tick_counter:=tick_counter + 1;
               end loop;
            end if;
            ----------------------------------------
            for i in 1..Interruptions_Q.Max_Size loop--handles interruptions from interruption input file
               --------------------------
               get(interrupts, interr_mem_position_start);
               get(interrupts, interr_mem_position_end);
               get(interrupts, interr_code);
               get(interrupts, interr_old_state);
               get(interrupts, interr_new_state);
               ---------------------------------------
               if interr_code = "SVCC" then
                  put(HemHem,"Interrupt SVCC Occured at ");
                  put(HemHem, interr_mem_position_start);
                  put(HemHem, " to ");
                  put(HemHem, interr_mem_position_end);
                  Ada.Text_IO.New_Line (File => HemHem);
                  put(HemHem, "State has been changed from ");
                  put(HemHem, interr_old_state);
                  put(HemHem, " to ");
                  put(HemHem, interr_new_state);
                  Ada.Text_IO.New_Line (File => HemHem);
                  put(HemHem, "Supervisor Call needs proper credentials.");
                  Ada.Text_IO.New_Line (File => HemHem);

               elsif interr_code = "PRGC" then
                  put(HemHem,"Interrupt PRGC Occured at ");
                  put(HemHem, interr_mem_position_start);
                  put(HemHem, " to ");
                  put(HemHem, interr_mem_position_end);
                  Ada.Text_IO.New_Line (File => HemHem);
                  put(HemHem, "State has been changed from ");
                  put(HemHem, interr_old_state);
                  put(HemHem, " to ");
                  put(HemHem, interr_new_state);
                  Ada.Text_IO.New_Line (File => HemHem);
                  put(HemHem, "An unexpected error has occured. Please contact Sys. Admin.");
                  Ada.Text_IO.New_Line (File => HemHem);

               elsif interr_code = "IOCD" then
                  put(HemHem,"Interrupt IOCD Occured at ");
                  put(HemHem, interr_mem_position_start);
                  put(HemHem, " to ");
                  put(HemHem, interr_mem_position_end);
                  Ada.Text_IO.New_Line (File => HemHem);
                  put(HemHem, "State has been changed from ");
                  put(HemHem, interr_old_state);
                  put(HemHem, " to ");
                  put(HemHem, interr_new_state);
                  Ada.Text_IO.New_Line (File => HemHem);
                  put(HemHem, "I/O");
                  ------------------------------------------ioio
                  if process_Index>interr_mem_position_start Then
                     Wait_Process.process_Name := process_name;
                     Wait_Process.process_amount:=process_Amt;
                     Wait_Process.process_index:=process_Index+2;
                     Enqueue(Wait_Process, Wait_Queue);
                     Ada.Text_IO.New_Line (File => HemHem);
                  end if;

               elsif interr_code = "EXCD" then
                  put(HemHem,"Interrupt EXCD Occured at ");
                  put(HemHem, interr_mem_position_start);
                  put(HemHem, " to ");
                  put(HemHem, interr_mem_position_end);
                  Ada.Text_IO.New_Line (File => HemHem);
                  put(HemHem, "State has been changed from ");
                  put(HemHem, interr_old_state);
                  put(HemHem, " to ");
                  put(HemHem, interr_new_state);
                  Ada.Text_IO.New_Line (File => HemHem);
                  put(HemHem, "Incoming interruption.");
                  Ada.Text_IO.New_Line (File => HemHem);

               elsif interr_code = "MCHC" then
                  put(HemHem,"Interrupt MCHC Occured at ");
                  put(HemHem, interr_mem_position_start);
                  put(HemHem, " to ");
                  put(HemHem, interr_mem_position_end);
                  Ada.Text_IO.New_Line (File => HemHem);
                  put(HemHem, "State has been changed from ");
                  put(HemHem, interr_old_state);
                  put(HemHem, " to ");
                  put(HemHem, interr_new_state);
                  Ada.Text_IO.New_Line (File => HemHem);
                  put(HemHem, "FATAL ERROR!");
                  Ada.Text_IO.New_Line (File => HemHem);
                  exit;
               end if;
            end loop;
            tick_counter:=tick_counter + 1;
         else
            put(reporting,"Out of Memory.");
            put(waiting,"Out of Memory.");
            put(HemHem,"Out of Memory.");
            exit;
         End If;
      end loop;
   end loop;
   ---------------------------------------------------------------------
   Close(File => process_list);
   Close(File => reporting);
   Close(File => waiting);
   close(file=>interrupts);
   close(file=>HemHem);
end OS_Pt_C;
