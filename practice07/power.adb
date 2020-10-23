function power (x:Integer; N: Natural) return Integer is
begin
   return x * power(x, N-1);
exception
   when Constraint_Error => return 1;
      
end power;
