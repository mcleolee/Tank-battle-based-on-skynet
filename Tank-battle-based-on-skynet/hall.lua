local skynet = require "skynet"
local queue = require "skynet.queue"
local socket = require "skynet.socket"

local cs = queue()

-- 2022/10/1 Todo 设置大厅生命周期，超过生命周期将禁止玩家进入，当无玩家时结束，大于一定时间玩家仍处于大厅将会转交给另一个大厅后结束本大厅。









skynet.start(function ()
    skynet.dispatch("lua", function(session, address, ...)
        cs(...)
    end)
end)