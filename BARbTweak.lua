--Jammer, air, nuke restriction
local restricted = {
    -- air
    corcrwh = 0,
    legfort = 0,
    armliche = 1,
    armsb = 3,
    corsb = 3,
    armblade = 3,
    corape = 3,
    corhurc = 3,
    armpnix = 3,
    armsaber = 5,
    corcut = 5,
    armbrawl = 5,
    armkam = 5,
    armdfly = 5,
    armthund = 5,
    corshad = 5,
    corbw = 50,
    legmos = 10,
    legmineb = 5,
    legphoenix = 3,
    legnap = 3,
    legkam = 10,
    legstronghold = 3,

    -- nukes
    armsilo = 3,
    corsilo = 3,
    legsilo = 3,
}

for name, ud in pairs(UnitDefs) do

    -- disable jamming
    if ud.radardistancejam and ud.radardistancejam>0 then
        ud.radardistancejam = 0
        ud.stealth = true
    end

    -- restrict unit amount
    for restrictedName, amount in pairs(restricted) do
        if name == restrictedName then
            ud.maxthisunit = amount
        end
    end

    -- make walls more expensive (looks like you need a gadget to make the ai attack them)
    if name == "armfort" or name == "armdrag" or name == "corfort" or name == "cordrag" then
        ud.metalcost = ud.metalcost * 5
    end

    -- tick speed nerf
    if name == "armflea" then
        ud.speed = 112
    end

    -- platypus los nerf
    if name == "armamph" then
        ud.sightdistance = 300
    end
end