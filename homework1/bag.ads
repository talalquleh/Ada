generic
    type Elem is private;
package Bag is

    type Bag(Max: Positive) is limited private;


    procedure Add(B: in out Bag; e: Elem);
    procedure Remove(B: in out Bag; e: Elem);
    function Multiplicity(B: in Bag; e: Elem) return Natural;
    
    generic
        with procedure Process_Element(e: Elem);
    procedure For_Each(B: in Bag);

private
    type PairElem is record
        Element: Elem;
        Number: Natural;
    end record;
    
    type TArray is array(Positive range <>) of PairElem;

    type Bag(Max: Positive) is record
        Data: TArray(1..Max);
        Pointer: Natural := 0;
    end record;
end Bag;