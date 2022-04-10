--------------------Developed = BabyDrill#7768--------------------
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

--| Blip |--
Citizen.CreateThread(function()
	for i=1, #Config.BlipAcquistaGiub, 1 do
		local blip = AddBlipForCoord(Config.BlipAcquistaGiub[i].x, Config.BlipAcquistaGiub[i].y, Config.BlipAcquistaGiub[i].z)
		SetBlipSprite(blip, 461)
		SetBlipColour(blip, 3)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		SetBlipScale(blip, 0.7)
		AddTextComponentString(Lang.blip_shop)
		EndTextCommandSetBlipName(blip)
	end
end)
--| Parte 1 |--
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(10)

		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)
			
		for i=1, #Config.BlipAcquistaGiub, 1 do
			if GetDistanceBetweenCoords(coords, Config.BlipAcquistaGiub[i].x, Config.BlipAcquistaGiub[i].y, Config.BlipAcquistaGiub[i].z, true) < 6.0 then
			  DrawMarker(21, Config.BlipAcquistaGiub[i].x, Config.BlipAcquistaGiub[i].y, Config.BlipAcquistaGiub[i].z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.2, 0.2, 0.2, 255, 255, 255, 255, false, true, 2, nil, nil, false)
				if GetDistanceBetweenCoords(coords, Config.BlipAcquistaGiub[i].x, Config.BlipAcquistaGiub[i].y, Config.BlipAcquistaGiub[i].z, true) < 2.0 then
					ESX.ShowHelpNotification(Lang.indicatore_tasto)
					if IsControlJustReleased(1, 51) then
						BabyGiubbotto()
					end
				end
			end
		end
	end
end)
--| Parte 2 |--
function BabyGiubbotto()
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'giubbotto_armeria',
	  {
		  title    = 'Giubbotti Antiproiettile',
		  align = 'bottom-right',
		  elements = {
			  {label = Lang.giubbotto1, value = 'giubbottoleggero'},
			  {label = Lang.giubbotto2, value = 'giubbottomedio'},
			  {label = Lang.giubbotto3, value = 'giubbottopesante'},
			
		  }
	  },
	  function(data, menu)
		local val = data.current.value
		  
		if val == 'giubbottoleggero' then
			ESX.UI.Menu.CloseAll()	
			TriggerServerEvent("giubbotto_1")	
		elseif val == 'giubbottomedio' then
			ESX.UI.Menu.CloseAll()
			TriggerServerEvent("giubbotto_2")
		elseif val == 'giubbottopesante' then
			ESX.UI.Menu.CloseAll()
			TriggerServerEvent("giubbotto_3")	
		end
	  end,
	  function(data, menu)
		  menu.close()
	  end)
end
--| Parte 3 |--
RegisterNetEvent('giubbottoleggero')
AddEventHandler('giubbottoleggero', function()
	ESX.ShowNotification(Lang.giub_leggero)
	AddArmourToPed(GetPlayerPed(-1), 25)
end)

RegisterNetEvent('giubbottomedio')
AddEventHandler('giubbottomedio', function()
	ESX.ShowNotification(Lang.giub_medio)
	AddArmourToPed(GetPlayerPed(-1), 50)
end)

RegisterNetEvent('giubbototopesante')
AddEventHandler('giubbototopesante', function()
	ESX.ShowNotification(Lang.giub_pesante)
	AddArmourToPed(GetPlayerPed(-1), 100)
end)

RegisterNetEvent('giubbottogg')
AddEventHandler('giubbottogg', function()
	AddArmourToPed(GetPlayerPed(-1), 100)
end)
--------------------Developed = BabyDrill#7768--------------------