--@name astro_juggernaut_hologram_ball
--@author [A . U . T] Serian Model N
--@shared

--@include astricunion/libs/holos.txt

if SERVER then
    require("astricunion/libs/holos.txt")
    starfall_holo = {
        base = {
            hologram.createPart(
                Holo(SubHolo(Vector(0,0,0), Angle(0,0,90), "models/holograms/hq_sphere.mdl", Vector(-10,-10,-10), true, Color(255,25,25))),
                Holo(SubHolo(Vector(0,0,0), Angle(0,0,0), "models/holograms/hq_sphere.mdl", Vector(-7,-7,-7), true, Color(255,75,75))),
                Holo(SubHolo(Vector(0,0,0), Angle(0,0,0), "models/holograms/hq_sphere.mdl", Vector(-5,-5,-5), true, Color(255,125,125))),
                Holo(SubHolo(Vector(0,0,0), Angle(0,0,0), "models/holograms/hq_sphere.mdl", Vector(-3,-3,-3), true, Color(255,175,175))),
                Holo(SubHolo(Vector(0,0,0), Angle(0,0,0), "models/holograms/hq_sphere.mdl", Vector(1,1,1), true, Color(255,255,255)))
            )
        },
        
    }
else
    --   ( )
end