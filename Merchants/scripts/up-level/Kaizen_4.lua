local event = iGetEvent( "up-level" );

function OnUse( npc, player )

	local lvl = player.BaseScore.Level;
	local pmid = player:getPromotionId( );
	
   if( pmid >= 0 and pmid <= 1 and lvl >= 257 and lvl <= 319 or lvl > 1000 ) then
		event:addPlayer(player, 4);
		iSend.Say(npc, "Mate todos se assim for necess�rio!!!" );
   else
        if( pmid >= 2 ) then
			iSend.Say(npc, player.mob.name..", Que Diabos de Deus � voc� ??? " );
        elseif( lvl >= 319 ) then
			iSend.Say(npc, "Filho, pr�ximo erro destes e ira descacar batatas! ( lvl 270~320 )" );
		else
			iSend.Say(npc, "Voc� ainda n�o possui Patente suficiente filho.! ( lvl 270~320 )" );
		end
   end
end
