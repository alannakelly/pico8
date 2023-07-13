pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--------------------------------
-- an example of using basic  --
-- mouse input in pico-8. note--
-- that this example enables  --
-- devkit mode - which means  --
-- it may not function        --
-- correctly on all PICO-8    --
-- implementations.           --
--------------------------------
-- copyright (c) 2019         --
-- alanna kelly               --
-- this file is part of       --
-- "pico-8 examples" which is --
-- released under the terms of--
-- the mit licence.           -- 
--------------------------------

-- table for mouse position
mouse = {x=0,y=0,b=0}
-- table for click location
click = {x=0,y=0,t=0}

function _init()
  -- set devkit mode to enable
  -- mouse
  poke(0x5f2d,1)
end

function _update()
  -- read the stats to
  -- get mouse info
  mouse.x = stat(32)
  mouse.y = stat(33)
  local b = stat(34)
  
  -- has the mouse been clicked?
  if b != mouse.b then
    do_click()
  end

  -- update button status
  mouse.b = b

		-- update a click if active
  if click.t > 0 then
    click.t -= 4
  end
end

-- react to a click
function do_click()
  click.x = mouse.x
  click.y = mouse.y
  click.t = 60
end

function _draw()
  cls()
  print("x "..mouse.x.." y "..mouse.y.." b "..mouse.b)
  spr(1,mouse.x,mouse.y)
  if click.t > 0 then
    spr((click.t%5)+2,click.x-4,click.y-4)
  end
end


__gfx__
00000000677600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000776000000000000000000000000000000900009008000080000000000000000000000000000000000000000000000000000000000000000000000000
00700700767600000000000000f00f0000a00a000090090000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770006067600000077000000ff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000006760000077000000ff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000066000000000000f00f0000a00a000090090000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000900009008000080000000000000000000000000000000000000000000000000000000000000000000000000
