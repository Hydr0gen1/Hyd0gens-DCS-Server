# Hyd0gen's DCS Server

A Contention-style DCS server with SkyNet IADS, CTLD, CSAR, logistics, and troop movement.

## Quick Start (Windows, headless)
1. Install **DCS Open Beta (server)** on the host.
2. Copy `configs/serverSettings.lua`, `configs/autoexec.cfg`, and `configs/missionScripting.lua` into  
   `%USERPROFILE%\Saved Games\DCS.openbeta_server\Config\` (back up originals first).
3. Put your `.miz` files into `missions/rotation/`.
4. Place third-party scripts into `scripts/_third_party/` (CTLD, CSAR, SkyNet IADS).
5. Launch with `tools/start_server.ps1`.

## Folder Layout
- `scripts/` glue code loads 3rd-party scripts and registers mission events.
- `missions/rotation/` holds missions cycled by `mission_rotation.lua`.
- `configs/` are **templates**; your actual runtime copies live in Saved Games.
- `tools/` has small PowerShell helpers for start/update/pack.

## Mission Rotation
Edit `scripts/mission_rotation.lua` to point at the exact .miz names. The script listens for
`S_EVENT_MISSION_END` and loads the next mission, with a configurable retry/backoff.

## Third-party scripts
- **CTLD**: troop and logistics
- **CSAR**: search & rescue
- **SkyNet IADS**: dynamic air defense network

You can include them as Git submodules or copy them into `scripts/_third_party/`.

## Notes
- `missionScripting.lua` must allow `io` and `require` for these scripts to work.
- Keep personal keys, passwords, and Saved Games files **out** of Git.
