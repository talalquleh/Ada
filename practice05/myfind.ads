generic
   type Elem is limited private;
   type Index is (<>);
   type TArray is array (Index range <>) of Elem;
   with function "=" (x, y: Elem) return Boolean;
procedure myFind(a: TArray; b: out Boolean; i, j: out Index);
