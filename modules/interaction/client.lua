local function changeDutyStatus()
    local newState = not LocalPlayer.state.isDeliveryDriver

    LocalPlayer.state:set('isDeliveryDriver', newState, true)
    lib.notify({
        title = 'Delivery',
        description = newState and 'You are now **on duty**.' or 'You are now **off duty**.'
    })
end

lib.addKeybind({
    name = 'delivery-main-menu',
    description = 'Open Menu',
    defaultMapper = 'keyboard',
    defaultKey = 'F7',
    onReleased = Menu.openMainMenu
})

return {
    changeDutyStatus = changeDutyStatus
}