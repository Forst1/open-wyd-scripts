local event = iGetEvent("agua-N");

function OnUse(player, pSrc, pNumber, pDest)
	return sendToWater(player, event, 2);
end