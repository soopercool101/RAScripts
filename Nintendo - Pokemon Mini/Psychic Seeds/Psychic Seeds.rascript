// ~Homebrew~ Pokemon - Psychic Seeds
// #ID = 15724

// $0302: Title Screen: Right Arrow
// $0312: Title Screen: Left Arrow
// $044D: Minidex:
//        0x77: List View
//        0x7b: Viewing Pokemon
// $04D4: Input flags:
//        bit0: A
//        bit1: B
//        bit2: C
//        bit3: Up
//        bit4: Down
//        bit5: Left
//        bit6: Right
// $04EA: Stage Completion Flags (1/4)
//        Bit0: Stage 1
//        Bit1: Stage 2
//        Bit2: Stage 3
//        Bit3: Stage 4
//        Bit4: Bonus 1
//        Bit5: Stage 5
//        Bit6: Stage 6
//        Bit7: Stage 7
// $04EB: Stage Completion Flags (2/4)
//        Bit0: Stage 8
//        Bit1: Bonus 2
//        Bit2: Stage 9
//        Bit3: Stage 10
//        Bit4: Stage 11
//        Bit5: Stage 12
//        Bit6: Bonus 3
//        Bit7: Stage 13
// $04EC: Stage Completion Flags (3/4)
//        Bit0: Stage 14
//        Bit1: Stage 15
//        Bit2: Stage 16
//        Bit3: Bonus 4
//        Bit4: Stage 17
//        Bit5: Stage 18
//        Bit6: Stage 19
//        Bit7: Stage 20
// $04ED: Stage Completion Flags (4/4)
//        Bit0: Bonus 5
//        Bit1: Stage 21
//        Bit2: Stage 22
//        Bit3: Stage 23
//        Bit4: Stage 24
//        Bit5: Bonus 6
// $04F2: Minidex (01-08)
//        bit0=Pichu
//        bit1=Snubull
//        bit2=Togepi
//        bit3=Bulbasaur
//        bit4=Entei
//        bit5=Oddish
//        bit6=Hoppip
//        bit7=Phanpy
// $04F3: Minidex (09-16)
//        bit0=Numel
//        bit1=Regirock
//        bit2=Graveler
//        bit3=Pikachu
//        bit4=Duskull
//        bit5=Teddiursa
//        bit6=Raikou
//        bit7=Camerupt (Spelled "Camelrupt")
// $04F4: Minidex (17-24)
//        bit0=Nosepass
//        bit1=Rhyhorn
//        bit2=Loudred
//        bit3=Regice
//        bit4=Gengar
//        bit5=Ursaring
//        bit6=Abra
//        bit7=Granbull
//        
//        [Demo]
//        Minidex (01-08) (Only the first 5 are obtainable)
//        bit0=Caterpie
//        bit1=Pichu
//        bit2=Hoothoot
//        bit3=Spinarak
//        bit4=Cleffa
// $04F5: Minidex (25-32)
//        bit0=Suicune
//        bit1=Raichu
//        bit2=Exploud
//        bit3=Ditto
//        bit4=Salamence
//        bit5=Registeel
//        bit6=Mewtwo (Clear Time Reward)
//        bit7=Mew (Bonus Clear Time Reward)
// $04F6: Minidex (33-34)
//        bit0=Celebi (Berry Completion Reward)
//        bit1=Jirachi (Dex Completion Reward)
// $04FC: Stage 1 Berries
// $04FD: Stage 2 Berries
// $04FE: Stage 3 Berries
//        
//        [Demo]
//        Stage 1 Berries
// $04FF: Stage 4 Berries
//        
//        [Demo]
//        Stage 2 Berries
// $0500: Bonus 1 Berries (Unused)
//        
//        [Demo]
//        Stage 3 Berries
// $0501: Stage 5 Berries
//        
//        [Demo]
//        Stage 4 Berries
// $0502: Stage 6 Berries
// $0503: Stage 7 Berries
// $0504: Stage 8 Berries
// $0505: Bonus 2 Berries (Unused)
// $0506: Stage 9 Berries
// $0507: Stage 10 Berries
// $0508: Stage 11 Berries
// $0509: Stage 12 Berries
// $050A: Bonus 3 Berries (Unused)
// $050B: Stage 13 Berries
// $050C: Stage 14 Berries
// $050D: Stage 15 Berries
// $050E: Stage 16 Berries
// $050F: Bonus 4 Berries (Unused)
// $0510: Stage 17 Berries
//        
//        [Demo]
//        Level ID (Set on Menu)
// $0511: Stage 18 Berries
// $0512: Stage 19 Berries
// $0513: Stage 20 Berries
// $0514: Bonus 5 Berries (Unused)
// $0515: Stage 21 Berries
// $0516: Stage 22 Berries
// $0517: Stage 23 Berries
// $0518: Stage 24 Berries
// $0519: Bonus 6 Berries (Unused)
// $051A: Stage 1 Personal Best Time
//        
//        These timers are all Big Endian, 16-bit, and have 18 (0x12) ticks to a second
//        
//        [Demo]
//        Minidex: Selected Pokemon (Caught pokemon on catch screen)
// $051C: Stage 2 Personal Best Time
// $051E: Stage 3 Personal Best Time
// $0520: Stage 4 Personal Best Time
// $0522: Bonus 1 Personal Best Time
// $0524: Stage 5 Personal Best Time
// $0526: Stage 6 Personal Best Time
// $0528: Stage 7 Personal Best Time
// $052A: Stage 8 Personal Best Time
// $052C: Bonus 2 Personal Best Time
// $052E: Stage 9 Personal Best Time
// $0530: Stage 10 Personal Best Time
// $0532: Stage 11 Personal Best Time
// $0534: Stage 12 Personal Best Time
// $0536: Bonus 3 Personal Best Time
// $0538: Stage 13 Personal Best Time
// $053A: Stage 14 Personal Best Time
// $053C: Stage 15 Personal Best Time
// $053E: Stage 16 Personal Best Time
// $0540: Bonus 4 Personal Best Time
// $0542: Stage 17 Personal Best Time
// $0544: Stage 18 Personal Best Time
// $0546: Stage 19 Personal Best Time
// $0548: Stage 20 Personal Best Time
// $054A: Bonus 5 Personal Best Time
// $054C: Stage 21 Personal Best Time
// $054E: Stage 22 Personal Best Time
// $0550: Stage 23 Personal Best Time
// $0552: Stage 24 Personal Best Time
// $0554: Bonus 6 Personal Best Time
// $055C: Level ID (Set on menu)
// $0564: Pause Menu: Current Selection
//        0: How to Play
//        1: Restart
//        2: Give Up
//        3: Options
// $0567: Minidex: Selected Pokemon (Caught pokemon on catch screen)
// $0569: How To Play: Current Page
//        0: Goal
//        1: Objects
//        2: Items
//        3: Bonus
// $056A: How to Play: Current Subpage
// $0570: Egg 0 State
// $057C: Egg 1 State
// $0588: Egg 2 State
// $0594: Egg 3 State
// $05A0: Egg 4 State
// $05AC: Egg 5 State
// $0E4E: [Demo]
//        
//        Current Egg (ID is static and predetermined?)
// $0E61: [Demo]
//        
//        Current active eggs count
// $0E62: [Demo]
//        
//        Current Egg (ID in order of unlock, 0 being starting egg, 5 being last unlocked egg)
// $0E6B: [Demo]
//        
//        Current Berries Collected
// $0E8E: [Demo]
//        Stage Timer (16 bit, Big Endian, 1/18 seconds)
//        
//        Maxes out at 0x2f2a (9'59"94), doesn't overflow
// $0E9C: Current Egg (ID is static and predetermined?)
// $0EAF: Current Active Eggs count
// $0EB0: Current Egg (ID in order of unlock, 0 being starting egg, 5 being last unlocked egg)
// $0EB9: Current Berries Collected
// $0EDD: Stage Timer Milliseconds
//        
//        Each tick on this timer is 1/18 of a second
// $0EDE: Stage Timer (Seconds, 16 bit)
// $1088: Game State:
//        [Full Game]
//        0x00: Booting
//        0x55: Minidex (And In-Game when first obtaining a Pokemon)
//        0x85: Main Menu
//        0x91: Level Select
//        0x9a: Victory Screen
//        0x9e: How to Play | Pause/Options (Fluctuates; 1/2)
//        0xca: Pause/Options (Fluctuates; 2/2)
//        0xf6: Credits (Fluctuates; 1/2)
//        0xf7: Credits (Fluctuates; 2/2)
//        0xf9: In-game
//        
//        [Demo]
//        0x00: Booting
//        0x03: Victory Screen
//        0x07: How to Play
//        0x08: In-Game
//        0x38: Pause/Options (Fluctuates; 1/2)
//        0x5a: Minidex (And In-Game when first obtaining a Pokemon)
//        0x64: Pause/Options (Fluctuates; 2/2)
//        0xea: Main Menu
//        0xfa: Level Select

// None of these states are used by the full game, so these combined can definitively tell which version is played
function PlayingDemo() => State() == 0x03 ||
                          State() == 0x07 ||
                          State() == 0x08 ||
                          State() == 0x38 ||
                          State() == 0x5a ||
                          State() == 0x64 ||
                          State() == 0xea ||
                          State() == 0xfa

function Level() => byte(0x55C)
function IsBonus() => Level() == 0x04 || // Every 5th ID is a bonus level
                      Level() == 0x09 ||
                      Level() == 0x0e ||
                      Level() == 0x13 ||
                      Level() == 0x18 ||
                      Level() == 0x1d

function DEMO_Level() => byte(0x510)
function DEMO_IsBonus() => DEMO_Level() == 4 // Demo only has one accessible bonus stage

function State() => byte(0x1088)

// Shared States
function Boot() => State() == 0 || prev(State()) == 0

// Main Game States
function Stage_Select() => State() == 0x91
function Minidex() => State() == 0x55
                   && prior(State()) != 0xf9 // Previous screen was not in game (means a pokemon was caught in level)
                   && prior(State()) != 0x91 // Previous screen was not level select (means a special pokemon was obtained)
function In_Game() => State() == 0xf9 // Doesn't include pokemon catch state
function Was_In_Game() => State() == 0xf9 || prev(State()) == 0xf9 // Used to allow victory screen unlocks
function Pokemon_Caught() => State() == 0x55 && prev(State()) == 0xf9 // Immediate, for cheevos
function Pokemon_Caught_RP() => State() == 0x55 && prior(State()) == 0xf9 // Persistent, for rich presence
function Special_Pokemon_Caught() => State() == 0x55 && (prev(State()) == 0x91 || prev(State()) == 0x9e || prev(State()) == 0xca) // Immediate, for cheevos
function Special_Pokemon_Caught_RP() => State() == 0x55 && (prior(State()) == 0x91 || prior(State()) == 0x9e || prior(State()) == 0xca) // Persistent, for rich presence
function Victory() => State() == 0x9a && prev(State()) == 0xf9
function Victory_RP() => State() == 0x9a
function Credits() => State() == 0xf6 || State() == 0xf7
// Menu state, doesn't include Minidex or level select, which have their own handling
function In_Menu() => State() == 0x85 || // Main Menu
                      State() == 0x9e || // How to Play or Pause/Options 1
                      State() == 0xca    // Pause/Options 2

// Demo Game States
function DEMO_Stage_Select() => State() == 0xfa
function DEMO_Minidex() => State() == 0x55
                        && prior(State()) != 0x08 // Previous screen was not in game (means a pokemon was caught in level)
                        && prior(State()) != 0xfa // Previous screen was not level select (means a special pokemon was obtained)
function DEMO_In_Game() => State() == 0x8 // Doesn't include pokemon catch state
function DEMO_Was_In_Game() => State() == 0x8 || prev(State()) == 0x8 // Used to allow victory screen unlocks
function DEMO_Pokemon_Caught() => State() == 0x5a && prev(State()) == 0x8 // Immediate, for cheevos
function DEMO_Pokemon_Caught_RP() => State() == 0x5a && prior(State()) == 0x8 // Persistent, for rich presence
function DEMO_Special_Pokemon_Caught_RP() => State() == 0x5a && (prior(State()) == 0xfa || prior(State()) == 0x38 || prior(State()) == 0x64) // Persistent, for rich presence
function DEMO_Victory() => State() == 0x3 && prev(State()) == 0x8
function DEMO_Victory_RP() => State() == 0x3
// Menu state, doesn't include Minidex or level select, which have their own handling
function DEMO_In_Menu() => State() == 0xea || // Main Menu
                           State() == 0x07 || // How to Play
                           State() == 0x38 || // Pause/Options 1
                           State() == 0x64    // Pause/Options 2

// Main Game Timer
function timer(index) => byte(0x0EDD + index)
function Time_MSecs_RAW() => timer(0)
function Time_MSecs() => Time_MSecs_RAW() * 50/9
function Time_Secs() => timer(1) + (timer(2) * 256)
function Overflow() => timer(2) == 0 && prev(timer(2)) == 0xFF // Overflow protection (Main Game Timer can overflow)

// Demo Timer
function DEMO_timer(index) => byte(0xe8e + index)
function DEMO_Time_MSecs() => DEMO_timer(0) * 50/9 + (DEMO_timer(1) * 256) * 50/9

function Eggs() => byte(0xeaf)
function DEMO_Eggs() => byte(0xe61)
function Berries() => byte(0xeb9)
function DEMO_Berries() => byte(0xe6b)
function Current_Pokemon() => byte(0x567)
function DEMO_Current_Pokemon() => byte(0x51a)

function Current_Egg() => low4(0xEB0)         // ID for this is based on order eggs are activated in
function DEMO_Current_Egg() => low4(0xE62)
function Current_Egg_Static() => low4(0xE9C)  // Less useful, could be used for specific challenges?
function DEMO_Current_Egg_Static() => low4(0xE4E)

// Minidex
function Minidex_Page(index) => byte(0x4F2 + index) // Pages consist of 8 Pokemon, Full game has 5 pages (last page has only 2 pokemon)
function Minidex_Count() => bitcount(Minidex_Page(0))
                          + bitcount(Minidex_Page(1))
                          + bitcount(Minidex_Page(2))
                          + bitcount(Minidex_Page(3))
                          + bitcount(Minidex_Page(4))

function Stage_Berries(index) => byte(0x4fc + index)
function Berry_Count() => Stage_Berries(0) +    // Stage 1
                          Stage_Berries(1) +    // Stage 2
                          Stage_Berries(2) +    // Stage 3
                          Stage_Berries(3) +    // Stage 4
                                      //4       // Bonus 1 (Has a berry register but no berries, so skip)
                          Stage_Berries(5) +    // Stage 5
                          Stage_Berries(6) +    // Stage 6
                          Stage_Berries(7) +    // Stage 7
                          Stage_Berries(8) +    // Stage 8
                                      //9       // Bonus 2 (Has a berry register but no berries, so skip)
                          Stage_Berries(10) +   // Stage 9
                          Stage_Berries(11) +   // Stage 10
                          Stage_Berries(12) +   // Stage 11
                          Stage_Berries(13) +   // Stage 12
                                      //14      // Bonus 3 (Has a berry register but no berries, so skip)
                          Stage_Berries(15) +   // Stage 13
                          Stage_Berries(16) +   // Stage 14
                          Stage_Berries(17) +   // Stage 15
                          Stage_Berries(18) +   // Stage 16
                                      //19      // Bonus 4 (Has a berry register but no berries, so skip)
                          Stage_Berries(20) +   // Stage 17
                          Stage_Berries(21) +   // Stage 18
                          Stage_Berries(22) +   // Stage 19
                          Stage_Berries(23) +   // Stage 20
                                      //24      // Bonus 5 (Has a berry register but no berries, so skip)
                          Stage_Berries(25) +   // Stage 21
                          Stage_Berries(26) +   // Stage 22
                          Stage_Berries(27) +   // Stage 23
                          Stage_Berries(28)     // Stage 24
                                      //29      // Bonus 5 (Has a berry register but no berries, so skip)
function DEMO_Stage_Berries(index) => byte(0x4fe + index)
function DEMO_Berry_Count() => DEMO_Stage_Berries(0) +  // Demo Stage 1
                               DEMO_Stage_Berries(1) +  // Demo Stage 2
                               DEMO_Stage_Berries(2) +  // Demo Stage 3
                               DEMO_Stage_Berries(3)    // Demo Stage 4
                                                //4     // Demo Bonus 1 (Has a berry register but no berries, so skip)

//*********************************************\\
//                ACHIEVEMENTS                 \\
//*********************************************\\


//*********************************************\\
//                 PROGRESSION                 \\
//*********************************************\\

achievement(
    title = "Stages Set 1: Hypnosis", description = "Complete Stages 1-4", points = 5,
    trigger = //** LOGIC: UNLOCK WHEN THE FIRST FOUR LEVELS ARE COMPLETED FOR THE FIRST TIME **\\
              unless(PlayingDemo()) &&      // Don't track measured when in demo (the achievement is already impossible in demo, this just ensures measured bar doesn't show glitched values)
              (In_Game() || Victory_RP())   // In game (tends to unlock here) or on victory screen (as a backup)
              && never(Boot()) &&           // Cancel hits on reset
              never(bit0(0x4ea) == 0 &&     // Cancel hits when all 4 levels are incomplete (data reset, important! If we don't have this, resetting a 100% save lets any level in the group insta-unlock the cheevo)
                    bit1(0x4ea) == 0 &&
                    bit2(0x4ea) == 0 &&
                    bit3(0x4ea) == 0) &&
              measured(tally(4,
                once(bit0(0x4ea) == 1),     // Stage 1 complete
                once(bit1(0x4ea) == 1),     // Stage 2 complete
                once(bit2(0x4ea) == 1),     // Stage 3 complete
                once(bit3(0x4ea) == 1)))    // Stage 4 complete
              && ( // STAGES CAN BE DONE IN ANY ORDER IN THE ROW! ADD SAVE PROTECTION!
              prev(bit0(0x4ea)) == 0 ||     // Stage 1 wasn't complete
              prev(bit1(0x4ea)) == 0 ||     // Stage 2 wasn't complete
              prev(bit2(0x4ea)) == 0 ||     // Stage 3 wasn't complete
              prev(bit3(0x4ea)) == 0)       // Stage 4 wasn't complete
)

achievement(
    title = "Stages Set 2: Reflect", description = "Complete Stages 5-8", points = 5,
    trigger = //** LOGIC: UNLOCK WHEN THE LEVEL GROUP IS COMPLETED FOR THE FIRST TIME **\\
              unless(PlayingDemo()) &&      // Don't track measured when in demo (the achievement is already impossible in demo, this just ensures measured bar doesn't show glitched values)
              (In_Game() || Victory_RP())   // In game (tends to unlock here) or on victory screen (as a backup)
              && never(Boot()) &&           // Cancel hits on reset
              never(bit5(0x4ea) == 0 &&     // Cancel hits when all 4 levels are incomplete (data reset, important! If we don't have this, resetting a 100% save lets any level in the group insta-unlock the cheevo)
                    bit6(0x4ea) == 0 &&
                    bit7(0x4ea) == 0 &&
                    bit0(0x4eb) == 0) &&
              measured(tally(4,
                once(bit5(0x4ea) == 1),     // Stage 5 complete
                once(bit6(0x4ea) == 1),     // Stage 6 complete
                once(bit7(0x4ea) == 1),     // Stage 7 complete
                once(bit0(0x4eb) == 1)))    // Stage 8 complete
              && ( // STAGES CAN BE DONE IN ANY ORDER IN THE ROW! ADD SAVE PROTECTION!
              prev(bit5(0x4ea)) == 0 ||     // Stage 5 wasn't complete
              prev(bit6(0x4ea)) == 0 ||     // Stage 6 wasn't complete
              prev(bit7(0x4ea)) == 0 ||     // Stage 7 wasn't complete
              prev(bit0(0x4eb)) == 0)       // Stage 8 wasn't complete
)

achievement(
    title = "Stages Set 3: Leech Seed", description = "Complete Stages 9-12", points = 10,
    trigger = //** LOGIC: UNLOCK WHEN THE LEVEL GROUP IS COMPLETED FOR THE FIRST TIME **\\
              unless(PlayingDemo()) &&      // Don't track measured when in demo (the achievement is already impossible in demo, this just ensures measured bar doesn't show glitched values)
              (In_Game() || Victory_RP())   // In game (tends to unlock here) or on victory screen (as a backup)
              && never(Boot()) &&           // Cancel hits on reset
              never(bit2(0x4eb) == 0 &&     // Cancel hits when all 4 levels are incomplete (data reset, important! If we don't have this, resetting a 100% save lets any level in the group insta-unlock the cheevo)
                    bit3(0x4eb) == 0 &&
                    bit4(0x4eb) == 0 &&
                    bit5(0x4eb) == 0) &&
              measured(tally(4,
                once(bit2(0x4eb) == 1),     // Stage 9 complete
                once(bit3(0x4eb) == 1),     // Stage 10 complete
                once(bit4(0x4eb) == 1),     // Stage 11 complete
                once(bit5(0x4eb) == 1)))    // Stage 12 complete
              && ( // STAGES CAN BE DONE IN ANY ORDER IN THE ROW! ADD SAVE PROTECTION!
              prev(bit2(0x4eb)) == 0 ||     // Stage 9 wasn't complete
              prev(bit3(0x4eb)) == 0 ||     // Stage 10 wasn't complete
              prev(bit4(0x4eb)) == 0 ||     // Stage 11 wasn't complete
              prev(bit5(0x4eb)) == 0)       // Stage 12 wasn't complete
)

achievement(
    title = "Stages Set 4: Stun Spore", description = "Complete Stages 13-16", points = 10,
    trigger = //** LOGIC: UNLOCK WHEN THE LEVEL GROUP IS COMPLETED FOR THE FIRST TIME **\\
              unless(PlayingDemo()) &&      // Don't track measured when in demo (the achievement is already impossible in demo, this just ensures measured bar doesn't show glitched values)
              (In_Game() || Victory_RP())   // In game (tends to unlock here) or on victory screen (as a backup)
              && never(Boot()) &&           // Cancel hits on reset
              never(bit7(0x4eb) == 0 &&     // Cancel hits when all 4 levels are incomplete (data reset, important! If we don't have this, resetting a 100% save lets any level in the group insta-unlock the cheevo)
                    bit0(0x4ec) == 0 &&
                    bit1(0x4ec) == 0 &&
                    bit2(0x4ec) == 0) &&
              measured(tally(4,
                once(bit7(0x4eb) == 1),     // Stage 13 complete
                once(bit0(0x4ec) == 1),     // Stage 14 complete
                once(bit1(0x4ec) == 1),     // Stage 15 complete
                once(bit2(0x4ec) == 1)))    // Stage 16 complete
              && ( // STAGES CAN BE DONE IN ANY ORDER IN THE ROW! ADD SAVE PROTECTION!
              prev(bit7(0x4eb)) == 0 ||     // Stage 13 wasn't complete
              prev(bit0(0x4ec)) == 0 ||     // Stage 14 wasn't complete
              prev(bit1(0x4ec)) == 0 ||     // Stage 15 wasn't complete
              prev(bit2(0x4ec)) == 0)       // Stage 16 wasn't complete
)

achievement(
    title = "Stages Set 5: PoisonPowder", description = "Complete Stages 17-20", points = 25,
    trigger = //** LOGIC: UNLOCK WHEN THE LEVEL GROUP IS COMPLETED FOR THE FIRST TIME **\\
              unless(PlayingDemo()) &&      // Don't track measured when in demo (the achievement is already impossible in demo, this just ensures measured bar doesn't show glitched values)
              (In_Game() || Victory_RP())   // In game (tends to unlock here) or on victory screen (as a backup)
              && never(Boot()) &&           // Cancel hits on reset
              never(bit4(0x4ec) == 0 &&     // Cancel hits when all 4 levels are incomplete (data reset, important! If we don't have this, resetting a 100% save lets any level in the group insta-unlock the cheevo)
                    bit5(0x4ec) == 0 &&
                    bit6(0x4ec) == 0 &&
                    bit7(0x4ec) == 0) &&
              measured(tally(4,
                once(bit4(0x4ec) == 1),     // Stage 17 complete
                once(bit5(0x4ec) == 1),     // Stage 18 complete
                once(bit6(0x4ec) == 1),     // Stage 19 complete
                once(bit7(0x4ec) == 1)))    // Stage 20 complete
              && ( // STAGES CAN BE DONE IN ANY ORDER IN THE ROW! ADD SAVE PROTECTION!
              prev(bit4(0x4ec)) == 0 ||     // Stage 17 wasn't complete
              prev(bit5(0x4ec)) == 0 ||     // Stage 18 wasn't complete
              prev(bit6(0x4ec)) == 0 ||     // Stage 19 wasn't complete
              prev(bit7(0x4ec)) == 0)       // Stage 20 wasn't complete
)

achievement(
    title = "Stages Set 6: SolarBeam", description = "Complete Stages 21-24", points = 25,
    trigger = //** LOGIC: UNLOCK WHEN THE LEVEL GROUP IS COMPLETED FOR THE FIRST TIME **\\
              unless(PlayingDemo()) &&      // Don't track measured when in demo (the achievement is already impossible in demo, this just ensures measured bar doesn't show glitched values)
              (In_Game() || Victory_RP())   // In game (tends to unlock here) or on victory screen (as a backup)
              && never(Boot()) &&           // Cancel hits on reset
              never(bit1(0x4ed) == 0 &&     // Cancel hits when all 4 levels are incomplete (data reset, important! If we don't have this, resetting a 100% save lets any level in the group insta-unlock the cheevo)
                    bit2(0x4ed) == 0 &&
                    bit3(0x4ed) == 0 &&
                    bit4(0x4ed) == 0) &&
              measured(tally(4,
                once(bit1(0x4ed) == 1),     // Stage 21 complete
                once(bit2(0x4ed) == 1),     // Stage 22 complete
                once(bit3(0x4ed) == 1),     // Stage 23 complete
                once(bit4(0x4ed) == 1)))    // Stage 24 complete
              && ( // STAGES CAN BE DONE IN ANY ORDER IN THE ROW! ADD SAVE PROTECTION!
              prev(bit1(0x4ed)) == 0 ||     // Stage 21 wasn't complete
              prev(bit2(0x4ed)) == 0 ||     // Stage 22 wasn't complete
              prev(bit3(0x4ed)) == 0 ||     // Stage 23 wasn't complete
              prev(bit4(0x4ed)) == 0)       // Stage 24 wasn't complete
)

//*********************************************\\
//                BONUS LEVELS                 \\
//*********************************************\\

achievement(
    title = "The Volcano Pokemon", description = "Complete Bonus 1", points = 5,
    trigger = (Pokemon_Caught() && Current_Pokemon() == 0x04) // Base achievement condition is to catch Entei (Achievement feels better to pop here)
           || (Victory() && Level() == 0x04)                  // Backup condition to beat the actual level (Since Entei cutscene only happens once, this allows users with a save to unlock this cheevo)
)

achievement(
    title = "The Rock Peak Pokemon", description = "Complete Bonus 2", points = 5,
    trigger = (Pokemon_Caught() && Current_Pokemon() == 0x09) // Base achievement condition is to catch Regirock (Achievement feels better to pop here)
           || (Victory() && Level() == 0x09)                  // Backup condition to beat the actual level (Since Regirock cutscene only happens once, this allows users with a save to unlock this cheevo)
)

achievement(
    title = "The Thunder Pokemon", description = "Complete Bonus 3", points = 10,
    trigger = (Pokemon_Caught() && Current_Pokemon() == 0x0E) // Base achievement condition is to catch Raikou (Achievement feels better to pop here)
           || (Victory() && Level() == 0x0E)                  // Backup condition to beat the actual level (Since Raikou cutscene only happens once, this allows users with a save to unlock this cheevo)
)

achievement(
    title = "The Iceberg Pokemon", description = "Complete Bonus 4", points = 10,
    trigger = (Pokemon_Caught() && Current_Pokemon() == 0x13) // Base achievement condition is to catch Regice (Achievement feels better to pop here)
           || (Victory() && Level() == 0x13)                  // Backup condition to beat the actual level (Since Regice cutscene only happens once, this allows users with a save to unlock this cheevo)
)

achievement(
    title = "The Aurora Pokemon", description = "Complete Bonus 5", points = 25,
    trigger = (Pokemon_Caught() && Current_Pokemon() == 0x18) // Base achievement condition is to catch Suicune (Achievement feels better to pop here)
           || (Victory() && Level() == 0x18)                  // Backup condition to beat the actual level (Since Suicune cutscene only happens once, this allows users with a save to unlock this cheevo)
)

achievement(
    title = "The Iron Pokemon", description = "Complete Bonus 6", points = 25,
    trigger = (Pokemon_Caught() && Current_Pokemon() == 0x1D) // Base achievement condition is to catch Regirock (Achievement feels better to pop here)
           || (Victory() && Level() == 0x1D)                  // Backup condition to beat the actual level (Since Regirock cutscene only happens once, this allows users with a save to unlock this cheevo)
)

//*********************************************\\
//                 CHALLENGES                  \\
//*********************************************\\

// Challenge cheevos should be unlockable in both the full game and demo, because if the demo is linked, might as well let some cheevos unlock

achievement(
    title = "Hold Down + B", description = "Find a hidden Poke Ball in a non-bonus stage and catch a new Pokemon", points = 1,
    trigger = (!IsBonus() && Pokemon_Caught())              // Full game logic
           || (!DEMO_IsBonus() && DEMO_Pokemon_Caught())    // Demo logic
)

achievement(
    title = "Harvest", description = "Collect 5 Berries in a single stage", points = 2,
    trigger = (In_Game() && Berries() == 5 && prev(Berries()) != 5)                 // Full game logic
           || (DEMO_In_Game() && DEMO_Berries() == 5 && prev(DEMO_Berries()) != 5)  // Demo logic
)

achievement(
    title = "Keep Your Eggs in One Basket", description = "Finish any non-bonus stage while only switching 5 times or less", points = 2,
    trigger = // FULL GAME LOGIC
              (unless(!Was_In_Game()) &&                                                        // Ensure logic is only used for full game
              !IsBonus() &&                                                                     // Not a bonus level (doesn't involve switching)
              (once(prev(timer(0)) == 0 && timer(0) != 0 && timer(1) == 0 && timer(2) == 0) &&  // The timer is 0 at least once (start of level)
              never(timer(0) == 0 && timer(1) == 0 && timer(2) == 0) &&                         // Reset hits on level start
              Victory() &&                                                                      // The level is won
              never(tally(6, Current_Egg() != prev(Current_Egg()))))) ||                        // The current egg is never swapped 6 times
              // DEMO LOGIC
              (unless(!DEMO_Was_In_Game()) &&                                                   // Ensure logic is only used for the demo
              !DEMO_IsBonus() &&                                                                // Not a bonus level (doesn't involve switching)
              (once(prev(DEMO_timer(0)) == 0 && DEMO_timer(0) != 0 && DEMO_timer(1) == 0) &&    // The timer is 0 at least once (start of level)
              never(DEMO_timer(0) == 0 && DEMO_timer(1) == 0) &&                                // Reset hits on level start
              DEMO_Victory() &&                                                                 // The level is won
              never(tally(6, DEMO_Current_Egg() != prev(DEMO_Current_Egg())))))                 // The current egg is never swapped 6 times
)

achievement(
    title = "TM44", description = "Finish any non-bonus stage without activating all 6 eggs", points = 5,
    trigger = (!IsBonus() && Victory() && Eggs() < 6)                   // Full game logic
           || (!DEMO_IsBonus() && DEMO_Victory() && DEMO_Eggs() < 6)    // Demo logic
)

//*********************************************\\
//               SPECIAL UNLOCKS               \\
//*********************************************\\

achievement(
    title = "An Elusive Mirage", description = "Finish all bonus stages with the default best time beaten and catch Mew", points = 25,
    trigger = once(In_Game()) &&            // Unlock happens on stage select. Prevent resetting to get the unlock by forcing at least one level done
              Special_Pokemon_Caught() &&   // Special Catch (from stage select)
              Current_Pokemon() == 0x1F     // Catching Mew
)

achievement(
    title = "Berry Master", description = "Collect all berries and catch Celebi", points = 25,
    trigger = unless(PlayingDemo()) &&      // Don't track measured when in demo (the achievement is already impossible in demo, this just ensures measured bar doesn't show glitched values)
              measured( // Measured bar for berry total (Each non-bonus level has 5 berries, for a total of 120)
                Berry_Count() >= 120        // 120 total berries
              ) &&
              once(In_Game()) &&            // Unlock happens on stage select. Prevent resetting to get the unlock by forcing at least one level done
              Special_Pokemon_Caught() &&   // Special Catch (from stage select)
              Current_Pokemon() == 0x20     // Catching Celebi
)

achievement(
    title = "40 Base Speed is Fast Enough", description = "Finish all stages with the default best time beaten and catch Mewtwo", points = 50,
    trigger = once(In_Game()) &&            // Unlock happens on stage select. Prevent resetting to get the unlock by forcing at least one level done
              Special_Pokemon_Caught() &&   // Special Catch (from stage select)
              Current_Pokemon() == 0x1E     // Catching Mewtwo
)

achievement(
    title = "Gotta Catch 'em All Mini", description = "Complete the Minidex by catching Jirachi", points = 50,
    trigger = unless(PlayingDemo()) &&      // Don't track measured when in demo (the achievement is already impossible in demo, this just ensures measured bar doesn't show glitched values)
              measured(tally(34, // Measured because why not
                once(bit0(0x4F2) == 1),     // 01 - Pichu
                once(bit1(0x4F2) == 1),     // 02 - Snubull
                once(bit2(0x4F2) == 1),     // 03 - Togepi
                once(bit3(0x4F2) == 1),     // 04 - Bulbasaur
                once(bit4(0x4F2) == 1),     // 05 - Entei
                once(bit5(0x4F2) == 1),     // 06 - Oddish
                once(bit6(0x4F2) == 1),     // 07 - Hoppip
                once(bit7(0x4F2) == 1),     // 08 - Phanpy
                once(bit0(0x4F3) == 1),     // 09 - Numel
                once(bit1(0x4F3) == 1),     // 10 - Regirock
                once(bit2(0x4F3) == 1),     // 11 - Graveler
                once(bit3(0x4F3) == 1),     // 12 - Pikachu
                once(bit4(0x4F3) == 1),     // 13 - Duskull
                once(bit5(0x4F3) == 1),     // 14 - Teddiursa
                once(bit6(0x4F3) == 1),     // 15 - Raikou
                once(bit7(0x4F3) == 1),     // 16 - Camerupt
                once(bit0(0x4F4) == 1),     // 17 - Nosepass
                once(bit1(0x4F4) == 1),     // 18 - Rhyhorn
                once(bit2(0x4F4) == 1),     // 19 - Loudred
                once(bit3(0x4F4) == 1),     // 20 - Regice
                once(bit4(0x4F4) == 1),     // 21 - Gengar
                once(bit5(0x4F4) == 1),     // 22 - Ursaring
                once(bit6(0x4F4) == 1),     // 23 - Abra
                once(bit7(0x4F4) == 1),     // 24 - Granbull
                once(bit0(0x4F5) == 1),     // 25 - Suicune
                once(bit1(0x4F5) == 1),     // 26 - Raichu
                once(bit2(0x4F5) == 1),     // 27 - Exploud
                once(bit3(0x4F5) == 1),     // 28 - Ditto
                once(bit4(0x4F5) == 1),     // 29 - Salamence
                once(bit5(0x4F5) == 1),     // 30 - Registeel
                once(bit6(0x4F5) == 1),     // 31 - Mewtwo
                once(bit7(0x4F5) == 1),     // 32 - Mew
                once(bit0(0x4F6) == 1),     // 33 - Celebi
                once(bit1(0x4F6) == 1)      // 34 - Jirachi
              )) && never( // Reset the measured if the data is cleared
                bit0(0x4F2) == 0 &&         // 01 - Pichu
                bit1(0x4F2) == 0 &&         // 02 - Snubull
                bit2(0x4F2) == 0 &&         // 03 - Togepi
                bit3(0x4F2) == 0 &&         // 04 - Bulbasaur
                bit4(0x4F2) == 0 &&         // 05 - Entei
                bit5(0x4F2) == 0 &&         // 06 - Oddish
                bit6(0x4F2) == 0 &&         // 07 - Hoppip
                bit7(0x4F2) == 0 &&         // 08 - Phanpy
                bit0(0x4F3) == 0 &&         // 09 - Numel
                bit1(0x4F3) == 0 &&         // 10 - Regirock
                bit2(0x4F3) == 0 &&         // 11 - Graveler
                bit3(0x4F3) == 0 &&         // 12 - Pikachu
                bit4(0x4F3) == 0 &&         // 13 - Duskull
                bit5(0x4F3) == 0 &&         // 14 - Teddiursa
                bit6(0x4F3) == 0 &&         // 15 - Raikou
                bit7(0x4F3) == 0 &&         // 16 - Camerupt
                bit0(0x4F4) == 0 &&         // 17 - Nosepass
                bit1(0x4F4) == 0 &&         // 18 - Rhyhorn
                bit2(0x4F4) == 0 &&         // 19 - Loudred
                bit3(0x4F4) == 0 &&         // 20 - Regice
                bit4(0x4F4) == 0 &&         // 21 - Gengar
                bit5(0x4F4) == 0 &&         // 22 - Ursaring
                bit6(0x4F4) == 0 &&         // 23 - Abra
                bit7(0x4F4) == 0 &&         // 24 - Granbull
                bit0(0x4F5) == 0 &&         // 25 - Suicune
                bit1(0x4F5) == 0 &&         // 26 - Raichu
                bit2(0x4F5) == 0 &&         // 27 - Exploud
                bit3(0x4F5) == 0 &&         // 28 - Ditto
                bit4(0x4F5) == 0 &&         // 29 - Salamence
                bit5(0x4F5) == 0 &&         // 30 - Registeel
                bit6(0x4F5) == 0 &&         // 31 - Mewtwo
                bit7(0x4F5) == 0 &&         // 32 - Mew
                bit0(0x4F6) == 0 &&         // 33 - Celebi
                bit1(0x4F6) == 0            // 34 - Jirachi
              ) &&
              once(In_Game()) &&            // Unlock happens on stage select. Prevent resetting to get the unlock by forcing at least one level done
              Special_Pokemon_Caught_RP()   // Special Catch (from stage select; use RP value to ensure stability here!)
              && Current_Pokemon() == 0x21  // Catching Jirachi
)

//*********************************************\\
//                RICH PRESENCE                \\
//*********************************************\\

StageLookup = { // Demo stage IDs are the same, but only go through Bonus 1
    0x00: "Stage 1",
    0x01: "Stage 2",
    0x02: "Stage 3",
    0x03: "Stage 4",
    0x04: "Bonus 1",
    0x05: "Stage 5",
    0x06: "Stage 6",
    0x07: "Stage 7",
    0x08: "Stage 8",
    0x09: "Bonus 2",
    0x0A: "Stage 9",
    0x0B: "Stage 10",
    0x0C: "Stage 11",
    0x0D: "Stage 12",
    0x0E: "Bonus 3",
    0x0F: "Stage 13",
    0x10: "Stage 14",
    0x11: "Stage 15",
    0x12: "Stage 16",
    0x13: "Bonus 4",
    0x14: "Stage 17",
    0x15: "Stage 18",
    0x16: "Stage 19",
    0x17: "Stage 20",
    0x18: "Bonus 5",
    0x19: "Stage 21",
    0x1A: "Stage 22",
    0x1B: "Stage 23",
    0x1C: "Stage 24",
    0x1D: "Bonus 6"
}

PokemonLookup = {
    // Pokemon caught directly in levels
    0x00: "Pichu",
    0x01: "Snubull",
    0x02: "Togepi",
    0x03: "Bulbasaur",
    0x04: "Entei",      // Bonus 1
    0x05: "Oddish",
    0x06: "Hoppip",
    0x07: "Phanpy",
    0x08: "Numel",
    0x09: "Regirock",   // Bonus 2
    0x0A: "Graveler",
    0x0B: "Pikachu",
    0x0C: "Duskull",
    0x0D: "Teddiursa",
    0x0E: "Raikou",     // Bonus 3
    0x0F: "Camerupt",
    0x10: "Nosepass",
    0x11: "Rhyhorn",
    0x12: "Loudred",
    0x13: "Regice",     // Bonus 4
    0x14: "Gengar",
    0x15: "Ursaring",
    0x16: "Abra",
    0x17: "Granbull",
    0x18: "Suicune",    // Bonus 5
    0x19: "Raichu",
    0x1A: "Exploud",
    0x1B: "Ditto",
    0x1C: "Salamence",
    0x1D: "Registeel",  // Bonus 6
    // All below are reward Pokemon, which are caught from the stage select screen (messagebox before them uses fluctuating pause state values!)
    0x1E: "Mewtwo",     // Beat all best times
    0x1F: "Mew",        // Beat all bonus best times
    0x20: "Celebi",     // Get all berries
    0x21: "Jirachi"     // Unlock all other pokemon (including special pokemon!)
}

DEMO_PokemonLookup = {
    0x00: "Caterpie",
    0x01: "Pichu",
    0x02: "Hoothoot",
    0x03: "Spinarak",
    0x04: "Cleffa",
    // All subsequent pokemon are seemingly inaccessible, but fully set up in the files. Including just in case they actually are in some way
    0x05: "Bulbasaur",
    0x06: "Oddish",
    0x07: "Hoppip",
    0x08: "Chikorita",
    0x09: "Nosepass",
    0x0A: "Vulpix",
    0x0B: "Tangela",
    0x0C: "Pidgey",
    0x0D: "Teddiursa",
    0x0E: "Jigglypuff",
    0x0F: "Jumpluff",
    0x10: "Seedot",
    0x11: "Zigzagoon",
    0x12: "Charmander",
    0x13: "Baltoy",
    0x14: "Snubull",
    0x15: "Rhyhorn",
    0x16: "Claydol",
    0x17: "Cacnea",
    0x18: "Mudkip",
    0x19: "Phanpy",
    0x1A: "Graveler",
    0x1B: "Pikachu",
    0x1C: "Growlithe",
    0x1D: "Numel",
    0x1E: "Omastar",
    0x1F: "Shuckle",
    0x20: "Bellossom",
    0x21: "Camerupt",
    0x22: "Togepi",
    0x23: "Butterfree",
    0x24: "Kabuto",
    0x25: "Duskull",
    0x26: "Larvitar",
    0x27: "Loudred",
    0x28: "Hypno",
    0x29: "Gengar",
    0x2A: "Arcanine",
    0x2B: "Ursaring",
    0x2C: "Typhlosion",
    0x2D: "Houndour",
    0x2E: "Ninetales",
    0x2F: "Snorlax",
    0x30: "Abra",
    0x31: "Spinda",
    0x32: "Trapinch",
    0x33: "Granbull",
    0x34: "Raichu",
    0x35: "Wailmer",
    0x36: "Exploud",
    0x37: "Donphan",
    0x38: "Ditto",
    0x39: "Dragonite",
    0x3A: "Metagross",
    0x3B: "Salamence",
    0x3C: "Entei",
    0x3D: "Regirock",
    0x3E: "Raikou",
    0x3F: "Regice",
    0x40: "Suicune",
    0x41: "Registeel",
    0x42: "Mewtwo",
    0x43: "Mew",
    0x44: "Celebi",
    0x45: "Jirachi"
}

MSecLookup = { // Accurate values for rich presence
    0x00: "00",
    0x01: "06",
    0x02: "11",
    0x03: "17",
    0x04: "22",
    0x05: "28",
    0x06: "33",
    0x07: "39",
    0x08: "44",
    0x09: "50",
    0x0A: "56",
    0x0B: "61",
    0x0C: "67",
    0x0D: "72",
    0x0E: "78",
    0x0F: "83",
    0x10: "89",
    0x11: "94",
    0x12: "99" // Shouldn't be a real value, here as protection
}

// Shared between full game and demo
rich_presence_conditional_display(Boot(), "Booting the game")

// Fallback value (should not be accessed, but just in case)
rich_presence_display("Playing ~Homebrew~ Pokemon - Psychic Seeds")

//*********************************************\\
//                RP: FULL GAME                \\
//*********************************************\\

// Generic menus
rich_presence_conditional_display(In_Menu(), "In a menu")

// Stage selection
rich_presence_conditional_display(Stage_Select(), "Selecting a stage | 🍓{0}/120",
    rich_presence_value("Digit", Berry_Count())
)

// Minidex viewing
rich_presence_conditional_display(Minidex(), "Viewing the Minidex | {0}/34 caught",
    rich_presence_value("Digit", Minidex_Count())
)

// Caught a pokemon in a level
rich_presence_conditional_display(Pokemon_Caught_RP(), "Caught {0} in {1}!",
    rich_presence_lookup("Pokemon", Current_Pokemon(), PokemonLookup),
    rich_presence_lookup("Stage", Level(), StageLookup)
)

// Caught a special pokemon from the stage select screen
rich_presence_conditional_display(Special_Pokemon_Caught_RP(), "Caught {0}!",
    rich_presence_lookup("Pokemon", Current_Pokemon(), PokemonLookup)
)

// Playing a bonus level (don't show egg or berry count)
rich_presence_conditional_display(In_Game() && IsBonus(), "Playing {0} | ⏰{1}.{2}",
    rich_presence_lookup("Stage", Level(), StageLookup),
    rich_presence_value("Seconds", Time_Secs(), format="SECS"),
    rich_presence_lookup("MSec", Time_MSecs_RAW(), MSecLookup)
)

// Playing a normal level
rich_presence_conditional_display(In_Game(), "Playing {0} | 🥚{1}/6 | 🍓{2}/5 | ⏰{3}.{4}",
    rich_presence_lookup("Stage", Level(), StageLookup),
    rich_presence_value("Digit", Eggs()),
    rich_presence_value("Digit", Berries()),
    rich_presence_value("Seconds", Time_Secs(), format="SECS"),
    rich_presence_lookup("MSec", Time_MSecs_RAW(), MSecLookup)
)

// Won a bonus level (don't show berry count)
rich_presence_conditional_display(Victory_RP() && IsBonus(), "Completed {0} | ⏰{1}.{2}",
    rich_presence_lookup("Stage", Level(), StageLookup),
    rich_presence_value("Seconds", Time_Secs(), format="SECS"),
    rich_presence_lookup("MSec", Time_MSecs_RAW(), MSecLookup)
)

// Won a normal level
rich_presence_conditional_display(Victory_RP(), "Completed {0} | 🍓{1}/5 | ⏰{2}.{3}",
    rich_presence_lookup("Stage", Level(), StageLookup),
    rich_presence_value("Digit", Berries()),
    rich_presence_value("Seconds", Time_Secs(), format="SECS"),
    rich_presence_lookup("MSec", Time_MSecs_RAW(), MSecLookup)
)

// Viewing credits
rich_presence_conditional_display(Credits(), "Viewing Credits")


//*********************************************\\
//                RP: DEMO GAME                \\
//*********************************************\\

// Generic menus
rich_presence_conditional_display(DEMO_In_Menu(), "DEMO: In a menu")

// Stage selection
rich_presence_conditional_display(DEMO_Stage_Select(), "DEMO: Selecting a stage | 🍓{0}/20",
    rich_presence_value("Digit", DEMO_Berry_Count())
)

// Minidex viewing
rich_presence_conditional_display(DEMO_Minidex(), "DEMO: Viewing the Minidex")

// Caught a pokemon in a level
rich_presence_conditional_display(DEMO_Pokemon_Caught_RP(), "DEMO: Caught {0} in Demo {1}!",
    rich_presence_lookup("DemoPokemon", DEMO_Current_Pokemon(), DEMO_PokemonLookup),
    rich_presence_lookup("Stage", DEMO_Level(), StageLookup)
)

// Caught a special pokemon from the stage select screen
rich_presence_conditional_display(DEMO_Special_Pokemon_Caught_RP(), "DEMO: Caught {0}!",
    rich_presence_lookup("DemoPokemon", DEMO_Current_Pokemon(), DEMO_PokemonLookup)
)

// Playing a bonus level (don't show egg or berry count)
rich_presence_conditional_display(DEMO_In_Game() && DEMO_IsBonus(), "DEMO: Playing Demo {0} | ⏰{1}",
    rich_presence_lookup("Stage", DEMO_Level(), StageLookup),
    rich_presence_value("Milliseconds", DEMO_Time_MSecs(), format="MILLISECS")
)

// Playing a normal level
rich_presence_conditional_display(DEMO_In_Game(), "DEMO: Playing Demo {0} | 🥚{1}/6 | 🍓{2}/5 | ⏰{3}",
    rich_presence_lookup("Stage", DEMO_Level(), StageLookup),
    rich_presence_value("Digit", DEMO_Eggs()),
    rich_presence_value("Digit", DEMO_Berries()),
    rich_presence_value("Milliseconds", DEMO_Time_MSecs(), format="MILLISECS")
)

// Won a bonus level (don't show berry count)
rich_presence_conditional_display(DEMO_Victory_RP() && DEMO_IsBonus(), "DEMO: Completed Demo {0} | ⏰{1}",
    rich_presence_lookup("Stage", DEMO_Level(), StageLookup),
    rich_presence_value("Milliseconds", DEMO_Time_MSecs(), format="MILLISECS")
)

// Won a normal level
rich_presence_conditional_display(DEMO_Victory_RP(), "DEMO: Completed {0} | 🍓{1}/5 | ⏰{2}",
    rich_presence_lookup("Stage", DEMO_Level(), StageLookup),
    rich_presence_value("Digit", DEMO_Berries()),
    rich_presence_value("Milliseconds", DEMO_Time_MSecs(), format="MILLISECS")
)

//*********************************************\\
//                 LEADERBOARD                 \\
//*********************************************\\

leaderboard(title = "Stage 1",
            description = "Best time for Stage 1",
            start = In_Game() && Level() == 0,
            cancel = Boot() || Stage_Select() || Overflow(),
            submit = Victory(),
            value = Time_MSecs() + (Time_Secs() * 100),
            format = "MILLISECS")

leaderboard(title = "Demo Stage 1",
            description = "Best time for Demo Stage 1",
            start = DEMO_In_Game() && DEMO_Level() == 0,
            cancel = Boot() || DEMO_Stage_Select(),
            submit = DEMO_Victory(),
            value = DEMO_Time_MSecs(),
            format = "MILLISECS")