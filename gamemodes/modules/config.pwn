//------------------------------------------------------------------------------
// SERVER CONFIGURATION
//------------------------------------------------------------------------------
// For in-game use
#define         SERVER_NAME					"Fort Carson Roleplay"
#define         SERVER_VERSION				"FC:RP v23.05.23"
#define         SERVER_SITE					"www.google.com"

// For server.cfg
#define         SERVER_HOSTNAME				".:![~]        Fort Carson Roleplay        [~]!:."
#define         SERVER_GMTEXT				"Roleplay | Medium RP | English"
#define         SERVER_WEBURL				"www.discord.gg/MxBdj9GFze"
#define         SERVER_RCON					"tastycock"
#define         SERVER_PASSWORD				"0"
#define         SERVER_LANGUAGE				"English"
#define         SERVER_MAP					"Fort Carson"

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
	#define 	MYSQL_DATABASE  			"zanothervishn1"
#endif