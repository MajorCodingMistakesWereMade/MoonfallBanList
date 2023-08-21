local Commands2 = {}


local HttpsService = game:GetService("HttpService")
local json = HttpsService:GetAsync("https://api.github.com/repos/MajorCodingMistakesWereMade/MoonfallBanList/blob/main/bans.json") -- <-- seems to be issue
local jsonDecoded = HttpsService:JSONDecode(json)
local players = game:GetService("Players")
local BanList = jsonDecoded.banned:GetChildren()

--userID, BanReason

function Commands2.IsBanned(player:Player)
	local ID = players:GetUserIdFromNameAsync(player)
	for i in pairs(BanList) do
		if ID == i.userID then
			player:Kick(i.BanReason)
		end
	end
end

return Commands2
