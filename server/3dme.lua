RegisterServerEvent('jr-basics:Show')
AddEventHandler('jr-basics:Show', function(text)
	TriggerClientEvent('jr-basics:Display', -1, text, source)

	if Config.Logs.UseLogs then
		local webhook = Config.Logs.ChatLog
		local title = Config.Me.Title
		local message = "**"..GetPlayerName(source) .. "** "..Config.Me.Languages.Said.. " "..text..""

		SendWebhookMessage(webhook, title, message, text, color)
	end
end)