with Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Text_IO;

procedure Third is
    sum: Integer := 0;
    N: Integer;
begin
    Ada.Integer_Text_IO.Get( N );
    for I in 1..N loop
        sum := sum + I;
    end loop;
    Ada.Integer_Text_IO.Put( sum );

end Third;