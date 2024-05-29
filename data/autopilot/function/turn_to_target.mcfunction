# Return early if there are no nearby targets or we are already very close to our target
execute unless entity @n[type=marker, tag=autopilotTarget] run return 0
execute if entity @n[type=marker, tag=autopilotTarget, distance=..5] run return 0

data modify storage autopilot:temp targetPos.x set from entity @n[type=marker, tag=autopilotTarget] Pos[0]
data modify storage autopilot:temp targetPos.y set from entity @s Pos[1]
data modify storage autopilot:temp targetPos.z set from entity @n[type=marker, tag=autopilotTarget] Pos[2]
function autopilot:turn_to_coordinates with storage autopilot:temp targetPos
# data modify storage autopilot:temp targetPos set value {}