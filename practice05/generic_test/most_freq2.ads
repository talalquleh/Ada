generic
   type Elem is private;
   type Index is (<>);
   type TArray is array (Index range <>) of Elem;
function Most_freq2(a: TArray) return Elem;