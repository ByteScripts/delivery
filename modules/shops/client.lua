---@param point CPoint;
local function onEnterShopArea(point)
    if point.entity then return end

    local pedData = point.pedData
    if not pedData then return end

    local entity = Client.spawnPed({
        model = pedData.ped.model,
        animation = pedData.ped.animation,
        position = pedData.position.xyz,
    })

    if not entity then return end
    exports.ox_target:addLocalEntity(entity, {
        {
            label = 'Affenarsch',
            icon = 'fas fa-utensils',
        }
    })

    point.entity = entity
end

local function onExitShopArea(point)
    local entity = point.entity
    if not entity then return end

    exports.ox_target:removeLocalEntity(entity)

    Client.DeleteEntity(entity)

    point.entity = nil
end

for _, data in pairs(lib.load('data.restaurants') --[[@as table<string, RawRestaurant>]]) do
    lib.points.new({
        coords = data.coords.xyz,
        distance = 60,
        pedData = {
            ped = data.ped,
            position = data.coords,
        },
        onEnter = onEnterShopArea,
        onExit = onExitShopArea
    })

    if Shared.debugMode then
        Client.createBlip({
            color = 0,
            id = 1,
            name = 'Restaurant',
            ---@type vector3
            position = data.coords.xyz,
            scale = .69,
        })
    end
end