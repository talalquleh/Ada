generic
    Type Elem is limited private;
    Type Index is (<>);
    Type TArray is array (Index range<>) of Elem;
    with procedure Swap(x, y: in out Elem);
procedure myReverse(a: in out TArray);
