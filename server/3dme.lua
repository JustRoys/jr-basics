RegisterServerEvent('jr-basics:shareDisplay')
AddEventHandler('jr-basics:shareDisplay', function(text)
	TriggerClientEvent('jr-basics:triggerDisplay', -1, text, source)

	if Config.Logs.UseLogs then
		local webhook = Config.Logs.ChatLog
		local title = Config.Me.Title
		local message = "**"..GetPlayerName(source) .. "** "..Config.Me.Languages.Said.. " "..text..""

		SendWebhookMessage(webhook, title, message, text, color)
	end
end)