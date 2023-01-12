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
			|     Copyright � 2015, Imperious Roleplay	       |
			|__________________________________________________|
*/
//------------------------------------------------------------------------------
// INCLUDE
//------------------------------------------------------------------------------
#include <a_samp>
#include <streamer>
#include <foreach>
//------------------------------------------------------------------------------
// Removed Objects
//------------------------------------------------------------------------------
stock RemoveObjects(playerid)
{
	RemoveBuildingForPlayer(playerid, 3366, 276.6563, 2023.7578, 16.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 3366, 276.6563, 1989.5469, 16.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 3366, 276.6563, 1955.7656, 16.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 3267, 188.2422, 2081.6484, 22.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 3277, 188.2422, 2081.6484, 22.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 16093, 211.6484, 1810.1563, 20.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 16638, 211.7266, 1809.1875, 18.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, 347.1953, 1799.2656, 18.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, 342.9375, 1796.2891, 18.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 16095, 279.1328, 1829.7813, 16.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 16094, 191.1406, 1870.0391, 21.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 16096, 120.5078, 1934.0313, 19.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 16671, 193.9531, 2051.7969, 20.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 3268, 276.6563, 2023.7578, 16.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 3268, 276.6563, 1989.5469, 16.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 3268, 276.6563, 1955.7656, 16.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 16668, 357.9375, 2049.4219, 16.8438, 0.25);
	return 1;
}

stock CreateObjects()
{
	/* CHURCH INTERIOR */
	CreateDynamicObject(9931,1947.54003906,-368.51269531,1108.01086426,0.00000000,0.00000000,90.00000000); //object(church_sfe) (1)
	CreateDynamicObject(3976,1970.65722656,-341.23883057,1100.22949219,0.00000000,0.00000000,0.00000000); //object(policest02_lan) (1)
	CreateDynamicObject(9931,1980.55761719,-368.51562500,1108.01086426,0.00000000,0.00000000,90.00000000); //object(church_sfe) (2)
	CreateDynamicObject(3976,1962.70117188,-400.46679688,1109.52941895,0.00000000,0.00000000,90.00000000); //object(policest02_lan) (2)
	CreateDynamicObject(11472,1964.78710938,-372.02050781,1089.22351074,0.00000000,0.00000000,0.00000000); //object(des_swtstairs1) (1)
	CreateDynamicObject(11472,1963.28967285,-372.02139282,1089.22351074,0.00000000,0.00000000,0.00000000); //object(des_swtstairs1) (2)
	CreateDynamicObject(11472,1964.04479980,-372.98049927,1089.46386719,0.00000000,0.00000000,0.00000000); //object(des_swtstairs1) (3)
	CreateDynamicObject(2896,1959.29248047,-370.91723633,1093.34313965,0.00000000,0.00000000,90.00000000); //object(casket_law) (1)
	CreateDynamicObject(11472,1962.66918945,-373.82989502,1087.66955566,90.00000000,180.00000000,270.00000000); //object(des_swtstairs1) (4)
	CreateDynamicObject(11472,1965.41259766,-373.81991577,1087.66992188,90.00000000,180.00000000,90.00000000); //object(des_swtstairs1) (5)
	CreateDynamicObject(970,1970.61437988,-368.20404053,1093.28039551,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (1)
	CreateDynamicObject(970,1968.51074219,-368.20703125,1093.28039551,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (2)
	CreateDynamicObject(970,1957.52185059,-368.25833130,1093.28039551,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (3)
	CreateDynamicObject(970,1959.61914062,-368.25585938,1093.28039551,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (4)
	CreateDynamicObject(6959,1963.97839355,-368.12149048,1072.75439453,90.00000000,0.00000000,0.25000000); //object(vegasnbball1) (2)
	CreateDynamicObject(2960,1964.05883789,-348.98986816,1101.36645508,0.00000000,90.00000000,89.99450684); //object(kmb_beam) (1)
	CreateDynamicObject(2960,1963.98291016,-349.00000000,1101.70666504,90.00000000,0.00000000,179.99450684); //object(kmb_beam) (2)
	CreateDynamicObject(2960,1964.05871582,-348.99044800,1100.00585938,0.00000000,90.00000000,90.00000000); //object(kmb_beam) (3)
	CreateDynamicObject(3872,1964.02685547,-346.40850830,1102.33020020,0.00000000,155.25000000,90.27026367); //object(ws_floodbeams) (1)
	CreateDynamicObject(1667,1962.98828125,-370.41271973,1093.62292480,0.00000000,0.00000000,0.00000000); //object(propwineglass1) (1)
	CreateDynamicObject(1664,1962.83520508,-370.42520142,1093.70104980,0.00000000,0.00000000,0.00000000); //object(propwinebotl2) (1)
	CreateDynamicObject(2868,1965.95605469,-370.30142212,1093.53430176,0.00000000,0.00000000,0.00000000); //object(gb_ornament03) (1)
	CreateDynamicObject(2869,1964.02185059,-373.78527832,1093.66992188,0.00000000,0.00000000,323.75000000); //object(gb_ornament04) (1)
	CreateDynamicObject(2870,1965.26269531,-373.64062500,1093.66992188,0.00000000,0.00000000,350.03002930); //object(gb_ornament05) (1)
	CreateDynamicObject(2270,1965.47998047,-352.47622681,1093.48364258,0.00000000,0.00000000,270.00000000); //object(frame_wood_6) (1)
	CreateDynamicObject(2257,1964.05615234,-373.94995117,1095.86132812,0.00000000,0.00000000,180.00000000); //object(frame_clip_4) (1)
	CreateDynamicObject(2271,1962.60437012,-352.58059692,1093.48803711,0.00000000,0.00000000,90.00000000); //object(frame_wood_1) (1)
	CreateDynamicObject(2357,1964.05090332,-370.68905640,1093.12402344,0.00000000,0.00000000,0.00000000); //object(dunc_dinning) (1)
	CreateDynamicObject(2808,1957.51367188,-364.26171875,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (1)
	CreateDynamicObject(2808,1959.68164062,-364.26171875,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (2)
	CreateDynamicObject(2808,1970.61328125,-364.26171875,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (3)
	CreateDynamicObject(2808,1968.44238281,-364.26171875,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (4)
	CreateDynamicObject(2808,1961.85546875,-364.26171875,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (5)
	CreateDynamicObject(2808,1966.27246094,-364.26171875,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (6)
	CreateDynamicObject(2868,1962.14697266,-370.30624390,1093.53430176,0.00000000,0.00000000,0.00000000); //object(gb_ornament03) (4)
	CreateDynamicObject(948,1966.09277344,-374.17285156,1092.72888184,0.00000000,0.00000000,0.00000000); //object(plant_pot_10) (1)
	CreateDynamicObject(948,1961.96313477,-374.22888184,1092.72888184,0.00000000,0.00000000,0.00000000); //object(plant_pot_10) (2)
	CreateDynamicObject(2894,1963.95080566,-370.94277954,1093.53430176,0.00000000,0.00000000,0.00000000); //object(kmb_rhymesbook) (1)
	CreateDynamicObject(3462,1959.30407715,-374.06838989,1094.24255371,0.00000000,0.00000000,270.00000000); //object(csrangel_lvs) (1)
	CreateDynamicObject(3462,1968.78125000,-374.06835938,1094.24255371,0.00000000,0.00000000,270.00000000); //object(csrangel_lvs) (2)
	CreateDynamicObject(949,1956.02258301,-353.46194458,1095.83190918,0.00000000,0.00000000,0.00000000); //object(plant_pot_4) (1)
	CreateDynamicObject(2946,1965.59985352,-349.21301270,1091.94543457,0.00000000,0.00000000,90.00000000); //object(cr_door_03) (2)
	CreateDynamicObject(2946,1962.47033691,-349.19955444,1091.94543457,0.00000000,0.00000000,270.00000000); //object(cr_door_03) (3)
	CreateDynamicObject(2808,1970.60681152,-360.67248535,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (6)
	CreateDynamicObject(2808,1968.43054199,-360.67248535,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (6)
	CreateDynamicObject(2808,1966.25378418,-360.67248535,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (6)
	CreateDynamicObject(2808,1957.52233887,-360.67248535,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (6)
	CreateDynamicObject(2808,1959.69580078,-360.67248535,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (6)
	CreateDynamicObject(2808,1961.86865234,-360.67248535,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (6)
	CreateDynamicObject(2808,1957.51660156,-357.18194580,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (6)
	CreateDynamicObject(2808,1959.69250488,-357.18194580,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (6)
	CreateDynamicObject(2808,1961.86779785,-357.18194580,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (6)
	CreateDynamicObject(2808,1970.61279297,-357.18194580,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (6)
	CreateDynamicObject(2808,1968.43701172,-357.18194580,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (6)
	CreateDynamicObject(2808,1966.26782227,-357.18194580,1092.59191895,0.00000000,0.00000000,179.99450684); //object(cj_pizza_chair4) (6)
	CreateDynamicObject(14705,1962.68139648,-373.67498779,1093.91894531,0.00000000,0.00000000,0.00000000); //object(int2vase) (1)
	CreateDynamicObject(14410,1968.61401367,-349.16000366,1092.01757812,0.00000000,0.00000000,270.00000000); //object(carter-stairs03) (1)
	CreateDynamicObject(11472,1971.98046875,-351.97091675,1092.19567871,0.00000000,0.00000000,90.00000000); //object(des_swtstairs1) (6)
	CreateDynamicObject(11472,1971.98046875,-353.19616699,1092.19567871,0.00000000,0.00000000,90.00000000); //object(des_swtstairs1) (7)
	CreateDynamicObject(14410,1959.47412109,-349.41287231,1092.01660156,0.00000000,0.00000000,90.00000000); //object(carter-stairs03) (2)
	CreateDynamicObject(11472,1956.10046387,-351.96487427,1092.19567871,0.00000000,0.00000000,270.00000000); //object(des_swtstairs1) (8)
	CreateDynamicObject(11472,1956.10046387,-353.19616699,1092.19567871,0.00000000,0.00000000,270.00000000); //object(des_swtstairs1) (9)
	CreateDynamicObject(11472,1965.10974121,-347.94531250,1095.44091797,0.00000000,90.00000000,180.00000000); //object(des_swtstairs1) (10)
	CreateDynamicObject(11472,1962.98315430,-347.94104004,1095.44018555,0.00000000,270.00000000,179.99450684); //object(des_swtstairs1) (11)
	CreateDynamicObject(1698,1962.46606445,-352.53399658,1095.31420898,0.00000000,0.00000000,270.27026367); //object(esc_step8) (1)
	CreateDynamicObject(1698,1962.87316895,-352.53399658,1095.53918457,0.00000000,0.00000000,270.26916504); //object(esc_step8) (2)
	CreateDynamicObject(1698,1963.24682617,-352.53399658,1095.76416016,0.00000000,0.00000000,270.26916504); //object(esc_step8) (3)
	CreateDynamicObject(1698,1965.60021973,-352.53399658,1095.31420898,0.00000000,0.00000000,90.00000000); //object(esc_step8) (4)
	CreateDynamicObject(1698,1965.20434570,-352.53399658,1095.53918457,0.00000000,0.00000000,90.00000000); //object(esc_step8) (5)
	CreateDynamicObject(1698,1964.72375488,-352.53399658,1095.76416016,0.00000000,0.00000000,270.26916504); //object(esc_step8) (6)
	CreateDynamicObject(970,1964.05688477,-353.88497925,1096.74243164,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (4)
	CreateDynamicObject(970,1959.94470215,-353.88497925,1095.74719238,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (4)
	CreateDynamicObject(970,1955.77246094,-353.88589478,1095.74719238,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (4)
	CreateDynamicObject(970,1968.17297363,-353.88497925,1095.74719238,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (4)
	CreateDynamicObject(970,1972.25000000,-353.88589478,1095.74719238,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (4)
	CreateDynamicObject(970,1959.97607422,-351.29064941,1095.74719238,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (4)
	CreateDynamicObject(970,1968.10302734,-351.29064941,1095.74719238,0.00000000,0.00000000,0.00000000); //object(fencesmallb) (4)
	CreateDynamicObject(970,1965.96203613,-349.21618652,1096.74169922,0.00000000,0.00000000,90.00000000); //object(fencesmallb) (4)
	CreateDynamicObject(970,1962.13757324,-349.21618652,1096.74243164,0.00000000,0.00000000,90.00000000); //object(fencesmallb) (4)
	CreateDynamicObject(2887,1964.04821777,-349.34906006,1094.78955078,90.00000000,0.00000000,0.00000000); //object(a51_spotbulb) (1)
	CreateDynamicObject(949,1971.95068359,-353.46038818,1095.83190918,0.00000000,0.00000000,0.00000000); //object(plant_pot_4) (2)
	CreateDynamicObject(948,1965.68554688,-352.45767212,1091.94543457,0.00000000,0.00000000,0.00000000); //object(plant_pot_10) (1)
	CreateDynamicObject(948,1962.38427734,-352.45767212,1091.94543457,0.00000000,0.00000000,0.00000000); //object(plant_pot_10) (1)
	CreateDynamicObject(1742,1955.84399414,-353.83831787,1091.94543457,0.00000000,0.00000000,0.00000000); //object(med_bookshelf) (1)
	CreateDynamicObject(1742,1957.28173828,-353.83831787,1091.94543457,0.00000000,0.00000000,0.00000000); //object(med_bookshelf) (2)
	CreateDynamicObject(1742,1958.71166992,-353.83831787,1091.94543457,0.00000000,0.00000000,0.00000000); //object(med_bookshelf) (3)
	CreateDynamicObject(1742,1960.15112305,-353.83831787,1091.94543457,0.00000000,0.00000000,0.00000000); //object(med_bookshelf) (4)
	CreateDynamicObject(1742,1971.77673340,-353.83831787,1091.94543457,0.00000000,0.00000000,0.00000000); //object(med_bookshelf) (5)
	CreateDynamicObject(1742,1970.34277344,-353.83831787,1091.94543457,0.00000000,0.00000000,0.00000000); //object(med_bookshelf) (6)
	CreateDynamicObject(1742,1968.90930176,-353.83831787,1091.94543457,0.00000000,0.00000000,0.00000000); //object(med_bookshelf) (7)
	CreateDynamicObject(1742,1967.47534180,-353.83831787,1091.94543457,0.00000000,0.00000000,0.00000000); //object(med_bookshelf) (8)
	CreateDynamicObject(949,1961.60729980,-354.34103394,1092.58166504,0.00000000,0.00000000,0.00000000); //object(plant_pot_4) (3)
	CreateDynamicObject(949,1966.46325684,-354.34805298,1092.58166504,0.00000000,0.00000000,0.00000000); //object(plant_pot_4) (4)
	CreateDynamicObject(1720,1970.09338379,-373.59497070,1092.72888184,0.00000000,0.00000000,180.00000000); //object(rest_chair) (1)
	CreateDynamicObject(1720,1970.91198730,-373.58316040,1092.72888184,0.00000000,0.00000000,179.99450684); //object(rest_chair) (2)
	CreateDynamicObject(741,1969.29675293,-369.22723389,1093.71252441,0.00000000,0.00000000,0.00000000); //object(pot_01) (1)
	CreateDynamicObject(3440,1969.29125977,-370.86264038,1091.08007812,0.00000000,0.00000000,0.00000000); //object(arptpillar01_lvs) (1)
	CreateDynamicObject(14455,1955.32812500,-348.54144287,1096.87585449,0.00000000,0.00000000,270.00000000); //object(gs_bookcase) (1)
	CreateDynamicObject(14455,1972.78356934,-352.90487671,1096.86743164,0.00000000,0.00000000,90.00000000); //object(gs_bookcase) (2)
	CreateDynamicObject(2842,1964.51916504,-365.60891724,1091.94543457,0.00000000,0.00000000,90.00000000); //object(gb_bedrug04) (1)
	CreateDynamicObject(2842,1964.51843262,-363.77880859,1091.94543457,0.00000000,0.00000000,90.00000000); //object(gb_bedrug04) (2)
	CreateDynamicObject(2842,1964.51867676,-361.94879150,1091.94543457,0.00000000,0.00000000,90.00000000); //object(gb_bedrug04) (3)
	CreateDynamicObject(2842,1964.52172852,-360.12713623,1091.94543457,0.00000000,0.00000000,90.00000000); //object(gb_bedrug04) (4)
	CreateDynamicObject(2842,1964.52636719,-358.30560303,1091.94543457,0.00000000,0.00000000,90.00000000); //object(gb_bedrug04) (5)
	CreateDynamicObject(2842,1964.52600098,-356.47940063,1091.94543457,0.00000000,0.00000000,90.00000000); //object(gb_bedrug04) (6)
	CreateDynamicObject(2842,1964.52343750,-354.64611816,1091.94543457,0.00000000,0.00000000,90.00000000); //object(gb_bedrug04) (7)
	CreateDynamicObject(2842,1964.52136230,-352.82815552,1091.94543457,0.00000000,0.00000000,90.00000000); //object(gb_bedrug04) (8)
	CreateDynamicObject(2842,1964.51867676,-350.99310303,1091.94543457,0.00000000,0.00000000,90.00000000); //object(gb_bedrug04) (9)
	CreateDynamicObject(2842,1964.52026367,-349.16046143,1091.94543457,0.00000000,0.00000000,90.00000000); //object(gb_bedrug04) (10)
	CreateDynamicObject(2833,1963.55749512,-369.65057373,1092.72888184,0.00000000,0.00000000,0.00000000); //object(gb_livingrug02) (1)
	CreateDynamicObject(2834,1968.81579590,-372.52481079,1092.72888184,0.00000000,0.00000000,0.00000000); //object(gb_livingrug03) (1)
	CreateDynamicObject(6959,1951.26586914,-360.22650146,1095.56030273,310.00000000,180.00000000,90.00000000); //object(vegasnbball1) (1)
	CreateDynamicObject(6959,1976.87695312,-356.75421143,1095.51965332,310.00000000,180.00000000,270.00000000); //object(vegasnbball1) (3)
	CreateDynamicObject(6959,1958.95715332,-378.23306274,1096.33813477,309.99572754,179.99450684,180.00000000); //object(vegasnbball1) (4)

	/* GAS STATION FIX */
	CreateDynamicObject(970,1942.49000000,-1766.66000000,12.90000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(970,1942.49000000,-1770.81000000,12.90000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(970,1942.49000000,-1774.95000000,12.90000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(970,1942.49000000,-1779.11000000,12.90000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(970,1940.77000000,-1766.66000000,12.90000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(970,1940.77000000,-1770.81000000,12.90000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(970,1940.77000000,-1774.95000000,12.90000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(970,1940.77000000,-1779.11000000,12.90000000,0.00000000,0.00000000,90.00000000); //
	CreateDynamicObject(19121,1941.63000000,-1781.03000000,13.16000000,0.00000000,0.00000000,0.00000000); //
	CreateDynamicObject(19121,1941.64000000,-1764.87000000,13.16000000,0.00000000,0.00000000,0.00000000); //

	// Post Office
	CreateDynamicObject(18030, -257.27, 10.48, 2000.00,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(3923, -145.74, 9.87, 2010.32,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(3906, -171.65, -0.48, 2042.98,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 3.50, 1998.31,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 3.50, 1999.22,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 3.50, 2000.11,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 3.50, 2001.02,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 2.67, 1998.31,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 1.84, 1998.31,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 2.67, 1999.22,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 1.84, 1999.22,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 2.67, 2000.11,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 1.84, 2000.11,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 2.67, 2001.02,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 1.84, 2001.02,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 3.50, 1998.31,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 2.67, 1998.31,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 1.85, 1998.31,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 3.50, 1999.22,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 2.67, 1999.22,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 1.85, 1999.22,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 3.50, 2000.11,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 2.67, 2000.11,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 1.85, 2000.11,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 3.50, 2001.02,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 2.67, 2001.02,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 1.85, 2001.02,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 8.51, 1998.31,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 8.54, 1998.31,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 9.34, 1998.31,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 10.17, 1998.31,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 11.00, 1998.31,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 9.37, 1998.31,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 10.20, 1998.31,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 11.03, 1998.31,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 8.51, 1999.22,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 9.34, 1999.22,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 10.17, 1999.22,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 11.00, 1999.22,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 8.54, 1999.22,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 9.37, 1999.22,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 10.20, 1999.22,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 11.03, 1999.22,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 8.51, 2000.11,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 9.34, 2000.11,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 10.17, 2000.11,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 11.00, 2000.11,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 11.03, 2000.11,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 10.20, 2000.11,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 9.37, 2000.11,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 8.54, 2000.11,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 8.51, 2001.02,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 9.34, 2001.02,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 10.17, 2001.02,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -244.20, 11.00, 2001.02,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 8.54, 2001.02,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 9.37, 2001.02,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 11.03, 2001.02,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2332, -241.14, 10.20, 2001.02,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1428, -242.75, 11.19, 1999.40,   8.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1428, -242.73, 1.12, 1999.40,   8.00, 0.00, 180.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(14869, -245.90, 2.58, 1998.44,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(14869, -245.89, -0.39, 1998.44,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2201, -246.15, 2.87, 1998.58,   0.00, 0.00, 180.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2201, -245.66, 2.35, 1998.58,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2201, -246.24, -0.15, 1998.58,   0.00, 0.00, 179.99, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2201, -245.73, -0.61, 1998.58,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2186, -278.63, -0.76, 1997.63,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2186, -278.63, 1.73, 1997.63,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1522, -263.07, -3.32, 1997.62,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(18051, -254.32, 28.39, 1999.13,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2602, -259.28, 24.42, 1998.16,   0.00, 0.00, 47.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2602, -257.79, 24.42, 1998.16,   0.00, 0.00, 47.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2602, -256.34, 24.42, 1998.16,   0.00, 0.00, 47.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2602, -254.85, 24.41, 1998.16,   0.00, 0.00, 47.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2602, -253.34, 24.43, 1998.16,   0.00, 0.00, 47.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2514, -254.04, 16.09, 1997.63,   0.00, 0.00, 180.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2414, -258.47, 15.68, 1997.63,   0.00, 0.00, 180.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2414, -256.47, 15.68, 1997.63,   0.00, 0.00, 179.99, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2515, -256.55, 15.75, 1998.80,   0.00, 0.00, 180.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2515, -257.55, 15.75, 1998.80,   0.00, 0.00, 179.99, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2515, -258.50, 15.75, 1998.80,   0.00, 0.00, 179.99, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2515, -259.44, 15.75, 1998.80,   0.00, 0.00, 179.99, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1649, -258.13, 15.28, 2000.26,   0.00, 0.00, 180.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(8169, -257.20, 15.25, 1999.74,   286.80, 90.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(18070, -256.48, 8.16, 1998.13,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2190, -254.43, 6.30, 1998.64,   0.00, 0.00, 200.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2190, -259.04, 6.81, 1998.64,   0.00, 0.00, 130.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2192, -253.80, 7.71, 1998.64,   0.00, 0.00, 60.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2201, -253.48, 8.59, 1998.64,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2201, -259.10, 8.51, 1998.64,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1514, -255.07, 6.51, 1998.75,   0.00, 0.00, 12.08, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1514, -257.97, 6.43, 1998.75,   0.00, 0.00, 348.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1806, -255.21, 8.02, 1997.64,   0.00, 0.00, 198.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1806, -257.56, 7.91, 1997.64,   0.00, 0.00, 170.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2186, -258.46, 14.37, 1997.63,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2186, -255.89, 14.30, 1997.63,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2010, -246.09, 22.26, 1997.63,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1368, -245.97, 19.11, 1998.26,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1368, -246.01, 14.85, 1998.26,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1368, -245.97, 10.42, 1998.26,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2644, -246.09, 16.87, 1998.04,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2644, -246.00, 12.53, 1998.04,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2855, -246.16, 16.79, 1998.46,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2852, -245.99, 12.54, 1998.46,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(14600, -268.54, 14.56, 1999.13,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(3969, -308.20, 21.78, 1998.52,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(14632, -263.45, 29.00, 1999.13,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(14632, -263.45, 32.96, 1999.13,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1998, -274.83, 7.89, 1997.63,   0.00, 0.00, 180.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1671, -276.00, 8.07, 1998.09,   0.00, 0.00, 38.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1663, -270.09, 8.26, 1998.09,   0.00, 0.00, 6.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1663, -266.24, 8.11, 1998.09,   0.00, 0.00, 348.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2968, -269.22, 6.84, 1998.73,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2173, -269.33, 7.08, 1997.63,   0.00, 0.00, 180.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2173, -265.68, 7.05, 1997.63,   0.00, 0.00, 179.99, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1220, -267.67, 7.85, 1997.98,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2186, -278.55, 9.68, 1997.63,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -274.47, 6.04, 1996.40,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19466, -240.69, 6.96, 1999.33,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19398, -260.33, 13.38, 1999.37,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19398, -252.66, 13.39, 1999.37,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -258.62, 15.17, 1996.40,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -258.39, 15.17, 1999.89,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -255.19, 15.17, 1999.89,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -254.37, 15.18, 1999.89,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -254.37, 15.18, 1996.40,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -257.57, 15.18, 1996.40,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19398, -264.34, 10.51, 1999.37,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -264.35, 13.42, 1999.38,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -269.08, 6.04, 1999.90,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -247.75, 23.16, 2002.88,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19398, -254.23, 18.22, 1999.37,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -247.75, 23.16, 1999.38,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -252.65, 10.89, 2002.15,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -260.23, 26.25, 1999.36,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -260.32, 10.53, 2002.87,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -264.35, 10.83, 2002.87,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -252.67, 10.18, 1999.22,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -274.38, 6.04, 1999.90,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -269.39, 6.04, 1996.40,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -264.35, 7.96, 1999.36,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -260.32, 10.18, 1999.37,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -260.32, 7.89, 1999.37,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -252.66, 7.60, 1999.22,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19398, -260.24, 19.85, 1999.37,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -252.71, 16.72, 1999.36,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -260.24, 16.64, 1999.37,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -255.90, 16.72, 2002.72,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -254.22, 18.22, 2002.88,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -252.70, 20.17, 2002.85,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19398, -252.72, 19.93, 1999.37,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -252.70, 25.85, 1999.36,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19371, -255.90, 16.72, 1999.22,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -260.25, 20.31, 2002.15,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19398, -264.29, 17.32, 1999.37,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -264.28, 23.75, 1999.37,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -264.28, 20.36, 2002.86,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -268.77, 15.37, 1999.36,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19398, -274.47, 15.37, 1999.37,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -280.86, 15.37, 1999.36,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -268.77, 15.37, 2002.86,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19463, -277.66, 15.37, 2002.86,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1523, -275.26, 15.34, 1997.61,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1502, -264.36, 11.30, 1997.61,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1502, -264.26, 16.57, 1997.61,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1502, -260.22, 19.10, 1997.61,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1502, -252.70, 19.18, 1997.61,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1502, -260.36, 14.17, 1997.61,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1502, -252.68, 14.18, 1997.61,   0.00, 0.00, 270.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19356, -258.38, 6.03, 2001.52,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19356, -255.20, 6.03, 2001.52,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19356, -254.36, 6.01, 2001.52,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(2614, -262.31, -2.97, 2001.32,   0.00, 0.00, 180.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(3802, -252.58, -2.00, 2001.33,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(3810, -272.06, -1.96, 2001.33,   0.00, 0.00, 90.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(1502, -253.48, 18.24, 1997.61,   0.00, 0.00, 180.00, .interiorid = 4, .streamdistance = 200);
	CreateDynamicObject(19466, -240.69, 4.72, 1999.33,   0.00, 0.00, 0.00, .interiorid = 4, .streamdistance = 200);

	return 1;
}
//------------------------------------------------------------------------------
// Callbacks
//------------------------------------------------------------------------------
public OnFilterScriptInit()
{
	foreach(new i: Player)
	{
	    RemoveObjects(i);
	}
	CreateObjects();
	return 1;
}
public OnPlayerConnect(playerid)
{
	RemoveObjects(playerid);
	return 1;
}

//------------------------------------------------------------------------------
// END OF SCRIPT
//------------------------------------------------------------------------------
