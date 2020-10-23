with has_repetition;
with most_freq;
with most_freq2;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
    s: String := "I want to sleep";
    ss: String := "Hello,Iamgoing home";
    ss2: String := "Tell the world, I am going home";
    s2: String := "I";
    s3: String := "";
    
    function Has_Double_Letters is new has_repetition(Character, Positive, String);
    function Most_Frequent_Letters is new most_freq(Character, Positive, String);
    function Most_Frequent_Letters2 is new most_freq2(Character, Positive, String);
begin
    if Has_Double_Letters(s3) then
        Put_Line("Has double");
    else
        Put_Line("No doubles");
    end if;
    
    --Put_Line(Character'Image(Most_Frequent_Letters(s3)));
    Put_Line(Character'Image(Most_Frequent_Letters2(s3)));
end Main;