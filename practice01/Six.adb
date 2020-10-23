with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Six is
    Answer: Float := 1.0;
begin
    
    for I in 1..2000 loop
        if I mod 2 = 0 then
            Answer := Answer * (Float(I)/Float(I+1));
        else
            Answer := Answer * (Float(I+1)/Float(I));
        end if;
    end loop;
    
    
    Ada.Float_Text_IO.Put(Answer*2.0);
end Six;