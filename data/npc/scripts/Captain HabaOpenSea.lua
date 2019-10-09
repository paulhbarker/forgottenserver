local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local travelKeyword = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, text = 'Y\'already wanna give up?? I shoul\'ve known. I bring ya back to Svargrond, \'kay?', cost = 0, discount = 'postman'})
travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, cost = 0, discount = 'postman', destination = Position(32341, 31108, 6)})

npcHandler:addModule(FocusModule:new())
