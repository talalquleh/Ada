with Tree, Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;

procedure Demo is
	package BT is new Tree(Integer, "<", Integer'Image);
	use BT;
	P,Q: BSTree;
    
    --type TArray is array(Integer range <>) of Integer;
    a: TArray(1..5):=(1, 3, 2, 4, 5);
begin
	
	Q := Make_Tree(a);
    InOrder(Q);

end;

