/*
--------------------------------------------------------------------------------
				 ___   _____            ____________________
				|   | /     \           \______   \______   \
				|   |/  \ /  \   ______  |       _/|     ___/
				|   /    Y    \ /_____/  |    |   \|    |
				|___\____|__  /          |____|_  /|____|
				            \/                  \/
--------------------------------------------------------------------------------
			 __________________________________________________
			|												   |
			|              Imperious Roleplay          		   |
			|              ------------------              	   |
			|          Created by: Aleks and Vishnu     	   |
			|     Copyright © 2015, Imperious Roleplay	       |
			|__________________________________________________|
*/
/* NOTES:
	- Corpse
*/
//------------------------------------------------------------------------------
// Modules
//------------------------------------------------------------------------------
#include        "modules/config.pwn"
//------------------------------------------------------------------------------
// PREPROCESSOR DIRECTIVES
//------------------------------------------------------------------------------
#include <a_samp>
#include <a_mysql>
#include <a_zones>
#include <foreach>
#include <streamer>
#include <sscanf2>
#include <seifader2>
#include <zcmd>
#include <mSelection>

#undef 			MAX_PLAYERS
#define			MAX_PLAYERS (50)

#define COLOR_WHITE 		0xFFFFFFAA
#define COLOR_GREY			0xB4B5B7FF
#define COLOR_LIGHTYELLOW   0xFFF480AA
#define COLOR_TEAL          0x008080AA
#define COLOR_YELLOW 		0xFFFF00AA
#define COLOR_RED 			0xAA3333AA
#define COLOR_ORANGE 		0xF69521AA
#define COLOR_GREEN 		0x33AA33AA
#define COLOR_GOLD	 		0xFFD700FF
#define COLOR_LIME 			0x00FF00FF
#define COLOR_HOTPINK 		0xFF69B4FF
#define COLOR_CYAN 			0x00FFFFFF
#define COLOR_BLACK 		0x000000FF
#define COLOR_LAVENDER 		0xE6E6FAFF
#define COLOR_LIGHTRED 		0xFF6347AA
#define COLOR_DARKCYAN 		0x01FCFFC8
#define COLOR_LIGHTBLUE 	0x33CCFFAA
#define COLOR_PURPLE 		0xC2A2DAAA
#define COLOR_FADE1 		0xE6E6E6E6
#define COLOR_FADE2 		0xC8C8C8C8
#define COLOR_FADE3 		0xAAAAAAAA
#define COLOR_FADE4 		0x8C8C8C8C
#define COLOR_FADE5 		0x6E6E6E6E
#define RADIO_TEAM			0x8D8DFFFF
#define RADIO_DEPT			0xFFD7004A
#define COLOR_BROWN         0x614117AA

#define TEAM_COLOR_LSPD		0x33CCFFAA
#define TEAM_COLOR_LSFD		0xFF828200
#define TEAM_COLOR_GOV		0xB4B5B700
#define TEAM_COLOR_NEWS     0x00808000

#define VEHICLE_RESPAWN 			(-1)
#define FUEL_COST           		(2)
#define DIALOG_SPOOF_PROTECTION     false
#define TAX_PERCENTAGE              (20)

// Constants, DO NOT TOUCH BELOW UNLESS NECESSARY
#define THREAD_ACCOUNT_LOOKUP       (1)
#define THREAD_ACCOUNT_REGISTER     (2)
#define THREAD_REGISTER_SPAWN       (3)
#define THREAD_NO_RESULT         	(4)
#define THREAD_LOG_RESULT           (5)
#define THREAD_IP_LOOKUP            (6)

#define LOG_TYPE_KICK	            (1)
#define LOG_TYPE_JAIL	            (2)
#define LOG_TYPE_BAN	            (3)
#define LOG_TYPE_PERMABAN           (4)
#define LOG_TYPE_NAMECHANGE         (5)

#define BAN_TEMPORARY	            (0)
#define BAN_PERMANENT	            (1)

#define PLAYER_ALIVE              	(0)
#define PLAYER_WOUNDED              (1)
#define PLAYER_DEAD	              	(2)

#define BUSINESS_TYPE_UNDEFINED     (0)
#define BUSINESS_TYPE_STORE         (1)
#define BUSINESS_TYPE_CLOTHING      (2)
#define BUSINESS_TYPE_CLUB          (3)
#define BUSINESS_TYPE_HORSEBET      (4)
#define BUSINESS_TYPE_SEXSTORE      (5)
#define BUSINESS_TYPE_PIZZA		    (6)
#define BUSINESS_TYPE_DONUTS	    (7)
#define	BUSINESS_TYPE_AMMUNATION	(8)
#define	BUSINESS_TYPE_GYM			(9)
#define	BUSINESS_TYPE_BURGERSHOT	(10)
#define	BUSINESS_TYPE_CLUCKINGBELL	(11)

/*
 * Dialog Ids
 */
#define DIALOG_REGISTER 			(1)
#define DIALOG_LOGIN    			(2)
#define DIALOG_GENDER   			(3)
#define DIALOG_AGE   				(4)
#define DIALOG_SETSKIN 				(5)
#define DIALOG_REFERER              (6)
#define DIALOG_RADIO                (7)

#define DIALOG_LOCKER_MAIN     		(1101)
#define DIALOG_LOCKER_CLOTHING 		(1102)
#define DIALOG_LOCKER_LEO         	(1111)
#define DIALOG_LOCKER_GOV	        (1112)
#define DIALOG_LOCKER_MED         	(1113)

#define DIALOG_CITY_HALL_MENU       (4010)
#define DIALOG_CITY_HALL_NC			(4011)

#define DIALOG_STORE_BUY            (200)
#define DIALOG_CLUB_BUY	            (201)
#define DIALOG_CLOTHES_BUY          (202)
#define DIALOG_SEXSTORE_BUY         (203)
#define DIALOG_AMMUNATION_BUY       (204)

#define	DIALOG_WAYPOINT_EDIT    	(100)
#define	DIALOG_WAYPOINT_SUBMIT  	(101)
#define	DIALOG_BUSINESS_EDIT    	(110)
#define	DIALOG_BUSINESS_SUBMIT  	(111)
#define	DIALOG_BUSINESS_ADMIN 		(112)
#define	DIALOG_BUSINESS_ADMIN_EDIT	(113)
#define	DIALOG_FACTION_ADMIN 		(114)
#define	DIALOG_FACTION_ADMIN_EDIT	(115)
#define DIALOG_FACTION_ADMIN_RANK   (116)
#define DIALOG_FACTION_ADMIN_DIV    (117)
#define	DIALOG_HOUSE_ADMIN 			(118)
#define	DIALOG_HOUSE_ADMIN_EDIT		(119)
#define DIALOG_GATE_EDIT            (120)
#define DIALOG_GATE_SUBMIT          (121)
#define	DIALOG_VEHICLE_ADMIN 		(122)
#define	DIALOG_VEHICLE_ADMIN_EDIT	(123)

#define DIALOG_COLLECT_PLANT        (301)
#define DIALOG_DELETE_CAR           (302)
#define DIALOG_TRACK_CAR            (303)
#define DIALOG_RECEIVE_CAR          (304)
#define DIALOG_TELEPORT_CAR         (305)
#define DIALOG_CHANGE_PASSWORD      (306)
#define DIALOG_BRING_CAR  	        (307)
#define DIALOG_DMV_IMPOUND   	    (308)
#define DIALOG_UNMODCAR             (309)

#define MAX_FACTIONS    			(10)
#define MAX_WAYPOINTS   			(255) // do not change this, this is the maximum amount the database will allow.
#define MAX_BUSINESSES				(255) // do not change this, this is the maximum amount the database will allow.
#define MAX_HOUSES      			(255) // do not change this, this is the maximum amount the database will allow.
#define MAX_PH						(100000)
#define MAX_PLAYEROWNED_VEHICLES    (3)
#define MAX_ACCENTS				    (13)
#define MAX_GATES 					(100)
#define MAX_HITMAN_BOMBS            (5)
#define MAX_VEHICLE_MODS            (14)
#define MAX_DYNAMIC_VEHICLES        (100)

#define INVALID_WAYPOINT_ID     	-1
#define INVALID_BUSINESS_ID     	-1
#define INVALID_HOUSE_ID     		-1
#define INVALID_GATE_ID             -1
#define INVALID_SLOT_ID             -1
#define INVALID_DYNAMIC_VEHICLE_ID  -1

#define FACTION_TYPE_CIV		(0)
#define FACTION_TYPE_LEO		(1)
#define FACTION_TYPE_GOV		(2)
#define FACTION_TYPE_MEDIC		(3)
#define FACTION_TYPE_NEWS		(4)
#define FACTION_TYPE_ILLEGAL	(5)

#define VEHICLE_TYPE_PUBLIC     (0)
#define VEHICLE_TYPE_RENT       (1)
#define VEHICLE_TYPE_DMV        (2)
#define VEHICLE_TYPE_TAXI       (3)
#define VEHICLE_TYPE_PIZZA      (4)
#define VEHICLE_TYPE_TRUCKER    (5)

#define ALERT_GLOBAL    			1
#define ALERT_ADMINS    			2
#define ALERT_LOGGER    			3

#define MAX_LOGIN_ATTEMPTS  		5

#define ADMIN_LEVEL_ONE				(1)
#define ADMIN_LEVEL_TWO				(2)
#define ADMIN_LEVEL_THREE			(3)
#define ADMIN_LEVEL_FOUR			(4)
#define ADMIN_LEVEL_FIVE			(5)
#define ADMIN_LEVEL_SIX				(6)

#define IsPlayerTabbed(%0) gettime() > (LastUpdate[%0] + 2)
// mysql_tqueryof(szQuery, THREAD_IP_LOOKUP, playerid, mConnectionHandle);
//(MySQL:handle, const query[], const callback[] = "", const format[] = "", {Float,_}:...)
#define mysql_tqueryof(%1,%2,%3,%4) \
	mysql_tquery(%4, %1, "OnQueryFinish", "sii", %1, %2, %3)
	
forward OnPlayerChangeWeapon(playerid, weapon);
forward OnQueryFinish(query[], resultid, extraid);
forward ConsumeGlobalFuel();
forward PayDay();
forward MySQL_Change_Name(playerid, newname[], adminid);
forward MySQL_Offline_Ban(name[], reason[], days, adminid);
forward SetServerToRestart();
forward BackupTimer(playerid);
forward MySQL_Delete_Number(number, playerid);
forward MySQL_Player_Referral(playerid, referer[]);
forward MySQL_Unban_Player(name[], adminid);
forward MySQL_Suspend_Player(name[], adminid);
forward MySQL_Unban_Ip(ip[], adminid);
forward MySQL_Faction_Load();
forward MySQL_Business_Load();
forward MySQL_Vault_Load();
forward MySQL_Vehicle_Load();
forward MySQL_House_Load();
forward MySQL_Waypoint_Load();
forward MySQL_Gates_Load();
forward LoadPlayerAccount(playerid);
forward SavePlayerAccount(playerid);
forward SetPlayerToTeamColor(playerid);
forward SpawnTimer(playerid);
forward OnPlayerConnected(playerid);
forward SyncServer();
forward Heartbeat();
forward ProcessEMSQueue();
forward StartEngine(playerid, vehicleid);
forward StartMining(playerid, vehicleid);
forward RefuelVehicle(playerid, vehicleid);
forward HospitalTimer(playerid);
forward TaxiRoute(playerid, driverid);
forward TazerTimer(playerid, targetid);
forward SetPlayerSpawn(playerid);
forward HideLoadingTextdraws(playerid);
forward ShowPlayerDialogEx(playerid, dialogid, style, caption[], info[], button1[], button2[]);
forward RestartTimer();
forward Float:player_get_speed(playerid);

native IsValidVehicle(vehicleid);
native WP_Hash(buffer[], len, const str []);

new MySQL:mConnectionHandle;

enum ePlayerData
{
	pId,
	pUsername[MAX_PLAYER_NAME],
	pAdminName[MAX_PLAYER_NAME],
	pPassword[130],
	pIpAddress[16],
	pBanned,
	pTutorial,
	pGender,
	pAge,
	pAdminLevel,
	pMoney,
	pSkin,
	pLevel,
	pPaycheck,
	pExperience,
	pPlayingHours,
	Float:pPositionX,
	Float:pPositionY,
	Float:pPositionZ,
	Float:pFacingAngle,
	Float:pHealth,
	Float:pArmour,
	pInterior,
	pVirtualWorld,
	pJob,
	pWeapons[12],
	pReportMute,
	pNewbMute,
	pAdMute,
	pJailTime,
	pOocJail,
	pFaction,
	pLeadership,
	pRank,
	pDivision,
	pReloadingTaser,
	pWantedLevel,
	pDuty,
	pWounded,
	pBankBalance,
	pDriverLicense,
	pWalkieTalkie,
	pChannel,
	pPhoneToggled,
	pPhoneNumber,
	pVIP,
	pSprayCan,
	pBombs,
	pGunLicense,
	pSeeds,
	pWeed,
	pTogPM,
	pTogNewbie,
	Float:pPlantPosition[5],
	pPlantGrowth,
	pGasCans,
	pFish[5],
	pHitman,
	pContractPrice,
	pContractReason[33],
	pContractBy[MAX_PLAYER_NAME],
	pReferer[MAX_PLAYER_NAME],
	pAccent,
	pCompletedHits,
	pReports
}
new PlayerInfo[MAX_PLAYERS][ePlayerData];

enum ePlayerVehicleData
{
	pvHandleId,
	pvModelId,
	Float:pvPosition[4],
	pvLocked,
	Float:pvHealth,
	pvPaintJob,
	pvCarColor[2],
	pvImpounded,
	pvTicketPrice,
	pvModifications[MAX_VEHICLE_MODS]
}
new PlayerVehicleInfo[MAX_PLAYERS][MAX_PLAYEROWNED_VEHICLES][ePlayerVehicleData];

enum eVehicleData
{
	vStarted,
	vTotalled,
	vEngine,
	vLights,
	vAlarm,
	vDoors,
	vBonnet,
	vBoot,
	vObjective,
	vFuel,
	vLocked,
	vRadio,
	vDrugs
}
new VehicleInfo[MAX_VEHICLES][eVehicleData];

enum eWaypointData
{
	wExistant,
	wTextDisplay[65],
	wPassword[9],
	wLocked,
	Float:wPosition[3],
	wInterior,
	wVirtualWorld,
	Float:wFacingAngle,
	wLoadingTime,
	Float:wDestPosition[3],
	wDestInterior,
	wDestVirtualWorld,
	Float:wDestFacingAngle,
	wDestLoadingTime,
	wFactionRestriction,
	Text3D:wTextLabel
}
new WaypointInfo[MAX_WAYPOINTS+1][eWaypointData];

enum eBusinessData
{
	bExistant,
	bName[17],
	bOwner[MAX_PLAYER_NAME],
	Float:bPosition[3],
	Float:bFacingAngle,
	bInterior,
	bEarnings,
	bVirtualWorld,
	bOpen,
	bBuyPrice,
	bMapIcon,
	bPickup,
	Text3D:bTextLabel
}
new BusinessInfo[MAX_BUSINESSES+1][eBusinessData];

enum eHouseData
{
	hExistant,
	hOwner[MAX_PLAYER_NAME],
	Float:hPosition[3],
	Float:hFacingAngle,
	hInterior,
	hVirtualWorld,
	hBuyPrice,
	hOpen,
	Text3D:hTextLabel,
	hPickupIcon
}
new HouseInfo[MAX_HOUSES+1][eHouseData];

enum eFactionData
{
	fName[25],
	fType,
	fMotd[129],
	fDiv1[9],
	fDiv2[9],
	fDiv3[9],
	fDiv4[9],
	fDiv5[9],
	fRank1[33],
	fRank2[33],
	fRank3[33],
	fRank4[33],
	fRank5[33],
	fRank6[33],
	fRank7[33],
	fRank8[33],
	fRank9[33],
	fRank10[33],
	Float:fLockerPosition[3],
	fMats,
	Text3D:fLockerDisplay
}
new FactionInfo[MAX_FACTIONS+1][eFactionData];

enum eGateData
{
	gPassword[13],
	gModel,
	gObjectHandle,
	Text3D:gTextDisplay,
	gSpeed,
	gState,
	Float:gPosition[3],
	Float:gRotation[3],
	Float:gDestPosition[3],
	Float:gDestRotation[3]
}
new GateInfo[MAX_GATES][eGateData];

enum eVaultData
{
	Float:vPosition[3],
	vMoney,
	Text3D:vTextDisplay
}
new VaultInfo[MAX_FACTIONS+1][eVaultData];

enum eDynamicVehicleData
{
   	dvHandleId,
	dvModel,
	Float:dvPosition[3],
	Float:dvFacingAngle,
	dvColor[2],
	dvType,
	dvFaction
}
new DynamicVehicleInfo[MAX_DYNAMIC_VEHICLES+1][eDynamicVehicleData];


new buyable = mS_INVALID_LISTID;

/*
new stock airbreakIndexes[] =
{
	1231, 1266, 1234, 1189,
	1235, 1136, 1196, 1197,
	1198, 1159, 1133, 1130,
	1129, 1208, 1156
};
*/
new Float:WeedPlants[20][3] =
{
	{168.02, 2328.90, 17.27},
	{408.24, 2427.03, 16.49},
	{818.53, 2775.44, 75.78},
	{503.45, 1974.67, 54.39},
	{-630.38, 1511.52, 30.03},
	{-631.772, 1544.705, 32.027},
	{-689.887, 1598.577, 25.642},
	{-689.887, 1598.577, 25.642},
	{-1023.69, 2055.43, 103.49},
	{-919.529, 1867.488, 116.117},
	{-554.47, 1745.72, 110.79},
	{-199.21, 1779.56, 99.14},
	{-345.58, 2787.37, 91.91},
	{252.94, 2625.21, 16.48},
	{173.90, 2587.18, 17.68},
	{-861.85, 2427.81, 84.24},
	{-810.99, 2429.23, 156.96},
	{-772.31, 2423.40, 157.09},
	{-145.77, 1639.42, 16.26},
	{-424.38, 1383.17, 14.24}
};

enum eWeedData
{
	wpObjectHandle
}
new PlantData[sizeof(WeedPlants)][eWeedData];

new VehicleNames[212][] = {
	{"Landstalker"},{"Bravura"},{"Buffalo"},{"Linerunner"},{"Perrenial"},{"Sentinel"},{"Dumper"},
	{"Firetruck"},{"Trashmaster"},{"Stretch"},{"Manana"},{"Infernus"},{"Voodoo"},{"Pony"},{"Mule"},
	{"Cheetah"},{"Ambulance"},{"Leviathan"},{"Moonbeam"},{"Esperanto"},{"Taxi"},{"Washington"},
	{"Bobcat"},{"Mr Whoopee"},{"BF Injection"},{"Hunter"},{"Premier"},{"Enforcer"},{"Securicar"},
	{"Banshee"},{"Predator"},{"Bus"},{"Rhino"},{"Barracks"},{"Hotknife"},{"Trailer 1"},{"Previon"},
	{"Coach"},{"Cabbie"},{"Stallion"},{"Rumpo"},{"RC Bandit"},{"Romero"},{"Packer"},{"Monster"},
	{"Admiral"},{"Squalo"},{"Seasparrow"},{"Pizzaboy"},{"Tram"},{"Trailer 2"},{"Turismo"},
	{"Speeder"},{"Reefer"},{"Tropic"},{"Flatbed"},{"Yankee"},{"Caddy"},{"Solair"},{"Berkley's RC Van"},
	{"Skimmer"},{"PCJ-600"},{"Faggio"},{"Freeway"},{"RC Baron"},{"RC Raider"},{"Glendale"},{"Oceanic"},
	{"Sanchez"},{"Sparrow"},{"Patriot"},{"Quad"},{"Coastguard"},{"Dinghy"},{"Hermes"},{"Sabre"},
	{"Rustler"},{"ZR-350"},{"Walton"},{"Regina"},{"Comet"},{"BMX"},{"Burrito"},{"Camper"},{"Marquis"},
	{"Baggage"},{"Dozer"},{"Maverick"},{"News Chopper"},{"Rancher"},{"FBI Rancher"},{"Virgo"},{"Greenwood"},
	{"Jetmax"},{"Hotring"},{"Sandking"},{"Blista Compact"},{"Police Maverick"},{"Boxville"},{"Benson"},
	{"Mesa"},{"RC Goblin"},{"Hotring Racer A"},{"Hotring Racer B"},{"Bloodring Banger"},{"Rancher"},
	{"Super GT"},{"Elegant"},{"Journey"},{"Bike"},{"Mountain Bike"},{"Beagle"},{"Cropdust"},{"Stunt"},
	{"Tanker"}, {"Roadtrain"},{"Nebula"},{"Majestic"},{"Buccaneer"},{"Shamal"},{"Hydra"},{"FCR-900"},
	{"NRG-500"},{"HPV1000"},{"Cement Truck"},{"Tow Truck"},{"Fortune"},{"Cadrona"},{"FBI Truck"},
	{"Willard"},{"Forklift"},{"Tractor"},{"Combine"},{"Feltzer"},{"Remington"},{"Slamvan"},
	{"Blade"},{"Freight"},{"Streak"},{"Vortex"},{"Vincent"},{"Bullet"},{"Clover"},{"Sadler"},
	{"Firetruck LA"},{"Hustler"},{"Intruder"},{"Primo"},{"Cargobob"},{"Tampa"},{"Sunrise"},{"Merit"},
	{"Utility"},{"Nevada"},{"Yosemite"},{"Windsor"},{"Monster A"},{"Monster B"},{"Uranus"},{"Jester"},
	{"Sultan"},{"Stratum"},{"Elegy"},{"Raindance"},{"RC Tiger"},{"Flash"},{"Tahoma"},{"Savanna"},
	{"Bandito"},{"Freight Flat"},{"Streak Carriage"},{"Kart"},{"Mower"},{"Duneride"},{"Sweeper"},
	{"Broadway"},{"Tornado"},{"AT-400"},{"DFT-30"},{"Huntley"},{"Stafford"},{"BF-400"},{"Newsvan"},
	{"Tug"},{"Trailer 3"},{"Emperor"},{"Wayfarer"},{"Euros"},{"Hotdog"},{"Club"},{"Freight Carriage"},
	{"Trailer 3"},{"Andromada"},{"Dodo"},{"RC Cam"},{"Launch"},{"Police Car (LEO)"},{"Police Car (SFPD)"},
	{"Police Car (LVPD)"},{"Police Ranger"},{"Picador"},{"S.W.A.T. Van"},{"Alpha"},{"Phoenix"},{"Glendale"},
	{"Sadler"},{"Luggage Trailer A"},{"Luggage Trailer B"},{"Stair Trailer"},{"Boxville"},{"Farm Plow"},
	{"Utility Trailer"}
};

#define INDEX_MINEOBJECT                  (0)
// SEMI DYNAMIC STUFF
#define LOCATION_IMPOUND 			2225.1890,2456.8569,-7.7086
#define LOCATION_ARREST				2281.1650,2430.0449,3.0172
#define LOCATION_DMV 				823.130, 3.29, 1004.179
#define LOCATION_DELIVERPT 			1584.2042,1746.0682,10.8280
#define LOCATION_HOSPITAL 			1579.6067,1769.2509,10.8203


#define LOCATION_MAILBOX 			1559.8993,1042.0649,10.8203
#define LOCATION_WEAPONFACTORY 		2543.16, -1296.00, 1044.13
#define LOCATION_DEALERSHIP         1988.0078,2039.9209,10.8130

#define LOCATION_FISH 				2293.7705,523.2487,1.7944
#define LOCATION_SELLFISH 			2294.4900,544.9136,1.7944
#define LOCATION_TAXIJOB 			2047.689,-1915.942,13.546
#define LOCATION_TRUCKERJOB 		2183.902,-2252.951,14.770
#define LOCATION_TRUCKDELIVERY 		2188.268,-2264.258,13.479
#define LOCATION_MECHANICJOB 		1965.9840,2172.8284,10.8203
#define LOCATION_PIZZAJOB 			377.187,-115.422,1001.492
#define LOCATION_PIZZADELIVERY 		2110.976,-1773.879,13.392
#define LOCATION_MINERJOB   	    2199.689,-1974.648,13.557
#define LOCATION_MINESPOT	        -187.4391,2129.9346,-12.6628
#define LOCATION_MINEPROCESSING		-212.2387,2121.3508,-13.6078
#define LOCATION_SMUGGLERJOB 		1036.4525,2347.3406,10.8203
#define LOCATION_GETDRUGS 			1032.5446,2347.3406,10.8203



new Float:DrugWarehouses[3][3] =
{
	{788.1656,1702.6327,5.2813},
	{579.1238,1223.0154,11.7113},
	{309.4700,1152.2272,8.5859}
};

new Float:JailPositions[6][3] =
{
	// IC
	{177.065, 1830.980, -46.343},
	{183.727, 1831.926, -46.343},
	{190.518, 1831.440, -46.343},
	// OOC
	{190.518, 1852.847, -46.343},
	{183.843, 1852.842, -46.343},
	{177.282, 1852.355, -46.343}
};



new Float:DMVCheckpoints[15][3] =
{
	{2478.0042,2514.5496,10.5377},
	{2408.4172,2515.0413,10.4270},
	{2367.0955,2494.8188,10.3989},
	{2364.8540,2422.3528,10.4231},
	{2274.8125,2412.7522,10.3924},
	{2231.3894,2438.3940,10.4347},
	{2228.6941,2496.9036,10.4028},
	{2247.3596,2512.5183,10.3990},
	{2350.8884,2511.9897,10.3990},
	{2370.9004,2531.5613,10.5474},
	{2366.3508,2577.4602,10.5474},
	{2369.9639,2564.2537,10.5474},
	{2384.4114,2511.0850,10.5120},
	{2448.0454,2511.1106,10.4888},
	{2480.9307,2511.0862,10.5444}
};


// X:Y:Z:FacingAngle:Interior
new Float:BusinessInterior[30][5] = {
	{	834.340, 	7.44, 		1004.187, 	88.029, 3.0		}, 	//1 Horse Betting Place
	{	1212.127, 	-26.215, 	1000.953, 	180.00, 3.0		}, 	//2 Small Size Strip Club
	{	418.644, 	-84.143, 	1001.804, 	0.0, 	3.0		}, 	//3 Modern barber shop
	{	206.966, 	-139.892, 	1003.507, 	0.0, 	3.0		}, 	//4 ProLaps Store
	{	-100.297, 	-24.759, 	1000.718, 	0.0, 	3.0		}, 	//5 Sex Store
	{	-204.373, 	-44.028, 	1002.273, 	0.0, 	3.0		}, 	//6 Tiny Barber Shop
	{	373.326, 	-133.234, 	1001.492, 	0.0, 	5.0		}, 	//7 Pizza Stack Co
	{	377.204, 	-193.019, 	1000.640, 	0.0, 	17.0	}, 	//8 Rusty Brown Donuts
	{	226.831, 	-8.191, 	1002.210, 	90.0, 	5.0		}, 	//9 Victim Clothing Store
	{	315.786, 	-143.406, 	999.601, 	360.0, 	7.0		}, 	//10 Ammunation Interior
	{	773.862, 	-78.419, 	1000.662, 	0.0, 	7.0		}, 	//11 LV Gym Interior
	{	285.742, 	-41.487, 	1001.515, 	0.0, 	1.0		}, 	//12 Medium Ammunation
	{	203.783, 	-50.361, 	1001.804, 	354.70, 1.0		}, 	//13 Urban Clothing Store
	{	1204.833, 	-13.524, 	1000.921, 	0.0, 	2.0		}, 	//14 The Pig Pen
	{	363.068, 	-74.919, 	1001.507, 	318.14, 10.0	}, 	//15 Burger Shot
	{	411.631, 	-22.824, 	1001.804, 	356.0, 	2.0		}, 	//16 Reeces Barber Shop
	{	161.399, 	-96.461, 	1001.804, 	0.0, 	18.0	}, 	//17 Zip Clothing Store
	{	204.372, 	-168.549, 	1000.523, 	0.0, 	14.0	}, 	//18 Didier Sachs
	{	493.340, 	-24.416, 	1000.679, 	0.0, 	17.0	}, 	//19 Club Interior
	{	-25.943, 	-141.057, 	1003.546, 	0.0, 	16.0	}, 	//20 24/7 (Version 4)
	{	207.614, 	-110.704, 	1005.132, 	0.0, 	15.0	}, 	//21 Binco Store
	{	-228.941, 	1401.137, 	27.765, 	270.0, 	18.0	}, 	//22 Lil Probe Inn
	{	460.022, 	-88.648, 	999.554, 	90.0, 	4.0		}, 	//23 Jay's Diner
	{	412.042, 	-54.243, 	1001.898, 	0.0, 	12.0	}, 	//24 Modern Barber Store #2
	{	774.105, 	-49.940, 	1000.585, 	0.0, 	6.0		}, 	//25 SF Cobra Gym
	{	-2240.356, 	137.191, 	1035.414, 	270.0, 	6.0		}, 	//26 Zero's RC Store
	{	296.915, 	-111.586, 	1001.515, 	0.0, 	6.0		}, 	//27 Ammunation (Version 4)
	{	316.338, 	-169.920, 	999.601, 	0.0, 	6.0		}, 	//28 Ammunation (Version 5)
	{	364.913, 	-11.085, 	1001.851, 	0.0, 	9.0		}, 	//29 Clucking Bell
	{   501.859, 	-67.912, 	998.757, 	177.49, 11.0	} 	//30 Ten Green Bottles Bar
};

// X:Y:Z:FacingAngle:Interior
new Float:HouseInterior[21][5] = {
    {	243.819, 	304.995, 	999.148, 	265.25, 1.0		}, // 1 Denise's Room
	{	2468.731, 	-1698.267, 	1013.507, 	83.90, 	2.0		}, // 2 Ryder's House
	{	2495.979, 	-1692.197, 	1014.742, 	174.5, 	3.0		}, // 3 The Johnson House
	{	266.611, 	305.011, 	999.148, 	267.1, 	2.0		}, // 4 Katie's Lovenest
	{	1260.749, 	-785.410, 	1091.906, 	266.5, 	5.0		}, // 5 Madd Dogg's Mansion
	{	422.469, 	2536.560, 	10.000, 	86.43, 	10.0	}, // 6 Abandoned AC Tower
	{	2233.693, 	-1115.155, 	1050.882, 	357.2, 	5.0		}, // 7 Safe House group 1
	{	2317.802, 	-1026.669, 	1050.217, 	357.53, 9.0		}, // 8 Safe House group 3
	{	223.179, 	1287.189, 	1082.140, 	356.95, 1.0		}, // 9 Burglary House X3
	{	226.381, 	1114.203, 	1080.993, 	270.0,	5.0		}, // 10 Burglary House X4
	{	295.174, 	1472.370, 	1080.257, 	355.9, 	15.0	}, // 11 Burglary houses
	{	446.799, 	506.432, 	1001.419, 	357.2, 	12.0	}, // 12 Budget Inn Motel Room
	{	447.076, 	1397.180, 	1084.304, 	356.66, 2.0		}, // 13 Pair of Burglary Houses
	{	226.384, 	1114.271, 	1080.993, 	266.5, 	5.0		}, // 14 Crack Den
	{	23.986, 	1340.279, 	1084.375, 	356.98,	10.0	}, // 15 Unused Safe House
	{	23.986, 	1340.279, 	1084.375, 	356.98,	10.0	}, // 16 Burglary House X14
	{	22.843, 	1403.439, 	1084.437, 	353.65,	5.0		}, // 17 Burglary House X16
	{	140.318, 	1366.030, 	1083.859, 	359.03,	5.0		}, // 18 Burglary House X17
	{	234.110, 	1063.830, 	1084.212, 	356.53,	6.0		}, // 19 Burglary House X18
	{	2807.645, 	-1174.645, 	1025.570, 	356.54,	8.0		}, // 20 Colonel Furhberger's
	{	2365.261, 	-1135.479, 	1050.882, 	355.34,	8.0		} // 21 Verdant Bluffs Safehouse
};

// URL / Name
new RadioStations[11][2][] = {
	{{"http://yp.shoutcast.com/sbin/tunein-station.pls?id=37586"}, {"181.FM - THE BUZZ"}},
	{{"http://yp.shoutcast.com/sbin/tunein-station.pls?id=297243"}, {"181.FM - HIGHWAY 181"}},
	{{"http://yp.shoutcast.com/sbin/tunein-station.pls?id=557801"}, {"181.FM - REAL COUNTRY"}},
	{{"http://yp.shoutcast.com/sbin/tunein-station.pls?id=97102"}, {"DEFJAY.COM - 100% R&B"}},
	{{"http://www.dubstep.fm/listen.pls"}, {"DUBSTEP.FM"}},
	{{"http://yp.shoutcast.com/sbin/tunein-station.pls?id=8318"}, {"HOT 108 JAMZ - #1 FOR HIPHOP"}},
	{{"http://yp.shoutcast.com/sbin/tunein-station.pls?id=221956"}, {"181.FM Kickin' Country"}},
	{{"http://www.specific.dk/normal.pls"}, {"Specific Radio"}},
	{{"http://yp.shoutcast.com/sbin/tunein-station.pls?id=57352"}, {"HouseTime.FM - 24/7 House"}},
	{{"http://yp.shoutcast.com/sbin/tunein-station.pls?id=108251"}, {":: Electro Radio ::"}},
	{{"http://yp.shoutcast.com/sbin/tunein-station.pls?id=217084"}, {"1.FM - Amsterdam Trance"}}
};

enum DEALERSHIP_VEHICLES
{
	dCarModel,
	dCarPrice
}
new CarsPrices[][DEALERSHIP_VEHICLES] = {
{462, 11999},
{525, 19500},
{543, 21000},
{473, 26000},
{463, 30500},
{440, 31000},
{532, 35500},
{600, 35999},
{491, 35999},
{410, 35999},
{516, 35999},
{418, 36000},
{586, 36000},
{467, 36500},
{547, 39500},
{401, 41500},
{549, 41999},
{436, 41999},
{420, 45500},
{517, 45999},
{589, 45999},
{518, 45999},
{527, 45999},
{551, 45999},
{439, 45999},
{445, 46000},
{478, 46000},
{492, 48999},
{422, 51000},
{529, 51500},
{405, 52500},
{466, 52999},
{546, 53999},
{540, 55500},
{474, 55999},
{526, 55999},
{500, 56000},
{483, 56000},
{545, 56000},
{419, 56781},
{561, 56999},
{459, 61000},
{421, 61500},
{458, 61500},
{550, 61999},
{576, 62500},
{412, 64500},
{438, 65500},
{533, 65999},
{534, 65999},
{585, 65999},
{507, 65999},
{554, 66000},
{567, 66500},
{536, 66500},
{599, 66500},
{575, 66999},
{479, 71400},
{489, 71750},
{431, 76000},
{523, 76000},
{575, 76500},
{542, 76500},
{413, 80000},
{496, 80299},
{535, 80999},
{508, 81800},
{426, 86500},
{404, 86500},
{562, 92999},
{580, 95999},
{482, 96500},
{566, 100500},
{587, 101000},
{423, 101500},
{588, 101500},
{559, 105999},
{579, 106500},
{400, 109999},
{453, 121000},
{402, 126000},
{558, 126000},
{480, 126500},
{408, 126500},
{602, 151000},
{565, 155999},
{555, 186000},
{484, 232200},
{430, 246000},
{409, 251000},
{560, 276000},
{454, 300999},
{603, 345000},
{415, 456999},
{446, 501000},
{563, 1001000},
{417, 1001000},
{487, 2551000},
{593, 3501000},
{481, 12000},
{509, 12000},
{477, 425000},
{468, 55000},
{521, 100000},
{541, 555999},
{429, 560000}
};

new VIPCars[][DEALERSHIP_VEHICLES] = {
{481, 12000},
{509, 12000},
{477, 425000},
{468, 55000},
{521, 100000},
{541, 555999},
{429, 560000}
};


// TextDraws
new
	PlayerText:JailTimerTD[MAX_PLAYERS],
	Text:LoadingObjectTextDraw,
	Text:LoadingObjectBox,
	Text:Login0,
	Text:Login1,
	Text:Login2,
	Text:Login3,
	Text:Login4,
	Text:Login5,
	Text:Login6,
	Text:Login7
;

// Timers
new
	RefuelTimer[MAX_PLAYERS],
	TaxiRouteTimerEx[MAX_PLAYERS],
	BackupTimerEx[MAX_PLAYERS]
;

// Player Arrays
new
	CurrentDialog[MAX_PLAYERS],
	RefillAmount[MAX_PLAYERS],
	WeedPlant[MAX_PLAYERS],
    gLoginAttempts[MAX_PLAYERS],
	pCurrentWeapon[MAX_PLAYERS],
	gLastCar[MAX_PLAYERS],
	nTimeLeft[MAX_PLAYERS],
	rTimeLeft[MAX_PLAYERS],
	LicenseTestAC[MAX_PLAYERS],
	PlayerCall[MAX_PLAYERS],
	CallingTo[MAX_PLAYERS],
	PhoneState[MAX_PLAYERS],
	WaypointEditing[MAX_PLAYERS],
	WaypointEditOption[MAX_PLAYERS],
	BusinessEdit[MAX_PLAYERS],
	BusinessEditOption[MAX_PLAYERS],
	VehicleEdit[MAX_PLAYERS],
	VehicleEditOption[MAX_PLAYERS],
	FactionEdit[MAX_PLAYERS],
	FactionEditOption[MAX_PLAYERS],
	HouseEdit[MAX_PLAYERS],
	HouseEditOption[MAX_PLAYERS],
	GateEdit[MAX_PLAYERS],
	GateEditOption[MAX_PLAYERS],
	gTaxiFareAmount[MAX_PLAYERS],
	gTaxiFareEarnings[MAX_PLAYERS],
	SpectatingPlayer[MAX_PLAYERS],
	SpectatingAdmin[MAX_PLAYERS],
	TaxiSeconds[MAX_PLAYERS],
	Float:WeaponDamage[MAX_PLAYERS],
	LastUpdate[MAX_PLAYERS],
	HitmanTarget[MAX_PLAYERS],
	HitmanBombObject[MAX_PLAYERS][MAX_HITMAN_BOMBS],
	Float:HitmanBombs[MAX_PLAYERS][MAX_HITMAN_BOMBS][3],
    gPlayerAnimLibsPreloaded[MAX_PLAYERS],
    gPlayerUsingLoopingAnim[MAX_PLAYERS],
    LastKiller[MAX_PLAYERS]
;

// Global Variables
new
	WorldTime[3],
	gAdvertisementTime,
	gCurrentTaxiCall,
	bool:gNewbie = true
;


main()
{
	AntiDeAMX();
	SendRconCommand("hostname "SERVER_NAME);
    SendRconCommand("rcon_password "SERVER_RCON);
    SendRconCommand("gamemodetext "SERVER_VERSION);
	SendRconCommand("mapname "SERVER_MAP);
	SendRconCommand("weburl "SERVER_SITE);
	SendRconCommand("password "SERVER_PASSWORD);
	SendRconCommand("language "SERVER_LANGUAGE);
	printf(""SERVER_NAME" ("SERVER_VERSION"), has been loaded successfully.");
	printf("[TESTING] MAX_PLAYERS = %i.", MAX_PLAYERS);
}

public OnGameModeInit()
{
	AntiDeAMX();
    if(!fexist("numbers_used.txt"))
    {
        new File:nf = fopen("numbers_used.txt", io_write);
        fclose(nf);
    }
    
    buyable = LoadModelSelectionMenu("buyable.txt");
    
	MySQL_Initialize();
	MySQL_Load_Waypoints();
	MySQL_Load_Businesses();
	MySQL_Load_Houses();
	MySQL_Load_Factions();
    MySQL_Load_Vaults();
    MySQL_Load_Vehicles();
    MySQL_Load_Gates();
	PlantMarijuanaPlant();
	LoadGameObjects();
	
	UsePlayerPedAnims();
	EnableStuntBonusForAll(0);
	SetNameTagDrawDistance(15.0);
    LimitPlayerMarkerRadius(100.0);
    ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
	DisableInteriorEnterExits();
	
	gettime(WorldTime[0], WorldTime[1], WorldTime[2]);
	SetWorldTime(WorldTime[0]);
	SetTimer("Heartbeat", 1000, true);
	SetTimer("SyncServer", 60000, true);
	SetTimer("ProcessEMSQueue", 1000, true);


	// Exterior Labels and Pickups
	CreateDynamic3DTextLabel("An Ordinary Mailbox\nType /contract here to send a mail to an unknown address", COLOR_YELLOW, LOCATION_MAILBOX, 10.0);
	CreateDynamic3DTextLabel("Department of Motor Vehicles\nType /buylicense to buy a license\nType /dmvmenu to manage your vehicles and their legal status", COLOR_YELLOW, LOCATION_DMV, 8.0);
	CreateDynamic3DTextLabel("Sell Fish\nType /sellfish to sell all the fish in your inventory", COLOR_YELLOW, LOCATION_SELLFISH, 15.0);
	CreateDynamic3DTextLabel("Weapon Factory\nType /getgun to produce a gun", COLOR_YELLOW, LOCATION_WEAPONFACTORY, 8.0);
	
	CreateDynamic3DTextLabel("Vehicle Dealership\nType /buyvehicles display the available cars", COLOR_YELLOW, LOCATION_DEALERSHIP, 15.0);
	CreateDynamicPickup(1239, 1, LOCATION_DEALERSHIP);
	
	CreateDynamic3DTextLabel("Fishing Spot\nType /fish to catch fish at this spot", COLOR_YELLOW, LOCATION_FISH, 15.0);
	CreateDynamicPickup(1239, 1, LOCATION_FISH);
	
	CreateDynamic3DTextLabel("Pizza Boy Job\nType /getjob to become a Pizza Boy", COLOR_YELLOW, LOCATION_PIZZAJOB, 8.0);
	CreateDynamicPickup(1239, 1, LOCATION_PIZZAJOB);

	CreateDynamic3DTextLabel("Pizza Delivery\nType /startpizza start a route", COLOR_YELLOW, LOCATION_PIZZADELIVERY, 8.0);
	CreateDynamicPickup(1239, 1, LOCATION_PIZZADELIVERY);

	CreateDynamic3DTextLabel("Drug Smuggler Job\nType /getjob to become a Drug Smuggler", COLOR_YELLOW, LOCATION_SMUGGLERJOB, 8.0);
	CreateDynamicPickup(1239, 1, LOCATION_SMUGGLERJOB);

	CreateDynamic3DTextLabel("Drug Smuggling Point\nType /getdrugs to deliver a load", COLOR_WHITE, LOCATION_GETDRUGS, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
	CreateDynamicPickup(1239, 1, LOCATION_GETDRUGS);

	CreateDynamic3DTextLabel("Trucker Job\nType /getjob to become a Trucker", COLOR_YELLOW, LOCATION_TRUCKERJOB, 8.0);
	CreateDynamicPickup(1239, 1, LOCATION_TRUCKERJOB);

	CreateDynamic3DTextLabel("Trucker Delivery\nType /startroute start a route", COLOR_YELLOW, LOCATION_TRUCKDELIVERY, 8.0);
	CreateDynamicPickup(1239, 1, LOCATION_TRUCKDELIVERY);

	CreateDynamic3DTextLabel("Miner Job\nType /getjob to become a Miner", COLOR_YELLOW, LOCATION_MINERJOB, 8.0);
	CreateDynamicPickup(1239, 1, LOCATION_MINERJOB);

	CreateDynamic3DTextLabel("Mechanic Job\nType /getjob to become a Mechanic", COLOR_YELLOW, LOCATION_MECHANICJOB, 8.0);
	CreateDynamicPickup(1239, 1, LOCATION_MECHANICJOB);

	CreateDynamic3DTextLabel("Taxi Driver Job\nType /getjob to become a Taxi Driver", COLOR_YELLOW, LOCATION_TAXIJOB, 8.0);
	CreateDynamicPickup(1239, 1, LOCATION_TAXIJOB);
	
	CreateDynamic3DTextLabel("Impound Warehouse\nType /impound to process a vehicle", COLOR_LIGHTBLUE, LOCATION_IMPOUND, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID);
	CreateDynamicPickup(1239, 1, LOCATION_IMPOUND);

	CreateDynamic3DTextLabel("Arrest Point\nType /arrest to arrest detained suspects", COLOR_YELLOW, LOCATION_ARREST, 8.0);
	CreateDynamicPickup(1247, 1, LOCATION_ARREST);
	
	CreateDynamic3DTextLabel("Delivery Point\nType /deliverpt to deliver your patient", COLOR_YELLOW, LOCATION_DELIVERPT, 40.0);
	CreateDynamicPickup(1239, 1, LOCATION_DELIVERPT);

	CreateDynamic3DTextLabel("Gas Station\nType /car refuel to refill your vehicle", COLOR_GOLD, -1328.518, 2672.2, 50.062, 20.0);
	CreateDynamic3DTextLabel("Gas Station\nType /car refuel to refill your vehicle", COLOR_GOLD, -1328.035, 2677.560, 50.062, 20.0);
	CreateDynamic3DTextLabel("Gas Station\nType /car refuel to refill your vehicle", COLOR_GOLD, -1326.627, 2688.724, 50.062, 20.0);
	CreateDynamic3DTextLabel("Gas Station\nType /car refuel to refill your vehicle", COLOR_GOLD, -1327.65, 2682.83, 50.063, 20.0);


	// Interior Labels
	CreateDynamic3DTextLabel("City Hall\nType /hallmenu to organize your citizenship", COLOR_YELLOW, 362.305, 173.687, 1008.382, 8.0);
	CreateDynamic3DTextLabel("Bank\nType /bank to view your bank account", COLOR_YELLOW, 2310.30, -8.22, 26.74, 8.0);
	CreateDynamic3DTextLabel("Buy Clothes\nType /buy to purchase some new clothes", COLOR_YELLOW, 207.694, -102.273, 1005.257, 8.0);
	CreateDynamic3DTextLabel("Buy Guns\nType /buy to purchase a gun (weapon license required)", COLOR_YELLOW, 312.224, -165.032, 999.601, 8.0);
	CreateDynamic3DTextLabel("Weapon Factory\nType /getgun to produce a gun", COLOR_YELLOW, LOCATION_WEAPONFACTORY, 8.0);
	CreateDynamic3DTextLabel("Mine Spot\nType /mine to start mining", COLOR_LIGHTRED, LOCATION_MINESPOT, 10.0);
	CreateDynamic3DTextLabel("Mine Processing\nDeliver the raw ores here to process it", COLOR_YELLOW, LOCATION_MINEPROCESSING, 8.0);

/*
	LoadingObjectTextDraw = TextDrawCreate(326.000000, 131.000000, "Loading...");
	TextDrawAlignment(LoadingObjectTextDraw, 2);
	TextDrawBackgroundColor(LoadingObjectTextDraw, 255);
	TextDrawFont(LoadingObjectTextDraw, 2);
	TextDrawLetterSize(LoadingObjectTextDraw, 0.540000, 3.400000);
	TextDrawColor(LoadingObjectTextDraw, -1);
	TextDrawSetOutline(LoadingObjectTextDraw, 0);
	TextDrawSetProportional(LoadingObjectTextDraw, 1);
	TextDrawSetShadow(LoadingObjectTextDraw, 1);
	TextDrawUseBox(LoadingObjectTextDraw, 1);
	TextDrawBoxColor(LoadingObjectTextDraw, 255);
	TextDrawTextSize(LoadingObjectTextDraw, 0.000000, 0.000000);

	LoadingObjectBox = TextDrawCreate(431.000000, 118.000000, "~n~~n~~n~~n~~n~~n~~n~~n~~n~");
	TextDrawBackgroundColor(LoadingObjectBox, 255);
	TextDrawFont(LoadingObjectBox, 1);
	TextDrawLetterSize(LoadingObjectBox, -1.610000, 0.800000);
	TextDrawColor(LoadingObjectBox, 255);
	TextDrawSetOutline(LoadingObjectBox, 0);
	TextDrawSetProportional(LoadingObjectBox, 1);
	TextDrawSetShadow(LoadingObjectBox, 1);
	TextDrawUseBox(LoadingObjectBox, 1);
	TextDrawBoxColor(LoadingObjectBox, 255);
	TextDrawTextSize(LoadingObjectBox, 217.000000, 0.000000);
*/
	LoadingObjectTextDraw = TextDrawCreate(313.000000, 193.000000, "Loading...");
	TextDrawAlignment(LoadingObjectTextDraw, 2);
	TextDrawBackgroundColor(LoadingObjectTextDraw, 255);
	TextDrawFont(LoadingObjectTextDraw, 2);
	TextDrawLetterSize(LoadingObjectTextDraw, 0.629999, 3.000000);
	TextDrawColor(LoadingObjectTextDraw, -1);
	TextDrawSetOutline(LoadingObjectTextDraw, 1);
	TextDrawSetProportional(LoadingObjectTextDraw, 1);
	
	LoadingObjectBox = TextDrawCreate(174.000000, 181.000000, "Box");
	TextDrawBackgroundColor(LoadingObjectBox, 0);
	TextDrawFont(LoadingObjectBox, 1);
	TextDrawLetterSize(LoadingObjectBox, 1.590000, 7.700005);
	TextDrawColor(LoadingObjectBox, 0);
	TextDrawSetOutline(LoadingObjectBox, 0);
	TextDrawSetProportional(LoadingObjectBox, 1);
	TextDrawSetShadow(LoadingObjectBox, 1);
	TextDrawUseBox(LoadingObjectBox, 1);
	TextDrawBoxColor(LoadingObjectBox, 100);
	TextDrawTextSize(LoadingObjectBox, 454.000000, 18.000000);

	Login0 = TextDrawCreate(641.666687, 1.500000, "usebox");
	TextDrawLetterSize(Login0, 0.000000, 9.131894);
	TextDrawTextSize(Login0, -2.000000, 0.000000);
	TextDrawAlignment(Login0, 1);
	TextDrawColor(Login0, 0);
	TextDrawUseBox(Login0, true);
	TextDrawBoxColor(Login0, 102);
	TextDrawSetShadow(Login0, 0);
	TextDrawSetOutline(Login0, 0);
	TextDrawFont(Login0, 0);

	Login1 = TextDrawCreate(641.666687, 365.707397, "usebox");
	TextDrawLetterSize(Login1, 0.000000, 8.947533);
	TextDrawTextSize(Login1, -2.000000, 0.000000);
	TextDrawAlignment(Login1, 1);
	TextDrawColor(Login1, 0);
	TextDrawUseBox(Login1, true);
	TextDrawBoxColor(Login1, 102);
	TextDrawSetShadow(Login1, 0);
	TextDrawSetOutline(Login1, 0);
	TextDrawFont(Login1, 0);

	Login2 = TextDrawCreate(235.666702, 27.377784, SERVER_NAME);
	TextDrawLetterSize(Login2, 0.739000, 3.325628);
	TextDrawAlignment(Login2, 1);
	TextDrawColor(Login2, -1);
	TextDrawSetShadow(Login2, 0);
	TextDrawSetOutline(Login2, -3);
	TextDrawBackgroundColor(Login2, 51);
	TextDrawFont(Login2, 1);
	TextDrawSetProportional(Login2, 1);

	Login3 = TextDrawCreate(303.333343, 62.637016, "Version 3");
	TextDrawLetterSize(Login3, 0.263000, 1.230813);
	TextDrawAlignment(Login3, 1);
	TextDrawColor(Login3, -1);
	TextDrawSetShadow(Login3, 0);
	TextDrawSetOutline(Login3, 1);
	TextDrawBackgroundColor(Login3, 51);
	TextDrawFont(Login3, 3);
	TextDrawSetProportional(Login3, 1);

	Login4 = TextDrawCreate(8.333291, 371.259368, "Created by: b1eed");
	TextDrawLetterSize(Login4, 0.449999, 1.600000);
	TextDrawAlignment(Login4, 1);
	TextDrawColor(Login4, -1);
	TextDrawSetShadow(Login4, 0);
	TextDrawSetOutline(Login4, -2);
	TextDrawBackgroundColor(Login4, 51);
	TextDrawFont(Login4, 2);
	TextDrawSetProportional(Login4, 1);

	Login5 = TextDrawCreate(279.000091, 9.125836, SERVER_SITE);
	TextDrawLetterSize(Login5, 0.449999, 1.600000);
	TextDrawAlignment(Login5, 1);
	TextDrawColor(Login5, -1);
	TextDrawSetShadow(Login5, 0);
	TextDrawSetOutline(Login5, 1);
	TextDrawBackgroundColor(Login5, 51);
	TextDrawFont(Login5, 2);
	TextDrawSetProportional(Login5, 1);

	Login6 = TextDrawCreate(10.666801, 389.925872, "Thanks to: Aleks & Stevolas");
	TextDrawLetterSize(Login6, 0.267666, 1.546074);
	TextDrawAlignment(Login6, 1);
	TextDrawColor(Login6, -1);
	TextDrawSetShadow(Login6, 0);
	TextDrawSetOutline(Login6, 1);
	TextDrawBackgroundColor(Login6, 51);
	TextDrawFont(Login6, 3);
	TextDrawSetProportional(Login6, 1);

	Login7 = TextDrawCreate(245.666717, 370.014862, "Players Online: 0");
	TextDrawLetterSize(Login7, 0.449999, 1.600000);
	TextDrawAlignment(Login7, 1);
	TextDrawColor(Login7, -1);
	TextDrawSetShadow(Login7, 0);
	TextDrawSetOutline(Login7, 1);
	TextDrawBackgroundColor(Login7, 51);
	TextDrawFont(Login7, 3);
	TextDrawSetProportional(Login7, 1);

	for (new v=0; v < MAX_VEHICLES; v++)
	    if(IsValidVehicle(v)) SetVehicleToRespawn(v);

	ConsumeGlobalFuel();
	return 1;
}

stock MySQL_Initialize()
{
	mysql_log(ERROR | WARNING);
	new MySQLOpt:options = mysql_init_options();
	mysql_set_option(options, AUTO_RECONNECT, true);
	mConnectionHandle = mysql_connect(MYSQL_HOST, MYSQL_USERNAME, MYSQL_PASSWORD, MYSQL_DATABASE, options);
	printf("[MySQL]: Attempting to make a connection to %s with username %s and password %s to database %s.", MYSQL_HOST, MYSQL_USERNAME, MYSQL_PASSWORD, MYSQL_DATABASE);
	if(mysql_errno() != 0)
	{
	    print("[MySQL Error]: The script was unable to connect to the MySQL server, please check whether if the credentials are correct.");
	    SendRconCommand("exit");
	}
	else  print("[MySQL]: The script has successfully established the connection to the MySQL Database.");
}

stock MySQL_Exit()
{
	mysql_close(mConnectionHandle);
}

public OnGameModeExit()
{
	TextDrawDestroy(LoadingObjectTextDraw);
	TextDrawDestroy(LoadingObjectBox);
	TextDrawDestroy(Login0);
	TextDrawDestroy(Login1);
	TextDrawDestroy(Login2);
	TextDrawDestroy(Login3);
    TextDrawDestroy(Login4);
    TextDrawDestroy(Login5);
    TextDrawDestroy(Login6);
    TextDrawDestroy(Login7);

    Seifader_OnExit();
    MySQL_Exit();
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	if(GetPVarInt(playerid, "gPlayerLogged") == 0) return KickEx(playerid);
	//SetTimerEx("SetPlayerSpawn", 350, false, "i", playerid);
	SetPlayerSpawn(playerid);
	return 1;
}

public SetPlayerSpawn(playerid)
{
	SetSpawnInfo(playerid, NO_TEAM, PlayerInfo[playerid][pSkin], PlayerInfo[playerid][pPositionX], PlayerInfo[playerid][pPositionY], PlayerInfo[playerid][pPositionZ], PlayerInfo[playerid][pFacingAngle], 0, 0, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	return 1;
}

public OnPlayerConnect(playerid)
{
    if(IsPlayerNPC(playerid))
    {
    	KickEx(playerid);
    	return print("An NPC tried to connect to server. It was kicked.");
    }	
	ResetPlayerWeapons(playerid);
	SetPVarInt(playerid, "SafeMode", 1);
    TogglePlayerSpectating(playerid, true);
    SetPlayerColor(playerid, COLOR_BLACK);

    new count = 0, string[32];
    foreach(new i: Player)
    {
        count++;
    }
    format(string, sizeof(string), "Players Online: %d", count);
    TextDrawSetString(Login7, string);

    for(new i; ePlayerData:i < ePlayerData; i++)
	{
	    PlayerInfo[playerid][ePlayerData:i] = 0;
	}

	for (new s=0; s < MAX_PLAYEROWNED_VEHICLES; s++)
 	{
	 	for (new i; ePlayerVehicleData:i < ePlayerVehicleData; i++)
	 	{
	 	    PlayerVehicleInfo[playerid][s][ePlayerVehicleData:i] = 0;
	 	}
 	}
	pCurrentWeapon[playerid] = 0; gLastCar[playerid] = INVALID_VEHICLE_ID; PlayerInfo[playerid][pWounded] = PLAYER_ALIVE;
	LicenseTestAC[playerid] = 0; PlayerCall[playerid] = 0; CallingTo[playerid] = INVALID_PLAYER_ID;
	PhoneState[playerid] = 0; nTimeLeft[playerid] = 0; rTimeLeft[playerid] = 0; gLoginAttempts[playerid] = 0;
	WaypointEditing[playerid] = 0; WaypointEditOption[playerid] = 0; CurrentDialog[playerid] = 0;
	SpectatingPlayer[playerid] = INVALID_PLAYER_ID; SpectatingAdmin[playerid] = INVALID_PLAYER_ID; LastKiller[playerid] = INVALID_PLAYER_ID;
	HitmanTarget[playerid] = INVALID_PLAYER_ID;	gPlayerAnimLibsPreloaded[playerid] = 0; WeaponDamage[playerid] = 0.0;
	DeletePVar(playerid, "shW"); DeletePVar(playerid, "abW"); SetPVarInt(playerid, "gPlayerLogged", 0);
	SetPVarInt(playerid, "FriskingPlayer", INVALID_PLAYER_ID); SetPVarInt(playerid, "FriskedBy", INVALID_PLAYER_ID);
	DeletePVar(playerid, "AdminDuty"); DeletePVar(playerid, "pPreGodHealth"); DeletePVar(playerid, "pPreGodArmor");
	SetPlayerHealth(playerid, 100); SetPlayerArmour(playerid, 0);

	JailTimerTD[playerid] = CreatePlayerTextDraw(playerid, 255, 20, "Time Remaining~n~  - Seconds");
	PlayerTextDrawFont(playerid, JailTimerTD[playerid], 1);
	PlayerTextDrawLetterSize(playerid, JailTimerTD[playerid], 0.570000, 1.799999);
	PlayerTextDrawColor(playerid, JailTimerTD[playerid], COLOR_WHITE);
	PlayerTextDrawSetOutline(playerid, JailTimerTD[playerid], true);
	PlayerTextDrawSetProportional(playerid, JailTimerTD[playerid] , true);
	PlayerTextDrawSetShadow(playerid, JailTimerTD[playerid] , 1);

	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SAWNOFF_SHOTGUN, 1);

	// Sprunk global removal
	RemoveBuildingForPlayer(playerid, 955, 0, 0, 0, 50000);
 	RemoveBuildingForPlayer(playerid, 956, 0, 0, 0, 50000);
    RemoveBuildingForPlayer(playerid, 1209, 0, 0, 0, 50000);
    RemoveBuildingForPlayer(playerid, 1302, 0, 0, 0, 50000);
    RemoveBuildingForPlayer(playerid, 1775, 0, 0, 0, 50000);
    RemoveBuildingForPlayer(playerid, 1776, 0, 0, 0, 50000);

	GetPlayerName(playerid, PlayerInfo[playerid][pUsername], MAX_PLAYER_NAME);
	GetPlayerIp(playerid, PlayerInfo[playerid][pIpAddress], 16);
	mysql_format(mConnectionHandle, PlayerInfo[playerid][pUsername], MAX_PLAYER_NAME, "%e", PlayerInfo[playerid][pUsername]);
	SendClientMessageEx(playerid, COLOR_WHITE, "SERVER: Welcome to "SERVER_NAME".");
	SetTimerEx("OnPlayerConnected", 1000, false, "i", playerid);
	return 1;
}

public OnPlayerConnected(playerid)
{
	if(!IsPlayerConnected(playerid)) return 1;

    for(new i=0; i < 20; i++) SendClientMessageEx(playerid, COLOR_WHITE, "");

	ShowIntroTextDraws(playerid);
	SetPlayerCameraPos(playerid, 1758.4740,1447.7784,21.8575);
	SetPlayerCameraLookAt(playerid, 1692.3413, 1451.1672, 10.7649);

 	SetPlayerTime(playerid, WorldTime[0], WorldTime[1]);

	new szQuery[128];
	format(szQuery, sizeof(szQuery), "SELECT * FROM `bans` WHERE `IP_Address` = '%s' LIMIT 0, 1", GetPlayerIpAddress(playerid));
	mysql_tqueryof(szQuery, THREAD_IP_LOOKUP, playerid, mConnectionHandle);
	return 1;
}

public OnPlayerModelSelection(playerid, response, listid, modelid)
{
	if(listid == buyable)
	{
		if(!response) return SendClientMessageEx(playerid, COLOR_WHITE, "Cancelled vehicle selection.");
		if(IsAVIPCar(modelid) && !IsPlayerVIP(playerid)) return SendClientMessageEx(playerid, COLOR_YELLOW, "This is a VIP vehicle. Please donate to get acess to buy this vehicle.");
		new s = GetAvailableVehicleSlot(playerid), string[128];
		if(PlayerInfo[playerid][pMoney] < GetVehiclePrice(modelid)) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have enough money to purchase this car.");
		else if(s == INVALID_SLOT_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have any vehicle slots available for this car.");
		PlayerVehicleInfo[playerid][s][pvModelId] = modelid;
		GivePlayerCash(playerid, GetVehiclePrice(modelid));
		GetPlayerPos(playerid, PlayerInfo[playerid][pPositionX], PlayerInfo[playerid][pPositionY], PlayerInfo[playerid][pPositionZ]);
		GetPlayerFacingAngle(playerid, PlayerInfo[playerid][pFacingAngle]);
		PlayerVehicleInfo[playerid][s][pvPosition][0] = PlayerInfo[playerid][pPositionX];
		PlayerVehicleInfo[playerid][s][pvPosition][1] = PlayerInfo[playerid][pPositionY];
		PlayerVehicleInfo[playerid][s][pvPosition][2] = PlayerInfo[playerid][pPositionZ];
		PlayerVehicleInfo[playerid][s][pvPosition][3] = PlayerInfo[playerid][pFacingAngle];
		for (new m=0; m < MAX_VEHICLE_MODS; m++) PlayerVehicleInfo[playerid][s][pvModifications][m] = 0;
		PlayerVehicleInfo[playerid][s][pvHandleId] = CreateVehicleEx(PlayerVehicleInfo[playerid][s][pvModelId], PlayerVehicleInfo[playerid][s][pvPosition][0], PlayerVehicleInfo[playerid][s][pvPosition][1], PlayerVehicleInfo[playerid][s][pvPosition][2], PlayerVehicleInfo[playerid][s][pvPosition][3], PlayerVehicleInfo[playerid][s][pvCarColor][0], PlayerVehicleInfo[playerid][s][pvCarColor][1], VEHICLE_RESPAWN);
		VehicleInfo[PlayerVehicleInfo[playerid][s][pvHandleId]][vLocked] = 0;
		PutPlayerInVehicle(playerid, PlayerVehicleInfo[playerid][s][pvHandleId], 0);
		format(string, sizeof(string), "You have purchased a %s for $%d, it has been added into your inventory.", GetVehicleName(modelid), GetVehiclePrice(modelid));
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		MySQL_Save_Player_Vehicle(playerid, s);
		return 1;
	}
	return 1;
}

stock IsPlayerVIP(playerid)
{
	return PlayerInfo[playerid][pVIP] > 1;
}
stock ShowBuyableCars(playerid)
{
	ShowModelSelectionMenu(playerid, buyable, "Vehicles");
	SelectTextDraw(playerid, 0xACCBF1FF);
	return 1;
}

stock GetVehiclePrice(model)
{
	for(new i = 0; i < sizeof(CarsPrices); i++)
	{
		if(model == CarsPrices[i][dCarModel])
			return CarsPrices[i][dCarPrice];
	}
	return 0;
}

stock IsAVIPCar(vehicleid)
{
	new model = GetVehicleModel(vehicleid);
	for(new i = 0; i < sizeof(VIPCars); i++)
		if(VIPCars[i][dCarModel] == model)
			return true;
	return false;
}

stock ShowIntroTextDraws(playerid)
{
	TextDrawShowForPlayer(playerid, Login0);
	TextDrawShowForPlayer(playerid, Login1);
	TextDrawShowForPlayer(playerid, Login2);
	TextDrawShowForPlayer(playerid, Login3);
	TextDrawShowForPlayer(playerid, Login4);
	TextDrawShowForPlayer(playerid, Login5);
	TextDrawShowForPlayer(playerid, Login6);
	TextDrawShowForPlayer(playerid, Login7);
}

stock HideIntroTextDraws(playerid)
{
	TextDrawHideForPlayer(playerid, Login0);
	TextDrawHideForPlayer(playerid, Login1);
	TextDrawHideForPlayer(playerid, Login2);
	TextDrawHideForPlayer(playerid, Login3);
	TextDrawHideForPlayer(playerid, Login4);
	TextDrawHideForPlayer(playerid, Login5);
	TextDrawHideForPlayer(playerid, Login6);
	TextDrawHideForPlayer(playerid, Login7);
}

public OnQueryFinish(query[], resultid, extraid)
{
	new rowCount;
	cache_get_row_count(rowCount);
	switch (resultid)
	{
	    case THREAD_IP_LOOKUP:
	    {
	        new szQuery[128];
	        if(rowCount > 0)
	        {
	            new
	                szString[512],
	                szValue[65],
	                bUsername[MAX_PLAYER_NAME],
	                bReason[64],
	                bExpiryDate,
	                bType;

				cache_get_value_name(0, "Username", bUsername,MAX_PLAYER_NAME);
				cache_get_value_name(0, "Reason", bReason,64);
				cache_get_value_name(0, "Expiry_Date", szValue); bExpiryDate = strval(szValue);
				cache_get_value_name(0, "Ban_Type", szValue); bType = strval(szValue);

				if(gettime() - bExpiryDate > 0 && bType == BAN_TEMPORARY)
				{
				    SendClientMessageEx(extraid, COLOR_WHITE, "Your ban date has passed and you have been unbanned from the server.");
					format(szString, sizeof(szString), "DELETE FROM `bans` WHERE `IP_Address` = '%s'", GetPlayerIpAddress(extraid));
					mysql_tqueryof(szString, THREAD_LOG_RESULT, extraid, mConnectionHandle);
					format(szString, sizeof(szString), "UPDATE `accounts` SET `Banned` = '0' WHERE `Username` = '%s'", bUsername);
					mysql_tqueryof(szString, THREAD_LOG_RESULT, extraid, mConnectionHandle);
					format(szString, sizeof(szString), "SELECT * FROM `accounts` WHERE `Username` = '%s' LIMIT 0, 1", PlayerInfo[extraid][pUsername]);
					mysql_tqueryof(szString, THREAD_ACCOUNT_LOOKUP, extraid, mConnectionHandle);
				}
				else
				{
				   	format(szString, sizeof(szString), "{FFFFFF}Your IP address has been banned from %s, ban information below:\n{FFD700}IP:{FFFFFF} %s\n{FFD700}Username:{FFFFFF} %s\n{FFD700}Reason:{FFFFFF} %s\n{FFD700}Expiry Date:{FFFFFF} %s\n{FFD700}Type of Ban:{FFFFFF} %s", SERVER_NAME, GetPlayerIpAddress(extraid), bUsername, bReason, gettimestamp(bExpiryDate, 3), GetBanType(bType));
					ShowPlayerDialogEx(extraid, 0, DIALOG_STYLE_MSGBOX, "{FFFFFF}"SERVER_NAME" - Ban Information", szString, "Close", "");
					KickEx(extraid);
    		    }
			}
	        else
	        {
				format(szQuery, sizeof(szQuery), "SELECT * FROM `accounts` WHERE `Username` = '%s' LIMIT 0, 1", PlayerInfo[extraid][pUsername]);
				mysql_tqueryof(szQuery, THREAD_ACCOUNT_LOOKUP, extraid, mConnectionHandle);
	        }
	    }

	    case THREAD_ACCOUNT_LOOKUP:
	    {
	        new szValue[256];
	        if(rowCount > 0)
	        {
                cache_get_value_name(0, "Password", PlayerInfo[extraid][pPassword], 129);
               	LoadPlayerAccount(extraid);
	        	if(!IsRPName(extraid))
				{
				    SendClientMessageEx(extraid, COLOR_YELLOW, "Your account has been suspended. Please contact an administrator for more information.");
				    KickEx(extraid);
				}
               	format(szValue, sizeof(szValue), "{FFFFFF}Hello %s, this account appears to be {FF0000}registered!\n{FFFFFF}Please type in the correct password to access this account:", PlayerInfo[extraid][pUsername]);
	            ShowPlayerDialogEx(extraid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, SERVER_NAME" - Login", szValue, "Login", "Exit");
	        }
			else
			{
	        	if(!IsRPName(extraid))
				{
				    SendClientMessageEx(extraid, COLOR_YELLOW, "You have joined the server with an invalid roleplay name.");
				    SendClientMessageEx(extraid, COLOR_YELLOW, "Please choose a valid name such as: John_Doe.");
				    KickEx(extraid);
				}
				else
				{
					format(szValue, sizeof(szValue), "{FFFFFF}Hello %s, this account appears to be {00FF1E}available!\n{FFFFFF}Please type in a valid password to register this account:", PlayerInfo[extraid][pUsername]);
		            ShowPlayerDialogEx(extraid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, SERVER_NAME" - Registration", szValue, "Register", "Exit");
				}
	        }
	    }

	    case THREAD_NO_RESULT:
		{

		}

		case THREAD_LOG_RESULT:
		{
		    printf("(MySQL) Query: %s | ResultID: %d ", query, resultid);
		}

	    case THREAD_ACCOUNT_REGISTER:
	    {
	        new szQuery[128];
	        PlayerInfo[extraid][pId] = cache_insert_id();
			format(szQuery, sizeof(szQuery), "SELECT * FROM `accounts` WHERE `Username` = '%s' LIMIT 0, 1", PlayerInfo[extraid][pUsername]);
	        mysql_tqueryof(szQuery, THREAD_REGISTER_SPAWN, extraid, mConnectionHandle);
	    }

		case THREAD_REGISTER_SPAWN:
		{
		    HideIntroTextDraws(extraid);
			LoadPlayerAccount(extraid);
	        ShowPlayerDialogEx(extraid, DIALOG_GENDER, DIALOG_STYLE_LIST, "{FFFFFF}Character Customization - Gender", "{FFFFFF}Male\n{FF8CBC}Female", "Select", "Exit");
		}

	}
}
public OnQueryError(errorid, const error[], const callback[], const query[], MySQL:handle)
{
	if(errorid == ER_SYNTAX_ERROR)
	{
	    printf("You have an error in your SQL syntax; %s", query);
	}
	else
	{
	    printf("There was an error executing the following query, (%d) %s was returned by query: (%s)", errorid, error, query);
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////

CMD:id(playerid, params[])
{
	if(sscanf(params, "{u}")) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /id <playerid/name>");
	new string[128];
	if(IsNumeric(params) && IsPlayerConnectedEx(strval(params)))
	{
        format(string, sizeof(string), "(ID: %i) - (Name: %s) - (Level: %i) - (Ping: %i)", strval(params), GetPlayerNameEx(strval(params)), PlayerInfo[strval(params)][pLevel], GetPlayerPing(strval(params)));
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	else if(strlen(params) < 3) return SendClientMessageEx(playerid, COLOR_GREY, "You must enter at least three characters to search for a player.");
	else
	{
        foreach(new i: Player)
        {
            if(strfind(PlayerInfo[i][pUsername], params, true) != -1)
            {
                format(string, sizeof(string), "(ID: %i) - (Name: %s) - (Level: %i) - (Ping: %i)", i, GetPlayerNameEx(i), PlayerInfo[i][pLevel], GetPlayerPing(i));
				SendClientMessageEx(playerid, COLOR_WHITE, string);
			}
        }
	}
	return 1;
}


CMD:setfuel(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
	    new fuelamount, string[128];
		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be inside a vehicle to use this command.");
		else if(sscanf(params, "i", fuelamount)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /setfuel <amount>");
		VehicleInfo[GetPlayerVehicleID(playerid)][vFuel] = fuelamount;
		format(string, sizeof(string), "You have set your car's fuel level to %d.", fuelamount);
	    SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	return 1;
}

CMD:paintjob(playerid, params[])
{
	new paintjob, string[128];
    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not driving a vehicle.");
	else if(PlayerInfo[playerid][pSprayCan] == 0 && !IsAdmin(playerid, ADMIN_LEVEL_TWO)) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have a spraycan.");
    else if(sscanf(params, "i", paintjob)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /paintjob [id: 0-3]");
	else if(paintjob < 0 || paintjob > 3) return SendClientMessageEx(playerid, COLOR_GREY, "You must enter a valid id between 0-3.");
	new
	    vehicleid = GetPlayerVehicleID(playerid);
	for(new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
    {
        if(vehicleid == PlayerVehicleInfo[playerid][i][pvHandleId])
		{
		    PlayerVehicleInfo[playerid][i][pvPaintJob] = paintjob;
		    MySQL_Save_Player_Vehicle(playerid, i);
		    break;
		}
	}
	format(string, sizeof(string), "You have changed your vehicle's paintjob changed to: %i.", paintjob);
    SendClientMessageEx(playerid, COLOR_WHITE, string);
    ChangeVehiclePaintjob(vehicleid, paintjob);
    PlayerInfo[playerid][pSprayCan] = IsAdmin(playerid, ADMIN_LEVEL_TWO) ? PlayerInfo[playerid][pSprayCan] : PlayerInfo[playerid][pSprayCan] - 1;
    return 1;
}

CMD:colorcar(playerid, params[])
{
	new color[2], string[128];
    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not driving a vehicle.");
	else if(PlayerInfo[playerid][pSprayCan] == 0 && !IsAdmin(playerid, ADMIN_LEVEL_TWO)) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have a spraycan.");
    else if(sscanf(params, "ii", color[0], color[1])) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /colorcar [colorid] [colorid]");
	else if(color[0] < 0 || color[0] > 255 || color[1] < 0 || color[1] > 255) return SendClientMessageEx(playerid, COLOR_GREY, "You must enter a valid color id between 0-255.");
	new
	    vehicleid = GetPlayerVehicleID(playerid);
	for(new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
    {
        if(vehicleid == PlayerVehicleInfo[playerid][i][pvHandleId])
		{
		    PlayerVehicleInfo[playerid][i][pvCarColor][0] = color[0];
		    PlayerVehicleInfo[playerid][i][pvCarColor][1] = color[1];
		    MySQL_Save_Player_Vehicle(playerid, i);
		    break;
		}
	}
	format(string, sizeof(string), "You have changed your vehicle colors changed to: %i and %i.", color[0], color[1]);
    SendClientMessageEx(playerid, COLOR_WHITE, string);
    ChangeVehicleColor(vehicleid, color[0], color[1]);
    PlayerInfo[playerid][pSprayCan] = IsAdmin(playerid, ADMIN_LEVEL_TWO) ? PlayerInfo[playerid][pSprayCan] : PlayerInfo[playerid][pSprayCan] - 1;
    return 1;
}

CMD:respawnvehicles(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_FOUR))
	{
	    for(new i=1; i<MAX_VEHICLES; i++)
		{
			if(IsVehicleOccupied(i) == 0)
			{
	    		SetVehicleToRespawn(i);
			}
		}
		SendClientMessageToAllEx(COLOR_GREY, "All unoccupied vehicles have been respawned.");
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	}
	return 1;
}


CMD:hallmenu(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 2.0, 362.305, 173.687, 1008.382))
	{
	    ShowPlayerDialogEx(playerid, DIALOG_CITY_HALL_MENU, DIALOG_STYLE_LIST, "Citizenship Properties", "Change Name", "Select", "Cancel");
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "You are not at the City Hall.");
	}
	return 1;
}

CMD:buy(playerid, params[])
{
	if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this at this time.");
	if(GetPlayerInterior(playerid) > 0)
	{
		switch (GetBusinessType(GetPlayerBusiness(playerid)))
		{
		    case BUSINESS_TYPE_STORE:
		    {
		    	ShowPlayerDialogEx(playerid, DIALOG_STORE_BUY, DIALOG_STYLE_LIST, "Store Items","Cellphone ($90)\r\nWalkie Talkie ($220)\r\nSpraycan (x10) ($70)\r\nBaseball Bat ($85)\r\nGas Can ($100)", "Purchase", "Cancel");
		    }
		    case BUSINESS_TYPE_CLOTHING:
		    {
		    	ShowPlayerDialogEx(playerid, DIALOG_CLOTHES_BUY, DIALOG_STYLE_INPUT, "Clothes", "Welcome to Binco!\nPlease enter a skin id in the field below to purchase it!\nA skin change costs $250.", "Purchase", "Cancel");
		    }
		    case BUSINESS_TYPE_CLUB:
		    {
	    		ShowPlayerDialogEx(playerid, DIALOG_CLUB_BUY, DIALOG_STYLE_LIST, "Drinks", "Beer ($15)\r\nWine ($23)\r\nSprunk ($6)", "Purchase", "Cancel");
		    }
		    case BUSINESS_TYPE_SEXSTORE:
		    {
	    		ShowPlayerDialogEx(playerid, DIALOG_SEXSTORE_BUY, DIALOG_STYLE_LIST, "Sex Toys", "Double-End Dildo ($200)\r\nDildo ($100)\r\nVibrator ($125)\r\nSilver Vibrator ($300)", "Purchase", "Cancel");
		    }
		    case BUSINESS_TYPE_PIZZA:
		    {

		    }
		    case BUSINESS_TYPE_DONUTS:
		    {

		    }
		    case BUSINESS_TYPE_AMMUNATION:
		    {
		        if(PlayerInfo[playerid][pGunLicense] == 1) ShowPlayerDialogEx(playerid, DIALOG_AMMUNATION_BUY, DIALOG_STYLE_LIST, "Ammunation - Weapons", "Colt-45 ($150)\r\nShotgun ($350)\r\nRifle ($400)\r\nShovel ($50)\r\nKevlar Vest ($1500)", "Purchase", "Cancel");
				else SendClientMessageEx(playerid, COLOR_GREY, "You must own a gun license to purchase weapons from this store.");
			}
		    case BUSINESS_TYPE_BURGERSHOT:
		    {

		    }
		    case BUSINESS_TYPE_CLUCKINGBELL:
		    {

		    }
		}
	}
	return 1;
}

public OnPlayerCommandReceived(playerid, cmdtext[])
{
	if(GetPVarInt(playerid, "gPlayerLogged") == 0 || !IsPlayerConnected(playerid)) return 0;
	if(PlayerInfo[playerid][pTutorial] == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "You cannot submit commands whilst being in the registration process.");
		return 0;
	}
	printf("[ZCMD]: %s issued server command (%s)", PlayerInfo[playerid][pUsername], cmdtext);
	return 1;
}


public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
	if(!success) return SendClientMessageEx(playerid, COLOR_WHITE, "You have entered an invalid command, please type /help for a list of valid commands.");

	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(CurrentDialog[playerid] != dialogid && DIALOG_SPOOF_PROTECTION == true)//Dialog Spoofing
	{
	    printf("[DIALOG]: %s may have attempted to spoof dialog id %d.", PlayerInfo[playerid][pUsername], dialogid);
	    return KickEx(playerid); // no time for spoofers
	}

	switch(dialogid)
	{
	    case DIALOG_REGISTER:
	    {
	    	new szQuery[256];

			if(!response) return KickEx(playerid);
			else if(strlen(inputtext) < 4 || strlen(inputtext) > 32)
			{
				SendClientMessageEx(playerid, COLOR_WHITE, "Please enter a valid password that is over 4 characters and under 32.");
				format(szQuery, sizeof(szQuery), "Welcome to %s!\nPlease enter a password to register the selected account.", SERVER_NAME);
				return ShowPlayerDialogEx(playerid, 1001, DIALOG_STYLE_PASSWORD, "Registration", szQuery, "Register", "Cancel");
			}
			WP_Hash(PlayerInfo[playerid][pPassword], 129, inputtext);
			format(szQuery, sizeof(szQuery), "INSERT INTO `accounts` (`Username`, `Password`) VALUES ('%s', '%s')", PlayerInfo[playerid][pUsername], PlayerInfo[playerid][pPassword]);
			mysql_tqueryof(szQuery, THREAD_ACCOUNT_REGISTER, playerid, mConnectionHandle);
			//printf("[MySQL]: A new row was inserted into `accounts` (`%s`, `%s`)\n", PlayerInfo[playerid][pUsername], inputtext);
			SetPVarInt(playerid, "gPlayerLogged", 1);
	    }

	    case DIALOG_LOGIN:
	    {
	    	new szString[256];

			if(!response) return KickEx(playerid);
			WP_Hash(szString, sizeof(szString), inputtext);
			if(!strcmp(szString, PlayerInfo[playerid][pPassword], true, 129))
			{

			    if(PlayerInfo[playerid][pBanned])
			    {
			        SendClientMessageEx(playerid, COLOR_YELLOW, "This account is currently banned from the server, please post a ban appeal on the forums ("SERVER_SITE")");
			        return KickEx(playerid);
			    }
			    SetPVarInt(playerid, "gPlayerLogged", 1);
			    SendClientMessageEx(playerid, COLOR_WHITE, "SERVER: Welcome to "SERVER_NAME".");
		    	HideIntroTextDraws(playerid);

			    if(PlayerInfo[playerid][pTutorial] == 0)
			    {
			    	SendClientMessageEx(playerid, COLOR_WHITE, "It appears that you have not yet finished the character customization yet, redirecting you to it...");
	        		ShowPlayerDialogEx(playerid, DIALOG_GENDER, DIALOG_STYLE_LIST, "{FFFFFF}Character Customization - Gender", "{2B99C4}Male\n{FF8CBC}Female", "Select", "Exit");
			    }
			    else
			    {
			    	SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
			    	SetPlayerToTeamColor(playerid);
					TogglePlayerSpectating(playerid, false);
    				//SetTimerEx("SetPlayerSpawn", 350, false, "i", playerid);
    				SetPlayerSpawn(playerid);
			    }
			}
			else
			{
			    if(MAX_LOGIN_ATTEMPTS - ++gLoginAttempts[playerid] == 0)
			    {
			    	SendClientMessageEx(playerid, COLOR_WHITE, "You have been kicked for exceeding the maximum amount of login attempts.");
					return KickEx(playerid);
			    }
   				format(szString, sizeof(szString), "{FFFFFF}Hello %s, this account appears to be {FF0000}registered!\n{FFFFFF}Please type in the correct password to access this account:", GetPlayerNameEx(playerid));
	            ShowPlayerDialogEx(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Roleplay - Login", szString, "Login", "Exit");
   				format(szString, sizeof(szString), "You have entered an invalid password, you have %d attempts left.", MAX_LOGIN_ATTEMPTS - gLoginAttempts[playerid]);
			    SendClientMessageEx(playerid, COLOR_WHITE, szString);
			}
	    }

		case DIALOG_GENDER:
		{
		    if(!response) return KickEx(playerid);

			new szString[256], buffer[4];

			switch (listitem)
			{
				case 0: { PlayerInfo[playerid][pGender] = 1; SendClientMessageEx(playerid, COLOR_WHITE, "Alright, so your character's gender is Male. How old is your character going to be?"); }
			    case 1: { PlayerInfo[playerid][pGender] = 2; SendClientMessageEx(playerid, COLOR_WHITE, "Alright, so your character's gender is Female. How old is your character going to be?"); }
			    default: { return KickEx(playerid); }
			}
			for (new i=18; i <= 80; i++)
			{
			    format(buffer, 4, "%d\n", i);
			    strcat(szString, buffer);
			}
			ShowPlayerDialogEx(playerid, DIALOG_AGE, DIALOG_STYLE_LIST, "{FFFFFF}Character Customization - Age", szString, "Submit", "Exit");
		}
		case DIALOG_DELETE_CAR:
		{
		    if(!response) return 0;
		    else if(PlayerVehicleInfo[playerid][listitem][pvModelId] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot delete the car in that slot because it is empty.");

			VehicleInfo[PlayerVehicleInfo[playerid][listitem][pvHandleId]][vLocked] = 0;
			DestroyVehicle(PlayerVehicleInfo[playerid][listitem][pvHandleId]);
		 	for (new i; ePlayerVehicleData:i < ePlayerVehicleData; i++)
		 	{
    			PlayerVehicleInfo[playerid][listitem][ePlayerVehicleData:i] = 0;
		 	}
		 	SendClientMessageEx(playerid, COLOR_GREY, "You have successfully deleted your vehicle in the specified slot.");
			MySQL_Save_Player_Vehicle(playerid, listitem);
		}

		case DIALOG_UNMODCAR:
		{
		    new
		        vehid = GetPlayerVehicleID(playerid);
		    if(!response || vehid == 0) return 0;
		    else if(listitem < 0 || listitem >= MAX_VEHICLE_MODS) return 0;
		    for (new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
		    {
		        if(PlayerVehicleInfo[playerid][i][pvHandleId] == vehid)
		        {
		            if(PlayerVehicleInfo[playerid][i][pvModifications][listitem] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "There is no modification in this vehicle slot.");
					RemoveVehicleComponent(vehid, PlayerVehicleInfo[playerid][i][pvModifications][listitem]);
					PlayerVehicleInfo[playerid][i][pvModifications][listitem] = 0;
					MySQL_Save_Player_Vehicle(playerid, i);
		 			SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully removed the modification in the specified slot.");
		            return 1;
		        }
		    }
		}

		case DIALOG_DMV_IMPOUND:
		{
		    if(!response) return 0;
		    else if(PlayerVehicleInfo[playerid][listitem][pvModelId] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot select the car in that slot because it is empty.");
			new
			    string[128];
		    if(PlayerVehicleInfo[playerid][listitem][pvImpounded] == 1)
			{
                if(PlayerInfo[playerid][pMoney] < 1000) return SendClientMessageEx(playerid, COLOR_WHITE, "You cannot afford to pay the total sum of $1,000.");
                PlayerVehicleInfo[playerid][listitem][pvImpounded] = 0;
				GivePlayerCash(playerid, -1000);
			    AddVaultMoney(1, 1000);
				format(string, sizeof(string), "You have released your %s from the impound for $1,000.", VehicleNames[PlayerVehicleInfo[playerid][listitem][pvModelId] - 400]);
	    	    PlayerVehicleInfo[playerid][listitem][pvHandleId] = CreateVehicleEx(PlayerVehicleInfo[playerid][listitem][pvModelId], PlayerVehicleInfo[playerid][listitem][pvPosition][0], PlayerVehicleInfo[playerid][listitem][pvPosition][1], PlayerVehicleInfo[playerid][listitem][pvPosition][2], PlayerVehicleInfo[playerid][listitem][pvPosition][3], PlayerVehicleInfo[playerid][listitem][pvCarColor][0], PlayerVehicleInfo[playerid][listitem][pvCarColor][1], VEHICLE_RESPAWN);
                ReloadVehicleMods(playerid, listitem);
				VehicleInfo[PlayerVehicleInfo[playerid][listitem][pvHandleId]][vLocked] = PlayerVehicleInfo[playerid][listitem][pvLocked];
			}
			else if(PlayerVehicleInfo[playerid][listitem][pvTicketPrice] > 0)
			{
                if(PlayerInfo[playerid][pMoney] < PlayerVehicleInfo[playerid][listitem][pvTicketPrice]) return SendClientMessageEx(playerid, COLOR_WHITE, "You cannot afford to pay the total sum of tickets.");
				AddVaultMoney(1, PlayerVehicleInfo[playerid][listitem][pvTicketPrice]);
				GivePlayerCash(playerid, -PlayerVehicleInfo[playerid][listitem][pvTicketPrice]);
		        format(string, sizeof(string), "You have paid the total amount of $%d in tickets for your vehicle.", PlayerVehicleInfo[playerid][listitem][pvTicketPrice]);
                PlayerVehicleInfo[playerid][listitem][pvTicketPrice] = 0;
			} else {
			    format(string, sizeof(string), "No legal notices are bound to this vehicle, it may be legally driven without hassle.");
			}
		 	SendClientMessageEx(playerid, COLOR_WHITE, string);
			MySQL_Save_Player_Vehicle(playerid, listitem);
		}

		case DIALOG_TRACK_CAR:
		{
		    if(!response) return 0;
		    else if(PlayerVehicleInfo[playerid][listitem][pvModelId] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot track the car in that slot because it is empty.");
			else if(HasActiveCheckpoint(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You already have an existing checkpoint, type /killcheckpoint to delete it.");
		    else if(PlayerVehicleInfo[playerid][listitem][pvImpounded]) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot track the car in that slot because it is impounded.");
			new
			    Float:tmpFloats[3];
			GetVehiclePos(PlayerVehicleInfo[playerid][listitem][pvHandleId], tmpFloats[0], tmpFloats[1], tmpFloats[2]);
			SetPlayerCheckpoint(playerid, tmpFloats[0], tmpFloats[1], tmpFloats[2], 5.0);
			SetPVarInt(playerid, "TrackingCar", 1);
			SendClientMessageEx(playerid, COLOR_WHITE, "Hint: Make your way to the checkpoint to find your vehicle.");
		}

		case DIALOG_TELEPORT_CAR:
		{
		    if(!response) return 0;
		    else if(!IsPlayerConnectedEx(GetPVarInt(playerid, "PlayerCarId")) || PlayerVehicleInfo[GetPVarInt(playerid, "PlayerCarId")][listitem][pvHandleId] == 0) return 0;
		    else if(PlayerVehicleInfo[GetPVarInt(playerid, "PlayerCarId")][listitem][pvHandleId] == 0 || !IsValidVehicle(PlayerVehicleInfo[GetPVarInt(playerid, "PlayerCarId")][listitem][pvHandleId])) return 0;
			new
			    Float:tmpFloats[3],
				targetid = GetPVarInt(playerid, "PlayerCarId");
			GetVehiclePos(PlayerVehicleInfo[targetid][listitem][pvHandleId], tmpFloats[0], tmpFloats[1], tmpFloats[2]);
			SetPlayerPosEx(playerid, tmpFloats[0], tmpFloats[1], tmpFloats[2]);
			SendClientMessageEx(playerid, COLOR_FADE1, "You have been teleported to the specified player's vehicle.");
			DeletePVar(playerid, "PlayerCarId");
		}

		case DIALOG_BRING_CAR:
		{
		    if(!response) return 0;
		    else if(!IsPlayerConnectedEx(GetPVarInt(playerid, "PlayerCarId")) || PlayerVehicleInfo[GetPVarInt(playerid, "PlayerCarId")][listitem][pvHandleId] == 0) return 0;
		    else if(PlayerVehicleInfo[GetPVarInt(playerid, "PlayerCarId")][listitem][pvHandleId] == 0 || !IsValidVehicle(PlayerVehicleInfo[GetPVarInt(playerid, "PlayerCarId")][listitem][pvHandleId])) return 0;
			new
			    Float:tmpFloats[4],
				targetid = GetPVarInt(playerid, "PlayerCarId"),
				i = PlayerVehicleInfo[targetid][listitem][pvHandleId];
			GetPlayerPos(playerid, tmpFloats[0], tmpFloats[1], tmpFloats[2]);
			GetPlayerFacingAngle(playerid, tmpFloats[3]);
			SetVehiclePos(i, tmpFloats[0], tmpFloats[1], tmpFloats[2]);
			SetVehicleZAngle(i, tmpFloats[3]);
			PutPlayerInVehicle(playerid, i, 0);
   			SetVehicleParamsEx(i, VehicleInfo[i][vEngine], VehicleInfo[i][vLights], VehicleInfo[i][vAlarm], VehicleInfo[i][vDoors], VehicleInfo[i][vBonnet], VehicleInfo[i][vBoot], VehicleInfo[i][vObjective]);
			SendClientMessageEx(playerid, COLOR_FADE1, "You have been teleported to the specified player's vehicle.");
			DeletePVar(playerid, "PlayerCarId");
		}

		case DIALOG_AGE:
		{
			if(!response || (listitem < 0 || listitem > 80))
				return KickEx(playerid);

			PlayerInfo[playerid][pAge] = 18 + listitem;
		    new
		        string[128];
			format(string, sizeof(string), "Your character is aged %d years old, what do you look like?", 18 + listitem);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

			ShowPlayerDialogEx(playerid, DIALOG_SETSKIN, DIALOG_STYLE_INPUT, "{FFFFFF}Character Customization - Clothes", "{FFFFFF}Please enter a valid skin id between 0-299 (or press cancel to randomize it):", "Enter", "Cancel");
		}

		case DIALOG_CHANGE_PASSWORD:
		{
		    new string[256];
			if(!response) return 0;
			else if(strlen(inputtext) < 4 || strlen(inputtext) > 32)
			{
				SendClientMessageEx(playerid, COLOR_WHITE, "Please enter a valid password that is over 4 characters and under 32.");
				return ShowPlayerDialogEx(playerid, DIALOG_CHANGE_PASSWORD, DIALOG_STYLE_PASSWORD, "Change Password", "You are about to change your password!\nPlease enter a new password to continue:", "Enter", "Cancel");
			}
			format(string, sizeof(string), "%s", PlayerInfo[playerid][pPassword]);
			WP_Hash(PlayerInfo[playerid][pPassword], 129, inputtext);
			if(!strcmp(string, PlayerInfo[playerid][pPassword], true, 129)) return SendClientMessageEx(playerid, COLOR_RED, "There was an internal issue with changing your password. Please contact an administrator.");
			format(string, sizeof(string), "UPDATE `accounts` SET `Password` = '%s' WHERE `Id` = '%d'", PlayerInfo[playerid][pPassword], PlayerInfo[playerid][pId]);
			mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
			format(string, sizeof(string), "You have successfully changed your password to '%s'.", inputtext);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}

		case DIALOG_SETSKIN:
		{
			if(!response || isnull(inputtext) || !IsAValidSkin(strval(inputtext)) || (response && (strval(inputtext) < 0 || strval(inputtext) > 299)))
			{
				PlayerInfo[playerid][pSkin] = GetRandomSkin(playerid);
				SendClientMessageEx(playerid, COLOR_WHITE, "Since you have failed to choose a proper skin, a random skin has been set for your character.");
			}
			else PlayerInfo[playerid][pSkin] = strval(inputtext);
			ShowPlayerDialogEx(playerid, DIALOG_REFERER, DIALOG_STYLE_INPUT, "{FFFFFF}Referral", "Were you referred by another player of IM:RP?", "Yes", "No");
		}

		case DIALOG_REFERER:
		{
		    if(response)
		    {
				if(!IsRPNameText(inputtext) || !strcmp(inputtext, PlayerInfo[playerid][pUsername], true))
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "You have specified an invalid referral name, are you sure that you have entered the name correctly.");
					return ShowPlayerDialogEx(playerid, DIALOG_REFERER, DIALOG_STYLE_INPUT, "{FFFFFF}Referral", "Were you referred by another player of IM:RP?", "Yes", "No");
				}
				new string[128], rname[25];
                mysql_format(mConnectionHandle, string, sizeof(string), "SELECT * FROM `accounts` WHERE `Username` = '%e'", rname);
				mysql_tquery(mConnectionHandle, string, "MySQL_Player_Referral", "isi", playerid, inputtext);
		    }
		    else
		    {
		    	for(new i = 0; i < 20; i++) SendClientMessageEx(playerid, COLOR_WHITE, "");
		    	SendClientMessageEx(playerid, COLOR_ORANGE, "---------------------------------------------------");
	            SetDefaultRegisterStatistics(playerid);
				SendClientMessageEx(playerid, COLOR_ORANGE, "SERVER: Welcome to "SERVER_NAME".");
				SendClientMessageEx(playerid, COLOR_WHITE, "There are many things to do, ranging from applying to a faction to becoming the richest person in "SERVER_MAP".");
				SendClientMessageEx(playerid, COLOR_WHITE, "We believe here that everyone should play legitimately, including our staff members along with others.");
				SendClientMessageEx(playerid, COLOR_WHITE, "You can find out more information about our server on our site (/information), or ask on /newb(ie) for help.");
				SendClientMessageEx(playerid, COLOR_ORANGE, "---------------------------------------------------");
				}
		}

		case DIALOG_WAYPOINT_EDIT:
		{
		    if(!response) return 0;
		    else if(WaypointEditing[playerid] == 0) return 0;

		    new
		        string[256];

		    switch (listitem)
		    {
				case 0:
				{
				    WaypointEditOption[playerid] = 1;
				    format(string, sizeof(string), "{FFFFFF}You are currently editing the title of Waypoint %d.\nCurrent title: %s", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wTextDisplay]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Title", string, "Submit", "Cancel");
				}

				case 1:
				{
				    WaypointEditOption[playerid] = 2;
					format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Entrance Position X.\nCurrent PositionX: %f", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wPosition][0]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Position X", string, "Submit", "Cancel");
				}

				case 2:
				{
				    WaypointEditOption[playerid] = 3;
					format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Entrance Position Y.\nCurrent PositionY: %f", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wPosition][1]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Position Y", string, "Submit", "Cancel");
				}

				case 3:
				{
				    WaypointEditOption[playerid] = 4;
					format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Entrance Position Z.\nCurrent PositionZ: %f", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wPosition][2]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Position Z", string, "Submit", "Cancel");
				}

				case 4:
				{
				    WaypointEditOption[playerid] = 5;
					format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Entrance Interior ID (0-18).\nCurrent Interior ID: %d", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wInterior]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Interior", string, "Submit", "Cancel");
				}

				case 5:
				{
				    WaypointEditOption[playerid] = 6;
					format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Virtual World.\nCurrent Virtual World: %d", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wVirtualWorld]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Virtual World", string, "Submit", "Cancel");
				}

				case 6:
				{
				    WaypointEditOption[playerid] = 7;
					format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Destination Position X.\nCurrent PositionX: %f", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wDestPosition][0]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Position X", string, "Submit", "Cancel");
				}

				case 7:
				{
				    WaypointEditOption[playerid] = 8;
					format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Destination Position Y.\nCurrent PositionY: %f", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wDestPosition][1]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Position Y", string, "Submit", "Cancel");
				}

				case 8:
				{
				    WaypointEditOption[playerid] = 9;
					format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Destination Position Z.\nCurrent PositionZ: %f", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wDestPosition][2]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Position Z", string, "Submit", "Cancel");
				}

				case 9:
				{
				    WaypointEditOption[playerid] = 10;
					format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Destination Interior ID (0-18).\nCurrent Interior ID: %d", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wDestInterior]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Interior", string, "Submit", "Cancel");
				}

				case 10:
				{
				    WaypointEditOption[playerid] = 11;
					format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Destination World.\nCurrent Virtual World: %d", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wDestVirtualWorld]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Virtual World", string, "Submit", "Cancel");
				}

				case 11:
				{
				    WaypointEditOption[playerid] = 12;
					format(string, sizeof(string), "{FFFFFF}You are about to delete Waypoint %d.\nPlease type in 'confirm' to confirm deletion.", WaypointEditing[playerid]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Deletion", string, "Submit", "Cancel");
				}

				case 12:
				{
				    SetPlayerInteriorEx(playerid, WaypointInfo[WaypointEditing[playerid]][wInterior]);
				    SetPlayerVirtualWorldEx(playerid, WaypointInfo[WaypointEditing[playerid]][wVirtualWorld]);
				    SetPlayerPosEx(playerid, WaypointInfo[WaypointEditing[playerid]][wPosition][0], WaypointInfo[WaypointEditing[playerid]][wPosition][1], WaypointInfo[WaypointEditing[playerid]][wPosition][2]);
				}

				case 13:
				{
				    SetPlayerInteriorEx(playerid, WaypointInfo[WaypointEditing[playerid]][wDestInterior]);
				    SetPlayerVirtualWorldEx(playerid, WaypointInfo[WaypointEditing[playerid]][wDestVirtualWorld]);
				    SetPlayerPosEx(playerid, WaypointInfo[WaypointEditing[playerid]][wDestPosition][0], WaypointInfo[WaypointEditing[playerid]][wDestPosition][1], WaypointInfo[WaypointEditing[playerid]][wDestPosition][2]);
				}

				case 14:
				{
		            format(string, sizeof(string), "You have successfully changed Waypoint %d's entrance to your current location.", WaypointEditing[playerid]);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
					GetPlayerFacingAngle(playerid, WaypointInfo[WaypointEditing[playerid]][wFacingAngle]);
					GetPlayerPos(playerid, WaypointInfo[WaypointEditing[playerid]][wPosition][0], WaypointInfo[WaypointEditing[playerid]][wPosition][1], WaypointInfo[WaypointEditing[playerid]][wPosition][2]);
             	 	WaypointInfo[WaypointEditing[playerid]][wInterior] = GetPlayerInterior(playerid);
             	 	WaypointInfo[WaypointEditing[playerid]][wVirtualWorld] = GetPlayerVirtualWorld(playerid);

		            format(string, sizeof(string), "UPDATE `waypoints` SET `wPosX`='%f',`wPosY`='%f',`wPosZ`='%f',`wInterior`='%d',`wVirtualWorld`='%d',", WaypointInfo[WaypointEditing[playerid]][wPosition][0], WaypointInfo[WaypointEditing[playerid]][wPosition][1], WaypointInfo[WaypointEditing[playerid]][wPosition][2], WaypointInfo[WaypointEditing[playerid]][wInterior], WaypointInfo[WaypointEditing[playerid]][wVirtualWorld]);
					format(string, sizeof(string), "%s`wFacingAngle`='%f' WHERE `Id` = '%d'", string, WaypointInfo[WaypointEditing[playerid]][wFacingAngle], WaypointEditing[playerid]);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
                    RecreateWaypointText(WaypointEditing[playerid]);
				}

				case 15:
				{
		            format(string, sizeof(string), "You have successfully changed Waypoint %d's destination to your current location.", WaypointEditing[playerid]);
		            SendClientMessageEx(playerid, COLOR_YELLOW, string);
					GetPlayerFacingAngle(playerid, WaypointInfo[WaypointEditing[playerid]][wDestFacingAngle]);
             	 	GetPlayerPos(playerid, WaypointInfo[WaypointEditing[playerid]][wDestPosition][0], WaypointInfo[WaypointEditing[playerid]][wDestPosition][1], WaypointInfo[WaypointEditing[playerid]][wDestPosition][2]);
                    WaypointInfo[WaypointEditing[playerid]][wDestInterior] = GetPlayerInterior(playerid);
             	 	WaypointInfo[WaypointEditing[playerid]][wDestVirtualWorld] = GetPlayerVirtualWorld(playerid);
					format(string, sizeof(string), "UPDATE `waypoints` SET `dPosX`='%f',`dPosY`='%f',`dPosZ`='%f',`dInterior`='%d',`dVirtualWorld`='%d',", WaypointInfo[WaypointEditing[playerid]][wDestPosition][0], WaypointInfo[WaypointEditing[playerid]][wDestPosition][1], WaypointInfo[WaypointEditing[playerid]][wDestPosition][2], WaypointInfo[WaypointEditing[playerid]][wDestInterior], WaypointInfo[WaypointEditing[playerid]][wDestVirtualWorld]);
					format(string, sizeof(string), "%s`dFacingAngle`='%f' WHERE `Id` = '%d'", string, WaypointInfo[WaypointEditing[playerid]][wDestFacingAngle], WaypointEditing[playerid]);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
				}

				case 16:
				{
				    WaypointEditOption[playerid] = 17;
					format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Entrance Load Time (0-10).\nCurrent Value: %d", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wLoadingTime]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Entrance Loading Time", string, "Submit", "Cancel");
				}

				case 17:
				{
				    WaypointEditOption[playerid] = 18;
					format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Destination Load Time (0-10).\nCurrent Value: %d", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wDestLoadingTime]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Destination Loading Time", string, "Submit", "Cancel");
				}

				case 18:
				{
				    WaypointEditOption[playerid] = 19;
					format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Password (8 max chars).\nCurrent Value: %s", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wPassword]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Password", string, "Submit", "Cancel");
				}

				case 19:
				{
				    if(WaypointInfo[WaypointEditing[playerid]][wLocked] == 1) {
				        SendClientMessageEx(playerid, COLOR_WHITE, "You have unlocked the waypoint, everyone will now be able to access it.");
				        WaypointInfo[WaypointEditing[playerid]][wLocked] = 0;
				    } else {
				        SendClientMessageEx(playerid, COLOR_WHITE, "You have locked the waypoint, no one will now be able to access it.");
				        WaypointInfo[WaypointEditing[playerid]][wLocked] = 1;
				    }
		            format(string, sizeof(string), "UPDATE `waypoints` SET `Locked` = '%d' WHERE `Id` = '%d'", WaypointInfo[WaypointEditing[playerid]][wLocked], WaypointEditing[playerid]);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
				}

				case 20:
				{
				    WaypointEditOption[playerid] = 21;
					format(string, sizeof(string), "{FFFFFF}You are currently restricting Waypoint %d to a faction.\nCurrent Value: %d", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wFactionRestriction]);
				    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Faction Restriction", string, "Submit", "Cancel");
				}
		    }
		}

		case DIALOG_WAYPOINT_SUBMIT:
		{
		    if(!response) return 0;
		    else if(WaypointEditOption[playerid] == 0) return 0;
		    else if(WaypointInfo[WaypointEditing[playerid]][wExistant] == 0) return 0;

		    new
		        string[256],
				i = WaypointEditing[playerid];

		    switch (WaypointEditOption[playerid])
		    {
		        case 1:
		        {
					if(strlen(inputtext) < 5 || strlen(inputtext) > 64)
					{
	    				format(string, sizeof(string), "{FFFFFF}You are currently editing the title of Waypoint %d.\nCurrent title: %s", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wTextDisplay]);
				    	ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Title", string, "Submit", "Cancel");
				    	return 1;
					}
		            new
		                wEscapedText[65];
					mysql_escape_string(inputtext, wEscapedText);
		            format(string, sizeof(string), "You have successfully changed Waypoint %d's title from %s to %s.", i, WaypointInfo[i][wTextDisplay], inputtext);
		            format(WaypointInfo[i][wTextDisplay], 64, "%s", wEscapedText);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `waypoints` SET `TextDisplay` = '%s' WHERE `Id` = '%d'", WaypointInfo[i][wTextDisplay], i);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
                    RecreateWaypointText(i);
					return 1;
		        }

		        case 2:
		        {
		            format(string, sizeof(string), "You have successfully changed Waypoint %d's Position X from %f to %f.", i, WaypointInfo[i][wPosition][0], floatstr(inputtext));
             	 	WaypointInfo[i][wPosition][0] = floatstr(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `waypoints` SET `wPosX` = '%f' WHERE `Id` = '%d'", WaypointInfo[i][wPosition][0], i);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
                    RecreateWaypointText(i);
		        }

		        case 3:
		        {
		            format(string, sizeof(string), "You have successfully changed Waypoint %d's Position Y from %f to %f.", i, WaypointInfo[i][wPosition][1], floatstr(inputtext));
             	 	WaypointInfo[i][wPosition][1] = floatstr(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `waypoints` SET `wPosY` = '%f' WHERE `Id` = '%d'", WaypointInfo[i][wPosition][1], i);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
                    RecreateWaypointText(i);
		        }

		        case 4:
		        {
		            format(string, sizeof(string), "You have successfully changed Waypoint %d's Position Z from %f to %f.", i, WaypointInfo[i][wPosition][2], floatstr(inputtext));
             	 	WaypointInfo[i][wPosition][2] = floatstr(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `waypoints` SET `wPosZ` = '%f' WHERE `Id` = '%d'", WaypointInfo[i][wPosition][2], i);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
                    RecreateWaypointText(i);
		        }

		        case 5:
		        {
		            if(strval(inputtext) < 0 || strval(inputtext) > 18)
		            {
						format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Entrance Interior ID (0-18).\nCurrent Interior ID: %d", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wInterior]);
				    	ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Title", string, "Submit", "Cancel");
		                return 1;
		            }
		            format(string, sizeof(string), "You have successfully changed Waypoint %d's Interior ID from %d to %d.", i, WaypointInfo[i][wInterior], strval(inputtext));
             	 	WaypointInfo[i][wInterior] = strval(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `waypoints` SET `wInterior` = '%d' WHERE `Id` = '%d'", WaypointInfo[i][wInterior], i);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
		        }

		        case 6:
		        {
		        	format(string, sizeof(string), "You have successfully changed Waypoint %d's Virtual World from %d to %d.", i, WaypointInfo[i][wVirtualWorld], strval(inputtext));
             	 	WaypointInfo[i][wVirtualWorld] = strval(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `waypoints` SET `wVirtualWorld` = '%d' WHERE `Id` = '%d'", WaypointInfo[i][wVirtualWorld], i);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
		        }

		        case 7:
		        {
		            format(string, sizeof(string), "You have successfully changed Waypoint %d's Destination X from %f to %f.", i, WaypointInfo[i][wDestPosition][0], floatstr(inputtext));
             	 	WaypointInfo[i][wDestPosition][0] = floatstr(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `waypoints` SET `dPosX` = '%f' WHERE `Id` = '%d'", WaypointInfo[i][wDestPosition][0], i);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
		        }

		        case 8:
		        {
		            format(string, sizeof(string), "You have successfully changed Waypoint %d's Destination Y from %f to %f.", i, WaypointInfo[i][wDestPosition][1], floatstr(inputtext));
             	 	WaypointInfo[i][wDestPosition][1] = floatstr(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `waypoints` SET `dPosY` = '%f' WHERE `Id` = '%d'", WaypointInfo[i][wDestPosition][1], i);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
		        }

		        case 9:
		        {
		            format(string, sizeof(string), "You have successfully changed Waypoint %d's Destination Z from %f to %f.", i, WaypointInfo[i][wDestPosition][2], floatstr(inputtext));
             	 	WaypointInfo[i][wDestPosition][2] = floatstr(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `waypoints` SET `dPosZ` = '%f' WHERE `Id` = '%d'", WaypointInfo[i][wDestPosition][2], i);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
		        }

		        case 10:
		        {
		            if(strval(inputtext) < 0 || strval(inputtext) > 18)
		            {
						format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Destination Interior ID (0-18).\nCurrent Interior ID: %d", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wDestInterior]);
				    	ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Interior", string, "Submit", "Cancel");
		                return 1;
		            }
		            format(string, sizeof(string), "You have successfully changed Waypoint %d's Interior ID from %d to %d.", i, WaypointInfo[i][wDestInterior], strval(inputtext));
             	 	WaypointInfo[i][wDestInterior] = strval(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `waypoints` SET `dInterior` = '%d' WHERE `Id` = '%d'", WaypointInfo[i][wDestInterior], i);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
		        }

		        case 11:
		        {
		        	format(string, sizeof(string), "You have successfully changed Waypoint %d's Virtual World from %d to %d.", i, WaypointInfo[i][wDestVirtualWorld], strval(inputtext));
             	 	WaypointInfo[i][wDestVirtualWorld] = strval(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `waypoints` SET `dVirtualWorld` = '%d' WHERE `Id` = '%d'", WaypointInfo[i][wDestVirtualWorld], i);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
		        }

		        case 12:
		        {
		            if(!strcmp(inputtext, "confirm", true))
		            {
		            	format(string, sizeof(string), "DELETE FROM `waypoints` WHERE `Id` = '%d'", i);
						mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
						DestroyDynamic3DTextLabel(WaypointInfo[i][wTextLabel]);
		                for (new eWaypointData:w; w < eWaypointData; w++)
		                {
		                    WaypointInfo[i][eWaypointData:w] = 0;
		                }
		                format(string, sizeof(string), "You have successfully deleted Waypoint %d from the database.", i);
		                SendClientMessageEx(playerid, COLOR_WHITE, string);
		            }
		            else
		            {
						format(string, sizeof(string), "{FFFFFF}You are about to delete Waypoint %d.\nPlease type in 'confirm' to confirm deletion.", WaypointEditing[playerid]);
				    	ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Deletion", string, "Submit", "Cancel");
		            }
		        }

		        case 17:
		        {
		        	if(strval(inputtext) < 0 || strval(inputtext) > 10)
		            {
						format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Entrance Load Time (0-10).\nCurrent Value: %d", i, WaypointInfo[i][wLoadingTime]);
				    	ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Entrance Loading Time", string, "Submit", "Cancel");
		                return 1;
		            }
		        	format(string, sizeof(string), "You have successfully changed Waypoint %d's Entrance Loading Time from %d to %d.", i, WaypointInfo[i][wLoadingTime], strval(inputtext));
             	 	WaypointInfo[i][wLoadingTime] = strval(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `waypoints` SET `wLoadTime` = '%d' WHERE `Id` = '%d'", WaypointInfo[i][wLoadingTime], i);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
		        }

		        case 18:
		        {
		        	if(strval(inputtext) < 0 || strval(inputtext) > 10)
		            {
						format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Destination Load Time (0-10).\nCurrent Value: %d", i, WaypointInfo[i][wDestLoadingTime]);
				    	ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Destination Loading Time", string, "Submit", "Cancel");
		                return 1;
		            }
		        	format(string, sizeof(string), "You have successfully changed Waypoint %d's Destination Loading Time from %d to %d.", i, WaypointInfo[i][wDestLoadingTime], strval(inputtext));
             	 	WaypointInfo[i][wDestLoadingTime] = strval(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `waypoints` SET `dLoadTime` = '%d' WHERE `Id` = '%d'", WaypointInfo[i][wDestLoadingTime], i);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
		        }

		        case 19:
		        {
		        	if(strlen(inputtext) < 1 || strlen(inputtext) > 8)
		            {
						format(string, sizeof(string), "{FFFFFF}You are currently editing Waypoint %d's Password (8 max chars).\nCurrent Value: %s", WaypointEditing[playerid], WaypointInfo[WaypointEditing[playerid]][wPassword]);
				    	ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Password", string, "Submit", "Cancel");
		                return 1;
		            }
					new waypointPass[9];
					mysql_escape_string(inputtext, waypointPass);
		        	format(string, sizeof(string), "You have successfully changed Waypoint %d's Password from %s to %s.", i, WaypointInfo[i][wPassword], waypointPass);
					format(WaypointInfo[i][wPassword], 8, "%s", waypointPass);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `waypoints` SET `Password` = '%s' WHERE `Id` = '%d'", WaypointInfo[i][wPassword], i);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
		        }

		        case 21:
		        {
		            if(strval(inputtext) < 0 || strval(inputtext) > MAX_FACTIONS)
		            {
						format(string, sizeof(string), "{FFFFFF}You are currently restricting Waypoint %d to a faction.\nCurrent Value: %d", i, WaypointInfo[i][wFactionRestriction]);
					    ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Waypoint Editor - Faction Restriction", string, "Submit", "Cancel");
					    return 1;
		            }
					WaypointInfo[i][wFactionRestriction] = strval(inputtext);
		        	format(string, sizeof(string), "You have successfully restricted Waypoint %d to faction %d.", i, WaypointInfo[i][wFactionRestriction]);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `waypoints` SET `FactionRestriction` = '%d' WHERE `Id` = '%d'", WaypointInfo[i][wFactionRestriction], i);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
		        }
		    }
		}

		case DIALOG_BUSINESS_EDIT:
		{
		    if(!response) return 0;
		    else if(BusinessEdit[playerid] == 0) return 0;
		    else if(!IsBusinessOwner(BusinessEdit[playerid], playerid)) return 0;

		    new
		        string[256],
				b = BusinessEdit[playerid];

		    switch (listitem)
		    {
		        case 0:
		        {
		            BusinessEditOption[playerid] = 1;
		            format(string, sizeof(string), "You are about to modify your business's name.\nCurrent Name: %s", BusinessInfo[b][bName]);
		            ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Business - Name", string, "Submit", "Cancel");
		        }

		        case 1:
		        {
		            switch (BusinessInfo[b][bOpen])
		            {
		                case 0:
		                {
				            SendClientMessageEx(playerid, COLOR_WHITE, "You have opened your business to public, others will be able to access your store.");
				            BusinessInfo[b][bOpen] = 1;
		                }

		                case 1:
		                {
				            SendClientMessageEx(playerid, COLOR_WHITE, "You have closed your business, others will NOT be able to access your store.");
				            BusinessInfo[b][bOpen] = 0;
		                }
		            }
				    format(string, sizeof(string), "UPDATE `businesses` SET `Open` = '%d' WHERE `Id` = '%d'", BusinessInfo[b][bOpen], b);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
                    RecreateBusinessText(b);
		        }

		        case 2:
		        {
		            if(BusinessInfo[b][bEarnings] == 0) return SendClientMessageEx(playerid, COLOR_WHITE, "Your business has not earned anything yet, there is nothing to claim.");
					GivePlayerCash(playerid, BusinessInfo[b][bEarnings]);
					format(string, sizeof(string), "You have collected $%d off your business profits.", BusinessInfo[b][bEarnings]);
     				SendClientMessageEx(playerid, COLOR_WHITE, string);
					BusinessInfo[b][bEarnings] = 0;
					format(string, sizeof(string), "UPDATE `businesses` SET `Earnings` = '%d' WHERE `Id` = '%d'", BusinessInfo[b][bEarnings], b);
					mysql_tqueryof(string, THREAD_LOG_RESULT, INVALID_PLAYER_ID, mConnectionHandle);
		        }
		    }
		}

		case DIALOG_BUSINESS_SUBMIT:
		{
		    if(!response) return ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_EDIT, DIALOG_STYLE_LIST, "{FFFFFF}Business - Management", "{FFFFFF}Rename\nOpen/Close", "Select", "Cancel");
		    else if(!BusinessEdit[playerid]) return 0;
		    else if(!IsBusinessOwner(BusinessEdit[playerid], playerid)) return 0;

			new
			    string[256],
				b = BusinessEdit[playerid];

		    switch (BusinessEditOption[playerid])
		    {
		        case 1:
		        {
		            if(strlen(inputtext) < 3 || strlen(inputtext) > 16)
		            {
		            	format(string, sizeof(string), "You are about to modify your business's name.\nCurrent Name: %s", BusinessInfo[b][bName]);
		            	ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Business - Name", string, "Submit", "Cancel");
		            	return 1;
					}
		        	format(string, sizeof(string), "You have successfully changed your business's name from %s to %s.", BusinessInfo[b][bName], inputtext);
		        	new bizName[17];
             	 	mysql_escape_string(inputtext, bizName);
             	 	format(BusinessInfo[b][bName], 16, "%s", bizName);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `businesses` SET `Name` = '%s' WHERE `Id` = '%d'", BusinessInfo[b][bName], b);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
                    RecreateBusinessText(b);
		        }
		    }
		}

		case DIALOG_BUSINESS_ADMIN:
		{
		    if(!response) return 0;
		    else if(!BusinessEdit[playerid]) return 0;

			new
			    string[256];

			switch (listitem)
			{
			    case 0:
			    {
			        BusinessEditOption[playerid] = 1;
    				format(string, sizeof(string), "{FFFFFF}You are currently editing the title of Business %d (3-16 chars).\nCurrent title: %s", BusinessEdit[playerid], BusinessInfo[BusinessEdit[playerid]][bName]);
			    	ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Business Editor - Title", string, "Submit", "Cancel");
			    }

			    case 1:
			    {
			        BusinessEditOption[playerid] = 2;
   					format(string, sizeof(string), "{FFFFFF}You are currently editing the Position X of Business %d.\nCurrent Value: %f", BusinessEdit[playerid], BusinessInfo[BusinessEdit[playerid]][bPosition][0]);
				    ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Business Editor - Position X", string, "Submit", "Cancel");
			    }

			    case 2:
			    {
			        BusinessEditOption[playerid] = 3;
   					format(string, sizeof(string), "{FFFFFF}You are currently editing the Position Y of Business %d.\nCurrent Value: %f", BusinessEdit[playerid], BusinessInfo[BusinessEdit[playerid]][bPosition][1]);
				    ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Business Editor - Position X", string, "Submit", "Cancel");
			    }

			    case 3:
			    {
			        BusinessEditOption[playerid] = 4;
   					format(string, sizeof(string), "{FFFFFF}You are currently editing the Position Z of Business %d.\nCurrent Value: %f", BusinessEdit[playerid], BusinessInfo[BusinessEdit[playerid]][bPosition][2]);
				    ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Business Editor - Position X", string, "Submit", "Cancel");
			    }

			    case 4:
			    {
			        BusinessEditOption[playerid] = 5;
			        new options[512];
			        format(options, sizeof(options), "Horse Betting Place\nSmall Size Strip Club\nModern barber shop\n\
						ProLaps Store\nSex Store\nTiny Barber Shop\nPizza Stack Co\nRusty Brown Donuts\nVictim Clothing\n\
						Ammunation Interior\nLV Gym\nMedium Ammunation\nUrban Clothing\nPig Pen\nBurger Shot\n\
						Reeces Barber\nZip Clothing\nDidier Sachs\nClub\n24/7\nBinco\nLil Probe Inn\nJays Diner\n\
						Barber Store #2\nSF Gym\nZero RC\nAmmunation (v4)\nAmmunation (v5)\nClucking Bell\nTen Green Bottles");
	        		ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_ADMIN_EDIT, DIALOG_STYLE_LIST, "{FFFFFF}Select Business Interior", options, "Select", "Exit");
			    }

			    case 5:
			    {
			        BusinessEditOption[playerid] = 6;
   					format(string, sizeof(string), "{FFFFFF}You are currently editing the Virtual World of Business %d.\nCurrent Value: %d", BusinessEdit[playerid], BusinessInfo[BusinessEdit[playerid]][bVirtualWorld]);
				    ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Business Editor - Interior", string, "Submit", "Cancel");
			    }

			    case 6:
			    {
			        BusinessEditOption[playerid] = 7;
					format(string, sizeof(string), "{FFFFFF}You are about to delete Business %d.\nPlease type in 'confirm' to confirm deletion.", BusinessEdit[playerid]);
				    ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Business Editor - Deletion", string, "Submit", "Cancel");
			    }

			    case 7:
			    {
					SetPlayerInteriorEx(playerid, 0);
					SetPlayerVirtualWorldEx(playerid, 0);
					SetPlayerPosEx(playerid, BusinessInfo[BusinessEdit[playerid]][bPosition][0], BusinessInfo[BusinessEdit[playerid]][bPosition][1], BusinessInfo[BusinessEdit[playerid]][bPosition][2]);
					SetPlayerFacingAngle(playerid, BusinessInfo[BusinessEdit[playerid]][bFacingAngle]);
					SetCameraBehindPlayer(playerid);
			    }

			    case 8:
			    {
			   		new
						i = BusinessInfo[BusinessEdit[playerid]][bInterior] - 1;
					SetPlayerInteriorEx(playerid, floatround(BusinessInterior[i][4]));
					SetPlayerVirtualWorldEx(playerid, GetAvailableVirtualWorld());
					SetPlayerPosEx(playerid, BusinessInterior[i][0], BusinessInterior[i][1], BusinessInterior[i][2]);
					SetPlayerFacingAngle(playerid, BusinessInterior[i][3]);
					SetCameraBehindPlayer(playerid);
			    }

			    case 9:
			    {
			        format(string, sizeof(string), "You have successfully placed Business %d at your current location.", BusinessEdit[playerid]);
             	 	GetPlayerPos(playerid, BusinessInfo[BusinessEdit[playerid]][bPosition][0], BusinessInfo[BusinessEdit[playerid]][bPosition][1], BusinessInfo[BusinessEdit[playerid]][bPosition][2]);
             	 	GetPlayerFacingAngle(playerid, BusinessInfo[BusinessEdit[playerid]][bFacingAngle]);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `businesses` SET `PosX`='%f',`PosY`='%f',`PosZ`='%f',`FacingAngle`='%f' WHERE `Id` = '%d'", BusinessInfo[BusinessEdit[playerid]][bPosition][0], BusinessInfo[BusinessEdit[playerid]][bPosition][1], BusinessInfo[BusinessEdit[playerid]][bPosition][2], BusinessInfo[BusinessEdit[playerid]][bFacingAngle], BusinessEdit[playerid]);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
                    RecreateBusinessText(BusinessEdit[playerid]);
			    }

			    case 10:
			    {
			        BusinessEditOption[playerid] = 11;
					format(string, sizeof(string), "{FFFFFF}You are about to set Business %d's Owner (3-%d chars).\nCurrent Value: %s", BusinessEdit[playerid], MAX_PLAYER_NAME, BusinessInfo[BusinessEdit[playerid]][bOwner]);
				    ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Business Editor - Ownership", string, "Submit", "Cancel");
			    }

			    case 11:
			    {
			        BusinessEditOption[playerid] = 12;
					format(string, sizeof(string), "{FFFFFF}You are about to set Business %d's Buy Price.\nCurrent Value: %d", BusinessEdit[playerid], BusinessInfo[BusinessEdit[playerid]][bBuyPrice]);
				    ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Business Editor - Buying Price", string, "Submit", "Cancel");
			    }
			}
		}

		case DIALOG_BUSINESS_ADMIN_EDIT:
		{
		    if(!BusinessEdit[playerid]) return 0;
		    else if(!BusinessInfo[BusinessEdit[playerid]][bExistant]) return 0;
		    else if(!response) return 0;

		    new
		        b = BusinessEdit[playerid],
		        string[256];

			switch (BusinessEditOption[playerid])
			{
			    case 1:
			    {
			        if(strlen(inputtext) < 3 || strlen(inputtext) > 16)
					{
	    				format(string, sizeof(string), "{FFFFFF}You are currently editing the title of Business %d (3-16 chars).\nCurrent title: %s", b, BusinessInfo[b][bName]);
				    	ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Business Editor - Title", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Business %d's title from %s to %s.", b, BusinessInfo[b][bName], inputtext);
		        	new bizName[17];
             	 	mysql_escape_string(inputtext, bizName);
             	 	format(BusinessInfo[b][bName], 16, "%s", bizName);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `businesses` SET `Name` = '%s' WHERE `Id` = '%d'", BusinessInfo[b][bName], b);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
                    RecreateBusinessText(b);
					return 1;
			    }

			    case 2:
			    {
			        format(string, sizeof(string), "You have successfully changed Business %d's Position X from %f to %f.", b, BusinessInfo[b][bPosition][0], floatstr(inputtext));
             	 	BusinessInfo[b][bPosition][0] = floatstr(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `businesses` SET `PosX` = '%f' WHERE `Id` = '%d'", BusinessInfo[b][bPosition][0], b);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
                    RecreateBusinessText(b);
			    }

			    case 3:
			    {
			        format(string, sizeof(string), "You have successfully changed Business %d's Position Y from %f to %f.", b, BusinessInfo[b][bPosition][1], floatstr(inputtext));
             	 	BusinessInfo[b][bPosition][1] = floatstr(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `businesses` SET `PosY` = '%f' WHERE `Id` = '%d'", BusinessInfo[b][bPosition][1], b);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
                    RecreateBusinessText(b);
			    }

			    case 4:
			    {
			        format(string, sizeof(string), "You have successfully changed Business %d's Position Z from %f to %f.", b, BusinessInfo[b][bPosition][2], floatstr(inputtext));
             	 	BusinessInfo[b][bPosition][2] = floatstr(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `businesses` SET `PosZ` = '%f' WHERE `Id` = '%d'", BusinessInfo[b][bPosition][2], b);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
                    RecreateBusinessText(b);
			    }

			    case 5:
			    {
			        format(string, sizeof(string), "You have successfully changed Business %d's Interior from %d to %d.", b, BusinessInfo[b][bInterior], listitem + 1);
             	 	BusinessInfo[b][bInterior] = listitem + 1;
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `businesses` SET `Interior` = '%d' WHERE `Id` = '%d'", BusinessInfo[b][bInterior], b);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
			    }

			    case 6:
			    {
			        if(!IsVirtualWorldAvailable(strval(inputtext))) return SendClientMessageEx(playerid, COLOR_GREY, "The specified virtual world is not available.");
			        format(string, sizeof(string), "You have successfully changed Business %d's Virtual World from %d to %d.", b, BusinessInfo[b][bVirtualWorld], strval(inputtext));
             	 	BusinessInfo[b][bVirtualWorld] = strval(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `businesses` SET `VirtualWorld` = '%d' WHERE `Id` = '%d'", BusinessInfo[b][bVirtualWorld], b);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
			    }

			    case 7:
			    {
		            if(!strcmp(inputtext, "confirm", true))
		            {
		            	format(string, sizeof(string), "DELETE FROM `businesses` WHERE `Id` = '%d'", b);
						mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
						DestroyDynamicPickup(BusinessInfo[b][bPickup]);
						DestroyDynamic3DTextLabel(BusinessInfo[b][bTextLabel]);
		                for (new eBusinessData:i; i < eBusinessData; i++)
		                {
		                    BusinessInfo[b][eBusinessData:i] = 0;
		                }
		                format(string, sizeof(string), "You have successfully deleted Business %d from the database.", b);
		                SendClientMessageEx(playerid, COLOR_WHITE, string);
		            }
		            else
		            {
						format(string, sizeof(string), "{FFFFFF}You are about to delete Business %d.\nPlease type in 'confirm' to confirm deletion.", BusinessEdit[playerid]);
				    	ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Business Editor - Deletion", string, "Submit", "Cancel");
		            }
			    }

			    case 11:
			    {
					if(strlen(inputtext) < 3 || strlen(inputtext) > MAX_PLAYER_NAME)
					{
						format(string, sizeof(string), "{FFFFFF}You are about to set Business %d's Owner (3-%d chars).\nCurrent Value: %s", b, MAX_PLAYER_NAME, BusinessInfo[b][bOwner]);
				    	ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Business Editor - Ownership", string, "Submit", "Cancel");
					    return 1;
					}
			        format(string, sizeof(string), "You have successfully changed Business %d's Ownership from %s to %s.", b, BusinessInfo[b][bOwner], inputtext);
             	 	format(BusinessInfo[b][bOwner], MAX_PLAYER_NAME, inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `businesses` SET `Owner` = '%s' WHERE `Id` = '%d'", BusinessInfo[b][bOwner], b);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
                    RecreateBusinessText(b);
			    }

			    case 12:
			    {
			        format(string, sizeof(string), "You have successfully changed Business %d's Buy Price from %d to %d.", b, BusinessInfo[b][bBuyPrice], strval(inputtext));
                    BusinessInfo[b][bBuyPrice] = strval(inputtext);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `businesses` SET `BuyPrice` = '%d' WHERE `Id` = '%d'", BusinessInfo[b][bBuyPrice], b);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
                    RecreateBusinessText(b);
			    }
			}
		}

		case DIALOG_FACTION_ADMIN:
		{
		    if(FactionEdit[playerid] < 1 || FactionEdit[playerid] > MAX_FACTIONS) return 0;
		    else if(!response) return 0;

		    new
		        string[512],
				f = FactionEdit[playerid];

			FactionEditOption[playerid] = listitem + 1;
		    switch (listitem)
		    {
		        case 0:
		        {
   					format(string, sizeof(string), "{FFFFFF}You are currently renaming Faction %d.\nCurrent Value: %s", f, GetFactionName(f));
				    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rename", string, "Submit", "Cancel");
		        }

		        case 1:
		        {
   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Motd.\nCurrent Value: %s", f, FactionInfo[f][fMotd]);
				    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Motd", string, "Submit", "Cancel");
		        }

		        case 2:
		        {
     	    		format(string, sizeof(string), "Civilian\n\
					Law Enforcement Agency\n\
					Governing Agency\n\
					Medical Agency\n\
					News Agency\n\
					Illegal Agency");
				    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_EDIT, DIALOG_STYLE_LIST, "{FFFFFF}Faction Editor - Type", string, "Submit", "Cancel");
		        }
                case 3:
                {
           	    	format(string, sizeof(string), "Edit Rank 1 (%s)\n\
					Edit Rank 2 (%s)\n\
					Edit Rank 3 (%s)\n\
					Edit Rank 4 (%s)\n\
					Edit Rank 5 (%s)\n\
					Edit Rank 6 (%s)\n\
					Edit Rank 7 (%s)\n\
					Edit Rank 8 (%s)\n\
					Edit Rank 9 (%s)\n\
					Edit Rank 10 (%s)", FactionInfo[f][fRank1], FactionInfo[f][fRank2], FactionInfo[f][fRank3], FactionInfo[f][fRank4], FactionInfo[f][fRank5], FactionInfo[f][fRank6], FactionInfo[f][fRank7], FactionInfo[f][fRank8], FactionInfo[f][fRank9], FactionInfo[f][fRank10]);
					ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_EDIT, DIALOG_STYLE_LIST, "{FFFFFF}Faction Editor - Ranks", string, "Edit", "Cancel");
                }
                case 4:
                {
           	    	format(string, sizeof(string), "Edit Div 1 (%s)\n\
					Edit Div 2 (%s)\n\
					Edit Div 3 (%s)\n\
					Edit Div 4 (%s)\n\
					Edit Div 5 (%s)\n", FactionInfo[f][fDiv1], FactionInfo[f][fDiv2], FactionInfo[f][fDiv3], FactionInfo[f][fDiv4], FactionInfo[f][fDiv5]);
					ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_EDIT, DIALOG_STYLE_LIST, "{FFFFFF}Faction Editor - Divisions", string, "Edit", "Cancel");
                }
		        case 5:
		        {
		            GetPlayerPos(playerid, FactionInfo[f][fLockerPosition][0], FactionInfo[f][fLockerPosition][1], FactionInfo[f][fLockerPosition][2]);
		            format(string, sizeof(string), "You have successfully changed Faction %d's Safe Spot to (X: %f, Y: %f, Z: %f).", f, FactionInfo[f][fLockerPosition][0], FactionInfo[f][fLockerPosition][1], FactionInfo[f][fLockerPosition][2]);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `LockerX`='%f',`LockerY`='%f',`LockerZ`='%f' WHERE `Id` = '%d'", FactionInfo[f][fLockerPosition][0], FactionInfo[f][fLockerPosition][1], FactionInfo[f][fLockerPosition][2], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
					RecreateFactionLockerText(f);
		        }
		        case 6:
		        {
					new szQuery[128], Float:vNewPos[3];
				    GetPlayerPos(playerid, vNewPos[0], vNewPos[1], vNewPos[2]);
			        VaultInfo[f][vPosition][0] = vNewPos[0];
			        VaultInfo[f][vPosition][1] = vNewPos[1];
			        VaultInfo[f][vPosition][2] = vNewPos[2];
					format(szQuery, sizeof(szQuery), "UPDATE `vaults` SET `PosX`='%f',`PosY`='%f',`PosZ`='%f' WHERE `Id` = '%d'", vNewPos[0], vNewPos[1], vNewPos[2], f);
					mysql_tqueryof(szQuery, THREAD_LOG_RESULT, playerid, mConnectionHandle);
					format(szQuery, sizeof(szQuery), "You have changed the vault location of faction %d to: %f, %f, %f.", f, vNewPos[0], vNewPos[1], vNewPos[2]);
					SendClientMessageEx(playerid, COLOR_WHITE, szQuery);
					RecreateVaultText(f);
		        }

				case 7:
				{
        			foreach(new i: Player)
		            {
		                if(PlayerInfo[i][pFaction] == f)
		                {
							PlayerInfo[i][pFaction] = 0;
							PlayerInfo[i][pRank] = 0;
							SendClientMessageEx(i, COLOR_LIGHTBLUE, "Your faction was disbanded and you've been kicked out of it.");
						}
		            }
		            format(string, sizeof(string), "UPDATE `factions` SET `Rank1`='',\
						`Rank2`='',\
						`Rank3`='',\
						`Rank4`='',\
						`Rank5`='',\
						`Rank6`='',\
						`Rank7`='',\
						`Rank8`='',\
						`Rank9`='',\
						`Rank10`='',\
						`Name`='None',\
						`Motd`=''\
						WHERE `Id` = '%d'", f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
		            format(string, sizeof(string), "UPDATE `accounts` SET `Faction`='0',`Rank`='0' WHERE `Faction` = '%d'", f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
		            for (new eFactionData:i; i < eFactionData; i++)
		            {
						FactionInfo[f][eFactionData:i] = 0;
		            }
		            format(string, sizeof(string), "You have successfully disbanded faction %d's members and properties.", f);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
				}
		    }
		}

		case DIALOG_FACTION_ADMIN_EDIT:
		{
		    if(!FactionEditOption[playerid]) return 0;
		    else if(FactionEdit[playerid] < 1 || FactionEdit[playerid] > MAX_FACTIONS) return 0;
		    else if(!response) return 0;

		    new
		        string[256],
				f = FactionEdit[playerid];

		    switch (FactionEditOption[playerid])
		    {
		        case 1:
		        {
			        if(strlen(inputtext) < 3 || strlen(inputtext) > 24)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be under 3 characters and no longer than 24.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently renaming Faction %d.\nCurrent Value: %s", FactionEdit[playerid], GetFactionName(f));
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rename", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's name from %s to %s.", f, GetFactionName(f), inputtext);
		        	new factionName[25];
             	 	mysql_escape_string(inputtext, factionName);
             	 	format(FactionInfo[f][fName], 24, "%s", factionName);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Name` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fName], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
					format(string, sizeof(string), "%d", f);
					cmd_editfaction(playerid, string);

		        }

		        case 2:
		        {
			        if(strlen(inputtext) < 3 || strlen(inputtext) > 96)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be under 3 characters and no longer than 96.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Motd.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fMotd]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Motd", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Motd from %s to %s.", f, FactionInfo[f][fMotd], inputtext);
		        	new factionMotd[97];
             	 	mysql_escape_string(inputtext, factionMotd);
             	 	format(FactionInfo[f][fMotd], 96, "%s", factionMotd);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Motd` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fMotd], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
					format(string, sizeof(string), "%d", f);
					cmd_editfaction(playerid, string);

				}

		        case 3:
		        {
		            FactionInfo[f][fType] = listitem;
		            format(string, sizeof(string), "You have successfully changed Faction %d's type to %s.", f, GetFactionType(f));
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Type` = '%d' WHERE `Id` = '%d'", FactionInfo[f][fType], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
					format(string, sizeof(string), "%d", f);
					cmd_editfaction(playerid, string);

				}
				case 4:
				{
				    FactionEditOption[playerid] = listitem;
				    switch(listitem)
				    {
				        case 0:
				        {
		   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 1.\nCurrent Value: %s", f, FactionInfo[f][fRank1]);
						    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 1", string, "Submit", "Cancel");
				        }

				        case 1:
				        {
		   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 2.\nCurrent Value: %s", f, FactionInfo[f][fRank2]);
						    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 2", string, "Submit", "Cancel");
				        }

				        case 2:
				        {
		   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 3.\nCurrent Value: %s", f, FactionInfo[f][fRank3]);
						    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 3", string, "Submit", "Cancel");
				        }

				        case 3:
		          		{
		   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 4.\nCurrent Value: %s", f, FactionInfo[f][fRank4]);
						    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 4", string, "Submit", "Cancel");
				        }

				        case 4:
				        {
		   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 5.\nCurrent Value: %s", f, FactionInfo[f][fRank5]);
						    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 5", string, "Submit", "Cancel");
				        }

				        case 5:
				        {
		   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 6.\nCurrent Value: %s", f, FactionInfo[f][fRank6]);
						    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 6", string, "Submit", "Cancel");
				        }
				        case 6:
				        {
		   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 7.\nCurrent Value: %s", f, FactionInfo[f][fRank7]);
						    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 7", string, "Submit", "Cancel");
				        }
				        case 7:
				        {
		   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 8.\nCurrent Value: %s", f, FactionInfo[f][fRank8]);
						    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 8", string, "Submit", "Cancel");
				        }
				        case 8:
				        {
		   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 9.\nCurrent Value: %s", f, FactionInfo[f][fRank9]);
						    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 9", string, "Submit", "Cancel");
				        }
				        case 9:
				        {
		   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 10.\nCurrent Value: %s", f, FactionInfo[f][fRank10]);
						    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 10", string, "Submit", "Cancel");
				        }
					}
				}
				case 5:
				{
				    FactionEditOption[playerid] = listitem;
				    switch(listitem)
				    {
				        case 0:
				        {
		   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Div 1.\nCurrent Value: %s", f, FactionInfo[f][fDiv1]);
						    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_DIV, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Div 1", string, "Submit", "Cancel");
				        }

				        case 1:
				        {
		   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Div 2.\nCurrent Value: %s", f, FactionInfo[f][fDiv2]);
						    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_DIV, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Div 2", string, "Submit", "Cancel");
				        }

				        case 2:
				        {
		   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Div 3.\nCurrent Value: %s", f, FactionInfo[f][fDiv3]);
						    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_DIV, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Div 3", string, "Submit", "Cancel");
				        }
				        case 3:
				        {
		   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Div 4.\nCurrent Value: %s", f, FactionInfo[f][fDiv4]);
						    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_DIV, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Div 4", string, "Submit", "Cancel");
				        }
				        case 4:
				        {
		   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Div 5.\nCurrent Value: %s", f, FactionInfo[f][fDiv5]);
						    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_DIV, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Div 5", string, "Submit", "Cancel");
				        }
					}
				}
		    }
		}
		case DIALOG_FACTION_ADMIN_DIV:
		{
		    if(FactionEdit[playerid] < 1 || FactionEdit[playerid] > MAX_FACTIONS) return 0;
		    else if(FactionEditOption[playerid] < 0) return 0;
		    else if(!response) return 0;
		    
		    new string[128], f = FactionEdit[playerid];
		    switch(FactionEditOption[playerid])
		    {
				case 0:
		        {
			        if(strlen(inputtext) < 1 || strlen(inputtext) > 8)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be no longer than 8 characters long.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Div 1.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fDiv1]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_DIV, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Div 1", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Div 1 from %s to %s.", f, FactionInfo[f][fDiv1], inputtext);
		        	new fDiv[9];
             	 	mysql_escape_string(inputtext, fDiv);
             	 	format(FactionInfo[f][fDiv1], 8, "%s", fDiv);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Div1` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fDiv1], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
				}
				case 1:
		        {
			        if(strlen(inputtext) < 1 || strlen(inputtext) > 8)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be no longer than 8 characters long.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Div 2.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fDiv2]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_DIV, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Div 2", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Div 2 from %s to %s.", f, FactionInfo[f][fDiv2], inputtext);
		        	new fDiv[9];
             	 	mysql_escape_string(inputtext, fDiv);
             	 	format(FactionInfo[f][fDiv2], 8, "%s", fDiv);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Div2` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fDiv2], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
				}
				case 2:
		        {
			        if(strlen(inputtext) < 1 || strlen(inputtext) > 8)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be no longer than 8 characters long.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Div 3.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fDiv3]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_DIV, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Div 3", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Div 3 from %s to %s.", f, FactionInfo[f][fDiv3], inputtext);
		        	new fDiv[9];
             	 	mysql_escape_string(inputtext, fDiv);
             	 	format(FactionInfo[f][fDiv3], 8, "%s", fDiv);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Div3` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fDiv3], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
				}
				case 3:
		        {
			        if(strlen(inputtext) < 1 || strlen(inputtext) > 8)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be no longer than 8 characters long.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Div 4.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fDiv4]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_DIV, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Div 4", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Div 4 from %s to %s.", f, FactionInfo[f][fDiv4], inputtext);
		        	new fDiv[9];
             	 	mysql_escape_string(inputtext, fDiv);
             	 	format(FactionInfo[f][fDiv4], 8, "%s", fDiv);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Div4` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fDiv4], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
				}
				case 4:
		        {
			        if(strlen(inputtext) < 1 || strlen(inputtext) > 8)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be no longer than 8 characters long.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Div 5.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fDiv5]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_DIV, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Div 5", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Div 5 from %s to %s.", f, FactionInfo[f][fDiv5], inputtext);
		        	new fDiv[9];
             	 	mysql_escape_string(inputtext, fDiv);
             	 	format(FactionInfo[f][fDiv5], 8, "%s", fDiv);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Div5` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fDiv5], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
				}
		    }
		}
		case DIALOG_FACTION_ADMIN_RANK:
		{
		    if(FactionEdit[playerid] < 1 || FactionEdit[playerid] > MAX_FACTIONS) return 0;
		    else if(FactionEditOption[playerid] < 0) return 0;
		    else if(!response) return 0;

		    new string[128], f = FactionEdit[playerid];
		    switch(FactionEditOption[playerid])
		    {
				case 0:
		        {
			        if(strlen(inputtext) < 3 || strlen(inputtext) > 32)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be under 3 characters and no longer than 32.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 1.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fRank1]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 1", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Rank 1 from %s to %s.", f, FactionInfo[f][fRank1], inputtext);
		        	new factionRank[33];
             	 	mysql_escape_string(inputtext, factionRank);
             	 	format(FactionInfo[f][fRank1], 32, "%s", factionRank);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Rank1` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fRank1], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);

				}

		        case 1:
		        {
			        if(strlen(inputtext) < 3 || strlen(inputtext) > 32)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be under 3 characters and no longer than 32.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 2.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fRank2]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 2", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Rank 2 from %s to %s.", f, FactionInfo[f][fRank2], inputtext);
		        	new factionRank[33];
             	 	mysql_escape_string(inputtext, factionRank);
             	 	format(FactionInfo[f][fRank2], 32, "%s", factionRank);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Rank2` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fRank2], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);

				}

		        case 2:
		        {
			        if(strlen(inputtext) < 3 || strlen(inputtext) > 32)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be under 3 characters and no longer than 32.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 3.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fRank3]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 3", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Rank 3 from %s to %s.", f, FactionInfo[f][fRank3], inputtext);
		        	new factionRank[33];
             	 	mysql_escape_string(inputtext, factionRank);
             	 	format(FactionInfo[f][fRank3], 32, "%s", factionRank);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Rank3` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fRank3], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);

				}

		        case 3:
		        {
			        if(strlen(inputtext) < 3 || strlen(inputtext) > 32)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be under 3 characters and no longer than 32.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 4.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fRank4]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 4", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Rank 4 from %s to %s.", f, FactionInfo[f][fRank4], inputtext);
		        	new factionRank[33];
             	 	mysql_escape_string(inputtext, factionRank);
             	 	format(FactionInfo[f][fRank4], 32, "%s", factionRank);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Rank4` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fRank4], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);

				}

		        case 4:
		        {
			        if(strlen(inputtext) < 3 || strlen(inputtext) > 32)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be under 3 characters and no longer than 32.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 5.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fRank5]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 5", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Rank 5 from %s to %s.", f, FactionInfo[f][fRank5], inputtext);
		        	new factionRank[33];
             	 	mysql_escape_string(inputtext, factionRank);
             	 	format(FactionInfo[f][fRank5], 32, "%s", factionRank);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Rank5` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fRank5], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);

				}

		        case 5:
		        {
			        if(strlen(inputtext) < 3 || strlen(inputtext) > 32)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be under 3 characters and no longer than 32.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 6.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fRank6]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 6", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Rank 6 from %s to %s.", f, FactionInfo[f][fRank6], inputtext);
		        	new factionRank[33];
             	 	mysql_escape_string(inputtext, factionRank);
             	 	format(FactionInfo[f][fRank6], 32, "%s", factionRank);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Rank6` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fRank6], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);

				}
				case 6:
		        {
			        if(strlen(inputtext) < 3 || strlen(inputtext) > 32)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be under 3 characters and no longer than 32.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 7.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fRank7]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 7", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Rank 7 from %s to %s.", f, FactionInfo[f][fRank7], inputtext);
		        	new factionRank[33];
             	 	mysql_escape_string(inputtext, factionRank);
             	 	format(FactionInfo[f][fRank7], 32, "%s", factionRank);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Rank7` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fRank7], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);

				}
				case 7:
		        {
			        if(strlen(inputtext) < 3 || strlen(inputtext) > 32)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be under 3 characters and no longer than 32.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 8.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fRank8]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 8", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Rank 8 from %s to %s.", f, FactionInfo[f][fRank8], inputtext);
		        	new factionRank[33];
             	 	mysql_escape_string(inputtext, factionRank);
             	 	format(FactionInfo[f][fRank8], 32, "%s", factionRank);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Rank8` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fRank8], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);

				}
				case 8:
		        {
			        if(strlen(inputtext) < 3 || strlen(inputtext) > 32)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be under 3 characters and no longer than 32.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 9.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fRank9]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 9", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Rank 9 from %s to %s.", f, FactionInfo[f][fRank9], inputtext);
		        	new factionRank[33];
             	 	mysql_escape_string(inputtext, factionRank);
             	 	format(FactionInfo[f][fRank9], 32, "%s", factionRank);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Rank9` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fRank9], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);

				}
				case 9:
		        {
			        if(strlen(inputtext) < 3 || strlen(inputtext) > 32)
					{
					    SendClientMessageEx(playerid, COLOR_WHITE, "The text must be under 3 characters and no longer than 32.");
	   					format(string, sizeof(string), "{FFFFFF}You are currently changing Faction %d's Rank 10.\nCurrent Value: %s", FactionEdit[playerid], FactionInfo[f][fRank10]);
					    ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN_RANK, DIALOG_STYLE_INPUT, "{FFFFFF}Faction Editor - Rank 10", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Faction %d's Rank 10 from %s to %s.", f, FactionInfo[f][fRank10], inputtext);
		        	new factionRank[33];
             	 	mysql_escape_string(inputtext, factionRank);
             	 	format(FactionInfo[f][fRank10], 32, "%s", factionRank);
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
		            format(string, sizeof(string), "UPDATE `factions` SET `Rank10` = '%s' WHERE `Id` = '%d'", FactionInfo[f][fRank10], f);
					mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);

				}

			}
		}
		case DIALOG_HOUSE_ADMIN:
		{
			if(!response) return 0;
			else if(!HouseEdit[playerid]) return 0;

			new
			    string[256];

			switch (listitem)
			{
				case 0:
				{
				    HouseEditOption[playerid] = 1;
	   				format(string, sizeof(string), "{FFFFFF}You are currently editing the Position X of House %d.\nCurrent Value: %f", HouseEdit[playerid], HouseInfo[HouseEdit[playerid]][hPosition][0]);
					ShowPlayerDialogEx(playerid, DIALOG_HOUSE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}House Editor - Position X", string, "Submit", "Cancel");
				}

				case 1:
				{
				    HouseEditOption[playerid] = 2;
	   				format(string, sizeof(string), "{FFFFFF}You are currently editing the Position Y of House %d.\nCurrent Value: %f", HouseEdit[playerid], HouseInfo[HouseEdit[playerid]][hPosition][1]);
					ShowPlayerDialogEx(playerid, DIALOG_HOUSE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}House Editor - Position Y", string, "Submit", "Cancel");
				}

				case 2:
				{
				    HouseEditOption[playerid] = 3;
	   				format(string, sizeof(string), "{FFFFFF}You are currently editing the Position Z of House %d.\nCurrent Value: %f", HouseEdit[playerid], HouseInfo[HouseEdit[playerid]][hPosition][2]);
					ShowPlayerDialogEx(playerid, DIALOG_HOUSE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}House Editor - Position Z", string, "Submit", "Cancel");
				}

				case 3:
				{
				    HouseEditOption[playerid] = 4;
	       			new options[512];
				    format(options, sizeof(options), "Denise Room\nRyders House\nJohnsons House\nKaties Lovenest\n\
						Mad Dogg\nAbandoned AC Tower\nSafe House Group #1\nSafe House Group #3\nBurg House #2\n\
						Burg House #3\nBurglary House #4\nMotel Room\nPair of Burg Houses\nCrack Den\nUnused Safe House\n\
						Burg House #14\nBurg House #16\nBurg House #17\nBurg House #18\nColonel's House\nVerdant Bluffs");
	     			ShowPlayerDialogEx(playerid, DIALOG_HOUSE_ADMIN_EDIT, DIALOG_STYLE_LIST, "{FFFFFF}Select House Interior", options, "Select", "Exit");
				}

				case 4:
				{
				    HouseEditOption[playerid] = 5;
	   				format(string, sizeof(string), "{FFFFFF}You are currently editing the Virtual World of House %d.\nCurrent Value: %d", HouseEdit[playerid], HouseInfo[HouseEdit[playerid]][hVirtualWorld]);
					ShowPlayerDialogEx(playerid, DIALOG_HOUSE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}House Editor - Interior", string, "Submit", "Cancel");
				}

				case 5:
				{
				    HouseEditOption[playerid] = 6;
					format(string, sizeof(string), "{FFFFFF}You are about to delete House %d.\nPlease type in 'confirm' to confirm deletion.", HouseEdit[playerid]);
					ShowPlayerDialogEx(playerid, DIALOG_HOUSE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}House Editor - Deletion", string, "Submit", "Cancel");
				}

				case 6:
				{
					SetPlayerInteriorEx(playerid, 0);
					SetPlayerVirtualWorldEx(playerid, 0);
					SetPlayerPosEx(playerid, HouseInfo[HouseEdit[playerid]][hPosition][0], HouseInfo[HouseEdit[playerid]][hPosition][1], HouseInfo[HouseEdit[playerid]][hPosition][2]);
					SetPlayerFacingAngle(playerid, HouseInfo[HouseEdit[playerid]][hFacingAngle]);
					SetCameraBehindPlayer(playerid);
				}

				case 7:
				{
					new
						i = HouseInfo[HouseEdit[playerid]][hInterior] - 1;
					SetPlayerInteriorEx(playerid, floatround(HouseInterior[i][4]));
					SetPlayerVirtualWorldEx(playerid, GetAvailableVirtualWorld());
					SetPlayerPosEx(playerid, HouseInterior[i][0], HouseInterior[i][1], HouseInterior[i][2]);
					SetPlayerFacingAngle(playerid, HouseInterior[i][3]);
					SetCameraBehindPlayer(playerid);
				}

				case 8:
				{
				    format(string, sizeof(string), "You have successfully placed House %d at your current location.", HouseEdit[playerid]);
	             	GetPlayerPos(playerid, HouseInfo[HouseEdit[playerid]][hPosition][0], HouseInfo[HouseEdit[playerid]][hPosition][1], HouseInfo[HouseEdit[playerid]][hPosition][2]);
	             	GetPlayerFacingAngle(playerid, HouseInfo[HouseEdit[playerid]][hFacingAngle]);
			        SendClientMessageEx(playerid, COLOR_WHITE, string);
			        format(string, sizeof(string), "UPDATE `houses` SET `PosX`='%f',`PosY`='%f',`PosZ`='%f',`FacingAngle`='%f' WHERE `Id` = '%d'", HouseInfo[HouseEdit[playerid]][hPosition][0], HouseInfo[HouseEdit[playerid]][hPosition][1], HouseInfo[HouseEdit[playerid]][hPosition][2], HouseInfo[HouseEdit[playerid]][hFacingAngle], HouseEdit[playerid]);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
					RecreateHouseText(HouseEdit[playerid]);
			    }

			    case 9:
			    {
			        HouseEditOption[playerid] = 10;
					format(string, sizeof(string), "{FFFFFF}You are about to set House %d's Owner (3-%d chars).\nCurrent Value: %s", HouseEdit[playerid], MAX_PLAYER_NAME, HouseInfo[HouseEdit[playerid]][hOwner]);
				    ShowPlayerDialogEx(playerid, DIALOG_HOUSE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}House Editor - Ownership", string, "Submit", "Cancel");
			    }

				case 10:
				{
					HouseEditOption[playerid] = 11;
					format(string, sizeof(string), "{FFFFFF}You are about to set House %d's Buy Price.\nCurrent Value: %d", HouseEdit[playerid], HouseInfo[HouseEdit[playerid]][hBuyPrice]);
					ShowPlayerDialogEx(playerid, DIALOG_HOUSE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}House Editor - Buying Price", string, "Submit", "Cancel");
	 			}
			}
		}

		case DIALOG_HOUSE_ADMIN_EDIT:
		{
			if(!HouseEdit[playerid]) return 0;
			else if(!HouseInfo[HouseEdit[playerid]][hExistant]) return 0;
			else if(!response) return 0;

			new
			    h = HouseEdit[playerid],
			    string[256];

			switch (HouseEditOption[playerid])
			{
				case 1:
				{
				    format(string, sizeof(string), "You have successfully changed House %d's Position X from %f to %f.", h, HouseInfo[h][hPosition][0], floatstr(inputtext));
	             	HouseInfo[h][hPosition][0] = floatstr(inputtext);
			        SendClientMessageEx(playerid, COLOR_WHITE, string);
			        format(string, sizeof(string), "UPDATE `houses` SET `PosX` = '%f' WHERE `Id` = '%d'", HouseInfo[h][hPosition][0], h);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
	                RecreateHouseText(h);
				}

				case 2:
				{
				    format(string, sizeof(string), "You have successfully changed House %d's Position Y from %f to %f.", h, HouseInfo[h][hPosition][1], floatstr(inputtext));
	             	HouseInfo[h][hPosition][1] = floatstr(inputtext);
			        SendClientMessageEx(playerid, COLOR_WHITE, string);
			        format(string, sizeof(string), "UPDATE `houses` SET `PosY` = '%f' WHERE `Id` = '%d'", HouseInfo[h][hPosition][1], h);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
	                RecreateHouseText(h);
				}

				case 3:
				{
				    format(string, sizeof(string), "You have successfully changed House %d's Position Z from %f to %f.", h, HouseInfo[h][hPosition][2], floatstr(inputtext));
	             	HouseInfo[h][hPosition][2] = floatstr(inputtext);
			        SendClientMessageEx(playerid, COLOR_WHITE, string);
			        format(string, sizeof(string), "UPDATE `houses` SET `PosZ` = '%f' WHERE `Id` = '%d'", HouseInfo[h][hPosition][2], h);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
	                RecreateHouseText(h);
				}

				case 4:
				{
				    format(string, sizeof(string), "You have successfully changed House %d's Interior from %d to %d.", h, HouseInfo[h][hInterior], listitem + 1);
	            	HouseInfo[h][hInterior] = listitem + 1;
			        SendClientMessageEx(playerid, COLOR_WHITE, string);
			        format(string, sizeof(string), "UPDATE `houses` SET `Interior` = '%d' WHERE `Id` = '%d'", HouseInfo[h][hInterior], h);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
				}

				case 5:
				{
				    if(!IsVirtualWorldAvailable(strval(inputtext))) return SendClientMessageEx(playerid, COLOR_GREY, "The specified virtual world is not available.");
				    format(string, sizeof(string), "You have successfully changed House %d's Virtual World from %d to %d.", h, HouseInfo[h][hVirtualWorld], strval(inputtext));
	            	HouseInfo[h][hVirtualWorld] = strval(inputtext);
			        SendClientMessageEx(playerid, COLOR_WHITE, string);
			        format(string, sizeof(string), "UPDATE `houses` SET `VirtualWorld` = '%d' WHERE `Id` = '%d'", HouseInfo[h][hVirtualWorld], h);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
				}

				case 6:
				{
			        if(!strcmp(inputtext, "confirm", true))
			        {
			            format(string, sizeof(string), "DELETE FROM `houses` WHERE `Id` = '%d'", h);
						mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
						DestroyDynamic3DTextLabel(HouseInfo[h][hTextLabel]);
						DestroyDynamicPickup(HouseInfo[h][hPickupIcon]);
			            for (new eHouseData:i; i < eHouseData; i++)
			            {
							HouseInfo[h][eHouseData:i] = 0;
			            }
			            format(string, sizeof(string), "You have successfully deleted House %d from the database.", h);
			            SendClientMessageEx(playerid, COLOR_WHITE, string);
			        }
			        else
			        {
						format(string, sizeof(string), "{FFFFFF}You are about to delete House %d.\nPlease type in 'confirm' to confirm deletion.", HouseEdit[playerid]);
					   	ShowPlayerDialogEx(playerid, DIALOG_HOUSE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}House Editor - Deletion", string, "Submit", "Cancel");
					}
				}

				case 10:
				{
					if(strlen(inputtext) < 3 || strlen(inputtext) > MAX_PLAYER_NAME)
					{
						format(string, sizeof(string), "{FFFFFF}You are about to set House %d's Owner (3-%d chars).\nCurrent Value: %s", h, MAX_PLAYER_NAME, HouseInfo[h][hOwner]);
					   	ShowPlayerDialogEx(playerid, DIALOG_HOUSE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}House Editor - Ownership", string, "Submit", "Cancel");
					    return 1;
					}
			        format(string, sizeof(string), "You have successfully changed House %d's Ownership from %s to %s.", h, HouseInfo[h][hOwner], inputtext);
	           	 	format(HouseInfo[h][hOwner], MAX_PLAYER_NAME, inputtext);
			        SendClientMessageEx(playerid, COLOR_WHITE, string);
			        format(string, sizeof(string), "UPDATE `houses` SET `Owner` = '%s' WHERE `Id` = '%d'", HouseInfo[h][hOwner], h);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
					RecreateHouseText(h);
			    }

				case 11:
				{
					format(string, sizeof(string), "You have successfully changed House %d's Buy Price from %d to %d.", h, HouseInfo[h][hBuyPrice], strval(inputtext));
	                HouseInfo[h][hBuyPrice] = strval(inputtext);
			        SendClientMessageEx(playerid, COLOR_WHITE, string);
			        format(string, sizeof(string), "UPDATE `houses` SET `BuyPrice` = '%d' WHERE `Id` = '%d'", HouseInfo[h][hBuyPrice], h);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
	                RecreateHouseText(h);
	    		}
			}
		}

		case DIALOG_GATE_EDIT:
		{
			if(!response) return 0;
			else if(!GateEdit[playerid]) return 0;

			new
			    string[256];

			switch (listitem)
			{
				case 0:
				{
				    GateEditOption[playerid] = 1;
	   				format(string, sizeof(string), "{FFFFFF}You are currently editing the Password of Gate %d.\nCurrent Value: %s", GateEdit[playerid], GateInfo[GateEdit[playerid]][gPassword]);
					ShowPlayerDialogEx(playerid, DIALOG_GATE_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Gate Editor - Password", string, "Submit", "Cancel");
				}

				case 1:
				{
				    GateEditOption[playerid] = 2;
	   				format(string, sizeof(string), "{FFFFFF}You are currently editing the Model Id of Gate %d.\nCurrent Value: %d", GateEdit[playerid], GateInfo[GateEdit[playerid]][gModel]);
					ShowPlayerDialogEx(playerid, DIALOG_GATE_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Gate Editor - Model", string, "Submit", "Cancel");
				}

				case 2:
				{
					EditDynamicObject(playerid, GateInfo[GateEdit[playerid]][gObjectHandle]);
					SetPVarInt(playerid, "GateMethod", 1);
	 				SendClientMessageEx(playerid, COLOR_WHITE, "You have are now editing the position of the gate.");
				}

				case 3:
				{
					GetPlayerPos(playerid, GateInfo[GateEdit[playerid]][gPosition][0], GateInfo[GateEdit[playerid]][gPosition][1], GateInfo[GateEdit[playerid]][gPosition][2]);
					SetDynamicObjectPos(GateInfo[GateEdit[playerid]][gObjectHandle], GateInfo[GateEdit[playerid]][gPosition][0], GateInfo[GateEdit[playerid]][gPosition][1], GateInfo[GateEdit[playerid]][gPosition][2]);
					SetDynamicObjectRot(GateInfo[GateEdit[playerid]][gObjectHandle], GateInfo[GateEdit[playerid]][gRotation][0], GateInfo[GateEdit[playerid]][gRotation][1], GateInfo[GateEdit[playerid]][gRotation][2]);
	    			GateInfo[GateEdit[playerid]][gState] = 0;
					format(string, sizeof(string), "You have brought gate id %d to your location, it has automatically been saved.", GateEdit[playerid]);
					SendClientMessageEx(playerid, COLOR_WHITE, string);
				 	MySQL_Update_Gate(GateEdit[playerid]);
				 	RecreateGateText(GateEdit[playerid]);
				}

				case 4:
				{
					EditDynamicObject(playerid, GateInfo[GateEdit[playerid]][gObjectHandle]);
					SetPVarInt(playerid, "GateMethod", 2);
	 				SendClientMessageEx(playerid, COLOR_WHITE, "You have are now editing the destination of the gate, it will move to the destination when /gate is used.");
				}

				case 5:
				{
				    DestroyDynamic3DTextLabel(GateInfo[GateEdit[playerid]][gTextDisplay]);
	   				DestroyDynamicObject(GateInfo[GateEdit[playerid]][gObjectHandle]);
				    for (new eGateData:i; i < eGateData; i++)
				    {
				        GateInfo[GateEdit[playerid]][eGateData:i] = 0;
					}
			        format(string, sizeof(string), "DELETE FROM `gates` WHERE `Id` = '%d'", GateEdit[playerid]);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
			        format(string, sizeof(string), "You have successfully deleted gate %d from the database.", GateEdit[playerid]);
					SendClientMessageEx(playerid, COLOR_WHITE, string);
				}

				case 6:
				{
				    GateEditOption[playerid] = 7;
	       			SendClientMessageEx(playerid, COLOR_WHITE, "The speed can be no longer than 10 and smaller than 0.");
		   			format(string, sizeof(string), "{FFFFFF}You are currently editing the Speed of Gate %d (1-10).\nCurrent Value: %d", GateEdit[playerid], GateInfo[GateEdit[playerid]][gSpeed]);
					ShowPlayerDialogEx(playerid, DIALOG_GATE_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Gate Editor - Speed", string, "Submit", "Cancel");
				}
			}
		}

		case DIALOG_GATE_SUBMIT:
		{
			if(!GateEdit[playerid]) return 0;
			else if(!IsValidDynamicObject(GateInfo[GateEdit[playerid]][gObjectHandle])) return 0;
			else if(!response) return 0;

			new
			    g = GateEdit[playerid],
			    string[256];

			switch (GateEditOption[playerid])
			{
				case 1:
				{
				    format(GateInfo[g][gPassword], 12, "%s", inputtext);
				    format(string, sizeof(string), "You have changed gate id %d's password to %s.", g, GateInfo[g][gPassword]);
				    SendClientMessageEx(playerid, COLOR_WHITE, string);
			        format(string, sizeof(string), "UPDATE `gates` SET `Password` = '%s' WHERE `Id` = '%d'", GateInfo[g][gPassword], g);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
				}

				case 2:
				{
				    if(strval(inputtext) < 1)
				    {
		   				format(string, sizeof(string), "{FFFFFF}You are currently editing the Model Id of Gate %d.\nCurrent Value: %d", GateEdit[playerid], GateInfo[GateEdit[playerid]][gModel]);
						ShowPlayerDialogEx(playerid, DIALOG_GATE_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Gate Editor - Model", string, "Submit", "Cancel");
						return 1;
				    }
				    GateInfo[g][gModel] = strval(inputtext);
				    DestroyDynamicObject(GateInfo[g][gObjectHandle]);
	        		GateInfo[g][gObjectHandle] = CreateDynamicObject(GateInfo[g][gModel], GateInfo[g][gPosition][0], GateInfo[g][gPosition][1], GateInfo[g][gPosition][2], GateInfo[g][gRotation][0], GateInfo[g][gRotation][1], GateInfo[g][gRotation][2]);
				    format(string, sizeof(string), "You have changed gate id %d's model to %d.", g, GateInfo[g][gModel]);
				    SendClientMessageEx(playerid, COLOR_WHITE, string);
			        format(string, sizeof(string), "UPDATE `gates` SET `Model` = '%d' WHERE `Id` = '%d'", GateInfo[g][gModel], g);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
				}

				case 7:
				{
				    if(strval(inputtext) < 0 || strval(inputtext) > 10)
				    {
				        SendClientMessageEx(playerid, COLOR_WHITE, "The speed can be no longer than 10 and smaller than 0.");
		   				format(string, sizeof(string), "{FFFFFF}You are currently editing the Speed of Gate %d (1-10).\nCurrent Value: %d", GateEdit[playerid], GateInfo[GateEdit[playerid]][gSpeed]);
						ShowPlayerDialogEx(playerid, DIALOG_GATE_SUBMIT, DIALOG_STYLE_INPUT, "{FFFFFF}Gate Editor - Speed", string, "Submit", "Cancel");
						return 1;
				    }
				    GateInfo[g][gSpeed] = strval(inputtext);
				    format(string, sizeof(string), "You have changed gate id %d's speed to %d.", g, GateInfo[g][gSpeed]);
				    SendClientMessageEx(playerid, COLOR_WHITE, string);
			        format(string, sizeof(string), "UPDATE `gates` SET `Speed` = '%d' WHERE `Id` = '%d'", GateInfo[g][gSpeed], g);
					mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);

				}
			}
		}
		case DIALOG_VEHICLE_ADMIN:
		{
		    if(!response) return 0;
		    else if(!VehicleEdit[playerid]) return 0;

			new string[256];
			switch (listitem)
			{
			    case 0:
			    {
			        VehicleEditOption[playerid] = 1;
    				format(string, sizeof(string), "{FFFFFF}You are currently editing the model of Vehicle %d.\nCurrent value: %d", VehicleEdit[playerid], DynamicVehicleInfo[VehicleEdit[playerid]][dvModel]);
			    	ShowPlayerDialogEx(playerid, DIALOG_VEHICLE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Vehicle Editor - Model", string, "Submit", "Cancel");
			    }

			    case 1:
			    {
			        VehicleEditOption[playerid] = 2;
   					format(string, sizeof(string), "{FFFFFF}You are currently editing the Type of Vehicle %d.\nAvailable Types - 0: Public, 1: Rent, 2: DMV, 3: Taxi, 4: Pizza, 5: Trucker\nCurrent Value: %d", VehicleEdit[playerid], DynamicVehicleInfo[VehicleEdit[playerid]][dvType]);
				    ShowPlayerDialogEx(playerid, DIALOG_VEHICLE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Vehicle Editor - Type", string, "Submit", "Cancel");
			    }

			    case 2:
			    {
			        VehicleEditOption[playerid] = 3;
    				format(string, sizeof(string), "{FFFFFF}You are currently editing the faction of Vehicle %d.\nSelect an ID from ./factions. Use '0' for a public set.\nCurrent value: %d", VehicleEdit[playerid], DynamicVehicleInfo[VehicleEdit[playerid]][dvFaction]);
			    	ShowPlayerDialogEx(playerid, DIALOG_VEHICLE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Vehicle Editor - Faction", string, "Submit", "Cancel");
			    }

			    case 3:
			    {
			        VehicleEditOption[playerid] = 4;
    				format(string, sizeof(string), "{FFFFFF}You are currently editing color 1 of Vehicle %d.\nCurrent value: %d", VehicleEdit[playerid], DynamicVehicleInfo[VehicleEdit[playerid]][dvColor][0]);
			    	ShowPlayerDialogEx(playerid, DIALOG_VEHICLE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Vehicle Editor - Color", string, "Submit", "Cancel");
			    }

			    case 4:
			    {
			        VehicleEditOption[playerid] = 5;
    				format(string, sizeof(string), "{FFFFFF}You are currently editing color 2 of Vehicle %d.\nCurrent value: %d", VehicleEdit[playerid], DynamicVehicleInfo[VehicleEdit[playerid]][dvColor][1]);
			    	ShowPlayerDialogEx(playerid, DIALOG_VEHICLE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Vehicle Editor - Color", string, "Submit", "Cancel");
			    }

			    case 5:
			    {
					if (IsPlayerInAnyVehicle(playerid))
					{
						new playerVehicle;
          				playerVehicle = GetPlayerVehicleID(playerid);
					    GetVehiclePos(playerVehicle,PlayerInfo[playerid][pPositionX], PlayerInfo[playerid][pPositionY], PlayerInfo[playerid][pPositionZ]);
					    GetVehicleZAngle(playerVehicle,PlayerInfo[playerid][pFacingAngle]);
					}
					else
					{
						GetPlayerPos(playerid, PlayerInfo[playerid][pPositionX], PlayerInfo[playerid][pPositionY], PlayerInfo[playerid][pPositionZ]);
						GetPlayerFacingAngle(playerid, PlayerInfo[playerid][pFacingAngle]);
					}
				    DynamicVehicleInfo[VehicleEdit[playerid]][dvPosition][0] = PlayerInfo[playerid][pPositionX];
				    DynamicVehicleInfo[VehicleEdit[playerid]][dvPosition][1] = PlayerInfo[playerid][pPositionY];
				    DynamicVehicleInfo[VehicleEdit[playerid]][dvPosition][2] = PlayerInfo[playerid][pPositionZ];
				    DynamicVehicleInfo[VehicleEdit[playerid]][dvFacingAngle] = PlayerInfo[playerid][pFacingAngle];
       				format(string, sizeof(string), "You've successfully placed Vehicle %d at your current location.", VehicleEdit[playerid]);
        			SendClientMessageEx(playerid, COLOR_WHITE, string);
        			UpdateDynamicVehicle(VehicleEdit[playerid], .PositionX = DynamicVehicleInfo[VehicleEdit[playerid]][dvPosition][0], .PositionY = DynamicVehicleInfo[VehicleEdit[playerid]][dvPosition][1], .PositionZ = DynamicVehicleInfo[VehicleEdit[playerid]][dvPosition][2]);
        			return 1;
			    }
			    case 6:
			    {
			        VehicleEditOption[playerid] = 7;
					format(string, sizeof(string), "{FFFFFF}You are about to delete Vehicle %d.\nPlease type in 'confirm' to confirm deletion.", VehicleEdit[playerid]);
				    ShowPlayerDialogEx(playerid, DIALOG_VEHICLE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Vehicle Editor - Deletion", string, "Submit", "Cancel");
			    }
			}
		}
		case DIALOG_VEHICLE_ADMIN_EDIT:
		{
		    if(!VehicleEdit[playerid]) return 0;
		    else if(DynamicVehicleInfo[VehicleEdit[playerid]][dvHandleId] == INVALID_VEHICLE_ID) return 0;
		    else if(!response) return 0;

		    new dv = VehicleEdit[playerid], string[256];
			switch (VehicleEditOption[playerid])
			{
			    case 1:
			    {
			        if(!IsValidVehicleModel(strval(inputtext)))
					{
    					format(string, sizeof(string), "{FFFFFF}You are currently editing the model of Vehicle %d.\nPlease enter a valid model ID (400-611).\nCurrent value: %d", dv, DynamicVehicleInfo[dv][dvModel]);
				    	ShowPlayerDialogEx(playerid, DIALOG_VEHICLE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Vehicle Editor - Model", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Vehicle %d's model from %d to %d.", dv, DynamicVehicleInfo[dv][dvModel], strval(inputtext));
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
					UpdateDynamicVehicle(dv, strval(inputtext));
					return 1;
			    }
			    case 2:
			    {
			        if(strval(inputtext) < 0 || strval(inputtext) > 5)
					{
    					format(string, sizeof(string), "{FFFFFF}You are currently editing the type of Vehicle %d.\nPlease enter a valid type (0: Public, 1: Rent, 2: DMV, 3: Taxi, 4: Pizza, 5: Trucker).\nCurrent value: %d", dv, DynamicVehicleInfo[dv][dvType]);
				    	ShowPlayerDialogEx(playerid, DIALOG_VEHICLE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Vehicle Editor - Type", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Vehicle %d's type from %d to %d.", dv, DynamicVehicleInfo[dv][dvType], strval(inputtext));
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
					UpdateDynamicVehicle(dv, .type = strval(inputtext));
					return 1;
			    }
			    case 3:
			    {
			        if(strval(inputtext) < 0 || strval(inputtext) > MAX_FACTIONS)
					{
    					format(string, sizeof(string), "{FFFFFF}You are currently editing the faction of Vehicle %d.\nPlease enter a valid faction ID (/factions). Use '0' to remove faction restriction.\nCurrent value: %d", dv, DynamicVehicleInfo[dv][dvFaction]);
				    	ShowPlayerDialogEx(playerid, DIALOG_VEHICLE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Vehicle Editor - Faction", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Vehicle %d's faction from %d to %d.", dv, DynamicVehicleInfo[dv][dvFaction], strval(inputtext));
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
					UpdateDynamicVehicle(dv, .faction = strval(inputtext));
					return 1;
			    }
			    case 4:
			    {
			        if(strval(inputtext) < 0 || strval(inputtext) > 255)
					{
    					format(string, sizeof(string), "{FFFFFF}You are currently editing the color 1 of Vehicle %d.\nPlease enter a valid color ID (0-255).\nCurrent value: %d", dv, DynamicVehicleInfo[dv][dvColor][0]);
				    	ShowPlayerDialogEx(playerid, DIALOG_VEHICLE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Vehicle Editor - Color", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Vehicle %d's color 1 from %d to %d.", dv, DynamicVehicleInfo[dv][dvColor][0], strval(inputtext));
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
					UpdateDynamicVehicle(dv, .color1 = strval(inputtext));
					return 1;
			    }
			    case 5:
			    {
			        if(strval(inputtext) < 0 || strval(inputtext) > 255)
					{
    					format(string, sizeof(string), "{FFFFFF}You are currently editing the color 2 of Vehicle %d.\nPlease enter a valid color ID (0-255).\nCurrent value: %d", dv, DynamicVehicleInfo[dv][dvColor][1]);
				    	ShowPlayerDialogEx(playerid, DIALOG_VEHICLE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Vehicle Editor - Color", string, "Submit", "Cancel");
				    	return 1;
					}
		            format(string, sizeof(string), "You have successfully changed Vehicle %d's color 2 from %d to %d.", dv, DynamicVehicleInfo[dv][dvColor][0], strval(inputtext));
		            SendClientMessageEx(playerid, COLOR_WHITE, string);
					UpdateDynamicVehicle(dv, .color2 = strval(inputtext));
					return 1;
			    }
			    case 7:
			    {
		            if(!strcmp(inputtext, "confirm", true))
		            {
						DestroyDynamicVehicle(dv);
		                format(string, sizeof(string), "You have successfully deleted Vehicle %d from the database.", dv);
		                SendClientMessageEx(playerid, COLOR_WHITE, string);
		            }
		            else
		            {
						format(string, sizeof(string), "{FFFFFF}You are about to delete Vehicle %d.\nPlease type in 'confirm' to confirm deletion.", dv);
					    ShowPlayerDialogEx(playerid, DIALOG_VEHICLE_ADMIN_EDIT, DIALOG_STYLE_INPUT, "{FFFFFF}Vehicle Editor - Deletion", string, "Submit", "Cancel");
		            }
					return 1;
			    }
			}
		}
		case DIALOG_LOCKER_MAIN:
	    {
	        if(PlayerInfo[playerid][pFaction] == 0) return 0;
			if(!response) return 0;
			switch(listitem)
			{
			    case 0:
			    {
					new ChatString[128];
					switch(PlayerInfo[playerid][pDuty])
					{
					    case 1:
					    {
		                    PlayerInfo[playerid][pDuty] = 0;
							format(ChatString, sizeof(ChatString), "* %s opens their locker, depositing their badge and equipment.", GetPlayerNameEx(playerid));
							ProxDetector(20.0, playerid, ChatString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
							SetPlayerHealthEx(playerid, 100);
							SetPlayerArmourEx(playerid, 0);
		                    SetPlayerToTeamColor(playerid);
					    }
					    default:
					    {
		                    PlayerInfo[playerid][pDuty] = 1;
							format(ChatString, sizeof(ChatString), "* %s opens their locker, withdrawing their badge and equipment.", GetPlayerNameEx(playerid));
							ProxDetector(20.0, playerid, ChatString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
							SetPlayerHealthEx(playerid, 100);
							SetPlayerArmourEx(playerid, 100);
		                    SetPlayerToTeamColor(playerid);
					    }
					}
			    }
			    case 1:
			    {
			        if(IsACop(playerid)) return ShowPlayerDialogEx(playerid, DIALOG_LOCKER_LEO, DIALOG_STYLE_LIST, "Equipment", "First Aid\r\nKevlar Vest\r\nDeagle\r\nShotgun\r\nMP5\r\nM4\r\nSniper\r\nNightstick\r\nTeargas\r\nMace", "Purchase", "Cancel");
			        if(IsAGov(playerid)) return ShowPlayerDialogEx(playerid, DIALOG_LOCKER_GOV, DIALOG_STYLE_LIST, "Equipment", "First Aid\r\nKevlar Vest\r\nDeagle\r\nShotgun\r\nMP5", "Purchase", "Cancel");
			        if(IsAMedic(playerid)) return ShowPlayerDialogEx(playerid, DIALOG_LOCKER_MED, DIALOG_STYLE_LIST, "Equipment", "First Aid\r\nKevlar Vest\r\nShotgun\r\nChainsaw\r\nFire Extinguisher\r\nCamera", "Purchase", "Cancel");
			    }
			    case 2:
			    {
			    	return ShowPlayerDialogEx(playerid, DIALOG_LOCKER_CLOTHING, DIALOG_STYLE_INPUT, "Clothing", "For reference to the skin ID's used by each rank, please check out the forums.\nPlease enter a valid skin ID ranging (0-299) below:","Select", "Cancel");
			    }
			}
	    }
	    

	    case DIALOG_LOCKER_CLOTHING:
	    {
			if(!response) return 0;
			if(strval(inputtext) < 0 || strval(inputtext) > 299)
			{
			    SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid skin ID.");
			    return ShowPlayerDialogEx(playerid, DIALOG_LOCKER_CLOTHING, DIALOG_STYLE_INPUT, "Clothing", "Please enter a valid skin ID ranging (0-299) below:", "Submit", "Cancel");
			}
			SetPlayerSkinEx(playerid, strval(inputtext));
	    }

	    case DIALOG_LOCKER_LEO:
	    {
			if(!response) return 0;
			new factionid = PlayerInfo[playerid][pFaction];
	        switch(listitem)
	        {
	            case 0:
	            {
					SetPlayerHealthEx(playerid, 100);
	            }
	            case 1:
	            {
					SetPlayerArmourEx(playerid, 100); // Kevlar Vest
	            }
	            case 2:
	            {
					if(VaultInfo[factionid][vMoney] < 600) return SendClientMessageEx(playerid, COLOR_YELLOW, "Your faction vault does not have the sufficient funds, you cannot obtain this item.");
                    GivePlayerWeaponEx(playerid, WEAPON_DEAGLE); // Deagle
		    		AddVaultMoney(factionid, -600);
	            }
	            case 3:
	            {
					if(VaultInfo[factionid][vMoney] < 300) return SendClientMessageEx(playerid, COLOR_YELLOW, "Your faction vault does not have the sufficient funds, you cannot obtain this item.");
		        	GivePlayerWeaponEx(playerid, WEAPON_SHOTGUN); // Shotgun
					AddVaultMoney(factionid, -300);
	            }
	            case 4:
	            {
					if(VaultInfo[factionid][vMoney] < 400) return SendClientMessageEx(playerid, COLOR_YELLOW, "Your faction vault does not have the sufficient funds, you cannot obtain this item.");
		        	GivePlayerWeaponEx(playerid, WEAPON_MP5); // MP5
		    		AddVaultMoney(factionid, -400);
	            }
	            case 5:
	            {
					if(VaultInfo[factionid][vMoney] < 800) return SendClientMessageEx(playerid, COLOR_YELLOW, "Your faction vault does not have the sufficient funds, you cannot obtain this item.");
					else if(PlayerInfo[playerid][pDivision] != 2 && PlayerInfo[playerid][pRank] < 4) return SendClientMessageEx(playerid, COLOR_GREY, "You must be in the SWAT Division or Rank 4+ to obtain this item.");
					GivePlayerWeaponEx(playerid, WEAPON_M4); // M4
		    		AddVaultMoney(factionid, -800);
	            }
	            case 6:
	            {
					if(VaultInfo[factionid][vMoney] < 1250) return SendClientMessageEx(playerid, COLOR_YELLOW, "Your faction vault does not have the sufficient funds, you cannot obtain this item.");
					else if(PlayerInfo[playerid][pDivision] != 2 && PlayerInfo[playerid][pRank] < 4) return SendClientMessageEx(playerid, COLOR_GREY, "You must be in the SWAT Division or Rank 4+ to obtain this item.");
	                GivePlayerWeaponEx(playerid, WEAPON_SNIPER); // Sniper
		    		AddVaultMoney(factionid, -1250);
	            }
	            case 7:
	            {
	                GivePlayerWeaponEx(playerid, 3); // NIGHTSTICK
	            }
	            case 8:
	            {
					if(VaultInfo[factionid][vMoney] < 100) return SendClientMessageEx(playerid, COLOR_YELLOW, "Your faction vault does not have the sufficient funds, you cannot obtain this item.");
					else if(PlayerInfo[playerid][pDivision] != 2 && PlayerInfo[playerid][pRank] < 4) return SendClientMessageEx(playerid, COLOR_GREY, "You must be in the SWAT Division or Rank 4+ to obtain this item.");
	                GivePlayerWeaponEx(playerid, 17); // TEAR GAS
		    		AddVaultMoney(factionid, -100);
	            }
	            case 9:
	            {
	                GivePlayerWeaponEx(playerid, 41); // MACE
	            }
	        }
   			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	    }

	    case DIALOG_LOCKER_GOV:
	    {
			if(!response) return 0;
			new factionid = PlayerInfo[playerid][pFaction];
	        switch(listitem)
	        {
	            case 0:
	            {
					SetPlayerHealthEx(playerid, 100);
	            }
	            case 1:
	            {
					SetPlayerArmourEx(playerid, 100); // Kevlar Vest
	            }
	            case 2:
	            {
					if(VaultInfo[factionid][vMoney] < 600) return SendClientMessageEx(playerid, COLOR_YELLOW, "Your faction vault does not have the sufficient funds, you cannot obtain this item.");
                    GivePlayerWeaponEx(playerid, WEAPON_DEAGLE); // Deagle
		    		AddVaultMoney(factionid, -600);
	            }
	            case 3:
	            {
					if(VaultInfo[factionid][vMoney] < 300) return SendClientMessageEx(playerid, COLOR_YELLOW, "Your faction vault does not have the sufficient funds, you cannot obtain this item.");
		        	GivePlayerWeaponEx(playerid, WEAPON_SHOTGUN); // Shotgun
					AddVaultMoney(factionid, -300);
	            }
	            case 4:
	            {
					if(VaultInfo[factionid][vMoney] < 400) return SendClientMessageEx(playerid, COLOR_YELLOW, "Your faction vault does not have the sufficient funds, you cannot obtain this item.");
		        	GivePlayerWeaponEx(playerid, WEAPON_MP5); // MP5
		    		AddVaultMoney(factionid, -400);
	            }
	        }
   			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	    }

	    case DIALOG_LOCKER_MED:
	    {
			if(!response) return 0;
			new factionid = PlayerInfo[playerid][pFaction];
	        switch(listitem)
	        {
	            case 0:
	            {
					SetPlayerHealthEx(playerid, 100);
	            }
	            case 1:
	            {
					SetPlayerArmourEx(playerid, 100); // Kevlar Vest
	            }
	            case 2:
	            {
					if(VaultInfo[factionid][vMoney] < 300) return SendClientMessageEx(playerid, COLOR_YELLOW, "Your faction vault does not have the sufficient funds, you cannot obtain this item.");
		        	GivePlayerWeaponEx(playerid, WEAPON_SHOTGUN); // Shotgun
					AddVaultMoney(factionid, -300);
	            }
	            case 3:
	            {
					if(VaultInfo[factionid][vMoney] < 400) return SendClientMessageEx(playerid, COLOR_YELLOW, "Your faction vault does not have the sufficient funds, you cannot obtain this item.");
		        	GivePlayerWeaponEx(playerid, WEAPON_CHAINSAW); // Chainsaw
		    		AddVaultMoney(factionid, -400);
	            }
	            case 4:
	            {
					if(VaultInfo[factionid][vMoney] < 400) return SendClientMessageEx(playerid, COLOR_YELLOW, "Your faction vault does not have the sufficient funds, you cannot obtain this item.");
		        	GivePlayerWeaponEx(playerid, 42); // Extinguisher
		    		AddVaultMoney(factionid, -400);
	            }
	            case 5:
	            {
					if(VaultInfo[factionid][vMoney] < 35) return SendClientMessageEx(playerid, COLOR_YELLOW, "Your faction vault does not have the sufficient funds, you cannot obtain this item.");
		        	GivePlayerWeaponEx(playerid, 43); // Camera
		    		AddVaultMoney(factionid, -35);
	            }
	        }
   			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	    }

	    case DIALOG_COLLECT_PLANT:
	    {
			if(!response) return 0;
	    	new
				string[128],
				randSeeds = random(4) + 2,
				foundPlant = 0;

			foreach (new i: Player)
			{
				if(IsPlayerInRangeOfPoint(playerid, 4.0, PlayerInfo[i][pPlantPosition][0], PlayerInfo[i][pPlantPosition][1], PlayerInfo[i][pPlantPosition][2]))
				{
				    if(GetPlayerInterior(playerid) == PlayerInfo[i][pPlantPosition][3] && GetPlayerVirtualWorld(playerid) == PlayerInfo[i][pPlantPosition][4])
				    {
		                PlayerInfo[i][pPlantPosition][0] = 0;
						PlayerInfo[i][pPlantPosition][1] = 0;
						PlayerInfo[i][pPlantPosition][2] = 0;
						PlayerInfo[i][pPlantPosition][3] = 0;
						PlayerInfo[i][pPlantPosition][4] = 0;
						PlayerInfo[i][pPlantGrowth] = 0;
						DestroyDynamicObject(WeedPlant[i]);
						WeedPlant[i] = 0;
						foundPlant = 1;
						break;
				    }
				}
			}

			for (new i=0; i < sizeof(WeedPlants); i++)
			{
			    if(IsPlayerInRangeOfPoint(playerid, 15.0, WeedPlants[i][0], WeedPlants[i][1], WeedPlants[i][2]))
			    {
			    	if(IsPlayerInRangeOfPoint(playerid, 4.0, WeedPlants[i][0], WeedPlants[i][1], WeedPlants[i][2]))
			    	{
			    	    if(PlantData[i][wpObjectHandle] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near a plant to use this command.");
		    			DestroyDynamicObject(PlantData[i][wpObjectHandle]);
		    			PlantData[i][wpObjectHandle] = 0;
						foundPlant = 1;
		    			break;
			    	}
				}
			}

			if(foundPlant == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near a plant to use this command.");

			switch (listitem)
			{
			    case 0:
			    {
	    			PlayerInfo[playerid][pSeeds] += randSeeds;
	    			format(string, sizeof(string), "You have managed to successfully collect %d seeds in total, you can use them by typing /plantseeds.", randSeeds);
			    }

			    case 1:
			    {
    				PlayerInfo[playerid][pWeed] += randSeeds * 4;
    				format(string, sizeof(string), "You have managed to successfully collect %d grams of weed in total.", randSeeds * 4);
			    }
			}
    		SendClientMessageEx(playerid, COLOR_WHITE, string);
    		ApplyAnimation(playerid,"BOMBER","BOM_Plant_Crouch_In", 4.0, 0, 0, 0, 0, 0, 1);
	    }

		case DIALOG_RADIO:
		{
			if(!IsPlayerInAnyVehicle(playerid) || !response)
			    return 0;
			new
			    string[128],
				vehid = GetPlayerVehicleID(playerid);
			if(listitem == 0)
			{
			    if(VehicleInfo[vehid][vRadio] == 0) return SendClientMessageEx(playerid, COLOR_WHITE, "You can't turn the radio off when it is already off.");
			    VehicleInfo[vehid][vRadio] = 0;
        		foreach(new i: Player)
        		{
        		    if(GetPlayerVehicleID(i) == vehid) StopAudioStreamForPlayer(i);
        		}
				format(string, sizeof(string), "* %s reaches over towards the radio and turns it off.", GetPlayerNameEx(playerid));
				ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
			}
			else
			{
				VehicleInfo[vehid][vRadio] = listitem;
        		foreach(new i: Player)
        		{
        		    if(GetPlayerVehicleID(i) == vehid)
						PlayAudioStreamForPlayer(i, RadioStations[VehicleInfo[vehid][vRadio] - 1][0]);
        		}
				format(string, sizeof(string), "* %s reaches over towards the radio and changes the station.", GetPlayerNameEx(playerid));
				ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
			}
		}

	    case DIALOG_CLOTHES_BUY:
	    {
	        new b = GetPlayerBusiness(playerid);

			if(!IsInsideBusiness(playerid, BUSINESS_TYPE_CLOTHING)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not inside a business.");
	        else if(!response) return 0;
			else if(strval(inputtext) < 1 || strval(inputtext) > 299) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid skin id.");
			else if(!IsAValidSkin(strval(inputtext))) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot purchase restricted skins.");
			else if(PlayerInfo[playerid][pMoney] < 250) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have enough money ($250) to purchase this skin.");
			PlayerInfo[playerid][pSkin] = strval(inputtext);
			AddBusinessSale(b, 250, playerid);
			SetPlayerSkinEx(playerid, PlayerInfo[playerid][pSkin]);
   			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	    }

	    case DIALOG_AMMUNATION_BUY:
	    {
			new
	            b = GetPlayerBusiness(playerid);
			if(PlayerInfo[playerid][pGunLicense] == 0 && !IsACop(playerid) && !IsAGov(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must own a gun license to purchase weapons from this store.");
			else if(!response) return 0;
			else if(!IsInsideBusiness(playerid, BUSINESS_TYPE_AMMUNATION)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not inside a business.");

			switch(listitem)
			{
			    case 0:
			    {
			   		if(PlayerInfo[playerid][pMoney] < 150) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have enough money for this item.");
			        GivePlayerWeaponEx(playerid, 22);
					AddBusinessSale(b, 150, playerid);
			    }

				case 1:
			    {
		    		if(PlayerInfo[playerid][pMoney] < 350) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have enough money for this item.");
			        GivePlayerWeaponEx(playerid, 25);
					AddBusinessSale(b, 350, playerid);
			    }

				case 2:
				{
			    	if(PlayerInfo[playerid][pMoney] < 400) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have enough money for this item.");
					GivePlayerWeaponEx(playerid, 33);
					AddBusinessSale(b, 400, playerid);
				}

				case 3:
				{
			 		if(PlayerInfo[playerid][pMoney] < 50) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have enough money for this item.");
					GivePlayerWeaponEx(playerid, 6);
					AddBusinessSale(b, 50, playerid);
	    		}
				case 4:
				{
			 		if(PlayerInfo[playerid][pMoney] < 1500) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have enough money for this item.");
					SetPlayerArmourEx(playerid, 50.0);
					AddBusinessSale(b, 1500, playerid);
	    		}
			}
   			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	    }

	    case DIALOG_SEXSTORE_BUY:
	    {
	        new
	            b = GetPlayerBusiness(playerid);
	        if(!response) return 0;
			else if(!IsInsideBusiness(playerid, BUSINESS_TYPE_SEXSTORE)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not inside a business.");

	        switch (listitem)
	        {
	            case 0:
	            {
		    		if(PlayerInfo[playerid][pMoney] < 200) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have enough money for this item.");
		        	GivePlayerWeaponEx(playerid, 10); // Double End Dildo
					AddBusinessSale(b, 200, playerid);
	            }
	            case 1:
	            {
	                if(PlayerInfo[playerid][pMoney] < 100) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have enough money for this item.");
		        	GivePlayerWeaponEx(playerid, 11); // Dildo
					AddBusinessSale(b, 100, playerid);
	            }
	            case 2:
	            {
	                if(PlayerInfo[playerid][pMoney] < 125) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have enough money for this item.");
		        	GivePlayerWeaponEx(playerid, 12); // Vibrator
					AddBusinessSale(b, 125, playerid);
	            }
	            case 3:
	            {
	                if(PlayerInfo[playerid][pMoney] < 300) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have enough money for this item.");
		        	GivePlayerWeaponEx(playerid, 13); // Silver Vibrator
					AddBusinessSale(b, 300, playerid);
	            }
	        }
   			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	    }

	    case DIALOG_CLUB_BUY:
	    {
            if(response)
            {
		        new
		            b = GetPlayerBusiness(playerid);

	        	switch(listitem)
	        	{
					case 0:
					{
						if(!IsInsideBusiness(playerid, BUSINESS_TYPE_CLUB)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not inside a business.");
					    else if(PlayerInfo[playerid][pMoney] < 15) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have that much.");
					    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_BEER);
						AddBusinessSale(b, 15, playerid);
					}

					case 1:
					{
						if(!IsInsideBusiness(playerid, BUSINESS_TYPE_CLUB)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not inside a business.");
					    else if(PlayerInfo[playerid][pMoney] < 23) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have that much.");
					    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_WINE);
						AddBusinessSale(b, 23, playerid);
					}

					case 2:
					{
						if(!IsInsideBusiness(playerid, BUSINESS_TYPE_CLUB)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not inside a business.");
					    else if(PlayerInfo[playerid][pMoney] < 6) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have that much.");
					    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_SPRUNK);
						AddBusinessSale(b, 6, playerid);
					}
				}
   				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			}
		}

		case DIALOG_STORE_BUY:
		{
		    if(response)
		    {
				if(!IsInsideBusiness(playerid, BUSINESS_TYPE_STORE)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not inside a business.");
		        new
		            b = GetPlayerBusiness(playerid);

		        switch(listitem)
		        {
					case 0:
					{
					    if(PlayerInfo[playerid][pMoney] < 90) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have enough ($90) to purchase the cellphone.");
					    new
							string[128],
							randPhone = random(MAX_PH);
					    do
					    {
					        randPhone = random(MAX_PH);
					    }
					    while(!IsNumberAvailable(randPhone));
						AddBusinessSale(b, 90, playerid);
						if(PlayerInfo[playerid][pPhoneNumber] != 0)
						{
					    	DeletePhoneNumber(PlayerInfo[playerid][pPhoneNumber]);
					    }
					    AddPhoneNumber(randPhone);
					    PlayerInfo[playerid][pPhoneNumber] = randPhone;
					    format(string, sizeof(string), "You have purchased a new cellphone with the number: %d", randPhone);
						SendClientMessageEx(playerid, COLOR_WHITE, string);
					}

		            case 1:
		            {
		                if(PlayerInfo[playerid][pWalkieTalkie] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "You already own a walkie talkie.");
                        else if(PlayerInfo[playerid][pMoney] < 220) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have that much.");
						AddBusinessSale(b, 220, playerid);
						PlayerInfo[playerid][pWalkieTalkie] = 1;
						SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a walkie talkie, type /setchannel <frequency> to set the channel and /wt to use it.");
					}

					case 2:
					{
		                if(PlayerInfo[playerid][pMoney] < 70) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have $7 to purchase a Spray Can.");
					    else if(PlayerInfo[playerid][pSprayCan] + 1 > 20) return SendClientMessageEx(playerid, COLOR_GREY, "You have reached the maximum amount of spray cans in your inventory.");
						AddBusinessSale(b, 70, playerid);
					    PlayerInfo[playerid][pSprayCan] += 10;
					    SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a pack of 10 spraycans, type /colorcar <color 1> <color 2> to change your vehicles color.");
					}
					case 3:
					{
					    if(PlayerInfo[playerid][pMoney] < 85) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have $85 to purchase a baseball bat.");
						AddBusinessSale(b, 85, playerid);
						GivePlayerWeaponEx(playerid, 5);
						SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a baseball bat, it cost you $85.");
					}
					case 4:
					{
					    if(PlayerInfo[playerid][pMoney] < 100) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have $100 to purchase a gas can.");
					    else if(PlayerInfo[playerid][pGasCans] >= 2) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have $100 to purchase a gas can.");
						AddBusinessSale(b, 100, playerid);
						PlayerInfo[playerid][pGasCans] += 1;
						SendClientMessageEx(playerid, COLOR_WHITE, "You have purchased a gas can, you can type /refill while inside a vehicle to add 20 percent more fuel.");
					}
				}
   				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			}
		}
		case 2011:
		{
		    if(!response)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "You just canceled your drivers license test.");
            	LicenseTestAC[playerid] = 0;
				return 1;
			}
			LicenseTestAC[playerid] = 0;
			switch(listitem)
			{
                case 0:
                {
                    ShowPlayerDialogEx(playerid,2011,DIALOG_STYLE_LIST,"Written Exam","What should you do when you are driving at night?\r\n1) Make sure you are driving slow enough incase of an emergency.\r\n2) Roll down your window so that the fresh air will help keep you awake.\r\n3) If you are sleepy, drink coffee or other caffeine products.","Answer", "Cancel");
				}
			    case 1:
			    {
                    LicenseTestAC[playerid]++;
			        ShowPlayerDialogEx(playerid, 2012, DIALOG_STYLE_LIST, "Written Exam", "On what side of the road are you supposed to drive on?\r\n1) Left\r\n2) Right\r\n3) Middle", "Answer", "Cancel");
				}
				case 2, 3:
				{
   			        ShowPlayerDialogEx(playerid, 2012, DIALOG_STYLE_LIST, "Written Exam", "On what side of the road are you supposed to drive on?\r\n1) Left\r\n2) Right\r\n3) Middle", "Answer", "Cancel");
				}
			}
		}

		case 2012:
		{
		    if(!response)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "You just canceled your drivers license test.");
				LicenseTestAC[playerid] = 0;
				return 1;
			}
			switch(listitem)
			{
			    case 0:
			    {
                    ShowPlayerDialogEx(playerid, 2012, DIALOG_STYLE_LIST, "Written Exam", "On what side of the road are you supposed to drive on?\r\n1) Left\r\n2) Right\r\n3) Middle", "Answer", "Cancel");
				}
			    case 1, 3:
			    {
				    ShowPlayerDialogEx(playerid, 2013, DIALOG_STYLE_LIST, "Written Exam", "A pre-trip inspection should be completed:\r\n1) At least once a week.\r\n2) If any problems occurred the last the time the vehicle was operated\r\n3) Before operating the vehicle", "Answer", "Cancel");
				}
				case 2:
				{
				    LicenseTestAC[playerid]++;
				    ShowPlayerDialogEx(playerid, 2013, DIALOG_STYLE_LIST, "Written Exam", "A pre-trip inspection should be completed:\r\n1) At least once a week.\r\n2) If any problems occurred the last the time the vehicle was operated\r\n3) Before operating the vehicle", "Answer", "Cancel");
				}
			}
		}
		case 2013:
		{
		    if(!response)
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "You just cancelled your drivers license test.");
		        LicenseTestAC[playerid] = 0;
		        return 1;
			}
			switch(listitem)
			{
				case 0: ShowPlayerDialogEx(playerid, 2013, DIALOG_STYLE_LIST, "Written Exam", "A pre-trip inspection should be completed:\r\n1) At least once a week.\r\n2) If any problems occurred the last the time the vehicle was operated\r\n3) Vefore operating the vehicle", "Answer", "Cancel");
				case 2: LicenseTestAC[playerid]++;
			}
			new string[64];
	        format(string, sizeof(string), "Examiner: You have correctly answered %i/3 questions.", LicenseTestAC[playerid]);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			if(LicenseTestAC[playerid] >= 2)
			{
			    SendClientMessageEx(playerid, COLOR_WHITE, "Examiner: Congratulations! Your have passed your written exam. Get inside a vehicle outside to do the driving portion.");
			    LicenseTestAC[playerid] = 4;
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Examiner: You did not pass the written portion of the test.  Feel free to try again.");
				LicenseTestAC[playerid] = 0;
			}
   		}

		case DIALOG_CITY_HALL_MENU:
		{
		    if(!response) return 0;
		    switch(listitem)
		    {
		        case 0:
		        {
		            ShowPlayerDialogEx(playerid, DIALOG_CITY_HALL_NC, DIALOG_STYLE_INPUT, "{FFFFFF}Character Renaming", "{FFFFFF}You have selected to change your characters full name.\nYou cannot name your character whatever is of your preference, it must be approved by an administrator.\nA valid roleplay name: John_West", "Change", "Cancel");
		        }
		    }
		}

		case DIALOG_CITY_HALL_NC:
		{
		    if(!response) return 0;
		    else if(!IsRPNameText(inputtext))
		    {
		        SendClientMessageEx(playerid, COLOR_GREY, "You must enter a valid roleplay name containing an underscore and formal name capitilization.");
  				return ShowPlayerDialogEx(playerid, DIALOG_CITY_HALL_NC, DIALOG_STYLE_INPUT, "{FFFFFF}Character Renaming", "{FFFFFF}You have selected to change your characters full name.\nYou cannot name your character whatever is of your preference, it must be approved by an administrator.\nA valid roleplay name: John_West", "Change", "Cancel");
		    }
		    else if(PlayerInfo[playerid][pMoney] < 2000 && PlayerInfo[playerid][pHitman] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You must have at least $2,000 to change your name.");

			new string[160];
			mysql_escape_string(inputtext, string);
			SetPVarString(playerid, "CharacterName", string);
			format(string, sizeof(string), "{FF6347}AdmWarning:{FFFF00} %s wants to change their name to %s. (/approvename %d or /denyname %d)", PlayerInfo[playerid][pUsername], string, playerid, playerid);
			AdminAlert(string, ALERT_ADMINS);
			SendClientMessageEx(playerid, COLOR_YELLOW, "Your name change request has been sent to the administrators, please wait for approval.");
		}
	}
	return 1;
}

public MySQL_Change_Name(playerid, newname[], adminid)
{
	new string[256], rowCount;
	cache_get_row_count(rowCount);
	if(rowCount == 0)
	{
		format(string, sizeof(string), "[Namechange]: %s has changed %s's name to %s.", GetPlayerNameEx(adminid), PlayerInfo[playerid][pUsername], newname);
		Log("logs/nc.log", string);
		
		format(string, sizeof(string), "{FF6347}AdmWarning:{FFFF00} %s has changed %s's name to %s.", GetPlayerNameEx(adminid), PlayerInfo[playerid][pUsername], newname);
		AdminAlert(string, ALERT_ADMINS);
		
		LogEx(playerid, LOG_TYPE_NAMECHANGE, adminid, newname);

		if(!GetPVarInt(playerid, "FreeNamechange") && PlayerInfo[playerid][pHitman] == 0) PlayerInfo[playerid][pMoney] -= 2000;

		format(string, sizeof(string), "UPDATE `businesses` SET `Owner` = '%s' WHERE `Owner` = '%s'", newname, PlayerInfo[playerid][pUsername]);
		mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
		for (new b=1; b < MAX_BUSINESSES; b++)
		{
		    if(!strcmp(BusinessInfo[b][bOwner], PlayerInfo[playerid][pUsername], true))
		    {
		        format(BusinessInfo[b][bOwner], MAX_PLAYER_NAME, "%s", newname);
		        RecreateBusinessText(b);
		    }
		}
		format(string, sizeof(string), "UPDATE `houses` SET `Owner` = '%s' WHERE `Owner` = '%s'", newname, PlayerInfo[playerid][pUsername]);
		mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
		for (new h=1; h < MAX_HOUSES; h++)
		{
		    if(!strcmp(HouseInfo[h][hOwner], PlayerInfo[playerid][pUsername], true))
		    {
		        format(HouseInfo[h][hOwner], MAX_PLAYER_NAME, "%s", newname);
		        RecreateHouseText(h);
		    }
		}
		format(string, sizeof(string), "UPDATE `accounts` SET `Referer` = '%s' WHERE `Referer` = '%s'", newname, PlayerInfo[playerid][pUsername]);
		mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
		foreach (new i: Player)
		{
		    if(!strcmp(PlayerInfo[i][pReferer], PlayerInfo[playerid][pUsername], true))
		    {
		        format(PlayerInfo[i][pReferer], MAX_PLAYER_NAME, "%s", PlayerInfo[playerid][pUsername]);
		    }
		}
		DeletePVar(playerid, "FreeNamechange");
		format(string, sizeof(string), "UPDATE `accounts` SET `Username` = '%s' WHERE `Id` = '%d'", newname, PlayerInfo[playerid][pId]);
		mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
		format(PlayerInfo[playerid][pUsername], MAX_PLAYER_NAME, "%s", newname);
		SetPlayerName(playerid, newname);
		format(string, sizeof(string), "Your name has been successfully changed to %s.", PlayerInfo[playerid][pUsername]);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "The specified name is currently unavailable, please choose another name.");
	}
}

CMD:approvename(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_THREE))
	{
		new
		    targetid,
		    pName[MAX_PLAYER_NAME],
			string[128];
		if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /approvename <playerid>");
		else if(GetPVarInt(targetid, "gPlayerLogged") == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(GetPVarString(targetid, "CharacterName", pName, MAX_PLAYER_NAME) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player does not need a name change.");
		format(string, sizeof(string), "SELECT * FROM `accounts` WHERE `Username` = '%s'", pName);
		mysql_tquery(mConnectionHandle, string, "MySQL_Change_Name", "isii", targetid, pName, playerid);
	}
	return 1;
}

CMD:setname(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_THREE))
	{
	    new targetid, pName[MAX_PLAYER_NAME], string[128];
	    if(sscanf(params, "us[24]", targetid, pName)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /setname <playerid> <name>");
		else if(GetPVarInt(targetid, "gPlayerLogged") == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		SetPVarInt(targetid, "FreeNamechange", 1);
		format(string, sizeof(string), "SELECT * FROM `accounts` WHERE `Username` = '%s'", pName);
		mysql_tquery(mConnectionHandle, string, "MySQL_Change_Name", "isii", targetid, pName, playerid);
	}
	return 1;
}

CMD:denyname(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_THREE))
	{
		new targetid, pName[MAX_PLAYER_NAME], string[128];
		if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /denyname <playerid>");
		else if(GetPVarInt(targetid, "gPlayerLogged") == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(GetPVarString(targetid, "CharacterName", pName, MAX_PLAYER_NAME) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player does not need a name change.");
		DeletePVar(targetid, "CharacterName");
		format(string, sizeof(string), "{FF6347}AdmWarning:{FFFF00} %s has denied %s's name change request to %s.", PlayerInfo[playerid][pUsername], PlayerInfo[targetid][pUsername], pName);
		AdminAlert(string, ALERT_ADMINS);
		SendClientMessageEx(targetid, COLOR_YELLOW, "Your name change request was denied by an administrator.");
	}
	return 1;
}

stock SetDefaultRegisterStatistics(playerid)
{
  	PlayerInfo[playerid][pPositionX] = 1743.08;
	PlayerInfo[playerid][pPositionY] = -1860.55;
	PlayerInfo[playerid][pPositionZ] = 13.58;
	PlayerInfo[playerid][pFacingAngle] = 0;

	// Customize default player statistics below:
	PlayerInfo[playerid][pHealth] = 100.0; PlayerInfo[playerid][pArmour] = 0.0;
	PlayerInfo[playerid][pMoney] = 100; PlayerInfo[playerid][pBankBalance] = 500; PlayerInfo[playerid][pLevel] = 1;
	PlayerInfo[playerid][pTogNewbie] = 1; PlayerInfo[playerid][pTutorial] = 1;

	SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
	SetPlayerToTeamColor(playerid);
	TogglePlayerSpectating(playerid, false);
	//SetTimerEx("SetPlayerSpawn", 350, false, "i", playerid);
	SetPlayerSpawn(playerid);
}

new Male[62] = {1, 2, 3, 4, 5, 6, 7, 8, 14, 15, 16, 17, 18, 19, 20,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 32, 33, 34, 35, 36, 37, 42,
	43, 44, 161, 45, 46, 47, 48, 49, 50, 51, 98, 52, 57, 58, 59, 60, 61,
	66, 67, 68, 70, 72, 73, 78, 79, 80, 81, 82, 83, 84 }; // 62 lEN
new Female[24] = { 9, 10, 11, 12, 13, 31, 38, 40, 41, 53, 54, 55, 63, 64,
					65, 69, 96, 77, 90, 150, 91, 92, 93, 172 }; // 24 LEN

stock GetRandomSkin(playerid)
{
	return PlayerInfo[playerid][pGender] == 1 ? Male[random(sizeof(Male))] : Female[random(sizeof(Female))];
}


// SyncServer() - Executes every minute
public SyncServer()
{
	ConsumeGlobalFuel();
	PayDay();

	gettime(WorldTime[0], WorldTime[1], WorldTime[2]);

	foreach(new i: Player)
	{
	    if(IsPlayerConnectedEx(i)) SetPlayerTime(i, WorldTime[0], WorldTime[1]);
	}
}

// Heartbeat()-  Executes every second
public Heartbeat()
{
	foreach(new i: Player)
	{
	    if(GetPVarInt(i, "gPlayerLogged") == 1 && IsPlayerTabbed(i) == false && PlayerInfo[i][pTutorial] == 1)
	    {

			if(GetPVarInt(i, "MechTime") > 0)
			{
				SetPVarInt(i, "MechTime", GetPVarInt(i, "MechTime") - 1);
				if(GetPVarInt(i, "MechTime") == 0) DeletePVar(i, "MechTime");
			}
			if(PlayerInfo[i][pJailTime] > 0)
			{
			    if(IsPlayerTabbed(i) == false)
			    {
				    new TDString[64];
				    --PlayerInfo[i][pJailTime];
				    format(TDString, sizeof(TDString), "Time Remaining~n~  %i Seconds", PlayerInfo[i][pJailTime]);
					PlayerTextDrawSetString(i, JailTimerTD[i], TDString);
					if(PlayerInfo[i][pJailTime] == 1)
					{
						PlayerTextDrawHide(i, JailTimerTD[i]);
						PlayerInfo[i][pJailTime] = 0;
						PlayerInfo[i][pOocJail] = 0;
						SetPlayerPosEx(i, 1692.3413,1451.1672,10.7649);
						SetPlayerInteriorEx(i, 0);
						SetPlayerVirtualWorldEx(i, 0);
						ClearAnimations(i);
						SetPlayerSkin(i, PlayerInfo[i][pSkin]);
						SetPlayerToTeamColor(i);
						SendClientMessageEx(i, COLOR_LIGHTBLUE, "You have served your time in prison and now, free to return to your normal routine.");
						GameTextForPlayer(i, "~g~Freedom~n~~w~Try to be a better citizen", 5000, 1);
					}
				}
			}

			if(PlayerInfo[i][pMoney] != GetPlayerMoney(i))
			{
				ResetPlayerMoney(i);
				GivePlayerMoney(i, PlayerInfo[i][pMoney]);
			}
			// Anti Hacks (normal players)
			if(!IsAdmin(i, ADMIN_LEVEL_TWO) && GetPVarType(i, "SafeMode") == 0 && GetPVarType(i, "AdminDuty") == 0 && GetPlayerState(i) != PLAYER_STATE_WASTED && GetPlayerState(i) == PLAYER_STATE_SPAWNED)
			{
			    new string[128];
			    // Anti Weapon Hacks
				new weaponData[2];
				GetPlayerWeaponData(i, GetWeaponSlotFromId(GetPlayerWeapon(i)), weaponData[0], weaponData[1]);
				if(pCurrentWeapon[i] != weaponData[0])
				{
					OnPlayerChangeWeapon(i, weaponData[0]);
					pCurrentWeapon[i] = weaponData[0];
				}

				// Anti Jetpack Hacks
				if(GetPlayerSpecialAction(i) == SPECIAL_ACTION_USEJETPACK)
				{
				    if(GetPVarInt(i, "JetpackAuthorized") == 0)
				    {
						new reason[128];
						format(reason, sizeof(reason), "AdmCmd: %s was banned from the server, reason: Jetpack Hacking", GetPlayerNameEx(i));
						AdminAlert(reason, ALERT_GLOBAL);
						BanPlayerEx(i, "Jetpack Hacking", BAN_PERMANENT, 0);
					}
				}
				// Anti Health/Armour Hacks
				new Float:armour, Float:health;
				GetPlayerArmour(i, armour); GetPlayerHealth(i, health);
				if(armour > PlayerInfo[i][pArmour] + WeaponDamage[i] && armour > 0)
				{
					format(string, sizeof(string), "{FF6347}AdmWarning:{FFFF00} (ID: %d) %s may be armour hacking, %f armour was found while they have %f.", i, GetPlayerNameEx(i), armour, PlayerInfo[i][pArmour]);
					AdminAlert(string, ALERT_ADMINS);
			        SetPlayerArmour(i, PlayerInfo[i][pArmour]);
				}
				else if(health > PlayerInfo[i][pHealth] + WeaponDamage[i] && health > 0)
				{
					format(string, sizeof(string), "{FF6347}AdmWarning:{FFFF00} (ID: %d) %s may be health hacking, %f health was found while they have %f.", i, GetPlayerNameEx(i), health, PlayerInfo[i][pHealth]);
					AdminAlert(string, ALERT_ADMINS);
			        SetPlayerHealth(i, PlayerInfo[i][pHealth]);
				}
				else
				{
					PlayerInfo[i][pHealth] = health;
					PlayerInfo[i][pArmour] = armour;
				}
    			// Anti Speed Hacks
			    if(GetPlayerState(i) == PLAYER_STATE_DRIVER && !IsAPlane(GetPlayerVehicleID(i)))
				{
		  			new Float:fCurrentSpeed;
		  			fCurrentSpeed = player_get_speed(i);
					if(fCurrentSpeed > 200)
					{
		   				format(string, sizeof(string), "{FF6347}AdmWarning:{FFFF00} (ID %d) %s may possibly be speed hacking (%.0f MPH).", i, GetPlayerNameEx(i), fCurrentSpeed);
		   				AdminAlert(string, ALERT_ADMINS);
		   				SetPVarInt(i, "shW", GetPVarInt(i, "shW")+1);

		   				if(GetPVarInt(i, "shW") == 3 && !AreAnyAdministratorsOnline())
						{
						    DeletePVar(i, "shW");
				   			format(string, sizeof(string), "{FF6347}AdmWarning:{FFFF00} (ID %d) %s may possibly be speed hacking and has been kicked.", i, GetPlayerNameEx(i));
				   			AdminAlert(string, ALERT_ADMINS);
				   			KickEx(i);
		   				}
					}
				}
				// Anti Airbrake Hacks
				new Float: l_fPos[3], Float:resultant/*Float: l_fDist[4]*/;
				GetPlayerPos(i, l_fPos[0], l_fPos[1], l_fPos[2]);
				resultant = floatsqroot(floatpower(floatabs(l_fPos[0] - PlayerInfo[i][pPositionX]), 2.0) + floatpower(floatabs(l_fPos[1] - PlayerInfo[i][pPositionY]), 2.0) + floatpower(floatabs(l_fPos[2] - PlayerInfo[i][pPositionZ]), 2.0));
				/*
				l_fDist[0] = ((PlayerInfo[i][pPositionX] < l_fPos[0]) ? (PlayerInfo[i][pPositionX] - l_fPos[0]) : (l_fPos[0] - PlayerInfo[i][pPositionX]));
				l_fDist[1] = ((PlayerInfo[i][pPositionY] < l_fPos[1]) ? (PlayerInfo[i][pPositionY] - l_fPos[1]) : (l_fPos[1] - PlayerInfo[i][pPositionY]));
				l_fDist[2] = ((PlayerInfo[i][pPositionZ] < l_fPos[2]) ? (PlayerInfo[i][pPositionZ] - l_fPos[2]) : (l_fPos[2] - PlayerInfo[i][pPositionZ]));
				l_fDist[3] = floatsqroot(floatpower(l_fDist[0], 2.0) + floatpower(l_fDist[1], 2.0) + floatpower(l_fDist[2], 2.0));
				*/
				if(resultant > 17.5 && GetPlayerState(i) == PLAYER_STATE_ONFOOT)
				{
					if(!floatcmp(PlayerInfo[i][pPositionZ], l_fPos[2]))
					{
			   			format(string, sizeof(string), "{FF6347}AdmWarning:{FFFF00} (ID %d) %s may possibly be airbrake/teleport hacking (distance = %d).", i, GetPlayerNameEx(i), resultant);
			   			AdminAlert(string, ALERT_ADMINS);
			   			SetPVarInt(i, "abW", GetPVarInt(i, "abW")+1);

		   				if(GetPVarInt(i, "abW") == 3 && !AreAnyAdministratorsOnline())
						{
						    DeletePVar(i, "abW");
				   			format(string, sizeof(string), "{FF6347}AdmWarning:{FFFF00} (ID %d) %s may possibly be airbrake/teleport hacking and has been kicked.", i, GetPlayerNameEx(i));
				   			AdminAlert(string, ALERT_ADMINS);
				   			KickEx(i);
		   				}
					}
				}
			}
			GetPlayerPos(i, PlayerInfo[i][pPositionX], PlayerInfo[i][pPositionY], PlayerInfo[i][pPositionZ]);
			/*if(GetPlayerState(i) == PLAYER_STATE_DRIVER || GetPlayerState(i) == PLAYER_STATE_PASSENGER)
			{
			    new vid = GetPlayerVehicleID(i);
				GetVehicleHealth(vid, PlayerVehicleInfo[GetVehicleOwner(vid)][GetVehicleOwnedSlot(vid)][pvHealth]);
			}*/
		}
	}
}

public ConsumeGlobalFuel()
{
	for(new i =0; i < MAX_VEHICLES; i++)
	{
		if(!VehicleInfo[i][vTotalled] && VehicleInfo[i][vEngine] == 1 && VehicleInfo[i][vFuel] >= FUEL_COST && IsRunnableEngine(i))
		{
			VehicleInfo[i][vFuel] -= FUEL_COST;
			if(VehicleInfo[i][vFuel] < FUEL_COST)
			{
		    	VehicleInfo[i][vEngine] = 0;
		  	    SetVehicleParamsEx(i, VehicleInfo[i][vEngine], VehicleInfo[i][vLights], VehicleInfo[i][vAlarm], VehicleInfo[i][vDoors], VehicleInfo[i][vBonnet], VehicleInfo[i][vBoot], VehicleInfo[i][vObjective]);
			}
		}
	}
}

public PayDay()
{
	new currentHour = GetCurrentHour(), string[128];
	if(currentHour == (WorldTime[0] + 1) || (WorldTime[0] == 23 && currentHour == 0))
	{
	    SetWorldTime(currentHour);
	    format(string, sizeof(string), "SERVER: World Time is now %i:00.", GetCurrentHour());
		SendClientMessageToAllEx(COLOR_WHITE, string);
	    printf("SERVER: World Time is now %i:00.", GetCurrentHour());
		InitiatePaycheck();
		PlantMarijuanaPlant();
		foreach (new i: Player)
		{
            if(GetPVarInt(i, "WeedSmoked") >= 1)
            {
		        DeletePVar(i, "WeedLength");
		        DeletePVar(i, "WeedSmoked");
		        SendClientMessageEx(i, COLOR_WHITE, "The effects of the marijuana begin to slowly fade away, giving you the urge to reconsume it again.");
            }
		}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////
// COMMANDS
////////////////////////////////////////////////////////////////////////////////////////////////

CMD:ah(playerid, params[]) return cmd_adminhelp(playerid, params);
CMD:ahelp(playerid, params[]) return cmd_adminhelp(playerid, params);
CMD:adminhelp(playerid, params[])
{
	if(!IsAdmin(playerid, ADMIN_LEVEL_ONE)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not an admin.");
	SendClientMessageEx(playerid, COLOR_ORANGE, "-------------------------------------------------------------------");
	SendClientMessageEx(playerid, COLOR_WHITE, SERVER_NAME" - Administrative Help");
	if(PlayerInfo[playerid][pAdminLevel] == ADMIN_LEVEL_ONE)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "As a {FFFF00}Moderator{FFFFFF}, you are to help players on /newb(ie) and follow the server rules.");
		SendClientMessageEx(playerid, COLOR_WHITE, "You are authorized to punish players who break rules using the commands below:");
		SendClientMessageEx(playerid, COLOR_WHITE, "{FFFF00}Moderator:{FFFFFF} /staff, /kick, /jail");
	}
    if(PlayerInfo[playerid][pAdminLevel] >= ADMIN_LEVEL_TWO)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}Junior Admin:{FFFFFF} /aduty, /a, /reports, /ar, /tr, /cr, /kick, /jail, /mute, /ban, /slap, /freeze, /unfreeze, /sendto");
		SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}Junior Admin:{FFFFFF} /setvw, /setint, /gethere, /goto, /gotoid, /gotoco, /ban, /oban, /gotoplant, /gotoveh");
		SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}Junior Admin:{FFFFFF} /spectate, /gotov, /sobeitplayers, /tabbed, /revive, /ooc, /check, /release");
	}
    if(PlayerInfo[playerid][pAdminLevel] >= ADMIN_LEVEL_THREE)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}General Admin:{FFFFFF} /unmute, /fine, /heal, /ip, /jetpack, /setskin, /permaban");
	}
    if(PlayerInfo[playerid][pAdminLevel] >= ADMIN_LEVEL_FOUR)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "{FFA500}Senior Admin:{FFFFFF} /respawnvehicles, /unban, /sethp, /setarmor, /agivelicense, /setweather, /nonewbie");
	}
	if(PlayerInfo[playerid][pAdminLevel] >= ADMIN_LEVEL_FIVE)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}Head Admin:{FFFFFF} /addwaypoint, /editwaypoint, /addbusiness, /editbusiness, /forceduty");
		SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}Head Admin:{FFFFFF} /setadmin, /setadminname, /givecash, /makeleader, /fackick, /givegun");
		SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}Head Admin:{FFFFFF} /addhouse, /edithouse, /editfaction, /addgate, /editgate");
		SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}Head Admin:{FFFFFF} /makehitman, /createpvehicle, /destroypvehicle, /addvehicle, /editvehicle");
	}
	if(PlayerInfo[playerid][pAdminLevel] >= ADMIN_LEVEL_SIX)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "{0F80C8}Lead Admin:{FFFFFF} /restart, /payday, /setstat, /saveaccounts");
	}
	if(PlayerInfo[playerid][pAdminLevel] >= ADMIN_LEVEL_TWO && GetPVarType(playerid, "AdminDuty") == 0 && PlayerInfo[playerid][pAdminLevel] != ADMIN_LEVEL_SIX)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Since you are not on admin duty, you won't have access to these commands.");
		SendClientMessageEx(playerid, COLOR_WHITE, "You will only have access to /kick, /jail and /a.");
	}
	SendClientMessageEx(playerid, COLOR_ORANGE, "-------------------------------------------------------------------");
	return 1;
}

CMD:aduty(playerid, params[])
{
    if(PlayerInfo[playerid][pAdminLevel] >= ADMIN_LEVEL_TWO)
	{

	    new string[128];
	    if(!PlayerInfo[playerid][pAdminName]) return SendClientMessageEx(playerid, COLOR_WHITE, "You do not have an admin name set. Contact Human Resources for it to be set.");
	    if(GetPVarType(playerid, "AdminDuty") == 1)
	    {
			format(string, sizeof(string), "{FF6347}AdminDuty:{FFFF00} %s (%s) is now off admin duty.", PlayerInfo[playerid][pAdminName], PlayerInfo[playerid][pUsername]);
			AdminAlert(string, ALERT_ADMINS);
			SendClientMessageEx(playerid, COLOR_WHITE, "You will only have access to /kick, /jail and /a now that you're off duty.");

	        DeletePVar(playerid, "AdminDuty");
			SetPlayerHealth(playerid, PlayerInfo[playerid][pHealth]);
			SetPlayerArmour(playerid, PlayerInfo[playerid][pArmour]);
			SetPlayerName(playerid, PlayerInfo[playerid][pUsername]);
		}
		else
		{
		    if(isnull(PlayerInfo[playerid][pAdminName]) || strlen(PlayerInfo[playerid][pAdminName]) < 3) return SendClientMessageEx(playerid, COLOR_WHITE, "You don't have an admin name set yet. Please contact the Human Resources department.");
			format(string, sizeof(string), "{FF6347}AdminDuty:{FFFF00} %s (%s) is now on admin duty.", PlayerInfo[playerid][pAdminName], PlayerInfo[playerid][pUsername]);
			AdminAlert(string, ALERT_ADMINS);

		    SetPVarInt(playerid, "AdminDuty", 1);
			GetPlayerHealth(playerid, PlayerInfo[playerid][pHealth]);
			GetPlayerArmour(playerid, PlayerInfo[playerid][pArmour]);
		    SetPlayerName(playerid, PlayerInfo[playerid][pAdminName]);
		    
		    SetPlayerHealth(playerid, 0x7FB00000);
		    SetPlayerArmour(playerid, 0x7FB00000);
		}
    }
	return 1;
}

CMD:forceduty(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
	    new targetid, string[128];
	    if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /forceduty [playerid]");
	    if(!PlayerInfo[targetid][pAdminName]) return SendClientMessageEx(playerid, COLOR_WHITE, "That player doesn't have an admin name set.");
	    if(GetPVarType(targetid, "AdminDuty") == 1)
	    {
	        DeletePVar(targetid, "AdminDuty");
			SetPlayerHealth(targetid, PlayerInfo[targetid][pHealth]);
			SetPlayerArmour(targetid, PlayerInfo[targetid][pArmour]);
			SetPlayerName(targetid, PlayerInfo[targetid][pUsername]);
			format(string, sizeof(string), "{FF6347}AdminDuty:{FFFF00} %s (%s) is now forced off admin duty by %s.", PlayerInfo[targetid][pAdminName], PlayerInfo[targetid][pUsername], GetPlayerNameEx(playerid));
			AdminAlert(string, ALERT_ADMINS);
			SendClientMessageEx(targetid, COLOR_WHITE, "You will only have access to /kick, /jail and /a now that you're off duty.");
		}
		else
		{
		    if(isnull(PlayerInfo[targetid][pAdminName]) || strlen(PlayerInfo[targetid][pAdminName]) < 3) return SendClientMessageEx(targetid, COLOR_WHITE, "You don't have an admin name set yet. Please contact the Human Resources department.");
		    SetPVarInt(targetid, "AdminDuty", 1);
			GetPlayerHealth(targetid, PlayerInfo[targetid][pHealth]);
			GetPlayerArmour(targetid, PlayerInfo[targetid][pArmour]);
		    SetPlayerHealth(targetid, 0x7FB00000);
		    SetPlayerArmour(targetid, 0x7FB00000);
		    SetPlayerName(targetid, PlayerInfo[targetid][pAdminName]);
			format(string, sizeof(string), "{FF6347}AdminDuty:{FFFF00} %s (%s) is now forced on admin duty by %s.", PlayerInfo[targetid][pAdminName], PlayerInfo[targetid][pUsername], GetPlayerNameEx(playerid));
			AdminAlert(string, ALERT_ADMINS);
		}
    }
	return 1;
}

CMD:grantgunlicense(playerid, params[])
{
	if(IsACop(playerid) && PlayerInfo[playerid][pLeadership] == 1)
	{
	    new
	        targetid,
			string[128];
	    if(sscanf(params, "u", targetid))
	    {
	        return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /grantgunlicense [playerid]");
	    }
	    else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	    else if(playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
	    else if(PlayerInfo[targetid][pGunLicense] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a gun license.");
	    PlayerInfo[targetid][pGunLicense] = 1;
	    format(string, sizeof(string), "You are hereby granted a license to purchase weapons from ammunation stores by %s.", GetPlayerNameEx(playerid));
	    SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
	    format(string, sizeof(string), "You have granted %s a license to purchase weapons from ammunation stores.", GetPlayerNameEx(targetid));
	    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	    printf("%s has granted %s a gun license.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "You must have leadership of a Law Enforcement Organization to use this command.");
	}
	return 1;
}

CMD:revokegunlicense(playerid, params[])
{
	if(IsACop(playerid) && PlayerInfo[playerid][pLeadership] == 1)
	{
	    new
	        targetid,
			string[128];
	    if(sscanf(params, "u", targetid))
	    {
	        return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /revokegunlicense [playerid]");
	    }
	    else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	    else if(playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
	    else if(PlayerInfo[targetid][pGunLicense] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player doesn't have a gun license.");
	    PlayerInfo[targetid][pGunLicense] = 0;
	    format(string, sizeof(string), "Your gun license has been revoked by %s, you will not be able to purchase guns from ammunation.", GetPlayerNameEx(playerid));
	    SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
	    format(string, sizeof(string), "You have revoked %s's gun license, they will not be able to purchase guns from ammunation.", GetPlayerNameEx(targetid));
	    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	    printf("%s has revoked %s's gun license.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "You must have leadership of a Law Enforcement Organization to use this command.");
	}
	return 1;
}

CMD:agivelicense(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_THREE))
	{
	    new
	        option[8],
			targetid,
			string[128];
	    if(sscanf(params, "us[8]", targetid, option))
	    {
	        return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /agivelicense [playerid] [weapon, driver]");
		}
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");

		if(!strcmp(option, "weapon", true))
		{
			if(PlayerInfo[targetid][pGunLicense] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a gun license.");
			format(string, sizeof(string), "You have been given a gun license from %s.", GetPlayerNameEx(playerid));
		    SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
		    format(string, sizeof(string), "You have given %s's a gun license.", GetPlayerNameEx(targetid));
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	 		PlayerInfo[targetid][pGunLicense] = 1;
		}
		else if(!strcmp(option, "driver", true))
		{
			if(PlayerInfo[targetid][pDriverLicense] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a drivers license.");
			format(string, sizeof(string), "You have been given a drivers license from %s.", GetPlayerNameEx(playerid));
		    SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
		    format(string, sizeof(string), "You have given %s's a drivers license.", GetPlayerNameEx(targetid));
		    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	 		PlayerInfo[targetid][pDriverLicense] = 1;
		}
	}
	return 1;
}

CMD:addbusiness(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
	    new b = GetAvailableBusiness(), szQuery[256];

		if(b == INVALID_BUSINESS_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You were unable to allocate a business because the number of businesses have reached the limit.");

		format(BusinessInfo[b][bName], 16, "None"); format(BusinessInfo[b][bOwner], MAX_PLAYER_NAME, "Government"); BusinessInfo[b][bInterior] = 1;
		BusinessInfo[b][bPosition][0] = 0; BusinessInfo[b][bPosition][1] = 0; BusinessInfo[b][bPosition][2] = 0; BusinessInfo[b][bVirtualWorld] = GetAvailableVirtualWorld();
		BusinessInfo[b][bOpen] = 1; BusinessInfo[b][bFacingAngle] = 0; BusinessInfo[b][bBuyPrice] = 1; BusinessInfo[b][bEarnings] = 1; BusinessInfo[b][bExistant] = 1;

	    format(szQuery, sizeof(szQuery), "INSERT INTO `businesses` VALUES ('%d','None','Government','%d','0','0','0','0','0','0','%d','1');", b, BusinessInfo[b][bBuyPrice], BusinessInfo[b][bVirtualWorld]);
		mysql_tqueryof(szQuery, THREAD_LOG_RESULT, playerid, mConnectionHandle);

		format(szQuery, sizeof(szQuery), "You have successfully added a business! Type /editbusiness %d to complete business creation.", b);
		SendClientMessageEx(playerid, COLOR_WHITE, szQuery);
	}
	return 1;
}

CMD:saveaccounts(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_SIX))
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Launching a full server account save procedure...");
	    foreach (new i: Player)
	    {
	    	SavePlayerAccount(i);
	    }
	    SendClientMessageEx(playerid, COLOR_WHITE, "All online player accounts were successfully saved.");
	}
	return 1;
}

CMD:addhouse(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
	    new
	        h = GetAvailableHouse(),
			szQuery[256];

		if(h == INVALID_HOUSE_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You were unable to allocate a house because the number of houses have reached the limit.");

		format(HouseInfo[h][hOwner], MAX_PLAYER_NAME, "None"); HouseInfo[h][hInterior] = 1;
		HouseInfo[h][hPosition][0] = 0; HouseInfo[h][hPosition][1] = 0; HouseInfo[h][hPosition][2] = 0; HouseInfo[h][hVirtualWorld] = GetAvailableVirtualWorld();
		HouseInfo[h][hOpen] = 1; HouseInfo[h][hFacingAngle] = 0; HouseInfo[h][hBuyPrice] = 1; HouseInfo[h][hExistant] = 1;

	    format(szQuery, sizeof(szQuery), "INSERT INTO `houses` VALUES ('%d','None','%d','0','0','0','0','%d','1');", h, HouseInfo[h][hBuyPrice], HouseInfo[h][hVirtualWorld]);
		mysql_tqueryof(szQuery, THREAD_LOG_RESULT, playerid, mConnectionHandle);

		format(szQuery, sizeof(szQuery), "You have successfully added a house! Type /edithouse %d to complete house creation.", h);
		SendClientMessageEx(playerid, COLOR_WHITE, szQuery);
	}
	return 1;
}


CMD:editbusiness(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
 		new
			string[512],
			b;

	    if(sscanf(params, "i", b)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /editbusiness <id>");
	    else if(b < 1 || b > MAX_BUSINESSES) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid business id, please enter a valid one.");
	    else if(BusinessInfo[b][bExistant] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid business id, please enter a valid one.");

        BusinessEdit[playerid] = b;

	    format(string, sizeof(string), "Rename (%s)\n\
		Business PosX (%f)\n\
		Business PosY (%f)\n\
		Business PosZ (%f)\n\
		Business Interior (%d)\n\
		Business Virtual World (%d)\n", BusinessInfo[b][bName], BusinessInfo[b][bPosition][0], BusinessInfo[b][bPosition][1], BusinessInfo[b][bPosition][2], BusinessInfo[b][bInterior], BusinessInfo[b][bVirtualWorld]);

		format(string, sizeof(string), "%sDelete Business\n\
		Teleport to Business\n\
		Teleport to Interior\n\
		Place Business Here\n\
		Edit Ownership\n\
		Edit Buying Price", string);

		ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_ADMIN, DIALOG_STYLE_LIST, "{FFFFFF}Business Editor", string, "Edit", "Cancel");
		format(string, sizeof(string), "You are now editing business %d, all changes will be saved automatically.", b);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
    }
    return 1;
}

CMD:edithouse(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
 		new
			string[512],
			h;

	    if(sscanf(params, "i", h)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /edithouse <id>");
	    else if(h < 1 || h > MAX_HOUSES) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid house id, please enter a valid one.");
	    else if(HouseInfo[h][hExistant] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid house id, please enter a valid one.");

        HouseEdit[playerid] = h;

	    format(string, sizeof(string), "House PosX (%f)\n\
		House PosY (%f)\n\
		House PosZ (%f)\n\
		House Interior (%d)\n\
		House Virtual World (%d)\n", HouseInfo[h][hPosition][0], HouseInfo[h][hPosition][1], HouseInfo[h][hPosition][2], HouseInfo[h][hInterior], HouseInfo[h][hVirtualWorld]);

		format(string, sizeof(string), "%sDelete House\n\
		Teleport to House\n\
		Teleport to Interior\n\
		Place House Here\n\
		Edit Ownership\n\
		Edit Buying Price", string);

		ShowPlayerDialogEx(playerid, DIALOG_HOUSE_ADMIN, DIALOG_STYLE_LIST, "{FFFFFF}House Editor", string, "Edit", "Cancel");
		format(string, sizeof(string), "You are now editing house %d, all changes will be saved automatically.", h);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	return 1;
}

CMD:addwaypoint(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
	    new
	        i = GetAvailableWaypoint(),
			szQuery[256];

		if(i == INVALID_WAYPOINT_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You were unable to allocate a waypoint because the number of waypoints have reached the limit.");

	    format(szQuery, sizeof(szQuery), "INSERT INTO `waypoints` VALUES ('%d','None','None','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');", i);
		mysql_tqueryof(szQuery, THREAD_LOG_RESULT, playerid, mConnectionHandle);

		format(WaypointInfo[i][wTextDisplay], 64, "None"); format(WaypointInfo[i][wPassword], 8, "None"); WaypointInfo[i][wInterior] = 0;
		WaypointInfo[i][wPosition][0] = 0; WaypointInfo[i][wPosition][1] = 0; WaypointInfo[i][wPosition][2] = 0; WaypointInfo[i][wDestInterior] = 0;
		WaypointInfo[i][wDestPosition][0] = 0; WaypointInfo[i][wDestPosition][1] = 0; WaypointInfo[i][wDestPosition][2] = 0;
		WaypointInfo[i][wVirtualWorld] = 0; WaypointInfo[i][wDestVirtualWorld] = 0; WaypointInfo[i][wExistant] = 1; WaypointInfo[i][wLocked] = 0;
		WaypointInfo[i][wFactionRestriction] = 0;

		format(szQuery, sizeof(szQuery), "You have successfully added a waypoint! Type /editwaypoint %d to complete the waypoint.", i);
		SendClientMessageEx(playerid, COLOR_WHITE, szQuery);
	}
	return 1;
}

CMD:editwaypoint(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
 		new
			string[768],
			i;

	    if(sscanf(params, "i", i)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /editwaypoint <id>");
	    else if(i < 1 || i > MAX_WAYPOINTS) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid waypoint id, please enter a valid one.");
	    else if(WaypointInfo[i][wExistant] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid waypoint id, please enter a valid one.");

        WaypointEditing[playerid] = i;

	    format(string, sizeof(string), "Rename (%s)\n\
		Entrance PosX (%f)\n\
		Entrance PosY (%f)\n\
		Entrance PosZ (%f)\n\
		Entrance Interior (%d)\n\
		Entrance Virtual World (%d)\n", WaypointInfo[i][wTextDisplay], WaypointInfo[i][wPosition][0], WaypointInfo[i][wPosition][1], WaypointInfo[i][wPosition][2], WaypointInfo[i][wInterior], WaypointInfo[i][wVirtualWorld]);

		format(string, sizeof(string), "%sDestination PosX (%f)\n\
		Destination PosY (%f)\n\
		Destination PosZ (%f)\n\
		Destination Interior (%d)\n\
		Destination Virtual World (%d)\n\
	    Delete Waypoint\n\
		Teleport to Entrance\n\
		Teleport to Destination\n\
		Place Entrance Here\n\
		Place Destination Here\n", string, WaypointInfo[i][wDestPosition][0], WaypointInfo[i][wDestPosition][1], WaypointInfo[i][wDestPosition][2], WaypointInfo[i][wDestInterior], WaypointInfo[i][wDestVirtualWorld]);

		format(string, sizeof(string), "%sSet Entrance Load Time\n\
		Set Destination Load Time\n\
		Change Password\n\
		Lock/Unlock Waypoint\n\
		Set Faction Restriction", string);

		ShowPlayerDialogEx(playerid, DIALOG_WAYPOINT_EDIT, DIALOG_STYLE_LIST, "{FFFFFF}Waypoint Editor", string, "Edit", "Cancel");
		format(string, sizeof(string), "You are now editing waypoint %d, all changes will be saved automatically.", i);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
    }
    return 1;
}


CMD:editfaction(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
 		new string[512], i;

	    if(sscanf(params, "i", i)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /editfaction <id>");
	    else if(i < 1 || i > MAX_FACTIONS) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid faction id, please enter a valid one.");

        FactionEdit[playerid] = i;

	    format(string, sizeof(string), "Rename (%s)\n\
		Edit Motd\n\
		Edit Type (%s)\n\
		Edit Ranks\n\
		Edit Divisions\n\
		Place Locker\n\
		Place Vault\n\
		Disband Faction", GetFactionName(i), GetFactionType(i));

		ShowPlayerDialogEx(playerid, DIALOG_FACTION_ADMIN, DIALOG_STYLE_LIST, "{FFFFFF}Faction Editor", string, "Edit", "Cancel");
		format(string, sizeof(string), "You are now editing faction %d, all changes will be saved automatically.", i);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
    }
	return 1;
}

CMD:addvehicle(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
	    new
	        dv = GetAvailableDynamicVehicle(),
			szQuery[256];

		if(dv == INVALID_DYNAMIC_VEHICLE_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You were unable to allocate a vehicle because the number of vehicle have reached the limit.");

		GetPlayerPos(playerid, PlayerInfo[playerid][pPositionX], PlayerInfo[playerid][pPositionY], PlayerInfo[playerid][pPositionZ]);
		GetPlayerFacingAngle(playerid, PlayerInfo[playerid][pFacingAngle]);
		DynamicVehicleInfo[dv][dvModel] = 400;
	    DynamicVehicleInfo[dv][dvPosition][0] = PlayerInfo[playerid][pPositionX];
	    DynamicVehicleInfo[dv][dvPosition][1] = PlayerInfo[playerid][pPositionY];
	    DynamicVehicleInfo[dv][dvPosition][2] = PlayerInfo[playerid][pPositionZ];
	    DynamicVehicleInfo[dv][dvFacingAngle] = PlayerInfo[playerid][pFacingAngle];
	    DynamicVehicleInfo[dv][dvType] = 0;
	    DynamicVehicleInfo[dv][dvColor][0] = 0;
	    DynamicVehicleInfo[dv][dvColor][1] = 0;
	    DynamicVehicleInfo[dv][dvFaction] = 0;
	    format(szQuery, sizeof(szQuery), "INSERT INTO `vehicles` VALUES ('%d','%d','%f','%f','%f','%f','0','0','0','0');", dv, DynamicVehicleInfo[dv][dvModel], DynamicVehicleInfo[dv][dvPosition][0], DynamicVehicleInfo[dv][dvPosition][1], DynamicVehicleInfo[dv][dvPosition][2], DynamicVehicleInfo[dv][dvFacingAngle]);
		mysql_tqueryof(szQuery, THREAD_LOG_RESULT, playerid, mConnectionHandle);

		DynamicVehicleInfo[dv][dvHandleId] = CreateVehicleEx(DynamicVehicleInfo[dv][dvModel],DynamicVehicleInfo[dv][dvPosition][0],DynamicVehicleInfo[dv][dvPosition][1],DynamicVehicleInfo[dv][dvPosition][2],DynamicVehicleInfo[dv][dvFacingAngle],DynamicVehicleInfo[dv][dvColor][0],DynamicVehicleInfo[dv][dvColor][1],VEHICLE_RESPAWN);

		format(szQuery, sizeof(szQuery), "You have successfully added a vehicle! Type /editvehicle %d to complete vehicle creation.", dv);
		SendClientMessageEx(playerid, COLOR_WHITE, szQuery);
	}
	return 1;
}

CMD:editvehicle(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
 		new string[512], dv;

	    if(sscanf(params, "i", dv)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /editvehicle <id>");
	    else if(dv < 1 || dv > MAX_DYNAMIC_VEHICLES) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid vehicle, please enter a valid one.");
	    else if(!IsValidVehicle(DynamicVehicleInfo[dv][dvHandleId])) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid vehicle id, please enter a valid one.");

        VehicleEdit[playerid] = dv;

	    format(string, sizeof(string), "Model (%s)\n\
		Vehicle Type (%d)\n\
		Vehicle Faction (%d)\n\
		Vehicle Color 1 (%d)\n\
		Vehicle Color 2 (%d)\n\
	    Place Vehicle Here\n\
		Delete Vehicle", GetVehicleName(DynamicVehicleInfo[dv][dvHandleId]), DynamicVehicleInfo[dv][dvType], DynamicVehicleInfo[dv][dvFaction], DynamicVehicleInfo[dv][dvColor][0], DynamicVehicleInfo[dv][dvColor][1]);
		

		ShowPlayerDialogEx(playerid, DIALOG_VEHICLE_ADMIN, DIALOG_STYLE_LIST, "{FFFFFF}Vehicle Editor", string, "Edit", "Cancel");
		format(string, sizeof(string), "You are now editing vehicle %d, all changes will be saved automatically.", dv);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
    }
    return 1;
}

CMD:vnear(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
	    new string[128], closestcar = GetClosestCar(playerid);
		if(closestcar == INVALID_VEHICLE_ID) return SendClientMessageEx(playerid, COLOR_FADE1, "You're not close enough to any vehicle.");
		format(string, sizeof(string), "Vehicle ID: %d | Handle ID: %d | Model: %s", closestcar, GetDynamicVehicleID(closestcar), GetVehicleName(DynamicVehicleInfo[GetDynamicVehicleID(closestcar)][dvModel]));
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	return 1;
}

CMD:gate(playerid, params[])
{
	if(isnull(params)) return SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /gate [password]");
	for (new i=1; i < MAX_GATES; i++)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 8.0, GateInfo[i][gPosition][0], GateInfo[i][gPosition][1], GateInfo[i][gPosition][2]) || IsPlayerInRangeOfPoint(playerid, 8.0, GateInfo[i][gDestPosition][0], GateInfo[i][gDestPosition][1], GateInfo[i][gDestPosition][2]))
	    {
	        if(!strcmp(params, GateInfo[i][gPassword], true))
	        {
	            if(IsDynamicObjectMoving(GateInfo[i][gObjectHandle]))
	        		StopDynamicObject(GateInfo[i][gObjectHandle]);

				if(GateInfo[i][gSpeed] == 0)
				    return SendClientMessageEx(playerid, COLOR_WHITE, "This gate hasn't been configured to work properly, please seek an administrator for more information.");

		        switch (GateInfo[i][gState])
		        {
		            case 0:
		            {
		                GateInfo[i][gState] = 1;
		                MoveDynamicObject(GateInfo[i][gObjectHandle], GateInfo[i][gDestPosition][0], GateInfo[i][gDestPosition][1], GateInfo[i][gDestPosition][2], GateInfo[i][gSpeed], GateInfo[i][gDestRotation][0], GateInfo[i][gDestRotation][1], GateInfo[i][gDestRotation][2]);
		            }

		            case 1:
		            {
		                GateInfo[i][gState] = 0;
		                MoveDynamicObject(GateInfo[i][gObjectHandle], GateInfo[i][gPosition][0], GateInfo[i][gPosition][1], GateInfo[i][gPosition][2], GateInfo[i][gSpeed], GateInfo[i][gRotation][0], GateInfo[i][gRotation][1], GateInfo[i][gRotation][2]);
		            }
		        }
	        }
	        break;
	    }
	}
	return 1;
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(GateEdit[playerid] != 0)
	{
	    if(response == EDIT_RESPONSE_FINAL)
	    {
	    	new
				id = GateEdit[playerid],
				method = GetPVarInt(playerid, "GateMethod");

			switch (method)
			{
			    case 1:
			    {
			        GateInfo[id][gPosition][0] = x;
			        GateInfo[id][gPosition][1] = y;
			        GateInfo[id][gPosition][2] = z;
			        GateInfo[id][gRotation][0] = rx;
					GateInfo[id][gRotation][1] = ry;
			        GateInfo[id][gRotation][2] = rz;
			        SendClientMessageEx(playerid, -1, "You have stopped editing the object, the position has successfully been saved.");
			        MySQL_Update_Gate(id);
	 				RecreateGateText(id);
			    }

			    case 2:
			    {
			        GateInfo[id][gDestPosition][0] = x;
			        GateInfo[id][gDestPosition][1] = y;
			        GateInfo[id][gDestPosition][2] = z;
			        GateInfo[id][gDestRotation][0] = rx;
			        GateInfo[id][gDestRotation][1] = ry;
			        GateInfo[id][gDestRotation][2] = rz;
			        GateInfo[id][gState] = 0;
			        SendClientMessageEx(playerid, -1, "You have stopped editing the object, the destination has successfully been saved.");
			        SetDynamicObjectPos(GateInfo[id][gObjectHandle], GateInfo[id][gPosition][0], GateInfo[id][gPosition][1], GateInfo[id][gPosition][2]);
			        SetDynamicObjectRot(GateInfo[id][gObjectHandle], GateInfo[id][gRotation][0], GateInfo[id][gRotation][1], GateInfo[id][gRotation][2]);
			        MySQL_Update_Gate(id);
	 				RecreateGateText(id);
			    }
			}
	    }
	    else if(response == EDIT_RESPONSE_CANCEL)
	    {
	    	new
				id = GateEdit[playerid];
    		SendClientMessageEx(playerid, -1, "You have cancelled editing the object, nothing has been saved.");
    		SetDynamicObjectPos(GateInfo[id][gObjectHandle], GateInfo[id][gPosition][0], GateInfo[id][gPosition][1], GateInfo[id][gPosition][2]);
      		SetDynamicObjectRot(GateInfo[id][gObjectHandle], GateInfo[id][gRotation][0], GateInfo[id][gRotation][1], GateInfo[id][gRotation][2]);
	    }
	}
}

CMD:addgate(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
	    new
	        g = GetAvailableGate(),
			szQuery[256];

		if(g == INVALID_GATE_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You were unable to allocate a gate because the number of gates have reached the limit.");

		format(GateInfo[g][gPassword], 12, ""); GateInfo[g][gModel] = 971; GateInfo[g][gState] = 0; GateInfo[g][gSpeed] = 1;
		GetPlayerPos(playerid, GateInfo[g][gPosition][0], GateInfo[g][gPosition][1], GateInfo[g][gPosition][2]);
		GateInfo[g][gDestPosition][0] = 0; GateInfo[g][gDestPosition][1] = 0; GateInfo[g][gDestPosition][2] = 0;
		GateInfo[g][gRotation][0] = 0; GateInfo[g][gRotation][1] = 0; GateInfo[g][gRotation][2] = 0;
		GateInfo[g][gDestRotation][0] = 0; GateInfo[g][gDestRotation][1] = 0; GateInfo[g][gDestRotation][2] = 0;
		GateInfo[g][gObjectHandle] = CreateDynamicObject(GateInfo[g][gModel], GateInfo[g][gPosition][0], GateInfo[g][gPosition][1], GateInfo[g][gPosition][2], GateInfo[g][gRotation][0], GateInfo[g][gRotation][1], GateInfo[g][gRotation][2]);

	    format(szQuery, sizeof(szQuery), "INSERT INTO `gates` VALUES ('%d','0','0','0','0','0','0','0','0','0','0','0','0','%d','%s','0');", g, GateInfo[g][gModel], GateInfo[g][gPassword]);
		mysql_tqueryof(szQuery, THREAD_LOG_RESULT, playerid, mConnectionHandle);
		format(szQuery, sizeof(szQuery), "You have successfully added a gate! Type /editgate %d to complete gate creation.", g);
		SendClientMessageEx(playerid, COLOR_WHITE, szQuery);
	}
	return 1;
}

CMD:editgate(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
 		new
			string[512],
			i;

	    if(sscanf(params, "i", i)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /editgate <id>");
	    else if(i < 1 || i > MAX_GATES) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid gate id, please enter a valid one.");
	    else if(!IsValidDynamicObject(GateInfo[i][gObjectHandle])) return SendClientMessageEx(playerid, COLOR_GREY, "You have specified an invalid gate id.");

	    format(string, sizeof(string), "Password (%s)\n\
	    Edit Model (%d)\n\
		Edit Gate Position\n\
		Bring Gate Here\n\
		Edit Gate Destination\n\
		Delete Gate\n\
		Edit Speed (%d)", GateInfo[i][gPassword], GateInfo[i][gModel], GateInfo[i][gSpeed]);
		ShowPlayerDialogEx(playerid, DIALOG_GATE_EDIT, DIALOG_STYLE_LIST, "{FFFFFF}Gate Editor", string, "Select", "Cancel");

        GateEdit[playerid] = i;
		format(string, sizeof(string), "You are now editing gate id %d, all changes will be saved automatically.", i);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
    }
    return 1;
}

CMD:enter(playerid, params[])
{
	if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this at this time.");
	else if(IsPlayerInAnyVehicle(playerid)) return 1;

	for (new w=1; w < MAX_WAYPOINTS; w++)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2.0, WaypointInfo[w][wPosition][0], WaypointInfo[w][wPosition][1], WaypointInfo[w][wPosition][2]))
	    {
	        if(GetPlayerVirtualWorld(playerid) == WaypointInfo[w][wVirtualWorld] && GetPlayerInterior(playerid) == WaypointInfo[w][wInterior])
	        {
	            if(WaypointInfo[w][wLocked] == 0)
	            {
	                if((WaypointInfo[w][wFactionRestriction] != 0 && PlayerInfo[playerid][pFaction] == WaypointInfo[w][wFactionRestriction]) || WaypointInfo[w][wFactionRestriction] == 0)
	                {
	                    Streamer_UpdateEx(playerid, WaypointInfo[w][wDestPosition][0], WaypointInfo[w][wDestPosition][1], WaypointInfo[w][wDestPosition][2]);
	                    SafeTeleport(playerid, WaypointInfo[w][wDestPosition][0], WaypointInfo[w][wDestPosition][1], WaypointInfo[w][wDestPosition][2]);
			            SetPlayerFacingAngle(playerid, WaypointInfo[w][wDestFacingAngle]);
				        SetPlayerVirtualWorldEx(playerid, WaypointInfo[w][wDestVirtualWorld]);
				        SetPlayerInteriorEx(playerid, WaypointInfo[w][wDestInterior]);
					    SetPlayerPosEx(playerid, WaypointInfo[w][wDestPosition][0], WaypointInfo[w][wDestPosition][1], WaypointInfo[w][wDestPosition][2]);
			            if(WaypointInfo[w][wDestLoadingTime] > 0)
			            {
							SetPVarInt(playerid, "ActionRestriction", 1);
							TogglePlayerControllable(playerid, false);
							TextDrawShowForPlayer(playerid, LoadingObjectTextDraw);
							TextDrawShowForPlayer(playerid, LoadingObjectBox);
							SetTimerEx("HideLoadingTextdraws", WaypointInfo[w][wDestLoadingTime] * 1000, false, "i", playerid);
						}
						SetCameraBehindPlayer(playerid);
						return 1;
					}
					else SendClientMessageEx(playerid, COLOR_GREY, "This waypoint is restricted to factions, you cannot access it.");
	            }
	            else SendClientMessageEx(playerid, COLOR_GREY, "This waypoint is currently locked, you cannot access it.");
				return 1;
		    }
	    }
	}

	for (new b=1; b < MAX_BUSINESSES; b++)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2.0, BusinessInfo[b][bPosition][0],BusinessInfo[b][bPosition][1], BusinessInfo[b][bPosition][2]))
	    {
	        if((!BusinessInfo[b][bOpen] && IsBusinessOwner(b, playerid)) || BusinessInfo[b][bOpen])
	        {
    	    	if(BusinessInfo[b][bInterior] >= 1 && BusinessInfo[b][bInterior] <= 30)
	    		{
			   		new i = BusinessInfo[b][bInterior] - 1;
					SetPlayerVirtualWorldEx(playerid, BusinessInfo[b][bVirtualWorld]);
					SetPlayerInteriorEx(playerid, floatround(BusinessInterior[i][4]));
					SetPlayerPosEx(playerid, BusinessInterior[i][0], BusinessInterior[i][1], BusinessInterior[i][2]);
					SetPlayerFacingAngle(playerid, BusinessInterior[i][3]);
					SetCameraBehindPlayer(playerid);
					return 1;
				}
				else SendClientMessageEx(playerid, COLOR_GREY, "An invalid interior is set for this business, please see an administrator.");
			}
			else SendClientMessageEx(playerid, COLOR_GREY, "The business is currently closed, please check back later.");
			return 1;
	    }
	}

	for (new h=1; h < MAX_HOUSES; h++)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2.0, HouseInfo[h][hPosition][0], HouseInfo[h][hPosition][1], HouseInfo[h][hPosition][2]))
	    {
	        if((!HouseInfo[h][hOpen] && IsHouseOwner(h, playerid)) || HouseInfo[h][hOpen])
	        {
    	    	if(HouseInfo[h][hInterior] >= 1 && HouseInfo[h][hInterior] <= 21)
	    		{
			   		new i = HouseInfo[h][hInterior] - 1;
					SetPlayerVirtualWorldEx(playerid, HouseInfo[h][hVirtualWorld]);
					SetPlayerInteriorEx(playerid, floatround(HouseInterior[i][4]));
					SetPlayerPosEx(playerid, HouseInterior[i][0], HouseInterior[i][1], HouseInterior[i][2]);
					SetPlayerFacingAngle(playerid, HouseInterior[i][3]);
					SetCameraBehindPlayer(playerid);
					return 1;
				}
				else SendClientMessageEx(playerid, COLOR_GREY, "An invalid interior is set for this house, please see an administrator.");
			}
			else SendClientMessageEx(playerid, COLOR_GREY, "The door to the house is locked, but it appears that it can be broken down easily.");
			return 1;
	    }
	}
	return 1;
}

CMD:exit(playerid, params[])
{
	if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this at this time.");
	else if(IsPlayerInAnyVehicle(playerid)) return 1;

	for (new i=1; i < MAX_WAYPOINTS; i++)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2.0, WaypointInfo[i][wDestPosition][0], WaypointInfo[i][wDestPosition][1], WaypointInfo[i][wDestPosition][2]))
	    {
	        if(GetPlayerVirtualWorld(playerid) == WaypointInfo[i][wDestVirtualWorld] && GetPlayerInterior(playerid) == WaypointInfo[i][wDestInterior])
	        {
				if((WaypointInfo[i][wFactionRestriction] != 0 && PlayerInfo[playerid][pFaction] == WaypointInfo[i][wFactionRestriction]) || WaypointInfo[i][wFactionRestriction] == 0)
	 			{
	 			    Streamer_UpdateEx(playerid, WaypointInfo[i][wPosition][0], WaypointInfo[i][wPosition][1], WaypointInfo[i][wPosition][2]);
                    SafeTeleport(playerid, WaypointInfo[i][wPosition][0], WaypointInfo[i][wPosition][1], WaypointInfo[i][wPosition][2]);
					SetPlayerFacingAngle(playerid, WaypointInfo[i][wFacingAngle]);
			        SetPlayerVirtualWorldEx(playerid, WaypointInfo[i][wVirtualWorld]);
			        SetPlayerInteriorEx(playerid, WaypointInfo[i][wInterior]);
		            if(WaypointInfo[i][wLoadingTime] > 0)
		            {
						TogglePlayerControllable(playerid, false);
						SetPVarInt(playerid, "ActionRestriction", 1);
						TextDrawShowForPlayer(playerid, LoadingObjectTextDraw);
						TextDrawShowForPlayer(playerid, LoadingObjectBox);
						SetTimerEx("HideLoadingTextdraws", WaypointInfo[i][wLoadingTime] * 1000, false, "i", playerid);
					}
					SetCameraBehindPlayer(playerid);
					return 1;
			    }
			    else SendClientMessageEx(playerid, COLOR_GREY, "This waypoint is restricted to factions, you cannot access it.");
		    }
	    }
	}

	for (new b=1; b < MAX_BUSINESSES; b++)
	{
	    if(BusinessInfo[b][bInterior] >= 1 && BusinessInfo[b][bInterior] <= 30)
	    {
			new i = BusinessInfo[b][bInterior] - 1;
		    if(IsPlayerInRangeOfPoint(playerid, 2.0, BusinessInterior[i][0], BusinessInterior[i][1], BusinessInterior[i][2]))
		    {
		        if(GetPlayerVirtualWorld(playerid) == BusinessInfo[b][bVirtualWorld])
		        {
					SetPlayerVirtualWorldEx(playerid, 0);
					SetPlayerInteriorEx(playerid, 0);
					SetPlayerPosEx(playerid, BusinessInfo[b][bPosition][0], BusinessInfo[b][bPosition][1], BusinessInfo[b][bPosition][2]);
					SetPlayerFacingAngle(playerid, BusinessInfo[b][bFacingAngle]);
					SetCameraBehindPlayer(playerid);
					return 1;
				}
		    }
	    }
	}

	for (new h=1; h < MAX_HOUSES; h++)
	{
	    if(HouseInfo[h][hInterior] >= 1 && HouseInfo[h][hInterior] <= 21)
	    {
			new
				i = HouseInfo[h][hInterior] - 1;
		    if(IsPlayerInRangeOfPoint(playerid, 2.0, HouseInterior[i][0], HouseInterior[i][1], HouseInterior[i][2]))
		    {
		        if(GetPlayerVirtualWorld(playerid) == HouseInfo[h][hVirtualWorld])
		        {
					SetPlayerVirtualWorldEx(playerid, 0);
					SetPlayerInteriorEx(playerid, 0);
					SetPlayerPosEx(playerid, HouseInfo[h][hPosition][0], HouseInfo[h][hPosition][1], HouseInfo[h][hPosition][2]);
					SetPlayerFacingAngle(playerid, HouseInfo[h][hFacingAngle]);
					SetCameraBehindPlayer(playerid);
					return 1;
				}
		    }
	    }
	}
	if(SpectatingAdmin[playerid] != INVALID_PLAYER_ID)
	{
    	if(SpectatingPlayer[SpectatingAdmin[playerid]] == playerid)
     	{
	    	PlayerSpectatePlayer(SpectatingAdmin[playerid], playerid);
     	    SetPlayerInterior(SpectatingAdmin[playerid], GetPlayerInterior(playerid));
     	    SetPlayerVirtualWorld(SpectatingAdmin[playerid], GetPlayerVirtualWorld(playerid));
     	    SetCameraBehindPlayer(playerid);
     	    return 1;
		}
	}
	return 1;
}

CMD:buyhouse(playerid, params[])
{
	new h = GetNearHouse(playerid), string[128];
	if(h == INVALID_HOUSE_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You must be at the entrance of a house to use this command.");
	else if(HouseInfo[h][hBuyPrice] <= 0) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot buy this house because it has been disabled by an administrator.");

	if(!strcmp(HouseInfo[h][hOwner], "none", true))
	{
	    if(HouseInfo[h][hBuyPrice] > PlayerInfo[playerid][pMoney]) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot afford this house.");
	    PlayerInfo[playerid][pMoney] -= HouseInfo[h][hBuyPrice];
	    format(HouseInfo[h][hOwner], MAX_PLAYER_NAME, "%s", PlayerInfo[playerid][pUsername]);
	    format(string, sizeof(string), "You have purchased this house for $%d, type /househelp for more information.", HouseInfo[h][hBuyPrice]);
	    SendClientMessageEx(playerid, COLOR_WHITE, string);
	    format(string, sizeof(string), "[BUY]: %s has purchased house %d for $%d.", PlayerInfo[playerid][pUsername], h, HouseInfo[h][hBuyPrice]);
	    Log("logs/house.log", string);
		format(string, sizeof(string), "UPDATE `houses` SET `Owner` = '%s' WHERE `Id` = '%d'", HouseInfo[h][hOwner], h);
		mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
		RecreateHouseText(h);
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "This house is already owned by someone else.");
	}
	return 1;
}

CMD:sellhouse(playerid, params[])
{
	new h = GetNearHouse(playerid), string[128];
	if(h == INVALID_HOUSE_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You must be at the entrance of a house to use this command.");

	if(!strcmp(HouseInfo[h][hOwner], PlayerInfo[playerid][pUsername], true))
	{
	    PlayerInfo[playerid][pMoney] += HouseInfo[h][hBuyPrice];
	    format(HouseInfo[h][hOwner], MAX_PLAYER_NAME, "None");
	    format(string, sizeof(string), "You have sold this house for $%d.", HouseInfo[h][hBuyPrice]);
	    SendClientMessageEx(playerid, COLOR_WHITE, string);
	    format(string, sizeof(string), "[SELL]: %s has sold their house (ID: %d) for $%d.", PlayerInfo[playerid][pUsername], h, HouseInfo[h][hBuyPrice]);
	    Log("logs/house.log", string);
		format(string, sizeof(string), "UPDATE `houses` SET `Owner` = '%s' WHERE `Id` = '%d'", HouseInfo[h][hOwner], h);
		mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
		RecreateHouseText(h);
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "You don't own this house.");
	}
	return 1;
}

CMD:buybiz(playerid, params[])
{
	new
		b = GetNearBusiness(playerid),
		string[128];
	if(b == INVALID_BUSINESS_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You must be at the entrance of a business to use this command.");
	else if(BusinessInfo[b][bBuyPrice] <= 0) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot buy this business because it has been disabled by an administrator.");

	if(!strcmp(BusinessInfo[b][bOwner], "none", true))
	{
	    if(BusinessInfo[b][bBuyPrice] > PlayerInfo[playerid][pMoney]) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot afford this business.");
	    PlayerInfo[playerid][pMoney] -= BusinessInfo[b][bBuyPrice];
	    format(BusinessInfo[b][bOwner], MAX_PLAYER_NAME, "%s", PlayerInfo[playerid][pUsername]);
	    format(string, sizeof(string), "You have purchased this business for $%d, type /business to manage your business.", BusinessInfo[b][bBuyPrice]);
	    SendClientMessageEx(playerid, COLOR_WHITE, string);
	    format(string, sizeof(string), "[BUY]: %s has purchased the business (ID: %d) for $%d.", PlayerInfo[playerid][pUsername], b, BusinessInfo[b][bBuyPrice]);
	    Log("logs/business.log", string);
		format(string, sizeof(string), "UPDATE `businesses` SET `Owner` = '%s' WHERE `Id` = '%d'", BusinessInfo[b][bOwner], b);
		mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
		RecreateBusinessText(b);
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "This business is already owned by someone else.");
	}
	return 1;
}

CMD:sellbiz(playerid, params[])
{
	new b = GetNearBusiness(playerid), string[128];
	if(b == INVALID_BUSINESS_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You must be at the entrance of a business to use this command.");

	if(!strcmp(BusinessInfo[b][bOwner], PlayerInfo[playerid][pUsername], true))
	{
	    PlayerInfo[playerid][pMoney] += BusinessInfo[b][bBuyPrice];
	    format(BusinessInfo[b][bOwner], MAX_PLAYER_NAME, "None");
	    format(string, sizeof(string), "You have sold this business for $%d, type /business to manage your business.", BusinessInfo[b][bBuyPrice]);
	    SendClientMessageEx(playerid, COLOR_WHITE, string);
	    format(string, sizeof(string), "[SELL]: %s has sold their business (ID: %d) for $%d.", PlayerInfo[playerid][pUsername], b, BusinessInfo[b][bBuyPrice]);
	    Log("logs/business.log", string);
		format(string, sizeof(string), "UPDATE `businesses` SET `Owner` = '%s' WHERE `Id` = '%d'", BusinessInfo[b][bOwner], b);
		mysql_tqueryof(string, THREAD_LOG_RESULT, playerid, mConnectionHandle);
		RecreateBusinessText(b);
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "You don't own this business.");
	}
	return 1;
}

CMD:business(playerid, params[])
{
	new
		b = GetNearBusiness(playerid);
	if(b == INVALID_BUSINESS_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You must be at the entrance of a business to use this command.");
	else if(!IsBusinessOwner(b, playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You do not own the business that you are nearest to.");
	BusinessEdit[playerid] = b;
    ShowPlayerDialogEx(playerid, DIALOG_BUSINESS_EDIT, DIALOG_STYLE_LIST, "{FFFFFF}Business - Management", "{FFFFFF}Rename\nOpen/Close\nCollect Earnings", "Select", "Cancel");
	return 1;
}

CMD:houselock(playerid, params[])
{
	new
		h = GetNearHouse(playerid),
		string[128];
	if(h == INVALID_HOUSE_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You must be at the entrance of your house to use this command.");
	else if(!IsHouseOwner(h, playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You do not own the house that you are nearest to.");
	if(HouseInfo[h][hOpen])
	{
		HouseInfo[h][hOpen] = 0;
		SendClientMessageEx(playerid, COLOR_WHITE, "You have locked your house, no one will now be able to access it except you.");
		format(string, sizeof(string), "* %s withdraws their house keys and locks the house.", GetPlayerNameEx(playerid));
	} else {
		HouseInfo[h][hOpen] = 1;
		SendClientMessageEx(playerid, COLOR_WHITE, "You have unlocked your house, everyone will now be able to access it.");
		format(string, sizeof(string), "* %s withdraws their house keys and unlocks the house.", GetPlayerNameEx(playerid));
	}
	ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	return 1;
}

CMD:waypointlock(playerid, params[])
{
	new
		w = GetNearWaypoint(playerid),
		string[128];
	if(w == INVALID_WAYPOINT_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You must be at the entrance of the waypoint to use this command.");
	else if(strlen(params) > 8) return SendClientMessageEx(playerid, COLOR_GREY, "The password must be under or at 8 characters.");
	else if(sscanf(params, "{s[8]}")) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /waypointlock [password]");

	if(!strcmp(WaypointInfo[w][wPassword], params, true))
	{
		if(WaypointInfo[w][wLocked] == 1)
		{
			WaypointInfo[w][wLocked] = 0;
			SendClientMessageEx(playerid, COLOR_WHITE, "You have unlocked the waypoint, everyone will now be able to access it.");
		} else {
			WaypointInfo[w][wLocked] = 1;
			SendClientMessageEx(playerid, COLOR_WHITE, "You have locked the waypoint, no one will now be able to access it.");
		}
		format(string, sizeof(string), "UPDATE `waypoints` SET `Locked` = '%d' WHERE `Id` = '%d'", WaypointInfo[w][wLocked], w);
		mysql_tqueryof(string, THREAD_NO_RESULT, playerid, mConnectionHandle);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid password.");
	}
	return 1;
}

CMD:restart(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_SIX))
	{
        new string[128];
	    foreach (new i: Player)
	    {
	    	OnPlayerDisconnect(i, 3);
	    	SetPVarInt(playerid, "SafeMode", 1);
			TogglePlayerControllable(i, false);
	    }
        format(string, sizeof(string), "AdmCmd: %s has announced a server restart. It will be executed within ten seconds.", GetPlayerNameEx(playerid));
		SendClientMessageToAllEx(COLOR_LIGHTRED, string);
		SetTimer("RestartTimer", 10000, false);
    }
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	}
    return 1;
}
public RestartTimer()
{
	SendClientMessageToAllEx(COLOR_LIGHTRED, "SERVER: The server is now restarting. Please wait...");
    SendRconCommand("gmx");
}

CMD:pay(playerid, params[])
{
	new targetid, cash, string[128];
  	if(sscanf(params, "ud", targetid, cash)) SendClientMessageEx(playerid, COLOR_GREY, "Usage: /pay [playerid] [amount]");
   	else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
   	else if(targetid == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
	else if(!IsPlayerInRangeOfPlayer(playerid, targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the specified player to use this command.");
   	else if(cash < 1 || cash > PlayerInfo[playerid][pMoney]) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid amount.");
   	else
   	{
   	    GivePlayerCash(playerid, -cash);
   	    GivePlayerCash(targetid, cash);
     	format(string, sizeof(string), "*  You have sent $%d to (ID: %d) %s.", cash, targetid, GetPlayerNameEx(targetid));
     	SendClientMessageEx(playerid, COLOR_GREY, string);
    	format(string, sizeof(string), "*  You have received $%d from (ID: %d) %s.", cash, playerid, GetPlayerNameEx(playerid));
		SendClientMessageEx(targetid, COLOR_GREY, string);
		format(string, sizeof(string), "* %s withdraws some cash, and hands it over to %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
   		ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		format(string, sizeof(string), "[PAY]: %s has sent $%d to %s.", GetPlayerNameEx(playerid), cash, GetPlayerNameEx(targetid));
		Log("logs/pay.log", string);
   		if(IsAdmin(playerid, ADMIN_LEVEL_TWO) && !IsAdmin(playerid, ADMIN_LEVEL_SIX))
   		{
			format(string, sizeof(string), "{FF6347}AdmWarning:{FFFF00} (ID: %d) %s has paid $%d to (ID: %d) %s from their admin account.", playerid, GetPlayerNameEx(playerid), cash, targetid, GetPlayerNameEx(targetid));
			AdminAlert(string, ALERT_ADMINS);
		}
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		PlayerPlaySound(targetid, 1052, 0.0, 0.0, 0.0);
  	}
  	return 1;
}

CMD:eject(playerid, params[])
{
	new targetid, string[128];
  	if(sscanf(params, "u", targetid)) SendClientMessageEx(playerid, COLOR_GREY, "Usage: /eject [playerid]");
   	else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
   	else if(targetid == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself..");
	else if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be inside a vehicle to use this command.");
	else if(GetPlayerVehicleSeat(playerid) != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You must be the driver of the vehicle to use this command.");
	else if(GetPlayerVehicleID(playerid) != GetPlayerVehicleID(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player is not inside your vehicle.");
   	else
   	{
     	format(string, sizeof(string), "*  You have ejected (ID: %d) %s from the vehicle.", targetid, GetPlayerNameEx(targetid));
     	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
     	format(string, sizeof(string), "You have been ejected from the vehicle by (ID: %d) %s.", playerid, GetPlayerNameEx(playerid));
     	SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
     	RemovePlayerFromVehicle(targetid);
     	format(string, sizeof(string), "* %s has ejected %s from the vehicle.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
   		ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
  	}
  	return 1;
}

CMD:payday(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_SIX))
	{
        new string[128], option[8];
        if(sscanf(params, "s[32]", option))
        {
			return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /payday [confirm]");
        }
        if(!strcmp(option, "confirm", true))
        {
            format(string, sizeof(string), "AdmCmd: %s has announced a payday for everyone.", GetPlayerNameEx(playerid));
			SendClientMessageToAllEx(COLOR_LIGHTRED, string);
			InitiatePaycheck();
		}
    }
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	}
    return 1;
}

CMD:sellfish(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, LOCATION_SELLFISH)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not at the spot to sell your fish.");
	new string[128], total=0;
	for (new i=0; i < 5; i++)
	{
		if(PlayerInfo[playerid][pFish][i] != 0)
	    {
	        new
	            amount = 0;
	        switch (PlayerInfo[playerid][pFish][i])
	        {
	            case 1:
	            {
	                amount = random(25) + 25;
	            }

	            case 3:
	            {
             		amount = random(75);
	            }

	            case 4:
	            {
	                amount = random(85);
	            }

	            case 5 .. 6:
	            {
	                amount = random(50) + 25;
	            }
	        }
	        format(string, sizeof(string), "You have sold a %s for $%d cash.", GetFishNameId(PlayerInfo[playerid][pFish][i]), amount);
	        SendClientMessageEx(playerid, COLOR_YELLOW, string);
	        GivePlayerCash(playerid, amount);
	        total += amount;
	        PlayerInfo[playerid][pFish][i] = 0;
	    }
	}
	format(string, sizeof(string), "Total Earnings:{FFFFFF} $%d", total);
	SendClientMessageEx(playerid, COLOR_GREEN, string);
	return 1;
}

CMD:fish(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid,10.0,LOCATION_FISH))
	{
	    new
	        f = GetAvailableFishSlot(playerid),
			string[128];
		if(f == -1) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot carry more than five fish at a time, /releasefish to release them.");

		switch (random(1001))
		{
		    case 0:
		    {
		        new cashAmount = random(1000);
			    format(string, sizeof(string), "You have caught a bag of money containing %d, it has been added to your inventory.", cashAmount);
			    GivePlayerCash(playerid, cashAmount);
		    }

		    case 1 .. 100:
		    {
			    PlayerInfo[playerid][pFish][f] = 1;
			    format(string, sizeof(string), "You have caught a Trout, you can sell it to a 24/7 store using /sellfish for some money.");
		    }

		    case 101 .. 200:
		    {
			    PlayerInfo[playerid][pFish][f] = 3;
			    format(string, sizeof(string), "You have caught a Shark, you can sell it to a 24/7 store using /sellfish for some money.");
		    }

		    case 201 .. 300:
		    {
			    PlayerInfo[playerid][pFish][f] = 4;
			    format(string, sizeof(string), "You have caught a Squid, you can sell it to a 24/7 store using /sellfish for some money.");
		    }

		    case 301 .. 400:
		    {
			    PlayerInfo[playerid][pFish][f] = 5;
			    format(string, sizeof(string), "You have caught a Salmon, you can sell it to a 24/7 store using /sellfish for some money.");
		    }

		    case 401 .. 500:
		    {
			    PlayerInfo[playerid][pFish][f] = 6;
			    format(string, sizeof(string), "You have caught a Manta Ray, you can sell it to a 24/7 store using /sellfish for some money.");
		    }

		    default:
		    {
			    format(string, sizeof(string), "You threw a line in the sea and were unable to catch anything.");
		    }
		}
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You must be at the fishing docks to use this command.");
	}
	return 1;
}

CMD:releasefish(playerid, params[])
{
	new slot, string[128];
	if(sscanf(params, "i", slot)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /releasefish <1-5>");
	else if(slot < 1 || slot > 5) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /releasefish <1-5>");
	else if(PlayerInfo[playerid][pFish][slot-1] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have any fish in that slot.");
	PlayerInfo[playerid][pFish][slot-1] = 0;
	format(string, sizeof(string), "You have just released the fish in slot %d.", slot);
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	return 1;
}

CMD:refill(playerid, params[])
{
	if(PlayerInfo[playerid][pGasCans] >= 1 || IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
	    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be inside a vehicle to use this command.");
	    else if(VehicleInfo[GetPlayerVehicleID(playerid)][vFuel] >= 100) return SendClientMessageEx(playerid, COLOR_GREY, "This car is already at full fuel, you cannot add anymore to it.");
		new
		    string[128];
		if(VehicleInfo[GetPlayerVehicleID(playerid)][vFuel] + 20 >= 100)
			VehicleInfo[GetPlayerVehicleID(playerid)][vFuel] = 100;
		else
			VehicleInfo[GetPlayerVehicleID(playerid)][vFuel] += 20;
		PlayerInfo[playerid][pGasCans]--;
		format(string, sizeof(string), "You have used the gas can on your vehicle, the fuel indicator indicates that you have %d percent of fuel remaining.", VehicleInfo[GetPlayerVehicleID(playerid)][vFuel]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You do not have any gas cans to refill the vehicle.");
	}
	return 1;
}

CMD:sobeitplayers(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
	    new string[128], bool:noHackers = true;
		SendClientMessageEx(playerid, COLOR_WHITE, "--------------------------------");
		SendClientMessageEx(playerid, COLOR_ORANGE, "Listing all players that are currently using s0beit modification...");
	    foreach (new i: Player)
	    {
	        if(GetPVarInt(i, "S0beitCheck") == 2) {
				format(string, sizeof(string), "(ID: %d) %s", i, GetPlayerNameEx(i));
				SendClientMessageEx(playerid, COLOR_GREY, string);
				noHackers = false;
			}
	    }
		if(noHackers) {
			SendClientMessageEx(playerid, COLOR_GREY, "There are no players online that are currently using s0beit.");
		}
		SendClientMessageEx(playerid, COLOR_WHITE, "--------------------------------");
	}
	return 1;
}

CMD:tabbed(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
	    new string[128], noTabbed = 1;
		SendClientMessageEx(playerid, COLOR_WHITE, "--------------------------------");
		SendClientMessageEx(playerid,COLOR_WHITE,"Listing all tabbed players...");
	    foreach (new i: Player)
	    {
	        if(IsPlayerTabbed(i)) {
				format(string, sizeof(string), "(ID: %d) %s - %d seconds", i, GetPlayerNameEx(i), gettime() - LastUpdate[i]);
				SendClientMessageEx(playerid, COLOR_GREY, string);
				noTabbed = 0;
			}
	    }
		if(noTabbed == 1) {
			SendClientMessageEx(playerid, COLOR_GREY, "There are no players online that are currently tabbed.");
		}
		SendClientMessageEx(playerid, COLOR_WHITE, "--------------------------------");
	}
	return 1;
}

CMD:setstation(playerid, params[]) return cmd_car(playerid, "radio");
CMD:setradio(playerid, params[]) return cmd_car(playerid, "radio");

CMD:car(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(!IsRunnableEngine(vehicleid)) return SendClientMessageEx(playerid, COLOR_GREY, "There is no engine on a bicycle Einstein.");
	if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /car [engine, lights, refuel, hood, trunk, status, radio]");
    if(!IsPlayerInAnyVehicle(playerid) || GetPlayerVehicleSeat(playerid) != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You are not inside a vehicle.");
	//if((WhoRentsVehicle(vehicleid) == INVALID_PLAYER_ID && IsARentableVehicle(vehicleid))) return SendClientMessageEx(playerid, COLOR_GREY, "You don't rent this vehicle.");
	//if(IsAPizzaBike(vehicleid) || IsADmvCar(vehicleid) || IsATruckerVehicle(vehicleid)) return 1;
	

	if(!strcmp(params, "engine"))
	{
	    if(VehicleInfo[vehicleid][vFuel] < FUEL_COST) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "Engine Failure:{FFFFFF} You cannot start the engine because the fuel tank is empty.");
    	else if(VehicleInfo[vehicleid][vTotalled]) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "Engine Failure:{FFFFFF} You cannot start the engine because it is damaged.");
	    else if(GetPVarInt(playerid, "EngineStarting") == 1) return 1;
	    new string[128];
		if(VehicleInfo[vehicleid][vEngine] == 0)
	    {
     		SetPVarInt(playerid, "EngineStarting", 1);
			SetTimerEx("StartEngine", 2500, false, "ii", playerid, vehicleid);
			format(string, sizeof(string), "* %s turns the key in the ignition and attempts to start the engine.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	    }
	    else
	    {
		    GetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
			VehicleInfo[vehicleid][vEngine] = 0;
			SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
			format(string, sizeof(string), "* %s turns the key in the ignition and stops the engine.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	    }
	}
	else if(!strcmp(params, "radio") && IsPlayerInAnyVehicle(playerid))
	{
		new stations[1024];
		format(stations, sizeof(stations), "Turn Off\n");
		for (new i=0; i < sizeof(RadioStations); i++)
		{
		    format(stations, sizeof(stations), "%s%s\n", stations, RadioStations[i][1]);
		}
  		ShowPlayerDialogEx(playerid, DIALOG_RADIO, DIALOG_STYLE_LIST, "{FFFFFF}Car Radio", stations, "Select", "Exit");
	}
	else if(!strcmp(params, "lights"))
	{
 		GetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
		if(VehicleInfo[vehicleid][vLights])
		{
		    VehicleInfo[vehicleid][vLights] = 0;
			SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], 0, VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully turned off the lights of the vehicle.");
		} else {
		    VehicleInfo[vehicleid][vLights] = 1;
			SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], 1, VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully turned on the lights of the vehicle.");
		}
	}
	else if(!strcmp(params, "refuel"))
	{
		if(!IsPlayerAtFuelStation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not at a gas station.");
		else if(RefillAmount[playerid] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "Your vehicle is currently being refueled at the moment.");
    	else if(!IsPlayerInAnyVehicle(playerid) || GetPlayerVehicleSeat(playerid) != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You are not inside a vehicle.");
		GetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
		if(VehicleInfo[GetPlayerVehicleID(playerid)][vEngine] == 1)
		{
			VehicleInfo[vehicleid][vEngine] = 0;
		 	SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
		}
		SendClientMessageEx(playerid, COLOR_WHITE, "You are currently refueling your vehicle, it will cost $1.10 per litre of fuel.");
		RefillAmount[playerid] = 1;
		RefuelTimer[playerid] = SetTimerEx("RefuelVehicle", 2000, true, "ii", playerid, vehicleid);
	}
	else if(!strcmp(params, "status"))
	{
	    new string[128];
		format(string, sizeof(string), "{F69521}Vehicle Status{FFFFFF}:{FFFFFF} Fuel: {F69521}%d%%%%{FFFFFF}  | Engine Life: {F69521}%d%%%%{FFFFFF}", VehicleInfo[vehicleid][vFuel], (GetVehicleHealthEx(vehicleid)/10));
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	else if(!strcmp(params, "trunk"))
	{
		GetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
		if(VehicleInfo[vehicleid][vBoot])
		{
		    VehicleInfo[vehicleid][vBoot] = 0;
			SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully closed the trunk of your car.");
		} else {
		    VehicleInfo[vehicleid][vBoot] = 1;
			SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully opened the trunk of your car.");
		}
		SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
	}
	else if(!strcmp(params, "hood"))
	{
		GetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
		if(VehicleInfo[vehicleid][vBonnet])
		{
		    VehicleInfo[vehicleid][vBonnet] = 0;
			SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully closed the hood of your car.");
		} else {
		    VehicleInfo[vehicleid][vBonnet] = 1;
			SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully opened the hood of your car.");
		}
		SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
	}
	else SendClientMessageEx(playerid, COLOR_GREY, "ERROR: Invalid option selected.");
	return 1;
}

public StartEngine(playerid, vehicleid)
{
	DeletePVar(playerid, "EngineStarting");
	if(VehicleInfo[vehicleid][vTotalled]) return 0;
	else if(VehicleInfo[vehicleid][vFuel] < FUEL_COST) return 0;
	static Float:tvPosition[3];
	GetVehiclePos(vehicleid, tvPosition[0], tvPosition[1], tvPosition[2]);
	foreach(new i: Player)
	{
		if((GetPVarInt(i, "PCB") - 1) == vehicleid)
		{
			if(HitmanTarget[i] == playerid)
   			{
			   	new string[128];
				format(string, sizeof(string), "You have been critically injured by a hitman and lost $%d.", PlayerInfo[playerid][pContractPrice]);
				SendClientMessageEx(playerid, COLOR_YELLOW, string);
			    format(string, sizeof(string), "Hitman %s has fulfilled the contract on %s's head and collected $%d.", GetPlayerNameEx(i), GetPlayerNameEx(playerid), PlayerInfo[playerid][pContractPrice]);
				SendHitmanMessage(COLOR_YELLOW, string);
				Log("logs/contract.log", string);
				PlayerInfo[playerid][pMoney] -= PlayerInfo[playerid][pContractPrice];
				PlayerInfo[i][pMoney] += PlayerInfo[playerid][pContractPrice];
				PlayerInfo[i][pCompletedHits]++;
				PlayerInfo[playerid][pContractPrice] = 0;
				format(PlayerInfo[playerid][pContractReason], 32, "");
				format(PlayerInfo[playerid][pContractBy], MAX_PLAYER_NAME, "");
				HitmanTarget[i] = INVALID_PLAYER_ID;
		    	RemovePlayerFromVehicle(playerid);
				CreateExplosion(tvPosition[0], tvPosition[1], tvPosition[2], 0, 25);
		    	SetVehicleHealth(vehicleid, 0);
		    	VehicleInfo[vehicleid][vTotalled] = 1;
		    	SetPlayerHealthEx(playerid, 0);
			    DeletePVar(i, "PCB");
			}
	    }
	}
	new echance, Float:vhp; GetVehicleHealth(vehicleid, vhp);
 	echance = random(floatround(vhp/100));
	if(echance != 0)
	{
	    new string[128];
		format(string, sizeof(string), "* The vehicle engine was successfully started. (( %s)) ", GetPlayerNameEx(playerid));
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		GetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
		VehicleInfo[vehicleid][vEngine] = 1;
	 	SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
  	}
  	else
  	{
	    new string[128];
		format(string, sizeof(string), "* The vehicle engine failed to start. (( %s ))", GetPlayerNameEx(playerid));
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
  	}
	return 1;
}

public RefuelVehicle(playerid, vehicleid)
{
	if(!IsPlayerConnectedEx(playerid)) return KillTimer(RefuelTimer[playerid]);
	else if(!IsPlayerInAnyVehicle(playerid) || GetPlayerVehicleID(playerid) != vehicleid || !IsPlayerAtFuelStation(playerid) || VehicleInfo[vehicleid][vEngine] == 1 || VehicleInfo[vehicleid][vFuel] >= 100)
	{
	    new fuelstring[64];
	    if(!IsACopCar(vehicleid) || !IsAMedicCar(vehicleid) || !IsAGovCar(vehicleid))
	    {
			GivePlayerCash(playerid, -RefillAmount[playerid]*2);
		    format(fuelstring, sizeof(fuelstring), "The total cost of your petrol bill is: $%i.", RefillAmount[playerid]*2);
	    }
	    else
	    {
		    format(fuelstring, sizeof(fuelstring), "Your petrol bill has been paid for by the state government.");
	    }
	    SendClientMessageEx(playerid, COLOR_ORANGE, fuelstring);
	    RefillAmount[playerid] = 0;
	    KillTimer(RefuelTimer[playerid]);
	}
	else
	{
		VehicleInfo[GetPlayerVehicleID(playerid)][vFuel] += FUEL_COST;
		RefillAmount[playerid] += 2;
	}
	return 1;
}

CMD:getjob(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid))
	{
	    if(PlayerInfo[playerid][pJob] == 0)
	    {
			if(IsPlayerInRangeOfPoint(playerid, 2.0, LOCATION_TRUCKERJOB))
			{
			    PlayerInfo[playerid][pJob] = 1;
		        SendClientMessageEx(playerid, COLOR_WHITE, "You are now a Trucker.");
		        SendClientMessageEx(playerid, COLOR_WHITE, "Type /help for more information and commands about your job.");
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, LOCATION_MECHANICJOB))
			{
			    PlayerInfo[playerid][pJob] = 2;
		        SendClientMessageEx(playerid, COLOR_WHITE, "You are now a Mechanic.");
		        SendClientMessageEx(playerid, COLOR_WHITE, "Type /help for more information and commands about your job.");
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, LOCATION_PIZZAJOB))
			{
			    PlayerInfo[playerid][pJob] = 3;
			    SetPlayerSkinEx(playerid, 155);
		        SendClientMessageEx(playerid, COLOR_WHITE, "You are now a Pizza Boy.");
		        SendClientMessageEx(playerid, COLOR_WHITE, "Type /help for more information and commands about your job.");
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, LOCATION_MINERJOB))
			{
			    PlayerInfo[playerid][pJob] = 4;
			    SetPlayerSkinEx(playerid, 27);
		        SendClientMessageEx(playerid, COLOR_WHITE, "You are now a Miner.");
		        SendClientMessageEx(playerid, COLOR_WHITE, "Type /help for more information and commands about your job.");
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, LOCATION_TAXIJOB))
			{
			    if(PlayerInfo[playerid][pDriverLicense] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You need a valid drivers license to be employed within the Taxi Company.");
			    PlayerInfo[playerid][pJob] = 5;
		        SendClientMessageEx(playerid, COLOR_WHITE, "You are now a Taxi Driver.");
		        SendClientMessageEx(playerid, COLOR_WHITE, "Type /help for more information and commands about your job.");
		        SendClientMessageEx(playerid, COLOR_GREY, "NOTE: Wrecking a taxi can get your driver's license revoked.");
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, LOCATION_SMUGGLERJOB))
			{
			    if(!IsAnIllegal(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You need to be in an illegal faction to take this job.");
			    PlayerInfo[playerid][pJob] = 6;
		        SendClientMessageEx(playerid, COLOR_WHITE, "You are now a Drug Smuggler.");
		        SendClientMessageEx(playerid, COLOR_WHITE, "Type /help for more information and commands about your job.");
			}
			else
			{
		        SendClientMessageEx(playerid, COLOR_GREY, "You are not near a place to get a job.");
			}
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "You already have a job, type /quitjob to quit your current job.");
		}
	}
	else
	{
 		SendClientMessageEx(playerid, COLOR_GREY, "You cannot get a job while inside a vehicle.");
	}
	return 1;
}

CMD:quitjob(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid))
	{
		if(PlayerInfo[playerid][pJob] > 0)
		{
		    switch(PlayerInfo[playerid][pJob])
		    {
		        case 1:
		        {
			 		DeletePVar(playerid, "RouteTruck");
					DeletePVar(playerid, "RouteId");
				 	DeletePVar(playerid, "RoutePayment");
		        }

		        case 3:
		        {
			 		DeletePVar(playerid, "PizzaBike");
					DeletePVar(playerid, "PizzaID");
				 	DeletePVar(playerid, "PizzaPayment");
		            SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
		        }

		        case 4:
		        {

		        }

		        case 6:
		        {
					KillDrugRoute(playerid);
		        }
			}
			PlayerInfo[playerid][pJob] = 0;
			DisablePlayerCheckpoint(playerid);
   			SendClientMessageEx(playerid, COLOR_WHITE, "You have succesfully quit your job.");
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "You are unemployed, and don't have a job.");
		}
	}
	else
	{
 		SendClientMessageEx(playerid, COLOR_GREY, "You cannot quit your job while you are inside a vehicle.");
	}
	return 1;
}


CMD:s(playerid, params[]) return cmd_shout(playerid, params);
CMD:shout(playerid, params[])
{
	new string[128];
	if(sscanf(params, "{s[128]}")) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /s(hout) [message]");
	format(string, sizeof(string), "%s shouts: %s!", GetPlayerNameEx(playerid), params);
    ProxDetector(30.0, playerid, string, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE, COLOR_FADE1, COLOR_FADE2);
    return 1;
}

CMD:l(playerid, params[]) return cmd_low(playerid, params);
CMD:low(playerid, params[])
{
	new string[128];
	if(sscanf(params, "{s[128]}")) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /l(ow) [message]");
	format(string, sizeof(string), "%s quietly: %s", GetPlayerNameEx(playerid), params);
    ProxDetector(5.0, playerid, string, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);
	return 1;
}

CMD:togphone(playerid, params[])
{
	if(PlayerInfo[playerid][pPhoneNumber] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You do not own a cellphone, purchase one at a 24/7 store.");
	else if(PhoneState[playerid] == 1 || CallingTo[playerid] != INVALID_PLAYER_ID) return SendClientMessageEx(playerid, COLOR_GREY, "Your phone is already in use.");
	switch(PlayerInfo[playerid][pPhoneToggled])
	{
	    case 1:
	    {
	        SendClientMessageEx(playerid, COLOR_WHITE, "You have switched your phone back on.");
	        PlayerInfo[playerid][pPhoneToggled] = 0;
	    }

	    default:
	    {
	        SendClientMessageEx(playerid, COLOR_WHITE, "You have switched off your phone, type /togphone to turn it back on.");
	        PlayerInfo[playerid][pPhoneToggled] = 1;
	    }
	}
	return 1;
}

CMD:call(playerid, params[])
{
	new number, string[128];
	if(PlayerInfo[playerid][pPhoneNumber] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You do not own a cellphone, purchase one at a 24/7 store.");
	else if(sscanf(params, "i", number)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /call [number] (Emergency - 911, Taxi - 555");
	else if(GetPVarInt(playerid, "IsCuffed") == 1 || GetPVarInt(playerid, "ActionRestriction") == 1 || PlayerInfo[playerid][pWounded] == PLAYER_DEAD) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this at this time.");
	else if(number == 0 || number == PlayerInfo[playerid][pPhoneNumber]) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid number on your cellphone, please try again...");
	else if(PhoneState[playerid] == 1 || CallingTo[playerid] != INVALID_PLAYER_ID) return SendClientMessageEx(playerid, COLOR_GREY, "Your phone is already in use.");
	else if(PlayerInfo[playerid][pPhoneToggled] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "Your phone is currently switched off.");

	format(string, sizeof(string), "* %s takes out a cellphone.", GetPlayerNameEx(playerid));
 	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	SendClientMessageEx(playerid, COLOR_WHITE, "HINT: You now use T to talk on your cellphone, type /hangup to hang up.");
	if(number == 911)
	{
	    SendClientMessageEx(playerid, COLOR_YELLOW, "EMERGENCY: Hello you have reached the emergency service line, which service do you require? (police, ems)");
	    SetPVarInt(playerid, "Calling911", 1);
		PhoneState[playerid] = 1;
	}
	else if(number == 555)
	{
	    if(!AreAnyTaxiDriversOnline()) return SendClientMessageEx(playerid, COLOR_GREY, "There are currently no taxi driver units available, please try again later.");
		else if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this at this time.");
	    gCurrentTaxiCall = playerid;
	    format(string, sizeof(string), "** (ID: %d) %s requires a taxi at location %s, (/accept taxi).", playerid, GetPlayerNameEx(playerid), GetPlayerZone(playerid));
		foreach (new i: Player)
		{
			if(PlayerInfo[i][pJob] == 5) SendClientMessageEx(i, COLOR_LIGHTYELLOW, string);
		}
		SendClientMessageEx(playerid, COLOR_LIGHTYELLOW, "Taxi Company: Thank you for calling. Please wait at your current location till the dispatched taxi arrives.");
	}
	else
	{
	    new targetid = GetPlayerIDFromNumber(number);
 		if(targetid == INVALID_PLAYER_ID) return SendClientMessageEx(playerid, COLOR_GREY, "The number you have dialed is currently unavailable, please try again later...");
		else if(PhoneState[targetid] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "The specified number is busy (already on a call), try again later...");
		if(PlayerInfo[targetid][pPhoneToggled] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "That persons phone is currently switched off.");
		CallingTo[playerid] = targetid;
		CallingTo[targetid] = playerid;
		PhoneState[playerid] = 1;
		format(string, sizeof(string), "Your mobile is ringing, type /pickup to answer it. [Caller ID: %d]", PlayerInfo[playerid][pPhoneNumber]);
		SendClientMessageEx(targetid, COLOR_YELLOW, string);

		format(string, sizeof(string), "* %s's phone begins to ring.", GetPlayerNameEx(targetid));
		ProxDetector(30.0, targetid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	if(!IsPlayerRestricted(playerid)) SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
	return 1;
}

CMD:h(playerid, params[]) return cmd_hangup(playerid, params);
CMD:hangup(playerid, params[])
{
	new
		string[128];
	if(PlayerInfo[playerid][pPhoneNumber] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You do not own a cellphone, purchase one at a 24/7 store.");
	else if(CallingTo[playerid] == INVALID_PLAYER_ID || PhoneState[playerid] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Your phone is in your pocket.");
	if(GetPVarInt(playerid, "Calling911") == 1 || CallingTo[playerid] == 911)
	{
	    DeletePVar(playerid, "Calling911");
	}
	else if(CallingTo[CallingTo[playerid]] == playerid)
	{
		CallingTo[CallingTo[playerid]] = INVALID_PLAYER_ID;
		PhoneState[CallingTo[playerid]] = 0;
		SendClientMessageEx(CallingTo[playerid], COLOR_GREY, "They hung up.");
		if(!IsPlayerRestricted(CallingTo[playerid])) SetPlayerSpecialAction(CallingTo[playerid], SPECIAL_ACTION_STOPUSECELLPHONE);
		format(string, sizeof(string), "* %s's puts away their cellphone.", GetPlayerNameEx(CallingTo[playerid]));
		ProxDetector(30.0, CallingTo[playerid], string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	SendClientMessageEx(playerid, COLOR_GREY, "You hung up.");
	CallingTo[playerid] = INVALID_PLAYER_ID;
	PhoneState[playerid] = 0;
	if(!IsPlayerRestricted(playerid)) SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
	format(string, sizeof(string), "* %s puts away their cellphone.", GetPlayerNameEx(playerid));
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	return 1;
}

CMD:time(playerid, params[])
{
	new string[128], mtext[20], thour, suffix[3], year, month,day;
    getdate(year, month, day);
    if(month == 1) { mtext = "January"; }
    else if(month == 2) { mtext = "February"; }
    else if(month == 3) { mtext = "March"; }
    else if(month == 4) { mtext = "April"; }
    else if(month == 5) { mtext = "May"; }
    else if(month == 6) { mtext = "June"; }
    else if(month == 7) { mtext = "July"; }
    else if(month == 8) { mtext = "August"; }
    else if(month == 9) { mtext = "September"; }
    else if(month == 10) { mtext = "October"; }
    else if(month == 11) { mtext = "November"; }
    else if(month == 12) { mtext = "December"; }
	if(WorldTime[0] > 12 && WorldTime[0] < 24)
	{
		thour = WorldTime[0] - 12;
		suffix = "PM";
	}
	else if(WorldTime[0] == 12)
	{
		thour = 12;
		suffix = "PM";
	}
	else if(WorldTime[0] > 0 && WorldTime[0] < 12)
	{
		thour = WorldTime[0];
		suffix = "AM";
	}
	else if(WorldTime[0] == 0)
	{
		thour = 12;
		suffix = "AM";
	}
	format(string, sizeof(string), "~y~%s %d, %d~n~~g~|~w~%d:%02d~g~%s|", mtext, day, year, thour, WorldTime[1], suffix);

	if(!IsPlayerRestricted(playerid) && !IsPlayerInAnyVehicle(playerid)) ApplyAnimation(playerid,"COP_AMBIENT","Coplook_watch", 4.0, 0, 0, 0, 0, 0, 1);
    GameTextForPlayer(playerid, string, 5000, 1);
    return 1;
}

CMD:p(playerid, params[]) return cmd_pickup(playerid, params);
CMD:pickup(playerid, params[])
{
	if(PlayerInfo[playerid][pPhoneNumber] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You do not own a cellphone, purchase one at a 24/7 store.");
	else if(CallingTo[playerid] == INVALID_PLAYER_ID) return SendClientMessageEx(playerid, COLOR_GREY, "No one is calling you.");
	else if(CallingTo[CallingTo[playerid]] != playerid) return SendClientMessageEx(playerid, COLOR_GREY, "The specified number has disconnected from the phone network.");
	else if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this at this time.");
	PhoneState[playerid] = 1;
 	SendClientMessageEx(playerid, COLOR_GREY, "You have picked up the phone.");
	SendClientMessageEx(CallingTo[playerid], COLOR_GREY, "They have picked up the phone.");
	if(!IsPlayerRestricted(playerid)) SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
	return 1;
}

CMD:t(playerid, params[])
{
	return cmd_sms(playerid, params);
}

CMD:sms(playerid, params[])
{
	new number, string[128];
	if(PlayerInfo[playerid][pPhoneNumber] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You do not own a cellphone, purchase one at a 24/7 store.");
	else if(sscanf(params, "is[128]", number, string))
	{
	    return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /sms [number] [text]");
	}
	else if(PhoneState[playerid] == 1 || CallingTo[playerid] != INVALID_PLAYER_ID) return SendClientMessageEx(playerid, COLOR_GREY, "Your phone is already in use.");
	else if(number == 0 || GetPlayerIDFromNumber(number) == INVALID_PLAYER_ID  || strval(params) == PlayerInfo[playerid][pPhoneNumber]) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid number on your cellphone, please try again...");
	else if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this at this time.");
	else if(PlayerInfo[playerid][pPhoneToggled] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "Your phone is currently switched off.");
    new targetid = GetPlayerIDFromNumber(number);
	if(PlayerInfo[targetid][pPhoneToggled] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "That persons phone is currently switched off.");
	format(string, sizeof(string), "SMS: %s, Sender: %i", string, PlayerInfo[playerid][pPhoneNumber]);
	SendClientMessageEx(targetid, COLOR_YELLOW, string);
	format(string, sizeof(string), "SMS: %s, Sent: %i", string, PlayerInfo[targetid][pPhoneNumber]);
	SendClientMessageEx(playerid, COLOR_YELLOW, string);
	GameTextForPlayer(playerid, "~r~$-1", 5000, 1);
	GivePlayerCash(playerid, -1);
	PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	format(string, sizeof(string), "* %s takes out a cellphone.", GetPlayerNameEx(playerid));
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	return 1;
}

CMD:togpm(playerid, params[])
{
	if(PlayerInfo[playerid][pTogPM] == 0)
	{
	    PlayerInfo[playerid][pTogPM] = 1;
	    SendClientMessageEx(playerid, COLOR_WHITE, "You have disabled private messaging, other players will not be able to send you a message.");
	}
	else
	{
	    PlayerInfo[playerid][pTogPM] = 0;
	    SendClientMessageEx(playerid, COLOR_WHITE, "You have enabled private messaging, anyone will now be able to send you a message.");
	}
	return 1;
}

CMD:pm(playerid, params[])
{
	new string[128], message[128], targetid;
	if(sscanf(params, "us[128]", targetid, message)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /pm [playerid] [message]");
   	else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
   	else if(targetid == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
   	else if(PlayerInfo[targetid][pTogPM] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player has disabled private messaging, you cannot send them a message.");

	format(string, sizeof(string), "(( PM sent to (ID: %d) %s: %s ))", targetid, GetPlayerNameEx(targetid), message);
	SendClientMessageEx(playerid, 0xF6EA51AA, string);
	format(string, sizeof(string), "(( PM from (ID: %d) %s: %s ))", playerid, GetPlayerNameEx(playerid), message);
   	SendClientMessageEx(targetid, 0xF6D600AA, string);
    return 1;
}

CMD:w(playerid, params[])
{
	new string[128], message[128], targetid;
	if(sscanf(params, "us[128]", targetid, message))
	{
 		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /w(hisper) [playerid] [message]");
   	}
   	else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
   	else if(!IsPlayerInRangeOfPlayer(playerid, targetid) && !IsAdmin(playerid, ADMIN_LEVEL_TWO)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the specified player to use this command.");
   	else if(playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
	format(string, sizeof(string), "(ID %d) %s whispers to you: %s", playerid, GetPlayerNameEx(playerid), message);
	SendClientMessageEx(targetid, COLOR_YELLOW, string);
	format(string, sizeof(string), "You whispered to (ID %d) %s: %s", targetid, GetPlayerNameEx(targetid), message);
	SendClientMessageEx(playerid, COLOR_YELLOW, string);
    return 1;
}

CMD:whisper(playerid, params[])
{
	return cmd_w(playerid, params);
}

CMD:b(playerid, params[])
{
	if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /b(rackets) [message]");
	new string[128];
	format(string, sizeof(string), "%s says: (( %s ))", GetPlayerNameEx(playerid), params);
    ProxDetector(20.0, playerid, string, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);
    return 1;
}

CMD:me(playerid, params[])
{
	if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /me [action]");
	new string[128];
	format(string, sizeof(string), "{FF8000}*{C2A2DA} %s %s", GetPlayerNameEx(playerid), params);
    ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    return 1;
}

CMD:do(playerid, params[])
{
	new string[128];
	if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /do [action]");
	else if(strlen(params) > 99) {
	    format(string, sizeof(string), "The message cannot be more than 99 characters in length, please shorten it by %d characters.", strlen(params) - 99);
		return SendClientMessageEx(playerid, COLOR_GREY, string);
	}
	format(string, sizeof(string), "{FF8000}*{C2A2DA} %s (( %s ))", params, GetPlayerNameEx(playerid));
    ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    return 1;
}

CMD:ooc(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
	    if(sscanf(params, "{s[64]}")) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /ooc [message]");
		new string[128];
		format(string, sizeof(string), "(( %s %s: %s ))", GetAdminRank(playerid), GetPlayerNameEx(playerid), params);
		SendClientMessageToAllEx(COLOR_WHITE, string);
	}
	return 1;
}

CMD:advert(playerid, params[])
{
	new string[128];
	if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /ad(vert) [text]");
    else if(gettime() - gAdvertisementTime < 0)
	{
		format(string, sizeof(string), "Please wait %i seconds before using the advertisement channel.", gAdvertisementTime - gettime());
    	return SendClientMessageEx(playerid, COLOR_GREY, string);
   	}
	else if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this at this time.");
  	else if(PlayerInfo[playerid][pAdMute] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "You are muted from the advert channel.");
	else if(PlayerInfo[playerid][pPhoneNumber] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You must own a phone to use this command, buy one from a local 24/7.");
	else if(strlen(params) > 64) return SendClientMessageEx(playerid, COLOR_GREY, "The advertisement cannot exceed more than 64 characters in length.");
	new payout = strlen(params) * 25;
	if(PlayerInfo[playerid][pMoney] < payout)
	{
		format(string, sizeof(string), "* You used %d characters which cost $%d, you don't have enough.", strlen(params), payout);
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		return 1;
	}
	format(string, sizeof(string), "~r~Paid $%d~n~~w~Message contained: %d Characters", payout, strlen(params));
	GameTextForPlayer(playerid, string, 5000, 5);
	format(string, sizeof(string), "[Advertisement] %s - contact %s (%d)", params, GetPlayerNameEx(playerid),PlayerInfo[playerid][pPhoneNumber]);
    SendClientMessageToAllEx(0x00D900C8, string);
	gAdvertisementTime = gettime() + 60;
    PlayerInfo[playerid][pMoney] -= payout;
    AddVaultMoney(4, payout);
    return 1;
}

CMD:ad(playerid, params[])
{
	return cmd_advert(playerid, params);
}

CMD:gov(playerid, params[])
{
	new string[128];
	if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /gov [text]");
	else if(PlayerInfo[playerid][pLeadership] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You are not a faction leader to use this command.");
	SendClientMessageToAllEx(COLOR_WHITE, "|___________ Government News Announcement ___________|");
	format(string, sizeof(string), "** %s %s says: %s **", GetRankName(playerid), GetPlayerNameEx(playerid), params);
	if(IsACop(playerid)) SendClientMessageToAllEx(TEAM_COLOR_LSPD, string);
	else if(IsAGov(playerid)) SendClientMessageToAllEx(TEAM_COLOR_GOV, string);
	else if(IsAMedic(playerid)) SendClientMessageToAllEx(TEAM_COLOR_LSFD, string);
	else SendClientMessageEx(playerid, COLOR_GREY, "You are not in a faction with acess to this command.");
	return 1;
}


CMD:a(playerid, params[]) return cmd_admin(playerid, params);
CMD:admin(playerid, params[])
{
	if(PlayerInfo[playerid][pAdminLevel] >= ADMIN_LEVEL_TWO)
	{
		if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /a(dmin) [message]");
		new string[128];
		format(string, sizeof(string), "** %s %s: %s **", GetAdminRank(playerid), GetPlayerNameEx(playerid), params);
		foreach(new i: Player) if(PlayerInfo[i][pAdminLevel] >= ADMIN_LEVEL_ONE) SendClientMessageEx(i, COLOR_YELLOW, string);
	}
	return 1;
}

CMD:members(playerid, params[])
{
    if(PlayerInfo[playerid][pFaction] == 0) return SendClientMessageEx(playerid, COLOR_WHITE, "You're not in a faction.");
	SendClientMessageEx(playerid, COLOR_WHITE, "Online Members:");
	foreach(new i: Player)
	{
 		if(PlayerInfo[i][pFaction] > 0)
	    {
			if(PlayerInfo[i][pFaction] == PlayerInfo[playerid][pFaction])
		    {
		    	new string[128], dutystatus[10];
		        switch(PlayerInfo[i][pDuty])
		        {
			        case 0: { dutystatus = "Off Duty"; }
			        case 1: { dutystatus = "On Duty"; }
				}
				format(string, sizeof(string), "(%d) %s %s is online (%s)", PlayerInfo[i][pRank], GetRankName(i), GetPlayerNameEx(i), dutystatus);
				SendClientMessageEx(playerid, COLOR_WHITE, string);
			}
		}
	}
	return 1;
}
CMD:newb(playerid, params[]) return cmd_newbie(playerid, params);
CMD:newbie(playerid, params[])
{
	new string[128];
	if(sscanf(params, "s[128]", string)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /newb(ie) [message]");
	else if(gettime() - nTimeLeft[playerid] < 0 && !IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
		format(string, sizeof(string), "Please wait %i seconds before using the newbie channel again.", nTimeLeft[playerid] - gettime());
    	return SendClientMessageEx(playerid, COLOR_GREY, string);
    }
   	else if(PlayerInfo[playerid][pNewbMute] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "You are muted from the newbie channel.");
   	else if(PlayerInfo[playerid][pTogNewbie] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You have the newbie channel toggled, type /tognewbie to enable it.");
   	else if(gNewbie == false) return SendClientMessageEx(playerid, COLOR_GREY, "The newbie chat was disabled by an administrator.");

	if(PlayerInfo[playerid][pAdminLevel] == ADMIN_LEVEL_ONE) format(string, sizeof(string), "* Moderator %s: %s", GetPlayerNameEx(playerid), string);
	else if(IsAdmin(playerid, ADMIN_LEVEL_TWO)) format(string, sizeof(string), "* Administrator %s: %s", GetPlayerNameEx(playerid), string);
   	else format(string, sizeof(string), "* %s %s: %s", GetAdminRank(playerid), GetPlayerNameEx(playerid), string);

	nTimeLeft[playerid] = gettime() + 15;
   	foreach(new i: Player) if(PlayerInfo[i][pTogNewbie] == 1) SendClientMessageEx(i, 0xADFF2FAA, string);
    return 1;
}

CMD:tognewbie(playerid, params[])
{
	if(PlayerInfo[playerid][pTogNewbie] == 0)
	{
	    PlayerInfo[playerid][pTogNewbie] = 1;
	    SendClientMessageEx(playerid, COLOR_WHITE, "You have enabled the newbie channel, you will now receive messages from other players.");
	}
	else
	{
	    PlayerInfo[playerid][pTogNewbie] = 0;
	    SendClientMessageEx(playerid, COLOR_WHITE, "You have disabled the newbie channel, you can re-enable it by using /tognewbie again.");
	}
	return 1;
}

CMD:nonewbie(playerid, params[])
{
	if(!IsAdmin(playerid, ADMIN_LEVEL_FOUR)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(gNewbie == false)
	{
	    gNewbie = true;
	    SendClientMessageEx(playerid, COLOR_WHITE, "You have enabled the newbie channel.");
	}
	else
	{
	    gNewbie = false;
	    SendClientMessageEx(playerid, COLOR_WHITE, "You have disabled the newbie channel.");
	}
	return 1;
}


CMD:debug(playerid, params[])
{
    if(!IsAdmin(playerid, ADMIN_LEVEL_TWO)) return 1;
	new Float:cPosition[3], Float:Position[4], Float:vAngle, string[128];
	GetPlayerFacingAngle(playerid, Position[3]);
	GetPlayerPos(playerid, Position[0], Position[1], Position[2]);
	GetPlayerCameraPos(playerid, cPosition[0], cPosition[1], cPosition[2]);
	SendClientMessageEx(playerid, COLOR_ORANGE, "------------------------------------------");
	SendClientMessageEx(playerid, COLOR_ORANGE, "Debug {FFFFFF}Information");
	format(string, sizeof(string), "Position X: %f, Position Y: %f, Position Z: %f, Facing Angle: %f", Position[0], Position[1], Position[2], Position[3]);
	SendClientMessageEx(playerid, COLOR_YELLOW, string);
	format(string, sizeof(string), "Interior: %i, Virtual World: %i, SafeMode: %i", GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid), GetPVarType(playerid, "SafeMode"));
	SendClientMessageEx(playerid, COLOR_YELLOW, string);
	format(string, sizeof(string), "Cuffed: %i, A.R: %i, Wounded: %i", GetPVarInt(playerid, "IsCuffed"), GetPVarInt(playerid, "ActionRestriction"), PlayerInfo[playerid][pWounded]);
	SendClientMessageEx(playerid, COLOR_YELLOW, string);
	format(string, sizeof(string), "Health: %f, Armour: %f, Skin: %i, IP: %s", PlayerInfo[playerid][pHealth], PlayerInfo[playerid][pArmour], PlayerInfo[playerid][pSkin], PlayerInfo[playerid][pIpAddress]);
	SendClientMessageEx(playerid, COLOR_YELLOW, string);
	if(IsPlayerInAnyVehicle(playerid))
	{
		GetVehiclePos(GetPlayerVehicleID(playerid), cPosition[0], cPosition[1], cPosition[2]);
		GetVehicleZAngle(GetPlayerVehicleID(playerid), vAngle);
		format(string, sizeof(string), "Vehicle X: %f, Vehicle Y: %f, Vehicle Z: %f, Facing Angle: %f", cPosition[0], cPosition[1], cPosition[2], vAngle);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
	}
	SendClientMessageEx(playerid, COLOR_ORANGE, "------------------------------------------");
	return 1;
}

CMD:setint(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
		new targetid, interiorid, string[128];
		if(sscanf(params, "ui", targetid, interiorid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /setint [playerid] [interiorid]");
	 	else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		format(string, sizeof(string), "AdmCmd: %s has set %s's interior to: %i.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), interiorid);
		AdminAlert(string, ALERT_ADMINS);
		SetPlayerInteriorEx(targetid, interiorid);
	}
	return 1;
}

CMD:kick(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_ONE))
    {
	    new targetid, reason[128];
		if(sscanf(params, "us[128]", targetid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /kick [playerid] [reason]");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	   	else if(targetid == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
		else if(PlayerInfo[targetid][pAdminLevel] > PlayerInfo[playerid][pAdminLevel]) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot kick administrators that are higher rank than you.");
		LogEx(targetid, LOG_TYPE_KICK, playerid, reason);
		format(reason, sizeof(reason), "AdmCmd: %s was kicked by %s, reason: %s", GetPlayerNameEx(targetid), GetPlayerNameEx(playerid), reason);
		AdminAlert(reason, ALERT_GLOBAL);
		KickEx(targetid);
		return 1;
   	}
   	else
   	{
       	return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	}
}

CMD:jetpack(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_THREE))
    {
	    new
			targetid,
			reason[128];
		if(sscanf(params, "u", targetid))
		{
	 		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /jetpack [playerid]");
		}
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		format(reason, sizeof(reason), "AdmCmd: %s has received a jetpack from %s.", GetPlayerNameEx(targetid), GetPlayerNameEx(playerid));
		AdminAlert(reason, ALERT_GLOBAL);
		SetPVarInt(targetid, "JetpackAuthorized", 1);
		SetPlayerSpecialAction(targetid, SPECIAL_ACTION_USEJETPACK);
		return 1;
   	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	}
	return 1;
}

CMD:mute(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
	    new targetid, option[32], reason[128];
		if(sscanf(params, "us[32]", targetid, option))
		{
	 		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /mute [playerid] [newbie, advert, report]");
		}
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");

		if(!strcmp(option, "newbie", true))
		{
			format(reason, sizeof(reason), "AdmCmd: %s was muted from the newbie channel by %s due to abuse.", GetPlayerNameEx(targetid), GetPlayerNameEx(playerid));
			AdminAlert(reason, ALERT_GLOBAL);
			format(reason, sizeof(reason), "You were muted from the newbie channel and fined $%i.", (PlayerInfo[targetid][pMoney] / 100) * 10);
			SendClientMessageEx(targetid, COLOR_YELLOW, reason);
			PlayerInfo[targetid][pMoney] -= (PlayerInfo[targetid][pMoney] / 100) * 10;
			PlayerInfo[targetid][pNewbMute] = 1;

			format(reason, sizeof(reason), "%s was muted from the newbie channel by %s.", GetPlayerNameEx(targetid), playerid);
			Log("logs/mute.log", reason);
		}
		if(!strcmp(option, "advert", true))
		{
		    format(reason, sizeof(reason), "AdmCmd: %s was muted from the advertisement channel by %s due to abuse.", GetPlayerNameEx(targetid), GetPlayerNameEx(playerid));
			AdminAlert(reason, ALERT_GLOBAL);
			format(reason, sizeof(reason), "You were muted from the advertisement channel and fined $%i.", (PlayerInfo[targetid][pMoney] / 100) * 10);
			SendClientMessageEx(targetid, COLOR_YELLOW, reason);
			PlayerInfo[targetid][pMoney] -= (PlayerInfo[targetid][pMoney] / 100) * 10;
			PlayerInfo[targetid][pAdMute] = 1;

			format(reason, sizeof(reason), "%s was muted from the advertisement channel by %s.", GetPlayerNameEx(targetid), playerid);
			Log("logs/mute.log", reason);
		}
		else if(!strcmp(option, "report", true))
		{
			format(reason, sizeof(reason), "{FF6347}AdmWarning:{FFFF00} %s has muted %s from creating reports and fined $%i.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), (PlayerInfo[targetid][pMoney] / 100) * 5);
			AdminAlert(reason, ALERT_ADMINS);
			format(reason, sizeof(reason), "You were muted by %s from creating reports and fined $%i.", GetPlayerNameEx(playerid), (PlayerInfo[targetid][pMoney] / 100) * 5);
			SendClientMessageEx(targetid, COLOR_YELLOW, reason);
			PlayerInfo[targetid][pMoney] -= (PlayerInfo[targetid][pMoney] / 100) * 15;
			PlayerInfo[targetid][pReportMute] = 1;

			format(reason, sizeof(reason), "%s was muted from creating reports by %s.", GetPlayerNameEx(targetid), playerid);
			Log("logs/mute.log", reason);
		}
		return 1;
   	}
   	else
   	{
       	return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	}
}

CMD:unmute(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_THREE))
    {
	    new
			targetid,
			option[32],
			string[128];
		if(sscanf(params, "us[32]", targetid, option))
		{
	 		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /unmute [playerid] [newbie, advert, ooc, report]");
		}
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");

		if(!strcmp(option, "newbie", true))
		{
		    if(PlayerInfo[targetid][pNewbMute] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "They are not muted from the newbie channel.");
		    PlayerInfo[targetid][pNewbMute] = 0;
			format(string, sizeof(string), "You have been unmuted from the newbie channel by %s.", GetPlayerNameEx(playerid));
			SendClientMessageEx(targetid, COLOR_YELLOW, string);
			format(string, sizeof(string), "You have unmuted %s from the newbie channel.", GetPlayerNameEx(targetid));
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
		}
		else if(!strcmp(option, "advert", true))
		{
		    if(PlayerInfo[targetid][pAdMute] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "They are not muted from the advertisement channel.");
		    PlayerInfo[targetid][pAdMute] = 0;
			format(string, sizeof(string), "You have been unmuted from the advertisement channel by %s.", GetPlayerNameEx(playerid));
			SendClientMessageEx(targetid, COLOR_WHITE, string);
			format(string, sizeof(string), "You have unmuted %s from the advertisement channel.", GetPlayerNameEx(targetid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(!strcmp(option, "report", true))
		{
		    if(PlayerInfo[targetid][pReportMute] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "They are not muted from making reports.");
		    PlayerInfo[targetid][pReportMute] = 0;
			format(string, sizeof(string), "You have been unmuted from making reports by %s.", GetPlayerNameEx(playerid));
			SendClientMessageEx(targetid, COLOR_WHITE, string);
			format(string, sizeof(string), "You have unmuted %s from making reports.", GetPlayerNameEx(targetid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		return 1;
   	}
   	else
   	{
       	return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	}
}

CMD:ip(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_THREE))
    {
        new targetid, string[128];
        if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /ip <playerid>");
        else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
        else if(PlayerInfo[targetid][pAdminLevel] > PlayerInfo[playerid][pAdminLevel]) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on higher level administrators.");
        format(string, sizeof(string), "(ID: %d) %s - IP Address: %s", targetid, GetPlayerNameEx(targetid), GetPlayerIpAddress(targetid));
        SendClientMessageEx(playerid, COLOR_WHITE, string);
    }
    return 1;
}

CMD:ban(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
	    new targetid, string[128], reason[64], days;
		if(sscanf(params, "uis[64]", targetid, days, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /ban [playerid] [days] [reason]");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(GetPVarInt(targetid, "gPlayerLogged") == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(PlayerInfo[targetid][pAdminLevel] > PlayerInfo[playerid][pAdminLevel]) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot ban administrators that are higher rank than you.");
		format(string, sizeof(string), "AdmCmd: %s was banned from the server by %s for %d days, reason: %s", GetPlayerNameEx(targetid), GetPlayerNameEx(playerid), days, reason);
		AdminAlert(string, ALERT_GLOBAL);
		format(reason, sizeof(reason), "%s (%d days)", reason, days);
		LogEx(targetid, LOG_TYPE_BAN, playerid, reason);
		new banLength = gettime();
  		banLength += days * 86400;
		BanPlayerEx(targetid, reason, BAN_TEMPORARY, banLength);
		return 1;
   	}
   	else
   	{
       	SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	}
	return 1;
}

CMD:permaban(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_THREE))
    {
	    new targetid, string[128], reason[64];
		if(sscanf(params, "us[64]", targetid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /permaban [playerid] [reason]");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(GetPVarInt(targetid, "gPlayerLogged") == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(PlayerInfo[targetid][pAdminLevel] > PlayerInfo[playerid][pAdminLevel]) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot ban administrators that are higher rank than you.");
		format(string, sizeof(string), "AdmCmd: %s was permanently banned from the server by %s, reason: %s", GetPlayerNameEx(targetid), GetPlayerNameEx(playerid), reason);
		AdminAlert(string, ALERT_GLOBAL);
		LogEx(targetid, LOG_TYPE_PERMABAN, playerid, reason);
		BanPlayerEx(targetid, reason, BAN_PERMANENT, 0);
		return 1;
   	}
   	else
   	{
       	SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	}
	return 1;
}

public MySQL_Unban_Player(name[], adminid)
{
	new szQuery[128], rowCount;
	cache_get_row_count(rowCount);
	if(rowCount > 0)
	{
	 	if(UnbanPlayerEx(name) == 1)
		{
			format(szQuery, sizeof(szQuery), "%s was unbanned from the server, any IP addresses assosiciated with that account has been unbanned as well.", name);
			SendClientMessageEx(adminid, COLOR_WHITE, szQuery);
		}
		else
		{
			format(szQuery, sizeof(szQuery), "There was an issue with unbanning %s.", name);
			SendClientMessageEx(adminid, COLOR_WHITE, szQuery);
		}
	}
	else
	{
		SendClientMessageEx(adminid, COLOR_WHITE, "The specified player could not be found in the ban database, please check the name for any typos.");
		SendClientMessageEx(adminid, COLOR_WHITE, "Accounts are case-sensitive and please make sure that the usernames contain the underscore (_).");
	}
	return 1;
}


CMD:unban(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_FOUR))
    {
	    new pName[24], szQuery[128];
		if(sscanf(params, "s[24]", pName)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /unban [playername]");
		format(szQuery, sizeof(szQuery), "SELECT * FROM `bans` WHERE `Username` = '%s'", pName);
		mysql_tquery(mConnectionHandle, szQuery, "MySQL_Unban_Player", "sii", pName, playerid);
   	}
   	else
   	{
       	SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	}
	return 1;
}


public MySQL_Suspend_Player(name[], adminid)
{
	new szQuery[128], rowCount;
	cache_get_row_count(rowCount);
	if(rowCount > 0)
	{
		format(szQuery, sizeof(szQuery), "UPDATE `accounts` SET `AdminLevel` = '0' WHERE `Username` = '%s'", name);
		mysql_tqueryof(szQuery, THREAD_LOG_RESULT, INVALID_PLAYER_ID, mConnectionHandle);
		format(szQuery, sizeof(szQuery), "%s has been suspended from their administrative position and the account has been deactivated.", name);
		SendClientMessageEx(adminid, COLOR_WHITE, szQuery);
	}
	else
	{
		SendClientMessageEx(adminid, COLOR_WHITE, "The specified player could not be found in the ban database, please check the name for any typos.");
		SendClientMessageEx(adminid, COLOR_WHITE, "Accounts are case-sensitive and please make sure that the usernames contain the underscore (_).");
	}
	return 1;
}

CMD:suspend(playerid, params[])
{
	new pName[24], szQuery[128];
	if(!IsAdmin(playerid, ADMIN_LEVEL_SIX)) return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	if(sscanf(params, "s[24]", pName)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /suspend [playername]");
	new targetid = GetPlayerID(pName);

	if(targetid != INVALID_PLAYER_ID)
	{
	    format(szQuery, sizeof(szQuery), "You have suspended %s from their administrative position.", GetPlayerNameEx(targetid));
	    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szQuery);
   	    format(szQuery, sizeof(szQuery), "You have been suspended from your administrative position by %s.", GetPlayerNameEx(playerid));
   	    SendClientMessageEx(targetid, COLOR_LIGHTBLUE, szQuery);
   	   	format(szQuery, sizeof(szQuery), "%s has suspended %s from their administrative position.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
	   	Log("logs/setadmin.log", szQuery);
		PlayerInfo[targetid][pAdminLevel] = 0;
		return KickEx(targetid);
	}
	else
	{
		format(szQuery, sizeof(szQuery), "SELECT * FROM `accounts` WHERE `Username` = '%s'", pName);
		mysql_tquery(mConnectionHandle, szQuery, "MySQL_Suspend_Player", "sii", pName, playerid);
	}
	return 1;
}

public MySQL_Unban_Ip(ip[], adminid)
{
	new szQuery[128];
	if(cache_affected_rows() > 0)
	{
		format(szQuery, sizeof(szQuery), "IP Address %s has been found and removed off the ban list.", ip);
		SendClientMessageEx(adminid, COLOR_WHITE, szQuery);
	}
	else
	{
		SendClientMessageEx(adminid, COLOR_WHITE, "The specified IP Address could not be found in the ban database, please confirm that the IP Address is banned.");
	}
	return 1;
}

CMD:unbanip(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_FOUR))
    {
	    new IpAddress[16], szQuery[128];
		if(sscanf(params, "s[16]", IpAddress)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /unbanip [ipaddress]");
		format(szQuery, sizeof(szQuery), "DELETE FROM `bans` WHERE `IP_Address` = '%e'", IpAddress);
		mysql_tquery(mConnectionHandle, szQuery, "MySQL_Unban_Ip", "sii", IpAddress, playerid);
   	}
   	else
   	{
       	SendClientMessageEx(playerid, COLOR_GREY, "You need to be a level global administrator or higher to use this command.");
	}
	return 1;
}

public MySQL_Offline_Ban(name[], reason[], days, adminid)
{
	new
	    szString[256],
	    szIpAddress[17],
		rowCount;
	cache_get_row_count(rowCount);
	if(rowCount > 0)
	{
		cache_get_value_name(0, "IpAddress", szIpAddress,16);
		cache_get_value_name(0, "Banned", szString);
	    if(strval(szString) == 1) return SendClientMessageEx(adminid, COLOR_GREY, "The specified player is already banned from the server.");

		format(szString, sizeof(szString), "%s has placed an offline ban on %s for %d days, reason: %s.", GetPlayerNameEx(adminid), name, days, reason);
		Log("logs/ban.log", szString);

		format(szString, sizeof(szString), "UPDATE `accounts` SET `Banned` = '1' WHERE `Username` = '%s'", name);
		mysql_tqueryof(szString, THREAD_NO_RESULT, adminid, mConnectionHandle);
		if(days == -1)
		{
			format(szString, sizeof(szString), "INSERT INTO `bans` (`IP_Address`,`Username`,`Expiry_Date`,`Reason`,`Ban_Type`) \
			VALUES ('%s','%s','0','%s','1')", szIpAddress, name, reason);
		}
		else
		{
		    new unbanstamp = gettime();
			unbanstamp += days * 86400;
			format(szString, sizeof(szString), "INSERT INTO `bans` (`IP_Address`,`Username`,`Expiry_Date`,`Reason`,`Ban_Type`) \
			VALUES ('%s','%s','%d','%s','0')", szIpAddress, name, unbanstamp, reason);
		}
		mysql_tqueryof(szString, THREAD_LOG_RESULT, INVALID_PLAYER_ID, mConnectionHandle);
		
		if(days == -1)
		{
			format(szString, sizeof(szString), "You have successfully banned %s (IP: %s) permanently, reason: %s", name, szIpAddress, reason);
			SendClientMessageEx(adminid, COLOR_WHITE, szString);
			SQLLog(name, "Permanent Ban", PlayerInfo[adminid][pUsername], reason);
		}
		else
		{
			format(szString, sizeof(szString), "You have successfully banned %s (IP: %s) for %d days, reason: %s", name, szIpAddress, days, reason);
			SendClientMessageEx(adminid, COLOR_WHITE, szString);
			format(reason, 64, "%s (%d days)", reason, days);
			SQLLog(name, "Ban", PlayerInfo[adminid][pUsername], reason);
		}
	}
	else
	{
		SendClientMessageEx(adminid, COLOR_WHITE, "The specified account could not be found in the ban database, please confirm that the username is correct.");
	}
	return 1;
}

CMD:oban(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
	    new pName[24], days, reason[64], szQuery[128];
		if(sscanf(params, "s[24]is[64]", pName, days, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /oban [playername] [days] <-1 = permanent> [reason]");
		format(szQuery, sizeof(szQuery), "SELECT * FROM `accounts` WHERE `Username` = '%s'", pName);
		mysql_tquery(mConnectionHandle, szQuery, "MySQL_Offline_Ban", "ssiii", pName, reason, days, playerid);

   	}
   	else
   	{
       	SendClientMessageEx(playerid, COLOR_GREY, "You need to be an admin to use this command.");
	}
	return 1;
}

CMD:report(playerid, params[])
{
 	new string[128];
	if(sscanf(params, "{s[128]}", string)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /report [text]");
	else if(gettime() - rTimeLeft[playerid] < 0)
	{
		format(string, sizeof(string), "Please wait %i seconds before creating a report.", rTimeLeft[playerid] - gettime());
    	return SendClientMessageEx(playerid, COLOR_GREY, string);
   	}
  	else if(PlayerInfo[playerid][pReportMute] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "You are muted from creating reports.");
   	else if(GetPVarString(playerid, "Report", string, sizeof(string)) > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You already have an existing report, type /cancel report to cancel it.");
 	SetPVarString(playerid, "Report", params);
	format(string, sizeof(string), "{FFFF00}Report from [%i] %s: %s", playerid, GetPlayerNameEx(playerid), params);
 	AdminAlert(string, ALERT_ADMINS);
 	SendClientMessageEx(playerid, COLOR_YELLOW, "Your report message has been sent to online administrators.");
 	rTimeLeft[playerid] = gettime() + 30;
	return 1;
}

CMD:reports(playerid, params[])
{
	new string[128], reportCount;
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "-------------------------------------------------------------------------------------------------------------------------------");
		foreach(Player, i)
		{
			if(GetPVarString(i, "Report", string, 128) > 0)
			{
			    if(GetPVarInt(i, "SpeakingAdmin") == 0) {
					format(string, sizeof(string), "%s (ID: %d) | Report: %s", GetPlayerNameEx(i), i, string);
			    } else {
					format(string, sizeof(string), "%s (ID: %d) | Report: %s | Reviewer: %s", GetPlayerNameEx(i), i, string, GetPlayerNameEx(GetPVarInt(i, "SpeakingAdmin") - 1));
			    }
				SendClientMessageEx(playerid, COLOR_YELLOW, string);
				reportCount++;
			}
		}
		if(reportCount == 0)
		{
			SendClientMessageEx(playerid, COLOR_YELLOW, "There are no reports available at the moment.");
		}
		else
		{
			format(string, sizeof(string), "Active Reports: %d", reportCount);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
		}
		SendClientMessageEx(playerid, COLOR_WHITE, "-------------------------------------------------------------------------------------------------------------------------------");
	}
	return 1;
}

CMD:ar(playerid, params[])
{
    new string[128], targetid;
    if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /ar [playerid]");
    else if(GetPVarInt(playerid, "SpeakingPlayer") > 0 && GetPVarInt(GetPVarInt(playerid, "SpeakingPlayer") - 1, "SpeakingAdmin") - 1 == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "You already have an existing reporting, type /cr to complete it.");
	else if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
		if(GetPVarString(targetid, "Report", string, 128))
		{
			format(string, sizeof(string), "AdmCmd: %s has accepted the report from %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
	 		SCMToAdmins(string);
			format(string, sizeof(string), "%s has accepted your report and is now reviewing it, you may use /pm to speak with the administrator.", GetPlayerNameEx(playerid));
			SendClientMessageEx(targetid, COLOR_WHITE, string);
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Note: Please use /cr after completing the current report.");
			SetPVarInt(targetid, "SpeakingAdmin", playerid + 1);
			SetPVarInt(playerid, "SpeakingPlayer", targetid + 1);
		}
	}
	return 1;
}

CMD:cr(playerid, params[])
{
    new string[128], targetid = GetPVarInt(playerid, "SpeakingPlayer") - 1;
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
		if(GetPVarInt(playerid, "SpeakingPlayer") > 0)
		{
		    PlayerInfo[playerid][pReports]++;
			format(string, sizeof(string), "AdmCmd: %s has completed the report from %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
	 		SCMToAdmins(string);
			DeleteReport(targetid);
		}
	}
	return 1;
}

CMD:tr(playerid, params[])
{
    new
		string[128],
		targetid,
		reason[32];
    if(sscanf(params, "us[32]", targetid, reason)) return SendClientMessageEx(playerid, COLOR_WHITE, "USAGE: /tr [playerid] [reason]");
	else if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
		if(GetPVarString(targetid, "Report", string, 128) > 0)
		{
		    PlayerInfo[playerid][pReports]++;
			format(string, sizeof(string), "AdmCmd: %s has trashed the report from (ID: %d) %s, reason: %s.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid), reason);
	 		SCMToAdmins(string);
			format(string, sizeof(string), "%s has trashed your report, reason: %s.", GetPlayerNameEx(playerid), reason);
			SendClientMessageEx(targetid, COLOR_WHITE, string);
			DeleteReport(targetid);
		}
	}
	return 1;
}

DeleteReport(playerid)
{
	DeletePVar(playerid, "Report");
	if(GetPVarInt(playerid, "SpeakingAdmin") > 0)
	{
	    DeletePVar(GetPVarInt(playerid, "SpeakingAdmin") - 1, "SpeakingPlayer");
	    DeletePVar(playerid, "SpeakingAdmin");
	}
}

CMD:jail(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_ONE))
    {
	    new targetid, minutes, reason[64], string[128];
		if(sscanf(params, "uis[64]", targetid, minutes, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /jail [playerid] [miutes] [reason]");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(PlayerInfo[targetid][pAdminLevel] > PlayerInfo[playerid][pAdminLevel]) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot jail an administrator higher than your rank.");
		else if(targetid == playerid && !IsAdmin(playerid, ADMIN_LEVEL_TWO)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
		else if(IsPlayerRestricted(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot jail a player that is in the hospital.");

		format(string, sizeof(string), "AdmCmd: %s was jailed by %s, reason: %s", GetPlayerNameEx(targetid), GetPlayerNameEx(playerid), reason);
		AdminAlert(string, ALERT_GLOBAL);
		format(string, sizeof(string), "You were jailed by %s for %d minutes, reason: %s.", GetPlayerNameEx(targetid), minutes, reason);
		SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);

		format(reason, sizeof(reason), "%s (%d minutes)", reason, minutes);
		LogEx(targetid, LOG_TYPE_JAIL, playerid, reason);

		PlayerInfo[targetid][pJailTime] = minutes*60;
		PlayerInfo[targetid][pOocJail] = 1;
		new jailPos = random(3) + 3;
		SetPlayerPosEx(targetid, JailPositions[jailPos][0], JailPositions[jailPos][1], JailPositions[jailPos][2]);
		SetPlayerFacingAngle(targetid, 180.0);
		SetPlayerInteriorEx(targetid, 1);
		SetPlayerVirtualWorldEx(targetid, 777);
		SetPlayerSkin(targetid, 50);

		ResetPlayerWeapons(targetid);
		PlayerTextDrawShow(targetid, JailTimerTD[targetid]);
		for(new i=0; i < 12; i++) PlayerInfo[targetid][pWeapons][i] = 0;

		SetPlayerToTeamColor(targetid);
		TogglePlayerControllable(targetid, false);
		SetPVarInt(targetid, "ActionRestriction", 1);
		TextDrawShowForPlayer(targetid, LoadingObjectTextDraw);
		TextDrawShowForPlayer(targetid, LoadingObjectBox);
		SetTimerEx("HideLoadingTextdraws", 4000, false, "i", targetid);
		return 1;
   	}
   	else
   	{
       	return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	}
}


CMD:prisoners(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
        new
            string[128];
    	SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------------------");
    	SendClientMessageEx(playerid, COLOR_WHITE, "People who are currently in jail:");
		foreach(new i: Player)
 		{
 		    if(PlayerInfo[i][pJailTime] > 0)
 		    {
	 		    format(string, sizeof(string), "(ID: %d) %s [%s] - %d seconds remaining.", i, GetPlayerNameEx(i), PlayerInfo[i][pOocJail] == 1 ? ("OOC") : ("IC"), PlayerInfo[i][pJailTime]);
	 		    SendClientMessageEx(playerid, COLOR_WHITE, string);
 		    }
		}
    	SendClientMessageEx(playerid, COLOR_GREY, "-----------------------------------------");
    }
    return 1;
}

CMD:release(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
	    new targetid, reason[64], string[128];
		if(sscanf(params, "us[64]", targetid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /release [playerid] [reason]");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(PlayerInfo[targetid][pJailTime] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "The player specified is not in jail.");
		
		format(string, sizeof(string), "AdmCmd: %s was released from jail by %s, reason: %s", GetPlayerNameEx(targetid), GetPlayerNameEx(playerid), reason);
		AdminAlert(string, ALERT_GLOBAL);

		format(reason, sizeof(reason), "%s (release)", reason);
		LogEx(targetid, LOG_TYPE_JAIL, playerid, reason);
		
		PlayerTextDrawHide(targetid, JailTimerTD[targetid]);
		PlayerInfo[targetid][pJailTime] = 0;
		PlayerInfo[targetid][pOocJail] = 0;
		SetPlayerPosEx(targetid, 1692.3413,1451.1672,10.7649);
		SetPlayerInteriorEx(targetid, 0);
		SetPlayerVirtualWorldEx(targetid, 0);
		SetPlayerToTeamColor(targetid);
		ClearAnimations(targetid);
		SetPlayerSkin(targetid, PlayerInfo[targetid][pSkin]);
   	}
   	else SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	return 1;
}

CMD:query(playerid, params[])
{
	if(IsPlayerAdmin(playerid))
    {
        if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /query <mysql query>");
		mysql_tqueryof(params, THREAD_LOG_RESULT, playerid, mConnectionHandle);
		SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully sent the query to the server.");
    }
    return 1;
 }

CMD:setvip(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
    {
        new targetid, level, string[128];
		if(sscanf(params, "ui", targetid, level)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /setvip [playerid] [0-1]");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(level < 0 || level > 1) return SendClientMessageEx(playerid, COLOR_GREY, "You have enter an invalid VIP level.");
		PlayerInfo[targetid][pVIP] = level;
		format(string, sizeof(string), "* You have been made a level %d VIP by %s.", level, GetPlayerNameEx(playerid));
		SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "You have made %s a level %d VIP.", GetPlayerNameEx(targetid), level);
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	   	format(string, sizeof(string), "%s has set %s's VIP level to %d.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), level);
	   	Log("logs/vip.log", string);
   	}
   	else return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	return 1;
}

CMD:setadminname(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_FIVE) || IsPlayerAdmin(playerid))
    {
        new targetid, name[MAX_PLAYER_NAME], string[128];
		if(sscanf(params, "us", targetid, name)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /setadminname [playerid] [admin name]");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		format(PlayerInfo[targetid][pAdminName], MAX_PLAYER_NAME, name);
		format(string, sizeof(string), "* Your admin name was set to %s by %s.", name, GetPlayerNameEx(playerid));
		SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "You have set %s's admin name to %s.", GetPlayerNameEx(targetid), name);
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	   	format(string, sizeof(string), "%s has set %s's admin name to %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), name);
	   	Log("logs/setadminname.log", string);
   	}
   	else return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	return 1;
}

CMD:setadmin(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_FIVE) || IsPlayerAdmin(playerid))
    {
        new targetid, level, string[128];
		if(sscanf(params, "ui", targetid, level)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /setadmin [playerid] [0-5]");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		if(IsAdmin(playerid, ADMIN_LEVEL_SIX) || IsPlayerAdmin(playerid))
		{
			if(level < 0 || level > 6) return SendClientMessageEx(playerid, COLOR_GREY, "You have enter an invalid administrator level.");
			PlayerInfo[targetid][pAdminLevel] = level;
			format(string, sizeof(string), "* You have been made a %s by %s.", GetAdminRank(targetid), GetPlayerNameEx(playerid));
			SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "You have made %s a %s.", GetPlayerNameEx(targetid), GetAdminRank(targetid));
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		}
		else if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
		{
			if(level < 0 || level > 4) return SendClientMessageEx(playerid, COLOR_GREY, "You have enter an invalid administrator level.");
			PlayerInfo[targetid][pAdminLevel] = level;
			format(string, sizeof(string), "* You have been made a %s by %s.", GetAdminRank(targetid), GetPlayerNameEx(playerid));
			SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "You have made %s a %s.", GetPlayerNameEx(targetid), GetAdminRank(targetid));
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		}
	   	format(string, sizeof(string), "%s has made %s a %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), GetAdminRank(targetid));
	   	Log("logs/setadmin.log", string);
   	}
   	else return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	return 1;
}

CMD:slap(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
        new targetid, string[128], Float:Position[3];
		if(sscanf(params, "u", targetid)) {
	 		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /slap [playerid]");
		}
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");

		format(string, sizeof(string), "AdmCmd: %s has slapped (ID: %i) %s.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid));
		AdminAlert(string, ALERT_ADMINS);

		GetPlayerPos(targetid, Position[0], Position[1], Position[2]);
    	SetPlayerPosEx(targetid, Position[0], Position[1], Position[2] + 10);
   	}
   	else
   	{
       	return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	}
	return 1;
}

CMD:servername(playerid, params[])
{
	if(!IsAdmin(playerid, ADMIN_LEVEL_SIX)) return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	new string[128], name[64];
	if(sscanf(params, "s[64]", name)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /servername [name]");
    format(string, sizeof(string), "hostname %s", name);
	SendRconCommand(string);
	format(string, sizeof(string), "AdmCmd: %s has set the server name to %s.", GetPlayerNameEx(playerid), name);
	AdminAlert(string, ALERT_ADMINS);
	return 1;
}

CMD:sethp(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_FOUR))
    {
        new targetid, amount, string[128];
		if(sscanf(params, "ui", targetid, amount)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /sethp <playerid> <amount>");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");

		format(string, sizeof(string), "AdmCmd: %s has modified (ID: %i) %s health.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid));
		AdminAlert(string, ALERT_ADMINS);

		SetPlayerHealthEx(targetid, amount);
   	}
   	else SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	return 1;
}


CMD:setskin(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_THREE))
    {
        new targetid, skinid, string[128];
		if(sscanf(params, "ui", targetid, skinid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /setskin [playerid] [skin]");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(skinid < 0 || skinid > 299) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid skin id.");

		format(string, sizeof(string), "AdmCmd: %s has set (ID: %i) %s's skin to %i.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid), skinid);
		AdminAlert(string, ALERT_ADMINS);

		SetPlayerSkinEx(targetid, skinid);
   	}
   	else
   	{
       	return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	}
	return 1;
}

CMD:setarmor(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_FOUR))
    {
        new targetid, amount, string[128], Float:armour;
		if(sscanf(params, "ui", targetid, amount)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /setarmor [playerid] [amount]");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(amount < 0 || amount > 100) return SendClientMessageEx(playerid, COLOR_GREY, "Please enter a valid amount between 0-100.");
		GetPlayerArmour(targetid, armour);
		format(string, sizeof(string), "AdmCmd: %s has modified (ID: %i) %s's armour from %d to %d.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid), floatround(armour, floatround_ceil), amount);
		AdminAlert(string, ALERT_ADMINS);
		SetPlayerArmourEx(targetid, amount);
   	}
   	else return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	return 1;
}

CMD:freeze(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
		if(sscanf(params, "{u}")) {
	 		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /freeze [playerid]");
		}
		else if(!IsPlayerConnectedEx(strval(params))) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");

		new string[128];
		format(string, sizeof(string), "AdmCmd: %s has frozen (ID: %i) %s.", GetPlayerNameEx(playerid), strval(params), GetPlayerNameEx(strval(params)));
		AdminAlert(string, ALERT_ADMINS);

		TogglePlayerControllable(strval(params), false);
		SetPVarInt(strval(params), "ActionRestriction", 1);
   	}
   	else
   	{
       	return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	}
	return 1;
}

CMD:unfreeze(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
		if(sscanf(params, "{u}")) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /unfreeze [playerid]");
		else if(!IsPlayerConnectedEx(strval(params))) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(GetPVarInt(strval(params), "IsCuffed") == 1) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player is currently cuffed, please use the /uncuff command.");
		new string[128];
		format(string, sizeof(string), "AdmCmd: %s has unfrozen (ID: %i) %s.", GetPlayerNameEx(playerid), strval(params), GetPlayerNameEx(strval(params)));
		AdminAlert(string, ALERT_ADMINS);
		SetPlayerSkin(strval(params), PlayerInfo[strval(params)][pSkin]);
		TogglePlayerControllable(strval(params), true);
		ClearAnimations(strval(params), 1);
		DeletePVar(strval(params), "ActionRestriction");
   	}
   	else
   	{
       	return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	}
	return 1;
}

CMD:setvw(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
        new targetid, world, string[128];
		if(sscanf(params, "ui", targetid, world)) {
	 		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /setvw [playerid] [world]");
		}
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");

		format(string, sizeof(string), "AdmCmd: %s has set (ID: %i) %s's virtual world to %d.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid), world);
		AdminAlert(string, ALERT_ADMINS);
		SetPlayerVirtualWorldEx(targetid, world);
		format(string, sizeof(string), "Your virtual world was set to %d by %s.", world, GetPlayerNameEx(playerid));
		SendClientMessageEx(targetid, COLOR_WHITE, string);
   	}
   	else
   	{
       	return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	}
	return 1;
}

CMD:gethere(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
        new targetid, string[128], Float:Position[3];
		if(sscanf(params, "u", targetid)) {
	 		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /gethere [playerid]");
		}
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(targetid == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");

		if(IsPlayerInAnyVehicle(targetid)) {
		    RemovePlayerFromVehicleEx(targetid);
		    ClearAnimations(targetid);
		}

		format(string, sizeof(string), "AdmCmd: %s brought (ID: %i) %s to their location.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid));
		AdminAlert(string, ALERT_ADMINS);

		GetPlayerPos(playerid, Position[0], Position[1], Position[2]);
		SetPlayerInteriorEx(targetid, GetPlayerInterior(playerid));
		SetPlayerVirtualWorldEx(targetid, GetPlayerVirtualWorld(playerid));
		SetPlayerPosEx(targetid, Position[0], Position[1], Position[2]);
		SendClientMessageEx(targetid, COLOR_FADE1, "You have been teleported.");
   	}
   	else
   	{
       	return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	}
	return 1;
}

CMD:revive(playerid,params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
    	new targetid, string[128];
    	if(sscanf(params,"u",targetid)) return SendClientMessageEx(playerid,COLOR_GREY,"Usage: /revive <playerid>");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(PlayerInfo[targetid][pWounded] == PLAYER_ALIVE) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player does not need reviving.");
    	DeleteHospitalVars(targetid);
		PlayerInfo[targetid][pWounded] = PLAYER_ALIVE;
		SetPlayerHealthEx(targetid, 100);
		ClearAnimations(targetid);
		SendClientMessageEx(targetid, COLOR_FADE1, "You were revived by an administrator.");
		format(string, sizeof(string), "AdmCmd: %s revived (ID: %i) %s.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid));
		AdminAlert(string, ALERT_ADMINS);
		SendClientMessageEx(targetid, COLOR_FADE1, "You have been revived by an administrator.");
	}
 	return 1;
}



stock SafeTeleport(playerid, Float:x, Float:y, Float:z)
{
	new vehid = GetPlayerVehicleID(playerid);
	if(IsPlayerInAnyVehicle(playerid))
	{
		SetVehiclePos(vehid,x,y,z);
		LinkVehicleToInterior(vehid, 0);
		SetVehicleVirtualWorld(vehid, 0);
	}
	else SetPlayerPosEx(playerid,x,y,z);
	SetPlayerInteriorEx(playerid,0);
	SetPlayerVirtualWorldEx(playerid, 0);
	SetCameraBehindPlayer(playerid);
}

CMD:gps(playerid, params[])
{
	new string[128];
	if(isnull(params))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /gps [location]");
		SendClientMessageEx(playerid, COLOR_GREY, "Locations: fish, dealership, taxi, trucker, miner, mechanic, pizza, smuggler");
		return 1;
	}
	else if(HasActiveCheckpoint(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You already have an existing checkpoint, type /killcheckpoint to delete it.");
	if(!strcmp(params,"fish",true))
	    SetPlayerCheckpoint(playerid, LOCATION_FISH, 5.0);
	else if(!strcmp(params,"dealership",true))
		 SetPlayerCheckpoint(playerid, LOCATION_DEALERSHIP, 5.0);
	else if(!strcmp(params,"taxi",true))
	    SetPlayerCheckpoint(playerid, LOCATION_TAXIJOB, 5.0);
	else if(!strcmp(params,"trucker",true))
	    SetPlayerCheckpoint(playerid, LOCATION_TRUCKERJOB, 5.0);
	else if(!strcmp(params,"miner",true))
	    SetPlayerCheckpoint(playerid, LOCATION_MINERJOB, 5.0);
	else if(!strcmp(params,"mechanic",true))
	    SetPlayerCheckpoint(playerid, LOCATION_MECHANICJOB, 5.0);
   	else if(!strcmp(params,"pizza",true))
	    SetPlayerCheckpoint(playerid, LOCATION_PIZZAJOB, 5.0);
    else if(!strcmp(params,"smuggler",true))
    {
        if(!IsAnIllegal(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be in an illegal faction to access the smuggler job.");
		SetPlayerCheckpoint(playerid, LOCATION_SMUGGLERJOB, 5.0);
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "You have specified an invalid gps location.");
	format(string, sizeof(string), "A checkpoint has been set to the specified location (%s).", params);
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	return 1;
}

CMD:goto(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
	    new string[128];
		if(isnull(params))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /goto [location]");
			SendClientMessageEx(playerid, COLOR_GREY, "Locations: ls, lv, demorgan, hospital, impound, arrest, mailbox, dealership");
			SendClientMessageEx(playerid, COLOR_GREY, "Locations: fish, taxi, trucker, miner, mechanic, pizza, smuggler");
			return 1;
		}

		if(!strcmp(params,"ls",true))
		    SafeTeleport(playerid, 1529.6,-1691.2,13.3);
		else if(!strcmp(params,"lv",true))
			SafeTeleport(playerid, 1692.3413, 1451.1672, 10.7649);
		else if(!strcmp(params,"demorgan",true))
		    SafeTeleport(playerid, 214.506, 1912.529, 17.640);
		else if(!strcmp(params,"hospital",true))
		    SafeTeleport(playerid, LOCATION_HOSPITAL );
		else if(!strcmp(params,"impound",true))
		    SafeTeleport(playerid, LOCATION_IMPOUND);
		else if(!strcmp(params,"arrest",true))
		    SafeTeleport(playerid, LOCATION_ARREST);
		else if(!strcmp(params,"mailbox",true))
		    SafeTeleport(playerid, LOCATION_MAILBOX);
		else if(!strcmp(params,"dealership",true))
		    SafeTeleport(playerid, LOCATION_DEALERSHIP);
		else if(!strcmp(params,"fish",true))
		    SafeTeleport(playerid, LOCATION_FISH);
		else if(!strcmp(params,"taxi",true))
		    SafeTeleport(playerid, LOCATION_TAXIJOB);
		else if(!strcmp(params,"trucker",true))
		    SafeTeleport(playerid, LOCATION_TRUCKERJOB);
		else if(!strcmp(params,"mechanic",true))
		    SafeTeleport(playerid, LOCATION_MECHANICJOB);
		else if(!strcmp(params,"miner",true))
		    SafeTeleport(playerid, LOCATION_MINERJOB);
       	else if(!strcmp(params,"pizza",true))
		    SafeTeleport(playerid, LOCATION_PIZZAJOB);
       	else if(!strcmp(params,"smuggler",true))
		    SafeTeleport(playerid, LOCATION_SMUGGLERJOB);
		    
		else return SendClientMessageEx(playerid, COLOR_GREY, "You have specified an invalid teleport params.");
		format(string, sizeof(string), "AdmCmd: %s has teleported to %s.", GetPlayerNameEx(playerid), params);
		AdminAlert(string, ALERT_ADMINS);
	}
	else SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	return 1;
}

CMD:sendto(playerid, params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
	    new string[128], targetid;
    	if(sscanf(params,"us[128]",targetid, string))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /sendto [targetid] [location]");
			SendClientMessageEx(playerid, COLOR_GREY, "Locations: ls, lv, demorgan, hospital, impound, arrest, mailbox, dealership");
			SendClientMessageEx(playerid, COLOR_GREY, "Locations: fish, taxi, trucker, miner, mechanic, pizza, smuggler");
			return 1;
		}
		if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Error: Invalid player specified.");

		if(!strcmp(string,"ls",true))
		    SafeTeleport(targetid, 1529.6,-1691.2,13.3);
		else if(!strcmp(string,"lv",true))
			SafeTeleport(targetid, 1692.3413, 1451.1672, 10.7649);
		else if(!strcmp(string,"demorgan",true))
		    SafeTeleport(targetid, 214.506, 1912.529, 17.640);
		else if(!strcmp(string,"hospital",true))
		    SafeTeleport(targetid, LOCATION_HOSPITAL );
		else if(!strcmp(string,"impound",true))
		    SafeTeleport(targetid, LOCATION_IMPOUND);
		else if(!strcmp(string,"arrest",true))
		    SafeTeleport(targetid, LOCATION_ARREST);
		else if(!strcmp(string,"mailbox",true))
		    SafeTeleport(targetid, LOCATION_MAILBOX);
		else if(!strcmp(string,"dealership",true))
		    SafeTeleport(targetid, LOCATION_DEALERSHIP);
		else if(!strcmp(string,"fish",true))
		    SafeTeleport(targetid, LOCATION_FISH);
		else if(!strcmp(string,"taxi",true))
		    SafeTeleport(targetid, LOCATION_TAXIJOB);
		else if(!strcmp(string,"trucker",true))
		    SafeTeleport(targetid, LOCATION_TRUCKERJOB);
		else if(!strcmp(string,"mechanic",true))
		    SafeTeleport(targetid, LOCATION_MECHANICJOB);
		else if(!strcmp(string,"miner",true))
		    SafeTeleport(targetid, LOCATION_MINERJOB);
       	else if(!strcmp(string,"pizza",true))
		    SafeTeleport(targetid, LOCATION_PIZZAJOB);
       	else if(!strcmp(string,"smuggler",true))
		    SafeTeleport(targetid, LOCATION_SMUGGLERJOB);
		    
		else return SendClientMessageEx(playerid, COLOR_GREY, "You have specified an invalid teleport params.");
		SendClientMessageEx(targetid, COLOR_WHITE, "You have been teleported by an administrator.");
		format(string, sizeof(string), "AdmCmd: %s has teleported %s to %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), params);
		AdminAlert(string, ALERT_ADMINS);
	}
	else SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	return 1;
}



CMD:gotoco(playerid,params[])
{
    if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
    	new Float:x,Float:y,Float:z,i;
    	if(sscanf(params,"fffi",x,y,z,i))
		{
			return SendClientMessageEx(playerid,COLOR_GREY,"Usage: /gotoco [xcoord] [ycoord] [zcoord] [interior]");
		}
        SafeTeleport(playerid,x,y,z);
		SetPlayerInteriorEx(playerid, i);
	}
 	return 1;
}

CMD:gotoid(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
        new targetid, string[128], Float:Position[3];
		if(sscanf(params, "u", targetid)) {
	 		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /gotoid [playerid]");
		}
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(targetid == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");

		format(string, sizeof(string), "AdmCmd: %s teleported to (ID: %i) %s.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid));
		AdminAlert(string, ALERT_ADMINS);

		GetPlayerPos(targetid, Position[0], Position[1], Position[2]);
		SetPlayerInteriorEx(playerid, GetPlayerInterior(targetid));
		SetPlayerVirtualWorldEx(playerid, GetPlayerVirtualWorld(targetid));
		SetPlayerPosEx(playerid, Position[0] + 1, Position[1], Position[2]);
   	}
   	else
   	{
       	return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	}
	return 1;
}

CMD:gotov(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
        new
			targetid,
			string[128],
			Float:Position[4];
		if(sscanf(params, "u", targetid)) {
	 		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /gotov <playerid>");
		}
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(targetid == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
		else if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be inside a vehicle to use this command.");

		format(string, sizeof(string), "AdmCmd: %s teleported to (ID: %i) %s.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid));
		AdminAlert(string, ALERT_ADMINS);

		new veh = GetPlayerVehicleID(playerid);
		GetPlayerPos(targetid, Position[0], Position[1], Position[2]);
		GetPlayerFacingAngle(targetid, Position[3]);
		SetPlayerInteriorEx(playerid, GetPlayerInterior(targetid));
		SetVehicleVirtualWorld(veh, GetPlayerVirtualWorld(targetid));
		SetVehiclePos(veh, Position[0], Position[1], Position[2]);
		SetVehicleZAngle(veh, Position[3]);
		PutPlayerInVehicle(playerid, veh, 0);
   	}
   	else
   	{
       	return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	}
	return 1;
}

CMD:setstat(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_SIX))
    {
        new targetid, value, option[16], string[256];
		if(sscanf(params, "us[16]i", targetid, option, value)) {
	 		SendClientMessageEx(playerid, COLOR_GREY, "Usage: /setstat [playerid] [stat] [value]");
			SendClientMessageEx(playerid, COLOR_GREY, "---------------------------------------------------");
			SendClientMessageEx(playerid, COLOR_GREY, "Available Options:");
			SendClientMessageEx(playerid, COLOR_GREY, "Level: <1 - 50>");
			SendClientMessageEx(playerid, COLOR_GREY, "Age: <18 - 80>");
			SendClientMessageEx(playerid, COLOR_GREY, "Phone: <number>");
			SendClientMessageEx(playerid, COLOR_GREY, "Gender: <1 (Male) or 2 (Female)>");
			SendClientMessageEx(playerid, COLOR_GREY, "Hits (Completed): 0 minimum value");
			SendClientMessageEx(playerid, COLOR_GREY, "---------------------------------------------------");
	 		return 1;
		}
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(GetPVarInt(targetid, "gPlayerLogged") == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");

		if(!strcmp(option, "level", true))
		{
		    if(value < 1 || value > 50) return SendClientMessageEx(playerid, COLOR_GREY, "The value cannot be less then 1 or more than 50.");
		    PlayerInfo[targetid][pLevel] = value;
		    SetPlayerScore(targetid, PlayerInfo[targetid][pLevel]);
			format(string, sizeof(string), "Your level was set to %i by %s.", value, GetPlayerNameEx(playerid));
			SendClientMessageEx(targetid, COLOR_YELLOW, string);
			format(string, sizeof(string), "AdmCmd: %s has set (ID: %i) %s's level to %i.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid), value);
		}
		else if(!strcmp(option, "age", true))
		{
		    if(value < 18 || value > 80) return SendClientMessageEx(playerid, COLOR_GREY, "The value cannot be less then 18 or more than 80.");
		    PlayerInfo[targetid][pAge] = value;
			format(string, sizeof(string), "Your age was set to %i by %s.", value, GetPlayerNameEx(playerid));
			SendClientMessageEx(targetid, COLOR_YELLOW, string);
			format(string, sizeof(string), "AdmCmd: %s has set (ID: %i) %s's age to %i.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid), value);
		}
		else if(!strcmp(option, "phone", true) && value != 0)
		{
		    if(!IsNumberAvailable(value)) return SendClientMessageEx(playerid, COLOR_GREY, "The specified number is not available.");
   			if(PlayerInfo[targetid][pPhoneNumber] != 0) {
				format(string, sizeof(string), "SELECT * FROM `accounts` WHERE `PhoneNumber` = '%d'", PlayerInfo[targetid][pPhoneNumber]);
				mysql_tquery(mConnectionHandle, string, "MySQL_Delete_Number", "iii", PlayerInfo[targetid][pPhoneNumber], targetid);
				DeletePhoneNumber(PlayerInfo[targetid][pPhoneNumber]);
			}
		    AddPhoneNumber(value);
		    PlayerInfo[targetid][pPhoneNumber] = value;
			format(string, sizeof(string), "AdmCmd: %s has set (ID: %i) %s's phone number to %i.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid), value);
		}
		else if(!strcmp(option, "gender", true))
		{
		    if(value < 1 || value > 2) return SendClientMessageEx(playerid, COLOR_GREY, "The value cannot be less then 1 or more than 2.");
		    PlayerInfo[targetid][pGender] = value;
			format(string, sizeof(string), "Your gender was set to %s by %s.", GetPlayerGender(value), GetPlayerNameEx(playerid));
			SendClientMessageEx(targetid, COLOR_YELLOW, string);
			format(string, sizeof(string), "AdmCmd: %s has set (ID: %i) %s's gender to %s.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid), GetPlayerGender(value));
		}
		else if(!strcmp(option, "hits", true))
		{
		    if(value < 0) return SendClientMessageEx(playerid, COLOR_GREY, "The value cannot be less then 0.");
		    PlayerInfo[targetid][pCompletedHits] = value;
			format(string, sizeof(string), "Your completed hits was set to %d by %s.", PlayerInfo[targetid][pCompletedHits], GetPlayerNameEx(playerid));
			SendClientMessageEx(targetid, COLOR_YELLOW, string);
			format(string, sizeof(string), "AdmCmd: %s has set (ID: %i) %s's hits to %d.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid), PlayerInfo[targetid][pCompletedHits]);
		}
		else
		{
			return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid option.");
		}
		AdminAlert(string, ALERT_ADMINS);
   	}
   	else
   	{
       	return SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	}
	return 1;
}

public MySQL_Player_Referral(playerid, referer[])
{
	new string[128], rowCount;
	cache_get_row_count(rowCount);
	if(rowCount > 0)
	{
		for(new i = 0; i < 20; i++)
		{
		    SendClientMessageEx(playerid, COLOR_WHITE, "");
		}

        foreach(new i: Player)
        {
            if(!strcmp(referer, PlayerInfo[i][pUsername], true))
            {
                format(string, sizeof(string), "You have referred %s to the server! To receive a reward for it, they must become at least level 3.", GetPlayerNameEx(playerid));
                SendClientMessageEx(i, COLOR_WHITE, string);
                break;
            }
        }
        format(PlayerInfo[playerid][pReferer], MAX_PLAYER_NAME, "%s", referer);
        format(string, sizeof(string), "Thank you for entering %s as your referral, you can now proceed to the spawn.", referer);
		SendClientMessageEx(playerid, COLOR_WHITE, string);

    	for(new i = 0; i < 20; i++) SendClientMessageEx(playerid, COLOR_WHITE, "");
    	SendClientMessageEx(playerid, COLOR_ORANGE, "---------------------------------------------------");
        SetDefaultRegisterStatistics(playerid);
		SendClientMessageEx(playerid, COLOR_ORANGE, "SERVER: Welcome to "SERVER_NAME".");
		SendClientMessageEx(playerid, COLOR_WHITE, "There are many things to do, ranging from applying to a faction to becoming the richest person in "SERVER_MAP".");
		SendClientMessageEx(playerid, COLOR_WHITE, "We believe here that everyone should play legitimately, including our staff members along with others.");
		SendClientMessageEx(playerid, COLOR_WHITE, "You can find out more information about our server on our site (/information), or ask on /newb(ie) for help.");
		SendClientMessageEx(playerid, COLOR_ORANGE, "---------------------------------------------------");
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "You have specified an invalid referral name, are you sure that you have entered the name correctly.");
		ShowPlayerDialogEx(playerid, DIALOG_REFERER, DIALOG_STYLE_INPUT, "{FFFFFF}Referral", "{FFFFFF}Were you referred by another player of IM:RP?\nIf so, please enter the player's name in the text field.", "Yes", "No");
	}
}

public MySQL_Delete_Number(number, playerid)
{
	new
	    szQuery[128],
		rowCount;
	cache_get_row_count(rowCount);
	if(rowCount > 0)
	{
        foreach(new i: Player)
        {
            if(PlayerInfo[i][pPhoneNumber] == number)
            {
                SendClientMessageEx(i, COLOR_WHITE, "Your phone number was deleted from the database, therefore your number has been set to 0.");
                PlayerInfo[i][pPhoneNumber] = 0;
            }
        }
		format(szQuery, sizeof(szQuery), "UPDATE `accounts` SET  `PhoneNumber` = '0' WHERE  `PhoneNumber` = %d", number);
		mysql_tqueryof(szQuery, THREAD_NO_RESULT, playerid, mConnectionHandle);
		DeletePhoneNumber(number);
	}
}

CMD:setweather(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_FOUR))
	{
	    new value, string[128];
	    if(sscanf(params, "i", value)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /setweather <value>");
	    else if(value == 0 || value > 20) return SendClientMessageEx(playerid, COLOR_GREY, "Please specify a number between 0 and 20.");
	    SetWeather(value);
		format(string, sizeof(string), "AdmCmd: %s has set the weather id to %d.", GetPlayerNameEx(playerid), value);
		AdminAlert(string, ALERT_ADMINS);
	}
	return 1;
}

CMD:deletenumber(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_FOUR))
	{
	    new
	        szQuery[128];
	    if(sscanf(params, "{i}"))
	    {
	        return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /deletenumber <number>");
	    }
	    else if(strval(params) == 0 || strlen(params) > 7) return SendClientMessageEx(playerid, COLOR_GREY, "You have specified an invalid number.");
		format(szQuery, sizeof(szQuery), "SELECT * FROM `accounts` WHERE `PhoneNumber` = '%d'", strval(params));
		mysql_tquery(mConnectionHandle, szQuery, "MySQL_Delete_Number", "iii", strval(params), playerid);
	}
	return 1;
}

CMD:givecash(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
    {
        new targetid, amount, string[128];
		if(sscanf(params, "ui", targetid, amount)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /givecash <playerid> <amount>");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		format(string, sizeof(string), "You have given %s $%i.", GetPlayerNameEx(targetid), amount);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		format(string, sizeof(string), "You were given $%i from %s.", amount, GetPlayerNameEx(playerid));
		SendClientMessageEx(targetid, COLOR_YELLOW, string);
		PlayerInfo[targetid][pMoney] += amount;
		format(string, sizeof(string), "AdmCmd: %s has issued (ID: %i) %s a refund of $%i.", GetPlayerNameEx(playerid), targetid, GetPlayerNameEx(targetid), amount);
		AdminAlert(string, ALERT_ADMINS);
   	}
   	else SendClientMessageEx(playerid, COLOR_GREY, "You authorized to use this command.");
	return 1;
}

CMD:fine(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_THREE))
    {
        new targetid, amount, string[128], reason[64];
		if(sscanf(params, "uis", targetid, amount, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /fine <playerid> <amount> <reason>");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		format(string, sizeof(string), "You have fined %s $%i for %s.", GetPlayerNameEx(targetid), amount, reason);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		format(string, sizeof(string), "You were fined $%i by %s for %s.", amount, GetPlayerNameEx(playerid), reason);
		SendClientMessageEx(targetid, COLOR_YELLOW, string);
		PlayerInfo[targetid][pMoney] -= amount;
		format(string, sizeof(string), "AdmCmd: %s has fined %s an amount of $%i, reason: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), amount, reason);
		AdminAlert(string, ALERT_GLOBAL);
   	}
   	else SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	return 1;
}

CMD:spectate(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
        new string[128], targetid;
		if(!strcmp("off", params, true) && SpectatingPlayer[playerid] != INVALID_PLAYER_ID)
		{
            SpectatingAdmin[SpectatingPlayer[playerid]] = INVALID_PLAYER_ID;
		    SpectatingPlayer[playerid] = INVALID_PLAYER_ID;
		    TogglePlayerSpectating(playerid, false);

			SetPlayerPosEx(playerid, GetPVarFloat(playerid, "SpecPosX"), GetPVarFloat(playerid, "SpecPosY"), GetPVarFloat(playerid, "SpecPosZ"));
			DeletePVar(playerid, "SpecPosX"); DeletePVar(playerid, "SpecPosY");	DeletePVar(playerid, "SpecPosZ");
		    return 1;
		}
        else if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /spectate <playerid>");
		else if(targetid == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(PlayerInfo[targetid][pTutorial] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player is engaged in the registration process.");
		if(SpectatingPlayer[playerid] != INVALID_PLAYER_ID)
		{
            SpectatingAdmin[SpectatingPlayer[playerid]] = INVALID_PLAYER_ID;
		    SpectatingPlayer[playerid] = INVALID_PLAYER_ID;
		}
		new Float:Position[3];
		GetPlayerPos(playerid, Position[0], Position[1], Position[2]);
		SetPVarFloat(playerid, "SpecPosX", Position[0]);
		SetPVarFloat(playerid, "SpecPosY", Position[1]);
		SetPVarFloat(playerid, "SpecPosZ", Position[2]);
		TogglePlayerSpectating(playerid, true);
        format(string, sizeof(string), "You are now spectating (ID: %d) %s, type /spec off to stop spectating.", targetid, GetPlayerNameEx(targetid));
        SendClientMessageEx(playerid, COLOR_WHITE, string);
        SpectatingAdmin[targetid] = playerid;
        SpectatingPlayer[playerid] = targetid;
   	    SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(targetid));
   	    SetPlayerInterior(playerid, GetPlayerInterior(targetid));
        if(IsPlayerInAnyVehicle(targetid))
        {
            PlayerSpectateVehicle(playerid, GetPlayerVehicleID(targetid));
        }
        else
		{
			PlayerSpectatePlayer(playerid, targetid);
        }
    }
	return 1;
}

CMD:spec(playerid, params[])
{
	return cmd_spectate(playerid, params);
}


CMD:mine(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] != 4) return SendClientMessageEx(playerid, COLOR_WHITE, "You are not a miner.");
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_WHITE, "You must be on foot to use this command.");
    if(GetPVarInt(playerid, "ActionRestriction") != 0) return SendClientMessageEx(playerid, COLOR_WHITE, "You cannot do it at this time.");
    if(!IsPlayerInRangeOfPoint(playerid, 25.0, LOCATION_MINESPOT)) return SendClientMessageEx(playerid, COLOR_WHITE, "You must be near the mines to use this command.");
    if(GetPlayerSkin(playerid) != 27)
	{
	    SendClientMessageEx(playerid, COLOR_GREEN, "UNIFORM:{FFFFFF} Since you didn't have a proper uniform, you were given one for $25.");
        GivePlayerCash(playerid, -25);
		SetPlayerSkinEx(playerid, 27);
	}
	SetPVarInt(playerid, "IsMining", 1);
	TogglePlayerControllable(playerid, false);
	SetPVarInt(playerid, "ActionRestriction", 1);
	ApplyAnimation(playerid, "SWORD", "sword_4", 4.0, 1, 1, 1, 0, 15000);
	GameTextForPlayer(playerid, "~w~MINING...", 15000, 1);
	SetTimerEx("StartMining", 15000, false, "i", playerid);
	SetPlayerAttachedObject(playerid, INDEX_MINEOBJECT, 18634, 6, 0.078222, 0.000000, 0.110844, 298.897308, 264.126861, 193.350555, 1.000000, 1.000000, 1.000000);
    SendClientMessageEx(playerid, COLOR_ORANGE, "MINE:{FFFFFF} You have started to mine at your current location.");
    SendClientMessageEx(playerid, COLOR_YELLOW, "HINT:{FFFFFF} Please wait 15 seconds while you collect the raw ores.");
    return 1;
}

public StartMining(playerid)
{
	TogglePlayerControllable(playerid, true);
	DeletePVar(playerid, "ActionRestriction");
	ClearAnimations(playerid);
    SetPVarInt(playerid, "MinePayment", 1);
    GameTextForPlayer(playerid, "~g~RAW ORES OBTAINED!", 1000, 1);
    RemovePlayerAttachedObject(playerid, INDEX_MINEOBJECT);
	SetPlayerAttachedObject(playerid, INDEX_MINEOBJECT, 3930, 1, 0.154999, 0.377999, -0.025000, -27.399999, 0.000000, 0.000000, 0.595000, 0.705999, 1.000000, 0, 0);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
    SendClientMessageEx(playerid, COLOR_ORANGE, "MINE:{FFFFFF} You managed to collect an ore from the mine.");
    SendClientMessageEx(playerid, COLOR_YELLOW, "HINT:{FFFFFF} Return it to the processing unit to collect your pay.");
    SetPlayerCheckpoint(playerid, LOCATION_MINEPROCESSING, 1.5);
	return 1;
}



CMD:getdrugs(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] == 6)
	{
	    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_WHITE, "You must be inside a vehicle to use this command.");
	    else if(!IsPlayerInRangeOfPoint(playerid, 5.0, LOCATION_GETDRUGS)) return SendClientMessageEx(playerid, COLOR_WHITE, "You must be near the warehouse to use this command.");
	    else if(HasActiveCheckpoint(playerid)) return SendClientMessageEx(playerid, COLOR_WHITE, "You already have an existing checkpoint, type /killcheckpoint to kill it.");
	    SetPVarInt(playerid, "SmuggleRoute", random(sizeof(DrugWarehouses)) + 1);
	    SetPlayerCheckpoint(playerid, DrugWarehouses[GetPVarInt(playerid, "SmuggleRoute") - 1][0], DrugWarehouses[GetPVarInt(playerid, "SmuggleRoute") - 1][1], DrugWarehouses[GetPVarInt(playerid, "SmuggleRoute") - 1][2], 5.0);
		VehicleInfo[GetPlayerVehicleID(playerid)][vDrugs] = playerid + 1;
	    SendClientMessageEx(playerid, COLOR_GREEN, "Drug Smuggling:{FFFFFF} Deliver the load to the specified location to receive your pay.");
	    SendClientMessageEx(playerid, COLOR_ORANGE, "Hint:{FFFFFF} Be careful from police as they can search your boat and arrest you for illegal contraband.");
	}
	return 1;
}

CMD:fare(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] == 5)
	{
		new
	    	fareamount,
			string[128];

	    if(gTaxiFareAmount[playerid] != 0)
	    {
			gTaxiFareAmount[playerid] = 0;
	        PlayerInfo[playerid][pMoney] += gTaxiFareEarnings[playerid];
	        format(string, sizeof(string), "You have went off duty and earned $%d for this trip.", gTaxiFareEarnings[playerid]);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
	        gTaxiFareEarnings[playerid] = 0;
	        PlayerInfo[playerid][pDuty] = 0;
	        SetPlayerToTeamColor(playerid);
	    }
	    else
	    {
	    	if(sscanf(params, "i", fareamount)) return SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /fare [$1-$5]");
	    	else if(fareamount < 1 || fareamount > 5) return SendClientMessageEx(playerid, COLOR_WHITE, "You must enter an amount between $1-$5 per second.");
	    	else if(!IsATaxiCar(GetPlayerVehicleID(playerid))) return SendClientMessageEx(playerid, COLOR_WHITE, "You must be inside a cab to use this command.");
	    	gTaxiFareEarnings[playerid] = 0;
	        format(string, sizeof(string), "You are now on duty, people who enter your car will pay you $%d every second.", fareamount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
	        gTaxiFareAmount[playerid] = fareamount;
	        PlayerInfo[playerid][pDuty] = 1;
	        SetPlayerToTeamColor(playerid);
	    }
	}
	return 1;
}

CMD:news(playerid, params[])
{
	if(IsANews(playerid))
	{
		new string[128];
		//if(!IsNewsVehicle(GetPlayerVehicleID(playerid))) return SendClientMessageEx(playerid, COLOR_GREY, "You are not in a news vehicle.");
		if(sscanf(params, "s[128]", params)) return SendClientMessageEx(playerid, COLOR_WHITE, "USAGE: /news [text]");
		format(string, sizeof(string), "[IGTV-BROADCAST] %s: %s", GetPlayerNameEx(playerid), params);
		SendClientMessageToAllEx(COLOR_ORANGE, string);
	}
	else
	{
	     SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	}
	return 1;
}




CMD:givegun(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
		new
		    targetid,
		    weapon,
			string[128];
		if(sscanf(params, "ui", targetid, weapon)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /givegun [playerid] [weaponid]");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		GivePlayerWeaponEx(targetid, weapon);
		/* IDs are better
		if(!strcmp(weaponname, "spas12", true) || !strcmp(weaponname, "spas", true) || !strcmp(weaponname, "spas-12", true)) GivePlayerWeaponEx(targetid, WEAPON_SHOTGSPA);
		else if(!strcmp(weaponname, "shotgun", true)) GivePlayerWeaponEx(targetid, WEAPON_SHOTGUN);
		else if(!strcmp(weaponname, "knife", true)) GivePlayerWeaponEx(targetid, WEAPON_KNIFE);
		else if(!strcmp(weaponname, "chainsaw", true))	GivePlayerWeaponEx(targetid, WEAPON_CHAINSAW);
		else if(!strcmp(weaponname, "bat", true) || !strcmp(weaponname, "baseballbat", true))  GivePlayerWeaponEx(targetid, WEAPON_BAT);
		else if(!strcmp(weaponname, "katana", true)) GivePlayerWeaponEx(targetid, WEAPON_KATANA);
		else if(!strcmp(weaponname, "uzi", true)) GivePlayerWeaponEx(targetid, WEAPON_UZI);
		else if(!strcmp(weaponname, "tec9", true)) GivePlayerWeaponEx(targetid, WEAPON_TEC9);
		else if(!strcmp(weaponname, "mp5", true) || !strcmp(weaponname, "smg", true)) GivePlayerWeaponEx(targetid, WEAPON_MP5);
		else if(!strcmp(weaponname, "deagle", true)) GivePlayerWeaponEx(targetid, WEAPON_DEAGLE);
		else if(!strcmp(weaponname, "9mm", true) || !strcmp(weaponname, "colt45", true)) GivePlayerWeaponEx(targetid, WEAPON_COLT45);
		else if(!strcmp(weaponname, "sdpistol", true))	GivePlayerWeaponEx(targetid, WEAPON_SILENCED);
		else if(!strcmp(weaponname, "m4", true) || !strcmp(weaponname, "m4a1", true)) GivePlayerWeaponEx(targetid, WEAPON_M4);
		else if(!strcmp(weaponname, "ak47", true))	GivePlayerWeaponEx(targetid, WEAPON_AK47);
		else if(!strcmp(weaponname, "rifle", true)) GivePlayerWeaponEx(targetid, WEAPON_RIFLE);
		else if(!strcmp(weaponname, "sniper", true) || !strcmp(weaponname, "sniperrifle", true)) GivePlayerWeaponEx(targetid, WEAPON_SNIPER);
		else return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid weapon name.");
		*/
		format(string, sizeof(string), "You have given (ID: %d) %s weapon ID %i.", targetid, GetPlayerNameEx(targetid), weapon);
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "You have been given weapon ID %i from %s.", weapon, GetPlayerNameEx(playerid));
		SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
	}
	return 1;
}

CMD:giveweapon(playerid, params[])
{
	new targetid, weaponname[24], string[128];
	if(sscanf(params, "us[24]", targetid, weaponname)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /giveweapon [playerid] [weapon name]");
	else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	else if(!IsPlayerInRangeOfPlayer(playerid, targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the specified player to use this command.");

	if(!strcmp(weaponname, "spas12", true) || !strcmp(weaponname, "spas", true) || !strcmp(weaponname, "spas-12", true))
	{
	    if(PlayerInfo[playerid][pWeapons][3] != WEAPON_SHOTGSPA) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][3] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 3);
		GivePlayerWeaponEx(targetid, WEAPON_SHOTGSPA);
	}
	else if(!strcmp(weaponname, "shotgun", true))
	{
	    if(PlayerInfo[playerid][pWeapons][3] != WEAPON_SHOTGUN) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][3] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 3);
  		GivePlayerWeaponEx(targetid, WEAPON_SHOTGUN);
	}
	else if(!strcmp(weaponname, "knife", true))
	{
	    if(PlayerInfo[playerid][pWeapons][1] != WEAPON_KNIFE) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][1] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 1);
		GivePlayerWeaponEx(targetid, WEAPON_KNIFE);
	}
	else if(!strcmp(weaponname, "chainsaw", true))
	{
	    if(PlayerInfo[playerid][pWeapons][1] != WEAPON_CHAINSAW) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][1] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 1);
		GivePlayerWeaponEx(targetid, WEAPON_CHAINSAW);
	}
	else if(!strcmp(weaponname, "bat", true) || !strcmp(weaponname, "baseballbat", true))
	{
	    if(PlayerInfo[playerid][pWeapons][1] != WEAPON_BAT) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][1] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 1);
		GivePlayerWeaponEx(targetid, WEAPON_BAT);
	}
	else if(!strcmp(weaponname, "katana", true))
	{
	    if(PlayerInfo[playerid][pWeapons][1] != WEAPON_KATANA) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][1] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 1);
		GivePlayerWeaponEx(targetid, WEAPON_KATANA);
	}
	else if(!strcmp(weaponname, "uzi", true))
	{
	    if(PlayerInfo[playerid][pWeapons][4] != WEAPON_UZI) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][4] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 4);
		GivePlayerWeaponEx(targetid, WEAPON_UZI);
	}
	else if(!strcmp(weaponname, "tec9", true))
	{
	    if(PlayerInfo[playerid][pWeapons][4] != WEAPON_TEC9) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][4] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 4);
		GivePlayerWeaponEx(targetid, WEAPON_TEC9);
	}
	else if(!strcmp(weaponname, "mp5", true) || !strcmp(weaponname, "smg", true))
	{
	    if(PlayerInfo[playerid][pWeapons][4] != WEAPON_MP5) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][4] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 4);
		GivePlayerWeaponEx(targetid, WEAPON_MP5);
	}
	else if(!strcmp(weaponname, "deagle", true))
	{
	    if(PlayerInfo[playerid][pWeapons][2] != WEAPON_DEAGLE) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][2] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 2);
		GivePlayerWeaponEx(targetid, WEAPON_DEAGLE);
	}
	else if(!strcmp(weaponname, "9mm", true) || !strcmp(weaponname, "colt45", true))
	{
	    if(PlayerInfo[playerid][pWeapons][2] != WEAPON_COLT45) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][2] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 2);
		GivePlayerWeaponEx(targetid, WEAPON_COLT45);
	}
	else if(!strcmp(weaponname, "sdpistol", true))
	{
	    if(PlayerInfo[playerid][pWeapons][2] != WEAPON_SILENCED) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][2] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 2);
		GivePlayerWeaponEx(targetid, WEAPON_SILENCED);
	}
	else if(!strcmp(weaponname, "m4", true) || !strcmp(weaponname, "m4a1", true))
	{
	    if(PlayerInfo[playerid][pWeapons][5] != WEAPON_M4) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][5] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 5);
		GivePlayerWeaponEx(targetid, WEAPON_M4);
	}
	else if(!strcmp(weaponname, "ak47", true))
	{
	    if(PlayerInfo[playerid][pWeapons][5] != WEAPON_AK47) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][5] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 5);
		GivePlayerWeaponEx(targetid, WEAPON_AK47);
	}
	else if(!strcmp(weaponname, "rifle", true))
	{
	    if(PlayerInfo[playerid][pWeapons][6] != WEAPON_RIFLE) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][6] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 6);
		GivePlayerWeaponEx(targetid, WEAPON_RIFLE);
	}
	else if(!strcmp(weaponname, "sniper", true) || !strcmp(weaponname, "sniperrifle", true))
	{
	    if(PlayerInfo[playerid][pWeapons][6] != WEAPON_SNIPER) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
	    else if(PlayerInfo[targetid][pWeapons][6] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player already has a weapon in that slot.");
		RemovePlayerWeaponEx(playerid, 6);
		GivePlayerWeaponEx(targetid, WEAPON_SNIPER);
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid weapon name.");
	    return 1;
	}
	format(string, sizeof(string), "* %s has given their %s to %s.", GetPlayerNameEx(playerid), weaponname, GetPlayerNameEx(targetid));
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	return 1;
}

CMD:drop(playerid, params[])
{
	new
		string[128];
	if(sscanf(params, "{s[24]}")) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /drop [weapons, weed, seeds]");

	if(!strcmp(params, "weapons", true))
	{
		ResetPlayerWeapons(playerid);
		SetPlayerArmedWeapon(playerid, 0);
		for (new i=0; i < 12; i++)
		{
			PlayerInfo[playerid][pWeapons][i] = 0;
		}
		format(string, sizeof(string), "* %s has dropped their weapons.", GetPlayerNameEx(playerid));
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	else if(!strcmp(params, "weed", true))
	{
		PlayerInfo[playerid][pWeed] = 0;
		format(string, sizeof(string), "* %s has dropped their weed.", GetPlayerNameEx(playerid));
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	else if(!strcmp(params, "seeds", true))
	{
		PlayerInfo[playerid][pSeeds] = 0;
		format(string, sizeof(string), "* %s has dropped a small packet of seeds.", GetPlayerNameEx(playerid));
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	return 1;
}

CMD:give(playerid, params[])
{
	new
	    targetid,
	    option[12],
	    amount,
		string[128];
	if(sscanf(params, "us[12]i", targetid, option, amount)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /give [playerid] [weed, seeds, bombs] [amount]");
	else if(!IsPlayerInRangeOfPlayer(playerid, targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the specified player to use this command.");
	if(!strcmp(option, "weed", true))
	{
	    if(PlayerInfo[playerid][pWeed] < amount || amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have that many grams of weed to give.");
		PlayerInfo[playerid][pWeed] -= amount;
		PlayerInfo[targetid][pWeed] += amount;
		format(string, sizeof(string), "* %s withdraws a small dime-bag, and hands it over to %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
     	format(string, sizeof(string), "*  You have received %d grams of weed from (ID: %d) %s.", amount, playerid, GetPlayerNameEx(playerid));
     	SendClientMessageEx(targetid, COLOR_GREY, string);
     	format(string, sizeof(string), "*  You have sent %d grams of weed to (ID: %d) %s.", amount, targetid, GetPlayerNameEx(targetid));
     	SendClientMessageEx(playerid, COLOR_GREY, string);
	}
	else if(!strcmp(option, "seeds", true))
	{
	    if(PlayerInfo[playerid][pSeeds] < amount || amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have that many seeds to give.");
		PlayerInfo[playerid][pSeeds] -= amount;
		PlayerInfo[targetid][pSeeds] += amount;
		format(string, sizeof(string), "* %s withdraws a small packet of seeds, and hands it over to %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
     	format(string, sizeof(string), "*  You have received %d seeds from (ID: %d) %s.", amount, playerid, GetPlayerNameEx(playerid));
     	SendClientMessageEx(targetid, COLOR_GREY, string);
     	format(string, sizeof(string), "*  You have sent %d seeds to (ID: %d) %s.", amount, targetid, GetPlayerNameEx(targetid));
     	SendClientMessageEx(playerid, COLOR_GREY, string);
	}
	else if(!strcmp(option, "bombs", true))
	{
	    if(PlayerInfo[playerid][pBombs] < amount || amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have that many bombs to give.");
		PlayerInfo[playerid][pBombs] -= amount;
		PlayerInfo[targetid][pBombs] += amount;
		format(string, sizeof(string), "* %s takes out a small package, and hands it over to %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
     	format(string, sizeof(string), "*  You have received %d explosives from (ID: %d) %s.", amount, playerid, GetPlayerNameEx(playerid));
     	SendClientMessageEx(targetid, COLOR_GREY, string);
     	format(string, sizeof(string), "*  You have given %d explosives to (ID: %d) %s.", amount, targetid, GetPlayerNameEx(targetid));
     	SendClientMessageEx(playerid, COLOR_GREY, string);
	}
	return 1;
}

CMD:dropweapon(playerid, params[])
{
	new
		string[128];
	if(sscanf(params, "{s[24]}")) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /dropweapon [weapon name]");

	if(!strcmp(params, "spas12", true) || !strcmp(params, "spas", true) || !strcmp(params, "spas-12", true))
	{
	    if(PlayerInfo[playerid][pWeapons][3] != WEAPON_SHOTGSPA) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 3);
		format(string, sizeof(string), "* %s has dropped their SPAS-12.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "shotgun", true))
	{
	    if(PlayerInfo[playerid][pWeapons][3] != WEAPON_SHOTGUN) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 3);
		format(string, sizeof(string), "* %s has dropped their shotgun.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "knife", true))
	{
	    if(PlayerInfo[playerid][pWeapons][1] != WEAPON_KNIFE) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 1);
		format(string, sizeof(string), "* %s has dropped their knife.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "chainsaw", true))
	{
	    if(PlayerInfo[playerid][pWeapons][1] != WEAPON_CHAINSAW) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 1);
		format(string, sizeof(string), "* %s has dropped their chainsaw.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "bat", true) || !strcmp(params, "baseballbat", true))
	{
	    if(PlayerInfo[playerid][pWeapons][1] != WEAPON_BAT) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 1);
		format(string, sizeof(string), "* %s has dropped their baseball bat.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "katana", true))
	{
	    if(PlayerInfo[playerid][pWeapons][1] != WEAPON_KATANA) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 1);
		format(string, sizeof(string), "* %s has dropped their katana.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "uzi", true))
	{
	    if(PlayerInfo[playerid][pWeapons][4] != WEAPON_UZI) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 4);
		format(string, sizeof(string), "* %s has dropped their uzi.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "tec9", true))
	{
	    if(PlayerInfo[playerid][pWeapons][4] != WEAPON_TEC9) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 4);
		format(string, sizeof(string), "* %s has dropped their tec-9.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "mp5", true) || !strcmp(params, "smg", true))
	{
	    if(PlayerInfo[playerid][pWeapons][4] != WEAPON_MP5) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 4);
		format(string, sizeof(string), "* %s has dropped their mp5.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "deagle", true))
	{
	    if(PlayerInfo[playerid][pWeapons][2] != WEAPON_DEAGLE) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 2);
		format(string, sizeof(string), "* %s has dropped their deagle.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "9mm", true) || !strcmp(params, "colt45", true))
	{
	    if(PlayerInfo[playerid][pWeapons][2] != WEAPON_COLT45) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 2);
		format(string, sizeof(string), "* %s has dropped their colt-45.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "sdpistol", true))
	{
	    if(PlayerInfo[playerid][pWeapons][2] != WEAPON_SILENCED) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 2);
		format(string, sizeof(string), "* %s has dropped their silenced pistol.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "m4", true) || !strcmp(params, "m4a1", true))
	{
	    if(PlayerInfo[playerid][pWeapons][5] != WEAPON_M4) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 5);
		format(string, sizeof(string), "* %s has dropped their M4.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "ak47", true))
	{
	    if(PlayerInfo[playerid][pWeapons][5] != WEAPON_AK47) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 5);
		format(string, sizeof(string), "* %s has dropped their Ak-47.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "rifle", true))
	{
	    if(PlayerInfo[playerid][pWeapons][6] != WEAPON_RIFLE) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 6);
		format(string, sizeof(string), "* %s has dropped their rifle.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "sniper", true) || !strcmp(params, "sniperrifle", true))
	{
	    if(PlayerInfo[playerid][pWeapons][6] != WEAPON_SNIPER) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have this weapon.");
		RemovePlayerWeaponEx(playerid, 6);
		format(string, sizeof(string), "* %s has dropped their sniper rifle.", GetPlayerNameEx(playerid));
	}
	else
	{
	    return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid weapon name.");
	}
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	return 1;
}

CMD:badge(playerid, params[])
{
	if(IsALegal(playerid))
	{
        if(PlayerInfo[playerid][pDuty])
		{
           	PlayerInfo[playerid][pDuty] = 0;
			SetPlayerToTeamColor(playerid);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have hidden your badge, and will now be identified as being off-duty.");
        }
		else
		{
          	PlayerInfo[playerid][pDuty] = 1;
           	SetPlayerToTeamColor(playerid);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have shown your badge, and will now be identified as being on-duty.");
		}
	}
	return 1;
}


CMD:vault(playerid, params[])
{
	if(PlayerInfo[playerid][pFaction] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You must be in a faction to use this command.");
	else
	{
	    new option[32], amount, string[128], factionid = PlayerInfo[playerid][pFaction];
	    if(!IsPlayerInRangeOfPoint(playerid, 4.0, VaultInfo[factionid][vPosition][0], VaultInfo[factionid][vPosition][1], VaultInfo[factionid][vPosition][2])) return SendClientMessageEx(playerid, COLOR_GREY, "You must be at your faction vault to use this command.");
		else if(sscanf(params, "s[32]i", option, amount))
		{
		    format(string, sizeof(string), "Your faction has currently $%d inside the vault.", VaultInfo[factionid][vMoney]);
		    SendClientMessageEx(playerid, COLOR_GREY, string);
			return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /vault [depositmoney, withdrawmoney] [amount]");
		}

		if(!strcmp(option, "depositmoney"))
		{
		    if(PlayerInfo[playerid][pMoney] < amount || amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid amount.");

			format(string, sizeof(string), "[VAULT][%s]: %s has placed a deposit of $%d into the vault.", GetFactionName(factionid), GetPlayerNameEx(playerid), amount);
			Log("logs/vault.log", string);
			PlayerInfo[playerid][pMoney] -= amount;
		    AddVaultMoney(factionid, amount);
		    format(string, sizeof(string), "You have deposited $%d into your faction vault, it now has $%d inside it.", amount, VaultInfo[factionid][vMoney]);
		    SendClientMessageEx(playerid, COLOR_GREY, string);
		}
		else if(!strcmp(option, "withdrawmoney"))
		{
		    if(VaultInfo[factionid][vMoney] < amount || amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid amount.");
		    else if(PlayerInfo[playerid][pLeadership] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You must be a faction leader to use this command.");

			format(string, sizeof(string), "[VAULT][%s]: %s has withdrawn $%d from the vault.", GetFactionName(factionid), GetPlayerNameEx(playerid), amount);
			Log("logs/vault.log", string);
			PlayerInfo[playerid][pMoney] += amount;
		    AddVaultMoney(factionid, -amount);
		    format(string, sizeof(string), "You have withdrawed $%d from your faction vault, it now has $%d inside it.", amount, VaultInfo[factionid][vMoney]);
		    SendClientMessageEx(playerid, COLOR_GREY, string);
		}
	}
	return 1;
}

CMD:invite(playerid, params[])
{
	new targetid, string[128];
	if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /invite <playerid>");
	else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	else if(playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
	else if(PlayerInfo[targetid][pFaction] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified person is already inside a faction.");
	if(PlayerInfo[playerid][pFaction] > 0 && PlayerInfo[playerid][pLeadership] == 1)
	{
		format(string, sizeof(string), "[INVITE][%s]: %s has invited %s to the faction.", GetFactionName(PlayerInfo[playerid][pFaction]), GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
		Log("logs/faction.log", string);

		SetPVarInt(targetid, "FactionID", PlayerInfo[playerid][pFaction]);
		SetPVarInt(targetid, "FactionInvitation", playerid);
		SetPVarInt(playerid, "InvitedPlayer", targetid);
		format(string, sizeof(string), "%s %s has invited you to join the %s (/accept faction).", GetRankName(playerid), GetPlayerNameEx(playerid), GetFactionName(PlayerInfo[playerid][pFaction]));
		SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "You have invited %s to join the %s.", GetPlayerNameEx(targetid), GetFactionName(PlayerInfo[playerid][pFaction]));
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	}
	else
	{
	     SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this.");
	}
	return 1;
}

CMD:uninvite(playerid, params[])
{
	new targetid, string[128];
	if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /uninvite <playerid>");
	else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	else if(playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
	else if(PlayerInfo[targetid][pRank] > PlayerInfo[playerid][pRank]) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot kick members who are of higher rank.");
	if(PlayerInfo[playerid][pFaction] > 0 && PlayerInfo[playerid][pLeadership] == 1)
	{
        if(PlayerInfo[targetid][pFaction] !=  PlayerInfo[playerid][pFaction]) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot uninvite people who are not inside your faction.");

		format(string, sizeof(string), "[UNINVITE][%s]: %s has kicked %s from their faction.", GetFactionName(PlayerInfo[playerid][pFaction]), GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
		Log("logs/faction.log", string);
		format(string, sizeof(string), "* You have been kicked from %s by %s.", GetFactionName(PlayerInfo[playerid][pFaction]), GetPlayerNameEx(playerid));
		SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "You have kicked %s from the faction.", GetPlayerNameEx(targetid));
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	 	PlayerInfo[targetid][pFaction] = 0;
	 	PlayerInfo[targetid][pLeadership] = 0;
	  	PlayerInfo[targetid][pRank] = 0;
		PlayerInfo[targetid][pDuty] = 0;
		SetPlayerToTeamColor(targetid);
	}
	else
	{
	     SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this.");
	}
	return 1;
}

CMD:giverank(playerid, params[])
{
	new targetid, rank, string[128];
	if(sscanf(params, "ui", targetid, rank)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /giverank <playerid> <rank 1-10>");
	else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	if(PlayerInfo[playerid][pFaction] > 0 && PlayerInfo[playerid][pLeadership] == 1)
	{
		if(PlayerInfo[targetid][pFaction] !=  PlayerInfo[playerid][pFaction]) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot change the ranks of people that are not in your faction.");
		else if(rank < 0 || rank > 10) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /giverank <playerid> <rank 0-10>");

		format(string, sizeof(string), "[RANK][%s]: %s has set %s's rank to %i.", GetFactionName(PlayerInfo[targetid][pFaction]), GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), rank);
		Log("logs/faction.log", string);
	    PlayerInfo[targetid][pRank] = rank;
		format(string, sizeof(string), "Your rank has been adjusted to %i by %s", PlayerInfo[targetid][pRank], GetPlayerNameEx(playerid));
		SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "You have adjusted %s's rank to %d.", GetPlayerNameEx(targetid), PlayerInfo[targetid][pRank]);
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	}
	else
	{
	     SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	}
	return 1;
}

CMD:setdiv(playerid, params[])
{
	new targetid, id, string[128], division[9];
	if(sscanf(params, "ui", targetid, id)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /setdiv <playerid> <division>");
	else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	if(PlayerInfo[playerid][pFaction] > 0 && PlayerInfo[playerid][pLeadership] == 1 && !IsAnIllegal(playerid))
	{
		if(PlayerInfo[targetid][pFaction] !=  PlayerInfo[playerid][pFaction]) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot change the division of people that are not in your faction.");
		else if(id < 0 || id > 5) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid division id.");
		division = GetDivisionName(PlayerInfo[targetid][pFaction], id);
		format(string, sizeof(string), "[%s]: %s has set %s's division to %s.", GetFactionName(PlayerInfo[targetid][pFaction]), GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), division);
		Log("logs/faction.log", string);

	    PlayerInfo[targetid][pDivision] = id;
		format(string, sizeof(string), "Your division has been adjusted to %s by %s", GetDivisionName(PlayerInfo[targetid][pFaction], PlayerInfo[targetid][pDivision]), GetPlayerNameEx(playerid));
		SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "You have adjusted %s's division to %s.", GetPlayerNameEx(targetid), GetDivisionName(PlayerInfo[targetid][pFaction], PlayerInfo[targetid][pDivision]));
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	}
	else SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	return 1;
}


CMD:buyvehicles(playerid, params[])
{
	if(!IsAtDealership(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be at a dealership to buy a vehicle.");
    ShowBuyableCars(playerid);
	return 1;
}
stock IsAtDealership(playerid)
{
	return (IsPlayerInRangeOfPoint(playerid, 25.0, LOCATION_DEALERSHIP));
}
CMD:getgun(playerid, params[])
{
	if(IsAnIllegal(playerid) || PlayerInfo[playerid][pHitman] != 0)
	{
		if(PlayerInfo[playerid][pRank] < 4 && PlayerInfo[playerid][pHitman] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You must be at least rank 4 to obtain guns.");
	    if(IsPlayerInRangeOfPoint(playerid, 6.0, LOCATION_WEAPONFACTORY))
	    {
	        new weaponname[24];
			if(sscanf(params, "s[24]", weaponname))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /getgun [weapon name]");
				SendClientMessageEx(playerid, COLOR_GREY, "Weapon(s): SDPistol ($900), Deagle ($1800), Shotgun ($700), AK47 ($6000), Bomb ($7500)");
				SendClientMessageEx(playerid, COLOR_GREY, "Weapon(s): MP5 ($950), Uzi ($1200), Tec9 ($1100), Katana ($400), Knife ($50)");
				return 1;
			}
		 	if(!strcmp(weaponname, "deagle", true))
			{
			    if(PlayerInfo[playerid][pMoney] < 900) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have the sufficient funds, you cannot obtain this item.");
			    GivePlayerWeaponEx(playerid, WEAPON_DEAGLE);
	    		GivePlayerCash(playerid, -1800);
			}
			else if(!strcmp(weaponname, "shotgun", true))
			{
			    if(PlayerInfo[playerid][pMoney] < 700) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have the sufficient funds, you cannot obtain this item.");
			    GivePlayerWeaponEx(playerid, WEAPON_SHOTGUN);
	    		GivePlayerCash(playerid, -700);
			}
			else if(!strcmp(weaponname, "ak47", true))
			{
			    if(PlayerInfo[playerid][pMoney] < 1500) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have the sufficient funds, you cannot obtain this item.");
			    GivePlayerWeaponEx(playerid, WEAPON_AK47);
	    		GivePlayerCash(playerid, -6000);
			}
			else if(!strcmp(weaponname, "mp5", true))
			{
			    if(PlayerInfo[playerid][pMoney] < 950) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have the sufficient funds, you cannot obtain this item.");
			    GivePlayerWeaponEx(playerid, WEAPON_MP5);
	    		GivePlayerCash(playerid, -950);
			}
			else if(!strcmp(weaponname, "uzi", true))
			{
			    if(PlayerInfo[playerid][pMoney] < 1200) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have the sufficient funds, you cannot obtain this item.");
			    GivePlayerWeaponEx(playerid, WEAPON_UZI);
	    		GivePlayerCash(playerid, -1200);
			}
			else if(!strcmp(weaponname, "tec9", true))
			{
			    if(PlayerInfo[playerid][pMoney] < 1100) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have the sufficient funds, you cannot obtain this item.");
			    GivePlayerWeaponEx(playerid, WEAPON_TEC9);
	    		GivePlayerCash(playerid, -1100);
			}
			else if(!strcmp(weaponname, "sniper", true))
			{
			    if(PlayerInfo[playerid][pMoney] < 5000) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have the sufficient funds, you cannot obtain this item.");
			    GivePlayerWeaponEx(playerid, WEAPON_SNIPER);
	    		GivePlayerCash(playerid, -5000);
			}
			else if(!strcmp(weaponname, "katana", true))
			{
			    if(PlayerInfo[playerid][pMoney] < 400) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have the sufficient funds, you cannot obtain this item.");
			    GivePlayerWeaponEx(playerid, WEAPON_KATANA);
	    		GivePlayerCash(playerid, -400);
			}
			else if(!strcmp(weaponname, "sdpistol", true))
			{
			    if(PlayerInfo[playerid][pMoney] < 900) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have the sufficient funds, you cannot obtain this item.");
			    GivePlayerWeaponEx(playerid, WEAPON_SILENCED);
	    		GivePlayerCash(playerid, -900);
			}
			else if(!strcmp(weaponname, "bomb", true))
			{
		    	if(PlayerInfo[playerid][pMoney] < 7500) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have the sufficient funds, you cannot obtain this item.");
		    	PlayerInfo[playerid][pBombs]++;
    			GivePlayerCash(playerid, -7500);
			}
			else if(!strcmp(weaponname, "knife", true))
			{
				if(PlayerInfo[playerid][pMoney] < 50) return SendClientMessageEx(playerid, COLOR_YELLOW, "You do not have the sufficient funds, you cannot obtain this item.");
			    GivePlayerWeaponEx(playerid, 4);
	    		GivePlayerCash(playerid, -50);
			}
			else return SendClientMessageEx(playerid, COLOR_GREY, "You have specified an invalid weapon name.");
			new string[128];
			format(string, sizeof(string), "* %s has acquired a weapon from the machine.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	    }
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "You must be in an illegal faction to obtain guns from the dealer.");
	return 1;
}

CMD:wt(playerid, params[])
{
	new text[128], string[128];
	if(sscanf(params, "s[128]", text))
	{
	    return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /wt <text>");
	}
	else if(PlayerInfo[playerid][pWalkieTalkie] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have a walkie talkie!  Buy one at a 24/7.");
	else if(PlayerInfo[playerid][pChannel] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You must change the channel using the device.");
	format(string, sizeof(string), "(radio) %s ", text);
	SetPlayerChatBubble(playerid, text, COLOR_WHITE, 20.0, 10000);
	format(string, sizeof(string), "** Walkie Talkie (%d kHz) ** %s: %s", PlayerInfo[playerid][pChannel], GetPlayerNameEx(playerid), text);
	foreach(new i: Player)
	{
	    if(PlayerInfo[i][pWalkieTalkie] == 1 && PlayerInfo[i][pChannel] == PlayerInfo[playerid][pChannel])
	    {
			SendClientMessageEx(i, COLOR_GREEN, string);
		}
	}
	return 1;
}

CMD:walkietalkie(playerid, params[])
{
	return cmd_wt(playerid, params);
}

CMD:channel(playerid, params[])
{
	new string[128];
	if(sscanf(params, "{i}")) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /channel <channel>");
	else if(PlayerInfo[playerid][pWalkieTalkie] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You must first own a walkie talkie! Buy one at a 24/7");
	else if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this at this time.");
	PlayerInfo[playerid][pChannel] = strval(params);
	format(string, sizeof(string), "You have modified your Walking Talkie's channel to %d kHz.", PlayerInfo[playerid][pChannel]);
	SendClientMessageEx(playerid, COLOR_GREEN, string);
	return 1;
}

CMD:radio(playerid, params[])
{
	return cmd_r(playerid, params);
}

CMD:r(playerid, params[])
{
	if(sscanf(params, "{s[128]}")) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /r(adio) [text]");
	else if(!IsALegal(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not in a faction with radio access.");
    else if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use your radio at this time.");

	new string[128];

	format(string, sizeof(string), "(radio) %s ", params);
	SetPlayerChatBubble(playerid, string, COLOR_WHITE, 20.0, 3000);
	if(IsALegal(playerid))
	{
		if(PlayerInfo[playerid][pDivision] != 0)  format(string, sizeof(string), "** %s (%s) %s: %s **", GetRankName(playerid), GetPlayerDivision(playerid), GetPlayerNameEx(playerid), params);
		else format(string, sizeof(string), "** %s %s: %s **", GetRankName(playerid) , GetPlayerNameEx(playerid), params);
        SendFactionMessage(PlayerInfo[playerid][pFaction], RADIO_TEAM, string);
	}
	return 1;
}

CMD:faction(playerid, params[]) return cmd_f(playerid, params);
CMD:f(playerid, params[])
{
    if(PlayerInfo[playerid][pFaction] > 0)
    {
		new string[128];
		if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /f(amily) [text]");
	    else if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this channel at this time.");
		format(string, sizeof(string), "** (%d) %s %s: %s **", PlayerInfo[playerid][pRank], GetRankName(playerid), GetPlayerNameEx(playerid), params);
		SendFactionMessage(PlayerInfo[playerid][pFaction], COLOR_DARKCYAN, string);
 	}
 	else
 	{
		SendClientMessageEx(playerid, COLOR_GREY, "You are not in a faction.");
	}
 	return 1;
}

CMD:department(playerid, params[]) return cmd_d(playerid, params);
CMD:d(playerid, params[])
{
	if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /d(epartment) [text]");
	else if(!IsALegal(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not in a faction that can use this command.");
    else if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use your radio at this time.");

	new string[128];
	if(PlayerInfo[playerid][pDivision] != 0) format(string, sizeof(string), "** %s %s (%s) %s: %s **", GetFactionName(PlayerInfo[playerid][pFaction]), GetRankName(playerid), GetPlayerDivision(playerid), GetPlayerNameEx(playerid), params);
	else format(string, sizeof(string), "** %s %s %s: %s **", GetFactionName(PlayerInfo[playerid][pFaction]), GetRankName(playerid), GetPlayerNameEx(playerid), params);
	SendDepartmentMessage(string);
	return 1;
}

CMD:makeleader(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
		new targetid, faction, string[128];
		if(sscanf(params, "ui", targetid, faction)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /makeleader <playerid>  <faction id>");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	    else if(faction < 1 || faction > MAX_FACTIONS) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /makeleader <playerid> <faction id (1 to 6)>");
	    PlayerInfo[targetid][pLeadership] = 1;
	    PlayerInfo[targetid][pFaction] = faction;
	    PlayerInfo[targetid][pRank] = 10;

		format(string, sizeof(string), "[Leader]: %s has set %s as the leader of %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), GetFactionName(faction));
		Log("logs/faction.log", string);
		format(string, sizeof(string), "* You were made the leader of %s by %s.", GetFactionName(faction), GetPlayerNameEx(playerid));
		SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "You have made %s the leader of %s.", GetPlayerNameEx(targetid), GetFactionName(faction));
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	}
	return 1;
}

CMD:factions(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
		new string[128];
		SendClientMessageEx(playerid, COLOR_ORANGE, "---------------------------------");
		for(new i=1; i < MAX_FACTIONS+1; i++)
		{
		    format(string, sizeof(string), "ID: %d | Name: %s | Type: %s", i, GetFactionName(i), GetFactionType(i));
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		SendClientMessageEx(playerid, COLOR_ORANGE, "---------------------------------");
	}
	return 1;
}

CMD:admins(playerid, params[])
{
	new string[128];
	SendClientMessageEx(playerid, COLOR_ORANGE, "---------------------------------");
	SendClientMessageEx(playerid, COLOR_ORANGE, ""SERVER_NAME" - Administration Team");
	foreach (Player, i)
	{
		if(PlayerInfo[i][pAdminLevel] >= ADMIN_LEVEL_TWO && PlayerInfo[playerid][pAdminName])
	    {
		    if(PlayerInfo[playerid][pAdminLevel] >= ADMIN_LEVEL_FOUR)
			{
				if(GetPVarType(i, "AdminDuty") == 1) format(string, sizeof(string), "{808040}(On Duty){FFFFFF} %s %s (Completed Reports: %d)", GetCAdminRank(i), PlayerInfo[i][pAdminName], PlayerInfo[i][pReports]);
				else format(string, sizeof(string), "{FF0000}(Off Duty){FFFFFF} %s %s (Completed Reports: %d)", GetCAdminRank(i), PlayerInfo[i][pAdminName], PlayerInfo[i][pReports]);
			}
			else
			{
				if(GetPVarType(i, "AdminDuty") == 1) format(string, sizeof(string), "{808040}(On Duty){FFFFFF} %s %s", GetCAdminRank(i), PlayerInfo[i][pAdminName]);
				else format(string, sizeof(string), "{FF0000}(Off Duty){FFFFFF} %s %s", GetCAdminRank(i), PlayerInfo[i][pAdminName]);
			}
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
	    }
	}
	SendClientMessageEx(playerid, COLOR_ORANGE, "---------------------------------");
	return 1;
}

CMD:mods(playerid, params[])
{
	new string[128];
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO)) return 1;
	SendClientMessageEx(playerid, COLOR_ORANGE, "---------------------------------");
	SendClientMessageEx(playerid, COLOR_ORANGE, ""SERVER_NAME" - Moderation Team");
	foreach (Player, i)
	{
		if(PlayerInfo[i][pAdminLevel] == ADMIN_LEVEL_ONE)
	    {
		    format(string, sizeof(string), "%s - %s", GetAdminRank(i), GetPlayerNameEx(i));
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
	    }
	}
	SendClientMessageEx(playerid, COLOR_ORANGE, "---------------------------------");
	return 1;
}

CMD:fackick(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
		new targetid, string[128];
		if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /fackick [playerid]");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");

		if(PlayerInfo[targetid][pFaction] > 0)
		{
			format(string, sizeof(string), "* You were kicked from %s by %s.", GetFactionName(PlayerInfo[targetid][pFaction]), GetPlayerNameEx(playerid));
			SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "You have kicked %s from %s.", GetPlayerNameEx(targetid), GetFactionName(PlayerInfo[targetid][pFaction]));
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "[FACKICK][%s]: %s has been removed from the faction by %s.", GetFactionName(PlayerInfo[targetid][pFaction]), GetPlayerNameEx(targetid), GetPlayerNameEx(playerid));
			Log("logs/faction.log", string);
		}
	    PlayerInfo[targetid][pFaction] = 0;
	    PlayerInfo[targetid][pLeadership] = 0;
	    PlayerInfo[targetid][pRank] = 0;
	}
	return 1;
}

CMD:bank(playerid, params[])
{
	SendClientMessageEx(playerid, 0x00C100FF, "Bank Commands (valid at ATMs as well):");
	SendClientMessageEx(playerid, COLOR_WHITE, "/withdraw, /deposit, /wiretransfer");
	return 1;
}

CMD:wiretransfer(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 10.0, 2310.30, -8.22, 26.74) || IsNearAtm(playerid))
	{
		new amount, targetid, string[128];
		if(sscanf(params, "ui", targetid, amount))
		{
		    format(string, sizeof(string), "You have $%i inside your bank account.", PlayerInfo[playerid][pBankBalance]);
		    SendClientMessageEx(playerid, COLOR_GREY, string);
		 	return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /wiretransfer <id> <amount>");
		}
		else if(amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid amount.");
		else if(amount > PlayerInfo[playerid][pBankBalance]) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have that much money inside your bank account.");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
		format(string, sizeof(string), "You have transfered $%d to %s's account.", amount, GetPlayerNameEx(targetid));
	 	SendClientMessageEx(playerid, COLOR_GREY, string);
		format(string, sizeof(string), "You have received $%d into your account from %s.", amount, GetPlayerNameEx(playerid));
	 	SendClientMessageEx(targetid, COLOR_GREY, string);
		PlayerInfo[playerid][pBankBalance] -= amount;
		PlayerInfo[targetid][pBankBalance] += amount;
		format(string, sizeof(string), "[WIRETRANSFER]: %s has sent $%d to %s.", PlayerInfo[playerid][pUsername], amount, PlayerInfo[targetid][pUsername]);
		Log("logs/pay.log", string);
   		if(IsAdmin(playerid, ADMIN_LEVEL_TWO) && !IsAdmin(playerid, ADMIN_LEVEL_SIX))
   		{
			format(string, sizeof(string), "{FF6347}AdmWarning:{FFFF00} (ID: %d) %s has wired $%d to (ID: %d) %s from their admin account.", playerid, GetPlayerNameEx(playerid), amount, targetid, GetPlayerNameEx(targetid));
			AdminAlert(string, ALERT_ADMINS);
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "You are not inside the bank.");
	}
	return 1;
}

stock IsNearAtm(playerid)
{
	return (IsPlayerInRangeOfPoint(playerid, 3.0, 1154.83, -1448.93, 15.43)
		|| IsPlayerInRangeOfPoint(playerid, 3.0, -79.09, -1171.63, 1.80)
		|| IsPlayerInRangeOfPoint(playerid, 3.0, 387.20, -1816.04, 7.47)
		|| IsPlayerInRangeOfPoint(playerid, 3.0, 1367.25, -1290.09, 12.97)
		|| IsPlayerInRangeOfPoint(playerid, 3.0, 1493.41, -1772.32, 18.36)
		|| IsPlayerInRangeOfPoint(playerid, 3.0, 1748.78, -1863.59, 13.21)
		|| IsPlayerInRangeOfPoint(playerid, 3.0, 1833.24, -1840.24, 13.21)
		|| IsPlayerInRangeOfPoint(playerid, 3.0, 1928.57, -1779.13, 13.19)
		|| IsPlayerInRangeOfPoint(playerid, 3.0, 2108.12, -1790.70, 13.18)
		|| IsPlayerInRangeOfPoint(playerid, 3.0, 2228.40, -1715.64, 13.13)
		|| IsPlayerInRangeOfPoint(playerid, 3.0, 2402.55, -1982.00, 13.19));
}

CMD:withdraw(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 10.0, 2310.30, -8.22, 26.74) || IsNearAtm(playerid))
	{
		new amount, string[128];
		if(sscanf(params, "i", amount)) {
		    format(string, sizeof(string), "You have $%i inside your bank account.", PlayerInfo[playerid][pBankBalance]);
		    SendClientMessageEx(playerid, COLOR_GREY, string);
		 	return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /withdraw [amount]");
		}
		else if(amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid withdrawal amount.");
		else if(amount > PlayerInfo[playerid][pBankBalance]) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have that much money inside your bank account.");

		PlayerInfo[playerid][pBankBalance] -= amount;
		GivePlayerCash(playerid, amount);

		SendClientMessageEx(playerid, COLOR_WHITE, "---------------------------------------------------");
		SendClientMessageEx(playerid, 0x00C100FF, "Bank Information:");
		format(string, sizeof(string), "You have withdrawed $%i from your bank account.", amount);
	 	SendClientMessageEx(playerid, COLOR_YELLOW, string);
		format(string, sizeof(string), "Old Balance: $%i, Bank Balance: $%i", PlayerInfo[playerid][pBankBalance] + amount, PlayerInfo[playerid][pBankBalance]);
	 	SendClientMessageEx(playerid, COLOR_GREY, string);
		SendClientMessageEx(playerid, COLOR_WHITE, "---------------------------------------------------");
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "You are not inside the bank.");
	}
	return 1;
}

CMD:deposit(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 10.0, 2310.30, -8.22, 26.74) || IsNearAtm(playerid))
	{
		new amount, string[128];
		if(sscanf(params, "i", amount)) {
		    format(string, sizeof(string), "You have $%i inside your bank account.", PlayerInfo[playerid][pBankBalance]);
		    SendClientMessageEx(playerid, COLOR_GREY, string);
		 	return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /deposit [amount]");
		}
		else if(amount < 1) return SendClientMessageEx(playerid, COLOR_GREY, "You have entered an invalid deposit amount.");
		else if(amount > PlayerInfo[playerid][pMoney]) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have that much money.");

		GivePlayerCash(playerid, -amount);
		PlayerInfo[playerid][pBankBalance] += amount;

		SendClientMessageEx(playerid, COLOR_WHITE, "---------------------------------------------------");
		SendClientMessageEx(playerid, 0x00C100FF, "Bank Information:");
		format(string, sizeof(string), "You have put $%i into your bank account.", amount);
	 	SendClientMessageEx(playerid, COLOR_YELLOW, string);
		format(string, sizeof(string), "Old Balance: $%i, Bank Balance: $%i", PlayerInfo[playerid][pBankBalance] - amount, PlayerInfo[playerid][pBankBalance]);
	 	SendClientMessageEx(playerid, COLOR_GREY, string);
		SendClientMessageEx(playerid, COLOR_WHITE, "---------------------------------------------------");
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "You are not inside the bank.");
	}
	return 1;
}

CMD:accept(playerid, params[])
{
	new option[32], string[128];
	if(sscanf(params, "s[32]", option)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /accept [faction, faction, frisk, ticket, taxi, mechanic]");

	if(!strcmp(option, "faction", true))
	{
	    new factionid = GetPVarInt(playerid, "FactionID");
	    new factioninvite = GetPVarInt(playerid, "FactionInvitation");
	    new invitedplayer = GetPVarInt(factioninvite, "InvitedPlayer");
	    if(invitedplayer == playerid)
		{
	    	if(PlayerInfo[playerid][pFaction] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You are already inside an organization.");

		    PlayerInfo[playerid][pLeadership] = 0;
		    PlayerInfo[playerid][pFaction] = factionid;
		    PlayerInfo[playerid][pRank] = 1;
			format(string, sizeof(string), "You have accepted the invitation, and joined the %s.", GetFactionName(PlayerInfo[playerid][pFaction]));
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "%s has accepted your invitation and joined the %s.", GetPlayerNameEx(playerid), GetFactionName(PlayerInfo[playerid][pFaction]));
			SendClientMessageEx(factioninvite, COLOR_LIGHTBLUE, string);

			DeletePVar(playerid, "FactionID");
			DeletePVar(playerid, "FactionInvitation");
			DeletePVar(factioninvite, "InvitedPlayer");
			return 1;
		}
	}

	else if(!strcmp(option, "car", true))
	{
	    new
			vSeller = GetPVarInt(playerid, "VehicleOffer"),
			vSlot = GetPVarInt(playerid, "VehicleOfferSlot"),
			vPrice = GetPVarInt(playerid, "VehicleOfferPrice"),
			i = GetAvailableVehicleSlot(playerid);
	    if(IsPlayerConnectedEx(vSeller))
		{
	    	if(PlayerVehicleInfo[vSeller][vSlot][pvHandleId] != GetPlayerVehicleID(vSeller) || !IsPlayerInAnyVehicle(vSeller)) return 1;
	    	else if(!IsPlayerInRangeOfPlayer(playerid, vSeller, 5.0)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the seller to use this command.");
	    	else if(PlayerInfo[playerid][pMoney] < vPrice) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have enough money to purchase this vehicle.");
	    	else if(i == INVALID_SLOT_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have any slots available to store this vehicle.");
			else if(PlayerVehicleInfo[vSeller][i][pvImpounded] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot buy this car off the seller because it is impounded.");

			format(string, sizeof(string), "You have accepted the offer and purchased the %s for $%d.", VehicleNames[PlayerVehicleInfo[vSeller][vSlot][pvModelId] - 400], vPrice);
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "%s has purchased your %s for $%d.", GetPlayerNameEx(playerid), VehicleNames[PlayerVehicleInfo[vSeller][vSlot][pvModelId] - 400], vPrice);
			SendClientMessageEx(vSeller, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "%s has sold their %s to %s for $%d.", GetPlayerNameEx(vSeller), VehicleNames[PlayerVehicleInfo[vSeller][vSlot][pvModelId] - 400], GetPlayerNameEx(playerid), vPrice);
			Log("logs/car.log", string);

			for (new m=0; m < MAX_VEHICLE_MODS; m++)
				PlayerVehicleInfo[playerid][i][pvModifications][m] = PlayerVehicleInfo[vSeller][vSlot][pvModifications][m];
			PlayerVehicleInfo[playerid][i][pvHandleId] = PlayerVehicleInfo[vSeller][vSlot][pvHandleId];
			PlayerVehicleInfo[playerid][i][pvModelId] = PlayerVehicleInfo[vSeller][vSlot][pvModelId];
			PlayerVehicleInfo[playerid][i][pvPosition][0] = PlayerVehicleInfo[vSeller][vSlot][pvPosition][0];
			PlayerVehicleInfo[playerid][i][pvPosition][1] = PlayerVehicleInfo[vSeller][vSlot][pvPosition][1];
			PlayerVehicleInfo[playerid][i][pvPosition][2] = PlayerVehicleInfo[vSeller][vSlot][pvPosition][2];
			PlayerVehicleInfo[playerid][i][pvLocked] = PlayerVehicleInfo[vSeller][vSlot][pvLocked];
			PlayerVehicleInfo[playerid][i][pvHealth] = PlayerVehicleInfo[vSeller][vSlot][pvHealth];
			PlayerVehicleInfo[playerid][i][pvPaintJob] = PlayerVehicleInfo[vSeller][vSlot][pvPaintJob];
			PlayerVehicleInfo[playerid][i][pvCarColor][0] = PlayerVehicleInfo[vSeller][vSlot][pvCarColor][0];
			PlayerVehicleInfo[playerid][i][pvCarColor][1] = PlayerVehicleInfo[vSeller][vSlot][pvCarColor][1];

			for (new ePlayerVehicleData:v; v < ePlayerVehicleData; v++)
				PlayerVehicleInfo[vSeller][vSlot][ePlayerVehicleData:v] = 0;

			RemovePlayerFromVehicle(vSeller);
			PlayerInfo[playerid][pMoney] -= vPrice;
			PlayerInfo[vSeller][pMoney] += vPrice;
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			PlayerPlaySound(vSeller, 1052, 0.0, 0.0, 0.0);
			MySQL_Save_Player_Vehicle(vSeller, vSlot);
			MySQL_Save_Player_Vehicle(playerid, i);
			DeletePVar(playerid, "VehicleOffer");
			DeletePVar(playerid, "VehicleOfferSlot");
			DeletePVar(vSeller, "VehicleOfferPrice");
			return 1;
		}
	}

	else if(!strcmp(option, "frisk", true))
	{
	    new friskId = GetPVarInt(playerid, "FriskedBy");

		if(GetPVarInt(friskId, "FriskingPlayer") == playerid)
		{
			if(!IsPlayerInRangeOfPlayer(playerid, friskId)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the specified player to use this command.");
			SendClientMessageEx(friskId, COLOR_GREY, "--------------------------------------------------------------");
			SendClientMessageEx(friskId, COLOR_GREY, "Item(s) found:");
			for(new i=0; i < 12; i++)
			{
				if(PlayerInfo[playerid][pWeapons][i] != 0)
				{
				    format(string, sizeof(string), "%s", GetWeaponNameEx(PlayerInfo[playerid][pWeapons][i]));
				    SendClientMessageEx(friskId, COLOR_GREY, string);
				}
			}
			if(PlayerInfo[playerid][pWeed] > 0)
			{
				format(string, sizeof(string), "Weed: %d grams", PlayerInfo[playerid][pWeed]);
				SendClientMessageEx(friskId, COLOR_GREY, string);
			}
			if(PlayerInfo[playerid][pSeeds] > 0)
			{
				format(string, sizeof(string), "Seeds: %d", PlayerInfo[playerid][pSeeds]);
				SendClientMessageEx(friskId, COLOR_GREY, string);
			}
			if(PlayerInfo[playerid][pGasCans] > 0)
			{
				format(string, sizeof(string), "Gas Cans: %d", PlayerInfo[playerid][pGasCans]);
				SendClientMessageEx(friskId, COLOR_GREY, string);
			}
			SendClientMessageEx(friskId, COLOR_GREY, "--------------------------------------------------------------");
			format(string, sizeof(string), "* You have frisked (ID: %i) %s.", playerid, GetPlayerNameEx(playerid));
			SendClientMessageEx(friskId, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* You were frisked by (ID: %i) %s.", friskId, GetPlayerNameEx(friskId));
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			SetPVarInt(friskId, "FriskingPlayer", INVALID_PLAYER_ID);
			SetPVarInt(playerid, "FriskedBy", INVALID_PLAYER_ID);
		}
	}

	else if(!strcmp(option, "ticket", true))
	{
	    new
	        ticketOfficer = GetPVarInt(playerid, "TicketOfficer"),
			ticketAmount = GetPVarInt(playerid, "TicketAmount");

		if(GetPVarInt(ticketOfficer, "TicketPlayer") == playerid)
		{
			if(!IsPlayerInRangeOfPlayer(playerid, ticketOfficer, 4.0)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the specified player to use this command.");
			else if(PlayerInfo[playerid][pMoney] < ticketAmount) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have enough money to pay for the ticket.");
			PlayerInfo[playerid][pMoney] -= ticketAmount;
	    	AddVaultMoney(1, ticketAmount); // add to LSPD vault
			format(string, sizeof(string), "* You have paid the ticket of $%d to (ID: %i) %s.", ticketAmount, ticketOfficer, GetPlayerNameEx(ticketOfficer));
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* (ID: %d) %s has paid the ticket of $%d.", playerid, GetPlayerNameEx(playerid), ticketAmount);
			SendClientMessageEx(ticketOfficer, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "[TICKET]: %s has paid the ticket of $%d issued by %s.", playerid, GetPlayerNameEx(playerid), ticketAmount, GetPlayerNameEx(ticketOfficer));
			Log("logs/police.log", string);
			DeletePVar(ticketOfficer, "TicketPlayer");
			DeletePVar(playerid, "TicketAmount");
			DeletePVar(playerid, "TicketOfficer");
		}
	}
	else if(!strcmp(option, "taxi", true))
	{
	    if(PlayerInfo[playerid][pJob] == 5)
	    {
	        if(PlayerInfo[playerid][pDuty])
	        {
		        if(!IsPlayerConnectedEx(gCurrentTaxiCall))
				{
		    		gCurrentTaxiCall = INVALID_PLAYER_ID;
					return SendClientMessageEx(playerid, COLOR_GREY, "Nobody called for a taxi.");
				}
				new Float:Position[3];
				SendClientMessageEx(gCurrentTaxiCall, COLOR_LIGHTBLUE, "The Taxi Company has accepted your call, a unit has been dispatched to your location.");
				format(string, sizeof(string), "** %s has accepted (ID: %d) %s's call.", GetPlayerNameEx(playerid), gCurrentTaxiCall, GetPlayerNameEx(gCurrentTaxiCall));
				foreach (new i: Player)
				{
					if(PlayerInfo[i][pJob] == 5)
				    {
			       		SendClientMessageEx(i, COLOR_LIGHTYELLOW, string);
					}
				}
				GetPlayerPos(gCurrentTaxiCall, Position[0], Position[1], Position[2]);
				SetPlayerCheckpoint(playerid, Position[0], Position[1], Position[2], 5.0);
				SetPVarInt(playerid, "TaxiFindPlayer", 1);
		    	gCurrentTaxiCall = INVALID_PLAYER_ID;
	    	}
	    	else
	    	{
	    	    SendClientMessageEx(playerid, COLOR_GREY, "You must be on duty to use this command.");
	    	}
	    }
	}
	else if(!strcmp(option, "death", true))
	{
	    if(PlayerInfo[playerid][pWounded] != PLAYER_ALIVE)
		{
    		GivePlayerDeath(playerid);
		}
	}
	else if(!strcmp(option, "mechanic", true))
	{
	    if(GetPVarInt(playerid, "MechOffer") > 0)
		{
		    if(GetPVarInt(GetPVarInt(playerid, "MechOffer") - 1, "CustomerMech") - 1 == playerid)
		    {
		        if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be in a vehicle to use this command.");
				new
					vehid = GetPlayerVehicleID(playerid),
					mechanic = GetPVarInt(playerid, "MechOffer") - 1;
			    if(GetPVarInt(playerid, "MechOfferType") == 1)
			    {
	    			if(!IsCar(GetPlayerVehicleID(playerid))) return SendClientMessageEx(playerid, COLOR_GREY, "You can only repair the body kit on cars.");
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "You accepted mechanic service. The body kit of your car is being fixed.");
					SendClientMessageEx(mechanic, COLOR_LIGHTBLUE, "The specified player has accepted your offer to fix their car's body kit.");
					SendClientMessageEx(mechanic, COLOR_ORANGE, "Hint: Start spraying the vehicle with your spraycan to complete the process.");
	                SetPVarInt(mechanic, "SprayingVehicleID", vehid);
	                GivePlayerWeapon(mechanic, WEAPON_SPRAYCAN, 99999);
			    }
			    else if(GetPVarInt(playerid, "MechOfferType") == 2)
			    {
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "You accepted mechanic service. The engine of your car has been fixed.");
					SendClientMessageEx(mechanic, COLOR_LIGHTBLUE, "The specified player has accepted your offer to fix their car's engine.");
			   		SetVehicleHealth(vehid, 1000.0);
					VehicleInfo[vehid][vTotalled] = 0;
			    }
				SetPVarInt(mechanic, "MechTime", 60);
	  			DeletePVar(mechanic, "CustomerMech");
			}
  			DeletePVar(playerid, "MechOffer");
			DeletePVar(playerid, "MechOfferType");
		}
	}
	return 1;
}

CMD:checkcargo(playerid, params[])
{
	new Float:vPos[3], string[128];
	for (new i=0; i < MAX_VEHICLES; i++)
	{
	    if(!IsValidVehicle(i)) continue;
	    GetVehiclePos(i, vPos[0], vPos[1], vPos[2]);
	    if(IsPlayerInRangeOfPoint(playerid, 8.0, vPos[0], vPos[1], vPos[2]))
	    {
			format(string, sizeof(string), "* %s has checked the cargo loaded in the vehicle.", GetPlayerNameEx(playerid));
			ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
			SendClientMessageEx(playerid, COLOR_ORANGE, "---------------------------------------------------");
			format(string, sizeof(string), "Listing cargo for vehicle %s.", VehicleNames[GetVehicleModel(i) - 400]);
			SendClientMessageEx(playerid, COLOR_ORANGE, string);
			SendClientMessageEx(playerid, COLOR_WHITE, (VehicleInfo[i][vDrugs] > 0) ? ("Drugs: {00FF00}Located in Vehicle") : ("Drugs: {FF0000}Not Found"));
			SendClientMessageEx(playerid, COLOR_ORANGE, "---------------------------------------------------");
		}
	}
	return 1;
}
CMD:confiscate(playerid, params[])
{
    if(!IsACop(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not a cop.");
	new Float:vPos[3], string[128];
	for (new i=0; i < MAX_VEHICLES; i++)
	{
	    if(!IsValidVehicle(i)) continue;
	    GetVehiclePos(i, vPos[0], vPos[1], vPos[2]);
	    if(IsPlayerInRangeOfPoint(playerid, 8.0, vPos[0], vPos[1], vPos[2]) && VehicleInfo[i][vDrugs] > 0)
	    {
			SendClientMessageEx(VehicleInfo[i][vDrugs] - 1, COLOR_LIGHTRED, "Failure{FFFFFF}: The drugs have been seized and as a result, you have failed the delivery.");
			KillDrugRoute(VehicleInfo[i][vDrugs] - 1);
			format(string, sizeof(string), "* %s has confiscated the illegal cargo from the vehicle.", GetPlayerNameEx(playerid));
			ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		}
	}
	return 1;
}
CMD:frisk(playerid, params[])
{
    new targetid, string[128];
    if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /frisk <playerid>");
    else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	else if(targetid == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
	else if(!IsPlayerInRangeOfPlayer(playerid, targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the specified player to use this command.");

	SetPVarInt(playerid, "FriskingPlayer", targetid);
	SetPVarInt(targetid, "FriskedBy", playerid);
	format(string, sizeof(string), "* (ID: %i) %s wants to frisk you (type /accept frisk to allow them to do so)", playerid, GetPlayerNameEx(playerid));
	SendClientMessageEx(targetid, 0x33CCFFAA, string);
	format(string, sizeof(string), "* You have offered a frisk to (ID: %i) %s", targetid, GetPlayerNameEx(targetid));
	SendClientMessageEx(playerid, 0x33CCFFAA, string);
	return 1;
}

CMD:createpvehicle(playerid, params[])
{
	new string[128], targetid, vName[16];

    if(!IsAdmin(playerid, ADMIN_LEVEL_FIVE)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	else if(sscanf(params, "us[16]", targetid, vName)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /createpvehicle [playerid] [name]");

	new i = GetAvailableVehicleSlot(targetid);
	if(i == INVALID_SLOT_ID) return SendClientMessageEx(playerid, COLOR_GREY, "They do not have available slots to store anymore vehicles.");

	for (new id=0; id < sizeof(VehicleNames); id++)
	{
		if(strfind(VehicleNames[id], vName, true) == -1) {
			continue;
		}

		GetPlayerPos(playerid, PlayerInfo[playerid][pPositionX], PlayerInfo[playerid][pPositionY], PlayerInfo[playerid][pPositionZ]);
		GetPlayerFacingAngle(playerid, PlayerInfo[playerid][pFacingAngle]);
		PlayerVehicleInfo[targetid][i][pvModelId] = 400 + id;
		for (new m=0; m < MAX_VEHICLE_MODS; m++)
		PlayerVehicleInfo[targetid][i][pvModifications][m] = 0;
		PlayerVehicleInfo[targetid][i][pvPosition][0] = PlayerInfo[playerid][pPositionX];
		PlayerVehicleInfo[targetid][i][pvPosition][1] = PlayerInfo[playerid][pPositionY];
		PlayerVehicleInfo[targetid][i][pvPosition][2] = PlayerInfo[playerid][pPositionZ];
		PlayerVehicleInfo[targetid][i][pvPosition][3] = PlayerInfo[playerid][pFacingAngle];
		PlayerVehicleInfo[targetid][i][pvLocked] = 0;
		PlayerVehicleInfo[targetid][i][pvHealth] = 1000.0;
		PlayerVehicleInfo[targetid][i][pvPaintJob] = 0;
		PlayerVehicleInfo[targetid][i][pvCarColor][0] = 0;
		PlayerVehicleInfo[targetid][i][pvCarColor][1] = 0;
		PlayerVehicleInfo[targetid][i][pvImpounded] = 0;
		PlayerVehicleInfo[targetid][i][pvTicketPrice] = 0;
		PlayerVehicleInfo[targetid][i][pvHandleId] = CreateVehicleEx(PlayerVehicleInfo[targetid][i][pvModelId], PlayerVehicleInfo[targetid][i][pvPosition][0], PlayerVehicleInfo[targetid][i][pvPosition][1], PlayerVehicleInfo[targetid][i][pvPosition][2], PlayerVehicleInfo[targetid][i][pvPosition][3], PlayerVehicleInfo[targetid][i][pvCarColor][0], PlayerVehicleInfo[targetid][i][pvCarColor][1], VEHICLE_RESPAWN);
  		VehicleInfo[PlayerVehicleInfo[targetid][i][pvHandleId]][vLocked] = 0;
  		for (new m=0; m < MAX_VEHICLE_MODS; m++)
  		    PlayerVehicleInfo[targetid][i][pvModifications][m] = 0;

		PlayerPlaySound(targetid, 1052, 0.0, 0.0, 0.0);
		PutPlayerInVehicle(targetid, PlayerVehicleInfo[targetid][i][pvHandleId], 0);
		MySQL_Save_Player_Vehicle(targetid, i);

		format(string, sizeof(string), "A %s has successfully been issued to (ID: %d) %s.", GetVehicleName(PlayerVehicleInfo[targetid][i][pvHandleId]), targetid, GetPlayerNameEx(targetid));
 		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		format(string, sizeof(string), "You have been issued a %s by %s.", GetVehicleName(PlayerVehicleInfo[targetid][i][pvHandleId]), GetPlayerNameEx(playerid));
 		SendClientMessageEx(targetid, COLOR_YELLOW, string);
		return 1;
	}
 	SendClientMessageEx(playerid, COLOR_YELLOW, "The specified car could not be found in the database, you have entered an invalid name.");
	return 1;
}


CMD:destroypvehicle(playerid, params[])
{
	new string[128], targetid, value;

    if(!IsAdmin(playerid, ADMIN_LEVEL_FIVE)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	else if(sscanf(params, "ui", targetid, value)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /destroypvehicle [playerid] [slot]");
	else if(value < 1 || value > MAX_PLAYEROWNED_VEHICLES) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /destroypvehicle [playerid] [slot 1-3]");
	else if(PlayerVehicleInfo[targetid][value - 1][pvModelId] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot delete the car in that slot because it is empty.");
	format(string, sizeof(string), "Your vehicle %s was deleted by %s.", GetVehicleName(PlayerVehicleInfo[targetid][value - 1][pvHandleId]), GetPlayerNameEx(playerid));
	SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "You have deleted %s's %s.", GetPlayerNameEx(targetid), GetVehicleName(PlayerVehicleInfo[targetid][value - 1][pvHandleId]));
	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	DestroyVehicle(PlayerVehicleInfo[targetid][value - 1][pvHandleId]);
	VehicleInfo[PlayerVehicleInfo[playerid][value - 1][pvHandleId]][vLocked] = 0;
	for (new i; ePlayerVehicleData:i < ePlayerVehicleData; i++)
	{
    	PlayerVehicleInfo[targetid][value - 1][ePlayerVehicleData:i] = 0;
	}
	MySQL_Save_Player_Vehicle(targetid, value - 1);
	return 1;
}

CMD:tow(playerid, params[])
{
	if(IsACop(playerid))
	{
		if(!IsPlayerInAnyVehicle(playerid) || GetVehicleModel(GetPlayerVehicleID(playerid)) != 525) return SendClientMessageEx(playerid, COLOR_GREY, "You must be inside a tow truck to use this command.");
		if(!IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid))) {
			new
				Float: fVehiclePos[3];
			for(new i = 0; i < MAX_VEHICLES; i++) {
				if(GetVehicleModel(i) == 0 || (IsPlayerInAnyVehicle(playerid) && i == GetPlayerVehicleID(playerid)) ) continue;
				GetVehiclePos(i, fVehiclePos[0], fVehiclePos[1], fVehiclePos[2]);
				if(IsPlayerInRangeOfPoint(playerid, 7.0, fVehiclePos[0], fVehiclePos[1], fVehiclePos[2])) {
				    if(IsCar(i)) {
				        AttachTrailerToVehicle(i, GetPlayerVehicleID(playerid));
				        SendClientMessageEx(playerid, COLOR_GREEN, "You have successfully attached a vehicle to the tow truck.");
				    }
					else return SendClientMessageEx(playerid, COLOR_GREY, "This command can only be used on cars.");
				}
			}
		}
		else
		{
		    DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
  			SendClientMessageEx(playerid, COLOR_GREEN, "You have successfully detached a vehicle from the tow truck.");
		}
		return 1;
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
}

CMD:impound(playerid, params[])
{
	if(IsACop(playerid))
	{
	    if(!IsPlayerInRangeOfPoint(playerid, 6.0, LOCATION_IMPOUND)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the car storage warehouse to use this command.");
		else if(!IsPlayerInAnyVehicle(playerid) || GetVehicleModel(GetPlayerVehicleID(playerid)) != 525) return SendClientMessageEx(playerid, COLOR_GREY, "You must be inside a tow truck to use this command.");
		else if(!IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid))) return SendClientMessageEx(playerid, COLOR_GREY, "You must be towing a car to use this command.");
		new
			trailer = GetVehicleTrailer(GetPlayerVehicleID(playerid)),
			string[128];
		if(trailer == 0)
			return 1;
		foreach(new i: Player)
		{
		    for(new v=0; v < MAX_PLAYEROWNED_VEHICLES; v++)
		    {
		        if(PlayerVehicleInfo[i][v][pvHandleId] == trailer) {
					format(string, sizeof(string), "DMV: %s has impounded %s's %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(i), GetVehicleName(PlayerVehicleInfo[i][v][pvHandleId]));
			        PoliceAlert(string);
		    		format(string, sizeof(string), "Your %s has been impounded, you must pay a visit to the DMV to have it released.", GetVehicleName(PlayerVehicleInfo[i][v][pvHandleId]));
		    		SendClientMessageEx(i, COLOR_WHITE, string);
		            PlayerVehicleInfo[i][v][pvImpounded] = 1;
	    	        VehicleInfo[PlayerVehicleInfo[i][v][pvHandleId]][vLocked] = 0;
	    	    	DestroyVehicle(PlayerVehicleInfo[i][v][pvHandleId]);
	    	    	PlayerVehicleInfo[i][v][pvHandleId] = 0;
		    		MySQL_Save_Player_Vehicle(i, v);
		            return 1;
		        }
		    }
		}
		DetachTrailerFromVehicle(trailer);
		SetVehicleToRespawn(trailer);
		SendClientMessageEx(playerid, COLOR_WHITE, "Non-player owned vehicles cannot be stored inside the impound, it has been respawned.");
		return 1;
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
}

CMD:vticket(playerid, params[])
{
    if(IsACop(playerid))
    {
		new
			closestcar = GetClosestCar(playerid),
			amount;
	    if(sscanf(params, "i", amount)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /vticket [amount]");
  		else if(closestcar == INVALID_VEHICLE_ID) return SendClientMessageEx(playerid, COLOR_FADE1, "You're not close enough to any vehicle.");
		else if(amount < 1 || amount > 250) return SendClientMessageEx(playerid, COLOR_GREY, "The ticket cannot cost less than $1 or more than $250.");
		foreach(new i: Player)
		{
		    for(new v=0; v < MAX_PLAYEROWNED_VEHICLES; v++)
		    {
		        if(PlayerVehicleInfo[i][v][pvHandleId] == closestcar) {
		            if(PlayerVehicleInfo[i][v][pvTicketPrice] < 1000) {
		                PlayerVehicleInfo[i][v][pvTicketPrice] += amount;
		    			MySQL_Save_Player_Vehicle(i, v);
						SendClientMessageEx(playerid, COLOR_GREEN, "You have successfully issued the ticket to the specified vehicle.");
		            } else {
						SendClientMessageEx(playerid, COLOR_FADE1, "This vehicle has exceeded the ticket limit ($1000) you cannot place anymore tickets on it.");
		            }
              		return 1;
		        }
			}
		}
		SendClientMessageEx(playerid, COLOR_FADE1, "You're not close enough to any vehicle.");
        return 1;
    }
	else return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
}

CMD:vcheck(playerid, params[])
{
    if(IsACop(playerid) || IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
		new
			closestcar = GetClosestCar(playerid),
			string[256];
  		if(closestcar == INVALID_VEHICLE_ID) return SendClientMessageEx(playerid, COLOR_FADE1, "You're not close enough to any vehicle.");
		foreach(new i: Player)
		{
		    for(new v=0; v < MAX_PLAYEROWNED_VEHICLES; v++)
		    {
		        if(PlayerVehicleInfo[i][v][pvHandleId] == closestcar) {
		            format(string, sizeof(string), "Vehicle Status:{FFFFFF} Model: %s, Number Plate: %d, Registrant: %s, Tickets: $%d", VehicleNames[PlayerVehicleInfo[i][v][pvModelId] - 400], PlayerVehicleInfo[i][v][pvHandleId], GetPlayerNameEx(i), PlayerVehicleInfo[i][v][pvTicketPrice]);
					SendClientMessageEx(playerid, COLOR_GREEN, string);
              		return 1;
		        }
			}
		}
		SendClientMessageEx(playerid, COLOR_FADE1, "This vehicle appears to show up unregistered in the database (it may be a faction/job vehicle).");
        return 1;
    }
	else return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
 }

CMD:ticket(playerid, params[])
{
    if(IsACop(playerid))
    {
	    new
			targetid,
			amount,
			reason[16],
			string[128];
	    if(sscanf(params, "uis[16]", targetid, amount, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /ticket [playerid] [amount] [reason]");
	    else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(targetid == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
		else if(!IsPlayerInRangeOfPlayer(playerid, targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the specified player to use this command.");
		else if(amount < 1 || amount > 400) return SendClientMessageEx(playerid, COLOR_GREY, "The ticket cannot cost less than $1 or more than $400.");
		SetPVarInt(playerid, "TicketPlayer", targetid);
		SetPVarInt(targetid, "TicketAmount", amount);
		SetPVarInt(targetid, "TicketOfficer", playerid);
		format(string, sizeof(string), "* (ID: %i) %s wants you to pay for a ticket of $%d, reason: %s. (/accept ticket)", playerid, GetPlayerNameEx(playerid), amount, reason);
		SendClientMessageEx(targetid, 0x33CCFFAA, string);
		format(string, sizeof(string), "* You have given (ID: %i) %s a ticket of $%d for %s.", targetid, GetPlayerNameEx(targetid), amount, reason);
		SendClientMessageEx(playerid, 0x33CCFFAA, string);
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	}
	return 1;
}

CMD:quitfaction(playerid, params[])
{
	if(PlayerInfo[playerid][pFaction] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You are not in a faction.");
	DeletePVar(playerid, "FactionID");
	DeletePVar(playerid, "FactionInvitation");
	DeletePVar(GetPVarInt(playerid, "FactionInvitation"), "InvitedPlayer");
	SendClientMessageEx(playerid, COLOR_WHITE, "You have left your current faction, any faction weapons have been removed from your inventory.");
 	PlayerInfo[playerid][pFaction] = 0;
 	PlayerInfo[playerid][pLeadership] = 0;
  	PlayerInfo[playerid][pRank] = 0;
	PlayerInfo[playerid][pDuty] = 0;
	SetPlayerToTeamColor(playerid);
   	return 1;
}

CMD:stats(playerid, params[])
{
    ShowPlayerStats(playerid, playerid);
   	return 1;
}

CMD:check(playerid, params[])
{
	new targetid;
	if(!IsAdmin(playerid, ADMIN_LEVEL_TWO)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	else if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /check [playerid]");
	else if(!IsPlayerConnectedEx(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	ShowPlayerStats(playerid, targetid);
	return 1;
}

stock ShowPlayerStats(playerid, targetid)
{
	new string[256];
	SendClientMessageEx(playerid, COLOR_ORANGE, "-----------------------------------------------------------------------------------------------------");
	format(string, sizeof(string), "ID: %d | Name: %s | Level: %i | Age: %i |  Gender: %s | Referrer: %s", PlayerInfo[targetid][pId], GetPlayerNameEx(targetid), PlayerInfo[targetid][pLevel], PlayerInfo[targetid][pAge], GetPlayerGender(targetid), GetPlayerReferer(targetid));
	SendClientMessageEx(playerid, COLOR_FADE1, string);
	format(string, sizeof(string), "Playing Hours: %i | Experience: %i/%d | Number: %i | Channel :%i ", PlayerInfo[targetid][pPlayingHours], PlayerInfo[targetid][pExperience], (PlayerInfo[targetid][pLevel] + 1) * 5, PlayerInfo[targetid][pPhoneNumber], PlayerInfo[targetid][pChannel]);
	SendClientMessageEx(playerid, COLOR_FADE1, string);
	format(string, sizeof(string), "Total Wealth: $%i | Money: $%i | Bank Balance: $%i | Paycheck: %i", (PlayerInfo[targetid][pMoney] + PlayerInfo[targetid][pBankBalance]), PlayerInfo[targetid][pMoney], PlayerInfo[targetid][pBankBalance], PlayerInfo[targetid][pPaycheck]);
	SendClientMessageEx(playerid, COLOR_FADE1, string);
	format(string, sizeof(string), "Faction: %s | Rank: (%s [%d]) | Division: %s | Job: %s ", GetFactionName(PlayerInfo[targetid][pFaction]), GetRankName(targetid), PlayerInfo[targetid][pRank], GetPlayerDivision(playerid), GetPlayerJob(targetid));
	SendClientMessageEx(playerid, COLOR_FADE1, string);
	SendClientMessageEx(playerid, COLOR_ORANGE, "-----------------------------------------------------------------------------------------------------");
}

CMD:inv(playerid, params[]) return cmd_inventory(playerid, params);
CMD:inventory(playerid, params[])
{
	new string[128];
	SendClientMessageEx(playerid, COLOR_ORANGE, "-------------------------");
	SendClientMessageEx(playerid, COLOR_ORANGE, "Listing items in your inventory:");
	format(string, sizeof(string), "{F69521}[Marijuana]:{FFFFFF} %d grams {F69521}[Seeds]:{FFFFFF} %d seeds", PlayerInfo[playerid][pWeed], PlayerInfo[playerid][pSeeds]);
	SendClientMessageEx(playerid, COLOR_GREY, string);
	format(string, sizeof(string), "{F69521}[Gas Cans]:{FFFFFF} %d {F69521}[Spraycans]:{FFFFFF} %d {F69521}[Bombs]:{FFFFFF} %d", PlayerInfo[playerid][pGasCans], PlayerInfo[playerid][pSprayCan], PlayerInfo[playerid][pBombs]);
	SendClientMessageEx(playerid, COLOR_GREY, string);
	SendClientMessageEx(playerid, COLOR_ORANGE, "-------------------------");
	return 1;
}

CMD:taser(playerid, params[])
{
    if(IsACop(playerid))
    {
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command if you are inside a vehicle.");
		else if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command at this time.");

		new
			string[128];

        if(GetPVarInt(playerid, "TaserEquipped"))
        {
            ResetPlayerWeapons(playerid);
			ReloadPlayerWeapons(playerid);
			DeletePVar(playerid, "TaserEquipped");
			format(string, sizeof(string), "* %s holsters their tazer.", GetPlayerNameEx(playerid));
		}
		else
		{
			format(string, sizeof(string), "* %s unholsters their tazer.", GetPlayerNameEx(playerid));
			SetPVarInt(playerid, "TaserEquipped", 1);
			ReloadPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 23, 99999);
	    }
		ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    }
    else
    {
       	SendClientMessageEx(playerid, COLOR_GREY, "You are not part of a Law Enforcement Organisation.");
    }
	return 1;
}

CMD:tazer(playerid, params[])
{
	return cmd_taser(playerid, params);
}

CMD:rentcar(playerid, params[])
{
	new veh = GetPlayerVehicleID(playerid);
	if(!IsARentableVehicle(veh)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be inside a rentable vehicle to use this command.");
	else if(GetPVarInt(playerid, "RentingCar") != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You are already renting a vehicle, you cannot rent another one.");
	else if(WhoRentsVehicle(veh) != INVALID_PLAYER_ID) return SendClientMessageEx(playerid, COLOR_GREY, "Somebody is currently already renting this vehicle, you cannot use this command.");
	else if(PlayerInfo[playerid][pMoney] < 100) return SendClientMessageEx(playerid, COLOR_GREY, "You must have at least $100 to rent a vehicle.");
	GivePlayerCash(playerid, -100);
	AddVaultMoney(2, 100);
	SetPVarInt(playerid, "RentingCar", veh);
	GetVehicleParamsEx(veh, VehicleInfo[veh][vEngine], VehicleInfo[veh][vLights], VehicleInfo[veh][vAlarm], VehicleInfo[veh][vDoors], VehicleInfo[veh][vBonnet], VehicleInfo[veh][vBoot], VehicleInfo[veh][vObjective]);
	VehicleInfo[veh][vEngine] = 1; VehicleInfo[veh][vLocked] = 0;
	SetVehicleParamsEx(veh, VehicleInfo[veh][vEngine], VehicleInfo[veh][vLights], VehicleInfo[veh][vAlarm], VehicleInfo[veh][vDoors], VehicleInfo[veh][vBonnet], VehicleInfo[veh][vBoot], VehicleInfo[veh][vObjective]);
   	SendClientMessageEx(playerid, COLOR_ORANGE, "RENT:{FFFFFF} You have rented this vehicle for until you disconnect, type /help for more information.");
	return 1;
}



CMD:heal(playerid, params[])
{
    if(IsAMedic(playerid))
    {
		new string[128], targetid;
		if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /heal <playerid>");
		else if(PlayerInfo[playerid][pDuty] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You must be on duty to use this command.");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(!IsPlayerInRangeOfPlayer(playerid, targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the specified player to use this command.");
		else if(playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
		else if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command at this time.");
		if(PlayerInfo[targetid][pHealth] >= 100) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player doesn't require a does of morphine at this time.");
		SetPlayerHealthEx(targetid, 100);
		GivePlayerCash(targetid, -100);
		AddVaultMoney(3, 100);
		SendClientMessageEx(targetid, COLOR_LIGHTBLUE, "You have been charged $100 for the dosage of morphine.");
		format(string, sizeof(string), "* %s has given %s an injection of morphine.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
		ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    }
    else SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	return 1;
}


CMD:getpt(playerid, params[])
{
	new
	    string[128];
	if(!IsAMedic(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	else if(sscanf(params, "{u}")) {
	 	return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /getpt <playerid>");
	}
	else if(!IsPlayerConnectedEx(strval(params))) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	else if(PlayerInfo[playerid][pDuty] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You must be on duty to use this command.");
	else if(strval(params) == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
	else if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this at this time.");
	else if(PlayerInfo[strval(params)][pWounded] != PLAYER_WOUNDED) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player does not require any medical assistance.");

	format(string, sizeof(string), "* You have accepted the call from %s", GetPlayerNameEx(strval(params)));
    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "* Medic %s has accepted your call please wait at your current Position.", GetPlayerNameEx(playerid));
    SendClientMessageEx(strval(params), COLOR_LIGHTBLUE, string);
    SetPVarInt(playerid, "MedicCall", strval(params) + 1);
    SetPVarInt(strval(params), "MedicId", playerid + 1);
	return 1;
}

CMD:loadpt(playerid, params[])
{
    if(IsAMedic(playerid))
    {
		new string[128], targetid, seatid;
		if(sscanf(params, "ui", targetid, seatid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /loadpt <playerid> <seat 1-3>");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
		else if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command at this time.");
		else if(seatid < 1 || seatid > 3) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /loadpt <playerid> <seat 1-4>");
		else if(IsPlayerInAnyVehicle(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "The specified is already inside a vehicle.");
		else if(!IsPlayerInRangeOfPlayer(playerid, targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the specified player to use this command.");
		else if(!IsAMedicCar(gLastCar[playerid])) return SendClientMessageEx(playerid, COLOR_GREY, "Your last vehicle cannot be used because it is not an ambulance.");
		else if(PlayerInfo[targetid][pWounded] != PLAYER_WOUNDED) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player does not require any medical assistance.");
		SetPlayerVirtualWorldEx(targetid, GetVehicleVirtualWorld(gLastCar[playerid]));
		SetPlayerInteriorEx(targetid, 0);
		ClearAnimations(targetid);
		PutPlayerInVehicle(targetid, gLastCar[playerid], seatid);
		TogglePlayerControllable(targetid, false);
		format(string, sizeof(string), "* %s loads %s into the ambulance.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
		ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    }
    else SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	return 1;
}

CMD:deliverpt(playerid, params[])
{
    if(IsAMedic(playerid))
    {
        new
			targetid,
			string[128];
		if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /deliverpt <playerid>");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
		else if(GetPlayerVehicleID(targetid) != GetPlayerVehicleID(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "The specified person is not inside your vehicle.");
		else if(PlayerInfo[targetid][pWounded] != PLAYER_WOUNDED) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player does not require any medical assistance.");
		else if(IsNearDeliveryPoint(playerid) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You must be at a delivery point to use this command.");

		PlayerInfo[targetid][pWounded] = PLAYER_ALIVE;
	    DeleteHospitalVars(targetid);
		SetPlayerHealthEx(targetid, 100);
	    if(IsNearDeliveryPoint(playerid))
	    {
			SetPlayerPosEx(targetid, LOCATION_HOSPITAL);
			SetPlayerFacingAngle(targetid, 0.0);
		}
		TogglePlayerControllable(targetid, true);
		ClearAnimations(targetid, 1);
		SendClientMessageEx(targetid, COLOR_LIGHTRED, "HOSPITAL: Your medical bill comes to $500, have a nice day.");
		GivePlayerCash(targetid, -500);
		AddVaultMoney(3, 500);
		format(string, sizeof(string), "EMS Driver %s has successfully delivered patient %s to the hospital.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
		SendFactionMessage(3, TEAM_COLOR_LSFD, string);
    }
    else SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	return 1;
}

stock IsNearDeliveryPoint(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 6.0, LOCATION_DELIVERPT)) return 1;
	return 0;
}

public ProcessEMSQueue()
{
	foreach(new i: Player)
	{
		if(GetPVarInt(i, "gPlayerLogged") == 0 || PlayerInfo[i][pWounded] == PLAYER_ALIVE || GetPlayerState(i) == PLAYER_STATE_WASTED) continue;
		//Fail-Safe
		new animlib[32]; new animname[32];
        GetAnimationName(GetPlayerAnimationIndex(i),animlib,32,animname,32);
        if((strcmp(animlib, "WUZI", true) || strcmp(animname, "CS_DEAD_GUY", true)) && !IsPlayerInAnyVehicle(i)) ApplyAnimation(i, "WUZI", "CS_DEAD_GUY", 4.0, 0, 1, 1, 1, 0, 0);
        new string[128];
        if(PlayerInfo[i][pWounded] == PLAYER_WOUNDED)
        {
        	GameTextForPlayer(i, "~r~WOUNDED", 2000, 3);
        	format(string, sizeof(string), "* %s would be brutally wounded.", GetPlayerNameEx(i));
 			SetPlayerChatBubble(i, string, COLOR_HOTPINK, 20.0, 2000);
 		}
 		else if(PlayerInfo[i][pWounded] == PLAYER_DEAD)
 		{
          	GameTextForPlayer(i, "~r~DEAD", 2000, 3);
        	format(string, sizeof(string), "* %s is now dead.", GetPlayerNameEx(i));
 			SetPlayerChatBubble(i, string, COLOR_RED, 20.0, 2000);
 		}
		new medic = GetPVarInt(i, "MedicId");
		if(medic != 0 && (GetPVarInt(medic - 1, "MedicCall") - 1) == i)
		{
			GetPlayerPos(i, PlayerInfo[i][pPositionX], PlayerInfo[i][pPositionY], PlayerInfo[i][pPositionZ]);
			SetPlayerCheckpoint(medic - 1, PlayerInfo[i][pPositionX], PlayerInfo[i][pPositionY], PlayerInfo[i][pPositionZ], 5.0);
			SetPVarInt(medic - 1, "EMSCheckpoint", 1);
		}
	}
	return 1;
}

stock GivePlayerDeath(playerid)
{
	if(!IsPlayerConnectedEx(playerid)) return 0;
	if(PlayerInfo[playerid][pJailTime] > 0)
	{
    	DeleteHospitalVars(playerid);
		PlayerInfo[playerid][pWounded] = PLAYER_ALIVE;
		SetPlayerHealthEx(playerid, 100);
		ClearAnimations(playerid);

	    //if(GetPVarType(playerid, "SafeMode") == 1) DeletePVar(playerid, "SafeMode");
		new jailPos = random(3) + (PlayerInfo[playerid][pOocJail] == 1 ? 3 : 0);
		SetPlayerHealthEx(playerid, 100);
		SetPlayerPosEx(playerid, JailPositions[jailPos][0], JailPositions[jailPos][1], JailPositions[jailPos][2]);
		SetPlayerFacingAngle(playerid, PlayerInfo[playerid][pOocJail] == 1 ? 180 : 0);
		SetPlayerInteriorEx(playerid, 1);
		SetPlayerVirtualWorldEx(playerid, 777);

		PlayerTextDrawShow(playerid, JailTimerTD[playerid]);
		SendClientMessageEx(playerid, COLOR_WHITE, "SERVER: Incomplete sentance! You have been teleported to jail.");
		ResetPlayerWeapons(playerid);
		for(new i=0; i < 12; i++) PlayerInfo[playerid][pWeapons][i] = 0;
		TogglePlayerControllable(playerid, false);
		SetPVarInt(playerid, "ActionRestriction", 1);
		TextDrawShowForPlayer(playerid, LoadingObjectTextDraw);
		TextDrawShowForPlayer(playerid, LoadingObjectBox);
		SetTimerEx("HideLoadingTextdraws", 4000, false, "i", playerid);
		SetPlayerSkin(playerid, 50);
		return 1;
	}
//	CreateCorpse(playerid);
	DeleteHospitalVars(playerid);
	SendToHospital(playerid);
	return 1;
}
/* - Under work
enum eCorpseData
{
	cHandleId,
	cBagHandleId
}
new CorpseInfo[10][eCorpseData];
stock CreateCorpse(playerid)
{
	if(!IsPlayerConnectedEx(LastKiller[playerid]) || LastKiller[playerid] == playerid) return 0;
	new string[128], Float:cPosX, Float: cPosY, Float: cPosZ;
	GetPlayerPos(playerid, cPosX, cPosY, cPosZ); cPosZ-=0.8;
    CorpseInfo[1][cHandleId] = CreateDynamicObject(3092, cPosX, cPosY, , -90, 0, 0);
	format(string, sizeof(string),"Blood stains from the corpse of %s\n(( Killed by: %s ))", GetPlayerNameEx(playerid), GetPlayerNameEx(LastKiller[playerid]));
	CreateDynamic3DTextLabel(string, COLOR_LIGHTRED, cPosX, cPosY, cPosZ-1, 15.0);
	return 1;
}
stock BagCorpse(id)
{
	new string[128],
    CorpseInfo[id][cBagHandleId] = CreateDynamicObject(2919, CorpseInfo[id][cPosX], CorpseInfo[id][cPosY], CorpseInfo[id][cPosZ], 0, 0, 0);
    DestroyDynamicObject(CorpseInfo[id][cHandleId]); CorpseInfo[id][cHandleId] = 0;
	return 1;
}

*/
stock DeleteHospitalVars(playerid)
{
	if(GetPVarInt(playerid, "MedicId") > 0)
	{
		DeletePVar(GetPVarInt(playerid, "MedicId"), "MedicCall");
    	DeletePVar(playerid, "MedicId");
    }
	PlayerInfo[playerid][pWounded] = PLAYER_ALIVE;
}

stock SendToHospital(playerid)
{
	SetPlayerHealthEx(playerid, 100);
	SetPlayerArmourEx(playerid, 0);
	SetPlayerArmedWeapon(playerid, 0);
	for(new i=0; i < 12; i++) PlayerInfo[playerid][pWeapons][i] = 0;
	PlayerInfo[playerid][pDuty] = 0;
	SendClientMessageEx(playerid, COLOR_WHITE, "You gave up hope and fell unconscious, you were immediately sent to the hospital.");
	SendClientMessageEx(playerid, COLOR_WHITE, "HINT: Please wait 15 seconds to complete the recovery process and get out of the hospital.");
	SetPlayerHealthEx(playerid, 100);
	SetPlayerPosEx(playerid, -1500.0, 2550.0, 30.0);
	SetPlayerCameraPos(playerid, 1561.2405,1801.9637,37.6936);
	SetPlayerCameraLookAt(playerid, LOCATION_HOSPITAL);
	SetPlayerFacingAngle(playerid, 270.0);
	SetPlayerInteriorEx(playerid, 0);
	SetPlayerVirtualWorldEx(playerid, 0);
	TogglePlayerControllable(playerid, false);
	SetPlayerToTeamColor(playerid);
	SetTimerEx("HospitalTimer", 15000, false, "i", playerid);
	return 1;
}

CMD:backup(playerid, params[])
{
	if(IsACop(playerid))
	{
	    if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this at this time.");
	    new
	        string[128];
	    if(GetPVarInt(playerid, "BackupRequested") == 1)
	    {
		    format(string, sizeof(string), "** %s no longer requires backup.", GetPlayerNameEx(playerid));
		    SendFactionMessage(1, COLOR_LIGHTBLUE, string);
		    SendFactionMessage(2, COLOR_LIGHTBLUE, string);
			DeletePVar(playerid, "BackupRequested");
	    }
	    else
	    {
		    format(string, sizeof(string), "** %s requires backup at Location: %s.", GetPlayerNameEx(playerid), GetPlayerZone(playerid));
		    SendFactionMessage(1, COLOR_LIGHTBLUE, string);
		    SendFactionMessage(2, COLOR_LIGHTBLUE, string);
		    SetPVarInt(playerid, "BackupRequested", 1);
			foreach (new i: Player)
			{
				SetPlayerMarkerForPlayer( i, playerid, 0xFF0000FF);
			}
			format(string, sizeof(string), "* %s requests backup over their radio.", GetPlayerNameEx(playerid));
			ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		    BackupTimerEx[playerid] = SetTimerEx("BackupTimer", 5000, true, "i", playerid);
	    }
	}
	return 1;
}

public BackupTimer(playerid)
{
	if(GetPVarInt(playerid, "BackupRequested") == 0) {
	    if(IsPlayerConnectedEx(playerid)) {
			foreach (new i: Player) {
				SetPlayerMarkerForPlayer( i, playerid, 0xFFFFFFFF); // TODO: Change to invisible color
			}
		}
		KillTimer(BackupTimerEx[playerid]);
	} else {
		foreach (new i: Player) {
			SetPlayerMarkerForPlayer( i, playerid, 0xFF0000FF);
		}
	}
}

CMD:cuff(playerid, params[])
{
    if(IsACop(playerid))
    {
		new ChatString[128], targetid;
		if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /cuff <playerid>");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this at this time.");
		else if(!IsPlayerInRangeOfPlayer(playerid, targetid, 3.0) || GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the player to use this command.");
		else if(playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
		else if(GetPVarInt(targetid, "IsRestrained") == 0 && GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_HANDSUP) return SendClientMessageEx(playerid, COLOR_GREY, "Suspect is not restrained.");
		else if(GetPVarInt(targetid, "IsCuffed") == 1) return SendClientMessageEx(playerid, COLOR_GREY, "Suspect is already cuffed.");
		SetPVarInt(targetid, "IsCuffed", 1);
		SetPVarInt(targetid, "ActionRestriction", 1);
		//TogglePlayerControllable(targetid, false);
		SetPlayerSpecialAction(targetid, SPECIAL_ACTION_CUFFED);
		format(ChatString, sizeof(ChatString), "* %s withdraws a pair of cuffs, cuffing %s tightly.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
		ProxDetector(20.0, playerid, ChatString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    }
    else
    {
       	SendClientMessageEx(playerid, COLOR_GREY, "You are not part of a Law Enforcement Organisation.");
    }
	return 1;
}

CMD:buylicense(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 6.0, LOCATION_DMV))
	{
	    if(PlayerInfo[playerid][pMoney] < 100) return SendClientMessageEx(playerid, COLOR_GREY, "A minimum amount of 100 dollars is required to participate in the driving test.");
		ShowPlayerDialogEx(playerid, 2011, DIALOG_STYLE_LIST, "Written Exam","What should you do when you are driving at night?\r\n1) Make sure you are driving slow enough incase of an emergency.\r\n2) Roll down your window so that the fresh air will help keep you awake.\r\n3) If you are sleepy, drink coffee or other caffeine products.","Answer", "Cancel");
	}
	else
	{
	    return SendClientMessageEx(playerid, COLOR_GREY, "You are not in range of the DMV.");
	}
	return 1;
}

CMD:showlicenses(playerid, params[])
{
	new targetid, string[128];
	if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /showlicenses <playerid>");
	else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	else if(!IsPlayerInRangeOfPlayer(playerid, targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the specified player to use this command.");

	SendClientMessageEx(targetid, COLOR_ORANGE, "----------------------------------------");
	SendClientMessageEx(targetid, COLOR_WHITE, "Government of "SERVER_MAP" - Registered Licenses");
	format(string, sizeof(string), "Name: %s", GetPlayerNameEx(playerid));
	SendClientMessageEx(targetid, COLOR_WHITE, string);
	SendClientMessageEx(targetid, COLOR_WHITE, (PlayerInfo[playerid][pDriverLicense] == 1) ? ("Drivers License: {00FF00}Registered") : ("Drivers License: {AA3333}Unregistered"));
	SendClientMessageEx(targetid, COLOR_WHITE, (PlayerInfo[playerid][pGunLicense] == 1) ? ("Gun License: {00FF00}Registered") : ("Gun License: {AA3333}Unregistered"));
	SendClientMessageEx(targetid, COLOR_ORANGE, "----------------------------------------");
	format(string, sizeof(string), "You have shown your licenses to %s.", GetPlayerNameEx(targetid));
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	return 1;
}

CMD:sl(playerid, params[])
{
	return cmd_showlicenses(playerid, params);
}

CMD:detain(playerid, params[])
{
    if(IsACop(playerid))
    {
		new ChatString[128], targetid, seatid;
		if(sscanf(params, "ui", targetid, seatid)) {
		 	return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /detain <playerid> <seat 1-3>");
		}
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
		else if(GetPVarInt(targetid, "IsCuffed") == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Suspect is not cuffed.");
		else if(!IsPlayerInRangeOfPlayer(playerid, targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the specified player to use this command.");
		else if(seatid < 1 || seatid > 3) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /detain <playerid> <seat 1-3>");
		else if(IsPlayerInAnyVehicle(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Suspect is already inside a vehicle.");
		else if(gLastCar[playerid] == INVALID_VEHICLE_ID || !IsValidVehicle(gLastCar[playerid])) return SendClientMessageEx(playerid, COLOR_GREY, "Your last entered vehicle does not exist, please find another one.");
		SetPlayerInteriorEx(targetid, 0);
		PutPlayerInVehicle(targetid, gLastCar[playerid], seatid);
		format(ChatString, sizeof(ChatString), "* %s drags the suspect to the vehicle, opening then door then placing him inside the cruiser.", GetPlayerNameEx(playerid));
		ProxDetector(20.0, playerid, ChatString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    }
    else
    {
       	SendClientMessageEx(playerid, COLOR_GREY, "You are not part of a Law Enforcement Organisation.");
    }
	return 1;
}

CMD:arrest(playerid, params[])
{
    if(IsACop(playerid))
    {
		new string[256], targetid, arrestprice, arrestminutes;
		if(sscanf(params, "uii", targetid, arrestprice, arrestminutes)) {
		 	return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /arrest <playerid> <price> <minutes>");
		}
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(arrestprice > 10000) return SendClientMessageEx(playerid, COLOR_GREY, "The price can only be lower than $10,000.");
		else if(arrestminutes < 1 || arrestminutes > 360) return SendClientMessageEx(playerid, COLOR_GREY, "The jail minutes can only be between 1 - 360.");
		else if(playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
		else if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not inside a vehicle.");
		else if(GetPlayerVehicleID(targetid) != GetPlayerVehicleID(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Suspect is not inside your vehicle.");
		else if(IsACop(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on other LEOs.");
		else if(GetPVarInt(targetid, "IsCuffed") == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Suspect is not cuffed.");
		else if(PlayerInfo[targetid][pWantedLevel] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot arrest innocent civillians, the suspect has no wanted status.");
		else if(!IsPlayerInRangeOfPoint(playerid, 5.0, LOCATION_ARREST)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not in range an arrest point.");
		else if(PlayerInfo[targetid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on prisoners.");

		format(string, sizeof(string), "[IGTV-NEWS] Criminal %s was sent to jail for %d minutes by %s.", GetPlayerNameEx(targetid), arrestminutes, GetPlayerNameEx(playerid));
		AdminAlert(string, ALERT_GLOBAL);

		if(PlayerInfo[targetid][pGunLicense] == 1)
		{
		    PlayerInfo[targetid][pGunLicense] = 0;
			SendClientMessageEx(targetid, COLOR_WHITE, "Your gun license has been revoked, due to the Government  banning convicts to possess them.");
		}

		SetPlayerSpecialAction(targetid, SPECIAL_ACTION_NONE);
		DeletePVar(targetid, "IsCuffed");
		DeletePVar(targetid, "IsRestrained");
		PlayerInfo[targetid][pWantedLevel] = 0;
		PlayerInfo[targetid][pMoney] -= arrestprice;
		PlayerInfo[targetid][pJailTime] = arrestminutes * 60;
		PlayerInfo[targetid][pOocJail] = 0;
		SetPlayerWantedLevel(targetid, 0);
		ResetPlayerWeapons(targetid);
		AddVaultMoney(2, arrestprice);

		new jailPos = random(3);
		SetPlayerPosEx(targetid, JailPositions[jailPos][0], JailPositions[jailPos][1], JailPositions[jailPos][2]);
		SetPlayerFacingAngle(playerid, 0);
		SetPlayerInteriorEx(targetid, 1);
		SetPlayerVirtualWorldEx(targetid, 777);

		PlayerTextDrawShow(targetid, JailTimerTD[targetid]);
		format(string, sizeof(string), "You have been arrested by %s (Wanted Level: %i), and fined %i.", GetPlayerNameEx(playerid), PlayerInfo[targetid][pWantedLevel], arrestprice);
		SendClientMessageEx(targetid, COLOR_WHITE, string);

		for(new i=0; i < 12; i++)
		{
			PlayerInfo[targetid][pWeapons][i] = 0;
		}

		TogglePlayerControllable(targetid, false);
		SetPVarInt(targetid, "ActionRestriction", 1);
		TextDrawShowForPlayer(targetid, LoadingObjectTextDraw);
		TextDrawShowForPlayer(targetid, LoadingObjectBox);
		SetTimerEx("HideLoadingTextdraws", 4000, false, "i", targetid);
    }
    else
    {
       	SendClientMessageEx(playerid, COLOR_GREY, "You are not employed by a Law Enforcement Organisation.");
    }
	return 1;
}

CMD:su(playerid, params[])
{
    if(IsACop(playerid))
    {
		new string[256], targetid, crime[64];
		if(sscanf(params, "us[64]", targetid, crime)) {
		 	return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /su <playerid> <crime>");
		}
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
		else if(IsACop(targetid) || IsAGov(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on LEOs.");
		else if(PlayerInfo[targetid][pWantedLevel] >= 6) return SendClientMessageEx(playerid, COLOR_GREY, "Suspect is most wanted, you cannot extend his wanted level any further.");

		PlayerInfo[targetid][pWantedLevel]++;
		SetPlayerWantedLevel(targetid, PlayerInfo[targetid][pWantedLevel]);

		format(string, sizeof(string), "%s charged you for %s,", GetPlayerNameEx(playerid), crime);
		SendClientMessageEx(targetid, COLOR_YELLOW, string);

        PoliceAlert("----------------------------------------");
		format(string, sizeof(string), "DISPATCH: All Units APB: Reporter: %s", GetPlayerNameEx(playerid));
        PoliceAlert(string);
		format(string, sizeof(string), "DISPATCH: Crime: %s, Suspect: %s", crime, GetPlayerNameEx(targetid));
        PoliceAlert(string);
        PoliceAlert("----------------------------------------");
    }
    else
    {
       	SendClientMessageEx(playerid, COLOR_GREY, "You are not a part of a Law Enforcement Organization.");
    }
	return 1;
}

CMD:wanted(playerid, params[])
{
    if(IsACop(playerid))
    {
		new string[256];
  		SendClientMessageEx(playerid, COLOR_RED, "Wanted Criminals:");
		foreach(new i: Player)
		{
		    if(PlayerInfo[i][pWantedLevel] == 0) continue;
			format(string, sizeof(string), "Name: %s | Wanted Level: %d", GetPlayerNameEx(i), PlayerInfo[i][pWantedLevel]);
	       	SendClientMessageEx(playerid, COLOR_YELLOW, string);
		}
    }
    else SendClientMessageEx(playerid, COLOR_GREY, "You are not a part of a Law Enforcement Organization.");
	return 1;
}

CMD:clearcrimes(playerid, params[])
{
    if(IsACop(playerid) && PlayerInfo[playerid][pRank] >= 4)
    {
		new string[128], targetid;
		if(sscanf(params, "u", targetid)) {
		 	return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /clearcrimes <playerid>");
		}
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
		else if(IsACop(targetid) || IsAGov(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on LEOs.");
		else if(PlayerInfo[targetid][pWantedLevel] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The civillian has no wanted status on them.");

        PlayerInfo[targetid][pWantedLevel] = 0;
		SetPlayerWantedLevel(targetid, PlayerInfo[targetid][pWantedLevel]);

		format(string, sizeof(string), "DISPATCH: %s has cleared %s's wanted level.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
        PoliceAlert(string);
        format(string, sizeof(string), "Your wanted records have been cleared by %s.", GetPlayerNameEx(targetid));
		SendClientMessageEx(targetid, COLOR_YELLOW, string);
    }
    else
    {
       	SendClientMessageEx(playerid, COLOR_GREY, "You must be rank 2 in a law enforcement organization to use this command.");
    }
	return 1;
}

CMD:uncuff(playerid, params[])
{
    if(IsACop(playerid) || (IsAdmin(playerid, ADMIN_LEVEL_THREE)))
    {
		new ChatString[128], targetid;
		if(sscanf(params, "u", targetid)) {
		 	return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /uncuff <playerid>");
		}
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this at this time.");
		else if(!IsPlayerInRangeOfPlayer(playerid, targetid, 3.0) || GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the player to use this command.");
		else if(playerid == targetid && !IsAdmin(playerid, ADMIN_LEVEL_TWO)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
		else if(GetPVarInt(targetid, "IsCuffed") == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Suspect is not cuffed.");
		SetPlayerSpecialAction(targetid, SPECIAL_ACTION_NONE);
		DeletePVar(targetid, "IsCuffed");
		DeletePVar(targetid, "IsRestrained");
		DeletePVar(targetid, "ActionRestriction");
		ClearAnimations(targetid);
		TogglePlayerControllable(targetid, true);
		format(ChatString, sizeof(ChatString), "* %s withdraws a key, inserting it into the cuffs locks, unlocking it.", GetPlayerNameEx(playerid));
		ProxDetector(20.0, playerid, ChatString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    }
    else
    {
       	SendClientMessageEx(playerid, COLOR_GREY, "You are not part of a Law Enforcement Organisation.");
    }
	return 1;
}

CMD:locker(playerid, params[])
{
	if(!IsPlayerConnectedEx(playerid)) return 1;
    if(GetPVarInt(playerid, "TaserEquipped") == 1) return SendClientMessageEx(playerid, COLOR_GREY, "You must holster your tazer to use this command.");
    else if(!IsPlayerInRangeOfPoint(playerid, 5.0, FactionInfo[PlayerInfo[playerid][pFaction]][fLockerPosition][0], FactionInfo[PlayerInfo[playerid][pFaction]][fLockerPosition][1], FactionInfo[PlayerInfo[playerid][pFaction]][fLockerPosition][2])) return SendClientMessageEx(playerid, COLOR_GREY, "You must be at your faction locker to use this command.");
    switch(FactionInfo[PlayerInfo[playerid][pFaction]][fType])
    {
        case FACTION_TYPE_LEO:
		{
		    ShowPlayerDialogEx(playerid, DIALOG_LOCKER_MAIN, DIALOG_STYLE_LIST, "Faction Locker", "Duty\nEquipment\r\nUniform", "Select", "Cancel");
		}
        case FACTION_TYPE_GOV:
		{
		    ShowPlayerDialogEx(playerid, DIALOG_LOCKER_MAIN, DIALOG_STYLE_LIST, "Faction Locker", "Duty\r\nEquipment\r\nUniform", "Select", "Cancel");
		}
        case FACTION_TYPE_MEDIC:
		{
		    ShowPlayerDialogEx(playerid, DIALOG_LOCKER_MAIN, DIALOG_STYLE_LIST, "Faction Locker", "Duty\r\nEquipment\r\nUniform", "Select", "Cancel");
		}
        case FACTION_TYPE_NEWS:
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Your faction lockers aren't set up yet.");
		}
		default:
		{
			return SendClientMessageEx(playerid, COLOR_GREY, "Your faction safe doesn't offer you any items.");
		}
	}
	return 1;
}


CMD:m(playerid, params[])
{
    if(IsALegal(playerid) || IsAdmin(playerid, ADMIN_LEVEL_TWO))
    {
        new string[128];
    	format(string, sizeof(string), "(megaphone) %s: %s", GetPlayerNameEx(playerid), params);
		ProxDetector(60.0, playerid, string, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You do not have the authority to use a megaphone.");
	}
	return 1;
}

CMD:makehitman(playerid, params[])
{
	if(PlayerInfo[playerid][pHitman] >= 5 || IsAdmin(playerid, ADMIN_LEVEL_FIVE))
	{
		new string[128], targetid, rank, rankname[32];
	    if(sscanf(params, "ui", targetid, rank)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /makehitman <playerid> <rank>");
		else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(rank < 0 || rank > 6) return SendClientMessageEx(playerid, COLOR_GREY, "Ranks don't go below 0 or above 6.");
        if(rank == 1) format(rankname, sizeof(rankname), "Freelancer");
        else if(rank == 2) format(rankname, sizeof(rankname), "Marksman");
        else if(rank == 3) format(rankname, sizeof(rankname), "Agent");
        else if(rank == 4) format(rankname, sizeof(rankname), "Special Agent");
        else if(rank == 5) format(rankname, sizeof(rankname), "Vice Director");
        else if(rank == 6) format(rankname, sizeof(rankname), "Director");
        if(rank != 0)
		{
	    	format(string, sizeof(string), "You have been made a %s of the International Contract Agency by %s.", rankname, GetPlayerNameEx(playerid));
			SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
	    	format(string, sizeof(string), "You have made %s a %s of the International Contract Agency.", GetPlayerNameEx(targetid), rankname);
	    	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);

			format(string, sizeof(string), "[Invite]: %s has made %s as a %s of the International Contract Agency.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), rankname);
			Log("logs/hitman.log", string);
	    }
	    else
	    {
	    	format(string, sizeof(string), "You have been kicked out of the International Contract Agency by %s.", GetPlayerNameEx(playerid));
			SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
	    	format(string, sizeof(string), "You have kicked %s of the International Contract Agency.", GetPlayerNameEx(targetid));
	    	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);

			format(string, sizeof(string), "[Uninvite]: %s has kicked %s out of the International Contract Agency.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
			Log("logs/hitman.log", string);
	    }
	    PlayerInfo[targetid][pHitman] = rank;
    }
	return 1;
}



stock GetHitmanBombSlot(playerid)
{
	for (new i=0; i < MAX_HITMAN_BOMBS; i++)
	{
	    if(HitmanBombObject[playerid][i] == 0)
	    {
	        return i;
	    }
	}
	return INVALID_SLOT_ID;
}

stock RemoveHitmanBombs(playerid)
{
	if(GetPVarInt(playerid, "PCB") != 0)
	{
	    PlayerInfo[playerid][pBombs]++;
	}

	for (new i=0; i < MAX_HITMAN_BOMBS; i++)
	{
	    if(HitmanBombObject[playerid][i] != 0)
	    {
	        HitmanBombs[playerid][i][0] = 0;
	        HitmanBombs[playerid][i][1] = 0;
	        HitmanBombs[playerid][i][2] = 0;
	        DestroyDynamicObject(HitmanBombObject[playerid][i]);
	        HitmanBombObject[playerid][i] = 0;
			PlayerInfo[playerid][pBombs]++;
	    }
	}
}

CMD:pcb(playerid, params[]) return cmd_plantcarbomb(playerid, params);
CMD:plantcarbomb(playerid, params[])
{
	if(PlayerInfo[playerid][pHitman] > 0)
	{
	    new string[128], closestcar = GetClosestCar(playerid);
	    if(PlayerInfo[playerid][pBombs] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have any bombs to plant.");
		else if(closestcar == INVALID_VEHICLE_ID) return SendClientMessageEx(playerid, COLOR_FADE1, "You're not close enough to any vehicle.");
		else if(GetPVarInt(playerid, "PCB") != 0) return SendClientMessageEx(playerid, COLOR_FADE1, "You have already planted a bomb inside a car.");
		SetPVarInt(playerid, "PCB", closestcar + 1);
        PlayerInfo[playerid][pBombs]--;
		format(string, sizeof(string), "You have planted a car bomb, it will explode when target enters the vehicle. (%d remaining)", PlayerInfo[playerid][pBombs]);
		SendClientMessageEx(playerid, COLOR_GREEN, string);
	}
	return 1;
}


CMD:er(playerid, params[])
{
	new text[128], string[128], rankname[32];
	if(PlayerInfo[playerid][pHitman] == 1) format(rankname, sizeof(rankname), "Freelancer");
	else if(PlayerInfo[playerid][pHitman] == 2) format(rankname, sizeof(rankname), "Marksman");
	else if(PlayerInfo[playerid][pHitman] == 3) format(rankname, sizeof(rankname), "Agent");
	else if(PlayerInfo[playerid][pHitman] == 4) format(rankname, sizeof(rankname), "Special Agent");
	else if(PlayerInfo[playerid][pHitman] == 5) format(rankname, sizeof(rankname), "Vice Director");
	else if(PlayerInfo[playerid][pHitman] == 6) format(rankname, sizeof(rankname), "Director");
    else return SendClientMessageEx(playerid, COLOR_GREY, "You are not a hitman.");
	if(sscanf(params, "s[128]", text)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /er <text>");
	format(string, sizeof(string), "(radio) %s ", text);
	SetPlayerChatBubble(playerid, string, COLOR_WHITE, 20.0, 10000);
	format(string, sizeof(string), "** %s %s: %s **", rankname, GetPlayerNameEx(playerid), text);
	SendHitmanMessage(COLOR_GREY, string);
	return 1;
}

CMD:pb(playerid, params[]) return cmd_plantbomb(playerid, params);
CMD:plantbomb(playerid, params[])
{
	new i = GetHitmanBombSlot(playerid), string[128];
	if(i == INVALID_SLOT_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot plant anymore bombs.");
	else if(PlayerInfo[playerid][pBombs] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "You do not have any bombs to plant.");
	else if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this at this time.");
	GetPlayerPos(playerid, HitmanBombs[playerid][i][0], HitmanBombs[playerid][i][1], HitmanBombs[playerid][i][2]);
	HitmanBombObject[playerid][i] = CreateDynamicObject(1654, HitmanBombs[playerid][i][0], HitmanBombs[playerid][i][1], HitmanBombs[playerid][i][2] - 0.75, 0, 0, 0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
	format(string, sizeof(string), "{FF6347}AdmWarning:{FFFF00} %s has planted a bomb at %s.", GetPlayerNameEx(playerid), GetPlayerZone(playerid));
	AdminAlert(string, ALERT_ADMINS);
	PlayerInfo[playerid][pBombs]--;
	format(string, sizeof(string), "You have planted a bomb (%d remaining), press the FIRE key to detonate.", PlayerInfo[playerid][pBombs]);
	SendClientMessageEx(playerid, COLOR_GREEN, string);
	return 1;
}

CMD:pub(playerid, params[]) return cmd_pickupbomb(playerid, params);
CMD:pickupbomb(playerid, params[])
{
	if(GetPVarInt(playerid, "PCB") != 0)
	{
		new Float:tvPosition[3];
		GetVehiclePos(GetPVarInt(playerid, "PCB") - 1, tvPosition[0], tvPosition[1], tvPosition[2]);
		if(IsPlayerInRangeOfPoint(playerid, 6.0, tvPosition[0], tvPosition[1], tvPosition[2]))
		{
			PlayerInfo[playerid][pBombs]++;
			SendClientMessageEx(playerid, COLOR_GREEN, "You have successfully picked up your bomb.");
			DeletePVar(playerid, "PCB");
		}
  	}
  	else
  	{
		for (new i=0; i < MAX_HITMAN_BOMBS; i++)
		{
		    if(HitmanBombObject[playerid][i] != 0)
		    {
		        if(IsPlayerInRangeOfPoint(playerid, 2.5, HitmanBombs[playerid][i][0], HitmanBombs[playerid][i][1], HitmanBombs[playerid][i][2]))
		        {
					DestroyDynamicObject(HitmanBombObject[playerid][i]);
				    HitmanBombs[playerid][i][0] = 0; HitmanBombs[playerid][i][1] = 0; HitmanBombs[playerid][i][2] = 0;
				   	HitmanBombObject[playerid][i] = 0;
					PlayerInfo[playerid][pBombs]++;
					SendClientMessageEx(playerid, COLOR_GREEN, "You have successfully picked up your bomb.");
					break;
		        }
		    }
		}
	}
	return 1;
}

CMD:givemehit(playerid, params[])
{
   	if(!IsPlayerInRangeOfPoint(playerid, 2.5, LOCATION_MAILBOX)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not at the mailbox.");
	if(PlayerInfo[playerid][pHitman] >= 1)
	{
		new string[128], targetid;
	    if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /givemehit [contractid]");
	    else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(PlayerInfo[targetid][pContractPrice] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(HitmanTarget[playerid] != INVALID_PLAYER_ID) return SendClientMessageEx(playerid, COLOR_GREY, "You are already assigned to a contract.");
		format(string, sizeof(string), "* You have been assigned to the contract to kill %s, you will recieve $%d when completed.", GetPlayerNameEx(targetid), PlayerInfo[targetid][pContractPrice]);
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "%s has been assigned to the contract on %s, for $%d.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), PlayerInfo[targetid][pContractPrice]);
		SendHitmanMessage(COLOR_YELLOW, string);
		HitmanTarget[playerid] = targetid;
	}
	return 1;
}

CMD:contracts(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 2.5, LOCATION_MAILBOX)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not at the mailbox.");
	if(PlayerInfo[playerid][pHitman] >= 1)
	{
		new string[128], contracts;
	    SendClientMessageEx(playerid, COLOR_WHITE, "Available Contracts:");
	    foreach(Player, i)
	    {
			if(PlayerInfo[i][pContractPrice] > 0)
			{
				format(string, sizeof(string), "Name: %s (ID %d) | Price: $%d | Contracted By: %s | Reason: %s", GetPlayerNameEx(i), i, PlayerInfo[i][pContractPrice], PlayerInfo[i][pContractBy], PlayerInfo[i][pContractReason]);
				SendClientMessageEx(playerid, COLOR_GREY, string);
				contracts++;
			}
	    }
	    format(string, sizeof(string), "There are %d contracts available.", contracts);
	    SendClientMessageEx(playerid, COLOR_GREY, string);
    }
	return 1;
}

CMD:ranks(playerid, params[])
{
	if(PlayerInfo[playerid][pHitman] >= 1)
	{
		new string[156], rankname[32];
	    SendClientMessageEx(playerid, COLOR_WHITE, "Online Members:");
	    foreach(Player, i)
	    {
			if(PlayerInfo[i][pHitman] >= 1)
			{
	            if(PlayerInfo[i][pHitman] == 1) format(rankname, sizeof(rankname), "Freelancer");
	            else if(PlayerInfo[i][pHitman] == 2) format(rankname, sizeof(rankname), "Marksman");
	            else if(PlayerInfo[i][pHitman] == 3) format(rankname, sizeof(rankname), "Agent");
	            else if(PlayerInfo[i][pHitman] == 4) format(rankname, sizeof(rankname), "Special Agent");
	            else if(PlayerInfo[i][pHitman] == 5) format(rankname, sizeof(rankname), "Vice Director");
	            else if(PlayerInfo[i][pHitman] == 6) format(rankname, sizeof(rankname), "Director");

				if(HitmanTarget[playerid] != INVALID_PLAYER_ID) {
					format(string, sizeof(string), "* Name: %s | Rank: %s (%d) | Completed Hits: %d | Chasing: %s", GetPlayerNameEx(i), rankname, PlayerInfo[i][pHitman], PlayerInfo[i][pCompletedHits], GetPlayerNameEx(HitmanTarget[i]));
				} else {
					format(string, sizeof(string), "* Name: %s | Rank: %s (%d) | Completed Hits: %d", GetPlayerNameEx(i), rankname, PlayerInfo[i][pHitman], PlayerInfo[i][pCompletedHits]);
				}
				SendClientMessageEx(playerid, COLOR_GREY, string);
			}
	    }
    }
	return 1;
}

CMD:contract(playerid, params[])
{
	new string[128], targetid, amount, reason[32];
	if(sscanf(params, "uds[32]", targetid, amount, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /contract [playerid/partofname] [amount] [reason]");
   	else if(!IsPlayerInRangeOfPoint(playerid, 2.5, LOCATION_MAILBOX)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not at the mailbox.");
	else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	else if(PlayerInfo[playerid][pHitman] >= 1) return SendClientMessageEx(playerid, COLOR_GREY, "Hitmen cannot place contract on others.");
	else if(playerid == targetid && !IsAdmin(playerid, ADMIN_LEVEL_FOUR)) return SendClientMessageEx(playerid, COLOR_GREY, "You can't place a contract on yourself.");
	else if(amount < 1000) return SendClientMessageEx(playerid, COLOR_GREY, "You can't place contracts that are less than $1,000.");
	if(PlayerInfo[playerid][pMoney] < amount) return SendClientMessageEx(playerid, COLOR_GREY, "You don't have enough money to place a contract.");
	else if(strlen(reason) > 32 || strlen(reason) < 6) return SendClientMessageEx(playerid, COLOR_FADE1, "Contract reason must be between 6-32 characters.");

	PlayerInfo[playerid][pMoney] -= amount;
	PlayerInfo[targetid][pContractPrice] += amount;
	format(PlayerInfo[targetid][pContractBy], MAX_PLAYER_NAME, "%s", GetPlayerNameEx(playerid));
	format(PlayerInfo[targetid][pContractReason], 32, "%s", reason);

	format(string, sizeof(string), "%s has placed a contract on %s for $%d, reason: %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), amount, reason);
	Log("logs/contract.log", string);
	format(string, sizeof(string), "%s has placed a contract on %s for $%d, reason: %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), amount, reason);
	SendHitmanMessage(COLOR_YELLOW, string);
	format(string, sizeof(string), "* You placed a contract on %s for $%d, reason: %s.",GetPlayerNameEx(targetid), amount, reason);
	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	return 1;
}

CMD:hitmanhelp(playerid, params[])
{
	if(PlayerInfo[playerid][pHitman] > 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "-------------------------------------------------------------------");
		SendClientMessageEx(playerid, COLOR_GREY, "International Contract Agency - Hitman Commands");
		SendClientMessageEx(playerid, COLOR_WHITE, "To access /contracts and /givemehit, you need to be at the mailbox near City Hall.");
		SendClientMessageEx(playerid, COLOR_WHITE, "HITMAN: /er, /contracts, /getgun, /givemehit, /ranks, /pb, /pcb, /pub");
		if(PlayerInfo[playerid][pHitman] >= 5) SendClientMessageEx(playerid, COLOR_WHITE, "LEADERSHIP: /makehitman");
		SendClientMessageEx(playerid, COLOR_WHITE, "-------------------------------------------------------------------");
	}
	return 1;
}

CMD:playtube(playerid, params[])
{
	if(!IsAdmin(playerid, ADMIN_LEVEL_SIX)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /playtube [link]");
	new localURL[128];
 	strmid(localURL, params, strfind(params, "v=")+2, strfind(params, "v=")+19);
 	format(localURL, sizeof(localURL), "http://mwrserver.com/youtube.php?videoid=%s", localURL);
	foreach(new i: Player) PlayAudioStreamForPlayer(i, localURL);
	return 1;
}


CMD:help(playerid, params[])
{
	SendClientMessageEx(playerid, COLOR_ORANGE, "-------------------------------------------------------------------");
	SendClientMessageEx(playerid, COLOR_WHITE, "CHARACTER: /stats, /getjob, /deposit, /withdraw, /accent /pay, /showlicenses, /frisk");
	SendClientMessageEx(playerid, COLOR_WHITE, "CHAT: /newb, /b, /do, /me, /s(hout), /low, /w(hisper), /report, /ad, /pm,");
	SendClientMessageEx(playerid, COLOR_WHITE, "OTHER: /gps, /bank, /pay, /cancel, /buy, /inventory, /killcheckpoint, /accept");
	SendClientMessageEx(playerid, COLOR_WHITE, "VEHICLE: /park, /trackcar, /lock, /colorcar, /deletecar, /unmodcar, /car, /checkcargo");
	if(PlayerInfo[playerid][pPhoneNumber] != 0) SendClientMessageEx(playerid, COLOR_WHITE, "PHONE: /call, /hangup, /pickup, /sms, /number, /togphone");
	switch(PlayerInfo[playerid][pJob])
	{
		case 1: { SendClientMessageEx(playerid, COLOR_WHITE, "TRUCKER: /startroute, /cancel route"); }
		case 2: { SendClientMessageEx(playerid, COLOR_WHITE, "MECHANIC: /repair"); }
		case 3: { SendClientMessageEx(playerid, COLOR_WHITE, "PIZZA BOY: /startpizza, /cancel pizza"); }
		case 4: { SendClientMessageEx(playerid, COLOR_WHITE, "MINER: /mine"); }
		case 5: { SendClientMessageEx(playerid, COLOR_WHITE, "TAXI DRIVER: /fare, /accept taxi"); }
		case 6: { SendClientMessageEx(playerid, COLOR_WHITE, "DRUG SMUGGLER: /getdrugs"); }
	}
    switch(FactionInfo[PlayerInfo[playerid][pFaction]][fType])
    {
        case 1:
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "FACTION: /r, /f, /d, /badge, /m, /cuff, /uncuff, /tazer, /detain, /arrest, /backup, /ticket, /vticket, /impound, /vcheck, /confiscate");
   			if(PlayerInfo[playerid][pLeadership] == 1) SendClientMessageEx(playerid, COLOR_WHITE, "LEADERSHIP: /gov, /grantgunlicense, /revokegunlicense, /invite, /uninvite, /giverank, /setdiv");
		}

        case 2:
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "FACTION: /r, /f, /d, /badge, /m, /cuff, /uncuff, /tazer, /detain, /su, /backup");
			if(PlayerInfo[playerid][pLeadership] == 1) SendClientMessageEx(playerid, COLOR_WHITE, "LEADERSHIP: /gov, /clearcrimes, /invite, /uninvite, /giverank, /setdiv");
		}

        case 3:
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "FACTION: /r, /f, /d, /badge, /m, /getpt, /heal, /loadpt, /deliverpt");
			if(PlayerInfo[playerid][pLeadership] == 1) SendClientMessageEx(playerid, COLOR_WHITE, "LEADERSHIP: /gov, /invite, /uninvite, /giverank, /setdiv");
		}
        case 4:
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "FACTION: /r, /f, /badge, /m, /news");
			if(PlayerInfo[playerid][pLeadership] == 1) SendClientMessageEx(playerid, COLOR_WHITE, "LEADERSHIP: /invite, /uninvite, /giverank, /setdiv");
		}
		case 5:
		{
		    SendClientMessageEx(playerid, COLOR_WHITE, "FACTION: /f, /getgun");
			if(PlayerInfo[playerid][pLeadership] == 1) SendClientMessageEx(playerid, COLOR_WHITE, "LEADERSHIP: /invite, /uninvite, /giverank");
		}
	}
	SendClientMessageEx(playerid, COLOR_ORANGE, "-------------------------------------------------------------------");
	return 1;
}

CMD:changes(playerid, params[]) return cmd_updates(playerid, params);
CMD:updates(playerid, params[])
{
	SendClientMessageEx(playerid, COLOR_WHITE, "-------------------------------------------------------------------");
	SendClientMessageEx(playerid, COLOR_ORANGE, SERVER_NAME" - Updates ("SERVER_VERSION")");
	SendClientMessageEx(playerid, COLOR_WHITE, "* Moved to Las Venturas and cleaned up a lot of code.");
	SendClientMessageEx(playerid, COLOR_WHITE, "* Added vehicle damage saving system (more work for mechanics woo!).");
	SendClientMessageEx(playerid, COLOR_WHITE, "* Added Miner job and death system.");
	SendClientMessageEx(playerid, COLOR_WHITE, "* Fixed routes and car engine bugs.");
	SendClientMessageEx(playerid, COLOR_WHITE, "* Addded logs for everything and anti-TP/airbrake hacks.");
	SendClientMessageEx(playerid, COLOR_WHITE, "* Added dynamic factions (FULLY COMLETE AFTER AGES OF WORK).");
	SendClientMessageEx(playerid, COLOR_WHITE, "-------------------------------------------------------------------");
	return 1;
}


CMD:changepass(playerid, params[])
{
	ShowPlayerDialogEx(playerid, DIALOG_CHANGE_PASSWORD, DIALOG_STYLE_PASSWORD, "Change Password", "You are about to change your password!\nPlease enter a new password to continue:", "Enter", "Cancel");
	return 1;
}


public OnPlayerDisconnect(playerid, reason)
{
	if(GetPVarInt(playerid, "gPlayerLogged") == 1)
	{
	    if(GetPVarType(playerid, "AdminDuty") == 1)
		{
			cmd_aduty(playerid, "");
			DeletePVar(playerid, "AdminDuty");
		}
	    
	    if(GetPVarInt(playerid, "SpeakingPlayer") > 0) DeleteReport(GetPVarInt(playerid, "SpeakingPlayer") - 1);

		if(IsPlayerInAnyVehicle(playerid)) OnPlayerExitVehicle(playerid, GetPlayerVehicleID(playerid));

		if(GetPVarInt(playerid, "IsCuffed") == 1) PlayerInfo[playerid][pJailTime] += 1200; PlayerInfo[playerid][pOocJail] = 1;

	    if(GetPVarInt(playerid, "RentingCar") != 0) SetVehicleToRespawn(GetPVarInt(playerid, "RentingCar"));

	    if(PlayerInfo[playerid][pPlantPosition][0] != 0 && PlayerInfo[playerid][pPlantPosition][1] != 0 && PlayerInfo[playerid][pPlantPosition][2] != 0)
		{
	    	DestroyDynamicObject(WeedPlant[playerid]);
	    	WeedPlant[playerid] = 0;
		}
		
		if(GetPVarType(playerid, "SafeMode") == 1) DeletePVar(playerid, "SafeMode");

		if(PlayerInfo[playerid][pJob] == 6) KillDrugRoute(playerid);
	    RemoveHitmanBombs(playerid);

		for(new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
		{
    	    if(PlayerVehicleInfo[playerid][i][pvHandleId] != 0)
			{
    	    	DestroyVehicle(PlayerVehicleInfo[playerid][i][pvHandleId]);
			}
		}

	    if(SpectatingAdmin[playerid] != INVALID_PLAYER_ID && SpectatingAdmin[SpectatingPlayer[playerid]] == playerid)
		{
        	SpectatingAdmin[playerid] = INVALID_PLAYER_ID;
			SpectatingPlayer[playerid] = INVALID_PLAYER_ID;
			SendClientMessageEx(SpectatingAdmin[playerid], COLOR_GREY, "The person that you were spectating has left the server.");
			TogglePlayerSpectating(SpectatingAdmin[playerid], false);
		}

	    if(SpectatingPlayer[playerid] != INVALID_PLAYER_ID) {
	    	SpectatingAdmin[SpectatingPlayer[playerid]] = INVALID_PLAYER_ID;
	     	SpectatingPlayer[playerid] = INVALID_PLAYER_ID;
	    }

	    if(gCurrentTaxiCall == playerid)
	        gCurrentTaxiCall = INVALID_PLAYER_ID;

		new string[128];
		switch (reason)
		{
			case 0:
			{
				format(string, sizeof(string), "%s has left the server (timeout).", GetPlayerNameEx(playerid));
				ProxDetector(30.0, playerid, string, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW);
			}
			case 1:
			{
				format(string, sizeof(string), "%s has left the server (leaving).", GetPlayerNameEx(playerid));
				ProxDetector(30.0, playerid, string, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW);
			}
			case 2:
			{
				format(string, sizeof(string), "%s has left the server (kicked/banned).", GetPlayerNameEx(playerid));
				ProxDetector(30.0, playerid, string, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW);
			}
		}
		PlayerInfo[playerid][pMoney] += gTaxiFareEarnings[playerid];
		gTaxiFareEarnings[playerid] = 0; gTaxiFareAmount[playerid] = 0;
		CallingTo[playerid] = INVALID_PLAYER_ID; PhoneState[playerid] = 0;
		PlayerTextDrawDestroy(playerid, JailTimerTD[playerid]);

	 	SavePlayerAccount(playerid);
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	if(GetPVarInt(playerid, "gPlayerLogged") == 1)
	{
	    if(PlayerInfo[playerid][pPlantPosition][0] != 0 && PlayerInfo[playerid][pPlantPosition][1] != 0 && PlayerInfo[playerid][pPlantPosition][2] != 0) WeedPlant[playerid] = CreateDynamicObject(19473, PlayerInfo[playerid][pPlantPosition][0], PlayerInfo[playerid][pPlantPosition][1], PlayerInfo[playerid][pPlantPosition][2] - 1.25, 0, 0, 0, floatround(PlayerInfo[playerid][pPlantPosition][4]),  floatround(PlayerInfo[playerid][pPlantPosition][3]));

		if(IsAdmin(playerid, ADMIN_LEVEL_ONE) || PlayerInfo[playerid][pLevel] < 5)
		{
			PlayerInfo[playerid][pTogNewbie] = 1;
		}
    	if(!gPlayerAnimLibsPreloaded[playerid]) Player_PreLoadAnim(playerid);
		if(PlayerInfo[playerid][pJailTime] > 0)
		{
		    if(GetPVarType(playerid, "SafeMode") == 1) DeletePVar(playerid, "SafeMode");
			new jailPos = random(3) + (PlayerInfo[playerid][pOocJail] == 1 ? 3 : 0);
			SetPlayerHealthEx(playerid, 100);
			SetPlayerPosEx(playerid, JailPositions[jailPos][0], JailPositions[jailPos][1], JailPositions[jailPos][2]);
			SetPlayerFacingAngle(playerid, PlayerInfo[playerid][pOocJail] == 1 ? 180 : 0);
			SetPlayerInteriorEx(playerid, 1);
			SetPlayerVirtualWorldEx(playerid, 777);

			PlayerTextDrawShow(playerid, JailTimerTD[playerid]);
			SendClientMessageEx(playerid, COLOR_WHITE, "SERVER: Incomplete sentance! You have been teleported to jail.");
			ResetPlayerWeapons(playerid);
			for(new i=0; i < 12; i++) PlayerInfo[playerid][pWeapons][i] = 0;
			TogglePlayerControllable(playerid, false);
			SetPVarInt(playerid, "ActionRestriction", 1);
			TextDrawShowForPlayer(playerid, LoadingObjectTextDraw);
			TextDrawShowForPlayer(playerid, LoadingObjectBox);
			SetTimerEx("HideLoadingTextdraws", 4000, false, "i", playerid);
			SetPlayerSkin(playerid, 50);
			return 1;
		}
		if(PlayerInfo[playerid][pWounded] != PLAYER_ALIVE)
		{
		    SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
		    SetPlayerHealthEx(playerid, 25);
  			if(GetPVarType(playerid, "SafeMode") == 1 && PlayerInfo[playerid][pPositionX] == 0 && PlayerInfo[playerid][pPositionY] == 0 && PlayerInfo[playerid][pPositionZ] == 0)
			{
			    SendClientMessageEx(playerid, COLOR_WHITE, "It appears that you have logged out while being wounded or dead, thus ending up in the hospital.");
	  			GivePlayerDeath(playerid);
	  			DeletePVar(playerid, "SafeMode");
			  	return 1;
	  		}
			if(PlayerInfo[playerid][pWounded] == PLAYER_WOUNDED) SendClientMessageEx(playerid, COLOR_RED, "You are brutally wounded. You can now /call 911 or /accept death.");
			else SendClientMessageEx(playerid, COLOR_RED, "You are now dead. You may /accept death.");
		    if(GetPVarType(playerid, "SafeMode") == 1)
			{
				DeletePVar(playerid, "SafeMode");
			}
			Streamer_UpdateEx(playerid, PlayerInfo[playerid][pPositionX], PlayerInfo[playerid][pPositionY], PlayerInfo[playerid][pPositionZ]);
			SetPlayerPosEx(playerid, PlayerInfo[playerid][pPositionX], PlayerInfo[playerid][pPositionY], PlayerInfo[playerid][pPositionZ]);
			SetPlayerInterior(playerid, PlayerInfo[playerid][pInterior]);
			SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pVirtualWorld]);
		    return 1;
		}
		if(GetPVarType(playerid, "SafeMode") == 1) DeletePVar(playerid, "SafeMode");
  		SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
		SetPlayerHealth(playerid, PlayerInfo[playerid][pHealth]);
		SetPlayerArmour(playerid, PlayerInfo[playerid][pArmour]);
	 	SetPlayerPosEx(playerid, PlayerInfo[playerid][pPositionX], PlayerInfo[playerid][pPositionY], PlayerInfo[playerid][pPositionZ]);
	 	SetPlayerInteriorEx(playerid, PlayerInfo[playerid][pInterior]);
	 	SetPlayerVirtualWorldEx(playerid, PlayerInfo[playerid][pVirtualWorld]);
		SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pWantedLevel]);
		SetPlayerFacingAngle(playerid, PlayerInfo[playerid][pFacingAngle]);
		ReloadPlayerWeapons(playerid);
	 	SetCameraBehindPlayer(playerid);

		TogglePlayerControllable(playerid, false);
		SetPVarInt(playerid, "ActionRestriction", 1);
		TextDrawShowForPlayer(playerid, LoadingObjectTextDraw);
		TextDrawShowForPlayer(playerid, LoadingObjectBox);
		SetTimerEx("HideLoadingTextdraws", 2000, false, "i", playerid);
		return 1;
	}
	else return KickEx(playerid);
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if(!IsPlayerConnectedEx(playerid)) return 0;
	new string[128];
	if(IsPlayerConnectedEx(killerid))
	{
	    if(reason >= 0 && reason <= 46)
	    {
	  		printf("[Kill]: %s has killed %s with a %s.", GetPlayerNameEx(killerid), GetPlayerNameEx(playerid), GetWeaponNameEx(reason));
			format(string, sizeof(string), "{FF6347}AdmWarning:{FFFF00} %s has just killed %s with a %s.", GetPlayerNameEx(killerid), GetPlayerNameEx(playerid), GetWeaponNameEx(reason));
			AdminAlert(string, ALERT_ADMINS);
			LastKiller[playerid] = killerid;
		}
		if(HitmanTarget[killerid] == playerid && PlayerInfo[playerid][pContractPrice] != 0)
		{
		    format(string, sizeof(string), "Hitman %s has fulfilled the contract on %s's head and collected $%d.", GetPlayerNameEx(killerid), GetPlayerNameEx(playerid), PlayerInfo[playerid][pContractPrice]);
			Log("logs/contract.log", string);
			format(string, sizeof(string), "You have been critically injured by a hitman and lost $%d.", PlayerInfo[playerid][pContractPrice]);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
		    format(string, sizeof(string), "Hitman %s has fulfilled the contract on %s's head and collected $%d.", GetPlayerNameEx(killerid), GetPlayerNameEx(playerid), PlayerInfo[playerid][pContractPrice]);
			SendHitmanMessage(COLOR_YELLOW, string);
			PlayerInfo[playerid][pMoney] -= PlayerInfo[playerid][pContractPrice];
			PlayerInfo[killerid][pMoney] += PlayerInfo[playerid][pContractPrice];
			PlayerInfo[killerid][pCompletedHits]++;
			PlayerInfo[playerid][pContractPrice] = 0;
			format(PlayerInfo[playerid][pContractReason], 32, "");
			format(PlayerInfo[playerid][pContractBy], MAX_PLAYER_NAME, "");
			HitmanTarget[killerid] = INVALID_PLAYER_ID;
		}
		else if(HitmanTarget[playerid] == killerid && PlayerInfo[killerid][pContractPrice] != 0)
		{
		    format(string, sizeof(string), "Hitman %s has failed the contract on %s's head and lost $%d.", GetPlayerNameEx(playerid), GetPlayerNameEx(killerid), PlayerInfo[killerid][pContractPrice]);
			Log("logs/contract.log", string);
		    format(string, sizeof(string), "You have critically injured a hitman and collected $%d.", PlayerInfo[killerid][pContractPrice]);
		    SendClientMessageEx(killerid, COLOR_YELLOW, string);
		    format(string, sizeof(string), "Hitman %s has failed the contract on %s's head and lost $%d.", GetPlayerNameEx(playerid), GetPlayerNameEx(killerid), PlayerInfo[killerid][pContractPrice]);
			SendHitmanMessage(COLOR_YELLOW, string);
			PlayerInfo[playerid][pMoney] -= PlayerInfo[playerid][pContractPrice];
			PlayerInfo[killerid][pMoney] += PlayerInfo[playerid][pContractPrice];
			PlayerInfo[killerid][pContractPrice] = 0;
			format(PlayerInfo[killerid][pContractReason], 32, "");
			format(PlayerInfo[killerid][pContractBy], MAX_PLAYER_NAME, "");
			HitmanTarget[playerid] = INVALID_PLAYER_ID;
		}
	}
	if(GetPVarInt(playerid, "BackupRequested") == 1)
	{
		DeletePVar(playerid, "BackupRequested");
  		SetPlayerToTeamColor(playerid);
	}
    if(PlayerInfo[playerid][pWounded] != PLAYER_DEAD) PlayerInfo[playerid][pWounded] = PLAYER_DEAD;
	if(IsPlayerInAnyVehicle(playerid)) OnPlayerExitVehicle(playerid, GetPlayerVehicleID(playerid));
	if(gPlayerUsingLoopingAnim[playerid]) gPlayerUsingLoopingAnim[playerid] = 0;
	RemovePlayerColorFade(playerid);
	return 1;
}

public HospitalTimer(playerid)
{
	if(!IsPlayerConnectedEx(playerid)) return 0;
	TogglePlayerControllable(playerid, true);
	for (new i=0; i < 12; i++) PlayerInfo[playerid][pWeapons][i] = 0;
 	SetPlayerHealthEx(playerid, 100);
 	SetPlayerArmourEx(playerid, 0);
	SetPlayerPosEx(playerid, LOCATION_HOSPITAL);
	SetPlayerFacingAngle(playerid, 0.0);
	SetCameraBehindPlayer(playerid);
	SendClientMessageEx(playerid, COLOR_LIGHTRED, "HOSPITAL: Your medical bill comes to $500, have a nice day.");
	GivePlayerCash(playerid, -500);
	AddVaultMoney(3, 500);
	DeletePVar(playerid, "TaserEquipped");
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
    new vowner = GetVehicleOwner(vehicleid);
    if(vowner != INVALID_PLAYER_ID)
	{
	    if(PlayerVehicleInfo[vowner][GetVehicleOwnedSlot(vehicleid)][pvHealth] < 250)
		{
			PlayerVehicleInfo[vowner][GetVehicleOwnedSlot(vehicleid)][pvHealth] = 250;
			SetVehicleHealth(vehicleid, 250);
	    }
		else SetVehicleHealth(vehicleid, PlayerVehicleInfo[vowner][GetVehicleOwnedSlot(vehicleid)][pvHealth]);
	}
	
	switch (GetVehicleModel(vehicleid))
	{
	    case 425: { SetVehicleHealth(vehicleid, 5000); } // hunter
	    case 427: { SetVehicleHealth(vehicleid, 4000); } // enforcer
	    case 432: { SetVehicleHealth(vehicleid, 10000); } // rhino
	    case 433: { SetVehicleHealth(vehicleid, 7500); } // barracks
	    case 470: { SetVehicleHealth(vehicleid, 3000); } // patriot
	    case 490: { SetVehicleHealth(vehicleid, 2000); } // rancher
	    case 520: { SetVehicleHealth(vehicleid, 4000); } // hydra
	    case 601: { SetVehicleHealth(vehicleid, 7000); } // splashy
	}
	
	VehicleInfo[vehicleid][vEngine] = 0;
	VehicleInfo[vehicleid][vLights] = 0;
	VehicleInfo[vehicleid][vTotalled] = 0;
	VehicleInfo[vehicleid][vFuel] = 100;
	SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], 0, 0, 0, 0, 0);
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	if(IsATaxiCar(vehicleid) && GetPlayerVehicleID(killerid) == vehicleid && GetPlayerVehicleSeat(killerid) == 0)
	{
      	SendClientMessageEx(killerid, COLOR_WHITE, "Taxi Company: You have been fired and charged $100 for damages to the taxi and your license has been revoked.");
       	PlayerInfo[killerid][pDriverLicense] = 0;
       	PlayerInfo[killerid][pJob] = 0;
       	SetVehicleToRespawn(vehicleid);
		GivePlayerCash(killerid, -100);
		AddVaultMoney(2, 100);
	}
	VehicleInfo[vehicleid][vEngine] = 0;
	VehicleInfo[vehicleid][vTotalled] = 0;
	VehicleInfo[vehicleid][vStarted] = 0;
	return 1;
}

forward StopTalking(playerid); public StopTalking(playerid) return ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, 0, 0, 0, 0, 0);

public OnPlayerText(playerid, text[])
{
	if(PlayerInfo[playerid][pTutorial] == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "You cannot use the chat whilst being in the registration process.");
		return 0;
	}
	else if(PlayerInfo[playerid][pWounded] == PLAYER_DEAD)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You are dead, you cannot speak.");
		return 0;
	}
	new string[128];
	if(CallingTo[playerid] != INVALID_PLAYER_ID)
	{
		format(string, sizeof(string), "(cellphone) %s says: %s", GetPlayerNameEx(playerid), text);
		if(CallingTo[CallingTo[playerid]] == playerid && PhoneState[CallingTo[playerid]] == 1) SendClientMessageEx(CallingTo[playerid], COLOR_YELLOW, string);
		else SendClientMessageEx(playerid, COLOR_GREY, "Your partner has disconnected, type /hangup to hangup.");
	}
	else
	{
	    if(PlayerInfo[playerid][pAccent] > 0) format(string, sizeof(string), "(%s accent) %s says: %s", GetPlayerAccent(playerid), GetPlayerNameEx(playerid), text);
		else format(string, sizeof(string), "%s says: %s", GetPlayerNameEx(playerid), text);
	}

	if(!IsPlayerRestricted(playerid) && !IsPlayerInAnyVehicle(playerid) && gPlayerUsingLoopingAnim[playerid] == 0 && PlayerInfo[playerid][pAccent] > 0)
    {
		ApplyAnimation(playerid, "PED", "IDLE_CHAT",4.0, 1, 0, 0, 1, 1);
    	new time=strlen(text) * 100;
    	SetTimerEx("StopTalking", time, 0, "i", playerid);
    }

	SetPlayerChatBubble(playerid, text, COLOR_WHITE, 20.0, 10000);
    ProxDetector(20.0, playerid, string, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);

	if(GetPVarInt(playerid, "Calling911") == 1)
	{
	    if(!strcmp(text, "police", true))
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "EMERGENCY: I am now going to transfer your call.");
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "DISPATCH: Please provide short description of this crime.");
			SetPVarInt(playerid, "Calling911", 2);
	    }
		else if(!strcmp(text, "ems", true))
		{
			SendClientMessageEx(playerid, COLOR_LIGHTRED, "EMERGENCY: I am now going to transfer your call.");
			SendClientMessageEx(playerid, COLOR_LIGHTRED, "DISPATCH: Please provide short description of the incident.");
			SetPVarInt(playerid, "Calling911", 3);
	    }
		else
		{
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "EMERGENCY: I'm sorry, which service did you need? (type police or ems)");
		}

		return 0;
    }
  	else if(GetPVarInt(playerid, "Calling911") == 2)
    {
        if(strlen(text) >= 4)
		{
	    	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "DISPATCH: Thank you for calling us. Your call is now being processed.");
	    	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "DISPATCH: All on duty members have been alerted, thank you for reporting this incident.");
			format(string, sizeof(string), "DISPATCH: All Units IA: Caller: %s", GetPlayerNameEx(playerid));
			SendFactionMessage(1, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "DISPATCH: Incident: %s", text);
			SendFactionMessage(1, COLOR_LIGHTBLUE, string);
	    	DeletePVar(playerid, "Calling911");
			SendClientMessageEx(playerid, COLOR_GREY, "They hung up.");
			PhoneState[playerid] = 0;
			if(!IsPlayerRestricted(playerid)) SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		}
		else
		{
	    	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "DISPATCH: Hello, is anyone there on the phone?");
		}
		return 0;
    }
  	else if(GetPVarInt(playerid, "Calling911") == 3)
    {
        if(strlen(text) >= 4)
		{
	    	SendClientMessageEx(playerid, COLOR_LIGHTRED, "DISPATCH: Thank you for calling us. Your call is now being processed.");
	    	SendClientMessageEx(playerid, COLOR_LIGHTRED, "DISPATCH: All on duty members have been alerted, thank you for reporting this incident.");
			if(PlayerInfo[playerid][pWounded] == PLAYER_WOUNDED)
		    {
				format(string, sizeof(string), "DISPATCH: All Units IA: Caller: %s", GetPlayerNameEx(playerid));
				SendFactionMessage(3, COLOR_LIGHTRED, string);
				format(string, sizeof(string), "DISPATCH: Incident: %s", text);
				SendFactionMessage(3, COLOR_LIGHTRED, string);
		        GetPlayer2DZone(playerid, string, sizeof(string));
	    		format(string, sizeof(string), "DISPATCH: The caller was reported (ID: %d) %s to be wounded at %s.", playerid, GetPlayerNameEx(playerid), string, text);
				SendFactionMessage(3, TEAM_COLOR_LSFD, string);
			}
			else
			{
				format(string, sizeof(string), "DISPATCH: All Units IA: Caller: %s", GetPlayerNameEx(playerid));
				SendFactionMessage(3, COLOR_LIGHTRED, string);
				format(string, sizeof(string), "DISPATCH: Incident: %s", text);
				SendFactionMessage(3, COLOR_LIGHTRED, string);
			}
	    	DeletePVar(playerid, "Calling911");
			SendClientMessageEx(playerid, COLOR_GREY, "They hung up.");
			PhoneState[playerid] = 0;
			if(!IsPlayerRestricted(playerid)) SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		}
		else
		{
	    	SendClientMessageEx(playerid, COLOR_LIGHTRED, "DISPATCH: Hello, is anyone there on the phone?");
		}
		return 0;
    }
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{/*
	if(VehicleInfo[vehicleid][vStarted] == 0)
	{
		VehicleInfo[vehicleid][vStarted] = 1;
		VehicleInfo[vehicleid][vEngine] = 0;
		VehicleInfo[vehicleid][vLights] = 0;
		VehicleInfo[vehicleid][vTotalled] = 0;
		VehicleInfo[vehicleid][vFuel] = 100;
		VehicleInfo[vehicleid][vLocked] = 0;
		SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
	}*/
	if(PlayerInfo[playerid][pWounded] != PLAYER_ALIVE)
	{
	    ClearAnimations(playerid);
		ApplyAnimation(playerid, "WUZI", "CS_DEAD_GUY", 4.0, 0, 1, 1, 1, 0, 0);
		return 1;
	}
	if(VehicleInfo[vehicleid][vLocked] == 1) ClearAnimations(playerid);

	if(GetPVarInt(playerid, "TaserEquipped")) cmd_tazer(playerid, "");

	if(IsADmvCar(vehicleid))
	{
	    if(LicenseTestAC[playerid] != 4)
		{
	        ClearAnimations(playerid); SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use that vehicle! (/buylicense inside DMV)");
		}
	}
	else if(IsACopCar(vehicleid) && ispassenger == 0)
	{
	    if(!IsACop(playerid))
	    {
		    ClearAnimations(playerid);
		    SendClientMessageEx(playerid, COLOR_GREY, "You are not in a Law Enforcement Organization.");
	    }
	}
	else if(IsAMedicCar(vehicleid) && ispassenger == 0)
	{
	    if(!IsAMedic(playerid))
	    {
		    ClearAnimations(playerid);
		    SendClientMessageEx(playerid, COLOR_GREY, "You are not in a Medical Agency.");
	    }
	}
	else if(IsAGovCar(vehicleid) && ispassenger == 0)
	{
	    if(!IsAGov(playerid))
	    {
		    ClearAnimations(playerid);
		    SendClientMessageEx(playerid, COLOR_GREY, "You are not in a Governing Agency.");
	    }
	}
	else if(IsATaxiCar(vehicleid) && ispassenger == 0)
	{
	    if(PlayerInfo[playerid][pJob] != 5)
	    {
		    ClearAnimations(playerid);
		    SendClientMessageEx(playerid, COLOR_GREY, "You are not in the Taxi Company.");
	    }
	    else SendClientMessageEx(playerid, COLOR_WHITE, "Taxi Company: This vehicle is a property of the Government. Damaging it will will result in legal actions.");
	}
	else if(IsAPizzaBike(vehicleid))
	{
	    if(PlayerInfo[playerid][pJob] != 3)
		{
		    ClearAnimations(playerid);
		    SendClientMessageEx(playerid, COLOR_GREY, "You are not a Pizza Boy.");
		}
		else
		{
		    if(GetPlayerSkin(playerid) != 155)
			{
	    		SendClientMessageEx(playerid, COLOR_GREEN, "UNIFORM:{FFFFFF} Since you didn't have a proper uniform, you were given one for $25.");
	    		GivePlayerCash(playerid, -25);
				SetPlayerSkinEx(playerid, 155);
				ClearAnimations(playerid);
			}
		}
	}
	else if(IsATruckerVehicle(vehicleid) && ispassenger == 0)
	{
	    if(PlayerInfo[playerid][pJob] != 1)
	    {
		    ClearAnimations(playerid);
		    SendClientMessageEx(playerid, COLOR_GREY, "You are not a Trucker.");
	    }
	}
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	if(IsADmvCar(vehicleid) && GetPVarInt(playerid, "TakingDMVTest") == 1)
	{
	    DeletePVar(playerid, "DMVStage");
	    DeletePVar(playerid, "TakingDMVTest");
	    DisablePlayerCheckpoint(playerid);
	    SetVehicleToRespawn(vehicleid);
	    SendClientMessageEx(playerid, COLOR_WHITE, "The test was cancelled because you left the testing vehicle.");
	}
	if(GetVehicleOwner(vehicleid) != INVALID_PLAYER_ID) GetVehicleHealth(vehicleid, PlayerVehicleInfo[GetVehicleOwner(vehicleid)][GetVehicleOwnedSlot(vehicleid)][pvHealth]);
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_ONFOOT && (oldstate == PLAYER_STATE_DRIVER || oldstate == PLAYER_STATE_PASSENGER))
	{
	    if(gLastCar[playerid] != INVALID_VEHICLE_ID && VehicleInfo[gLastCar[playerid]][vRadio] > 0)
	    	StopAudioStreamForPlayer(playerid);
	}

	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
	{
	    gLastCar[playerid] = GetPlayerVehicleID(playerid);
	    if(VehicleInfo[gLastCar[playerid]][vRadio] > 0)
	    	PlayAudioStreamForPlayer(playerid, RadioStations[VehicleInfo[gLastCar[playerid]][vRadio] - 1][0]);
	}

	if(newstate == PLAYER_STATE_ONFOOT && oldstate == PLAYER_STATE_DRIVER)
	{
		if(gTaxiFareAmount[playerid] > 0)
		{
		    new
		        string[128];
		    PlayerInfo[playerid][pMoney] += gTaxiFareEarnings[playerid];
		    gTaxiFareEarnings[playerid] = 0;
		    gTaxiFareAmount[playerid] = 0;
	        format(string, sizeof(string), "You have went off duty and earned $%d for this trip.", gTaxiFareEarnings[playerid]);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
	}

	if(newstate == PLAYER_STATE_DRIVER)
	{
        new vehicleid = GetPlayerVehicleID(playerid);
	    SetPlayerArmedWeapon(playerid, 0);
		GetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);

	    if(PlayerInfo[playerid][pDriverLicense] == 0)
	        SendClientMessageEx(playerid, COLOR_GREY, "You do not have a registered drivers license, watch out for law enforcement.");

		for(new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
	    {
	        if(GetPlayerVehicleID(playerid) == PlayerVehicleInfo[playerid][i][pvHandleId])
			{
			    new
			        string[96];
				format(string, sizeof(string), "You are the owner of this %s.", GetVehicleName(vehicleid));
			    SendClientMessageEx(playerid, COLOR_GREY, string);
			    if(PlayerVehicleInfo[playerid][i][pvTicketPrice] > 0)
			    {
					format(string, sizeof(string), "You manage to find a bunch of tickets on this vehicle, adding up to $%d.", GetVehicleName(vehicleid), PlayerVehicleInfo[playerid][i][pvTicketPrice]);
				    SendClientMessageEx(playerid, COLOR_GREY, string);
				}
			    break;
			}
		}

	    if(SpectatingAdmin[playerid] != INVALID_PLAYER_ID && SpectatingPlayer[SpectatingAdmin[playerid]] == playerid)
			PlayerSpectateVehicle(SpectatingAdmin[playerid], vehicleid);

	    if(IsARentableVehicle(vehicleid))
	    {
			if(WhoRentsVehicle(vehicleid) != INVALID_PLAYER_ID)
			{
			    new string[128];
			    format(string, sizeof(string), "RENT:{FFFFFF} You manage to find some papers saying that this car is currently being rented by %s.", GetPlayerNameEx(WhoRentsVehicle(vehicleid)));
	     		SendClientMessageEx(playerid, COLOR_ORANGE, string);
			 	VehicleInfo[vehicleid][vEngine] = 1;
			}
			else
			{
	     		SendClientMessageEx(playerid, COLOR_ORANGE, "RENT:{FFFFFF} You can rent this vehicle for $100 by typing the command /rentcar.");
			 	VehicleInfo[vehicleid][vEngine] = 0;
			}
			SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
		}
	    else if(IsAPizzaBike(vehicleid))
	    {
	        if(PlayerInfo[playerid][pJob] == 3)
	        {
		        if(GetPVarInt(playerid, "PizzaBike") != vehicleid)
		        {
			        SendClientMessageEx(playerid, COLOR_ORANGE, "PIZZA:{FFFFFF} You are currently not on a pizza mission.");
			        SendClientMessageEx(playerid, COLOR_ORANGE, "PIZZA:{FFFFFF} Please type /startpizza to carry on a mission.");
			        VehicleInfo[vehicleid][vEngine] = 0;
				}
				else
				{
			        SendClientMessageEx(playerid, COLOR_ORANGE, "PIZZA:{FFFFFF} You are currently on a mission.");
			        SendClientMessageEx(playerid, COLOR_ORANGE, "PIZZA:{FFFFFF} To cancel the mission, please type /cancel pizza.");
			        VehicleInfo[vehicleid][vEngine] = 1;
				}
				SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
			}
			else
			{
			    RemovePlayerFromVehicle(playerid);
		    	SendClientMessageEx(playerid, COLOR_GREY, "You are not a Pizza Boy.");
			}
	    }
	    else if(GetPVarInt(playerid, "PizzaBike") != vehicleid && GetPVarInt(playerid, "PizzaBike") != 0)
	    {
			SetVehicleToRespawn(GetPVarInt(playerid, "PizzaBike"));
			DisablePlayerCheckpoint(playerid);
	 		DeletePVar(playerid, "PizzaBike");
			DeletePVar(playerid, "PizzaID");
		 	DeletePVar(playerid, "PizzaPayment");
    		SendClientMessageEx(playerid, COLOR_YELLOW, "PIZZA:{FFFFFF}Your previous mission was cancelled due to you entering another vehicle.");
	    }
	    else if(IsATruckerVehicle(vehicleid))
	    {
	        if(PlayerInfo[playerid][pJob] == 1)
	        {
		        if(GetPVarInt(playerid, "RouteTruck") != vehicleid)
		        {
			        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "TRUCKER:{FFFFFF} You are currently not on a trucking mission.");
			        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "TRUCKER:{FFFFFF} Please type /startroute to carry on a mission.");
			        VehicleInfo[vehicleid][vEngine] = 0;
				}
				else
				{
			        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "TRUCKER{FFFFFF} You are currently on a trucking mission.");
			        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "TRUCKER{FFFFFF} To cancel the mission, please type /cancel route.");
			        VehicleInfo[vehicleid][vEngine] = 1;
				}
				SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
			}
			else
			{
			    RemovePlayerFromVehicle(playerid);
		    	SendClientMessageEx(playerid, COLOR_GREY, "You are not a Trucker.");
			}
	    }
	    else if(GetPVarInt(playerid, "RouteTruck") != vehicleid && GetPVarInt(playerid, "RouteTruck") != 0)
	    {
			SetVehicleToRespawn(GetPVarInt(playerid, "RouteTruck"));
			DisablePlayerCheckpoint(playerid);
	 		DeletePVar(playerid, "RouteTruck");
			DeletePVar(playerid, "RouteId");
		 	DeletePVar(playerid, "RoutePayment");
    		SendClientMessageEx(playerid, COLOR_YELLOW, "Your previous trucker mission was cancelled due to you entering another vehicle.");
	    }

	    else if(IsADmvCar(vehicleid))
	    {
		    if(LicenseTestAC[playerid] == 4)
		    {
		        VehicleInfo[vehicleid][vEngine] = 0;
				SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
		        if(PlayerInfo[playerid][pDriverLicense] == 0) return SendClientMessageEx(playerid, COLOR_YELLOW, "DMV:{FFFFFF} If you would like to obtain one by taking the driver test, type /taketest.");
				else
				{
				    RemovePlayerFromVehicleEx(playerid);
				    SendClientMessageEx(playerid, COLOR_YELLOW, "DMV: You already have a drivers license, theres no need for you to repeat the test.");
				}
			}
			else
			{
		        RemovePlayerFromVehicle(playerid);
		        SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use that vehicle! (/buylicense inside DMV)");
			}
	    }
    	else if(IsACopCar(vehicleid) && !IsACop(playerid))
		{
			RemovePlayerFromVehicle(playerid);
		    SendClientMessageEx(playerid, COLOR_GREY, "You are not in a Law Enforcement Organization.");
		}
    	else if(IsAMedicCar(vehicleid) && !IsAMedic(playerid))
		{
			RemovePlayerFromVehicle(playerid);
		    SendClientMessageEx(playerid, COLOR_GREY, "You are not in a Medical Agency.");
		}
    	else if(IsAGovCar(vehicleid) && !IsAGov(playerid))
		{
			RemovePlayerFromVehicle(playerid);
		    SendClientMessageEx(playerid, COLOR_GREY, "You are not in a Governing Agency.");
		}
		else if(IsATaxiCar(vehicleid) && PlayerInfo[playerid][pJob] != 5)
		{
			RemovePlayerFromVehicle(playerid);
   			SendClientMessageEx(playerid, COLOR_GREY, "You are not in the Taxi Company.");
		}
		else if(!IsRunnableEngine(vehicleid) && VehicleInfo[vehicleid][vEngine] == 0)
		{
			//GetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
			VehicleInfo[vehicleid][vEngine] = 1;
		 	SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
		}
	}
	else if(newstate == PLAYER_STATE_PASSENGER)
	{
 		if(SpectatingAdmin[playerid] != INVALID_PLAYER_ID)
	    {
	        if(SpectatingPlayer[SpectatingAdmin[playerid]] == playerid)
	        {
	        	PlayerSpectateVehicle(SpectatingAdmin[playerid], GetPlayerVehicleID(playerid));
	        }
	    }

	    if(IsATaxiCar(GetPlayerVehicleID(playerid)))
	    {
	        new tDriver = GetVehicleDriver(GetPlayerVehicleID(playerid));
	        if(tDriver != INVALID_PLAYER_ID && PlayerInfo[tDriver][pJob] == 5)
	        {
	            if(PlayerInfo[tDriver][pDuty] == 1 && gTaxiFareAmount[tDriver] > 0)
	            {
	                new
	                    string[128];
					format(string, sizeof(string), "You have entered a certified Taxi Company cab, it will cost you $%d per/km ($%d every second)", gTaxiFareAmount[tDriver], gTaxiFareAmount[tDriver]);
	                SendClientMessageEx(playerid, COLOR_WHITE, string);
					format(string, sizeof(string), "A customer has entered your cab, they will pay you $%d per/km ($%d every second)", gTaxiFareAmount[tDriver], gTaxiFareAmount[tDriver]);
	                SendClientMessageEx(tDriver, COLOR_WHITE, string);
                	TaxiRouteTimerEx[playerid] = SetTimerEx("TaxiRoute", 3000, true, "ii", playerid, tDriver);
                }
	        }
	    }
	}
	else if(newstate == PLAYER_STATE_ONFOOT)
	{
		if(SpectatingAdmin[playerid] != INVALID_PLAYER_ID)
	    {
            if(SpectatingPlayer[SpectatingAdmin[playerid]] == playerid)
            {
	        	PlayerSpectatePlayer(SpectatingAdmin[playerid], playerid);
	        }
	    }
	}
	return 1;
}

public TaxiRoute(playerid, driverid)
{
	new string[32];
	if(!IsPlayerConnectedEx(driverid) || GetPlayerVehicleID(driverid) != GetPlayerVehicleID(playerid) || PlayerInfo[driverid][pDuty] == 0) {
		format(string, sizeof(string), "~w~Total: ~r~$%d", gTaxiFareAmount[driverid] * TaxiSeconds[playerid]);
		GameTextForPlayer(playerid, string, 6000, 6);
	    TaxiSeconds[playerid] = 0;
		KillTimer(TaxiRouteTimerEx[playerid]);
		return 0;
	} else if(!IsPlayerConnectedEx(playerid) || GetPlayerVehicleID(playerid) != GetPlayerVehicleID(driverid)) {
		format(string, sizeof(string), "~w~Total: ~r~$%d", gTaxiFareAmount[driverid] * TaxiSeconds[playerid]);
		GameTextForPlayer(playerid, string, 6000, 6);
		GameTextForPlayer(driverid, string, 6000, 6);
		TaxiSeconds[playerid] = 0;
		KillTimer(TaxiRouteTimerEx[playerid]);
		return 0;
	}
	else if(PlayerInfo[playerid][pMoney] < gTaxiFareAmount[driverid] * 3) {
	    SendClientMessageEx(driverid, COLOR_WHITE, "Your client does not have anymore funds to cover the transport fee, you will not be paid anymore.");
		TaxiSeconds[playerid] = 0;
		KillTimer(TaxiRouteTimerEx[playerid]);
		return 0;
	}
	TaxiSeconds[playerid] += 3;
	format(string, sizeof(string), "~w~Total: ~r~$%d", gTaxiFareAmount[driverid] * TaxiSeconds[playerid]);
	GameTextForPlayer(playerid, string, 2500, 6);
	PlayerInfo[playerid][pMoney] -= gTaxiFareAmount[driverid] * 3;
    gTaxiFareEarnings[driverid] += gTaxiFareAmount[driverid] * 3;
    return 1;
}

CMD:dmvmenu(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 4.0, LOCATION_DMV)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be at the DMV to use this command.");
	new
	    string[128];
    for(new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
    {
        if(PlayerVehicleInfo[playerid][i][pvModelId] != 0)
		{
		    if(PlayerVehicleInfo[playerid][i][pvImpounded] == 1)
		    	format(string, sizeof(string), "%s(ID: %d) %s (Release for $1,000)\n", string, i, VehicleNames[PlayerVehicleInfo[playerid][i][pvModelId] - 400]);
			else if(PlayerVehicleInfo[playerid][i][pvTicketPrice] > 0)
		    	format(string, sizeof(string), "%s(ID: %d) %s (Pay tickets: $%d)\n", string, i, VehicleNames[PlayerVehicleInfo[playerid][i][pvModelId] - 400], PlayerVehicleInfo[playerid][i][pvTicketPrice]);
			else
		    	format(string, sizeof(string), "%s(ID: %d) %s\n", string, i, VehicleNames[PlayerVehicleInfo[playerid][i][pvModelId] - 400]);
		}
		else
		{
		    format(string, sizeof(string), "%s(ID: %d) Empty\n", string, i);
		}
    }
    ShowPlayerDialogEx(playerid, DIALOG_DMV_IMPOUND, DIALOG_STYLE_LIST, "DMV Menu", string, "Select", "Cancel");
	return 1;
}

CMD:taketest(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(IsADmvCar(vehicleid) && PlayerInfo[playerid][pDriverLicense] == 0)
	{
	    if(HasActiveCheckpoint(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You already have an existing checkpoint, type /killcheckpoint to delete it.");
	    else if(GetPVarInt(playerid, "TakingDMVTest") == 0)
	    {
	 		VehicleInfo[vehicleid][vStarted] = 1;
	 		VehicleInfo[vehicleid][vEngine] = 1;
	   		VehicleInfo[vehicleid][vFuel] = 100;
			SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
			SendClientMessageEx(playerid, COLOR_WHITE, "DMV: You have started the driving test, you must complete the route given.");
			SendClientMessageEx(playerid, COLOR_WHITE, "DMV: If you complete the route given, you will be awarded with a driving license.");
			SendClientMessageEx(playerid, COLOR_LIGHTRED, "HINT: Follow the red marker on your radar.");
			SetPlayerCheckpoint(playerid, DMVCheckpoints[0][0], DMVCheckpoints[0][1], DMVCheckpoints[0][2], 5.0);
			SetPVarInt(playerid, "TakingDMVTest", 1);
			SetPVarInt(playerid, "DMVStage", 0);
			return 1;
		}
		SendClientMessageEx(playerid, COLOR_GREY, "You are already taking the test.");
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_WHITE, "You are not inside a DMV testing vehicle.");
	}
	return 1;
}

CMD:startpizza(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] == 3)
	{
	    if(IsAPizzaBike(GetPlayerVehicleID(playerid)))
	    {
	    	if(HasActiveCheckpoint(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You already have an existing checkpoint, type /killcheckpoint to delete it.");
	    	if(!IsPlayerInRangeOfPoint(playerid, 10, LOCATION_PIZZADELIVERY)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the delivery spot to start a new route.");
	        else if(GetPVarInt(playerid, "PizzaID") == 0)
	        {
				new rand = random(GetAvailableHouse()-1)+1, vehicleid = GetPlayerVehicleID(playerid);
				SetPlayerCheckpoint(playerid, HouseInfo[rand][hPosition][0], HouseInfo[rand][hPosition][1], HouseInfo[rand][hPosition][2], 5.0);

			    VehicleInfo[vehicleid][vStarted] = 1;
			    VehicleInfo[vehicleid][vFuel] = 100;
			    VehicleInfo[vehicleid][vEngine] = 1;
				SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);

				SetPVarInt(playerid, "PizzaID", rand);
				SetPVarInt(playerid, "PizzaBike", vehicleid);

	            SendClientMessageEx(playerid, COLOR_ORANGE, "PIZZA:{FFFFFF} Deliver the pizza to the destination, please check the red marker.");
	            SendClientMessageEx(playerid, COLOR_YELLOW, "SALARY:{FFFFFF} You will receive your pay upon completion of the mission.");
            }
            else
            {
                SendClientMessageEx(playerid, COLOR_GREY, "You are already on a pizza mission, type /cancel pizza to cancel the mission.");
            }
	    }
	    else
	    {
	        SendClientMessageEx(playerid, COLOR_GREY, "You are not inside a bike, visit Cluckin' Bell.");
	    }
	}
	else
	{
 		SendClientMessageEx(playerid, COLOR_GREY, "You are not a Pizza Boy.");
	}
	return 1;
}

CMD:startroute(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] == 1)
	{
	    if(IsATruckerVehicle(GetPlayerVehicleID(playerid)))
	    {
	    	if(HasActiveCheckpoint(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You already have an existing checkpoint, type /killcheckpoint to delete it.");
	    	if(!IsPlayerInRangeOfPoint(playerid, 10, LOCATION_TRUCKDELIVERY)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the delivery spot to start a new route.");
	        else if(GetPVarInt(playerid, "RouteId") == 0)
	        {
				new rand = random(GetAvailableBusiness()-1)+1, vehicleid = GetPlayerVehicleID(playerid);
				SetPlayerCheckpoint(playerid, BusinessInfo[rand][bPosition][0], BusinessInfo[rand][bPosition][1], BusinessInfo[rand][bPosition][2], 5.0);

				GetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
			    VehicleInfo[vehicleid][vStarted] = 1;
			    VehicleInfo[vehicleid][vFuel] = 100;
			    VehicleInfo[vehicleid][vEngine] = 1;
				SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);

				SetPVarInt(playerid, "RouteId", rand);
				SetPVarInt(playerid, "RouteTruck", vehicleid);

	            SendClientMessageEx(playerid, COLOR_ORANGE, "MISSION:{FFFFFF} Deliver the goods to the checkpoint, your destination has been marked on your GPS.");
	            SendClientMessageEx(playerid, COLOR_ORANGE, "SALARY:{FFFFFF} You will receive your salary when you have delivered the goods and returned the truck.");
            }
            else
            {
                SendClientMessageEx(playerid, COLOR_GREY, "You are already on a mission, type /cancel route to cancel the mission.");
            }
	    }
	    else
	    {
	        SendClientMessageEx(playerid, COLOR_GREY, "You are not inside a truck, visit the trucker factory.");
	    }
	}
	else
	{
 		SendClientMessageEx(playerid, COLOR_GREY, "You are not a Trucker.");
	}
	return 1;
}

CMD:accent(playerid, params[])
{
	new string[128];
	if(isnull(params))
	{
 		SendClientMessageEx(playerid, COLOR_GREY, "Usage: /accent [accent id]");
 		SendClientMessageEx(playerid, COLOR_FADE2, "(0) None, (1) American, (2) British, (3) Australian, (4) Canadian, (5) Irish");
 		SendClientMessageEx(playerid, COLOR_FADE2, "(6) Spanish, (7) Arabic, (8) Italian, (9) Asian, (10) Scottish, (11) Russian");
 		SendClientMessageEx(playerid, COLOR_FADE2, "(12) Dutch, (13) Indian");
 		return 1;
   	}
   	else if(strval(params) < 0 || strval(params) > MAX_ACCENTS) return SendClientMessageEx(playerid, COLOR_GREY, "Please enter a valid accent id.");
	PlayerInfo[playerid][pAccent] = strval(params);
	format(string, sizeof(string), "You have changed your accent to: %s.", GetPlayerAccent(playerid));
	SendClientMessageEx(playerid, COLOR_FADE1, string);
    return 1;
}

stock GetPlayerAccent(playerid)
{
	new string[16];
	switch(PlayerInfo[playerid][pAccent])
	{
	    case 1: { format(string, sizeof(string), "American"); }
	    case 2: { format(string, sizeof(string), "British"); }
	    case 3: { format(string, sizeof(string), "Australian"); }
	    case 4: { format(string, sizeof(string), "Canadian"); }
	    case 5: { format(string, sizeof(string), "Irish"); }
	    case 6: { format(string, sizeof(string), "Spanish"); }
	    case 7: { format(string, sizeof(string), "Arabic"); }
	    case 8: { format(string, sizeof(string), "Italian"); }
	    case 9: { format(string, sizeof(string), "Asian"); }
	    case 10: { format(string, sizeof(string), "Scottish"); }
	    case 11: { format(string, sizeof(string), "Russian"); }
	    case 12: { format(string, sizeof(string), "Dutch"); }
	    case 13: { format(string, sizeof(string), "Indian"); }
	    default: { format(string, sizeof(string), ""); }
	}
	return string;
}

CMD:nos(playerid, params[])
{
	if(!IsAdmin(playerid, ADMIN_LEVEL_THREE)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
    else if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_FADE1, "You can't use this command outside of a vehicle.");
    else if(!IsCar(GetPlayerVehicleID(playerid))) return SendClientMessageEx(playerid, COLOR_GREY, "You can't use this command on this vehicle.");
    else if(GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), GetVehicleComponentType(1010)) == 1010) return SendClientMessageEx(playerid, COLOR_GREY, "This vehicle already has nitrous.");
	AddVehicleComponent(GetPlayerVehicleID(playerid), 1010);
	PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "You've added nitrous to this vehicle.");
	return 1;
}

CMD:repair(playerid, params[])
{
   	new string[128], targetid, item[8];
	if(PlayerInfo[playerid][pJob] != 2) return SendClientMessageEx(playerid, COLOR_GREY, "You are not a Mechanic.");
	else if(sscanf(params, "us[8]", targetid, item)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /repair <playerid> <item: bodykit, engine>");
	else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	//else if(playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on yourself.");
	else if(!IsPlayerInAnyVehicle(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player is not in a vehicle.");
	else if(GetPVarInt(playerid, "MechTime"))
	{
		format(string, sizeof(string), "You must wait %d seconds before repairing another vehicle.", GetPVarInt(playerid, "MechTime"));
		return SendClientMessageEx(playerid, COLOR_GREY, string);
	}

	if(!strcmp(item, "bodykit", true))
	{
	    if(!IsCar(GetPlayerVehicleID(targetid))) return SendClientMessageEx(playerid, COLOR_GREY, "You can only repair the body kit on cars.");
		format(string, sizeof(string), "You have offered %s a repair of the body kit of their car.", GetPlayerNameEx(targetid));
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "Mechanic %s has offered you a repair of the body kit on your car (/accept mechanic).", GetPlayerNameEx(playerid));
		SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
		SetPVarInt(targetid, "MechOfferType", 1);
	}
	else if(!strcmp(item, "engine", true))
	{
		format(string, sizeof(string), "You have offered %s a repair of the engine of their car.", GetPlayerNameEx(targetid));
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "Mechanic %s has offered you a repair of the engine on your car (/accept mechanic).", GetPlayerNameEx(playerid));
		SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
		SetPVarInt(targetid, "MechOfferType", 2);
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "You have specified an invalid option.");
	SetPVarInt(targetid, "MechOffer", playerid + 1);
	SetPVarInt(playerid, "CustomerMech", targetid + 1);
	return 1;
}

CMD:fixveh(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be inside a vehicle to use this command.");
		new
		    veh = GetPlayerVehicleID(playerid);
		VehicleInfo[veh][vTotalled] = 0;
		SetVehicleHealth(veh, 1000);
	    SendClientMessageEx(playerid, COLOR_WHITE, "You have repaired the engine and set the vehicle's health to 1000.");
	    if(VehicleInfo[veh][vEngine] == 0)
        	cmd_car(playerid, "engine");
	}
	return 1;
}

CMD:cancel(playerid, params[])
{
	if(sscanf(params, "{s[32]}")) {
	    return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /cancel [pizza, route, report]");
	}

	if(!strcmp(params, "pizza", true))
	{
		if(GetPVarInt(playerid, "PizzaID") != 0)
  		{
			SetVehicleToRespawn(GetPVarInt(playerid, "PizzaBike"));
	 		DeletePVar(playerid, "PizzaBike");
			DeletePVar(playerid, "PizzaID");
		 	DeletePVar(playerid, "PizzaPayment");
    		SendClientMessageEx(playerid, COLOR_GREY, "You have successfully cancelled the pizza mission.");
			DisablePlayerCheckpoint(playerid);
  		}
	}
	else if(!strcmp(params, "route", true))
	{
		if(GetPVarInt(playerid, "RouteId") != 0)
  		{
			SetVehicleToRespawn(GetPVarInt(playerid, "RouteTruck"));
	 		DeletePVar(playerid, "RouteTruck");
			DeletePVar(playerid, "RouteId");
		 	DeletePVar(playerid, "RoutePayment");
    		SendClientMessageEx(playerid, COLOR_GREY, "You have successfully cancelled the trucker mission.");
			DisablePlayerCheckpoint(playerid);
  		}
	}
	else if(!strcmp(params, "report", true))
	{
		DeleteReport(playerid);
    	SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully cancelled your report.");
	}
	else if(!strcmp(params, "contract", true))
	{
	   	if(!IsPlayerInRangeOfPoint(playerid, 2.5, LOCATION_MAILBOX)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not at the mailbox.");
	    if(HitmanTarget[playerid] != INVALID_PLAYER_ID)
	    {
			HitmanTarget[playerid] = INVALID_PLAYER_ID;
    		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* You have cancelled the contract.");
		}
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(GetPVarInt(playerid, "SmuggleRoute") > 0)
	{
	    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "You have failed the delivery of the product, you have not been paid.");
		new string[128],
			route = GetPVarInt(playerid, "SmuggleRoute") - 1,
			salary = GetDistanceBetweenTwoPoints(LOCATION_GETDRUGS, DrugWarehouses[route][0], DrugWarehouses[route][1], DrugWarehouses[route][2]);
		GivePlayerCash(playerid, salary);
		KillDrugRoute(playerid);
		format(string, sizeof(string), "* You have managed to successfully deliver the product to the location, you have been paid $%d.", salary);
   		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* %s unloads the product and lets the workers collect them.", GetPlayerNameEx(playerid));
		ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	}
	else if(GetPVarInt(playerid, "MedicCall") > 0)
	{
		if(!IsPlayerConnectedEx(GetPVarInt(playerid, "MedicCall") - 1) || PlayerInfo[GetPVarInt(playerid, "MedicCall") - 1][pWounded] != PLAYER_WOUNDED)
		{
    		DeletePVar(playerid, "MedicCall");
	    	DisablePlayerCheckpoint(playerid);
    		SendClientMessageEx(playerid, COLOR_LIGHTRED, "You arrived too late, the patient died due to lack of medical support.");
			return 1;
		}
		GameTextForPlayer(GetPVarInt(playerid, "MedicCall"), "~g~Rescued~n~~w~Awaiting Treatment...", 4000, 3);
	    SetPlayerHealthEx(GetPVarInt(playerid, "MedicCall"), 100);
    	DeletePVar(GetPVarInt(playerid, "MedicCall"), "MedicId");
    	DeletePVar(playerid, "MedicCall");
	    DisablePlayerCheckpoint(playerid);
		return 1;
	}
	else if(GetPVarInt(playerid, "PizzaPayment") == 1)
	{
	    if(GetPlayerVehicleID(playerid) == GetPVarInt(playerid, "PizzaBike"))
	    {
	 		new
	 		    rand = GetPVarInt(playerid, "PizzaID"),
 				salary = GetDistanceBetweenTwoPoints(LOCATION_PIZZADELIVERY, HouseInfo[rand][hPosition][0], HouseInfo[rand][hPosition][1], HouseInfo[rand][hPosition][2])/4,
			 	string[128];
		    SendClientMessageEx(playerid, COLOR_ORANGE, "MISSION:{FFFFFF} You have succesfully completed the mission.");
		    format(string, sizeof(string), "SALARY:{FFFFFF} $%i has been added to your paycheck for the completion of the mission.", salary);
		    SendClientMessageEx(playerid, COLOR_ORANGE, string);
		    PlayerInfo[playerid][pPaycheck] += salary;
		    SetVehicleToRespawn(GetPVarInt(playerid, "PizzaBike"));
		}
		else
		{
	  		SendClientMessageEx(playerid, COLOR_ORANGE, "MISSION:{FFFFFF} The mission was cancelled because you failed to return the bike.");
		}
	 	DeletePVar(playerid, "PizzaBike");
		DeletePVar(playerid, "PizzaID");
		DeletePVar(playerid, "PizzaPayment");
	}
	else if(GetPVarInt(playerid, "PizzaID") != 0)
	{
	    new Float:tmpFloats[3];
		GetVehiclePos(GetPVarInt(playerid, "PizzaBike"), tmpFloats[0], tmpFloats[1], tmpFloats[2]);
		if(IsPlayerInRangeOfPoint(playerid, 25.0, tmpFloats[0], tmpFloats[1], tmpFloats[2]))
		{
		    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Get off your bike and walk into the checkpoint to deliver the pizza.");
			SendClientMessageEx(playerid, COLOR_ORANGE, "PIZZA:{FFFFFF} You have delivered the pizza, now return the bike back to the pizza store to receive your pay.");
			SetPVarInt(playerid, "PizzaPayment", 1);
			DisablePlayerCheckpoint(playerid);
			return SetPlayerCheckpoint(playerid, LOCATION_PIZZADELIVERY, 5.0);
		}
		else
		{
		     return SendClientMessageEx(playerid, COLOR_ORANGE, "PIZZA:{FFFFFF} You are not near your Pizza Bike to deliver the pizza to this house.");
		}
 	}
	else if(GetPVarInt(playerid, "RoutePayment") == 1)
	{
	    if(GetPlayerVehicleID(playerid) == GetPVarInt(playerid, "RouteTruck"))
	    {
	 		new
	 		    rand = GetPVarInt(playerid, "RouteId"),
 				salary = GetDistanceBetweenTwoPoints(LOCATION_TRUCKDELIVERY, BusinessInfo[rand][bPosition][0], BusinessInfo[rand][bPosition][1], BusinessInfo[rand][bPosition][2])/4,
			 	string[128];
		    SendClientMessageEx(playerid, COLOR_ORANGE, "MISSION:{FFFFFF} You have succesfully completed the mission.");
		    format(string, sizeof(string), "SALARY:{FFFFFF} $%d had been added to your paycheck for the completion of the mission.", salary);
		    SendClientMessageEx(playerid, COLOR_ORANGE, string);
		    PlayerInfo[playerid][pPaycheck] += salary;
		    SetVehicleToRespawn(GetPVarInt(playerid, "RouteTruck"));
		}
		else
		{
	  		SendClientMessageEx(playerid, COLOR_ORANGE, "MISSION:{FFFFFF} You have failed the trucker mission because you failed to return the truck.");
		}
		DeletePVar(playerid, "RouteTruck");
		DeletePVar(playerid, "RouteId");
		DeletePVar(playerid, "RoutePayment");
	}
	else if(GetPVarInt(playerid, "RouteId") != 0)
	{
	    new Float:tmpFloats[3];
		GetVehiclePos(GetPVarInt(playerid, "RouteTruck"), tmpFloats[0], tmpFloats[1], tmpFloats[2]);
		if(IsPlayerInRangeOfPoint(playerid, 25.0, tmpFloats[0], tmpFloats[1], tmpFloats[2]))
		{
			if(IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Please get out of your truck and walk into the checkpoint to deliver the goods.");
			SendClientMessageEx(playerid, COLOR_ORANGE, "MISSION:{FFFFFF} You have delivered the goods, now return the truck back to the factory to receive your pay.");
			SetPVarInt(playerid, "RoutePayment", 1);
			DisablePlayerCheckpoint(playerid);
			return SetPlayerCheckpoint(playerid, LOCATION_TRUCKDELIVERY, 5.0);
		}
		else
		{
		     return SendClientMessageEx(playerid, COLOR_ORANGE, "TRUCKER:{FFFFFF} You are not near your Truck to deliver the goods to this business.");
		}
 	}
 	else if(GetPVarInt(playerid, "MinePayment") == 1)
 	{
	 		new salary = random(25)+26, string[128];
		    SendClientMessageEx(playerid, COLOR_ORANGE, "MISSION:{FFFFFF} You have succesfully completed the mission.");
		    format(string, sizeof(string), "SALARY:{FFFFFF} $%d had been added to your paycheck for the completion of the mission.", salary);
		    SendClientMessageEx(playerid, COLOR_ORANGE, string);
		    PlayerInfo[playerid][pPaycheck] += salary;
            DeletePVar(playerid, "MinePayment");
            PlayAnim(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
            RemovePlayerAttachedObject(playerid, INDEX_MINEOBJECT);
            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			DisablePlayerCheckpoint(playerid);
 	}
	else if(GetPVarInt(playerid, "TakingDMVTest") == 1)
	{
	    new DMVStage = GetPVarInt(playerid, "DMVStage");
	    if(DMVStage == sizeof(DMVCheckpoints) - 1)
		{
		    if(GetVehicleHealthEx(GetPlayerVehicleID(playerid)) < 950)
		    {
		      	SendClientMessageEx(playerid, COLOR_WHITE, "Examiner: You have failed the driving test because the vehicle has been damaged.");
		      	SendClientMessageEx(playerid, COLOR_WHITE, "Examiner: You have been charged $50 for damages. Good luck next time.");
		       	PlayerInfo[playerid][pDriverLicense] = 0;
		       	SetVehicleToRespawn(GetPlayerVehicleID(playerid));
		       	DisablePlayerCheckpoint(playerid);
			    DeletePVar(playerid, "DMVStage");
			    DeletePVar(playerid, "TakingDMVTest");
			    GivePlayerCash(playerid, -50);
			    AddVaultMoney(2, 50);
		    }
		    else
		    {
		      	SendClientMessageEx(playerid, COLOR_WHITE, "Examiner: You have finished the driving test, and acquired a driving license.");
		      	SendClientMessageEx(playerid, COLOR_GREEN, "A driving license has been added to your inventory. You can use /showlicenses to display it.");
		       	PlayerInfo[playerid][pDriverLicense] = 1;
		       	SetVehicleToRespawn(GetPlayerVehicleID(playerid));
		       	DisablePlayerCheckpoint(playerid);
			    DeletePVar(playerid, "DMVStage");
			    DeletePVar(playerid, "TakingDMVTest");
			    GivePlayerCash(playerid, -100);
			    AddVaultMoney(2, 100);
			}
		    return 1;
		}
		SetPVarInt(playerid, "DMVStage", DMVStage + 1);
		DMVStage = GetPVarInt(playerid, "DMVStage");
   		DisablePlayerCheckpoint(playerid);
		SetPlayerCheckpoint(playerid, DMVCheckpoints[DMVStage][0], DMVCheckpoints[DMVStage][1], DMVCheckpoints[DMVStage][2], 5.0);
		return 1;
	}
	else if(GetPVarInt(playerid, "TrackingCar") == 1)
	{
	    DeletePVar(playerid, "TrackingCar");
	    PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
	}
	else if(GetPVarInt(playerid, "TaxiFindPlayer") == 1)
	{
	    DeletePVar(playerid, "TaxiFindPlayer");
	    PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
	}
    DisablePlayerCheckpoint(playerid);
	return 1;
}
CMD:kcp(playerid, params[]) return cmd_killcheckpoint(playerid, params);
CMD:killcheckpoint(playerid, params[])
{
 	if(GetPVarInt(playerid, "PizzaID") != 0 || GetPVarInt(playerid, "PizzaPayment") == 1)
	{
		SetVehicleToRespawn(GetPVarInt(playerid, "PizzaBike"));
		DeletePVar(playerid, "PizzaBike");
		DeletePVar(playerid, "PizzaID");
	 	DeletePVar(playerid, "PizzaPayment");
	}

	else if(GetPVarInt(playerid, "RouteId") != 0 || GetPVarInt(playerid, "RoutePayment") == 1)
	{
	    SetVehicleToRespawn(GetPVarInt(playerid, "RouteTruck"));
		DeletePVar(playerid, "RouteTruck");
		DeletePVar(playerid, "RouteId");
		DeletePVar(playerid, "RoutePayment");
	}
	DeletePVar(playerid, "PizzaID");
	DeletePVar(playerid, "EMSCheckpoint");
	DeletePVar(playerid, "TakingDMVTest");
	DeletePVar(playerid, "PizzaPayment");
	DeletePVar(playerid, "TrackingCar");
	DeletePVar(playerid, "TaxiFindPlayer");
	if(PlayerInfo[playerid][pJob] == 6)
		KillDrugRoute(playerid);
	DisablePlayerCheckpoint(playerid);
	SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully killed all existing checkpoints, you may now use them again.");
	return 1;
}


CMD:anims(playerid, params[]) return cmd_animhelp(playerid, params);
CMD:animhelp(playerid, params[])
{
	SendClientMessageEx(playerid, COLOR_WHITE, "---------------------------------------------------");
	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, ""SERVER_NAME" - Animations");
	SendClientMessageEx(playerid, COLOR_WHITE, "/handsup /drunk /bomb /rob /laugh /lookout /robman /crossarms /sit /siteat /hide /vomit /eat");
	SendClientMessageEx(playerid, COLOR_WHITE, "/wave /slapass /deal /taichi /crack /smoke /chat /dance /fucku /drinkwater /pedmove /bat");
	SendClientMessageEx(playerid, COLOR_WHITE, "/checktime /sleep /blob /opendoor /wavedown /shakehand /reload /cpr /dive /showoff /box /tag");
	SendClientMessageEx(playerid, COLOR_WHITE, "/goggles /cry /dj /cheer /throw /robbed /hurt /nobreath /bar /getjiggy /fallover /rap /piss");
	SendClientMessageEx(playerid, COLOR_WHITE, "/salute /crabs /washhands /signal /stop /gesture /jerkoff /idles /lowrider /car");
	SendClientMessageEx(playerid, COLOR_WHITE, "/blowjob /spank /sunbathe /kiss /snatch /sneak /copa /sexy /holdup /misc /bodypush /walkstyle");
	SendClientMessageEx(playerid, COLOR_WHITE, "/lowbodypush /headbutt /airkick /doorkick /leftslap /elbow /coprun /sitonchair /lean /wank");
	SendClientMessageEx(playerid, COLOR_GREY, "Use /stopanim to clear your animations.");
	SendClientMessageEx(playerid, COLOR_WHITE, "---------------------------------------------------");
	return 1;
}

CMD:stopanim(playerid, params[])
{
	if(IsPlayerRestricted(playerid))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You can't do that at this time.");
		return 1;
	}
	if(IsPlayerInAnyVehicle(playerid) == 1)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "This command requires you to be outside a vehicle.");
		return 1;
	}
	ClearAnimations(playerid);
	SetPlayerSkin(playerid, GetPlayerSkin(playerid));
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	return 1;
}

CMD:bodypush(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	if(GetPlayerAnimationIndex(playerid) != 0) ClearAnimations(playerid);
    ApplyAnimation(playerid,"GANGS","shake_cara",4.0,0,0,0,0,0);
	return 1;
}

CMD:lowbodypush(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	if(GetPlayerAnimationIndex(playerid) != 0) ClearAnimations(playerid);
    ApplyAnimation(playerid,"GANGS","shake_carSH",4.0,0,0,0,0,0);
	return 1;
}

CMD:headbutt(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	if(GetPlayerAnimationIndex(playerid) != 0) ClearAnimations(playerid);
    ApplyAnimation(playerid,"WAYFARER","WF_Fwd",4.0,0,0,0,0,0);
	return 1;
}

CMD:airKickEx(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	if(GetPlayerAnimationIndex(playerid) != 0) ClearAnimations(playerid);
    ApplyAnimation(playerid,"FIGHT_C","FightC_M",4.0,0,1,1,0,0);
	return 1;
}

CMD:doorKickEx(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	if(GetPlayerAnimationIndex(playerid) != 0) ClearAnimations(playerid);
    ApplyAnimation(playerid,"POLICE","Door_Kick",4.0,0,0,0,0,0);
	return 1;
}

CMD:leftslap(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	if(GetPlayerAnimationIndex(playerid) != 0) ClearAnimations(playerid);
    ApplyAnimation(playerid,"PED","BIKE_elbowL",4.0,0,0,0,0,0);
	return 1;
}

CMD:elbow(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	if(GetPlayerAnimationIndex(playerid) != 0) ClearAnimations(playerid);
    ApplyAnimation(playerid,"FIGHT_D","FightD_3",4.0,0,1,1,0,0);
	return 1;
}

CMD:coprun(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	if(GetPlayerAnimationIndex(playerid) != 0) ClearAnimations(playerid);
    ApplyAnimation(playerid,"SWORD","sword_block",50.0,0,1,1,1,1);
	return 1;
}

CMD:handsup(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	if(GetPlayerAnimationIndex(playerid) != 0) ClearAnimations(playerid);
    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
	return 1;
}

CMD:piss(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	if(GetPlayerAnimationIndex(playerid) != 0) ClearAnimations(playerid);
   	SetPlayerSpecialAction(playerid, 68);
	return 1;
}

CMD:sneak(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	LoopingAnim(playerid, "PED", "Player_Sneak", 4.1, 1, 1, 1, 1, 1, 1);
	return 1;
}

CMD:drunk(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
   	LoopingAnim(playerid, "PED", "WALK_DRUNK", 4.0, 1, 1, 1, 1, 1, 1);
    return 1;
}

CMD:bomb(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
   	PlayAnim(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
    return 1;
}

CMD:rob(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	LoopingAnim(playerid, "ped", "ARRESTgun", 4.0, 0, 1, 1, 1, 1, 1);
	return 1;
}

CMD:laugh(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	LoopingAnim(playerid, "RAPPING", "Laugh_01", 4.0, 1, 0, 0, 0, 0, 1);
	return 1;
}

CMD:lookout(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
   	PlayAnim(playerid, "SHOP", "ROB_Shifty", 4.0, 0, 0, 0, 0, 0, 1);
    return 1;
}

CMD:robman(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:hide(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "ped", "cower", 3.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:vomit(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "FOOD", "EAT_Vomit_P", 3.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:eat(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "FOOD", "EAT_Burger", 3.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:slapass(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    PlayAnim(playerid, "SWEET", "sweet_ass_slap", 4.0, 0, 0, 0, 0, 0, 1);
    return 1;
}

CMD:crack(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:fucku(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    PlayAnim(playerid, "PED", "fucku", 4.0, 0, 0, 0, 0, 0, 1);
    return 1;
}

CMD:taichi(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "PARK", "Tai_Chi_Loop", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:drinkwater(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "BAR", "dnk_stndF_loop", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:checktime(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    PlayAnim(playerid, "COP_AMBIENT", "Coplook_watch", 4.0, 0, 0, 0, 0, 0, 1);
    return 1;
}

CMD:sleep(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "CRACK", "crckdeth4", 4.0, 0, 1, 1, 1, 0, 1);
    return 1;
}

CMD:blob(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "CRACK", "crckidle1", 4.0, 0, 1, 1, 1, 0, 1);
    return 1;
}

CMD:opendoor(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    PlayAnim(playerid, "AIRPORT", "thrw_barl_thrw", 4.0, 0, 0, 0, 0, 0, 1);
    return 1;
}

CMD:wavedown(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    PlayAnim(playerid, "BD_FIRE", "BD_Panic_01", 4.0, 0, 0, 0, 0, 0, 1);
    return 1;
}

CMD:cpr(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    PlayAnim(playerid, "MEDIC", "CPR", 4.0, 0, 0, 0, 0, 0, 1);
    return 1;
}

CMD:dive(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "DODGE", "Crush_Jump", 4.0, 0, 1, 1, 1, 0, 1);
    return 1;
}

CMD:showoff(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "Freeweights", "gym_free_celebrate", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:goggles(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    PlayAnim(playerid, "goggles", "goggles_put_on", 4.0, 0, 0, 0, 0, 0, 1);
    return 1;
}

CMD:cry(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "GRAVEYARD", "mrnF_loop", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:throw(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    PlayAnim(playerid, "GRENADE", "WEAPON_throw", 4.0, 0, 0, 0, 0, 0, 1);
    return 1;
}

CMD:robbed(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "SHOP", "SHP_Rob_GiveCash", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:hurt(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "SWAT", "gnstwall_injurd", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:box(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "GYMNASIUM", "GYMshadowbox", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:washhands(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:crabs(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "MISC", "Scratchballs_01", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:salute(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "ON_LOOKERS", "Pointup_loop", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:jerkoff(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "PAULNMAC", "wank_out", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:stop(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
    LoopingAnim(playerid, "PED", "endchat_01", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:rap(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "RAPPING", "RAP_A_Loop", 4.0, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "RAPPING", "RAP_B_Loop", 4.0, 1, 0, 0, 0, 0, 1);
		case 3: LoopingAnim(playerid, "RAPPING", "RAP_C_Loop", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /rap [1-3]");
	}
	return 1;
}

CMD:wank(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "PAULNMAC", "wank_in", 4.0, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "PAULNMAC", "wank_loop", 4.0, 1, 0, 0, 0, 0, 1);
		case 3: LoopingAnim(playerid, "PAULNMAC", "wank_out", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /wank [1-3]");
	}
	return 1;
}

CMD:chat(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "PED", "IDLE_CHAT", 4.0, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "GANGS", "prtial_gngtlkA", 4.0, 1, 0, 0, 0, 0, 1);
		case 3:	LoopingAnim(playerid, "GANGS", "prtial_gngtlkB", 4.0, 1, 0, 0, 0, 0, 1);
		case 4: LoopingAnim(playerid, "GANGS", "prtial_gngtlkE", 4.0, 1, 0, 0, 0, 0, 1);
		case 5: LoopingAnim(playerid, "GANGS", "prtial_gngtlkF", 4.0, 1, 0, 0, 0, 0, 1);
		case 6: LoopingAnim(playerid, "GANGS", "prtial_gngtlkG", 4.0, 1, 0, 0, 0, 0, 1);
		case 7:	LoopingAnim(playerid, "GANGS", "prtial_gngtlkH", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /chat [1-7]");
	}
	return 1;
}

CMD:sitdown(playerid, params[]) return cmd_sitonchair(playerid, params);
CMD:sitonchair(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "Attractors", "Stepsit_in", 4.0, 0, 0, 0, 1, 0, 1);
		case 2: LoopingAnim(playerid, "CRIB", "PED_Console_Loop", 4.0, 1, 0, 0, 0, 0, 1);
		case 3: LoopingAnim(playerid, "INT_HOUSE", "LOU_In", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: LoopingAnim(playerid, "MISC", "SEAT_LR", 4.0, 1, 0, 0, 0, 0, 1);
		case 5: LoopingAnim(playerid, "MISC", "Seat_talk_01", 4.0, 1, 0, 0, 0, 0, 1);
		case 6: LoopingAnim(playerid, "MISC", "Seat_talk_02", 4.0, 1, 0, 0, 0, 0, 1);
		case 7: LoopingAnim(playerid, "ped", "SEAT_down", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /sitonchair [1-7]");
	}
	return 1;
}

CMD:bat(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid,"BASEBALL","Bat_IDLE",4.1, 0, 1, 1, 1, 1, 1);
		case 2: LoopingAnim(playerid, "CRACK", "Bbalbat_Idle_01", 4.0, 1, 0, 0, 0, 0, 1);
		case 3: LoopingAnim(playerid, "CRACK", "Bbalbat_Idle_02", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /bat [1-3]");
	}
	return 1;
}

CMD:lean(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "GANGS", "leanIDLE", 4.0, 0, 0, 0, 1, 0, 1);
		case 2: LoopingAnim(playerid, "MISC", "Plyrlean_loop", 4.0, 0, 0, 0, 1, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /lean [1-2]");
	}
	return 1;
}

CMD:gesture(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: PlayAnim(playerid, "GHANDS", "gsign1", 4.0, 0, 0, 0, 0, 0, 1);
		case 2: PlayAnim(playerid, "GHANDS", "gsign1LH", 4.0, 0, 0, 0, 0, 0, 1);
		case 3: PlayAnim(playerid, "GHANDS", "gsign2", 4.0, 0, 0, 0, 0, 0, 1);
		case 4: PlayAnim(playerid, "GHANDS", "gsign2LH", 4.0, 0, 0, 0, 0, 0, 1);
		case 5: PlayAnim(playerid, "GHANDS", "gsign3", 4.0, 0, 0, 0, 0, 0, 1);
		case 6: PlayAnim(playerid, "GHANDS", "gsign3LH", 4.0, 0, 0, 0, 0, 0, 1);
		case 7: PlayAnim(playerid, "GHANDS", "gsign4", 4.0, 0, 0, 0, 0, 0, 1);
		case 8: PlayAnim(playerid, "GHANDS", "gsign4LH", 4.0, 0, 0, 0, 0, 0, 1);
		case 9: PlayAnim(playerid, "GHANDS", "gsign5", 4.0, 0, 0, 0, 0, 0, 1);
		case 10: PlayAnim(playerid, "GHANDS", "gsign5", 4.0, 0, 0, 0, 0, 0, 1);
		case 11: PlayAnim(playerid, "GHANDS", "gsign5LH", 4.0, 0, 0, 0, 0, 0, 1);
		case 12: PlayAnim(playerid, "GANGS", "Invite_No", 4.0, 0, 0, 0, 0, 0, 1);
		case 13: PlayAnim(playerid, "GANGS", "Invite_Yes", 4.0, 0, 0, 0, 0, 0, 1);
		case 14: PlayAnim(playerid, "GANGS", "prtial_gngtlkD", 4.0, 0, 0, 0, 0, 0, 1);
		case 15: PlayAnim(playerid, "GANGS", "smkcig_prtl", 4.0, 0, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /gesture [1-15]");
	}
	return 1;
}

CMD:lay(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "BEACH", "bather", 4.0, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "BEACH", "Lay_Bac_Loop", 4.0, 1, 0, 0, 0, 0, 1);
		case 3: LoopingAnim(playerid, "BEACH", "SitnWait_loop_W", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /lay [1-3]");
	}
	return 1;
}

CMD:wave(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "ON_LOOKERS", "wave_loop", 4.0, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "KISSING", "gfwave2", 4.0, 1, 0, 0, 0, 0, 1);
		case 3: LoopingAnim(playerid, "PED", "endchat_03", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /wave [1-3]");
	}
	return 1;
}

CMD:signal(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "POLICE", "CopTraf_Come", 4.0, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "POLICE", "CopTraf_Stop", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /signal [1-2]");
	}
	return 1;
}

CMD:nobreath(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "PED", "IDLE_tired", 4.0, 1, 0, 0, 0, 0, 1);
		case 3: LoopingAnim(playerid, "FAT", "IDLE_tired", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /nobreath [1-3]");
	}
	return 1;
}

CMD:fallover(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "KNIFE", "KILL_Knife_Ped_Die", 4.0, 0, 1, 1, 1, 0, 1);
		case 2: LoopingAnim(playerid, "PED", "KO_shot_face", 4.0, 0, 1, 1, 1, 0, 1);
		case 3: LoopingAnim(playerid, "PED", "KO_shot_stom", 4.0, 0, 1, 1, 1, 0, 1);
		case 4: LoopingAnim(playerid, "PED", "BIKE_fallR", 4.1, 0, 1, 1, 1, 0, 1);
		case 5: LoopingAnim(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /fallover [1-5]");
	}
	return 1;
}

CMD:pedmove(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "PED", "JOG_femaleA", 4.0, 1, 1, 1, 1, 1, 1);
		case 2: LoopingAnim(playerid, "PED", "JOG_maleA", 4.0, 1, 1, 1, 1, 1, 1);
		case 3: LoopingAnim(playerid, "PED", "WOMAN_walkfatold", 4.0, 1, 1, 1, 1, 1, 1);
		case 4: LoopingAnim(playerid, "PED", "run_fat", 4.0, 1, 1, 1, 1, 1, 1);
		case 5: LoopingAnim(playerid, "PED", "run_fatold", 4.0, 1, 1, 1, 1, 1, 1);
		case 6: LoopingAnim(playerid, "PED", "run_old", 4.0, 1, 1, 1, 1, 1, 1);
		case 7: LoopingAnim(playerid, "PED", "Run_Wuzi", 4.0, 1, 1, 1, 1, 1, 1);
		case 8: LoopingAnim(playerid, "PED", "swat_run", 4.0, 1, 1, 1, 1, 1, 1);
		case 9: LoopingAnim(playerid, "PED", "WALK_fat", 4.0, 1, 1, 1, 1, 1, 1);
		case 10: LoopingAnim(playerid, "PED", "WALK_fatold", 4.0, 1, 1, 1, 1, 1, 1);
		case 11: LoopingAnim(playerid, "PED", "WALK_gang1", 4.0, 1, 1, 1, 1, 1, 1);
		case 12: LoopingAnim(playerid, "PED", "WALK_gang2", 4.0, 1, 1, 1, 1, 1, 1);
		case 13: LoopingAnim(playerid, "PED", "WALK_old", 4.0, 1, 1, 1, 1, 1, 1);
		case 14: LoopingAnim(playerid, "PED", "WALK_shuffle", 4.0, 1, 1, 1, 1, 1, 1);
		case 15: LoopingAnim(playerid, "PED", "woman_run", 4.0, 1, 1, 1, 1, 1, 1);
		case 16: LoopingAnim(playerid, "PED", "WOMAN_runbusy", 4.0, 1, 1, 1, 1, 1, 1);
		case 17: LoopingAnim(playerid, "PED", "WOMAN_runfatold", 4.0, 1, 1, 1, 1, 1, 1);
		case 18: LoopingAnim(playerid, "PED", "woman_runpanic", 4.0, 1, 1, 1, 1, 1, 1);
		case 19: LoopingAnim(playerid, "PED", "WOMAN_runsexy", 4.0, 1, 1, 1, 1, 1, 1);
		case 20: LoopingAnim(playerid, "PED", "WOMAN_walkbusy", 4.0, 1, 1, 1, 1, 1, 1);
		case 21: LoopingAnim(playerid, "PED", "WOMAN_walkfatold", 4.0, 1, 1, 1, 1, 1, 1);
		case 22: LoopingAnim(playerid, "PED", "WOMAN_walknorm", 4.0, 1, 1, 1, 1, 1, 1);
		case 23: LoopingAnim(playerid, "PED", "WOMAN_walkold", 4.0, 1, 1, 1, 1, 1, 1);
		case 24: LoopingAnim(playerid, "PED", "WOMAN_walkpro", 4.0, 1, 1, 1, 1, 1, 1);
		case 25: LoopingAnim(playerid, "PED", "WOMAN_walksexy", 4.0, 1, 1, 1, 1, 1, 1);
		case 26: LoopingAnim(playerid, "PED", "WOMAN_walkshop", 4.0, 1, 1, 1, 1, 1, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /pedmove [1-26]");
	}
	return 1;
}

CMD:getjiggy(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "DANCING", "DAN_Down_A", 4.0, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "DANCING", "DAN_Left_A", 4.0, 1, 0, 0, 0, 0, 1);
		case 3: LoopingAnim(playerid, "DANCING", "DAN_Loop_A", 4.0, 1, 0, 0, 0, 0, 1);
		case 4: LoopingAnim(playerid, "DANCING", "DAN_Right_A", 4.0, 1, 0, 0, 0, 0, 1);
		case 5: LoopingAnim(playerid, "DANCING", "DAN_Up_A", 4.0, 1, 0, 0, 0, 0, 1);
		case 6: LoopingAnim(playerid, "DANCING", "dnce_M_a", 4.0, 1, 0, 0, 0, 0, 1);
		case 7: LoopingAnim(playerid, "DANCING", "dnce_M_b", 4.0, 1, 0, 0, 0, 0, 1);
		case 8: LoopingAnim(playerid, "DANCING", "dnce_M_c", 4.0, 1, 0, 0, 0, 0, 1);
		case 9: LoopingAnim(playerid, "DANCING", "dnce_M_c", 4.0, 1, 0, 0, 0, 0, 1);
		case 10: LoopingAnim(playerid, "DANCING", "dnce_M_d", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /getjiggy [1-10]");
	}
	return 1;
}

CMD:stripclub(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "STRIP", "PLY_CASH", 4.0, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "STRIP", "PUN_CASH", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /stripclub [1-2]");
	}
	return 1;
}

CMD:smoke(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: PlayAnim(playerid, "SMOKING", "M_smk_in", 4.0, 0, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "SMOKING", "M_smklean_loop", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /smoke [1-2]");
	}
	return 1;
}

CMD:dj(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "SCRATCHING", "scdldlp", 4.0, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "SCRATCHING", "scdlulp", 4.0, 1, 0, 0, 0, 0, 1);
		case 3: LoopingAnim(playerid, "SCRATCHING", "scdrdlp", 4.0, 1, 0, 0, 0, 0, 1);
		case 4: LoopingAnim(playerid, "SCRATCHING", "scdrulp", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /dj [1-4]");
	}
	return 1;
}

CMD:reload(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: PlayAnim(playerid, "BUDDY", "buddy_reload", 4.0, 0, 0, 0, 0, 0, 1);
		case 2: PlayAnim(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /reload [1-2]");
	}
	return 1;
}

CMD:tag(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "GRAFFITI", "graffiti_Chkout", 4.0, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "GRAFFITI", "spraycan_fire", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /tag [1-2]");
	}
	return 1;
}

CMD:deal(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "DEALER", "DEALER_DEAL", 4.0, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "DEALER", "shop_pay", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /deal [1-2]");
	}
	return 1;
}

CMD:crossarms(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1, 1);
		case 2: LoopingAnim(playerid, "DEALER", "DEALER_IDLE", 4.0, 1, 0, 0, 0, 0, 1);
		case 3: LoopingAnim(playerid, "GRAVEYARD", "mrnM_loop", 4.0, 1, 0, 0, 0, 0, 1);
		case 4: LoopingAnim(playerid, "GRAVEYARD", "prst_loopa", 4.0, 1, 0, 0, 0, 0, 1);
		case 5: LoopingAnim(playerid, "DEALER", "DEALER_IDLE_01", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /crossarms [1-5]");
	}
	return 1;
}

CMD:cheer(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "ON_LOOKERS", "shout_01", 4.0, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "ON_LOOKERS", "shout_02", 4.0, 1, 0, 0, 0, 0, 1);
		case 3: LoopingAnim(playerid, "ON_LOOKERS", "shout_in", 4.0, 1, 0, 0, 0, 0, 1);
		case 4: LoopingAnim(playerid, "RIOT", "RIOT_ANGRY_B", 4.0, 1, 0, 0, 0, 0, 1);
		case 5: LoopingAnim(playerid, "RIOT", "RIOT_CHANT", 4.0, 1, 0, 0, 0, 0, 1);
		case 6: LoopingAnim(playerid, "RIOT", "RIOT_shout", 4.0, 1, 0, 0, 0, 0, 1);
		case 7: LoopingAnim(playerid, "STRIP", "PUN_HOLLER", 4.0, 1, 0, 0, 0, 0, 1);
		case 8: LoopingAnim(playerid, "OTB", "wtchrace_win", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /cheer [1-8]");
	}
	return 1;
}

CMD:sit(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "BEACH", "bather", 4.0, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "BEACH", "Lay_Bac_Loop", 4.0, 1, 0, 0, 0, 0, 1);
		case 3: LoopingAnim(playerid, "BEACH", "ParkSit_W_loop", 4.0, 1, 0, 0, 0, 0, 1);
		case 4: LoopingAnim(playerid, "BEACH", "SitnWait_loop_W", 4.0, 1, 0, 0, 0, 0, 1);
		case 5: LoopingAnim(playerid, "BEACH", "ParkSit_M_loop", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /sit [1-5]");
	}
	return 1;
}

CMD:siteat(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	LoopingAnim(playerid, "FOOD", "FF_Sit_Eat3", 4.0, 1, 0, 0, 0, 0, 1);
	return 1;
}

CMD:bar(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: PlayAnim(playerid, "BAR", "Barcustom_get", 4.0, 0, 1, 0, 0, 0, 1);
		case 2: PlayAnim(playerid, "BAR", "Barserve_bottle", 4.0, 0, 0, 0, 0, 0, 1);
		case 3: PlayAnim(playerid, "BAR", "Barserve_give", 4.0, 0, 0, 0, 0, 0, 1);
		case 4: PlayAnim(playerid, "BAR", "dnk_stndM_loop", 4.0, 0, 0, 0, 0, 0, 1);
		case 5: LoopingAnim(playerid, "BAR", "BARman_idle", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /bar [1-5]");
	}
	return 1;
}

CMD:dance(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	if(GetPlayerAnimationIndex(playerid) != 0) ClearAnimations(playerid);
	switch(strval(params))
	{
		case 1: SetPlayerSpecialAction(playerid, 5);
		case 2: SetPlayerSpecialAction(playerid, 6);
		case 3: SetPlayerSpecialAction(playerid, 7);
		case 4: SetPlayerSpecialAction(playerid, 8);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /dance [1-4]");
	}
	return 1;
}

CMD:spank(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "SNM", "SPANKINGW", 4.1, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "SNM", "SPANKINGP", 4.1, 1, 0, 0, 0, 0, 1);
		case 3: LoopingAnim(playerid, "SNM", "SPANKEDW", 4.1, 1, 0, 0, 0, 0, 1);
		case 4: LoopingAnim(playerid, "SNM", "SPANKEDP", 4.1, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /spank [1-4]");
	}
	return 1;
}

CMD:sexy(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "STRIP", "strip_E", 4.1, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "STRIP", "strip_G", 4.1, 1, 0, 0, 0, 0, 1);
		case 3: PlayAnim(playerid, "STRIP", "STR_A2B", 4.1, 0, 0, 0, 0, 0, 1);
		case 4: LoopingAnim(playerid, "STRIP", "STR_Loop_A", 4.1, 1, 0, 0, 0, 0, 1);
		case 5: LoopingAnim(playerid, "STRIP", "STR_Loop_B", 4.1, 1, 0, 0, 0, 0, 1);
		case 6: LoopingAnim(playerid, "STRIP", "STR_Loop_C", 4.1, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /sexy [1-6]");
	}
	return 1;
}

CMD:holdup(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "POOL", "POOL_ChalkCue", 4.1, 0, 1, 1, 1, 1, 1);
		case 2: LoopingAnim(playerid, "POOL", "POOL_Idle_Stance", 4.1, 0, 1, 1, 1, 1, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /holdup [1-2]");
	}
	return 1;
}

CMD:copa(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: PlayAnim(playerid, "POLICE", "CopTraf_Away", 4.1, 0, 0, 0, 0, 0, 1);
		case 2: PlayAnim(playerid, "POLICE", "CopTraf_Come", 4.1, 0, 0, 0, 0, 0, 1);
		case 3: PlayAnim(playerid, "POLICE", "CopTraf_Left", 4.1, 0, 0, 0, 0, 0, 1);
		case 4: PlayAnim(playerid, "POLICE", "CopTraf_Stop", 4.1, 0, 0, 0, 0, 0, 1);
		case 5: LoopingAnim(playerid, "POLICE", "Cop_move_FWD", 4.1, 1, 1, 1, 1, 1, 1);
		case 6: LoopingAnim(playerid, "POLICE", "crm_drgbst_01", 4.1, 0, 0, 0, 1, 5000, 1);
		case 7: PlayAnim(playerid, "POLICE", "Door_Kick", 4.1, 0, 1, 1, 1, 1, 1);
		case 8: PlayAnim(playerid, "POLICE", "plc_drgbst_01", 4.1, 0, 0, 0, 0, 5000, 1);
		case 9: PlayAnim(playerid, "POLICE", "plc_drgbst_02", 4.1, 0, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /copa [1-9]");
	}
	return 1;
}

CMD:misc(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "CAR", "Fixn_Car_Loop", 4.1, 1, 0, 0, 0, 0, 1);
		case 2: PlayAnim(playerid, "CAR", "flag_drop", 4.1, 0, 0, 0, 0, 0, 1);
		case 3: PlayAnim(playerid, "PED", "bomber", 4.1, 0, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /misc [1-3]");
	}
	return 1;
}

CMD:snatch(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: PlayAnim(playerid, "PED", "BIKE_elbowL", 4.1, 0, 0, 0, 0, 0, 1);
		case 2: PlayAnim(playerid, "PED", "BIKE_elbowR", 4.1, 0, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /snatch [1-2]");
	}
	return 1;
}

CMD:blowjob(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "BLOWJOBZ", "BJ_COUCH_LOOP_P", 4.1, 1, 0, 0, 0, 0, 1);
		case 2: LoopingAnim(playerid, "BLOWJOBZ", "BJ_STAND_LOOP_P", 4.1, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /blowjob [1-2]");
	}
	return 1;
}

CMD:kiss(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: PlayAnim(playerid, "KISSING", "Playa_Kiss_01", 4.1, 0, 0, 0, 0, 0, 1);
		case 2: PlayAnim(playerid, "KISSING", "Playa_Kiss_02", 4.1, 0, 0, 0, 0, 0, 1);
		case 3: PlayAnim(playerid, "KISSING", "Playa_Kiss_03", 4.1, 0, 0, 0, 0, 0, 1);
		case 4: PlayAnim(playerid, "KISSING", "Grlfrd_Kiss_01", 4.1, 0, 0, 0, 0, 0, 1);
		case 5: PlayAnim(playerid, "KISSING", "Grlfrd_Kiss_02", 4.1, 0, 0, 0, 0, 0, 1);
		case 6: PlayAnim(playerid, "KISSING", "Grlfrd_Kiss_03", 4.1, 0, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /kiss [1-6]");
	}
	return 1;
}

CMD:idles(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "PLAYIDLES", "shift", 4.1, 1, 1, 1, 1, 1, 1);
		case 2: LoopingAnim(playerid, "PLAYIDLES", "shldr", 4.1, 1, 1, 1, 1, 1, 1);
		case 3: LoopingAnim(playerid, "PLAYIDLES", "stretch", 4.1, 1, 1, 1, 1, 1, 1);
		case 4: LoopingAnim(playerid, "PLAYIDLES", "strleg", 4.1, 1, 1, 1, 1, 1, 1);
		case 5: LoopingAnim(playerid, "PLAYIDLES", "time", 4.1, 1, 1, 1, 1, 1, 1);
		case 6: LoopingAnim(playerid, "COP_AMBIENT", "Copbrowse_loop", 4.1, 1, 0, 0, 0, 0, 1);
		case 7: LoopingAnim(playerid, "COP_AMBIENT", "Coplook_loop", 4.1, 1, 0, 0, 0, 0, 1);
		case 8: LoopingAnim(playerid, "COP_AMBIENT", "Coplook_shake", 4.1, 1, 0, 0, 0, 0, 1);
		case 9: LoopingAnim(playerid, "COP_AMBIENT", "Coplook_think", 4.1, 1, 0, 0, 0, 0, 1);
		case 10: LoopingAnim(playerid, "COP_AMBIENT", "Coplook_watch", 4.1, 1, 0, 0, 0, 0, 1);
		case 11: LoopingAnim(playerid, "PED", "roadcross", 4.1, 1, 0, 0, 0, 0, 1);
		case 12: LoopingAnim(playerid, "PED", "roadcross_female", 4.1, 1, 0, 0, 0, 0, 1);
		case 13: LoopingAnim(playerid, "PED", "roadcross_gang", 4.1, 1, 0, 0, 0, 0, 1);
		case 14: LoopingAnim(playerid, "PED", "roadcross_old", 4.1, 1, 0, 0, 0, 0, 1);
		case 15: LoopingAnim(playerid, "PED", "woman_idlestance", 4.1, 1, 0, 0, 0, 0, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /idles [1-15]");
	}
	return 1;
}
CMD:sunbathe(playerid, params[])
{
	if(!IsAbleToUseAnimation(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this right now.");
	switch(strval(params))
	{
		case 1: LoopingAnim(playerid, "SUNBATHE", "batherdown", 4.1, 0, 1, 1, 1, 1, 1);
		case 2: LoopingAnim(playerid, "SUNBATHE", "batherup", 4.1, 0, 1, 1, 1, 1, 1);
		case 3: LoopingAnim(playerid, "SUNBATHE", "Lay_Bac_in", 4.1, 0, 1, 1, 1, 1, 1);
		case 4: LoopingAnim(playerid, "SUNBATHE", "Lay_Bac_out", 4.1, 0, 1, 1, 1, 1, 1);
		case 5: LoopingAnim(playerid, "SUNBATHE", "ParkSit_M_IdleA", 4.1, 0, 1, 1, 1, 1, 1);
		case 6: LoopingAnim(playerid, "SUNBATHE", "ParkSit_M_IdleB", 4.1, 0, 1, 1, 1, 1, 1);
		case 7: LoopingAnim(playerid, "SUNBATHE", "ParkSit_M_IdleC", 4.1, 0, 1, 1, 1, 1, 1);
		case 8: LoopingAnim(playerid, "SUNBATHE", "ParkSit_M_in", 4.1, 0, 1, 1, 1, 1, 1);
		case 9: LoopingAnim(playerid, "SUNBATHE", "ParkSit_M_out", 4.1, 0, 1, 1, 1, 1, 1);
		case 10: LoopingAnim(playerid, "SUNBATHE", "ParkSit_W_idleA", 4.1, 0, 1, 1, 1, 1, 1);
		case 11: LoopingAnim(playerid, "SUNBATHE", "ParkSit_W_idleB", 4.1, 0, 1, 1, 1, 1, 1);
		case 12: LoopingAnim(playerid, "SUNBATHE", "ParkSit_W_idleC", 4.1, 0, 1, 1, 1, 1, 1);
		case 13: LoopingAnim(playerid, "SUNBATHE", "ParkSit_W_in", 4.1, 0, 1, 1, 1, 1, 1);
		case 14: LoopingAnim(playerid, "SUNBATHE", "ParkSit_W_out", 4.1, 0, 1, 1, 1, 1, 1);
		case 15: LoopingAnim(playerid, "SUNBATHE", "SBATHE_F_LieB2Sit", 4.1, 0, 1, 1, 1, 1, 1);
		case 16: LoopingAnim(playerid, "SUNBATHE", "SBATHE_F_Out", 4.1, 0, 1, 1, 1, 1, 1);
		case 17: LoopingAnim(playerid, "SUNBATHE", "SitnWait_in_W", 4.1, 0, 1, 1, 1, 1, 1);
		case 18: LoopingAnim(playerid, "SUNBATHE", "SitnWait_out_W", 4.1, 0, 1, 1, 1, 1, 1);
		default: SendClientMessageEx(playerid, COLOR_WHITE, "Usage: /sunbathe [1-18]");
	}
	return 1;
}

stock KillDrugRoute(playerid)
{
	if(IsPlayerInAnyVehicle(playerid) && VehicleInfo[GetPlayerVehicleID(playerid)][vDrugs] - 1 == playerid)
	{
	    VehicleInfo[GetPlayerVehicleID(playerid)][vDrugs] = 0;
	}
	else
	{
		for (new i=0; i < MAX_VEHICLES; i++)
		{
			if(VehicleInfo[i][vDrugs] > 0 && VehicleInfo[i][vDrugs] - 1 == playerid)
				VehicleInfo[i][vDrugs] = 0;
		}
	}
	if(IsPlayerConnected(playerid))
	{
		DeletePVar(playerid, "SmuggleRoute");
		DisablePlayerCheckpoint(playerid);
	}
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

new legalmods[48][22] = {
	{400, 1024,1021,1020,1019,1018,1013,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
	{401, 1145,1144,1143,1142,1020,1019,1017,1013,1007,1006,1005,1004,1003,1001,0000,0000,0000,0000},
    {404, 1021,1020,1019,1017,1016,1013,1007,1002,1000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {405, 1023,1021,1020,1019,1018,1014,1001,1000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {410, 1024,1023,1021,1020,1019,1017,1013,1007,1003,1001,0000,0000,0000,0000,0000,0000,0000,0000},
    {415, 1023,1019,1018,1017,1007,1003,1001,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {418, 1021,1020,1016,1006,1002,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {420, 1021,1019,1005,1004,1003,1001,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {421, 1023,1021,1020,1019,1018,1016,1014,1000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {422, 1021,1020,1019,1017,1013,1007,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {426, 1021,1019,1006,1005,1004,1003,1001,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {436, 1022,1021,1020,1019,1017,1013,1007,1006,1003,1001,0000,0000,0000,0000,0000,0000,0000,0000},
    {439, 1145,1144,1143,1142,1023,1017,1013,1007,1003,1001,0000,0000,0000,0000,0000,0000,0000,0000},
    {477, 1021,1020,1019,1018,1017,1007,1006,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {478, 1024,1022,1021,1020,1013,1012,1005,1004,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {489, 1024,1020,1019,1018,1016,1013,1006,1005,1004,1002,1000,0000,0000,0000,0000,0000,0000,0000},
    {491, 1145,1144,1143,1142,1023,1021,1020,1019,1018,1017,1014,1007,1003,0000,0000,0000,0000,0000},
    {492, 1016,1006,1005,1004,1000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {496, 1143,1142,1023,1020,1019,1017,1011,1007,1006,1003,1002,1001,0000,0000,0000,0000,0000,0000},
    {500, 1024,1021,1020,1019,1013,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {516, 1021,1020,1019,1018,1017,1016,1015,1007,1004,1002,1000,0000,0000,0000,0000,0000,0000,0000},
    {517, 1145,1144,1143,1142,1023,1020,1019,1018,1017,1016,1007,1003,1002,0000,0000,0000,0000,0000},
    {518, 1145,1144,1143,1142,1023,1020,1018,1017,1013,1007,1006,1005,1003,1001,0000,0000,0000,0000},
    {527, 1021,1020,1018,1017,1015,1014,1007,1001,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {529, 1023,1020,1019,1018,1017,1012,1011,1007,1006,1003,1001,0000,0000,0000,0000,0000,0000,0000},
    {534, 1185,1180,1179,1178,1127,1126,1125,1124,1123,1122,1106,1101,1100,0000,0000,0000,0000,0000},
    {535, 1121,1120,1119,1118,1117,1116,1115,1114,1113,1110,1109,0000,0000,0000,0000,0000,0000,0000},
    {536, 1184,1183,1182,1181,1128,1108,1107,1105,1104,1103,0000,0000,0000,0000,0000,0000,0000,0000},
    {540, 1145,1144,1143,1142,1024,1023,1020,1019,1018,1017,1007,1006,1004,1001,0000,0000,0000,0000},
    {542, 1145,1144,1021,1020,1019,1018,1015,1014,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {546, 1145,1144,1143,1142,1024,1023,1019,1018,1017,1007,1006,1004,1002,1001,0000,0000,0000,0000},
    {547, 1143,1142,1021,1020,1019,1018,1016,1003,1000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {549, 1145,1144,1143,1142,1023,1020,1019,1018,1017,1012,1011,1007,1003,1001,0000,0000,0000,0000},
    {550, 1145,1144,1143,1142,1023,1020,1019,1018,1006,1005,1004,1003,1001,0000,0000,0000,0000,0000},
    {551, 1023,1021,1020,1019,1018,1016,1006,1005,1003,1002,0000,0000,0000,0000,0000,0000,0000,0000},
    {558, 1168,1167,1166,1165,1164,1163,1095,1094,1093,1092,1091,1090,1089,1088,0000,0000,0000,0000},
    {559, 1173,1162,1161,1160,1159,1158,1072,1071,1070,1069,1068,1067,1066,1065,0000,0000,0000,0000},
    {560, 1170,1169,1141,1140,1139,1138,1033,1032,1031,1030,1029,1028,1027,1026,0000,0000,0000,0000},
    {561, 1157,1156,1155,1154,1064,1063,1062,1061,1060,1059,1058,1057,1056,1055,1031,1030,1027,1026},
    {562, 1172,1171,1149,1148,1147,1146,1041,1040,1039,1038,1037,1036,1035,1034,0000,0000,0000,0000},
    {565, 1153,1152,1151,1150,1054,1053,1052,1051,1050,1049,1048,1047,1046,1045,0000,0000,0000,0000},
    {567, 1189,1188,1187,1186,1133,1132,1131,1130,1129,1102,0000,0000,0000,0000,0000,0000,0000,0000},
    {575, 1177,1176,1175,1174,1099,1044,1043,1042,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {576, 1193,1192,1191,1190,1137,1136,1135,1134,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {580, 1023,1020,1018,1017,1007,1006,1001,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {589, 1145,1144,1024,1020,1018,1017,1016,1013,1007,1006,1005,1004,1000,0000,0000,0000,0000,0000},
    {600, 1022,1020,1018,1017,1013,1007,1006,1005,1004,0000,0000,0000,0000,0000,0000,0000,0000,0000},
    {603, 1145,1144,1143,1142,1024,1023,1020,1019,1018,1017,1007,1006,1001,0000,0000,0000,0000,0000}
};

stock iswheelmodel(modelid) {

    new wheelmodels[17] = {1025,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1096,1097,1098};
    for(new i=0; i < sizeof(wheelmodels); i++) {
        if(modelid == wheelmodels[i])
            return true;
    }
    return false;
}

IllegalCarNitroIde(carmodel) {

    new illegalvehs[29] = { 581, 523, 462, 521, 463, 522, 461, 448, 468, 586, 509, 481, 510, 472, 473, 493, 595, 484, 430, 453, 452, 446, 454, 590, 569, 537, 538, 570, 449 };
    for(new i=0; i < sizeof(illegalvehs); i++) {
        if(carmodel == illegalvehs[i])
            return true;
    }
    return false;
}

stock islegalcarmod(vehicleide, componentid) {

    new modok = false;

    if( (iswheelmodel(componentid)) || (componentid == 1086) || (componentid == 1087) || ((componentid >= 1008) && (componentid <= 1010))) {

        new nosblocker = IllegalCarNitroIde(vehicleide);
        if(!nosblocker)
            modok = true;
    } else {
        for(new i=0; i < sizeof(legalmods); i++) {
            if(legalmods[i][0] == vehicleide) {
                for(new J = 1; J < 22; J++) {
                    if(legalmods[i][J] == componentid)
                        modok = true;
                }
            }
        }
    }

    return modok;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
    if(islegalcarmod(GetVehicleModel(vehicleid), componentid))
	{
		SendClientMessageEx(playerid, COLOR_YELLOW, "Transfender:{FFFFFF} The modifications costed you $100.");
		GivePlayerCash(playerid, -100);
        return 1;
    }
	return 0;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	for (new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
	{
	    if(PlayerVehicleInfo[playerid][i][pvHandleId] != vehicleid) continue;
		PlayerVehicleInfo[playerid][i][pvPaintJob] = paintjobid;
		PlayerVehicleInfo[playerid][i][pvCarColor][0] = 1;
		PlayerVehicleInfo[playerid][i][pvCarColor][1] = 1;
		ChangeVehicleColor(PlayerVehicleInfo[playerid][i][pvHandleId], PlayerVehicleInfo[playerid][i][pvCarColor][0], PlayerVehicleInfo[playerid][i][pvCarColor][1]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "Transfender:{FFFFFF} The paintjob costed you $100.");
		GivePlayerCash(playerid, -100);
		return 1;
	}
	return 0;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	for (new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
	{
	    if(PlayerVehicleInfo[playerid][i][pvHandleId] != vehicleid) continue;
		PlayerVehicleInfo[playerid][i][pvCarColor][0] = color1;
		PlayerVehicleInfo[playerid][i][pvCarColor][1] = color2;
		SendClientMessageEx(playerid, COLOR_YELLOW, "Transfender:{FFFFFF} The respray costed you $100.");
		GivePlayerCash(playerid, -100);
		return 1;
	}
	return 0;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	if(SpectatingAdmin[playerid] != INVALID_PLAYER_ID)
	{
    	if(SpectatingPlayer[SpectatingAdmin[playerid]] == playerid)
     	{
     	    SetPlayerVirtualWorld(SpectatingAdmin[playerid], GetPlayerVirtualWorld(playerid));
     	    SetPlayerInterior(SpectatingAdmin[playerid], newinteriorid);
	    	PlayerSpectatePlayer(SpectatingAdmin[playerid], playerid);
		}
	}
	return 1;
}

stock GetComponentName(component)
{
    new modname[50];
    switch(component)
    {
       case 1000: format(modname, sizeof(modname), "Pro Spoiler");
       case 1001: format(modname, sizeof(modname), "Win Spoiler");
       case 1002: format(modname, sizeof(modname), "Drag Spoiler");
       case 1003: format(modname, sizeof(modname), "Alpha Spoiler");
       case 1004: format(modname, sizeof(modname), "Champ Scoop");
       case 1005: format(modname, sizeof(modname), "Fury Scoop");
       case 1006: format(modname, sizeof(modname), "Roof Scoop");
       case 1007: format(modname, sizeof(modname), "Right Sideskirt");
       case 1008: format(modname, sizeof(modname), "Nitrous x5");
       case 1009: format(modname, sizeof(modname), "Nitrous x2");
       case 1010: format(modname, sizeof(modname), "Nitrous x10");
       case 1011: format(modname, sizeof(modname), "Race Scoop");
       case 1012: format(modname, sizeof(modname), "Worx Scoop");
       case 1013: format(modname, sizeof(modname), "Round Fog Lights");
       case 1014: format(modname, sizeof(modname), "Champ Spoiler");
       case 1015: format(modname, sizeof(modname), "Race Spoiler");
       case 1016: format(modname, sizeof(modname), "Worx Spoiler");
       case 1017: format(modname, sizeof(modname), "Left Sideskirt");
       case 1018: format(modname, sizeof(modname), "Upswept Exhaust");
       case 1019: format(modname, sizeof(modname), "Twin Exhaust");
       case 1020: format(modname, sizeof(modname), "Large Exhaust");
       case 1021: format(modname, sizeof(modname), "Medium Exhaust");
       case 1022: format(modname, sizeof(modname), "Small Exhaust");
       case 1023: format(modname, sizeof(modname), "Fury Spoiler");
       case 1024: format(modname, sizeof(modname), "Square Fog Lights");
       case 1025: format(modname, sizeof(modname), "Offroad Wheels");
       case 1026, 1036, 1047, 1056, 1069, 1090: format(modname, sizeof(modname), "Right Alien Sideskirt");
       case 1027, 1040, 1051, 1062, 1071, 1094: format(modname, sizeof(modname), "Left Alien Sideskirt");
       case 1028, 1034, 1046, 1064, 1065, 1092: format(modname, sizeof(modname), "Alien Exhaust");
       case 1029, 1037, 1045, 1059, 1066, 1089: format(modname, sizeof(modname), "X-Flow Exhaust");
       case 1030, 1039, 1048, 1057, 1070, 1095: format(modname, sizeof(modname), "Right X-Flow Sideskirt");
       case 1031, 1041, 1052, 1063, 1072, 1093: format(modname, sizeof(modname), "Left X-Flow Sideskirt");
       case 1032, 1038, 1054, 1055, 1067, 1088: format(modname, sizeof(modname), "Alien Roof Vent");
       case 1033, 1035, 1053, 1061, 1068, 1091: format(modname, sizeof(modname), "X-Flow Roof Vent");
       case 1042: format(modname, sizeof(modname), "Right Chrome Sideskirt");
       case 1099: format(modname, sizeof(modname), "Left Chrome Sideskirt");
       case 1043, 1105, 1114, 1127, 1132, 1135: format(modname, sizeof(modname), "Slamin Exhaust");
       case 1044, 1104, 1113, 1126, 1129, 1136: format(modname, sizeof(modname), "Chrome Exhaust");
       case 1050, 1058, 1139, 1146, 1158, 1163: format(modname, sizeof(modname), "X-Flow Spoiler");
       case 1049, 1060, 1138, 1147, 1162, 1164: format(modname, sizeof(modname), "Alien Spoiler");
       case 1073: format(modname, sizeof(modname), "Shadow Wheels");
       case 1074: format(modname, sizeof(modname), "Mega Wheels");
       case 1075: format(modname, sizeof(modname), "Rimshine Wheels");
       case 1076: format(modname, sizeof(modname), "Wires Wheels");
       case 1077: format(modname, sizeof(modname), "Classic Wheels");
       case 1078: format(modname, sizeof(modname), "Twist Wheels");
       case 1079: format(modname, sizeof(modname), "Cutter Wheels");
       case 1080: format(modname, sizeof(modname), "Stitch Wheels");
       case 1081: format(modname, sizeof(modname), "Grove Wheels");
       case 1082: format(modname, sizeof(modname), "Import Wheels");
       case 1083: format(modname, sizeof(modname), "Dollar Wheels");
       case 1084: format(modname, sizeof(modname), "Trance Wheels");
       case 1085: format(modname, sizeof(modname), "Atomic Wheels");
       case 1086: format(modname, sizeof(modname), "Stereo");
       case 1087: format(modname, sizeof(modname), "Hydraulics");
       case 1096: format(modname, sizeof(modname), "Ahab Wheels");
       case 1097: format(modname, sizeof(modname), "Virtual Wheels");
       case 1098: format(modname, sizeof(modname), "Access Wheels");
       case 1100: format(modname, sizeof(modname), "Chrome Grill");
       case 1101: format(modname, sizeof(modname), "Left Chrome Flames Sideskirt");
       case 1102, 1107: format(modname, sizeof(modname), "Left Chrome Strip Sideskirt");
       case 1103: format(modname, sizeof(modname), "Convertible Roof");
       case 1106, 1124: format(modname, sizeof(modname), "Left Chrome Arches Sideskirt");
       case 1108, 1133, 1134: format(modname, sizeof(modname), "Right Chrome Strip Sideskirt");
       case 1109: format(modname, sizeof(modname), "Chrome Rear Bullbars");
       case 1110: format(modname, sizeof(modname), "Slamin Rear Bullbars");
       case 1111, 1112: format(modname, sizeof(modname), "Front Sign");
       case 1115: format(modname, sizeof(modname), "Chrome Front Bullbars");
       case 1116: format(modname, sizeof(modname), "Slamin Front Bullbars");
       case 1117, 1174, 1179, 1182, 1189, 1191: format(modname, sizeof(modname), "Chrome Front Bumper");
       case 1175, 1181, 1185, 1188, 1190: format(modname, sizeof(modname), "Slamin Front Bumper");
       case 1176, 1180, 1184, 1187, 1192: format(modname, sizeof(modname), "Chrome Rear Bumper");
       case 1177, 1178, 1183, 1186, 1193: format(modname, sizeof(modname), "Slamin Rear Bumper");
       case 1118: format(modname, sizeof(modname), "Right Chrome Trim Sideskirt");
       case 1119: format(modname, sizeof(modname), "Right Wheelcovers Sideskirt");
       case 1120: format(modname, sizeof(modname), "Left Chrome Trim Sideskirt");
       case 1121: format(modname, sizeof(modname), "Left Wheelcovers Sideskirt");
       case 1122: format(modname, sizeof(modname), "Right Chrome Flames Sideskirt");
       case 1123: format(modname, sizeof(modname), "Bullbar Chrome Bars");
       case 1125: format(modname, sizeof(modname), "Bullbar Chrome Lights");
       case 1128: format(modname, sizeof(modname), "Vinyl Hardtop Roof");
       case 1130: format(modname, sizeof(modname), "Hardtop Roof");
       case 1131: format(modname, sizeof(modname), "Softtop Roof");
       case 1140, 1148, 1151, 1156, 1161, 1167: format(modname, sizeof(modname), "X-Flow Rear Bumper");
       case 1141, 1149, 1150, 1154, 1159, 1168: format(modname, sizeof(modname), "Alien Rear Bumper");
       case 1142: format(modname, sizeof(modname), "Left Oval Vents");
       case 1143: format(modname, sizeof(modname), "Right Oval Vents");
       case 1144: format(modname, sizeof(modname), "Left Square Vents");
       case 1145: format(modname, sizeof(modname), "Right Square Vents");
       case 1152, 1157, 1165, 1170, 1172, 1173: format(modname, sizeof(modname), "X-Flow Front Bumper");
       case 1153, 1155, 1160, 1166, 1169, 1171: format(modname, sizeof(modname), "Alien Front Bumper");
       default: format(modname, sizeof(modname), "None");
    }
    return modname;
}

CMD:unmodcar(playerid, params[])
{
	new
	    vehid = GetPlayerVehicleID(playerid),
		string[256];
	if(vehid == 0 || GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
	for(new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
    {
        if(vehid == PlayerVehicleInfo[playerid][i][pvHandleId])
        {
            for (new m=0; m < MAX_VEHICLE_MODS; m++)
            {
                new comp = GetVehicleComponentInSlot(vehid, m);
				format(string, sizeof(string), "%s(ID: %d) %s\r\n", string, m, GetComponentName(comp));
            }
	        ShowPlayerDialogEx(playerid, DIALOG_UNMODCAR, DIALOG_STYLE_LIST, "{FFFFFF}Car Modifications - Removal", string, "Remove", "Cancel");
            return 1;
        }
    }
    SendClientMessageEx(playerid, COLOR_GREY, "You must be inside a vehicle that you own to use this command.");
	return 1;
}

public OnEnterExitModShop(playerid, enterexit, interiorid)
{
	new
	    vehid = GetPlayerVehicleID(playerid);
	if(vehid == 0 || GetPlayerState(playerid) != PLAYER_STATE_DRIVER || enterexit == 1) return 1;
	for(new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
    {
        if(vehid == PlayerVehicleInfo[playerid][i][pvHandleId])
		{
		    new exhaust, frontbumper, rearbumper, roof, spoilers, sideskirt,
				wheels, hydraulics, nitro, hood, lamps, stereo, ventright, ventleft;
			exhaust = GetVehicleComponentInSlot(vehid, CARMODTYPE_EXHAUST);
			frontbumper = GetVehicleComponentInSlot(vehid, CARMODTYPE_FRONT_BUMPER);
			rearbumper = GetVehicleComponentInSlot(vehid, CARMODTYPE_REAR_BUMPER);
			roof = GetVehicleComponentInSlot(vehid, CARMODTYPE_ROOF);
			spoilers = GetVehicleComponentInSlot(vehid, CARMODTYPE_SPOILER);
			sideskirt = GetVehicleComponentInSlot(vehid, CARMODTYPE_SIDESKIRT);
			wheels = GetVehicleComponentInSlot(vehid, CARMODTYPE_WHEELS);
			hydraulics = GetVehicleComponentInSlot(vehid, CARMODTYPE_HYDRAULICS);
			nitro = GetVehicleComponentInSlot(vehid, CARMODTYPE_NITRO);
			hood = GetVehicleComponentInSlot(vehid, CARMODTYPE_HOOD);
			lamps = GetVehicleComponentInSlot(vehid, CARMODTYPE_LAMPS);
			stereo = GetVehicleComponentInSlot(vehid, CARMODTYPE_STEREO);
			ventright = GetVehicleComponentInSlot(vehid, CARMODTYPE_VENT_RIGHT);
			ventleft = GetVehicleComponentInSlot(vehid, CARMODTYPE_VENT_LEFT);
			if(spoilers >= 1000)    PlayerVehicleInfo[playerid][i][pvModifications][0] = spoilers;
			if(hood >= 1000)        PlayerVehicleInfo[playerid][i][pvModifications][1] = hood;
			if(roof >= 1000)        PlayerVehicleInfo[playerid][i][pvModifications][2] = roof;
			if(sideskirt >= 1000)  PlayerVehicleInfo[playerid][i][pvModifications][3] = sideskirt;
			if(lamps >= 1000)       PlayerVehicleInfo[playerid][i][pvModifications][4] = lamps;
			if(nitro >= 1000)       PlayerVehicleInfo[playerid][i][pvModifications][5] = nitro;
			if(exhaust >= 1000)     PlayerVehicleInfo[playerid][i][pvModifications][6] = exhaust;
			if(wheels >= 1000)      PlayerVehicleInfo[playerid][i][pvModifications][7] = wheels;
			if(stereo >= 1000)      PlayerVehicleInfo[playerid][i][pvModifications][8] = stereo;
			if(hydraulics >= 1000)  PlayerVehicleInfo[playerid][i][pvModifications][9] = hydraulics;
			if(frontbumper >= 1000) PlayerVehicleInfo[playerid][i][pvModifications][10] = frontbumper;
			if(rearbumper >= 1000)  PlayerVehicleInfo[playerid][i][pvModifications][11] = rearbumper;
			if(ventright >= 1000)   PlayerVehicleInfo[playerid][i][pvModifications][12] = ventright;
			if(ventleft >= 1000)    PlayerVehicleInfo[playerid][i][pvModifications][13] = ventleft;
			break;
		}
	}
    return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
	    new string[64];
	    format(string, sizeof(string), "%f %f %f %i", fX, fY, fZ, 0);
		cmd_gotoco(playerid, string);
	}
    return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float: amount, weaponid, bodypart)
{
	if(GetPVarInt(playerid, "TaserEquipped") == 1 && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
	    new Float:Position[3];
	    GetPlayerPos(damagedid, Position[0], Position[1], Position[2]);
	    if(IsPlayerInRangeOfPoint(playerid, 10.0, Position[0], Position[1], Position[2]))
	    {
		    if(PlayerInfo[playerid][pReloadingTaser] == 0 && GetPlayerWeapon(playerid) == 23)
		    {
		        if(GetPVarType(playerid, "ActionRestriction") == 0 && PlayerInfo[playerid][pWounded] == PLAYER_ALIVE && GetPlayerState(damagedid) == PLAYER_STATE_ONFOOT)
		        {
		        	new string[128];
					format(string, sizeof(string), "* %s fires their tazer at %s, stunning them.", GetPlayerNameEx(playerid), GetPlayerNameEx(damagedid));
					ProxDetector(20.0, damagedid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
					PlayerInfo[playerid][pReloadingTaser] = 1;
					SetPVarInt(damagedid, "IsRestrained", 1);
					GameTextForPlayer(damagedid, "~r~You were~n~Tazed", 3000, 3);
					GameTextForPlayer(playerid, "~r~Reloading~n~Tazer", 9000, 3);
					TogglePlayerControllable(damagedid, false);
					ApplyPlayerAnimation(damagedid, "CRACK", "crckdeth2", 3.6, 0, 1, 1, 1, 1);
					SetTimerEx("TazerTimer", 10000, false, "ii", playerid, damagedid);
				}
		    }
		}
	}
	return 1;
}

forward ResetWeaponDamage(playerid);public ResetWeaponDamage(playerid) WeaponDamage[playerid] = 0.0;
public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	new Float:armour, Float:health;
	GetPlayerArmour(playerid, armour); GetPlayerHealth(playerid, health);
	if(IsPlayerRestricted(playerid) || GetPVarType(playerid, "AdminDuty")) return 1;
    RemovePlayerColorFade(playerid);
	FadePlayerScreen(playerid, COLOR_RED, 36);

	WeaponDamage[playerid] = amount;
	SetTimerEx("ResetWeaponDamage", GetPlayerPing(playerid)+1000, false, "i", playerid);

	if(PlayerInfo[playerid][pWounded] == PLAYER_ALIVE)
	{
		if(bodypart == 3)
		{
			if(PlayerInfo[playerid][pArmour]-(amount/4) > 0) SetPlayerArmourEx(playerid, PlayerInfo[playerid][pArmour]-(amount/4));
			else SetPlayerArmourEx(playerid, 0);
		}
		else if(bodypart == 9)
		{
		    MakePlayerDead(playerid);
		    OnPlayerDeath(playerid, issuerid, weaponid);
		}
		if(amount >= 100)
		{
			MakePlayerDead(playerid);
			OnPlayerDeath(playerid, issuerid, weaponid);
		}
		else if((health - amount) < 25.0)
		{
			MakePlayerWounded(playerid);
		}
	}
	else if(PlayerInfo[playerid][pWounded] == PLAYER_WOUNDED)
	{
		MakePlayerDead(playerid);
		OnPlayerDeath(playerid, issuerid, weaponid);
	}
	else if(PlayerInfo[playerid][pWounded] == PLAYER_DEAD)
	{
	    SetPlayerHealthEx(playerid, 25.0);
	}
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    if(GetPVarType(hitid, "AdminDuty")) return 0;

	if(hittype == BULLET_HIT_TYPE_PLAYER)
	{
		if(PlayerInfo[hitid][pWounded] == PLAYER_WOUNDED)
		{
		    MakePlayerDead(hitid);
		    OnPlayerDeath(hitid, playerid, weaponid);
			return 1;
		}
		else if(PlayerInfo[hitid][pWounded] == PLAYER_DEAD) return 0;
	}
    return 1;
}

stock MakePlayerWounded(playerid)
{
    new string[128];
    SendClientMessageEx(playerid, COLOR_RED, "You are brutally wounded. You can now /call 911 ems or /accept death.");
    GameTextForPlayer(playerid, "~r~WOUNDED", 2000, 3);
    format(string, sizeof(string), "* %s would be brutally wounded.", GetPlayerNameEx(playerid));
    SetPlayerChatBubble(playerid, string, COLOR_HOTPINK, 20.0, 2000);
    SetPlayerHealthEx(playerid, 25.0);
    SetPlayerArmourEx(playerid, 0.0);
    PlayerInfo[playerid][pWounded] = PLAYER_WOUNDED;
   	RemovePlayerFromVehicle(playerid);
	ClearAnimations(playerid);
	PlayerInfo[playerid][pInterior] = GetPlayerInterior(playerid);
	PlayerInfo[playerid][pVirtualWorld] = GetPlayerVirtualWorld(playerid);
	ApplyAnimation(playerid, "WUZI", "CS_DEAD_GUY", 4.0, 0, 1, 1, 1, 0, 0);
	if(IsPlayerInAnyVehicle(playerid)) OnPlayerExitVehicle(playerid, GetPlayerVehicleID(playerid));
	if(gPlayerUsingLoopingAnim[playerid]) gPlayerUsingLoopingAnim[playerid] = 0;
	RemovePlayerColorFade(playerid);
	return 1;
}

stock MakePlayerDead(playerid)
{
    new string[128];
    SendClientMessageEx(playerid, COLOR_RED, "You are now dead. You may /accept death.");
    GameTextForPlayer(playerid, "~r~DEAD", 2000, 3);
    format(string, sizeof(string), "* %s is now dead.", GetPlayerNameEx(playerid));
    SetPlayerChatBubble(playerid, string, COLOR_RED, 20.0, 2000);
    SetPlayerHealthEx(playerid, 25.0);
    SetPlayerArmourEx(playerid, 0.0);
    PlayerInfo[playerid][pWounded] = PLAYER_DEAD;
   	RemovePlayerFromVehicle(playerid);
	ClearAnimations(playerid);
	ApplyAnimation(playerid, "WUZI", "CS_DEAD_GUY", 4.0, 0, 1, 1, 1, 0, 0);
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{

	if(newkeys & KEY_JUMP && !(oldkeys & KEY_JUMP) && GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED) ApplyAnimation(playerid, "GYMNASIUM", "gym_jog_falloff",4.1,0,1,1,0,0);
	if(newkeys & KEY_FIRE)
	{
		if(GetPlayerWeapon(playerid) == WEAPON_SPRAYCAN && GetPVarInt(playerid, "SprayingVehicleID") > 0)
		{
			new Float:X, Float:Y, Float:Z;
			GetVehiclePos(GetPVarInt(playerid, "SprayingVehicleID"), X, Y, Z);
			if(IsPlayerInRangeOfPoint(playerid, 7.0, X, Y, Z) && random(10) != random(10))
			{
				new panels, doors, lights, tires;
				tires = encode_tires(0, 0, 0, 0); // fix all tires
				panels = encode_panels(0, 0, 0, 0, 0, 0, 0); // fix all panels
				doors = encode_doors(0, 0, 0, 0, 0, 0); // fix all doors
				lights = encode_lights(0, 0, 0, 0); // fix all lights
				UpdateVehicleDamageStatus(GetPVarInt(playerid, "SprayingVehicleID"), panels, doors, lights, tires);
				GameTextForPlayer(playerid, "~g~BODYKIT REPAIRED", 2000, 5);
				ReloadPlayerWeapons(playerid);
			}
			else
			{
				GameTextForPlayer(playerid, "~r~BODYKIT REPAIR FAILED.", 2000, 5);
			}
			DeletePVar(playerid, "SprayingVehicleID");
			return 1;
		}

		for (new bombid=0; bombid < MAX_HITMAN_BOMBS; bombid++)
		{
		    if(HitmanBombObject[playerid][bombid] != 0)
		    {
		        new string[128];
        		foreach(new i: Player)
        		{
        		    if(IsPlayerInRangeOfPoint(i, 27.5, HitmanBombs[playerid][bombid][0], HitmanBombs[playerid][bombid][1], HitmanBombs[playerid][bombid][2]))
        		    {
						if(HitmanTarget[playerid] == i)
						{
						    format(string, sizeof(string), "Hitman %s has fulfilled the contract on %s's head and collected $%d.", GetPlayerNameEx(playerid), GetPlayerNameEx(i), PlayerInfo[i][pContractPrice]);
       						Log("logs/contract.log", string);
							format(string, sizeof(string), "You have been critically injured by a hitman and lost $%d.", PlayerInfo[i][pContractPrice]);
							SendClientMessageEx(i, COLOR_YELLOW, string);
						    format(string, sizeof(string), "Hitman %s has fulfilled the contract on %s's head and collected $%d.", GetPlayerNameEx(playerid), GetPlayerNameEx(i), PlayerInfo[i][pContractPrice]);
							SendHitmanMessage(COLOR_YELLOW, string);
							PlayerInfo[i][pMoney] -= PlayerInfo[i][pContractPrice];
							PlayerInfo[playerid][pMoney] += PlayerInfo[i][pContractPrice];
							PlayerInfo[playerid][pCompletedHits]++;
							PlayerInfo[i][pContractPrice] = 0;
							format(PlayerInfo[i][pContractReason], 32, "");
							format(PlayerInfo[i][pContractBy], MAX_PLAYER_NAME, "");
							HitmanTarget[playerid] = INVALID_PLAYER_ID;
							SetPlayerHealthEx(i, 0);
							break;
						}
        		    }
        		}
		        CreateExplosion(HitmanBombs[playerid][bombid][0], HitmanBombs[playerid][bombid][1], HitmanBombs[playerid][bombid][2], 0, 25);
		        HitmanBombs[playerid][bombid][0] = 0;
		        HitmanBombs[playerid][bombid][1] = 0;
		        HitmanBombs[playerid][bombid][2] = 0;
		        DestroyDynamicObject(HitmanBombObject[playerid][bombid]);
		        HitmanBombObject[playerid][bombid] = 0;
			}
		}
	}
	else if(newkeys & KEY_YES)
	{
	    cmd_enter(playerid, "");
	    cmd_exit(playerid, "");
	}

	if(IsKeyJustDown(KEY_SPRINT, newkeys, oldkeys))
	{
		if(gPlayerUsingLoopingAnim[playerid]) StopLoopingAnim(playerid);
    }
	return 1;
}


public TazerTimer(playerid, targetid)
{
	if(!IsPlayerConnectedEx(playerid)) return 0;
	if(GetPVarInt(targetid, "IsCuffed") == 0) ClearAnimations(targetid, 1);
	DeletePVar(playerid, "IsRestrained");
	TogglePlayerControllable(targetid, true);
	PlayerInfo[playerid][pReloadingTaser] = 0;
	GameTextForPlayer(playerid, "~b~Taser~n~Reloaded.", 1000, 3);
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerChangeWeapon(playerid, weapon)
{
	if(GetPVarInt(playerid, "TaserEquipped") == 1) SetPlayerArmedWeapon(playerid, 23);
	else if(GetPVarInt(playerid, "SprayingVehicleID") > 0) SetPlayerArmedWeapon(playerid, 41);

	switch(weapon)
	{
	    case 0 .. 1: // Knuckles to Knuckles Busters
	    {
	        return 0;
	    }

		case 2 .. 9: // Melee Weapons
	    {
	        if(weapon != PlayerInfo[playerid][pWeapons][1])
	        {
	            ExecuteWeaponBan(playerid, weapon);
			}
		}

		case 22 .. 24: // Hand-Held Weapons
	    {
	        if(weapon == 23 && GetPVarInt(playerid, "TaserEquipped")) return 1;
	        if(weapon != PlayerInfo[playerid][pWeapons][2])
	        {
	            ExecuteWeaponBan(playerid, weapon);
			}
		}

		case 25 .. 27: // Shotguns
	    {
	        if(weapon != PlayerInfo[playerid][pWeapons][3])
	        {
	            ExecuteWeaponBan(playerid, weapon);
			}
		}

		case 28 .. 29: // Sub Machine Guns
	    {
	        if(weapon != PlayerInfo[playerid][pWeapons][4])
	        {
	            ExecuteWeaponBan(playerid, weapon);
			}
		}

		case 32: // Machine Guns
	    {
	        if(weapon != PlayerInfo[playerid][pWeapons][4])
	        {
	            ExecuteWeaponBan(playerid, weapon);
			}
		}

		case 30 .. 31: // Rifles
	    {
	        if(weapon != PlayerInfo[playerid][pWeapons][5])
	        {
	            ExecuteWeaponBan(playerid, weapon);
			}
		}

		case 33 .. 34:
	    {
	        if(weapon != PlayerInfo[playerid][pWeapons][6])
	        {
	            ExecuteWeaponBan(playerid, weapon);
			}
		}

		case 35 .. 38:
		{
	        if(weapon != PlayerInfo[playerid][pWeapons][7])
	        {
	            ExecuteWeaponBan(playerid, weapon);
			}
		}

		case 16 .. 18:
	    {
	        if(weapon != PlayerInfo[playerid][pWeapons][8])
	        {
	            ExecuteWeaponBan(playerid, weapon);
			}
		}

		case 39:
	    {
	        if(weapon != PlayerInfo[playerid][pWeapons][8])
	        {
	            ExecuteWeaponBan(playerid, weapon);
			}
		}

		case 41 .. 43:
	    {
			if(weapon == 41 && GetPVarInt(playerid, "SprayingVehicleID") > 0) return 1;
	        if(weapon != PlayerInfo[playerid][pWeapons][9])
	        {
	            ExecuteWeaponBan(playerid, weapon);
			}
		}

		case 10 .. 15:
	    {
	        if(weapon != PlayerInfo[playerid][pWeapons][10])
	        {
	            ExecuteWeaponBan(playerid, weapon);
			}
		}

		case 44 .. 45:
	    {
	        if(weapon != PlayerInfo[playerid][pWeapons][11])
	        {
	            ExecuteWeaponBan(playerid, weapon);
			}
		}

		case 46: // Parachute
		{
			return 0;
		}
	}
	return 1;
}

stock ExecuteWeaponBan(playerid, weapon)
{
	new reason[128];
	format(reason, sizeof(reason), "AdmCmd: %s was banned from the server, reason: Weapon hacking (%s)", GetPlayerNameEx(playerid), GetWeaponNameEx(weapon));
	AdminAlert(reason, ALERT_GLOBAL);
	format(reason, sizeof(reason), "Weapon hacking (%s)", GetWeaponNameEx(weapon));
	BanPlayerEx(playerid, reason, BAN_PERMANENT, 0);
	return 1;
}

stock BanPlayerEx(playerid, reason[], type, unbanstamp)
{
	new szQuery[256];
	PlayerInfo[playerid][pBanned] = 1;
	format(szQuery, sizeof(szQuery), "UPDATE `accounts` SET `Banned` = '1' WHERE `Id` = '%d'", PlayerInfo[playerid][pId]);
	mysql_tqueryof(szQuery, THREAD_LOG_RESULT, playerid, mConnectionHandle);
	format(szQuery, sizeof(szQuery), "INSERT INTO `bans` (`IP_Address`,`Username`,`Expiry_Date`,`Reason`,`Ban_Type`) \
									 VALUES ('%s','%s','%d','%s','%d')", GetPlayerIpAddress(playerid), PlayerInfo[playerid][pUsername], unbanstamp, reason, type);
	mysql_tqueryof(szQuery, THREAD_LOG_RESULT, playerid, mConnectionHandle);
	format(szQuery, sizeof(szQuery), "[BanPlayerEx]: %s (IP: %s) has been banned from the server.", GetPlayerNameEx(playerid), GetPlayerIpAddress(playerid));
	Log("logs/ip.log", szQuery);
	KickEx(playerid);
}

stock UnbanPlayerEx(name[])
{
	new szQuery[128];
	format(szQuery, sizeof(szQuery), "DELETE FROM `bans` WHERE `Username` = '%s'", name);
	mysql_tqueryof(szQuery, THREAD_NO_RESULT, INVALID_PLAYER_ID, mConnectionHandle);
	format(szQuery, sizeof(szQuery), "UPDATE `accounts` SET `Banned` = '0' WHERE `Username` = '%s'", name);
	mysql_tqueryof(szQuery, THREAD_LOG_RESULT, INVALID_PLAYER_ID, mConnectionHandle);
//	return 1;
	if(cache_affected_rows() > 0)
	{
		format(szQuery, sizeof(szQuery), "UPDATE `accounts` SET `Banned` = '0' WHERE `Username` = '%s'", name);
		mysql_tqueryof(szQuery, THREAD_LOG_RESULT, INVALID_PLAYER_ID, mConnectionHandle);
		return 1;
	}
	return 0;
}


stock GetWeaponSlotFromId(weapon)
{
	switch (weapon)
	{
	    case 0 .. 1: return 0;
	    case 2 .. 9: return 1;
	    case 22 .. 24: return 2;
	    case 25 .. 27: return 3;
	    case 28 .. 29: return 4;
	    case 32: return 4;
	    case 30 .. 31: return 5;
	    case 33 .. 34: return 6;
	    case 35 .. 38: return 7;
	    case 16 .. 18: return 8;
	    case 39: return 8;
	    case 41 .. 43: return 9;
	    case 10 .. 15: return 10;
	    case 44 .. 45: return 11;
	}
	return 0;
}

public OnPlayerUpdate(playerid)
{
	if(GetPVarInt(playerid, "gPlayerLogged") == 0) return 0;

	LastUpdate[playerid] = gettime();

	if(GetPVarInt(playerid, "TaserEquipped") && GetPlayerWeapon(playerid) != 23)
		SetPlayerArmedWeapon(playerid, 23);

	if(PlayerInfo[playerid][pWounded] != PLAYER_ALIVE)
		SetPlayerArmedWeapon(playerid, 0);

	if(IsPlayerInAnyVehicle(playerid))
	{
		new vehicleid = GetPlayerVehicleID(playerid);

		if(GetPlayerVehicleSeat(playerid) >= 1 && GetPlayerVehicleSeat(playerid) <= 3)
		{
		    if(PlayerInfo[playerid][pWeapons][4] == WEAPON_UZI)
		        SetPlayerArmedWeapon(playerid, WEAPON_UZI);
		    else if(PlayerInfo[playerid][pWeapons][4] == WEAPON_MP5)
		        SetPlayerArmedWeapon(playerid, WEAPON_MP5);
		    else if(PlayerInfo[playerid][pWeapons][4] == WEAPON_TEC9)
		        SetPlayerArmedWeapon(playerid, WEAPON_TEC9);
			else
		        SetPlayerArmedWeapon(playerid, 0);
		}

		if(GetVehicleHealthEx(vehicleid) < 250)
		{
			if(!VehicleInfo[vehicleid][vTotalled] && GetVehicleModel(GetPlayerVehicleID(playerid)) != 0)
			{
				if(VehicleInfo[vehicleid][vDrugs] > 0)
				{
					SendClientMessageEx(VehicleInfo[vehicleid][vDrugs] - 1, COLOR_LIGHTRED, "Failure{FFFFFF}: The vehicle has been destroyed and as a result, you have failed the delivery.");
                    KillDrugRoute(VehicleInfo[vehicleid][vDrugs] - 1);
				}
				SendClientMessageEx(playerid, COLOR_LIGHTRED, "Engine Failure{FFFFFF}: The vehicle's engine has been destroyed. Please contact a mechanic to get it fixed (use /call 555).");
				GameTextForPlayer(playerid, "~r~Totalled", 3000, 3);
			    VehicleInfo[vehicleid][vTotalled] = 1;
				VehicleInfo[vehicleid][vEngine] = 0;
			}
			SetVehicleHealth(vehicleid, 250);
			SetVehicleParamsEx(vehicleid, VehicleInfo[vehicleid][vEngine], VehicleInfo[vehicleid][vLights], VehicleInfo[vehicleid][vAlarm], VehicleInfo[vehicleid][vDoors], VehicleInfo[vehicleid][vBonnet], VehicleInfo[vehicleid][vBoot], VehicleInfo[vehicleid][vObjective]);
		}
	}
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	if(VehicleInfo[vehicleid][vLocked] == 1)
	{
		SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
	}
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	GetVehicleHealth(vehicleid, PlayerVehicleInfo[GetVehicleOwner(vehicleid)][GetVehicleOwnedSlot(vehicleid)][pvHealth]);
    return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
		new string[8];
		format(string, sizeof(string), "%d", clickedplayerid);
		cmd_spec(playerid, string);
	}
	return 1;
}

stock HashText(text[])
{
	new hashedtext[129];
	WP_Hash(hashedtext, sizeof(hashedtext), text);
	return hashedtext;
}

stock IsAValidSkin(skinid)
{
	return !(skinid > 274 && skinid < 288);
}

public MySQL_Waypoint_Load()
{
    new
        rows,
		id,
		szValue[64]
	;
    cache_get_row_count(rows);

    for(new i = 0; i != rows; i++)
    {
        cache_get_value_name(i, "Id", szValue); id = strval(szValue);
        cache_get_value_name(i, "TextDisplay", WaypointInfo[id][wTextDisplay], 64);
        cache_get_value_name(i, "Password", WaypointInfo[id][wPassword], 8);
        cache_get_value_name(i, "Locked", szValue); WaypointInfo[id][wLocked] = strval(szValue);
        cache_get_value_name(i, "wPosX", szValue); WaypointInfo[id][wPosition][0] = floatstr(szValue);
        cache_get_value_name(i, "wPosY", szValue); WaypointInfo[id][wPosition][1] = floatstr(szValue);
        cache_get_value_name(i, "wPosZ", szValue); WaypointInfo[id][wPosition][2] = floatstr(szValue);
        cache_get_value_name(i, "wVirtualWorld", szValue); WaypointInfo[id][wVirtualWorld] = strval(szValue);
        cache_get_value_name(i, "wInterior", szValue); WaypointInfo[id][wInterior] = strval(szValue);
        cache_get_value_name(i, "wFacingAngle", szValue); WaypointInfo[id][wFacingAngle] = strval(szValue);
        cache_get_value_name(i, "wLoadTime", szValue); WaypointInfo[id][wLoadingTime] = strval(szValue);
        cache_get_value_name(i, "dPosX", szValue); WaypointInfo[id][wDestPosition][0] = floatstr(szValue);
        cache_get_value_name(i, "dPosY", szValue); WaypointInfo[id][wDestPosition][1] = floatstr(szValue);
        cache_get_value_name(i, "dPosZ", szValue); WaypointInfo[id][wDestPosition][2] = floatstr(szValue);
        cache_get_value_name(i, "dVirtualWorld", szValue); WaypointInfo[id][wDestVirtualWorld] = strval(szValue);
        cache_get_value_name(i, "dInterior", szValue); WaypointInfo[id][wDestInterior] = strval(szValue);
        cache_get_value_name(i, "dFacingAngle", szValue); WaypointInfo[id][wDestFacingAngle] = strval(szValue);
        cache_get_value_name(i, "dLoadTime", szValue); WaypointInfo[id][wDestLoadingTime] = strval(szValue);
		printf("[Waypoint] #%d (%s): Position: {%f, %f, %f}, Destination: {%f, %f, %f}, Password: %s", id, WaypointInfo[id][wTextDisplay], WaypointInfo[id][wPosition][0], WaypointInfo[id][wPosition][1], WaypointInfo[id][wPosition][2], WaypointInfo[id][wDestPosition][0], WaypointInfo[id][wDestPosition][1], WaypointInfo[id][wDestPosition][2], WaypointInfo[id][wPassword]);

		char_replace(WaypointInfo[id][wTextDisplay], '\92', ' ');
		WaypointInfo[id][wExistant] = 1;
		RecreateWaypointText(id);
	}
    printf("[Waypoints]: A total of %d waypoints have been loaded into the script.", rows);
}

stock MySQL_Load_Waypoints()
{
	mysql_tquery(mConnectionHandle, "SELECT * FROM `waypoints`", "MySQL_Waypoint_Load");
}

public MySQL_Business_Load()
{
    new
        rows,
		id,
		szValue[64]
	;
    cache_get_row_count(rows);

    for(new i = 0; i != rows; i++)
    {
        cache_get_value_name(i, "Id", szValue); id = strval(szValue);
        cache_get_value_name(i, "Name", BusinessInfo[id][bName], 16);
        cache_get_value_name(i, "Owner", BusinessInfo[id][bOwner], MAX_PLAYER_NAME);
        cache_get_value_name(i, "BuyPrice", szValue); BusinessInfo[id][bBuyPrice] = strval(szValue);
        cache_get_value_name(i, "Earnings", szValue); BusinessInfo[id][bEarnings] = strval(szValue);
        cache_get_value_name(i, "PosX", szValue); BusinessInfo[id][bPosition][0] = floatstr(szValue);
        cache_get_value_name(i, "PosY", szValue); BusinessInfo[id][bPosition][1] = floatstr(szValue);
        cache_get_value_name(i, "PosZ", szValue); BusinessInfo[id][bPosition][2] = floatstr(szValue);
        cache_get_value_name(i, "VirtualWorld", szValue); BusinessInfo[id][bVirtualWorld] = strval(szValue);
        cache_get_value_name(i, "Interior", szValue); BusinessInfo[id][bInterior] = strval(szValue);
        cache_get_value_name(i, "FacingAngle", szValue); BusinessInfo[id][bFacingAngle] = strval(szValue);
        cache_get_value_name(i, "Open", szValue); BusinessInfo[id][bOpen] = strval(szValue);
		printf("[Business] #%d (%s): Position: {%f, %f, %f} Price: %d", id, BusinessInfo[id][bName], BusinessInfo[id][bPosition][0], BusinessInfo[id][bPosition][1], BusinessInfo[id][bPosition][2], BusinessInfo[id][bBuyPrice]);

		char_replace(BusinessInfo[id][bName], '\92', ' ');
		BusinessInfo[id][bExistant] = 1;
        RecreateBusinessText(id);
	}
    printf("[Business]: A total of %d businesses have been loaded into the script.", rows);
}

stock MySQL_Load_Businesses()
{
	mysql_tquery(mConnectionHandle, "SELECT * FROM `businesses`", "MySQL_Business_Load");
}

public MySQL_House_Load()
{
    new
        rows,
		id,
		szValue[64]
	;
    cache_get_row_count(rows);

    for(new i = 0; i != rows; i++)
    {
        cache_get_value_name(i, "Id", szValue); id = strval(szValue);
        cache_get_value_name(i, "Owner", HouseInfo[id][hOwner], MAX_PLAYER_NAME);
        cache_get_value_name(i, "BuyPrice", szValue); HouseInfo[id][hBuyPrice] = strval(szValue);
        cache_get_value_name(i, "PosX", szValue); HouseInfo[id][hPosition][0] = floatstr(szValue);
        cache_get_value_name(i, "PosY", szValue); HouseInfo[id][hPosition][1] = floatstr(szValue);
        cache_get_value_name(i, "PosZ", szValue); HouseInfo[id][hPosition][2] = floatstr(szValue);
        cache_get_value_name(i, "VirtualWorld", szValue); HouseInfo[id][hVirtualWorld] = strval(szValue);
        cache_get_value_name(i, "Interior", szValue); HouseInfo[id][hInterior] = strval(szValue);
        cache_get_value_name(i, "FacingAngle", szValue); HouseInfo[id][hFacingAngle] = strval(szValue);
		printf("[House] #%d: Position: {%f, %f, %f} Owner: %s", id, HouseInfo[id][hPosition][0], HouseInfo[id][hPosition][1], HouseInfo[id][hPosition][2], HouseInfo[id][hOwner]);

		HouseInfo[id][hExistant] = 1;
		RecreateHouseText(id);
	}
    printf("[House]: A total of %d houses have been loaded into the script.", rows);
}

stock MySQL_Load_Houses()
{
	mysql_tquery(mConnectionHandle, "SELECT * FROM `houses`", "MySQL_House_Load");
}

public MySQL_Faction_Load()
{
    new rows, id, szValue[64];
    cache_get_row_count(rows);

    for(new i = 0; i != rows; i++)
    {
        cache_get_value_name(i, "Id", szValue); id = strval(szValue);
        cache_get_value_name(i, "Name", FactionInfo[id][fName], MAX_PLAYER_NAME);
        cache_get_value_name(i, "Type", szValue); FactionInfo[id][fType] = strval(szValue);
        cache_get_value_name(i, "Motd", FactionInfo[id][fMotd], 128);
        cache_get_value_name(i, "Rank1", FactionInfo[id][fRank1], 32);
        cache_get_value_name(i, "Rank2", FactionInfo[id][fRank2], 32);
        cache_get_value_name(i, "Rank3", FactionInfo[id][fRank3], 32);
        cache_get_value_name(i, "Rank4", FactionInfo[id][fRank4], 32);
        cache_get_value_name(i, "Rank5", FactionInfo[id][fRank5], 32);
        cache_get_value_name(i, "Rank6", FactionInfo[id][fRank6], 32);
        cache_get_value_name(i, "Rank7", FactionInfo[id][fRank7], 32);
        cache_get_value_name(i, "Rank8", FactionInfo[id][fRank8], 32);
        cache_get_value_name(i, "Rank9", FactionInfo[id][fRank9], 32);
        cache_get_value_name(i, "Rank10", FactionInfo[id][fRank10], 32);
        cache_get_value_name(i, "Div1", FactionInfo[id][fDiv1], 8);
        cache_get_value_name(i, "Div2", FactionInfo[id][fDiv2], 8);
        cache_get_value_name(i, "Div3", FactionInfo[id][fDiv3], 8);
        cache_get_value_name(i, "Div4", FactionInfo[id][fDiv4], 8);
        cache_get_value_name(i, "Div5", FactionInfo[id][fDiv5], 8);
        cache_get_value_name(i, "LockerX", szValue); FactionInfo[id][fLockerPosition][0] = floatstr(szValue);
        cache_get_value_name(i, "LockerY", szValue); FactionInfo[id][fLockerPosition][1] = floatstr(szValue);
        cache_get_value_name(i, "LockerZ", szValue); FactionInfo[id][fLockerPosition][2] = floatstr(szValue);
        cache_get_value_name(i, "LockerMats", szValue); FactionInfo[id][fMats] = strval(szValue);
		printf("[Faction] #%d (%s): Motd: %s", id, FactionInfo[id][fName], FactionInfo[id][fMotd]);
		char_replace(FactionInfo[id][fName], '\92', ' ');
		char_replace(FactionInfo[id][fMotd], '\92', ' ');
		RecreateFactionLockerText(id);
	}
    printf("[Faction]: A total of %d factions have been loaded into the script.", rows);
}

stock MySQL_Load_Factions()
{
	mysql_tquery(mConnectionHandle, "SELECT * FROM `factions`", "MySQL_Faction_Load");
}


public MySQL_Gates_Load()
{
    new
        rows,
		id,
		szValue[64]
	;
    cache_get_row_count(rows);

    for(new i = 0; i != rows; i++)
    {
        cache_get_value_name(i, "Id", szValue); id = strval(szValue);
        cache_get_value_name(i, "Model", szValue); GateInfo[id][gModel] = strval(szValue);
        cache_get_value_name(i, "Speed", szValue); GateInfo[id][gSpeed] = strval(szValue);
        cache_get_value_name(i, "Password", GateInfo[id][gPassword], 12);
        cache_get_value_name(i, "PosX", szValue); GateInfo[id][gPosition][0] = floatstr(szValue);
        cache_get_value_name(i, "PosY", szValue); GateInfo[id][gPosition][1] = floatstr(szValue);
        cache_get_value_name(i, "PosZ", szValue); GateInfo[id][gPosition][2] = floatstr(szValue);
        cache_get_value_name(i, "PosRotationX", szValue); GateInfo[id][gRotation][0] = floatstr(szValue);
        cache_get_value_name(i, "PosRotationY", szValue); GateInfo[id][gRotation][1] = floatstr(szValue);
        cache_get_value_name(i, "PosRotationZ", szValue); GateInfo[id][gRotation][2] = floatstr(szValue);
        cache_get_value_name(i, "DestinationX", szValue); GateInfo[id][gDestPosition][0] = floatstr(szValue);
        cache_get_value_name(i, "DestinationY", szValue); GateInfo[id][gDestPosition][1] = floatstr(szValue);
        cache_get_value_name(i, "DestinationZ", szValue); GateInfo[id][gDestPosition][2] = floatstr(szValue);
        cache_get_value_name(i, "DestRotationX", szValue); GateInfo[id][gDestRotation][0] = floatstr(szValue);
        cache_get_value_name(i, "DestRotationY", szValue); GateInfo[id][gDestRotation][1] = floatstr(szValue);
        cache_get_value_name(i, "DestRotationZ", szValue); GateInfo[id][gDestRotation][2] = floatstr(szValue);
        GateInfo[id][gObjectHandle] = CreateDynamicObject(GateInfo[id][gModel], GateInfo[id][gPosition][0], GateInfo[id][gPosition][1], GateInfo[id][gPosition][2], GateInfo[id][gRotation][0], GateInfo[id][gRotation][1], GateInfo[id][gRotation][2]);
		RecreateGateText(id);
	}
    printf("[Gate]: A total of %d gates have been loaded into the script.", rows);
}

stock MySQL_Load_Gates()
{
	mysql_tquery(mConnectionHandle, "SELECT * FROM `gates`", "MySQL_Gates_Load");
}

public MySQL_Vault_Load()
{
    new
        rows,
		id,
		szValue[64]
	;
    cache_get_row_count(rows);

    for(new i = 0; i != rows; i++)
    {
        cache_get_value_name(i, "Id", szValue); id = strval(szValue);
        cache_get_value_name(i, "Money", szValue); VaultInfo[id][vMoney] = strval(szValue);
        cache_get_value_name(i, "PosX", szValue); VaultInfo[id][vPosition][0] = floatstr(szValue);
        cache_get_value_name(i, "PosY", szValue); VaultInfo[id][vPosition][1] = floatstr(szValue);
        cache_get_value_name(i, "PosZ", szValue); VaultInfo[id][vPosition][2] = floatstr(szValue);
		printf("[Vault] #%d: Money: %d", id, VaultInfo[id][vMoney]);
		RecreateVaultText(id);
	}
    printf("[Vault]: A total of %d vaults have been loaded into the script.", rows);
}


stock MySQL_Load_Vaults()
{
	mysql_tquery(mConnectionHandle, "SELECT * FROM `vaults`", "MySQL_Vault_Load");
}

public MySQL_Vehicle_Load()
{
    new
        rows,
		id,
		szValue[64]
	;
    cache_get_row_count(rows);

    for(new i = 0; i != rows; i++)
    {
        cache_get_value_name(i, "Id", szValue); id = strval(szValue);
        cache_get_value_name(i, "Model", szValue); DynamicVehicleInfo[id][dvModel] = strval(szValue);
        cache_get_value_name(i, "PosX", szValue); DynamicVehicleInfo[id][dvPosition][0] = floatstr(szValue);
        cache_get_value_name(i, "PosY", szValue); DynamicVehicleInfo[id][dvPosition][1] = floatstr(szValue);
        cache_get_value_name(i, "PosZ", szValue); DynamicVehicleInfo[id][dvPosition][2] = floatstr(szValue);
        cache_get_value_name(i, "Angle", szValue); DynamicVehicleInfo[id][dvFacingAngle] = floatstr(szValue);
        cache_get_value_name(i, "Color1", szValue); DynamicVehicleInfo[id][dvColor][0] = strval(szValue);
        cache_get_value_name(i, "Color2", szValue); DynamicVehicleInfo[id][dvColor][1] = strval(szValue);
        cache_get_value_name(i, "Type", szValue); DynamicVehicleInfo[id][dvType] = strval(szValue);
        cache_get_value_name(i, "Faction", szValue); DynamicVehicleInfo[id][dvFaction] = strval(szValue);
		printf("[Vehicle] #%d: Model: %d", id, DynamicVehicleInfo[id][dvModel]);
		
		DynamicVehicleInfo[id][dvHandleId] = CreateVehicleEx(DynamicVehicleInfo[id][dvModel],DynamicVehicleInfo[id][dvPosition][0],DynamicVehicleInfo[id][dvPosition][1],DynamicVehicleInfo[id][dvPosition][2],DynamicVehicleInfo[id][dvFacingAngle],DynamicVehicleInfo[id][dvColor][0],DynamicVehicleInfo[id][dvColor][1],VEHICLE_RESPAWN);
	}
    printf("[Vehicle]: A total of %d vehicles have been loaded into the script.", rows);
}


stock MySQL_Load_Vehicles()
{
	mysql_tquery(mConnectionHandle, "SELECT * FROM `vehicles`", "MySQL_Vehicle_Load");
}


stock UpdateDynamicVehicle(id, modelid = -1, Float:PositionX = -1.0, Float:PositionY = -1.0, Float:PositionZ = -1.0, Float:FacingAngle = -1.0, type = -1, color1 = -1, color2 = -1, faction = -1)
{
	new szQuery[256];
	if(modelid != -1) DynamicVehicleInfo[id][dvModel] = modelid;
	if(PositionX != -1.0) DynamicVehicleInfo[id][dvPosition][0] = PositionX;
	if(PositionY != -1.0) DynamicVehicleInfo[id][dvPosition][1] = PositionY;
	if(PositionZ != -1.0) DynamicVehicleInfo[id][dvPosition][2] = PositionZ;
	if(FacingAngle != -1.0) DynamicVehicleInfo[id][dvFacingAngle] = FacingAngle;
	if(color1 != -1) DynamicVehicleInfo[id][dvColor][0] = color1;
	if(color2 != -1) DynamicVehicleInfo[id][dvColor][1] = color2;
	if(type != -1) DynamicVehicleInfo[id][dvType] = type;
	if(faction != -1) DynamicVehicleInfo[id][dvFaction] = faction;

	format(szQuery, sizeof(szQuery), "UPDATE `vehicles` SET `Model` = '%d',\
 		`PosX` = '%f',\
  		`PosY` = '%f',\
   		`PosZ` = '%f',\
    	`Angle` = '%f',", DynamicVehicleInfo[id][dvModel], DynamicVehicleInfo[id][dvPosition][0], DynamicVehicleInfo[id][dvPosition][1], DynamicVehicleInfo[id][dvPosition][2], DynamicVehicleInfo[id][dvFacingAngle]);
    	
    format(szQuery, sizeof(szQuery), "%s `Color1` = '%d',\
    	`Color2` = '%d',\
   		`Type` = '%d',\
    	`Faction` = '%d'\
		WHERE `Id` = '%d'", szQuery, DynamicVehicleInfo[id][dvColor][0], DynamicVehicleInfo[id][dvColor][1], DynamicVehicleInfo[id][dvType], DynamicVehicleInfo[id][dvFaction], id);
	mysql_tqueryof(szQuery, THREAD_NO_RESULT, INVALID_PLAYER_ID, mConnectionHandle);
	
	DestroyVehicle(DynamicVehicleInfo[id][dvHandleId]);
	DynamicVehicleInfo[id][dvHandleId] = CreateVehicleEx(DynamicVehicleInfo[id][dvModel],DynamicVehicleInfo[id][dvPosition][0],DynamicVehicleInfo[id][dvPosition][1],DynamicVehicleInfo[id][dvPosition][2],DynamicVehicleInfo[id][dvFacingAngle],DynamicVehicleInfo[id][dvColor][0],DynamicVehicleInfo[id][dvColor][1],VEHICLE_RESPAWN);
}

stock DestroyDynamicVehicle(id)
{
	new szQuery[128];
	DynamicVehicleInfo[id][dvModel] = 0;
	DynamicVehicleInfo[id][dvPosition][0] = 0;
	DynamicVehicleInfo[id][dvPosition][1] = 0;
	DynamicVehicleInfo[id][dvPosition][2] = 0;
	DynamicVehicleInfo[id][dvFacingAngle] = 0;
	DynamicVehicleInfo[id][dvColor][0] = 0;
	DynamicVehicleInfo[id][dvColor][1] = 0;
	DynamicVehicleInfo[id][dvType] = 0;
	DynamicVehicleInfo[id][dvFaction] = 0;

	format(szQuery, sizeof(szQuery), "DELETE FROM `vehicles` WHERE `Id` = '%d'", id);
	mysql_tqueryof(szQuery, THREAD_NO_RESULT, INVALID_PLAYER_ID, mConnectionHandle);

	DestroyVehicle(DynamicVehicleInfo[id][dvHandleId]);
	DynamicVehicleInfo[id][dvHandleId] = INVALID_VEHICLE_ID;
}


stock MySQL_Update_Gate(id)
{
	new
	    szQuery[512];

    format(szQuery, sizeof(szQuery), "UPDATE `gates` SET `PosX`='%f',\
		`PosY`='%f',\
		`PosZ`='%f',\
		`PosRotationX`='%f',\
		`PosRotationY`='%f',\
		`PosRotationZ`='%f',", GateInfo[id][gPosition][0], GateInfo[id][gPosition][1], GateInfo[id][gPosition][2], GateInfo[id][gRotation][0], GateInfo[id][gRotation][1], GateInfo[id][gRotation][2]);

    format(szQuery, sizeof(szQuery), "%s`DestinationX`='%f',\
		`DestinationY`='%f',\
		`DestinationZ`='%f',\
		`DestRotationX`='%f',\
		`DestRotationY`='%f',\
		`DestRotationZ`='%f'", szQuery, GateInfo[id][gDestPosition][0], GateInfo[id][gDestPosition][1], GateInfo[id][gDestPosition][2], GateInfo[id][gDestRotation][0], GateInfo[id][gDestRotation][1], GateInfo[id][gDestRotation][2]);

	format(szQuery, sizeof(szQuery), "%s WHERE `Id` = '%d'", szQuery, id);
	mysql_tqueryof(szQuery, 0, INVALID_PLAYER_ID, mConnectionHandle);
}

stock AddVaultMoney(factionid, amount)
{
	new szQuery[128];
    VaultInfo[factionid][vMoney] += amount;
	format(szQuery, sizeof(szQuery), "UPDATE `vaults` SET `Money` = '%d' WHERE `Id` = '%d'", VaultInfo[factionid][vMoney], factionid);
	mysql_tqueryof(szQuery, THREAD_LOG_RESULT, INVALID_PLAYER_ID, mConnectionHandle);
}

public LoadPlayerAccount(playerid)
{
	if(!IsPlayerConnectedEx(playerid)) return 0;

	new szValue[128];

	cache_get_value_name(0, "Id", szValue); PlayerInfo[playerid][pId] = strval(szValue);//
	cache_get_value_name(0, "Banned", szValue); PlayerInfo[playerid][pBanned] = strval(szValue);//
//	cache_get_value_name(0, "IpAddress", PlayerInfo[playerid][pIpAddress],16);
	cache_get_value_name(0, "AdminLevel", szValue); PlayerInfo[playerid][pAdminLevel] = strval(szValue);//
	cache_get_value_name(0, "AdminName", PlayerInfo[playerid][pAdminName],MAX_PLAYER_NAME);
	cache_get_value_name(0, "Money", szValue); PlayerInfo[playerid][pMoney] = strval(szValue);//
	cache_get_value_name(0, "Skin", szValue); PlayerInfo[playerid][pSkin] = strval(szValue);//
    cache_get_value_name(0, "Faction", szValue); PlayerInfo[playerid][pFaction] = strval(szValue);//
    cache_get_value_name(0, "Leadership", szValue); PlayerInfo[playerid][pLeadership] = strval(szValue);//
    cache_get_value_name(0, "Rank", szValue); PlayerInfo[playerid][pRank] = strval(szValue);//
    cache_get_value_name(0, "Division", szValue); PlayerInfo[playerid][pDivision] = strval(szValue);//
	cache_get_value_name(0, "Level", szValue); PlayerInfo[playerid][pLevel] = strval(szValue);//
	cache_get_value_name(0, "Experience", szValue); PlayerInfo[playerid][pExperience] = strval(szValue);//
	cache_get_value_name(0, "Paycheck", szValue); PlayerInfo[playerid][pPaycheck] = strval(szValue);//
	cache_get_value_name(0, "PlayingHours", szValue); PlayerInfo[playerid][pPlayingHours] = strval(szValue);//
	cache_get_value_name(0, "Money", szValue); PlayerInfo[playerid][pMoney] = strval(szValue);//
    cache_get_value_name(0, "Health", szValue); PlayerInfo[playerid][pHealth] = floatstr(szValue);//
    cache_get_value_name(0, "Armour", szValue); PlayerInfo[playerid][pArmour] = floatstr(szValue);//
    cache_get_value_name(0, "PosX", szValue); PlayerInfo[playerid][pPositionX] = floatstr(szValue);//
    cache_get_value_name(0, "PosY", szValue); PlayerInfo[playerid][pPositionY] = floatstr(szValue);//
    cache_get_value_name(0, "PosZ", szValue); PlayerInfo[playerid][pPositionZ] = floatstr(szValue);//
    cache_get_value_name(0, "PosAngle", szValue); PlayerInfo[playerid][pFacingAngle] = floatstr(szValue);//
    cache_get_value_name(0, "Interior", szValue); PlayerInfo[playerid][pInterior] = strval(szValue);//
    cache_get_value_name(0, "VirtualWorld", szValue); PlayerInfo[playerid][pVirtualWorld] = strval(szValue);//
    cache_get_value_name(0, "Job", szValue); PlayerInfo[playerid][pJob] = strval(szValue);//
    cache_get_value_name(0, "wSlot1", szValue); PlayerInfo[playerid][pWeapons][0] = strval(szValue);//
    cache_get_value_name(0, "wSlot2", szValue); PlayerInfo[playerid][pWeapons][1] = strval(szValue);//
    cache_get_value_name(0, "wSlot3", szValue); PlayerInfo[playerid][pWeapons][2] = strval(szValue);//
    cache_get_value_name(0, "wSlot4", szValue); PlayerInfo[playerid][pWeapons][3] = strval(szValue);//
    cache_get_value_name(0, "wSlot5", szValue); PlayerInfo[playerid][pWeapons][4] = strval(szValue);//
    cache_get_value_name(0, "wSlot6", szValue); PlayerInfo[playerid][pWeapons][5] = strval(szValue);//
    cache_get_value_name(0, "wSlot7", szValue); PlayerInfo[playerid][pWeapons][6] = strval(szValue);//
    cache_get_value_name(0, "wSlot8", szValue); PlayerInfo[playerid][pWeapons][7] = strval(szValue);//
    cache_get_value_name(0, "wSlot9", szValue); PlayerInfo[playerid][pWeapons][8] = strval(szValue);//
    cache_get_value_name(0, "wSlot10", szValue); PlayerInfo[playerid][pWeapons][9] = strval(szValue);//
    cache_get_value_name(0, "wSlot11", szValue); PlayerInfo[playerid][pWeapons][10] = strval(szValue);//
    cache_get_value_name(0, "wSlot12", szValue); PlayerInfo[playerid][pWeapons][11] = strval(szValue);//
    cache_get_value_name(0, "NewbMute", szValue); PlayerInfo[playerid][pNewbMute] = strval(szValue);//
    cache_get_value_name(0, "AdMute", szValue); PlayerInfo[playerid][pAdMute] = strval(szValue);//
    cache_get_value_name(0, "ReportMute", szValue); PlayerInfo[playerid][pReportMute] = strval(szValue);//
    cache_get_value_name(0, "JailTime", szValue); PlayerInfo[playerid][pJailTime] = strval(szValue);//
    cache_get_value_name(0, "OocJail", szValue); PlayerInfo[playerid][pOocJail] = strval(szValue);//
    cache_get_value_name(0, "WantedLevel", szValue); PlayerInfo[playerid][pWantedLevel] = strval(szValue);//
    cache_get_value_name(0, "Wounded", szValue); PlayerInfo[playerid][pWounded] = strval(szValue);//
    cache_get_value_name(0, "Tutorial", szValue); PlayerInfo[playerid][pTutorial] = strval(szValue);//
    cache_get_value_name(0, "Age", szValue); PlayerInfo[playerid][pAge] = strval(szValue);//
    cache_get_value_name(0, "Gender", szValue); PlayerInfo[playerid][pGender] = strval(szValue);//
    cache_get_value_name(0, "bBalance", szValue); PlayerInfo[playerid][pBankBalance] = strval(szValue);//
    cache_get_value_name(0, "WalkieTalkie", szValue); PlayerInfo[playerid][pWalkieTalkie] = strval(szValue);//
    cache_get_value_name(0, "Channel", szValue); PlayerInfo[playerid][pChannel] = strval(szValue);//
    cache_get_value_name(0, "PhoneNumber", szValue); PlayerInfo[playerid][pPhoneNumber] = strval(szValue);//
    cache_get_value_name(0, "VIP", szValue); PlayerInfo[playerid][pVIP] = strval(szValue);//
    cache_get_value_name(0, "Spraycan", szValue); PlayerInfo[playerid][pSprayCan] = strval(szValue);//
	cache_get_value_name(0, "Bombs", szValue); PlayerInfo[playerid][pBombs] = strval(szValue);//
    cache_get_value_name(0, "DriverLicense", szValue); PlayerInfo[playerid][pDriverLicense] = strval(szValue);//
    cache_get_value_name(0, "GunLicense", szValue); PlayerInfo[playerid][pGunLicense] = strval(szValue);//
    cache_get_value_name(0, "Seeds", szValue); PlayerInfo[playerid][pSeeds] = strval(szValue);//
    cache_get_value_name(0, "Weed", szValue); PlayerInfo[playerid][pWeed] = strval(szValue);//
    cache_get_value_name(0, "GasCans", szValue); PlayerInfo[playerid][pGasCans] = strval(szValue);//
    cache_get_value_name(0, "PlantX", szValue); PlayerInfo[playerid][pPlantPosition][0] = floatstr(szValue);//
    cache_get_value_name(0, "PlantY", szValue); PlayerInfo[playerid][pPlantPosition][1] = floatstr(szValue);//
    cache_get_value_name(0, "PlantZ", szValue); PlayerInfo[playerid][pPlantPosition][2] = floatstr(szValue);//
    cache_get_value_name(0, "PlantInterior", szValue); PlayerInfo[playerid][pPlantPosition][3] = floatstr(szValue);//
    cache_get_value_name(0, "PlantVw", szValue); PlayerInfo[playerid][pPlantPosition][4] = floatstr(szValue);//
    cache_get_value_name(0, "PlantGrowth", szValue); PlayerInfo[playerid][pPlantGrowth] = strval(szValue);//
    cache_get_value_name(0, "Hitman", szValue); PlayerInfo[playerid][pHitman] = strval(szValue);//
    cache_get_value_name(0, "ContractPrice", szValue); PlayerInfo[playerid][pContractPrice] = strval(szValue);//
    cache_get_value_name(0, "ContractReason", PlayerInfo[playerid][pContractReason],32);
    cache_get_value_name(0, "ContractBy", PlayerInfo[playerid][pContractBy],MAX_PLAYER_NAME);
    cache_get_value_name(0, "Referer", PlayerInfo[playerid][pReferer],MAX_PLAYER_NAME);
    cache_get_value_name(0, "Accent", szValue); PlayerInfo[playerid][pAccent] = strval(szValue);//
    cache_get_value_name(0, "CompletedHits", szValue); PlayerInfo[playerid][pCompletedHits] = strval(szValue);//
    cache_get_value_name(0, "Reports", szValue); PlayerInfo[playerid][pReports] = strval(szValue);//

	new mods[MAX_VEHICLE_MODS][5];
    for(new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
    {
        format(szValue, 64, "pv%d_ModelId", i);
    	cache_get_value_name(0, szValue, szValue); PlayerVehicleInfo[playerid][i][pvModelId] = strval(szValue);//
        format(szValue, 64, "pv%d_PosX", i);
    	cache_get_value_name(0, szValue, szValue); PlayerVehicleInfo[playerid][i][pvPosition][0] = floatstr(szValue);//
        format(szValue, 64, "pv%d_PosY", i);
    	cache_get_value_name(0, szValue, szValue); PlayerVehicleInfo[playerid][i][pvPosition][1] = floatstr(szValue);//
        format(szValue, 64, "pv%d_PosZ", i);
    	cache_get_value_name(0, szValue, szValue); PlayerVehicleInfo[playerid][i][pvPosition][2] = floatstr(szValue);//
        format(szValue, 64, "pv%d_PosAngle", i);
    	cache_get_value_name(0, szValue, szValue); PlayerVehicleInfo[playerid][i][pvPosition][3] = floatstr(szValue);//
        format(szValue, 64, "pv%d_Locked", i);
    	cache_get_value_name(0, szValue, szValue); PlayerVehicleInfo[playerid][i][pvLocked] = strval(szValue);//
        format(szValue, 64, "pv%d_Health", i);
    	cache_get_value_name(0, szValue, szValue); PlayerVehicleInfo[playerid][i][pvHealth] = floatstr(szValue);//
        format(szValue, 64, "pv%d_PaintJob", i);
    	cache_get_value_name(0, szValue, szValue); PlayerVehicleInfo[playerid][i][pvPaintJob] = strval(szValue);//
        format(szValue, 64, "pv%d_Color1", i);
    	cache_get_value_name(0, szValue, szValue); PlayerVehicleInfo[playerid][i][pvCarColor][0] = strval(szValue);//
        format(szValue, 64, "pv%d_Color2", i);
    	cache_get_value_name(0, szValue, szValue); PlayerVehicleInfo[playerid][i][pvCarColor][1] = strval(szValue);//
        format(szValue, 64, "pv%d_Impounded", i);
    	cache_get_value_name(0, szValue, szValue); PlayerVehicleInfo[playerid][i][pvImpounded] = strval(szValue);//
        format(szValue, 64, "pv%d_Ticket", i);
    	cache_get_value_name(0, szValue, szValue); PlayerVehicleInfo[playerid][i][pvTicketPrice] = strval(szValue);//
        format(szValue, 64, "pv%d_Mods", i);
    	cache_get_value_name(0, szValue, szValue, 128); split(szValue, mods, ',');
    	CreatePlayerVehicle(playerid, i);
	   	for (new m=0; m < sizeof(mods); m++)
	   	{
	   	    if(PlayerVehicleInfo[playerid][i][pvHandleId] == 0) break;
	   	    new comp = strval(mods[m]);
	   	    if(comp == 0) continue;
	   	    PlayerVehicleInfo[playerid][i][pvModifications][m] = comp;
	   	    AddVehicleComponent(PlayerVehicleInfo[playerid][i][pvHandleId], PlayerVehicleInfo[playerid][i][pvModifications][m]);
	   	}
	}
	return 1;
}

stock CreatePlayerVehicle(playerid, i)
{
	if(IsValidVehicleModel(PlayerVehicleInfo[playerid][i][pvModelId]) && PlayerVehicleInfo[playerid][i][pvImpounded] == 0)
    {
        if(PlayerVehicleInfo[playerid][i][pvHandleId] > 0) DestroyVehicle(PlayerVehicleInfo[playerid][i][pvHandleId]);
        PlayerVehicleInfo[playerid][i][pvHandleId] = CreateVehicleEx(PlayerVehicleInfo[playerid][i][pvModelId], PlayerVehicleInfo[playerid][i][pvPosition][0], PlayerVehicleInfo[playerid][i][pvPosition][1], PlayerVehicleInfo[playerid][i][pvPosition][2], PlayerVehicleInfo[playerid][i][pvPosition][3], PlayerVehicleInfo[playerid][i][pvCarColor][0], PlayerVehicleInfo[playerid][i][pvCarColor][1], VEHICLE_RESPAWN);
        SetVehicleToRespawn(PlayerVehicleInfo[playerid][i][pvHandleId]);
		VehicleInfo[PlayerVehicleInfo[playerid][i][pvHandleId]][vLocked] = PlayerVehicleInfo[playerid][i][pvLocked];
		ChangeVehiclePaintjob(PlayerVehicleInfo[playerid][i][pvHandleId], PlayerVehicleInfo[playerid][i][pvPaintJob]);
	}
}

stock ReloadVehicleMods(playerid, i)
{
	if(PlayerVehicleInfo[playerid][i][pvHandleId] == 0) return;
	for (new m=0; m < MAX_VEHICLE_MODS; m++)
	{
	    if(PlayerVehicleInfo[playerid][i][pvModifications][m] == 0) continue;
	    AddVehicleComponent(PlayerVehicleInfo[playerid][i][pvHandleId], PlayerVehicleInfo[playerid][i][pvModifications][m]);
	}
	ChangeVehiclePaintjob(PlayerVehicleInfo[playerid][i][pvHandleId], PlayerVehicleInfo[playerid][i][pvPaintJob]);
}

stock split(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;
	while(i <= strlen(strsrc)){
		if(strsrc[i]==delimiter || i==strlen(strsrc)){
			len = strmid(strdest[aNum], strsrc, li, i, 128);
			strdest[aNum][len] = 0;
			li = i+1;
			aNum++;
		}
		i++;
	}
	return 1;
}

CMD:park(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be inside a vehicle to use this command.");
    for(new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
    {
        if(GetPlayerVehicleID(playerid) == PlayerVehicleInfo[playerid][i][pvHandleId])
		{
			
			GetVehicleHealth(PlayerVehicleInfo[playerid][i][pvHandleId], PlayerVehicleInfo[playerid][i][pvHealth]);
			if(PlayerVehicleInfo[playerid][i][pvHealth] < 800) return SendClientMessageEx(playerid, COLOR_GREY, "Your vehicle cannot be parked because it is too damaged to park it.");
		    GetVehiclePos(GetPlayerVehicleID(playerid), PlayerVehicleInfo[playerid][i][pvPosition][0], PlayerVehicleInfo[playerid][i][pvPosition][1], PlayerVehicleInfo[playerid][i][pvPosition][2]);
			GetVehicleZAngle(GetPlayerVehicleID(playerid), PlayerVehicleInfo[playerid][i][pvPosition][3]);
			RemovePlayerFromVehicle(playerid);
			VehicleInfo[PlayerVehicleInfo[playerid][i][pvHandleId]][vLocked] = 0;
			DestroyVehicle(PlayerVehicleInfo[playerid][i][pvHandleId]);
    	    PlayerVehicleInfo[playerid][i][pvHandleId] = CreateVehicleEx(PlayerVehicleInfo[playerid][i][pvModelId], PlayerVehicleInfo[playerid][i][pvPosition][0], PlayerVehicleInfo[playerid][i][pvPosition][1], PlayerVehicleInfo[playerid][i][pvPosition][2], PlayerVehicleInfo[playerid][i][pvPosition][3], PlayerVehicleInfo[playerid][i][pvCarColor][0], PlayerVehicleInfo[playerid][i][pvCarColor][1], VEHICLE_RESPAWN);
         	ReloadVehicleMods(playerid, i);
			VehicleInfo[PlayerVehicleInfo[playerid][i][pvHandleId]][vLocked] = PlayerVehicleInfo[playerid][i][pvLocked];
			MySQL_Save_Player_Vehicle(playerid, i);
            SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully parked your vehicle, it will now spawn here from now on.");
			break;
		}
    }
	return 1;
}

stock CreateVehicleEx(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay)
{
    new id = CreateVehicle(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay);
    OnVehicleSpawn(id);
    return id;
}

CMD:sellmycar(playerid, params[])
{
	new string[128], targetid, price;
	if(sscanf(params, "ui", targetid, price)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /sellmycar <playerid> <price>");
	else if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be inside a vehicle to use this command.");
	else if(!IsPlayerConnectedEx(targetid) || playerid == targetid) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	else if(!IsPlayerInRangeOfPlayer(playerid, targetid, 4.0)) return SendClientMessageEx(playerid, COLOR_GREY, "You must be near the specified player to use this command.");
	else if(price < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Please enter a valid amount above $1.");

 	for(new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
    {
	    if(GetPlayerVehicleID(playerid) == PlayerVehicleInfo[playerid][i][pvHandleId])
	    {
	        if(PlayerVehicleInfo[playerid][i][pvImpounded]) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot sell this vehicle as it has already been impounded.");
	        SetPVarInt(targetid, "VehicleOffer", playerid);
	        SetPVarInt(targetid, "VehicleOfferSlot", i);
	        SetPVarInt(targetid, "VehicleOfferPrice", price);
            format(string, sizeof(string), "* You offered %s to buy this %s for $%d.", GetPlayerNameEx(targetid), GetVehicleName(PlayerVehicleInfo[playerid][i][pvHandleId]), price);
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
            format(string, sizeof(string), "* %s has offered you their %s for $%d, (type /accept car) to buy.", GetPlayerNameEx(playerid), GetVehicleName(PlayerVehicleInfo[playerid][i][pvHandleId]), price);
            SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
			return 1;
		}
	}
 	SendClientMessageEx(playerid, COLOR_GREY, "You must be inside your vehicle to use this command.");
	return 1;
}

CMD:lock(playerid, params[])
{
 	if(GetPVarInt(playerid, "RentingCar") != 0)
	{
	    new
	        Float:tmpFloats[3];
	    GetVehiclePos(GetPVarInt(playerid, "RentingCar"), tmpFloats[0], tmpFloats[1], tmpFloats[2]);
	    if(IsPlayerInRangeOfPoint(playerid, 4.0, tmpFloats[0], tmpFloats[1], tmpFloats[2]))
	    {
	        if(VehicleInfo[GetPVarInt(playerid, "RentingCar")][vLocked] == 0)
	        {
	            VehicleInfo[GetPVarInt(playerid, "RentingCar")][vLocked] = 1;
				GameTextForPlayer(playerid, "~r~locked", 1000, 6);
	        } else {
	            VehicleInfo[GetPVarInt(playerid, "RentingCar")][vLocked] = 0;
				GameTextForPlayer(playerid, "~g~unlocked", 1000, 6);
	        }
   			foreach (new p : Player) {
			   SetVehicleParamsForPlayer(GetPVarInt(playerid, "RentingCar"), p, 0, VehicleInfo[GetPVarInt(playerid, "RentingCar")][vLocked]);
			}
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
	        return 1;
	    }
	}

    for(new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
    {
	    new
	        Float:tmpFloats[3];
	    GetVehiclePos(PlayerVehicleInfo[playerid][i][pvHandleId], tmpFloats[0], tmpFloats[1], tmpFloats[2]);
	    if(IsPlayerInRangeOfPoint(playerid, 4.0, tmpFloats[0], tmpFloats[1], tmpFloats[2]))
	    {
	        if(PlayerVehicleInfo[playerid][i][pvLocked] == 0)
	        {
	        	VehicleInfo[PlayerVehicleInfo[playerid][i][pvHandleId]][vLocked] = 1;
				PlayerVehicleInfo[playerid][i][pvLocked] = 1;
				GameTextForPlayer(playerid, "~r~locked", 1000, 6);
			}
			else
			{
	        	VehicleInfo[PlayerVehicleInfo[playerid][i][pvHandleId]][vLocked] = 0;
				PlayerVehicleInfo[playerid][i][pvLocked] = 0;
				GameTextForPlayer(playerid, "~g~unlocked", 1000, 6);
			}
   			foreach (new p : Player) {
				SetVehicleParamsForPlayer(PlayerVehicleInfo[playerid][i][pvHandleId], p, 0, PlayerVehicleInfo[playerid][i][pvLocked]);
			}
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			MySQL_Save_Player_Vehicle(playerid, i);
			return 1;
		}
	}
 	SendClientMessageEx(playerid, COLOR_GREY, "You must be near your vehicle to use this command.");
	return 1;
}

CMD:deletecar(playerid, params[])
{
	new
	    string[128];
    for(new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
    {
        if(PlayerVehicleInfo[playerid][i][pvModelId] != 0)
		{
		    format(string, sizeof(string), "%s(ID: %d) %s\n", string, i, VehicleNames[PlayerVehicleInfo[playerid][i][pvModelId] - 400]);
		}
		else
		{
		    format(string, sizeof(string), "%s(ID: %d) Empty\n", string, i);
		}
    }
    SendClientMessageEx(playerid, COLOR_YELLOW, "Please make sure that you are sure about deleting your vehicle, no refunds will be issued.");
    SendClientMessageEx(playerid, COLOR_YELLOW, "There is no confirmation after this, this is your only and final warning.");
    ShowPlayerDialogEx(playerid, DIALOG_DELETE_CAR, DIALOG_STYLE_LIST, "Car Deletion", string, "Delete", "Cancel");
	return 1;
}

CMD:gotoveh(playerid, params[])
{
	new vehicle, Float:x, Float:y, Float:z;
	if(!IsAdmin(playerid, ADMIN_LEVEL_TWO)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(sscanf(params,"d",vehicle)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /gotocar <vehicleid>");
	if(!IsValidVehicle(vehicle)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid vehicle ID specified.");
	GetVehiclePos(vehicle, x, y, z);
	SetPlayerPosEx(playerid, x+1, y+1, z);
	SetPlayerInteriorEx(playerid, 0);
	SetPlayerVirtualWorldEx(playerid, 0);
	return 1;
}

CMD:gotocar(playerid, params[])
{
	new
	    string[128],
		targetid;
	if(!IsAdmin(playerid, ADMIN_LEVEL_TWO)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	else if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /gotocar <playerid>");
	else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	SetPVarInt(playerid, "PlayerCarId", targetid);
    for(new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
    {
        if(PlayerVehicleInfo[targetid][i][pvModelId] != 0) {
		    format(string, sizeof(string), "%s(ID: %d) %s\n", string, i, VehicleNames[PlayerVehicleInfo[targetid][i][pvModelId] - 400]);
        } else if(PlayerVehicleInfo[targetid][i][pvImpounded]) {
		    format(string, sizeof(string), "%s(ID: %d) %s (Impounded)\n", string, i, VehicleNames[PlayerVehicleInfo[targetid][i][pvModelId] - 400]);
		} else if(PlayerVehicleInfo[targetid][i][pvTicketPrice] > 0) {
		    format(string, sizeof(string), "%s(ID: %d) %s (Tickets: $%d)\n", string, i, VehicleNames[PlayerVehicleInfo[targetid][i][pvModelId] - 400], PlayerVehicleInfo[targetid][i][pvTicketPrice]);
		} else {
		    format(string, sizeof(string), "%s(ID: %d) Empty\n", string, i);
		}
    }
    ShowPlayerDialogEx(playerid, DIALOG_TELEPORT_CAR, DIALOG_STYLE_LIST, "Teleport to Player's Car", string, "Teleport", "Cancel");
	return 1;
}

CMD:bringcar(playerid, params[])
{
	new
	    string[128],
		targetid;
	if(!IsAdmin(playerid, ADMIN_LEVEL_TWO)) return SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized to use this command.");
	else if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /bringcar <playerid>");
	else if(!IsPlayerConnectedEx(targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
	SetPVarInt(playerid, "PlayerCarId", targetid);
    for(new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
    {
    	if(PlayerVehicleInfo[targetid][i][pvModelId] != 0) {
            if(PlayerVehicleInfo[targetid][i][pvImpounded]) {
		    	format(string, sizeof(string), "%s(ID: %d) %s (Impounded)\n", string, i, VehicleNames[PlayerVehicleInfo[targetid][i][pvModelId] - 400]);
			} else if(PlayerVehicleInfo[playerid][i][pvTicketPrice] > 0) {
			    format(string, sizeof(string), "%s(ID: %d) %s (Tickets: $%d)\n", string, i, VehicleNames[PlayerVehicleInfo[targetid][i][pvModelId] - 400], PlayerVehicleInfo[targetid][i][pvTicketPrice]);
			} else {
		    	format(string, sizeof(string), "%s(ID: %d) %s\n", string, i, VehicleNames[PlayerVehicleInfo[targetid][i][pvModelId] - 400]);
			}
        } else {
		    format(string, sizeof(string), "%s(ID: %d) Empty\n", string, i);
        }
    }
    ShowPlayerDialogEx(playerid, DIALOG_BRING_CAR, DIALOG_STYLE_LIST, "Bring Player's Car", string, "Teleport", "Cancel");
	return 1;
}

CMD:trackcar(playerid, params[])
{
	new
	    string[128];
    for(new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
    {
        if(PlayerVehicleInfo[playerid][i][pvModelId] != 0) {
            if(PlayerVehicleInfo[playerid][i][pvImpounded]) {
		    	format(string, sizeof(string), "%s(ID: %d) %s (Impounded)\n", string, i, VehicleNames[PlayerVehicleInfo[playerid][i][pvModelId] - 400]);
			} else if(PlayerVehicleInfo[playerid][i][pvTicketPrice] > 0) {
			    format(string, sizeof(string), "%s(ID: %d) %s (Tickets: $%d)\n", string, i, VehicleNames[PlayerVehicleInfo[playerid][i][pvModelId] - 400], PlayerVehicleInfo[playerid][i][pvTicketPrice]);
			} else {
		    	format(string, sizeof(string), "%s(ID: %d) %s\n", string, i, VehicleNames[PlayerVehicleInfo[playerid][i][pvModelId] - 400]);
			}
        } else {
		    format(string, sizeof(string), "%s(ID: %d) Empty\n", string, i);
        }
    }
    ShowPlayerDialogEx(playerid, DIALOG_TRACK_CAR, DIALOG_STYLE_LIST, "Track your Car", string, "Track", "Cancel");
	return 1;
}

stock MySQL_Save_Player_Vehicle(playerid, i)
{
	new szString[768], szModifications[128];

	for (new m=0; m < MAX_VEHICLE_MODS; m++)
	{
	    format(szModifications, sizeof(szModifications), "%s%d%s", szModifications, PlayerVehicleInfo[playerid][i][pvModifications][m], (m + 1) >= MAX_VEHICLE_MODS ? ("") : (","));
	}

	format(szString, sizeof(szString), "UPDATE `accounts` SET `pv%d_ModelId` = '%d',\
		`pv%d_PosX` = '%f',\
		`pv%d_PosY` = '%f',\
		`pv%d_PosZ` = '%f',\
		`pv%d_PosAngle` = '%f',", i, PlayerVehicleInfo[playerid][i][pvModelId], i, PlayerVehicleInfo[playerid][i][pvPosition][0], i, PlayerVehicleInfo[playerid][i][pvPosition][1], i, PlayerVehicleInfo[playerid][i][pvPosition][2], i, PlayerVehicleInfo[playerid][i][pvPosition][3], i, PlayerVehicleInfo[playerid][i][pvHealth]);

	format(szString, sizeof(szString), "%s `pv%d_Health` = '%f',\
		`pv%d_Ticket` = '%d',\
		`pv%d_Impounded` = '%d',\
		`pv%d_Locked` = '%d',", szString, i, PlayerVehicleInfo[playerid][i][pvHealth], i, PlayerVehicleInfo[playerid][i][pvTicketPrice], i, PlayerVehicleInfo[playerid][i][pvImpounded], i, PlayerVehicleInfo[playerid][i][pvLocked]);

	format(szString, sizeof(szString), "%s `pv%d_PaintJob` = '%d',\
		`pv%d_Color1` = '%d',\
		`pv%d_Color2` = '%d',\
		`pv%d_Mods` = '%s' WHERE `Id` = '%d'", szString, i, PlayerVehicleInfo[playerid][i][pvPaintJob], i, PlayerVehicleInfo[playerid][i][pvCarColor][0], i, PlayerVehicleInfo[playerid][i][pvCarColor][1], i, szModifications, PlayerInfo[playerid][pId]);

	mysql_tqueryof(szString, THREAD_NO_RESULT, playerid, mConnectionHandle);
}

public SavePlayerAccount(playerid)
{
	if(GetPVarInt(playerid, "gPlayerLogged") == 0) return 0;

	new szQuery[2048];
	if(IsPlayerTabbed(playerid) == false && GetPlayerState(playerid) != PLAYER_STATE_WASTED && GetPlayerState(playerid) != PLAYER_STATE_SPECTATING && GetPVarType(playerid, "SafeMode") == 0 && GetPVarType(playerid, "AdminDuty") == 0)
	{
		GetPlayerPos(playerid, PlayerInfo[playerid][pPositionX], PlayerInfo[playerid][pPositionY], PlayerInfo[playerid][pPositionZ]);
		GetPlayerFacingAngle(playerid, PlayerInfo[playerid][pFacingAngle]);
		GetPlayerHealth(playerid, PlayerInfo[playerid][pHealth]);
		GetPlayerArmour(playerid, PlayerInfo[playerid][pArmour]);
	}

	format(szQuery, sizeof(szQuery), "UPDATE `accounts` SET \
	    `Banned`='%d',\
		`PosX`='%f',\
		`PosY`='%f',\
	 	`PosZ`='%f',\
		`PosAngle`='%f',\
		`Interior`='%d',\
		`VirtualWorld`='%d',\
		`Money`='%d',", PlayerInfo[playerid][pBanned], PlayerInfo[playerid][pPositionX], PlayerInfo[playerid][pPositionY], PlayerInfo[playerid][pPositionZ],  PlayerInfo[playerid][pFacingAngle], PlayerInfo[playerid][pInterior], PlayerInfo[playerid][pVirtualWorld], PlayerInfo[playerid][pMoney]);

	format(szQuery, sizeof(szQuery), "%s`NewbMute`='%d',\
		`AdMute`='%d',\
		`ReportMute`='%d',\
		`IpAddress`='%s',\
		`JailTime`='%d',\
		`bBalance`='%d',\
		`OocJail`='%d',", szQuery, PlayerInfo[playerid][pNewbMute], PlayerInfo[playerid][pAdMute], PlayerInfo[playerid][pReportMute], PlayerInfo[playerid][pIpAddress], PlayerInfo[playerid][pReportMute], PlayerInfo[playerid][pJailTime], PlayerInfo[playerid][pBankBalance], PlayerInfo[playerid][pOocJail]);

	format(szQuery, sizeof(szQuery), "%s`Tutorial`='%d',\
		`Money`='%d',\
		`Skin`='%d',\
		`Health`='%f',\
		`Armour`='%f',\
		`Gender`='%d',\
		`Age`='%d',\
		`Experience`='%d',\
		`Wounded`='%d',", szQuery, PlayerInfo[playerid][pTutorial], PlayerInfo[playerid][pMoney], PlayerInfo[playerid][pSkin], PlayerInfo[playerid][pHealth], PlayerInfo[playerid][pArmour], PlayerInfo[playerid][pGender], PlayerInfo[playerid][pAge], PlayerInfo[playerid][pExperience], PlayerInfo[playerid][pWounded]);

	format(szQuery, sizeof(szQuery), "%s`WalkieTalkie`='%d',\
		`Channel`='%d',\
		`Paycheck`='%d',\
		`PhoneNumber`='%d',\
		`VIP`='%d',\
		`Spraycan`='%d',\
		`DriverLicense`='%d',\
		`GunLicense`='%d',", szQuery, PlayerInfo[playerid][pWalkieTalkie], PlayerInfo[playerid][pChannel], PlayerInfo[playerid][pPaycheck], PlayerInfo[playerid][pPhoneNumber], PlayerInfo[playerid][pVIP], PlayerInfo[playerid][pSprayCan], PlayerInfo[playerid][pDriverLicense],  PlayerInfo[playerid][pGunLicense]);

	format(szQuery, sizeof(szQuery), "%s`wSlot1`='%d',\
		`wSlot2`='%d',\
		`wSlot3`='%d',\
		`wSlot4`='%d',\
		`wSlot5`='%d',\
		`wSlot6`='%d',\
		`wSlot7`='%d',\
		`wSlot8`='%d',\
		`wSlot9`='%d',", szQuery, PlayerInfo[playerid][pWeapons][0], PlayerInfo[playerid][pWeapons][1], PlayerInfo[playerid][pWeapons][2], PlayerInfo[playerid][pWeapons][3], PlayerInfo[playerid][pWeapons][4], PlayerInfo[playerid][pWeapons][5], PlayerInfo[playerid][pWeapons][6], PlayerInfo[playerid][pWeapons][7], PlayerInfo[playerid][pWeapons][8]);

	format(szQuery, sizeof(szQuery), "%s`wSlot10`='%d',\
	    `wSlot11`='%d',\
	    `wSlot12`='%d',\
		`PlayingHours`='%d',\
		`Job`='%d',\
		`Level`='%d',\
		`Faction`='%d',\
		`Rank`='%d',\
		`AdminLevel`='%d',", szQuery, PlayerInfo[playerid][pWeapons][9], PlayerInfo[playerid][pWeapons][10], PlayerInfo[playerid][pWeapons][11], PlayerInfo[playerid][pPlayingHours], PlayerInfo[playerid][pJob], PlayerInfo[playerid][pLevel], PlayerInfo[playerid][pFaction], PlayerInfo[playerid][pRank], PlayerInfo[playerid][pAdminLevel]);

	format(szQuery, sizeof(szQuery), "%s`WantedLevel`='%d',\
		`Weed`='%d',\
		`Seeds`='%d',\
		`PlantX`='%f',\
		`PlantY`='%f',\
		`PlantZ`='%f',", szQuery, PlayerInfo[playerid][pWantedLevel], PlayerInfo[playerid][pWeed], PlayerInfo[playerid][pSeeds], PlayerInfo[playerid][pPlantPosition][0], PlayerInfo[playerid][pPlantPosition][1], PlayerInfo[playerid][pPlantPosition][2]);

    format(szQuery, sizeof(szQuery), "%s`PlantInterior`='%f',\
	    `PlantVw`='%f',\
		`PlantGrowth`='%d',\
		`GasCans`='%d',\
		`Leadership`='%d',\
		`Hitman`='%d',\
		`Bombs`='%d',", szQuery, PlayerInfo[playerid][pPlantPosition][3], PlayerInfo[playerid][pPlantPosition][4], PlayerInfo[playerid][pPlantGrowth], PlayerInfo[playerid][pGasCans], PlayerInfo[playerid][pLeadership], PlayerInfo[playerid][pHitman], PlayerInfo[playerid][pBombs]);

    format(szQuery, sizeof(szQuery), "%s`ContractPrice`='%d',\
		`ContractReason`='%s',\
		`ContractBy`='%s',", szQuery, PlayerInfo[playerid][pContractPrice], PlayerInfo[playerid][pContractReason], PlayerInfo[playerid][pContractBy]);

	format(szQuery, sizeof(szQuery),"%s`Referer`='%s',\
 		`Division`='%d',\
		`Accent`='%d',\
		`AdminName`='%s',\
		`CompletedHits`='%d',\
		`Reports`='%d'", szQuery, PlayerInfo[playerid][pReferer], PlayerInfo[playerid][pDivision], PlayerInfo[playerid][pAccent], PlayerInfo[playerid][pAdminName], PlayerInfo[playerid][pCompletedHits], PlayerInfo[playerid][pReports]);

	format(szQuery, sizeof(szQuery), "%s WHERE `Id` = '%d'", szQuery, PlayerInfo[playerid][pId]);
	mysql_tqueryof(szQuery, THREAD_NO_RESULT, playerid, mConnectionHandle);
	return 1;
}


stock GetDynamicVehicleID(vehicleid)
{
	for(new i = 1; i < MAX_DYNAMIC_VEHICLES+1; i++) if(DynamicVehicleInfo[i][dvHandleId] == vehicleid) return i;
	return INVALID_VEHICLE_ID;
}
stock IsAPlane(iVehicleID)
{
	switch(GetVehicleModel(iVehicleID)) { case 592, 577, 511, 512, 593, 520, 553, 476, 519, 460, 513, 548, 425, 417, 487, 488, 497, 563, 447, 469: return true; }
	return false;
}
stock IsABoat(vehicleid)
{
	new vmodel = GetVehicleModel(vehicleid);
	return (vmodel  == 472 || vmodel == 473 || vmodel == 493 || vmodel == 595 ||
        vmodel == 484 || vmodel == 430 || vmodel == 453 || vmodel == 452 || vmodel == 446 || vmodel == 454);
}

Float:player_get_speed(playerid)
{
	new Float: Floats[3];
	GetVehicleVelocity(GetPlayerVehicleID(playerid), Floats[0], Floats[1], Floats[2]);
	return floatsqroot(Floats[0] * Floats[0] + Floats[1] * Floats[1] + Floats[2] * Floats[2]) * 150;
}

stock HasActiveCheckpoint(playerid)
{
    if(GetPVarInt(playerid, "TakingDMVTest") == 1) return true;
    else if(GetPVarInt(playerid, "PizzaID") > 0) return true;
	else if(GetPVarInt(playerid, "EMSCheckpoint") == 1) return true;
    else if(GetPVarInt(playerid, "PizzaPayment") == 1) return true;
    else if(GetPVarInt(playerid, "TrackingCar") == 1) return true;
    else if(GetPVarInt(playerid, "TaxiFindPlayer") == 1) return true;
    else if(GetPVarInt(playerid, "RouteId") > 0) return true;
    else if(GetPVarInt(playerid, "RoutePayment") == 1) return true;
	else if(GetPVarInt(playerid, "MedicCall") > 0) return true;
	else if(GetPVarInt(playerid, "SmuggleRoute") > 0) return true;
    else return false;
}

stock RemovePlayerFromVehicleEx(playerid)
{
	RemovePlayerFromVehicle(playerid);
}

stock IsACopCar(vehicleid)
{
	if(FactionInfo[DynamicVehicleInfo[GetDynamicVehicleID(vehicleid)][dvFaction]][fType] == FACTION_TYPE_LEO) return true;
	else return false;
}

stock IsAMedicCar(vehicleid)
{
	if(FactionInfo[DynamicVehicleInfo[GetDynamicVehicleID(vehicleid)][dvFaction]][fType] == FACTION_TYPE_MEDIC) return true;
	else return false;
}

stock IsAGovCar(vehicleid)
{
	if(FactionInfo[DynamicVehicleInfo[GetDynamicVehicleID(vehicleid)][dvFaction]][fType] == FACTION_TYPE_GOV) return true;
	else return false;
}

stock IsARentableVehicle(vehicleid)
{
	if(DynamicVehicleInfo[GetDynamicVehicleID(vehicleid)][dvType] == VEHICLE_TYPE_RENT) return true;
	else return false;
}

stock IsATaxiCar(vehicleid)
{
	if(DynamicVehicleInfo[GetDynamicVehicleID(vehicleid)][dvType] == VEHICLE_TYPE_TAXI) return true;
	else return false;
}

stock IsADmvCar(vehicleid)
{
	if(DynamicVehicleInfo[GetDynamicVehicleID(vehicleid)][dvType] == VEHICLE_TYPE_DMV) return true;
	else return false;
}

stock IsAPizzaBike(vehicleid)
{
	if(DynamicVehicleInfo[GetDynamicVehicleID(vehicleid)][dvType] == VEHICLE_TYPE_PIZZA) return true;
	else return false;
}


stock IsATruckerVehicle(vehicleid)
{
	if(DynamicVehicleInfo[GetDynamicVehicleID(vehicleid)][dvType] == VEHICLE_TYPE_TRUCKER) return true;
	else return false;
}


stock WhoRentsVehicle(vehicleid)
{
	foreach (new i: Player)
	{
	    if(GetPVarInt(i, "RentingCar") == vehicleid)
	        return i;
	}
	return INVALID_PLAYER_ID;
}

stock AdminAlert(text[], level)
{
	switch(level)
	{
		case ALERT_GLOBAL:
		{
			SendClientMessageToAllEx(COLOR_LIGHTRED, text);
		}

		case ALERT_ADMINS:
		{
		    SCMToAdmins(text);
		}
	}
	Log("logs/admin.log", text);
	return 1;
}

stock SendFactionMessage(faction, color, text[])
{
	foreach (new i: Player)
	{
		if(PlayerInfo[i][pFaction] == faction)
	    {
       		SendClientMessageEx(i, color, text);
		}
	}
}

stock GetAvailableWaypoint()
{
	for (new i=1; i < MAX_WAYPOINTS; i++)
	{
	    if(WaypointInfo[i][wExistant] == 0)
	    {
	        return i;
	    }
	}
	return INVALID_WAYPOINT_ID;
}

stock GetAvailableBusiness()
{
	for (new i=1; i < MAX_BUSINESSES; i++)
	{
	    if(BusinessInfo[i][bExistant] == 0)
	    {
	        return i;
	    }
	}
	return INVALID_BUSINESS_ID;
}


stock GetAvailableHouse()
{
	for (new i=1; i < MAX_HOUSES; i++)
	{
	    if(HouseInfo[i][hExistant] == 0)
	    {
	        return i;
	    }
	}
	return INVALID_HOUSE_ID;
}

stock GetAvailableGate()
{
	for (new i=1; i < MAX_GATES; i++)
	{
	    if(!IsValidDynamicObject(GateInfo[i][gObjectHandle]))
	    {
	        return i;
	    }
	}
	return INVALID_GATE_ID;
}

stock GetAvailableDynamicVehicle()
{
	for (new i=1; i < MAX_DYNAMIC_VEHICLES; i++)
	{
	    if(!IsValidVehicle(DynamicVehicleInfo[i][dvHandleId]))
		{
			return i;
		}
	}
	return INVALID_DYNAMIC_VEHICLE_ID;
}

stock LoadGameObjects()
{
    // Name: Prison | Type: Exterior | Owner: N/A | Mapped By: Shana | Interior ID: Nil | Virtual World: Nil
	CreateDynamicObject(8210, 110.78, 1904.95, 19.47,   0.00, 0.00, 268.59);
	CreateDynamicObject(8210, 109.39, 1849.34, 19.47,   0.00, 0.00, 268.59);
	CreateDynamicObject(8210, 136.06, 1821.16, 19.47,   0.00, 0.00, 358.62);
	CreateDynamicObject(8210, 191.64, 1819.82, 19.47,   0.00, 0.00, 358.62);
	CreateDynamicObject(8210, 247.19, 1818.47, 19.47,   0.00, 0.00, 358.62);
	CreateDynamicObject(8210, 167.54, 1940.49, 19.49,   0.00, 0.00, 179.89);
	CreateDynamicObject(8378, 215.08, 1875.21, 5.86,   0.00, 0.00, 0.00);
	CreateDynamicObject(3089, 145.11, 1879.23, 18.16,   0.00, 0.00, 272.45);
	CreateDynamicObject(833, 245.98, 1862.52, 20.27,   0.00, 0.00, 308.21);
	CreateDynamicObject(947, 146.89, 1895.92, 19.70,   0.00, 0.00, 180.76);
	CreateDynamicObject(947, 151.74, 1895.81, 19.70,   0.00, 0.00, 180.76);
	CreateDynamicObject(8210, 273.56, 1857.36, 19.48,   0.00, 0.00, 91.38);
	CreateDynamicObject(8210, 272.25, 1912.90, 19.48,   0.00, 0.00, 91.38);
	CreateDynamicObject(4079, 213.30, 1884.53, 29.47,   0.00, 0.00, 135.00);
	CreateDynamicObject(987, 131.90, 1940.60, 18.20,   0.00, 0.00, 180.00);
	CreateDynamicObject(987, 119.33, 1940.82, 18.20,   0.00, 0.00, 225.18);
	CreateDynamicObject(8210, 223.18, 1940.48, 19.49,   0.00, 0.00, 179.89);
	CreateDynamicObject(4028, 272.79, 2055.85, 29.77,   0.00, 0.00, 29.39);
	CreateDynamicObject(4079, 227.12, 2031.17, 29.58,   0.00, 0.00, 313.89);
	CreateDynamicObject(11319, 264.11, 2028.62, 19.38,   0.00, 0.00, 357.08);
	CreateDynamicObject(11319, 190.10, 2029.57, 19.47,   0.00, 0.00, 358.59);
	CreateDynamicObject(10610, 258.33, 1999.97, 26.83,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 275.68, 1793.98, 16.63,   0.00, 0.00, 92.12);
	CreateDynamicObject(987, 275.21, 1805.92, 16.63,   0.00, 0.00, 92.43);
	CreateDynamicObject(8210, 189.16, 1968.58, 19.47,   0.00, 0.00, 269.95);
	CreateDynamicObject(8210, 189.16, 2024.04, 19.58,   0.00, 0.00, 269.95);
	CreateDynamicObject(987, 340.14, 1794.51, 16.98,   0.00, 0.00, 35.16);
	CreateDynamicObject(8210, 288.76, 1933.06, 19.49,   0.00, 0.00, 179.89);
	CreateDynamicObject(987, 260.46, 1940.73, 16.62,   0.00, 0.00, 272.00);
	CreateDynamicObject(987, 251.13, 1929.26, 16.62,   0.00, 0.00, 92.00);
	CreateDynamicObject(8210, 316.89, 1961.08, 19.49,   0.00, 0.00, 270.00);
	CreateDynamicObject(8210, 288.95, 2100.24, 19.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(8210, 316.89, 2016.69, 19.49,   0.00, 0.00, 270.00);
	CreateDynamicObject(8210, 316.89, 2072.30, 19.49,   0.00, 0.00, 270.00);
	CreateDynamicObject(8210, 233.49, 2100.24, 19.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(8210, 197.74, 2075.00, 24.53,   0.00, 0.00, 250.34);
	CreateDynamicObject(8210, 343.61, 2077.96, 19.49,   0.00, 0.00, 180.00);
	CreateDynamicObject(8210, 390.00, 2002.30, 19.49,   0.00, 0.00, 90.00);
	CreateDynamicObject(8210, 380.50, 2052.10, 19.49,   0.00, 0.00, 110.05);
	CreateDynamicObject(3499, 315.99, 2078.10, 20.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 371.16, 2078.17, 20.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 390.12, 2029.58, 19.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 390.12, 2024.78, 19.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 390.12, 2025.93, 19.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 390.12, 2027.18, 19.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 390.12, 2028.37, 19.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 316.45, 2099.98, 20.59,   0.00, 0.00, 0.00);
	CreateDynamicObject(8210, 197.74, 2075.00, 21.83,   0.00, 0.00, 250.34);
	CreateDynamicObject(3499, 206.02, 2100.03, 24.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 206.84, 2100.83, 24.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 189.19, 2051.29, 24.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 188.73, 2050.19, 24.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 189.00, 2048.96, 24.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 187.94, 2049.20, 24.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 316.34, 1933.58, 19.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 272.30, 1933.07, 19.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 188.87, 1940.73, 20.25,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 119.46, 1940.65, 19.26,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 111.23, 1932.46, 20.19,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 108.71, 1821.92, 20.05,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 302.86, 2078.15, 20.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(12911, 231.39, 2085.93, 16.56,   0.00, 0.00, -45.00);
	CreateDynamicObject(7981, 236.11, 2067.89, 21.54,   0.00, 0.00, 0.00);
	CreateDynamicObject(1682, 241.48, 2070.00, 32.75,   0.00, 0.00, 45.00);
	CreateDynamicObject(8210, 271.08, 1980.30, 19.48,   0.00, 0.00, 91.38);
	CreateDynamicObject(8417, 212.78, 1963.98, 16.75,   0.00, 0.00, 0.00);
	CreateDynamicObject(3496, 231.41, 1978.31, 16.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(3496, 231.41, 1967.21, 16.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(3496, 231.41, 1958.29, 16.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(3496, 231.41, 1947.06, 16.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(3496, 195.53, 1947.13, 16.64,   0.00, 0.00, 270.00);
	CreateDynamicObject(3496, 195.53, 1958.25, 16.64,   0.00, 0.00, 270.00);
	CreateDynamicObject(3496, 195.53, 1967.05, 16.64,   0.00, 0.00, 270.00);
	CreateDynamicObject(3496, 195.53, 1978.29, 16.64,   0.00, 0.00, 270.00);
	CreateDynamicObject(14780, 214.82, 1992.39, 17.25,   0.00, 0.00, 0.00);
	CreateDynamicObject(8210, 245.56, 1980.44, 19.48,   0.00, 0.00, 91.38);
	CreateDynamicObject(14787, 200.02, 1996.30, 16.76,   0.00, 0.00, 0.00);
	CreateDynamicObject(2628, 201.00, 2006.41, 16.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(2628, 195.53, 2006.41, 16.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(2628, 197.45, 2006.41, 16.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(2628, 199.22, 2006.41, 16.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(2629, 207.24, 2006.38, 16.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(2629, 203.46, 2006.38, 16.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(2629, 205.37, 2006.38, 16.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(2915, 197.71, 1994.12, 16.86,   0.00, 0.00, 90.00);
	CreateDynamicObject(2915, 197.71, 1985.87, 16.86,   0.00, 0.00, 90.00);
	CreateDynamicObject(2915, 197.71, 1987.39, 16.86,   0.00, 0.00, 90.00);
	CreateDynamicObject(2915, 197.71, 1988.94, 16.86,   0.00, 0.00, 90.00);
	CreateDynamicObject(2915, 197.71, 1990.28, 16.86,   0.00, 0.00, 90.00);
	CreateDynamicObject(2915, 197.71, 1991.53, 16.86,   0.00, 0.00, 90.00);
	CreateDynamicObject(2915, 197.71, 1992.78, 16.86,   0.00, 0.00, 90.00);
	CreateDynamicObject(18850, 356.35, 1910.37, 4.54,   0.00, 0.00, 0.00);
	CreateDynamicObject(18850, 356.35, 1946.09, 4.54,   0.00, 0.00, 0.00);
	CreateDynamicObject(18850, 356.35, 1982.97, 4.54,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 131.75, 1935.55, 18.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 139.99, 1947.47, 18.20,   0.00, 0.00, 270.00);
	CreateDynamicObject(987, 131.75, 1923.53, 18.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 139.99, 1935.51, 18.20,   0.00, 0.00, 270.00);
	CreateDynamicObject(3881, 142.48, 1936.22, 20.02,   0.00, 0.00, 0.00);
	CreateDynamicObject(3882, 142.70, 1936.48, 19.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(970, 145.13, 1935.23, 22.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(970, 145.16, 1938.14, 22.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(970, 140.39, 1938.14, 22.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(970, 140.41, 1935.23, 22.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(970, 142.77, 1933.19, 22.29,   0.00, 0.00, 0.00);
	CreateDynamicObject(3279, 118.58, 1930.12, 16.82,   356.86, 0.00, 3.14);
	CreateDynamicObject(3279, 240.14, 1968.63, 16.82,   356.86, 0.00, 3.14);
	CreateDynamicObject(3279, 305.53, 1941.02, 16.82,   356.86, 0.00, 3.14);
	CreateDynamicObject(3279, 309.08, 2028.28, 16.82,   356.86, 0.00, 3.14);
	// Name: Prison | Type: Interior | Owner: N/A | Mapped By: Shana | Interior ID: Nil | Virtual World: Nil
	CreateDynamicObject(16230, 2721.68, -2473.94, 5000.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2713.22, -2458.81, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2722.83, -2458.81, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2732.46, -2458.81, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2742.08, -2458.81, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2743.41, -2463.45, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2743.41, -2473.08, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2743.41, -2482.69, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2742.08, -2487.59, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2732.46, -2487.59, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2722.83, -2487.59, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2713.22, -2487.59, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2705.32, -2482.69, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2705.32, -2473.07, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2705.32, -2463.45, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19388, 2741.75, -2464.98, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2738.56, -2460.21, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19388, 2735.36, -2464.98, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2732.16, -2460.21, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19388, 2728.95, -2464.98, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2725.74, -2460.21, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19388, 2722.56, -2464.98, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2719.30, -2460.21, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19388, 2716.16, -2464.98, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19431, 2713.77, -2464.98, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2713.02, -2462.41, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(14416, 2710.94, -2464.29, 4992.93,   0.00, 0.00, 180.00);
	CreateDynamicObject(19358, 2706.80, -2458.81, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19358, 2711.50, -2467.15, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19431, 2709.10, -2467.15, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19358, 2709.03, -2465.56, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19358, 2709.03, -2462.36, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19388, 2741.75, -2481.06, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2735.36, -2481.06, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2728.95, -2481.06, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2722.56, -2481.06, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2716.16, -2481.06, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19431, 2713.77, -2481.06, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2738.56, -2485.79, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2732.16, -2485.79, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2725.74, -2485.79, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2719.30, -2485.79, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2713.02, -2483.74, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(14416, 2710.99, -2482.39, 4992.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(19358, 2711.49, -2479.00, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19431, 2709.10, -2479.00, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19358, 2709.03, -2480.61, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19358, 2709.03, -2483.82, 4994.39,   0.00, 0.00, 0.00);
	CreateDynamicObject(19388, 2706.71, -2479.00, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2706.71, -2467.15, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(1492, 2705.92, -2479.00, 4992.66,   0.00, 0.00, 0.00);
	CreateDynamicObject(1492, 2705.92, -2467.12, 4992.66,   0.00, 0.00, 0.00);
	CreateDynamicObject(19377, 2704.30, -2483.08, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19377, 2704.31, -2472.59, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19377, 2704.31, -2462.09, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19377, 2717.76, -2460.89, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19377, 2727.39, -2460.89, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19377, 2736.76, -2460.89, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19377, 2746.38, -2460.89, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19454, 2710.87, -2475.74, 4996.06,   0.00, -90.00, 0.00);
	CreateDynamicObject(19454, 2717.42, -2478.81, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19362, 2710.87, -2467.74, 4996.06,   0.00, -90.00, 0.00);
	CreateDynamicObject(19435, 2710.87, -2470.12, 4996.06,   0.00, -90.00, 0.00);
	CreateDynamicObject(19454, 2727.06, -2478.81, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19454, 2736.68, -2478.81, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19454, 2743.24, -2475.74, 4996.06,   0.00, 90.00, 0.00);
	CreateDynamicObject(19454, 2717.42, -2467.89, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19435, 2743.24, -2470.12, 4996.06,   0.00, 90.00, 0.00);
	CreateDynamicObject(19362, 2743.24, -2467.74, 4996.06,   0.00, 90.00, 0.00);
	CreateDynamicObject(19454, 2727.04, -2467.89, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19454, 2736.68, -2467.89, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19377, 2717.76, -2485.80, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19377, 2727.39, -2485.80, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19377, 2736.76, -2485.80, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19377, 2746.38, -2485.80, 4996.06,   0.00, 90.00, 90.00);
	CreateDynamicObject(19450, 2713.22, -2487.59, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2722.83, -2487.59, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2732.46, -2487.59, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2742.08, -2487.59, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2738.56, -2485.79, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2732.16, -2485.79, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2725.74, -2485.79, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2719.30, -2485.79, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2713.04, -2485.79, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2713.22, -2458.81, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2722.83, -2458.81, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2719.30, -2460.21, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2713.04, -2460.25, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2725.74, -2460.21, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2732.46, -2458.81, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2732.16, -2460.21, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2738.56, -2460.21, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2742.08, -2458.81, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2743.41, -2463.45, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2743.41, -2473.08, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2743.41, -2482.69, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19388, 2741.75, -2481.06, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2735.36, -2481.06, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2728.95, -2481.06, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2722.56, -2481.06, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2716.16, -2481.06, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19431, 2713.77, -2481.06, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19431, 2713.77, -2464.98, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2716.16, -2464.98, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2722.56, -2464.98, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2728.95, -2464.98, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2735.36, -2464.98, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2741.75, -2464.98, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2709.03, -2460.39, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19388, 2709.03, -2470.00, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19404, 2709.03, -2473.20, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19404, 2709.03, -2476.40, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2709.03, -2482.81, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 2714.62, -2469.62, 4996.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 2718.79, -2469.62, 4996.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 2722.96, -2469.62, 4996.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 2727.12, -2469.62, 4996.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 2731.29, -2469.62, 4996.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 2735.45, -2469.62, 4996.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 2739.47, -2469.62, 4996.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 2741.56, -2471.70, 4996.68,   0.00, 0.00, 90.00);
	CreateDynamicObject(970, 2741.56, -2475.10, 4996.68,   0.00, 0.00, 90.00);
	CreateDynamicObject(970, 2739.47, -2477.18, 4996.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 2735.45, -2477.18, 4996.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 2731.29, -2477.18, 4996.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 2727.12, -2477.18, 4996.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 2722.96, -2477.18, 4996.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 2718.79, -2477.18, 4996.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 2714.62, -2477.18, 4996.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 2712.53, -2471.70, 4996.68,   0.00, 0.00, 90.00);
	CreateDynamicObject(970, 2712.53, -2475.10, 4996.68,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2709.03, -2466.80, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19446, 2704.22, -2468.30, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19446, 2706.14, -2463.53, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19354, 2707.41, -2459.47, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19446, 2702.14, -2473.10, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19446, 2705.41, -2482.69, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19325, 2708.95, -2474.49, 4998.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(4100, 2709.05, -2477.65, 4998.52,   0.00, 0.00, 50.00);
	CreateDynamicObject(2435, 2708.62, -2472.57, 4996.15,   0.00, 0.00, 90.00);
	CreateDynamicObject(2435, 2708.62, -2473.50, 4996.15,   0.00, 0.00, 90.00);
	CreateDynamicObject(2435, 2708.62, -2474.43, 4996.15,   0.00, 0.00, 90.00);
	CreateDynamicObject(2435, 2708.62, -2475.36, 4996.15,   0.00, 0.00, 90.00);
	CreateDynamicObject(2435, 2708.62, -2476.28, 4996.15,   0.00, 0.00, 90.00);
	CreateDynamicObject(2435, 2708.62, -2477.20, 4996.15,   0.00, 0.00, 90.00);
	CreateDynamicObject(1886, 2742.91, -2465.49, 4999.69,   10.00, 0.00, -45.00);
	CreateDynamicObject(1886, 2742.92, -2480.55, 4996.02,   10.00, 0.00, -135.00);
	CreateDynamicObject(1886, 2742.92, -2480.55, 4999.69,   10.00, 0.00, -135.00);
	CreateDynamicObject(1886, 2742.91, -2465.49, 4996.02,   10.00, 0.00, -45.00);
	CreateDynamicObject(1886, 2709.49, -2476.93, 4999.69,   10.00, 0.00, 49.36);
	CreateDynamicObject(1886, 2709.43, -2471.14, 4999.69,   10.00, 0.00, 138.36);
	CreateDynamicObject(1886, 2705.94, -2486.93, 4995.99,   10.00, 0.00, 133.30);
	CreateDynamicObject(1886, 2705.32, -2474.85, 4996.05,   10.00, 0.00, 90.00);
	CreateDynamicObject(1886, 2705.76, -2459.35, 4996.05,   10.00, 0.00, 45.00);
	CreateDynamicObject(1368, 2713.59, -2477.60, 4996.83,   0.00, 0.00, 0.00);
	CreateDynamicObject(1368, 2719.83, -2477.60, 4996.83,   0.00, 0.00, 0.00);
	CreateDynamicObject(1368, 2726.07, -2477.60, 4996.83,   0.00, 0.00, 0.00);
	CreateDynamicObject(1368, 2732.35, -2477.60, 4996.83,   0.00, 0.00, 0.00);
	CreateDynamicObject(1368, 2738.47, -2477.60, 4996.83,   0.00, 0.00, 0.00);
	CreateDynamicObject(1368, 2738.47, -2469.26, 4996.83,   0.00, 0.00, 180.00);
	CreateDynamicObject(1368, 2732.35, -2469.26, 4996.83,   0.00, 0.00, 180.00);
	CreateDynamicObject(1368, 2726.07, -2469.26, 4996.83,   0.00, 0.00, 180.00);
	CreateDynamicObject(1368, 2719.83, -2469.26, 4996.83,   0.00, 0.00, 180.00);
	CreateDynamicObject(1368, 2713.59, -2469.26, 4996.83,   0.00, 0.00, 180.00);
	CreateDynamicObject(2606, 2705.15, -2468.21, 4998.93,   10.00, 0.00, 0.00);
	CreateDynamicObject(2606, 2703.19, -2468.21, 4998.49,   10.00, 0.00, 0.00);
	CreateDynamicObject(2606, 2703.19, -2468.21, 4998.05,   10.00, 0.00, 0.00);
	CreateDynamicObject(2606, 2705.15, -2468.21, 4997.61,   10.00, 0.00, 0.00);
	CreateDynamicObject(2606, 2703.19, -2468.21, 4998.93,   10.00, 0.00, 0.00);
	CreateDynamicObject(2606, 2705.15, -2468.21, 4998.49,   10.00, 0.00, 0.00);
	CreateDynamicObject(2606, 2705.15, -2468.22, 4998.05,   10.00, 0.00, 0.00);
	CreateDynamicObject(2606, 2703.19, -2468.21, 4997.61,   10.00, 0.00, 0.00);
	CreateDynamicObject(2190, 2708.81, -2472.72, 4997.20,   0.00, 0.00, -90.00);
	CreateDynamicObject(19273, 2708.42, -2474.31, 4997.12,   -90.00, 0.00, -90.00);
	CreateDynamicObject(19273, 2708.42, -2475.29, 4997.12,   -90.00, 0.00, -90.00);
	CreateDynamicObject(19446, 2708.72, -2483.01, 4997.88,   0.00, 0.00, 356.36);
	CreateDynamicObject(19384, 2707.10, -2488.28, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(2604, 2702.66, -2473.51, 4996.92,   0.00, 0.00, 90.00);
	CreateDynamicObject(2612, 2702.27, -2474.50, 4998.45,   0.00, 0.00, 90.00);
	CreateDynamicObject(2356, 2703.96, -2472.40, 4996.15,   0.00, 0.00, 90.00);
	CreateDynamicObject(2356, 2703.79, -2473.69, 4996.15,   0.00, 0.00, 135.37);
	CreateDynamicObject(18092, 2703.62, -2468.89, 4996.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(2190, 2705.96, -2469.06, 4997.10,   0.00, 0.00, 292.34);
	CreateDynamicObject(1800, 2713.59, -2466.00, 4992.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2718.46, -2466.00, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(1786, 2716.11, -2458.45, 4998.58,   10.00, 0.00, 0.00);
	CreateDynamicObject(1786, 2722.60, -2458.45, 4998.58,   10.00, 0.00, 0.00);
	CreateDynamicObject(1786, 2728.80, -2458.45, 4998.58,   10.00, 0.00, 0.00);
	CreateDynamicObject(1786, 2735.21, -2458.45, 4998.58,   10.00, 0.00, 0.00);
	CreateDynamicObject(1786, 2741.01, -2458.45, 4998.58,   10.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2719.87, -2466.00, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2724.91, -2466.00, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2726.32, -2466.00, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2731.22, -2466.00, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2732.72, -2466.00, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2737.71, -2465.98, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2739.13, -2466.00, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(2525, 2739.25, -2459.38, 4996.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(2525, 2732.79, -2459.38, 4996.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(2525, 2726.25, -2459.38, 4996.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(2525, 2720.21, -2459.38, 4996.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(2525, 2713.42, -2459.38, 4992.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(2089, 2715.64, -2459.12, 4996.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(2089, 2722.28, -2459.12, 4996.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(2089, 2728.49, -2459.12, 4996.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(2089, 2734.86, -2459.12, 4996.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(2089, 2740.82, -2459.12, 4996.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(2527, 2742.69, -2460.28, 4996.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(2527, 2737.87, -2460.36, 4996.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(2527, 2731.34, -2460.36, 4996.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(2527, 2725.00, -2460.36, 4996.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(2527, 2717.98, -2460.36, 4996.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2713.59, -2466.00, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2718.36, -2466.00, 4992.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2719.87, -2466.00, 4992.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2724.91, -2466.00, 4992.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2726.32, -2466.00, 4992.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2731.22, -2466.00, 4992.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2732.72, -2466.00, 4992.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2737.71, -2465.98, 4992.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2739.13, -2466.00, 4992.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(1786, 2741.01, -2458.45, 4995.01,   10.00, 0.00, 0.00);
	CreateDynamicObject(1786, 2735.21, -2458.45, 4995.01,   10.00, 0.00, 0.00);
	CreateDynamicObject(1786, 2728.80, -2458.45, 4995.01,   10.00, 0.00, 0.00);
	CreateDynamicObject(1786, 2722.60, -2458.45, 4995.01,   10.00, 0.00, 0.00);
	CreateDynamicObject(1786, 2716.11, -2458.45, 4995.01,   10.00, 0.00, 0.00);
	CreateDynamicObject(2525, 2713.42, -2459.38, 4996.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(2525, 2720.19, -2459.38, 4992.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(2525, 2726.25, -2459.38, 4992.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(2525, 2732.79, -2459.38, 4992.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(2525, 2739.25, -2459.38, 4992.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(2527, 2742.69, -2460.28, 4992.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(2527, 2737.87, -2460.36, 4992.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(2527, 2731.34, -2460.36, 4992.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(2527, 2725.00, -2460.36, 4992.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(2527, 2718.00, -2460.36, 4992.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(2089, 2715.64, -2459.12, 4992.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(2089, 2722.28, -2459.12, 4992.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(2089, 2728.49, -2459.12, 4992.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(2089, 2734.86, -2459.12, 4992.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(2089, 2740.82, -2459.12, 4992.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(19273, 2709.01, -2470.94, 4997.61,   0.00, 0.00, -90.00);
	CreateDynamicObject(19273, 2709.07, -2470.94, 4997.61,   0.00, 0.00, 90.00);
	CreateDynamicObject(19446, 2700.67, -2477.96, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(14596, 2703.32, -2494.67, 5001.04,   0.00, 0.00, -90.00);
	CreateDynamicObject(19450, 2703.59, -2487.59, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(1800, 2713.68, -2484.63, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(2525, 2718.74, -2487.01, 4996.15,   0.00, 0.00, 180.00);
	CreateDynamicObject(2089, 2716.68, -2487.27, 4996.14,   0.00, 0.00, 180.00);
	CreateDynamicObject(1786, 2716.30, -2487.94, 4998.58,   10.00, 0.00, 180.00);
	CreateDynamicObject(2527, 2713.70, -2486.05, 4996.15,   0.00, 0.00, 180.00);
	CreateDynamicObject(1800, 2718.31, -2484.63, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2719.86, -2484.63, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2724.76, -2484.63, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2726.47, -2484.63, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2731.27, -2484.63, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2732.88, -2484.63, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2737.71, -2488.59, 4996.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2742.39, -2487.05, 4996.13,   0.00, 0.00, 90.00);
	CreateDynamicObject(2527, 2720.04, -2486.05, 4996.15,   0.00, 0.00, 180.00);
	CreateDynamicObject(2527, 2726.60, -2486.05, 4996.15,   0.00, 0.00, 180.00);
	CreateDynamicObject(2527, 2733.15, -2486.05, 4996.15,   0.00, 0.00, 180.00);
	CreateDynamicObject(2527, 2741.87, -2486.05, 4996.15,   0.00, 0.00, 180.00);
	CreateDynamicObject(1786, 2722.67, -2487.94, 4998.58,   10.00, 0.00, 180.00);
	CreateDynamicObject(1786, 2729.41, -2487.94, 4998.58,   10.00, 0.00, 180.00);
	CreateDynamicObject(1786, 2735.88, -2487.94, 4998.58,   10.00, 0.00, 180.00);
	CreateDynamicObject(1786, 2743.77, -2483.88, 4998.58,   10.00, 0.00, -90.00);
	CreateDynamicObject(2089, 2723.19, -2487.27, 4996.14,   0.00, 0.00, 180.00);
	CreateDynamicObject(2089, 2729.67, -2487.27, 4996.14,   0.00, 0.00, 180.00);
	CreateDynamicObject(2089, 2736.17, -2487.27, 4996.14,   0.00, 0.00, 180.00);
	CreateDynamicObject(2089, 2743.09, -2483.60, 4996.14,   0.00, 0.00, -90.00);
	CreateDynamicObject(2525, 2724.84, -2487.01, 4996.15,   0.00, 0.00, 180.00);
	CreateDynamicObject(2525, 2731.46, -2487.01, 4996.15,   0.00, 0.00, 180.00);
	CreateDynamicObject(2525, 2736.80, -2481.64, 4996.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(2525, 2740.11, -2481.65, 4996.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(1786, 2743.77, -2483.88, 4995.01,   10.00, 0.00, -90.00);
	CreateDynamicObject(1786, 2735.88, -2487.94, 4995.01,   10.00, 0.00, 180.00);
	CreateDynamicObject(1786, 2729.41, -2487.94, 4995.01,   10.00, 0.00, 180.00);
	CreateDynamicObject(1786, 2722.67, -2487.94, 4995.01,   10.00, 0.00, 180.00);
	CreateDynamicObject(1786, 2716.30, -2487.94, 4995.01,   10.00, 0.00, 180.00);
	CreateDynamicObject(2089, 2743.09, -2483.60, 4992.60,   0.00, 0.00, -90.00);
	CreateDynamicObject(2527, 2741.87, -2486.05, 4992.60,   0.00, 0.00, 180.00);
	CreateDynamicObject(1800, 2742.25, -2487.05, 4992.60,   0.00, 0.00, 90.00);
	CreateDynamicObject(2525, 2739.55, -2481.65, 4992.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2737.73, -2488.58, 4992.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2732.88, -2484.63, 4992.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(2527, 2733.15, -2486.05, 4992.60,   0.00, 0.00, 180.00);
	CreateDynamicObject(2089, 2736.17, -2487.27, 4992.60,   0.00, 0.00, 180.00);
	CreateDynamicObject(2525, 2736.72, -2481.64, 4992.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2731.27, -2484.63, 4992.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2726.47, -2484.63, 4992.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(2527, 2726.60, -2486.05, 4992.60,   0.00, 0.00, 180.00);
	CreateDynamicObject(2089, 2729.67, -2487.27, 4992.60,   0.00, 0.00, 180.00);
	CreateDynamicObject(2525, 2731.46, -2487.01, 4992.60,   0.00, 0.00, 180.00);
	CreateDynamicObject(1800, 2724.90, -2484.63, 4992.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2719.86, -2484.63, 4992.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(2527, 2720.04, -2486.05, 4992.60,   0.00, 0.00, 180.00);
	CreateDynamicObject(2089, 2723.19, -2487.27, 4992.60,   0.00, 0.00, 180.00);
	CreateDynamicObject(2525, 2724.84, -2487.01, 4992.60,   0.00, 0.00, 180.00);
	CreateDynamicObject(1800, 2718.31, -2484.63, 4992.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(1800, 2713.68, -2484.63, 4992.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(2527, 2713.70, -2486.05, 4992.60,   0.00, 0.00, 180.00);
	CreateDynamicObject(2089, 2716.68, -2487.27, 4992.60,   0.00, 0.00, 180.00);
	CreateDynamicObject(2525, 2718.74, -2487.01, 4992.60,   0.00, 0.00, 180.00);
	CreateDynamicObject(19378, 2705.81, -2483.57, 4999.56,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2705.81, -2473.09, 4999.56,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2705.81, -2462.59, 4999.56,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2715.43, -2462.59, 4999.56,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2725.02, -2462.59, 4999.56,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2734.64, -2462.59, 4999.56,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2744.25, -2462.59, 4999.56,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2715.43, -2473.09, 4999.56,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2725.02, -2473.09, 4999.56,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2734.64, -2473.09, 4999.56,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2744.25, -2473.09, 4999.56,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2715.43, -2483.57, 4999.56,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2725.02, -2483.57, 4999.56,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2734.64, -2483.57, 4999.56,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2710.96, -2484.37, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(2435, 2714.49, -2453.05, 5001.97,   0.00, 0.00, 180.00);
	CreateDynamicObject(3499, 2713.96, -2453.01, 5002.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(2435, 2715.41, -2453.05, 5001.97,   0.00, 0.00, 180.00);
	CreateDynamicObject(2435, 2716.34, -2453.05, 5001.97,   0.00, 0.00, 180.00);
	CreateDynamicObject(2435, 2717.27, -2453.05, 5001.97,   0.00, 0.00, 180.00);
	CreateDynamicObject(2435, 2718.19, -2453.05, 5001.97,   0.00, 0.00, 180.00);
	CreateDynamicObject(2435, 2719.10, -2453.05, 5001.97,   0.00, 0.00, 180.00);
	CreateDynamicObject(3499, 2720.84, -2453.01, 5002.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(2435, 2720.02, -2453.05, 5001.97,   0.00, 0.00, 180.00);
	CreateDynamicObject(3499, 2723.52, -2453.01, 5002.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(19273, 2721.03, -2452.48, 5003.55,   0.00, 0.00, 161.37);
	CreateDynamicObject(19273, 2721.31, -2453.32, 5003.55,   0.00, 0.00, 51.74);
	CreateDynamicObject(3498, 2718.80, -2453.02, 5004.71,   0.00, 90.00, 0.00);
	CreateDynamicObject(984, 2717.57, -2453.03, 5005.59,   0.00, 0.00, 90.00);
	CreateDynamicObject(1702, 2714.17, -2450.44, 5001.97,   0.00, 0.00, 90.00);
	CreateDynamicObject(1702, 2714.63, -2447.96, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2011, 2714.14, -2447.89, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(1702, 2723.14, -2448.41, 5001.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(1702, 2720.69, -2447.93, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2011, 2723.22, -2447.88, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(1536, 2717.16, -2447.42, 5001.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(1536, 2720.17, -2447.39, 5001.95,   0.00, 0.00, 180.00);
	CreateDynamicObject(3499, 2713.94, -2457.58, 5002.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(2435, 2713.94, -2453.95, 5001.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(2435, 2713.94, -2454.87, 5001.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(2435, 2713.94, -2455.78, 5001.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(2435, 2713.94, -2456.71, 5001.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(19450, 2719.04, -2457.58, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2723.87, -2455.89, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19388, 2723.87, -2459.25, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(3499, 2723.40, -2457.56, 5002.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(19431, 2723.87, -2453.49, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19431, 2723.87, -2461.65, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19325, 2713.96, -2455.18, 5004.61,   90.00, 0.00, 0.00);
	CreateDynamicObject(1502, 2723.88, -2456.65, 5001.95,   0.00, 0.00, 90.00);
	CreateDynamicObject(1502, 2723.86, -2458.46, 5001.95,   0.00, 0.00, -90.00);
	CreateDynamicObject(983, 2717.58, -2453.03, 5004.30,   0.00, 0.00, 90.00);
	CreateDynamicObject(2606, 2716.26, -2453.29, 5002.47,   -10.00, 0.00, 0.00);
	CreateDynamicObject(2356, 2717.63, -2454.33, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2356, 2719.27, -2454.29, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2163, 2715.84, -2457.61, 5001.95,   0.00, 0.00, 180.00);
	CreateDynamicObject(1496, 2697.49, 5001.97, 5001.97,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2704.15, -2461.39, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2723.63, -2466.15, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2733.19, -2475.92, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2718.52, -2466.13, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2713.77, -2461.39, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2694.52, -2461.39, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2697.37, -2457.82, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2728.36, -2461.39, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2731.08, -2458.26, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2723.71, -2447.97, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2719.44, -2447.36, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2713.62, -2447.66, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2713.78, -2483.69, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2708.75, -2484.98, 5003.70,   0.00, 0.00, 314.13);
	CreateDynamicObject(19388, 2707.03, -2488.29, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19379, 2718.97, -2450.41, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19379, 2718.97, -2460.02, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19379, 2708.47, -2455.64, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19379, 2697.98, -2457.50, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19388, 2698.95, -2453.04, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2705.36, -2453.04, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2711.77, -2453.04, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19379, 2708.47, -2446.02, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19379, 2697.98, -2447.87, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19388, 2728.73, -2453.52, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19358, 2725.52, -2453.52, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19379, 2729.47, -2450.41, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19379, 2729.47, -2460.02, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19450, 2735.15, -2453.52, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2733.55, -2449.93, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2728.87, -2445.87, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2724.78, -2448.73, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2705.53, -2448.27, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2709.83, -2447.36, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2700.21, -2447.36, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2697.37, -2448.34, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19379, 2718.97, -2469.63, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19427, 2708.41, -2488.61, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19427, 2705.41, -2488.29, 4997.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(19388, 2723.63, -2474.15, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19379, 2729.47, -2469.63, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19450, 2728.48, -2464.96, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2723.63, -2480.56, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2728.44, -2483.46, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19379, 2729.47, -2479.25, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19379, 2718.97, -2479.25, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19379, 2718.97, -2488.87, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19379, 2708.49, -2484.57, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19404, 2738.55, -2481.06, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(8167, 2738.62, -2481.14, 4994.57,   90.00, 0.00, 90.00);
	CreateDynamicObject(19404, 2738.55, -2481.06, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19404, 2732.16, -2481.06, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19404, 2732.16, -2481.06, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19404, 2725.75, -2481.06, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19404, 2725.75, -2481.06, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19404, 2719.36, -2481.06, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19404, 2719.36, -2481.06, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(8167, 2731.90, -2481.14, 4994.57,   90.00, 0.00, 90.00);
	CreateDynamicObject(8167, 2725.64, -2481.14, 4994.57,   90.00, 0.00, 90.00);
	CreateDynamicObject(8167, 2719.43, -2481.14, 4994.57,   90.00, 0.00, 90.00);
	CreateDynamicObject(19404, 2738.55, -2464.98, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19404, 2732.16, -2464.98, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19404, 2725.75, -2464.98, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19404, 2719.36, -2464.98, 4997.88,   0.00, 0.00, 90.00);
	CreateDynamicObject(19404, 2738.55, -2464.98, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19404, 2732.16, -2464.98, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19404, 2725.75, -2464.98, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(19404, 2719.36, -2464.98, 4994.39,   0.00, 0.00, 90.00);
	CreateDynamicObject(8167, 2719.20, -2465.06, 4994.57,   90.00, 0.00, 90.00);
	CreateDynamicObject(8167, 2725.64, -2465.06, 4994.57,   90.00, 0.00, 90.00);
	CreateDynamicObject(8167, 2731.90, -2465.06, 4994.57,   90.00, 0.00, 90.00);
	CreateDynamicObject(8167, 2738.62, -2465.06, 4994.57,   90.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2718.52, -2472.55, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2718.52, -2478.96, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19379, 2708.47, -2474.89, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19379, 2708.47, -2465.26, 5001.88,   0.00, 90.00, 0.00);
	CreateDynamicObject(19450, 2713.67, -2477.39, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2708.98, -2466.21, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2708.98, -2475.85, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(14782, 2701.67, -2447.75, 5002.98,   0.00, 0.00, 0.00);
	CreateDynamicObject(14401, 2701.47, -2449.74, 5002.27,   0.00, 0.00, 90.00);
	CreateDynamicObject(2377, 2705.13, -2452.14, 5003.19,   0.00, 0.00, -90.00);
	CreateDynamicObject(2377, 2705.13, -2452.10, 5004.31,   0.00, 0.00, -90.00);
	CreateDynamicObject(2374, 2705.13, -2451.02, 5004.31,   0.00, 0.00, -90.00);
	CreateDynamicObject(2374, 2705.13, -2451.02, 5003.19,   0.00, 0.00, -90.00);
	CreateDynamicObject(19458, 2705.46, -2448.25, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(1744, 2705.54, -2447.96, 5004.30,   0.00, 0.00, -90.00);
	CreateDynamicObject(1744, 2705.54, -2448.91, 5002.83,   0.00, 0.00, -90.00);
	CreateDynamicObject(1744, 2705.54, -2449.25, 5003.65,   0.00, 0.00, -90.00);
	CreateDynamicObject(19515, 2705.20, -2448.64, 5003.43,   0.00, -90.00, 90.00);
	CreateDynamicObject(19515, 2705.20, -2449.12, 5003.43,   0.00, -90.00, 90.00);
	CreateDynamicObject(19515, 2705.20, -2449.60, 5003.43,   0.00, -90.00, 90.00);
	CreateDynamicObject(19515, 2705.20, -2450.08, 5003.43,   0.00, -90.00, 90.00);
	CreateDynamicObject(356, 2705.29, -2449.39, 5004.07,   20.00, -1.00, 90.00);
	CreateDynamicObject(356, 2705.29, -2450.34, 5004.07,   20.00, -1.00, 90.00);
	CreateDynamicObject(19138, 2705.19, -2448.96, 5004.02,   0.00, 0.00, 180.00);
	CreateDynamicObject(19138, 2705.16, -2449.24, 5004.02,   0.00, 0.00, 239.61);
	CreateDynamicObject(19138, 2705.21, -2449.60, 5004.02,   0.00, 0.00, 141.76);
	CreateDynamicObject(19138, 2705.23, -2449.91, 5004.02,   0.00, 0.00, 164.77);
	CreateDynamicObject(356, 2705.21, -2450.34, 5004.07,   20.00, -1.00, 90.00);
	CreateDynamicObject(356, 2705.21, -2449.39, 5004.07,   20.00, -1.00, 90.00);
	CreateDynamicObject(18637, 2705.31, -2448.79, 5002.55,   80.00, 0.00, -90.00);
	CreateDynamicObject(18637, 2705.31, -2449.51, 5002.55,   80.00, 0.00, -90.00);
	CreateDynamicObject(18637, 2705.31, -2450.25, 5002.55,   80.00, 0.00, -90.00);
	CreateDynamicObject(18637, 2705.31, -2448.15, 5002.55,   80.00, 0.00, -90.00);
	CreateDynamicObject(19472, 2705.25, -2447.78, 5004.70,   0.00, -25.00, 90.00);
	CreateDynamicObject(19472, 2705.17, -2448.15, 5004.70,   0.00, -25.00, -90.00);
	CreateDynamicObject(19472, 2705.18, -2448.42, 5004.70,   0.00, -25.00, 180.00);
	CreateDynamicObject(19472, 2705.19, -2448.60, 5004.70,   0.00, -25.00, 196.25);
	CreateDynamicObject(19141, 2705.21, -2448.97, 5004.68,   -30.00, -90.00, 90.00);
	CreateDynamicObject(19141, 2705.21, -2448.97, 5004.74,   -30.00, -90.00, 90.00);
	CreateDynamicObject(19141, 2705.21, -2449.17, 5004.74,   -30.00, -90.00, 90.00);
	CreateDynamicObject(19141, 2705.21, -2449.17, 5004.68,   -30.00, -90.00, 90.00);
	CreateDynamicObject(2886, 2699.98, -2453.07, 5003.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(2886, 2699.98, -2453.01, 5003.43,   0.00, 0.00, 180.00);
	CreateDynamicObject(1502, 2723.61, -2473.36, 5001.93,   0.00, 0.00, -90.00);
	CreateDynamicObject(19450, 2713.70, -2465.73, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2719.80, -2486.23, 5003.70,   0.00, 0.00, 305.07);
	CreateDynamicObject(19450, 2707.62, -2489.69, 5009.30,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2713.44, -2488.29, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19380, 2709.55, -2493.71, 4995.26,   0.00, 0.00, 90.00);
	CreateDynamicObject(1497, 2697.42, -2459.05, 5001.97,   0.00, 0.00, 90.00);
	CreateDynamicObject(1497, 2697.39, -2456.05, 5001.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(1497, 2705.59, -2489.76, 5007.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(1497, 2708.59, -2489.73, 5007.72,   0.00, 0.00, 180.00);
	CreateDynamicObject(1497, 2706.83, -2459.52, 4996.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2713.18, -2448.27, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(2796, 2711.90, -2453.05, 5004.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(2797, 2713.58, -2450.18, 5004.67,   0.00, 0.00, 90.00);
	CreateDynamicObject(2808, 2732.01, -2482.94, 5002.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(2637, 2732.02, -2481.34, 5002.38,   0.00, 0.00, 0.00);
	CreateDynamicObject(2638, 2732.01, -2479.29, 5002.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(2637, 2732.02, -2477.23, 5002.38,   0.00, 0.00, 0.00);
	CreateDynamicObject(2638, 2732.01, -2475.05, 5002.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(2637, 2732.02, -2473.06, 5002.38,   0.00, 0.00, 0.00);
	CreateDynamicObject(2808, 2732.01, -2471.49, 5002.58,   0.00, 0.00, 180.00);
	CreateDynamicObject(19450, 2734.69, -2471.09, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19431, 2723.63, -2471.75, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(2441, 2729.37, -2470.78, 5001.96,   0.00, 0.00, 0.00);
	CreateDynamicObject(2441, 2728.37, -2470.78, 5001.96,   0.00, 0.00, 0.00);
	CreateDynamicObject(2441, 2727.37, -2470.78, 5001.96,   0.00, 0.00, 0.00);
	CreateDynamicObject(19388, 2725.29, -2471.09, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(1502, 2724.49, -2471.11, 5001.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2738.09, -2464.96, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19450, 2734.63, -2466.33, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2733.19, -2485.54, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(2219, 2728.78, -2471.07, 5003.08,   -25.00, 23.00, 74.36);
	CreateDynamicObject(2131, 2734.06, -2469.49, 5001.95,   0.00, 0.00, -90.00);
	CreateDynamicObject(2132, 2734.11, -2467.51, 5001.96,   0.00, 0.00, -90.00);
	CreateDynamicObject(2134, 2734.11, -2466.52, 5001.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(2341, 2734.10, -2465.53, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2453, 2729.47, -2470.93, 5003.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(2426, 2734.31, -2466.51, 5003.02,   0.00, 0.00, -90.00);
	CreateDynamicObject(2426, 2734.31, -2466.51, 5003.36,   0.00, 0.00, -90.00);
	CreateDynamicObject(2134, 2733.10, -2465.53, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2134, 2732.10, -2465.53, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2360, 2730.60, -2465.51, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2452, 2729.01, -2465.41, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2714, 2723.52, -2472.70, 5004.21,   0.00, 0.00, -90.00);
	CreateDynamicObject(2421, 2733.37, -2465.09, 5003.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(2415, 2726.00, -2465.74, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2422, 2727.44, -2470.67, 5002.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(2425, 2732.27, -2464.78, 5003.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(2429, 2732.85, -2464.81, 5003.22,   0.00, 0.00, 0.00);
	CreateDynamicObject(2430, 2726.87, -2471.00, 5004.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(2808, 2728.27, -2482.94, 5002.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(2808, 2724.76, -2482.94, 5002.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(2637, 2728.26, -2481.34, 5002.38,   0.00, 0.00, 0.00);
	CreateDynamicObject(2637, 2724.79, -2481.34, 5002.38,   0.00, 0.00, 0.00);
	CreateDynamicObject(2637, 2728.26, -2477.23, 5002.38,   0.00, 0.00, 0.00);
	CreateDynamicObject(2637, 2724.79, -2477.23, 5002.38,   0.00, 0.00, 0.00);
	CreateDynamicObject(2638, 2728.27, -2479.29, 5002.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(2638, 2724.76, -2479.29, 5002.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(2808, 2724.76, -2475.49, 5002.58,   0.00, 0.00, 180.00);
	CreateDynamicObject(2808, 2728.27, -2475.49, 5002.58,   0.00, 0.00, 180.00);
	CreateDynamicObject(2416, 2727.10, -2465.57, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2415, 2725.18, -2465.74, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(1703, 2730.50, -2455.28, 5001.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(1703, 2730.50, -2458.76, 5001.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(2010, 2730.50, -2454.31, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2010, 2730.47, -2458.01, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2010, 2724.48, -2460.73, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2528, 2706.48, -2447.96, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2528, 2708.27, -2447.96, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2528, 2710.35, -2447.96, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2528, 2711.86, -2447.96, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2710.78, -2444.87, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19450, 2707.39, -2444.87, 5003.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(19388, 2712.10, -2449.65, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2708.89, -2449.65, 5003.70,   0.00, 0.00, 90.00);
	CreateDynamicObject(19388, 2706.46, -2450.84, 5003.70,   0.00, 0.00, 145.03);
	CreateDynamicObject(1523, 2712.86, -2449.63, 5001.95,   0.00, 0.00, 180.00);
	CreateDynamicObject(1523, 2709.68, -2449.63, 5001.95,   0.00, 0.00, 180.00);
	CreateDynamicObject(1523, 2706.04, -2451.50, 5001.95,   0.00, 0.00, 54.34);
	CreateDynamicObject(1502, 2712.53, -2453.02, 5001.95,   0.00, 0.00, 180.00);
	CreateDynamicObject(2518, 2709.95, -2450.24, 5002.31,   0.00, 0.00, 0.00);
	CreateDynamicObject(2518, 2708.42, -2452.45, 5002.31,   0.00, 0.00, 180.00);
	CreateDynamicObject(2518, 2709.47, -2452.45, 5002.31,   0.00, 0.00, 180.00);
	CreateDynamicObject(2164, 2717.60, -2457.48, 5001.97,   0.00, 0.00, 180.00);
	CreateDynamicObject(2167, 2718.52, -2457.49, 5001.97,   0.00, 0.00, 180.00);
	CreateDynamicObject(2207, 2727.87, -2449.92, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(948, 2725.21, -2453.10, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(948, 2727.61, -2453.10, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(948, 2729.82, -2453.10, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(948, 2733.06, -2453.10, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(1714, 2728.78, -2448.57, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2190, 2727.63, -2449.24, 5002.72,   0.00, 0.00, 97.99);
	CreateDynamicObject(2894, 2729.39, -2449.54, 5002.74,   0.00, 0.00, 45.00);
	CreateDynamicObject(14455, 2731.39, -2445.91, 5003.62,   0.00, 0.00, 180.00);
	CreateDynamicObject(949, 2725.49, -2446.39, 5002.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(949, 2732.88, -2446.39, 5002.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(2164, 2724.87, -2449.95, 5001.94,   0.00, 0.00, 90.00);
	CreateDynamicObject(19172, 2733.47, -2449.80, 5003.93,   0.00, 0.00, -90.00);
	CreateDynamicObject(1720, 2729.66, -2450.93, 5001.95,   0.00, 0.00, 202.23);
	CreateDynamicObject(1720, 2727.85, -2450.93, 5001.95,   0.00, 0.00, 152.54);
	CreateDynamicObject(2165, 2714.17, -2474.93, 5001.96,   0.00, 0.00, 0.00);
	CreateDynamicObject(2165, 2712.22, -2474.93, 5001.96,   0.00, 0.00, 0.00);
	CreateDynamicObject(2165, 2713.22, -2472.98, 5001.96,   0.00, 0.00, -90.00);
	CreateDynamicObject(2165, 2714.19, -2473.98, 5001.96,   0.00, 0.00, 90.00);
	CreateDynamicObject(2174, 2714.19, -2472.02, 5001.97,   0.00, 0.00, 90.00);
	CreateDynamicObject(2174, 2713.22, -2471.01, 5001.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(2165, 2713.22, -2469.05, 5001.96,   0.00, 0.00, -90.00);
	CreateDynamicObject(2165, 2714.19, -2470.06, 5001.96,   0.00, 0.00, 90.00);
	CreateDynamicObject(2165, 2715.17, -2468.10, 5001.96,   0.00, 0.00, 180.00);
	CreateDynamicObject(2165, 2713.24, -2468.10, 5001.96,   0.00, 0.00, 180.00);
	CreateDynamicObject(2164, 2718.42, -2467.48, 5001.95,   0.00, 0.00, -90.00);
	CreateDynamicObject(2164, 2718.42, -2469.26, 5001.95,   0.00, 0.00, -90.00);
	CreateDynamicObject(2164, 2718.42, -2474.02, 5001.95,   0.00, 0.00, -90.00);
	CreateDynamicObject(2164, 2718.42, -2475.79, 5001.95,   0.00, 0.00, -90.00);
	CreateDynamicObject(1715, 2712.70, -2469.77, 5001.97,   0.00, 0.00, 90.00);
	CreateDynamicObject(1715, 2712.48, -2467.58, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(1715, 2714.91, -2466.99, 5001.97,   0.00, 0.00, 341.57);
	CreateDynamicObject(1715, 2715.51, -2469.10, 5001.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(1715, 2715.22, -2472.93, 5001.97,   0.00, 0.00, 302.33);
	CreateDynamicObject(1715, 2714.84, -2476.23, 5001.97,   0.00, 0.00, 180.00);
	CreateDynamicObject(1715, 2712.16, -2475.97, 5001.97,   0.00, 0.00, 154.97);
	CreateDynamicObject(1715, 2712.04, -2474.13, 5001.97,   0.00, 0.00, 148.14);
	CreateDynamicObject(19173, 2709.08, -2473.70, 5004.40,   0.00, 0.00, -90.00);
	CreateDynamicObject(19174, 2709.07, -2468.98, 5004.26,   0.00, 0.00, 90.00);
	CreateDynamicObject(19378, 2744.25, -2483.57, 4999.56,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2720.56, -2484.37, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2730.19, -2484.37, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2701.34, -2484.37, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2710.96, -2473.87, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2720.56, -2473.87, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2730.19, -2473.87, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2730.19, -2463.39, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2720.56, -2463.39, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2710.96, -2463.39, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2730.19, -2452.90, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2720.56, -2452.90, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2710.96, -2452.90, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2730.19, -2442.41, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2720.56, -2442.41, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2710.96, -2442.41, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2701.34, -2463.39, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2701.34, -2452.90, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(19378, 2701.34, -2442.41, 5005.41,   0.00, 90.00, 90.00);
	CreateDynamicObject(18075, 2701.05, -2452.24, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2701.05, -2463.89, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2709.71, -2463.89, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2709.71, -2452.24, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2718.74, -2463.89, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2718.74, -2452.24, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2727.41, -2463.89, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2727.41, -2452.24, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2736.02, -2452.24, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2736.11, -2463.89, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2709.71, -2475.61, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2718.74, -2475.61, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2727.41, -2475.61, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2735.82, -2475.61, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2709.71, -2483.01, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2718.74, -2483.01, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2727.41, -2483.01, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2735.82, -2483.01, 5005.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2705.50, -2466.28, 4999.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2705.50, -2477.49, 4999.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2713.34, -2466.28, 4999.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2722.72, -2466.28, 4999.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2731.39, -2466.28, 4999.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2740.14, -2466.28, 4999.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2713.34, -2477.49, 4999.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2722.72, -2477.49, 4999.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2731.39, -2477.49, 4999.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2739.30, -2482.39, 4995.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2705.50, -2489.88, 4999.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2713.34, -2489.88, 4999.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2722.72, -2489.88, 4999.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2731.39, -2489.88, 4999.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2740.14, -2477.49, -2489.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2740.14, -2477.49, 4999.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2730.85, -2482.39, 4995.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2721.97, -2482.39, 4995.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2716.59, -2482.39, 4995.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2709.08, -2473.41, 4995.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2716.59, -2464.42, 4995.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2721.97, -2464.42, 4995.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2730.85, -2464.42, 4995.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2739.30, -2464.42, 4995.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(18075, 2746.48, -2473.45, 4995.93,   0.00, 0.00, 90.00);
	CreateDynamicObject(19273, 2708.02, -2488.23, 4997.53,   0.00, 0.00, 180.00);
	CreateDynamicObject(19273, 2708.17, -2488.83, 4997.53,   0.00, 0.00, -90.00);
	CreateDynamicObject(19273, 2707.99, -2488.24, 5003.39,   0.00, 0.00, 180.00);
	CreateDynamicObject(19273, 2708.17, -2488.84, 5003.39,   0.00, 0.00, -90.00);
	CreateDynamicObject(19273, 2727.76, -2453.54, 5003.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(19273, 2727.78, -2453.50, 5003.43,   0.00, 0.00, 180.00);
	CreateDynamicObject(1502, 2718.49, -2471.76, 5001.93,   0.00, 0.00, -90.00);
	CreateDynamicObject(1703, 2708.82, -2460.80, 5001.97,   0.00, 0.00, 180.00);
	CreateDynamicObject(1703, 2704.20, -2460.80, 5001.97,   0.00, 0.00, 180.00);
	CreateDynamicObject(1703, 2700.35, -2460.80, 5001.97,   0.00, 0.00, 180.00);
	CreateDynamicObject(2011, 2701.18, -2460.86, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2011, 2705.51, -2460.86, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2011, 2709.70, -2460.70, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2011, 2713.11, -2458.32, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2011, 2712.95, -2453.57, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2011, 2710.16, -2453.50, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2011, 2700.81, -2453.47, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(1703, 2701.65, -2453.63, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(1703, 2707.20, -2453.63, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2011, 2706.31, -2453.55, 5001.97,   0.00, 0.00, 0.00);
	CreateDynamicObject(2011, 2704.61, -2453.63, 5001.97,   0.00, 0.00, 0.00);
	// Name: Mines | Type: Exterior | Owner: N/A | Mapped By: rajdisasterhasu | Interior ID: Nil | Virtual World: Nil
	CreateDynamicObject(8661, -392.57, 2197.23, 43.29,   0.00, 179.99, 348.75);
	CreateDynamicObject(1345, -399.23, 2228.77, 44.24,   0.00, 0.00, 0.00);
	CreateDynamicObject(1345, -376.03, 2181.60, -14.18,   0.00, 0.00, 172.24);
	CreateDynamicObject(1215, -476.68, 2174.72, 53.02,   0.00, 0.00, 0.00);
	CreateDynamicObject(677, -414.13, 2223.52, 44.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(677, -372.76, 2240.00, 41.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(677, -366.27, 2240.09, 41.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(8661, -392.71, 2195.69, 43.31,   0.00, 179.99, 348.75);
	CreateDynamicObject(677, -401.65, 2234.80, 43.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(2978, -386.69, 2183.57, -13.19,   90.00, 0.00, 79.49);
	CreateDynamicObject(2978, -386.69, 2183.57, -11.94,   90.00, 0.00, 79.49);
	CreateDynamicObject(2978, -386.69, 2183.57, -10.66,   90.00, 0.00, 79.49);
	CreateDynamicObject(2978, -387.25, 2184.42, -13.19,   90.00, 0.00, 169.74);
	CreateDynamicObject(3093, -386.77, 2182.94, -10.55,   90.00, 0.00, 169.74);
	CreateDynamicObject(3093, -387.06, 2181.14, -10.55,   90.00, 0.00, 169.74);
	CreateDynamicObject(3093, -386.53, 2184.15, -15.10,   90.00, 0.00, 169.74);
	CreateDynamicObject(2978, -387.25, 2184.42, -11.94,   90.00, 0.00, 169.74);
	CreateDynamicObject(2978, -387.25, 2184.42, -10.66,   90.00, 0.00, 169.74);
	CreateDynamicObject(4815, -406.48, 2174.04, -107.57,   57.44, 93.11, 76.03);
	CreateDynamicObject(18367, -384.50, 2186.43, -10.17,   275.71, 23.24, 293.57);
	CreateDynamicObject(18367, -385.98, 2185.28, -18.00,   275.79, 7.41, 65.81);
	CreateDynamicObject(4815, -413.40, 2142.50, -16.15,   0.00, 0.00, 238.42);
	CreateDynamicObject(4815, -352.48, 2137.29, -16.17,   0.00, 0.00, 238.42);
	CreateDynamicObject(4815, -394.30, 2146.71, -31.01,   330.26, 90.00, 349.93);
	CreateDynamicObject(4815, -385.62, 2182.71, -29.94,   325.26, 89.65, 169.32);
	CreateDynamicObject(18367, -387.60, 2177.00, -18.00,   275.79, 7.41, 74.06);
	CreateDynamicObject(4815, -402.49, 2188.73, -119.44,   64.91, 94.26, 35.77);
	CreateDynamicObject(3093, -387.29, 2178.34, -15.08,   90.00, 0.00, 349.49);
	CreateDynamicObject(3093, -386.27, 2184.11, -15.08,   90.00, 0.00, 349.49);
	CreateDynamicObject(3280, -387.16, 2178.87, -12.95,   90.00, 0.00, 79.49);
	CreateDynamicObject(3280, -387.16, 2178.87, -11.38,   90.00, 0.00, 79.48);
	CreateDynamicObject(3280, -387.16, 2178.87, -9.83,   90.00, 0.00, 79.49);
	CreateDynamicObject(3280, -386.32, 2183.50, -12.95,   90.00, 0.00, 79.48);
	CreateDynamicObject(3280, -386.32, 2183.50, -11.38,   90.00, 0.00, 79.49);
	CreateDynamicObject(3280, -386.32, 2183.50, -9.85,   90.00, 0.00, 79.49);
	CreateDynamicObject(2978, -387.13, 2178.88, -9.89,   90.00, 0.00, 259.49);
	CreateDynamicObject(2978, -386.30, 2183.53, -9.89,   90.00, 0.00, 259.49);
	CreateDynamicObject(3280, -386.62, 2181.98, -9.85,   90.00, 0.00, 79.49);
	CreateDynamicObject(3280, -386.90, 2180.46, -9.85,   90.00, 0.00, 79.49);
	CreateDynamicObject(2978, -386.73, 2181.24, -9.89,   90.00, 0.00, 259.49);
	CreateDynamicObject(4815, -415.49, 2152.99, -7.99,   0.00, 179.99, 17.42);
	CreateDynamicObject(4815, -336.07, 2163.61, -27.83,   340.25, 89.28, 18.00);
	CreateDynamicObject(4815, -351.71, 2185.95, -48.17,   14.97, 90.53, 268.41);
	CreateDynamicObject(4815, -413.40, 2142.50, -98.88,   0.00, 0.00, 238.42);
	CreateDynamicObject(3931, -373.47, 2182.09, -15.27,   331.46, 310.38, 2.68);
	CreateDynamicObject(18367, -349.44, 2179.21, -18.00,   275.78, 7.41, 357.31);
	CreateDynamicObject(4815, -338.66, 2180.09, -118.32,   59.96, 92.17, 255.98);
	CreateDynamicObject(3931, -376.51, 2183.11, -15.24,   348.15, 32.79, 133.53);
	CreateDynamicObject(744, -361.85, 2182.83, -15.75,   0.00, 0.00, 226.00);
	CreateDynamicObject(744, -362.31, 2184.25, -11.55,   0.00, 36.00, 252.00);
	CreateDynamicObject(744, -362.71, 2182.81, -8.63,   0.00, 48.00, 252.00);
	CreateDynamicObject(3931, -380.09, 2184.46, -14.92,   331.46, 310.39, 312.69);
	CreateDynamicObject(1345, -383.93, 2183.94, -14.18,   0.00, 0.00, 323.74);
	CreateDynamicObject(854, -380.63, 2182.06, -14.88,   359.48, 357.73, 273.46);
	CreateDynamicObject(854, -381.00, 2182.43, -14.88,   359.48, 353.48, 212.92);
	CreateDynamicObject(744, -363.06, 2169.21, -16.88,   0.00, 2.00, 118.00);
	CreateDynamicObject(744, -362.47, 2168.30, -12.63,   0.00, 9.99, 118.00);
	CreateDynamicObject(744, -370.73, 2170.67, -17.88,   0.00, 347.99, 117.99);
	CreateDynamicObject(744, -368.11, 2183.92, -17.88,   0.00, 347.99, 225.99);
	CreateDynamicObject(744, -353.74, 2180.47, -17.88,   0.00, 347.99, 225.99);
	CreateDynamicObject(18367, -384.61, 2173.23, -18.00,   275.79, 7.41, 98.06);
	CreateDynamicObject(3518, -371.91, 2177.63, -9.62,   0.00, 0.00, 350.00);
	CreateDynamicObject(5272, -317.13, 2185.03, -14.88,   0.00, 0.00, 34.75);
	CreateDynamicObject(3518, -352.35, 2174.06, -9.62,   0.00, 0.00, 349.99);
	CreateDynamicObject(3931, -369.72, 2173.84, -15.14,   331.46, 310.38, 346.68);
	CreateDynamicObject(3931, -366.29, 2180.12, -15.14,   331.46, 310.38, 318.68);
	CreateDynamicObject(3931, -369.54, 2180.93, -15.27,   331.46, 310.38, 146.67);
	CreateDynamicObject(18620, -379.53, 2207.10, -11.38,   0.00, 0.00, 302.00);
	CreateDynamicObject(18620, -321.65, 2197.50, -11.33,   0.00, 0.00, 302.00);
	CreateDynamicObject(4815, -305.38, 2188.57, -16.09,   0.00, 0.00, 180.41);
	CreateDynamicObject(4815, -332.21, 2176.78, -56.33,   340.25, 89.28, 258.86);
	CreateDynamicObject(4815, -345.02, 2162.93, -93.06,   57.44, 93.13, 76.78);
	CreateDynamicObject(5272, -275.72, 2086.69, -14.88,   0.00, 0.00, 124.25);
	CreateDynamicObject(4815, -322.70, 2158.87, -84.31,   57.44, 93.13, 76.78);
	CreateDynamicObject(4815, -301.94, 2155.00, -84.31,   57.44, 93.13, 76.78);
	CreateDynamicObject(18367, -350.85, 2167.33, -18.00,   275.78, 7.39, 182.05);
	CreateDynamicObject(1301, -382.84, 2174.59, -13.38,   0.17, 74.75, 76.02);
	CreateDynamicObject(854, -372.03, 2173.95, -14.88,   359.48, 357.73, 273.46);
	CreateDynamicObject(854, -371.95, 2174.55, -14.88,   359.47, 359.73, 295.48);
	CreateDynamicObject(8607, -358.08, 2166.24, -11.30,   0.00, 0.00, 349.49);
	CreateDynamicObject(8607, -358.58, 2184.08, -11.30,   0.00, 0.00, 351.49);
	CreateDynamicObject(744, -361.16, 2182.87, -8.63,   0.00, 47.99, 295.75);
	CreateDynamicObject(8607, -336.42, 2179.40, -11.30,   0.00, 0.00, 349.24);
	CreateDynamicObject(8607, -284.95, 2169.64, -11.32,   0.00, 0.00, 348.74);
	CreateDynamicObject(18367, -303.62, 2170.08, -18.00,   275.78, 7.41, 357.31);
	CreateDynamicObject(18367, -305.17, 2159.23, -18.00,   275.78, 7.39, 182.05);
	CreateDynamicObject(18367, -256.76, 2149.57, -18.00,   275.78, 7.39, 182.05);
	CreateDynamicObject(4815, -313.67, 2156.79, -78.21,   71.38, 95.93, 74.22);
	CreateDynamicObject(4815, -379.53, 2149.05, -7.99,   0.00, 179.99, 17.42);
	CreateDynamicObject(4815, -343.38, 2143.31, -7.99,   0.00, 179.99, 17.42);
	CreateDynamicObject(4815, -308.10, 2132.56, -7.99,   0.00, 179.99, 17.42);
	CreateDynamicObject(4815, -332.21, 2176.77, -31.53,   340.25, 89.28, 258.86);
	CreateDynamicObject(8607, -306.62, 2156.69, -11.27,   0.00, 0.00, 349.49);
	CreateDynamicObject(744, -337.13, 2174.81, -18.98,   40.44, 18.84, 141.76);
	CreateDynamicObject(744, -337.13, 2179.28, -15.38,   9.38, 20.52, 212.74);
	CreateDynamicObject(744, -331.35, 2162.82, -17.48,   9.37, 20.51, 188.74);
	CreateDynamicObject(744, -308.22, 2173.10, -17.48,   9.37, 20.51, 188.73);
	CreateDynamicObject(744, -313.47, 2161.10, -17.48,   6.64, 48.65, 184.73);
	CreateDynamicObject(744, -313.47, 2157.48, -14.23,   64.70, 19.54, 174.42);
	CreateDynamicObject(744, -312.97, 2157.68, -8.80,   68.45, 157.09, 33.66);
	CreateDynamicObject(744, -314.79, 2159.93, -18.55,   37.53, 10.39, 215.84);
	CreateDynamicObject(744, -314.79, 2176.04, -9.55,   21.66, 69.04, 238.27);
	CreateDynamicObject(744, -314.79, 2176.51, -12.08,   35.71, 49.63, 247.71);
	CreateDynamicObject(744, -289.86, 2157.24, -17.63,   7.38, 42.66, 275.47);
	CreateDynamicObject(744, -290.26, 2154.54, -14.50,   9.97, 356.16, 268.88);
	CreateDynamicObject(744, -291.23, 2154.34, -9.93,   8.98, 333.87, 264.59);
	CreateDynamicObject(744, -292.90, 2157.04, -17.18,   6.10, 52.63, 312.04);
	CreateDynamicObject(744, -297.45, 2168.46, -17.68,   8.43, 32.60, 40.59);
	CreateDynamicObject(744, -294.90, 2170.14, -12.70,   9.97, 2.24, 45.56);
	CreateDynamicObject(744, -295.00, 2169.64, -14.83,   348.46, 16.55, 76.09);
	CreateDynamicObject(744, -293.33, 2169.26, -16.98,   348.44, 16.29, 116.29);
	CreateDynamicObject(744, -291.95, 2170.21, -16.98,   348.82, 21.88, 153.15);
	CreateDynamicObject(3931, -338.07, 2166.27, -15.02,   331.46, 310.39, 142.68);
	CreateDynamicObject(3931, -339.72, 2167.70, -15.32,   5.86, 347.93, 187.25);
	CreateDynamicObject(3931, -344.34, 2167.70, -15.32,   5.86, 347.93, 115.25);
	CreateDynamicObject(3931, -340.17, 2176.79, -14.97,   23.85, 39.97, 169.27);
	CreateDynamicObject(3931, -342.49, 2176.79, -14.97,   330.02, 179.98, 107.98);
	CreateDynamicObject(3931, -342.84, 2178.04, -15.14,   3.98, 357.97, 231.88);
	CreateDynamicObject(3931, -331.11, 2174.17, -15.12,   326.94, 285.23, 106.25);
	CreateDynamicObject(3931, -333.04, 2176.37, -15.12,   40.79, 47.56, 258.44);
	CreateDynamicObject(3931, -331.31, 2175.62, -15.07,   26.49, 20.24, 208.14);
	CreateDynamicObject(3931, -328.99, 2172.59, -15.19,   0.03, 164.02, 325.48);
	CreateDynamicObject(854, -342.40, 2167.54, -14.90,   359.47, 359.73, 295.48);
	CreateDynamicObject(854, -342.13, 2166.74, -14.90,   359.47, 359.73, 269.47);
	CreateDynamicObject(854, -342.72, 2176.31, -14.90,   359.46, 359.72, 157.47);
	CreateDynamicObject(854, -331.50, 2174.16, -14.90,   359.46, 359.72, 157.47);
	CreateDynamicObject(854, -331.90, 2173.49, -14.90,   359.46, 359.72, 75.47);
	CreateDynamicObject(854, -332.90, 2167.21, -14.90,   359.45, 359.71, 153.21);
	CreateDynamicObject(854, -333.90, 2167.66, -14.90,   359.45, 359.71, 153.21);
	CreateDynamicObject(854, -333.55, 2166.86, -14.90,   359.45, 359.71, 153.21);
	CreateDynamicObject(854, -334.40, 2167.08, -14.90,   359.45, 359.71, 153.21);
	CreateDynamicObject(854, -332.87, 2166.66, -14.90,   359.45, 359.71, 153.21);
	CreateDynamicObject(744, -272.09, 2154.19, -17.18,   6.10, 52.63, 274.03);
	CreateDynamicObject(744, -268.12, 2153.74, -17.18,   6.10, 52.63, 232.03);
	CreateDynamicObject(744, -265.27, 2152.29, -17.18,   6.09, 52.61, 238.03);
	CreateDynamicObject(744, -275.12, 2153.37, -17.18,   6.10, 52.61, 286.03);
	CreateDynamicObject(744, -272.34, 2150.79, -14.23,   347.23, 1.99, 266.38);
	CreateDynamicObject(744, -269.87, 2150.24, -6.60,   8.99, 175.00, 74.97);
	CreateDynamicObject(744, -271.42, 2166.84, -5.88,   13.94, 173.88, 235.41);
	CreateDynamicObject(744, -269.34, 2165.56, -5.88,   13.94, 173.88, 264.66);
	CreateDynamicObject(744, -266.49, 2165.14, -5.88,   13.94, 173.88, 268.65);
	CreateDynamicObject(744, -277.11, 2167.61, -7.13,   13.94, 186.25, 232.42);
	CreateDynamicObject(744, -274.96, 2166.84, -5.13,   13.94, 186.25, 232.42);
	CreateDynamicObject(744, -273.59, 2167.39, -9.63,   7.51, 178.04, 234.18);
	CreateDynamicObject(744, -278.74, 2168.26, -8.73,   23.58, 224.60, 190.39);
	CreateDynamicObject(744, -280.94, 2168.26, -7.63,   16.05, 242.00, 184.43);
	CreateDynamicObject(3931, -319.63, 2172.13, -14.99,   331.46, 310.38, 44.67);
	CreateDynamicObject(3931, -320.43, 2164.28, -14.99,   21.64, 10.75, 340.00);
	CreateDynamicObject(3931, -322.21, 2162.40, -15.22,   18.46, 34.22, 255.85);
	CreateDynamicObject(3931, -267.21, 2160.38, -14.89,   19.51, 331.46, 170.27);
	CreateDynamicObject(3931, -282.86, 2157.78, -15.14,   7.78, 289.81, 8.57);
	CreateDynamicObject(3931, -302.06, 2162.02, -15.14,   17.88, 323.18, 0.92);
	CreateDynamicObject(3931, -297.41, 2161.65, -15.14,   13.54, 53.31, 282.53);
	CreateDynamicObject(3931, -311.63, 2164.25, -15.14,   343.21, 22.21, 316.95);
	CreateDynamicObject(3931, -255.43, 2151.75, -15.12,   26.25, 21.53, 182.06);
	CreateDynamicObject(854, -317.51, 2164.56, -14.90,   359.45, 359.71, 153.21);
	CreateDynamicObject(854, -317.99, 2164.91, -14.90,   359.45, 359.71, 319.21);
	CreateDynamicObject(854, -310.79, 2170.18, -14.90,   359.45, 359.71, 339.21);
	CreateDynamicObject(854, -311.41, 2169.50, -14.90,   359.45, 359.71, 339.21);
	CreateDynamicObject(854, -311.66, 2170.21, -14.90,   359.45, 359.71, 339.21);
	CreateDynamicObject(854, -312.46, 2169.43, -14.90,   359.45, 359.71, 339.21);
	CreateDynamicObject(854, -296.73, 2158.68, -14.90,   359.45, 359.71, 339.21);
	CreateDynamicObject(854, -297.53, 2158.46, -14.90,   359.45, 4.21, 321.25);
	CreateDynamicObject(854, -286.76, 2158.95, -14.88,   359.45, 4.20, 305.24);
	CreateDynamicObject(854, -287.63, 2158.95, -14.88,   359.45, 4.20, 239.24);
	CreateDynamicObject(854, -287.55, 2159.73, -14.88,   359.45, 4.19, 145.24);
	CreateDynamicObject(854, -283.23, 2163.35, -14.88,   359.45, 4.19, 145.24);
	CreateDynamicObject(854, -266.25, 2160.43, -14.88,   359.45, 4.19, 145.23);
	CreateDynamicObject(854, -277.80, 2155.95, -14.88,   359.45, 2.18, 343.22);
	CreateDynamicObject(854, -278.40, 2155.98, -14.88,   359.44, 2.17, 327.46);
	CreateDynamicObject(854, -260.85, 2154.05, -14.88,   359.44, 2.17, 169.45);
	CreateDynamicObject(3518, -315.78, 2167.44, -9.62,   0.00, 0.00, 349.99);
	CreateDynamicObject(3518, -295.31, 2163.76, -9.62,   0.00, 0.00, 349.99);
	CreateDynamicObject(18620, -255.89, 2183.33, -11.33,   0.00, 0.00, 302.00);
	CreateDynamicObject(4815, -304.91, 2148.10, -16.15,   0.00, 0.00, 162.41);
	CreateDynamicObject(4815, -246.85, 2109.23, -16.17,   0.00, 0.00, 68.42);
	CreateDynamicObject(4815, -246.85, 2126.86, -16.09,   0.00, 0.00, 50.41);
	CreateDynamicObject(4815, -258.60, 2161.62, -16.15,   0.00, 0.00, 150.41);
	CreateDynamicObject(4815, -239.91, 2167.90, -16.19,   0.00, 0.00, 164.66);
	CreateDynamicObject(854, -267.93, 2160.43, -14.88,   359.45, 4.19, 135.24);
	CreateDynamicObject(4815, -275.58, 2166.11, -56.33,   342.23, 89.59, 258.92);
	CreateDynamicObject(4815, -246.84, 2075.80, -16.19,   0.00, 0.00, 68.41);
	CreateDynamicObject(10769, -351.56, 2182.82, -25.89,   0.00, 0.00, 304.25);
	CreateDynamicObject(10769, -350.91, 2186.67, -25.89,   0.00, 0.00, 304.25);
	CreateDynamicObject(1345, -379.23, 2174.16, -14.21,   0.00, 0.00, 172.24);
	CreateDynamicObject(1345, -239.97, 2153.01, -14.08,   0.00, 0.00, 314.24);
	CreateDynamicObject(1345, -245.80, 2151.41, -14.08,   0.00, 0.00, 169.74);
	CreateDynamicObject(1345, -274.89, 2022.73, -14.18,   0.00, 0.00, 119.73);
	CreateDynamicObject(1345, -253.40, 2153.06, -14.08,   0.00, 0.00, 54.24);
	CreateDynamicObject(3931, -241.78, 2154.75, -15.37,   352.14, 13.34, 15.81);
	CreateDynamicObject(3931, -235.98, 2146.62, -15.22,   351.92, 3.23, 332.39);
	CreateDynamicObject(3931, -229.43, 2149.87, -15.22,   29.28, 12.86, 251.56);
	CreateDynamicObject(4816, -259.75, 2124.75, 0.83,   0.00, 179.99, 47.75);
	CreateDynamicObject(4816, -177.56, 2164.71, -6.67,   0.00, 179.99, 336.74);
	CreateDynamicObject(4816, -191.81, 2155.21, -6.67,   0.00, 179.99, 300.74);
	CreateDynamicObject(4816, -168.08, 2131.23, -6.67,   0.00, 179.99, 228.74);
	CreateDynamicObject(4816, -169.12, 2094.50, -6.67,   0.00, 179.99, 164.73);
	CreateDynamicObject(4816, -179.94, 2075.91, -6.67,   0.00, 179.99, 146.73);
	CreateDynamicObject(4816, -247.61, 2081.48, -41.89,   15.80, 73.41, 177.80);
	CreateDynamicObject(4815, -203.52, 2128.92, -2.74,   0.00, 179.99, 203.42);
	CreateDynamicObject(4815, -179.65, 2130.92, -3.47,   358.49, 179.49, 203.40);
	CreateDynamicObject(4815, -154.82, 2130.92, -4.37,   357.49, 179.24, 203.38);
	CreateDynamicObject(4816, -233.51, 2062.37, 0.83,   0.00, 179.99, 109.74);
	CreateDynamicObject(4815, -252.60, 2182.37, -83.46,   71.38, 95.93, 342.22);
	CreateDynamicObject(4815, -257.27, 2160.47, -83.46,   71.38, 95.93, 342.22);
	CreateDynamicObject(4815, -261.75, 2139.69, -83.46,   71.38, 95.93, 342.22);
	CreateDynamicObject(4815, -266.65, 2116.88, -83.46,   71.38, 95.93, 342.22);
	CreateDynamicObject(4815, -271.35, 2094.97, -83.46,   71.38, 95.93, 342.22);
	CreateDynamicObject(744, -201.82, 2140.76, -19.25,   0.67, 337.18, 15.22);
	CreateDynamicObject(744, -188.07, 2130.91, -19.25,   0.67, 337.18, 187.21);
	CreateDynamicObject(1278, -192.69, 2132.03, -19.78,   0.00, 0.00, 267.99);
	CreateDynamicObject(1278, -192.69, 2131.98, -20.96,   0.00, 0.00, 267.99);
	CreateDynamicObject(1278, -192.69, 2131.98, -22.31,   0.00, 0.00, 267.99);
	CreateDynamicObject(1278, -205.13, 2104.89, -19.78,   0.00, 0.00, 213.99);
	CreateDynamicObject(1278, -205.13, 2104.89, -20.91,   0.00, 0.00, 213.99);
	CreateDynamicObject(1278, -205.13, 2104.89, -22.16,   0.00, 0.00, 213.99);
	CreateDynamicObject(3931, -208.35, 2140.18, -15.22,   29.94, 22.30, 190.37);
	CreateDynamicObject(3931, -209.58, 2142.16, -15.32,   1.90, 2.80, 21.83);
	CreateDynamicObject(3931, -191.83, 2127.66, -15.32,   1.90, 2.80, 21.83);
	CreateDynamicObject(3931, -191.83, 2130.16, -15.44,   1.90, 2.80, 287.83);
	CreateDynamicObject(3931, -195.08, 2129.01, -15.19,   0.69, 68.81, 286.15);
	CreateDynamicObject(3931, -191.77, 2133.83, -15.47,   1.74, 22.81, 85.17);
	CreateDynamicObject(3931, -195.27, 2132.58, -15.12,   358.14, 188.80, 86.18);
	CreateDynamicObject(3931, -209.31, 2107.88, -15.09,   1.78, 18.80, 61.28);
	CreateDynamicObject(854, -199.38, 2130.71, -14.67,   359.44, 2.17, 235.45);
	CreateDynamicObject(854, -204.53, 2107.82, -14.57,   359.44, 2.17, 109.45);
	CreateDynamicObject(9583, -370.72, 2177.45, -9.34,   0.00, 90.00, 349.75);
	CreateDynamicObject(9583, -350.49, 2173.77, -9.34,   0.00, 90.00, 349.75);
	CreateDynamicObject(9583, -328.14, 2169.72, -9.34,   0.00, 90.00, 349.75);
	CreateDynamicObject(9583, -305.52, 2165.65, -9.34,   0.00, 90.00, 349.75);
	CreateDynamicObject(9583, -283.02, 2161.55, -9.34,   0.00, 90.00, 349.75);
	CreateDynamicObject(9583, -260.02, 2157.32, -9.24,   0.00, 90.00, 79.75);
	CreateDynamicObject(934, -211.78, 2124.33, -13.57,   0.00, 0.00, 350.25);
	CreateDynamicObject(3384, -212.84, 2119.89, -13.46,   0.00, 0.00, 169.50);
	CreateDynamicObject(3384, -213.87, 2118.27, -13.46,   0.00, 0.00, 349.74);
	CreateDynamicObject(3384, -214.15, 2116.54, -13.46,   0.00, 0.00, 349.74);
	CreateDynamicObject(3384, -213.54, 2119.87, -13.46,   0.00, 0.00, 349.74);
	CreateDynamicObject(3384, -213.19, 2118.29, -13.46,   0.00, 0.00, 169.50);
	CreateDynamicObject(3384, -213.51, 2116.58, -13.46,   0.00, 0.00, 169.50);
	CreateDynamicObject(3383, -216.99, 2113.50, -14.90,   0.00, 0.00, 348.50);
	CreateDynamicObject(3383, -222.51, 2114.61, -14.90,   0.00, 0.00, 348.49);
	CreateDynamicObject(3931, -223.18, 2114.74, -14.22,   7.39, 40.08, 106.00);
	CreateDynamicObject(3383, -224.01, 2122.39, -14.90,   0.00, 0.00, 259.24);
	CreateDynamicObject(18620, -168.75, 2146.67, -11.30,   0.25, 0.00, 220.00);
	CreateDynamicObject(18620, -227.28, 2073.99, -11.20,   359.75, 0.00, 94.50);
	CreateDynamicObject(744, -234.61, 2102.14, -18.47,   1.92, 315.14, 274.83);
	CreateDynamicObject(744, -219.87, 2099.08, -19.07,   338.98, 9.82, 38.45);
	CreateDynamicObject(3931, -237.47, 2110.12, -15.19,   38.75, 16.16, 357.60);
	CreateDynamicObject(3931, -228.68, 2097.18, -15.22,   38.74, 16.16, 265.59);
	CreateDynamicObject(3931, -225.33, 2106.33, -15.17,   5.30, 25.58, 11.33);
	CreateDynamicObject(3931, -225.63, 2113.01, -15.47,   5.30, 25.58, 291.33);
	CreateDynamicObject(744, -256.02, 2144.30, -17.18,   7.82, 38.62, 155.73);
	CreateDynamicObject(744, -259.17, 2145.95, -13.68,   0.96, 358.19, 197.96);
	CreateDynamicObject(744, -258.97, 2133.35, -18.43,   0.94, 12.19, 161.72);
	CreateDynamicObject(744, -254.21, 2121.15, -19.58,   337.47, 358.03, 327.17);
	CreateDynamicObject(744, -253.35, 2091.13, -18.67,   351.55, 8.26, 269.14);
	CreateDynamicObject(18367, -256.76, 2149.52, -18.00,   275.78, 7.39, 42.05);
	CreateDynamicObject(4815, -260.02, 2032.67, -83.46,   71.38, 95.93, 163.97);
	CreateDynamicObject(4816, -247.96, 2083.56, -41.89,   14.00, 82.70, 165.63);
	CreateDynamicObject(4815, -275.42, 2027.24, -7.99,   0.00, 179.99, 73.42);
	CreateDynamicObject(4815, -273.53, 1992.52, -7.99,   0.00, 179.99, 73.41);
	CreateDynamicObject(18367, -266.15, 2101.69, -18.00,   275.77, 7.39, 70.04);
	CreateDynamicObject(18367, -276.90, 2050.94, -18.00,   275.77, 7.38, 80.04);
	CreateDynamicObject(3931, -242.72, 2136.27, -15.19,   1.78, 18.80, 61.28);
	CreateDynamicObject(3931, -245.22, 2132.27, -15.19,   1.70, 334.78, 62.68);
	CreateDynamicObject(854, -260.86, 2110.27, -14.70,   359.44, 2.17, 235.45);
	CreateDynamicObject(854, -261.11, 2111.70, -14.70,   359.44, 2.17, 199.45);
	CreateDynamicObject(744, -251.30, 2079.74, -13.68,   279.04, 240.07, 311.67);
	CreateDynamicObject(744, -252.53, 2079.74, -7.33,   316.00, 196.55, 263.58);
	CreateDynamicObject(744, -251.98, 2080.84, -15.93,   289.18, 321.43, 2.44);
	CreateDynamicObject(744, -252.50, 2076.46, -15.93,   289.18, 321.43, 16.43);
	CreateDynamicObject(744, -271.65, 2093.88, -8.08,   309.17, 223.59, 121.85);
	CreateDynamicObject(744, -271.82, 2093.13, -8.08,   339.65, 102.64, 18.24);
	CreateDynamicObject(744, -272.90, 2088.38, -7.15,   308.21, 138.53, 40.64);
	CreateDynamicObject(744, -260.09, 2123.05, -4.68,   18.75, 169.63, 141.29);
	CreateDynamicObject(744, -258.29, 2122.83, -4.95,   352.07, 151.88, 182.69);
	CreateDynamicObject(749, -246.49, 2133.21, -17.55,   0.00, 0.00, 0.00);
	CreateDynamicObject(749, -246.96, 2133.23, -19.30,   357.75, 2.00, 0.08);
	CreateDynamicObject(749, -243.16, 2133.23, -18.75,   358.02, 331.48, 358.92);
	CreateDynamicObject(749, -245.26, 2132.98, -6.00,   2.21, 191.50, 359.55);
	CreateDynamicObject(749, -249.14, 2133.16, -5.13,   2.05, 155.47, 0.93);
	CreateDynamicObject(749, -247.46, 2132.48, -7.13,   2.17, 164.97, 0.58);
	CreateDynamicObject(749, -251.64, 2131.00, -8.58,   1.06, 118.21, 21.97);
	CreateDynamicObject(744, -263.72, 2120.55, -6.48,   352.09, 208.47, 191.18);
	CreateDynamicObject(744, -264.89, 2119.95, -9.83,   326.61, 224.98, 177.72);
	CreateDynamicObject(744, -267.48, 2083.67, -19.03,   335.47, 357.99, 271.08);
	CreateDynamicObject(744, -276.48, 2069.17, -16.68,   305.89, 335.94, 208.03);
	CreateDynamicObject(744, -276.70, 2070.07, -10.53,   296.40, 229.72, 94.50);
	CreateDynamicObject(744, -273.45, 2069.12, -6.28,   348.29, 200.26, 66.20);
	CreateDynamicObject(3931, -262.83, 2092.46, -15.37,   5.30, 25.58, 269.32);
	CreateDynamicObject(3931, -265.90, 2092.08, -15.12,   5.30, 25.57, 111.32);
	CreateDynamicObject(3931, -256.18, 2086.46, -15.12,   5.30, 25.55, 11.32);
	CreateDynamicObject(3931, -258.55, 2072.33, -15.24,   5.30, 25.55, 297.31);
	CreateDynamicObject(4815, -263.82, 2011.82, -83.46,   71.38, 95.93, 163.96);
	CreateDynamicObject(4815, -267.69, 1990.69, -83.46,   71.38, 95.93, 163.96);
	CreateDynamicObject(4815, -276.05, 2073.25, -83.46,   71.38, 95.93, 342.22);
	CreateDynamicObject(16122, -285.67, 2045.85, 29.32,   3.71, 22.05, 358.50);
	CreateDynamicObject(16122, -297.09, 2025.36, 42.93,   350.61, 20.28, 351.45);
	CreateDynamicObject(16122, -276.54, 2079.21, 19.08,   3.71, 22.04, 178.49);
	CreateDynamicObject(8607, -201.28, 2147.43, -6.70,   0.00, 0.00, 338.74);
	CreateDynamicObject(8607, -171.11, 2123.81, -7.30,   0.00, 0.00, 314.24);
	CreateDynamicObject(8607, -186.81, 2104.50, -7.84,   0.00, 0.00, 251.48);
	CreateDynamicObject(1278, -210.57, 2147.98, -1.58,   0.00, 0.00, 267.99);
	CreateDynamicObject(1278, -194.20, 2141.61, -1.58,   0.00, 0.00, 267.99);
	CreateDynamicObject(1278, -186.85, 2113.65, -1.58,   0.00, 0.00, 267.99);
	CreateDynamicObject(1278, -190.54, 2104.04, -1.58,   0.00, 0.00, 267.99);
	CreateDynamicObject(3518, -248.25, 2149.78, -9.50,   0.00, 0.00, 259.49);
	CreateDynamicObject(3518, -253.27, 2122.73, -9.50,   0.00, 0.00, 259.48);
	CreateDynamicObject(18620, -265.54, 2150.75, -11.25,   0.00, 0.00, 294.00);
	CreateDynamicObject(18620, -265.29, 2125.13, -11.25,   0.00, 0.00, 293.99);
	CreateDynamicObject(3518, -258.97, 2086.22, -9.50,   0.00, 0.00, 258.98);
	CreateDynamicObject(18620, -267.04, 2077.28, -11.25,   0.00, 0.00, 293.99);
	CreateDynamicObject(3518, -278.16, 1980.78, -92.21,   0.00, 0.00, 258.97);
	CreateDynamicObject(3931, -267.05, 2075.33, -15.19,   5.30, 25.55, 247.31);
	CreateDynamicObject(3931, -263.40, 2088.88, -15.32,   24.12, 22.65, 274.17);
	CreateDynamicObject(854, -271.93, 2061.01, -14.75,   359.44, 2.17, 235.45);
	CreateDynamicObject(854, -268.93, 2061.01, -14.75,   359.44, 2.17, 235.45);
	CreateDynamicObject(854, -270.40, 2061.61, -14.75,   359.44, 2.17, 235.45);
	CreateDynamicObject(854, -269.25, 2062.60, -14.75,   0.19, 2.17, 73.42);
	CreateDynamicObject(854, -270.43, 2063.50, -14.75,   0.19, 2.16, 73.42);
	CreateDynamicObject(854, -271.45, 2062.55, -14.75,   0.19, 2.16, 47.42);
	CreateDynamicObject(854, -271.10, 2060.35, -14.75,   0.18, 2.16, 47.41);
	CreateDynamicObject(854, -270.00, 2060.35, -14.75,   0.18, 2.16, 40.91);
	CreateDynamicObject(854, -270.35, 2061.60, -14.67,   0.18, 2.15, 40.91);
	CreateDynamicObject(744, -258.01, 2054.26, -16.68,   1.46, 2.67, 351.85);
	CreateDynamicObject(744, -257.46, 2053.88, -13.03,   1.39, 344.66, 352.30);
	CreateDynamicObject(744, -259.84, 2054.26, -18.28,   1.34, 22.67, 331.35);
	CreateDynamicObject(744, -275.11, 2057.63, -18.28,   1.34, 22.67, 173.35);
	CreateDynamicObject(744, -278.61, 2057.46, -11.38,   1.23, 328.66, 174.65);
	CreateDynamicObject(854, -271.85, 2045.70, -14.70,   0.19, 2.16, 73.42);
	CreateDynamicObject(3931, -270.48, 2061.71, -14.97,   5.30, 25.54, 247.31);
	CreateDynamicObject(3931, -268.55, 2053.93, -15.02,   15.83, 3.56, 208.86);
	CreateDynamicObject(3931, -266.90, 2067.22, -15.19,   15.83, 3.56, 106.85);
	CreateDynamicObject(3931, -260.92, 2057.84, -15.19,   15.83, 3.55, 106.85);
	CreateDynamicObject(3931, -276.27, 2037.29, -15.22,   25.18, 13.91, 107.79);
	CreateDynamicObject(3931, -262.05, 2041.93, -15.02,   15.58, 349.02, 290.81);
	CreateDynamicObject(3931, -262.05, 2045.13, -15.22,   8.46, 58.42, 244.37);
	CreateDynamicObject(3931, -264.25, 2041.78, -14.87,   25.55, 9.34, 85.76);
	CreateDynamicObject(3931, -272.50, 2030.76, -14.99,   25.54, 9.34, 85.75);
	CreateDynamicObject(3931, -264.45, 2030.76, -15.27,   25.54, 9.34, 113.75);
	CreateDynamicObject(1345, -246.00, 2150.19, -14.08,   0.00, 0.00, 169.74);
	CreateDynamicObject(1345, -272.47, 2036.73, -14.23,   0.00, 0.00, 85.73);
	CreateDynamicObject(854, -274.45, 2034.70, -14.80,   0.18, 2.16, 275.42);
	CreateDynamicObject(854, -274.85, 2036.20, -14.80,   0.18, 2.15, 213.41);
	CreateDynamicObject(854, -274.10, 2035.70, -14.80,   0.18, 2.15, 259.41);
	CreateDynamicObject(854, -275.08, 2028.90, -14.80,   0.18, 2.14, 259.41);
	CreateDynamicObject(854, -275.08, 2030.17, -14.80,   0.18, 2.14, 243.41);
	CreateDynamicObject(854, -274.20, 2029.85, -14.80,   0.18, 2.14, 243.41);
	CreateDynamicObject(854, -270.80, 2034.10, -14.80,   0.18, 2.14, 243.41);
	CreateDynamicObject(3093, -387.31, 2178.24, -15.38,   90.00, 0.00, 349.49);
	CreateDynamicObject(3117, -391.84, 2184.30, -14.93,   0.00, 0.00, 350.00);
	CreateDynamicObject(3117, -388.37, 2183.68, -14.93,   0.00, 0.00, 350.00);
	CreateDynamicObject(3117, -388.73, 2181.60, -14.93,   0.00, 0.00, 350.00);
	CreateDynamicObject(3117, -392.21, 2182.21, -14.93,   0.00, 0.00, 350.00);
	CreateDynamicObject(3117, -392.58, 2180.13, -14.93,   0.00, 0.00, 350.00);
	CreateDynamicObject(3117, -389.10, 2179.52, -14.93,   0.00, 0.00, 350.00);
	CreateDynamicObject(3093, -388.92, 2178.49, -15.08,   90.00, 0.00, 79.99);
	CreateDynamicObject(3093, -393.12, 2179.23, -15.08,   90.00, 0.00, 79.99);
	CreateDynamicObject(3093, -391.11, 2178.87, -15.08,   90.00, 0.00, 79.99);
	CreateDynamicObject(3093, -394.18, 2180.89, -15.08,   90.00, 0.00, 349.49);
	CreateDynamicObject(3093, -393.59, 2184.25, -15.08,   90.00, 0.00, 349.49);
	CreateDynamicObject(3093, -393.90, 2182.66, -15.08,   90.00, 0.00, 349.49);
	CreateDynamicObject(3280, -389.89, 2178.69, -12.91,   90.00, 0.00, 348.99);
	CreateDynamicObject(2978, -388.34, 2178.41, -13.19,   90.00, 0.00, 350.00);
	CreateDynamicObject(2978, -388.34, 2178.41, -11.94,   90.00, 0.00, 350.00);
	CreateDynamicObject(2978, -388.34, 2178.41, -10.66,   90.00, 0.00, 350.00);
	CreateDynamicObject(2978, -393.70, 2179.37, -13.19,   90.00, 0.00, 350.00);
	CreateDynamicObject(2978, -393.70, 2179.37, -11.91,   90.00, 0.00, 350.00);
	CreateDynamicObject(2978, -393.70, 2179.37, -10.66,   90.00, 0.00, 350.00);
	CreateDynamicObject(2978, -387.48, 2179.00, -11.94,   90.00, 0.00, 79.49);
	CreateDynamicObject(2978, -387.48, 2179.00, -10.66,   90.00, 0.00, 79.49);
	CreateDynamicObject(2978, -394.24, 2180.26, -13.19,   90.00, 0.00, 259.49);
	CreateDynamicObject(2978, -394.24, 2180.26, -11.94,   90.00, 0.00, 259.49);
	CreateDynamicObject(2978, -394.24, 2180.26, -10.66,   90.00, 0.00, 259.49);
	CreateDynamicObject(3280, -389.89, 2178.69, -10.39,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -389.89, 2178.69, -11.97,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -392.15, 2179.07, -12.91,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -392.15, 2179.07, -11.97,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -392.15, 2179.07, -10.39,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -391.09, 2178.91, -12.91,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -391.09, 2178.91, -11.97,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -391.09, 2178.91, -10.39,   90.00, 0.00, 348.99);
	CreateDynamicObject(3093, -387.34, 2179.56, -10.55,   90.00, 0.00, 169.74);
	CreateDynamicObject(3093, -388.92, 2178.49, -10.55,   90.00, 0.00, 79.99);
	CreateDynamicObject(3093, -391.11, 2178.87, -10.55,   90.00, 0.00, 79.99);
	CreateDynamicObject(3093, -393.12, 2179.23, -10.55,   90.00, 0.00, 79.99);
	CreateDynamicObject(3093, -394.18, 2180.89, -10.55,   90.00, 0.00, 349.49);
	CreateDynamicObject(3093, -393.59, 2184.25, -10.55,   90.00, 0.00, 349.49);
	CreateDynamicObject(3093, -393.90, 2182.66, -10.55,   90.00, 0.00, 349.49);
	CreateDynamicObject(3280, -393.98, 2181.79, -12.91,   90.00, 0.00, 80.50);
	CreateDynamicObject(3280, -393.98, 2181.79, -11.97,   90.00, 0.00, 80.50);
	CreateDynamicObject(3280, -393.72, 2183.37, -12.91,   90.00, 0.00, 80.50);
	CreateDynamicObject(3280, -393.72, 2183.37, -11.97,   90.00, 0.00, 80.50);
	CreateDynamicObject(3280, -393.98, 2181.79, -10.39,   90.00, 0.00, 80.50);
	CreateDynamicObject(3280, -393.72, 2183.37, -10.39,   90.00, 0.00, 80.50);
	CreateDynamicObject(3093, -387.95, 2184.55, -10.55,   90.00, 0.00, 259.99);
	CreateDynamicObject(3117, -388.36, 2183.68, -9.27,   0.00, 0.00, 350.00);
	CreateDynamicObject(3117, -388.73, 2181.60, -9.27,   0.00, 0.00, 350.00);
	CreateDynamicObject(3117, -389.10, 2179.52, -9.27,   0.00, 0.00, 350.00);
	CreateDynamicObject(3117, -392.21, 2182.21, -9.27,   0.00, 0.00, 350.00);
	CreateDynamicObject(3117, -391.84, 2184.30, -9.27,   0.00, 0.00, 350.00);
	CreateDynamicObject(3117, -392.58, 2180.13, -9.27,   0.00, 0.00, 350.00);
	CreateDynamicObject(2978, -393.42, 2184.84, -13.19,   90.00, 0.00, 259.49);
	CreateDynamicObject(2978, -393.42, 2184.84, -11.91,   90.00, 0.00, 259.49);
	CreateDynamicObject(2978, -393.42, 2184.84, -10.66,   90.00, 0.00, 259.49);
	CreateDynamicObject(3093, -391.90, 2185.26, -10.55,   90.00, 0.00, 259.99);
	CreateDynamicObject(3093, -389.85, 2184.94, -10.55,   90.00, 0.00, 259.99);
	CreateDynamicObject(3093, -387.52, 2178.40, -15.10,   90.00, 0.00, 169.74);
	CreateDynamicObject(3093, -387.94, 2184.59, -15.08,   90.00, 0.00, 259.99);
	CreateDynamicObject(3093, -389.85, 2184.96, -15.08,   90.00, 0.00, 259.99);
	CreateDynamicObject(3093, -391.90, 2185.29, -15.08,   90.00, 0.00, 259.99);
	CreateDynamicObject(2978, -392.57, 2185.36, -13.19,   90.00, 0.00, 169.74);
	CreateDynamicObject(2978, -392.57, 2185.36, -11.91,   90.00, 0.00, 169.74);
	CreateDynamicObject(2978, -392.57, 2185.36, -10.66,   90.00, 0.00, 169.74);
	CreateDynamicObject(3280, -388.81, 2184.68, -12.91,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -391.08, 2185.11, -12.91,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -391.08, 2185.11, -11.97,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -391.08, 2185.11, -10.39,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -390.03, 2184.93, -12.91,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -390.03, 2184.93, -11.97,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -388.81, 2184.68, -11.97,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -390.03, 2184.93, -10.39,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -388.81, 2184.68, -10.39,   90.00, 0.00, 348.99);
	CreateDynamicObject(2978, -387.48, 2179.00, -13.19,   90.00, 0.00, 79.49);
	CreateDynamicObject(3518, -390.47, 2181.94, -9.62,   0.00, 0.00, 260.00);
	CreateDynamicObject(4815, -241.27, 2071.85, -16.25,   0.00, 0.00, 60.66);
	CreateDynamicObject(3093, -275.14, 2012.80, -15.08,   90.00, 0.00, 259.24);
	CreateDynamicObject(3280, -274.49, 2013.02, -12.91,   90.00, 0.00, 167.49);
	CreateDynamicObject(3093, -275.09, 2013.09, -15.08,   90.00, 0.00, 78.99);
	CreateDynamicObject(3280, -274.49, 2013.02, -11.34,   90.00, 0.00, 167.49);
	CreateDynamicObject(2978, -274.49, 2013.06, -9.91,   90.00, 0.00, 348.99);
	CreateDynamicObject(4815, -271.44, 1977.36, -83.46,   71.38, 95.93, 162.46);
	CreateDynamicObject(18367, -268.14, 2011.65, -18.00,   275.77, 7.38, 144.04);
	CreateDynamicObject(18367, -276.26, 2013.35, -18.00,   275.76, 7.38, 205.79);
	CreateDynamicObject(4815, -326.01, 2071.35, -62.08,   87.86, 159.06, 329.41);
	CreateDynamicObject(4815, -268.50, 1946.41, -8.02,   0.00, 179.99, 73.41);
	CreateDynamicObject(4815, -272.80, 2046.75, -83.46,   71.38, 95.93, 342.72);
	CreateDynamicObject(4815, -266.17, 2002.23, -42.04,   334.74, 89.41, 77.60);
	CreateDynamicObject(4815, -274.82, 1954.70, -83.46,   71.38, 95.93, 163.96);
	CreateDynamicObject(2886, -386.38, 2183.20, -13.47,   0.00, 0.00, 80.25);
	CreateDynamicObject(2886, -274.27, 2012.97, -13.45,   0.00, 0.00, 166.24);
	CreateDynamicObject(18367, -261.33, 2047.25, -18.00,   275.77, 7.38, 265.79);
	CreateDynamicObject(3117, -270.41, 2010.26, -97.65,   0.00, 0.00, 259.49);
	CreateDynamicObject(3117, -271.06, 2006.79, -97.65,   0.00, 0.00, 259.49);
	CreateDynamicObject(3117, -273.13, 2007.17, -97.65,   0.00, 0.00, 259.49);
	CreateDynamicObject(3117, -272.50, 2010.64, -97.65,   0.00, 0.00, 259.49);
	CreateDynamicObject(3117, -274.58, 2011.03, -97.65,   0.00, 0.00, 259.49);
	CreateDynamicObject(3117, -275.21, 2007.56, -97.65,   0.00, 0.00, 259.49);
	CreateDynamicObject(3093, -276.24, 2007.38, -97.80,   90.00, 0.00, 349.48);
	CreateDynamicObject(3093, -275.47, 2011.58, -97.80,   90.00, 0.00, 349.48);
	CreateDynamicObject(3093, -275.85, 2009.57, -97.80,   90.00, 0.00, 349.48);
	CreateDynamicObject(3093, -273.80, 2012.62, -97.80,   90.00, 0.00, 258.99);
	CreateDynamicObject(3093, -270.44, 2012.01, -97.80,   90.00, 0.00, 258.99);
	CreateDynamicObject(3093, -272.03, 2012.33, -97.80,   90.00, 0.00, 258.99);
	CreateDynamicObject(3280, -276.04, 2008.36, -95.64,   90.00, 0.00, 258.49);
	CreateDynamicObject(2978, -276.33, 2006.81, -95.92,   90.00, 0.00, 259.49);
	CreateDynamicObject(2978, -276.33, 2006.81, -94.67,   90.00, 0.00, 259.49);
	CreateDynamicObject(2978, -276.33, 2006.81, -93.39,   90.00, 0.00, 259.49);
	CreateDynamicObject(2978, -275.32, 2012.16, -95.92,   90.00, 0.00, 259.49);
	CreateDynamicObject(2978, -275.32, 2012.16, -94.64,   90.00, 0.00, 259.49);
	CreateDynamicObject(2978, -275.32, 2012.16, -93.39,   90.00, 0.00, 259.49);
	CreateDynamicObject(2978, -275.75, 2005.95, -94.67,   90.00, 0.00, 348.99);
	CreateDynamicObject(2978, -275.75, 2005.95, -93.39,   90.00, 0.00, 348.99);
	CreateDynamicObject(2978, -274.43, 2012.69, -95.92,   90.00, 0.00, 168.99);
	CreateDynamicObject(2978, -274.43, 2012.69, -94.67,   90.00, 0.00, 168.99);
	CreateDynamicObject(2978, -274.43, 2012.69, -93.39,   90.00, 0.00, 168.99);
	CreateDynamicObject(3280, -276.04, 2008.36, -93.12,   90.00, 0.00, 258.49);
	CreateDynamicObject(3280, -276.04, 2008.36, -94.69,   90.00, 0.00, 258.49);
	CreateDynamicObject(3280, -275.64, 2010.61, -95.64,   90.00, 0.00, 258.49);
	CreateDynamicObject(3280, -275.64, 2010.61, -94.69,   90.00, 0.00, 258.49);
	CreateDynamicObject(3280, -275.64, 2010.61, -93.12,   90.00, 0.00, 258.49);
	CreateDynamicObject(3280, -275.81, 2009.55, -95.64,   90.00, 0.00, 258.49);
	CreateDynamicObject(3280, -275.81, 2009.55, -94.69,   90.00, 0.00, 258.49);
	CreateDynamicObject(3280, -275.81, 2009.55, -93.12,   90.00, 0.00, 258.49);
	CreateDynamicObject(3093, -275.19, 2005.80, -93.28,   90.00, 0.00, 79.24);
	CreateDynamicObject(3093, -276.24, 2007.38, -93.28,   90.00, 0.00, 349.48);
	CreateDynamicObject(3093, -275.85, 2009.57, -93.28,   90.00, 0.00, 349.48);
	CreateDynamicObject(3093, -275.47, 2011.58, -93.28,   90.00, 0.00, 349.48);
	CreateDynamicObject(3093, -273.80, 2012.62, -93.28,   90.00, 0.00, 258.99);
	CreateDynamicObject(3093, -270.44, 2012.01, -93.28,   90.00, 0.00, 258.99);
	CreateDynamicObject(3093, -272.03, 2012.33, -93.28,   90.00, 0.00, 258.99);
	CreateDynamicObject(3280, -272.90, 2012.42, -95.64,   90.00, 0.00, 350.00);
	CreateDynamicObject(3280, -272.90, 2012.42, -94.69,   90.00, 0.00, 350.00);
	CreateDynamicObject(3280, -271.33, 2012.14, -95.64,   90.00, 0.00, 350.00);
	CreateDynamicObject(3280, -271.33, 2012.14, -94.69,   90.00, 0.00, 350.00);
	CreateDynamicObject(3280, -272.90, 2012.42, -93.12,   90.00, 0.00, 350.00);
	CreateDynamicObject(3280, -271.33, 2012.14, -93.12,   90.00, 0.00, 350.00);
	CreateDynamicObject(3093, -270.20, 2006.37, -93.28,   90.00, 0.00, 169.48);
	CreateDynamicObject(3117, -271.06, 2006.79, -92.00,   0.00, 0.00, 259.49);
	CreateDynamicObject(3117, -273.13, 2007.17, -92.00,   0.00, 0.00, 259.49);
	CreateDynamicObject(3117, -275.21, 2007.56, -92.00,   0.00, 0.00, 259.49);
	CreateDynamicObject(3117, -272.50, 2010.64, -92.00,   0.00, 0.00, 259.49);
	CreateDynamicObject(3117, -270.41, 2010.26, -92.00,   0.00, 0.00, 259.49);
	CreateDynamicObject(3117, -274.58, 2011.03, -92.00,   0.00, 0.00, 259.49);
	CreateDynamicObject(2978, -269.85, 2011.83, -95.92,   90.00, 0.00, 168.99);
	CreateDynamicObject(2978, -269.85, 2011.83, -94.64,   90.00, 0.00, 168.99);
	CreateDynamicObject(2978, -269.85, 2011.83, -93.39,   90.00, 0.00, 168.99);
	CreateDynamicObject(3093, -269.45, 2010.31, -93.28,   90.00, 0.00, 169.48);
	CreateDynamicObject(3093, -269.79, 2008.26, -93.28,   90.00, 0.00, 169.48);
	CreateDynamicObject(3093, -276.35, 2005.99, -97.80,   90.00, 0.00, 79.24);
	CreateDynamicObject(3093, -270.15, 2006.35, -97.80,   90.00, 0.00, 169.48);
	CreateDynamicObject(3093, -269.77, 2008.26, -97.80,   90.00, 0.00, 169.48);
	CreateDynamicObject(3093, -269.42, 2010.31, -97.80,   90.00, 0.00, 169.48);
	CreateDynamicObject(2978, -269.35, 2010.98, -95.92,   90.00, 0.00, 79.24);
	CreateDynamicObject(2978, -269.35, 2010.98, -94.64,   90.00, 0.00, 79.24);
	CreateDynamicObject(2978, -269.35, 2010.98, -93.39,   90.00, 0.00, 79.24);
	CreateDynamicObject(3280, -270.04, 2007.23, -95.64,   90.00, 0.00, 258.49);
	CreateDynamicObject(3280, -269.61, 2009.49, -95.64,   90.00, 0.00, 258.49);
	CreateDynamicObject(3280, -269.61, 2009.49, -94.69,   90.00, 0.00, 258.49);
	CreateDynamicObject(3280, -269.61, 2009.49, -93.12,   90.00, 0.00, 258.49);
	CreateDynamicObject(3280, -269.79, 2008.44, -95.64,   90.00, 0.00, 258.49);
	CreateDynamicObject(3280, -269.79, 2008.44, -94.69,   90.00, 0.00, 258.49);
	CreateDynamicObject(3280, -270.06, 2007.23, -94.69,   90.00, 0.00, 258.49);
	CreateDynamicObject(3280, -269.79, 2008.44, -93.12,   90.00, 0.00, 258.49);
	CreateDynamicObject(3280, -270.06, 2007.23, -93.12,   90.00, 0.00, 258.49);
	CreateDynamicObject(2978, -275.75, 2005.95, -95.92,   90.00, 0.00, 348.99);
	CreateDynamicObject(3518, -272.78, 2008.90, -92.35,   0.00, 0.00, 169.49);
	CreateDynamicObject(3093, -276.38, 2005.70, -97.80,   90.00, 0.00, 258.99);
	CreateDynamicObject(2978, -275.78, 2005.51, -92.64,   90.00, 0.00, 168.99);
	CreateDynamicObject(3280, -275.77, 2005.54, -95.64,   90.00, 0.00, 347.49);
	CreateDynamicObject(3280, -274.30, 2005.35, -92.54,   90.00, 0.00, 350.00);
	CreateDynamicObject(3280, -275.78, 2005.54, -94.07,   90.00, 0.00, 347.49);
	CreateDynamicObject(2978, -271.17, 2005.15, -95.92,   90.00, 0.00, 348.99);
	CreateDynamicObject(2978, -271.17, 2005.15, -94.67,   90.00, 0.00, 348.99);
	CreateDynamicObject(2978, -271.17, 2005.15, -93.39,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -272.80, 2005.08, -92.54,   90.00, 0.00, 350.00);
	CreateDynamicObject(2978, -273.53, 2005.16, -92.64,   90.00, 0.00, 168.99);
	CreateDynamicObject(2978, -270.35, 2005.64, -95.92,   90.00, 0.00, 79.24);
	CreateDynamicObject(2978, -270.35, 2005.64, -94.64,   90.00, 0.00, 79.24);
	CreateDynamicObject(2978, -270.35, 2005.64, -93.39,   90.00, 0.00, 79.24);
	CreateDynamicObject(3093, -271.89, 2005.23, -93.28,   90.00, 0.00, 79.24);
	CreateDynamicObject(3093, -273.66, 2005.48, -93.28,   90.00, 0.00, 79.24);
	CreateDynamicObject(4815, -328.97, 1969.77, -98.88,   0.00, 0.00, 238.42);
	CreateDynamicObject(3117, -275.30, 2007.51, -14.93,   0.00, 0.00, 79.49);
	CreateDynamicObject(3117, -274.66, 2010.98, -14.93,   0.00, 0.00, 79.49);
	CreateDynamicObject(3117, -272.58, 2010.59, -14.93,   0.00, 0.00, 79.49);
	CreateDynamicObject(3117, -273.22, 2007.12, -14.93,   0.00, 0.00, 79.49);
	CreateDynamicObject(3117, -271.14, 2006.73, -14.93,   0.00, 0.00, 79.49);
	CreateDynamicObject(3117, -270.51, 2010.20, -14.93,   0.00, 0.00, 79.49);
	CreateDynamicObject(3093, -269.48, 2010.38, -15.08,   90.00, 0.00, 169.48);
	CreateDynamicObject(3093, -270.25, 2006.18, -15.08,   90.00, 0.00, 169.48);
	CreateDynamicObject(3093, -269.87, 2008.19, -15.08,   90.00, 0.00, 169.48);
	CreateDynamicObject(3093, -271.92, 2005.14, -15.08,   90.00, 0.00, 78.99);
	CreateDynamicObject(3093, -275.28, 2005.76, -15.08,   90.00, 0.00, 78.99);
	CreateDynamicObject(3093, -273.69, 2005.44, -15.08,   90.00, 0.00, 78.99);
	CreateDynamicObject(3280, -269.68, 2009.41, -12.91,   90.00, 0.00, 78.49);
	CreateDynamicObject(2978, -269.39, 2010.96, -13.19,   90.00, 0.00, 79.49);
	CreateDynamicObject(2978, -269.39, 2010.96, -11.94,   90.00, 0.00, 79.49);
	CreateDynamicObject(2978, -269.39, 2010.96, -10.66,   90.00, 0.00, 79.49);
	CreateDynamicObject(2978, -270.39, 2005.60, -13.19,   90.00, 0.00, 79.49);
	CreateDynamicObject(2978, -270.39, 2005.60, -11.91,   90.00, 0.00, 79.49);
	CreateDynamicObject(2978, -270.39, 2005.61, -10.66,   90.00, 0.00, 79.49);
	CreateDynamicObject(2978, -269.97, 2011.82, -11.94,   90.00, 0.00, 168.99);
	CreateDynamicObject(2978, -269.97, 2011.82, -10.66,   90.00, 0.00, 168.99);
	CreateDynamicObject(2978, -271.29, 2005.07, -13.19,   90.00, 0.00, 348.99);
	CreateDynamicObject(2978, -271.29, 2005.07, -11.94,   90.00, 0.00, 348.99);
	CreateDynamicObject(2978, -271.29, 2005.07, -10.66,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -269.68, 2009.41, -10.39,   90.00, 0.00, 78.49);
	CreateDynamicObject(3280, -269.68, 2009.41, -11.97,   90.00, 0.00, 78.49);
	CreateDynamicObject(3280, -270.08, 2007.15, -12.91,   90.00, 0.00, 78.49);
	CreateDynamicObject(3280, -270.08, 2007.15, -11.97,   90.00, 0.00, 78.49);
	CreateDynamicObject(3280, -270.08, 2007.15, -10.39,   90.00, 0.00, 78.49);
	CreateDynamicObject(3280, -269.91, 2008.21, -12.91,   90.00, 0.00, 78.49);
	CreateDynamicObject(3280, -269.91, 2008.21, -11.97,   90.00, 0.00, 78.49);
	CreateDynamicObject(3280, -269.91, 2008.21, -10.39,   90.00, 0.00, 78.49);
	CreateDynamicObject(3093, -270.53, 2011.96, -10.55,   90.00, 0.00, 259.24);
	CreateDynamicObject(3093, -269.48, 2010.38, -10.55,   90.00, 0.00, 169.48);
	CreateDynamicObject(3093, -269.87, 2008.19, -10.55,   90.00, 0.00, 169.48);
	CreateDynamicObject(3093, -270.25, 2006.18, -10.55,   90.00, 0.00, 169.48);
	CreateDynamicObject(3093, -271.92, 2005.14, -10.55,   90.00, 0.00, 78.99);
	CreateDynamicObject(3093, -275.28, 2005.76, -10.55,   90.00, 0.00, 78.99);
	CreateDynamicObject(3093, -273.69, 2005.44, -10.55,   90.00, 0.00, 78.99);
	CreateDynamicObject(3280, -272.82, 2005.34, -12.91,   90.00, 0.00, 170.00);
	CreateDynamicObject(3280, -272.82, 2005.34, -11.97,   90.00, 0.00, 170.00);
	CreateDynamicObject(3280, -274.39, 2005.62, -12.91,   90.00, 0.00, 170.00);
	CreateDynamicObject(3280, -274.39, 2005.62, -11.97,   90.00, 0.00, 170.00);
	CreateDynamicObject(3280, -272.82, 2005.34, -10.39,   90.00, 0.00, 170.00);
	CreateDynamicObject(3280, -274.39, 2005.62, -10.39,   90.00, 0.00, 170.00);
	CreateDynamicObject(3093, -275.52, 2011.40, -10.55,   90.00, 0.00, 349.48);
	CreateDynamicObject(3117, -274.66, 2010.98, -9.27,   0.00, 0.00, 79.49);
	CreateDynamicObject(3117, -272.58, 2010.59, -9.27,   0.00, 0.00, 79.49);
	CreateDynamicObject(3117, -270.51, 2010.20, -9.27,   0.00, 0.00, 79.49);
	CreateDynamicObject(3117, -273.22, 2007.12, -9.27,   0.00, 0.00, 79.49);
	CreateDynamicObject(3117, -275.30, 2007.51, -9.27,   0.00, 0.00, 79.49);
	CreateDynamicObject(3117, -271.14, 2006.73, -9.27,   0.00, 0.00, 79.49);
	CreateDynamicObject(2978, -275.87, 2005.93, -13.19,   90.00, 0.00, 348.99);
	CreateDynamicObject(2978, -275.87, 2005.93, -11.91,   90.00, 0.00, 348.99);
	CreateDynamicObject(2978, -275.87, 2005.93, -10.66,   90.00, 0.00, 348.99);
	CreateDynamicObject(3093, -276.27, 2007.45, -10.55,   90.00, 0.00, 349.48);
	CreateDynamicObject(3093, -275.93, 2009.50, -10.55,   90.00, 0.00, 349.48);
	CreateDynamicObject(3093, -269.37, 2011.77, -15.08,   90.00, 0.00, 259.24);
	CreateDynamicObject(3093, -275.57, 2011.41, -15.08,   90.00, 0.00, 349.48);
	CreateDynamicObject(3093, -275.95, 2009.50, -15.08,   90.00, 0.00, 349.48);
	CreateDynamicObject(3093, -276.30, 2007.45, -15.08,   90.00, 0.00, 349.48);
	CreateDynamicObject(2978, -276.37, 2006.79, -13.19,   90.00, 0.00, 259.24);
	CreateDynamicObject(2978, -276.37, 2006.79, -11.91,   90.00, 0.00, 259.24);
	CreateDynamicObject(2978, -276.37, 2006.79, -10.66,   90.00, 0.00, 259.24);
	CreateDynamicObject(3280, -275.68, 2010.54, -12.91,   90.00, 0.00, 78.49);
	CreateDynamicObject(3280, -276.11, 2008.28, -12.91,   90.00, 0.00, 78.49);
	CreateDynamicObject(3280, -276.11, 2008.28, -11.97,   90.00, 0.00, 78.49);
	CreateDynamicObject(3280, -276.11, 2008.28, -10.39,   90.00, 0.00, 78.49);
	CreateDynamicObject(3280, -275.92, 2009.32, -12.91,   90.00, 0.00, 78.49);
	CreateDynamicObject(3280, -275.92, 2009.32, -11.97,   90.00, 0.00, 78.49);
	CreateDynamicObject(3280, -275.66, 2010.54, -11.97,   90.00, 0.00, 78.49);
	CreateDynamicObject(3280, -275.92, 2009.32, -10.39,   90.00, 0.00, 78.49);
	CreateDynamicObject(3280, -275.66, 2010.54, -10.39,   90.00, 0.00, 78.49);
	CreateDynamicObject(2978, -269.97, 2011.82, -13.19,   90.00, 0.00, 168.99);
	CreateDynamicObject(3518, -272.94, 2008.86, -9.62,   0.00, 0.00, 349.49);
	CreateDynamicObject(3093, -269.34, 2012.06, -15.08,   90.00, 0.00, 78.99);
	CreateDynamicObject(2978, -269.94, 2012.25, -9.91,   90.00, 0.00, 348.99);
	CreateDynamicObject(3280, -269.94, 2012.22, -12.91,   90.00, 0.00, 167.49);
	CreateDynamicObject(3280, -271.42, 2012.42, -9.81,   90.00, 0.00, 170.00);
	CreateDynamicObject(3280, -269.94, 2012.22, -11.34,   90.00, 0.00, 167.49);
	CreateDynamicObject(2978, -274.55, 2012.62, -13.19,   90.00, 0.00, 168.99);
	CreateDynamicObject(2978, -274.55, 2012.62, -11.94,   90.00, 0.00, 168.99);
	CreateDynamicObject(2978, -274.55, 2012.62, -10.66,   90.00, 0.00, 168.99);
	CreateDynamicObject(3280, -272.92, 2012.68, -9.81,   90.00, 0.00, 170.00);
	CreateDynamicObject(2978, -272.19, 2012.60, -9.91,   90.00, 0.00, 348.99);
	CreateDynamicObject(2978, -275.36, 2012.12, -13.19,   90.00, 0.00, 259.24);
	CreateDynamicObject(2978, -275.36, 2012.12, -11.91,   90.00, 0.00, 259.24);
	CreateDynamicObject(2978, -275.36, 2012.12, -10.66,   90.00, 0.00, 259.24);
	CreateDynamicObject(3093, -273.83, 2012.54, -10.55,   90.00, 0.00, 259.24);
	CreateDynamicObject(3093, -272.06, 2012.28, -10.55,   90.00, 0.00, 259.24);
	CreateDynamicObject(3280, -271.22, 2004.74, -95.64,   90.00, 0.00, 347.49);
	CreateDynamicObject(3280, -271.22, 2004.74, -94.07,   90.00, 0.00, 347.49);
	CreateDynamicObject(2978, -271.23, 2004.78, -92.64,   90.00, 0.00, 168.99);
	CreateDynamicObject(3093, -270.60, 2004.67, -97.80,   90.00, 0.00, 258.99);
	CreateDynamicObject(18367, -269.43, 2004.62, -106.76,   275.77, 7.38, 38.04);
	CreateDynamicObject(18367, -277.90, 2005.72, -106.76,   275.76, 7.38, 22.03);
	CreateDynamicObject(4815, -267.59, 1969.81, -133.10,   16.31, 85.18, 186.91);
	CreateDynamicObject(4815, -266.36, 2036.89, -222.63,   71.38, 95.93, 325.46);
	CreateDynamicObject(4815, -285.67, 1968.68, -133.56,   311.38, 85.74, 348.05);
	CreateDynamicObject(4815, -266.35, 2036.34, -213.63,   71.38, 95.93, 325.46);
	CreateDynamicObject(4815, -275.57, 1952.64, -125.60,   317.74, 89.32, 168.96);
	CreateDynamicObject(4815, -332.93, 1937.16, -98.90,   0.00, 0.00, 238.42);
	CreateDynamicObject(4815, -330.68, 1902.16, -98.88,   0.00, 0.00, 238.42);
	CreateDynamicObject(4815, -330.68, 1867.89, -98.93,   0.00, 0.00, 238.42);
	CreateDynamicObject(5272, -267.25, 1942.41, -97.68,   0.00, 0.00, 305.25);
	CreateDynamicObject(4815, -274.92, 2013.99, -121.75,   340.25, 89.28, 258.86);
	CreateDynamicObject(4815, -274.92, 2014.19, -91.66,   340.25, 89.28, 258.86);
	CreateDynamicObject(4815, -274.92, 2013.47, -61.97,   316.26, 88.07, 258.21);
	CreateDynamicObject(18367, -268.08, 1994.37, -106.76,   275.76, 7.38, 265.79);
	CreateDynamicObject(18367, -281.27, 1926.48, -106.76,   275.76, 7.37, 265.78);
	CreateDynamicObject(18367, -292.67, 1928.77, -106.76,   275.76, 7.37, 90.03);
	CreateDynamicObject(4815, -286.05, 1968.68, -127.93,   311.38, 85.74, 348.80);
	CreateDynamicObject(4815, -285.90, 1968.68, -127.46,   311.38, 85.74, 348.05);
	CreateDynamicObject(4815, -239.70, 1936.67, -90.75,   0.00, 179.99, 103.41);
	CreateDynamicObject(4815, -239.70, 1903.69, -90.78,   0.00, 179.99, 103.41);
	CreateDynamicObject(4815, -239.70, 1876.46, -90.73,   0.00, 179.99, 103.41);
	CreateDynamicObject(4815, -239.70, 1851.06, -90.78,   0.00, 179.99, 103.41);
	CreateDynamicObject(4815, -239.70, 1826.48, -90.78,   0.00, 179.99, 103.41);
	CreateDynamicObject(4815, -330.68, 1832.69, -98.95,   0.00, 0.00, 238.42);
	CreateDynamicObject(4815, -285.98, 1892.11, -125.60,   317.74, 89.32, 165.71);
	CreateDynamicObject(4815, -288.48, 1872.98, -125.60,   317.74, 89.31, 147.96);
	CreateDynamicObject(4815, -299.34, 1937.82, -131.76,   311.13, 85.70, 357.77);
	CreateDynamicObject(4815, -310.52, 1921.80, -131.76,   311.12, 85.70, 10.26);
	CreateDynamicObject(4815, -316.59, 1880.35, -131.76,   310.87, 85.65, 52.73);
	CreateDynamicObject(3093, -270.60, 2004.99, -97.80,   90.00, 0.00, 79.23);
	CreateDynamicObject(2886, -271.67, 2004.84, -96.04,   0.00, 0.00, 346.00);
	CreateDynamicObject(1345, -270.68, 1997.92, -96.86,   0.00, 0.00, 314.24);
	CreateDynamicObject(1345, -295.78, 1878.83, -96.94,   0.00, 0.00, 350.49);
	CreateDynamicObject(3931, -280.25, 1991.78, -97.67,   355.66, 263.97, 229.45);
	CreateDynamicObject(3931, -273.30, 1982.60, -97.77,   352.18, 259.05, 320.93);
	CreateDynamicObject(3931, -270.52, 1982.60, -97.72,   352.18, 259.05, 320.92);
	CreateDynamicObject(3931, -272.22, 1985.28, -98.10,   26.91, 314.58, 310.47);
	CreateDynamicObject(3931, -275.10, 1971.50, -98.02,   29.86, 358.35, 104.63);
	CreateDynamicObject(3931, -285.75, 1959.00, -97.92,   23.57, 40.53, 130.90);
	CreateDynamicObject(3931, -287.00, 1955.47, -97.92,   29.41, 349.15, 73.15);
	CreateDynamicObject(3931, -281.32, 1942.50, -97.77,   29.41, 349.15, 73.15);
	CreateDynamicObject(3931, -289.77, 1934.52, -97.60,   348.54, 249.40, 245.70);
	CreateDynamicObject(18620, -280.47, 2011.29, -94.07,   0.00, 0.00, 292.00);
	CreateDynamicObject(18620, -285.68, 1966.54, -94.07,   0.00, 0.00, 291.99);
	CreateDynamicObject(18620, -291.64, 1921.18, -94.07,   0.00, 0.00, 291.99);
	CreateDynamicObject(3518, -266.14, 2047.09, -9.50,   0.00, 0.00, 258.97);
	CreateDynamicObject(3518, -286.21, 1936.38, -92.21,   0.00, 0.00, 258.97);
	CreateDynamicObject(3518, -293.85, 1894.42, -92.21,   0.00, 0.00, 258.97);
	CreateDynamicObject(9583, -252.87, 2124.90, -9.46,   0.00, 90.00, 79.75);
	CreateDynamicObject(9583, -262.80, 2064.77, -9.46,   0.00, 90.00, 79.75);
	CreateDynamicObject(9583, -265.66, 2048.79, -9.46,   0.00, 90.00, 79.75);
	CreateDynamicObject(9583, -282.66, 1955.83, -92.22,   0.00, 90.00, 79.75);
	CreateDynamicObject(9583, -285.80, 1938.26, -92.22,   0.00, 90.00, 79.75);
	CreateDynamicObject(9583, -290.76, 1911.36, -92.22,   0.00, 90.00, 79.75);
	CreateDynamicObject(9583, -293.53, 1896.03, -92.22,   0.00, 90.00, 79.75);
	CreateDynamicObject(3931, -294.87, 1897.16, -97.57,   348.54, 249.39, 279.70);
	CreateDynamicObject(3931, -294.92, 1902.41, -97.97,   29.84, 5.23, 177.24);
	CreateDynamicObject(3931, -295.26, 1870.16, -97.92,   29.83, 5.22, 87.23);
	CreateDynamicObject(10769, -269.15, 1975.33, -108.65,   0.00, 0.00, 216.50);
	CreateDynamicObject(10769, -273.07, 1976.15, -108.65,   0.00, 0.00, 216.50);
	CreateDynamicObject(10985, -279.38, 1954.01, -98.83,   0.00, 0.00, 282.00);
	CreateDynamicObject(10985, -277.83, 1955.71, -98.83,   0.00, 0.00, 120.00);
	CreateDynamicObject(10985, -286.83, 1950.14, -98.83,   0.00, 0.00, 27.99);
	CreateDynamicObject(10985, -274.85, 1975.21, -98.63,   0.00, 0.00, 95.99);
	CreateDynamicObject(10985, -298.40, 1887.61, -98.63,   0.00, 0.00, 255.99);
	CreateDynamicObject(17033, -274.71, 1951.05, -100.06,   56.65, 300.56, 348.74);
	CreateDynamicObject(17033, -286.21, 1976.50, -100.06,   37.79, 74.96, 357.67);
	CreateDynamicObject(17033, -287.58, 1978.62, -92.86,   313.95, 302.67, 192.18);
	CreateDynamicObject(17033, -293.41, 1949.67, -92.86,   313.95, 302.67, 192.17);
	CreateDynamicObject(17033, -275.86, 1936.23, -98.51,   342.21, 343.44, 345.28);
	CreateDynamicObject(17033, -296.36, 1916.57, -99.69,   358.31, 327.23, 195.63);
	CreateDynamicObject(17033, -283.89, 1906.89, -89.87,   330.25, 269.71, 344.13);
	CreateDynamicObject(17033, -299.92, 1888.68, -89.87,   330.24, 269.70, 180.13);
	CreateDynamicObject(17033, -269.24, 1979.09, -90.23,   313.93, 265.31, 337.23);
	CreateDynamicObject(1345, -273.03, 1994.64, -96.86,   0.00, 0.00, 274.24);
	CreateDynamicObject(1345, -291.27, 1881.45, -96.94,   0.00, 0.00, 350.49);
	CreateDynamicObject(934, -211.33, 2126.76, -13.57,   0.00, 0.00, 350.24);
	CreateDynamicObject(934, -212.88, 2128.93, -13.57,   0.00, 0.00, 80.24);
	CreateDynamicObject(749, -250.34, 2130.93, -9.08,   0.01, 92.27, 222.99);
	CreateDynamicObject(749, -259.46, 2123.10, -9.08,   0.00, 92.27, 47.73);
	CreateDynamicObject(749, -264.81, 2120.33, -9.25,   0.00, 90.26, 15.23);
	CreateDynamicObject(4815, -268.85, 1949.31, -7.97,   0.00, 179.99, 73.41);
	CreateDynamicObject(4815, -356.76, 2167.87, -41.80,   340.25, 89.28, 78.99);
    // Name: Fish Sales | Type: Exterior | Owner: N/A | Mapped By: Shana | Interior ID: Nil | Virtual World: Nil
    CreateDynamicObject(4642, 2294.46, 547.04, 2.31, 0.00, 0.00, 270.00);
	// Name: Weapon Factory | Type: Interior | Owner: Gangs | Mapped By: Vintage | Interior ID: 2 | Virtual World: 666
	CreateDynamicObject(1569, 2522.50, -1303.39, 1047.30,   0.00, 0.00, 90.00, 666, 2);
	CreateDynamicObject(1569, 2522.50, -1300.39, 1047.30,   0.00, 0.00, 270.00, 666, 2);
	CreateDynamicObject(1569, 2571.22, -1300.39, 1043.13,   0.00, 0.00, 270.00, 666, 2);
	CreateDynamicObject(1569, 2571.22, -1303.40, 1043.13,   0.00, 0.00, 90.00, 666, 2);
	CreateDynamicObject(360, 2542.12, -1295.00, 1044.14,   270.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(3052, 2543.77, -1294.90, 1044.13,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(3052, 2544.70, -1294.89, 1044.13,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(359, 2542.39, -1291.93, 1044.07,   90.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(3052, 2544.70, -1291.97, 1044.13,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(3052, 2543.77, -1291.97, 1044.13,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(2669, 2551.03, -1284.98, 1044.50,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(2678, 2550.27, -1287.63, 1044.38,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(2678, 2551.81, -1287.63, 1044.68,   0.00, 180.00, 12.00, 666, 2);
	CreateDynamicObject(3052, 2553.29, -1294.92, 1044.13,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(3052, 2554.27, -1294.92, 1044.13,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(3052, 2558.08, -1294.92, 1044.13,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(3052, 2559.04, -1294.92, 1044.13,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(363, 2555.36, -1294.82, 1044.50,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(363, 2555.62, -1294.68, 1044.50,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(363, 2555.98, -1294.72, 1044.50,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(364, 2556.67, -1295.04, 1044.08,   0.00, 0.00, 45.00, 666, 2);
	CreateDynamicObject(363, 2555.45, -1295.05, 1044.50,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(363, 2555.68, -1294.86, 1044.50,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(3052, 2554.27, -1291.97, 1044.13,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(3052, 2553.29, -1291.97, 1044.13,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(361, 2555.58, -1291.96, 1044.25,   90.00, 20.00, 0.00, 666, 2);
	CreateDynamicObject(3052, 2558.08, -1291.97, 1044.13,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(3052, 2559.04, -1291.97, 1044.13,   0.00, 0.00, 0.00, 666, 2);
	CreateDynamicObject(1569, 2530.97, -1307.14, 1047.30,   0.00, 0.00, 90.00, 666, 2);
	CreateDynamicObject(1569, 2530.98, -1304.14, 1047.30,   0.00, 0.00, 270.00, 666, 2);
	CreateDynamicObject(1569, 2530.67, -1304.16, 1047.30,   0.00, 0.00, 270.00, 666, 2);
	CreateDynamicObject(1569, 2530.68, -1307.14, 1047.30,   0.00, 0.00, 90.00, 666, 2);

	// Name: DMV door fix | Type: Interior | Owner: N/A | Mapped By: Vintage | Interior ID: Nil | Virtual World: Nil
	CreateDynamicObject(14542,1494.00000000,1301.59997559,1093.90002441,0.00000000,0.00000000,0.00000000);
	return 1;
}

stock PlantMarijuanaPlant()
{
	new
	    i = random(sizeof(WeedPlants));
 	if(PlantData[i][wpObjectHandle] == 0)
  	{
  		PlantData[i][wpObjectHandle] = CreateDynamicObject(3409, WeedPlants[i][0], WeedPlants[i][1], WeedPlants[i][2] - 1.25, 0, 0, 0, 0, 0);
  	}
}

stock PlantMarijuanaPlants()
{
	for (new i=0; i < sizeof(WeedPlants); i++)
	{
	    if(PlantData[i][wpObjectHandle] == 0)
	    {
	   		PlantData[i][wpObjectHandle] = CreateDynamicObject(3409, WeedPlants[i][0], WeedPlants[i][1], WeedPlants[i][2] - 1.25, 0, 0, 0, 0, 0);
	    }
	}
}

CMD:spawnplants(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_FOUR))
	{
		PlantMarijuanaPlants();
		SendClientMessageEx(playerid, COLOR_WHITE, "You have spawned all weed plants, they have been spawned.");
	}
	return 1;
}

CMD:useweed(playerid, params[])
{
	if(PlayerInfo[playerid][pWeed] >= 2)
	{
		new string[128];
		if(IsPlayerRestricted(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot do this at this time.");
		else if(gettime() - GetPVarInt(playerid, "WeedLength") < 0) return SendClientMessageEx(playerid, COLOR_GREY, "You must wait at least 5 seconds before smoking more weed.");
		else if(GetPlayerDrunkLevel(playerid) > 2000) return SendClientMessageEx(playerid, COLOR_GREY, "You are too sloppy to consume anymore weed, too much could make you faint.");

		SetPlayerHealthEx(playerid, PlayerInfo[playerid][pHealth]+25);
		SetPVarInt(playerid, "WeedLength", gettime() + 5);
		SetPVarInt(playerid, "WeedSmoked", GetPVarInt(playerid, "WeedSmoked")+1);
		PlayerInfo[playerid][pWeed]-= 2;
		format(string, sizeof(string), "* %s smokes some weed.", GetPlayerNameEx(playerid));
		ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);

		if(GetPVarInt(playerid, "WeedSmoked") >= 3)
		{
		    if(random(2) == 1)
		    {
    			SetPlayerDrunkLevel (playerid, 3300);
		        DeletePVar(playerid, "WeedLength");
		        DeletePVar(playerid, "WeedSmoked");
		        SendClientMessageEx(playerid, COLOR_WHITE, "You have become sloppy due to marijuana overdose, you must now wait until the effect is over.");
		    }
		}

		if(!IsPlayerInAnyVehicle(playerid)) {
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
	}
	return 1;
}


CMD:destroyplant(playerid, params[])
{
	foreach(new i: Player)
	{
	    if(PlayerInfo[i][pPlantPosition][0] != 0 && PlayerInfo[i][pPlantPosition][1] != 0 && PlayerInfo[i][pPlantPosition][2] != 0)
	    {
			if(IsPlayerInRangeOfPoint(playerid, 4.0, PlayerInfo[i][pPlantPosition][0], PlayerInfo[i][pPlantPosition][1], PlayerInfo[i][pPlantPosition][2]))
			{
			    if(PlayerInfo[i][pPlantPosition][3] == GetPlayerInterior(playerid) && PlayerInfo[i][pPlantPosition][4] == GetPlayerVirtualWorld(playerid))
			    {
	                PlayerInfo[i][pPlantPosition][0] = 0;
					PlayerInfo[i][pPlantPosition][1] = 0;
					PlayerInfo[i][pPlantPosition][2] = 0;
					PlayerInfo[i][pPlantPosition][3] = 0;
					PlayerInfo[i][pPlantPosition][4] = 0;
					PlayerInfo[i][pPlantGrowth] = 0;
		    		DestroyDynamicObject(WeedPlant[i]);
	                WeedPlant[i] = 0;
		    		SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully destroyed this player-owned plant.");
		    	    return 1;
				}
			}
		}
	}

	for (new i=0; i < sizeof(WeedPlants); i++)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 15.0, WeedPlants[i][0], WeedPlants[i][1], WeedPlants[i][2]))
	    {
	    	if(IsPlayerInRangeOfPoint(playerid, 4.0, WeedPlants[i][0], WeedPlants[i][1], WeedPlants[i][2]))
	    	{
	    		DestroyDynamicObject(PlantData[i][wpObjectHandle]);
                PlantData[i][wpObjectHandle] = 0;
	    		SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully destroyed this plant however, other plants will still continue to grow in this biome.");
	    	    return 1;
	    	}
	    }
	}
	return 1;
}

CMD:plantseeds(playerid, params[])
{
	if(PlayerInfo[playerid][pSeeds] >= 2)
	{
	    if(PlayerInfo[playerid][pPlantPosition][0] != 0 && PlayerInfo[playerid][pPlantPosition][1] != 0 && PlayerInfo[playerid][pPlantPosition][2] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "You already have an existing plant growing.");
		GetPlayerPos(playerid, PlayerInfo[playerid][pPlantPosition][0], PlayerInfo[playerid][pPlantPosition][1], PlayerInfo[playerid][pPlantPosition][2]);
        PlayerInfo[playerid][pPlantPosition][3] = GetPlayerInterior(playerid);
		PlayerInfo[playerid][pPlantPosition][4] = GetPlayerVirtualWorld(playerid);
		PlayerInfo[playerid][pPlantGrowth] = gettime() + 21600;
		ApplyAnimation(playerid,"BOMBER","BOM_Plant_Crouch_In", 4.0, 0, 0, 0, 0, 0, 1);
	    WeedPlant[playerid] = CreateDynamicObject(19473, PlayerInfo[playerid][pPlantPosition][0], PlayerInfo[playerid][pPlantPosition][1], PlayerInfo[playerid][pPlantPosition][2] - 1.25, 0, 0, 0, floatround(PlayerInfo[playerid][pPlantPosition][4]), floatround(PlayerInfo[playerid][pPlantPosition][3]));
        PlayerInfo[playerid][pSeeds] -= 2;
		SendClientMessageEx(playerid, COLOR_WHITE, "You have planted the seeds, it will take around 6 hours for the plant to grow.");
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You do not have enough seeds to plant.");
	}
	return 1;
}

CMD:gotoplant(playerid, params[])
{
	if(IsAdmin(playerid, ADMIN_LEVEL_TWO))
	{
		new
		    i;
		if(sscanf(params, "u", i)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: /gotoplant <playerid>");
		else if(!IsPlayerConnectedEx(i)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid player specified.");
		else if(PlayerInfo[i][pPlantPosition][0] == 0 && PlayerInfo[i][pPlantPosition][1] == 0 && PlayerInfo[i][pPlantPosition][2] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "The specified player currently does not have an existing plant growing.");
		SetPlayerPosEx(playerid, PlayerInfo[i][pPlantPosition][0], PlayerInfo[i][pPlantPosition][1], PlayerInfo[i][pPlantPosition][2]);
		SetPlayerInteriorEx(playerid, floatround(PlayerInfo[i][pPlantPosition][3]));
		SetPlayerVirtualWorldEx(playerid, floatround(PlayerInfo[i][pPlantPosition][4]));
		SendClientMessageEx(playerid, COLOR_WHITE, "You have teleported to the specified player's existing weed plant.");
	}
	return 1;
}

CMD:pickweed(playerid, params[])
{
	foreach(new i: Player)
	{
	    if(PlayerInfo[i][pPlantPosition][0] != 0 && PlayerInfo[i][pPlantPosition][1] != 0 && PlayerInfo[i][pPlantPosition][2] != 0)
	    {
			if(IsPlayerInRangeOfPoint(playerid, 4.0, PlayerInfo[i][pPlantPosition][0], PlayerInfo[i][pPlantPosition][1], PlayerInfo[i][pPlantPosition][2]))
			{
			    if(PlayerInfo[i][pPlantPosition][3] == GetPlayerInterior(playerid) && PlayerInfo[i][pPlantPosition][4] == GetPlayerVirtualWorld(playerid))
			    {
			        if(gettime() - PlayerInfo[i][pPlantGrowth] > 0)
			        {
						SendClientMessageEx(playerid, COLOR_WHITE, "Please select what you would like to extract from the plants, either is a short process.");
						ShowPlayerDialogEx(playerid, DIALOG_COLLECT_PLANT, DIALOG_STYLE_LIST, "{FFFFFF}Plant Extraction", "{FFFFFF}Seeds\nWeed", "Select", "Cancel");
						return 1;
					}
					else
					{
					    SendClientMessageEx(playerid, COLOR_GREY, "You need to wait at least 6 hours for the plant to grow.");
					}
				}
			}
		}
	}

	for (new i=0; i < sizeof(WeedPlants); i++)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 15.0, WeedPlants[i][0], WeedPlants[i][1], WeedPlants[i][2]))
	    {
	    	if(IsPlayerInRangeOfPoint(playerid, 4.0, WeedPlants[i][0], WeedPlants[i][1], WeedPlants[i][2]))
	    	{
				SendClientMessageEx(playerid, COLOR_WHITE, "Please select what you would like to extract from the plants, either is a short process.");
				ShowPlayerDialogEx(playerid, DIALOG_COLLECT_PLANT, DIALOG_STYLE_LIST, "{FFFFFF}Plant Extraction", "{FFFFFF}Seeds\nWeed", "Select", "Cancel");
				return 1;
	    	}
	    }
	}
	return 1;
}

stock IsValidVehicleModel(model)
{
    return (model >= 400 && model <= 611);
}

stock IsVirtualWorldAvailable(world)
{
	for (new i=1; i < MAX_BUSINESSES; i++)
	{
	    if(BusinessInfo[i][bVirtualWorld] == world)
	    {
	        return false;
	    }
	}

	for (new i=1; i < MAX_HOUSES; i++)
	{
	    if(HouseInfo[i][hVirtualWorld] == world)
	    {
	        return false;
	    }
	}
	return true;
}

stock GetAvailableVehicleSlot(playerid)
{
	for (new i=0; i < MAX_PLAYEROWNED_VEHICLES; i++)
	{
	    if(PlayerVehicleInfo[playerid][i][pvModelId] == 0)
	    {
	    	return i;
	    }
	}
	return INVALID_SLOT_ID;
}

stock GetAvailableVirtualWorld()
{
	new
	    randVirtualWorld = random(100000);
	do {
	    randVirtualWorld = random(100000);
	}
	while (!IsVirtualWorldAvailable(randVirtualWorld));
	return randVirtualWorld;
}

stock GetPlayerBusiness(playerid) // Checks what business a player is in
{
	for (new i=1; i < MAX_BUSINESSES; i++)
	{
	    if(BusinessInfo[i][bExistant] == 1)
	    {
		    if(BusinessInfo[i][bVirtualWorld] == GetPlayerVirtualWorld(playerid))
		    {
		        return i;
		    }
	    }
	}
	return INVALID_BUSINESS_ID;
}

stock IsInsideBusiness(playerid, STORE_TYPE)
{
	new b = GetPlayerBusiness(playerid);
	if(b != INVALID_BUSINESS_ID)
	{
	    if(STORE_TYPE == GetBusinessType(b))
	    {
	    	return true;
		}
	}
	return false;
}

stock GetBusinessType(b)
{
	if(b == INVALID_BUSINESS_ID) return BUSINESS_TYPE_UNDEFINED;
	switch (BusinessInfo[b][bInterior])
	{
	    case 0: return BUSINESS_TYPE_UNDEFINED; // null
	    case 1: return BUSINESS_TYPE_HORSEBET; // Horse Betting Place
	    case 2: return BUSINESS_TYPE_CLUB; // Small Size Strip Club
	    case 3: return BUSINESS_TYPE_UNDEFINED; // Modern barber shop
	    case 4: return BUSINESS_TYPE_CLOTHING; // ProLaps Store
	    case 5: return BUSINESS_TYPE_SEXSTORE; // Sex Store
	    case 6: return BUSINESS_TYPE_UNDEFINED; // Tiny Barber Shop
	    case 7: return BUSINESS_TYPE_PIZZA; // Pizza Stack Co
	    case 8: return BUSINESS_TYPE_DONUTS; // Rusty Brown Donuts
	    case 9: return BUSINESS_TYPE_CLOTHING; // Victim Clothing
	    case 10: return BUSINESS_TYPE_AMMUNATION; // Ammunation
	    case 11: return BUSINESS_TYPE_GYM; // LV Gym Interior
	    case 12: return BUSINESS_TYPE_AMMUNATION; // Medium Ammunation
	    case 13: return BUSINESS_TYPE_CLOTHING; // Urban Clothing
	    case 14: return BUSINESS_TYPE_CLUB; // Pig Pen
	    case 15: return BUSINESS_TYPE_BURGERSHOT; // Burger Shot
	    case 16: return BUSINESS_TYPE_UNDEFINED; // Reeces Barber Shop
	    case 17: return BUSINESS_TYPE_CLOTHING; // Zip Clothing
	    case 18: return BUSINESS_TYPE_CLOTHING; // Didier Sachs
	    case 19: return BUSINESS_TYPE_CLUB; // Club
	    case 20: return BUSINESS_TYPE_STORE; // 24/7 (Version 4)
	    case 21: return BUSINESS_TYPE_CLOTHING; // Binco Clothing
	    case 22: return BUSINESS_TYPE_CLUB; // Lil Probe Inn
	    case 23: return BUSINESS_TYPE_CLUB; // Jay's Diner
	    case 24: return BUSINESS_TYPE_UNDEFINED; // Modern Barber Store
	    case 25: return BUSINESS_TYPE_GYM; // SF Cobra Gym
	    case 26: return BUSINESS_TYPE_UNDEFINED; // Zero's RC Store
	    case 27: return BUSINESS_TYPE_AMMUNATION; // Ammunation (Version 4)
	    case 28: return BUSINESS_TYPE_AMMUNATION; // Ammunation (Version 5)
	    case 29: return BUSINESS_TYPE_CLUCKINGBELL; // Clucking Bell
		case 30: return BUSINESS_TYPE_CLUB; // Ten Green Bottles
		default: return BUSINESS_TYPE_UNDEFINED;
	}
	return BUSINESS_TYPE_UNDEFINED;
}

stock GetBusinessMapIcon(b)
{
	if(b == INVALID_BUSINESS_ID) return 0;
	switch (BusinessInfo[b][bInterior])
	{
	    case 0: return 0; // null
	    case 1: return 0; // Horse Betting Place
	    case 2: return 48; // Small Size Strip Club
	    case 3: return 7; // Modern barber shop
	    case 4: return 45; // ProLaps Store
	    case 5: return 0; // Sex Store
	    case 6: return 7; // Tiny Barber Shop
	    case 7: return 29; // Pizza Stack Co
	    case 8: return 50; // Rusty Brown Donuts
	    case 9: return 45; // Victim Clothing
	    case 10: return 6; // Ammunation
	    case 11: return 54; // LV Gym Interior
	    case 12: return 6; // Medium Ammunation
	    case 13: return 45; // Urban Clothing
	    case 14: return 48; // Pig Pen
	    case 15: return 10; // Burger Shot
	    case 16: return 7; // Reeces Barber Shop
	    case 17: return 45; // Zip Clothing
	    case 18: return 45; // Didier Sachs
	    case 19: return 48; // Club
	    case 20: return 52; // 24/7 (Version 4)
	    case 21: return 45; // Binco Clothing
	    case 22: return 49; // Lil Probe Inn
	    case 23: return 17; // Jay's Diner
	    case 24: return 7; // Modern Barber Store
	    case 25: return 54; // SF Cobra Gym
	    case 26: return 47; // Zero's RC Store
	    case 27: return 6; // Ammunation (Version 4)
	    case 28: return 6; // Ammunation (Version 5)
	    case 29: return 14; // Clucking Bell
		case 30: return 49; // Ten Green Bottles
	}
	return 0;
}

stock IsCar(vehicleid)
{
	switch(GetVehicleModel(vehicleid))
	{
		case
		    // Cars
			416, 445, 602, 485, 568,
			429, 499, 424, 536, 496,
			504, 422, 609, 498, 401,
			575, 518, 402, 541, 482,
			431, 438, 457, 527, 483,
			524, 415, 542, 589, 480,
			596, 599, 597, 598, 578,
			486, 507, 562, 585, 427,
			419, 587, 490, 528, 533,
			544, 407, 565, 455, 530,
			526, 466, 604, 492, 474,
			434, 502, 503, 494, 579,
			545, 411, 546, 559, 508,
			571, 400, 403, 517, 410,
			551, 500, 418, 572, 423,
			582, 467, 404, 514, 603,
			516, 600, 413, 426, 436,
			547, 489, 441, 594, 564,
			479, 534, 505, 442, 440,
			475, 543, 605, 495, 567,
			515, 428, 405, 535, 458,
			580, 439, 561, 409, 560,
			550, 506, 601, 574, 566,
			549, 420, 459, 576, 583,
			451, 558, 552, 540, 491,
			412, 478, 421, 529, 555,
			456, 554, 477, 470
		: return 1;
	}
	return 0;
}

stock IsRunnableEngine(vehicleid)
{
	new modelid = GetVehicleModel(vehicleid);
	if(modelid == 509 || modelid == 481 || modelid == 510) return false;
	return true;
}

stock IsVehicleOccupied(vehicleid)
{
    foreach(new i: Player)
	{
        if(GetPlayerVehicleID(i) == vehicleid) return true;
    }
    return false;
}
stock GetVehicleOwner(vehicleid)
{
	foreach(new i: Player)
	{
		for(new v=0; v < MAX_PLAYEROWNED_VEHICLES; v++)
		{
			if(PlayerVehicleInfo[i][v][pvHandleId] == vehicleid) return i;
		}
	}
	return INVALID_PLAYER_ID;
}

stock GetVehicleOwnedSlot(vehicleid)
{
	foreach(new i: Player)
	{
		for(new v=0; v < MAX_PLAYEROWNED_VEHICLES; v++)
		{
			if(PlayerVehicleInfo[i][v][pvHandleId] == vehicleid) return v;
		}
	}
	return INVALID_PLAYER_ID;
}

stock GetVehicleHealthEx(vehicleid)
{
    new Float:vhealth;
    GetVehicleHealth(vehicleid, vhealth);
    return floatround(vhealth);
}

stock GetVehicleDriver(vehicleid)
{
	foreach(new i: Player) if(GetPlayerVehicleID(i) == vehicleid && GetPlayerVehicleSeat(i) == 0) return i;
	return INVALID_PLAYER_ID;
}

stock InitiatePaycheck()
{
	new string[256];
	foreach(new i: Player)
	{
		if(GetPVarInt(i, "gPlayerLogged") == 1 && gettime() - LastUpdate[i] < 1200 && PlayerInfo[i][pTutorial] == 1)
	    {
			new safeTax = floatround((PlayerInfo[i][pPaycheck] / 100) * TAX_PERCENTAGE);

			SendClientMessageEx(i, COLOR_ORANGE, "------------------------------------------");
	        SendClientMessageEx(i, COLOR_ORANGE, "Paycheck Information");
	   		format(string, sizeof(string), "Account Name: %s, Paycheck: $%i", GetPlayerNameEx(i), PlayerInfo[i][pPaycheck]);
	        SendClientMessageEx(i, COLOR_WHITE, string);
	        PlayerInfo[i][pBankBalance] += PlayerInfo[i][pPaycheck];
	   		format(string, sizeof(string), "Old Balance: $%i, New Balance: $%i", (PlayerInfo[i][pBankBalance] - PlayerInfo[i][pPaycheck]), PlayerInfo[i][pBankBalance]);
	        SendClientMessageEx(i, COLOR_WHITE, string);
	        PlayerInfo[i][pPaycheck] = 0;
	        PlayerInfo[i][pBankBalance] -= safeTax;
	       	AddVaultMoney(2, safeTax);
	   		format(string, sizeof(string), "Income Tax: $%i, (%i percent)", safeTax, TAX_PERCENTAGE);
	        SendClientMessageEx(i, COLOR_GREY, string);
	   		format(string, sizeof(string), "Final Balance: $%i", PlayerInfo[i][pBankBalance]);
	        SendClientMessageEx(i, COLOR_ORANGE, string);
	        SendClientMessageEx(i, COLOR_ORANGE, "------------------------------------------");
            PlayerInfo[i][pPlayingHours]++;
            PlayerInfo[i][pExperience]++;

            if(PlayerInfo[i][pBankBalance] >= 100000 || PlayerInfo[i][pMoney] >= 100000)
            {
				format(string, sizeof(string), "[Paycheck]: %s has received $%d with a tax of $%d and $%d in his bank account.", PlayerInfo[i][pUsername], PlayerInfo[i][pPaycheck], safeTax, PlayerInfo[i][pBankBalance]);
				Log("logs/payday.log", string);
			}
			printf("[Paycheck]: %s has received $%d with a tax of $%d and $%d in his bank account.", GetPlayerNameEx(i), PlayerInfo[i][pPaycheck], safeTax, PlayerInfo[i][pBankBalance]);

            if(PlayerInfo[i][pExperience] >= (PlayerInfo[i][pLevel] + 1) * 5)
            {
			 	PlayerInfo[i][pLevel] ++;
			 	PlayerInfo[i][pExperience] = 0;
				SetPlayerScore(i, PlayerInfo[i][pLevel]);
			 	format(string, sizeof(string), "~w~You are now level ~r~%d", PlayerInfo[i][pLevel]);
				GameTextForPlayer(i, string, 3000, 6);
   				PlayerPlaySound(i, 1052, 0.0, 0.0, 0.0);
            }
	    }
    }
}

stock IsBusinessOwner(businessid, playerid)
{
	return (!strcmp(BusinessInfo[businessid][bOwner], PlayerInfo[playerid][pUsername], true));
}

stock IsHouseOwner(houseid, playerid)
{
	return (!strcmp(HouseInfo[houseid][hOwner], PlayerInfo[playerid][pUsername], true));
}

stock GetNearBusiness(playerid)
{
	for (new b=1; b < MAX_BUSINESSES; b++)
	{
	    if(BusinessInfo[b][bExistant] == 1 && BusinessInfo[b][bInterior] >= 1 && BusinessInfo[b][bInterior] <= 30)
	    {
		    new
				i = BusinessInfo[b][bInterior] - 1;
		    if(IsPlayerInRangeOfPoint(playerid, 2.0, BusinessInfo[b][bPosition][0], BusinessInfo[b][bPosition][1], BusinessInfo[b][bPosition][2]))
		        return b;
		    else if(IsPlayerInRangeOfPoint(playerid, 2.0, BusinessInterior[i][0], BusinessInterior[i][1], BusinessInterior[i][2]) && BusinessInfo[b][bVirtualWorld] == GetPlayerVirtualWorld(playerid) && floatround(BusinessInterior[i][4]) == GetPlayerInterior(playerid))
     			return b;
	    }
	}
	return INVALID_BUSINESS_ID;
}

stock GetNearHouse(playerid)
{
	for (new h=1; h < MAX_HOUSES; h++)
	{
	    if(HouseInfo[h][hExistant] == 1 && HouseInfo[h][hInterior] >= 1 && HouseInfo[h][hInterior] <= 21)
	    {
		    new
				i = HouseInfo[h][hInterior] - 1;
		    if(IsPlayerInRangeOfPoint(playerid, 2.0, HouseInfo[h][hPosition][0], HouseInfo[h][hPosition][1], HouseInfo[h][hPosition][2]))
		        return h;
		    else if(IsPlayerInRangeOfPoint(playerid, 2.0, HouseInterior[i][0], HouseInterior[i][1], HouseInterior[i][2]) && HouseInfo[h][hVirtualWorld] == GetPlayerVirtualWorld(playerid) && floatround(HouseInterior[i][4]) == GetPlayerInterior(playerid))
		      	return h;
	    }
	}
	return INVALID_HOUSE_ID;
}

stock GetNearWaypoint(playerid)
{
	for (new w=1; w < MAX_WAYPOINTS; w++)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2.0, WaypointInfo[w][wPosition][0], WaypointInfo[w][wPosition][1], WaypointInfo[w][wPosition][2]))
	    {
	        if(GetPlayerInterior(playerid) == WaypointInfo[w][wInterior] && GetPlayerVirtualWorld(playerid) == WaypointInfo[w][wVirtualWorld])
	        {
	        	return w;
	        }
	    }
	    else if(IsPlayerInRangeOfPoint(playerid, 2.0, WaypointInfo[w][wDestPosition][0], WaypointInfo[w][wDestPosition][1], WaypointInfo[w][wDestPosition][2]))
	    {
	        if(GetPlayerInterior(playerid) == WaypointInfo[w][wDestInterior] && GetPlayerVirtualWorld(playerid) == WaypointInfo[w][wDestVirtualWorld])
	        {
	        	return w;
	        }
	    }
	}
	return INVALID_WAYPOINT_ID;
}

stock GetPlayerID(const PlayerName[MAX_PLAYER_NAME])
{
	new tPlayerName[MAX_PLAYER_NAME];
	foreach(new i: Player)
	{
		if(!IsPlayerConnected(i)) continue;
		GetPlayerName(i, tPlayerName, sizeof(tPlayerName));
		if(strcmp(tPlayerName, PlayerName, true) == 0) return i;
	}
	return INVALID_PLAYER_ID;
}

stock PoliceAlert(message[])
{
	for(new i=0; i < MAX_FACTIONS+1; i++)
	{
	    if(FactionInfo[i][fType] == FACTION_TYPE_LEO) SendFactionMessage(i, COLOR_LIGHTBLUE, message);
	}
	new string[128];
	format(string, 128, "%s", message);
	Log("logs/police.log", string);
}

stock GetPlayerGender(playerid)
{
	new gender[7];
	switch(PlayerInfo[playerid][pGender])
	{
	    case 1: { gender = "Male"; }
	    case 2: { gender = "Female"; }
		default: { gender = "Male"; }
	}
	return gender;
}

stock GetPlayerJob(playerid)
{
	new job[24];
	switch(PlayerInfo[playerid][pJob])
	{
	    case 1: { job = "Trucker"; }
	    case 2: { job = "Mechanic"; }
	    case 3: { job = "Pizza Boy"; }
	    case 4: { job = "Miner"; }
	    case 5: { job = "Taxi Driver"; }
	    case 6: { job = "Drug Smuggler"; }
		default: { job = "None"; }
	}
	return job;

}

stock AreAnyTaxiDriversOnline()
{
	foreach (new i: Player)
	{
	    if(PlayerInfo[i][pJob] == 5 && PlayerInfo[i][pDuty] == 1)
	    {
	        return true;
		}
	}
	return false;
}

stock AreAnyAdministratorsOnline()
{
	foreach (new i: Player)
	{
		if(IsAdmin(i, ADMIN_LEVEL_TWO) && IsPlayerTabbed(i) == false) return true;
		break;
	}
	return false;
}


stock GetFactionRankName(id, rank)
{
	new factionRank[33];
	if(id < 1 || id > MAX_FACTIONS) factionRank = "None";
	else
	{
		switch (rank)
		{
			case 1: { strcat(factionRank, FactionInfo[id][fRank1], 32); }
			case 2: { strcat(factionRank, FactionInfo[id][fRank2], 32);  }
			case 3: { strcat(factionRank, FactionInfo[id][fRank3], 32);  }
			case 4: { strcat(factionRank, FactionInfo[id][fRank4], 32);  }
			case 5: { strcat(factionRank, FactionInfo[id][fRank5], 32);  }
			case 6: { strcat(factionRank, FactionInfo[id][fRank6], 32);  }
			case 7: { strcat(factionRank, FactionInfo[id][fRank7], 32);  }
			case 8: { strcat(factionRank, FactionInfo[id][fRank8], 32);  }
			case 9: { strcat(factionRank, FactionInfo[id][fRank9], 32);  }
			case 10: { strcat(factionRank, FactionInfo[id][fRank10], 32);  }
			default: { strcat(factionRank, FactionInfo[id][fRank1], 32);  }
		}
	}
	return factionRank;
}

stock GetPlayerReferer(playerid)
{
	new
	    pName[MAX_PLAYER_NAME];
	if(!IsRPName(PlayerInfo[playerid][pReferer]))
		pName = "None";
	else
		format(pName, 24, "%s", PlayerInfo[playerid][pReferer]);
	return pName;
}

stock GetPlayerDivision(playerid)
{
	new dName[9];
	if(PlayerInfo[playerid][pFaction] < 1 || PlayerInfo[playerid][pFaction] > MAX_FACTIONS) dName = "None";
	else
	{
		switch (PlayerInfo[playerid][pDivision])
		{
			case 1: { strcat(dName, FactionInfo[PlayerInfo[playerid][pFaction]][fDiv1], 8); }
			case 2: { strcat(dName, FactionInfo[PlayerInfo[playerid][pFaction]][fDiv2], 8);  }
			case 3: { strcat(dName, FactionInfo[PlayerInfo[playerid][pFaction]][fDiv3], 8);  }
			case 4: { strcat(dName, FactionInfo[PlayerInfo[playerid][pFaction]][fDiv4], 8);  }
			case 5: { strcat(dName, FactionInfo[PlayerInfo[playerid][pFaction]][fDiv5], 8);  }
			default: { strcat(dName, "None", 8);  }
		}
	}
	return dName;
}
stock GetDivisionName(faction, id)
{
	new dName[9];
	if(faction < 1 || faction > MAX_FACTIONS) dName = "None";
	else
	{
		switch (id)
		{
			case 1: { strcat(dName, FactionInfo[faction][fDiv1], 8); }
			case 2: { strcat(dName, FactionInfo[faction][fDiv2], 8);  }
			case 3: { strcat(dName, FactionInfo[faction][fDiv3], 8);  }
			case 4: { strcat(dName, FactionInfo[faction][fDiv4], 8);  }
			case 5: { strcat(dName, FactionInfo[faction][fDiv5], 8);  }
			default: { strcat(dName, "None", 8);  }
		}
	}
	return dName;
}

stock GetRankName(playerid)
{
	new rankname[33];
	if(PlayerInfo[playerid][pFaction] > 0) rankname = GetFactionRankName(PlayerInfo[playerid][pFaction], PlayerInfo[playerid][pRank]);
	else format(rankname, sizeof(rankname), "None");
	return rankname;
}

stock GetPlayerIDFromNumber(number)
{
	foreach(new i: Player)
	{
	    if(PlayerInfo[i][pPhoneNumber] == number) return i;
	}
	return INVALID_PLAYER_ID;
}

stock GetAvailableFishSlot(playerid)
{
	for (new i=0; i < 5; i++)
	{
	    if(PlayerInfo[playerid][pFish][i] == 0)
	    {
	    	return i;
	    }
	}
	return -1;
}

stock GetVehicleName(vehicleid)
{
	new string[20];
    format(string, sizeof(string), "%s", VehicleNames[GetVehicleModel(vehicleid) - 400]);
    return string;
}

stock GetFishNameId(id)
{
	new
	    fish[12];
	if(id == 1) format(fish, sizeof(fish), "Trout");
	else if(id == 3) format(fish, sizeof(fish), "Shark");
	else if(id == 4) format(fish, sizeof(fish), "Squid");
	else if(id == 5) format(fish, sizeof(fish), "Salmon");
	else if(id == 6) format(fish, sizeof(fish), "Manta Ray");
	else format(fish, sizeof(fish), "None");
	return fish;
}

stock IsPlayerAtFuelStation(playerid)
{
	return (IsPlayerInRangeOfPoint(playerid, 3.0, -1328.518, 2672.2, 50.06) || IsPlayerInRangeOfPoint(playerid, 3.0, -1328.035, 2677.560, 50.062)
			|| IsPlayerInRangeOfPoint(playerid, 3.0, -1326.627, 2688.724, 50.06) || IsPlayerInRangeOfPoint(playerid, 3.0, -1327.65, 2682.83, 50.063));
}

stock SCMToAdmins(text[])
{
	foreach(new i: Player)
	{
	    if(PlayerInfo[i][pAdminLevel] >= ADMIN_LEVEL_TWO)
	    {
	        SendClientMessageEx(i, COLOR_LIGHTRED, text);
	    }
	}
	return 1;
}

stock GetAdminRank(i)
{
	new tmpString[20];
	switch(PlayerInfo[i][pAdminLevel])
	{
	    case 0: { format(tmpString, sizeof(tmpString), "Level %i Player", PlayerInfo[i][pLevel]); }
	    case 1: { format(tmpString, sizeof(tmpString), "Moderator"); }
	    case 2: { format(tmpString, sizeof(tmpString), "Junior Admin"); }
	    case 3: { format(tmpString, sizeof(tmpString), "General Admin"); }
	    case 4: { format(tmpString, sizeof(tmpString), "Senior Admin"); }
	    case 5: { format(tmpString, sizeof(tmpString), "Head Admin"); }
	    case 6: { format(tmpString, sizeof(tmpString), "Lead Admin"); }
		default: { format(tmpString, sizeof(tmpString), "Undefined Admin"); }
	}
	return tmpString;
}

stock GetCAdminRank(i)
{
	new tmpString[64];
	switch(PlayerInfo[i][pAdminLevel])
	{
	    case 0: { format(tmpString, sizeof(tmpString), "Level %i Player", PlayerInfo[i][pLevel]); }
	    case 1: { format(tmpString, sizeof(tmpString), "{FFFF00}Moderator{FFFFFF}"); }
	    case 2: { format(tmpString, sizeof(tmpString), "{7CFC00}Junior Admin{FFFFFF}"); }
	    case 3: { format(tmpString, sizeof(tmpString), "{7CFC00}General Admin{FFFFFF}"); }
	    case 4: { format(tmpString, sizeof(tmpString), "{F4A460}Senior Admin{FFFFFF}"); }
	    case 5: { format(tmpString, sizeof(tmpString), "{FF0000}Head Admin{FFFFFF}"); }
	    case 6: { format(tmpString, sizeof(tmpString), "{0F80C8}Lead Admin{FFFFFF}"); }
		default: { format(tmpString, sizeof(tmpString), "Undefined Admin"); }
	}
	return tmpString;
}
stock GetFactionName(id)
{
    new tmpString[25];
    format(tmpString, sizeof(tmpString), FactionInfo[id][fName]);
	return tmpString;
}

stock GetFactionType(i)
{
	new tmpString[32];
	switch(FactionInfo[i][fType])
	{
	    case 0: { format(tmpString, sizeof(tmpString), "Civilian"); }
	    case 1: { format(tmpString, sizeof(tmpString), "Law Enforcement Agency"); }
	    case 2: { format(tmpString, sizeof(tmpString), "Governing Agency"); }
	    case 3: { format(tmpString, sizeof(tmpString), "Medical Agency"); }
	    case 4: { format(tmpString, sizeof(tmpString), "News Agency"); }
	    case 5: { format(tmpString, sizeof(tmpString), "Illegal Agency"); }
		default: { format(tmpString, sizeof(tmpString), "Undefined Type"); }
	}
	return tmpString;
}



stock ProxDetector(Float:radi, playerid, string[], col1, col2, col3, col4, col5)
{
    new Float:pPosition[3], Float:oPosition[3];
    GetPlayerPos(playerid, pPosition[0], pPosition[1], pPosition[2]);
    foreach(new i: Player)
    {
        if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i) && GetPlayerInterior(playerid) == GetPlayerInterior(i))
        {
	        GetPlayerPos(i, oPosition[0], oPosition[1], oPosition[2]);
	        if(IsPlayerInRangeOfPoint(i, radi / 16, pPosition[0], pPosition[1], pPosition[2])) { SendClientMessageEx(i, col1, string); }
	        else if(IsPlayerInRangeOfPoint(i, radi / 8, pPosition[0], pPosition[1], pPosition[2])) { SendClientMessageEx(i, col2, string); }
	        else if(IsPlayerInRangeOfPoint(i, radi / 4, pPosition[0], pPosition[1], pPosition[2])) { SendClientMessageEx(i, col3, string); }
	        else if(IsPlayerInRangeOfPoint(i, radi / 2, pPosition[0], pPosition[1], pPosition[2])) { SendClientMessageEx(i, col4, string); }
	        else if(IsPlayerInRangeOfPoint(i, radi, pPosition[0], pPosition[1], pPosition[2])) { SendClientMessageEx(i, col5, string); }
        }
    }
    return 1;
}

stock GetWeaponNameEx(weaponid)
{
	new string[32];
	GetWeaponName(weaponid, string, sizeof(string));
	if(weaponid == 0) format(string, sizeof(string), "Fist");
	return string;
}

stock GivePlayerCash(playerid, amount)
{
    if(GetPVarType(playerid, "AdminDuty") == 1) return 0;
	PlayerInfo[playerid][pMoney] += amount;
	return 1;
}


stock SetPlayerArmourEx(playerid, Float:amount)
{
	if(GetPVarType(playerid, "AdminDuty") == 1) return 0;
	PlayerInfo[playerid][pArmour] = amount;
	SetPlayerArmour(playerid, PlayerInfo[playerid][pArmour]);
	return 1;
}

stock SetPlayerHealthEx(playerid, Float:amount)
{
	if(GetPVarType(playerid, "AdminDuty") == 1) return 0;
	PlayerInfo[playerid][pHealth] = amount;
    SetPlayerHealth(playerid, amount);
	return 1;
}

stock ReloadPlayerWeapons(playerid)
{
	if(GetPVarInt(playerid, "gPlayerLogged") == 1)
	{
		ResetPlayerWeapons(playerid);
		for(new i=0; i < 12; i++)
		{
		    GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][i], 90000);
		}
	}
}

forward SetPlayerPosEx(playerid, Float:x, Float:y, Float:z);
public SetPlayerPosEx(playerid, Float:x, Float:y, Float:z)
{
	if(GetPVarInt(playerid, "gPlayerLogged") == 1) PlayerInfo[playerid][pPositionX] = x; PlayerInfo[playerid][pPositionY] = y; PlayerInfo[playerid][pPositionZ] = z;
    return SetPlayerPos(playerid, x, y, z);
}

stock GivePlayerWeaponEx(playerid, weaponid)
{
	switch(weaponid)
	{
	    case 0 .. 1:
	    {
	        return 0;
	    }

		case 2 .. 9:
	    {
			PlayerInfo[playerid][pWeapons][1] = weaponid;
			GivePlayerWeapon(playerid, weaponid, 1);
		}

		case 22 .. 24:
	    {
			PlayerInfo[playerid][pWeapons][2] = weaponid;
			GivePlayerWeapon(playerid, weaponid, 20000);
		}

		case 25 .. 27:
	    {
			PlayerInfo[playerid][pWeapons][3] = weaponid;
			GivePlayerWeapon(playerid, weaponid, 20000);
		}

		case 28 .. 29:
	    {
			PlayerInfo[playerid][pWeapons][4] = weaponid;
			GivePlayerWeapon(playerid, weaponid, 20000);
		}

		case 32:
	    {
			PlayerInfo[playerid][pWeapons][4] = weaponid;
			GivePlayerWeapon(playerid, weaponid, 20000);
		}

		case 30 .. 31:
	    {
			PlayerInfo[playerid][pWeapons][5] = weaponid;
			GivePlayerWeapon(playerid, weaponid, 20000);
		}

		case 33 .. 34:
	    {
			PlayerInfo[playerid][pWeapons][6] = weaponid;
			GivePlayerWeapon(playerid, weaponid, 20000);
		}

		case 35 .. 38:
	    {
			PlayerInfo[playerid][pWeapons][7] = weaponid;
			GivePlayerWeapon(playerid, weaponid, 20000);
		}

		case 16 .. 18:
	    {
			PlayerInfo[playerid][pWeapons][8] = weaponid;
			GivePlayerWeapon(playerid, weaponid, 20000);
		}

		case 39:
	    {
			PlayerInfo[playerid][pWeapons][8] = weaponid;
			GivePlayerWeapon(playerid, weaponid, 20000);
		}

		case 41 .. 43:
	    {
			PlayerInfo[playerid][pWeapons][9] = weaponid;
			GivePlayerWeapon(playerid, weaponid, 20000);
		}

		case 10 .. 15:
	    {
			PlayerInfo[playerid][pWeapons][10] = weaponid;
			GivePlayerWeapon(playerid, weaponid, 1);
		}

		case 44 .. 45:
	    {
			PlayerInfo[playerid][pWeapons][11] = weaponid;
			GivePlayerWeapon(playerid, weaponid, 1);
		}

		case 46:
		{
			GivePlayerWeapon(playerid, weaponid, 1);
		}
	}
	SetPlayerArmedWeapon(playerid, weaponid);
	return 1;
}

stock IsPlayerInRangeOfPlayer(playerid, targetid, Float:range=2.0)
{
	new Float:Position[3];
	GetPlayerPos(targetid, Position[0], Position[1], Position[2]);
	return (IsPlayerInRangeOfPoint(playerid, range, Position[0], Position[1], Position[2]));
}

stock RemovePlayerWeaponEx(playerid, slotid)
{
	SetPlayerArmedWeapon(playerid, 0);
	ResetPlayerWeapons(playerid);
	PlayerInfo[playerid][pWeapons][slotid] = 0;
	ReloadPlayerWeapons(playerid);
}

stock SetPlayerInteriorEx(playerid, interior)
{
    PlayerInfo[playerid][pInterior] = interior;
	SetPlayerInterior(playerid, PlayerInfo[playerid][pInterior]);
}

stock SetPlayerVirtualWorldEx(playerid, world)
{
    PlayerInfo[playerid][pVirtualWorld] = world;
	SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pVirtualWorld]);
}

stock SetPlayerSkinEx(playerid, skinid)
{
	PlayerInfo[playerid][pSkin] = skinid;
	SetPlayerSkin(playerid, skinid);
	return 1;
}

stock SendClientMessageToAllEx(color, message[])
{
	foreach(new i: Player)
	{
		if(GetPVarInt(i, "gPlayerLogged") == 1)
		{
		    SendClientMessageEx(i, color, message);
  		}
	}
	return 1;
}

stock SendClientMessageEx(playerid, color, message[])
{
	SendClientMessage(playerid, color, message);
	return 1;
}

stock GetDistanceBetweenTwoPoints( Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2 )
{
    return floatround( floatsqroot( ( ( x1 - x2 ) * ( x1 - x2 ) ) + ( ( y1 - y2 ) * ( y1 - y2 ) ) + ( ( z1 - z2 ) * ( z1 - z2 ) ) ) );
}

stock GetCurrentHour()
{
	new currentHour[3];
	gettime(currentHour[0], currentHour[1], currentHour[2]);
	return currentHour[0];
}
/*
stock IsRPNameText(text[], max_underscores = 2)
{
    new underscores = 0, name[MAX_PLAYER_NAME];
    format(name, sizeof(name), "%s", text);
    if(name[0] < 'A' || name[0] > 'Z') return false;
    for(new i = 1; i < strlen(name); i++)
    {
        if(name[i] != '_' && (name[i] < 'A' || name[i] > 'Z') && (name[i] < 'a' || name[i] > 'z')) return false;
        if( (name[i] >= 'A' && name[i] <= 'Z') && (name[i - 1] != '_') ) return false;
        if(name[i] == '_')
        {
            underscores++;
            if(underscores > max_underscores || i == strlen(name)) return false;
            if(name[i + 1] < 'A' || name[i + 1] > 'Z') return false;
        }
    }
    if(underscores == 0) return false;
    return true;
}

stock IsRPName(playerid, max_underscores = 2)
{
    new underscores = 0, name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, MAX_PLAYER_NAME);
    if(name[0] < 'A' || name[0] > 'Z') return false;
    for(new i = 1; i < strlen(name); i++)
    {
        if(name[i] != '_' && (name[i] < 'A' || name[i] > 'Z') && (name[i] < 'a' || name[i] > 'z')) return false;
        if( (name[i] >= 'A' && name[i] <= 'Z') && (name[i - 1] != '_') ) return false;
        if(name[i] == '_')
        {
            underscores++;
            if(underscores > max_underscores || i == strlen(name)) return false;
            if(name[i + 1] < 'A' || name[i + 1] > 'Z') return false;
        }
    }
    if(underscores == 0) return false;
    return true;
}
*/
stock IsRPNameText(text[], max_underscores = 2)
{
    new underscores = 0, name[MAX_PLAYER_NAME];
    format(name, sizeof(name), "%s", text);
    if(name[0] < 'A' || name[0] > 'Z') return false;
    for(new i = 1; i < strlen(name); i++)
    {
        if(name[i] == '_')
        {
            underscores++;
            if(underscores > max_underscores || i == strlen(name)) return false;
        }
    }
    if(underscores == 0) return false;
    return true;
}
stock IsRPName(playerid, max_underscores = 2)
{
    new underscores = 0, name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, MAX_PLAYER_NAME);
    if(name[0] < 'A' || name[0] > 'Z') return false;
    for(new i = 1; i < strlen(name); i++)
    {
        if(name[i] == '_')
        {
            underscores++;
            if(underscores > max_underscores || i == strlen(name)) return false;
        }
    }
    if(underscores == 0) return false;
    return true;
}
stock RecreateWaypointText(w)
{
	new
	    string[128];
	if(IsValidDynamic3DTextLabel(WaypointInfo[w][wTextLabel]))
		DestroyDynamic3DTextLabel(WaypointInfo[w][wTextLabel]);
	format(string, sizeof(string), "(ID: %i)\n%s", w, WaypointInfo[w][wTextDisplay]);
	WaypointInfo[w][wTextLabel] = CreateDynamic3DTextLabel(string, COLOR_GOLD, WaypointInfo[w][wPosition][0], WaypointInfo[w][wPosition][1], WaypointInfo[w][wPosition][2], 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, WaypointInfo[w][wVirtualWorld], WaypointInfo[w][wInterior]);
}

stock RecreateFactionLockerText(factionid)
{
	new string[128];
	if(IsValidDynamic3DTextLabel(FactionInfo[factionid][fLockerDisplay])) DestroyDynamic3DTextLabel(FactionInfo[factionid][fLockerDisplay]);
	format(string, sizeof(string), "%s Locker\nType /locker to access this faction locker", FactionInfo[factionid][fName]);
	FactionInfo[factionid][fLockerDisplay] = CreateDynamic3DTextLabel(string, COLOR_YELLOW, FactionInfo[factionid][fLockerPosition][0], FactionInfo[factionid][fLockerPosition][1], FactionInfo[factionid][fLockerPosition][2], 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
}

stock RecreateVaultText(factionid)
{
	new string[128];
	if(IsValidDynamic3DTextLabel(VaultInfo[factionid][vTextDisplay])) DestroyDynamic3DTextLabel(VaultInfo[factionid][vTextDisplay]);
	format(string, sizeof(string), "%s Vault\nType /vault to access this vault", FactionInfo[factionid][fName]);
	VaultInfo[factionid][vTextDisplay] = CreateDynamic3DTextLabel(string, COLOR_YELLOW, VaultInfo[factionid][vPosition][0], VaultInfo[factionid][vPosition][1], VaultInfo[factionid][vPosition][2], 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
}

stock RecreateHouseText(h)
{
	if(HouseInfo[h][hExistant])
	{
		new
		    string[256];

		if(HouseInfo[h][hBuyPrice] <= 0) {
		    format(string, sizeof(string), "This house is currently unavailable, you cannot buy it.");
		} else if(!strcmp(HouseInfo[h][hOwner], "none", true)) {
		    format(string, sizeof(string), "This house is on sale for $%s, type /buyhouse to buy it.", convertNumber(HouseInfo[h][hBuyPrice], .iDelim = ","));
  		} else {
		    format(string, sizeof(string), "Owner: %s", HouseInfo[h][hOwner]);
		}
		if(IsValidDynamic3DTextLabel(HouseInfo[h][hTextLabel]))
			DestroyDynamic3DTextLabel(HouseInfo[h][hTextLabel]);
		if(IsValidDynamicPickup(HouseInfo[h][hPickupIcon]))
			DestroyDynamicPickup(HouseInfo[h][hPickupIcon]);
		format(string, sizeof(string), "(ID: %d)\nHouse\n%s", h, string);
		HouseInfo[h][hTextLabel] = CreateDynamic3DTextLabel(string, COLOR_GREEN, HouseInfo[h][hPosition][0], HouseInfo[h][hPosition][1], HouseInfo[h][hPosition][2], 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 0);
		HouseInfo[h][hPickupIcon] = CreateDynamicPickup(1273, 1, HouseInfo[h][hPosition][0], HouseInfo[h][hPosition][1], HouseInfo[h][hPosition][2], 0, 0);
	}
}

stock IsPlayerRestricted(playerid)
{
	return GetPVarInt(playerid, "IsCuffed") == 1 || GetPVarInt(playerid, "ActionRestriction") == 1 || PlayerInfo[playerid][pWounded] != PLAYER_ALIVE;
}

stock IsAbleToUseAnimation(playerid)
{
	if(IsPlayerRestricted(playerid)) return false;
	if(IsPlayerInAnyVehicle(playerid) == 1)
    {
		SendClientMessageEx(playerid, COLOR_GREY, "You need to be on foot to use this animation.");
		return false;
	}
	return true;
}

stock IsVehicleLowrider(carid)
{
	new Cars[] = { 536, 575, 567};
	for(new i = 0; i < sizeof(Cars); i++)
	{
		if(GetVehicleModel(carid) == Cars[i]) return true;
	}
	return false;
}

stock IsKeyJustDown(key, newkeys, oldkeys)
{
	if((newkeys & key) && !(oldkeys & key)) return true;
	else return false;
}

stock PlayAnim(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync)
{
	if(GetPlayerAnimationIndex(playerid) != 0) ClearAnimations(playerid);
	ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, forcesync);
}

stock LoopingAnim(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync)
{
	if(GetPlayerAnimationIndex(playerid) != 0) ClearAnimations(playerid);
    gPlayerUsingLoopingAnim[playerid] = 1;
	ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, forcesync);
}

stock StopLoopingAnim(playerid)
{
	gPlayerUsingLoopingAnim[playerid] = 0;
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);
}
stock PreloadAnimLib(playerid, animlib[]) return ApplyAnimation(playerid,animlib, "null", 0.0, 0, 0, 0, 0, 0, 0);
stock Player_PreLoadAnim(playerid)
{
    PreloadAnimLib(playerid,"AIRPORT");
	PreloadAnimLib(playerid,"Attractors");
	PreloadAnimLib(playerid,"BAR");
	PreloadAnimLib(playerid,"BASEBALL");
	PreloadAnimLib(playerid,"BD_FIRE");
	PreloadAnimLib(playerid,"benchpress");
    PreloadAnimLib(playerid,"BF_injection");
    PreloadAnimLib(playerid,"BIKED");
    PreloadAnimLib(playerid,"BIKEH");
    PreloadAnimLib(playerid,"BIKELEAP");
    PreloadAnimLib(playerid,"BIKES");
    PreloadAnimLib(playerid,"BIKEV");
    PreloadAnimLib(playerid,"BIKE_DBZ");
    PreloadAnimLib(playerid,"BMX");
    PreloadAnimLib(playerid,"BOX");
    PreloadAnimLib(playerid,"BSKTBALL");
    PreloadAnimLib(playerid,"BUDDY");
    PreloadAnimLib(playerid,"BUS");
    PreloadAnimLib(playerid,"CAMERA");
    PreloadAnimLib(playerid,"CAR");
    PreloadAnimLib(playerid,"CAR_CHAT");
    PreloadAnimLib(playerid,"CASINO");
    PreloadAnimLib(playerid,"CHAINSAW");
    PreloadAnimLib(playerid,"CHOPPA");
    PreloadAnimLib(playerid,"CLOTHES");
    PreloadAnimLib(playerid,"COACH");
    PreloadAnimLib(playerid,"COLT45");
    PreloadAnimLib(playerid,"COP_DVBYZ");
    PreloadAnimLib(playerid,"CRIB");
    PreloadAnimLib(playerid,"DAM_JUMP");
    PreloadAnimLib(playerid,"DANCING");
    PreloadAnimLib(playerid,"DILDO");
    PreloadAnimLib(playerid,"DODGE");
    PreloadAnimLib(playerid,"DOZER");
    PreloadAnimLib(playerid,"DRIVEBYS");
    PreloadAnimLib(playerid,"FAT");
    PreloadAnimLib(playerid,"FIGHT_B");
    PreloadAnimLib(playerid,"FIGHT_C");
    PreloadAnimLib(playerid,"FIGHT_D");
    PreloadAnimLib(playerid,"FIGHT_E");
    PreloadAnimLib(playerid,"FINALE");
    PreloadAnimLib(playerid,"FINALE2");
    PreloadAnimLib(playerid,"Flowers");
    PreloadAnimLib(playerid,"FOOD");
    PreloadAnimLib(playerid,"Freeweights");
    PreloadAnimLib(playerid,"GANGS");
    PreloadAnimLib(playerid,"GHANDS");
    PreloadAnimLib(playerid,"GHETTO_DB");
    PreloadAnimLib(playerid,"goggles");
    PreloadAnimLib(playerid,"GRAFFITI");
    PreloadAnimLib(playerid,"GRAVEYARD");
    PreloadAnimLib(playerid,"GRENADE");
    PreloadAnimLib(playerid,"GYMNASIUM");
    PreloadAnimLib(playerid,"HAIRCUTS");
    PreloadAnimLib(playerid,"HEIST9");
    PreloadAnimLib(playerid,"INT_HOUSE");
    PreloadAnimLib(playerid,"INT_OFFICE");
    PreloadAnimLib(playerid,"INT_SHOP");
    PreloadAnimLib(playerid,"JST_BUISNESS");
    PreloadAnimLib(playerid,"KART");
    PreloadAnimLib(playerid,"KISSING");
    PreloadAnimLib(playerid,"KNIFE");
    PreloadAnimLib(playerid,"LAPDAN1");
    PreloadAnimLib(playerid,"LAPDAN2");
    PreloadAnimLib(playerid,"LAPDAN3");
    PreloadAnimLib(playerid,"LOWRIDER");
    PreloadAnimLib(playerid,"MD_CHASE");
    PreloadAnimLib(playerid,"MEDIC");
    PreloadAnimLib(playerid,"MD_END");
    PreloadAnimLib(playerid,"MISC");
    PreloadAnimLib(playerid,"MTB");
    PreloadAnimLib(playerid,"MUSCULAR");
    PreloadAnimLib(playerid,"NEVADA");
    PreloadAnimLib(playerid,"ON_LOOKERS");
    PreloadAnimLib(playerid,"OTB");
    PreloadAnimLib(playerid,"PARACHUTE");
    PreloadAnimLib(playerid,"PARK");
    PreloadAnimLib(playerid,"PAULNMAC");
    PreloadAnimLib(playerid,"PED");
    PreloadAnimLib(playerid,"PLAYER_DVBYS");
    PreloadAnimLib(playerid,"PLAYIDLES");
    PreloadAnimLib(playerid,"POLICE");
    PreloadAnimLib(playerid,"POOL");
    PreloadAnimLib(playerid,"POOR");
    PreloadAnimLib(playerid,"PYTHON");
    PreloadAnimLib(playerid,"QUAD");
    PreloadAnimLib(playerid,"QUAD_DBZ");
    PreloadAnimLib(playerid,"RIFLE");
    PreloadAnimLib(playerid,"RIOT");
    PreloadAnimLib(playerid,"ROB_BANK");
    PreloadAnimLib(playerid,"ROCKET");
    PreloadAnimLib(playerid,"RUSTLER");
    PreloadAnimLib(playerid,"RYDER");
    PreloadAnimLib(playerid,"SCRATCHING");
    PreloadAnimLib(playerid,"SHAMAL");
    PreloadAnimLib(playerid,"SHOTGUN");
    PreloadAnimLib(playerid,"SILENCED");
    PreloadAnimLib(playerid,"SKATE");
    PreloadAnimLib(playerid,"SPRAYCAN");
    PreloadAnimLib(playerid,"STRIP");
    PreloadAnimLib(playerid,"SUNBATHE");
    PreloadAnimLib(playerid,"SWAT");
    PreloadAnimLib(playerid,"SWEET");
    PreloadAnimLib(playerid,"SWIM");
    PreloadAnimLib(playerid,"SWORD");
    PreloadAnimLib(playerid,"TANK");
    PreloadAnimLib(playerid,"TATTOOS");
    PreloadAnimLib(playerid,"TEC");
    PreloadAnimLib(playerid,"TRAIN");
    PreloadAnimLib(playerid,"TRUCK");
    PreloadAnimLib(playerid,"UZI");
    PreloadAnimLib(playerid,"VAN");
    PreloadAnimLib(playerid,"VENDING");
    PreloadAnimLib(playerid,"VORTEX");
    PreloadAnimLib(playerid,"WAYFARER");
    PreloadAnimLib(playerid,"WEAPONS");
    PreloadAnimLib(playerid,"WUZI");
    PreloadAnimLib(playerid,"SNM");
    PreloadAnimLib(playerid,"BLOWJOBZ");
    PreloadAnimLib(playerid,"SEX");
	PreloadAnimLib(playerid,"BOMBER");
	PreloadAnimLib(playerid,"RAPPING");
	PreloadAnimLib(playerid,"SHOP");
	PreloadAnimLib(playerid,"BEACH");
	PreloadAnimLib(playerid,"SMOKING");
	PreloadAnimLib(playerid,"FOOD");
	PreloadAnimLib(playerid,"ON_LOOKERS");
	PreloadAnimLib(playerid,"DEALER");
	PreloadAnimLib(playerid,"CRACK");
	PreloadAnimLib(playerid,"CARRY");
	PreloadAnimLib(playerid,"COP_AMBIENT");
	PreloadAnimLib(playerid,"PARK");
	PreloadAnimLib(playerid,"INT_HOUSE");
	PreloadAnimLib(playerid,"FOOD");
    gPlayerAnimLibsPreloaded[playerid] = 1;
}

stock RecreateGateText(g)
{
	if(IsValidDynamic3DTextLabel(GateInfo[g][gTextDisplay]))
	    DestroyDynamic3DTextLabel(GateInfo[g][gTextDisplay]);
	new string[128];
	format(string, sizeof(string), "(ID: %d)", g);
	GateInfo[g][gTextDisplay] = CreateDynamic3DTextLabel(string, COLOR_LIGHTBLUE, GateInfo[g][gPosition][0], GateInfo[g][gPosition][1], GateInfo[g][gPosition][2], 10.0);
}

stock RecreateBusinessText(b)
{
	if(BusinessInfo[b][bExistant])
	{
		new
	    	string[256];

		if(BusinessInfo[b][bBuyPrice] <= 0) {
		    format(string, sizeof(string), "[{FF0000}Unavailable{FFFFFF}]: Not For Sale");
		} else if(!strcmp(BusinessInfo[b][bOwner], "none", true)) {
		    format(string, sizeof(string), "[{00FF22}For Sale{FFFFFF}]: $%s (/buybiz)", convertNumber(BusinessInfo[b][bBuyPrice], .iDelim = ","));
  		} else {
		    format(string, sizeof(string), "Owner: %s", BusinessInfo[b][bOwner]);
		}

		if(BusinessInfo[b][bOpen]) {
			format(string, sizeof(string), "{FFFFFF}(ID: %d)\n[{00FF22}Open{FFFFFF}]\n%s\nName: %s{FFFFFF}", b, string, BusinessInfo[b][bName]);
		} else {
			format(string, sizeof(string), "{FFFFFF}(ID: %d)\n[{FF0000}Closed{FFFFFF}]\n%s\nName: %s{FFFFFF}", b, string, BusinessInfo[b][bName]);
		}
		if(IsValidDynamicPickup(BusinessInfo[b][bPickup]))
			DestroyDynamicPickup(BusinessInfo[b][bPickup]);
		if(IsValidDynamic3DTextLabel(BusinessInfo[b][bTextLabel]))
			DestroyDynamic3DTextLabel(BusinessInfo[b][bTextLabel]);
		if(IsValidDynamicMapIcon(BusinessInfo[b][bMapIcon]))
			DestroyDynamicMapIcon(BusinessInfo[b][bMapIcon]);
		if(GetBusinessMapIcon(b) != 0)
			BusinessInfo[b][bMapIcon] = CreateDynamicMapIcon(BusinessInfo[b][bPosition][0], BusinessInfo[b][bPosition][1], BusinessInfo[b][bPosition][2], GetBusinessMapIcon(b), 0, 0, 0);
		BusinessInfo[b][bTextLabel] = CreateDynamic3DTextLabel(string, COLOR_WHITE, BusinessInfo[b][bPosition][0], BusinessInfo[b][bPosition][1], BusinessInfo[b][bPosition][2], 20.0);
		BusinessInfo[b][bPickup] = CreateDynamicPickup(1272, 1, BusinessInfo[b][bPosition][0], BusinessInfo[b][bPosition][1], BusinessInfo[b][bPosition][2], 0, -1, -1, 40.0);
	}
}

stock AddBusinessSale(b, amount, playerid)
{
	if(!strcmp(BusinessInfo[b][bOwner], PlayerInfo[playerid][pUsername], true)) SendClientMessageEx(playerid, COLOR_WHITE, "The items were {00B30F}FREE{FFFFFF} because you are the owner of the business.");
	else
	{
	    new string[128];
		GivePlayerCash(playerid, -amount);
	    if(strcmp(BusinessInfo[b][bOwner], "Government", true)) AddVaultMoney(2, amount);
		else AddBusinessEarnings(b, amount);
		format(string, sizeof(string), "You have purchased an item at %s for $%d.", BusinessInfo[b][bName], amount);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
}

stock AddBusinessEarnings(b, amount)
{
	if(BusinessInfo[b][bExistant] == 0) return 0;

	new string[128];
	BusinessInfo[b][bEarnings] += amount;
	format(string, sizeof(string), "UPDATE `businesses` SET `Earnings` = '%d' WHERE `Id` = '%d'", BusinessInfo[b][bEarnings], b);
	mysql_tqueryof(string, THREAD_NO_RESULT, INVALID_PLAYER_ID, mConnectionHandle);
	format(string, sizeof(string), "A sale was made at your business, you have earned $%d and your business earnings are now $%d.", amount, BusinessInfo[b][bEarnings]);
	foreach (new i: Player)
	{
		if(!strcmp(BusinessInfo[b][bOwner], PlayerInfo[i][pUsername], true))
		{
			SendClientMessageEx(i, COLOR_WHITE, string);
			SendClientMessageEx(i, COLOR_WHITE, "You can collect your business earnings by using the command /business when near your business.");
			break;
		}
	}
	return 1;
}

public HideLoadingTextdraws(playerid)
{
	if(GetPVarInt(playerid, "S0beitCheck") == 0)
	{
  		SetPVarInt(playerid, "S0beitCheck", 1);
		new Float:x, Float:y, Float:z;
		GetPlayerCameraFrontVector(playerid, x, y, z);
	 	#pragma unused x
	  	#pragma unused y
	   	if(z < -0.8)
	   	{
	   	    new string[128];
	   	    if(!AreAnyAdministratorsOnline())
	   	    {
				format(string, sizeof(string), "{FF6347}AdmWarning:{FFFF00} %s was just kicked from the server for having s0beit installed.", GetPlayerNameEx(playerid));
				AdminAlert(string, ALERT_ADMINS);
		   	    KickEx(playerid);
		   	    return 0;
	   	    }
	   	    else
	   	    {
				format(string, sizeof(string), "{FF6347}AdmWarning:{FFFF00} %s has joined the server with the s0beit modification.", GetPlayerNameEx(playerid));
				AdminAlert(string, ALERT_ADMINS);
  				SetPVarInt(playerid, "S0beitCheck", 2);
	   	    }
		}
	}
	TogglePlayerControllable(playerid, true);
	DeletePVar(playerid, "ActionRestriction");
	TextDrawHideForPlayer(playerid, LoadingObjectTextDraw);
	TextDrawHideForPlayer(playerid, LoadingObjectBox);
	return 1;
}

stock ApplyPlayerAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time)
{
    ApplyAnimation(playerid, animlib, "null", fDelta, loop, lockx, locky, freeze, time, 1);
    return ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, 1);
}

forward KickPlayer(playerid); public KickPlayer(playerid) Kick(playerid);
stock KickEx(playerid) return SetTimerEx("KickPlayer", 150, 0, "d", playerid);

stock AntiDeAMX()
{
    new b;
    #emit load.pri b
    #emit stor.pri b
}


stock IsNumeric(const string[])
{
	for (new i = 0, j = strlen(string); i < j; i++) {
		if(string[i] > '9' || string[i] < '0') return false;
	}
	return true;
}

stock GetPlayerSpeed(playerid, bool:kmh) // by misco
{
    new Float:Vx,Float:Vy,Float:Vz,Float:rtn;
    if(IsPlayerInAnyVehicle(playerid)) GetVehicleVelocity(GetPlayerVehicleID(playerid),Vx,Vy,Vz); else GetPlayerVelocity(playerid,Vx,Vy,Vz);
    rtn = floatsqroot(floatabs(floatpower(Vx + Vy + Vz,2)));
    return kmh?floatround(rtn * 100 * 1.61):floatround(rtn * 100);
}

stock GetPlayerNameEx(playerid)
{
	new pName[MAX_PLAYER_NAME];
	if(GetPVarType(playerid, "AdminDuty") == 1)
	{
		format(pName, sizeof(pName), PlayerInfo[playerid][pAdminName]);
		return pName;
	}
	strmid(pName, PlayerInfo[playerid][pUsername], 0, MAX_PLAYER_NAME);
	char_replace(pName, '_', ' ');
	return pName;
}

stock GetClosestCar(playerid)
{
	new
		Float: fVehiclePos[3];
	for(new i = 0; i < MAX_VEHICLES; i++)
	{
		if(GetVehicleModel(i) == 0) continue;
		GetVehiclePos(i, fVehiclePos[0], fVehiclePos[1], fVehiclePos[2]);
		if(IsPlayerInRangeOfPoint(playerid, 5.0, fVehiclePos[0], fVehiclePos[1], fVehiclePos[2])) {
		    return i;
		}
	}
	return INVALID_VEHICLE_ID;
}

stock SendHitmanMessage(color, string[])
{
	foreach(Player, i)
	{
		if(PlayerInfo[i][pHitman] > 0) SendClientMessageEx(i, color, string);
	}
	return 1;
}

/*stock IsAdmin(playerid, level)
{
	return PlayerInfo[playerid][pAdminLevel] >= level;
}*/

stock IsAdmin(playerid, level)
{
	if(PlayerInfo[playerid][pAdminLevel] == ADMIN_LEVEL_SIX) return true;
	else if(PlayerInfo[playerid][pAdminLevel] >= level)
	{
	    if(GetPVarType(playerid, "AdminDuty") == 1 || level == ADMIN_LEVEL_ONE) return true;
	    else return false;
	}
	else return false;
}

stock SetPlayerToTeamColor(playerid)
{
	if(PlayerInfo[playerid][pJailTime] > 0 && PlayerInfo[playerid][pOocJail] == 1) SetPlayerColor(playerid, 0x9C791200);
	else if(PlayerInfo[playerid][pJailTime] > 0) SetPlayerColor(playerid, 0xFF800000);
	else if(IsACop(playerid) && PlayerInfo[playerid][pDuty] == 1) SetPlayerColor(playerid, TEAM_COLOR_LSPD);
	else if(IsAGov(playerid) && PlayerInfo[playerid][pDuty] == 1) SetPlayerColor(playerid, TEAM_COLOR_GOV);
	else if(IsAMedic(playerid) && PlayerInfo[playerid][pDuty] == 1) SetPlayerColor(playerid, TEAM_COLOR_LSFD);
	else if(IsANews(playerid) && PlayerInfo[playerid][pDuty] == 1) SetPlayerColor(playerid, TEAM_COLOR_NEWS);
	else if(PlayerInfo[playerid][pJob] == 5 && PlayerInfo[playerid][pDuty] == 1) SetPlayerColor(playerid, 0xF2FF0000);
	else SetPlayerColor(playerid, 0xFFFFFF00);
}

stock AddPhoneNumber(number)
{
    if(fexist("numbers_used.txt") && IsNumberAvailable(number))
    {
		new File:f = fopen("numbers_used.txt", io_append), buffer[10];
		format(buffer, sizeof(buffer), "%d\r\n", number);
		fwrite(f, buffer);
		fclose(f);
		printf("[Phone]: %d was added to the database.", number);
    }
}

stock IsNumberAvailable(number)
{
	if(fexist("numbers_used.txt"))
    {
		new File:f = fopen("numbers_used.txt", io_read), buffer[8];
        while(fread(f, buffer))
        {
			if(strval(buffer) == number) return false;
		}
		fclose(f);
	}
    return true;
}

stock DeletePhoneNumber(number)
{
	if(!IsNumberAvailable(number))
	{
	    new
			num[8], buffer[10];
		format(num, sizeof(num), "%d", number);
  		new File:f = fopen("numbers_used.txt", io_read), idx = 1;
	    while(fread(f, buffer))
	    {
	        printf("%s", buffer);
	        if(!strcmp(buffer, num, true, strlen(num)))
	        {
				printf("%d was removed from the phone database.", number);
	            fdeleteline("numbers_used.txt", idx);
	            break;
	        }
	        idx++;
	    }
	    fclose(f);
	}
}

stock IsACop(playerid)
{
	return (FactionInfo[PlayerInfo[playerid][pFaction]][fType] == FACTION_TYPE_LEO);

}

stock IsAGov(playerid)
{
	return (FactionInfo[PlayerInfo[playerid][pFaction]][fType] == FACTION_TYPE_GOV);
}

stock IsAMedic(playerid)
{
	return (FactionInfo[PlayerInfo[playerid][pFaction]][fType] == FACTION_TYPE_MEDIC);
}

stock IsANews(playerid)
{
	return (FactionInfo[PlayerInfo[playerid][pFaction]][fType] == FACTION_TYPE_NEWS);
}

stock IsALegal(playerid)
{
    return (IsACop(playerid) || IsAGov(playerid) || IsAMedic(playerid) || IsANews(playerid));
}

stock IsAnIllegal(playerid)
{
	return (FactionInfo[PlayerInfo[playerid][pFaction]][fType] == FACTION_TYPE_ILLEGAL);
}

stock SendDepartmentMessage(string[])
{
 	foreach(new i: Player)
	{
		if(IsACop(i) || IsAGov(i) || IsAMedic(i)) SendClientMessageEx(i, RADIO_DEPT, string);
	}
	return 1;
}

stock fdeleteline(filename[], line)
{
	new count, string[256], File:file, File:temp;

	file= fopen(filename, io_read);
	temp = fopen("tmpfile.tmp", io_write);

	while (fread(file, string))
		if(++count != line)
      		fwrite(temp, string);

	fclose(file);
	fclose(temp);

	file= fopen(filename, io_write);
	temp = fopen("tmpfile.tmp", io_read);

	while (fread(temp, string))
		fwrite(file, string);

	fclose(file);
	fclose(temp);
	fremove("tmpfile.tmp");
}

stock LogEx(playerid, type, issuerid, reason[])
{
	if(type == LOG_TYPE_KICK) SQLLog(PlayerInfo[playerid][pUsername], "Kick", PlayerInfo[issuerid][pUsername], reason);
	else if(type == LOG_TYPE_JAIL) SQLLog(PlayerInfo[playerid][pUsername], "Jail", PlayerInfo[issuerid][pUsername], reason);
    else if(type == LOG_TYPE_BAN) SQLLog(PlayerInfo[playerid][pUsername], "Ban", PlayerInfo[issuerid][pUsername], reason);
    else if(type == LOG_TYPE_PERMABAN) SQLLog(PlayerInfo[playerid][pUsername], "Permanent Ban", PlayerInfo[issuerid][pUsername], reason);
    else if(type == LOG_TYPE_NAMECHANGE) SQLLog(PlayerInfo[playerid][pUsername], "Name Change", PlayerInfo[issuerid][pUsername], reason);
	else return 0;
	return 1;
}

stock SQLLog(name[], type[], iname[], reason[])
{
	new szQuery[256], i_dateTime[2][3];

	gettime(i_dateTime[0][0], i_dateTime[0][1], i_dateTime[0][2]);
	getdate(i_dateTime[1][0], i_dateTime[1][1], i_dateTime[1][2]);

	format(szQuery, sizeof(szQuery), "INSERT INTO `logs` (`Username`, `Date`, `Type`, `Issuer`, `Reason`) VALUES ('%s', '%i/%i/%i - %i:%i:%i', '%s', '%s', '%s' )", name, i_dateTime[1][0], i_dateTime[1][1], i_dateTime[1][2], i_dateTime[0][0], i_dateTime[0][1], i_dateTime[0][2], type, iname, reason);

	return mysql_tqueryof(szQuery, THREAD_NO_RESULT, INVALID_PLAYER_ID, mConnectionHandle);
}

stock Log(sz_fileName[], sz_input[])
{

	new sz_logEntry[256], i_dateTime[2][3], File: fileHandle = fopen(sz_fileName, io_append);

	gettime(i_dateTime[0][0], i_dateTime[0][1], i_dateTime[0][2]);
	getdate(i_dateTime[1][0], i_dateTime[1][1], i_dateTime[1][2]);

	format(sz_logEntry, sizeof(sz_logEntry), "[%i/%i/%i - %i:%i:%i] %s\r\n", i_dateTime[1][0], i_dateTime[1][1], i_dateTime[1][2], i_dateTime[0][0], i_dateTime[0][1], i_dateTime[0][2], sz_input);
	fwrite(fileHandle, sz_logEntry);
	return fclose(fileHandle);
}

stock char_replace(string[], oldchar, newchar)
{
	for(new i = 0; i < strlen(string); i++)
	{
		if(string[i] == oldchar)
		{
		    string[i] = newchar;
		}
	}
}

public ShowPlayerDialogEx(playerid, dialogid, style, caption[], info[], button1[], button2[])
{
    CurrentDialog[playerid] = dialogid;
	return ShowPlayerDialog(playerid, dialogid, style, caption, info, button1, button2);
}

stock convertNumber(iValue, iDelim[2] = ".", szNum[15] = "", iSize = sizeof(szNum)) {
    format(szNum, iSize, "%d", iValue < 0 ? -iValue : iValue);

    for(new i = strlen(szNum) - 3; i > 0; i -= 3) {
        strins(szNum, iDelim, i, iSize);
    }
    if(iValue < 0) {
        strins(szNum, "-", 0, iSize);
    }
    return szNum;
}

stock GetPlayerIpAddress(playerid)
{
	new Ip[17];
	GetPlayerIp(playerid, Ip, 16);
	return Ip;
}

stock GetPlayerZone(playerid)
{
	new
	    zoneName[28];
    GetPlayer3DZone(playerid, zoneName, 28);
    return zoneName;
}

stock GetBanType(type)
{
	new banType[11];
	switch (type)
	{
	    case BAN_TEMPORARY: { banType = "Temporary"; }
	    case BAN_PERMANENT: { banType = "Permanent"; }
	    default: { banType = "Undefined"; }
	}
	return banType;
}

stock IsPlayerConnectedEx(playerid)
{
	return IsPlayerConnected(playerid) && playerid != INVALID_PLAYER_ID;
}

encode_tires(tire1, tire2, tire3, tire4) return tire1 | (tire2 << 1) | (tire3 << 2) | (tire4 << 3);
encode_panels(flp, frp, rlp, rrp, windshield, front_bumper, rear_bumper)
{
    return flp | (frp << 4) | (rlp << 8) | (rrp << 12) | (windshield << 16) | (front_bumper << 20) | (rear_bumper << 24);
}
encode_doors(bonnet, boot, driver_door, passenger_door, behind_driver_door, behind_passenger_door)
{
    #pragma unused behind_driver_door
    #pragma unused behind_passenger_door
    return bonnet | (boot << 8) | (driver_door << 16) | (passenger_door << 24);
}
encode_lights(light1, light2, light3, light4)
{
    return light1 | (light2 << 1) | (light3 << 2) | (light4 << 3);
}

stock gettimestamp (timestamp, _form=0)
{
    /*
		~ author: http://forum.sa-mp.com/showpost.php?p=334797&postcount=471
        ~ convert a Timestamp to a Date.
        ~ 10.07.2009

        date( 1247182451 )  will print >> 09.07.2009-23:34:11
        date( 1247182451, 1) will print >> 09/07/2009, 23:34:11
        date( 1247182451, 2) will print >> July 09, 2009, 23:34:11
        date( 1247182451, 3) will print >> 9 Jul 2009, 23:34
    */

    new
        year=1970, day=0, month=0, hour=0, mins=0, sec=0,
		days_of_month[12] = { 31,28,31,30,31,30,31,31,30,31,30,31 },
    	names_of_month[12][10] = {"January","February","March","April","May","June","July","August","September","October","November","December"},
    	returnstring[32];

    while(timestamp>31622400){
        timestamp -= 31536000;
        if( ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0) ) timestamp -= 86400;
        year++;
    }

    if( ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0) )
        days_of_month[1] = 29;
    else
        days_of_month[1] = 28;


    while(timestamp>86400){
        timestamp -= 86400, day++;
        if(day==days_of_month[month]) day=0, month++;
    }

    while(timestamp>60){
        timestamp -= 60, mins++;
        if( mins == 60) mins=0, hour++;
    }

    sec=timestamp;

    switch( _form ){
        case 1: format(returnstring, 31, "%02d/%02d/%d %02d:%02d:%02d", day+1, month+1, year, hour, mins, sec);
        case 2: format(returnstring, 31, "%s %02d, %d, %02d:%02d:%02d", names_of_month[month],day+1,year, hour, mins, sec);
        case 3: format(returnstring, 31, "%d %c%c%c %d, %02d:%02d", day+1,names_of_month[month][0],names_of_month[month][1],names_of_month[month][2], year,hour,mins);

        default: format(returnstring, 31, "%02d.%02d.%d-%02d:%02d:%02d", day+1, month+1, year, hour, mins, sec);
    }

    return returnstring;
}

public OnPlayerScreenFade(playerid, color, speed)
{
	return 1;
}

public OnPlayerScreenColorFade(playerid, color, speed)
{
	return 1;
}

public OnPlayerFadeFlashed(playerid, color, speed)
{
	return 1;
}
