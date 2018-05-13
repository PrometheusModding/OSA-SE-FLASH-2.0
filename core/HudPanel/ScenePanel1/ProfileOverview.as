

class ProfileSplash extends MovieClip
{
	
public var o
public var dia
public var actra
public var proDat
public var profileMode
public var horizon
var panel

var VPin
var VPinCount

var HPoint
var VPinMax
var HPinPush

var varText
var valText
var headerText


var lastHeader
var headerCount 
			public function ProfileSplash(){	
				panel = this
				headerCount = false
				
			}
			
			public function buildFull(){
			
				VPinCount = 0
				VPin = []

				VPinMax = 8
				HPinPush = 135
				HPoint = horizon
				
				VPin[0] = -200
				VPin[1] = -175
				VPin[2] = -150
				VPin[3] = -125
				VPin[4] = -100
				VPin[5] = -75
				VPin[6] = -50
				VPin[7] = -25
				VPin[8] = 0
				
				makeOverlay()				
			
			}
		
			function getVPin(): Number{
			if(VPinCount > VPinMax){
			VPinCount = 0
			HPoint-=HPinPush}
			
			VPinCount++
			return VPin[VPinCount-1]
			}
			
			
			function makeOverlay(){
			
				varText = new TextFormat();
				varText.letterSpacing = 1.2
				varText.font = o.fonts.l
				
				valText = new TextFormat();
				valText.letterSpacing = 1.2
				valText.font = o.fonts.m
				
				
				var valueText
				
				valueText = createStat("age", o.cfg.lang.age)
				valueText.htmlText=proDat.age
				valueText.font = o.fonts.l
				valueText.setTextFormat(varText);
				
				headerText = new TextFormat();
				headerText.letterSpacing = 1
				headerText.font = o.fonts.l 
				

				if(o.cfg.config.metricMode==1){
					
					valueText = createStat("height", o.cfg.lang.height)
					valueText.htmlText = core.util.units.heightSkyToMetric(actra.body.bodyScale, Number(o.cfg.units.height[actra.gender].ratioVirtualToEarth), true)
					valueText.setTextFormat(valText);
					
					valueText = createStat("weight", o.cfg.lang.weight)
					valueText.htmlText = Math.floor(core.util.units.weightUSAtoMetric(actra.body.weightEarthOrig))+" kg"
					valueText.setTextFormat(valText);					
					
				}else{
					
					valueText = createStat("height", o.cfg.lang.height)
					valueText.htmlText = core.util.units.heightSkyToUSA(actra.body.bodyScale, Number(o.cfg.units.height[actra.gender].ratioVirtualToEarth), true)
					valueText.setTextFormat(valText);
					
					valueText = createStat("weight", o.cfg.lang.weight)
					valueText.htmlText = Math.floor(actra.body.weightEarthOrig)+" Pounds"
					valueText.setTextFormat(valText);
				}				
				
				
				valueText = createStat("physique", o.cfg.lang.physique)
					valueText.htmlText = proDat.physique
					valueText.setTextFormat(valText);

				
				createHeader(o.cfg.lang.titleHeritage)
				
					valueText = createStat("nation", o.cfg.lang.nation)
					valueText.htmlText = proDat.nation
					valueText.setTextFormat(valText);
					
					valueText = createStat("birthPlace", o.cfg.lang.birthPlace)
					valueText.htmlText = proDat.birthPlace
					valueText.setTextFormat(valText);
					
					valueText = createStat("familyName", o.cfg.lang.familyName)
					valueText.htmlText = proDat.familyName
					valueText.setTextFormat(valText);
					
					valueText = createStat("species", o.cfg.lang.species)
					valueText.htmlText = proDat.species
					valueText.setTextFormat(valText);

				
				createHeader(o.cfg.lang.titleName)
				
					valueText = createStat("nickName", o.cfg.lang.nickName)
					valueText.htmlText = proDat.nickName
					valueText.setTextFormat(valText);


				createHeader(o.cfg.lang.titleTradeSkill)
				
					valueText = createStat("classType", o.cfg.lang.classType)
					valueText.htmlText = proDat.classType
					valueText.setTextFormat(valText);
					
					valueText = createStat("profession", o.cfg.lang.profession)
					valueText.htmlText = proDat.profession
					valueText.setTextFormat(valText);

				
				
				createHeader(o.cfg.lang.titleAstrology)
				
				valueText = createStat("birthDate", o.cfg.lang.birthDate)
				valueText.htmlText = proDat.birthDate
				valueText.setTextFormat(valText);
				
				valueText = createStat("birthSign", o.cfg.lang.birthSign)
				valueText.htmlText = proDat.birthSign
				valueText.setTextFormat(valText);
				
				valueText = createStat("birthYear", o.cfg.lang.birthYear)
				valueText.htmlText = proDat.birthYear
				valueText.setTextFormat(valText);
				
				valueText = createStat("birthStone", o.cfg.lang.birthStone)
				valueText.htmlText = proDat.birthStone
				valueText.setTextFormat(valText);
				
				
				
				createHeader(o.cfg.lang.titleSpirit)
				
				valueText = createStat("belief", o.cfg.lang.belief)
				valueText.htmlText = proDat.belief
				valueText.setTextFormat(valText);
				
				valueText = createStat("diety", o.cfg.lang.diety)
				valueText.htmlText = proDat.diety
				valueText.setTextFormat(valText);
				
				createHeader(o.cfg.lang.titleLibido)
				
				valueText = createStat("sexOrientation", o.cfg.lang.sexOrientation)
				valueText.htmlText = proDat.sexOrientation
				valueText.setTextFormat(valText);

				


					
				checkHeader()
			}

			function checkHeader(){
				if(!headerCount){
					lastHeader.removeMovieClip()
				}
				headerCount = false
			}
			
			function createHeader(headerTitle){
				checkHeader()
				if(VPinMax-VPinCount < 2){
				HPoint-=HPinPush
				VPinCount = 0
				}
				
				lastHeader = this.attachMovie("type2RListHead", headerTitle, this.getNextHighestDepth(), {_y:getVPin(), _x:HPoint-120});
				
				lastHeader.val.autoSize = "left";
				
				var liner = lastHeader.createEmptyMovieClip("line"+headerTitle, this.getNextHighestDepth()); 
				
				lastHeader.val.htmlText = headerTitle.toUpperCase() 
				lastHeader.val.setTextFormat(headerText);
				liner.lineStyle(1, 0xcccccc, 100, true, "none", "round", "miter", 0.25);
				liner.moveTo(0, 7);
				liner.lineTo(75, 7);
			}
			
			function createStat(statIni, statName){
				if(!proDat[statIni+"Block"]){
					if(proDat[statIni]){
						this.attachMovie("type2RListVal", statIni+"Val", this.getNextHighestDepth(), {_y:getVPin(), _x:HPoint});						
						this.attachMovie("type2RListName", statIni+"Name", this.getNextHighestDepth(), {_y:this[statIni+"Val"]._y, _x:this[statIni+"Val"]._x-120});
						this[statIni+"Name"].val.htmlText = statName
						this[statIni+"Name"].val.setTextFormat(varText); 
						headerCount = true
						return this[statIni+"Val"].val
					}else{return false}
				}else{return false}
			}
				
				
			

}