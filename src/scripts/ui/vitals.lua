Nukefire = Nukefire or {}
Nukefire.ui = Nukefire.ui or {}
Nukefire.ui.gui = Nukefire.ui.gui or {}

local SUG = require("mudlet-nukefire-basic.mdk.sug")

local function getGaugeCss(backgroundColor)
    local res = f[[
		background-color: {backgroundColor};
		border-style: solid;
		border-color: white;
		border-width: 1px;
		border-radius: 5px;
		margin: 5px;
	]]
	return res
end

function Nukefire.ui.setupVitals()
    local GUI = Nukefire.ui.gui
    GUI.vitalsContainer = GUI.vitalsContainer or Geyser.VBox:new({
        name = "vitalsContainer",
        x = 0,
        y = 0,
        height = "100%",
        width = "100%"
    }, GUI.bottomHBox)

    GUI.hpGauge = GUI.hpGauge or SUG:new({
        name = "hpGauge",
        updateEvent = "msdp.HEALTH",
        textTemplate = "<center>|c/|m (|p%)</center>",
        currentVariable = "msdp.HEALTH",
        maxVariable = "msdp.HEALTH_MAX",
        strict = true,
    }, GUI.vitalsContainer)
    GUI.hpGauge.front:setStyleSheet(getGaugeCss("green"))
    GUI.hpGauge.back:setStyleSheet(getGaugeCss("black"))
    
    GUI.movGauge = GUI.movGauge or SUG:new({
      name = "movGauge",
      updateEvent = "msdp.MOVEMENT",
      textTemplate = "<center>|c/|m M (|p%)</center>",
      currentVariable = "msdp.MOVEMENT",
      maxVariable = "msdp.MOVEMENT_MAX",
      strict = true,
    }, GUI.vitalsContainer)
    GUI.movGauge.front:setStyleSheet(getGaugeCss("darkgoldenrod"))
    GUI.movGauge.back:setStyleSheet(getGaugeCss("black"))
    
    GUI.manaGauge = GUI.manaGauge or SUG:new({
        name = "manaGauge",
        updateEvent = "msdp.MANA",
        textTemplate = "<center>|c/|m (|p%)</center>",
        currentVariable = "msdp.MANA",
        maxVariable = "msdp.MANA_MAX",
        strict = true,
      }, GUI.vitalsContainer)
      GUI.manaGauge.front:setStyleSheet(getGaugeCss("blue"))
      GUI.manaGauge.back:setStyleSheet(getGaugeCss("black"))
end


