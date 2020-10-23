with Ada.Text_IO,Ada.Numerics.Float_Random,Ada.Numerics.Discrete_Random;
use Ada.Text_IO;
procedure Mark5 is

   task type Trap ;

   type Trap_access is access Trap;
   tr:Trap_access;

   task Burglar is
      entry Hit;
   end Burglar;

    task type Door(ID:Integer) is
      entry Open;
      entry Close;
      entry Set_Trap;
    end Door;

   type Door_access is access Door;
   pointers:array(1..5) of door_access;

   protected House is
      procedure Init;
      procedure Get_Door(ad:out Door_access);
      procedure Get_Door(Door_ID:in Integer;ad:out Door_Access);
   end House;

   protected Printer is
      procedure Print(s:in String:="");
   end Printer;

   package ran_door is new Ada.Numerics.Discrete_Random(Integer);
   use ran_door;
   GG:ran_door.Generator;

   task Kevin is
      entry Catch;
   end Kevin;


  task body Kevin is
      the_door:Door_access;
      caught:Boolean:=False;
   begin
      delay 1.0;
      for i in 1..5 loop


            House.Get_Door(i,the_door);
            the_door.Set_Trap;

         select
            accept Catch  do
               caught:=True;
              Printer.Print("god, I was caught by a burglar.");
           end Catch;
         or
           delay 1.0;
            end select;

         if caught then exit;
            end if;

      end loop;

      select
         accept Catch  do
             Printer.Print("god, I was caught by a burglar.");
         end Catch;
      or
         terminate;
      end select;

   end Kevin;
--


--
   protected  body House is

      procedure Init is
      begin
         for i in 1..5 loop
            pointers(i):=new Door(i);
         end loop;

      end Init;

      procedure Get_Door(ad:out door_access) is
         aa:Integer;
      begin
         aa:=(ran_door.Random(GG) mod 5 )+1;
         Put_Line(Integer'Image(aa));
         ad:=pointers(aa);

      end Get_Door;

      procedure Get_Door(Door_ID:in Integer;ad:out Door_Access)is
      begin
         ad:=pointers(Door_ID);
      end Get_Door;

   end House;




   protected Safe_Random is
      procedure Generate;
      function getRandom return Float;
   private
      Duration:Float;
      F:Float;
      G:Ada.Numerics.Float_Random.Generator;
   end Safe_Random;

   protected  body Safe_Random is
      procedure Generate is
      begin
         Ada.Numerics.Float_Random.Reset(G);
         F:=Ada.Numerics.Float_Random.Random(G);
         Duration:=4.0*F;
      end Generate;

      function getRandom return Float is begin
         return Duration;
      end;

   end Safe_Random;




   protected body Printer is
      procedure Print(s:in String:="") is
      begin
         Put_Line(s);
      end;
   end Printer;



   task body Door is
      open_now:Boolean:=False;
   begin
      loop
         select

            accept Set_Trap  do
              tr:=new Trap;
              Printer.Print("set a trap at the door: "&Integer'Image(ID));
            end Set_Trap;

         or

            when not open_now => accept Open  do
                  open_now:=True;
                  Printer.Print("door is open now");
            end Open;
         or
            when open_now => accept Close  do
                  open_now:=False;
                  Printer.Print("door is closed now");
               end Close;
         or
              terminate;
         end select;
      end loop;
   end Door;



   task body Burglar is
      random_door:Door_access;
   begin

      --delay 1.0;
      delay 3.5;
      House.Get_Door(random_door);
      random_door.Open;
      --Door.Open;
      --tr:=new Trap;
      select
         accept Hit  do
           Printer.Print("Oh! Burglar got hitted by a trap !");
         end Hit;
      or
         delay 3.0;
         --Kevin.Catch;
      end select;
      random_door.Close;
   end Burglar;





   task body Trap is
      F:Float;
   begin
      F:= Safe_Random.getRandom;
      Printer.Print(Float'Image(F));
      delay Duration(F);
      select
         Burglar.Hit;
          Printer.Print(" hit burglar");
      or
         delay 0.01;
         --Kevin.Catch;
      end select;

   end Trap;



begin
   ran_door.Reset(GG);
   House.Init;
end Mark5;


function Fact ( N: Natural ) return Positive is
begin
    return Fact(N-1) * N;
exception
    when Constraint_Error => return 1;
end Fact;