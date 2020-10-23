procedure myFind(a: in TArray; b: out Boolean; i, j: out Index) is
    index1: Index := a'First;
    index2: Index;
    last: Index := a'Last;
begin
    b := False;
    while index1 < last loop
        index2 := Index'Succ(index1);
        while index2 <= last loop
            if a(index1) = a(index2) then
                b := True;
                i := index1;
                j := index2;
                return;
            end if;
            index2 := Index'Succ(index2);
        end loop;
        index1 := Index'Succ(index1);
    end loop;
end myFind;
