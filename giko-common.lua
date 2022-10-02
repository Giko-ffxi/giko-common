_addon.author 	= 'giko'
_addon.name 	= 'giko-common'
_addon.version 	= '1.0.5'

print("-= This is a library package for the giko's addons. There is no need to load it. =-")

AshitaCore:GetChatManager():QueueCommand(string.format('/addon unload giko-common'), 1)    