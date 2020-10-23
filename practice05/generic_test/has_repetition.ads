generic
   type Elem is private;
   type Index is (<>);
   type TArray is array (Index range <>) of Elem;
function has_repetition(a: TArray) return Boolean;