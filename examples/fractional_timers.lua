--@name test
--@author maxobur0001
--@include fractional_timers.txt
--@server

require("fractional_timers.txt")

FTimer:new("test", 10, 3, {
    [0.0] = function()
        print("0")
    end,
    [0.4] = function()
        print("1 seconds")
    end,
    [0.5] = function()
        print("1 seconds")
    end,
    [0.6] = function()
        print("1 seconds")
    end,
    [0.7] = function()
        print("1 seconds")
    end,
    ['0.8-0.9'] = function(t, fraction, relative)
        print(fraction)
    end,
    [1.0] = function()
        print("ended")
    end 
})