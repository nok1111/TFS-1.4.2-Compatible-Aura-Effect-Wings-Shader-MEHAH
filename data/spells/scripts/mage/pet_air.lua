function removePet(creatureId)
    local c = Creature(creatureId)
    if not c then return false end

    c:remove()
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_WIND1)

local area = createCombatArea(AREA_CROSS1X1)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	local player = Player(cid)
	if not player then return false end

    if #player:getSummons() >= 1 then
        player:sendCancelMessage("You can't have other summons.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    	return false
    end

    local vocationId = player:getVocation():getId()
    local summonName = nil
    if vocationId == 1 then
        summonName = "air elemental"
    elseif vocationId == 2 then
        summonName = "air elemental"
    elseif vocationId == 3 then
        summonName = "air elemental"
    elseif vocationId == 4 then
        summonName = "air elemental"
	elseif vocationId == 5 then
        summonName = "air elemental"--here goes transformation
    end
    
    if not summonName then return false end

    local mySummon = Game.createMonster(summonName, player:getPosition(), true, true)
    if not mySummon then
        return combat:execute(player, var)
    end

    player:addSummon(mySummon)
    mySummon:registerEvent("Summon_Damage")

    local deltaSpeed = math.max(player:getBaseSpeed() - mySummon:getBaseSpeed(), 0)
    mySummon:changeSpeed(deltaSpeed)

  
    player:say("Face the wind!", TALKTYPE_MONSTER_SAY)
    addEvent(removePet, 1*60*1000, mySummon:getId()) --I think this isn't necessary
    return combat:execute(player, var)
end