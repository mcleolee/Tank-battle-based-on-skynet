local skynet = require "skynet"
local socket = require "skynet.socket"
local data

local cId, address = ...

local function update(frame)
    socket.write(cId,"LZY是傻逼")
end

function processSocketEvents()
    local startTime = skynet.now()
    local frame = 0
    while true do
        data = socket.readline(cId)
        if not data then
            print("别走好吗",cId)
            -- 2022/10/1 Todo 断线重连
            socket.close(cId)
            skynet.call()
            return
        end
        frame = frame + 1
        local isok, err = pcall(update, frame)
        if not isok then
            skynet.error(err)
        end
        local endTime = skynet.now()
        local waitTime = frame * 20 - (endTime - startTime)
        if waitTime <= 0 then
            waitTime = 2
        end
        skynet.sleep(waitTime)
    end

skynet.start(function ()
    print("芜湖已连接:", cId, address)
    socket.start(cId) 
    skynet.fork(processSocketEvents)
    skynet.dispatch("lua", function (_, _, ...)
    
    
    end)

end)
