
class core.dias.util.diasFunc
{


		
		public static function detectPlayer(o, d){
			var playerFound = false
			//new

			
			for (var i=0; i < d.actra.length; i++){
				if(d.actra[i].isPlayer == true){
					d.playerIs = i
					d.playerActor = true
					d.playerEye = true
					o.viewStage = d
					d.playerFound = true
				}
			}
			if(playerFound = false){
				d.playerActor = false
				d.playerIs = undefined
			}			
		}
		
		public static function roleSetup(o, d){

			d.roleData = []
			
			for (var i=0; i < d.actra.length; i++){
				var roleHue = new flash.geom.ColorTransform(0, 0, 0, 1, Number("0x"+d.module.role[i].gfx[0].hue.substring(0,2)), Number("0x"+d.module.role[i].gfx[0].hue.substring(2,4)), Number("0x"+d.module.role[i].gfx[0].hue.substring(4,6)), 0); 
				var nameHue =  new flash.geom.ColorTransform(0, 0, 0, 1, Number("0x"+d.module.role[i].gfx[0].namehue.substring(0,2)), Number("0x"+d.module.role[i].gfx[0].namehue.substring(2,4)), Number("0x"+d.module.role[i].gfx[0].namehue.substring(4,6)), 0); 
				var gfxHue =  new flash.geom.ColorTransform(0, 0, 0, 1, Number("0x"+d.module.role[i].gfx[0].gfxhue.substring(0,2)), Number("0x"+d.module.role[i].gfx[0].gfxhue.substring(2,4)), Number("0x"+d.module.role[i].gfx[0].gfxhue.substring(4,6)), 0); 
				d.roleData.push({hue:{roleHue:roleHue, nameHue:nameHue, gfxHue:gfxHue}})
			}			
		}
		
		public static function buildActro(o, d){
			d.actro = new Object
			for (var i=0; i < d.actra.length; i++) {
				d.actro[d.actra[i].id] = new Object
				d.actro[d.actra[i].id] = d.actra[i]
				d.actro[d.actra[i].id].i = new Object
				d.actro[d.actra[i].id].i = i
								
			}
		}
		
		public static function positionActra(o, d){
			var sceneLocation = 0
			
			if(d.flags.loc){
					if(d.flags.loc.length==1){
						o.skyStringNum("0SAO"+d.id+"_AlignTo", d.flags.loc, 0)
					}else{
						o.skyStringNum("0SAO"+d.id+"_AlignTo", d.flags.loc, 1)
						}
			}else{			
				if(d.playerActor){sceneLocation = d.playerIs}
						o.skyStringNum("0SAO"+d.id+"_AlignTo", sceneLocation, 0)
			}
		}
		
		public static function livePositionActra(o, d){
			o.skyStringNum("0SAO"+d.id+"_AlignTo", d.flags.loc, 2)
		}
		
		public static function addActra(o, d, actraID, actraTrueID, sceneID){
			d.queActra.push(actraID)
			d.queScene = sceneID
			d.initPrep()
			actraInvite(o,d,actraID, actraTrueID)
		}
		
		public static function removeActra(o, d, actraIndex, sceneID){
			var removedActra = d.actra[actraIndex]
			d.actra[actraIndex] = undefined
			d.queScene = sceneID
			var tempActra = []
			
			for (var i=0; i < d.actra.length; i++){	
				if(d.actra[i]){
					tempActra.push(d.actra[i])
				}
			}
			d.actra = tempActra
			
			o.skyString("0SAO"+d.id+"_ActraRemove", actraIndex)
			core.dias.sec.endDiasa.endActra(o, d, removedActra, actraIndex)
		}
		
		public static function actraInvite(o, d, actraID, actraTrueID){
			o.skyAll("0SAO"+d.id+"_ActraJoin", actraID, 0, actraTrueID)
			    o.log.addLog("run", "Request to process new Actor sent to Actro...")
				o.log.addLog("run", "actraID: "+actraID+" | actraTrueID: "+actraTrueID)
			if(o.flashDevMode){			
				o.log.addLog("run", "WARNING: DeveloperMode Switch ByPass used in diasfunc.actraInvite()...")
				o.sim.mimicGameCall(d.initCheckActra, d)
				
			}
		}
		
}	


