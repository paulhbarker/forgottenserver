local config = {
    [6100] = { toPosition = Position(33538, 32014, 6) }, -- Entrance
    [6101] = { toPosition = Position(33492, 31985, 7) }, -- Blood Beasts
}

function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player or fromPosition:getDistance(position) ~= 1 then
        return true
    end

    local slide = config[item.actionid]
    if not slide then
        return true
    end

    creature:teleportTo(slide.toPosition)
    creature:getPosition():sendMagicEffect(CONST_ME_MORTAREA)

    return true
end
