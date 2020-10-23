with bag, Ada.Text_IO, Ada.Integer_Text_IO;


procedure Main is
    package MyBag is new Bag(Integer);

    A: MyBag.Bag(100);
    procedure Print(e: Integer) is
    begin
        Ada.Integer_Text_IO.Put(e);
        Ada.Text_IO.Put(" With Multiplicity ");
        Ada.Integer_Text_IO.Put(MyBag.Multiplicity(A,e));
        Ada.Text_IO.New_Line;
    end Print;

    procedure PrintBag is new MyBag.For_Each(Print);

    
begin
    MyBag.Add(A, 1);
    MyBag.Add(A, 1);
    MyBag.Add(A, 1);
    MyBag.Add(A, 2);
    MyBag.Add(A, 2);
    MyBag.Add(A, 3);
    MyBag.Add(A, 10);

    Ada.Text_IO.Put("Before delete 1 is ");
    Ada.Integer_Text_IO.Put(MyBag.Multiplicity(A, 1));
    Ada.Text_IO.New_Line;
    MyBag.Remove(A, 1);
    Ada.Text_IO.Put("After delete 1 is ");
    Ada.Integer_Text_IO.Put(MyBag.Multiplicity(A, 1));

    Ada.Text_IO.New_Line;
    Ada.Text_IO.New_Line;
    PrintBag(A);
end Main;