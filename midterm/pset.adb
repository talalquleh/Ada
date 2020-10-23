with Text_IO;
use Text_IO;

package body pset is
   
   
   function Make_Set (L: TArray) return Set is
      res : Set;
      s: Natural := 0;
   begin
      for i in L'Range loop
         if res.Data(L(i)) = False then
            res.Data(L(i)) := True;
            s := s + 1;
         end if;
      end loop;
      res.Size := s;
      return res;
      
   end Make_Set;
   
   
   function Make_Set (E: Elem) return Set is
      res: Set;
   begin
      res.Data(E) := True;
      res.Size := 1;
      return res;
   end Make_Set;
   
   
   function Decompose (S: Set) return TArray is
      res : TArray(1..S.Size);
      j : Natural := 1;
   begin
      for i in Elem'First..Elem'Last loop
         if S.Data(i) = True then
            res(j) := i;
            j := j + 1;
         end if;
      end loop;
      return res;
   end Decompose;
   
   function "+" (S, T: Set) return Set is
      res: Set;
      resSize: Natural := 0; 
   begin
   
      for i in Elem'First..Elem'Last loop
         if (S.Data(i) or T.Data(i)) and then res.Data(i) = False then
            res.Data(i) := True;
            resSize := resSize + 1;
         end if;
      end loop;
      res.Size := resSize;
      return res;
   end "+";
   
   function Size (S: Set) return Natural is
   begin
      return S.Size;
   end Size;
   
   function "*" (S, T: Set) return Set is
      res: Set;
      resSize: Natural := 0;
   begin
      for i in Elem'First..Elem'Last loop
         if S.Data(i) and then T.Data(i) then
            res.Data(i) := True;
              resSize := resSize + 1;
         end if;
      end loop;
      res.Size := resSize;
      return res;
   end "*";
   
   function "<" (E: Elem; S: Set) return Boolean is
   begin
      return S.Data(E);
   end "<";
   
     
   function Contains (S, T: Set) return Boolean is -- T contains S
   begin
      for i in Elem'First..Elem'Last loop
         if S.Data(i) and then not T.Data(i) then
            return False;
         end if;
      end loop;
      return True;
      end Contains;
  
   procedure print_Set(S: in Set) is
      ar: TArray := Decompose(S);
   begin
      for i in ar'Range loop
         Put_Line(Elem'Image(ar(i)));
      end loop;
   end print_Set;
     
      
   

end pset;
