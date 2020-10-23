with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure homealone is

    package Random_Positive_Generator is new Ada.Numerics.Discrete_Random(Positive);
	use Random_Positive_Generator;

    protected Safe_Random is 
        function Generate return Duration;
    end Safe_Random;

    protected body Safe_Random is
        function Generate return Duration is
        G : Generator;
        begin
            Reset(G);
            return Duration(Float(Random(G) rem 5)/10.0);
        end Generate;
    end Safe_Random;

    task Door is
	    entry Open;
	    entry Close;
    end Door;

    task Burglar is 
        entry Hit;
    end Burglar;

    task type Trap;
    type Trap_Access is access Trap;


	protected Printer is	
		procedure Print( s: in STRING := "" );
	end Printer;
	protected body Printer is
        procedure Print( s: in STRING := "" ) is
		begin
			Put_Line(s);
		end Print;
	end Printer;



    
    task body Door is
	    is_open : Boolean := false;
        VA : Trap_Access;
    begin
        loop
            select
                when is_open => accept Close; Printer.Print("Door Closed"); is_open := false; 
            or
                when not is_open => accept Open; Printer.Print("Door opened"); is_open := true; VA := new Trap;
            or 
                terminate;
            end select;
        end loop;
    end Door;

    
    task body Burglar is
    begin 
        delay 1.0;
        Printer.Print("Its dark, fun time begins!");
        Door.Open;
        Printer.Print("Burglar Opened the door");
        loop
            select
                accept Hit do
                    Printer.Print("Burglar was hit!");
                end Hit;
            or
                delay 3.0;
                exit;
             end select;		
        end loop;
        Door.Close;
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
	
begin  
    null;
end homealone;