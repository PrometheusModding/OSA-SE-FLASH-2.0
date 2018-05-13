

class core.dias.sec.endDiasa{
	

		public static function concludeDiasa(o, d){
			d.stageAlive = false
			d.stageAlive = undefined
			d.navOff()
			d.sceneOff()
			d.scena.endScene()
			
			for (var i=0; i < d.actra.length; i++) {
			d.actra[i].exitStage()
			}
			
			for (var i=0; i < d.actra.length; i++) {
				core.dias.sec.endDiasa.endActra(o, d, d.actra[i], i)
			}
			o.sky("0SAO"+d.id+"_OEnd")
			d.clearScope()
		}
		
		public static function endActra(o, d, actra, roleIndex){
				actra.exitStage()
				
				if(d.module.role[roleIndex].esg[0].post==1){
				
						
						if(actra.isPlayer=="1"&&o.cfg.config.animRedressPlayer=="1"){
							core.dias.sec.endDiasa.actraRedress(o, d, actra)
						}else if(actra.isPlayer=="0"&&o.cfg.config.animRedressNPC=="1"){
							core.dias.sec.endDiasa.actraRedress(o, d, actra)	
						}else if(actra.isPlayer=="1"&&o.cfg.config.instaRedressPlayer=="1"){
							actra.equip.attire.redress()
							o.sky("0SAA"+actra.id+"_ActraEnd")
						}else if(actra.isPlayer=="0"&&o.cfg.config.instaRedressNPC=="1"){
							actra.equip.attire.redress()
							o.sky("0SAA"+actra.id+"_ActraEnd")
						}
						
				}else{
				o.sky("0SAA"+actra.id+"_ActraEnd")
				}
		}




		
		public static function actraRedress(o, d, actra){
			actra.clean() 
			var actraXFER = []
			actraXFER[0] = actra.id
			var newFlags = new core.dias.flags(o)
			newFlags.xfer = true
			var stageTrigger = {dia:"", module:"_ESG", scene:"0ER|_TOG|OM|ESGRedress" ,actra:actraXFER, uiGen:true, flags:newFlags}
			core.dias.sec.endDiasa.xferNewStage(o, stageTrigger)
		}
	
		public static function xferNewStage(o, trig){
			trig.dia = o.diaso.getUStageID()
			o.diaso.startStage(trig)
			o.skyString("0SAA"+trig.actra[0]+"_CenterActro", String(trig.dia))
			
			for (var i=1; i < trig.actra.length; i++) {
			o.skyString("0SAA"+trig.actra[i]+"_ChangeStage", String(trig.dia))
			}

			
			
		}
		
	
}