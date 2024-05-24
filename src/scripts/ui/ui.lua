Nukefire = Nukefire or {}
Nukefire.ui = Nukefire.ui or {}
Nukefire.ui.gui = Nukefire.ui.gui or {}

local containerDefaults = {
    lockStyle = "border",
    autoSave = false,
    locked = true,
    autoLoad = false
}

local function adjContainer(settings)
    local mergedSettings = table.update(table.deepcopy(containerDefaults), settings)
    return Adjustable.Container:new(mergedSettings)
end

local function setupBaseLayout()
    local GUI = Nukefire.ui.gui

    GUI.bottom = GUI.bottom or adjContainer({
        name = "bottom",
        height = "15%",
        width = "25%",
        x = 0,
        y = "-15%"
    })

    GUI.bottomHBox = GUI.bottomHBox or Geyser.HBox:new({
        name = "bottomHBox",
        width = "100%",
        height = "100%",
        x = 0,
        y = 0,
    }, GUI.bottom)

end


function Nukefire.ui.setup()
    setupBaseLayout()
    Nukefire.ui.setupVitals()
end

function Nukefire.ui.tearDown()
    Nukefire.ui.hide()
    Nukefire.ui.gui = nil
    Nukefire.ui = nil
end

function Nukefire.ui.show()
    local GUI = Nukefire.ui.gui

    GUI.bottom:show()
    GUI.bottom:attachToBorder("bottom")
end

function Nukefire.ui.hide()
    local GUI = Nukefire.ui.gui

    GUI.bottom:hide()
end



