package body SimpleQueue is

   procedure Push(Q: in out Queue; E: in Elem) is
   begin
      if Q.Size < Q.A'Length then
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