with Ada.Integer_Text_IO, Ada.Text_IO, Ada.Float_Text_IO; 
use Ada.Integer_Text_IO;
with Math;

procedure main is    
    begin
        for i in 1..10000 loop
            if Math.isPerfect(i) then
                Put(i);
                Ada.Text_IO.New_Line;
            end if;
        end loop;

        Ada.Text_IO.New_Line;
        Ada.Text_IO.New_Line;
        Put(Math.digitSum(1234));

        Ada.Text_IO.New_Line;
        Ada.Text_IO.New_Line;
        if Math.nineDivisor(1233) then
            Ada.Text_IO.Put("1233 is divisible by 9");
        end if;
        Ada.Text_IO.New_Line;
        Ada.Text_IO.New_Line;
        if Math.isPalindrome(1221) then
            Ada.Text_IO.Put("1221 is palindrome");
        end if;
        Ada.Text_IO.New_Line;
        Ada.Text_IO.New_Line;
        Ada.Text_IO.Put("Factorial of 5 is");
        Put(Math.recursiveFactorial(5));
        Ada.Text_IO.New_Line;
        Ada.Text_IO.New_Line;
        Ada.Text_IO.Put("2 to the power 8 is");
        Put(Math.recursivePower(2,8));
        Ada.Text_IO.New_Line;
        Ada.Text_IO.New_Line;

        Ada.Text_IO.Put("Sin of pi / 6 is");
        Ada.Float_Text_IO.Put(Math.sin(3.141592/6.0));
        Ada.Text_IO.New_Line;
        Ada.Float_Text_IO.Put(Math.sin(3.141592));
        Ada.Text_IO.New_Line;
        Ada.Float_Text_IO.Put(Math.sin(3.141592/2.0));

end main;

