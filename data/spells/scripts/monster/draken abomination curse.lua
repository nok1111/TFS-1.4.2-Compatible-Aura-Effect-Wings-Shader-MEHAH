local combat = {}

for i = 15, 30 do
	combat[i] = Combat()
	combat[i]:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
	combat[i]:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLCLOUDS)
	combat[i]:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

	local condition = Condition(CONDITION_CURSED)
	condition:setParameter(CONDITION_PARAM_DELAYED, true)

	local damage = i
	condition:addDamage(1, 4000, -damage)
	for j = 1, 8 do
		damage = damage * 1.2
		condition:addDamage(1, 4000, -damage)
	end

	combat[i]:setCondition(condition)
end

function onCastSpell(creature, variant)
	return combat[math.random(15, 30)]:execute(creature, variant)
end
