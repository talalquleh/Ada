with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure petrol_station is
    number_of_stations : Positive := 10;
    number_of_cars : Positive := 30;

	protected Printer is	
		procedure Print( s: in STRING := "" );
	end Printer;
	protected body Printer is
        procedure Print( s: in STRING := "" ) is
		begin
			Put_Line(s);
		end Print;
	end Printer;
    
    type Driver is (Impatient, Patient, Empty_tank);
    WaitTime: constant array (1..3) of duration := (0.0,0.5,Duration'Last);
    
    type Integer_Access is access Integer;
	type Duration_Access is access Duration;

    package Random_Positive_Generator is new Ada.Numerics.Discrete_Random(Positive);
	use Random_Positive_Generator;


    protected Station is	
		entry Fill;
        procedure Finished_filling;
        procedure Started_filling;
	private
		Available : Integer := number_of_stations;
	end Station;
	protected body Station is
        procedure Finished_filling is
		begin
			Available := Available + 1;
		end Finished_filling;

        procedure Started_filling is
        begin
            Available := Available - 1;
        end Started_filling;

		entry Fill when Available > 0 is
		begin
			Printer.Print("We have a place for you!");
		end Fill;
	end Station;

    
    task type Vehicle (License_Plate_Number : Integer_Access; Filling_Time : Duration_Access; Driver_Type : Positive);
	task body Vehicle is
		Is_Accepted : Boolean := false;
	begin
		while not Is_Accepted loop
			select 
				Station.Fill;
				Is_Accepted := true;
                Printer.Print("Car with license" & License_Plate_Number.all'Image & " is filling the tank.");
                Station.Started_filling;
                delay Filling_Time.all;
                Printer.Print("Car with license" & License_Plate_Number.all'Image & " finished and left.");
                Station.Finished_filling;
			or
				delay WaitTime(Driver_Type);
				Printer.Print("Car with license" & License_Plate_Number.all'Image & " waited for too long.");
                exit;
			end select;
		end loop;
	end Vehicle;

    type Vehicle_Access is access Vehicle;
	VA : Vehicle_Access;
    G : Generator;
begin
    reset(G);
    for I in 1..number_of_cars loop
        VA := new Vehicle(new Integer'(Random(G)), new Duration'(Duration(Random(G) rem 10)), ((Random(G) rem 3) + 1) );
        delay Duration(Float((Random(G) rem 5) + 1)/10.0);
    end loop;


end petrol_station;