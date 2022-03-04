import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/timer"

local frames = {}
local lastFrame = -1

local function drawCurrentFrame()
  local offset = playdate.getCrankPosition()
  local frame = math.floor(offset / 36)
  if frame ~= lastFrame
  then
    playdate.graphics.clear()
    frames[frame]:drawScaled(37, 0, 2.58)
    lastFrame = frame
  end
end

local function setup()
  for i = 0,9,1
  do
    frames[i] = playdate.graphics.image.new("images/parrot." .. i)
    assert( frames[i] )
  end
  drawCurrentFrame()
end

local inputHandlers = {
  cranked = function(change, acceleratedChange)
    drawCurrentFrame()
  end
}

setup()
playdate.inputHandlers.push(inputHandlers)

function playdate.update()
  -- nop in our case
end