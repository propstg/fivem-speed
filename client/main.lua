local isActive = false
local isArmed = false
local vehicle = nil
local limit = 0
local allowedSeconds = 0
local secondsBelow = 0

RegisterCommand('speed', function(source, args)
    if isActive then
        isActive = false
        showNotification('deactivated')
    else
        local vehicle = GetVehiclePedIsUsing(PlayerPedId())

        if vehicle == 0 then
            showNotification('not_in_vehicle')
        else
            isActive = true
            isArmed = false
            vehicle = vehicle
            limit = tonumber(ternary(#args >= 1, args[1], Config.DefaultLimit))
            allowedSeconds = tonumber(ternary(#args >= 2, args[2], Config.DefaultAllowedSecondsBelowSpeed))

            showNotification('installed', Speed.limit, Config.SpeedUnit.display, Speed.allowedSeconds)
        end
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(1000)

        if isActive then
            local speed = getSpeedInUnits()

            if speed >= limit then
                secondsBelow = 0

                if not isArmed then
                    isArmed = true
                    showNotification('armed')
                    -- TODO play 'armed sound'
                end
            end

            if isArmed and speed < limit then
                secondsBelow = secondsBelow + 1
            end

            if secondsBelow > allowedSeconds then
                isActive = false
                isArmed = false
                secondsBelow = 0
                showNotification('destroyed')
                doExplosions()
                NetworkExplodeVehicle(vehicle, true, false, 0)
            end
        end
    end
end)

function doExplosions()
    Citizen.CreateThread(function()
        for i = 1, 10 do
            doExplosion()
            Citizen.Wait(100)
        end
    end)
end

function doExplosion()
    local coords = GetEntityCoords(vehicle)
    AddExplosion(coords.x,
        coords.y,
        coords.z,
        'EXPLOSION_CAR', -- int explosionType
        1.0,             -- float damageScale
        true,            -- BOOL isAudible
        false,           -- BOOL isInvisible
        1.0              -- float cameraShake
    )
end

Citizen.CreateThread(function ()
    while true do
        if isActive and isArmed and secondsBelow > 0 then
            blinkNotification('increase_speed')
        end
        Citizen.Wait(100)
    end
end)

function getSpeedInUnits()
    local speedInMetersSecond = GetEntitySpeed(vehicle)
    return speedInMetersSecond * Config.SpeedUnit.multiplier
end

function ternary(condition, trueValue, falseValue)
    if condition then return trueValue else return falseValue end
end

function showNotification(messageName, ...)
    commonNotification(messageName, false, ...)
end

function blinkNotification(messageName, ...)
    commonNotification(messageName, true, ...)
end

function commonNotification(messageName, shouldBlink, ...)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(translate(messageName, ...))
    DrawNotification(false, false)
end