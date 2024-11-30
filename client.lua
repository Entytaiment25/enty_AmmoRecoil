local SetWeaponRecoilShakeAmplitude = SetWeaponRecoilShakeAmplitude
local GetSelectedPedWeapon = GetSelectedPedWeapon
local SetPedInfiniteAmmo = SetPedInfiniteAmmo
local CreateThread = CreateThread
local PlayerPedId = PlayerPedId
local boolean = true
local Wait = Wait

CreateThread(function()
    while boolean do
        Wait(100)
        local playerPed = PlayerPedId()
        local weaponHash = GetSelectedPedWeapon(playerPed)
        if weaponHash == `WEAPON_UNARMED` or weaponHash == 0 then return end
        if Config.UnlimitedAmmo and Config.OnlyAllowedWeapons then
            for i = 1, #Config.AllowedWeapons do
                SetPedInfiniteAmmo(playerPed, true, Config.AllowedWeapons[i])
            end
        end
        if Config.NoRecoil then
            SetWeaponRecoilShakeAmplitude(weaponHash, 0.0)
        end
        if Config.NoSpread then
            SetPedAccuracy(playerPed, 100)
        end
    end
end)
