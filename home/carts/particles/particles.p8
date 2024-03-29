pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--------------------------------
-- demonstration of a simple  --
-- particle system for pico-8 --
--------------------------------
-- copyright (c) 2019         --
-- alanna kelly               --
-- this file is part of       --
-- "pico-8 examples" which is --
-- released under the terms of--
-- the mit licence.           --
--------------------------------

-- global parameters --

-- set false for explosion
rainbow=true
-- max speed of a particle
-- in pixels per frame
max_speed=4.0
-- min aging rate of a particle
min_aging_rate=0.5
-- max aging rate of a particle
max_aging_rate=1.0
-- number of particles
number=2000
-- screen origin
origin={x=63,y=63}
-- table to store particles
particles={}

-- colour fadetable generated by
-- http://kometbomb.net/pico8/fadegen.html
fadetable={
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{1,1,1,1,1,1,1,0,0,0,0,0,0,0,0},
{2,2,2,2,2,2,1,1,1,0,0,0,0,0,0},
{3,3,3,3,3,3,1,1,1,0,0,0,0,0,0},
{4,4,4,2,2,2,2,2,1,1,0,0,0,0,0},
{5,5,5,5,5,1,1,1,1,1,0,0,0,0,0},
{6,6,13,13,13,13,5,5,5,5,1,1,1,0,0},
{7,6,6,6,6,13,13,13,5,5,5,1,1,0,0},
{8,8,8,8,2,2,2,2,2,2,0,0,0,0,0},
{9,9,9,4,4,4,4,4,4,5,5,0,0,0,0},
{10,10,9,9,9,4,4,4,5,5,5,5,0,0,0},
{11,11,11,3,3,3,3,3,3,3,0,0,0,0,0},
{12,12,12,12,12,3,3,1,1,1,1,1,1,0,0},
{13,13,13,5,5,5,5,1,1,1,1,1,0,0,0},
{14,14,14,13,4,4,2,2,2,2,2,1,1,0,0},
{15,15,6,13,13,13,5,5,5,5,5,1,1,0,0}
}

-- create a particle at ox, oy
function particle(ox,oy,angle,colour) 
    local speed=rnd(max_speed)
  return {
    x=ox,y=oy, -- origin
    a=angle, -- angle
      vx=speed*cos(angle), -- velocity
      vy=speed*sin(angle),
      c=colour, -- colour
      age=0, -- age - particles die at 16
      fade=min_aging_rate+rnd(max_aging_rate-min_aging_rate) -- aging rate
    } 
end

-- init particles
function _init()
    local angle=0
    local colour=1
  for i=0,number-1 do
    -- inits a particle
    if rainbow then
        particles[i]=particle(origin.x,origin.y,(0.05-rnd(.1))+angle,colour)
        if i%200 == 0 then
        angle+=0.1
        colour+=1
           -- prevent illegal index       
        if colour>15 then 
            colour=1
        end
      end
      else
        -- explosion effect
        -- random angle
        angle=rnd(1.0)
        -- use yellow fade
        particles[i]=particle(origin.x,origin.y,rnd(1.0),10)
    end
  end
end

-- update
function _update()
  -- update particles
  for i=0,number-1 do
      -- get a local reference
      -- for easier typing
    local p=particles[i]
    
    -- update position
    p.x+=p.vx
    p.y+=p.vy
    
    -- update age
    p.age+=p.fade
    
    -- check if particle is out
    -- of screen bounds or dead    
    if p.x < 0 or 
        p.x > 127 or 
        p.y < 0 or
        p.y > 127 or
        p.age > 15 then
        -- respawn particle
        -- need to update the 
        -- table.
        if rainbow then
          particles[i]=particle(origin.x,origin.y,p.a,p.c)
        else
          particles[i]=particle(origin.x,origin.y,rnd(1,0),10)
        end
      end
  end  
end

-- draws the particles
function _draw()
  cls()
  for i=0,number-1 do
    local p=particles[i]
    local colour=fadetable[p.c][flr(p.age)]
    pset(p.x,p.y,colour)
  end
end    
