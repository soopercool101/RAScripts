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

LevelLookup = {
    0: "25m",
    1: "100m",
}

StatusLookup = {
    0: "Game Over at",
    1: "Continuing at",
    2: "Successfully climbed",
    0xFF: "Climbing at",
}

achievement(
    title = "The Journey Begins", description = "Complete 25m", points = 5,
    id = 114044, badge = "124570", published = "6/14/2020 11:54:27 PM", modified = "6/15/2020 2:47:19 AM",
    trigger = byte(0x000010) == 0 && byte(0x00000C) == 2
)

achievement(
    title = "...Wait Is That It?", description = "Complete 100m", points = 10,
    id = 114045, badge = "124571", published = "6/14/2020 11:54:33 PM", modified = "6/18/2020 8:30:18 PM",
    trigger = byte(0x00000C) == 2 && byte(0x000010) == 1
)

achievement(
    title = "Barrel Breaker", description = "Destroy a barrel with a hammer", points = 1,
    id = 114046, badge = "124573", published = "6/14/2020 11:54:38 PM", modified = "6/14/2020 11:54:38 PM",
    trigger = byte(0x000006) != 0 && byte(0x000010) == 0 &&
              ((once(byte(0x000003) != 0) && never(byte(0x00000C) != 255) && byte(0x000003) == 0 && 
                prior(byte(0x000003)) != 145) ||
               (once(byte(0x000002) != 0) && never(byte(0x00000C) != 255) && byte(0x000002) == 0 && 
                prior(byte(0x000002)) != 145) ||
               (once(byte(0x000001) != 0) && never(byte(0x00000C) != 255) && byte(0x000001) == 0 && 
                prior(byte(0x000001)) != 145) ||
               (once(byte(0x000000) != 0) && never(byte(0x00000C) != 255) && byte(0x000000) == 0 && 
                prior(byte(0x000000)) != 145))
)

achievement(
    title = "Fire Extinguisher", description = "Destroy a Fire with a hammer", points = 1,
    id = 114047, badge = "124574", published = "6/14/2020 11:54:43 PM", modified = "6/14/2020 11:54:43 PM",
    trigger = byte(0x00000C) == 255 && byte(0x000010) == 1 && byte(0x000006) != 0 && byte(0x000002) == 0
)

achievement(
    title = "Barrel-ly a Hazard", description = "Complete 25m with 2 lives remaining", points = 10,
    id = 114048, badge = "124575", published = "6/14/2020 11:54:49 PM", modified = "6/15/2020 2:47:31 AM",
    trigger = byte(0x00000C) == 2 && byte(0x000010) == 0 && byte(0x000023) == 2
)

achievement(
    title = "The Perfect Run", description = "Complete 100m with 2 lives remaining", points = 25,
    id = 114049, badge = "124576", published = "6/14/2020 11:54:52 PM", modified = "6/15/2020 2:47:36 AM",
    trigger = byte(0x00000C) == 2 && byte(0x000010) == 1 && byte(0x000023) == 2
)

achievement(
    title = "Barrel Blast", description = "Complete 25m with a bonus of 4200 or higher", points = 25,
    id = 114050, badge = "124579", published = "6/14/2020 11:54:58 PM", modified = "6/15/2020 2:47:41 AM",
    trigger = byte(0x00000C) == 2 && byte(0x000010) == 0 && byte(0x000024) >= 66
)

achievement(
    title = "Demolitions Expert", description = "Complete 100m with a bonus of 4000 or higher", points = 50,
    id = 114051, badge = "124577", published = "6/14/2020 11:55:03 PM", modified = "6/15/2020 2:47:45 AM",
    trigger = byte(0x00000C) == 2 && byte(0x000010) == 1 && byte(0x000024) >= 64
)

achievement(
    title = "Extra Life Please?", description = "Score 20,000 points", points = 50,
    id = 114052, badge = "124578", published = "6/14/2020 11:55:07 PM", modified = "6/14/2020 11:55:07 PM",
    trigger = byte(0x000007) >= 2
)

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
