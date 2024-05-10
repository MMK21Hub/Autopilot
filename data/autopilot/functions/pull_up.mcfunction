#> Pitches a flying player upwards to prevent them hitting the ground

tellraw @s [{"text":"Pitching up due to "},{"color":"gold","score":{"name":"@s","objective":"velocityY"}},{"color":"gold","text":" mm/s"},{"text":" vertical speed"},{"text":" ("},{"color":"gold","score":{"name":"@s","objective":"pitch"}},{"text":" pitch)"}]
tp @s ~ ~ ~ ~ -10