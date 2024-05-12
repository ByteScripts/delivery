if not lib then return end

---@type table<string, Product>, table<string, {label: string, position: vector3, categories: string[], products: table<string, Product>}>
Products, Restaurants = table.unpack(require 'modules.shops.server')

Server.currentOrders = {}

require 'modules.orders.server'