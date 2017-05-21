require("screenplays.screenplay")
local ObjectManager = require("managers.object.object_manager")

SIT = 1
STAND = 0
local ticketTemplate = "object/tangible/travel/travel_ticket/dungeon_ticket.iff"

CorvetteTicketTakerLogic = ScreenPlay:new {
	numberOfActs = 1,
	npc = {},
	takerName = "corvetteTicketTakerLogic",
	faction = 0,
	goodbyeString = "",
	helpMeString = "",
	nevermindString = "",
	aboutMissionString = "",
}

function CorvetteTicketTakerLogic:start()
	self:spawnNpc()
end

function CorvetteTicketTakerLogic:spawnNpc()
	local npcSpawnData = self.npc

	if not isZoneEnabled(npcSpawnData.planetName) then
		return
	end

	local pNpc = spawnMobile(npcSpawnData.planetName, npcSpawnData.npcTemplate, 1, npcSpawnData.x, npcSpawnData.z, npcSpawnData.y, npcSpawnData.direction, npcSpawnData.cellID)

	if pNpc ~= nil then
		if (npcSpawnData.position == SIT) then
			CreatureObject(pNpc):setState(STATESITTINGONCHAIR)
		end
		if (npcSpawnData.mood ~= nil and npcSpawnData.mood ~= "") then
			CreatureObject(pNpc):setMoodString(npcSpawnData.mood)
		end
	end
end

function CorvetteTicketTakerLogic:checkFaction(pPlayer)
	if (self.faction == FACTIONNEUTRAL) then
		return true
	end

	if (not ThemeParkLogic:isInFaction(self.faction, pPlayer) or ThemeParkLogic:isOnLeave(pPlayer)) then
		return false
	end

	if (CreatureObject(pPlayer):isGrouped()) then
		local groupSize = CreatureObject(pPlayer):getGroupSize()

		for i = 0, groupSize - 1, 1 do
			local pMember = CreatureObject(pPlayer):getGroupMember(i)
			if pMember ~= nil and (not ThemeParkLogic:isInFaction(self.faction, pMember) or ThemeParkLogic:isOnLeave(pMember)) then
				return false
			end
		end
	end

	return true
end

function CorvetteTicketTakerLogic:validateTicket(pPlayer)
	if (pPlayer == nil) then
		return
	end

	CreatureObject(pPlayer):sendSystemMessage("@dungeon/space_dungeon:validating_ticket") -- Validating travel authorization. Please stand by...

	createEvent(5 * 1000, "CorvetteTicketTakerLogic", "finishValidateTicket", pPlayer, "")
end

function CorvetteTicketTakerLogic:finishValidateTicket(pPlayer)
	if pPlayer == nil then
		return
	end

	local player = CreatureObject(pPlayer)

	local pInventory = player:getSlottedObject("inventory")
	if pInventory == nil then
		player:sendSystemMessageWithTO("@dungeon/space_dungeon:no_ticket", "@dungeon/space_dungeon:corvette_" .. self:getFactionString()) -- You do not have the proper authorization to access the %TO.
		return
	end

	local pInvItem = getContainerObjectByTemplate(pInventory, ticketTemplate, true)

	if pInvItem == nil then
		player:sendSystemMessageWithTO("@dungeon/space_dungeon:no_ticket", "@dungeon/space_dungeon:corvette_" .. self:getFactionString()) -- You do not have the proper authorization to access the %TO.
		return
	end

	local ticket = LuaTicketObject(pInvItem)
	local activeQuestType = getQuestStatus(player:getObjectID() .. ":activeCorvetteQuestType")

	if ticket:getDeparturePoint() ~= self:getFactionString() or ticket:getArrivalPlanet() ~= activeQuestType then
		player:sendSystemMessage("@dungeon/space_dungeon:illegal_ticket") -- That is not the proper travel authorization.
		return
	end

	--TODO add validation of group

	local result = CorellianCorvette:activate(pPlayer, self:getFactionString(), activeQuestType)

	if (result) then
		--SceneObject(pInvItem):destroyObjectFromWorld()
		--SceneObject(pInvItem):destroyObjectFromDatabase()
	end
end

function CorvetteTicketTakerLogic:getFactionString()
	if self.faction == FACTIONIMPERIAL then
		return "imperial"
	elseif self.faction == FACTIONREBEL then
		return "rebel"
	else
		return "neutral"
	end
end
