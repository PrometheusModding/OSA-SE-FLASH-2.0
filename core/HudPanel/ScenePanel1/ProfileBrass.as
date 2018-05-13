

class ProfileBrass extends MovieClip
{
	
public var o
public var dia
public var actra
public var proDat
public var profileMode
public var horizon

var panel
var yLoc
var type
var cur

var classTypeWidth

			public function ProfileBrass(){		
				classTypeWidth = false
				panel = this
				
				this._x = horizon
				yLoc = -44
				

			}
			
			
			function buildFull(){
				this._x = horizon
				
				
				
				if(proDat.popClassType==1){showClassType(yLoc)}

				var xLoc
				if(classTypeWidth){
					xLoc = -30-classTypeWidth
				}else{xLoc = this._x}
				if(proDat.popAffiliation==1){showAffiliation(yLoc, xLoc)}
				
				
				yLoc -= 100	
				
				if(1==1){showRace(yLoc)}
				
				yLoc -= 40
				
				showName(yLoc)			

			}
			
			function buildShort(){	
				this._x = horizon
				showName(yLoc)	
			}
			
			function showName(yLocation){
				type = new TextFormat();
				type.letterSpacing = 1.3
				type.font = o.fonts.m
				type.size = 36
				
				if(proDat.colorName){
				   type.color = "0x"+proDat.colorName	
				}
				
				cur = this.attachMovie("genericText", "nameVal", this.getNextHighestDepth(), {_y:yLocation}).val					
				cur.htmlText = actra.name
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				
				type = new TextFormat();
				type.letterSpacing = 1.1
				type.size = 9
				
				if(proDat.includeTitle==1){
				cur = this.attachMovie("genericText", "titleVal", this.getNextHighestDepth(), {_y:yLocation+40}).val					
				cur.htmlText = proDat.title
				cur.setTextFormat(type);
				cur.autoSize = "right";
				}
			}
			
			function showRace(yLocation){
				
				var xPush = 0
				
				
				
					if(!proDat.genderSymbolBlock){
						if(actra.gender=="0"){
						cur = this.attachMovie("proMale", "genderIcon", this.getNextHighestDepth(), {_y:yLocation+36})
						cur._yscale = 125
						cur._xscale = 125
						xPush -= 45
						}else{
						cur = this.attachMovie("proFemale", "genderIcon", this.getNextHighestDepth(), {_y:yLocation+36})
						cur._yscale = 140
						cur._xscale = 140
						xPush -= 30
						}
						
						
					}
				
				type = new TextFormat();
				type.letterSpacing = 1.2
				type.font = o.fonts.m
				type.size = 17
				
				cur = this.attachMovie("genericText", "raceVal", this.getNextHighestDepth(), {_y:yLocation+25, _x:xPush}).val					
				
				
				
				if(proDat.speciesMode==1){
					if(proDat.speciesModePlusRace==1){
						
						cur.htmlText = proDat.race+" | "+proDat.species
					}else{cur.htmlText = proDat.species}
				}else{cur.htmlText = actra.race}
				

				
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				if(proDat.includeNation==1){
				type = new TextFormat();
				type.letterSpacing = 1.2
				type.size = 9.5
				
				cur = this.attachMovie("genericText", "raceVal", this.getNextHighestDepth(), {_y:yLocation+47, _x:xPush}).val					
				cur.htmlText = "of "+proDat.nation
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
				}else{
				this["raceVal"]._y+=10	
				}
			}
			
			function showAffiliation(yLocation, xLocation){
				
				type = new TextFormat();
				type.letterSpacing = 1.2
				type.font = o.fonts.m
				type.size = 16
				
				cur = this.attachMovie("genericText", "affiliationVal", this.getNextHighestDepth(), {_y:yLocation, _x:xLocation}).val					
				cur.htmlText = proDat.affiliation
				cur.setTextFormat(type);
				cur.autoSize = "right";
				
					if(proDat.includeAffiliationRank == 1){
						
						
						type = new TextFormat();
						type.letterSpacing = 1.2
						type.size = 10
						
						cur = this.attachMovie("genericText", "affiliationRankVal", this.getNextHighestDepth(), {_y:yLocation-14, _x:xLocation}).val					
						cur.htmlText = proDat.affiliationRank
						cur.setTextFormat(type);
						cur.autoSize = "right";					
					}
					
					if(proDat.includeAffiliationUnit == 1){
						
						
						type = new TextFormat();
						type.letterSpacing = 1.1
						type.size = 9
						
						cur = this.attachMovie("genericText", "affiliationUnitVal", this.getNextHighestDepth(), {_y:yLocation+25, _x:xLocation}).val					
						cur.htmlText = proDat.affiliationUnit
						cur.setTextFormat(type);
						cur.autoSize = "right";					
					}
			}
			
			
			
			function showClassType(yLocation){
				
				type = new TextFormat();
				type.letterSpacing = 1.2
				type.font = o.fonts.m
				type.size = 16
				
				if(proDat.colorClassType){
				   type.color = "0x"+proDat.colorClassType	
				}
				
				cur = this.attachMovie("genericText", "classTypeVal", this.getNextHighestDepth(), {_y:yLocation}).val					
				cur.htmlText = proDat.classType
				cur.setTextFormat(type);
				cur.autoSize = "right";
				classTypeWidth=cur._width

					if(proDat.includeClassTypeSkill == 1){
						
						
						type = new TextFormat();
						type.letterSpacing = 1.1
						type.size = 10
						
						cur = this.attachMovie("genericText", "classTypeSkillVal", this.getNextHighestDepth(), {_y:yLocation-14}).val					
						cur.htmlText = proDat.classTypeSkill
						cur.setTextFormat(type);
						cur.autoSize = "right";					
					}
					
					if(proDat.includeClassTypeLevel == 1){
						
						
						type = new TextFormat();
						type.letterSpacing = 1.1
						type.font = o.fonts.m
						type.size = 9
						
						cur = this.attachMovie("genericText", "classTypeLevelVal", this.getNextHighestDepth(), {_y:yLocation+25}).val					
						cur.htmlText = proDat.levelAbb+" "+proDat.classTypeLevel
						cur.setTextFormat(type);
						cur.autoSize = "right";					
					}
					
					

				
			}
			
	
}