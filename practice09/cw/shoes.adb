with Ada.Text_IO; use Ada.Text_IO;

procedure Shoes is

    task Sand is
        entry Left;
        entry Right;
    end Sand;

    task body Sand is
    flag: Boolean := False;
    begin
        for I in 1..10 loop
            if flag then
                accept Left;
                flag := False;
            else
                accept Right;
                flag := true;
            end if;
        end loop;
    end Sand;

    task LeftShoe;
    task body LeftShoe is
    begin
        loop
            Sand.Left;
            Put_Line("Left Shoe");
            delay 0.5;
        end loop;
    end LeftShoe;

    task RightShoe;
    task body RightShoe is
    begin
        loop
            Sand.Right;
            Put_Line("Right Shoe");
            delay 0.5;
        end loop;
    end RightShoe;

begin
    null;
end Shoes;
