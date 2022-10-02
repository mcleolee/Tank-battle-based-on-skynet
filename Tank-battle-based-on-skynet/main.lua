local skynet = require "skynet"
local socket = require "skynet.socket"
local playerCount = 0

local function accept(cId, address)
    skynet.newservice("agent", cId, address)
	playerCount = playerCount + 1
end

skynet.start(function ()
    local lId = socket.listen("0.0.0.0", 25565)
    socket.start(lId, accept)
	skynet.dispatch("lua", function(session, address, ...)

	end)

end)
