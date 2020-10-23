package body Math is

    function gcd ( A, B : Positive ) return Positive is
         X: Positive := A;
         Y: Positive := B;
    begin
        while X /= Y loop
             if X > Y then
                X := X - Y;
            else
                Y := Y - X;
            end if;
        end loop;
        return X;
    end gcd;

    function factorial( N: Natural ) return Positive is
        Fakt : Positive := 1;
    begin
        for I in 1..N loop
            Fakt := Fakt * I;
        end loop;
        return Fakt;
    end factorial;
   
    function digitSum(N: Positive) return Positive is
        cp: Natural := N;
        sum: Natural := 0;
    begin
        while cp > 0 loop
            sum := sum + cp mod 10;
            cp := cp / 10;
        end loop;
        return sum;
    end digitSum;
   
    function nineDivisor(N: Positive) return Boolean is
    begin
        return digitSum(N) mod 9 = 0;
    end nineDivisor;
   
    function isPerfect(N: Positive) return Boolean is
        sum: Positive := 1;
        i: Positive := 2;
    begin
        while i * i <= N loop
            if N mod i = 0 then
                sum := sum + i;
                -- If N/i > i we have to also add it to our sum
                if N / i > i then
                sum := sum + N / i;
                end if;
            end if;
            i := i + 1;
        end loop;
        return (sum = N);
    end isPerfect;
   
   
   
    function isPalindrome(N: Positive) return Boolean is
        function reverseInt(N: Positive) return Positive is
            cp: Natural := N;
            rev: Natural := 0;
        begin
            while cp > 0 loop
                rev := rev * 10 + cp mod 10;
                cp := cp / 10;
            end loop;
            return rev;
        end reverseInt;
    begin
        return N = reverseInt(N);
    end isPalindrome;
   
   
    function recursivePower(X,N: Positive) return Positive is
    begin
        if N = 1 then
            return X;
        else
            return X * recursivePower(X,N-1);
        end if;
    end recursivePower;


    function recursiveFactorial(N: Natural) return Positive is
    begin 
        if N = 0 then
            return 1;
        else
            return N * recursiveFactorial(N-1);
        end if;
    end recursiveFactorial;


    function sin(x: Float) return Float is
        res: Float := x;
        current: Float := x;
        sign: Float := -1.0;
    begin
        for i in 1..10000000 loop
            current := (current * x * x) / (Float(2 * i) * Float(2*i + 1));
            res := res + sign * current;
            sign := -sign;
        end loop;
        return res;
    end sin;
end Math;
   
