execute store result score @s prevPosY run scoreboard players get @s curPosY
execute store result score @s curPosY run data get entity @s Pos[1]

# Calculate velocity
scoreboard players operation @s velocityY = @s curPosY
scoreboard players operation @s velocityY -= @s prevPosY  