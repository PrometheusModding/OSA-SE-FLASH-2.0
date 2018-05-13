
class core.config.configTemplate
{
	
var o

var ref

var soundTheme
var gfxAttireDefault

var playerSymbol
var playerSymbolString
var codepage
var autoCodepage
var helpMode
var purityMode
var metricMode
var devMode
var subColorHex
var subColor
var subColorCustom
var themeColorHex
var themeColor
var themeColorCustom


var internationalFont
var internationalFontSansSerif
var textOptUi
var dynamicIconDisplay
var skinToneDisplay
var navVanish
var logging

var allowMaleGenitalScaling
var allowBodyScaling
var sortRoleByAnimGender

var sortTieBreaker



var renameInGame
var renameNpc

var frostfallException

var fComDismemberment
var fComModernWeapons
var fComUltimates
var fComSupremes
var fComNaughty
var fComStripping
var fComSex

var fSexFantastical
var fSexRough

var fGenModernObjects
var fGenHypertaboo
var fGenPillage

var esgSettings0
var esgSettings1
var hideUnwornESG
var AIintlow1
var AIinthigh1
var AIintlow0
var AIinthigh0


var animRedressPlayer
var instaRedressPlayer
var animRedressNPC
var instaRedressNPC
var clothingAudio
var cuirassHasPants0
var cuirassHasPants1

var smallNavigationIcons
var largeMenuDescriptions
var dropShadowLightText
var dropShadowIcons
var dropShadowFlareText
var glowLightText
var glowFlareText
var iconShading



var _playerSymbol
var _playerSymbolString
var _codepage
var _autoCodepage
var _helpMode
var _purityMode
var _metricMode
var _devMode
var _subColorHex
var _subColor
var _themeColorHex
var _themeColor


var _internationalFont
var _internationalFontSansSerif
var _textOptUi
var _dynamicIconDisplay
var _skinToneDisplay
var _navVanish
var _logging

var _allowMaleGenitalScaling
var _allowBodyScaling
var _sortRoleByAnimGender



var _renameInGame
var _renameNpc
var _frostfallException

var _fComDismemberment
var _fComModernWeapons
var _fComUltimates
var _fComSupremes
var _fComNaughty
var _fComStripping
var _fComSex

var _fSexFantastical
var _fSexRough

var _fGenModernObjects
var _fGenHypertaboo
var _fGenPillage

var _esgSettings0
var _esgSettings1
var _hideUnwornESG
var _AIintlow1
var _AIinthigh1
var _AIintlow0
var _AIinthigh0

var _animRedressPlayer
var _instaRedressPlayer
var _animRedressNPC
var _instaRedressNPC
var _clothingAudio
var _cuirassHasPants0
var _cuirassHasPants1

var _smallNavigationIcons
var _largeMenuDescriptions
var _dropShadowLightText
var _dropShadowIcons
var _dropShadowFlareText
var _glowLightText
var _glowFlareText
var _iconShading

var tempMotif
var tempOSFX

		function configTemplate(core){
		o = core
		ref = []
		tempMotif = Number(1)
		tempOSFX = Number(1)
		
		soundTheme = "sky"
		gfxAttireDefault = []
		gfxAttireDefault.push({panty:"whites", socks:"tall", shirt:"tank", pants:"idk"})
		gfxAttireDefault.push({panty:"briefs", socks:"tall", shirt:"breeze", pants:"shorts"})

		}
		

		function expandSky(ini){		
			
		
			
			playerSymbol				=String(ini[1].toLowerCase())
			_playerSymbol				=1
			ref[1] = "playerSymbol"
			codepage					=String(ini[2])
			_codepage					=2
			ref[2] = "codepage"
			autoCodepage				=String(ini[3])
			_autoCodepage				=3
			ref[3] = "autoCodepage"
			helpMode					=String(ini[4])
			_helpMode					=4
			ref[4] = "helpMode"
			purityMode					=String(ini[5])
			_purityMode					=5
			ref[5] = "purityMode"
			metricMode					=String(ini[6])
			_metricMode					=6
			ref[6] = "metricMode"
			
			devMode						=String(ini[7])
			_devMode					=7
			ref[7] = "devMode"
			
			updatePlayerSymbol()
			
			subColor					=String(ini[8].toLowerCase())
			_subColor					=8
			ref[8] = "subColor"
			themeColor					=String(ini[9].toLowerCase())
			_themeColor					=9
			ref[9] = "themeColor"
			updateColor("subColor")
			updateColor("themeColor")
			
			sortRoleByAnimGender		=Number(ini[10])
			_sortRoleByAnimGender		=10
			ref[10] = "sortRoleByAnimGender"
			allowBodyScaling			=Number(ini[11])
			_allowBodyScaling			=11
			ref[11] = "allowBodyScaling"
			allowMaleGenitalScaling		=Number(ini[12])
			_allowMaleGenitalScaling	=12
			ref[12] = "allowMaleGenitalScaling"
			
			frostfallException			=Number(ini[19])
			_frostfallException			=19
			ref[19] = "frostfallException"
			
			internationalFont			=Number(ini[20])
			_internationalFont			=20
			ref[20] = "internationalFont"
			internationalFontSansSerif	=Number(ini[21])
			_internationalFontSansSerif	=21
			ref[21] = "internationalFontSansSerif"
			
			if(autoCodepage == 1){
				var resultFontStatus
				if(o.cfg.language == "english" || o.cfg.language == "spanish" || o.cfg.language == "french"){
					resultFontStatus = 0
				}else{
					resultFontStatus = 1
				}
				
				if(internationalFont != resultFontStatus){
					tog("internationalFont")
				}
			}
			
			updateFont()
			
			
			textOptUi					=String(ini[22])
			_textOptUi					=22
			ref[22] = "textOptUi"
			dynamicIconDisplay			=String(ini[23])
			_dynamicIconDisplay			=23
			ref[23] = "dynamicIconDisplay"
			skinToneDisplay				=String(ini[24])
			_skinToneDisplay			=24
			ref[24] = "skinToneDisplay"
			navVanish					=String(ini[25])
			_navVanish					=25
			ref[25] = "navVanish"
			
			logging						=String(ini[26])
			_logging					=26
			ref[26] = "logging"			
			
			renameInGame				=Number(ini[38])
			_renameInGame				=38
			ref[38] = "renameInGame"
			
			renameNpc					=Number(ini[39])
			_renameNpc					=39
			ref[39] = "RenameNpc"
			
			
			fGenPillage					=Number(ini[40])
			_fGenPillage				=40
			ref[40] = "fGenPillage"
			fGenHypertaboo				=Number(ini[41])
			_fGenHypertaboo				=41
			ref[41] = "fGenHypertaboo"
			fGenModernObjects			=Number(ini[42])
			_fGenModernObjects			=42
			ref[42] = "fGenHypertaboo"
			
			fComDismemberment			=Number(ini[50])
			_fComDismemberment			=50
			ref[50] = "fComDismemberment"
			fComModernWeapons			=Number(ini[51])
			_fComModernWeapons			=51
			ref[51] = "fComModernWeapons"
			fComUltimates				=Number(ini[52])
			_fComUltimates				=52
			ref[52] = "fComUltimates"
			fComSupremes				=Number(ini[53])
			_fComSupremes				=53
			ref[53] = "fComSupremes"
			fComNaughty					=Number(ini[54])
			_fComNaughty				=54
			ref[54] = "fComNaughty"
			fComStripping				=Number(ini[55])
			_fComStripping				=55
			ref[55] = "fComStripping"
			fComSex						=Number(ini[56])
			_fComSex					=56
			ref[56] = "fComSex"
			
			fSexFantastical				=Number(ini[60])
			_fSexFantastical			=60
			ref[60] = "fSexFantastical"
			fSexRough					=Number(ini[61])
			_fSexRough					=61
			ref[61] = "fSexRough"
			

			esgSettings0				=String(ini[80])
			_esgSettings0				=80
			ref[80] = "esgSettings0"
			esgSettings1				=String(ini[81])
			_esgSettings1				=81
			ref[81] = "esgSettings1"
										saveESG(esgSettings0, 0)
										saveESG(esgSettings1, 1)
										
			hideUnwornESG				=Number(ini[82])
			_hideUnwornESG				=82
			ref[82] = "hideUnwornESG"



			AIintlow1					=Number(ini[83])
			_AIintlow1					=83
			ref[83] = "AIintlow1"
			
			AIinthigh1					=Number(ini[84])
			_AIinthigh1					=84
			ref[84] = "AIinthigh1"
			
			AIintlow0					=Number(ini[85])
			_AIintlow0					=85
			ref[85] = "AIintlow0"
			
			AIinthigh0					=Number(ini[86])
			_AIinthigh0					=86
			ref[86] = "AIinthigh0"

			
			
			animRedressPlayer			=Number(ini[93])
			_animRedressPlayer			=93
			ref[93] = "animRedressPlayer"
			
			instaRedressPlayer			=Number(ini[94])
			_instaRedressPlayer			=94
			ref[94] = "instaRedressPlayer"
			
			animRedressNPC				=Number(ini[95])
			_animRedressNPC				=95
			ref[95] = "animRedressNPC"
			
			instaRedressNPC				=Number(ini[96])
			_instaRedressNPC			=96
			ref[96] = "instaRedressNPC"
			
			clothingAudio				=Number(ini[97])
			_clothingAudio				=97
			ref[97] = "clothingAudio"

			cuirassHasPants0			=Number(ini[98])
			_cuirassHasPants0			=98
			ref[98] = "cuirassHasPants0"
			
			cuirassHasPants1			=Number(ini[99])
			_cuirassHasPants1			=99
			ref[99] = "cuirassHasPants1"
			

			smallNavigationIcons		=Number(ini[100])
			_smallNavigationIcons		=100
			ref[100] = "smallNavigationIcons"
			
			largeMenuDescriptions		=Number(ini[101])
			_largeMenuDescriptions		=101
			ref[101] = "largeMenuDescriptions"
			
			dropShadowLightText			=Number(ini[102])
			_dropShadowLightText		=102
			ref[102] = "dropShadowLightText"
			
			dropShadowIcons				=Number(ini[103])
			_dropShadowIcons			=103
			ref[103] = "dropShadowIcons"
			
			dropShadowFlareText			=Number(ini[104])
			_dropShadowFlareText		=104
			ref[104] = "dropShadowFlareText"
			
			glowLightText				=Number(ini[105])
			_glowLightText				=105
			ref[105] = "glowLightText"
			
			glowFlareText				=Number(ini[106])
			_glowFlareText				=106
			ref[106] = "glowFlareText"
			
			iconShading					=Number(ini[107])
			_iconShading				=107
			ref[107] = "iconShading"

		}
		
		
		function saveESG(s, g){
			o.cfg.esg.buildESG(s, g)
			o.skyAll("0SA_INIBool", s, Number(String("8"+g)))	
		}
		
		function updateColor(color){
				this[color+"Custom"]=false
				
			if(this[color]=="U!"){
				this[color+"Hex"]=Number("0x"+o.cfg.xconfig.menuMajor[0].dRGB[0][color])
				this[color+"Custom"]=true
				
			}else{
				
				if(this[color]=="op"){this[color+"Hex"]=Number("0xE86570")}//OP PINK
				else if(this[color]=="ic"){this[color+"Hex"]=Number("0x19C4BD")}// ICE
				else if(this[color]=="be"){this[color+"Hex"]=Number("0xE2BA59")}// BEE
				else if(this[color]=="wh"){this[color+"Hex"]=Number("0xFFFFFF")}// WHITE
				else if(this[color]=="ve"){this[color+"Hex"]=Number("0x39B54A")}// VENOM
				else if(this[color]=="pc"){this[color+"Hex"]=Number("0x088A85")}// PEACOCK
				else if(this[color]=="ab"){this[color+"Hex"]=Number("0x2A2A2A")}// ABYSS
				else if(this[color]=="ap"){this[color+"Hex"]=Number("0xF7941E")}// APRICOT
				else if(this[color]=="gr"){this[color+"Hex"]=Number("0xA16FAF")}// GRAPE
				else if(this[color]=="sn"){this[color+"Hex"]=Number("0xD3B494")}// SAND 
				else if(this[color]=="sm"){this[color+"Hex"]=Number("0xBCBEC0")}// SMOKE 
				else if(this[color]=="cs"){this[color+"Hex"]=Number("0x8DC63F")}// CHARTREUSE 
				else if(this[color]=="mi"){this[color+"Hex"]=Number("0x7AC798")}// MINT 
				else if(this[color]=="rc"){this[color+"Hex"]=Number("0xEC2127")}// CHERRY
				else if(this[color]=="cg"){this[color+"Hex"]=Number("0xE5CC61")}// CHAMPAGNE
				else if(this[color]=="ro"){this[color+"Hex"]=Number("0xB9529F")}// ROYAL
				else if(this[color]=="li"){this[color+"Hex"]=Number("0xDEBEDB")}// LILY
				else if(this[color]=="sr"){this[color+"Hex"]=Number("0xD95D66")}// SOFT RED
				else if(this[color]=="mv"){this[color+"Hex"]=Number("0xB71E53")}// MAUVE
				else if(this[color]=="bg"){this[color+"Hex"]=Number("0x991B1F")}// BURG
				else if(this[color]=="nv"){this[color+"Hex"]=Number("0x1C75BC")}// NAVY
				else if(this[color]=="ds"){this[color+"Hex"]=Number("0x4365AF")}// DEEP SEA
			}
		}
		
		function updatePlayerSymbol(){
			if(playerSymbol=="!dg"){playerSymbolString=String("genders")}
			else if(playerSymbol=="!nm"){playerSymbolString=String("name")}
			else if(playerSymbol=="omg"){playerSymbolString=String("omega")}
			else if(playerSymbol=="oct"){playerSymbolString=String("octopus")}
			else if(playerSymbol=="rab"){playerSymbolString=String("rabbit")}
			else if(playerSymbol=="dev"){playerSymbolString=String("develop")}	
			else if(playerSymbol=="tst"){playerSymbolString=String("test")}	
			
		}
		
		function updateFont(){
			if(internationalFont == 1){
				if(internationalFontSansSerif ==1){
				o.fonts.l = "OArial"
				o.fonts.m = "OArial"
				}else{
				o.fonts.l = "OTimes"
				o.fonts.m = "OTimes"
				}
			}else{
				o.fonts.l = "OFontL"
				o.fonts.m = "OFontM"
			}
		}
		
		function tog(prop){			
			if(this[prop]==1){this[prop]=0}		
			else{this[prop]=1}
			o.skyAll("0SA_INIBool", this[prop], Number(this["_"+prop]))			
		}
		
		function xTog(prop, xprop){			
			if(this[prop]==1){
				this[prop]=0
				o.skyAll("0SA_INIBool", this[prop], Number(this["_"+prop]))	
			}else{
				this[prop]=1
				o.skyAll("0SA_INIBool", this[prop], Number(this["_"+prop]))	
					if(this[xprop]=1){
						this[xprop]=0
						o.skyAll("0SA_INIBool", this[xprop], Number(this["_"+xprop]))	
					}
				}
		}
		
		function newColor(prop, newTheme){			
			this[prop]=newTheme
			updateColor(prop)
			o.skyAll("0SA_INIBool", this[prop], Number(this["_"+prop]))			
		}
		
		function newPlayerSymbol(prop, newSymbol){			
			this[prop]=newSymbol
			updatePlayerSymbol()
			o.skyAll("0SA_INIBool", this[prop], Number(this["_"+prop]))			
		}
		
		function togTemp(prop){			
			if(this[prop]==1){this[prop]=0}		
			else{this[prop]=1}		
		}
		
		function togFont(prop){			
			if(this[prop]==1){this[prop]=0}		
			else{this[prop]=1}
			o.skyAll("0SA_INIBool", this[prop], Number(this["_"+prop]))		
			updateFont()
		}
		
		
		
		function makeSaveString(){
			var saveString = ""
			for (var i=0; i < ref.length; i++){
				if(ref[i]){
					saveString+= "$2$"+ref[i]+"$1$"+this[ref[i]]
				}else{
					saveString+= "$2$"+"NoEn"
				}
			}
			
			return saveString.substr(3)
		}
		
		function loadSaveString(saveString){
					var saveArray = saveString.split("$2$");
		
			for (var i=0; i < saveArray.length; i++){
					var entryData = saveArray[i].split("$1$")
					
					if(entryData[0]!="NoEn"){
						if(this["_"+entryData[0]]){
							 this[entryData[0]]  = entryData[1]
						}
						
					}
			}
			
			updatePlayerSymbol()
			updateColor("subColor")
			updateColor("themeColor")
			updateFont()
			saveESG(esgSettings0, 0)
			saveESG(esgSettings1, 1)
										
			fullPropagate()
		}
		
		function fullPropagate(){
			var loadString = ""
			
			for (var i=0; i < ref.length; i++){
				if(ref[i]){
					loadString+= ","+this[ref[i]]
				}
			}
			o.log.addMaj("Propagating Settings...")
			o.skyString("0SA_INIFull", loadString.substr(1))	
		}
		
		
		

					
}