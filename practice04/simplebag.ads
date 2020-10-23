package SimpleBag is
    subtype Elem is Natural;
    type Bag is limited private;


    procedure insertOne(B: in out Bag; E: in Elem);
    procedure insertMultiple(B: in out Bag; E: in Elem; N: in Natural);
    procedure extractOne(B: in out Bag; E: in Elem);
    procedure extractMultiple(B: in out Bag; E: in Elem; N : in Natural);
    procedure print(B: Bag);
  

    function IsEmpty(B: Bag) return Boolean;


    private
        type TArray is array(Integer range <>) of Elem;
        type Bag is record
            Arr: TArray(1..100) := (others => 0);
            Size: Natural := 0;
        end record;

end SimpleBag;