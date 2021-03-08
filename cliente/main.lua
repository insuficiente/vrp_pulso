--[[
   _____ .__                      _____.__       .__               __          
  / ___ \|__| ____   ________ ___/ ____\__| ____ |__| ____   _____/  |_  ____  
 / / ._\ \  |/    \ /  ___/  |  \   __\|  |/ ___\|  |/ __ \ /    \   __\/ __ \ 
<  \_____/  |   |  \\___ \|  |  /|  |  |  \  \___|  \  ___/|   |  \  | \  ___/ 
 \_____\ |__|___|  /____  >____/ |__|  |__|\___  >__|\___  >___|  /__|  \___  >
                 \/     \/                     \/        \/     \/          \/ 

[ SCRIPT PARA VER PULSO. SAMU/EMS ]
[ PERMISSÃO DO SAMU/EMS DEVE SER ALTERADA NO CONFIG.LUA ]

- Os scripts podem ser encontrados na nossa comunidade Discord ou GitHub. Links abaixo;
- Não aceite scripts caros, você pode nos contatar para fazer um plugin por um preço acessível.

Links para a nossa comunidade amigável! 🙂
{
	"GitHub": "https://github.com/insuficiente",
	"Discord": "https://discord.gg/Exjftynpe9"	
}

Atualização: 08/03/2021 | v1.1.0

Não tente revender este script/plugin, é totalmente feito pela nossa comunidade e não por você.
Seria bem feio da sua parte vender um plugin gratuito, hein?
]]
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Pulso = module('vrp_pulso', 'config')

vRP = Proxy.getInterface("vRP")
tempo_dividir = (Pulso.Tempo_Respawn / 3)
tempo_respawn = {}

local health
local pulse

Citizen.CreateThread(function()
	contador = 0

	while 1 do
		vida = GetEntityHealth(GetPlayerPed(player_proximo))
		Citizen.Wait(1000)

		if vida <= 101 then
			contador = contador + 1	
		end	

		if vida >= 400 then
			contador = 0
		end
	end
end)

RegisterNetEvent('ems:verpulso')
AddEventHandler('ems:verpulso', function(player_proximo)

	local health = GetEntityHealth(GetPlayerPed(player_proximo))

	for i = 1, 3 do
	    tempo_respawn[i] = tempo_dividir * i -- salvamos na array
	end

	while(contador <= Pulso.Tempo_Respawn)
	do
		local health = GetEntityHealth(GetPlayerPed(player_proximo))

		if health <= 101 then
			if (contador < tempo_respawn[1]) then
				pulse = (math.random(80, 100))
				TriggerEvent('chatMessage', "EMS:", {255, 0, 0}, "O player está deitado a " .. contador .. " segundos! Sua pulsação é de: " .. pulse .. "BPM e ele está em um ÓTIMO ESTADO!")
				return				

			elseif (contador >= (tempo_respawn[1] + 1) and contador <= (tempo_respawn[2] - 1)) then
				pulse = (math.random(50, 70))
				TriggerEvent('chatMessage', "EMS:", {255, 0, 0}, "O player está deitado a " .. contador .. " segundos! Sua pulsação é de: " .. pulse .. "BPM e ele está em um ESTADO DE ALERTA!")
				return

			elseif (contador >= (tempo_respawn[2] + 1) and contador <= tempo_respawn[3]) then
				pulse = (math.random(30, 45))
				TriggerEvent('chatMessage', "EMS:", {255, 0, 0}, "O player está deitado a " .. contador .. " segundos! Sua pulsação é de: " .. pulse .. "BPM e ele está em um ESTADO GRAVE!")
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