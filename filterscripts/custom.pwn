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

	//LSPD
	CreateDynamicObject(1616,240.28379822,107.48500061,1010.29998779,0.00000000,0.00000000,270.00000000,-1,10,-1,100.0); //object(nt_securecam1_01) (1)
	CreateDynamicObject(2058,262.23831177,107.09999847,1006.12506104,270.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(cj_gun_docs) (1)
	CreateDynamicObject(971,264.83126831,106.72861481,1004.59997559,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(subwaygate) (3)
	CreateDynamicObject(1491,222.17500305,119.45999908,1009.21502686,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(gen_doorint01) (1)
	CreateDynamicObject(1491,258.54998779,117.67968750,1007.82000732,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(gen_doorint01) (3)
	CreateDynamicObject(1491,260.73925781,117.67968750,1007.82000732,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(gen_doorint01) (4)
	CreateDynamicObject(2612,263.50000000,112.34960938,1005.50000000,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(police_nb2) (1)
	CreateDynamicObject(3857,233.04499817,124.00000000,1013.00000000,0.00000000,0.00000000,315.00000000,-1,10,-1,100.0); //object(ottosmash3) (1)
	CreateDynamicObject(3857,232.73730469,124.00000000,1013.00000000,0.00000000,0.00000000,135.00000000,-1,10,-1,100.0); //object(ottosmash3) (2)
	CreateDynamicObject(1491,225.05999756,115.94999695,1002.22998047,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(gen_doorint01) (2)
	CreateDynamicObject(1491,233.11000061,119.25000000,1002.22998047,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(gen_doorint01) (5)
	CreateDynamicObject(1491,236.80999756,119.25000000,1002.22998047,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(gen_doorint01) (6)
	CreateDynamicObject(3051,275.77499390,122.65599823,1004.97937012,0.00000000,0.00000000,46.00000000,-1,10,-1,100.0); //object(lift_dr) (1)
	CreateDynamicObject(3051,275.75000000,121.50000000,1004.97937012,0.00000000,0.00000000,45.00000000,-1,10,-1,100.0); //object(lift_dr) (2)
	CreateDynamicObject(1485,227.89999390,125.30000305,1010.21002197,50.00000000,10.00000000,2.00000000,-1,10,-1,100.0); //object(cj_ciggy) (1)
	CreateDynamicObject(1510,228.07321167,125.27845001,1010.15997314,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(dyn_ashtry) (1)
	CreateDynamicObject(2196,228.40014648,125.53178406,1010.13958740,0.00000000,0.00000000,29.77478027,-1,10,-1,100.0); //object(work_lamp1) (1)
	CreateDynamicObject(2063,262.95996094,107.40136719,1004.53997803,0.00000000,0.00000000,179.99450684,-1,10,-1,100.0); //object(cj_greenshelves) (1)
	CreateDynamicObject(2043,262.29138184,107.46166229,1004.09997559,0.00000000,0.00000000,294.36035156,-1,10,-1,100.0); //object(ammo_box_m4) (1)
	CreateDynamicObject(2044,262.99542236,107.55000305,1004.96002197,0.00000000,0.00000000,39.99572754,-1,10,-1,100.0); //object(cj_mp5k) (2)
	CreateDynamicObject(1672,262.62597656,107.59999847,1005.37500000,0.00000000,90.00000000,0.00000000,-1,10,-1,100.0); //object(gasgrenade) (1)
	CreateDynamicObject(1672,262.81585693,107.48020935,1005.41998291,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(gasgrenade) (2)
	CreateDynamicObject(14782,267.76998901,109.30000305,1004.63323975,0.00000000,0.00000000,270.00000000,-1,10,-1,100.0); //object(int3int_boxing30) (2)
	CreateDynamicObject(14782,260.79980469,108.75000000,1004.63323975,0.00000000,0.00000000,90.00000000,-1,10,-1,100.0); //object(int3int_boxing30) (3)
	CreateDynamicObject(2359,263.54296875,107.39648438,1005.53002930,0.00000000,0.00000000,183.89465332,-1,10,-1,100.0); //object(ammo_box_c5) (1)
	CreateDynamicObject(2038,263.47906494,107.32552338,1004.51000977,270.00000000,0.00000000,29.91000366,-1,10,-1,100.0); //object(ammo_box_s2) (1)
	CreateDynamicObject(2035,262.61035156,107.39941406,1004.50000000,0.00000000,0.00000000,19.99511719,-1,10,-1,100.0); //object(cj_m16) (1)
	CreateDynamicObject(2690,264.43099976,107.26506042,1003.97662354,0.00000000,0.00000000,312.13488770,-1,10,-1,100.0); //object(cj_fire_ext) (1)
	CreateDynamicObject(2058,262.98568726,107.09528351,1005.36926270,90.00000000,180.00549316,359.98352051,-1,10,-1,100.0); //object(cj_gun_docs) (1)
	CreateDynamicObject(11631,269.81250000,118.18945312,1004.86309814,0.00000000,0.00000000,270.00000000,-1,10,-1,100.0); //object(ranch_desk) (1)
	CreateDynamicObject(2356,269.14312744,117.66873169,1003.61718750,0.00000000,0.00000000,294.49548340,-1,10,-1,100.0); //object(police_off_chair) (1)
	CreateDynamicObject(2094,262.86523438,110.89941406,1003.60998535,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(swank_cabinet_4) (1)
	CreateDynamicObject(1886,267.73999023,107.50000000,1007.40002441,20.00000000,0.00000000,235.00000000,-1,10,-1,100.0); //object(shop_sec_cam) (1)
	CreateDynamicObject(1235,270.03616333,116.56486511,1004.12023926,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(wastebin) (1)
	CreateDynamicObject(2606,267.36914062,120.50683594,1004.59997559,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(cj_police_counter2) (1)
	CreateDynamicObject(2606,267.36914062,120.50683594,1005.04998779,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(cj_police_counter2) (2)
	CreateDynamicObject(1738,270.29000854,120.00000000,1004.27178955,0.00000000,0.00000000,269.27026367,-1,10,-1,100.0); //object(cj_radiator_old) (1)
	CreateDynamicObject(2180,265.50552368,120.27999878,1003.61718750,0.00000000,0.00000000,180.54052734,-1,10,-1,100.0); //object(med_office5_desk_3) (1)
	CreateDynamicObject(1788,265.60000610,120.50000000,1004.48681641,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(swank_video_1) (1)
	CreateDynamicObject(1782,265.59960938,120.50000000,1004.65002441,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(med_video_2) (1)
	CreateDynamicObject(2595,264.21002197,120.37789154,1004.77404785,0.00000000,0.00000000,314.65002441,-1,10,-1,100.0); //object(cj_shop_tv_video) (1)
	CreateDynamicObject(1785,265.59960938,120.50976562,1004.84997559,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(low_video_1) (1)
	CreateDynamicObject(1840,264.81204224,120.58029938,1004.41882324,0.00000000,0.00000000,105.60998535,-1,10,-1,100.0); //object(speaker_2) (1)
	CreateDynamicObject(1840,265.70001221,120.55999756,1004.96264648,0.00000000,0.00000000,75.00000000,-1,10,-1,100.0); //object(speaker_2) (2)
	CreateDynamicObject(2356,265.15481567,119.43829346,1003.61718750,0.00000000,0.00000000,34.19393921,-1,10,-1,100.0); //object(police_off_chair) (2)
	CreateDynamicObject(4100,246.51953125,119.39941406,1005.40002441,0.00000000,179.99450684,219.99023438,-1,10,-1,100.0); //object(meshfence1_lan) (1)
	CreateDynamicObject(2933,253.19921875,118.19921875,1005.79998779,0.00000000,0.00000000,90.00000000,-1,10,-1,100.0); //object(pol_comp_gate) (1)
	CreateDynamicObject(2933,239.60000610,110.48000336,1005.79998779,0.00000000,0.00000000,90.00000000,-1,10,-1,100.0); //object(pol_comp_gate) (2)
	CreateDynamicObject(2101,266.74893188,120.49598694,1005.28363037,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(med_hi_fi_3) (1)
	CreateDynamicObject(1886,264.25000000,116.55000305,1007.29998779,30.00000000,0.00000000,140.00000000,-1,10,-1,100.0); //object(shop_sec_cam) (2)
	CreateDynamicObject(2611,268.47473145,116.05200195,1005.25000000,0.00000000,0.00000000,180.00000000,-1,10,-1,100.0); //object(police_nb1) (1)
	CreateDynamicObject(1703,243.10000610,107.59999847,1002.21875000,0.00000000,0.00000000,180.00000000,-1,10,-1,100.0); //object(kb_couch02) (1)
	CreateDynamicObject(4100,232.84960938,128.50000000,1011.91998291,0.00000000,0.00000000,49.99877930,-1,10,-1,100.0); //object(meshfence1_lan) (4)
	CreateDynamicObject(2595,226.24514771,120.27544403,1011.28753662,0.00000000,0.00000000,77.72994995,-1,10,-1,100.0); //object(cj_shop_tv_video) (2)
	CreateDynamicObject(3934,1565.94946289,-1701.00000000,27.39999962,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(helipad01) (1)
	CreateDynamicObject(3934,1565.94921875,-1646.02929688,27.39999962,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); //object(helipad01) (2)
	CreateDynamicObject(2953,228.27796936,125.20470428,1010.14331055,0.00000000,0.00000000,143.45983887,-1,10,-1,100.0); //object(kmb_paper_code) (1)

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
	CreateDynamicObject(16230, 2721.68, -2473.94, 5000.00,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2713.22, -2458.81, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2722.83, -2458.81, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2732.46, -2458.81, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2742.08, -2458.81, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2743.41, -2463.45, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2743.41, -2473.08, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2743.41, -2482.69, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2742.08, -2487.59, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2732.46, -2487.59, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2722.83, -2487.59, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2713.22, -2487.59, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2705.32, -2482.69, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2705.32, -2473.07, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2705.32, -2463.45, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2741.75, -2464.98, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2738.56, -2460.21, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2735.36, -2464.98, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2732.16, -2460.21, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2728.95, -2464.98, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2725.74, -2460.21, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2722.56, -2464.98, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2719.30, -2460.21, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2716.16, -2464.98, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19431, 2713.77, -2464.98, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2713.02, -2462.41, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(14416, 2710.94, -2464.29, 4992.93,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19358, 2706.80, -2458.81, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19358, 2711.50, -2467.15, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19431, 2709.10, -2467.15, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19358, 2709.03, -2465.56, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19358, 2709.03, -2462.36, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2741.75, -2481.06, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2735.36, -2481.06, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2728.95, -2481.06, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2722.56, -2481.06, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2716.16, -2481.06, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19431, 2713.77, -2481.06, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2738.56, -2485.79, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2732.16, -2485.79, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2725.74, -2485.79, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2719.30, -2485.79, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2713.02, -2483.74, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(14416, 2710.99, -2482.39, 4992.93,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19358, 2711.49, -2479.00, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19431, 2709.10, -2479.00, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19358, 2709.03, -2480.61, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19358, 2709.03, -2483.82, 4994.39,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2706.71, -2479.00, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2706.71, -2467.15, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1492, 2705.92, -2479.00, 4992.66,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1492, 2705.92, -2467.12, 4992.66,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19377, 2704.30, -2483.08, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19377, 2704.31, -2472.59, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19377, 2704.31, -2462.09, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19377, 2717.76, -2460.89, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19377, 2727.39, -2460.89, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19377, 2736.76, -2460.89, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19377, 2746.38, -2460.89, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19454, 2710.87, -2475.74, 4996.06,   0.00, -90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19454, 2717.42, -2478.81, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19362, 2710.87, -2467.74, 4996.06,   0.00, -90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19435, 2710.87, -2470.12, 4996.06,   0.00, -90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19454, 2727.06, -2478.81, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19454, 2736.68, -2478.81, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19454, 2743.24, -2475.74, 4996.06,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19454, 2717.42, -2467.89, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19435, 2743.24, -2470.12, 4996.06,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19362, 2743.24, -2467.74, 4996.06,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19454, 2727.04, -2467.89, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19454, 2736.68, -2467.89, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19377, 2717.76, -2485.80, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19377, 2727.39, -2485.80, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19377, 2736.76, -2485.80, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19377, 2746.38, -2485.80, 4996.06,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2713.22, -2487.59, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2722.83, -2487.59, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2732.46, -2487.59, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2742.08, -2487.59, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2738.56, -2485.79, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2732.16, -2485.79, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2725.74, -2485.79, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2719.30, -2485.79, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2713.04, -2485.79, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2713.22, -2458.81, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2722.83, -2458.81, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2719.30, -2460.21, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2713.04, -2460.25, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2725.74, -2460.21, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2732.46, -2458.81, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2732.16, -2460.21, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2738.56, -2460.21, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2742.08, -2458.81, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2743.41, -2463.45, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2743.41, -2473.08, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2743.41, -2482.69, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2741.75, -2481.06, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2735.36, -2481.06, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2728.95, -2481.06, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2722.56, -2481.06, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2716.16, -2481.06, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19431, 2713.77, -2481.06, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19431, 2713.77, -2464.98, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2716.16, -2464.98, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2722.56, -2464.98, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2728.95, -2464.98, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2735.36, -2464.98, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2741.75, -2464.98, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2709.03, -2460.39, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2709.03, -2470.00, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2709.03, -2473.20, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2709.03, -2476.40, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2709.03, -2482.81, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2714.62, -2469.62, 4996.68,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2718.79, -2469.62, 4996.68,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2722.96, -2469.62, 4996.68,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2727.12, -2469.62, 4996.68,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2731.29, -2469.62, 4996.68,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2735.45, -2469.62, 4996.68,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2739.47, -2469.62, 4996.68,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2741.56, -2471.70, 4996.68,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2741.56, -2475.10, 4996.68,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2739.47, -2477.18, 4996.68,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2735.45, -2477.18, 4996.68,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2731.29, -2477.18, 4996.68,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2727.12, -2477.18, 4996.68,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2722.96, -2477.18, 4996.68,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2718.79, -2477.18, 4996.68,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2714.62, -2477.18, 4996.68,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2712.53, -2471.70, 4996.68,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(970, 2712.53, -2475.10, 4996.68,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2709.03, -2466.80, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19446, 2704.22, -2468.30, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19446, 2706.14, -2463.53, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19354, 2707.41, -2459.47, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19446, 2702.14, -2473.10, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19446, 2705.41, -2482.69, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19325, 2708.95, -2474.49, 4998.15,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(4100, 2709.05, -2477.65, 4998.52,   0.00, 0.00, 50.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2708.62, -2472.57, 4996.15,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2708.62, -2473.50, 4996.15,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2708.62, -2474.43, 4996.15,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2708.62, -2475.36, 4996.15,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2708.62, -2476.28, 4996.15,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2708.62, -2477.20, 4996.15,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1886, 2742.91, -2465.49, 4999.69,   10.00, 0.00, -45.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1886, 2742.92, -2480.55, 4996.02,   10.00, 0.00, -135.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1886, 2742.92, -2480.55, 4999.69,   10.00, 0.00, -135.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1886, 2742.91, -2465.49, 4996.02,   10.00, 0.00, -45.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1886, 2709.49, -2476.93, 4999.69,   10.00, 0.00, 49.36, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1886, 2709.43, -2471.14, 4999.69,   10.00, 0.00, 138.36, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1886, 2705.94, -2486.93, 4995.99,   10.00, 0.00, 133.30, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1886, 2705.32, -2474.85, 4996.05,   10.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1886, 2705.76, -2459.35, 4996.05,   10.00, 0.00, 45.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1368, 2713.59, -2477.60, 4996.83,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1368, 2719.83, -2477.60, 4996.83,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1368, 2726.07, -2477.60, 4996.83,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1368, 2732.35, -2477.60, 4996.83,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1368, 2738.47, -2477.60, 4996.83,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1368, 2738.47, -2469.26, 4996.83,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1368, 2732.35, -2469.26, 4996.83,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1368, 2726.07, -2469.26, 4996.83,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1368, 2719.83, -2469.26, 4996.83,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1368, 2713.59, -2469.26, 4996.83,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2606, 2705.15, -2468.21, 4998.93,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2606, 2703.19, -2468.21, 4998.49,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2606, 2703.19, -2468.21, 4998.05,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2606, 2705.15, -2468.21, 4997.61,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2606, 2703.19, -2468.21, 4998.93,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2606, 2705.15, -2468.21, 4998.49,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2606, 2705.15, -2468.22, 4998.05,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2606, 2703.19, -2468.21, 4997.61,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2190, 2708.81, -2472.72, 4997.20,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19273, 2708.42, -2474.31, 4997.12,   -90.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19273, 2708.42, -2475.29, 4997.12,   -90.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19446, 2708.72, -2483.01, 4997.88,   0.00, 0.00, 356.36, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19384, 2707.10, -2488.28, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2604, 2702.66, -2473.51, 4996.92,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2612, 2702.27, -2474.50, 4998.45,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2356, 2703.96, -2472.40, 4996.15,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2356, 2703.79, -2473.69, 4996.15,   0.00, 0.00, 135.37, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18092, 2703.62, -2468.89, 4996.62,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2190, 2705.96, -2469.06, 4997.10,   0.00, 0.00, 292.34, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2713.59, -2466.00, 4992.63,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2718.46, -2466.00, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2716.11, -2458.45, 4998.58,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2722.60, -2458.45, 4998.58,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2728.80, -2458.45, 4998.58,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2735.21, -2458.45, 4998.58,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2741.01, -2458.45, 4998.58,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2719.87, -2466.00, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2724.91, -2466.00, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2726.32, -2466.00, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2731.22, -2466.00, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2732.72, -2466.00, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2737.71, -2465.98, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2739.13, -2466.00, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2739.25, -2459.38, 4996.15,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2732.79, -2459.38, 4996.15,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2726.25, -2459.38, 4996.15,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2720.21, -2459.38, 4996.15,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2713.42, -2459.38, 4992.62,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2715.64, -2459.12, 4996.14,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2722.28, -2459.12, 4996.14,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2728.49, -2459.12, 4996.14,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2734.86, -2459.12, 4996.14,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2740.82, -2459.12, 4996.14,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2742.69, -2460.28, 4996.15,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2737.87, -2460.36, 4996.15,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2731.34, -2460.36, 4996.15,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2725.00, -2460.36, 4996.15,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2717.98, -2460.36, 4996.15,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2713.59, -2466.00, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2718.36, -2466.00, 4992.63,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2719.87, -2466.00, 4992.63,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2724.91, -2466.00, 4992.63,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2726.32, -2466.00, 4992.63,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2731.22, -2466.00, 4992.63,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2732.72, -2466.00, 4992.63,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2737.71, -2465.98, 4992.63,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2739.13, -2466.00, 4992.63,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2741.01, -2458.45, 4995.01,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2735.21, -2458.45, 4995.01,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2728.80, -2458.45, 4995.01,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2722.60, -2458.45, 4995.01,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2716.11, -2458.45, 4995.01,   10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2713.42, -2459.38, 4996.15,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2720.19, -2459.38, 4992.62,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2726.25, -2459.38, 4992.62,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2732.79, -2459.38, 4992.62,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2739.25, -2459.38, 4992.62,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2742.69, -2460.28, 4992.62,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2737.87, -2460.36, 4992.62,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2731.34, -2460.36, 4992.62,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2725.00, -2460.36, 4992.62,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2718.00, -2460.36, 4992.62,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2715.64, -2459.12, 4992.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2722.28, -2459.12, 4992.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2728.49, -2459.12, 4992.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2734.86, -2459.12, 4992.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2740.82, -2459.12, 4992.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19273, 2709.01, -2470.94, 4997.61,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19273, 2709.07, -2470.94, 4997.61,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19446, 2700.67, -2477.96, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(14596, 2703.32, -2494.67, 5001.04,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2703.59, -2487.59, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2713.68, -2484.63, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2718.74, -2487.01, 4996.15,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2716.68, -2487.27, 4996.14,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2716.30, -2487.94, 4998.58,   10.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2713.70, -2486.05, 4996.15,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2718.31, -2484.63, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2719.86, -2484.63, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2724.76, -2484.63, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2726.47, -2484.63, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2731.27, -2484.63, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2732.88, -2484.63, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2737.71, -2488.59, 4996.13,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2742.39, -2487.05, 4996.13,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2720.04, -2486.05, 4996.15,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2726.60, -2486.05, 4996.15,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2733.15, -2486.05, 4996.15,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2741.87, -2486.05, 4996.15,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2722.67, -2487.94, 4998.58,   10.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2729.41, -2487.94, 4998.58,   10.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2735.88, -2487.94, 4998.58,   10.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2743.77, -2483.88, 4998.58,   10.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2723.19, -2487.27, 4996.14,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2729.67, -2487.27, 4996.14,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2736.17, -2487.27, 4996.14,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2743.09, -2483.60, 4996.14,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2724.84, -2487.01, 4996.15,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2731.46, -2487.01, 4996.15,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2736.80, -2481.64, 4996.15,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2740.11, -2481.65, 4996.15,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2743.77, -2483.88, 4995.01,   10.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2735.88, -2487.94, 4995.01,   10.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2729.41, -2487.94, 4995.01,   10.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2722.67, -2487.94, 4995.01,   10.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1786, 2716.30, -2487.94, 4995.01,   10.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2743.09, -2483.60, 4992.60,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2741.87, -2486.05, 4992.60,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2742.25, -2487.05, 4992.60,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2739.55, -2481.65, 4992.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2737.73, -2488.58, 4992.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2732.88, -2484.63, 4992.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2733.15, -2486.05, 4992.60,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2736.17, -2487.27, 4992.60,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2736.72, -2481.64, 4992.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2731.27, -2484.63, 4992.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2726.47, -2484.63, 4992.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2726.60, -2486.05, 4992.60,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2729.67, -2487.27, 4992.60,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2731.46, -2487.01, 4992.60,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2724.90, -2484.63, 4992.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2719.86, -2484.63, 4992.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2720.04, -2486.05, 4992.60,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2723.19, -2487.27, 4992.60,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2724.84, -2487.01, 4992.60,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2718.31, -2484.63, 4992.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1800, 2713.68, -2484.63, 4992.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2527, 2713.70, -2486.05, 4992.60,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2089, 2716.68, -2487.27, 4992.60,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2525, 2718.74, -2487.01, 4992.60,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2705.81, -2483.57, 4999.56,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2705.81, -2473.09, 4999.56,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2705.81, -2462.59, 4999.56,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2715.43, -2462.59, 4999.56,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2725.02, -2462.59, 4999.56,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2734.64, -2462.59, 4999.56,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2744.25, -2462.59, 4999.56,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2715.43, -2473.09, 4999.56,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2725.02, -2473.09, 4999.56,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2734.64, -2473.09, 4999.56,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2744.25, -2473.09, 4999.56,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2715.43, -2483.57, 4999.56,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2725.02, -2483.57, 4999.56,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2734.64, -2483.57, 4999.56,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2710.96, -2484.37, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2714.49, -2453.05, 5001.97,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(3499, 2713.96, -2453.01, 5002.74,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2715.41, -2453.05, 5001.97,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2716.34, -2453.05, 5001.97,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2717.27, -2453.05, 5001.97,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2718.19, -2453.05, 5001.97,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2719.10, -2453.05, 5001.97,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(3499, 2720.84, -2453.01, 5002.74,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2720.02, -2453.05, 5001.97,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(3499, 2723.52, -2453.01, 5002.74,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19273, 2721.03, -2452.48, 5003.55,   0.00, 0.00, 161.37, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19273, 2721.31, -2453.32, 5003.55,   0.00, 0.00, 51.74, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(3498, 2718.80, -2453.02, 5004.71,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(984, 2717.57, -2453.03, 5005.59,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1702, 2714.17, -2450.44, 5001.97,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1702, 2714.63, -2447.96, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2011, 2714.14, -2447.89, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1702, 2723.14, -2448.41, 5001.97,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1702, 2720.69, -2447.93, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2011, 2723.22, -2447.88, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1536, 2717.16, -2447.42, 5001.95,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1536, 2720.17, -2447.39, 5001.95,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(3499, 2713.94, -2457.58, 5002.74,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2713.94, -2453.95, 5001.97,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2713.94, -2454.87, 5001.97,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2713.94, -2455.78, 5001.97,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2435, 2713.94, -2456.71, 5001.97,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2719.04, -2457.58, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2723.87, -2455.89, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2723.87, -2459.25, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(3499, 2723.40, -2457.56, 5002.74,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19431, 2723.87, -2453.49, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19431, 2723.87, -2461.65, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19325, 2713.96, -2455.18, 5004.61,   90.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1502, 2723.88, -2456.65, 5001.95,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1502, 2723.86, -2458.46, 5001.95,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(983, 2717.58, -2453.03, 5004.30,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2606, 2716.26, -2453.29, 5002.47,   -10.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2356, 2717.63, -2454.33, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2356, 2719.27, -2454.29, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2163, 2715.84, -2457.61, 5001.95,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1496, 2697.49, 5001.97, 5001.97,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2704.15, -2461.39, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2723.63, -2466.15, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2733.19, -2475.92, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2718.52, -2466.13, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2713.77, -2461.39, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2694.52, -2461.39, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2697.37, -2457.82, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2728.36, -2461.39, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2731.08, -2458.26, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2723.71, -2447.97, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2719.44, -2447.36, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2713.62, -2447.66, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2713.78, -2483.69, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2708.75, -2484.98, 5003.70,   0.00, 0.00, 314.13, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2707.03, -2488.29, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2718.97, -2450.41, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2718.97, -2460.02, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2708.47, -2455.64, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2697.98, -2457.50, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2698.95, -2453.04, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2705.36, -2453.04, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2711.77, -2453.04, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2708.47, -2446.02, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2697.98, -2447.87, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2728.73, -2453.52, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19358, 2725.52, -2453.52, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2729.47, -2450.41, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2729.47, -2460.02, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2735.15, -2453.52, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2733.55, -2449.93, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2728.87, -2445.87, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2724.78, -2448.73, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2705.53, -2448.27, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2709.83, -2447.36, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2700.21, -2447.36, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2697.37, -2448.34, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2718.97, -2469.63, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19427, 2708.41, -2488.61, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19427, 2705.41, -2488.29, 4997.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2723.63, -2474.15, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2729.47, -2469.63, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2728.48, -2464.96, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2723.63, -2480.56, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2728.44, -2483.46, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2729.47, -2479.25, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2718.97, -2479.25, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2718.97, -2488.87, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2708.49, -2484.57, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2738.55, -2481.06, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(8167, 2738.62, -2481.14, 4994.57,   90.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2738.55, -2481.06, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2732.16, -2481.06, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2732.16, -2481.06, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2725.75, -2481.06, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2725.75, -2481.06, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2719.36, -2481.06, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2719.36, -2481.06, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(8167, 2731.90, -2481.14, 4994.57,   90.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(8167, 2725.64, -2481.14, 4994.57,   90.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(8167, 2719.43, -2481.14, 4994.57,   90.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2738.55, -2464.98, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2732.16, -2464.98, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2725.75, -2464.98, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2719.36, -2464.98, 4997.88,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2738.55, -2464.98, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2732.16, -2464.98, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2725.75, -2464.98, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19404, 2719.36, -2464.98, 4994.39,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(8167, 2719.20, -2465.06, 4994.57,   90.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(8167, 2725.64, -2465.06, 4994.57,   90.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(8167, 2731.90, -2465.06, 4994.57,   90.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(8167, 2738.62, -2465.06, 4994.57,   90.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2718.52, -2472.55, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2718.52, -2478.96, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2708.47, -2474.89, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19379, 2708.47, -2465.26, 5001.88,   0.00, 90.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2713.67, -2477.39, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2708.98, -2466.21, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2708.98, -2475.85, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(14782, 2701.67, -2447.75, 5002.98,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(14401, 2701.47, -2449.74, 5002.27,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2377, 2705.13, -2452.14, 5003.19,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2377, 2705.13, -2452.10, 5004.31,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2374, 2705.13, -2451.02, 5004.31,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2374, 2705.13, -2451.02, 5003.19,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19458, 2705.46, -2448.25, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1744, 2705.54, -2447.96, 5004.30,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1744, 2705.54, -2448.91, 5002.83,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1744, 2705.54, -2449.25, 5003.65,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19515, 2705.20, -2448.64, 5003.43,   0.00, -90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19515, 2705.20, -2449.12, 5003.43,   0.00, -90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19515, 2705.20, -2449.60, 5003.43,   0.00, -90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19515, 2705.20, -2450.08, 5003.43,   0.00, -90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(356, 2705.29, -2449.39, 5004.07,   20.00, -1.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(356, 2705.29, -2450.34, 5004.07,   20.00, -1.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19138, 2705.19, -2448.96, 5004.02,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19138, 2705.16, -2449.24, 5004.02,   0.00, 0.00, 239.61, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19138, 2705.21, -2449.60, 5004.02,   0.00, 0.00, 141.76, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19138, 2705.23, -2449.91, 5004.02,   0.00, 0.00, 164.77, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(356, 2705.21, -2450.34, 5004.07,   20.00, -1.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(356, 2705.21, -2449.39, 5004.07,   20.00, -1.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18637, 2705.31, -2448.79, 5002.55,   80.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18637, 2705.31, -2449.51, 5002.55,   80.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18637, 2705.31, -2450.25, 5002.55,   80.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18637, 2705.31, -2448.15, 5002.55,   80.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19472, 2705.25, -2447.78, 5004.70,   0.00, -25.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19472, 2705.17, -2448.15, 5004.70,   0.00, -25.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19472, 2705.18, -2448.42, 5004.70,   0.00, -25.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19472, 2705.19, -2448.60, 5004.70,   0.00, -25.00, 196.25, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19141, 2705.21, -2448.97, 5004.68,   -30.00, -90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19141, 2705.21, -2448.97, 5004.74,   -30.00, -90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19141, 2705.21, -2449.17, 5004.74,   -30.00, -90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19141, 2705.21, -2449.17, 5004.68,   -30.00, -90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2886, 2699.98, -2453.07, 5003.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2886, 2699.98, -2453.01, 5003.43,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1502, 2723.61, -2473.36, 5001.93,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2713.70, -2465.73, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2719.80, -2486.23, 5003.70,   0.00, 0.00, 305.07, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2707.62, -2489.69, 5009.30,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2713.44, -2488.29, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19380, 2709.55, -2493.71, 4995.26,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1497, 2697.42, -2459.05, 5001.97,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1497, 2697.39, -2456.05, 5001.97,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1497, 2705.59, -2489.76, 5007.72,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1497, 2708.59, -2489.73, 5007.72,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1497, 2706.83, -2459.52, 4996.12,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2713.18, -2448.27, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2796, 2711.90, -2453.05, 5004.80,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2797, 2713.58, -2450.18, 5004.67,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2808, 2732.01, -2482.94, 5002.58,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2637, 2732.02, -2481.34, 5002.38,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2638, 2732.01, -2479.29, 5002.58,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2637, 2732.02, -2477.23, 5002.38,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2638, 2732.01, -2475.05, 5002.58,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2637, 2732.02, -2473.06, 5002.38,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2808, 2732.01, -2471.49, 5002.58,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2734.69, -2471.09, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19431, 2723.63, -2471.75, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2441, 2729.37, -2470.78, 5001.96,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2441, 2728.37, -2470.78, 5001.96,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2441, 2727.37, -2470.78, 5001.96,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2725.29, -2471.09, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1502, 2724.49, -2471.11, 5001.93,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2738.09, -2464.96, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2734.63, -2466.33, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2733.19, -2485.54, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2219, 2728.78, -2471.07, 5003.08,   -25.00, 23.00, 74.36, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2131, 2734.06, -2469.49, 5001.95,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2132, 2734.11, -2467.51, 5001.96,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2134, 2734.11, -2466.52, 5001.97,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2341, 2734.10, -2465.53, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2453, 2729.47, -2470.93, 5003.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2426, 2734.31, -2466.51, 5003.02,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2426, 2734.31, -2466.51, 5003.36,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2134, 2733.10, -2465.53, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2134, 2732.10, -2465.53, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2360, 2730.60, -2465.51, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2452, 2729.01, -2465.41, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2714, 2723.52, -2472.70, 5004.21,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2421, 2733.37, -2465.09, 5003.72,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2415, 2726.00, -2465.74, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2422, 2727.44, -2470.67, 5002.94,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2425, 2732.27, -2464.78, 5003.00,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2429, 2732.85, -2464.81, 5003.22,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2430, 2726.87, -2471.00, 5004.36,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2808, 2728.27, -2482.94, 5002.58,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2808, 2724.76, -2482.94, 5002.58,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2637, 2728.26, -2481.34, 5002.38,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2637, 2724.79, -2481.34, 5002.38,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2637, 2728.26, -2477.23, 5002.38,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2637, 2724.79, -2477.23, 5002.38,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2638, 2728.27, -2479.29, 5002.58,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2638, 2724.76, -2479.29, 5002.58,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2808, 2724.76, -2475.49, 5002.58,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2808, 2728.27, -2475.49, 5002.58,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2416, 2727.10, -2465.57, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2415, 2725.18, -2465.74, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1703, 2730.50, -2455.28, 5001.97,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1703, 2730.50, -2458.76, 5001.97,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2010, 2730.50, -2454.31, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2010, 2730.47, -2458.01, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2010, 2724.48, -2460.73, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2528, 2706.48, -2447.96, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2528, 2708.27, -2447.96, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2528, 2710.35, -2447.96, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2528, 2711.86, -2447.96, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2710.78, -2444.87, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19450, 2707.39, -2444.87, 5003.70,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2712.10, -2449.65, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2708.89, -2449.65, 5003.70,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19388, 2706.46, -2450.84, 5003.70,   0.00, 0.00, 145.03, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1523, 2712.86, -2449.63, 5001.95,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1523, 2709.68, -2449.63, 5001.95,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1523, 2706.04, -2451.50, 5001.95,   0.00, 0.00, 54.34, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1502, 2712.53, -2453.02, 5001.95,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2518, 2709.95, -2450.24, 5002.31,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2518, 2708.42, -2452.45, 5002.31,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2518, 2709.47, -2452.45, 5002.31,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2164, 2717.60, -2457.48, 5001.97,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2167, 2718.52, -2457.49, 5001.97,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2207, 2727.87, -2449.92, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(948, 2725.21, -2453.10, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(948, 2727.61, -2453.10, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(948, 2729.82, -2453.10, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(948, 2733.06, -2453.10, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1714, 2728.78, -2448.57, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2190, 2727.63, -2449.24, 5002.72,   0.00, 0.00, 97.99, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2894, 2729.39, -2449.54, 5002.74,   0.00, 0.00, 45.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(14455, 2731.39, -2445.91, 5003.62,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(949, 2725.49, -2446.39, 5002.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(949, 2732.88, -2446.39, 5002.60,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2164, 2724.87, -2449.95, 5001.94,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19172, 2733.47, -2449.80, 5003.93,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1720, 2729.66, -2450.93, 5001.95,   0.00, 0.00, 202.23, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1720, 2727.85, -2450.93, 5001.95,   0.00, 0.00, 152.54, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2165, 2714.17, -2474.93, 5001.96,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2165, 2712.22, -2474.93, 5001.96,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2165, 2713.22, -2472.98, 5001.96,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2165, 2714.19, -2473.98, 5001.96,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2174, 2714.19, -2472.02, 5001.97,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2174, 2713.22, -2471.01, 5001.97,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2165, 2713.22, -2469.05, 5001.96,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2165, 2714.19, -2470.06, 5001.96,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2165, 2715.17, -2468.10, 5001.96,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2165, 2713.24, -2468.10, 5001.96,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2164, 2718.42, -2467.48, 5001.95,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2164, 2718.42, -2469.26, 5001.95,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2164, 2718.42, -2474.02, 5001.95,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2164, 2718.42, -2475.79, 5001.95,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1715, 2712.70, -2469.77, 5001.97,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1715, 2712.48, -2467.58, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1715, 2714.91, -2466.99, 5001.97,   0.00, 0.00, 341.57, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1715, 2715.51, -2469.10, 5001.97,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1715, 2715.22, -2472.93, 5001.97,   0.00, 0.00, 302.33, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1715, 2714.84, -2476.23, 5001.97,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1715, 2712.16, -2475.97, 5001.97,   0.00, 0.00, 154.97, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1715, 2712.04, -2474.13, 5001.97,   0.00, 0.00, 148.14, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19173, 2709.08, -2473.70, 5004.40,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19174, 2709.07, -2468.98, 5004.26,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2744.25, -2483.57, 4999.56,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2720.56, -2484.37, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2730.19, -2484.37, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2701.34, -2484.37, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2710.96, -2473.87, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2720.56, -2473.87, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2730.19, -2473.87, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2730.19, -2463.39, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2720.56, -2463.39, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2710.96, -2463.39, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2730.19, -2452.90, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2720.56, -2452.90, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2710.96, -2452.90, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2730.19, -2442.41, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2720.56, -2442.41, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2710.96, -2442.41, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2701.34, -2463.39, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2701.34, -2452.90, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19378, 2701.34, -2442.41, 5005.41,   0.00, 90.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2701.05, -2452.24, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2701.05, -2463.89, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2709.71, -2463.89, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2709.71, -2452.24, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2718.74, -2463.89, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2718.74, -2452.24, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2727.41, -2463.89, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2727.41, -2452.24, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2736.02, -2452.24, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2736.11, -2463.89, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2709.71, -2475.61, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2718.74, -2475.61, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2727.41, -2475.61, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2735.82, -2475.61, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2709.71, -2483.01, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2718.74, -2483.01, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2727.41, -2483.01, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2735.82, -2483.01, 5005.34,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2705.50, -2466.28, 4999.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2705.50, -2477.49, 4999.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2713.34, -2466.28, 4999.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2722.72, -2466.28, 4999.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2731.39, -2466.28, 4999.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2740.14, -2466.28, 4999.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2713.34, -2477.49, 4999.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2722.72, -2477.49, 4999.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2731.39, -2477.49, 4999.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2739.30, -2482.39, 4995.93,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2705.50, -2489.88, 4999.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2713.34, -2489.88, 4999.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2722.72, -2489.88, 4999.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2731.39, -2489.88, 4999.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2740.14, -2477.49, -2489.88,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2740.14, -2477.49, 4999.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2730.85, -2482.39, 4995.93,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2721.97, -2482.39, 4995.93,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2716.59, -2482.39, 4995.93,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2709.08, -2473.41, 4995.93,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2716.59, -2464.42, 4995.93,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2721.97, -2464.42, 4995.93,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2730.85, -2464.42, 4995.93,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2739.30, -2464.42, 4995.93,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(18075, 2746.48, -2473.45, 4995.93,   0.00, 0.00, 90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19273, 2708.02, -2488.23, 4997.53,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19273, 2708.17, -2488.83, 4997.53,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19273, 2707.99, -2488.24, 5003.39,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19273, 2708.17, -2488.84, 5003.39,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19273, 2727.76, -2453.54, 5003.43,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(19273, 2727.78, -2453.50, 5003.43,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1502, 2718.49, -2471.76, 5001.93,   0.00, 0.00, -90.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1703, 2708.82, -2460.80, 5001.97,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1703, 2704.20, -2460.80, 5001.97,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1703, 2700.35, -2460.80, 5001.97,   0.00, 0.00, 180.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2011, 2701.18, -2460.86, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2011, 2705.51, -2460.86, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2011, 2709.70, -2460.70, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2011, 2713.11, -2458.32, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2011, 2712.95, -2453.57, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2011, 2710.16, -2453.50, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2011, 2700.81, -2453.47, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1703, 2701.65, -2453.63, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(1703, 2707.20, -2453.63, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2011, 2706.31, -2453.55, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	CreateDynamicObject(2011, 2704.61, -2453.63, 5001.97,   0.00, 0.00, 0.00, .interiorid = 0, .streamdistance = 200);
	
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

	// Hospital Interior Mapping from NGRP
	CreateDynamicObject(1997, 2370.80469, 2642.91553, 8000.12988,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1997, 2370.89771, 2649.08740, 8000.12988,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1997, 2370.83105, 2655.39478, 8000.12988,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1997, 2393.80615, 2655.39258, 8000.12988,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1997, 2393.90161, 2649.09644, 8000.12988,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1997, 2393.94800, 2642.54224, 8000.12988,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1997, 2383.08252, 2642.48071, 8000.12988,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1997, 2383.03882, 2648.96802, 8000.12988,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1997, 2381.77661, 2642.63062, 8000.12988,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1997, 2381.54541, 2648.75342, 8000.12988,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19462, 2378.84888, 2661.37402, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2385.83838, 2661.37402, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2382.34253, 2661.37402, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2392.83472, 2661.37402, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2389.33960, 2661.37402, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19450, 2370.28784, 2661.37012, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19462, 2392.83252, 2651.74121, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2389.33960, 2651.74121, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2385.83838, 2651.74121, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2382.34253, 2651.74121, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2378.84888, 2651.74121, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19450, 2389.58911, 2666.10010, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19462, 2375.35449, 2661.37402, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2375.35449, 2651.74121, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2371.87012, 2651.74121, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2371.87012, 2661.37402, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19450, 2370.28784, 2651.74292, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19450, 2394.47314, 2651.75049, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19458, 2392.83472, 2661.37402, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2389.33960, 2661.37402, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2385.83838, 2661.37402, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2382.34253, 2661.37402, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2378.84888, 2661.37402, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2375.35449, 2661.37402, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2371.87012, 2661.37402, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2371.87012, 2651.74121, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2375.35449, 2651.74121, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2378.84888, 2651.74121, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2382.34253, 2651.74121, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2385.83838, 2651.74121, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2389.33960, 2651.74121, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2392.83252, 2651.74121, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2371.87012, 2642.11401, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2375.35449, 2642.11401, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2378.84888, 2642.11401, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2382.34253, 2642.11401, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2385.83838, 2642.11401, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2389.33960, 2642.11401, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19462, 2392.83252, 2642.11401, 8000.06201,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19450, 2370.28784, 2642.12085, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19458, 2371.87012, 2642.11401, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2375.35449, 2642.11401, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2378.84888, 2642.11401, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2382.34253, 2642.11401, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2385.83838, 2642.11401, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2389.33960, 2642.11401, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19458, 2392.83252, 2642.11401, 8003.55566,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19450, 2394.47314, 2642.13281, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19450, 2375.16821, 2666.10010, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19450, 2389.62231, 2637.31006, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19388, 2383.17212, 2666.10010, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19388, 2375.32373, 2656.47681, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 2371.94385, 2656.47681, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 2381.61353, 2637.31006, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19388, 2391.10840, 2645.35400, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19450, 2394.47314, 2661.37402, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19404, 2391.10840, 2654.96167, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19404, 2373.63550, 2654.96167, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19450, 2375.19556, 2637.31006, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19431, 2384.02002, 2637.31006, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 2386.23096, 2656.47681, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19388, 2389.42505, 2656.47681, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19404, 2391.10840, 2648.55273, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19388, 2391.10840, 2651.75391, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19404, 2391.10840, 2642.15356, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19388, 2391.10840, 2638.95825, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 2392.78833, 2656.47998, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19388, 2373.63550, 2651.75391, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19404, 2373.63550, 2648.55273, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19388, 2373.63550, 2645.35400, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19404, 2373.63550, 2642.15356, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19388, 2373.63550, 2638.95825, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 2378.49316, 2656.47681, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19431, 2380.70850, 2656.47681, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19388, 2383.04224, 2656.47681, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19431, 2380.78198, 2666.10010, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19388, 2387.85400, 2651.75391, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 2387.85400, 2654.96167, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 2376.63696, 2654.86182, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19388, 2376.63696, 2651.65381, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18070, 2383.23242, 2658.87549, 8000.58691,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19404, 2376.63696, 2648.51270, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19388, 2376.63696, 2645.31396, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19404, 2376.63696, 2642.15356, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19388, 2376.63696, 2638.95825, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19404, 2387.85400, 2648.55273, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19388, 2387.85400, 2645.35400, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19388, 2387.85400, 2638.95825, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19404, 2387.85400, 2642.15356, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 2392.78833, 2643.64087, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 2392.78833, 2650.21338, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19450, 2382.37109, 2642.15894, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1523, 2387.89771, 2651.00732, 8000.10938,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1523, 2391.06445, 2646.14844, 8000.10938,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1523, 2391.05200, 2639.74927, 8000.10938,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1523, 2376.59351, 2639.76416, 8000.10938,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1523, 2376.59766, 2646.11182, 8000.10938,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1523, 2376.59448, 2652.45020, 8000.10938,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1523, 2391.05835, 2652.55493, 8000.10938,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1523, 2387.89502, 2644.59839, 8000.10938,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1523, 2387.89160, 2638.19556, 8000.10938,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1523, 2373.68555, 2638.19897, 8000.10938,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1523, 2373.67603, 2644.58960, 8000.10938,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1523, 2373.67969, 2650.99805, 8000.10938,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19466, 2391.07617, 2654.82642, 8001.92822,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 2391.07617, 2648.52905, 8001.92822,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 2391.07617, 2642.06006, 8001.92822,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 2387.83984, 2642.35278, 8001.92822,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 2387.83984, 2648.70215, 8001.92822,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 2376.58740, 2648.52832, 8001.92822,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 2376.58740, 2641.94897, 8001.92822,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 2373.67236, 2642.14404, 8001.92822,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 2373.67236, 2648.65454, 8001.92822,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19466, 2373.67236, 2655.04663, 8001.92822,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 2382.37109, 2648.57935, 8001.88330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1569, 2382.40356, 2666.07104, 8000.16260,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18070, 2383.23242, 2658.87549, 8003.07031,   180.00000, 0.00000, 0.00000);
	CreateDynamicObject(19358, 2386.16943, 2650.12109, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 2382.95972, 2650.12109, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 2379.75000, 2650.12109, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19431, 2377.36060, 2650.12109, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 2386.16943, 2643.65723, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 2382.95972, 2643.65723, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 2379.75000, 2643.65723, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19431, 2377.36060, 2643.65723, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1523, 2390.18872, 2656.52979, 8000.10938,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1523, 2376.09180, 2656.52246, 8000.10938,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1523, 2383.80762, 2656.51929, 8000.10938,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19172, 2389.49854, 2637.40234, 8002.33984,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19174, 2375.15991, 2637.40015, 8002.30957,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19173, 2394.38110, 2662.58228, 8002.25586,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19175, 2370.37891, 2661.58228, 8002.37744,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1775, 2393.91992, 2660.42725, 8001.22998,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1776, 2393.90967, 2659.21094, 8001.22852,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(3657, 2393.91846, 2663.14673, 8000.58447,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(3657, 2388.29565, 2665.42505, 8000.58447,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3657, 2392.15503, 2665.48267, 8000.58447,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3657, 2370.88745, 2663.31396, 8000.58447,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3657, 2372.93457, 2665.55444, 8000.58447,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3657, 2370.88599, 2659.45020, 8000.58447,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3657, 2376.97681, 2665.52856, 8000.58447,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2310, 2391.57251, 2653.09717, 8000.63525,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(14532, 2391.83813, 2655.96558, 8001.09277,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2393.52881, 2650.29858, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2700, 2393.46143, 2650.57446, 8002.59424,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2001, 2391.74341, 2650.61353, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2310, 2391.56592, 2653.86646, 8000.63525,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(14532, 2391.80957, 2649.73438, 8001.09277,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2393.68018, 2643.76025, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2700, 2393.70703, 2644.00098, 8002.59424,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2001, 2391.60693, 2644.03320, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2310, 2391.59326, 2646.51831, 8000.63525,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2310, 2391.59814, 2647.30469, 8000.63525,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2393.70288, 2637.41528, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2385.74438, 2637.35449, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2001, 2391.63574, 2637.70361, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2700, 2393.86670, 2637.66870, 8002.59424,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14532, 2392.03833, 2643.25732, 8001.09277,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2310, 2391.57544, 2640.22705, 8000.63525,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2310, 2391.53516, 2640.93286, 8000.63525,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2001, 2387.48120, 2637.67529, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2167, 2384.02026, 2637.43140, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(14532, 2384.71558, 2643.15869, 8001.09277,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2386.08667, 2643.55542, 8000.14404,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2001, 2387.33521, 2643.02417, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2310, 2387.41675, 2640.03516, 8000.63525,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2310, 2387.38989, 2640.78564, 8000.63525,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2310, 2387.40259, 2646.51392, 8000.63525,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2310, 2387.41626, 2647.32056, 8000.63525,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2001, 2387.32666, 2644.28491, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2001, 2387.29614, 2649.61890, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2167, 2386.13379, 2643.77539, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2384.27051, 2643.77515, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2700, 2386.75610, 2637.66528, 8002.59424,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2167, 2385.98608, 2650.13232, 8000.14404,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14532, 2384.47070, 2649.72412, 8001.09277,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2700, 2386.63281, 2644.00830, 8002.59424,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2167, 2380.21118, 2637.49341, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2378.53003, 2637.53052, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2001, 2377.25513, 2637.91895, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2001, 2377.21289, 2642.98364, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1714, 2382.19653, 2658.85278, 8000.24805,   0.00000, 0.00000, -180.18004);
	CreateDynamicObject(1714, 2384.32837, 2658.83887, 8000.24805,   0.00000, 0.00000, -180.18004);
	CreateDynamicObject(2000, 2384.01660, 2652.94067, 8000.14941,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2000, 2383.51611, 2652.94067, 8000.14941,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2000, 2383.01636, 2652.94067, 8000.14941,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2000, 2382.51318, 2652.94067, 8000.14941,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2000, 2382.01367, 2652.94067, 8000.14941,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2000, 2381.52515, 2652.94067, 8000.14941,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2000, 2384.01660, 2652.94067, 8001.54492,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2000, 2383.51611, 2652.94067, 8001.54492,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2000, 2383.01636, 2652.94067, 8001.54492,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2000, 2382.51318, 2652.94067, 8001.54492,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2000, 2382.01367, 2652.94067, 8001.54492,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2000, 2381.52515, 2652.94067, 8001.54492,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19370, 2382.78394, 2653.53931, 8001.70215,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2000, 2384.01660, 2654.05933, 8000.14941,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2000, 2383.51611, 2654.05933, 8000.14941,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2000, 2383.01636, 2654.05933, 8000.14941,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2000, 2382.51318, 2654.05933, 8000.14941,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2000, 2382.01367, 2654.05933, 8000.14941,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2000, 2381.52515, 2654.05933, 8000.14941,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2000, 2384.01660, 2654.05933, 8001.54492,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2000, 2383.51611, 2654.05933, 8001.54492,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2000, 2383.01636, 2654.05933, 8001.54492,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2000, 2382.51318, 2654.05933, 8001.54492,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2000, 2382.01367, 2654.05933, 8001.54492,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2000, 2381.52515, 2654.05933, 8001.54492,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2385.01270, 2656.37402, 8000.14404,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2167, 2385.92896, 2656.37402, 8000.14404,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2164, 2380.00146, 2656.38062, 8000.13330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2164, 2378.23779, 2656.37549, 8000.13330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2164, 2385.43237, 2650.24023, 8000.13330,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2164, 2381.86279, 2650.24023, 8000.13330,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2383.66187, 2650.23511, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2383.66187, 2650.23511, 8001.66016,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2382.76196, 2650.23511, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2382.76196, 2650.23511, 8001.66016,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2380.09277, 2650.24023, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2380.09277, 2650.24023, 8001.66016,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2386.35083, 2650.24023, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2386.35083, 2650.24023, 8001.66016,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2190, 2382.59668, 2660.77441, 8001.09521,   0.00000, 0.00000, -16.00000);
	CreateDynamicObject(2190, 2384.91113, 2660.65649, 8001.09521,   0.00000, 0.00000, -23.00000);
	CreateDynamicObject(19358, 2371.95557, 2650.11548, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19358, 2371.95557, 2643.91821, 8001.88330,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14532, 2379.90063, 2643.18506, 8001.09277,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2378.15942, 2643.57983, 8000.14404,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2700, 2381.41846, 2637.66699, 8002.59424,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2167, 2378.11353, 2650.00171, 8000.14404,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14532, 2379.96411, 2649.67554, 8001.09277,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2001, 2377.25293, 2649.54321, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2001, 2377.22168, 2644.29297, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2700, 2381.27979, 2644.01074, 8002.59424,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2167, 2380.50610, 2643.77515, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2378.77808, 2643.76465, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2001, 2381.84302, 2637.87622, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2001, 2381.90356, 2644.04541, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2167, 2371.00244, 2637.42310, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2001, 2373.19189, 2637.91821, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14532, 2372.35815, 2643.50781, 8001.09277,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2001, 2373.05396, 2644.49268, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2167, 2371.30859, 2644.02075, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 2371.40332, 2650.23291, 8000.14404,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2700, 2371.27490, 2637.66553, 8002.59424,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14532, 2372.48706, 2649.54102, 8001.09277,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2700, 2371.35352, 2644.27148, 8002.59424,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2001, 2373.01294, 2650.78833, 8000.14893,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14532, 2372.46216, 2655.86743, 8001.09277,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2700, 2371.37622, 2650.46436, 8002.59424,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2310, 2373.16406, 2640.18530, 8000.63525,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2310, 2373.15991, 2640.90942, 8000.63525,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2310, 2373.21094, 2646.43823, 8000.63525,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2310, 2373.18774, 2647.25879, 8000.63525,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2310, 2373.18604, 2652.98657, 8000.63525,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2310, 2373.20679, 2653.76782, 8000.63525,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2310, 2377.15723, 2640.15894, 8000.63525,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2310, 2377.17432, 2640.92407, 8000.63525,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2310, 2377.09253, 2646.43359, 8000.63525,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2310, 2377.11401, 2647.13672, 8000.63525,   0.00000, 0.00000, 180.00000);

	// Name: DMV door fix | Type: Interior | Owner: N/A | Mapped By: Vintage | Interior ID: Nil | Virtual World: Nil
	CreateDynamicObject(14542,1494.00000000,1301.59997559,1093.90002441,0.00000000,0.00000000,0.00000000);
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
