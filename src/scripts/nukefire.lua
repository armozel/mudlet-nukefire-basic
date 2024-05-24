Nukefire = Nukefire or {} 

function Nukefire.setupMSDP()
    sendMSDP("REPORT", "AFFECTS", "ALIGNMENT", "EXPERIENCE", "EXPERIENCE_MAX", "EXPERIENCE_TNL", "HEALTH",
    "HEALTH_MAX", "LEVEL", "RACE", "CLASS", "MANA", "MANA_MAX", "WIMPY", "PRACTICE", "MONEY", "MOVEMENT",
    "MOVEMENT_MAX", "HITROLL", "DAMROLL", "AC", "STR", "INT", "WIS", "DEX", "CON", "STR_PERM", "INT_PERM",
    "WIS_PERM", "DEX_PERM", "CON_PERM", "OPPONENT_HEALTH", "OPPONENT_HEALTH_MAX", "OPPONENT_LEVEL",
    "OPPONENT_NAME")
    setMergeTables("msdp.HEALTH", "msdp.HEALTH_MAX", "msdp.MOVEMENT", "msdp.MOVEMENT_MAX", "msdp.MANA", 
    "msdp.MANA_MAX", "msdp.MONEY", "msdp.EXPERIENCE_TNL", "msdp.EXPERIENCE_MAX", "msdp.AC", "msdp.AFFECTS")
end

Nukefire.eventHandlers = {

    { "NukefireLoaded", "Nukefire.ui.setup", nil },
    { "NukefireInstalled", "Nukefire.ui.setup", nil },
    { "NukefireUninstalled", "Nukefire.ui.tearDown", nil },
}

function Nukefire.registerEventHandlers()
    for i, v in ipairs(Nukefire.eventHandlers) do
        if v[3] == nil then
            Nukefire.eventHandlers[i][3] = registerAnonymousEventHandler(v[1], v[2])
        end
    end
end

function Nukefire.deregisterEventHandlers()
    for i, v in ipairs(Nukefire.eventHandlers) do
        if v[3] ~= nil then
            killAnonymousEventHandler(v[3])
        end
    end
end

local function onProfileLoad(_, package)
    Nukefire.registerEventHandlers()
    raiseEvent("NukefireLoaded")
    cecho("<green>Loaded Nukefire.<reset>\n")
end

local function onInstall(_, package)
    if package ~= "mudlet-nukefire-basic" then return end
    Nukefire.registerEventHandlers()
    raiseEvent("NukefireInstalled")
    cecho("<green>Installed Nukefire.<reset>\n")
end

local function onUninstall(_, package)
    if package ~= "mudlet-nukefire-basic" then return end
    raiseEvent("NukefireUninstalled")
    Nukefire.deregisterEventHandlers()
    cecho("<red>Uninstalled Nukefire.<reset>\n")
end

local function onProcotolEnabled(_, protocol)
    if protocol == "MSDP" then
        Nukefire.setupMSDP()
    end
end

registerNamedEventHandler("user", "NukefireInstall", "sysInstall", onInstall)
registerNamedEventHandler("user", "NukeforeLoad", "sysLoadEvent", onProfileLoad)
registerNamedEventHandler("user", "NukefireUninstall", "sysUninstall", onUninstall)
registerNamedEventHandler("user", "NukefireProcotolEnabled", "sysProtocolEnabled", onProcotolEnabled)