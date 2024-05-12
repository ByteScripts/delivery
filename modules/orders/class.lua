---@class Order : OxClass
---@field order { restaurant: FormatedRestaurant, products: Product[] }
local Order = lib.class('Order')

local MIN_PRODUCTS_PER_ORDER <const> = 3
local MAX_PRODUCTS_PER_ORDER <const> = 7

---@return { restaurant: string, products: Product[] }
local function generateRandomOrder()
    ---@type string, FormatedRestaurant
    local restaurant, restaurantData = Shared.getRandomElement(Restaurants)
    local randomProducts, productsCount = {}, math.random(MIN_PRODUCTS_PER_ORDER, MAX_PRODUCTS_PER_ORDER)

    local restaurantProductCount = Shared.getArraySize(restaurantData.products)
    if productsCount > restaurantProductCount then productsCount = restaurantProductCount end

    for _ = 1, productsCount do
        ---@type Product | nil
        local _, product = Shared.getRandomElement(restaurantData.products)
        if product then
            local key = Shared.generateKey(restaurant, product.label)
            if randomProducts[key] then productsCount = productsCount + 1 end

            randomProducts[key] = product
        end
    end

    return {
        restaurant = restaurant,
        products = randomProducts
    }
end

function Order:constructor(order)
    if not order then order = generateRandomOrder() end
    self.order = order
end

return Order