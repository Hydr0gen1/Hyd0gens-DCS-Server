-- scripts/mission_rotation.lua
local M = {}
local lfs = lfs or require("lfs")

-- Round-robin mission list (filenames must exist under missions/rotation/)
local missions = {
  "01_frontline_east.miz",
  "02_frontline_west.miz",
}
local idx = 1

local function loadMission(name)
  local base = lfs.currentdir() or "."
  local mizPath = base .. \"\\missions\\rotation\\\" .. name
  env.info("[DCS:rotation] loading " .. mizPath)
  net.load_mission(mizPath)
end

function M.nextMission()
  idx = (idx % #missions) + 1
  loadMission(missions[idx])
end

return M
