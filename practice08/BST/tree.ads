generic

type Elem is private;
with function "<" (a, b: Elem) return Boolean is <>;
with function image(Item : in Elem) return String;
package Tree is
    type BSTree is private;
    type TArray is array (Positive range <>) of Elem;

    function Make_Tree (A: TArray) return BSTree; -- creates a binary search tree from an array
    procedure Insert (E: Elem; T: in out BSTree); -- inserts an element in the tree
    -- implement the 3 traversing modes:
    procedure PreOrder (T: BSTree); --return TArray; -- root-left-right
    procedure InOrder (T: BSTree); --return TArray; -- left-root-right
    procedure PostOrder (T: BSTree); --return TArray; -- left-right-root.

private

	type Node;
	type BSTree is access Node;
	type Node is record
		Item: Elem;
		Left, Right: BSTree;
		end record;


end Tree;