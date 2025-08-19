--@name HoloCreator
--@author
--@server

function hologram.createPart(...)
    local main_holo
    for i, part in ipairs({...}) do
        if i == 1 then
            main_holo = hologram.create(unpack(part))
            main_holo:setPos(chip():getPos() + main_holo:getPos())
            main_holo:suppressEngineLighting(true)
            continue
        end
        local holo = hologram.create(unpack(part))
        holo:suppressEngineLighting(true)
        holo:setPos(chip():getPos() + holo:getPos())
        holo:setParent(main_holo)
    end
    return main_holo
end

