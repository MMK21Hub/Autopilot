scoreboard objectives add prevPosY dummy "Previous position (Y)"
scoreboard objectives add curPosY dummy "Current position (Y)"
scoreboard objectives add velocityY dummy "Velocity (Y)"

# Used to store scoreboard variables
scoreboard objectives add autopilot dummy "Autopilot"

# Initialise some variables and constants
scoreboard players set $velocityThreshold autopilot -2000

tellraw @a [{"text":"Loaded ","color":"aqua"},{"text":"Autopilot "},{"text":"by MMK21"}]