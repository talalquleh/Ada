function Most_freq2(a: TArray) return Elem is
    maxElem: Elem;
    maxCnt: Natural := 0;

    type TTArray is array(Index range <>) of Natural;
    Multiplicity: TTArray(a'Range) := (others => 0);

    function countBackward(curr: Index) return Natural is
        x: Elem := a(curr);
    begin
        for i in reverse a'First..Index'Pred(curr) loop
            if a(i) = x then
                return Multiplicity(i);
            end if;
        end loop;
        return 0;
    end countBackward;
begin
    for i in a'First..a'Last loop
        Multiplicity(i) := countBackward(i) + 1;
    end loop;

    for i in a'First..a'Last loop
        if maxCnt < Multiplicity(i) then
            maxElem := a(i);
            maxCnt := Multiplicity(i);
        end if;
    end loop;

    return maxElem;
end Most_freq2;