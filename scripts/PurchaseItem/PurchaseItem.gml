function PurchaseItem(_item,_amount,_cost)
{
		if (global.playerMoney >= _cost)
		{
			global.playerHasAnyItems = true;//telling the game you have just acquired an item
			global.playerItemUnlocked[_item] = true;
			global.playerAmmo[_item] += _amount;
			global.playerMoney -= _cost;
			global.playerEquipped = _item;
			instance_destroy(activate);
			
			var _desc = "";
			switch (_item)
			{
				case ITEM.BOW: _desc = "The box!\nFire with the activate key to damage enemies,\find ammo in the world!"; break;
				case ITEM.BOMB: _desc = "Bombs!\nBlow things up!";break;
				case ITEM.HOOK: _desc = "The Hook!\nGrapple places!";break;
				default: _desc = "No item description found!";break;
			}
			NewTextBox(_desc,1);
			
			
		}
		else
		{
			NewTextBox("Not enough money...",1);
		}
}