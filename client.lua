local CreateThread = CreateThread
local Wait = Wait
local PlayerPedId = PlayerPedId
local GetSelectedPedWeapon = GetSelectedPedWeapon
local SetPedInfiniteAmmo = SetPedInfiniteAmmo
local SetWeaponRecoilShakeAmplitude = SetWeaponRecoilShakeAmplitude
local boolean = true

CreateThread(function()
    while boolean do
        Wait(100)
        local playerPed = PlayerPedId()
        local weaponHash = GetSelectedPedWeapon(playerPed)
        if weaponHash ~= `WEAPON_UNARMED` and weaponHash ~= 0 then
            if Config.UnlimitedAmmo then
                SetPedInfiniteAmmo(playerPed, true, weaponHash)
            end
            if Config.NoRecoil then
                SetWeaponRecoilShakeAmplitude(GetSelectedPedWeapon(playerPed), 0.0)
            end
        end
    end
end)
