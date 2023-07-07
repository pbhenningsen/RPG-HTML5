event_inherited();

entityDropList = choose//THIS IS A GREAT WAY TO RANDOMIZE THINGS FOR SMALLER GAMES, IF YOU WANT TO MAKE ONE POSSIBILITY MORE LIKELY, JUST INCLUDE A BUNCH OF COPIES OF IT IN THIS LIST
(
	[oCoin],
	[oCoin,oCoin],
	[oBombDrop],
	[oArrowDrop],//these make it drop nothing at all, because three out of the 6 entries are nothing, that means that there's a 50% chance that nothing will drop. 
	-1,
	-1,
)