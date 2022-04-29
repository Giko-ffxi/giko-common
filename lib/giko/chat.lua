local chat = {}

chat.say = function(text)
    AshitaCore:GetChatManager():QueueCommand(string.format('/say %s', text), 1)
end

chat.tell = function(username, text)
    AshitaCore:GetChatManager():QueueCommand(string.format('/tell %s %s', username, text), 1)    
end

chat.linkshell = function(text)
    AshitaCore:GetChatManager():QueueCommand(string.format('/linkshell %s', text), 1)    
end

chat.command = function(command, text)
    AshitaCore:GetChatManager():QueueCommand(string.format('/%s %s', command, text), 1)    
end

return chat