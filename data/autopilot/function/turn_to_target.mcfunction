# Return early if there are no nearby targets or we are already very close to our target
execute unless entity @n[type=marker, tag=autopilotTarget] run return 0
execute if entity @n[type=marker, tag=autopilotTarget, distance=..5] run return 0

# Summon a tempoary marker at the player's position, rotate that temp marker to face the target, and then give the player the rotation from the marker
execute at @s run summon marker ~ ~ ~ {Tags: ["autopilotTemp"]}
execute as @n[type=marker, tag=autopilotTemp] at @s run tp @s ~ ~ ~ facing entity @n[type=marker, tag=autopilotTarget]
data modify entity @n[type=marker, tag=autopilotTemp] Rotation[1] set from entity @s Rotation[1]
# data modify entity @n[type=marker, tag=autopilotTemp] Motion set from entity @s Motion
# tp @s @n[type=marker, tag=autopilotTemp]
execute rotated as @n[type=marker, tag=autopilotTemp] run tp @s ~ ~ ~ ~ ~
# tellraw @p [{"entity":"@n[type=marker, tag=autopilotTemp]","nbt":"Pos"}]
kill @e[type=marker,tag=autopilotTemp]