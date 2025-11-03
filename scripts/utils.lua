-- scripts/utils.lua
local utils = {}

function utils.log(tag, msg)
  env.info(string.format("[DCS:%s] %s", tag, msg))
end

return utils
