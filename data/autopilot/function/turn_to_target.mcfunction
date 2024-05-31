# Return early if there are no nearby targets or we are already very close to our target
execute unless entity @n[type=marker, tag=autopilotTarget] run return 0
execute if entity @n[type=marker, tag=autopilotTarget, distance=..5] run return 0

execute at @n[type=marker, tag=autopilotTarget] run summon marker ~ ~ ~ {Tags: ["autopilotTempTarget"]}
data modify entity @n[type=marker, tag=autopilotTempTarget] Pos[1] set from entity @s Pos[1]
# tellraw @p [{"entity":"@n[type=marker, tag=autopilotTempTarget]","nbt":"Pos"}]
tp @s ~ ~ ~ facing entity @n[type=marker, tag=autopilotTempTarget]
kill @e[type=marker,tag=autopilotTempTarget]