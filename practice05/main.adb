with myReverse, myFind;
with Ada.Text_IO;
use Ada.Text_IO;

procedure Main is
    -- Reverse 
    type TArray is array(Integer range <>) of Integer;
    a: TArray(1..5):=(1, 2, 3, 4, 5);
    procedure swap(a, b: in out Integer) is
        tmp: Integer := a;
    begin
        a := a+b;
        b := a-b;
        a := a-b;
    end swap;
    procedure Int_reverse is new myReverse(Integer, Integer, TArray, swap);

    -- Find dups
    index1: Integer;
    index2: Integer;
    flag: Boolean;
    b: TArray(1..5) := (1, 2, 3, 2, 5);
    procedure Int_myFind is new myFind(Integer, Integer, TArray, "=");
begin
    Int_reverse(a);
    for i in a'Range loop
        Put_Line(Integer'Image(a(i)));
    end loop;

    Int_myFind(b, flag, index1, index2);
    if flag then
        Put_Line("Duplicates at: " & Integer'Image(index1) & Integer'Image(index2));
    else
        Put_Line("No repetition");
    end if;

end Main;