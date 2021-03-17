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
local Pulso = {}

-- Permissão do EMS/Médico
Pulso.Ems_Perm = "ems.permissao"

-- Permissão do Admin
Pulso.Adm_Perm = "administrador.permissao"

-- Tempo de respawn, será dividida em três partes(Ótimo estado, Estado de Alerta e Estado Grave)
Pulso.Tempo_Respawn = 600 

-- Configuração para a pulsagem do player, você pode alterar, porém já está configurado.
Pulso.Cfg = {
	Otimo_Estado = {
		MIN = 60,    -- Pulso Mínimo
		MAX = 80     -- Pulso Máximo
		--REVIVER = 90 (Atualizacao futura)
	},
	Estado_Alerta = {
		MIN = 40,    -- Pulso Mínimo
		MAX = 60     -- Pulso Máximo
		--REVIVER = 80 (Atualizacao futura)
	},
	Estado_Grave = {
		MIN = 20,    -- Pulso Mínimo
	    MAX = 40     -- Pulso Máximo
	    --REVIVER = 65 (Atualizacao futura)
	}
}

return Pulso
