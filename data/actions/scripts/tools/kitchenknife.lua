function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not isInArray({2566, 10511, 10515}, item.itemid) then
		return false
	end

	local targetId = target.itemid

	--The Ice Islands Quest
	if targetId == 7261 then
		if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
			if player:getStorageValue(Storage.TheIceIslands.FrostbiteHerb) < 1 then
				player:addItem(7248, 1)
				player:setStorageValue(Storage.TheIceIslands.FrostbiteHerb, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:say('You cut a leaf from a frostbite herb.', TALKTYPE_MONSTER_SAY)
			end
		end

	elseif targetId == 2733 then
		if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
			if player:getStorageValue(Storage.TheIceIslands.FlowerCactus) < 1 then
				player:addItem(7245, 1)
				player:setStorageValue(Storage.TheIceIslands.FlowerCactus, 1)
				target:transform(2723)
				addEvent(revertItem, 60 * 1000, toPosition, 2723, 2733)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:say('You cut a flower from a cactus.', TALKTYPE_MONSTER_SAY)
			end
		end

	elseif targetId == 4017 then
		if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
			if player:getStorageValue(Storage.TheIceIslands.FlowerBush) < 1 then
				player:addItem(7249, 1)
				player:setStorageValue(Storage.TheIceIslands.FlowerBush, 1)
				target:transform(4014)
				addEvent(revertItem, 60 * 1000, toPosition, 4014, 4017)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:say('You cut a flower from a bush.', TALKTYPE_MONSTER_SAY)
			end
		end

		-- What a foolish Quest (Mission 1)
	elseif target.actionid == 4200 then
		if toPosition.x == 32349 and toPosition.y == 32361 and toPosition.z == 7 then
			player:addItem(7476, 1)
			player:say('The stubborn flower has ruined your knife but at least you got it.', TALKTYPE_MONSTER_SAY, false, player, toPosition)
			item:remove()
		else
			player:say('This flower is too pathetic.', TALKTYPE_MONSTER_SAY, false, player, toPosition)
		end

		-- What a foolish Quest (Mission 5)
	elseif targetId == 7480 then
		if player:getStorageValue(Storage.WhatAFoolishQuest.EmperorBeardShave) == 1 then
			player:say('God shave the emperor. Some fool already did it.', TALKTYPE_MONSTER_SAY)
			return true
		end

		player:setStorageValue(Storage.WhatAFoolishQuest.EmperorBeardShave, 1)
		player:say('This is probably the most foolish thing you\'ve ever done!', TALKTYPE_MONSTER_SAY)
		player:addItem(7479, 1)
		Game.createMonster('dwarf guard', Position(32656, 31853, 13))

		-- What a foolish Quest (Mission 8)
	elseif targetId == 4008 then
		if player:getStorageValue(Storage.WhatAFoolishQuest.Questline) ~= 22
				or player:getStorageValue(Storage.WhatAFoolishQuest.SpecialLeaves) == 1 then
			return false
		end

		player:setStorageValue(Storage.WhatAFoolishQuest.SpecialLeaves, 1)
		player:addItem(8109, 1)
		toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)

	elseif isInArray(fruits, targetId) and player:removeItem(6278, 1) then
		target:remove(1)
		player:addItem(6279, 1)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	else
		return false
	end

	return true
end
