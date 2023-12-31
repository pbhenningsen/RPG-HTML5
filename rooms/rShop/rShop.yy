{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rShop",
  "creationCodeFile": "rooms/rParent/RoomCreationCode.gml",
  "inheritCode": true,
  "inheritCreationOrder": true,
  "inheritLayers": true,
  "instanceCreationOrder": [
    {"name":"inst_2FA68CD","path":"rooms/rShop/rShop.yy",},
    {"name":"inst_1860AEF","path":"rooms/rShop/rShop.yy",},
    {"name":"inst_DDDC90B","path":"rooms/rShop/rShop.yy",},
    {"name":"inst_28E4CABF","path":"rooms/rShop/rShop.yy",},
    {"name":"inst_4A7596FF","path":"rooms/rShop/rShop.yy",},
    {"name":"inst_7C34F7D5","path":"rooms/rShop/rShop.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":-100,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_2FA68CD","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":{"name":"inst_2FA68CD","path":"rooms/rParent/rParent.yy",},"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oPlayer","path":"objects/oPlayer/oPlayer.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":137.0,"y":143.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_1860AEF","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oRoomExit","path":"objects/oRoomExit/oRoomExit.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oRoomExit","path":"objects/oRoomExit/oRoomExit.yy",},"propertyId":{"name":"targetX","path":"objects/oRoomExit/oRoomExit.yy",},"value":"120",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oRoomExit","path":"objects/oRoomExit/oRoomExit.yy",},"propertyId":{"name":"targetRoom","path":"objects/oRoomExit/oRoomExit.yy",},"value":"rVillage",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oRoomExit","path":"objects/oRoomExit/oRoomExit.yy",},"propertyId":{"name":"targetY","path":"objects/oRoomExit/oRoomExit.yy",},"value":"112",},
          ],"rotation":0.0,"scaleX":0.25,"scaleY":0.25,"x":128.0,"y":144.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_DDDC90B","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":3,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oShopKeep","path":"objects/oShopKeep/oShopKeep.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"entityActivateScript","path":"objects/pEntity/pEntity.yy",},"value":"NewTextBox",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"entityActivateArgs","path":"objects/pEntity/pEntity.yy",},"value":"[\"You'll need some of my wares if you\\nwant to make it through that scary cave!\\nOh yes.\",2]",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":96.0,"y":80.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_28E4CABF","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":1,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"propertyId":{"name":"itemCost","path":"objects/oShopItem/oShopItem.yy",},"value":"10",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"propertyId":{"name":"itemAmount","path":"objects/oShopItem/oShopItem.yy",},"value":"5",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"entityActivateArgs","path":"objects/pEntity/pEntity.yy",},"value":"[\"Bombs (cost 10 g)\",1,[\"6:Purchase\",\"0:No Thanks!\"]]",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":176.0,"y":48.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4A7596FF","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":2,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"propertyId":{"name":"itemCost","path":"objects/oShopItem/oShopItem.yy",},"value":"15",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"propertyId":{"name":"itemAmount","path":"objects/oShopItem/oShopItem.yy",},"value":"15",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"propertyId":{"name":"item","path":"objects/oShopItem/oShopItem.yy",},"value":"ITEM.BOW",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"entityActivateArgs","path":"objects/pEntity/pEntity.yy",},"value":"[\"Bow (cost 15g)\",1,[\"6:Purchase\",\"0:No Thanks!\"]]",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":112.0,"y":48.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7C34F7D5","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":3,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"propertyId":{"name":"item","path":"objects/oShopItem/oShopItem.yy",},"value":"ITEM.HOOK",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oShopItem","path":"objects/oShopItem/oShopItem.yy",},"propertyId":{"name":"itemCost","path":"objects/oShopItem/oShopItem.yy",},"value":"25",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"entityActivateArgs","path":"objects/pEntity/pEntity.yy",},"value":"[\"Hook (cost:  25g)\",1,[\"6:Purchase\",\"0:No Thanks!\"]]",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":144.0,"y":48.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Col","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":12,"SerialiseWidth":20,"TileCompressedData":[
-23,-2147483648,-11,1,-6,-2147483648,4,0,-2147483648,-2147483648,1,-9,-2147483648,1,1,-6,-2147483648,-3,0,-11,
1,1,0,-6,-2147483648,4,0,-2147483648,1,0,-5,-2147483648,5,0,-2147483648,-2147483648,1,0,-6,-2147483648,
4,0,-2147483648,1,0,-4,-2147483648,-2,0,-2,-2147483648,2,1,0,-5,-2147483648,-2,0,3,-2147483648,
1,0,-8,-2147483648,2,1,0,-5,-2147483648,4,0,-2147483648,-2147483648,1,-9,-2147483648,2,1,0,-5,
-2147483648,4,0,-2147483648,-2147483648,1,-7,-2147483648,-2,0,2,1,-2147483648,-3,0,1,-2147483648,-4,0,-5,
1,1,0,-5,1,-6,0,-2,-2147483648,-3,0,-2,-2147483648,-3,1,3,0,-2147483648,0,-27,
-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tCol","path":"tilesets/tCol/tCol.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"TilesUpper","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":12,"SerialiseWidth":20,"TileCompressedData":[
-62,-2147483648,-2,0,1,128,-7,129,1,130,-5,-2147483648,-2,0,-2,-2147483648,-2,0,-14,-2147483648,
-2,0,-13,-2147483648,1,0,-3,-2147483648,-3,0,-36,-2147483648,-4,0,-16,-2147483648,-4,0,-60,-2147483648,
],"TileDataFormat":1,},"tilesetId":{"name":"tTiles","path":"tilesets/tTiles/tTiles.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"TilesMain","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":12,"SerialiseWidth":20,"TileCompressedData":[
-23,0,1,173,-9,176,1,178,-9,0,1,193,-9,189,1,193,-9,0,1,193,
-9,189,1,193,-9,0,1,193,-9,189,1,193,-9,0,1,193,-9,189,1,193,
-9,0,1,193,-9,189,1,193,-9,0,1,193,-9,189,1,193,-9,0,1,193,
-9,189,1,193,-9,0,1,203,-3,204,3,205,189,207,-3,204,1,208,-46,0,
],"TileDataFormat":1,},"tilesetId":{"name":"tTiles","path":"tilesets/tTiles/tTiles.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy",
  },
  "parentRoom": {
    "name": "rParent",
    "path": "rooms/rParent/rParent.yy",
  },
  "physicsSettings": {
    "inheritPhysicsSettings": true,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 180,
    "inheritRoomSettings": true,
    "persistent": false,
    "Width": 320,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":540,"hspeed":-1,"hview":135,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":900,"wview":240,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": true,
    "inheritViewSettings": true,
  },
  "volume": 1.0,
}