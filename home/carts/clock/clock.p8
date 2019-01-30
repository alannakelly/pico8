pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--------------------------------
-- a analouge clock in pico-8 --
-- demonstrates basic use of  --
-- trigonometry functions     --
--------------------------------     
-- copyright (c) 2019         --
-- alanna kelly               --
-- all rights reserverd.      --
-- this file is part of       --
-- "pico-8 examples" which is --
-- released under the terms of--
-- the mit licence.           -- 
--------------------------------
function _init()
  last = time()
  hours = 1
  minutes = 59
  seconds = 55
end
 
function _update()
  -- if a second or more has
  -- passed, call tick()
  if(time() - last) >= 1 then
    tick()
    last = time()
  end
end

-- called once a second to
-- "tick" the clock.
function tick()
  seconds += 1
  if seconds > 59 then
    seconds = 0
    minutes += 1
  end
  
  if minutes > 59 then
    minutes = 0
    hours += 1
  end
  
  if hours > 12 then
    hours = 1
  end
end

-- draws the clock. pico-8    --
-- uses fractions of a circle --
-- instead of radians for     --
-- trigonometric functions    --
-- going anti clockwise from  --
-- the 3 o'clock position.    --
-- this means pico-8's        --
-- 12 o'clock is at 1/4 or    --
-- 0.25 of the way around a   --
-- circular path              --
function _draw()
  cls()
  local angle = 0.25
  -- draw the face of the clock
  for face = 12,1,-1 do
    print(face, 64+cos(angle)*50,64+sin(angle)*50,2)
    angle+=1.0/12
  end

  -- Draw the hour hand  
  angle=0.25 - (hours*(1.0/12))
  line(64,64,64+cos(angle)*35,64+sin(angle)*35,5)

  -- Draw the minute hand
  angle=0.25 - (minutes*(1.0/60))
  line(64,64,64+cos(angle)*40,64+sin(angle)*40,4)

  -- Draw the second hand
  angle=0.25 - (seconds*(1.0/60))
  line(64,64,64+cos(angle)*40,64+sin(angle)*40,3)
  
end
