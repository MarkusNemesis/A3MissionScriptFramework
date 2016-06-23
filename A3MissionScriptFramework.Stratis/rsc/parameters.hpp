class Params 
{
	class MVStartFunds {
        title = "Gameplay: Starting Money";
        values[] = {5000, 7500, 10000, 15000};
        texts[] = {$5000, $7500, $10000, $15000};
        default =15000;
    };

	class MVGCDelayVehicles {
        title = "Garbage Collection: Delay (Vehicles)";
        values[] = {10, 20, 30, 40, 50, 60};
        texts[] = {10, 20, 30, 40, 50, 60};
        default =30;
    };
	
	class MVGCDelayCorpses {
        title = "Garbage Collection: Delay (Corpses)";
        values[] = {1,2,3,4,5,6,7,8,9,10};
        texts[] = {1,2,3,4,5,6,7,8,9,10'};
        default =2;
    };
	
	/*
    class MV {
        title = "";
        values[] = {};
        texts[] = {};
        default =;
    };
	*/
};