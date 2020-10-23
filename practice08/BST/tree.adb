with Ada.Unchecked_Deallocation;
with Ada.Text_IO;
use Ada.Text_IO;
package body Tree is

    function Empty return BSTree is
	begin
		return null;
	end;

    function Construct( 
		Item: Elem; 
		Left, Right: BSTree
		) return BSTree
	is
	begin
		return new Node'(Item, Left, Right);
	end;

    function Make_Tree (A: TArray) return BSTree is
        root: BSTree := null;
    begin
        for i in A'Range loop
            Insert(A(i), root);
        end loop;
        return root;
    end;


    procedure Insert (E: Elem; T: in out BSTree) is
    begin
        
        if T = null then
            T := Construct(E, null, null);
            return;
        end if;
        if E < T.Item then
            Insert(E, T.Left);
        else
            Insert(E, T.Right);
        end if;

    end;

    function Size(T: BSTree) return Natural is
    begin
        if T = null then
            return 0;
        elsif T.Left = null and then T.Right = null then
            return 1;
        else 
            return 1 + Size(T.Left) + Size(T.Right);
        end if;
    end;

    procedure PreOrder (T: BSTree) is
    begin
        if T = null then
            return;
        end if;

        Put_Line(Image(T.Item));
        PreOrder(T.Left);
        PreOrder(T.Right);
    end;

    procedure InOrder (T: BSTree) is
    begin
        if T = null then
            return;
        end if;

        InOrder(T.Left);
        Put_Line(Image(T.Item));
        InOrder(T.Right);
    end;


    procedure PostOrder (T: BSTree) is
    begin
        if T = null then
            return;
        end if;

        PostOrder(T.Left);
        PostOrder(T.Right);
        Put_Line(Image(T.Item));
    end;


end Tree;