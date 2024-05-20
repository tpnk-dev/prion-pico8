# prion-pico8
## Game

**Play it here: https://tpnk-dev.itch.io/prion**

<p align="center">
  <img width="400" height="400" src="https://img.itch.zone/aW1hZ2UvMjY5NjY2Ny8xNjA3NTg5Ni5naWY=/347x500/9o97vF.gif">
  <img width="400" height="400" src="https://img.itch.zone/aW1nLzE2MDg2ODUzLmdpZg==/original/cruq7r.gif">
</p>

```Aliens are infecting Earth with a deadly disease. You have been tasked to destroy all spacecraft that pose a threat to our planet. Please act fast, as your reward is based on the amount of uninfected land in each wave of enemies. There are an estimated 10 waves of increasingly harder alien reinforcements. Reports also show that the extraterrestrials possess a device that can alter the force of gravity. We have equipped your ship with fuel and altitude gauges, a scanner, a laser cannon , and homing missiles.```

## Changelog 
- v1.1.6
  - add HOUSE
  - infected bush now gives 40 points, just like infected tree
  - attractor beam reduces player fuel
  - whole best score can now be seen (fixed identation)
- v1.1.5
  - fix suicidal pests (hitting the ground)
  - fix player losing multiple lives as once
  - give 5k rewards when wave ends
  - player now dies when it has no fuel and gets shot
  - pest doesnt count to finish wave
- v1.1.4
  - fix shadow flickering (thx @krispykrouton)
- v1.1.3
  - fix major kill count bug (was counting hits as kills :S)
- v1.1.2
  - fix missile and enemy tracking considering wrapping map
  - fixed bug where wave can end before all enemies are killed
  - make fixed path ships only face a certain direction for the entire wave
  - fixed jumpy spacecraft heights
  - fixed bug where sometimes the death score of the kill didn't count
  - it's 2024 not 2023
  - make drones a little less likely to become mutant
  - some performance fixes with particles
- v1.1.1
  - fix cartdata name
  - fix randomicity of spawns
  - make gravity changes a little lighter
- v1.1
  - add starting screen music
  - first refinement of sound effects
  - add levels 8,9,10
  - add gravity and map change logic
  - fix score when enemy hits the ground
  - make missile have very high damage
  - add label image, banner and screenshots
  - add a cool_starting_screen for "3d scan effect"
  - fix current_height considered by attack_player 

## Features

- Terrain
  - [x] Terrain rendering
  - [x] Trees (mutated and not)
  - [x] Create house
  - [ ] Add fishes :)
- Map
  - [x] On-screen map
  - [x] Radar quadrants
- Player
  - [x] User control
- Enemies
  - [x] seeder
  - [x] drone
  - [x] mutated drone 
  - [x] bomber 
  - [x] pest 
  - [x] fighter 
  - [x] attractor
  - [x] mystery spacecraft 
- Projectiles
  - [x] Machine gun
  - [x] Homing missile
- Levels (1-16)
  - [x] Enemy spawn logic
  - [x] Clearing terrain (levels 5 and 10) (2)
  - [x] Increased gravity (levels 3, 5 and 7) (1)
- Sound 
  - [x] Add sound to objects
- Others
  - [x] Add cart figure
  - [x] Create manual
  - [ ] Online leaderboards (like Demi Daggers by freds72)
- Fixes
  - [ ] Balance firing rates, enemy AI, spawn timer, virus diffusion, etc
  - [ ] Fix ship proportions
  - [x] Fix suicidal pests

## Levels

1. 3 seeders                      1 drones
2. 4 seeders            1 bombers 3 drones
3. 5 seeders 1 fighters 1 bombers 4 drones
4. 1 seeders 4 fighters 2 bombers 4 drones 4 pest 1 attractor
5. 1 seeders 4 fighters 2 bombers 4 drones 5 pest 2 attractors
6. 1 seeders 4 fighters 3 bombers 2 drones 6 pest 2 attractor 1 mystery
7. 2 seeder  3 fighter  3 bombers 1 drone  8 pest 3 attractor 1 mystery
8. 1 seeder  5 fighter  4 bombers 1 drone  9 pest 3 attractor 2 mystery
9. 1 seeder  6 fighter  4 bombers 1 drone  9 pest 3 attractor 2 mystery
10. 1 seeder  5 fighter  4 bombers 1 drone  9 pest 3 attractor 2 mystery

## Entities

- Hoverplane 
  - The player.
    - Hits to kill: 5
    - Scanner Blip: White

- SEEDER
  - The seeder is a blue flying saucer whose function is to spread red virus across
    the landscape, causing wide-spread pollution and mutation of trees. it does
    this in four phases:

      1.	Flying, and spraying the virus when over land.
      2.	Finding a suitable landing site, and then landing on the
                    ground.
      3.	Spraying the immediate vicinity with virus in order to create a
                    higher density of mutant foliage.
      4.	Re-launching to find a suitable new landing site.

    When it is about to land, is landed, or is taking off, a yellow undercarriage
    is clearly visible.

    - Score for a kill:	100(in the air) 50(when landed)
    - Scanner Blip:	Cyan

- DRONE
  - A red and brown spaceship with a yellow underside, the drone flies in a similar
manner to the Hoverplane but it han a weaker thrust capability. Its role is to shoot the landscape and your Hoverplane, and to attempt to
mutate itself by selecting a suitable bush and shooting it while within its
"spray zone".
    - Score for a kill:		300
    - Hits to kill: 1
    - Scanner Blip:     		Orange


- MUTANT (MUTATED DRONE)
  - The mutant is red and purple with a yellow underside. It flies in a similar way
  to the Hoverplane. It has a weaker thrust capability then the Hoverplane, but
  more powerful than a drone. Its objective is to annoy and ultimately kill you. It has a much higher firing
  rate than a drone, and is also more accurate.
    - Score for a kill:		500
    - Hits to kill: 1
    - Scanner Blip:			Flashing orange/red


- BOMBER
  - Bombers are cyan and blue ships with a yellow underside. They fly straight and
  level at very high speed, dropping parachute bombs most of the time. They are
  detectable from a distance by the whooshing sound they emit as they fly along. The bomber's role is basically to spread virus, but it does so at a much higher
  rate than the seeder. The parachute bombs, which swing as they are dropped out of the bomber have two
  functions:

    1. Proximity detonation on the Hoverplane.
    2. Explosion above the ground, spreading concentrated virus around
                  the area of impact.

    - Score for a kill:		800
    - Hits to kill: 1
    - Scanner Blip:			cyan/dark blue


- PEST
  - Pests are magneta and yellow octahedrons which always head towards your
  Hoverplane. Their task is simple: to destroy you at all costs. A pest is
  characterised by the distinctive twittering noises it produces and the smoke
  trail that is left behind in its wake.
    - Score for a kill:		400
    - Hits to kill: 1
    - Scanner Blip: Magneta


- FIGHTER
  - A fighter is a red,orange and yellow Chevron-shaped craft which flies in a
  similar manner to a mutant, but has a higher rate-of-fire (the same as the
  Hoverplane). However, a fighter has to be hit twice with the laser cannon or
  once with a homing missile in order to destroy it. After it has been hit once,
  its rate-of-fire is halved, and it turns a greenish color.
    - Score for a kill:		200 (for first hit) 700 (for the kill)
    - Hits to kill: 2
    - Scanner Blip:			Flashing yellow/black

- ATTRACTOR
  - The Attractor is one of the rarest and most dangerous of the alien spacecraft.
  It is distinguished by its square base and red and white markings, as well as
  the deadly lightning bolts that it shoots at the landscape below. However, the
  Attractor's most powerful attribute is its tractor beam which pulls the
  Hoverplane towards it and drains the Hoverplane's energy. To destroy an
  Attractor, you will have to hit it a number of times.
    - Score for a kill:		1000
    - Hits to kill: 5
    - Scanner Blip:	Flashing red/black


- MYSTERY SPACECRAFT
  - A secret new alien spaceship is roumoured to have joined the invasion force,
  and may strike at any time. You will only recognise this craft because it does
  not fit the description of any of the known aliens. Beware, as it may have a
  lethal new weapons system fitted. Drops a pest like bomb every 4 seconds that scores 150 when killed
    - Score for a kill:		2000
    - Hits to kill: 25
    - Scanner Blip:	None


import -l cover.png
export -l cover.png
