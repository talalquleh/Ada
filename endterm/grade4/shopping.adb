with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Numerics.Float_Random;
with Ada.Numerics.Discrete_Random;



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

    task type Sport is
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

    task type Shoes is
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

    task type Electronics is 
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


    type Shoes_access is access Shoes;
    shoes_shops:array(1..2) of Shoes_access;

    type Sport_access is access Sport;
    Sport_shops:array(1..2) of Sport_access;

    type Electronics_access is access Electronics;
    Electronics_shops:array(1..2) of Electronics_access;



    package Random_Positive_Generator is new Ada.Numerics.Discrete_Random(Positive);
	use Random_Positive_Generator;
    GG: Generator;

    task type Custumer(name : String_Access);
    task body Custumer is
    rand1 : Positive;
    rand2 : Positive;
    rand3 : Positive;
    begin
        Reset(GG);
        rand1 := (random(GG) rem 2) + 1;
        Reset(GG);
        rand2 := (random(GG) rem 2) + 1;
        Reset(GG);
        rand3 := (random(GG) rem 2) + 1;

        delay 0.9; -- arriving
        select
            sport_shops(rand1).go_in;
            Printer.Print(name.all & " goes in to sports shop number " & rand1'Image);
        or 
            delay 0.0;
            Printer.Print(name.all & " goes in to next shop");
        end select;

        select    
            shoes_shops(rand2).go_in;
            Printer.Print(name.all & " goes in to shoes shop number " & rand2'Image);
        or 
            delay 0.0;
            Printer.Print(name.all & " goes in to next shop");
        end select;
        select
            electronics_shops(rand3).go_in;
            Printer.Print(name.all & " goes in to shoes shop number " & rand3'Image);
        or 
            delay 0.0;
            Printer.Print(name.all & " goes home");
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
    for i in 1..2 loop
        shoes_shops(i) := new Shoes;
        delay 0.2;
    end loop;
    for i in 1..2 loop
        electronics_shops(i) := new Electronics;
        delay 0.2;
    end loop;
    for i in 1..2 loop
        Sport_shops(i) := new Sport;
        delay 0.2;
    end loop;
    delay 3.0;
    for i in 1..2 loop
        shoes_shops(i).close_shop;
        electronics_shops(i).close_shop;
        Sport_shops(i).close_shop;
    end loop;

end shopping;