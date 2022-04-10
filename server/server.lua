--------------------Developed = BabyDrill#7768--------------------
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('giubbotto_1')
AddEventHandler('giubbotto_1', function()
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
            if xPlayer.getMoney() >= Config.PrezzoGiubLeggero then
                xPlayer.removeMoney(Config.PrezzoGiubLeggero)
                TriggerClientEvent("giubbottoleggero", source)
                TriggerClientEvent('esx:showNotification', source, Lang.pag_soldi)
            elseif xPlayer.getAccount('bank').money >= Config.PrezzoGiubLeggero then
                xPlayer.removeAccountMoney('bank', Config.PrezzoGiubLeggero)
                TriggerClientEvent("giubbottoleggero", source)
                TriggerClientEvent('esx:showNotification', source, Lang.pag_carta)
            else
                TriggerClientEvent('esx:showNotification', source, Lang.no_soldi)
            end
        end)

RegisterNetEvent('giubbotto_2')
AddEventHandler('giubbotto_2', function()
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
            if xPlayer.getMoney() >= Config.PrezzoGiubMedio then
                xPlayer.removeMoney(Config.PrezzoGiubMedio)
                TriggerClientEvent("giubbottomedio", source)
                TriggerClientEvent('esx:showNotification', source, Lang.pag_soldi)
            elseif xPlayer.getAccount('bank').money >= Config.PrezzoGiubMedio then
                xPlayer.removeAccountMoney('bank', Config.PrezzoGiubMedio)
                TriggerClientEvent("giubbottomedio", source)
                TriggerClientEvent('esx:showNotification', source, Lang.pag_carta)
            else
                TriggerClientEvent('esx:showNotification', source, Lang.no_soldi)
            end
        end)

RegisterNetEvent('giubbotto_3')
AddEventHandler('giubbotto_3', function()
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
            if xPlayer.getMoney() >= Config.PrezzoGiubPesante then
                xPlayer.removeMoney(Config.PrezzoGiubPesante)
                TriggerClientEvent("giubbototopesante", source)
                TriggerClientEvent('esx:showNotification', source, Lang.pag_soldi)
            elseif xPlayer.getAccount('bank').money >= Config.PrezzoGiubPesante then
                xPlayer.removeAccountMoney('bank', Config.PrezzoGiubPesante)
                TriggerClientEvent("giubbototopesante", source)
                TriggerClientEvent('esx:showNotification', source, Lang.pag_carta)
            else
                TriggerClientEvent('esx:showNotification', source, Lang.no_soldi)
            end
        end)
--------------------Developed = BabyDrill#7768--------------------