with Ada.Text_IO;
use Ada.Text_IO;

procedure homealone is

	protected Printer is	
		procedure Print( s: in STRING := "" );
	end Printer;
	protected body Printer is
        procedure Print( s: in STRING := "" ) is
		begin
			Put_Line(s);
		end Print;
	end Printer;

    task Door is
	    entry Open;
	    entry Close;
    end Door;
    task body Door is
	    is_open : Boolean := false;
    begin
        loop
            select
                when is_open => accept Close; Printer.Print("Door Closed"); is_open := false;
            or
                when not is_open => accept Open; Printer.Print("Door opened"); is_open := true;
            end select;
        end loop;
    end Door;

    task Burglar;
    task body Burglar is
    begin
        delay 1.0;
        Printer.Print("Its dark, fun time begins!");
        Door.Open;
        Printer.Print("Burglar Opened the door");
        delay 3.0;
        Door.Close;
        Printer.Print("Burglar Closed the door");
    end Burglar;

begin  
    null;
end homealone;