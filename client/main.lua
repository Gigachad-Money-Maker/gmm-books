local bookProp = nil

local function PlayAnimation(dict, name, duration)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end
    TaskPlayAnim(PlayerPedId(), dict, name, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(dict)
end

local function HandleProp(action, ped, ped_coords, bookName, prop)
    if action == 'add' then
        local propName = nil
        if Config.Books[bookName]["prop"] == 'book' then
            propName = `prop_novel_01`
            bookProp = CreateObject(propName, ped_coords.x, ped_coords.y, ped_coords.z,  true,  true, true) 
            AttachEntityToEntity(bookProp, ped, GetPedBoneIndex(ped, 6286), 0.15, 0.03, -0.065, 0.0, 180.0, 90.0, true, true, false, true, 1, true)
        elseif Config.Books[bookName]["prop"] == 'map' then
            propName = `prop_tourist_map_01`
            bookProp = CreateObject(propName, ped_coords.x, ped_coords.y, ped_coords.z,  true,  true, true) 
            AttachEntityToEntity(bookProp, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        end
        SetModelAsNoLongerNeeded(propName)
        PlayAnimation('cellphone@', 'cellphone_text_read_base', 10000)
    elseif action == 'remove' then
        ClearPedSecondaryTask(ped)
        Wait(1000)
        SetEntityAsMissionEntity(prop)
        DeleteObject(prop)
        bookProp = nil
    end
end

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        SetNuiFocus(false,false)
        SendNUIMessage({
            show = false
        })
        ClearPedSecondaryTask(PlayerPedId())
        SetEntityAsMissionEntity(bookProp)
        DeleteObject(bookProp)
    end
end)

RegisterNetEvent('gmm-books:client:OpenBook', function(bookName)
    local ped = PlayerPedId()
    local ped_coords = GetEntityCoords(ped)
    HandleProp('add', ped, ped_coords, bookName)
    SetNuiFocus(true,true)
    SendNUIMessage({
        show = true,
        book = bookName,
        pages = Config.Books[bookName]["pages"],
        size = Config.Books[bookName]["size"],
    })
end)

RegisterNUICallback('escape', function(data, cb)
    local ped = PlayerPedId()
    HandleProp('remove', ped, false, nil, bookProp)
    SetNuiFocus(false, false)
    cb('ok')
end)