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
fx_version 'bodacious'
game 'gta5'

author "insuficiente#0001"
author "https://github.com/insuficiente"
author "https://discord.gg/Exjftynpe9"

client_scripts {
	'@vrp/lib/utils.lua',
	'lib/Tunnel.lua',
	'lib/Proxy.lua',
	'config.lua',
	'cliente/main.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'config.lua',
	'servidor/main.lua'
}
