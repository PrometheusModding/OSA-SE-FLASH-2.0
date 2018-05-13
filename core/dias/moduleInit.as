
import skse; 

class core.dias.moduleInit{

var o
var dia

		public function moduleInit(core, diasa){
		o = core
		dia = diasa
		
			for (var i=0; i < dia.module.init.length; i++){
				this[dia.module.init[i].cmd](dia.module.init[i])
			}
		}
	
		function nofuse(initUnit){
			skse.SendModEvent("0SAA"+dia.actra[initUnit.a].id+"_NoFuse")			
		}
		

		function flags(initUnit){
			dia.flags[initUnit.id] = initUnit.val
		}
		
		public function preload(initUnit){
			if(initUnit.id.toLowerCase()=="persona"){
					
					if(!dia.actra[initUnit.a].formBound){
						if(!dia.actra[initUnit.a].dat.personaData){
						var scout = new Scout(o)
						scout.retrieveActraData("persona", dia.actra[initUnit.a], undefined)
						}else{dia.actra[initUnit.a].formBind()}
					}
			}
		}
		
		public function swapactors(initUnit){
			var tempActra = []
			tempActra[initUnit.swap.charAt(0)] = dia.actra[initUnit.swap.charAt(1)]
			tempActra[initUnit.swap.charAt(1)] = dia.actra[initUnit.swap.charAt(0)]
			
			dia.actra = tempActra
		}
		
		public function sortactors(initUnit){
			trace("SORT ACTRA HAPPENED")
		var tempActro = []
		
			
			
						if (initUnit.bygender = 1){
									if(o.cfg.config.sortRoleByAnimGender){
										
										trace("ACTRA SORT BY GENDER HAPPENING")
										var missMale = []
										var missFemale = []
										var freeMale = []
										var freeFemale = []
										var ActroGen = []
										var correctActra = []
										
										for (var act=0; act < dia.actra.length; act++)
										{
										ActroGen[act] = dia.actra[act].gender
										}
	
											for (var act=0; act < dia.actra.length; act++)	
											{	
												
												if (dia.module.role[act].gen)
												{
													if (ActroGen[act] != dia.module.role[act].gen)
													{
														
														if (ActroGen[act] == 1){missFemale[missFemale.length] = act}else{missMale[missMale.length] = act}
													}
													else
													{
														correctActra[act] = 1
													}
													
												}
												else
												{
													if (ActroGen[act] == 1){freeFemale[freeFemale.length] = act}else{freeMale[freeMale.length] = act}
													
												}
											
											}
											var missUsed = 0
											var freeUsed = 0
											for (var act=0; act < missFemale.length; act++)
											{											
												if ((missMale.length)+(freeMale.length)-missUsed > 0)  
												{
													if ((missMale.length)-missUsed > 0) 
													{
														trace("CurrentMissedMale: "+missMale[0+missUsed])
														trace("CurrentMissedFemale: "+missFemale[act])
														
														tempActro[missFemale[act]] = dia.actra[missMale[0+missUsed]]
														tempActro[missMale[0+missUsed]] = dia.actra[missFemale[act]]
														trace(dia.actra[0])
														trace(dia.actra[1])
														trace(tempActro[0])
														trace(tempActro[1])
													}else{
														tempActro[missFemale[act]] = dia.actra[freeMale[0+freeUsed]]
														tempActro[freeMale[0+freeUsed]] = dia.actra[missFemale[act]]
														trace(dia.actra[0])
														trace(dia.actra[1])
														trace(tempActro[0])
														trace(tempActro[1])
														freeUsed++;
													}
														
														//tempActro[missFemale[act]]
														//tempActro[missMale[act]]
												}
											missUsed++;
											}
									}
						}
						
						
						
			
				
				for (var act=0; act < dia.actra.length; act++)
				{
					if (tempActro[act])
					{
					trace("Actra Switch Happened: "+dia.actra[act]+" switched to "+tempActro[act])
					dia.actra[act] = tempActro[act]
					}
				}
				
			//Kinky's tie breaker
				if(o.cfg.xconfig.deepConfig[0].sortTieBreaker[0]==2){
					if(dia.actra.length==2){
						if(dia.actra[0].gender==dia.actra[1].gender){
						   if(dia.actra[1].body.scale.oheight > dia.actra[0].body.scale.oheight){
							   var tempActra=[] 
							   tempActra[0] = dia.actra[1]
							   tempActra[1] = dia.actra[0]		
							   dia.actra = tempActra
						   }
						}
					}					
				}
		}

		

		

		
		
		
		
}