local event = iGetEvent("agua-N");

function OnUse( Op, Slot, Beg, player )
	return sendToWater(player, event, 6);
end