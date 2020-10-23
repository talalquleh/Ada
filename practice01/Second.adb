with Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Text_IO;

procedure Second is
    a: Integer;
    b: Integer;
    c: Integer;
begin
    Ada.Integer_Text_IO.Get( a );
    Ada.Integer_Text_IO.Get( b );
    Ada.Integer_Text_IO.Get( c );
    if a >= b and a >= c then
        Ada.Integer_Text_IO.Put(a);
    elsif b >= a and b >=c then
        Ada.Integer_Text_IO.Put(b);
    else
        Ada.Integer_Text_IO.Put(c);
    end if;
        

end Second;