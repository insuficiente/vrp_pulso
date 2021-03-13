--[[
   _____ .__                      _____.__       .__               __          
  / ___ \|__| ____   ________ ___/ ____\__| ____ |__| ____   _____/  |_  ____  
 / / ._\ \  |/    \ /  ___/  |  \   __\|  |/ ___\|  |/ __ \ /    \   __\/ __ \ 
<  \_____/  |   |  \\___ \|  |  /|  |  |  \  \___|  \  ___/|   |  \  | \  ___/ 
 \_____\ |__|___|  /____  >____/ |__|  |__|\___  >__|\___  >___|  /__|  \___  >
                 \/     \/                     \/        \/     \/          \/ 

[ PERMISSÕES PARA ADMIN E SAMU/EMS DEVEM SER ALTERADAS ABAIXO! ]
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
local Pulso_CFG = {}

-- Permissão do EMS/Médico
Pulso_CFG.Ems_Perm = "ems.permissao"

-- Permissão do Admin
Pulso_CFG.Adm_Perm = "administrador.permissao"

-- Tempo de respawn, será dividida em três partes(Ótimo estado, Estado de Alerta e Estado Grave)
Pulso_CFG.Tempo_Respawn = 600 

-- Configuração para a pulsagem do player, você pode alterar, porém já está configurado.
Pulso_CFG.PulsoCfg = {
	Pulso_CFG.Otimo_Estado = {
		Pulso = {
			MIN = 80,    -- Pulso Mínimo
			MAX = 100,   -- Pulso Máximo
			--REVIVER = 90 -- Chance de reviver o player | Futura Atualização
		}
	},
	Pulso_CFG.Estado_Alerta = {
		Pulso = {
			MIN = 50,    -- Pulso Mínimo
			MAX = 70,    -- Pulso Máximo
			--REVIVER = 65 -- Chance de reviver o player | Futura Atualização
		}
	},
	Pulso_CFG.Estado_Grave = {
		Pulso = {
			MIN = 30,    -- Pulso Mínimo
			MAX = 45,    -- Pulso Máximo
			--REVIVER = 45 -- Chance de reviver o player | Futura Atualização
		}
	}
}

return Pulso_CFG
