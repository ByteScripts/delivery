Shared = {
    debugMode = GetConvarInt('delivery:debug', 1) == 1,
}

---@return any, any
function Shared.getRandomElement(array)
    local keys = {}

    for key in pairs(array) do
        table.insert(keys, key)
    end

    local key = keys[math.random(#keys)]
    return key, array[key]
end

function Shared.getArraySize(array)
    local count = 0
    for _ in pairs(array) do count = count + 1 end

    return count
end


function Shared.generateKey(restaurantKey, label)
    return ('%s:%s'):format(restaurantKey, label:lower():gsub(' ', '_'))
end

if IsDuplicityVersion() then Server = {} else Client = {} end

if not lib then return error('ox_lib was not found. Please make sure it is installed and started.') end

---@diagnostic disable-next-line: missing-parameter
lib.locale()
if lib.context == 'server' then return require 'server' end

require 'client'