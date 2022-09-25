CreateThread(function()
    if Config.OldQBCore then
        TriggerEvent(Config.Core..':GetObject', function(obj) QBCore = obj end)
    else
        QBCore = exports[Config.CoreFolderName]:GetCoreObject()
    end

    for k, v in pairs(Config.Books) do
        QBCore.Functions.CreateUseableItem(k, function(source, item)
            TriggerClientEvent("gmm-books:client:OpenBook", source, k, item)
        end)
    end
end)