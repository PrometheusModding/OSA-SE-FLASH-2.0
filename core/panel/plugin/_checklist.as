

class core.panel.plugin._checklist extends MovieClip
{
	
public var o
public var m
public var dia
public var actra

var panel
var menuTitle

var profileMode

var panDat

var VPin
var VPinCount


var HPoint

var phase2
var phase1
var phase0
var installed
var currentHead
var typeHead
var typeEntry
var VPinMax
		
		public function _checklist(){	
				
				VPinCount = 0
				VPin = []
				
				panel = this
				if(m.dia){panDat = o.lib.PLib.get(m.dia.module.id)}
				else{panDat = m.dataPin.pandect}

				HPoint = -15
				VPinMax = 12
				VPin[0] = -240
				VPin[1] = -220
				VPin[2] = -200
				VPin[3] = -180
				VPin[4] = -160
				VPin[5] = -140
				VPin[6] = -120
				VPin[7] = -100
				VPin[8] = -80
				VPin[9] = -60
				VPin[10] = -40
				VPin[11] = -20
				VPin[12] = 0
				
				makeOverlay()
			}
			
		
		
			function getVPin(): Number{
			if(VPinCount > VPinMax){
			VPinCount = 0
			HPoint-=150}			
			VPinCount++
			return VPin[VPinCount-1]
			}
			
			public function makeOverlay(){
				

				typeEntry = new TextFormat();
				typeEntry.letterSpacing = 1.4
				typeEntry.font = o.fonts.l
				typeEntry.color = 0xffffff
				typeEntry.size = 13
				
				

				
				phase2= []
				phase1= []
				phase0= []				
				installed= []
				
				var titleBox = this.attachMovie("genericText", "title", this.getNextHighestDepth(), {_y:-280, _x:HPoint});
				titleBox.val.htmlText = o.cfg.lang.pluginOverview.toUpperCase()
				titleBox.val.setTextFormat(typeEntry);
				titleBox.val.autoSize = "right";
				
				typeEntry = new TextFormat();
				typeEntry.letterSpacing = 1.1
				typeEntry.font = o.fonts.l
				typeEntry.color = 0xffffff
				typeEntry.size = 10
					
							for (var i=0; i < panDat.plugin.length; i++){
								
								if(o.scan.refMod[panDat.id].plug[panDat.plugin[i].id]){installed.push(panDat.plugin[i])}
								else{this["phase"+panDat.plugin[i].phase].push(panDat.plugin[i])}
							}
					
				typeHead = new TextFormat();
				typeHead.letterSpacing = 1.1
				typeHead.font = o.fonts.l
				typeHead.color = 0xcccccc
				typeHead.size = 10
				
				
					if(installed[0]){
						currentHead = "Installed"
						createHeader("Installed")
					
							for (var i=0; i < installed.length; i++){	
								createPlugin(installed[i])
								trace(installed[i].name)
							}
					}
										
					if(phase0[0]){	
					currentHead = "Available"
						createHeader("Available")
								
						for (var i=0; i < phase0.length; i++){	
							createPlugin(phase0[i])
							trace(phase0[i].name)
						}
					}
					
					if(phase1[0]){	
					currentHead = "Alpha"
						createHeader("Alpha")
						
						for (var i=0; i < phase1.length; i++){	
							createPlugin(phase1[i])
							trace(phase1[i].name)
						}
					}
					
					if(phase2[0]){
						currentHead = "Development"
						createHeader("Development")
						
						for (var i=0; i < phase2.length; i++){	
							createPlugin(phase2[i])
							trace(phase1[2].name)
						}
					}
				
				
				OADraw.OLine(this, 0, 0, 0, -300, "0xFFFFFF", .25)
			}
			
			function createHeader(headerTitle){
				
				var typeHead = new TextFormat();
				typeHead.letterSpacing = 1.2
				typeHead.font = o.fonts.l
				typeHead.color = 0xcccccc
				typeHead.size = 9
				
				var header = this.attachMovie("genericText", "nameVaR", this.getNextHighestDepth(), {_y:getVPin()+8, _x:HPoint})	
				
				
				
				header.val.htmlText = headerTitle.toUpperCase() 
				header.val.setTextFormat(typeHead);
				header.val.autoSize = "right";

				header.lineStyle(1, 0xcccccc, 100, true, "none", "round", "miter", 0.25);
				header.moveTo(0, header.val._y+18);
				header.lineTo(0-125, header.val._y+18);
				
				getVPin()
			}
				
			
			function createPlugin(plug){
				
				
				if(VPinCount > VPinMax){
					VPinCount = 0
					HPoint-=150			
					createHeader(currentHead+" "+o.cfg.lang.continuedAbb)
				}
				
				
				var textfield = this.attachMovie("genericText", "text"+plug.id, this.getNextHighestDepth(), {_y:getVPin(), _x:HPoint});
				textfield.val.htmlText = plug.name
				textfield.val.setTextFormat(typeEntry);

			}
			

			

}