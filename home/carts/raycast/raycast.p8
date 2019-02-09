pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--------------------------------
-- example of making a        --
-- raycaster in pico-8.       --
-- it demonstrates how the    --
-- illusion of a 3d world can --
-- be easily created using    --
-- simple trigonometry.       --
--                            --
-- this is essentially the    --
-- same basic technique that  --
-- classic games like         --
-- wolfenstien 3d and doom    --
-- used.                      --
--                            --
-- there are lots of ways to  --
-- optimise, improve or build --
-- on this basic shell.       --
--------------------------------
-- copyright (c) 2019         --
-- alanna kelly               --
-- all rights reserverd.      --
-- this file is part of       --
-- "pico-8 examples" which is --
-- released under the terms of--
-- the mit licence.           -- 
--------------------------------

-- define a degree
one_degree=1.0/360.0

-- 45' field of view
fov=one_degree*45.0

-- ray march step. increase for
-- more fps. decrease for higher
-- quality.
ray_step=0.025

-- player data
player = {
  x=2.5, y=2.5, -- starting position
  h=0 * one_degree, -- heading
  speed=0.1, --movement speed
}

-- world map
world = {
 {15,04,15,04,15,04,15,04,15,04,15,04},
 {15,00,15,00,00,00,00,00,00,00,00,15},
 {04,00,04,00,00,00,00,00,00,08,00,04},
 {15,00,15,06,13,06,00,00,00,00,00,15},
 {04,00,04,00,00,13,00,04,15,04,15,04},
 {15,00,15,00,00,06,00,02,00,00,00,15},
 {04,00,04,00,00,00,00,14,00,13,00,04},
 {15,00,15,00,14,02,14,02,00,14,00,15},
 {04,00,04,00,00,00,00,00,00,13,00,04},
 {15,00,15,09,10,03,12,01,13,07,00,15},
 {04,00,00,00,00,00,00,00,00,00,00,04},
 {15,04,15,09,10,03,12,01,13,01,08,15},
}

-- draws the view
function draw_view() 
    -- draw sky
  rectfill(0,0,127,63,12)
  -- draw ground
  rectfill(0,64,127,127,5)
  
  -- init ray
  local ray={
    x=player.x,
    y=player.y,
    angle=player.h-(fov/2),
    angle_step=fov/128
  }
  
  -- used for outlining    
  local last_half_height=0
  local last_tile=0
  
  -- cast some rays
  for x=0,127 do
  
  -- tile ray hits
  local tile=0
  local distance=0
 
  -- calculate step
  local step_x = cos(ray.angle)*ray_step
  local step_y = sin(ray.angle)*ray_step 

  -- reset ray start point
  ray.x = player.x
  ray.y = player.y

  local distance=0
  -- cast a ray across the
  -- world map
  repeat
    -- march the ray
    ray.x+=step_x       
    ray.y+=step_y
    distance+=ray_step
    -- get tile at ray position
    tile=world[flr(ray.x)][flr(ray.y)]
  until(tile!=0) 
  
  -- calculate wall height 
  -- based on distance
  local half_height=((1/distance)*120)/2
  
  -- calculate top and bottom y
  -- position of wall
  local top=63-half_height
  local bot=63+half_height
  
  -- decide wheter to draw 
  -- outline or slice
  if x!=0 and tile!=last_tile then
    -- draw outline slice
    rectfill(x-1,63-last_half_height,x-1,63+last_half_height,0)
    rectfill(x,top,x,bot,0)     
  else       
    -- draw wall slice
    rectfill(x,top,x,bot,tile)
    -- outline wall slice
    pset(x,top,0)
    pset(x,bot,0)
  end
   
   -- sweep the ray
   ray.angle+=ray.angle_step
   last_tile=tile
   last_half_height=half_height
  end
end

function _init()
end

function _update()
    -- turn left
  if btn(0) then
    player.h=(player.h-one_degree)%1
  end
  
  -- turn right
  if btn(1) then
    player.h=(player.h+one_degree)%1
  end

  -- temporary player position
  -- for collision detection
  local nx =  player.x
  local ny = player.y
      
  -- move forward
  if btn(2) then
    nx+=cos(player.h)*player.speed
      ny+=sin(player.h)*player.speed        
  end
  
  -- move back
  if btn(3) then
      nx-=cos(player.h)*player.speed
      ny-=sin(player.h)*player.speed
  end
  
  -- collision check
  if world[flr(nx)][flr(ny)]==0 then
       player.x=nx
       player.y=ny
    end
end

-- draws a simple map of game
-- world and player position
function draw_map()
  -- draw world map
  for y=1,#world do
    for x=1,#world[y] do
        pset(x,y,world[x][y])
    end
  end
  
  -- draw player position
  pset(flr(player.x),flr(player.y),7)
end

function _draw()
  cls()
   draw_view()
   draw_map()
end
