# Goko Unit Voiceovers

Dynamic, randomized 3D positional sound samples for units

Authors: 654wak654, the0utsider
Using NWI's iconic game 'insurgency' sound samples, this add-on created to improve overall experience and bring dynamism to expressionless Arma3 models. I always imagined this to be something similar to st_hud but an aural one instead of visual. Each faction has their own sounds, with samples played on certain actions to increase situational awareness, to simulate better close quarters combat.

Features:
- Positional in-game audio for units, for each faction, randomized
- Using 'say3D' and 'playsound3D' for realistic volume simulation
- Max. range distance of sounds are similar to ingame directChat
- Loud shout of pain whenever a unit dies
- Wounded unit sentences 
- Friendly fire warnings
- Target down at close (less than 150 meters): aggressive kill confirms (depends on randomized chance factor)
- Target down (outside 150m range): calm kill confirms (depends on randomized chance factor)
- Whenever a team member gets killed nearby, alive team members shout panic sentences (depends on randomized chance factor)
- Unit using throwables: shouts for throwing frag grenade and smoke grenades
- Unit will let the others around know that he has few magazines left on him
- Unit will say that he just planted an explosive satchel or c4 charge
- Unit will say similar sentences to "watchout while I reload" when current mag goes empty
- Performance demand of this add-on is minimal as It uses no loops and nothing is added to Arma scheduler
- approx. 700 different sound samples

Features:
- Complete overhaul for default arma unit voice-overs
- Opfor, independent, blufor sides use their own different set of voices
- Randomized samples on each action for diversity
- Spot enemy / callout targets direction (Default key 'T')
- ACE3 compatibility: supports ace grenade types
- works independent from 'enablesentences false' setting; using its own EH framework
- almost 1000 different sound samples total
- 'spot enemy' feature:This is similar to tactical ping, only an aural one to quickly alert your group. It uses 'knowsAbout' command; according to weather, time of day and distance of enemy soldier, player will call out enemies direction. If 'knowsabout' value return zero, function won't work.

Customization: 
* CBA is required to enable add-on options
- Enable/disable VOs for player/client
- Sound sample pitch adjustment
- Set volume level and travel distance to your liking
- Ratio customization for certain sounds
- Rebind/change 'Target Spot' key via CBA add-on controls

Dynamic voice-overs when:
- clip goes empty/reloading,
- shooting enemy,
- being shot at,
- getting wounded,
- hurting a friendly,
- spotting enemy,
- using throwable items,
- low on ammo,
- hostile throw grenade at you,
- a teammate nearby is killed,
- planting charges.

**Installation:**
 Subscribe via steam: http://steamcommunity.com/sharedfiles/filedetails/?id=1248372833

---

The MIT License (MIT)

Copyright (c) 2018 Gokmen 'the0utsider'

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
