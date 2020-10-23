with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure eight is
    e: Float := 1.0;
    j: Float := 1.0;
    x: Float := 1.0;
begin
    for I in 1..100 loop
        j := j * x;
        x := x + 1.0;
        e := e + 1.0 / j;
    end loop;
    Ada.Float_Text_IO.Put(e);
end eight;
