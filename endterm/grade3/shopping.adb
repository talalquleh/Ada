with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Numerics.Float_Random;



procedure shopping is
	
    type String_Access is access String;
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
    cnt : Natural := 0;
    begin
        Ada.Numerics.Float_Random.Reset(G);
        delay Duration(Ada.Numerics.Float_Random.Random(G));
        open_now := true;
        while open_now loop
            delay 0.1;
            select
                accept go_in  do
                    visited := true;
                    cnt := cnt + 1;
                    delay 0.1;
                end go_in;
            or 
                accept close_shop do
                    open_now := false;
                    Printer.Print("Sports were visited by " & cnt'Image); 
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
    cnt : Natural := 0;
    begin
        Ada.Numerics.Float_Random.Reset(G);
        delay Duration(Ada.Numerics.Float_Random.Random(G));
        open_now := true;
        while open_now loop 
            delay 0.1;
            select
                accept go_in  do
                    visited := true;
                    cnt := cnt + 1;
                    delay 0.1;
                end go_in;
            or 
                accept close_shop do
                    open_now := false;
                    Printer.Print("Shoes were visited by " & cnt'Image); 
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
    cnt : Natural := 0;
    begin
        Ada.Numerics.Float_Random.Reset(G);
        delay Duration(Ada.Numerics.Float_Random.Random(G));
        open_now := true;
        while open_now loop
            delay 0.1;
            select
                accept go_in  do
                    visited := true;
                    cnt := cnt + 1;
                    delay 0.1;
                end go_in;
            or 
                accept close_shop do
                    open_now := false;
                    Printer.Print("Electornics were visited by " & cnt'Image); 
                end close_shop;
            end select;
        end loop;
    end Electronics;

    task type Custumer(name : String_Access);
    task body Custumer is
    begin
        delay 0.1; -- arriving
        select
            sport.go_in;
            Printer.Print(name.all & " goes in to sports shop!");
            
        or 
            delay 0.1;
            Printer.Print(name.all & " waited too long for Sport");
        end select;
        select
            shoes.go_in;
            Printer.Print( name.all & " goes in to Shoes shop!");
            
        or
            delay 0.1;
            Printer.Print(name.all & " waited too long for Shoes");
        end select;
        select
            Electronics.go_in;
            Printer.Print(name.all & " goes in to Electronics shop!");
        or
            delay 0.3;
            Printer.Print(name.all & " waited too long for Electornics");
        end select;

    
    end Custumer;
    a: Custumer(new String'("a"));
    b: Custumer(new String'("b"));
    c: Custumer(new String'("c"));
    d: Custumer(new String'("d"));
    e: Custumer(new String'("e"));
    f: Custumer(new String'("f"));
    h: Custumer(new String'("h"));
    i: Custumer(new String'("i"));
    ab: Custumer(new String'("ab"));
    abc: Custumer(new String'("abc"));
    abcd: Custumer(new String'("abcd"));
    abcde: Custumer(new String'("abcde"));
    abcdef: Custumer(new String'("abcdef"));
    acdc: Custumer(new String'("acdc"));
    ac: Custumer(new String'("ac"));

begin
    delay 3.0;
    Sport.close_shop;
    Shoes.close_shop;
    Electronics.close_shop;
end shopping;