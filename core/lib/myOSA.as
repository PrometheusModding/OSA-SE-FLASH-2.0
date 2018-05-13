
class core.lib.myOSA{

var o
var user
var lastRequest
var lastIndex

		public function myOSA(Core){
			o = Core
			user = {
				
					anim_1:	{declare:undefined, doc:new Object, folder:undefined}, 
					anim_2:	{declare:undefined, doc:new Object, folder:undefined}, 
					anim_3:	{declare:undefined, doc:new Object, folder:undefined},
					anim_4:	{declare:undefined, doc:new Object, folder:undefined},
					anim_5:	{declare:undefined, doc:new Object, folder:undefined}, 
					anim_6:	{declare:undefined, doc:new Object, folder:undefined},
					equip:	{declare:undefined, doc:new Object, folder:undefined}, 
					hero:	{declare:undefined, doc:new Object, folder:undefined}
					}
		}

		
		public function myReady(type){
			
		}
		
		
		public function getMyDeclare(manager){
			lastRequest = manager
			o.log.addLog("run", "Build myOSA library for: "+manager.myType+"...") 
			o.skyString(String("OSA_ScanDirectoryForFileType"), String("1,meshes/0SA/_MyOSA/"+manager.myType+"/,.myo,my.processDeclares"))
			
			if(o.flashDevMode){
				o.log.addLog("war", "Developer Switch ByPass in o.my.getMyDeclare.") 
				processDeclares("OPose.myo", "OFree.myo")
			}
		}
		
		public function processDeclares(){			
			//o.debugOutput(arguments)
			var manager = lastRequest
			o.log.addLog("run", "MyOSA "+manager.type+" | Reply received. Generating list...")
			
			
				loadDeclare(manager, "/_declare.xml", -1)
			
				
			lastIndex = arguments.length-1
			for (var i=0; i < arguments.length; i++){
				loadDeclare(manager, "/"+arguments[i], i)
			}
			
			
		}
		
		public function loadDeclare(manager, fileDir, index){
			var getXML = new Load
			getXML.callBack = {fn:outMyDeclare, scope:this}
			getXML.args[1] = manager
			getXML.args[2] = index
			
			getXML.dir = o.prefixDir+"0SA/_MyOSA/"+manager.myType+fileDir
			getXML.getDoc()
			
			o.log.addLog("run", "MyOSA "+manager.type+" | Opening "+getXML.dir+"...")
		}
		
		
		public function outMyDeclare(xml, manager, index){
			if(xml){
				var declareXML = o.lib.makeEntry(xml)
				
				if(index==-1){
					user[manager.myType].declare = declareXML
					
				}else{
					if(!user[manager.myType].folder){
					user[manager.myType].folder = declareXML	
					}else{

					joinTier(user[manager.myType].folder, declareXML, user[manager.myType].folder.folder0, declareXML.folder0, 0, false, [], [])		
					}
				}
			}
			
			if(lastIndex==index){
				manager.yFn.apply(manager.nScope)
			}
		}
				
		public function joinTier(fbase, xbase, folder, xml, ix, idMatch, fix, xix){
			o.log.addLog("hot", "joinTier started..."+xml+" | "+folder)
			if(xml&&folder){
			o.log.addLog("hot", "tierExists...")
			
				for (var i=0; i <= xml.length; i++){
				//Check All Folders at this level for matches
					 
					 if(xml[i].id){
				     o.log.addLog("hot", "ID FOUND: "+xml[i].id)
				     var matchFound=false
					 		
							
					 		for (var j=0; j <= folder.length; j++){								
								
								if(xml[i].id.toLowerCase()==folder[j].id.toLowerCase()&&xml[i].id!=undefined){
									   o.log.addLog("hot", "MATCH HAS BEEN FOUND: "+xml[i].id)
									matchFound=true
									fix.push(j)
									xix.push(i)
									joinTier(fbase, xbase, folder[j]["folder"+(ix+1)],xml[i]["folder"+(ix+1)],(ix+1),true, fix, xix)
									//Check child tier for further matches and set MATCH FOUND to true									
								}
								
							}		
					 }else{
						endTierSearch(fbase, xbase,ix,idMatch,fix,xix,[],[])
					}
							
				}
			}else{
				endTierSearch(fbase, xbase,ix,idMatch,fix,xix,[],[])
			}
		}
		
		function endTierSearch(folder,xml,ix,idMatch,fix,xix){
			 o.log.addLog("hot", "Search Ended...")
			if(idMatch){
						 o.log.addLog("hot", "This search had a match, combining lists...")
						 //No match IDs but a match has been found on a prior tier of this search
						 joinTierPriors(folder, xml, ix, fix, xix)
						 //Splice and Join all prior tier folders
			}else{
				for (var i=0; i < xml.folder0.length; i++){
					folder.folder0.push(xml.folder0[i])
				}
			}
		}
		
		function joinTierPriors(folder,xml,ix,fix,xix, pushIn, pushOut){
			ix--
			o.log.addLog("hot", "Running JoinPrior: "+fix+"  "+xix+"  |INDEX: "+ix)
			
			if(ix>=0){

				var xmlPath = xml
				var folderPath = folder

				
				for (var i=0; i < ix; i++){
					xmlPath = xmlPath["folder"+i][xix[i]]
					folderPath = folderPath["folder"+i][fix[i]]				
				}
				
				xmlPath = xmlPath["folder"+ix]
				folderPath = folderPath["folder"+ix]
				
				o.log.addLog("hot", "Tier's Synchronized: "+xmlPath[xix[ix]].id+"  "+folderPath[fix[ix]].id)
				
				
				
				
				var joinPath = xmlPath[xix[ix]]
				
				if(!folderPath[fix[ix]].entry){
					folderPath[fix[ix]].entry = new Object
					folderPath[fix[ix]].entry = []
				}
				
				o.log.addLog("hot", "ENTRY PRE LENGTH:  "+folderPath[fix[ix]].entry.length)
				
				var pathL = joinPath.entry.length
				for (var i=0; i < pathL; i++){
					var poper = joinPath.entry.shift()
					folderPath[fix[ix]].entry.push(poper)			
					o.log.addLog("hot", "ENTRY PUSHED:  "+poper.n)
				}
				o.log.addLog("hot", "ENTRY POST LENGTH:  "+folderPath[fix[ix]].entry.length)
				
				
				if(!folderPath[fix[ix]]["folder"+(ix+1)]){
					folderPath[fix[ix]]["folder"+(ix+1)] = new Object
					folderPath[fix[ix]]["folder"+(ix+1)] = []
				}
				
				o.log.addLog("hot", "FOLDER PRE LENGTH:  "+folderPath[fix[ix]]["folder"+(ix+1)].length)
				
				pathL = joinPath["folder"+(ix+1)].length
				for (var i=0; i < pathL; i++){
					var poper = joinPath["folder"+(ix+1)].shift(0)
					folderPath[fix[ix]]["folder"+(ix+1)].push(poper)			
					o.log.addLog("hot", "FOLDER PUSHED:  "+poper.n)

				}
				o.log.addLog("hot", "FOLDER POST LENGTH:  "+folderPath[fix[ix]]["folder"+(ix+1)].length)
				
				
				
				

				//o.log.addLog("hot", "Splice Result: "+outCut.id)
				//folderPath.push(xml)
				//xml.splice(0)			
				joinTierPriors(folder,xml,ix,fix,xix)
			}
		}
		
		public function getMyDoc(manager){
			var getXML = new Load
			getXML.callBack = {fn:outMyDoc, scope:this}
			getXML.args[1] = manager
			getXML.dir = o.prefixDir+"0SA/_MyOSA/"+manager.myType+"/"+manager.myDoc+".xml"
			getXML.getDoc()
		}
		
		public function outMyDoc(xml, manager){
			if(xml){
				var docXML = o.lib.makeEntry(xml)
				user[manager.myType].doc[manager.myDoc] = new Object
				user[manager.myType].doc[manager.myDoc] = docXML
				manager.yFn.apply(manager.yScope)	
			}else{
				trace("NO DOC FOUND")
				manager.nFn.apply(manager.nScope)
			}
		}
}