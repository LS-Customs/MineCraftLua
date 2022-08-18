local robot = require("robot")
local component= require("component")
local geolyzer = component.geolyzer

-- variables for geolyzer
local offsetx = -1
local offsety = -1
local offsetz = -1

local sizex = 3
local sizez = 3
local sizey = 3

local geoMap = {}

-- other variables
local evenSprial = true
local numMoves = 2

-- robot moves defined number of steps formard
function moveForward(steps)
    for i = 0, steps, 1 do
        robot.forward()
    end
end

-- robot drills forward defined number of steps
function drill(steps)
    for int = 0, steps, 1 do 
        if robot.detect() then
            -- unpassable block in front of robot
            robot.swing()
        end
        local successfulMove = robot.forward()
    end
    return successfulMove
end

-- robot scans imediate surrounding 
function scan()
    geolyzer.scan()
end
    

-- get the current durability of the pickaxe
function getDurability()
    return robot.durability()
end

-- checks if durability of pickaxe is to low
function isDurabilityLow()
    local dur, _= robot.durability()
    if (dur < 0.05) then
        return true
    else 
        return false
    end
end

function drillSpiral(numSpiral)
    for i = 0, numSpiral, 1 do
        if evenSprial then
            moveForward(numMoves)
            robot.turnRight()
            evenSpiral = false
            numMoves + 1
        else 
            moveForward(numMoves)
            robot.turnRight()
            numMoves + 2 
            evenSpiral = true
        end
    end
end

        
