local event = iGetEvent( "up-level" );

function OnUse( npc, player )

	local lvl = player.BaseScore.Level;
	local pmid = player:getPromotionId( );
	
   if( pmid >= 0 and pmid <= 1 and lvl >= 320 and lvl <= 399 or lvl > 1000 ) then
        event:addPlayer(player, 5);
		iSend.Say(npc, "Filho, n�o borre as escal�a pois a batalha ser� Dura!" );
   else
        if( pmid >= 2 ) then
			iSend.Say(npc, player.mob.name..", Que Diabos de Deus � voc� ??? " );
        elseif( lvl >= 399 ) then
			iSend.Say(npc, "Suma daqui.. Voc� agora esta na linha de fogo soldado..( lvl 325~400 )" );
		else
			iSend.Say(npc, "Filho.. Receio que voc� ainda n�o esta preparado para esta batalha!..( lvl 325~400 )" );
		end
   end
end
