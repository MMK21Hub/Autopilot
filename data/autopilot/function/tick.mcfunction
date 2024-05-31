# Enable scoreboard triggers
scoreboard players enable @a useLnav
scoreboard players enable @a vnavInterval
scoreboard players enable @a vnavAltHold

# Update global scoreboard variables
execute store result score $gameTime autopilot run time query gametime

execute as @a at @s run function autopilot:player_tick