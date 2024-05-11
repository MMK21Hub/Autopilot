# Autopilot

An experimental datapack to provide safeguards (and maybe auto-navigation in the future) for Elytra flight.

## Usage

### Suppress Autopilot in an area

Suppress the automatic pitch-up functionality anywhere within an infinitely-tall cylinder of radius **25** blocks from `~ ~ ~` by summoning a `marker` entity as shown in the example below.

```h
/summon minecraft:marker ~ 0 ~ {Tags: ["autopilot"], data: {autopilot: {suppressRange: 25}}}
```
