with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with simplequeue;
with power;
procedure Main is
   package myQueue is new SimpleQueue(Integer);
   use myQueue;
   Q: Queue(100);


   -- Array sum
   type TArray is array(Integer range <>) of Integer;
   a: TArray(1..5):=(1, 2, 3, 4, 5);
   b: TArray(1..0);
   Empty_Array: Exception;
   function sum(a: TArray) return Integer is
   res: Integer := 0;
   begin
      for i in Integer'Succ(a'First)..a'Last loop
         res := res + a(i);
      end loop;
      return res;

   exception
      when Constraint_Error => return 0;
   end sum;




begin
   declare
   begin
      Push(Q,10);
      Put(Size(Q));
      Put(Pop(Q));
      New_Line;
      Put(Pop(Q));
   exception
      when Empty_Queue => Put_Line("Queue is empty!");
   end;

   Put(sum(b));

   New_Line;
   Put(power(2,3));

end Main;
