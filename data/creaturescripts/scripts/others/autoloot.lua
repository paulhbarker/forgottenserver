local function getDepositAmount(item)
    local multiplier = {
        [2148] = 1, -- Gold Coins
        [2152] = 100, -- Platinum Coins
        [2160] = 10000 -- Crystal Coins
    }

    return item:getCount() * multiplier[item:getId()]
end

local function immediateDeposit(player, amount)
    player:setBankBalance(player:getBankBalance() + amount)
    player:sendTextMessage(MESSAGE_DAMAGE_DEALT, amount .. " gold has been added to your balance.")
end

local function scanContainer(cid, position)
    local player = Player(cid)
    if not player then
        return
    end

    local corpse = Tile(position):getTopDownItem()
    if not corpse or not corpse:isContainer() then
        return
    end

    if corpse:getType():isCorpse() and corpse:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER) == cid then
        local depositAmount = 0;

        for a = corpse:getSize() - 1, 0, -1 do
            local containerItem = corpse:getItem(a)
            if not containerItem then
                return
            end
            --for b = AUTOLOOT_STORAGE_START, AUTOLOOT_STORAGE_END do
            --    if player:getStorageValue(b) == containerItem:getId() then
            --        containerItem:moveTo(player)
            --    end
            --end
            if ItemType(containerItem:getId()):isStackable() then
                local moneyItems = { 2148, 2152, 2160 }

                if isInArray(moneyItems, containerItem:getId()) then
                    containerItem:remove()
                    depositAmount = depositAmount + getDepositAmount(containerItem);
                end
            end
        end

        local party = player:getParty()

        if depositAmount ~= 0 then
            if party then
                for _, member in ipairs(party:getMembers()) do
                    immediateDeposit(member, depositAmount)
                end
            end

            immediateDeposit(player, depositAmount)
        end
    end
end

function onKill(player, target)
    if not target:isMonster() then
        return true
    end

    addEvent(scanContainer, 100, player:getId(), target:getPosition())
    return true
end
