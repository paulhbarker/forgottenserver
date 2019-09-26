function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not isInArray({2550, 10513, 2405}, item.itemid) then
		return false
	end

	if target.itemid == 2739 then -- Wheat
		target:transform(2737)
		target:decay()
		Game.createItem(2694, 1, toPosition)
		return true
	end

	if target.itemid == 5464 then
		target:transform(5463)
		target:decay()
		Game.createItem(5467, 1, toPosition)
		return true
	end

	return onDestroyItem(player, item, fromPosition, target, toPosition, isHotkey)
end
