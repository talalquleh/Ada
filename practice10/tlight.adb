with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Calendar;
use Ada.Calendar;

procedure tlight is
	type Lamp_Colors is (Red, Yellow, Green);	

	protected Lamp is
		procedure Change;
		function isColor return Lamp_Colors;
		
		entry Pass;
	private
		Current_Color : Lamp_Colors := Red;
	end Lamp;
	
	protected body Lamp is
		procedure Change is
		begin
			if Current_Color = Green then
				Current_Color := Red;
			else
				Current_Color := Lamp_Colors'Succ(Current_Color);
			end if;
		Put_Line("Traffic light color was changed to " & Lamp_Colors'Image(Current_Color));
		end Change;
		
		function isColor return Lamp_Colors is
		begin
			return Current_Color;
		end isColor;
		
		entry Pass when Current_Color = Green is
		begin
			Put_Line("Light is GREEN, cars can go now!");
		end Pass;
	end Lamp;

	task Scheduler;
	
	task body Scheduler is
	begin
		for I in 1..3 loop
			Lamp.Change;
			delay 3.0;
			Lamp.Change;
			delay 0.5;
			Lamp.Change;
			delay 2.0;
			Lamp.Change;
			delay 1.0;
		end loop;
	end Scheduler;
	
	type String_Access is access String;
	type Duration_Access is access Duration;
	
	task type Vehicle (License_Plate_Number : String_Access; Time_To_Reach_Lamp : Duration_Access);
	
	task body Vehicle is
		Is_Accepted : Boolean := false;
	begin
		Put_Line("Car with license " & License_Plate_Number.all & " will be waiting for " & Duration'Image(Time_To_Reach_Lamp.all));
		delay Time_To_Reach_Lamp.all;
		Put_Line("Car with license " & License_Plate_Number.all & " does not have to wait anymore.");
		while not Is_Accepted loop
			select 
				Lamp.Pass;
				Is_Accepted := true;
                Put_Line("Car with license " & License_Plate_Number.all & " has crossed the street.");
			or
				delay 0.2;
				Put_Line("Car with license " & License_Plate_Number.all & " has to wait some more.");
			end select;
		end loop;
	end Vehicle;
	
	type Vehicle_Access is access Vehicle;
	
	VA : Vehicle_Access;


begin
    VA := new Vehicle(new String'("TS-111-IN"), new Duration'(1.0));
    VA := new Vehicle(new String'("TS-222-IN"), new Duration'(1.0));
    VA := new Vehicle(new String'("TS-333-IN"), new Duration'(1.0));
end tlight;