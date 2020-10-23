package body Bag is
    procedure Add(B: in out Bag; e: Elem) is
        isThere: Boolean := False;
    begin
        for i in 1..B.Pointer loop
            if e = B.Data(i).Element then
                B.Data(i).Number := B.Data(i).Number + 1;
                isThere := True;
            end if;
        end loop;
        if not isThere and then B.Pointer < B.Data'Length then
            B.Pointer := B.Pointer + 1;
            B.Data(B.Pointer).Element := e;
            B.Data(B.Pointer).Number := 1;
        end if;
    end Add;
    procedure Remove(B: in out Bag; e: Elem) is
    begin
        for i in 1..B.Pointer loop
            if e = B.Data(i).Element then
                B.Data(i).Number := B.Data(i).Number - 1;
                if (B.Data(i).Number = 0) then
                    B.Data(i) := B.Data(B.Pointer);
                    B.Pointer := B.Pointer - 1;
                end if;
            end if;
        end loop;
    end Remove;

    function Multiplicity(B: in Bag; e: Elem) return Natural is
    begin
        for i in 1..B.Pointer loop
            if e = B.Data(i).Element then
                return B.Data(i).Number;
            end if;
        end loop;
        return 0;
    end Multiplicity;

    procedure For_Each(B: in Bag) is
    begin
        for i in 1..B.Pointer loop
            Process_Element(B.Data(i).Element);
        end loop;
    end For_Each;
end Bag;