with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body SimpleQueue is

   procedure Push(Q: in out Queue; E: in Elem) is
   begin
      if IsFull(Q) then
         raise Full_Queue;
      else
         Q.Size := Q.Size + 1;
         Q.A(Q.Size) := E;
      end if;
   end;


   function Pop(Q: in out Queue) return Elem is
   E: Elem := Q.A(1);
   begin
      for I in 2..Q.Size loop
         Q.A(Integer'Pred(I)) := Q.A(I);
      end loop;
      Q.Size := Q.Size - 1;
      return E;
   exception
      when Constraint_Error => raise Empty_Queue;
   end;



   function IsEmpty(Q: Queue) return Boolean is
   begin
      return Size(Q) = 0;
   end;
   function IsFull(Q: Queue) return Boolean is
   begin
      return Size(Q) = Q.A'Length;
   end;
   function Size(Q: Queue) return Natural is
   begin
      return Q.Size;
   end;
end SimpleQueue;
