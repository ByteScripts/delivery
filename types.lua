---@alias PedAnimationData { name: string }|{ dict: string, name: string, flag: number? }|nil;

---@class Blip
---@field id number;
---@field shortRange boolean? Defaults to true;
---@field scale number? Defaults to 1.0;
---@field position vector4?;
---@field color number;
---@field name string;

---@class Ped
---@field model string|number;
---@field position vector4;
---@field animation PedAnimationData;

---@class RawRestaurant
---@field label string;
---@field categories string[];
---@field coords vector4;
---@field ped { model: string|number, animation: PedAnimationData };
---@field products { label: string, price: number, item: string }[];

---@class UIData
---@field locales { title: string, orderHistory: string, statistics: string }?;
---@field orderId string;
---@field currentStatus string;
---@field orderHistory { title: string, subtitle: string, content: string, active: boolean }[];
---@field statistics { value: string, color: string }[];

---@class Product
---@field label string;
---@field price number;
---@field item string?;

---@alias FormatedRestaurant {label: string, position: vector3, categories: string[], products: table<string, Product>}