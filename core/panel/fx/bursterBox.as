class core.panel.fx.bursterBox extends MovieClip {

public var o
public var currentIco
public var offX
var opt

var tick
var lightFX

var bursterStar
var bursterStarMasker
var bursterStarFiller

var floatText
var floatTextValue
var floatTextL
var floatTextW

var floatTextType
var floatTyped
var floatTextPlusType

var exTextType
var exTyped

var cmdTextType

var frameFunc


var points
var depth
var radius

var bottomFin
var bottomLineHolder
var bottomLine

var bottomTitle


var burstIcoRotator


var exText

var isCycle

var commandPanel
var commands

var commandCur
var commandFin

	function bursterBox(){
		var tick = 0
		lightFX = false
		commands = []
		floatTextType = new TextFormat();
		floatTextType.letterSpacing = 1.5
		floatTextType.font = o.fonts.m
		floatTextType.size = 24
		
		exTextType = new TextFormat();
		exTextType.letterSpacing = 1.1
		exTextType.align = "left"
		exTextType.font = o.fonts.l
		exTextType.size = 6
		exTextType.leading = 4
		floatTextPlusType = []
		
		
		cmdTextType = new TextFormat();
		cmdTextType.letterSpacing = 1.1
		cmdTextType.align = "left"
		cmdTextType.font = o.fonts.M
		cmdTextType.size = 10
		
		
		
		
	}
	
	function onFrame(){
		if(lightFX){
			tick++
			this["ff_"+frameFunc]()
			
			//if(tick>30){
			//	floatText._alpha-=10
			//}
			
			if(!floatTyped){
				setTitleType()
			}
			if(!exTyped){
				setExType()
			}
			
			if(!commandFin){
				playCommands()
			}
			
		}
		
		onFrameBottom()
	}
	
	function onFrameBottom(){
		if(!bottomFin){
			
				if(tick>10){
				if(bottomLineHolder._alpha<=100){
					bottomLineHolder._alpha+=5
				}
				
				if(tick<25){	
				bottomLine.removeMovieClip()
				bottomLine = OADraw.OLine(bottomLineHolder, offX+20, -200, offX+20, -200+((tick-10)*10), 0xFFFFFF, 2)  
				}else{
					bottomFin = true
				}
				}
			}
	}
	
	
	function playCommands(){
		if(tick==7){
			commandCur++
		}
			
		if(tick<=12){
			commands[commandCur].bt._xscale+=6
			commands[commandCur].bt._yscale+=6	
			commands[commandCur].base._alpha+=15
			commands[commandCur].base._alpha+=16
			commands[commandCur].tx._x-=4
		}else{
				commandFin=true
		}
	}
	
	function setNewBurster(cycle){
		
		if(cycle){
			isCycle=true
		}else{
			isCycle=false
		}
		createStars()
		tick = 0
		lightFX = true
		
		if(core.util.func.RNG(0,1)==1){
		   burstIcoRotator = -1
		}else{
			burstIcoRotator = 1
		}
		
		if(!cycle){
		
		makeCommands()

		
		bottomFin = false
		bottomLineHolder.removeMovieClip()
		bottomLineHolder = this.createEmptyMovieClip("bottomLineHolder", this.getNextHighestDepth())
		bottomLine = OADraw.OLine(bottomLineHolder, 10, -160, 10, -160+0, 0xFFFFFF, 2)
		bottomLineHolder._alpha = 0
		setFloatTexts()
		
		floatTextValue = currentIco.titleText.toUpperCase()
		floatTextL = floatTextValue.length
		
		ft_title.val.htmlText = floatTextValue
		ft_title.val.setTextFormat(floatTextType);
		ft_title.val.autoSize = "right";
		
		floatTextW = ft_title.val._width

		
		setTitleType()
		buildTitle()
		setDescription()
		
		
		floatText._x = offX-30
		floatText._y = -140
		floatText._xscale = 80
		floatText._yscale = 80
		floatText._alpha = 0
		//floatText._rotation = -90
		floatText._visible = true
		floatTyped = false
		
		exText._x = (offX+9)-60
		exText._y = -60
		exTyped = false
		}
		
		
		
		currentIco.requestBurster(cycle)
		currentIco.homePanel.burstIcoPin._visible=true
		currentIco.homePanel.burstIcoPin._x = offX + -50
		currentIco.homePanel.burstIcoPin._y = -265
		currentIco.homePanel.burstIcoPin._xscale=0
		currentIco.homePanel.burstIcoPin._yscale=0
		currentIco.homePanel.burstIcoPin._rotation=(core.util.func.RNG(5,25)*burstIcoRotator)
		
		bursterStar._visible=true
		bursterStar._x = offX + -50
		bursterStar._y = -265
		bursterStar._xscale=0
		bursterStar._yscale=0
		bursterStar._rotation=-30
		
		
		
		
		currentIco.homePanel.burstIcoPin.setMask(bursterStarMasker)
		
		frameFunc = "grow"

	}
	

	function makeCommands(){
		
		commandCur = 0
		commandFin = false
		
		commandPanel.removeMovieClip()
		commandPanel = this.createEmptyMovieClip("_commandPanel", this.getNextHighestDepth())
		commands = []
		
		commandPanel._x = offX-130
		commandPanel._y = -380
		
		if(currentIco.data.fn=="anav"||currentIco.data.fn=="navtag"){
			
			var L
			
			L = commands.push({base:commandPanel.createEmptyMovieClip("cmdbase", commandPanel.getNextHighestDepth()), bt:undefined, tx:undefined})
				commands[L-1].bt = commands[L-1].base.attachMovie("omu_obto", "bt", commands[L-1].base.getNextHighestDepth())
				commands[L-1].tx = commands[L-1].base.attachMovie("genericText", "tx", commands[L-1].base.getNextHighestDepth(), {_x:195,_y:-2})
				commands[L-1].tx.val.htmlText = core.util.syntax.SynDesc(o, o.lib.translate(_parent.pandectMenu.cmdtext[0].warp[0].text, _parent.m.dia.module.id, "P"),_parent.pandectMenu.cmdtext[0].warp[0], o.lib.langP[_parent.m.dia.module.id])
				commands[L-1].tx.val.setTextFormat(cmdTextType);
				commands[L-1].tx.val.autoSize = "left";
				
				
			if(currentIco.data.travel){
				L = commands.push({base:commandPanel.createEmptyMovieClip("cmdbase", commandPanel.getNextHighestDepth()), bt:undefined, tx:undefined})
				commands[L-1].bt = commands[L-1].base.attachMovie("omu_obtt", "bt", commands[L-1].base.getNextHighestDepth())
				commands[L-1].tx = commands[L-1].base.attachMovie("genericText", "tx", commands[L-1].base.getNextHighestDepth(), {_x:195,_y:-2})
				commands[L-1].tx.val.htmlText = core.util.syntax.SynDesc(o, o.lib.translate(_parent.pandectMenu.cmdtext[0].travel[0].text, _parent.m.dia.module.id, "P"),_parent.pandectMenu.cmdtext[0].travel[0], o.lib.langP[_parent.m.dia.module.id])
				commands[L-1].tx.val.setTextFormat(cmdTextType);
				commands[L-1].tx.val.autoSize = "left";
			}
			

			
			for (var i=0; i < commands.length; i++){
				core.util.draw.circle(commands[i].bt.createEmptyMovieClip("circ", commands[i].bt.getNextHighestDepth()), 0, 0, 30, 2, "0xFFFFFF",undefined)	
				commands[i].bt._xscale = 0
				commands[i].bt._yscale = 0	
				commands[i].base._y -= i*30
				commands[i].base._alpha = 0	
			}
			
			
		}
	}
	function setTitleType(){
		
		ft_title.val.htmlText = floatTextValue.substr(0, tick*(floatTextL/5))
		ft_title.val.setTextFormat(floatTextType);
		ft_title.val.autoSize = "right";
		
		if(tick*(floatTextL/5)>=floatTextL){
			floatTyped = true
		}
	}
	
	function setExType(){
		exText.val.htmlText = currentIco.titleEx.substr(0, tick*(currentIco.titleEx.length/5))
		exText.val.setTextFormat(exTextType);
		exText.val.autoSize = "right";

		if(tick*(currentIco.titleEx.length/5)>=exText.val.htmlText.length){
			exTyped = true
		}
		
	}
	
	function buildTitle(){
		for (var i=0; i < ft_titlePlus.length; i++){
		ft_titlePlus[i].val.htmlText = currentIco.titleTextPlus[i].toUpperCase()
		
		floatTextPlusType[i] = new TextFormat();
		floatTextPlusType[i].letterSpacing = 1.5
		if(currentIco.data.titlePlus[i].fonttype=="m"){
		floatTextPlusType[i].font = o.fonts.m
		}else{
		floatTextPlusType[i].font = o.fonts.l
		}
		if(currentIco.data.titlePlus[i].fontsize){
		floatTextPlusType[i].size = Number(currentIco.data.titlePlus[i].fontsize)
		}else{
		floatTextPlusType[i].size = 18
		}
		ft_titlePlus[i].val.setTextFormat(floatTextPlusType[i]);
		ft_titlePlus[i].val.autoSize = "right";

		core.util.func.propApply(ft_titlePlus[i], currentIco.data.titlePlus[i].prop)
		}
		
		for (var i=0; i < ft_titleGfx.length; i++){
			ft_titleGfx[i]._x -= floatTextW+(ft_titleGfx[i]._width/2)
							   
			core.util.func.propApply(ft_titleGfx[i], currentIco.data.titleGfx[i].prop)
		}
	}
	
	
	function setDescription(){
		if(currentIco.titleEx){
		exText.removeMovieClip()
		exText = _parent.burstPanelText.attachMovie("genericText", "_exText", _parent.burstPanelText.getNextHighestDepth(), {_x:245, _y:220, _visible:true})
		exText.val.html = true
		exText.val._width = 225
		exText.val.wordWrap = true
		exText.val.htmlText = currentIco.titleEx
		exText.val.multiline = true
		exText.val.setTextFormat(exTextType);		
		exText.val.autoSize = "right";	
	
		
		core.util.func.propApply(exText, currentIco.data.ex[0].prop)
		}
	}
	
	function ff_grow(){
		createStarsLive()
			currentIco.homePanel.burstIcoPin.setMask(bursterStarMasker)
				
				if(tick<=5){
					currentIco.homePanel.burstIcoPin._xscale+=50
					currentIco.homePanel.burstIcoPin._yscale+=50				
					currentIco.homePanel.burstIcoPin._rotation-=(4*burstIcoRotator)
					 
					 bursterStar._xscale+=55
					 bursterStar._yscale+=55				
					 bursterStar._rotation-=4
					 
					 
					  if(!isCycle){
					  floatText._x+=8					  
					  exText._y-=8
					  floatText._alpha+=30
					  }
			   }else if(tick<=117){
					currentIco.homePanel.burstIcoPin._xscale+=.9
					currentIco.homePanel.burstIcoPin._yscale+=.9
					currentIco.homePanel.burstIcoPin._rotation-=(.04*burstIcoRotator)
					 //floatText._x+=.8
					 //floatText._y-=.35
					 bursterStar._rotation-=2
					 bursterStar._xscale+=.4
					 bursterStar._yscale+=.4
				   
			   }else{
				  bursterStar._rotation=0
				  frameFunc = "swap"   
			   }
	}
	
	function ff_swap(){
		createStarsClose()
					currentIco.homePanel.burstIcoPin._xscale+=.9
					currentIco.homePanel.burstIcoPin._yscale+=.9
					currentIco.homePanel.burstIcoPin._rotation+=.04
					//floatText._x+=.8
					//floatText._y-=.35
					//bursterStar._xscale-=35
					//bursterStar._yscale-=35
					
					if(radius==0){
						frameFunc = "grow"
						setNewBurster(true)
						
					}
					
		currentIco.homePanel.burstIcoPin.setMask(bursterStarMasker)
	}
	
	
	function dimEntry(){
		lightFX = false
		setNewBurster()		
	}
	
	
	function createStars(){
		radius = 25
		bursterStar.removeMovieClip()
		bursterStar = this.createEmptyMovieClip("star", this.getNextHighestDepth())		
		points = core.util.func.RNG(7,15)
		depth = 5
		bursterStarMasker = core.util.draw.fullStar(bursterStar.createEmptyMovieClip("masker", bursterStar.getNextHighestDepth()), 0x000000, radius, points, depth) 
		bursterStarFiller = core.util.draw.fullStar(bursterStar.createEmptyMovieClip("filler", bursterStar.getNextHighestDepth()), 0x000000, radius, points, depth) 
	}
	
	function createStarsLive(){
		
		var _rot = bursterStar._rotation
		var _scx = bursterStar._xscale
		var __x = bursterStar._x
		var __y = bursterStar._y
		
		bursterStar.removeMovieClip()
		bursterStar = this.createEmptyMovieClip("star", this.getNextHighestDepth())		
		points = points
		depth = depth+.6
		if(depth>=10){
			depth=10
			bursterStarMasker = core.util.draw.circle(bursterStar.createEmptyMovieClip("masker", bursterStar.getNextHighestDepth()), 0, 0, radius, 5, 0x000000, 0x000001)
			bursterStarFiller = core.util.draw.circle(bursterStar.createEmptyMovieClip("filler", bursterStar.getNextHighestDepth()), 0, 0, radius, 5, 0x000001, 0x000001)
		}else{
			bursterStarMasker = core.util.draw.fullStar(bursterStar.createEmptyMovieClip("masker", bursterStar.getNextHighestDepth()), 0x000000, radius, points, depth) 
			bursterStarFiller = core.util.draw.fullStar(bursterStar.createEmptyMovieClip("filler", bursterStar.getNextHighestDepth()), 0x000000, radius, points, depth) 
		}
		
		bursterStar._rotation = _rot
		bursterStar._xscale = _scx
		bursterStar._yscale = _scx
		bursterStar._x = __x
		bursterStar._y = __y
	}
	
	function createStarsClose(){
		
		var _rot = bursterStar._rotation
		var _scx = bursterStar._xscale
		var __x = bursterStar._x
		var __y = bursterStar._y
		
		bursterStar.removeMovieClip()
		bursterStar = this.createEmptyMovieClip("star", this.getNextHighestDepth())		
		points = points
		
		if(depth<=4){
			radius-=3
			depth-=1.5
			if(depth<2){
			depth=2
			}
			if(radius<0){
				radius=0
			}
		}else{
			depth-=1.5
		}
		bursterStarMasker = core.util.draw.fullStar(bursterStar.createEmptyMovieClip("masker", bursterStar.getNextHighestDepth()), 0x000000, radius, points, depth) 
		bursterStarFiller = core.util.draw.fullStar(bursterStar.createEmptyMovieClip("filler", bursterStar.getNextHighestDepth()), 0x000000, radius, points, depth) 
		
		bursterStar._rotation = _rot
		bursterStar._xscale = _scx
		bursterStar._yscale = _scx
		bursterStar._x = __x
		bursterStar._y = __y
	}

	
	
		
	
var ft_title
var ft_titlePlus
var ft_titleGfx

	function setFloatTexts(){
		ft_titleGfx = []
		ft_titlePlus = []
		floatText.removeMovieClip()
		floatText = _parent.burstPanelText.createEmptyMovieClip("_floatText", _parent.burstPanelText.getNextHighestDepth(), {_x:245, _y:220, _visible:true})
		ft_title = floatText.attachMovie("genericText", "_floatText", floatText.getNextHighestDepth())
		
		for (var i=0; i < currentIco.titleTextPlus.length; i++){
		ft_titlePlus[i] = floatText.attachMovie("genericText", "_floatTextPlus"+[i], floatText.getNextHighestDepth())
		}

			for (var i=0; i < currentIco.data.titleGfx.length; i++){
			ft_titleGfx[i] = floatText.attachMovie(currentIco.data.titleGfx[i].id, "_floatTextGfx"+i, floatText.getNextHighestDepth())
			}

	}


}