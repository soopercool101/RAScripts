// ~Unlicensed~ Super Mario 4
// #ID = 16520

// $C0A6: Yoshi Timer (Frames)
// $C0A7: Yoshi Timer

// $C0A8: 00: Baby Yoshi Screaming
//        ff: Baby Yoshi Rescued
function baby_yoshi_rescued() => byte(0xC0A8) == 0xFF && prev(byte(0xC0A8)) != byte(0xC0A8)

// $C180: Enemy Struct 1 (of 32, doubtful all 32 would ever be used at once but worth noting)
//        
//        Enemy structures are 0x10 bytes each, initialize as all 0xFF
//        
//        Enemy loading order appears to be top to bottom left to right?
//        
//        Bit 0: Directionality (1 = left, 0 = right)
//        Bit4: 0 = Enemy, 1 = Other (IE Moving Platforms)
//        
//        Lower4 can be used as enemy ID:
//        0x1: Boss 1 (Turtle)
//        0xA: Goomba
//        0xB: Tongue Frog
// $C181: Entity 1 state (2 = enemy death)
// $C183: Entity 1 X-Position
// $C186: Entity 1 Y-Position
// $C18A: Entity 1 X-Movement Range
// $C18E: Enemy 1 Health (Unused for non-multi hit enemies, stays at 1 even on death)

function isEnemy(index) => bit4(0xC180 + (0x10 * index)) == 0

function entityID(index) => low4(0xC180 + (0x10 * index))

function entity_state(index) => low4(0xC181 + (0x10 * index))

function enemy_state_check(id, state) =>
    (
        (isEnemy(0) && entityID(0) == id && entity_state(0) == state && prev(entity_state(0)) != state) ||
        (isEnemy(1) && entityID(1) == id && entity_state(1) == state && prev(entity_state(1)) != state) ||
        (isEnemy(2) && entityID(2) == id && entity_state(2) == state && prev(entity_state(2)) != state) ||
        (isEnemy(3) && entityID(3) == id && entity_state(3) == state && prev(entity_state(3)) != state) ||
        (isEnemy(4) && entityID(4) == id && entity_state(4) == state && prev(entity_state(4)) != state) ||
        (isEnemy(5) && entityID(5) == id && entity_state(5) == state && prev(entity_state(5)) != state) ||
        (isEnemy(6) && entityID(6) == id && entity_state(6) == state && prev(entity_state(6)) != state) ||
        (isEnemy(7) && entityID(7) == id && entity_state(7) == state && prev(entity_state(7)) != state) ||
        (isEnemy(8) && entityID(8) == id && entity_state(8) == state && prev(entity_state(8)) != state) ||
        (isEnemy(9) && entityID(9) == id && entity_state(9) == state && prev(entity_state(9)) != state) ||
        (isEnemy(10) && entityID(10) == id && entity_state(10) == state && prev(entity_state(10)) != state) ||
        (isEnemy(11) && entityID(11) == id && entity_state(11) == state && prev(entity_state(11)) != state) ||
        (isEnemy(12) && entityID(12) == id && entity_state(12) == state && prev(entity_state(12)) != state) ||
        (isEnemy(13) && entityID(13) == id && entity_state(13) == state && prev(entity_state(13)) != state) ||
        (isEnemy(14) && entityID(14) == id && entity_state(14) == state && prev(entity_state(14)) != state) ||
        (isEnemy(15) && entityID(15) == id && entity_state(15) == state && prev(entity_state(15)) != state) ||
        (isEnemy(16) && entityID(16) == id && entity_state(16) == state && prev(entity_state(16)) != state) ||
        (isEnemy(17) && entityID(17) == id && entity_state(17) == state && prev(entity_state(17)) != state) ||
        (isEnemy(18) && entityID(18) == id && entity_state(18) == state && prev(entity_state(18)) != state) ||
        (isEnemy(19) && entityID(19) == id && entity_state(19) == state && prev(entity_state(19)) != state) ||
        (isEnemy(20) && entityID(20) == id && entity_state(20) == state && prev(entity_state(20)) != state) ||
        (isEnemy(21) && entityID(21) == id && entity_state(21) == state && prev(entity_state(21)) != state) ||
        (isEnemy(22) && entityID(22) == id && entity_state(22) == state && prev(entity_state(22)) != state) ||
        (isEnemy(23) && entityID(23) == id && entity_state(23) == state && prev(entity_state(23)) != state) ||
        (isEnemy(24) && entityID(24) == id && entity_state(24) == state && prev(entity_state(24)) != state) ||
        (isEnemy(25) && entityID(25) == id && entity_state(25) == state && prev(entity_state(25)) != state) ||
        (isEnemy(26) && entityID(26) == id && entity_state(26) == state && prev(entity_state(26)) != state) ||
        (isEnemy(27) && entityID(27) == id && entity_state(27) == state && prev(entity_state(27)) != state) ||
        (isEnemy(28) && entityID(28) == id && entity_state(28) == state && prev(entity_state(28)) != state) ||
        (isEnemy(29) && entityID(29) == id && entity_state(29) == state && prev(entity_state(29)) != state) ||
        (isEnemy(30) && entityID(30) == id && entity_state(30) == state && prev(entity_state(30)) != state) ||
        (isEnemy(31) && entityID(31) == id && entity_state(31) == state && prev(entity_state(31)) != state)
    )

function entity_state_check(id, state) =>
    (
        (!isEnemy(0) && entityID(0) == id && entity_state(0) == state && prev(entity_state(0)) != state) ||
        (!isEnemy(1) && entityID(1) == id && entity_state(1) == state && prev(entity_state(1)) != state) ||
        (!isEnemy(2) && entityID(2) == id && entity_state(2) == state && prev(entity_state(2)) != state) ||
        (!isEnemy(3) && entityID(3) == id && entity_state(3) == state && prev(entity_state(3)) != state) ||
        (!isEnemy(4) && entityID(4) == id && entity_state(4) == state && prev(entity_state(4)) != state) ||
        (!isEnemy(5) && entityID(5) == id && entity_state(5) == state && prev(entity_state(5)) != state) ||
        (!isEnemy(6) && entityID(6) == id && entity_state(6) == state && prev(entity_state(6)) != state) ||
        (!isEnemy(7) && entityID(7) == id && entity_state(7) == state && prev(entity_state(7)) != state) ||
        (!isEnemy(8) && entityID(8) == id && entity_state(8) == state && prev(entity_state(8)) != state) ||
        (!isEnemy(9) && entityID(9) == id && entity_state(9) == state && prev(entity_state(9)) != state) ||
        (!isEnemy(10) && entityID(10) == id && entity_state(10) == state && prev(entity_state(10)) != state) ||
        (!isEnemy(11) && entityID(11) == id && entity_state(11) == state && prev(entity_state(11)) != state) ||
        (!isEnemy(12) && entityID(12) == id && entity_state(12) == state && prev(entity_state(12)) != state) ||
        (!isEnemy(13) && entityID(13) == id && entity_state(13) == state && prev(entity_state(13)) != state) ||
        (!isEnemy(14) && entityID(14) == id && entity_state(14) == state && prev(entity_state(14)) != state) ||
        (!isEnemy(15) && entityID(15) == id && entity_state(15) == state && prev(entity_state(15)) != state) ||
        (!isEnemy(16) && entityID(16) == id && entity_state(16) == state && prev(entity_state(16)) != state) ||
        (!isEnemy(17) && entityID(17) == id && entity_state(17) == state && prev(entity_state(17)) != state) ||
        (!isEnemy(18) && entityID(18) == id && entity_state(18) == state && prev(entity_state(18)) != state) ||
        (!isEnemy(19) && entityID(19) == id && entity_state(19) == state && prev(entity_state(19)) != state) ||
        (!isEnemy(20) && entityID(20) == id && entity_state(20) == state && prev(entity_state(20)) != state) ||
        (!isEnemy(21) && entityID(21) == id && entity_state(21) == state && prev(entity_state(21)) != state) ||
        (!isEnemy(22) && entityID(22) == id && entity_state(22) == state && prev(entity_state(22)) != state) ||
        (!isEnemy(23) && entityID(23) == id && entity_state(23) == state && prev(entity_state(23)) != state) ||
        (!isEnemy(24) && entityID(24) == id && entity_state(24) == state && prev(entity_state(24)) != state) ||
        (!isEnemy(25) && entityID(25) == id && entity_state(25) == state && prev(entity_state(25)) != state) ||
        (!isEnemy(26) && entityID(26) == id && entity_state(26) == state && prev(entity_state(26)) != state) ||
        (!isEnemy(27) && entityID(27) == id && entity_state(27) == state && prev(entity_state(27)) != state) ||
        (!isEnemy(28) && entityID(28) == id && entity_state(28) == state && prev(entity_state(28)) != state) ||
        (!isEnemy(29) && entityID(29) == id && entity_state(29) == state && prev(entity_state(29)) != state) ||
        (!isEnemy(30) && entityID(30) == id && entity_state(30) == state && prev(entity_state(30)) != state) ||
        (!isEnemy(31) && entityID(31) == id && entity_state(31) == state && prev(entity_state(31)) != state)
    )

function enemyDead(index) => entity_state(index) == 2 && prev(entity_state(index)) != 2

function enemyHealth(index) => byte(0xC18E + (0xf * index))

// $FF90: Screen Scroll Y-Position
function screenYpos() => byte(0x00FF90)

// $FF91: Screen Scroll Y-Chunk
function screenYchunk() => byte(0x00FF91)

// $FF92: Screen Scroll X-Position
function screenXpos() => byte(0x00FF92)

// $FF93: Screen Scroll X-Chunk
function screenXchunk() => byte(0x00FF93)

// $FF9A: a0: Out of game
//        8c: In-game
function in_game() => byte(0xFF9A) == 0x8c && prev(byte(0xFF9A)) == 0x8c

// $FF9F: Current level
function level() => byte(0x00FF9F)

// $FFAC: 00: Facing Left
//        FF: Facing Right

// $FFAE: Player Y-Position
function playerYpos() => byte(0x00FFAE)

// $FFAF: Player Y-Chunk
function playerYchunk() => byte(0x00FFAF)

// $FFB1: Player X-Position
function playerXpos() => byte(0x00FFB1)

// $FFB2: Player X-Chunk
function playerXchunk() => byte(0x00FFB2)

// $FFB8: Coins
function coins() => byte(0x00FFB8)

// $FFB9: Stars
function stars() => byte(0x00FFB9)

// $FFBA: Lives
function lives() => byte(0x00FFBA)

// $FFBB: Power-up state:
//        00 = Small Mario
//        01 = Wing Cap
//        03 = Mushroom
//        04 = Yoshi
function power_up() => byte(0x00FFBB)

PowerUpLookup = {
    0: "Small ",
    1: "Wing Cap ",
    2: "",
    3: "Super ",
    4: "Yoshi "
}

achievement(
    title = "More Bang for Your Buck", description = "Exchange 30 coins for an extra life", points = 3,
    trigger = in_game() && coins() == 0 && prev(coins()) == 29 && lives() == (prev(lives()) + 1)
)

achievement(
    title = "Mario Wings to the Sky?", description = "Collect a Wing Cap Feather", points = 1,
    trigger = in_game() && power_up() == 1 && prev(power_up()) != power_up()
)

achievement(
    title = "The Invincible Fire-Breathing Dragon", description = "Collect a Yoshi power-up", points = 1,
    trigger = in_game() && power_up() == 4 && prev(power_up()) != power_up()
)

achievement(
    title = "Star Get!", description = "Find a hidden Power Star", points = 5,
    trigger = in_game() && stars() == 1 && prev(stars()) < stars()
)

achievement(
    title = "You Got a Multi Star!", description = "Have the maximum of three Power Stars at once", points = 10,
    trigger = in_game() && stars() == 3 && prev(stars()) < 3
)

achievement(
    title = "Would You Please Shut Up?", description = "Save the Baby Yoshi for a checkpoint in Stage 1", points = 10,
    trigger = in_game() && level() == 0 && baby_yoshi_rescued()
)

achievement(
    title = "Getting a Head", description = "Pick up an extra life", points = 10,
    trigger = in_game() && prev(coins()) == coins() && lives() == (prev(lives()) + 1)
)

achievement(
    title = "Shell Stomper", description = "Defeat the boss of Stage 1", points = 5,
    trigger = never(!in_game() || level() != 0 || screenXchunk() != 0x0d || screenXpos() != 0x60) && enemy_state_check(1, 2)
)

achievement(
    title = "Squirtle Used Bubble! It's Not Very Effective...", description = "Defeat the boss of Stage 1 without taking damage or using Yoshi", points = 10,
    trigger = once(screenXpos() != 0x60) && screenXpos() == 0x60 && never(!in_game() || level() != 0 || screenXchunk() != 0x0d || stars() < prev(stars()) || power_up() == 4 || power_up() != prev(power_up())) && enemy_state_check(1, 2)
)

achievement(
    title = "Bullet Vanguard", description = "Defeat the boss of Stage 2", points = 10,
    trigger = never(!in_game() || level() != 1 || screenXchunk() != 0x0d || screenXpos() != 0x60) && enemy_state_check(2, 2)
)

achievement(
    title = "Disarmament", description = "Defeat the boss of Stage 2 without taking damage or using Yoshi", points = 25,
    trigger = once(screenXpos() != 0x60) && screenXpos() == 0x60 && never(!in_game() || level() != 1 || screenXchunk() != 0x0d || stars() < prev(stars()) || power_up() == 4 || power_up() != prev(power_up())) && enemy_state_check(2, 2)
)

achievement(
    title = "Just a Mean Green Mother", description = "Defeat the boss of Stage 3", points = 25,
    trigger = never(!in_game() || level() != 2 || screenXchunk() != 0x01 || screenXpos() != 0x60) && enemy_state_check(3, 4)
)

achievement(
    title = "Weed Killer", description = "Defeat the boss of Stage 3 without taking damage or using Yoshi", points = 50,
    trigger = once(screenXpos() != 0x60) && screenXpos() == 0x60 && never(!in_game() || level() != 2 || screenXchunk() != 0x01 || stars() < prev(stars()) || power_up() == 4 || power_up() != prev(power_up())) && enemy_state_check(3, 4)
)

achievement(
    title = "Monkey Kong", description = "Defeat the boss of Stage 4 and beat the game", points = 50,
    trigger = never(!in_game() || level() != 3 || screenXchunk() != 0x09 || screenXpos() != 0x60) && enemy_state_check(4, 2)
)

achievement(
    title = "Coconut Gunned Down", description = "Defeat the boss of Stage 4 without taking damage or using Yoshi", points = 50,
    trigger = once(screenXpos() != 0x60) && screenXpos() == 0x60 && never(!in_game() || level() != 3 || screenXchunk() != 0x09 || stars() < prev(stars()) || power_up() == 4 || power_up() != prev(power_up())) && enemy_state_check(4, 2)
)



rich_presence_conditional_display(!in_game(), "Between Levels")

rich_presence_display("{0}Mario is in Stage {1}, Stars: {2}, Coins: {3}, 🚶x{4}",
    rich_presence_lookup("PowerUp", power_up(), PowerUpLookup),
    rich_presence_value("Digit", level() + 1),
    rich_presence_value("Digit", stars()),
    rich_presence_value("Digit", coins()),
    rich_presence_value("Digit", lives())
)