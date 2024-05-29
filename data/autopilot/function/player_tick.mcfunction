execute store result score @s pitch run data get entity @s Rotation[1]
# Store positions with scale factor of 1000
execute store result score @s prevPosY run scoreboard players get @s curPosY
execute store result score @s curPosY run data get entity @s Pos[1] 1000

# Calculate velocity
scoreboard players operation @s velocityY = @s curPosY
scoreboard players operation @s velocityY -= @s prevPosY

# Estimate time-to-impact (in ticks)
scoreboard players operation @s timeToImpact = @s curPosY
scoreboard players operation @s timeToImpact /= @s velocityY
# Convert time-to-impact to seconds, for display purposes
scoreboard players operation @s timeToImpactSec = @s timeToImpact
scoreboard players operation @s timeToImpactSec /= $tickConversionFactor autopilot

execute positioned ~ 0 ~ store result score $suppressPullUp autopilot run function autopilot:check_marker with entity @e[type=marker,tag=autopilot,sort=nearest,limit=1] data.autopilot
execute if score $suppressPullUp autopilot matches 1 run return 0

execute if predicate autopilot:in_flight if score @s timeToImpact < $zero autopilot if score @s timeToImpact >= $timeToImpactThreshold autopilot if score @s curPosY > $zero autopilot if score @s pitch >= $minDangerPitch autopilot if score @s velocityY <= $velocityThreshold autopilot run function autopilot:pull_up

execute store result score $gameTime autopilot run time query gametime
# tellraw @p [{"score":{"name":"$gameTime","objective":"autopilot"}},{"text":", "},{"entity":"@p","nbt":"Pos[1]"}]