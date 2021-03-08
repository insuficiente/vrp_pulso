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
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Pulso = module("vrp_pulso", "config")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

RegisterCommand('pulso', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player_proximo = vRPclient.getNearestPlayer(source, 5)

	if vRP.hasPermission(user_id, Pulso.Adm_Perm) or vRP.hasPermission(user_id, Pulso.Ems_Perm) then
		if player_proximo then
			TriggerClientEvent('ems:verpulso', source, player_proximo)
			vRPclient.playSound(source, "Event_Message_Purple", "GTAO_FM_Events_Soundset")
		else
			TriggerClientEvent("Notify", source, "negado", "Não há nenhum player próximo para digitar esse comando! 😥")
		end
	else
		TriggerClientEvent("Notify", source, "negado", "Infelizmente você não tem permissão para executar este comando! 😥")
	end
end)