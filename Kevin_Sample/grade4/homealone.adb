with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure homealone is

    package Random_Positive_Generator is new Ada.Numerics.Discrete_Random(Positive);
	use Random_Positive_Generator;
    G : Generator;

    protected Safe_Random is 
        function Generate return Duration;
    end Safe_Random;

    protected body Safe_Random is
        function Generate return Duration is
        
        begin
            Reset(G);
            return Duration(Float(Random(G) rem 5)/10.0);
        end Generate;
    end Safe_Random;

    task type Door(ID:Integer) is
	    entry Open;
	    entry Close;
        entry Set_trap;
    end Door;

    type Door_access is access Door;
    pointers:array(1..5) of door_access;

    task Burglar is 
        entry Hit;
    end Burglar;

    task type Trap;
    type Trap_Access is access Trap;
    
    task Kevin is
        entry Catch;
    end Kevin;

	protected Printer is	
		procedure Print( s: in STRING := "" );
	end Printer;
	protected body Printer is
        procedure Print( s: in STRING := "" ) is
		begin
			Put_Line(s);
		end Print;
	end Printer;

    protected House is
        procedure Init;
        procedure Get_Door(ad:out Door_access);
        procedure Get_Door(id: Natural; ad: out Door_access);
    end House;
    protected body House is

        procedure Init is
        begin
            for i in 1..5 loop
                pointers(i):=new Door(i);
            end loop;
        end Init;

        procedure Get_Door(ad:out door_access) is
            aa:Integer;

        begin
            Reset(G);
            aa:=(Random(G) mod 5 )+1;
            Printer.Print("Burglar is opening door number " & Integer'Image(aa));
            ad:=pointers(aa);
        end Get_Door;

        procedure Get_Door(id: Natural; ad: out Door_access) is
        begin
            ad := pointers(id);
        end Get_Door;
    end House;


    
    task body Door is
	    is_open : Boolean := false;
        VA : Trap_Access;
    begin
        loop
            select
                accept Set_Trap  do
                    VA:=new Trap;
                    Printer.Print("set a trap at the door: "&Integer'Image(ID));
                end Set_Trap;
                
            or
                when not is_open => accept Open; Printer.Print("Door opened"); is_open := true; VA := new Trap;
            or 
                when is_open => accept Close; Printer.Print("Door Closed"); is_open := false; 
            or
                terminate;
            end select;
        end loop;
    end Door;

    
    task body Burglar is
    random_door:Door_access;
    begin 
        delay 1.0;
        delay 3.5;
        Printer.Print("Its dark, fun time begins!");
        House.Get_Door(random_door);
        random_door.Open;
        Printer.Print("Burglar Opened the door");
        
            select
                accept Hit do
                    Printer.Print("Burglar was hit!");
                end Hit;
            or
                delay 3.0;
                Kevin.Catch;
                
             end select;		
        
        random_door.Close;
        Printer.Print("Burglar Closed the door");
    end Burglar;


    
	task body Trap is
    rand : Duration := Safe_Random.Generate;
	begin
        Printer.Print("Going to hit in"  & rand'Image & " seconds");
        select 
            Burglar.Hit;             
		or
			delay 0.01;
			Printer.Print("Waited too long for Hit");
		end select;
	end Trap;

    
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
    
    end Kevin;
	
begin  
    House.Init;
end homealone;