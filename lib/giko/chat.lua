local chat = { ls_buffer = {} }

chat.say = function(text)
    AshitaCore:GetChatManager():QueueCommand(string.format('/say %s', text), 1)
end

chat.tell = function(username, text)
    AshitaCore:GetChatManager():QueueCommand(string.format('/tell %s %s', username, text), 1)    
end

chat.command = function(command, text)
    AshitaCore:GetChatManager():QueueCommand(string.format('/%s %s', command, text), 1)    
end

chat.linkshell = function(text, time)

    local time = time or os.time()

    if time ~= nil then
        chat.ls_buffer[time] = chat.ls_buffer[time] ~= nil and chat.ls_buffer[time] .. ' | ' .. text or text
    end
    
    ashita.timer.create(string.format('linkshell-%s', time), os.difftime(time, os.time()), 1, function() AshitaCore:GetChatManager():QueueCommand(string.format('/linkshell %s', chat.ls_buffer[time]), 1) end)

end

return chat