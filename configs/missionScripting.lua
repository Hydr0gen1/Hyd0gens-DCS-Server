-- configs/missionScripting.lua (TEMPLATE)
-- Enable io and require for server scripts.
 do
  sanitizeModule('os')
  sanitizeModule('io', true)    -- allow io
  sanitizeModule('lfs', true)   -- allow lfs
  require = require             -- allow require
end
