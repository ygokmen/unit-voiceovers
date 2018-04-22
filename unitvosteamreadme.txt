[h1]Unit Voiceovers[/h1]
[B]Author:[/B] 654Wak654 & the0utsider
[B]Website/Repo:[/B] https://github.com/the0utsider/unit-voiceovers

[B]Short description:[/B] Dynamic, randomized 3D-positional sound samples for units
[B]Requirements:[/B] None 
[B]Version:[/B] v1.17
[B]Signed:[/B] Yes

[B]Description:[/B]
Using NWI's iconic game 'insurgency' sound samples, this add-on created to improve overall experience and bring dynamism to expressionless Arma3 models. I always imagined this to be something similar to st_hud but an aural one instead of visual. Each faction has their own sounds, with samples played on certain actions to increase situational awareness, to simulate better close quarters combat.

[B]Features:[/B]
[list]
	[*] Complete overhaul for arma unit voice-overs
	[*] Opfor, independent, blufor sides use their own different set of voices
	[*] Randomized samples on each action for diversity
	[*] ACE3 compatibility: supports ace grenade types
	[*] works independent from 'enablesentences false' setting; using its own EH framework
	[*] almost 1000 different sound samples total
[/list]

[B]Customization:[/B] 
* [i]CBA is required to enable add-on options[/i]
[list]
	[*] Enable/disable VOs for player/client
	[*] Sound sample pitch adjustment
	[*] Set volume level and travel distance to your liking
	[*] Ratio customization for certain sounds
	[*] Rebind/change 'Target Spot' key via CBA add-on controls
[/list]

[B]Dynamic voice-overs when:[/B]
[list]
	[*] clip goes empty/reloading,
	[*] shooting enemy,
	[*] being shot at,
	[*] getting wounded,
	[*] hurting a friendly,
	[*] spotting enemy,
	[*] using throwable items,
	[*] low on ammo,
	[*] hostile throw grenade at you,
	[*] a teammate nearby is killed,
	[*] planting a charge.
[/list]

[B]Included Files:[/B] 
gokmen.bikey
goko_uVO.pbo
goko_uVO.pbo.gokmen.bisign

Has to be loaded both on server and client in order to work on MP

[B]Thanks:[/B] [url=http://steamcommunity.com/id/654wak654]654wak654[/url] for original EventHandler code, this add-on could never exist without his support.
Ömür 'gebbet' & Hamza 'ElKappucino' for testing.
NWI for creating Insurgency, mikee and others for VO's

[B]License:[/B] Covered under [B]Arma Public License Share Alike[/B]
 [url=https://www.bohemia.net/community/licenses/arma-public-license-share-alike]APL-SA[/url]
	Feel free to use and modify this code, on the proviso that you post back changes and improvements so that everyone can benefit from them, and acknowledge the original authors in any derivative works.

[B]ChangeLog:[/B]
[SPOILER]
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
		
	V1.24 - 04-14-2018	"happy grow season - 4/20 tribute" update:
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
