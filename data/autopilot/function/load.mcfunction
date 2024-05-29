scoreboard objectives add prevPosY dummy "Previous position (Y)"
scoreboard objectives add curPosY dummy "Current position (Y)"
scoreboard objectives add pitch dummy "Pitch"
scoreboard objectives add velocityY dummy "Velocity (Y)"
scoreboard objectives add timeToImpact dummy "Estimated time until impact with ground"
scoreboard objectives add timeToImpactSec dummy "Estimated time to impact (seconds)"

# Used to store scoreboard variables
scoreboard objectives add autopilot dummy "Autopilot"

# Initialise some constants
scoreboard players set $zero autopilot 0
scoreboard players set $tickConversionFactor autopilot 20
scoreboard players set $velocityThreshold autopilot -500
scoreboard players set $timeToImpactThreshold autopilot -20
scoreboard players set $minDangerPitch autopilot 35

tellraw @a [{"text":"Loaded ","color":"aqua"},{"text":"Autopilot "},{"text":"by MMK21"}]