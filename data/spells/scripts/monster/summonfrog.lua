

function onCastSpell(cid, variant)
local fromPos = cid:getPosition()
    local owner = cid:getMaster()
    local target = cid:getTarget()
	local targetposition = target:getPosition()
    local min = (owner:getLevel() / 6) + (owner:getMagicLevel() * 1.8) + 15
    local max = (owner:getLevel() / 6) + (owner:getMagicLevel() * 2.3) + 25
	fromPos:sendDistanceEffect(targetposition, CONST_ANI_BIGMUDWANDSHOOT)
    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, target:getPosition(), {1}, -min, -max, CONST_ME_HITBYPOISON)
    return true
end