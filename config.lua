--[[
   _____ .__                      _____.__       .__               __          
  / ___ \|__| ____   ________ ___/ ____\__| ____ |__| ____   _____/  |_  ____  
 / / ._\ \  |/    \ /  ___/  |  \   __\|  |/ ___\|  |/ __ \ /    \   __\/ __ \ 
<  \_____/  |   |  \\___ \|  |  /|  |  |  \  \___|  \  ___/|   |  \  | \  ___/ 
 \_____\ |__|___|  /____  >____/ |__|  |__|\___  >__|\___  >___|  /__|  \___  >
                 \/     \/                     \/        \/     \/          \/ 

[ SCRIPT PARA VER PULSO. SAMU/EMS ]
[ PERMISSÃO DO SAMU/EMS DEVEM SER ALTERADAS AQUI!! ]

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
local Pulso_CFG

-- Permissão do EMS/Médico
Pulso_CFG.Ems_Perm = "ems.permissao"

-- Permissão do Admin
Pulso_CFG.Adm_Perm = "administrador.permissao"

-- Tempo de respawn, será dividida em três partes(Ótimo estado, Estado de Alerta, Estado Grave)
Pulso_CFG.Tempo_Respawn = 600 

return Pulso_CFG