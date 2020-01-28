-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local tapCount=0



local background = display.newImageRect("background.png", 360, 570)
background.x=display.contentCenterX
background.y=display.contentCenterY
local tapText = display.newText(tapCount, display.contentCenterX, 35, native.systemFont, 40)
tapText:setFillColor( 0, 0, 0 )


local hurley= display.newImageRect("hurley.png", 200, 20)
hurley.x=display.contentCenterX-70
hurley.y=display.contentHeight-50

local sliotar =display.newImageRect("sliotar.png", 60,60)
sliotar.x=display.contentCenterX
sliotar.y=display.contentCenterY

sliotar.alpha=0.8

local physics =require("physics")

physics.start()

physics.addBody(hurley, "static")

physics.addBody(sliotar, "dynamic", {radius=50, bounce=0.3})


local function rotateHurley()
    hurley:rotate(30)

end

local function pushSliotar()
    sliotar:applyLinearImpulse(0,-0.75,sliotar.x,sliotar.y)
    tapCount=tapCount+1
    tapText.text=tapCount
timer.performWithDelay(300,rotateHurley ,1)
hurley:rotate(-30)
    
   

end

sliotar:addEventListener("tap", pushSliotar)


