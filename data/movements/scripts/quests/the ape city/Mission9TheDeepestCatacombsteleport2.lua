function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:teleportTo({x = 32885, y = 32632, z = 11})
	position:sendMagicEffect(CONST_ME_TELEPORT)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end


