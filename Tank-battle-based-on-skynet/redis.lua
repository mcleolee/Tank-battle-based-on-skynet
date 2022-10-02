local skynet = require "skynet.manager"
local redis = require "skynet.db.redis"

-- 不会用，帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙帮忙

skynet.start(function ()
	local rds = redis.connect({
		host	= "127.0.0.1",
		port	= 6379,
		db		= 0,
	})
	skynet.dispatch("lua", function (session, address, cmd, ...)
		skynet.retpack( rds[cmd:lower()](rds, ...) )
	end)
end)
