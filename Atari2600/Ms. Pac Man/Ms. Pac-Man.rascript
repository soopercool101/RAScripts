// Ms. Pac-Man
// #ID = 14260

// $0000: Maze
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
// $0074: Upper 2 bits: Keeps track of how many ghosts are eaten
//        Lower 6 bits: Power pellet timer
// $0077: Pellets eaten on current maze
//
//        Victory Conditions:
//        Maze 0: 0x9A
//        Maze 1: 0x96
//        Maze 2: 0x9E
//        Maze 3: 0x9A
// $0078: Score (0000XX)
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

function lives() => low4(0x007B)

function has_power_pellet() => bit5(0x0074) != 0 || bit4(0x0074) != 0 || low4(0x0074) != 0

function four_ghosts_eaten() => bit6(0x0074) == 0 && prev(bit6(0x0074)) == 1 && bit7(0x0074) == 0 && prev(bit7(0x0074)) == 1 

function score() => high4(0x007A) * 100000 + low4(0x007A) * 10000 + high4(0x0079) * 1000 + low4(0x0079) * 100 + high4(0x0078) * 10 + low4(0x0078)

achievement(
    title = "Level 1 Clear", description = "Clear the first unique maze in Arcade Mode", points = 5,
    trigger = !demo_mode() && maze() == 0 && pellets_eaten() == 0x9a && arcade_mode()
)

achievement(
    title = "Level 3 Clear", description = "Clear the second unique maze in Arcade Mode", points = 5,
    trigger = maze() == 1 && pellets_eaten() == 0x96 && arcade_mode()
)

achievement(
    title = "Level 5 Clear", description = "Clear the third unique maze in Arcade Mode", points = 10,
    trigger = maze() == 2 && pellets_eaten() == 0x9e && arcade_mode()
)

achievement(
    title = "Level 7 Clear", description = "Clear the fourth unique maze in Arcade Mode", points = 25,
    trigger = maze() == 3 && pellets_eaten() == 0x9a && arcade_mode()
)


leaderboard(title = "High Score (Arcade Mode)",
            description = "Best score at game over",
            start = arcade_mode() && !demo_mode(),
            cancel = (!arcade_mode() || demo_mode()) && !game_over(),
            submit = game_over() && lives() == 0,
            value = high4(0x007A) * 100000 + low4(0x007A) * 10000 + high4(0x0079) * 1000 + low4(0x0079) * 100 + high4(0x0078) * 10 + low4(0x0078))
            
            
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