# VRP_PULSO [**CONFIGURÁVEL**] || [**vRPeX**]

> Precisa de algum plugin próprio para o seu servidor? Nos dê um toque no nosso Discord para encomendar um plugin totalmente pensado por **você**. Montaremos um orçamento justo pelo o que o plugin te oferece. 😉

```
Eu sou
   _____ .__                      _____.__       .__               __          
  / ___ \|__| ____   ________ ___/ ____\__| ____ |__| ____   _____/  |_  ____  
 / / ._\ \  |/    \ /  ___/  |  \   __\|  |/ ___\|  |/ __ \ /    \   __\/ __ \ 
<  \_____/  |   |  \\___ \|  |  /|  |  |  \  \___|  \  ___/|   |  \  | \  ___/ 
 \_____\ |__|___|  /____  >____/ |__|  |__|\___  >__|\___  >___|  /__|  \___  >
                 \/     \/                     \/        \/     \/          \/ 
```

<br>

## COMO FUNCIONA?
É um plugin onde o SAMU/EMS pode ter controle da pulsação de um player enquanto ele estiver deitado na espera de uma ambulância.
<br>
<br>
O plugin é chamado através do comando **/pulso**, e apenas pode ser utilizado por um administrador ou um médico(permissões devem ser alteradas e configuradas no arquivo `config.lua`).
<br>
<br>
Composto por três variações de Bpm(*batimentos por minuto*) que determinam o ESTADO DO PLAYER pela a quantidade de tempo que ele ficou deitado no aguardo de um médico.
<br>
<br>
Os seguintes estados são:
- ÓTIMO ESTADO (80Bpm - 100Bpm) || (⅓ do tempo definido)
- ESTADO DE ALERTA (50Bpm - 70Bpm) || (⅓ do tempo definido)
- ESTADO GRAVE (30Bpm - 45Bpm) || (⅓ do tempo definido)
<br>
O plugin também tem interação com o /reviver, que já vem incluído neste script. A cada estado que passa, diminui as chances de reviver do player.
<br>

## DÚVIDAS?
Estou na minha comunidade te esperando para te ajudar!
Você pode abrir uma solicitação de suporte digitando **-suporte** no nosso servidor do Discord!
<br>
Você pode entrar lá através do meu seguinte link de convite: https://discord.gg/jqpmr5FRuT

#### Desejamos um ótimo Roleplay para a sua cidade. Esperamos que seus players tenham a melhor experiência com os nossos scripts.

## COMO CONFIGURAR?
No arquivo `config.lua` você verá as seguintes linhas:
```lua
-- Permissão do EMS/Médico
Pulso_CFG.Ems_Perm = "ems.permissao"
```
```lua
-- Permissão do Admin
Pulso_CFG.Adm_Perm = "administrador.permissao"
```
^ Altere para as permissões qual você utiliza.
<br>
<br>
```lua
-- Tempo de respawn, será dividida em três partes(Ótimo estado, Estado de Alerta e Estado Grave)
Pulso_CFG.Tempo_Respawn = 600 
```
^ Altere para o tempo que você deseja. Recomendo o mesmo tempo que demora para o seu player poder respawnar novamente ao seu servidor.
<br>
<br>
*O tempo que você colocar será dividido por **três**, e cada terço será uma parte para cada estado do player.
Com 600 segundos, o estado do player irá mudar a cada 200 segundos.*
<br>
<br>
```lua
Pulso.Cfg = {
	Otimo_Estado = {
		MIN = 60,    -- Pulso Mínimo
		MAX = 80     -- Pulso Máximo
		REVIVER = 90 -- Chance de reviver
	},
	Estado_Alerta = {
		MIN = 40,    -- Pulso Mínimo
		MAX = 60     -- Pulso Máximo
		REVIVER = 75 -- Chance de reviver
	},
	Estado_Grave = {
		MIN = 20,    -- Pulso Mínimo
		MAX = 40     -- Pulso Máximo
		REVIVER = 55 -- Chance de reviver
	}
}
```
^ Aqui você pode escolher o pulso para cada estado do player. E também a chance de reviver por cada um.
<br>
<br>
Esse plugin já acompanha o /reanimar para o EMS. Se você já tem, por favor o remova para evitar conflitos.
O comando para reanimar é: /reanimar, ao invés de /re.
<br>
<br>