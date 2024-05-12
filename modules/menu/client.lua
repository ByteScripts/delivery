local menuIds = {
    mainMenu = 'delivery_system_main_menu'
}

local function openMainMenu()
    ---@type ContextMenuArrayItem[]|{ [string]: ContextMenuItem } { [string]: ContextMenuItem }
    local options = LocalPlayer.state.isDeliveryDriver and {
        {
            icon = 'fas fa-sign-out-alt',
            title = 'Go off duty',
            description = 'Stop working as a delivery driver.',
            onSelect = Interaction.changeDutyStatus
        }
    } or {
        {
            icon = 'fas fa-sign-in-alt',
            title = 'Go on duty',
            description = 'Start working as a delivery driver.',
            onSelect = Interaction.changeDutyStatus
        }
    }

    lib.registerContext({
        id = menuIds.mainMenu,
        title = locale('menu.main-menu.title'),
        options = options
    })
    lib.showContext(menuIds.mainMenu)
end

return {
    openMainMenu = openMainMenu
}