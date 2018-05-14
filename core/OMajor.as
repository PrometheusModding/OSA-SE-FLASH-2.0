import gfx.io.GameDelegate;
import gfx.controls.Button;
import skse;
import XMLParser;
import mx.utils.Delegate;
import skyui.widgets.WidgetBase;
import ODelegate;

class OMajor extends MovieClip
{


	public var inMajorMenu = false;
	var prefixDir;
	var omfixDir;

	var o;
	var actro;
	var diaso;
	var hud;
	var cin;
	var ctr;
	public var com;
	var scan;
	var cfg;
	var lib;
	var sim;
	var glyph;
	var targ;
	var my;
	var log;
	var lists;
	var xplat;
	public var beacon;

	public var ready;
	public var olib;
	var display;

	var MajorPanel;
	var viewStage;

	var fonts;
	public var osaStatus:String;


	var ver = "2.03SE";
	var flashDevMode;

	public function OMajor()
	{

		o = this;
		osaStatus = String("O");
		prefixDir = "../../meshes/";
		omfixDir = "../../";
		viewStage = 0;
		flashDevMode = false;
		log = new core.system.logData(this);
		
		log.addLog("boot", "MAJ | OSA UI Loaded | version: " + ver + "...")
		//prefixDir = "../meshes/"

		//sky("0SA_PreBoot")
		ready = new core.system.ready(this);
		if (String(this) == "_level0.widget")
		{
			log.addLog("boot", "MAJ | WARNING: flashDevMode has been turned on...")
			flashDevMode = true;
		}
		checkForAssHatThatFuckedUpSkyrimDirectories();
		//}
	}
	function checkForAssHatThatFuckedUpSkyrimDirectories()
	{
		var getDoc = new Load();
		getDoc.callBack = {fn:checkForAssHatOut, scope:this};
		log.addLog("boot", "MAJ | Checking 0SA/_0S/UI/o.hudcheck file for hud_menu.swf compatability...")
		
		getDoc.dir = prefixDir + "0SA/_0S/UI/o.hudcheck";
		getDoc.getDoc();
	}

	function checkForAssHatOut(doc)
	{
		if (doc != 1)
		{
			prefixDir = "../meshes/";
			omfixDir = "../";
			log.addLog("boot", "MAJ | Compatability for alternate hud_menu.swf engaged...")
		}

		startOSA();
	}

	public function startOSA()
	{


		sky("0SA_GameLoaded");
		o.log.addLog("boot", "MAJ | OMajor loaded...")
		
		if (flashDevMode){
		simulator(this);
		}
		
		lists = new core.system.lists(this);
		scan = new core.system.scan(this);
		cfg = new core.config.configData(this);
		targ = new core.lib.targeting(this);
		actro = new core.actor.actro(this);
		diaso = new core.dias.diaso(this);
		ctr = new core.system.control(this);
		glyph = new core.system.glyph(this);
		lib = new core.lib.dataLib(this);
		cin = new Cinema(this);
		my = new core.lib.myOSA(this);
		hud = this.attachMovie("Hud", "hud", 1, {o:this});
		display = this.attachMovie("Display", "Display", 2, {o:this});

		display.createPumpText();
		com = new core.system.com(this);
		beacon = new core.system.beacon(this);
		xplat = new core.system.xplatform(this);
		
		//var test = this.attachMovie("onav_optionmagi", "magitest", this.getNextHighestDepth(), {_x:500, _y:500, o:this});
		
		
		if (flashDevMode)
		{
			sim = new core.system.sim(this);
			sim.simINI();
			log.addLog("boot", "MAJ | WARNING: Developer Switch ByPass used in StartOSA()...")
			devAssist();
		}

		o.log.addLog("boot", "MAJ | Start-Up Complete...")
		
		
	}

	function devAssist()
	{
		log.addLog("boot", "MAJ | WARNING: Developer Switch ByPass used in devAssist()...")
		sim.simScanMods();
		lib.codex.scanIdentity();
		lib.codex.scanForm();
		sim.simBind();
	}

	function sky(eventName)
	{
		skse.SendModEvent(String(eventName));
	}

	function skyString(eventName, eventString)
	{
		skse.SendModEvent(String(eventName),String(eventString));
	}

	function skyStringNum(eventName, eventString, eventNumber)
	{
		skse.SendModEvent(String(eventName),String(eventString),Number(eventNumber));
	}

	function skyAll(eventName, eventString, eventNumber, eventForm)
	{
		skse.SendModEvent(String(eventName),String(eventString),Number(eventNumber),Number(eventForm));
	}

	function gameBoot()
	{
		//boot is launched from cfg after the ini is loaded
		sky("0SA_UIBoot");
	}


	function debugOutput(Text)
	{
		display.PumpText(Text);
	}
	function simStageStart()
	{
		com.playerCreateStage(22,"0Sex,AUTO",12,13);
		//com.playerCreateStage(22,"KomEnduro,AUTO",12);
		//com.playerCreateStage(22, "0Sex,0MF|Sy6!Sy6|Po|StOvBa2Po", 12, 13)
		com.playerStartStage(22,60);
		//com.trigKey(22, "0Spank,AUTO", 12, 13)
	}

	function simulator(maj)
	{
		log.addLog("boot", "MAJ | WARNING: Simulator Mode activated...")
		keySim(maj);
	}




	public function keySim(maj):Void
	{

		var keyListener:Object = new Object();

		keyListener.onKeyDown = function()
		{
			trace(Key.getCode());
			if (Key.getCode() == 38)
			{
				maj._parent.fuck();
				maj.ctr.UP();
			}
			else if (Key.getCode() == 40)
			{
				maj.ctr.DOWN();
			}
			else if (Key.getCode() == 37)
			{
				maj.ctr.LEFT();
			}
			else if (Key.getCode() == 39)
			{
				maj.ctr.RIGHT();
			}
			else if (Key.getCode() == 33)
			{
				maj.ctr.TOG();
			}
			else if (Key.getCode() == 36)
			{
				maj.ctr.YES();
			}
			else if (Key.getCode() == 35)
			{
				maj.ctr.NO();
			}
			else if (Key.getCode() == 109)
			{
				maj.endOSS(16);
			}
			else if (Key.getCode() == 45)
			{
				maj.simStageStart();
				//maj.sim.simActraAdd()
				//maj.sim.simActraAdd()
				//maj.sim.simActraScaleAdd()
				//maj.sim.simActraScaleAdd()
				//maj.sim.simActraOHeightAdd()
				//maj.sim.simActraOHeightAdd()
			}
			else if (Key.getCode() == 53)
			{
				maj.sim.simActraEQWorn();
			}
			else if (Key.getCode() == 55)
			{
				maj.sim.simActraAdd();
			}
			else if (Key.getCode() == 56)
			{
				maj.sim.simActraScaleAdd();
			}
			else if (Key.getCode() == 57)
			{
				maj.sim.simActraOHeightAdd();
			}
			else if (Key.getCode() == 48)
			{
				maj.com.skyActroReadyCheck(22);
			}
			else if (Key.getCode() == 49)
			{
				//maj.com.skyActraInit(12)
				maj.sim.simActraAdd();
				maj.sim.simActraAdd();
				maj.sim.simActraScaleAdd();
				maj.sim.simActraScaleAdd();
				maj.com.skyActroReadyCheck(22);
				maj.com.skyActroReadyCheck(22);
			}
			else if (Key.getCode() == 50)
			{
				//maj.com.skyActraInit(12)
				maj.com.skySyncComplete(22);
			}
			else if (Key.getCode() == 51)
			{
				//maj.com.skyActraInit(12)
				maj.sim.simSplitScene();
			}
			else if (Key.getCode() == 72)
			{
				maj.simStageStart();
			}
			else if (Key.getCode() == 107)
			{
				maj.ctr.MainMenu();
			}
			else if (Key.getCode() == 106)
			{
				maj.ctr.INSPECT("13");
			}
			else if (Key.getCode() == 80)
			{
				maj.OSS[16].primeAuto();
			}
			else if (Key.getCode() == 74)
			{
				maj.sim.simActraAdd();
			}
			else if (Key.getCode() == 75)
			{
				maj.sim.simActraScaleAdd();
			}
			else if (Key.getCode() == 76)
			{
				maj.sim.simActraOHeightAdd();
			}
			else if (Key.getCode() == 65)
			{
				maj.diaso.get(22).chore.autoNav.newAgenda("0MF|Sy6!Sy9|Ho|Wuvvy");
			}
			else if (Key.getCode() == 88)
			{
				maj.com.endCommand(22);
			}
			else if (Key.getCode() == 54)
			{
				maj.sim.simScanMods();
			}
			else if (Key.getCode() == 34)
			{
				maj.lib.codex.scanIdentity();
				maj.lib.codex.scanForm();
			}
			else if (Key.getCode() == 68)
			{
				//maj.display.hudDisplayBasicPush("OHudWarning01", maj.cfg.lang.osaInstallationProblem+"$TX$"+maj.cfg.lang.warningTextHudConflict)
			}

		};
		Key.addListener(keyListener);
	}



	public function makeEntry(X)
	{
		var xo = new XMLParser();
		return xo.parseXML(X);
	}




}
