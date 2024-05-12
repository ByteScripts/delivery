local Order = require 'modules.orders.class'

CreateThread(function()
    local order = Order:new()
    print(json.encode(order, { indent = true }))
end)