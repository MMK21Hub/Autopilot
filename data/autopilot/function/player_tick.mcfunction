execute store result score @s pitch run data get entity @s Rotation[1]
execute store result score @s pitchMilli run data get entity @s Rotation[1] 1000
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

# Check if automatic pitch-up is being supressed by a marker
execute positioned ~ 0 ~ store result score $suppressPullUp autopilot run function autopilot:check_marker with entity @e[type=marker,tag=autopilot,sort=nearest,limit=1] data.autopilot

execute if score $suppressPullUp autopilot matches 0 if predicate autopilot:in_flight if score @s timeToImpact < $zero autopilot if score @s timeToImpact >= $timeToImpactThreshold autopilot if score @s curPosY > $zero autopilot if score @s pitch >= $minDangerPitch autopilot if score @s velocityY <= $velocityThreshold autopilot run function autopilot:pull_up
# tellraw @p [{"score":{"name":"$gameTime","objective":"autopilot"}},{"text":", "},{"entity":"@p","nbt":"Pos[1]"}]

scoreboard players operation @s lnavIntervalMod = $gameTime autopilot
scoreboard players operation @s lnavIntervalMod %= $lnavInterval autopilot
execute if score @s lnavIntervalMod matches 0 if score @s useLnav > $zero autopilot run function autopilot:turn_to_target

scoreboard players operation @s vnavIntervalMod = $gameTime autopilot
# Never trigger if vnavInterval == 0 by leaving vnavIntervalMod set to $gameTime (which will probably never be 0)
execute unless score @s vnavInterval matches 0 run scoreboard players operation @s vnavIntervalMod %= @s vnavInterval
execute if score @s vnavIntervalMod matches 0 if score @s vnavMode matches 1 run function autopilot:alt_hold_vnav