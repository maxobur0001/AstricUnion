--@name Astro Incepter Model
--@author Astric Union
--@shared

--[[ Holos ]]--
--@include astricunion/libs/holos.txt


if SERVER then
    require("astricunion/libs/holos.txt")
    body = {
        base = {
            hologram.createPart(
                Holo(SubHolo(nil,nil,"models/props_phx/trains/wheel_medium.mdl",Vector(4.25,4.25,1.5),false,Color(255,40,40))),
                Holo(SubHolo(Vector(150,0,-40),nil,"models/props_combine/combine_barricade_med02a.mdl",nil,false,Color(255,40,40))),
                Holo(SubHolo(Vector(120,90,-47),Angle(0,30,0),"models/props_combine/combine_barricade_tall03a.mdl",Vector(0.75,0.75,0.75),false,Color(255,40,40))),
                Holo(SubHolo(Vector(120,-90,-47),Angle(0,-30,0),"models/props_combine/combine_barricade_tall04a.mdl",Vector(0.75,0.75,0.75),false,Color(255,40,40))),
                Holo(SubHolo(Vector(150,0,-10),Angle(-90,0,0),"models/combine_turrets/ground_turret.mdl",Vector(3,4,5),false,Color(255,40,40))),
                Holo(SubHolo(Vector(300,0,-30),nil,"models/props_combine/combine_emitter01.mdl",Vector(5,5,3),false,Color(255,40,40))),
                Holo(SubHolo(Vector(-120,0,0),Angle(0,180,0),"models/props_combine/combineinnerwallcluster1024_001a.mdl",Vector(0.2,0.1,0.09),false,Color(255,40,40))),
                Holo(SubHolo(Vector(-105,90,0),Angle(0,160,0),"models/props_combine/combineinnerwallcluster1024_001a.mdl",Vector(0.2,0.1,0.09),false,Color(255,40,40))),
                Holo(SubHolo(Vector(-105,-90,0),Angle(0,-160,0),"models/props_combine/combineinnerwallcluster1024_001a.mdl",Vector(0.2,0.1,0.09),false,Color(255,40,40))),
                Holo(SubHolo(Vector(-100,0,-30),Angle(0,180,0),"models/props_combine/combine_barricade_tall02b.mdl",Vector(2.2,2,0.5),false,Color(255,40,40))),
                Holo(SubHolo(Vector(-20,0,-50),Angle(130,0,0),"models/props_combine/combineinnerwallcluster1024_003a.mdl",Vector(0.15,0.15,0.14),false,Color(255,40,40))),
                Holo(SubHolo(Vector(20,0,-50),Angle(130,180,0),"models/props_combine/combineinnerwallcluster1024_003a.mdl",Vector(0.15,0.15,0.14),false,Color(255,40,40)))
            ),
            hologram.createPart(
                Holo(SubHolo(Vector(0,0,15),Angle(90,0,0),"models/props_c17/pulleywheels_large01.mdl",Vector(5,5.75,5.75),false,Color(255,40,40))),
                Holo(SubHolo(Vector(60,0,18),Angle(5,-5,-45),"models/Gibs/helicopter_brokenpiece_03.mdl",Vector(2,2,2),false,Color(255,40,40))),
                Holo(SubHolo(Vector(-60,0,18),Angle(5,175,-45),"models/Gibs/helicopter_brokenpiece_03.mdl",Vector(2,2,2),false,Color(255,40,40))),
                Holo(SubHolo(Vector(0,60,18),Angle(5,85,-45),"models/Gibs/helicopter_brokenpiece_03.mdl",Vector(2,2,2),false,Color(255,40,40))),
                Holo(SubHolo(Vector(0,-60,18),Angle(5,-95,-45),"models/Gibs/helicopter_brokenpiece_03.mdl",Vector(2,2,2),false,Color(255,40,40)))
            )
        },
        head = {
            hologram.createPart(
                Holo(SubHolo(Vector(0,0,150),nil,"models/holograms/hq_sphere.mdl",Vector(12,12,12),true,Color(0,0,0),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(54,0,150),nil,"models/holograms/hq_sphere.mdl",Vector(3,7.5,7.5),true,Color(255,40,40),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(60,0,150),nil,"models/holograms/hq_sphere.mdl",Vector(3,1,6),true,Color(255,255,255),"models/debug/debugwhite"))
            ),
            hologram.createPart(
                Holo(SubHolo(Vector(-40,0,150))),
                Holo(SubHolo(Vector(-40,0,150),Angle(275,180,0),"models/props_combine/combine_booth_short01a.mdl",Vector(1.1,1.25,1.25),false,Color(255,40,40))),
                Holo(SubHolo(Vector(-20,0,125),Angle(35,180,0),"models/props_combine/combine_booth_short01a.mdl",Vector(1,1.15,1.15),false,Color(255,40,40))),
                Holo(SubHolo(Vector(5,0,125),Angle(-25,180,0),"models/props_combine/combine_booth_short01a.mdl",Vector(1,1.16,0.6),false,Color(255,40,40))),
                Holo(SubHolo(Vector(-65,0,200),Angle(-90,90,90),"models/Items/combine_rifle_ammo01.mdl",Vector(5,5,15),false,Color(255,40,40))),
                Holo(SubHolo(Vector(40,-45,175),Angle(0,180,-90),"models/items/battery.mdl",Vector(3,8,7),false,Color(255,40,40))),
                Holo(SubHolo(Vector(40,45,175),Angle(0,180,90),"models/items/battery.mdl",Vector(3,8,7),false,Color(255,40,40)))
            )
        },
        wings = {
            leftmain = hologram.createPart(
                Holo(SubHolo(Vector(-50,100,0))),
                Holo(SubHolo(Vector(0,100,0),Angle(0,0,-90),"models/props_combine/combine_emitter01.mdl",Vector(6,10,25),false,Color(255,40,40)))
            ),
            leftup = hologram.createPart(
                Holo(SubHolo(Vector(-50,100,10))),
                Holo(SubHolo(Vector(0,70,-10),Angle(0,0,-60),"models/props_combine/combine_emitter01.mdl",Vector(5,5,22),false,Color(255,40,40)))
            ),
            leftdown = hologram.createPart(
                Holo(SubHolo(Vector(-50,100,-10))),
                Holo(SubHolo(Vector(0,70,10),Angle(0,0,-120),"models/props_combine/combine_emitter01.mdl",Vector(5,5,22),false,Color(255,40,40)))
            ),
            leftblaster = hologram.createPart(
                Holo(SubHolo(Vector(-80,-480,-30),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.37,0.37,9),false,Color(255,40,40),"models/props_combine/metal_combinebridge001")),
                Holo(SubHolo(Vector(-50,-480,-30),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.32,0.32,12),false,Color(255,40,40),"models/props_combine/metal_combinebridge001")),
                Holo(SubHolo(Vector(-25,-480,-30),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.24,0.24,10),true,Color(100,20,20),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(-18,-480,-18),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.03,0.03,10),true,Color(255,0,0),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(-18,-469,-24),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.03,0.03,10),true,Color(255,0,0),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(-18,-491,-24),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.03,0.03,10),true,Color(255,0,0),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(-18,-491,-36),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.03,0.03,10),true,Color(255,0,0),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(-18,-469,-36),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.03,0.03,10),true,Color(255,0,0),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(-18,-480,-42),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.03,0.03,10),true,Color(255,0,0),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(0,-480,-30),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.35,0.35,8),false,Color(255,40,40),"models/props_combine/metal_combinebridge001")),
                Holo(SubHolo(Vector(-80,-480,-30),Angle(-90,0,0),"models/props_phx/gears/spur12.mdl",Vector(1.4,1.4,3.8),false,Color(255,40,40),"models/props_combine/metal_combinebridge001")),
                Holo(SubHolo(Vector(20,-480,-30),Angle(-90,0,0),"models/props_phx/gears/spur12.mdl",Vector(1.2,1.2,2),false,Color(255,40,40),"models/props_combine/metal_combinebridge001")),
                Holo(SubHolo(Vector(20,-480,-30),Angle(-90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.12,0.12,1),true,Color(255,0,0),"models/debug/debugwhite"))
            ),
            rightmain = hologram.createPart(
                Holo(SubHolo(Vector(-50,-100,0))),
                Holo(SubHolo(Vector(0,-100,0),Angle(0,0,90),"models/props_combine/combine_emitter01.mdl",Vector(6,10,25),false,Color(255,40,40)))
            ),
            rightup = hologram.createPart(
                Holo(SubHolo(Vector(-50,-100,10))),
                Holo(SubHolo(Vector(0,-70,-10),Angle(0,0,60),"models/props_combine/combine_emitter01.mdl",Vector(5,5,22),false,Color(255,40,40)))
            ),
            rightdown = hologram.createPart(
                Holo(SubHolo(Vector(-50,-100,-10))),
                Holo(SubHolo(Vector(0,-70,10),Angle(0,0,120),"models/props_combine/combine_emitter01.mdl",Vector(5,5,22),false,Color(255,40,40)))
            ),
            rightblaster = hologram.createPart(
                Holo(SubHolo(Vector(-80,480,-30),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.37,0.37,9),false,Color(255,40,40),"models/props_combine/metal_combinebridge001")),
                Holo(SubHolo(Vector(-50,480,-30),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.32,0.32,12),false,Color(255,40,40),"models/props_combine/metal_combinebridge001")),
                Holo(SubHolo(Vector(-25,480,-30),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.24,0.24,10),true,Color(100,20,20),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(-18,480,-18),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.03,0.03,10),true,Color(255,0,0),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(-18,469,-24),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.03,0.03,10),true,Color(255,0,0),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(-18,491,-24),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.03,0.03,10),true,Color(255,0,0),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(-18,491,-36),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.03,0.03,10),true,Color(255,0,0),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(-18,469,-36),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.03,0.03,10),true,Color(255,0,0),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(-18,480,-42),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.03,0.03,10),true,Color(255,0,0),"models/debug/debugwhite")),
                Holo(SubHolo(Vector(0,480,-30),Angle(90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.35,0.35,8),false,Color(255,40,40),"models/props_combine/metal_combinebridge001")),
                Holo(SubHolo(Vector(-80,480,-30),Angle(-90,0,0),"models/props_phx/gears/spur12.mdl",Vector(1.4,1.4,3.8),false,Color(255,40,40),"models/props_combine/metal_combinebridge001")),
                Holo(SubHolo(Vector(20,480,-30),Angle(-90,0,0),"models/props_phx/gears/spur12.mdl",Vector(1.2,1.2,2),false,Color(255,40,40),"models/props_combine/metal_combinebridge001")),
                Holo(SubHolo(Vector(20,480,-30),Angle(-90,0,0),"models/hunter/tubes/circle2x2.mdl",Vector(0.12,0.12,1),true,Color(255,0,0),"models/debug/debugwhite"))
            )
        }
    }
else
    
end
