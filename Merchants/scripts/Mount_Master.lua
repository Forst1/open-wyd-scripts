function OnUse(npc, player, confirm)
	
	local mount = player:getMount();
	if (mount:isBetween(2330, 2390) == false) then
		iSend.Say(npc, "Vocꡮ䯠possui uma montaria v⭩da equipada.");
		return;
	end
	
	if (mount:getValue(0) > 0) then
		iSend.Say(npc, "A montaria ainda estᡶiva!");
		return;
	end
	
	local itemAttr = iItems.GetItemById(mount:getId());
	local price = itemAttr:getPrice();
	local coin = player:getCoin();
	
	if (coin == 0) then
		iSend.Say(npc, "Para reviver ["..itemAttr:getName().."] 顮ecessario "..price.." de gold.");
		return;
	end
	
	if (coin < price) then
		iSend.Say(npc, "Nao possui gold sufuciente!");
		return;
	end

	if (price < 0 or price > 2000000000) then
		iSend.Say(npc, "Houve um erro! Tire uma print e envie ao suporte! Mount_Master.lua#28");
		iLog("etc, ["..player:getName().."] mount ressurect index:"..mount:getId().." Wrong price:"..price);
		return;
	end

	player:setCoin(coin - price);

	local vitality = (iItems.GetItemAbility(mount, 79) - iRandomNumber(0, 3));

	if (vitality > 0) then
		iSend.Say(npc, "Ele foi Curado");
		mount:setMountHp(20);
		mount:setMountLife(vitality);
		mount:setMountFeed(5);
	else
		iSend.Say(npc, "Desculpe, n䯠pude salvᮬo.");
		mount:reset();
	end
	
	player:doBuildCurrentScore();
	iGameServer.MountProcess(player, nil);
	
	iSend.Item(player, ITEM_PLACE_EQUIP, 14, mount);
	iSend.Score(player);
	iSend.Etc(player);

	iLog("etc, ["..player:getName().."] mount ressurect index:"..mount:getId().." vit:"..vitality.." - "..mount:getMountLife());
end
