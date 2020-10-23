with Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Text_IO;

procedure Fourth is
    x: Integer;
begin
    Ada.Integer_Text_IO.Get( x );
    if x > 0 then
        Put("1");
    elsif x = 0 then
        Put("0");
    else
        Put("-1");
    end if;

end Fourth;