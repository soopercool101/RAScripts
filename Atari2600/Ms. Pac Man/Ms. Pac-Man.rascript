// Ms. Pac-Man
// #ID = 14260

// $0000: Maze
// $0001: Sue (Orange Ghost) State Flags
//        Bit 7: 0 = normal, 1 = vulnerable
//        Bit 6: 1 = eaten (eyes) only when bit 4 = 0
// $0002: Inky (Blue Ghost) State Flags
//        Bit 7: 0 = normal, 1 = vulnerable
//        Bit 6: 1 = eaten (eyes) only when bit 4 = 0
// $0003: Pinky (Pink Ghost) State Flags
//        Bit 7: 0 = normal, 1 = vulnerable
//        Bit 6: 1 = eaten (eyes) only when bit 4 = 0
// $0004: Blinky (Red Ghost) State Flags
//        Bit 7: 0 = normal, 1 = vulnerable
//        Bit 6: 1 = eaten (eyes) only when bit 4 = 0
// $0006: Sue (Orange Ghost) X-Position
// $0007: Inky (Blue Ghost) X-Position
// $0008: Pinky (Pink Ghost) X-Position
// $0009: Blinky (Red Ghost) X-Position
// $000A: Player X-Position
// $000B: Fruit X-Position
// $000C: Sue (Orange Ghost) Y-Position
// $000D: Inky (Blue Ghost) Y-Position
// $000E: Pinky (Pink Ghost) Y-Position
// $000F: Blinky (Red Ghost) Y-Position
// $0010: Player Y-Position
// $0011: Fruit Y-Position
// $0013: Number of Ghosts (Effectively game difficulty):
//        0x00: One Bear (Beginner, Single Ghost)
//        0x01: Two Bear (Novice, Two Ghosts)
//        0x02: Three Bears (Intermediate, Three Ghosts)
//        0x03: Cherries (Default, Arcade, Four Ghosts)
// $0014: Bit 7: 1 in black screen mode, 0 in maze mode
//        Bit 6: 1 if in title screen/demo, 0 in game
//        
//        Bit 4: 1 shows Ms. PACMAN logo, 0 shows score
// $0018: Set to 1 on game over
// $0021: ff during death
// $0027: Game state timers:
//        0x00 - 0x21: Starting level
//        0x23-0x31: Respawning
//        0x33-0x35: Eating ghost/fruit
//        0x49-0x53: Dying
//        0xff: Default in-game
// $0029: Bit 6: 1 = Vulnerable ghosts
//        Bit 4: 1 = White ghosts (when flashing at end)
// $0074: Upper 2 bits: Keeps track of how many ghosts are eaten
//        Lower 6 bits: Power pellet timer
// $0077: Pellets eaten on current maze
//        
//        Victory Conditions:
//        Maze 0: 0x9A
//        Maze 1: 0x96
//        Maze 2: 0x9E
//        Maze 3: 0x9A
// $0078: Upper 4: Score (0000X0)
//        
//        Bit0: 1 if the extra life at 10000 points has been awarded, 0 if it has not
// $0079: Score (00XX00)
// $007A: Score (XX0000)
//        
//        FF before the game is first started (though not set back after game over)
// $007B: Upper 4: Current Fruit
//        Lower 4: Lives Count (Zero-indexed, player is still alive at 0 lives)
//        
//        Fruit Values:
//        0x0: Cherry (100 points)
//        0x1: Strawberry (200 points)
//        0x2: Orange (500 points)
//        0x3: Pretzel (700 points)
//        0x4: Apple (1000 points)
//        0x5: Pear (2000 points)
//        0x6: Banana (5000 points)

function maze() => byte(0x0000)

function pellets_eaten() => byte(0x0077)

function difficulty() => byte(0x0013)

function arcade_mode() => difficulty() == 3

function game_over() => byte(0x0018) == 1

function demo_mode() => bit6(0x0014) == 1

function fruit() => high4(0x007B)

function lives() => low4(0x007B)

function has_power_pellet() => bit5(0x0074) != 0 || bit4(0x0074) != 0 || low4(0x0074) != 0

function had_power_pellet() => prev(bit5(0x0074)) != 0 || prev(bit4(0x0074)) != 0 || prev(low4(0x0074)) != 0

function fruit_eaten() => byte(0x000B) == 0 && prev(byte(0x000B)) != 0

function ghost_eaten(index) => bit4(0x0001 + index) == 0 && bit6(0x0001 + index) == 1

function ghost_eaten_once(index) => bit4(0x0001 + index) == 0 && bit6(0x0001 + index) == 1 && (prev(bit4(0x0001 + index)) == 1 || prev(bit6(0x0001 + index)) == 0) // Doesn't hit more than one time per ghost

function score() => high4(0x007A) * 100000 + low4(0x007A) * 10000 + high4(0x0079) * 1000 + low4(0x0079) * 100 + high4(0x0078) * 10

function prev_score() => prev(high4(0x007A)) * 100000 + prev(low4(0x007A)) * 10000 + prev(high4(0x0079)) * 1000 + prev(low4(0x0079)) * 100 + prev(high4(0x0078)) * 10

function ate_something() => byte(0x0027) == 0x33 && prev(byte(0x0027)) == 0xFF

FruitLookup = {
    0: "Cherry",
    1: "Strawberry",
    2: "Orange",
    3: "Pretzel",
    4: "Apple",
    5: "Pear",
    6: "Banana"
}

ModeLookup = {
    0: "Single-Ghost",
    1: "2-Ghosts",
    2: "3-Ghosts",
    3: "Arcade"
}

achievement(
    title = "Round 1 Clear", description = "Clear the first unique maze in Arcade Mode", points = 1,
    trigger = !demo_mode() && maze() == 0 && pellets_eaten() == 0x9a && arcade_mode()
)

achievement(
    title = "Ghost-Free Diet", description = "In Arcade Mode and a single life, eat every normal pellet on the first maze before eating any Power Pellets", points = 10,
    trigger = once(pellets_eaten() == 0) && pellets_eaten() == 0x96 && arcade_mode() && never(has_power_pellet() || demo_mode() || lives() != prev(lives()) || maze() != 0)
)

achievement(
    title = "Round 3 Clear", description = "Clear the second unique maze in Arcade Mode", points = 5,
    trigger = maze() == 1 && pellets_eaten() == 0x96 && arcade_mode()
)

achievement(
    title = "Afraid of No Ghost", description = "In Arcade Mode and a single life, eat every normal pellet on the second maze before eating any Power Pellets", points = 25,
    trigger = once(pellets_eaten() == 0) && pellets_eaten() == 0x92 && arcade_mode() && never(has_power_pellet() || lives() != prev(lives()) || maze() != 1)
)

achievement(
    title = "Round 5 Clear", description = "Clear the third unique maze in Arcade Mode", points = 10,
    trigger = maze() == 2 && pellets_eaten() == 0x9e && arcade_mode()
)

achievement(
    title = "Busting Makes Me Feel Bad", description = "In Arcade Mode and a single life, eat every normal pellet on the third maze before eating any Power Pellets", points = 50,
    trigger = once(pellets_eaten() == 2) && pellets_eaten() == 0x9a && arcade_mode() && never(has_power_pellet() || lives() != prev(lives()) || maze() != 2)
)

achievement(
    title = "Round 7 Clear", description = "Clear the fourth unique maze in Arcade Mode", points = 25,
    trigger = maze() == 3 && pellets_eaten() == 0x9a && arcade_mode()
)

achievement(
    title = "Ghastly Pacifist", description = "In Arcade Mode and a single life, eat every normal pellet on the fourth maze before eating any Power Pellets", points = 50,
    trigger = once(pellets_eaten() == 0) && pellets_eaten() == 0x96 && arcade_mode() && never(has_power_pellet() || lives() != prev(lives()) || maze() != 3)
)

// Fruit despawn and eaten logic is too intertwined to do these achievements any other way as far as I can tell
achievement(
    title = "Popped a Cherry", description = "Eat a cherry in Arcade Mode", points = 1,
    trigger = !demo_mode() && arcade_mode() && // Arcade mode (and not demo mode)
              fruit() == 0  && // Current fruit is cherry
              ate_something() && // Ate something
              fruit_eaten() && // Despawn on same frame as ghost eaten also counts for this, but keeping this helps prevent false positives
              !(ghost_eaten_once(0) || ghost_eaten_once(1) || ghost_eaten_once(2) || ghost_eaten_once(3)) // The something eaten wasn't a ghost
)

achievement(
    title = "What, No Cream?", description = "Eat a strawberry in Arcade Mode", points = 3,
    trigger = !demo_mode() && arcade_mode() && // Arcade mode (and not demo mode)
              fruit() == 1  && // Current fruit is strawberry
              ate_something() && // Ate something
              fruit_eaten() && // Despawn on same frame as ghost eaten also counts for this, but keeping this helps prevent false positives
              !(ghost_eaten_once(0) || ghost_eaten_once(1) || ghost_eaten_once(2) || ghost_eaten_once(3)) // The something eaten wasn't a ghost
)

achievement(
    title = "Orange You Glad...", description = "Eat an orange in Arcade Mode", points = 5,
    trigger = !demo_mode() && arcade_mode() && // Arcade mode (and not demo mode)
              fruit() == 2  && // Current fruit is orange
              ate_something() && // Ate something
              fruit_eaten() && // Despawn on same frame as ghost eaten also counts for this, but keeping this helps prevent false positives
              !(ghost_eaten_once(0) || ghost_eaten_once(1) || ghost_eaten_once(2) || ghost_eaten_once(3)) // The something eaten wasn't a ghost
)

achievement(
    title = "My Favorite Fruit", description = "Eat a pretzel in Arcade Mode", points = 5,
    trigger = !demo_mode() && arcade_mode() && // Arcade mode (and not demo mode)
              fruit() == 3 && // Current fruit is pretzel
              ate_something() && // Ate something
              fruit_eaten() && // Despawn on same frame as ghost eaten also counts for this, but keeping this helps prevent false positives
              !(ghost_eaten_once(0) || ghost_eaten_once(1) || ghost_eaten_once(2) || ghost_eaten_once(3)) // The something eaten wasn't a ghost
)

achievement(
    title = "Kept the Doctor Away", description = "Eat an apple in Arcade Mode", points = 10,
    trigger = !demo_mode() && arcade_mode() && // Arcade mode (and not demo mode)
              fruit() == 4 && // Current fruit is apple
              ate_something() && // Ate something
              fruit_eaten() && // Despawn on same frame as ghost eaten also counts for this, but keeping this helps prevent false positives
              !(ghost_eaten_once(0) || ghost_eaten_once(1) || ghost_eaten_once(2) || ghost_eaten_once(3)) // The something eaten wasn't a ghost
)

achievement(
    title = "Un-pear-able", description = "Eat a pear in Arcade Mode", points = 10,
    trigger = !demo_mode() && arcade_mode() && // Arcade mode (and not demo mode)
              fruit() == 5 && // Current fruit is pear
              ate_something() && // Ate something
              fruit_eaten() && // Despawn on same frame as ghost eaten also counts for this, but keeping this helps prevent false positives
              !(ghost_eaten_once(0) || ghost_eaten_once(1) || ghost_eaten_once(2) || ghost_eaten_once(3)) // The something eaten wasn't a ghost
)

achievement(
    title = "...I Didn't Say Banana", description = "Eat a banana in Arcade Mode", points = 10,
    trigger = !demo_mode() && arcade_mode() && // Arcade mode (and not demo mode)
              fruit() == 6 && // Current fruit is banana
              ate_something() && // Ate something
              fruit_eaten() && // Despawn on same frame as ghost eaten also counts for this, but keeping this helps prevent false positives
              !(ghost_eaten_once(0) || ghost_eaten_once(1) || ghost_eaten_once(2) || ghost_eaten_once(3)) // The something eaten wasn't a ghost
)

achievement(
    title = "A Light Snack", description = "Eat all 4 ghosts using a single Power Pellet", points = 5,
    trigger = !demo_mode() && // Prevent unlock if demo mode manages to follow the restrictions (unlikely but seemingly possible)
              arcade_mode() && // When changing difficulty, ghost flags sometimes stay where they are, one could in theory eat all ghosts except Sue in arcade before switching to single-ghost mode
              once(bit5(0x0074) == 1) && // Used to prevent unecessary resets by the single power pellet restriction
              once(ghost_eaten(0)) && once(ghost_eaten(1)) && once(ghost_eaten(2)) && once(ghost_eaten(3)) && // Eat every ghost once
              never(!had_power_pellet() || // Power Pellet is taken the same frame that the last ghost is eaten, so a prev check is required here
              (bit5(0x0074) == 1 && prev(bit5(0x0074)) == 0)) // Resets when the timer is extended by additional power pellets
)

// Currently too complicated for RATools
//achievement(
//    title = "A Full Meal", description = "Eat all 4 ghosts 4 times each during a single level/life", points = 50,
//    trigger = !demo_mode() && // Prevent unlock if demo mode manages to follow the restrictions (nigh-impossible, but *technically possible* theoretically)
//              arcade_mode() && // Just in case of junk data
//              repeated(4, ghost_eaten_once(0)) && repeated(4, ghost_eaten_once(1)) && repeated(4, ghost_eaten_once(2)) && repeated(4, ghost_eaten_once(3)) && // Eat every ghost 4 times
//              (never(pellets_eaten() < prev(pellets_eaten()) || lives() < prev(lives()))) // Reset on new level or new life
//)

achievement(
    title = "A New Lease On Life", description = "Earn 10000 points and an extra life in Arcade Mode", points = 5,
    trigger = arcade_mode() && byte(0x007A) != 0xFF && byte(0x007A) >= 1
)

achievement(
    title = "25k Working From Home", description = "Earn 25000 points in Arcade Mode", points = 10,
    trigger = arcade_mode() && byte(0x007A) != 0xFF && byte(0x007A) >= 2 && byte(0x0079) >= 0x50
)

achievement(
    title = "High Scorer", description = "Earn 50000 points in Arcade Mode", points = 25,
    trigger = arcade_mode() && byte(0x007A) != 0xFF && byte(0x007A) >= 5
)

achievement(
    title = "Unstoppable", description = "Have the maximum of three lives at once in Arcade Mode", points = 10,
    trigger = arcade_mode() && lives() == 3
)

rich_presence_conditional_display(demo_mode(), "On the Title Screen")

rich_presence_display("{0} Mode, Maze: {1}, Bonus Fruit: {2}, 🚶x{3}. Score: {4}{5}{6}{7}{8}0",
    rich_presence_lookup("Mode", difficulty(), ModeLookup),
    rich_presence_value("Digit", maze()),
    rich_presence_lookup("Fruit", fruit(), FruitLookup),
    rich_presence_value("Digit", lives()),
    rich_presence_value("Digit", high4(0x007A)),
    rich_presence_value("Digit", low4(0x007A)),
    rich_presence_value("Digit", high4(0x0079)),
    rich_presence_value("Digit", low4(0x0079)),
    rich_presence_value("Digit", high4(0x0078))
)

leaderboard(title = "High Score (Arcade Mode)",
            description = "Best score at game over",
            start = arcade_mode() && !demo_mode(),
            cancel = (!arcade_mode() || demo_mode()) && !game_over(),
            submit = game_over() && lives() == 0,
            value = score())
            
            
leaderboard(title = "High Score (1-Ghost Mode)",
            description = "Best score at game over",
            start = difficulty() == 0 && !demo_mode(),
            cancel = (difficulty() != 0 || demo_mode()) && !game_over(),
            submit = game_over() && lives() == 0,
            value = score())
            
            
leaderboard(title = "High Score (2-Ghost Mode)",
            description = "Best score at game over",
            start = difficulty() == 1 && !demo_mode(),
            cancel = (difficulty() != 1 || demo_mode()) && !game_over(),
            submit = game_over() && lives() == 0,
            value = score())
            
            
leaderboard(title = "High Score (3-Ghost Mode)",
            description = "Best score at game over",
            start = difficulty() == 2 && !demo_mode(),
            cancel = (difficulty() != 2 || demo_mode()) && !game_over(),
            submit = game_over() && lives() == 0,
            value =  score())
