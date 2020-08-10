// Demon Attack
// #ID = 13221

// $0000: Wave Number
// $0001: Player 1 Score (xx0000)
// $0002: Player 2 Score (xx0000)
// $0003: Player 1 Score (00xx00)
// $0004: Player 2 Score (00xx00)
// $0005: Player 1 Score (0000xx)
// $0006: Player 2 Score (0000xx)
// $006A: Game Mode (1-10, binary-coded decimal)
//        Game 1/2: Easy
//        Game 3/4: Easy, Tracer Shots
//        Game 5/6: Hard
//        Game 7/8: Hard, Tracer Shots
//        
//        Odd numbered games 1-7 are single player
//        Even numbered games 2-8 are two-player
//        
//        Game 9: Easy Special Co-op Mode (Players alternate control)
//        Game 10: Hard Special Co-op Mode (Players alternate control)
// $0071: 00 = Demo
//        bd = Game Over/Game Select
//        ff = In-game
// $0072: Lives

function game() => byte(0x6A)

function state() => byte(0x71)
function demo_mode() => state() == 0x00
function game_end() => state() == 0xbd
function game_start() => state() == 0xff

function score1() => high4(0x1) * 100000 + low4(0x1) * 10000 + high4(0x3) * 1000 + low4(0x3) * 100 + high4(0x5) * 10 + low4(0x5)
function score2() => high4(0x2) * 100000 + low4(0x2) * 10000 + high4(0x4) * 1000 + low4(0x4) * 100 + high4(0x6) * 10 + low4(0x6)

leaderboard(title = "High Score (Demon Attack)",
            description = "Best Game 1 score",
            start = game() == 1 && game_start(),
            cancel = demo_mode(),
            submit = game_end(),
            value = score1())

leaderboard(title = "High Score (Co-Op Demon Attack)",
            description = "Best combined Game 2 score",
            start = game() == 2 && game_start(),
            cancel = demo_mode(),
            submit = game_end(),
            value = score1() + score2())

leaderboard(title = "High Score (Tracer Shot Demon Attack)",
            description = "Best Game 3 score",
            start = game() == 3 && game_start(),
            cancel = demo_mode(),
            submit = game_end(),
            value = score1())

leaderboard(title = "High Score (Co-Op Tracer Shot Demon Attack)",
            description = "Best combined Game 4 score",
            start = game() == 4 && game_start(),
            cancel = demo_mode(),
            submit = game_end(),
            value = score1() + score2())

leaderboard(title = "High Score (Advanced Demon Attack)",
            description = "Best Game 5 score",
            start = game() == 5 && game_start(),
            cancel = demo_mode(),
            submit = game_end(),
            value = score1())

leaderboard(title = "High Score (Co-Op Advanced Demon Attack)",
            description = "Best combined Game 6 score",
            start = game() == 6 && game_start(),
            cancel = demo_mode(),
            submit = game_end(),
            value = score1() + score2())

leaderboard(title = "High Score (Advanced Tracer Demon Attack)",
            description = "Best Game 7 score",
            start = game() == 7 && game_start(),
            cancel = demo_mode(),
            submit = game_end(),
            value = score1())

leaderboard(title = "High Score (Co-Op Advanced Tracer Demon Attack)",
            description = "Best combined Game 8 score",
            start = game() == 8 && game_start(),
            cancel = demo_mode(),
            submit = game_end(),
            value = score1() + score2())

leaderboard(title = "High Score (Demon Attack: Special Co-Op Version)",
            description = "Best combined Game 9 score",
            start = game() == 9 && game_start(),
            cancel = demo_mode(),
            submit = game_end(),
            value = score1() + score2())

leaderboard(title = "High Score (Tracer Shot Demon Attack: Special Co-Op Version)",
            description = "Best combined Game 10 score",
            start = game() == 0x10 && game_start(),
            cancel = demo_mode(),
            submit = game_end(),
            value = score1() + score2())