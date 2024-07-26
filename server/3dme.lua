local T = Translation.Langs[Config.Language]

RegisterServerEvent('jr-basics:shareDisplay')
AddEventHandler('jr-basics:shareDisplay', function(text)
	TriggerClientEvent('jr-basics:triggerDisplay', -1, text, source)

	if Config.Logs.UseLogs then
		local webhook = Config.Logs.ChatLog
		local title = Config.Commands.Me.Title
		local message = "**"..GetPlayerName(source) .. "** "..T.Said.. " "..text..""

		SendWebhookMessage(webhook, title, message, text, color)
	end
end)