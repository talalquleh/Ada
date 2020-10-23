with Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Text_IO;

procedure Fifth is
    Ans: Integer := 1;
    N, K: Integer;
begin
    Ada.Integer_Text_IO.Get(N);
    Ada.Integer_Text_IO.Get(K);
    for I in 1..K loop
        Ans := Ans * (N-I+1)/I;
    end loop;
    Ada.Integer_Text_IO.Put( Ans );
end Fifth;



