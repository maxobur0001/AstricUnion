--@name Astro Incepter (ARCHIVED, DOESN'T WORK)
--@author Astric Union
--@shared

--@include astricunion/libs/sounds.txt
require("astricunion/libs/sounds.txt")


if SERVER then
    --@include astricunion/libs/movement.txt
    --@include astricunion/libs/guns.txt
    --@include astricunion/libs/fractional_timers.txt
    --@include astricunion/holos/astro_incepter_holos.txt

    require("astricunion/libs/movement.txt")
    require("astricunion/libs/guns.txt")
    require("astricunion/libs/fractional_timers.txt")
    require("astricunion/holos/astro_incepter_holos.txt")

    STATES = {
        NotInUse = -1,
        Idle = 0,
        InHyperJump = 1
    }
    local state = STATES.NotInUse


    local seat = prop.createSeat(chip():getPos() + Vector(0, 0, 120), Angle(), "models/nova/airboat_seat.mdl")
    local size = Vector(300, 300, 100)
    local hitbox = prop.createCustom(
        chip():getPos() + Vector(-size.x/2, -size.y/2, -50),
        Angle(),
        {
            {
                Vector(0, 0, 0), Vector(size.x, 0, 0), Vector(size.x, size.y, 0), Vector(0, size.y, 0),
                Vector(0, 0, size.z), Vector(size.x, 0, size.z), Vector(size.x, size.y, size.z), Vector(0, size.y, size.z),
            },
        },
        true
    )
    local movement = Movement:new(seat, hitbox)

    preloadSounds(
        Sound("start", 1, false, true, "https://www.dl.dropboxusercontent.com/scl/fi/9g8sguici6u5vrqx35wpe/ChargeupGUN.mp3?rlkey=mvevntjbjc5y2ht0xmvac88kc&st=5iba01im&dl=1"),
        Sound("loop", 1, true, false, "https://www.dl.dropboxusercontent.com/scl/fi/n9tzb3v1vs6x1fayy9cig/saberamb.mp3?rlkey=usn1ur6e34g8aiuhbjie7wn0a&st=g37ivi7q&dl=1"),
        Sound("main", 1, false, false, "https://www.dl.dropboxusercontent.com/scl/fi/1rs1z4ngav46nu71xs9cs/MegaBlaster.mp3?rlkey=cvjmd7fk2gal7sjpzumnahny2&st=c5l33h07&dl=1"),
        Sound("mainReload", 1, false, false, "https://www.dl.dropboxusercontent.com/scl/fi/1hdis324ztuy26ybm99f2/AstrSHOOT1.mp3?rlkey=f3nzk6gz4qnsxcnr7dwvdos0w&st=vkytslx6&dl=1"),
        Sound("blaster", 1, false, false, "https://www.dl.dropboxusercontent.com/scl/fi/iridtegm6vcn0vrgx6mz8/Blasters.mp3?rlkey=tx18scvy2ujjbffebtrmvd8yl&st=nb1ikfyk&dl=1"),
        Sound("becomeVisible", 1, false, false, "https://www.dl.dropboxusercontent.com/scl/fi/bx55w4qmuc2h26grod8ea/Visibility.mp3?rlkey=nmoia45p94ks7u9uvll1v4hxh&st=w3npd39y&dl=1"),
        Sound("becomeInvisible", 1, false, false, "https://www.dl.dropboxusercontent.com/scl/fi/nlg2l853bkbf1iedfw0ik/Warp.mp3?rlkey=k6bm8zesxy4ievrlvnj4egz7p&st=xsxu8he7&dl=1"),
        Sound("invisibleLoop", 1, true, false, "https://www.dl.dropboxusercontent.com/scl/fi/bqkm5h2txmmyoug0pjh4f/AfterTeleport.mp3?rlkey=4merj21eyz7cshvn29llhewx7&st=d88pek29&dl=1")
    )
    timer.simple(4, function()
        playSound("start", chip():getPos())
    end)

    body.base[1]:setParent(hitbox)
    body.base[2]:setParent(body.base[1])
    body.wings.leftmain:setParent(body.base[1])
    body.wings.leftup:setParent(body.base[1])
    body.wings.leftdown:setParent(body.base[1])
    body.wings.leftblaster:setParent(body.wings.leftmain)
    body.wings.rightmain:setParent(body.base[1])
    body.wings.rightup:setParent(body.base[1])
    body.wings.rightdown:setParent(body.base[1])
    body.wings.rightblaster:setParent(body.wings.rightmain)
    body.head[1]:setParent(body.base[1])
    body.head[2]:setParent(body.head[1])
    hitbox:setPos(hitbox:getPos() + Vector(0, 0, 300))
    hitbox:setColor(Color(0, 0, 0, 0))

    local all_holos = {}
    table.insert(all_holos, body.base[1])
    table.insert(all_holos, body.wings.leftblaster)
    table.insert(all_holos, body.wings.rightblaster)
    table.add(all_holos, table.getKeys(body.base[1]:getChildren()))
    table.add(all_holos, table.getKeys(body.base[2]:getChildren()))
    table.add(all_holos, table.getKeys(body.head[1]:getChildren()))
    table.add(all_holos, table.getKeys(body.head[2]:getChildren()))
    table.add(all_holos, table.getKeys(body.wings.rightblaster:getChildren()))
    table.add(all_holos, table.getKeys(body.wings.leftblaster:getChildren()))
    -- Внимание! Анекдот: --
    --[[
    - Да у этого дебила вся семья поехавшая!
    - А откуда ты знаешь?
    - Я его брат.
    ]]-- (не смешно, извините)

    hook.add("Think", "Movement", function()
        if state ~= STATES.InHyperJump then
            stopSound("invisibleLoop")
            playSound("loop", hitbox:getPos())
        else
            stopSound("loop")
            playSound("invisibleLoop", hitbox:getPos())
        end
        local driver = seat:getDriver()
        if isValid(driver) then
            local eye_trace = driver:getEyeTrace()
            body.head[1]:setAngles(driver:getEyeAngles())
            body.head[2]:setAngles(driver:getEyeAngles())
            body.wings.rightblaster:setAngles((body.wings.rightblaster:getPos() - eye_trace.HitPos):getAngle() + Angle(-90, 0, 0))
            body.wings.leftblaster:setAngles((body.wings.leftblaster:getPos() - eye_trace.HitPos):getAngle() + Angle(-90, 0, 0))
        end
        local angs = body.base[2]:getLocalAngles()
        body.base[2]:setLocalAngles(angs:setY(angs.y + 5))
        movement:think()
    end)

    function createExplosionProj(pos, angle)
        Explosion:new(pos, angle, 3000, 300, 70, nil, 2)
    end

    function createBulletProj(pos, angle)
        Blaster:new(pos, angle)
    end

    local blaster_cooldown = 0
    local explosion_cooldown = 5
    hook.add("Think", "Shoot", function()
        if state == STATES.InHyperJump then return end
        local driver = seat:getDriver()
        if explosion_cooldown < 15 then
            explosion_cooldown = explosion_cooldown + 0.1
        end
        if blaster_cooldown < 4 then
            blaster_cooldown = blaster_cooldown + 1
        end
        if isValid(driver) then
            if driver:keyDown(IN_KEY.ATTACK2) then
                if blaster_cooldown >= 4 then
                    blaster_cooldown = 0
                else
                    return
                end
                playSound("blaster", hitbox:getPos())
                local eye_trace = driver:getEyeTrace()
                if effect.effectsLeft() > 0 then
                    createBulletProj(body.wings.rightblaster:getPos(), (eye_trace.HitPos - body.wings.rightblaster:getPos()):getAngle())
                    createBulletProj(body.wings.leftblaster:getPos(), (eye_trace.HitPos - body.wings.leftblaster:getPos()):getAngle())
                end
            end
        end
    end)


    hook.add("KeyPress", "", function(ply, key)
        if state == STATES.InHyperJump then return end
        if ply == seat:getDriver() then
            if state ~= STATES.InHyperJump then
                -- Main: Explosion --
                if key == IN_KEY.ATTACK then
                    if explosion_cooldown >= 15 then
                        explosion_cooldown = 0
                    else
                        return
                    end
                    playSound("main", hitbox:getPos())
                    local eye_trace = ply:getEyeTrace()
                    createExplosionProj(body.wings.rightblaster:getPos(), (eye_trace.HitPos - body.wings.rightblaster:getPos()):getAngle())
                    createExplosionProj(body.wings.leftblaster:getPos(), (eye_trace.HitPos - body.wings.leftblaster:getPos()):getAngle())
                    playSound("mainReload", hitbox:getPos())
                -- On reload: Radar, that's showing players on a few seconds --
                elseif key == IN_KEY.RELOAD then
                    net.start("UpdatePlayers")
                    net.send(ply)
                elseif key == IN_KEY.ALT1 then
                    timer.create("dash", 0, 20, function()
                        hitbox:addVelocity(hitbox:getForward() * 20000)
                    end)
                end
            end
        end
    end)

    hook.add("PlayerEnteredVehicle", "", function(ply, vehicle, num)
        if vehicle == seat then
            vehicle:setCollisionGroup(COLLISION_GROUP.IN_VEHICLE)
            state = STATES.Idle
            ply:setColor(Color(0, 0, 0, 0))
            net.start("OnEnter")
            net.send(ply)
        end
    end)

    hook.add("PlayerLeaveVehicle", "", function(ply, vehicle)
        if vehicle == seat then
            vehicle:setCollisionGroup(COLLISION_GROUP.VEHICLE)
            state = STATES.NotInUse
            ply:setColor(Color(255, 255, 255, 255))
            net.start("OnLeave")
            net.send(ply)
        end
    end)

    -- Idle animation --
    local base_pos = body.base[1]:getLocalPos()
    local head_pos = body.head[1]:getLocalPos()
    local head_angles = body.head[1]:getLocalAngles()
    FTimer:new(4, -1, {
        ["0-0.5"] = function(t, fraction, relative)
            local smoothed = math.easeInOutCubic(relative)
            body.base[1]:setLocalPos(base_pos + Vector(0, 0, 8 * smoothed))
            body.head[1]:setLocalPos(head_pos + Vector(-4 * smoothed, 0, 8 * smoothed))
            body.head[1]:setLocalAngles(head_angles + Angle(-2 * smoothed, 0, 0))
        end,
        ["0.5-1"] = function(t, fraction, relative)
            local smoothed = math.easeInOutCubic(1 - relative)
            body.base[1]:setLocalPos(base_pos + Vector(0, 0, 8 * smoothed))
            body.head[1]:setLocalPos(head_pos + Vector(-4 * smoothed, 0, 8 * smoothed))
            body.head[1]:setLocalAngles(head_angles + Angle(-2 * smoothed, 0, 0))
        end
    })


    local left_up_angles = body.wings.leftup:getLocalAngles()
    local left_down_angles = body.wings.leftdown:getLocalAngles()
    local right_up_angles = body.wings.rightup:getLocalAngles()
    local right_down_angles = body.wings.rightdown:getLocalAngles()

    -- Wings animation --
    function becomeInvisible()
        if state == STATES.InHyperJump then return end
        FTimer:new(1.5, 1, {
            ["0-0.75"] = function(t, fraction, relative)
                state = STATES.InHyperJump
                local smoothed = math.easeInCubic(relative)
                body.wings.leftdown:setLocalAngles(left_down_angles + Angle(0, 0, 25 * smoothed))
                body.wings.leftup:setLocalAngles(left_up_angles + Angle(0, 0, -25 * smoothed))
                body.wings.rightdown:setLocalAngles(right_down_angles + Angle(0, 0, -25 * smoothed))
                body.wings.rightup:setLocalAngles(right_up_angles + Angle(0, 0, 25 * smoothed))
            end,
            [1] = function()
                hitbox:setCollisionGroup(COLLISION_GROUP.IN_VEHICLE)
                playSound("becomeInvisible", hitbox:getPos())
                for _, v in ipairs(all_holos) do
                    v:setColor(v:getColor():setA(0))
                end
            end
        })
    end

    function becomeVisible()
        if state == STATES.Idle then return end
        playSound("becomeVisible", hitbox:getPos())
        FTimer:new(1.5, 1, {
            [0] = function()
                state = STATES.Idle
                hitbox:setCollisionGroup(COLLISION_GROUP.NONE)
                for _, v in ipairs(all_holos) do
                    v:setColor(v:getColor():setA(255))
                end
            end,
            ["0.25-1"] = function(t, fraction, relative)
                local smoothed = math.easeInCubic(1 - relative)
                body.wings.leftdown:setLocalAngles(left_down_angles + Angle(0, 0, 25 * smoothed))
                body.wings.leftup:setLocalAngles(left_up_angles + Angle(0, 0, -25 * smoothed))
                body.wings.rightdown:setLocalAngles(right_down_angles + Angle(0, 0, -25 * smoothed))
                body.wings.rightup:setLocalAngles(right_up_angles + Angle(0, 0, 25 * smoothed))
            end
        })
    end

    net.receive("Invisible", function()
        if body.base[1]:getColor().a > 0 then
            becomeInvisible()
        else
            becomeVisible()
        end
    end)
else
    --@include astricunion/libs/ui.txt
    require("astricunion/libs/ui.txt")

    local sw, sh
    local health_bar
    local esp_bar
    local players_positions = {}
    local radar_cooldown = 0


    timer.create("RadarIncrease", 0, 0, function()
        if radar_cooldown < 1 then
            radar_cooldown = radar_cooldown + 0.005
        end
    end)

    function createHud()
        local fontMontserrat24 = render.createFont(
            "Montserrat",
            24,
            500,
            true,
            false,
            false,
            false,
            0,
            true,
            0
        )

        hook.add("DrawHUD", "", function()
            sw, sh = render.getGameResolution()

            ---- Aim ----
            local eye_trace = player():getEyeTrace()
            local pos = eye_trace.HitPos
            local dist = player():getPos():getDistance(pos)
            local size = 20000 / dist

            render.drawRectOutline(sw / 2 - size / 2, sh / 2 - size / 2, size, size, 2)
            render.drawCircle(sw / 2, sh / 2, 1)
            render.setFont(fontMontserrat24)
            render.drawText(sw / 2, sh / 2, tostring(math.round(dist)) .. " units")

            ---- HP bar ----
            local health = player():getHealth() / player():getMaxHealth()
            if not health_bar then
                health_bar = Bar:new(sw * 0.2, sh * 0.8, 200, 30, 1)
                    :setLabelLeft("HP")
            end
            local current = health_bar.current_percent
            health_bar:setPercent(health)
                :setLabelRight(tostring(math.round(current * 100)) .. "%")
                :setBarColor(Color(255, 255, 255, 255) * Color(1, current, current, 1))
            health_bar:draw()

            ---- ESP ----
            render.setColor(Color(255, 255, 255, 255 * (1 - math.clamp(radar_cooldown, 0, 1))))
            for _, ply_pos in ipairs(players_positions) do
                local pos = ply_pos:toScreen()
                local distance = player():getPos():getDistance(ply_pos)
                render.drawCircle(pos.x, pos.y, 20000 / distance)
            end

            render.setColor(Color(255, 255, 255))
            ---- ESP bar ----
            if not esp_bar then
                esp_bar = Bar:new(sw * 0.8 - 200, sh * 0.8, 200, 30, 1)
                    :setLabelRight("RDR")
            end
            esp_bar:setPercent(radar_cooldown)
                :setLabelLeft(tostring(math.round(esp_bar.current_percent * 100)) .. "%")
            esp_bar:draw()
        end)

        hook.add("CalcView", "", function(pos, ang, fov, znear, zfar)
            return {
                origin = pos + ang:getForward() * 128,
                angles = ang,
                fov = 120
            }
        end)

        hook.add("InputPressed", "", function(key)
            -- Invisible --
            if key == KEY.F then
                net.start("Invisible")
                net.send()
            end
        end)
    end

    function removeHud()
        hook.remove("DrawHUD", "")
        hook.remove("CalcView", "")
        hook.remove("InputPressed", "")
    end

    net.receive("OnEnter", function()
        timer.simple(2, function()
            enableHud(player(), true)
            createHud()
        end)
    end)

    net.receive("OnLeave", function()
        enableHud(player(), false)
        removeHud()
    end)

    net.receive("UpdatePlayers", function()
        players_positions = {}
        radar_cooldown = -0.5
        local plys = find.allPlayers(function(x) return x ~= owner() end)
        for _, ply in ipairs(plys) do
            table.insert(players_positions, ply:obbCenterW())
        end
    end)
end
