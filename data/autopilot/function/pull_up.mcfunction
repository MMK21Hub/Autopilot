#> Pitches a flying player upwards to prevent them hitting the ground

tellraw @s [{"text":"Pitching up due to "},{"color":"gold","score":{"name":"@s","objective":"velocityY"}},{"color":"gold","text":" mm/s"},{"text":" vertical speed"},{"text":" ("},{"color":"gold","score":{"name":"@s","objective":"pitch"}},{"text":" pitch)"},{"text":" ETA: "},{"color":"gold","score":{"name":"@s","objective":"timeToImpact"}},{"text":" y="},{"color":"gold","score":{"name":"@s","objective":"curPosY"}}]
tp @s ~ ~ ~ ~ -10