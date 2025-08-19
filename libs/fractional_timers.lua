--@name Fractional timers
--@author love2D: hamache/SF: maxobur0001
--@server

instances = {}

FTimer =  {
    name = nil,
    loops = nil,
    duration = nil,
    paused = nil,
    fractions = nil,
    update_func = nil
}
FTimer.__index = FTimer


function FTimer:new(name, duration, loops, fractions)
    local self = setmetatable(
        {
            name = name,
            loops = loops,
            duration = duration,
            paused = false,
            fractions = fractions,
            update_func = nil
        },
        FTimer
    )
    local func = coroutine.create(FTimer.update)
    coroutine.resume(func, self)
    self.update_func = func
    table.insert(instances, self)
    return self
end

function FTimer:remove()
    table.removeByValue(instances, self)
end

function FTimer:stop()
    self.paused = true
end

function FTimer:start()
    self.paused = false
end

function FTimer:update()
    local ticks = 0
    while self.loops ~= 0 do
        coroutine.yield()
        local time = ticks * game.getTickInterval()
        print(time)
        local process = math.timeFraction(0, self.duration, time)
        if time >= self.duration then
            ticks = 0
            self.loops = self.loops - 1
        end
        for second, callback in pairs(self.fractions) do
            if isnumber(second) then
                if process == second then
                    callback(self)
                end
            elseif isstring(second) then
                local dur = string.split(second, '-')
                local start, endd = tonumber(dur[1]), tonumber(dur[2])
                if process >= start and process <= endd then
                    local relative = math.timeFraction(start, endd, process)
                    callback(self, process, relative)
                end
            end
        end
        ticks = ticks + 1
    end
end

hook.add("Think", "fractionalTimers", function()
    for _, ftimer in ipairs(instances) do
        if not ftimer.paused then
            if coroutine.status(ftimer.update_func) == "dead" then
                ftimer:remove()
            end
            coroutine.resume(ftimer.update_func, ftimer)
        end
    end
end)


