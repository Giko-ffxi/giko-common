local chat = { tell_buffer = 0, ls_buffer = {} }

chat.say = function(text)
    AshitaCore:GetChatManager():QueueCommand(string.format('/say %s', text), 1)
end

chat.command = function(command, text)
    AshitaCore:GetChatManager():QueueCommand(string.format('/%s %s', command, text), 1)    
end

chat.tell = function(username, text, time)
 
    chat.tell_buffer = math.max(chat.tell_buffer + 2, os.time())
    ashita.timer.create(string.format('tell-%s', chat.tell_buffer), os.difftime(chat.tell_buffer , os.time()), 1, function() AshitaCore:GetChatManager():QueueCommand(string.format('/tell %s %s', username, text), 1); end)

end

chat.linkshell = function(text, time)

    local time = time or os.time()

    if (chat.ls_buffer[time - 1] ~= nil) then
        time = time - 1 
    end

    chat.ls_buffer[time] = chat.ls_buffer[time] ~= nil and chat.ls_buffer[time] .. ' | ' .. text or text
    
    ashita.timer.create(string.format('linkshell-%s', time), os.difftime(time, os.time()), 1, function() AshitaCore:GetChatManager():QueueCommand(string.format('/linkshell %s', chat.ls_buffer[time]), 1); chat.ls_buffer[time] = nil end)

end

return chat