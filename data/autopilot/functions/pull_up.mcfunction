#> Pitches a flying player upwards to prevent them hitting the ground

tellraw @s [{"text":"Pitching up due to "},{"color":"gold","score":{"name":"@s","objective":"velocityY"}},{"color":"gold","text":" mm/s"},{"text":" vertical speed"}]
tp @s ~ ~ ~ ~ -10