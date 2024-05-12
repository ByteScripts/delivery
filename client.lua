if not lib then return end

Client = {}

Web = require 'modules.web.client'
Menu = require 'modules.menu.client'
Interaction = require 'modules.interaction.client'

---@param data Ped;
---@return number?
function Client.spawnPed(data)
    local model = lib.requestModel(data.model)
    if not model then return end

    local coords = data.position
    local entity = CreatePed(0, model, coords.x, coords.y, coords.z, coords.w, false, true)
    if not DoesEntityExist(entity) then return lib.print.warn(("ped with model '%s' could not be created at '%s'."):format(model, tostring(coords))) end

    local animation = data.animation
    if animation and animation.dict then
        lib.requestAnimDict(animation.dict)
        TaskPlayAnim(entity, animation.dict, animation.name, 8.0, 0.0, -1, animation.flag, 0, false, false, false)
    elseif animation and animation.name then
        TaskStartScenarioInPlace(entity, animation.name, 0, true)
    end

    SetModelAsNoLongerNeeded(model)
    FreezeEntityPosition(entity, true)
    SetEntityInvincible(entity, true)
    SetBlockingOfNonTemporaryEvents(entity, true)

    return entity
end

---@param data Blip;
---@return number?;
function Client.createBlip(data)
    local coords = data.position
    if not coords then return lib.print.warn(("blip with name '%s' could not be created because of invalid position!"):format(data.name)) end

    local createdBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
    if not createdBlip then return end

    SetBlipSprite(createdBlip, data.id)
    SetBlipScale(createdBlip, data.scale or 1)
    SetBlipColour(createdBlip, data.color)
    SetBlipAsShortRange(createdBlip, data.shortRange == nil and true or data.shortRange --[[@as boolean]])
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(data.name)
    EndTextCommandSetBlipName(createdBlip)

    return createdBlip
end

---@param entity number;
function Client.DeleteEntity(entity)
    if DoesEntityExist(entity) then
        SetEntityAsMissionEntity(entity, false, true)
        DeleteEntity(entity)
    end
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
    ESX.PlayerLoaded = false
    ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

LocalPlayer.state:set('isDeliveryDriver', false, true)

require 'modules.shops.client'
require 'modules.interaction.client'