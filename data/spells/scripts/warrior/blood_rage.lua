local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STEPSHORIZONTAL)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(creature, variant)
local player = Player(creature)
 if player then
 

local slvl = creature:getLevel() * 0.15 



local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_SUBID, 571)
condition:setParameter(CONDITION_PARAM_TICKS, 8000)
condition:setParameter(CONDITION_PARAM_SKILL_SWORDPERCENT, 150)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
combat:addCondition(condition)

 
  local position = creature:getPosition()  

    position:sendMagicEffect(265)
	
	
 local playerpos = creature:getPosition()
	playerpos:sendMagicEffect(353)
	
  -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
   player:sendAddBuffNotification(70, 15, 'Blood Rage: increase Melee skill by 50% for 8 seconds', 5, 0)
  end
  
	return combat:execute(creature, variant)
end
