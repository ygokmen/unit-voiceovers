[B]Author:[/B] [url=https://steamcommunity.com/id/654wak654]654wak654[/url] & the0utsider
[url=https://github.com/the0utsider/unit-voiceovers/releases]website and more[/url]
[url=https://forums.bohemia.net/forums/topic/215191-unit-voiceovers/]Bohemia interactive forums[/url]

[B]MP compatible:[/B] Yes [i]*Has to be loaded on both server and client[/i]
[B]Requirements:[/B] None (optional: CBA)
[B]Version:[/B] v1.31 [i] "harvest & rewrite" [/i]
[B]Signed:[/B] Yes

[h1]Description:[/h1]
This is not a regular replacement mod to patch/replace existing sound files. It is a unique experiment and completely new, never done before approach in A3.

Using NWI's iconic game [url=https://newworldinteractive.com/#insurgency]"Insurgency"[/url] resources, this addon is created to improve overall experience and bring dynamism to expressionless Arma3 models with samples played on certain actions to increase situational awareness, to simulate better close quarters combat.

[B]Custom voice-over events:[/B]
[list]
	[*] Hostile frag grenade drop closeby
	[*] clip goes empty/full reload
	[*] shooting enemy (only if instigator have clear vision of victim)
	[*] being shot at
	[*] getting wounded
	[*] friendly fire
	[*] spotting enemy
	[*] using throwable items (flash, smoke, frag grenades etc.)
	[*] low on ammo
	[*] teammate is killed nearby
	[*] planting charges, mines, explosives
[/list]
  [i]  Unit has to have friendlies nearby (50 meters) in order to emit feedback voices. 
Solo/alone unit won't emit certain sounds.  [/i]

[h1]Features:[/h1]
[list]
	[*] Dynamic reactions
	[*] Feedback / call outs according to friendlies in vicinity
	[*] Main soldier classes use their own different set of voices
	[*] Compatible with RHS mods
	[*] ACE3 detection: compatible with ACE3
	[*] works independent from 'enablesentences false' setting; using its own EH framework
	[*] Randomized samples on each action for diversity
	[*] uses more than a thousand different sound samples
[/list]
[B]'spot enemy' feature:[/B]This is similar to tactical ping, only an aural one to quickly alert your group. 
Only works if you have a compass: Press T to spot an enemy soldier.

[h1]Customization:[/h1]
* [i]CBA is required to enable add-on options[/i]
[list]
	[*] enable/disable for client
	[*] Sound sample pitch adjustment
	[*] Set volume level, pitch and travel distance 
	[*] Rebind/change 'Spot enemy' key via CBA add-on controls 
[/list]
[h1]Compatibility (solution to friendly-fire calls)[/h1]
[b]Enable/Disable faction relations according to scenario:[/b]
  [i] units belong to different sides will react to each other as enemies period. That's hard coded. [/i]
  Consequently, units belong to same side will treat each other friendly all the time.
But, in some cases you become enemies with a [b]'faction' within same side.[/b]
[b]  There is a compatibility option for this:[/b] under cba addon options, untick this option for required Side.

[h1]Disabling default game VO completely: 'enableSentences false'[/h1]
[i]'Unit Voiceovers' uses it's own eventhandler methods to emit sounds. 
You can (and maybe you should) disable default robotic arma3 chatter. Unit voiceovers mod still continue to work and probably work better with this option.[/i]

Disabling default chatter of game is possible via option inside 'compatibility settings'.
[b]This will MUTE ALL game's default radio chatter and voices for both AI and player.[/b]

[B]Included Files:[/B] 
gokmen.bikey
goko_uVO.pbo
goko_uVO.pbo.gokmen.bisign
readme.txt

[h1]Thanks:[/h1] when the idea to create this mod came to me, [url=https://github.com/654wak654]654wak654[/url]wrote first original EH code then showed me how to do it, this mod exists thanks to him.
[url=https://steamcommunity.com/id/gebbet]gebbet[/url] & [url=https://steamcommunity.com/id/kappaccino1]SergentKappa[/url] for being testers against all odds like low bandwdth, lack of dedicated server, masked IP and other 3rd world problems.
[url=https://store.steampowered.com/search/?developer=New%20World%20Interactive]N.W.I.[/url] for creating Insurgency, mikee and others for voice-overs
[url=https://steamcommunity.com/id/SceptreOfficial]Sceptre[/url] for further testing and feedback.
[b]Bohemia Interactive for creating Arma.[/b]

[B]License:[/B] Covered under [B]Arma Public License Share Alike[/B]
 [url=https://www.bohemia.net/community/licenses/arma-public-license-share-alike]APL-SA[/url]
 Feel free to use and modify this code, on the proviso that you post back changes and improvements so that everyone can benefit from them, and acknowledge the original authors in any derivative works.
[b] Reuploading this is not allowed (especially to armaholic) [/b]

[url=https://github.com/the0utsider/unit-voiceovers/blob/develop/changelog_full.txt]Changelog[/url]

[B]ChangeLog:[/B]
[SPOILER]
  	V1.31 - 10-23-2018 "happy harvest" release:
 - *New*: complete rewrite of old code in order to fix many design issues / bugs
 - Added: dynamic detection of friendlies: solo unit will no longer emit sounds
 - Added: new mechanic detects if you have friendlies nearby, enable calls auto (50meters range)
 - *New*: visibility checks: building, wall, bush, trees etc. now affect kill confirms
 - Fixed: many, many fixes. Mod now works as I wanted the first time.
 
  	V1.30 - 05-01-2018:
 - Fixed: Half of the sounds were missing (no idea how that happened)
 - Fixed: reload effects now only trigger when you actually start reload action
 - *New*: Now mod uses class based system (soldierEB, WB, GB config tree) instead of sides 
 - Added: RHS support
 - Added: New 'compatibility' options, use this to make it compatible with any scenario/faction (available via cba)
		
 - Code performance: updated some junk check commands with new and better code which %60 faster
 
 V1.29 - 04-20-2018	"happy grow season" - 4/20 update v2:
  - Fixed: SP/Campaign East Wind compatibility: FIA and AAF now use different EH faction code
  - Fixed: selectRandom issue, was picking dead unit from array
  - Fixed: Array selecting object itself when no friendly close by
  - Fixed: Random Lip-sync timing was too short for effect to trigger each time, adjusted
  - Fixed: Improved code to detect if unit is talking or not
  - Fixed: missing/wrong entries in cfgSounds.hpp
  - Fixed: Arma Achilles compatibility (thanks @Sceptre for his feedback and contribution)

  - *NEW*: Callouts for grenade dropped nearby
  - Added: Units will react to enemy grenades thrown at them, if it is visible and capable of indirect damage (using checkVisibility command)
  - Added: New sound samples for spotted enemy grenade to Indep, Blufor, Opfor; 61 total

  - *NEW*: Reveal target - Spot enemies, tell direction
  - Added: Spot an enemy, use 'reveal target' (default key 'T')
  - Added: If range and visibility allows, your character will callout enemies direction (south, northeast etc. all 8 directions)
  - Added: Default Key can be re-binded using CBA (optional). "esc" > "controls" > "add-on options" select 'goko unit Vo' to bind the key you want.
  - Added: new sound samples for calling out directions to Indep, Blufor, Opfor; 96 samples total

  - Code Performance: code using 'nearestObjects' command rewritten with more lightweight 'nearEntities'
		
 V1.24 - 04-14-2018 "happy grow season - 4/20 tribute" update:
  General bug fixes
  - Fixed: feedback issue when using UNIT_VO with ACE (thanks for support @Sceptre)
  - Fixed: ACE arsenal issue (ace_arsenal spamming 'ammo low' samples) -- @suns
  - Fixed: nearestObject array script error occuring while no such object in range
  - Fixed: Volume levels for shouting sound effects
  - fixed: overlapping of 'say3d' samples' queue for friendly fire
  New Features
  - Added: ACE detection; now mod won't load unnecessary functions when launched without ACE3
  - Added: New Function using 'setRandomLip' command to simulate lipsync
  - Added: Now characters move their mouth as they 'say3d'ing samples
  - Added: a new variable for functions to detect overlapping queues
  - Added: New reloading function mechanics (surprise)
  - Added: New reload feedback for launchers
  - Added: 56 new sound samples for new features
  
 V1.17 - 03-03-2018:
  - Fixed: some script errors, missing function name on WEST faction
  - Added 42 voiceover samples for ACE m14, m84 grenade types for factions
  - Added customization for samples' volume, max. range, pitch, enable/disable checkbox for player (CBA required to enable settings)
  - Code improvements and optimizations (nearestObjects), volume levels equialized in cfgSounds.hpp
  
 V1.14 - 01-25-2018:
  - Fixed: new reloaded eventhandler functions (now you shouldn't hear "reloading" or "low on ammo" with throwables or in arsenal)
  - Added magazine ID check to make sure waituntil loop doesn't stack
  - new code to detect last bullet in the chamber - better than needReload command
  - Added 9 missing independent faction sound samples

 V1.1 - 01-19-2018:
  - Changed add-on name to 'Unit Voiceovers'
  - removed particle effects, now that's a seperate add-on,
  - removed some obsolete sound samples,
  - Removed nullified radio sentences (games default voiceovers are back)

 V1.0 - 12-29-2017:
  - Addon Released on steam as 'goko soldier voiceovers'
[/SPOILER]