function Most_freq(a: TArray) return Elem is
    r: Elem := a(a'First);

    function Multiplicity(x: Elem) return Natural is
        cnt: Natural := 0;
    begin
        for i in a'First..a'Last loop
            if a(i) = x then
                cnt := cnt + 1;
            end if;
        end loop;
        return cnt;
    end Multiplicity;
  
    begin
        for i in Index'Succ(a'First)..a'Last loop
            if Multiplicity(a(i)) > Multiplicity(r) then
                r := a(i);
            end if;
        end loop;
        return r;
end Most_freq;

