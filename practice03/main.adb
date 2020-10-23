with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure main is

    type Index is new Integer;
    type Elem is new Integer;
    type TArray is array (Index range <>) of Elem;
    type Matrix is array (Index range <>, Index range <>) of Elem;
    type Matrixx is array (Integer range <>, Integer range <>) of Integer;

    T: TArray := (1,4,3,7,8,9,2,5,6);
    M: Matrix := ((1,1,1),(2,2,2),(3,3,3));
    N: Matrix := ((11, 22, 33, 44, 55), (1,8,3,8,8), (10,10,20,30,1),(0,0,0,0,0),(10,10,10,10,10));


    -- Add recursievely array
    function addRec(T: TArray) return Elem is
    begin
        if T'Length > 1 then
            return T(T'First) + addRec( T(Index'Succ(T'First)..T'Last) );
        else
            return T(T'First);
        end if;
    end addRec;

    -- Bubble Sort
    procedure Swap ( A, B: in out Elem ) is
    begin
        A := A+B;
        B := A-B; 
        A := A-B; 
    end Swap;

    procedure bubble(T: in out TArray) is
        flag: Boolean:= True;
    begin
        while flag loop
            flag := False;
            for i in T'Range loop
                if i /= T'Last then
                    if T(i) > T(i+1) then
                        Swap(T(i), T(i+1));
                        flag := True;
                    end if;
                end if;
            end loop;
        end loop;
    end bubble;

    -- Matrix diagonal
    function DiagonalSum(M : Matrix) return Elem is
		Sum: Elem := 0;
	begin
		for I in M'Range(1) loop
			Sum := Sum + M(I,I);
		end loop;
		return Sum;
	end DiagonalSum;

    -- Local Maximum
    procedure LocalMaximum(M: Matrix) is
    minimums: TArray(M'Range(2));
    minValue, maxValue: Elem;
    begin
        for j in M'Range(2) loop
            minValue := Elem'Last;
            for i in M'Range(1) loop
                if minValue > M(i,j) then
                    minValue := M(i,j);
                end if;
            end loop;
            minimums(j - M'First(2) + minimums'First) := minValue;
        end loop;

        --Put_Line("Checking minimums");
        --for i in minimums'Range loop
            --Put_Line(Elem'Image(minimums(i)));
        --end loop;


        for i in M'Range(1) loop
            maxValue := Elem'First;
            for j in M'Range(2) loop
                if maxValue < M(i,j) then
                    maxValue := M(i,j);
                end if;
            end loop;
            
            for j in M'Range(2) loop
                if maxValue = M(i,j) and then maxValue = minimums(j-M'First(2)+minimums'First) then
                    Put_Line("M(" & Index'Image(i-M'First(1)+1) & Index'Image(j-M'First(2)+1) & " ) =" & Elem'Image(maxValue));

                end if;
            end loop;
        end loop;
    end LocalMaximum;

    procedure spiralPrint(K: Matrix; i: Index; j: Index; m: Index; n: Index) is
    begin
    if (i >= m) or (j >= n) then
        return;
    end if;

    for p in i..(n-1) loop
        Put(Elem'Image(K(i,p)));
    end loop;
    for p in (i+1)..(m-1) loop
        Put(Elem'Image(K(p,n-1)));
    end loop;
    if (m-1 /= i) then
        for p in reverse j..(n-2) loop
            Put(Elem'Image(K(m-1,p)));
        end loop;
    end if;

    if (n-1 /= j) then
        for p in reverse (i+1)..(m-2) loop
            Put(Elem'Image(K(p,j)));
        end loop;
    end if;

    spiralPrint(K,i+1,j+1,m-1,n-1);

    end spiralPrint;

begin
    Put_Line(Elem'Image(addRec(T)));
    Put_Line("Sorting");
    bubble(T);
    for i in T'Range loop
        Put_Line(Elem'Image( T(i) ));
    end loop;
    Put_Line("Matrix diagonal");
    Put_Line(Elem'Image( DiagonalSum(M) ));
    Put_Line("Local Maximum");
    LocalMaximum(N);
    Put_Line("Spiral Print");
    spiralPrint(N,N'First,N'First,N'First+5,N'First+5);
end main;




