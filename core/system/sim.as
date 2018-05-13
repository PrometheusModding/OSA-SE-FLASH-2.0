
class core.system.sim
{
var o

	public function sim(om){
			o = om
			
			
		
	}

	function mimicGameCall(fn, scope){
		var time = new Time({fn:fn, scope:scope}, 500)
	}
	
		var testActra = 12
	
	function simActraAdd(){
		if (!o.actro.get(testActra)){o.actro.create(testActra)}
		if (testActra == 12){
		var Details = []
			Details[0] = "12"
			Details[2] = "Bandit"
			Details[3] = "0"
			Details[4] = "1"
			Details[5] = "1.03"
			Details[6] = "nord"
			Details[7] = "VoiceType"
			Details[8] = "100"
			
		o.actro.get(testActra).dat.storeDetails(Details)
		} else {
			
			var Details = []
			Details[0] = "13"
			Details[2] = "Fione"
			Details[3] = "1"
			Details[4] = "0"
			Details[5] = ".96"
			Details[6] = "redguard"
			Details[7] = "VoiceType"
			Details[8] = "100"
			Details[10] = "0A2C8E"
			Details[11] = "OS.esp"
			Details[12] = "OS"
			Details[13] = "0S0A2C8E"
			
		o.actro.get(testActra).dat.storeDetails(Details) 
		}
		testActra += 1
	}
	
	
	function simActraThirdID(){
		return "003423F"
	}
	
	function simActraThird(){
		var thirdActra = "003423F"
			o.actro.create(thirdActra)
			
			var Details = []
			Details[0] = thirdActra
			Details[2] = "Gunther"
			Details[3] = "1"
			Details[4] = "0"
			Details[5] = ""
			Details[5] = ""
			Details[6] = "OFemale"
			Details[7] = "VoiceType"
			Details[9] = "100"
			Details[10] = thirdActra
			Details[11] = "0S.esp"
			Details[12] = "0S"
			Details[13] = "0S"+thirdActra
			Details[14] = "npc/0S/"+thirdActra+"/"

			o.actro.get(thirdActra).dat.storeDetails(Details) 
			
			Details[0] = thirdActra
			Details[1] = "1.0"
			Details[2] = "1.0"
			Details[3] = "1.0"
			Details[4] = "1.0"
			Details[5] = "1.0"
			Details[6] = "1.0"
			Details[7] = "1.0"
			Details[8] = "1.0e"
			Details[9] = "1.0"
			Details[10] = "1.0"
			Details[11] = "1.0"
			Details[12] = "1.0"
			Details[13] = "1.0"
			Details[14] = "1.0"
			Details[15] = "1.0"
			Details[16] = "1.0"
			Details[17] = "1.0"
			Details[18] = "1.0"
			
		o.actro.get(thirdActra).dat.storeScale(Details)
		
	}
	
	var testScale = 12
	
	function simActraScaleAdd(){
		if (!o.actro.get(testScale)){o.actro.create(testScale)}
		if (testScale == 12){
			var Details = []
			Details[0] = "1.0"
			Details[1] = "1.0"
			Details[2] = "1.0"
			Details[3] = "1.0"
			Details[4] = "1.0"
			Details[5] = "1.0"
			Details[6] = "1.0"
			Details[7] = "1.0"
			Details[8] = "1.0e"
			Details[9] = "1.0"
			Details[10] = "1.0"
			Details[11] = "1.0"
			Details[12] = "1.0"
			Details[13] = "1.0"
			Details[14] = "1.0"
			Details[15] = "1.0"
			Details[16] = "1.0"
			Details[17] = "1.0"
			Details[18] = "1.0"
			
		o.actro.get(testScale).dat.storeScale(Details)
		} else {
			var Details = []
			Details[0] = "13"
			Details[0] = "1.0"
			Details[1] = "1.0"
			Details[2] = "1.0"
			Details[3] = "1.0"
			Details[4] = "1.0"
			Details[5] = "1.0"
			Details[6] = "1.0"
			Details[7] = "1.0"
			Details[8] = "1.0e"
			Details[9] = "1.0"
			Details[10] = "1.0"
			Details[11] = "1.0"
			Details[12] = "1.0"
			Details[13] = "1.0"
			Details[14] = "1.0"
			Details[15] = "1.0"
			Details[16] = "1.0"
			Details[17] = "1.0"
			Details[18] = "1.0"
		o.actro.get(testScale).dat.storeScale(Details) 
		}
		testScale += 1
	}
	
		var testOheight = 12
	
	function simActraOHeightAdd(){
		if (!o.actro.get(testOheight)){o.actro.create(testOheight)}
		if (testOheight == 12){
		o.actro.get(testOheight).dat.storeOHeight("104")
		} else {
		o.actro.get(testOheight).dat.storeOHeight("106") 
		}
		testOheight += 1
	}
	
	
	var simEQWorn = 12
	
	function simActraEQWorn(){
		if (simEQWorn == 12){
		var Eq = []

		Eq[0] = 1231241
		Eq[1] = 0
		Eq[2] = 4123124
		Eq[3] = 1237412
		Eq[4] = 0
		Eq[5] = 0
		Eq[6] = 0
		Eq[7] = 8472312
		Eq[8] = 0
		Eq[9] = 0
		Eq[10] = 0
		Eq[11] = 0
		Eq[12] = 0
		Eq[13] = 0
		Eq[14] = 0
		//Eq[15] = 1284181
		//Eq[16] = 84231123
		Eq[17] = 0
		Eq[18] = 0
		Eq[19] = 0
		
		Eq[20] = 0
		Eq[21] = 0
		Eq[22] = 0
		Eq[23] = 0
		Eq[24] = 0
		Eq[25] = 0
		Eq[26] = 0
		Eq[27] = 0
		Eq[28] = 0
		Eq[29] = 0
		
		Eq[30] = 0
		Eq[31] = 0
		Eq[32] = 0
		Eq[33] = 0
		Eq[34] = 0
		Eq[35] = 0
		Eq[36] = 0
		Eq[37] = 0
		Eq[38] = 0
		Eq[39] = 12
		
		Eq[40] = "SomeHelmet"
		Eq[41] = "noeq"
		Eq[42] = "SomeCuirass"
		Eq[43] = "SomeGloves"
		Eq[44] = "noeq"
		Eq[45] = "noeq"
		Eq[46] = "noeq"
		Eq[47] = "SomeBoots"
		Eq[48] = "noeq"
		Eq[49] = "noeq"
		
		Eq[50] = "noeq"
		Eq[51] = "noeq"
		Eq[52] = "noeq"
		Eq[53] = "noeq"
		Eq[54] = "noeq"
		//Eq[55] = "SomePanties"
		//Eq[56] = "SomePants"
		Eq[57] = "noeq"
		Eq[58] = "noeq"
		Eq[59] = "noeq"
		
		Eq[60] = "noeq"
		Eq[61] = "noeq"
		Eq[62] = "noeq"
		Eq[63] = "noeq"
		Eq[64] = "noeq"
		Eq[65] = "noeq"
		Eq[66] = "noeq"
		Eq[67] = "noeq"
		Eq[68] = "noeq"
		Eq[69] = "noeq"
		
		Eq[70] = "noeq"
		Eq[71] = "noeq"
		Eq[72] = "noeq"
		Eq[73] = "noeq"
		Eq[74] = "noeq"
		Eq[75] = "noeq"
		Eq[76] = "noeq"

	
		} else {
		var Eq = []
		
		Eq[0] = 1231241
		Eq[1] = 0
		Eq[2] = 4231241
		Eq[3] = 1237412
		Eq[4] = 0
		Eq[5] = 0
		Eq[6] = 0
		Eq[7] = 8472312
		Eq[8] = 0
		Eq[9] = 0
		Eq[10] = 0
		Eq[11] = 0
		Eq[12] = 0
		Eq[13] = 0
		Eq[14] = 0
		//Eq[15] = 1284181
		//Eq[16] = 84231123
		Eq[15] = 0
		Eq[16] = 0
		Eq[17] = 0
		Eq[18] = 0
		Eq[19] = 0
		
		Eq[20] = 0
		Eq[21] = 0
		Eq[22] = 0
		Eq[23] = 0
		Eq[24] = 124213
		Eq[25] = 0
		Eq[26] = 0
		Eq[27] = 0
		Eq[28] = 0
		Eq[29] = 0
		
		Eq[30] = 0
		Eq[31] = 0
		Eq[32] = 0
		Eq[33] = 0
		Eq[34] = 0
		Eq[35] = 0
		Eq[36] = 0
		Eq[37] = 0
		Eq[38] = 0
		Eq[39] = 13
		
		Eq[40] = "SomeHelmet"
		Eq[41] = "noeq"
		Eq[42] = "SomeCuirass"
		Eq[43] = "SomeGloves"
		Eq[44] = "noeq"
		Eq[45] = "noeq"
		Eq[46] = "noeq"
		Eq[47] = "SomeBoots"
		Eq[48] = "noeq"
		Eq[49] = "noeq"
		
		Eq[50] = "noeq"
		Eq[51] = "noeq"
		Eq[52] = "noeq"
		Eq[53] = "noeq"
		Eq[54] = "noeq"
		//Eq[55] = "SomePanties"
		//Eq[56] = "SomePants"
		Eq[55] = "noeq"
		Eq[56] = "noeq"
		Eq[57] = "noeq"
		Eq[58] = "noeq"
		Eq[59] = "noeq"
		
		Eq[60] = "noeq"
		Eq[61] = "noeq"
		Eq[62] = "noeq"
		Eq[63] = "noeq"
		Eq[64] = "SomeStockings"
		Eq[65] = "noeq"
		Eq[66] = "noeq"
		Eq[67] = "noeq"
		Eq[68] = "noeq"
		Eq[69] = "noeq"
		
		Eq[70] = "noeq"
		Eq[71] = "noeq"
		Eq[72] = "noeq"
		Eq[73] = "noeq"
		Eq[74] = "noeq"
		Eq[75] = "noeq"
		Eq[76] = "noeq"

		}
		o.com.skyActraAttireWorn(Eq[0],Eq[1],Eq[2],Eq[3],Eq[4],Eq[5],Eq[6],Eq[7],Eq[8],Eq[9],
		Eq[10],Eq[11],Eq[12],Eq[13],Eq[14],Eq[15],Eq[16],Eq[17],Eq[18],Eq[19],
		Eq[20],Eq[21],Eq[22],Eq[23],Eq[24],Eq[25],Eq[26],Eq[27],Eq[28],Eq[29],
		Eq[30],Eq[31],Eq[32],Eq[33],Eq[34],Eq[35],Eq[36],Eq[37],Eq[38],Eq[39],
		Eq[40],Eq[41],Eq[42],Eq[43],Eq[44],Eq[45],Eq[46],Eq[47],Eq[48],Eq[49],
		Eq[50],Eq[51],Eq[52],Eq[53],Eq[54],Eq[55],Eq[56],Eq[57],Eq[58],Eq[59],
		Eq[60],Eq[61],Eq[62],Eq[63],Eq[64],Eq[65],Eq[66],Eq[67],Eq[68],Eq[69],
		Eq[70],Eq[71],Eq[72],Eq[73],Eq[74],Eq[75],Eq[76])
		simEQWorn += 1
	}
	
	public function eqtoarg1(){
		o.com.skyActraEqWorn(arguments)
	}

	
	public function simScanMods(){
		o.scan.scanMods("0Sex$1$OSex$Intimacy, Romance, and Sex$a_osxcf_powerkiss01_mf.osmod", "0Spank$1$OSpank$Immersive Booty Slapping$a_osx_spankl01_f.osmod")
		o.scan.scanPlugs("0Sex_0MF.osplug", "0Sex_EMF.osplug", "0Sex_BB.osplug", "0Sex_WZH0.osplug", "0Sex_0M2F.osplug", "0Sex_0MF2.osplug", "0Sex_BG.osplug", "0Sex_WC.osplug")
	}
	
	var splitScene = 0
	public function simSplitScene(){
		if(splitScene == 0){
		o.com.skyActroReadyCheck(51)
		splitScene++
		}
		else if(splitScene == 1){
		o.com.skySyncComplete(51)
		splitScene++
		}
		else if(splitScene == 2){
		o.com.skyActroReadyCheck(52)
		splitScene++
		}
		else if(splitScene == 3){
		o.com.skySyncComplete(52)
		splitScene++
		}
		
		
	}
	
	function simINI(){
			var ini = []
			ini[1]		= String("!dg")
			ini[2]		= String("091231")
			ini[5]		= String("1")
			
			ini[7]		=String("1")
			ini[8]		=String("ic")
			ini[9]		=String("op")
			ini[10]		=String("1")
			
			ini[10]		=String("1")
			ini[11]		=String("1")
			ini[12]		=String("1")
			ini[13]		=String("1")
			ini[19]		=String("1")
			
			ini[20]		=String("0")
			
			ini[23]		=String("1")
			ini[24]		=String("1")
			ini[26]		=String("1")
			
			ini[30]		=String("1")
			ini[31]		=String("1")
			ini[32]		=String("1")
			ini[33]		=String("1")
			ini[39]		=String("1")
			
			ini[80]		=String("helmet,x,cuirass,gloves,x,necklace,rings,boots,x,shield,x,x,x,earrings,glasses,intlow,pants,x,miscup,miscmid,x,x,x,misclow,stockings,x,inthigh,cape,x,miscarms,x,x!61")
			ini[81]		=String("helmet,x,cuirass,gloves,x,necklace,rings,boots,x,shield,x,x,x,earrings,glasses,intlow,pants,x,miscup,miscmid,x,x,x,misclow,stockings,x,inthigh,cape,x,miscarms,x,x!61")
			
			ini[82]		=String("1")
			ini[83]		=String("1")
			ini[84]		=String("1")
			ini[85]		=String("1")
			ini[86]		=String("1")
			
			ini[93]		=String("1")
			ini[95]		=String("1")
			ini[98]		=String("1")
			ini[99]		=String("1")
			
			ini[100]	=String("0")
			
			o.cfg.config.expandSky(ini)
	}
	
		function simBind(){
			var mcode = []
			var mmod = []
			var okey = []
			okey[0] = 3
			okey[1] = 4
			okey[2] = 4
			okey[3] = 4
			okey[4] = 4
			okey[5] = 5
			okey[6] = 15
			okey[7] = 15
			okey[8] = 15
			okey[9] = 15
			okey[10] = 15
			
			mmod[0] = "0Sex"
			mcode[0] = 5
			
			mmod[1] = "N0Sex"
			mcode[1] = 15
			
			o.cfg.binds.storeMKeyCode(mcode)
			o.cfg.binds.storeMKeyMod(mmod)
			o.cfg.binds.storeOKey(okey)
	}

}