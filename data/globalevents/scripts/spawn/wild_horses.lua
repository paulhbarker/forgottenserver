local positions = { -- Hours of the day should spawn
    Position(32459, 32214, 7),
    Position(32459, 32226, 7),
    Position(32465, 32234, 7),
    Position(32482, 32229, 7),
    Position(32464, 32218, 7),
    Position(32487, 32247, 7),
    Position(32449, 32250, 7),
    Position(32473, 32238, 7),
}

function onThink(interval, lastExecution, thinkInterval)
    Game.createMonster("Wild Horse", positions[math.random(#positions)], false, true)
    return true
end
