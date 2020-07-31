// Game Boy Gallery
// #ID = 7446

// $9852: BG RAM, so not the best hook, but seemingly always 0xff only in menu
// $C000: Ball Game A High Score (XX00)
// $C001: Ball Game A High Score (00XX)
// $C002: Vermin Game A High Score (XX00)
// $C003: Vermin Game A High Score (00XX)
// $C004: Flagman Game A High Score (XX00)
// $C005: Flagman Game A High Score (00XX)
// $C006: Manhole Game A High Score (XX00)
// $C007: Manhole Game A High Score (00XX)
// $C008: Cement Factory Game A High Score (XX00)
// $C009: Cement Factory Game A High Score (00XX)
// $C00A: Ball Game B High Score (XX00)
// $C00B: Ball Game B High Score (00XX)
// $C00C: Vermin Game B High Score (XX00)
// $C00D: Vermin Game B High Score (00XX)
// $C00E: Flagman Game B High Score (XX00)
// $C00F: Flagman Game B High Score (00XX)
// $C010: Manhole Game B High Score (XX00)
// $C011: Manhole Game B High Score (00XX)
// $C012: Cement Factory Game B High Score (XX00)
// $C013: Cement Factory Game B High Score (00XX)
// $C014: Game Select Menu
//        00: Ball 01: Vermin 02: Flagman
//        03: Manhole 04:Cement Factory
// $C015: 00: Game A 01: Game B
// $C016: Music
//        00: Game Boy 01: Game
// $C029: 00 on Title/Demo Mode
//        01 otherwise
// $C116: [Ball]
//        00 during gameplay, counts down to 0x0f on game over
// $C11C: [Manhole] Miss Count
//        
//        3 = Game Over
// $C12B: [Manhole]
//        0x00 Normally
//        0xFF Fever Mode
// $C85A: [Cement Factory]
//        0x01 in Fever Mode
// $C916: [Flagman]
//        Bit4: Set to 1 on successful input other than the last one
//        Lower 4: Current flag
// $C917: [Flagman]
//        Game state:
//        00: user input
//        02: Show Mode
//        03: Wait state?
// $C919: [Flagman]
//        Successful input counter
// $C920: [Flagman]
//        Miss Count
// $C921: [Flagman]
//        Countdown Timer
// $D021: Cheat Mode (See: https://gamefaqs.gamespot.com/gameboy/942187-game-boy-gallery/cheats )
//        00: Off
//        01: On
// $D80E: Score (XX00)
// $D80F: Score (00XX)
// $D823: [Flagman] Miss Count
//        
//        3 = Game Over
// $D828: [Vermin/Cement Factory] Miss Count
//        
//        3 = Game Over

function game() => low4(0xC014) // 0: Ball | 1: Vermin | 2: Flagman | 3: Manhole | 4: Cement Factory

function mode() => bit0(0xC015) // 0: Game A | 1: Game B

function cheat_mode() => bit0(0xD021) // 0: Off | 1: On

function cheating() => cheat_mode() == 1

ModeLookup = {
    0: "A",
    1: "B"
}

FeverLookup = {
    0x0 : "",
    0x01: " in FEVER MODE",
    0xFF: " in FEVER MODE"
}

CheatLookup = {
    0: "Playing",
    1: "Cheating at"
}

function high_score(game, mode)
{
    index = 0xC000 + (game * 2) + (mode * 10)
    return high4(index) * 1000 + low4(index) * 100 + high4(index + 1) * 10 + low4(index + 1)
}

//function current_high_score_addr() => 0xC000 + game() * 0x02 + mode() * 0x0A
//function high_score() => high4(current_high_score_addr()) * 1000 + low4(current_high_score_addr()) * 100 + high4(current_high_score_addr() + 1) * 10 + low4(current_high_score_addr() + 1)

function score() => high4(0xD80E) * 1000 + low4(0xD80E) * 100 + high4(0xD80F) * 10 + low4(0xD80F)

function in_game() => byte(0x9852) != 0xFF && bit0(0xC029) == 1

// High score is used for leaderboards instead of current score to allow submission by exiting game.
// Scores are not saved between sessions and cheat mode does not update high scores, so this should work
leaderboard(title = "Ball - Game A High Score",
            description = "Best score (Cheat mode not allowed)",
            start = game() == 0 && mode() == 0 && in_game() && !cheating() && byte(0xC116) == 0,
            cancel = cheating(),
            submit = !in_game() || byte(0xC116) == 0x0f,
            value = high_score(0, 0))
            
leaderboard(title = "Ball - Game B High Score",
            description = "Best score (Cheat mode not allowed)",
            start = game() == 0 && mode() == 1 && in_game() && !cheating() && byte(0xC116) == 0,
            cancel = cheating(),
            submit = !in_game() || byte(0xC116) == 0x0f,
            value = high_score(0, 1))

leaderboard(title = "Vermin - Game A High Score",
            description = "Best score (Cheat mode not allowed)",
            start = game() == 1 && mode() == 0 && in_game() && !cheating() && byte(0xD828) == 0,
            cancel = cheating(),
            submit = !in_game() || byte(0xD828) == 3,
            value = high_score(1, 0))

leaderboard(title = "Vermin - Game B High Score",
            description = "Best score (Cheat mode not allowed)",
            start = game() == 1 && mode() == 1 && in_game() && !cheating() && byte(0xD828) == 0,
            cancel = cheating(),
            submit = !in_game() || byte(0xD828) == 3,
            value = high_score(1, 1))

leaderboard(title = "Flagman - Game A High Score",
            description = "Best score (Cheat mode not allowed)",
            start = game() == 2 && mode() == 0 && in_game() && !cheating() && byte(0xC920) == 0,
            cancel = cheating(),
            submit = !in_game() || byte(0xC920) >= 3,
            value = high_score(2, 0))

leaderboard(title = "Flagman - Game B High Score",
            description = "Best score (Cheat mode not allowed)",
            start = game() == 2 && mode() == 1 && in_game() && !cheating() && byte(0xC920) == 0,
            cancel = cheating(),
            submit = !in_game() || byte(0xC920) >= 3,
            value = high_score(2, 1))

leaderboard(title = "Manhole - Game A High Score",
            description = "Best score (Cheat mode not allowed)",
            start = game() == 3 && mode() == 0 && in_game() && !cheating() && byte(0xC11C) == 0,
            cancel = cheating(),
            submit = !in_game() || byte(0xC11C) >= 3,
            value = high_score(3, 0))

leaderboard(title = "Manhole - Game B High Score",
            description = "Best score (Cheat mode not allowed)",
            start = game() == 3 && mode() == 1 && in_game() && !cheating() && byte(0xC11C) == 0,
            cancel = cheating(),
            submit = !in_game() || byte(0xC11C) >= 3,
            value = high_score(3, 1))

leaderboard(title = "Cement Factory - Game A High Score",
            description = "Best score (Cheat mode not allowed)",
            start = game() == 4 && mode() == 0 && in_game() && !cheating() && byte(0xD828) == 0,
            cancel = cheating(),
            submit = !in_game() || byte(0xD828) == 3,
            value = high_score(4, 0))

leaderboard(title = "Cement Factory - Game B High Score",
            description = "Best score (Cheat mode not allowed)",
            start = game() == 4 && mode() == 1 && in_game() && !cheating() && byte(0xD828) == 0,
            cancel = cheating(),
            submit = !in_game() || byte(0xD828) == 3,
            value = high_score(4, 1))

rich_presence_conditional_display(byte(0xC029) == 0, "On the Title Screen")

rich_presence_conditional_display(!in_game(), "Choosing a game")

rich_presence_conditional_display(game() == 0 && mode() == 0, "{2} Ball Game A, Current Score: {0}, High Score: {1}",
    rich_presence_value("Digit", score()),
    rich_presence_value("Digit", high_score(0, 0)),
    rich_presence_lookup("CheatMode", cheat_mode(), CheatLookup)
)

rich_presence_conditional_display(game() == 0 && mode() == 1, "{2} Ball Game B, Current Score: {0}, High Score: {1}",
    rich_presence_value("Digit", score()),
    rich_presence_value("Digit", high_score(0, 1)),
    rich_presence_lookup("CheatMode", cheat_mode(), CheatLookup)
)

rich_presence_conditional_display(game() == 1 && mode() == 0, "{3} Vermin Game A, Current Score: {0}, Current Misses: {1}, High Score: {2}",
    rich_presence_value("Digit", score()),
    rich_presence_value("Digit", low4(0xD828)),
    rich_presence_value("Digit", high_score(1, 0)),
    rich_presence_lookup("CheatMode", cheat_mode(), CheatLookup)
)

rich_presence_conditional_display(game() == 1 && mode() == 1, "{3} Vermin Game B, Current Score: {0}, Current Misses: {1}, High Score: {2}",
    rich_presence_value("Digit", score()),
    rich_presence_value("Digit", low4(0xD828)),
    rich_presence_value("Digit", high_score(1, 1)),
    rich_presence_lookup("CheatMode", cheat_mode(), CheatLookup)
)

rich_presence_conditional_display(game() == 2 && mode() == 0, "{3} Flagman Game A, Current Score: {0}, Current Misses: {1}, High Score: {2}",
    rich_presence_value("Digit", score()),
    rich_presence_value("Digit", byte(0xC920)),
    rich_presence_value("Digit", high_score(2, 0)),
    rich_presence_lookup("CheatMode", cheat_mode(), CheatLookup)
)

rich_presence_conditional_display(game() == 2 && mode() == 1, "{3} Flagman Game B, Current Score: {0}, Current Misses: {1}, High Score: {2}",
    rich_presence_value("Digit", score()),
    rich_presence_value("Digit", low4(0xC920)),
    rich_presence_value("Digit", high_score(2, 1)),
    rich_presence_lookup("CheatMode", cheat_mode(), CheatLookup)
)

rich_presence_conditional_display(game() == 3 && mode() == 0, "{4} Manhole Game A{3}, Current Score: {0}, Current Misses: {1}, High Score: {2}",
    rich_presence_value("Digit", score()),
    rich_presence_value("Digit", low4(0xC11C)),
    rich_presence_value("Digit", high_score(3, 0)),
    rich_presence_lookup("Fever", byte(0xC12B), FeverLookup),
    rich_presence_lookup("CheatMode", cheat_mode(), CheatLookup)
)

rich_presence_conditional_display(game() == 3 && mode() == 1, "{4} Manhole Game B{3}, Current Score: {0}, Current Misses: {1}, High Score: {2}",
    rich_presence_value("Digit", score()),
    rich_presence_value("Digit", low4(0xC11C)),
    rich_presence_value("Digit", high_score(3, 1)),
    rich_presence_lookup("Fever", byte(0xC12B), FeverLookup),
    rich_presence_lookup("CheatMode", cheat_mode(), CheatLookup)
)

rich_presence_conditional_display(game() == 4 && mode() == 0, "{4} Cement Factory Game A{3}, Current Score: {0}, Current Misses: {1}, High Score: {2}",
    rich_presence_value("Digit", score()),
    rich_presence_value("Digit", low4(0xD828)),
    rich_presence_value("Digit", high_score(4, 0)),
    rich_presence_lookup("Fever", bit0(0xC85A), FeverLookup),
    rich_presence_lookup("CheatMode", cheat_mode(), CheatLookup)
)

rich_presence_conditional_display(game() == 4 && mode() == 1, "{4} Cement Factory Game B{3}, Current Score: {0}, Current Misses: {1}, High Score: {2}",
    rich_presence_value("Digit", score()),
    rich_presence_value("Digit", low4(0xD828)),
    rich_presence_value("Digit", high_score(4, 1)),
    rich_presence_lookup("Fever", bit0(0xC85A), FeverLookup),
    rich_presence_lookup("CheatMode", cheat_mode(), CheatLookup)
)

rich_presence_display("Playing Game Boy Gallery")