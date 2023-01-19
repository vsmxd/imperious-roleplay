#define         SERVER_NAME					"          Los Santos Roleplay - Reborn!"
#define         SERVER_RCON					"tastycock"
#define         SERVER_PASSWORD				"0"
#define         SERVER_LANGUAGE				"English"
#define         SERVER_VERSION				"LSRP | RP/Roleplay/English"
#define         SERVER_MAP					"Los Santos"
#define         SERVER_SITE					"NONE"
// Comment out the below line when pushing to live server
#define 		IS_LOCAL_HOST               true

// MySQL configurations
#if IS_LOCAL_HOST == true
	#define 	MYSQL_HOST  				"127.0.0.1"
	#define 	MYSQL_USERNAME  			"root"
	#define 	MYSQL_PASSWORD  			""
	#define 	MYSQL_DATABASE  			"imrp"
#else
	#define 	MYSQL_HOST  				"127.0.0.1"
	#define 	MYSQL_USERNAME  			"anothervishn"
	#define 	MYSQL_PASSWORD  			"xtJwlOLD"
	#define 	MYSQL_DATABASE  			"zanothervishn0"
#endif