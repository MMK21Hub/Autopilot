# Enable scoreboard triggers
scoreboard players enable @a useVnav
# Update global scoreboard variables
execute store result score $gameTime autopilot run time query gametime

execute as @a at @s run function autopilot:player_tick