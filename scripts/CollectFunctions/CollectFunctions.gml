function CollectCoins(_amount)
{
	global.playerMoney += _amount;
}

function CollectAmmo(_array)
{
	//_array = [type, amount]
	global.playerAmmo[_array[0]] += _array[1];//we take the item type, and we increase it by the item amount
	
}

