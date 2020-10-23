procedure myReverse(a: in out TArray) is
   first: Index := a'First;
   last: Index := a'Last;
begin
   while first < last loop
      swap(a(first), a(last));
      first := Index'Succ(first);
      last := Index'Pred(last);
   end loop;
end myReverse;
