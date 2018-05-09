# Open WYD Scripts


## Estrutura
--------------------------------------------------------------------------------------------------------------------------
- ##### **Contexto global**
- **global.lua**: Contexto global (valores constantes, parâmetros para as funções, ...)
- **language.lua**: Informações sobre idiomas utilizado nos scritpts.

--------------------------------------------------------------------------------------------------------------------------
- ##### **Pastas**
- **Configuação**
- - **Data**: Arquivos gerais de configuração do servidor.
- - - **Creatures**: Arquivos .xml que possui as configurações das criaturas no jogo, ex: [Aki.xml](https://github.com/open-wyd/open-wyd-scripts/blob/master/Data/Creatures/Aki.xml). 

--------------------------------------------------------------------------------------------------------------------------
- **Modulos**
- **Events**: Modulo de eventos, detém todos os tipos de eventos no jogo ex: [up-level.lua](https://github.com/open-wyd/open-wyd-scripts/blob/master/Events/scripts/up-level/up-level.lua).
- - **arquivo xml**: associa elementos do jogo aos scripts com ações
- - **Libs**: scripts de biblioteca, utilizado como contexto global do modulo, ideal para reutilizar funcionalidades comum aos scripts.
- - **scripts**: ações a serem executadas no jogo quando interações descritas no **arquivo xml** ocorrerem.
- **Itens**: Modulo de itens que detém as funcionalidades básicas dos volatiles, ex: [Agua-n-s-1.lua](https://github.com/open-wyd/open-wyd-scripts/blob/master/Itens/scripts/Agua%20N/Agua-n-s-1.lua)
- - **arquivo xml**, **Libs** e  **scripts**: Funcionalidades similar ao descrito pelo modulo **Events**.
- **Merchants**: Modulo de Npc que possui as funcionalidades dos merchants, ex: [Mount_Master.lua](https://github.com/open-wyd/open-wyd-scripts/blob/master/Merchants/scripts/Mount_Master.lua)
- - **arquivo xml**, **Libs** e  **scripts**: Funcionalidades similar ao descrito pelo modulo **Events**.
- **Teleports**: Modulo de teletransportes, ex: [ArmiaToNoaton.lua](https://github.com/open-wyd/open-wyd-scripts/blob/master/Teleports/scripts/Armia/ArmiaToNoaton.lua)
- - **arquivo xml**, **Libs** e  **scripts**: Funcionalidades similar ao descrito pelo modulo **Events**.

## API da plataforma
--------------------------------------------------------------------------------------------------------------------------
### [Lua](https://www.lua.org)
-- **Versão**: [5.3](https://www.lua.org/versions.html#5.3)
#### Modulos nativos habilitados:
- - [string](https://www.lua.org/manual/5.3/manual.html#6.4)
- - [table](https://www.lua.org/manual/5.3/manual.html#6.6)
- - [math](https://www.lua.org/manual/5.3/manual.html#6.7)

--------------------------------------------------------------------------------------------------------------------------
### Módulo Events.
```
Definitions of types:
    EVENT_TASK
Defines:
    EVENT_TASK_NONE
    EVENT_TASK_EXECUTE
    EVENT_TASK_LOAD
    EVENT_TASK_START
    EVENT_TASK_STOP
    EVENT_TASK_FINNALY
```

```
Type: 
	EnvironmentEvent

Constructor:
    EnvironmentEvent()
   
Properties:
    number    envId
    CPosition from
    CPosition to
    CPosition center
    Player    owner
    Npc       npc
    
Methods:
    string  getName()
    void    setName(string newName)
    number  getEnvId()
    number  getEventTaskId()
    number  getTime()
    void    setTime(number newTime)
    boolean isStarted()
    void    start()
    void    stop()
    void    resetNpc()
    void    addMonster(string creatureName, number maxCreatures, number centerx, number centery, boolean randomPos = true)
    void    addRespawn(string respawnName, number respawnId, number centerx, number centery, boolean randomPos = true)
    void    executeSpawn(number respawnId)
    number  executeCreature(number creatureId)
    boolean addPlayer(ScriptEvent scriptEvent, Player player, CPosition pos)
    boolean addGroup(ScriptEvent scriptEvent, Player player, CPosition pos)
    boolean removePlayer(Player player, CPosition pos)
    number  removeAllPlayer(CPosition pos)
    number  checkPlayer()
    number  checkSpawn(number respawnId)
    void    addTask(ScriptEvent scriptEvent)
    boolean addScheduler(number delay, ScriptEvent scriptEvent)
    boolean removeTask()
    boolean InZone(CPosition pos)
    boolean InZone(Player player)
    void    sendTime(number sec, boolean inZone)
    void    sendEventMapEffect(number effectId)
```

```
Type: 
	ScriptEvent

Methods:
    void    reset()
    string  getName()
    boolean addPlayer(Player player, number envId)
    boolean removePlayer(Player player, number envId)
    void    nextEnv(EnvironmentEvent envFrom, EnvironmentEvent envTo)
    void    addTask(number envId)
    number  addScheduler(number delay, number envId = 0)
    number  scheduledTask(number delay, EVENT_TASK eTask, number envId = 0)
    boolean removeScheduler(number sId)
```

--------------------------------------------------------------------------------------------------------------------------
### Módulo iGameServer
```
module: 
    iGameServer
	
Methods:
    boolean PutItem(Player player,  CItem item)
    number  GenerateSummon(Player player, number SummonID, CItem sItem, number Num)
    number  CreateMob(string MobName, number PosX, number PosY, number Type)
    void    GenerateMob(number index, number PosX, number PosY)
    void    MountProcess(Player player, CItem Mount)
    void    LinkMountHp(Npc npc)
    void    ProcessAdultMount(Player player, number HpLost)
    void    ClearArea(number x1, number y1, number x2, number y2)
    void    SetArenaDoor(number state)
    void    SetCastleDoor(number state)
    void    DeleteMob(Creature creature, number Type)
    number  CreateItem(number x, number y, CItem item, number rotate, number Create)
    void    DoRecall(Player player)
    boolean DoTeleport(Creature creature, number x, number y, boolean isGreat = false)
    boolean DoTeleport(Creature creature,  CPosition targetPos, boolean isGreat = false)
    void    SummonServer(number tx, number ty)
```

--------------------------------------------------------------------------------------------------------------------------
### Módulo iSend
```
module: 
    iSend

Methods:
    void ExpGain(Creature creature)
    void ClientMessage(const string message)
    void ClientMessage(Player player, const string message)
    void Notice(string message)
    void NoticeArea(string message, number x1, number y1, number x2, number y2)
    void GuildNotice(number Guild, string message)
    void CreateMob(Player player, Creature otherCreature, boolean sAll)
    void AutoTrade(Player player, number otherconnId)
    void GridMob(Player player)
    void Item(Player player, number type, number slotId, CItem item)
    void Etc(Player player)
    void CargoCoin(Player player)
    void ShopList(Player player, Creature creatureShop, number shopType)
    void ReqParty(Player player, const Creature cLeader, number partyId)
    void RemoveParty(Player player, number connIdExit)
    void Carry(Player player)
    void SetHpMp(Player player)
    void HpMode(Player player)
    void PKInfo(Player player, Player target)
    void Affect(Player player)
    void CreateItem(Player player, number objectId, boolean sAll = false)
    void Chat(Creature creature, string message)
    void EnvEffect(number x1, number y1, number x2, number y2, number effect, number effectParm)
    void EnvEffectKingdom(number x1, number y1, number x2, number y2, number effect, number effectParm, number Clan)
    void RemoveMob(Player player, number sour, number type = 0, boolean sAll = false)
    void RemoveItem(Player player, number objectId, boolean sAll = false)
    void Emotion(Creature creature, number motion, number parm)
    void Equip(Creature creature, number connIdSkip = 0)
    void Score(Creature creature)
    void GuildList(Player player)
    void WarInfo(Player player, number clan)
    void AddParty(Player player, Creature creature, boolean isLeader)
    void Weather()
    void Say(Creature creature, string message)
    void ClientSignal(Player player, number id, number signal)
    void ClientSignalParm(Player player, number id, number signal, number parm)
    void ClientSignalParm2(Player player, number id, number signal, number parm, number parm2)
    void ClientSignalParm3(Player player, number id, number signal, number parm, number parm2, number parm3)
    void SignalParmArea(number x1, number y1, number x2, number y2, number id, number signal, number parm)
    void ClientSignalnumberParm2(Player player, number id, number signal, number parm, number parm2)
    void numberSignalParm2Area(number x1, number y1, number x2, number y2, number id, number signal, number parm1, number parm2)
```

--------------------------------------------------------------------------------------------------------------------------
### Módulo Items

```
Type:
    CItem

Constructor:
    CItem()
    CItem(number id)
	CItem(CItem cpyItem)

Methods:
    void reset()
    void reset(number id)
    void reset(CItem cpyItem)
    
    number getId()
    void setId(number id)
    
    boolean isBetween(number fromId, number toId)
    boolean isBetween(CItem fromId,  CItem toId)
    boolean hasAdd(number effectid)
    
    number getAddValue(number effectid)
    boolean setAddValue(number effectid, number val)
    void setAddValue(number slot, number effectid, number val)
    number getValue(number slot)
    void setValue(number slot, number val)
    
    number getLeaderType()
    number getSubGuild()
    boolean isGuildLeader()
    number getGuildChannel()
    number getGuildId()
    number getGuildIndex()
    void setGuildIndex(number index)
    void setGuildIndex(number chid, number guildid)
    
    number getMountHp()
    void setMountHp(number hp)
    number getMountLife()
    void setMountLife(number life)
    number getMountLevel()
    void setMountLevel(number lvl)
    number getMountExp()
    void setMountExp(number exp)
    number getMountFood()
    void setMountFood(number food)
```

```
Type:
    ItemAttrType

Methods:
    number  getId()
    string  getName()
    number  getReqLvl()
    number  getReqStr()
    number  getReqnumber()
    number  getReqDex()
    number  getReqCon()
    boolean hasEffect(number EffectId)
    number  getEffect(number EffectId)
    number  getPrice()
    number  getUnique()
    number  getPos()
    number  getExtra()
    number  getGrade()
```

```
Module:
    iItems

Methods:
    boolean IsLoaded()
    number  Count()
    ItemAttrType GetItemById(number id)
    string  GetItemDumpStr(CItem item)
    void    SetItemBonus(CItem dest, number level, number dropBonus = 0, boolean isBaseAttribute = false)
    number  GetItemAbilityNosanc( CItem item, number Type)
    number  GetItemAbility(CItem item, number Type)
    number  GetStaticItemAbility( CItem item, number Type)
    number  GetBonusItemAbility( CItem item, number Type)
    number  GetBonusItemAbilityNosanc( CItem item, number Type)
    number  GetItemSanc(CItem item)
    number  GetItemGem(CItem item)
    number  GetItemSancSuccess( CItem item)
    number  SetItemSanc(CItem dest, number sanc, number success)
    void    SetItemAmount(CItem item, number amount)
    number  GetIndex(CItem item)
    number  GetGuild(CItem item)
    number  GetSubGuild(number item)
    number  VisualItemCode(CItem Item, number mnt)
    number  VisualAnctCode(CItem Item)
    void    SetItemDate(CItem Item, number day)
    number  CheckItemDate(CItem Item)
    void    CheckFairyDate(CItem Item)
```

--------------------------------------------------------------------------------------------------------------------------
### Módulo FindItem

```
Definitions of types:
    FindItemSlotType
	
Defines:
    SLOT_EQUIP
    SLOT_CARRY
    SLOT_CARGO
    SLOT_ALL
```

```
Definitions of types:
    FindItemFlags

Defines:
    iT_ID
    iT_ADD
    iT_VAL
    iT_ORD
    iT_OR
    iT_MORE
    iT_LESS

    T_ID,
    T_ADD1,  T_ADD2,  T_ADD3
    T_VAL1,  T_VAL2,  T_VAL3
    T_ORD1,  T_ORD2,  T_ORD3
    T_OR1,   T_OR2,   T_OR3
    T_MORE1, T_MORE2, T_MORE3
    T_LESS1, T_LESS2, T_LESS3

    T_ADD     -- Is equal: > T_ADD1|T_ADD2|T_ADD3
    T_VAL     -- Is equal: > T_VAL1|T_VAL2|T_VAL3
    T_ORD     -- Is equal: > T_ORD1|T_ORD2|T_ORD3
    T_OR      -- Is equal: > T_OR1|T_OR2|T_OR3
    T_MORE    -- Is equal: > T_MORE1|T_MORE2|T_MORE3
    T_LESS    -- Is equal: > T_LESS1|T_LESS2|T_LESS3
    T_ADD2VAL -- Is equal: > T_ADD1|T_ADD2|T_ADD3|T_VAL1|T_VAL2|T_VAL3
    T_FULL    -- Is equal: > T_ID|T_ADD1|T_ADD2|T_ADD3|T_VAL1|T_VAL2|T_VAL3
```

```
Type:
    CSlot

Properties:
    CItem item
    number slot
    number sType
    boolean isModify
```

```
Type:
    FindItem

Constructor:
    FindItem(Player player)

Methods:
    number  findItem(const CItem item, number max = 1, number sType = SLOT_CARRY, number tflag = T_FULL)
    number  findItemId(number itemID, number max = 1, number sType = SLOT_CARRY, number tflag = T_ID)
    number  replaceItem(const CItem fromItem, CItem toItem, number max, number sType = SLOT_CARRY, number tflag = T_FULL, number rflag = T_FULL)
    number  replaceItemId(number fromID, number toId, number max, number sType = SLOT_CARRY, number tflag = T_ID, number rflag = T_ID)
    number  amount(number id, number min, number max, number sType = SLOT_CARRY, number unit = 1, number maxA = 1)
    CItem   getItem(number slot, number sType = SLOT_CARRY)
    CSlot   getSlot(number slot, number sType = SLOT_CARRY)
    number  getSlotCount(number sType = SLOT_CARRY)
    number  getItemsCount(number sType = SLOT_CARRY)
    boolean checkItem(CItem item)
    boolean checkSlot(number slot, number sType = SLOT_CARRY)
    number  clearItems(number count, number sType = SLOT_CARRY)
    void    clear()
    void    resume()
```
