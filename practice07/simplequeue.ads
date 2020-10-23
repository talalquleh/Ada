generic 
      type Elem is private;

package SimpleQueue is
   

   type Queue(Max: Positive) is limited private;
   
   Empty_Queue, Full_Queue : Exception;

   procedure Push(Q: in out Queue; E: in Elem);
   function Pop(Q: in out Queue) return Elem;
   function IsEmpty(Q: Queue) return Boolean;
   function IsFull(Q: Queue) return Boolean;
   function Size(Q: Queue) return Natural;

   private
      type TArray is array(Integer range <>) of Elem;
      
      type Queue(Max: Positive) is record
         A: TArray(1..Max);
         Size: Natural := 0;
      end record;
end SimpleQueue;
