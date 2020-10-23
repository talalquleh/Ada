with Ada.Integer_Text_IO;
with Ada.Text_IO;

package body SimpleBag is
   procedure insertOne(B: in out Bag; E: in Elem) is
   begin
      B.Arr(E) := B.Arr(E) + 1;
      B.Size := B.Size + 1;
   end;
   procedure insertMultiple(B: in out Bag; E: in Elem; N: in Natural) is
   begin
      B.Arr(E) := B.Arr(E) + N;
      B.Size := B.Size + N;
   end;
   procedure extractOne(B: in out Bag; E: in Elem) is
   begin
      B.Arr(E) := B.Arr(E) - 1;
      B.Size := B.Size - 1;
   end;
   
   procedure extractMultiple(B: in out Bag; E: in Elem; N: in Natural) is
   begin
      B.Arr(E) := B.Arr(E) - N;
      B.Size := B.Size - N;
   end;
   
   function isEmpty(B: Bag) return Boolean is
   begin
      return B.Size = 0;
   end;
   
   procedure print(B: Bag) is
   begin
      for I in 1..100 loop
         Ada.Integer_Text_IO.Put(I);
         Ada.Text_IO.Put(":");
         Ada.Integer_Text_IO.Put(B.Arr(I));
         Ada.Text_IO.New_Line;
      end loop;
   end;


  

end SimpleBag;