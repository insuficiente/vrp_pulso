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

cnVRP = {}
Tunnel.bindInterface("vrp_pulso", cnVRP)

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
				TriggerClientEvent("Notify", source, "importante", "O player mais próximo de você está vivo, tente em um player deitado!")
				vRPclient.playSound(source, "Event_Message_Purple", "GTAO_FM_Events_Soundset")				
			end
		else
			TriggerClientEvent("Notify", source, "negado", "Não há nenhum player próximo para executar este comando!")
			vRPclient.playSound(source, "Event_Message_Purple", "GTAO_FM_Events_Soundset")
		end
	else
		TriggerClientEvent("Notify", source, "negado", "Infelizmente você não tem permissão para executar este comando! 😥")
		vRPclient.playSound(source, "Event_Message_Purple", "GTAO_FM_Events_Soundset")
	end
end)

function cnVRP.ReanimarPlayer(chance_de_reviver)
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source, 2)

	if vRP.hasPermission(user_id, "reviver.permissao") or vRP.hasPermission(user_id, Pulso.Ems_Perm) or vRP.hasPermission(user_id, Pulso.Adm_Perm) then
		if nplayer then
			if vRPclient.isInComa(nplayer) then
				if chance_de_reviver == 1 then
					local dificultar_reviver = maybe(40)

					if dificultar_reviver == 1 then
						TriggerClientEvent('cancelando', source, true)
						vRPclient._playAnim(source,false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
						TriggerClientEvent("progress", source, 30000, "Reanimando o player")

		            	SetTimeout(30000, function()
		                	vRPclient.killGod(nplayer)
		                	vRPclient._stopAnim(source,false)
		                	vRP.giveMoney(user_id, math.random(250, 350))
		                	TriggerClientEvent('cancelando', source, false)
							TriggerClientEvent("Notify", source, "sucesso", "Você conseguiu reanimar o player!")
		            	end)
					else
						vRPclient._playAnim(source,false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}}, true)
						TriggerClientEvent("progress", source, 30000, "Reanimando o player")

		            	SetTimeout(30000, function()
		                	vRPclient._stopAnim(source, false)
							TriggerClientEvent("Notify", source, "importante", "Você não conseguiu reanimar este player, continue tentando!")
						end)
					end
				else
					TriggerClientEvent("Notify", source, "negado", "Este player está sem pulso, você não consegue mais reviver ele!")
				end
			else
				TriggerClientEvent("Notify", source, "importante", "O player mais próximo de você está vivo, tente em um player deitado!")
				vRPclient.playSound(source, "Event_Message_Purple", "GTAO_FM_Events_Soundset")	
			end
		else	
			TriggerClientEvent("Notify", source, "negado", "Não há nenhum player próximo para executar este comando!")
			vRPclient.playSound(source, "Event_Message_Purple", "GTAO_FM_Events_Soundset")					
		end
	else
		TriggerClientEvent("Notify", source, "negado", "Infelizmente você não tem permissão para executar este comando! 😥")
		vRPclient.playSound(source, "Event_Message_Purple", "GTAO_FM_Events_Soundset")		
	end
end

function maybe(x) if 100 * math.random() < x then return 1 else return 0 end end