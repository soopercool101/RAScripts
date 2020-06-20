// Donkey Kong
// #ID = 13095

// $0000: Enemy (Barrel or Fire) 4 Y-Position
// $0001: Enemy (Barrel or Fire) 3 Y-Position
// $0002: Enemy (Barrel or Fire) 2 Y-Position
// $0003: Enemy (Barrel or Fire) 1 Y-Position
// $0004: Consecutive steps counter. Resets on jump. Counts down when moving left and up when moving right. Used to determine step animation frame.
// $0005: Jump time remaining
// $0006: Hammer Timer
//        0: Doesn't have hammer
// $0007: Score (XX0000)
// $0008: Score (00XX00)
// $000A: Timer for how long the player has been completely still. Used to activate burn-in reduction mode.
// $000B: FF if not jumping (timer of some sort)
// $000C: Game Status:
//        00: Game Over (Also 00 on boot)
//        01: Dead, can continue
//        02: Level complete
//        FF: In-game
// $000E: Burn-in reduction mode:
//        00: Off
//        FF: On
// $0010: Level
//        0: 25m
//        1: 100m
// $0011: FF before game starts, 00 after game starts
// $0012: Background Color
// $0013: Player X-Position
// $0014: Bit 3 is player facing direction flag (also used by Donkey Kong)
// $0015: Has to do with how the hammer handle is drawn
// $0017: Has to do with how the hammer head is drawn
// $001A: Foreground color.
//        Notable values:
//        6a: 25m when burn-in reduction mode is off
//        8a: 100m when burn-in reduction mode is off
// $001B: Player Y-Position
//        
//        25m win condition is Y-Position = 0x0F
// $001D: 100m: Render flags for vertical chunk 0 (which doesn't render by default)
// $001E: 100m: Render flags for vertical chunk 1
// $001F: 100m: Render flags for vertical chunk 2.
//        Notable values:
//        0x02: No floors broken
//        0x08: Left floor broken
//        0x0E: Right floor broken
//        0x14: Both floors broken
// $0020: 100m: Render flags for vertical chunk 3.
//        Notable values:
//        0x03: No floors broken
//        0x09: Left floor broken
//        0x0F: Right floor broken
//        0x15: Both floors broken
// $0021: 100m: Render flags for vertical chunk 4.
//        Notable values:
//        0x04: No floors broken
//        0x0A: Left floor broken
//        0x10: Right floor broken
//        0x16: Both floors broken
// $0022: 100m: Render flags for vertical chunk 5.
//        Notable values:
//        0x05: No floors broken
//        0x0B: Left floor broken
//        0x11: Right floor broken
//        0x17: Both floors broken
// $0023: Lives
// $0024: Bonus points (XX00). Treated as if it's a decimal value.
// $0041: Enemy (Barrel or Fire) 4 X-Position
// $0042: Enemy (Barrel or Fire) 3 X-Position
// $0043: Enemy (Barrel or Fire) 2 X-Position
// $0044: Enemy (Barrel or Fire) 1 X-Position
// $0045: Enemy 4 directionality flags
//        Bit 0: 1 = Right, 0 = Left
//        Bits 4-7: Set to 1 if a barrel is moving downwards
// $0046: Enemy 3 directionality flags
//        Bit 0: 1 = Right, 0 = Left
//        Bits 4-7: Set to 1 if a barrel is moving downwards
// $0047: Enemy 2 directionality flags
//        Bit 0: 1 = Right, 0 = Left
//        Bits 4-7: Set to 1 if a barrel is moving downwards
// $0048: Enemy 1 directionality flags
//        Bit 0: 1 = Right, 0 = Left
//        Bits 4-7: Set to 1 if a barrel is moving downwards


// This port only includes 2 levels
LevelLookup = {
    0: "25m",
    1: "100m",
}

// There are four known game states. State 0 is shared between unstarted game and game over.
StatusLookup = {
    0: "Game Over at",
    1: "Continuing at",
    2: "Successfully climbed",
    0xFF: "Climbing at",
}

// Checks: Level = 0 (25m) and game state = 2 (level win)
achievement(
    title = "The Journey Begins", description = "Complete 25m", points = 5,
    id = 114044, badge = "124570", published = "6/14/2020 11:54:27 PM", modified = "6/15/2020 2:47:19 AM",
    trigger = byte(0x00000C) == 2 && byte(0x000010) == 0
)

// Checks: Level = 1 (100m) and game state = 2 (level win)
achievement(
    title = "...Wait Is That It?", description = "Complete 100m", points = 10,
    id = 114045, badge = "124571", published = "6/14/2020 11:54:33 PM", modified = "6/18/2020 8:30:18 PM",
    trigger = byte(0x00000C) == 2 && byte(0x000010) == 1
)

// Though defeating enemies gives 800 points (which can only otherwise be given at once as a bonus),
// points are stored as big-endian binary coded decimal, which doesn't lend itself well to use as a hook.
// As such, this achievement works off the following logic:
// For each barrel: Checked to ensure it's been spawned at least once since the level transition
// Check if the hammer is active (this check is somewhat redundant as there is no additional way to destroy barrels to my knowledge)
// Check if at least one barrel (that has been spawned) has been destroyed via non-natural means 
//    (barrels naturally despawn at y=145, where the hammer power-up cannot reach) so this is used as prior)
achievement(
    title = "Barrel Breaker", description = "Destroy a barrel with a hammer", points = 1,
    id = 114046, badge = "124573", published = "6/14/2020 11:54:38 PM", modified = "6/20/2020 4:40:52 PM",
    trigger = byte(0x000006) != 0 && byte(0x000010) == 0 && never(byte(0x00000C) != 255) &&
              ((once(byte(0x000003) != 0) && byte(0x000003) == 0 && prior(byte(0x000003)) != 145) ||
               (once(byte(0x000002) != 0) && byte(0x000002) == 0 && prior(byte(0x000002)) != 145) ||
               (once(byte(0x000001) != 0) && byte(0x000001) == 0 && prior(byte(0x000001)) != 145) ||
               (once(byte(0x000000) != 0) && byte(0x000000) == 0 && prior(byte(0x000000)) != 145))
)

// This achievement is significantly simpler than the barrel one as only one fire can be destroyed via the hammer
achievement(
    title = "Fire Extinguisher", description = "Destroy a Fire with a hammer", points = 1,
    id = 114047, badge = "124574", published = "6/14/2020 11:54:43 PM", modified = "6/14/2020 11:54:43 PM",
    trigger = byte(0x00000C) == 255 && byte(0x000010) == 1 && byte(0x000006) != 0 && byte(0x000002) == 0
)

// 2 lives was chosen as the hook for this as it is simple for players and this game doesn't give extra lives
// Same checks as "The Journey Begins" with the additional qualifier of lives = 2
achievement(
    title = "Barrel-ly a Hazard", description = "Complete 25m with 2 lives remaining", points = 10,
    id = 114048, badge = "124575", published = "6/14/2020 11:54:49 PM", modified = "6/15/2020 2:47:31 AM",
    trigger = byte(0x00000C) == 2 && byte(0x000010) == 0 && byte(0x000023) == 2
)

// 2 lives was chosen as the hook for this as it is simple for players and this game doesn't give extra lives
// Same checks as "...Wait Is That It?" with the additional qualifier of lives = 2
achievement(
    title = "The Perfect Run", description = "Complete 100m with 2 lives remaining", points = 25,
    id = 114049, badge = "124576", published = "6/14/2020 11:54:52 PM", modified = "6/15/2020 2:47:36 AM",
    trigger = byte(0x00000C) == 2 && byte(0x000010) == 1 && byte(0x000023) == 2
)

// Bonus of 4300 is highest I've obtained, but requires incredible RNG to pull off. 4200 was decided as a less frustrating goal.
// Same checks as "The Journey Begins" with additional qualifier of the bonus being above 0x42 (Binary Coded Decimal)
achievement(
    title = "Barrel Blast", description = "Complete 25m with a bonus of 4200 or higher", points = 25,
    id = 114050, badge = "124579", published = "6/14/2020 11:54:58 PM", modified = "6/15/2020 2:47:41 AM",
    trigger = byte(0x00000C) == 2 && byte(0x000010) == 0 && byte(0x000024) >= 0x42
)

// Bonus of 4000 is highest I've obtained. Requires a fair amount of RNG but is fair enough as a hard achievement.
// Same checks as "...Wait Is That It?" with additional qualifier of the bonus being above 0x40 (Binary Coded Decimal)
achievement(
    title = "Demolitions Expert", description = "Complete 100m with a bonus of 4000 or higher", points = 50,
    id = 114051, badge = "124577", published = "6/14/2020 11:55:03 PM", modified = "6/15/2020 2:47:45 AM",
    trigger = byte(0x00000C) == 2 && byte(0x000010) == 1 && byte(0x000024) >= 0x40
)

// This achievement is a reference to the point total that gives an extra life in the original arcade version of the game.
// Notably the player doesn't actually get an extra life here, so this doesn't contradict the two-life achievements.
// Checks if the highest two digits of the score (XX0000) are at least 0x02 (Binary Coded Decimal)
achievement(
    title = "Extra Life Please?", description = "Score 20,000 points", points = 50,
    id = 114052, badge = "124578", published = "6/14/2020 11:55:07 PM", modified = "6/14/2020 11:55:07 PM",
    trigger = byte(0x000007) >= 2
)

// Checks if the level = 0 (25m) and the player X and Y positions are at least at the position indicated
achievement(
    title = "It's Really Just Decorative", description = "Reach the ladder under Donkey Kong in 25m", points = 3,
    id = 114053, badge = "124584", published = "6/15/2020 3:59:02 AM", modified = "6/15/2020 3:59:02 AM",
    trigger = byte(0x00000C) == 255 && byte(0x000010) == 0 && byte(0x000013) <= 36 && byte(0x00001B) <= 21
)

rich_presence_conditional_display(byte(0x00000C) == 0 && byte(0x000023) == 2, "Starting a new game")

rich_presence_display("{0} {1}, 🚶x{2}. Score: {3}{4}{5}{6}00",
    rich_presence_lookup("Status", byte(0x00000C), StatusLookup),
    rich_presence_lookup("Level", byte(0x000010), LevelLookup),
    rich_presence_value("Digit", byte(0x000023)),
    rich_presence_value("Digit", high4(0x000007)),
    rich_presence_value("Digit", low4(0x000007)),
    rich_presence_value("Digit", high4(0x000008)),
    rich_presence_value("Digit", low4(0x000008))
)
