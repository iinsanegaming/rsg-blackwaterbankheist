local RSGCore = exports['rsg-core']:GetCoreObject()

-- give reward
RegisterServerEvent('rsg-bwbankheist:server:reward')
AddEventHandler('rsg-bwbankheist:server:reward', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
	local chance = math.random(1,100)
	if chance <= 50 then
		local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		local item3 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		-- add items
        Player.Functions.AddItem(item1, Config.SmallRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item1], "add")
		Player.Functions.AddItem(item2, Config.SmallRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item2], "add")
		Player.Functions.AddItem(item3, Config.SmallRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item3], "add")
		lib.notify({ title = 'Loot Reward', description = 'Small loot reward this time!', type = 'primary', duration = 5000 })
	elseif chance >= 50 and chance <= 80 then -- medium reward
		local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		local item3 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		-- add items
        Player.Functions.AddItem(item1, Config.MediumRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item1], "add")
		Player.Functions.AddItem(item2, Config.MediumRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item2], "add")
		Player.Functions.AddItem(item3, Config.MediumRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item3], "add")
		lib.notify({ title = 'Loot Reward', description = 'Medium loot reward this time!', type = 'primary', duration = 5000 })
	elseif chance > 80 then -- large reward
		local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		local item3 = Config.RewardItems[math.random(1, #Config.RewardItems)]
		-- add items
        Player.Functions.AddItem(item1, Config.LargeRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item1], "add")
		Player.Functions.AddItem(item2, Config.LargeRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item2], "add")
		Player.Functions.AddItem(item3, Config.LargeRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item3], "add")
		Player.Functions.AddMoney(Config.MoneyRewardType, Config.MoneyRewardAmount, "bank-heist")
		lib.notify({ title = 'Loot Reward', description = 'Large loot reward this time!', type = 'primary', duration = 5000 })
		Wait(5000)
		lib.notify({
    title = 'Loot Reward',
    description = 'Additional ' .. Config.MoneyRewardAmount .. ' ' .. Config.MoneyRewardType .. ' looted!',
    type = 'primary',
    duration = 5000
})

	end
end)

-- remove item
RegisterNetEvent('rsg-bwbankheist:server:removeItem', function(item, amount)
	local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
	TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item], "remove")
end)
