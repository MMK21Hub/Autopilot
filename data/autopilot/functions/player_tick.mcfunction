execute store result score @s pitch run data get entity @s Rotation[1]
# Store positions with scale factor of 1000
execute store result score @s prevPosY run scoreboard players get @s curPosY
execute store result score @s curPosY run data get entity @s Pos[1] 1000

# Calculate velocity
scoreboard players operation @s velocityY = @s curPosY
scoreboard players operation @s velocityY -= @s prevPosY

# Estimate time-to-impact (in negative microseconds or something)
# -500,000,000 means 5 seconds
scoreboard players operation @s timeToImpact = @s curPosY
scoreboard players operation @s timeToImpact *= @s velocityY

execute if predicate autopilot:in_flight if score @s timeToImpact < $zero autopilot if score @s timeToImpact >= $timeToImpactThreshold autopilot if score @s curPosY > $zero autopilot if score @s pitch >= $minDangerPitch autopilot if score @s velocityY <= $velocityThreshold autopilot run function autopilot:pull_up
# execute if score @s timeToImpact < $zero autopilot if score @s timeToImpact >= $timeToImpactThreshold autopilot run say About to hit ground!
# execute if score @s timeToImpact < $zero autopilot if score @s timeToImpact >= $timeToImpactThreshold autopilot if score @s curPosY > $zero autopilot run say pull up