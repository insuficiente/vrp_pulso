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
É um plugin onde o **SAMU**/**EMS** pode ter controle da pulsação de um player enquanto ele estiver deitado na espera de uma ambulância.
<br>
<br>
O plugin é chamado através do comando **/pulso**, e apenas pode ser utilizado por um **administrador** ou um **médico**(permissões devem ser alteradas e configuradas no arquivo `config.lua`).
<br>
<br>
Composto por três variações de **Bpm**(*batimentos por minuto*) que determinam o **ESTADO DO PLAYER** pela a quantidade de tempo que ele ficou deitado no aguardo de um médico.
<br>
<br>
Os seguintes estados são:
- ÓTIMO ESTADO (**80Bpm - 100Bpm**) || (⅓ do tempo definido)
- ESTADO DE ALERTA (**50Bpm - 70Bpm**) || (⅓ do tempo definido)
- ESTADO GRAVE (**30Bpm - 45Bpm**) || (⅓ do tempo definido)
<br>

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
^^^ Altere para as permissões qual você utiliza.
<br>
<br>
```lua
-- Tempo de respawn, será dividida em três partes(Ótimo estado, Estado de Alerta e Estado Grave)
Pulso_CFG.Tempo_Respawn = 600 
```
^^^ Altere para o tempo que você deseja. Recomendo o mesmo tempo que demora para o seu player poder respawnar novamente ao seu servidor.
<br>
<br>
*O tempo que você colocar será dividido por **três**, e cada terço será uma parte para cada estado do player.
Com 600 segundos, o estado do player irá mudar a cada 200 segundos.*

## DÚVIDAS?
