import mx.utils.Delegate;

class SP1IAdetails extends MovieClip
{
	
public var coreSuite
public var actra

var name
var formid
var gender
var player

var race
var voicetype
var weight

var hex
var folder
var osid
var mod

			public function SP1IAdetails(){			
			name.htmlText = actra.name
			formid.htmlText = actra.id
			gender.htmlText = actra.gender
			player.htmlText = actra.isPlayer
			
			race.htmlText = actra.race
			voicetype.htmlText = actra.voiceType
			weight.htmlText = actra.weight
			
			hex.htmlText = actra.hex
			folder.htmlText = actra.folder
			osid.htmlText = actra.osid
			mod.htmlText = actra.mod
			}
			
			


}