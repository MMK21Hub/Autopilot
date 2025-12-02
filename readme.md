# Autopilot

An experimental datapack to provide safeguards (and maybe auto-navigation in the future) for Elytra flight.

## Features

### Automatic pitch-up

Automatically pitches the player to a safe angle (between 1° nose-down and 10° nose-up) if it detects the player is about to hit the ground (which is assumed to be at y=0) with high velocity.

#### Suppress auto pitch-up in an area

Suppress the automatic pitch-up functionality anywhere within an infinitely-tall cylinder of radius **25** blocks from `~ ~ ~` by summoning a `marker` entity as shown in the example below.

```h
/summon minecraft:marker ~ 0 ~ {Tags: ["autopilot"], data: {autopilot: {suppressRange: 25}}}
```

### Lateral navigation

Turns the player (on the yaw axis) to fly towards a target x,z position. The target position is the nearest loaded `autopilotMarker` entity. Summon one like this:

```h
/summon minecraft:marker ~ ~ ~ {Tags:["autopilotTarget"]}
```

Enable lateral navigation:

```h
/trigger useLnav set 1
```

Disable lateral navigation:

```h
/trigger useLnav set 0
```
