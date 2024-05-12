local isOpen = false

---@param data UIData;
local function open(data)
    data.locales = {
        title = locale('ui.order'),
        orderHistory = locale('ui.orderHistory'),
        statistics = locale('ui.statistics')
    }

    SendNUIMessage({
        action = 'setData',
        data = data
    })
    SetNuiFocus(true, true)
end

local function close()
    if not isOpen then return lib.print.debug('tried to close ui but it is not open') end

    SendNUIMessage({ action = 'setData', data = nil })
    SetNuiFocus(false, false)

    isOpen = false
end

return {
    open = open,
    close = close
}