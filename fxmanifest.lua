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

Atualização: 26/03/2021 | v1.21.2

Não tente revender este script/plugin, é totalmente feito pela nossa comunidade e não por você.
Seria bem feio da sua parte vender um plugin gratuito, hein?

DESEJAMOS UM ÓTIMO ROLEPLAY PARA A SUA CIDADE. ESPERAMOS QUE OS SEUS PLAYERS TENHAM A MELHOR EXPERIÊNCIA COM OS NOSSOS SCRIPTS.
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
	'lib/Tunnel.lua',
	'lib/Proxy.lua',
	'@vrp/lib/utils.lua',
	'config.lua',
	'servidor/main.lua'
}
