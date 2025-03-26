require '__shared/Document/TransportCam'
require '__shared/Document/ArmoredVehicleCam'
require '__shared/Document/JetCam'
require '__shared/Document/MainLandCam'
require '__shared/Document/SpecialCam'
require '__shared/Document/HelicopterCam'




-- AirSuperiority USE This
--[[
Events:Subscribe('Level:LoadResources', function()
	ResourceManager:MountSuperBundle('xp3chunks')
	ResourceManager:MountSuperBundle('levels/xp3_alborz/xp3_alborz')
end)

Hooks:Install('ResourceManager:LoadBundles', 100, function(hook, bundles, compartment)
    if #bundles == 1 and bundles[1] == SharedUtils:GetLevelName() then
        print('Injecting bundles.')

        bundles = {
        'levels/xp3_alborz/xp3_alborz',
        --'levels/xp3_alborz/rushlarge0',
        'levels/xp3_alborz/conquestlarge01',
		bundles[1],
        }

        hook:Pass(bundles, compartment)
    end
end)
Events:Subscribe('Level:RegisterEntityResources', function(levelData)
	--local Registry = RegistryContainer(ResourceManager:SearchForInstanceByGuid(Guid('6C72B9D2-484E-A4D0-94FA-8A8D39357040'))) 
	local Registry = RegistryContainer(ResourceManager:SearchForInstanceByGuid(Guid('133F6403-333F-27C6-7C68-19BB4CA87882'))) 
    ResourceManager:AddRegistry(Registry, ResourceCompartment.ResourceCompartment_Game)
end)]]