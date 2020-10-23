function has_repetition(a: TArray) return Boolean is
begin
    for i in a'First..Index'Pred(a'Last) loop
        if a(i) = a(Index'Succ(i)) then
            return True;
        end if;
    end loop;
    return False;
end has_repetition;