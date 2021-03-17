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
			if vRPclient.isInComa(player_proximo) then
				TriggerClientEvent('insuficiente:ver_pulso', source)
				vRPclient.playSound(source, "Event_Message_Purple", "GTAO_FM_Events_Soundset")
			else
				TriggerClientEvent("Notify", source, "negado", "O player mais próximo de você está vivo, tente em um player deitado! 😥")
				vRPclient.playSound(source, "Event_Message_Purple", "GTAO_FM_Events_Soundset")				
			end
		else
			TriggerClientEvent("Notify", source, "negado", "Não há nenhum player próximo para digitar esse comando! 😥")
			vRPclient.playSound(source, "Event_Message_Purple", "GTAO_FM_Events_Soundset")
		end
	else
		TriggerClientEvent("Notify", source, "negado", "Infelizmente você não tem permissão para executar este comando! 😥")
		vRPclient.playSound(source, "Event_Message_Purple", "GTAO_FM_Events_Soundset")
	end
end)