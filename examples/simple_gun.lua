--@name Simple gun
--@author
--@server
--@include ../libs/holos.lua

require("../libs/holos.lua")

local parts = {
    hand = {
        hologram.createPart(
            {Vector(0, 0, 0), Angle(), "models/hunter/blocks/cube025x025x025.mdl"},
            {Vector(0, 0, 5), Angle(), "models/props_c17/oildrum001_explosive.mdl"}
        ),
        hologram.createPart(
            {Vector(0, 0, 45), Angle(), "models/hunter/blocks/cube025x025x025.mdl"},
            {Vector(0, 0, 50), Angle(), "models/props_c17/oildrum001_explosive.mdl"}
        ),
    }
}
parts.hand[1]:setParent(chip())
parts.hand[2]:setParent(parts.hand[1])

hook.add("tick", "", function()
    local res = owner():getEyeTrace()
    local angles = (parts.hand[2]:getPos() - res.HitPos):getAngle()
    parts.hand[2]:setAngles(math.lerpAngle(0.3, parts.hand[2]:getAngles(), angles + Angle(-90, 0, 0)))
end)
