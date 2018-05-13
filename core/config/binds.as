
class core.config.binds
{
	
var o


var OKey
var MKeyCode
var MKeyMod
var boundMods


var refM
var dx

var callBack
var installCount

		function binds(core){
		o = core
		MKeyMod = []
		boundMods = []
		refM = new Object
		installCount = 0
		dx = []
			dx[1]=	"Esc"
			dx[2]=	"1"
			dx[3]=	"2"
			dx[4]=	"3"
			dx[5]=	"4"
			dx[6]=	"5"
			dx[7]=	"6"
			dx[8]=	"7"
			dx[9]=	"8"
			dx[10]=	"9"
			dx[11]=	"0"
			dx[12]=	"-"
			dx[13]=	"="
			dx[14]=	"BkSP"
			dx[15]=	"Tab"
			dx[16]=	"Q"
			dx[17]=	"W"
			dx[18]=	"E"
			dx[19]=	"R"
			dx[20]=	"T"
			dx[21]=	"Y"
			dx[22]=	"U"
			dx[23]=	"I"
			dx[24]=	"O"
			dx[25]=	"P"
			dx[26]=	"["
			dx[27]=	"]"
			dx[28]=	"Entr"
			dx[29]=	"LCtr"
			dx[30]=	"A"
			dx[31]=	"S"
			dx[32]=	"D"
			dx[33]=	"F"
			dx[34]=	"G"
			dx[35]=	"H"
			dx[36]=	"J"
			dx[37]=	"K"
			dx[38]=	"L"
			dx[39]=	";"
			dx[40]=	"'"
			dx[41]=	"~"
			dx[42]=	"LShf"
			dx[43]=	"\\"
			dx[44]=	"Z"
			dx[45]=	"X"
			dx[46]=	"C"
			dx[47]=	"V"
			dx[48]=	"B"
			dx[49]=	"N"
			dx[50]=	"M"
			dx[51]=	","
			dx[52]=	"."
			dx[53]=	"/"
			dx[54]=	"RShf"
			dx[55]=	"Num*"
			dx[56]=	"LAlt"
			dx[57]=	"Spce"
			dx[58]=	"Caps"
			dx[59]=	"F1"
			dx[60]=	"F2"
			dx[61]=	"F3"
			dx[62]=	"F4"
			dx[63]=	"F5"
			dx[64]=	"F6"
			dx[65]=	"F7"
			dx[66]=	"F8"
			dx[67]=	"F9"
			dx[68]=	"F10"
			dx[69]=	"NumL"
			dx[70]=	"ScrL"
			dx[71]=	"Num7"
			dx[72]=	"Num8"
			dx[73]=	"Num9"
			dx[74]=	"Num-"
			dx[75]=	"Num4"
			dx[76]=	"Num5"
			dx[77]=	"Num6"
			dx[78]=	"Num+"
			dx[79]=	"Num1"
			dx[80]=	"Num2"
			dx[81]=	"Num3"
			dx[82]=	"Num0"
			dx[83]=	"Num."
			dx[87]=	"F11"
			dx[88]=	"F12"
			dx[156]="NmEn"
			dx[157]="RCtr"
			dx[181]="Num/"
			dx[184]="RAlt"
			dx[199]="Home"
			dx[200]="UP"
			dx[201]="PgUP"
			dx[203]="LEFT"
			dx[205]="RGHT"
			dx[207]="End"
			dx[208]="DOWN"
			dx[209]="PgDN"
			dx[210]="Inst"
			dx[211]="Dele"
			dx[256]="LMou"
			dx[257]="RMou"
			dx[258]="MMoW"
			dx[259]="MoB3"
			dx[260]="MoB4"
			dx[261]="MoB5"
			dx[262]="MoB6"
			dx[263]="MoB7"
			dx[264]="MwUP"
			dx[265]="MwDN"
			
			
			
		}
		
		
		function storeMKeyCode(bindData){
			MKeyCode =  bindData
			
		}
		
		function storeMKeyMod(bindData){
			
			MKeyMod = bindData
			checkIfInstalled()
		}
		
		
		function checkIfInstalled(){
			
			for (var i=0; i < MKeyCode.length; i++){
				if(MKeyCode[i]!=0){
					foundMod(i)
				}
			}
			
			o.log.addLog("boot", "BINDS | "+installCount+" module(s) currently key bound...")			
			
		}

		function foundMod(i){
			if(o.scan.refMod[MKeyMod[i]]){
			   boundMods.push({id:MKeyMod[i], code:MKeyCode[i], ix:i})
			   refM[MKeyMod[i]] = new Object
			   refM[MKeyMod[i]] = boundMods[i]
			   installCount++
			}else{
			o.skyAll("0SA_Unbind", i) 
			o.log.addLog("boot", "BINDS | Bound Module Not Installed: "+MKeyMod[i]+". Unbinding...")
			}
			
			
		}

		function unbindModule(moduleID){
			if(refM[moduleID]){
			o.skyAll("0SA_Unbind", refM[moduleID].ix)
			MKeyMod[refM[moduleID].ix] = undefined
			MKeyCode[refM[moduleID].ix] = undefined
			refM[moduleID] = undefined	
			}
		}
		
		
		function bindModule(){
			MKeyCode[arguments[2]] = arguments[1]
			MKeyMod[arguments[2]] = arguments[0]
			if(!refM[arguments[0]]){
				 refM[arguments[0]] = new Object				 
				 var L = boundMods.push({id:arguments[0], code:arguments[1], ix:arguments[2]})
				 refM[arguments[0]] = boundMods[L-1]
			}else{
				refM[arguments[0]].id = arguments[0]
				refM[arguments[0]].code = arguments[1]
				refM[arguments[0]].ix = arguments[2]
			}
			
			if(callBack){
				callBack.fn.apply(callBack.scope)
			}
		}
		
		
		function isModuleKeyFree(key){
			var isFree = true
			var ix
			
			for(var i=0; i < MKeyCode.length; i++){
					if(key == MKeyCode[i]){
					ix = i
					isFree= false
					}
			}
			
			if(isFree){return "free"}
			else{return MKeyMod[ix]}
		}
		
		function storeOKey(binds){		
			OKey = binds
		}
		
		/**
		function makeSaveString(){
			var saveString = ""
			saveString+="E,"+OKey[0]
			saveString+="!M,"+OKey[1]
			saveString+="!U,"+OKey[2]
			saveString+="!D,"+OKey[3]
			saveString+="!L,"+OKey[4]
			saveString+="!R,"+OKey[5]
			saveString+="!T,"+OKey[6]
			saveString+="!Y,"+OKey[7]
			saveString+="!N,"+OKey[8]
			saveString+="!I,"+OKey[9]
			saveString+="!V,"+OKey[10]
			saveString+="!H,"+OKey[11]
			saveString+="!O,"+OKey[12]
			
			return saveString
		}
		*/
		
		function emergencyBinds(){
		o.log.addLog("run", "BINDS | Emergency OKey Rebind Triggered: Rebinding...")
		o.xplat.sysoi("aware")
		core.util.specialPanel.onotice(o,"emergencyRebindsActive",true,true)
        OKey[2] = 17
        OKey[3] = 31
        OKey[4] = 30
        OKey[5] = 32
        OKey[7] = 16
        OKey[8] = 18
        OKey[1] = 42

		}
}