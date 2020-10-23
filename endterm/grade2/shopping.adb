with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Numerics.Float_Random;



procedure shopping is
	

    G:Ada.Numerics.Float_Random.Generator;

    protected Printer is	
		procedure Print( s: in STRING := "" );
	end Printer;
	protected body Printer is
        procedure Print( s: in STRING := "" ) is
		begin
			Put_Line(s);
		end Print;
	end Printer;

    task Sport is
        entry go_in;
        entry close_shop;
    end Sport;
    task body Sport is
    open_now : Boolean := false;
    visited : Boolean := false;
    begin
        Ada.Numerics.Float_Random.Reset(G);
        delay Duration(Ada.Numerics.Float_Random.Random(G));
        open_now := true;
        while not visited and open_now loop
            delay 0.1;
            select
                accept go_in  do
                    visited := true;
                    delay 0.1;
                end go_in;
            or 
                accept close_shop do
                    open_now := false;
                end close_shop;
            end select;
        end loop;
    end Sport;

    task Shoes is
        entry go_in;
        entry close_shop;
    end Shoes;
    task body Shoes is
    open_now : Boolean := false;
    visited : Boolean := false;
    
    begin
        Ada.Numerics.Float_Random.Reset(G);
        delay Duration(Ada.Numerics.Float_Random.Random(G));
        open_now := true;
        while not visited and open_now loop 
            delay 0.1;
            select
                accept go_in  do
                    visited := true;
                    delay 0.1;
                end go_in;
            or 
                accept close_shop do
                    open_now := false;
                end close_shop;
            end select;
        end loop;
    end Shoes;

    task Electronics is 
        entry go_in;
        entry close_shop;
    end Electronics;
    task body Electronics is
    open_now : Boolean := false;
    visited : Boolean := false;
    open_time : Float := Ada.Numerics.Float_Random.Random(G);
    begin
        Ada.Numerics.Float_Random.Reset(G);
        delay Duration(Ada.Numerics.Float_Random.Random(G));
        open_now := true;
        while not visited and open_now loop
            delay 0.1;
            select
                accept go_in  do
                    visited := true;
                    delay 0.1;
                end go_in;
            or 
                accept close_shop do
                    open_now := false;
                end close_shop;
            end select;
        end loop;
    end Electronics;

    task John;
    task body John is
    begin
        delay 0.1; -- arriving
        select
            sport.go_in;
            Printer.Print("John goes in to sports shop!");
            
        or 
            delay 0.1;
            Printer.Print("John waited too long for Sport");
        end select;
        select
            shoes.go_in;
            Printer.Print("John goes in to Shoes shop!");
            
        or
            delay 0.1;
            Printer.Print("John waited too long for Shoes");
        end select;
        select
            Electronics.go_in;
            Printer.Print("John goes in to Electronics shop!");
        or
            delay 0.3;
            Printer.Print("John waited too long for Electornics");
        end select;
    Sport.close_shop;
    Shoes.close_shop;
    Electronics.close_shop;
    end John;

begin
    null;
end shopping;