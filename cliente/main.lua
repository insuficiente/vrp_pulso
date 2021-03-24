--[[
   _____ .__                      _____.__       .__               __          
  / ___ \|__| ____   ________ ___/ ____\__| ____ |__| ____   _____/  |_  ____  
 / / ._\ \  |/    \ /  ___/  |  \   __\|  |/ ___\|  |/ __ \ /    \   __\/ __ \ 
<  \_____/  |   |  \\___ \|  |  /|  |  |  \  \___|  \  ___/|   |  \  | \  ___/ 
 \_____\ |__|___|  /____  >____/ |__|  |__|\___  >__|\___  >___|  /__|  \___  >
                 \/     \/                     \/        \/     \/          \/ 

[ PERMISSÕES PARA ADMIN E SAMU/EMS DEVEM SER ALTERADAS NO ARQUIVO CONFIG.LUA! ]
[ SCRIPT PARA VER PULSO DO PLAYER DEITADO MAIS PRÓXIMO. FEITO PARA SAMU/EMS ]

- Os scripts podem ser encontrados na nossa comunidade pelo Discord ou GitHub. Links abaixo.
- Não aceite scripts caros, você pode nos contatar para fazer um plugin por um preço acessível.

Links para a nossa comunidade! 🙂
{
	"GitHub": "https://github.com/insuficiente",
	"Discord": "https://discord.gg/Exjftynpe9"	
}

Atualização: 12/03/2021 | v1.21.1

Não tente revender este script/plugin, é totalmente feito pela nossa comunidade e não por você.
Seria bem feio da sua parte vender um plugin gratuito, hein?

DESEJAMOS UM ÓTIMO ROLEPLAY PARA A SUA CIDADE. ESPERAMOS QUE OS SEUS PLAYERS TENHAM A MELHOR EXPERIÊNCIA COM OS NOSSOS SCRIPTS.
]]
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Pulso = module('vrp_pulso', 'config')

vRP = Proxy.getInterface("vRP")
tempo_dividir = (Pulso.Tempo_Respawn / 3)
tempo_respawn = {}

-- Créditos para xander1998(https://forum.cfx.re/t/get-nearest-player-to-ped/157309/3)
-- Thanks for helping us with that function, hope you see it <3
function GetPedInFront()
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 1.0, 12, plyPed, 7)
	local _, _, _, _, ped = GetShapeTestResult(rayHandle)
	return ped
end

Citizen.CreateThread(function()
	contador = 0

	while 1 do
		local ped = GetPedInFront()
		vida = GetEntityHealth(ped)
		Citizen.Wait(1000)

		if vida <= 101 then
			contador = contador + 1	
		end	

		if vida >= 400 then
			contador = 0
		end
	end
end)

RegisterNetEvent('insuficiente:ver_pulso')
AddEventHandler('insuficiente:ver_pulso', function()
	local ped = GetPedInFront()

	for i = 1, 3 do
	    tempo_respawn[i] = tempo_dividir * i -- Multiplicamos por i
	end

	while(contador <= Pulso.Tempo_Respawn)
	do
		local health = GetEntityHealth(ped)

		if health <= 101 then
			if (contador < tempo_respawn[1]) then
				pulse = (math.random(Pulso.Cfg.Otimo_Estado.MIN, Pulso.Cfg.Otimo_Estado.MAX))
				TriggerEvent('chatMessage', "EMS:", {255, 0, 0}, "O player está deitado a " .. contador .. " segundos! Sua pulsação é de: " .. pulse .. "BPM e ele está em um ÓTIMO ESTADO!")
				chance_reviver = maybe(Pulso.Cfg.Otimo_Estado.REVIVER)
				return				

			elseif (contador >= (tempo_respawn[1] + 1) and contador <= (tempo_respawn[2] - 1)) then
				pulse = (math.random(Pulso.Cfg.Estado_Alerta.MIN, Pulso.Cfg.Estado_Alerta.MAX))
				TriggerEvent('chatMessage', "EMS:", {255, 0, 0}, "O player está deitado a " .. contador .. " segundos! Sua pulsação é de: " .. pulse .. "BPM e ele está em um ESTADO DE ALERTA!")
				chance_reviver = maybe(Pulso.Cfg.Estado_Alerta.REVIVER)
				return

			elseif (contador >= (tempo_respawn[2] + 1) and contador <= tempo_respawn[3]) then
				pulse = (math.random(Pulso.Cfg.Estado_Grave.MIN, Pulso.Cfg.Estado_Grave.MAX))
				TriggerEvent('chatMessage', "EMS:", {255, 0, 0}, "O player está deitado a " .. contador .. " segundos! Sua pulsação é de: " .. pulse .. "BPM e ele está em um ESTADO GRAVE!")
				chance_reviver = maybe(Pulso.Cfg.Estado_Grave.REVIVER)
				return

			elseif (contador >= tempo_respawn[3]) then
				pulse = 0
				TriggerEvent('chatMessage', "EMS:", {255, 0, 0}, "O player está deitado a " .. contador .. " segundos! Sua pulsação é de: " .. pulse .. "BPM e ele está SEM PULSAÇÃO!")
				return
			end
		end

		if health >= 400 then
			print('Nenhum player deitado foi encontrado. Ignorando os batimentos cardíacos!')
			return
		end
	end
end, false)

function maybe(x) if 100 * math.random() < x then print(1) else print(0) end end