with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Seven is
    a: Positive;
begin
    Ada.Integer_Text_IO.Get(a);
    if a mod 2 = 0 then
        Ada.Text_IO.Put("Even");
    else
        Ada.Text_IO.Put("Odd");
    end if;
end Seven;