with Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Text_IO;

procedure First is
    a: Integer;
    b: Integer;
begin
    Ada.Integer_Text_IO.Get( a );
    Ada.Integer_Text_IO.Get( b );
    if a > b then
        Ada.Integer_Text_IO.Put( a );
    else
        Ada.Integer_Text_IO.Put( b );
   end if;
end First;
