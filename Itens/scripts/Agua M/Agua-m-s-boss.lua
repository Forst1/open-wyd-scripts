local event = iGetEvent("agua-M");

function OnUse( Op, Slot, Beg, player )
	return sendToWater(player, event, 9);
end
