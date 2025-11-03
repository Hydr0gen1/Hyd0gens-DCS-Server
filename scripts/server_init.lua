-- scripts/server_init.lua
-- Entry point: load vendors and set up mission hooks

local lfs = lfs or require("lfs")

local function try_dofile(path)
  local ok, res = pcall(dofile, path)
  if not ok then
    env.info("[DCS:server_init] failed to load " .. path .. ": " .. tostring(res))
  end
  return ok, res
end

try_dofile("scripts/utils.lua")

-- Third-party includes (adjust paths as needed)
try_dofile("scripts/_third_party/CTLD/CTLD.lua")
try_dofile("scripts/_third_party/CSAR/CSAR.lua")
try_dofile("scripts/_third_party/SkyNet-IADS/skynet-iads.lua")

-- Example configuration stubs (edit for your setup)
if ctld then
  ctld.transportPilotNames = ctld.transportPilotNames or {}
  env.info("[DCS:server_init] CTLD loaded")
end

if csar then
  csar.csarMode = csar.csarMode or 1
  env.info("[DCS:server_init] CSAR loaded")
end

if SkynetIADS then
  local iads = SkynetIADS:create("BLUE_IADS")
  -- iads:addEarlyWarningRadarsByPrefix("EW")
  -- iads:addSAMSitesByPrefix("SAM")
  iads:activate()
  env.info("[DCS:server_init] Skynet IADS activated")
end

local ok, rotation = try_dofile("scripts/mission_rotation.lua")
if ok and rotation and world and world.addEventHandler then
  world.addEventHandler({
    onEvent = function(e)
      if e.id == world.event.S_EVENT_MISSION_END then
        rotation.nextMission()
      end
    end
  })
  env.info("[DCS:server_init] mission rotation handler set")
end
