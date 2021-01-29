// Official Frogger, The
// #ID = 13139

// $002D: Player X-Position
// $0037: FF = Move Left, 01 = Move Right
// $003E: Max Row This Life
// $0047: 00: First Player's Turn
//        01: Second Player's Turn
// $0048: 00 in Single-Player mode
//        01 in Two-Player mode
// $004A: Hi-Score [00xx0]
// $004B: Hi-Score [xx000]
// $005A: Current Player Lives
//        (FF = Game Over)
// $005C: Current Player Score [00xx0]
// $005D: Current Player Score [xx000]
// $0060: Level
// $0064: Other Player Lives
//        (FF = Game Over)
// $0066: Other Player Score [00xx0]
// $0067: Other Player Score [xx000]

function multiplayer() => bit0(0x48) == 1

function lives1() => byte(0x005A)

function lives2() => byte(0x0064)

function score1() => high4(0x5D) * 10000 + low4(0x5D) * 1000 + high4(0x5C) * 100 + low4(0x5C) * 10

function score2() => high4(0x67) * 10000 + low4(0x67) * 1000 + high4(0x66) * 100 + low4(0x66) * 10

leaderboard(title = "Hi-Score (1 Player)",
            description = "Best single-player score",
            start = lives1() == 6 && !multiplayer(),
            cancel = multiplayer(),
            submit = lives1() == 0xFF,
            value = score1())
            
leaderboard(title = "Hi-Score (2 Player)",
            description = "Best combined score",
            start = lives1() == 6 && multiplayer(),
            cancel = 1 == 0,
            submit = lives1() == 0xFF && lives2() == 0xFF,
            value = score1() + score2())