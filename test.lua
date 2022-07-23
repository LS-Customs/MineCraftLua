local robot = require("robot")
local component = require("component")

function drill() do
    for i = 0, 3, 1 do 
        robot.forward()
    end
end