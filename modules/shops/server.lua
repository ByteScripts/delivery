---@type table<string, Product>
local products = {}

---@type table<string, {label: string, position: vector3, categories: string[], products: table<string, Product>}>
local restaurants = {}

for key, data in pairs(lib.load('data.restaurants') --[[@as table<string, RawRestaurant>]]) do
    for _, product in pairs(data.products) do
        local productKey = Shared.generateKey(key, product.label)

        local productData = {
            label = product.label,
            price = product.price,
            item = product.item,
        }

        products[productKey] = productData

        if not restaurants[key] then
            restaurants[key] = {
                label = data.label,
                position = data.coords,
                categories = data.categories,
                products = {},
            }
        end

        restaurants[key].products[productKey] = productData
    end
end

return { products, restaurants }